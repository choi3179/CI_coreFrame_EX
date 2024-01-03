FROM tomcat:9.0.83

# 톰캣에 사용자 애플리케이션을 추가합니다.
COPY apache-tomcat-9.0.83/ /usr/local/tomcat/

# 톰캣 실행을 위한 명령어
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]