class Knock < Formula
  desc "Git-native HTTP client: requests, flows and mocks as TOML, with an MCP server"
  homepage "https://github.com/jairoFernandez/knock"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jairoFernandez/knock/releases/download/v0.0.27/knock-0.0.27-macos-aarch64.tar.gz"
      sha256 "722dfdf4467747765fe861819c8216ce1759a9c442ca9ef30cd6f0563c05c59d"
    end
    on_intel do
      url "https://github.com/jairoFernandez/knock/releases/download/v0.0.27/knock-0.0.27-macos-x86_64.tar.gz"
      sha256 "3be5e5e9c9e2f2ef6b7e1368c438edc302c2965108468f0f8fae531c6cdeee82"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jairoFernandez/knock/releases/download/v0.0.27/knock-0.0.27-linux-aarch64.tar.gz"
      sha256 "84ee679cb67bfa02f5c9d1319db0486cd243f141a347851f53bbf344a238ac0f"
    end
    on_intel do
      url "https://github.com/jairoFernandez/knock/releases/download/v0.0.27/knock-0.0.27-linux-x86_64.tar.gz"
      sha256 "bd79e32f99a20647485291673bcc69fa779107872b43853ca009677b238c0ccf"
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
