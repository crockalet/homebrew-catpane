cask "catpane@beta" do
  version "0.5.6-beta.1"

  on_arm do
    sha256 "43f858380065a9853d01bf2be41c76ef05b393799b7fb805821fe7382bd0d618"

    url "https://github.com/crockalet/catpane/releases/download/v#{version}/CatPane-v#{version}-macos-arm64.zip"
  end

  on_intel do
    sha256 "c3dfe422e6d24152c987e287e72b78173b7759c47dfa7286b027c4e92b44ff7a"

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
