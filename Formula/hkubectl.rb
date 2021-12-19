class Hkubectl < Formula
  desc "HKube CLI"
  homepage "https://hkube.io"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kube-HPC/hkubectl/releases/download/v1.1.69/hkubectl-macos"
      sha256 "46c9cd60fd79e3af3eeb849d3557fc4e2f4ce6c8b6a741441392242e12761e36"

      def install
        bin.install "hkubectl-macos" => "hkubectl"

        # Install bash completion
        output = Utils.popen_read("#{bin}/hkubectl completion bash")
        (bash_completion/"hkubectl").write output

        # Install zsh completion
        output = Utils.popen_read("#{bin}/hkubectl completion zsh")
        (zsh_completion/"_hkubectl").write output
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/kube-HPC/hkubectl/releases/download/v1.1.69/hkubectl-linux"
      sha256 "4cf8630c8e50fbcbda88d9cee1763708d9aff8fde2f5fb0563a9ffe464b4607d"

      def install
        bin.install "hkubectl-linux" => "hkubectl"

        # Install bash completion
        output = Utils.popen_read("#{bin}/hkubectl completion bash")
        (bash_completion/"hkubectl").write output

        # Install zsh completion
        output = Utils.popen_read("#{bin}/hkubectl completion zsh")
        (zsh_completion/"_hkubectl").write output
      end
    end
  end
end
