class Knock < Formula
  desc "Git-native HTTP client: requests, flows and mocks as TOML, with an MCP server"
  homepage "https://github.com/jairoFernandez/knock"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jairoFernandez/knock/releases/download/v0.0.26/knock-0.0.26-macos-aarch64.tar.gz"
      sha256 "d8e0e47de7c619fae11a1a9fcfde7e308d60ab222482ceeba1187a2bc2af57db"
    end
    on_intel do
      url "https://github.com/jairoFernandez/knock/releases/download/v0.0.26/knock-0.0.26-macos-x86_64.tar.gz"
      sha256 "4bfbeb4d77ecbbd67e61f5f334d52d98998541920e1cfc71b5e297925ee4c8e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jairoFernandez/knock/releases/download/v0.0.26/knock-0.0.26-linux-aarch64.tar.gz"
      sha256 "18c1d34c0a3b37195a306f1b450508ff9f93e73a6bea42ae4c5006f1fd4821cb"
    end
    on_intel do
      url "https://github.com/jairoFernandez/knock/releases/download/v0.0.26/knock-0.0.26-linux-x86_64.tar.gz"
      sha256 "c5e463480c147b4729649819df1772d27d47bee34919725e2d5687e3d70d8be9"
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
