{
  description = "Nix flake for ed-ai hub with Python, R, and Quarto";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};

      # Base packages for research documentation
      corePackages = with pkgs; [
        R
        curl
        git
        pandoc
        python3
        quarto
        radianWrapper
        wget
      ];

      # Essential Python packages for data analysis and notebooks
      pyPackages = with pkgs.python3Packages; [
        pip
        setuptools
        wheel
        numpy
        pandas
        matplotlib
        jupyter
        ipython
        requests
      ];

      # R packages for data analysis and reporting
      rPackages = with pkgs.rPackages; [
        devtools
        knitr
        rmarkdown
        tidyverse
        dplyr
        ggplot2
        readr
        broom
      ];

      # TeX packages for PDF generation
      texlivePackages = with pkgs.texlive; [
        (combine {
          inherit scheme-small;
        })
      ];

      # Combine all packages
      allPackages = corePackages ++ pyPackages ++ rPackages ++ texlivePackages;
    in {
      devShell = pkgs.mkShell {
        buildInputs = allPackages;

        # Environment variables
        shellHook = ''
          echo "🎓 ed-ai Hub Development Environment"
          echo "📊 Python: $(python --version)"
          echo "📈 R: $(R --version | head -1)"
          echo "📝 Quarto: $(quarto --version)"
          echo ""
          echo "Environment ready for AI-in-education research documentation!"

          # Set up R environment
          export R_LIBS_USER="$PWD/R/Library"
          mkdir -p "$R_LIBS_USER"

          # Ensure proper UTF-8 locale for multilingual text processing
          export LC_ALL=en_US.UTF-8
          export LANG=en_US.UTF-8
        '';
      };
    });
}
