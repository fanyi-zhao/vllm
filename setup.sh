#!/bin/bash
set -eux
# --- System packages ---------------------------------------------------------
echo "Installing necessary softwares"
#sudo apt-get update -y
#sudo apt-get install -y software-properties-common git curl ccache
echo "Initializing pyenv"
# install Python 3.12 from the deadsnakes PPA
#sudo add-apt-repository -y ppa:deadsnakes/ppa
#sudo apt-get update -y
#sudo apt-get install -y python3.12 python3.12-dev python3.12-venv
#sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 1
#sudo ln -sf /usr/bin/python3.12-config /usr/bin/python3-config
#curl -sS https://bootstrap.pypa.io/get-pip.py | sudo python3.12
python3 -m pip install uv
echo "Creating python 3.12 venv"
uv venv --python 3.12 --seed
source .venv/bin/activate
# --- Install Python packages -------------------------------------------------
echo "pip install git+https://github.com/state-spaces/mamba@v2.2.4"
pip install "git+https://github.com/state-spaces/mamba@v2.2.4"
echo "pip install -r requirements/dev.txt --extra-index-url https://download.pytorch.org/whl/cu128"
pip install -r requirements/dev.txt --extra-index-url https://download.pytorch.org/whl/cu128
#pip install -e .
# --- Pre-commit and tests ----------------------------------------------------
#pre-commit install --hook-type pre-commit --hook-type commit-msg
#pre-commit run --all-files
#pytest tests -k "not flashinfer and not torch_xla and not neuron and not tpu"


