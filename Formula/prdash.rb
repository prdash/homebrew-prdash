class Prdash < Formula
  include Language::Python::Virtualenv

  desc "Terminal dashboard for monitoring GitHub PRs requiring your attention"
  homepage "https://github.com/prdash/prdash"
  url "https://files.pythonhosted.org/packages/a5/85/b912f63631dc6fdd9c07bacd175e6a2d73da9421042a5aaf236b135b138b/prdash_tui-0.2.0.tar.gz"
  sha256 "d7ceeef77371520a7496e1f86bafdbd5b22ec40292aa7abf1c10068cc5583f58"
  license "MIT"

  head "https://github.com/prdash/prdash.git", branch: "main"

  depends_on "python@3.12"

  def install
    virtualenv_create(libexec, "python3.12")
    system libexec/"bin/python", "-m", "ensurepip"
    if build.head?
      system libexec/"bin/python", "-m", "pip", "install", buildpath
    else
      system libexec/"bin/python", "-m", "pip", "install", "prdash-tui==#{version}"
    end
    bin.install_symlink Dir[libexec/"bin/prdash"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prdash --version")
  end
end
