#!/bin/bash
echo "パスワードマネージャへようこそ！"

while true; do
read -p "次の選択肢から入力してください(Add Password/Get Password/Exit):" input

case "$input" in
 "Add Password")
  read -p "サービス名入力してください:" service
  read -p "ユーザー名入力してください:" user
  read -p "パスワード名入力してください:" password
 
  output="data.txt"

  echo "$service:$user:$password" >> data.txt
  echo "パスワードの追加は成功しました。"
  ;;
 "Get Password")
  read -p "サービス名入力してください:" service_to_get
  sup=$(grep "^$service_to_get" data.txt)
  if [ -n "$sup" ]; then
  IFS=":" read -r ser use pas <<< "$sup"
  echo "サービス名: $ser"
  echo "ユーザー名: $use"
  echo "パスワード: $pas" 
  else
  echo "そのサービスは登録されていません。"
  fi 
  ;;
 "Exit") 
  echo "Thank you!"
  break
  ;;
  *)
  echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
  ;;
esac
done
