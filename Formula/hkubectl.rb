class Hkubectl < Formula
  desc "HKube CLI"
  homepage "https://hkube.io"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kube-HPC/hkubectl/releases/download/v1.1.72/hkubectl-macos"
      sha256 "1e4fa5512d29e0e64e927f2868d32e529fb4cd0a1724c407f700e00d80118ccd"

      def install
        bin.install "hkubectl-macos" => "hkubectl"

        # Install bash completion
        output = Utils.safe_popen_read("#{bin}/hkubectl", "completion", "bash")
        (bash_completion/"hkubectl").write output

        # Install zsh completion
        output = Utils.safe_popen_read("#{bin}/hkubectl", "completion", "zsh")
        (zsh_completion/"_hkubectl").write output
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/kube-HPC/hkubectl/releases/download/v1.1.72/hkubectl-linux"
      sha256 "2b32ee261b27731f9e0057ee442f555e45fe77279cf0cb602a1639970a7bc217"

      def install
        bin.install "hkubectl-linux" => "hkubectl"

        # Install bash completion
        output = Utils.safe_popen_read("#{bin}/hkubectl", "completion", "bash")
        (bash_completion/"hkubectl").write output

        # Install zsh completion
        output = Utils.safe_popen_read("#{bin}/hkubectl", "completion", "zsh")
        (zsh_completion/"_hkubectl").write output
      end
    end
  end
end
