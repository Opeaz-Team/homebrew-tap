class Aval < Formula
  desc "Command-line client for Aval plans (get and push)"
  homepage "https://aval.opeaz.com"
  url "https://aval.opeaz.com/cli/aval-0.1.53.cjs"
  version "0.1.53"
  sha256 "1b958d4d6c0eaf3afc28f66458849ace05ebeda8e65d24be9d3a984afa1b7f70"
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
