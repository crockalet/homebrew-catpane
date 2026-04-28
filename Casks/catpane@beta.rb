cask "catpane@beta" do
  version "0.5.6-beta.3"

  on_arm do
    sha256 "23831408b179e4c145f227d7ee0e63430c0771c2ff1e0e8a06463445dd52d4e7"

    url "https://github.com/crockalet/catpane/releases/download/v#{version}/CatPane-v#{version}-macos-arm64.zip"
  end

  on_intel do
    sha256 "9e06595aa8000dea2aebc9c55a0c98749342027b828021969ceef50b8f2b89c8"

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
