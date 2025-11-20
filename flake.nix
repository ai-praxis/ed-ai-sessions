{
  description = "Nix flake development with Python, R, and Quarto";
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

      # Base packages
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

      pyPackages = with pkgs.python3Packages; [
        # Core development tools
        pip
        setuptools
        wheel
        # Essential ML/AI packages for LLM work
        torch
        transformers
        datasets
        huggingface-hub
        # Data science essentials
        numpy
        pandas
        matplotlib
        # Development tools
        jupyter
        ipython
        pytest
        # Web frameworks for tutoring interface
        fastapi
        uvicorn
        # Utilities
        requests
        tqdm
      ];

      rPackages = with pkgs.rPackages; [
        # Core development
        devtools
        knitr
        rmarkdown
        # Essential tidyverse for data analysis
        tidyverse
        dplyr
        ggplot2
        readr
        # Statistical packages for evaluation
        broom
        # Testing
        testthat
      ];

      # TeX packages
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
          echo "🚀 Development Environment"
          echo "📊 Python: $(python --version)"
          echo "📈 R: $(R --version | head -1)"
          echo "📝 Quarto: $(quarto --version)"
          echo ""
          echo "Environment ready for AI/ML research with Python, R, and Quarto!"

          # Set up Python environment
          export PYTHONPATH="$PWD/code/src:$PYTHONPATH"

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
