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
