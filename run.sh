#!/bin/bash

setup_libs () {
  export R_LIBS=$WERCKER_CACHE_DIR/R/library
  mkdir -p "$R_LIBS"
}

cran_dependencies () {
cat > .__temp__ <<END
repos <- $WERCKER_R_DEPENDENCIES_REPOS
if (is.null(repos)) {
  if (requireNamespace("BiocInstaller", quietly = TRUE)) {
    repos <- BiocInstaller::biocinstallRepos()
  } else {
    repos <- c(CRAN = "http://cran.rstudio.com")
  }
}
options(repos = repos)
install.packages("devtools")
devtools::install_deps(dependencies = TRUE)
END
  Rscript .__temp__
  if [[ $? -ne 0 ]]; then
    fail "CRAN dependencies failed"
  else
    success "CRAN dependencies installed"
  fi
  rm .__temp__
}

github_dependencies () {
  # read values into array
  IFS=' ' read -a pkgs <<< "$1"

  # buildup command argument
  local -a args
  for pkg in "${pkgs[@]}"; do
    args+=("-e" "devtools::install_github(\"$pkg\")")
  done

  # run Rscript
  Rscript "${args[@]}"

  if [[ $? -ne 0 ]]; then
    fail "Github dependencies failed"
  else
    success "Github dependencies installed"
  fi
}

setup_libs

cran_dependencies

if [ ! -z "$WERCKER_R_DEPENDENCIES_GITHUB_PACKAGES" ]; then
  github_dependencies "$WERCKER_R_DEPENDENCIES_GITHUB_PACKAGES"
fi

success 'R dependencies installed'
