# environments

check_brew_installed() {
    echo "Check if brew is installed ..."
    if [ ! -f "`which brew`" ]; then
        echo "brew not found, perform install"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    echo "brew is ready ✅"
}

check_brew_tools_installed() {
    echo "Check if $1 is installed by brew ..."
    if [ ! -f "`which $1`" ]; then
        echo "$1 not found, perform install"
        brew install $1
    fi

    echo "$1 is ready ✅"
}

check_node_tools_installed() {
    echo "Check if $1 is installed by node ..."
    if [ ! -f "`which $1`" ]; then
        echo "$1 not found, perform install"
        npm install -g $1
    fi

    echo "$1 is ready ✅"
}

check_rustup_installed() {
    echo "Check if rustup is installed ..."
    if [ ! -f "`which rustup`" ]; then
        echo "rustup not found, perform install"
        curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
    fi

    echo "rustup is ready ✅"
}

check_circom_installed() {
    echo "Check if circom is installed ..."
    if [ ! -f "`which circom`" ]; then
        echo "circom not found, perform install"
        git clone https://github.com/iden3/circom.git
        cargo build --release
        cargo install --path circom
    fi

    echo "circom is ready ✅"
}

check_brew_installed
check_brew_tools_installed repo
check_brew_tools_installed npm
check_node_tools_installed snarkjs
check_rustup_installed
check_circom_installed
