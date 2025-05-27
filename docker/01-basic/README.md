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
