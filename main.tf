provider "aws" {
    access_key = file("key/syncer00002_iam_accesskey.txt")
    secret_key = file("key/syncer00002_iam_secretkey.txt")
    region = "ap-northeast-2"
}
