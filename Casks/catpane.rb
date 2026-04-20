cask "catpane" do
  version "0.5.1"

  on_arm do
    sha256 "6c1f324c01bb503e23f26c927acdaeb95e1cad88d8ddad38bd3d0829f04e4388"

    url "https://github.com/crockalet/catpane/releases/download/v#{version}/CatPane-v#{version}-macos-arm64.zip"
  end

  on_intel do
    sha256 "bb6afac1ecfcd98963b043bb42b9f72733b23da96ecb3033ab134164ea5c57c7"

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
