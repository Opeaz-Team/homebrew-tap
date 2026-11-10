class Aval < Formula
  desc "Command-line client for Aval plans (get and push)"
  homepage "https://aval.opeaz.com"
  url "https://aval.opeaz.com/cli/aval-0.1.52.cjs"
  version "0.1.52"
  sha256 "ad391171fb443ddf79f60eba7343ae1f6731c8bbc99b9a5d89118d443efe3c1c"
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
