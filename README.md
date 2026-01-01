# 🗺️ みんなの地図 - 完成版

## ✅ 完成しました!

このアプリは**Supabase**と連携した、リアルタイム共有地図アプリです。

---

## 📁 ファイル構成

```
map-sharing/
├── index.html    (メイン画面: キー作成・参加)
└── map.html      (地図編集画面)
```

---

## 🚀 公開方法(3つの選択肢)

### **方法1: Netlify Drop (最も簡単・推奨)**

1. 下のリンクからファイルをダウンロード
2. https://app.netlify.com/drop にアクセス
3. `map-sharing` フォルダをドラッグ&ドロップ
4. 即座に公開URL取得!

**公開URL例:** `https://random-name-xxxxx.netlify.app`

---

### **方法2: GitHub Pages**

1. GitHubで新規リポジトリ作成 (public)
2. ファイルをアップロード
3. Settings → Pages → Source: main
4. 公開URL取得

**公開URL例:** `https://username.github.io/map-sharing/`

---

### **方法3: 他の無料ホスティング**

- **Vercel**: https://vercel.com/
- **Firebase Hosting**: https://firebase.google.com/
- **Cloudflare Pages**: https://pages.cloudflare.com/

---

## 🎯 使い方

### **地図を作成する人:**
1. 「✨ 新しく作る」をクリック
2. 6桁のキーが表示される (例: 123456)
3. このキーをクラスメイトに共有
4. 「地図を開く」で編集開始

### **参加する人:**
1. 「🚪 参加する」をクリック
2. 教えてもらったキーを入力 (例: 123456)
3. ニックネームを入力
4. 地図上をクリックしてアイコンを配置

---

## 🛠️ 機能

✅ リアルタイム同期 (みんなの編集が即座に反映)
✅ 50人同時接続可能
✅ 5種類のアイコン (ペン/学校/公園/お店/家)
✅ 自分の描画だけ削除可能
✅ 参加者リスト表示
✅ 完全無料

---

## ⚙️ 技術スタック

- **地図:** OpenStreetMap + Leaflet.js
- **バックエンド:** Supabase (PostgreSQL)
- **フロントエンド:** HTML + CSS + JavaScript (バニラJS)
- **リアルタイム:** Supabase Realtime

---

## 🔧 トラブルシューティング

### **地図が表示されない**
→ ブラウザのコンソール (F12) でエラーを確認
→ Supabaseのテーブルが作成されているか確認

### **描画が保存されない**
→ Supabaseのダッシュボードで以下を確認:
```sql
SELECT * FROM sessions;
SELECT * FROM drawings;
```

### **リアルタイム更新されない**
→ Supabase → Database → Replication
→ `drawings` テーブルがONになっているか確認

---

## 📊 Supabase無料枠

- データベース: 500MB
- API リクエスト: 無制限
- リアルタイム接続: 200同時接続
- 帯域幅: 5GB/月

**→ クラス利用には十分です!**

---

## 🎓 改良アイデア

### **簡単な改良:**
- [ ] アイコンを増やす (病院/駅/レストラン等)
- [ ] カラーピッカーで色を選べるようにする
- [ ] 線や図形を描けるようにする
- [ ] QRコードでキー共有

### **高度な改良:**
- [ ] チャット機能
- [ ] 画像アップロード
- [ ] GPS連動
- [ ] データエクスポート (JSON/CSV)

---

## 📝 ライセンス

MIT License - 自由に使用・改変してください!

---

## 🙋 サポート

質問があれば、Supabaseのダッシュボードで:
- **Table Editor** でデータを確認
- **SQL Editor** でクエリを実行
- **Logs** でエラーを確認

できます。

---

**作成日:** 2026年1月1日
**バージョン:** 1.0.0