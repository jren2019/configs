cp ./requirements.txt ./.flake8 ./.pre-commit-config.yaml ./.isort.cfg ./pyproject.toml $1

cd $1
pip install -r requirements.txt
pre-commit install
