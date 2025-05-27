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
