# already have tensorflow
#pip install tensorflow

pip install -e .

WEIGHTS=./model/deepmoji_weights.hdf5
if [[ ! -f "$WEIGHTS" ]]; then
  python scripts/download_weights.py
fi

nosetests -v

cd examples
py ./finetune_semeval_class-avg_f1.py
