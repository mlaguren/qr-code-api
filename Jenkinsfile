pipeline {
    agent any

    stages {
        stage('Run Test Suite') {
            steps {
                sh 'bundle install --path vendor/bundle'
                sh 'bundle exec rspec -r rspec_junit_formatter --format RspecJunitFormatter -o tests.xml'

                publishHTML target: [
                            allowMissing: false,
                            alwaysLinkToLastBuild: false,
                            keepAll: true,
                            reportDir: 'coverage',
                            reportFiles: 'index.html',
                            reportName: 'Coverage'
                          ]
            }
            post {
                always {
                    junit 'tests.xml'
                    }
                }
            }
        }
    }