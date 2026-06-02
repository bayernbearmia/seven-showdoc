class SevenShowdoc < Formula
  desc "Auto-generate ShowDoc API documentation from code comments"
  homepage "https://github.com/bayernbearmia/seven-showdoc"
  url "https://github.com/bayernbearmia/seven-showdoc/archive/refs/tags/v0.1.0.tar.gz"
  license "MIT"

  depends_on "bash"

  def install
    bin.install "showdoc_api.sh" => "seven-showdoc"
  end

  test do
    assert_match "showdoc", shell_output("#{bin}/seven-showdoc --help 2>&1", 1)
  end
end
