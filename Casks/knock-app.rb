cask "knock-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.0.23"
  sha256 arm:   "a5d555fc64dc9a37c149f01a003408e33e9d7ffa181cf1e6a98bede479d47ed2",
         intel: "0d620d03de875afe609889dd76b08ba97992da20fa7448741261c1a050bea8e0"

  url "https://github.com/jairoFernandez/knock/releases/download/v0.0.23/Knock_#{version}_#{arch}.dmg"
  name "Knock"
  desc "Git-native HTTP client and workspace toolkit"
  homepage "https://github.com/jairoFernandez/knock"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "Knock.app"

  # The app is not notarized; without this macOS refuses the first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Knock.app"],
        must_succeed:   false,
        writable_paths: ["Knock.app"],
        writable_base:  :appdir
  end

  zap trash: [
    "~/Library/Application Support/dev.knock.app",
    "~/Library/Caches/dev.knock.app",
    "~/Library/Preferences/dev.knock.app.plist",
    "~/Library/Saved Application State/dev.knock.app.savedState",
    "~/Library/WebKit/dev.knock.app",
  ]

  caveats <<~TEXT
    For the knock CLI and the MCP server for AI agents:
      brew install jairofernandez/knock/knock
  TEXT
end
