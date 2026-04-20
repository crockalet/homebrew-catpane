cask "catpane" do
  version "0.5.2"

  on_arm do
    sha256 "7a476ae9d6d8cf6b2f1a3531290b3b2358f30278dc8b6ffbaeec6341b3689f1e"

    url "https://github.com/crockalet/catpane/releases/download/v#{version}/CatPane-v#{version}-macos-arm64.zip"
  end

  on_intel do
    sha256 "47aa818e6b16dfb6d9337b702db553a00af65d7bb6a2d4851571264a83ca70e2"

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
    CatPane needs platform-specific tools at runtime:

    For Android capture, install adb:
      brew install --cask android-platform-tools

    For physical iOS device capture, install libimobiledevice:
      brew install libimobiledevice

    iOS simulator capture works out of the box with Xcode installed.

    A `catpane` CLI symlink is added to your PATH, so you can run the MCP server with:
      catpane mcp
  EOS
end
