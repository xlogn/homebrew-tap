# typed: false
# frozen_string_literal: true

class Coldslayer < Formula
  desc "AI-Native Cold File Archiver (csl) in Rust with Seekable Zstandard Packs & Tantivy BM25/Fuzzy Search"
  homepage "https://github.com/xlogn/coldslayer"
  version "0.2.1"
  license "AGPL-3.0-only"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/xlogn/coldslayer/releases/download/v0.2.1/coldslayer_0.2.1_darwin_arm64.tar.gz"
    sha256 "74cfccac1271ba96b3a736b14f807aaabfbd147accc14ed99f8f14cf64a49d2c"
  else
    url "https://github.com/xlogn/coldslayer/archive/refs/tags/v0.2.1.tar.gz"
    sha256 "f690393818869b5fb21f3a49b6c4eb8be3c61fb0dbac389c891872624a672d1b"
    depends_on "rust" => :build
  end

  def install
    if File.exist?("csl")
      bin.install "csl"
    else
      system "cargo", "install", *std_cargo_args
    end
    bin.install_symlink "csl" => "coldslayer"
  end

  test do
    system "#{bin}/csl", "version"
  end
end
