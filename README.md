# coreframe5.5 wts edition

JDK - 1.5 이상 설정 (1.8 이상 17 이하 권장)
tomcat (사용시) - tomcat 8 이상 tomcat 9 이하

## intelij 설정 방법 (2023.12.11 - 내용 추가 예정)

## File - Project Structure
### 1.Project
SDK 설정 - JAVA 1.5 이상 설정 (1.8 이상 17 이하 권장)

### 2.Modules
프로젝트 root 폴더 제외 모두 삭제

프로젝트 root 폴더에 Web 모듈 추가

#### 추가한 Web 모듈 Deployment Descriptors 수정
Path: <project 경로>/src/main/webapp/WEB-INF/web.xml

#### 추가한 Web 모듈 Web Resource Directories 수정
Web Resource Directory: <projcet 경로>/src/main/webapp

Path Relative to Deployment Root: /

### 3.Artifacts
추가 -> Web Application:exploded -> From Modules
(선택시 Modules에 추가한 다음과 같은 Module이 추가 됨. <root>:war exploded )

<아래 내용 추가 예정>
classes 경로 설정
tomcat 설정 (encoding 포함)
