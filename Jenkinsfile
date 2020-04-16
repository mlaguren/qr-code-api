pipeline {
    agent any

    stages {
        stage('Run Test Suite') {
            steps {
                sh 'bundle install --path vendor/bundle'
                sh 'bundle exec rspec --tag ~@integration -r rspec_junit_formatter --format RspecJunitFormatter -o tests.xml'
            }
            post {
                always {
                    junit 'tests.xml'
                    }
                }
                success {
                    publishHTML target: [
                        allowMissing: false,
                        alwaysLinkToLastBuild: false
                        keepAll: true,
                        reportDir: 'coverage'
                        reportFiles: 'index.html'
                        reportName: 'Simple Coverage Report'
                        ]
                }
            }
        }
    }