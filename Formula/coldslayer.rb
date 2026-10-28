# typed: false
# frozen_string_literal: true

class Coldslayer < Formula
  desc "AI-Native Cold File Archiver (csl) with Seekable Zstandard Packs & Instant BM25 Local Search"
  homepage "https://github.com/xlogn/coldslayer"
  version "0.1.0"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/xlogn/coldslayer/releases/download/v0.1.0/coldslayer_0.1.0_darwin_amd64.tar.gz"
      sha256 "fdb49af3f468884c612f0bdd253d280014bce144b27a60850e1974c16f28ce79"
    end
    if Hardware::CPU.arm?
      url "https://github.com/xlogn/coldslayer/releases/download/v0.1.0/coldslayer_0.1.0_darwin_arm64.tar.gz"
      sha256 "39fd5b80fd9996d78a95c0c89c365898e832e79f26a38fc0079fae743538687f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/xlogn/coldslayer/releases/download/v0.1.0/coldslayer_0.1.0_linux_amd64.tar.gz"
      sha256 "a041d8554837af6d394450dd1392aadf3f449544bf08671abc0d576e17d876ff"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/xlogn/coldslayer/releases/download/v0.1.0/coldslayer_0.1.0_linux_arm64.tar.gz"
      sha256 "6fd9d7149c47d5551431f1f5a2f5e4795dbad0eef775250ca767991ad65e6256"
    end
  end

  def install
    bin.install "csl"
    bin.install_symlink "csl" => "coldslayer"
  end

  test do
    system "#{bin}/csl", "version"
  end
end
