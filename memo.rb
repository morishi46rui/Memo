require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

if memo_type == 1
  puts "新規メモを作成します。"
  puts "拡張子を除いたファイル名を入力してください。"
  
  file_name = gets.chomp #入力されたファイル名を取得。改行なし状態。
  
  puts "メモの内容を入力してください。"
  puts "終了後、Ctrl+Dで保存します。"
  
  memo = STDIN.read #入力された文字列を読み取り。
  
  CSV.open("#{file_name}.csv", "w")do |csv| #ファイルを新規書き込みモード
    csv << ["#{memo}"]
  end
  
elsif memo_type == 2
  puts "拡張子を除いた既存のファイル名を入力してください。"
  file_name = gets.chomp
  
  puts "編集内容を記入してください。"
  puts "終了後、Ctrl+Dで保存します。"
  
  memo = STDIN.read
  
  CSV.open("#{file_name}.csv", "a")do |csv| #既存ファイルを編集
  csv << ["#{memo}"]
  end
end

