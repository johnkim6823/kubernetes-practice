# Hello World - Docker 설치 및 첫 실습

Docker를 처음 설치하고 첫 번째 컨테이너를 실행해보는 실습입니다.

## 1. Docker 설치 (Ubuntu)

### 1.1 시스템 업데이트
```bash
sudo apt update
sudo apt upgrade -y
```

### 1.2 필수 패키지 설치
```bash
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
```

### 1.3 Docker GPG 키 추가
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

### 1.4 Docker 저장소 추가
```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### 1.5 Docker 설치
```bash
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
```

## 2. Docker 시작 및 설정

### 2.1 Docker 서비스 시작
```bash
# Docker 데몬 시작
sudo systemctl start docker

# 부팅 시 자동 시작 설정
sudo systemctl enable docker

# 상태 확인
sudo systemctl status docker
```
녹색으로 "active (running)" 이 보이면 정상입니다.

### 2.2 사용자 권한 설정
```bash
# 현재 사용자를 docker 그룹에 추가
sudo usermod -aG docker $USER

# 그룹 변경사항 적용 (터미널 재시작 대신)
newgrp docker
```

### 2.3 설치 확인
```bash
# Docker 버전 확인
docker --version

# Docker 시스템 정보 (선택사항)
docker info
```

## 3. 첫 번째 컨테이너 실행

### 3.1 Hello World 실행
```bash
docker run hello-world
```

**예상 출력:**
```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
...
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.
```

축하합니다! 🎉 Docker가 성공적으로 설치되고 첫 번째 컨테이너가 실행되었습니다.

### 3.2 무슨 일이 일어났는지 이해하기

Docker가 다음 단계를 수행했습니다:
1. **이미지 검색**: 로컬에 `hello-world` 이미지가 없음을 확인
2. **이미지 다운로드**: Docker Hub에서 이미지를 다운로드
3. **컨테이너 생성**: 이미지로부터 컨테이너를 생성
4. **프로그램 실행**: 컨테이너 내부에서 프로그램 실행
5. **출력 표시**: 결과를 터미널에 출력
6. **컨테이너 종료**: 프로그램이 끝나면 컨테이너 종료

## 4. 실행 결과 확인

### 4.1 컨테이너 확인
```bash
# 현재 실행 중인 컨테이너 (비어있어야 정상)
docker ps

# 모든 컨테이너 확인 (중지된 것 포함)
docker ps -a
```

hello-world 컨테이너가 "Exited" 상태로 보일 것입니다.

### 4.2 이미지 확인
```bash
# 다운로드된 이미지 목록
docker images
```

`hello-world` 이미지가 목록에 보일 것입니다.

## 5. 기본 개념 이해

### 이미지 vs 컨테이너
- **이미지**: 프로그램과 필요한 파일들을 패키지한 템플릿 (클래스)
- **컨테이너**: 이미지를 실행한 인스턴스 (객체)

### Docker 프로세스
```
Docker Hub → 이미지 다운로드 → 컨테이너 생성 → 프로그램 실행 → 결과 출력
```

## 6. 정리 및 실습

### 6.1 다시 실행해보기
```bash
# hello-world를 다시 실행
docker run hello-world
```

이번에는 이미지를 다운로드하지 않고 바로 실행됩니다!

### 6.2 다른 방법으로 실행
```bash
# 컨테이너에 이름 지정
docker run --name my-hello hello-world

# 실행 후 자동 삭제
docker run --rm hello-world
```

### 6.3 정리하기
```bash
# hello-world 컨테이너들 삭제
docker rm $(docker ps -aq --filter ancestor=hello-world)

# hello-world 이미지 삭제 (선택사항)
docker rmi hello-world
```

## 7. 문제 해결

### Docker 명령어가 인식되지 않는 경우
```bash
# Docker가 설치되었는지 확인
which docker

# 설치되지 않았다면 위의 설치 과정 반복
```

### 권한 에러가 발생하는 경우
```bash
# 에러: permission denied while trying to connect to the Docker daemon socket

# 해결 방법
sudo usermod -aG docker $USER
newgrp docker

# 또는 임시로 sudo 사용
sudo docker run hello-world
```

### Docker 데몬이 실행되지 않는 경우
```bash
# 에러: Cannot connect to the Docker daemon

# Docker 서비스 상태 확인
sudo systemctl status docker

# Docker 서비스 시작
sudo systemctl start docker
```

## 8. 다음 단계

Hello World가 성공적으로 실행되었다면:

```bash
# 다음 실습으로 이동
cd ../simple-app
cat README.md
```

축하합니다! Docker의 첫 걸음을 성공적으로 완료했습니다! 🐳

---

**핵심 포인트:**
- Docker는 이미지를 실행해서 컨테이너를 만듭니다
- 이미지는 한 번 다운로드되면 재사용됩니다
- 컨테이너는 프로그램이 끝나면 종료됩니다
- `docker ps -a`로 모든 컨테이너를 확인할 수 있습니다