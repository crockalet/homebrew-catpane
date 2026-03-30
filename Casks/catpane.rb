cask "catpane" do
  version "0.2.0"

  on_arm do
    sha256 "c42b457613854e83cef06657051308946fff3e48e019265fea9e65b8f1e159fa"

    url "https://github.com/crockalet/catpane/releases/download/v#{version}/CatPane-v#{version}-macos-arm64.zip"
  end

  on_intel do
    sha256 "7b9a1427cabb5e3bfb2a0f6e769e8cfc50952184d319cfbac340d953a89c5813"

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
