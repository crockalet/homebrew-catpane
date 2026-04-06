cask "catpane" do
  version "0.2.2"

  on_arm do
    sha256 "b6a25b237fc81968689b1b886b96c6d58673b4f9d93e0779068f3ad3ce7a657e"

    url "https://github.com/crockalet/catpane/releases/download/v#{version}/CatPane-v#{version}-macos-arm64.zip"
  end

  on_intel do
    sha256 "04a4820e88a29cf68e94781c6cf5c3fadf7b2a4679a34bc6b94fb39b1f352131"

    url "https://github.com/crockalet/catpane/releases/download/v#{version}/CatPane-v#{version}-macos-x86_64.zip"
  end

  name "CatPane"
  desc "Native desktop logcat viewer with split panes"
  homepage "https://github.com/crockalet/catpane"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "CatPane.app"
  binary "#{appdir}/CatPane.app/Contents/MacOS/catpane"

  zap trash: [
    "~/.config/catpane/session.json",
    "~/.config/catpane/tag_history.txt",
  ]

  caveats <<~EOS
    `adb` is required at runtime.
    Install it with:
      brew install --cask android-platform-tools

    A `catpane` CLI symlink is added to your PATH, so you can run the MCP server with:
      catpane mcp
  EOS
end
