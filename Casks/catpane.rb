cask "catpane" do
  version "0.5.4"

  on_arm do
    sha256 "0c7a6674ef828524c533fe3d25eb4f5c12672fe28091165ccc2c820a0fcad46c"

    url "https://github.com/crockalet/catpane/releases/download/v#{version}/CatPane-v#{version}-macos-arm64.zip"
  end

  on_intel do
    sha256 "b53767ec13da436524c447c71b25ed6f44a44a46a04a25690a1c9364ede57acb"

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
