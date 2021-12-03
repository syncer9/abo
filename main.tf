provider "aws" {
    access_key = file("key/syncer00001_accesskey.txt")
    secret_key = file("key/syncer00001_secretkey.txt")
    region = "ap-northeast-2"
}
