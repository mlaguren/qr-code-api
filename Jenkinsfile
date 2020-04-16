pipeline {
    agent any

    stages {
        stage('Run Test Suite') {
            steps {
                sh 'bundle install --path vendor/bundle'
                sh 'bundle exec rspec -r rspec_junit_formatter --format RspecJunitFormatter -o tests.xml'
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'coverage', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: 'Simple Test Coverage'])
            }
            post {
                always {
                    junit 'tests.xml'
                    }
                }
            }
        }
    }