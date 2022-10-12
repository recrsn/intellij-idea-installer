#!/bin/sh

set -ex

product_name=$1

if [ -z "$product_name" ]; then
    echo "Usage: $0 product_name"
    exit 1
fi


get_latest_download_link() {
    product_code=$1
    curl -s "https://data.services.jetbrains.com/products/releases?code=${product_code}&latest=true&type=release" | jq -r ".${product_code}[0].downloads.linux.link"
}

download_and_install() {
    link=$1
    launcher=$2

    if [ -z "$launcher" ]; then
        launcher="${product_name}.sh"
    fi

    destination="${HOME}/.local/opt/${product_name}"
    mkdir -p "${destination}"

    download_dir=$(mktemp -d)
    file_name=$(basename "$link")
    
    curl -Lo "${download_dir}/${file_name}" "${link}"
    tar -xzf "${download_dir}/${file_name}" --strip-components=1 -C "${destination}"
    rm -r "${download_dir}"

    echo "Installed to ${destination}"
    echo "Crete a Desktop entry and command-line launcher from the 'Tools' menu"

    sh "${destination}/bin/${launcher}"
}

case "$product_name" in
    "idea-community")
        link=$(get_latest_download_link "IIC")
        download_and_install "$link" "idea.sh"
        ;;
    "idea-ultimate")
        link=$(get_latest_download_link "IIU")
        download_and_install "$link" "idea.sh"
        ;;
    "pycharm-community")
        link=$(get_latest_download_link "PCC")
        download_and_install "$link" "pycharm.sh"
        ;;
    "pycharm-professional")
        link=$(get_latest_download_link "PCP")
        download_and_install "$link" "pycharm.sh"
        ;;
    "webstorm")
        link=$(get_latest_download_link "WS")
        download_and_install "$link" 
        ;;
    "rubymine")
        link=$(get_latest_download_link "RM")
        download_and_install "$link"
        ;;
    "clion")
        link=$(get_latest_download_link "CL")
        download_and_install "$link"
        ;;
    "goland")
        link=$(get_latest_download_link "GO")
        download_and_install "$link"
        ;;
    "datagrip")
        link=$(get_latest_download_link "DG")
        download_and_install "$link"
        ;;
    "rider")
        link=$(get_latest_download_link "RD")
        download_and_install "$link"
        ;;
    "phpstorm")
        link=$(get_latest_download_link "PS")
        download_and_install "$link"
        ;;
    *)
        echo "Unknown product: $product_name"
        exit 1
        ;;
esac