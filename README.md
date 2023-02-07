# Jennifer container 샘플 프로젝트
- - -

Jennifer Server 와 Agent 를 컨테이너 환경에서 띄울 경우에 대한 샘플 프로젝트

# Prerequirement

> Jennifer Server 파일의 크기가 커서 github 에 올리지 않고 링크로 대체함

[https://jennifer5-release-public.s3.ap-northeast-2.amazonaws.com/server/jennifer-server-5.6.1.8.zip](https://jennifer5-release-public.s3.ap-northeast-2.amazonaws.com/server/jennifer-server-5.6.1.8.zip)

다운받은 Jennifer Server 파일은 Docker 이미지를 만들기 위해 `./server` 디렉토리로 옮겨준다
```sh
$ mv ./jennifer-server-5.6.1.8.zip ./server/jennifer-server-5.6.1.8.zip
```


# 설명
- - -
Aagent 는 두 서버에서 Agent 파일을 다운받는 Cloud 배포 방식과 이미지 내에 삽입하는 Embedded 방식을 제공한다

## 실행

실행 방식으로 `docker-compose` 를 예제로 보여주고 있지만 따로 구동한다면 `docker` 명령어로도 실행 가능하다.  
`docker` 로 실행 할 경우 `docker-compose.yml` 파일을 참고하여 옵션을 설정하여야 한다.

로컬에서 사용하는 경우 두가지 고려사항이 있다.
1. Jennifer Server 에서 사용하는 Port 가 사용 가능한지 확인해야한다. 만일 이미 점유되어 있는 경우 다른포트로 변경하고, 에이전트에서 서버 포트를 맞게 바꾸어 주어야 한다.
  - 예제에서는 7900, 5000, 18080, 28080 포트를 사용하고 있다
1. 라이센스는 루프백 주소 (127.0.0.1 또는 localhost) 를 사용할 수 없기 때문에 라이센스를 현재 IP 에 맞게 가지고 있어야 한다.  
  - 발급받은 라이센스 파일을 `./server/license` 위치에 넣어준다.


```sh
# 컨테이너 이미지 빌드
$ docker-compose build

# 컨테이너 실행
$ docker-compose up -d
```

