# 生成される不要なファイルを削除するスクリプト

# 削除するファイルの拡張子リスト
$extensions = @("aux", "lof", "lot", "fls", "out", "toc", "fmt", "fot", "cb", "cb2", "lb", "dvi", "xdv", "bbl", "bcf", "blg", "blx.aux", "blx.bib")

# 除外するディレクトリリスト
$excludeDirs = @("node_modules", ".git", ".vscode", "figures", "docs")

# 現在のディレクトリ内のファイルを再帰的に全て取得
$files = Get-ChildItem -Recurse

# 除外するディレクトリ内のファイルを除外
foreach ($dir in $excludeDirs) {
    $files = $files | Where-Object { $_.DirectoryName -notlike "*\$dir\*" }
}

# ファイルを削除
foreach ($file in $files) {
    if ($extensions -contains $file.Extension.TrimStart(".")) {
        Remove-Item $file.FullName
    }
}
