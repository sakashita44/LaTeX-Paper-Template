# GitHub Actions Workflow for Calculating Diff

## 目的

## フロー

### 初期設定

リポジトリをクローンし、作業ディレクトリに移動

```sh
git clone <リポジトリURL>
cd <リポジトリ名>
```

### 初回のタグ作成

初回のレビュー用にタグを作成

```sh
git tag -a v1.0 -m "Initial version for review"
git push origin v1.0
```

### 執筆とコミット

論文の執筆を進め適宜コミット

```sh
git add .
git commit -m "Added introduction section"
```

### レビュー前のタグ作成

次のレビュー用に新しいタグを作成

```sh
git tag -a v2.0 -m "Second version for review"
git push origin v2.0
```

### 差分の確認

前回のタグと今回のタグの間の差分を確認 (GitHub Actionsにて自動化)

```sh
git diff v1.0 v2.0
```

### レビューと修正

レビューを受けて修正を行い, 適宜コミット

```sh


## GitHub Actions Workflow

以下は、タグ間の差分を自動的に出力するGitHub Actionsのワークフローです。

```yaml
name: Calculate Diff

on:
    push:
        tags:
            - 'v*'

jobs:
    diff:
        runs-on: ubuntu-latest

        steps:
        - name: Checkout code
          uses: actions/checkout@v2

        - name: Fetch all tags
          run: git fetch --tags

        - name: Calculate diff
          run: |
            TAGS=$(git tag --sort=-creatordate | head -n 2)
            TAG_ARRAY=($TAGS)
            if [ ${#TAG_ARRAY[@]} -eq 2 ]; then
                git diff ${TAG_ARRAY[1]} ${TAG_ARRAY[0]} > diff.log
            else
                echo "Not enough tags to calculate diff" > diff.log

        - name: Upload diff log
          uses: actions/upload-artifact@v2
          with:
              name: diff-log
              path: diff.log
```