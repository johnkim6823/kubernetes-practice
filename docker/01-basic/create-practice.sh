#!/bin/bash

# Docker 01-basic 실습 파일 생성 스크립트

echo "Docker 01-basic 실습 파일을 생성합니다..."

# docker/01-basic 폴더로 이동
cd docker/01-basic

# 메인 README.md 작성
cat > README.md << 'EOF'
# Docker 01-basic 실습

## 학습 목표
- Docker 기본 개념 이해
- 이미지와 컨테이너의 차이점 파악
- 기본 Docker 명령어 실습

## 사전 준비

### Docker 설치 확인
```bash
docker --version
docker info
```

### 권한 설정 (필요시)
```bash
sudo usermod -aG docker $USER
# 로그아웃 후 재로그인 필요
```

## 실습 순서

1. **hello-world/**: Docker 설치 확인 및 첫 컨테이너 실행
2. **simple-app/**: 간단한 웹 서버 실행 및 관리
3. **exercises/**: 직접 해볼 연습문제

각 폴더의 README.md를 순서대로 따라하세요!

## 주요 개념

### 이미지 vs 컨테이너
- **이미지**: 애플리케이션 실행에 필요한 파일들을 패키지한 템플릿 (클래스)
- **컨테이너**: 이미지를 실행한 인스턴스 (객체)

### 중요한 Docker 명령어
```bash
docker run      # 컨테이너 실행
docker ps       # 실행 중인 컨테이너 목록
docker images   # 이미지 목록
docker stop     # 컨테이너 중지
docker rm       # 컨테이너 삭제
docker rmi      # 이미지 삭제
```

## 시작하기
```bash
cd hello-world
cat README.md
```
EOF

# hello-world 폴더 실습 생성
mkdir -p hello-world
cat > hello-world/README.md << 'EOF'
# Hello World 실습

Docker가 제대로 설치되고 작동하는지 확인하는 첫 번째 실습입니다.

## 실습 1: Hello World 실행

```bash
# Docker 첫 실행 - Hello World
docker run hello-world
```

**예상 출력:**
```
Hello from Docker!
This message shows that your installation appears to be working correctly.
...
```

## 실습 2: 실행 결과 확인

```bash
# 모든 컨테이너 확인 (중지된 것 포함)
docker ps -a

# 다운로드된 이미지 확인  
docker images
```

## 실습 3: 정리

```bash
# hello-world 컨테이너 삭제
docker rm $(docker ps -aq --filter ancestor=hello-world)

# hello-world 이미지 삭제
docker rmi hello-world
```

## 다음 단계
```bash
cd ../simple-app
```
EOF

# simple-app 폴더 실습 생성
mkdir -p simple-app
cat > simple-app/README.md << 'EOF'
# 간단한 웹 애플리케이션 실습

실제 웹 서버를 Docker로 실행하고 관리하는 방법을 배웁니다.

## 실습 1: Nginx 웹 서버 실행

```bash
# Nginx 웹 서버를 백그라운드로 실행
docker run -d -p 8080:80 --name my-nginx nginx

# 웹 브라우저에서 http://localhost:8080 접속하거나
curl http://localhost:8080
```

**참고:** `-d`는 백그라운드 실행, `-p 8080:80`은 호스트의 8080포트를 컨테이너의 80포트에 연결

## 실습 2: 컨테이너 상태 확인

```bash
# 실행 중인 컨테이너 확인
docker ps

# 컨테이너 세부 정보 확인
docker inspect my-nginx

# 컨테이너 로그 확인
docker logs my-nginx

# 실시간 로그 확인 (Ctrl+C로 종료)
docker logs -f my-nginx
```

## 실습 3: 컨테이너 내부 접속

```bash
# 실행 중인 컨테이너에 접속
docker exec -it my-nginx /bin/bash

# 컨테이너 내부에서 실행
ls /usr/share/nginx/html/
cat /usr/share/nginx/html/index.html
exit
```

## 실습 4: 컨테이너 관리

```bash
# 컨테이너 중지
docker stop my-nginx

# 컨테이너 시작
docker start my-nginx

# 컨테이너 재시작
docker restart my-nginx

# 컨테이너 상태 확인
docker ps
```

## 실습 5: 여러 컨테이너 실행

```bash
# Apache 웹 서버도 실행 (다른 포트로)
docker run -d -p 9090:80 --name my-apache httpd

# 두 웹 서버 모두 접속 확인
curl http://localhost:8080  # Nginx
curl http://localhost:9090  # Apache

# 실행 중인 컨테이너 확인
docker ps
```

## 실습 6: 정리

```bash
# 모든 컨테이너 중지
docker stop my-nginx my-apache

# 컨테이너 삭제
docker rm my-nginx my-apache

# 또는 강제 삭제 (중지 + 삭제)
docker rm -f my-nginx my-apache

# 사용하지 않는 이미지 정리
docker image prune
```

## 다음 단계
```bash
cd ../exercises
```
EOF

# exercises 폴더 생성
mkdir -p exercises
cat > exercises/README.md << 'EOF'
# Docker 기초 연습문제

직접 해보면서 Docker 명령어를 익혀보세요!

## 문제 1: Python 컨테이너 실행
Python 3.9 이미지를 사용해서 인터랙티브 모드로 컨테이너를 실행하고, 파이썬 버전을 확인하세요.

```bash
# 힌트: docker run -it python:3.9
# 컨테이너 내부에서: python --version
```

## 문제 2: 백그라운드 웹 서버
- Redis 서버를 백그라운드로 실행하세요 (포트 6379)
- 컨테이너 이름을 'my-redis'로 지정하세요
- 실행 중인지 확인하고 로그를 확인하세요

```bash
# 힌트: docker run -d -p 6379:6379 --name my-redis redis
```

## 문제 3: 컨테이너 정보 수집
현재 실행 중인 모든 컨테이너의 다음 정보를 확인하세요:
- 컨테이너 ID
- 이미지 이름
- 실행 명령어
- 포트 매핑

```bash
# 힌트: docker ps, docker inspect 활용
```

## 문제 4: 일괄 정리
- 실행 중인 모든 컨테이너를 중지하세요
- 모든 컨테이너를 삭제하세요
- 사용하지 않는 이미지를 정리하세요

```bash
# 힌트: 
# docker stop $(docker ps -q)
# docker rm $(docker ps -aq)
# docker image prune
```

## 문제 5: 조건부 컨테이너 찾기
nginx 이미지로 실행된 컨테이너만 찾아서 삭제하세요.

```bash
# 힌트: docker ps -q --filter ancestor=nginx
```

## 해답 확인
답을 확인하려면:
```bash
cd ../solutions
```
EOF

# solutions 폴더 생성
mkdir -p solutions
cat > solutions/README.md << 'EOF'
# 연습문제 해답

## 문제 1 해답: Python 컨테이너 실행
```bash
# Python 3.9 컨테이너 실행
docker run -it python:3.9

# 컨테이너 내부에서
python --version
exit
```

## 문제 2 해답: 백그라운드 웹 서버
```bash
# Redis 서버 실행
docker run -d -p 6379:6379 --name my-redis redis

# 실행 확인
docker ps

# 로그 확인
docker logs my-redis
```

## 문제 3 해답: 컨테이너 정보 수집
```bash
# 기본 정보
docker ps

# 상세 정보 (JSON 형태)
docker inspect my-redis

# 특정 정보만 추출
docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.Ports}}"
```

## 문제 4 해답: 일괄 정리
```bash
# 모든 컨테이너 중지
docker stop $(docker ps -q)

# 모든 컨테이너 삭제
docker rm $(docker ps -aq)

# 사용하지 않는 이미지 정리
docker image prune

# 또는 모든 미사용 리소스 정리
docker system prune
```

## 문제 5 해답: 조건부 컨테이너 찾기
```bash
# nginx 컨테이너만 찾기
docker ps -q --filter ancestor=nginx

# nginx 컨테이너만 중지
docker stop $(docker ps -q --filter ancestor=nginx)

# nginx 컨테이너만 삭제
docker rm $(docker ps -aq --filter ancestor=nginx)
```

## 유용한 추가 명령어
```bash
# 컨테이너 리소스 사용량 확인
docker stats

# 모든 Docker 리소스 정리 (주의!)
docker system prune -a

# 특정 시간 이후 생성된 컨테이너만 삭제
docker container prune --filter "until=24h"
```
EOF

# 실습 진행 스크립트 생성
cat > run-basic-practice.sh << 'EOF'
#!/bin/bash

echo "🐳 Docker 01-basic 실습을 시작합니다!"
echo ""
echo "실습 순서:"
echo "1. hello-world/ - Docker 첫 실행"
echo "2. simple-app/ - 웹 서버 실행과 관리"  
echo "3. exercises/ - 연습문제"
echo "4. solutions/ - 해답 확인"
echo ""
echo "각 폴더의 README.md를 순서대로 따라하세요!"
echo ""
echo "시작하려면:"
echo "cd hello-world && cat README.md"
EOF

chmod +x run-basic-practice.sh

echo "✅ Docker 01-basic 실습 파일 생성 완료!"
echo ""
echo "📚 생성된 파일들:"
echo "├── README.md (전체 실습 가이드)"
echo "├── hello-world/ (첫 번째 실습)"
echo "├── simple-app/ (웹 서버 실습)"
echo "├── exercises/ (연습문제)"
echo "├── solutions/ (해답)"
echo "└── run-basic-practice.sh (실습 시작 스크립트)"
echo ""
echo "🚀 실습 시작:"
echo "cd hello-world"
echo "cat README.md"