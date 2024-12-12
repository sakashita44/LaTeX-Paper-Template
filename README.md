# LaTeX-Paper-Template

LaTeXを使用した論文執筆のための個人用テンプレート.

* VS CodeのProfileテンプレートは[こちら](https://gist.github.com/sakashita44/d2b48b0dbb1fffc89f1da1d744b262bc#file-latex-vs-code-profile).

この設定では, `uplatex`を使用してタイプセットしている

* 他のエンジンを使用する場合は, `latex-workshop.latex.tools`と`latex-workshop.latex.recipes`を適宜修正する

自作のcleanスクリプトを使用して生成される中間ファイルを削除している (レシピに追加している)

* latex-workshopの設定で`latex-workshop.latex.autoClean.run`で削除するとlogファイルが消えてしまうため

GitHub Copilotに対して`.github/copilot-instructions.md`を提示して文章改善を促している

指導教員等にレビューしてもらうために, gitのtagを使用した差分表示のワークフローを想定している

* `docs/workflow.md`参照

`main.tex`は個人的な設定を含んでいるため, 適宜修正のこと.

TODO

* 将来的にはdocker等を使用してLaTeX環境を構築したい
