#!/bin/bash

python3 -c 'import os; print(os.urandom(32).hex(), end="")' > mygpo/env/SECRET_KEY