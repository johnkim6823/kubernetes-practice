# Docker 02-container 실습

## 학습 목표
- Dockerfile을 사용하여 커스텀 이미지를 빌드하는 방법 습득
- 컨테이너 실행 시 환경 변수와 볼륨을 적용
- 컨테이너 로그를 확인하고 정리

## 실습 1: Dockerfile 작성
다음 내용을 가진 `Dockerfile`을 새 디렉터리에 작성합니다.

```Dockerfile
# myapp/Dockerfile
FROM alpine:3.18
CMD ["echo", "Hello from my custom container"]
```

## 실습 2: 이미지 빌드
```bash
# Dockerfile이 있는 디렉터리에서
docker build -t myapp:1.0 .

# 빌드된 이미지 확인
docker images | grep myapp
```

## 실습 3: 컨테이너 실행
```bash
docker run --name myapp-test myapp:1.0
```

## 실습 4: 환경 변수와 볼륨 사용
```bash
mkdir data
 echo "sample" > data/sample.txt

# 환경 변수 전달과 호스트 볼륨 마운트
 docker run --rm -e GREETING=Hi -v $(pwd)/data:/data alpine \
  sh -c 'echo $GREETING && ls /data'
```

## 실습 5: 로그 확인
```bash
docker logs myapp-test
```

## 실습 6: 정리
```bash
docker rm myapp-test
docker rmi myapp:1.0
```

다음 단계에서는 더 다양한 Docker 기능과 Kubernetes 실습이 추가될 예정입니다.

