# java-web-app - sonarqube

**Description** Jenkins - SonarQube Integration: Build App. Generate Report.

# Prerequisities & Tools

- Maven/Java App with Unit Tests
- AWS EC2 Instance - in this case CentOS 8 instance that serves as a host machine for SQ, Jenkins, Docker..
- Jenkins - CI
- SonarQube - Static code analysis
- JaCoCo Plugin - Java code coverage library
- Docker - Run Jenkins and SQ in Docker containers

# How to integrate SQ with Jenkins?

### Steps

1. Install `SonarQube Scanner Plugin`
2. Generate Token in SonarQube Server
- Create user `jenkins` `Administration/Security/Users`
- Generate Token for `jenkins` user - this token will be used as a Jenkins credential
3. Configure SQ in Jenkins
- `Manage Jenkins/Configure System` -> `SonarQube Servers/Add Server URL` -> Add Jenkins `credential` (Server auth token_
4. Configure SonarQube Scanner
- `Manage Jenkins/Global configuration Tools` -> `SonarQube Scanner/Install from Maven central`


# Project Build with Maven

### Configuring Plug-ins & Dependencies

- Using `JaCoCo` Plugin for code coverage analysis in Java, allows basic report creation.

```
<plugin>
   <groupId>org.jacoco</groupId>
   <artifactId>jacoco-maven-plugin</artifactId>
   <version>0.8.7</version>
   <executions>
      <execution>
          <goals>
              <goal>prepare-agent</goal>
          </goals>
      </execution>
      <execution>
          <id>report</id>
          <phase>prepare-package</phase>
          <goals>
               <goal>report</goal>
          </goals>
       </execution>
   </executions>
</plugin>
```
In this case, The JaCoCo Maven plug-in defines the following goals:
1. prepare-agent - initialization phase, to add JaCoCo agent during build
2. report - generate code coverage report

### Issues & How to fix?

1. Report not generated due to `maven surefire plugin` & `jacoco` conflict.

**Explained:**  The prepare-agent goal will add the jacoco agent during build, but will not cause the actual report to be generated after the tests. As a result, the coverage will always be reported as zero.

**Reference:**
- https://www.eclemma.org/jacoco/trunk/doc/prepare-agent-mojo.html
- https://maven.apache.org/surefire/maven-surefire-plugin/faq.html#late-property-evaluation

**Solution:**
`pom.xml`

 ```
 <properties>
    <surefireArgLine> </surefireArgLine>
</properties>
 ```
...
 ```
 <plugin>
    <artifactId>maven-surefire-plugin</artifactId>
    <version>3.0.0-M5</version>
    <configuration>
        <argLine>${surefireArgLine}</argLine>
    </configuration>
 </plugin>
 ```
2. Error `"Skipping JaCoCo execution due to missing classes directory" while generating report`

**Explained** Not generating `classes` directory in `target` directory during build. The only class in the project is the unit test class. `test-classes` directory is generated. Nothing to compile.

**Solution**  Copy resources. Bad approach?? Probably
 ```
<plugin>
   <artifactId>maven-resources-plugin</artifactId>
   <version>3.2.0</version>
   <executions>
      <execution>
        <id>copy-resources</id>
        <phase>pre-integration-test</phase>
        <goals>
            <goal>copy-resources</goal>
        </goals>
        <configuration>
            <outputDirectory>${basedir}/target/classes</outputDirectory>
            <resources>
               <resource>
                  <directory>${basedir}/target/test-classes</directory>
                  <filtering>false</filtering>
               </resource>
             </resources>
          </configuration>
       </execution>
   </executions>
</plugin>
```
