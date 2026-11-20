cask "knock-app" do
  arch arm: "aarch64", intel: "x64"

  version "0.0.26"
  sha256 arm:   "94a4af14a3a396cee6ed70757a0b0255fb743e0f8572e497af3fa7dfe9392fd6",
         intel: "67835ccdb3a2420b21b46fb758e1402b8a8510d0ac55592994a0feea60e14f3f"

  url "https://github.com/jairoFernandez/knock/releases/download/v0.0.26/Knock_#{version}_#{arch}.dmg"
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
