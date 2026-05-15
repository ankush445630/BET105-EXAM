# Submission checklist

The assignment asks for three deliverables in three places.
Everything you need is in this folder.

---

## 1. Teams folder `Exam_Code_Submission` - hand-written, scanned

**What:** Snakemake rules written on A4 paper, then scanned.

**Use:** `snakemake_code_for_A4.pdf` as your reference while copying onto
A4 paper. It contains, in order:

- `Snakefile`
- `config.yaml`
- `scripts/sample.py`
- `scripts/plot.py`

**Steps**
1. Print or open `snakemake_code_for_A4.pdf`.
2. Copy the code onto A4 paper by hand (assignment requires handwriting).
3. Scan the pages.
4. Upload the scan to the Teams folder `Exam_Code_Submission`.

---

## 2. GitHub repo - code + README + plot

**What:** All pipeline files plus the boxplot.

**Use:** `snakemake_lln_github.zip` - unzip into a new repo and push.

The zip contains:

```
.gitignore
README.md
Snakefile
config.yaml
environment.yaml
scripts/sample.py
scripts/plot.py
results/draws_plot_n1000.png    <- the plot (with k=2000 box)
```

**Steps** (paste into a terminal on your machine):

```bash
unzip snakemake_lln_github.zip -d snakemake-lln
cd snakemake-lln
git init
git add .
git commit -m "Snakemake Law of Large Numbers pipeline"
# create an empty repo on github.com first, then:
git remote add origin https://github.com/<your-username>/<repo-name>.git
git branch -M main
git push -u origin main
```

The README explains how to reproduce the plot, how to add a `k=5000` box,
and how to test the range `1..2000` - all by editing `config.yaml` only.

---

## 3. Google submission sheet - your GitHub link

**Where:**
https://docs.google.com/spreadsheets/d/1tb67Jfj6yV4knG86zeXeGgZOXlrfuiGPURGd9XHw4e0/edit?usp=sharing

**Steps**
1. Open the sheet.
2. Find the row with your name / student ID.
3. Paste the GitHub repo URL from step 2 into the link column.

---

## Files in this output folder

| File | Goes to |
|------|---------|
| `snakemake_code_for_A4.pdf`     | Reference for handwriting -> Teams |
| `snakemake_lln_github.zip`      | Unzip and push to GitHub |
| `results/draws_plot_n1000.png`  | Already inside the zip; this is the standalone copy |
| `github_bundle/`                | Same contents as the zip, unzipped, in case you want to inspect |
| `SUBMISSION_CHECKLIST.md`       | This file |
