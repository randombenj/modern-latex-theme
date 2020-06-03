# **Modern** *LaTeX* pdf theme

An opinionated modern latex pdf theme for university notes/papers:

| Title page  | Typographic elements | Images |
| :------------------: | :------------------: | :------------------: |
| ![title](example/img/title-page.png) | ![typographics](example/img/typographics.png) | ![images](example/img/images.png) |


Examples of the theme are built and published as releases.
Have a look at the **[example builds](https://github.com/randombenj/modern-latex-theme/releases)**.

## Usage

### Installation

You can simply install the latex theme like this:

```sh
git clone git@github.com:randombenj/modern-latex-theme.git
# install the template
sudo cp modern-latex-theme/modern.cls /usr/local/share/texmf/tex/latex/
mktexlsr
```

If you want to use this theme with pandoc install it like this:

```sh
mkdir -p ~/.pandoc/templates
cp modern-latex-theme/latex.template ~/.pandoc/templates
```

### Use from Source

If you don't want to install the theme you need to set the `TEXINPUTS` environment variable to the location
the `modern.cls` file is in:

```sh
git clone git@github.com:randombenj/modern-latex-theme.git
export TEXINPUTS="$(pwd)/modern-latex-theme/:$TEXINPUTS"
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
