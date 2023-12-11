# coreframe5.5 wts edition

JDK - 1.5 이상 설정 (1.8 이상 17 이하 권장)

tomcat (사용시) - tomcat 8 이상 tomcat 9 이하

## intelij 설정 방법 (2023.12.11 - 내용 추가 예정)

## File - Project Structure
### 1. Project
SDK 설정 - JAVA 1.5 이상 설정 (1.8 이상 17 이하 권장)

### 2. Modules
#### 2-1. Module 설정
프로젝트 root 폴더 제외 모두 삭제

프로젝트 root 폴더에 Web 모듈 추가

#### root 폴더 클릭 후 우측 Paths 설정
Compiler Output -> Use module complie output path

Output Path: <project 경로>/src/main/webapp/WEB-INF/classes

#### root 폴더 클릭 후 우측 Dependencies 설정
추가 -> Jars or Directories -> <project 경로>/src/main/webapp/WEB-INF/lib 추가

추가 -> Library -> tomcat 추가 (사용하는 버전 - tomcat 8 이상 tomcat 9 이하)


#### 추가한 Web 모듈 Deployment Descriptors 수정
Path: <project 경로>/src/main/webapp/WEB-INF/web.xml

#### 추가한 Web 모듈 Web Resource Directories 수정
Web Resource Directory: <projcet 경로>/src/main/webapp

Path Relative to Deployment Root: /

### 3. Artifacts
추가 -> Web Application:exploded -> From Modules
(선택시 Modules에 추가한 다음과 같은 Module이 추가 됨. <root>:war exploded )


## RUN - Edit Configuration 

### 1. tomcat
추가 -> tomcat server / local

#### 추가한 tomcat 설정 (추가 후 우측에 tomcat 설정)

#### 1.1 Server
Open brower -> URL -> http://localhost:<설정 포트> 또는 http://127.0.0.1:<설정 포트>

* 주의: 아래에서 포트 설정시 URL의 포트 부분은 자동 변경 됨

VM options 아래 내용 추가

-Dfile.encoding=UTF-8

#### 1.2 Deployment
추가 -> Artifact (자동으로 위에서 추가한 artifact 추가됨.) 또는 External Source -> <projcet 경로>/src/main/webapp 추가

Application context: /
