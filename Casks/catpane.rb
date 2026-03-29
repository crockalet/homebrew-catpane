cask "catpane" do
  version "0.1.3"

  on_arm do
    sha256 "a28e5c572924a87351337fa0d78e32b12941a81fa97a53f233b0bac205a3230b"

    url "https://github.com/crockalet/catpane/releases/download/v#{version}/CatPane-v#{version}-macos-arm64.zip"
  end

  on_intel do
    sha256 "69c976c34c99088edaea758e67bba781931cc919ccb6fe2b0afa878e612a27ec"

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
