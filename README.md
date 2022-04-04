# dev-env-essentials
2YYの開発環境を自動で構築するやつ。

## 使い方

下記の手順を実施。

1. `cd このリポジトリのルートディレクトリ`
2. `sh main.sh`
3. vim を起動して `:PlugInstall` を実行
4. Vim を起動して `:CocInstall coc-clangd coc-css coc-elixir coc-eslint coc-html coc-json coc-prettier coc-tsserver` を実行
5. [Nerd Font Download Page](https://www.nerdfonts.com/font-downloads) から JetBrains Mono の Nerd Font 版をダウンロード・インストール

## 備考

アプリは開発用というより、Homebrew Cask でインストール出来るものを片っ端から追加している。(minecraft とか有るし・・)
