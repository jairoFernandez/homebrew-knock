cask "knock-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.0.27"
  sha256 arm:   "35c0a8faf92dadc6cc18328d5fa2c176b5b01632cfd712b3301c7529224a1c07",
         intel: "490a157780072d1d90e632cd457333f9f48260d64bca3c4ae39aa5b86a21ccba"

  url "https://github.com/jairoFernandez/knock/releases/download/v0.0.27/Knock_#{version}_#{arch}.dmg"
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
