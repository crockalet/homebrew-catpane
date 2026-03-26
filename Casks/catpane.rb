cask "catpane" do
  version "0.1.1"

  on_arm do
    sha256 "79358db47cc7c396c68779aeff4d41d9fe440d2b880120c3916d9c22e36e1d18"

    url "https://github.com/crockalet/catpane/releases/download/v#{version}/CatPane-v#{version}-macos-arm64.zip"
  end

  on_intel do
    sha256 "ecd633ee5fbeeb8379dc7d99414a6660455aa18570a9f662e6627d9921089e86"

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

  zap trash: [
    "~/.config/catpane/session.json",
    "~/.config/catpane/tag_history.txt",
  ]

  caveats <<~EOS
    `adb` is required at runtime.
    Install it with:
      brew install --cask android-platform-tools
  EOS
end
