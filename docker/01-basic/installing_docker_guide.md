# Docker 설치 가이드 (Ubuntu)

이 문서는 Ubuntu 환경에서 Docker를 설치하고 간단한 테스트를 수행하는 방법을 설명합니다.

## 1. 시스템 업데이트
```bash
sudo apt update
sudo apt upgrade -y
```

## 2. 필수 패키지 설치
```bash
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
```

## 3. Docker GPG 키 추가
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

## 4. Docker 저장소 등록
```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

## 5. Docker 패키지 설치
```bash
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

## 6. Docker 서비스 시작 및 부팅 시 자동 실행 설정
```bash
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
```

## 7. 현재 사용자 권한 설정
```bash
sudo usermod -aG docker $USER
newgrp docker
```

## 8. 설치 확인
```bash
docker run hello-world
```
