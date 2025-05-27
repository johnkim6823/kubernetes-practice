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
