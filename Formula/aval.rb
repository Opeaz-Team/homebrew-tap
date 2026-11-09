class Aval < Formula
  desc "Command-line client for Aval plans (get and push)"
  homepage "https://aval.opeaz.com"
  url "https://aval.opeaz.com/cli/aval-0.1.50.cjs"
  version "0.1.50"
  sha256 "b2012f66531c5ae5527953a5b16e8a25eb3127b9d61c5aa74e2067a6eb98ff3c"
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
