Ubuntu에서 Docker 설치 및 기초 실습
1. Docker 설치
1.1 시스템 업데이트
bashsudo apt update
sudo apt upgrade -y
1.2 필수 패키지 설치
bashsudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
1.3 Docker GPG 키 추가
bashcurl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
1.4 Docker 저장소 추가
bashecho "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
1.5 Docker 설치
bashsudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
2. Docker 설정
2.1 Docker 서비스 시작
bash# Docker 서비스 시작
sudo systemctl start docker

# 부팅 시 자동 시작 설정
sudo systemctl enable docker

# 상태 확인
sudo systemctl status docker
2.2 사용자 권한 설정
bash# 현재 사용자를 docker 그룹에 추가
sudo usermod -aG docker $USER

# 그룹 변경사항 적용
newgrp docker

# 또는 로그아웃 후 재로그인
2.3 설치 확인
bash# Docker 버전 확인
docker --version

# Docker 시스템 정보
docker info

# 첫 번째 테스트
docker run hello-world