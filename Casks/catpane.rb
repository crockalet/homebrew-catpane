cask "catpane" do
  version "0.1.0"

  on_arm do
    sha256 "8f432ff553b4e66dda954ff70d223ecdbf66f026bf7f663426a8f0fcdab31ee5"

    url "https://github.com/crockalet/catpane/releases/download/v#{version}/CatPane-v#{version}-macos-arm64.zip"
  end

  on_intel do
    sha256 "6ba52b04a376dec628137c3ae5bb959a54fbb3e94c9b472db843a1c0ff0c6099"

    url "https://github.com/crockalet/catpane/releases/download/v#{version}/CatPane-v#{version}-macos-x86_64.zip"
  end

  name "CatPane"
  desc "Native desktop logcat viewer with split panes"
  homepage "https://github.com/crockalet/catpane"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "android-platform-tools"

  app "CatPane.app"

  zap trash: [
    "~/.config/catpane/session.json",
    "~/.config/catpane/tag_history.txt",
  ]
end
