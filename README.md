# jmeter-terraform
[參考](https://blog.csdn.net/zbj18314469395/article/details/104567655)的實作，試著用 terrafrom 架起來

## 注意事項
使用之前，先去改兩個地方的參數：
`security_group/main.tf` 所有的 `vpc_id`，改為自己的 aws default vpc id
`ec2/main.tf` 所有 `aws_instance` 的 `key_name`，改為自己所有的 key

## 使用方式
先裝好 terraform 雨 aws_cli
aws_cli 需 config 好自己的帳號
接著再 terraform init 後 terraform apply

## 目前問題
master 是死的
