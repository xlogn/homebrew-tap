# typed: false
# frozen_string_literal: true

class Coldslayer < Formula
  desc "AI-Native Cold File Archiver (csl) in Rust with Seekable Zstandard Packs & Tantivy BM25/Fuzzy Search"
  homepage "https://github.com/xlogn/coldslayer"
  version "0.2.0"
  license "AGPL-3.0-only"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/xlogn/coldslayer/releases/download/v0.2.0/coldslayer_0.2.0_darwin_arm64.tar.gz"
    sha256 "ca09052b5a8c99b860950038e97b694fc4223838994e73eea6fcd0e58dc27012"
  elsif OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/xlogn/coldslayer/releases/download/v0.2.0/coldslayer_0.2.0_linux_amd64.tar.gz"
    sha256 "2828a0e5976cf388a5c9109b840f1dbf44c5c09f30676f9103dc856bf2c86575"
  else
    url "https://github.com/xlogn/coldslayer/archive/refs/tags/v0.2.0.tar.gz"
    sha256 "6f1bc95907825294152856e58f7b1477cced8070875c9ec88a2703157b167afb"
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
