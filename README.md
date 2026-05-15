# Law of Large Numbers — Snakemake pipeline

A small Snakemake pipeline that demonstrates the Law of Large Numbers.

For a range `1..n`, the pipeline draws `k` samples, computes the mean, and
repeats that `reps` times to get a distribution of sample means for each `k`.
It then plots one boxplot per `k` on the same axes. As `k` grows, the boxes
tighten around the true mean `(n+1)/2` — that is the Law of Large Numbers
made visible.

The submission plot (`results/draws_plot_n1000.png`) is generated with
`n = 1000` and `k_values = [5, 10, 25, 50, 100, 200, 1000, 2000]`.

## Files

```
.
|-- Snakefile          # pipeline definition (sample -> plot)
|-- config.yaml        # n, k_values, reps  <- edit me
|-- environment.yaml   # conda env spec
|-- scripts/
|   |-- sample.py      # one CSV of sample means per (n, k)
|   `-- plot.py        # combines CSVs into the boxplot
`-- results/           # produced by the pipeline
```

## Setup

```bash
conda env create -f environment.yaml
conda activate lln
```

## Run

```bash
snakemake --cores 4
```

That produces `results/draws_plot_n<N>.png` for whatever `n` is in
`config.yaml`.

## Reconfiguring (the whole point)

Everything lives in `config.yaml`. No code changes needed.

**Add an extra box with `k = 5000`** — append `5000` to `k_values`:

```yaml
k_values:
  - 5
  - 10
  - 25
  - 50
  - 100
  - 200
  - 1000
  - 2000
  - 5000      # <-- new box
```

Then `snakemake --cores 4` again. Snakemake only computes the new k; the
existing CSVs are reused.

**Test the range 1..2000** — change `n`:

```yaml
n: 2000
```

The output filename becomes `results/draws_plot_n2000.png` automatically,
so previous plots are not overwritten.

**Smoother boxes** — raise `reps` (default 100).

## What each rule does

- `rule sample` — for one `(n, k)`, writes `results/samples_n<n>_k<k>.csv`
  with `reps` rows, each row being one sample mean.
- `rule plot` — reads every `samples_n<n>_k*.csv` file for the chosen `n`
  and writes the boxplot `results/draws_plot_n<n>.png`.

Seeds are derived deterministically from `(n, k)`, so reruns reproduce the
exact same plot.
