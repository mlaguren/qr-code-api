pipeline {
    agent any

    stages {
        stage('Run Test Suite') {
            steps {
                sh 'bundle install --path vendor/bundle'
                sh 'bundle exec rspec -r rspec_junit_formatter --format RspecJunitFormatter -o tests.xml'
            }
            post {
                always {
                    junit 'tests.xml'
                    }
                }
            }
        }
    }