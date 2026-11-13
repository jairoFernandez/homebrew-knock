class Knock < Formula
  desc "Git-native HTTP client: requests, flows and mocks as TOML, with an MCP server"
  homepage "https://github.com/jairoFernandez/knock"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jairoFernandez/knock/releases/download/v0.0.23/knock-0.0.23-macos-aarch64.tar.gz"
      sha256 "8761a13020bf2a0d24edcd15200b5e0898d2e88d8d536047044422bbd3f351fb"
    end
    on_intel do
      url "https://github.com/jairoFernandez/knock/releases/download/v0.0.23/knock-0.0.23-macos-x86_64.tar.gz"
      sha256 "ab56020efcf34d50ee49fb2e6424a6f727c5b818c9d18ffee62fd0b93c1a10df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jairoFernandez/knock/releases/download/v0.0.23/knock-0.0.23-linux-aarch64.tar.gz"
      sha256 "06b95f403d77aebdbbb09799e8beee15d9b112337bc4e896c6596b473e80791a"
    end
    on_intel do
      url "https://github.com/jairoFernandez/knock/releases/download/v0.0.23/knock-0.0.23-linux-x86_64.tar.gz"
      sha256 "304a4829359cb6daaf57751443eeba9a671857dbc47ed0abd39e1caf2636911b"
    end
  end

  def install
    bin.install "knock"
  end

  def caveats
    <<~TEXT
      Use knock from Claude Code (MCP):
        claude mcp add --scope user knock -- knock mcp

      Desktop app:
        brew install --cask jairofernandez/knock/knock-app
    TEXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/knock --version")
  end
end
