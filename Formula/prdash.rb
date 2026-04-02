class Prdash < Formula
  include Language::Python::Virtualenv

  desc "Terminal dashboard for monitoring GitHub PRs requiring your attention"
  homepage "https://github.com/prdash/prdash"
  url "https://files.pythonhosted.org/packages/eb/1e/fc7c7b712e05cc52b24da5f253a5bcf0c0c3b8992cdea242a952d1839e59/prdash_tui-0.1.0.tar.gz"
  sha256 "984e766382e02c7fa0f2bc9ce35b94dc0bead87904eb76fed23615ac2dc7400c"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12", system_site_packages: false)
    venv.pip_install "prdash-tui==#{version}"
    bin.install_symlink Dir[libexec/"bin/prdash"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prdash --version")
  end
end
