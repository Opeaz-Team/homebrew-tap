class Aval < Formula
  desc "Command-line client for Aval plans (get and push)"
  homepage "https://aval.opeaz.com"
  url "https://aval.opeaz.com/cli/aval-0.1.51.cjs"
  version "0.1.51"
  sha256 "403e7a13425326b53ee306c84e4c08cc01665cb30b761cd9e91c528b4b268f50"
  depends_on "node"

  def install
    libexec.install "aval-#{version}.cjs" => "aval.cjs"
    (bin/"aval").write <<~SH
      #!/bin/sh
      AVAL_INSTALLED_BY=homebrew exec "#{Formula["node"].opt_bin}/node" "#{libexec}/aval.cjs" "$@"
    SH
    chmod 0755, bin/"aval"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aval --version")
  end
end
