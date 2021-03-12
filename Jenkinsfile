pipeline {
    agent {
      label 'slave'
    }

    tools {
        maven "mvn3"
    }

    stages {
        stage('Git') {
            steps {
                git branch: 'master', credentialsId: 'GitHubToken', url: 'https://github.com/paweltatarczak/multibranch'
            }
        }
        
        stage('When') {
            steps {
                sh "echo 'Plik Jenkinsfile z branch: seleniumgrid'"
                sh "echo 'Dodatkowy wpis'"
		sh "echo 'Jeszcze jeden wpis dla triggera'"
            }
            when {
                branch 'seleniumgrid'
            }
        }
        
        stage('Build') {
            steps {
                // Run Maven on a Unix agent.
                sh "mvn clean install"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
                }
            }
        }
    }
}
