# **Modern** *LaTeX* pdf theme

An opinionated modern latex pdf theme for university notes/papers.

Examples of the theme are built and published as releases.
Have a look at the **[example builds](https://github.com/randombenj/modern-latex-theme/releases)**.

## Installation

To install the template and all necessary fonts simply use `make install`

## Usage

You need to set the `TEXINPUTS` environment variable to the location
the `modern.cls` file is in:

```sh
export TEXINPUTS="/path/to/modern-latex-theme/:$TEXINPUTS"
```

You can use the template in your *LaTeX* document like this:

```tex
\documentclass{modern}

\begin{document}

...

\end{document}

```

To generate a pdf with pandoc simply run the following command:

```sh
pandoc \
  --template=latex.template \
  --pdf-engine=lualatex \
  --pdf-engine-opt="-shell-escape" \
  -o [OUTPUT.pdf] [INPUT.md]
```
