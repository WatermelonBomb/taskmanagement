```markdown
# SimpleToDo

## 🚀 概要
SimpleToDo は、Ruby on Rails（Propshaft／Tailwind CSS）でつくるシンプルな ToDo リストアプリケーションです。  
日々のタスクを「登録 ⇔ 編集 ⇔ 完了 ⇔ 削除」でき、締切日でソートした一覧表示やバリデーション機能を備えています。

---

## 🛠️ 動作環境・前提条件
- Ruby **3.2.x**
- Rails **7.0.x**
- Node.js **>=14**
- Yarn または npm
- PostgreSQL（デフォルト設定）
- Docker／docker-compose（任意）
- Bundler, cssbundling‑rails, tailwindcss‑rails  

---

## ⚙️ セットアップ手順

### 1. リポジトリをクローン
```bash
git clone https://github.com/<your-org>/simple_todo.git
cd simple_todo
```

### 2. Ruby・Gem のインストール
```bash
# Bundler をインストール（未導入の場合）
gem install bundler

# Gem をインストール
bundle install
```

### 3. Node.js パッケージのインストール
```bash
# Yarn を使う場合
yarn install

# npm を使う場合
npm install
```

### 4. データベースの作成・マイグレーション
```bash
rails db:create
rails db:migrate
```

### 5. Tailwind CSS のビルド
```bash
# 初回ビルド
rails tailwindcss:build

# 開発中はウォッチモード
./bin/dev
# → Foreman で
#   • rails server
#   • yarn build:css --watch
# を同時に起動します
```

---

## ▶️ 開発サーバー起動
```bash
# 上記 ./bin/dev を実行中なら自動的にサーバーとCSSウォッチャーが動きます
# 単独で Rails サーバーを動かす場合
rails server -b 0.0.0.0 -p 3000
```
ブラウザで `http://localhost:3000` を開いて動作を確認してください。

---

## ✅ テスト
RSpec＋Capybara でモデル／機能テストが書かれています。
```bash
# データベースをテスト環境にセットアップ
rails db:test:prepare

# 全テスト実行
bundle exec rspec
```

---

## 🚩 デプロイ例

### Heroku
```bash
heroku create simple-todo-app
git push heroku main
heroku run rails db:migrate
```

### AWS Elastic Beanstalk
1. `eb init` でアプリを初期化  
2. `eb create` → `eb deploy`  
3. `eb run rails db:migrate`

---

## 📝 主な機能一覧
- **タスク作成（F01）**  
  タイトル／締切日（必須）＋メモ（任意）で登録  
- **タスク一覧（F02）**  
  未完了／完了フィルタ ＋ 締切日ソート  
- **タスク編集（F03）**  
- **タスク削除（F04）**  
- **完了フラグ更新（F05）**  
- **バリデーション（F06）**  
  - タイトル必須  
  - 締切日は本日以降  
  - タイトル文字数上限 50 文字  
  - エラー時にフォーム上へ赤文字で表示  

---

## 💾 データベース設計
```ruby
create_table :tasks do |t|
  t.string     :title,     null: false, limit: 50
  t.text       :memo
  t.date       :due_date,  null: false
  t.boolean    :completed, null: false, default: false
  t.references :user,      null: false, foreign_key: true
  t.timestamps
end
```

---

## 📂 ディレクトリ構成例
```
app/
 ├─ assets/
 │   └─ stylesheets/
 │       ├ tailwind.css    # Tailwind のエントリポイント
 │       └ inter-font.css  # フォント定義ファイル
 ├─ controllers/
 ├─ models/
 ├─ views/
 └─ ...
bin/
 └─ dev                  # Foreman 起動用スクリプト
config/
 ├─ database.yml
 ├─ routes.rb
 └─ ...
```

---

## 📄 ライセンス
MIT License  
詳細は [LICENSE](./LICENSE) をご覧ください。
```