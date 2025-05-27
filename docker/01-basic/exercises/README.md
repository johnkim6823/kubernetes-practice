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
