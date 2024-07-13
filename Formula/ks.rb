class Ks < Formula
  desc "Command-line secrets manager powered by macOS Keychains"
  homepage "https://github.com/loteoo/ks"
  url "https://github.com/loteoo/ks/archive/refs/tags/0.4.2.tar.gz"
  sha256 "fb8d54c9844e51689e3213e5218feda520f51ac83efb98a9b4a54dfd82e91cf2"
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
