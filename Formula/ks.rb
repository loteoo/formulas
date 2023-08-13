class Ks < Formula
  desc "Command-line secrets manager powered by macOS Keychains"
  homepage "https://github.com/loteoo/ks"
  url "https://github.com/loteoo/ks/archive/refs/tags/0.3.0.tar.gz"
  sha256 "0b75cf24cd5fe6e6ed76b3a1dcdb1d35c2740f52942e57b75160866a0c86f317"
  license "MIT"

  depends_on :macos
  uses_from_macos "bash"
  uses_from_macos "openssl"

  def install
    bin.install "ks"
  end

  def post_install
    ohai "ks has been installed 🎉"
    ohai "Please run \"ks init\" to create your first keychain."
  end

  def caveats
    <<~EOS
      You can setup basic completions by adding "source <(ks completion)" to your shell profile.
    EOS
  end

  test do
    assert_match "Keychain Secrets manager", shell_output("#{bin}/ks help")
  end
end
