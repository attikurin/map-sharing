-- ============================================
-- みんなの地図 - データベース設定SQL
-- ============================================
-- このファイルをSupabaseのSQL Editorで実行してください
-- https://supabase.com/dashboard/project/YOUR_PROJECT/sql/new

-- ============================================
-- 1. セッションテーブル
-- ============================================
CREATE TABLE IF NOT EXISTS sessions (
  id TEXT PRIMARY KEY,
  created_at TIMESTAMP DEFAULT NOW(),
  participant_count INTEGER DEFAULT 0
);

-- ============================================
-- 2. 描画テーブル
-- ============================================
CREATE TABLE IF NOT EXISTS drawings (
  id SERIAL PRIMARY KEY,
  session_id TEXT REFERENCES sessions(id) ON DELETE CASCADE,
  type TEXT NOT NULL,
  lat FLOAT NOT NULL,
  lng FLOAT NOT NULL,
  author TEXT NOT NULL,
  color TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- ============================================
-- 3. リアルタイム機能を有効化
-- ============================================
-- drawingsテーブルでリアルタイム更新を有効にする
ALTER PUBLICATION supabase_realtime ADD TABLE drawings;

-- ============================================
-- 4. インデックス作成(パフォーマンス向上)
-- ============================================
CREATE INDEX IF NOT EXISTS idx_drawings_session 
ON drawings(session_id);

CREATE INDEX IF NOT EXISTS idx_drawings_created 
ON drawings(created_at);

-- ============================================
-- 5. セキュリティ設定 (Row Level Security)
-- ============================================
-- RLSを有効化
ALTER TABLE sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE drawings ENABLE ROW LEVEL SECURITY;

-- 全員が読み取り可能
CREATE POLICY "Anyone can read sessions" 
ON sessions FOR SELECT 
USING (true);

CREATE POLICY "Anyone can read drawings" 
ON drawings FOR SELECT 
USING (true);

-- 全員が作成可能
CREATE POLICY "Anyone can create sessions" 
ON sessions FOR INSERT 
WITH CHECK (true);

CREATE POLICY "Anyone can create drawings" 
ON drawings FOR INSERT 
WITH CHECK (true);

-- 削除は作成者のみ可能
CREATE POLICY "Users can delete own drawings" 
ON drawings FOR DELETE 
USING (true); -- 簡易版: 全員が削除可能 (本番環境では要改善)

-- ============================================
-- 6. 動作確認クエリ
-- ============================================
-- テーブルが正しく作成されたか確認
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
AND table_name IN ('sessions', 'drawings');

-- セッション一覧を表示
SELECT * FROM sessions ORDER BY created_at DESC LIMIT 10;

-- 描画一覧を表示
SELECT * FROM drawings ORDER BY created_at DESC LIMIT 10;

-- セッションごとの描画数を集計
SELECT 
    session_id,
    COUNT(*) as drawing_count,
    COUNT(DISTINCT author) as participant_count
FROM drawings
GROUP BY session_id
ORDER BY drawing_count DESC;

-- ============================================
-- 7. データクリーンアップ(必要に応じて実行)
-- ============================================
-- 古いセッションを削除 (7日以上前)
-- DELETE FROM sessions 
-- WHERE created_at < NOW() - INTERVAL '7 days';

-- すべてのデータを削除 (テスト用)
-- TRUNCATE TABLE drawings, sessions CASCADE;

-- ============================================
-- 完了!
-- ============================================
-- これでデータベースの準備が完了しました。
-- index.html を開いてアプリをテストしてください!