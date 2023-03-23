# gitlab-runner 설치
sudo curl -L --output /usr/local/bin/gitlab-runner "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64"
sudo curl --location --output /usr/local/bin/release-cli "https://release-cli-downloads.s3.amazonaws.com/latest/release-cli-linux-amd64"

echo "----------download complete---------"

# 실행권한부여
sudo chmod +x /usr/local/bin/gitlab-runner
sudo chmod +x /usr/local/bin/release-cli

echo "----------add execute permission---------"

# 사용자계정 추가  --comment : 로그인에 대한 설명, --create-home : 
# 사용자 홈디렉토리설정, --shell : 지정할 쉘 계정명(기본값은 /bin/bash)
sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
echo "----------add user complete---------"


# gitlab-runner 계정으로 설치  --user : 사용자계정, --working-
# directory : 작업폴더
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner

echo "----------install complete---------"

sudo service gitlab-runner start
sudo service gitlab-runnser status