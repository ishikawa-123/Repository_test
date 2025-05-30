echo "パスワードマネージャ"
read -p "サービス名入力してください:" service
read -p "ユーザー名入力してください:" user
read -p "パスワード名入力してください:" password

output="data.txt"

echo "$service:$user:$password" > "data.txt"

echo "Thank you!"
