from pathlib import Path

import numpy as np
import pandas as pd
from matplotlib import pyplot as plt

for file in sorted(Path("data").glob("scope_*.csv")):
    data = pd.read_csv(file, dtype=np.float32, skiprows=2, names=["x-axis", "1", "2"])
    fig, ax = plt.subplots()
    second_ax = ax.twinx()

    ax.scatter(data["x-axis"], data["1"], c="red", s=1)
    second_ax.scatter(data["x-axis"], data["2"], c="blue", s=1)
    ax.set_xlabel("time (s)")
    ax.set_ylabel("oscope trace 1 (V)")
    second_ax.set_ylabel("oscope trace 2 (V)")
    ax.set_title(str(file))
    plt.show()
    # plt.scatter(data["x-axis"], data["1"])
    # plt.scatter(data["x-axis"], data["2"])
    # plt.show()
