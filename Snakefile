# Snakemake pipeline: Law of Large Numbers demonstration
#
# For a range 1..n, draw k samples and compute the mean.
# Repeat that REPS times so we have a distribution of means per k.
# Plot all distributions as boxplots — as k grows, the boxes
# tighten around the true mean (n+1)/2.
#
# Configure n, k values, and reps in config.yaml.

configfile: "config.yaml"

N        = config["n"]
K_VALUES = config["k_values"]
REPS     = config["reps"]

rule all:
    input:
        f"results/draws_plot_n{N}.png"

# One rule call per k. Snakemake will fan these out in parallel.
rule sample:
    output:
        "results/samples_n{n}_k{k}.csv"
    params:
        reps = REPS
    script:
        "scripts/sample.py"

# Collect every k's CSV for a given n and produce the boxplot.
rule plot:
    input:
        expand("results/samples_n{{n}}_k{k}.csv", k=K_VALUES)
    output:
        "results/draws_plot_n{n}.png"
    script:
        "scripts/plot.py"
