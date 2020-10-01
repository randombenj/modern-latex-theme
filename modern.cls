% ------------------------------------------------------------------------------
% MODERN.CLASS

%  This class provides a modern LaTeX template


\ProvidesClass{modern}[2018/11/29 Modern template class]
\NeedsTeXFormat{LaTeX2e}

% ------------------------------------------------------------------------------
% LOAD DEFAULT CLASS

\LoadClass[
  a4paper,
  12pt,
  fleqn,
  oneside,
  openany
] {report}

% ------------------------------------------------------------------------------
% PACKAGE DEFINITION

\RequirePackage[newparttoc]{titlesec} % Package to redefine the title
\RequirePackage{titletoc} % Package to style the table of contents$
\RequirePackage{afterpage}
\RequirePackage[
  a4paper,
  left = 25mm,
  right = 18mm,
  top = 40mm,
  bottom = 32mm,
  headsep = 18mm,
  headheight = 32.6pt,
  footskip = 18mm
]{geometry} % Easily enables to layout pag

\RequirePackage{fancyhdr} % Set header and footer styles
\RequirePackage{graphicx} % Enables loading images

\RequirePackage{titling}  % Get the document title for the header and footer
\RequirePackage[
  usenames,
  dvipsnames,
  svgnames,
  table
]{xcolor}    % Define colors in the document
\RequirePackage{anyfontsize}
\RequirePackage{caption}
\RequirePackage[english]
  {babel}

\RequirePackage{minted}   % Syntax highlighting
  \usemintedstyle{pastie} % Set the minted style


\RequirePackage{minitoc}
  \nomtcrule % remove the line
  \mtcsettitle{minitoc}{Inhalt}
  \setlength{\mtcindent}{-1em}
  \mtcsetfeature{minitoc}{open}{\vspace{1cm}}
  \setcounter{minitocdepth}{3}

\RequirePackage{lastpage} % To display the last page of the document
\RequirePackage{refcount}
\RequirePackage{tabularx}
\RequirePackage{tikz}
  \usetikzlibrary{shadows,calc}

\RequirePackage{subfiles}
\RequirePackage[section, acronym]{glossaries}
\RequirePackage{pdfpages}

% Align footnotes at the bottom of the page
\RequirePackage[bottom]{footmisc}
\RequirePackage{rotating}

% Set the default font size for the minted syntax
\RequirePackage{etoolbox}
\AtBeginEnvironment{minted}{
  \fontsize{8}{8}
  \selectfont
}

\RequirePackage{wrapfig}
\RequirePackage[backend=bibtex]{biblatex}
  \addbibresource{references.bib}

\RequirePackage[linktoc=all]{hyperref}
\hypersetup{
  colorlinks,
  citecolor=black,
  filecolor=black,
  linkcolor=black,
  urlcolor=black
}
% ----------
% FONT SETUP
\RequirePackage[T1]{fontenc}
% set main font to Source Serif Pro (https://www.tug.org/FontCatalogue/sourceserifproregular/)
\RequirePackage[default,light,black]{sourceserifpro}
% set sans serif font to Gyre Adventor (https://tug.org/FontCatalogue/texgyreadventor/)
\RequirePackage{tgadventor} % defines '\sfdefault'
%  monofont Droid Sans Mono (https://tug.org/FontCatalogue/droidsansmono/)
\RequirePackage[ttdefault=true]{AnonymousPro}
%\RequirePackage[defaultmono]{droidmono} % defines '\ttdefault'
\RequirePackage{tgheros} % mainfont and '\rmdefault'

\setmainfont{SourceSerifPro} % sets the roman font
\setsansfont{TEX Gyre Adventor} % sets the sans font
\setmonofont{Anonymous Pro} % sets the monospace font

% ------------------------------------------------------------------------------
% DOCUMENT PAGE SIZE

\selectlanguage{English}
\geometry{
  a4paper,
  left = 25mm,
  right = 18mm,
  top = 40mm,
  bottom = 32mm,
  headsep = 18mm,
  headheight = 32.6pt
}
\savegeometry{maingeometry}

% Remove indention
\setlength{\parindent}{0pt}

\setlength{\parindent}{0mm}
\setlength{\parskip}{2mm}

% Footnote Rule
\renewcommand{\footnoterule}{%
  \kern -3pt
  \hfill
  {\color{chaptergrey} \hrule width .6\textwidth height 0.1pt}
  \kern 2pt
}

% ------------------------------------------------------------------------------
% TABLE OF CONTENTS, LIST OF FIGURES/TABLES, GLOSSARY FORMAT

% Make the TOC, LOF, LOT headers sections instead of chapters

\makeatletter
% Table of Contents
\renewcommand\tableofcontents{
  \section*{\contentsname}
  \@mkboth{\contentsname}
    {\contentsname}
  \@starttoc{toc}
}
% List of Figures
\renewcommand\listoffigures{
  \section*{\listfigurename}
  \addcontentsline{toc}
    {section}
    {\listfigurename}
  \@starttoc{lof}
}
% List of Tables
\renewcommand\listoftables{
  \section*{\listtablename}
  \addcontentsline{toc}
    {section}
    {\listfigurename}
  \@starttoc{lof}
}
\makeatother

% remove dots in table of contents, list of tables/figures
\makeatletter
  \renewcommand\@dotsep{10000}
\makeatother

% Override the mark (because the glossary is only a section use the chapter mark)
% else, the \leftmark whould not be the chapter name
\makeatletter
  \renewcommand{\glossarymark}[1]{}
\makeatother

% This is needed to use the title and author
% in the header and footer (stylesheet)
\makeatletter

  \AtBeginDocument{

    \let\doctitle\@title
    \let\docauthor\@author
    \let\docdate\@date

    \makeglossaries
  }

\makeatother

% ------------------------------------------------------------------------------
% HEADER/FOOTER PAGE LAYOUT

\pagestyle{fancy}

\renewcommand{\chaptermark}[1]{
  \markboth{#1}{}
}

 % sets both header and footer to nothing
\fancyhf{}
% remove the header line
\renewcommand{\headrulewidth}{0pt}

\rhead{
  \bf\small\leftmark
}

% The footer shows the title, the author and the page [page]/[total pages]
\lfoot{
  \small{\docdate}
}
\cfoot{
  \small{\docauthor}
}
\rfoot{
  \small{
    \thepage /\pageref{LastPage}
  }
}

\fancypagestyle{firststyle}
{
   \fancyhf{}

   % remove the header line
   \renewcommand{\headrulewidth}{0pt}
}

\fancypagestyle{plain}{

  % sets both header and footer to nothing
  \fancyhf{}
  % remove the header line
  \renewcommand{\headrulewidth}{0pt}

  % The footer shows the title, the author and the page [page]/[total pages]
  \lfoot{
    \small{\docdate}
  }
  \cfoot{
    \small{\docauthor}
  }
  \rfoot{
    \small{
      \thepage /\pageref{LastPage}
    }
  }
}

% ------------------------------------------------------------------------------
% COLOR DEFINITION
\definecolor{chaptergrey}{rgb}{0.7,0.7,0.7}
\definecolor{okgreen}{HTML}{00B050}
\definecolor{notokgreen}{HTML}{D9E8A9}
\definecolor{lightwarnorange}{HTML}{FFFF00}
\definecolor{warnorange}{HTML}{FFC000}
\definecolor{dangerred}{HTML}{E26B0A}
\definecolor{infoblue}{HTML}{3C66FF}

% ------------------------------------------------------------------------------
% STATUS DOTS
\newcommand\ok{
  {\tikz\draw[okgreen,fill=okgreen] (0,0) circle (.5ex);}
  \hspace{2mm}
}

\newcommand\notok{
  {\tikz\draw[notokgreen,fill=notokgreen] (0,0) circle (.5ex);}
  \hspace{2mm}
}

\newcommand\lightwarn{
  {\tikz\draw[lightwarnorange,fill=lightwarnorange] (0,0) circle (.5ex);}
  \hspace{2mm}
}

\newcommand\warn{
  {\tikz\draw[warnorange,fill=warnorange] (0,0) circle (.5ex);}
  \hspace{2mm}
}

\newcommand\danger{
  {\tikz\draw[dangerred,fill=dangerred] (0,0) circle (.5ex);}
  \hspace{2mm}
}

\newcommand\pass{
  {
    \raisebox{0mm}{
      \color{okgreen}
      \faOk
    }
  }
}

\newcommand\fail{
  {
    \raisebox{0mm}{
      \color{dangerred}
      \faRemove
    }
  }
}

% ----------
% info tiles
\RequirePackage{mdframed}
\RequirePackage{xparse}

% color configuration
\definecolor{light-gray}{gray}{0.92}

% color schemes
\definecolor{purble}{HTML}{A7325D}
\definecolor{purple-light}{HTML}{E887AB}
\definecolor{purple-dark}{HTML}{440019}

\definecolor{violet}{HTML}{73287E}
\definecolor{violet-light}{HTML}{B872C2}
\definecolor{violet-dark}{HTML}{2D0133}

\definecolor{green}{HTML}{AABB38}
\definecolor{green-light}{HTML}{EDFA92}
\definecolor{green-dark}{HTML}{424C00}

\definecolor{green2}{HTML}{73AD34}
\definecolor{green2-light}{HTML}{BFEE8B}
\definecolor{green3-dark}{HTML}{264600}


\definecolor{background}{HTML}{FAFAFA}

% basic tile configuration
\newmdenv[
	skipabove=\baselineskip,
	skipbelow=.4\baselineskip,
	innertopmargin=4mm,
	innerbottommargin=\baselineskip,
	innerleftmargin=4mm,
	innerrightmargin=4mm,
	leftmargin=1mm,
	rightmargin=0mm,
	rightline=false,
	topline=false,
	bottomline=false,
	linewidth=1mm,
	backgroundcolor=background,
	frametitlefont=\sffamily,
	frametitlebelowskip=0mm,
	frametitleaboveskip=0mm,
]{tileShape}


% user commands
\newcommand{\tile}[2]
{
  \begin{tileShape}[
		linecolor=#1,
	]
		#2
	\end{tileShape}
}

\newcommand{\infoTile}[1]
	{
		\tile{light-gray}
			{#1}
	}

% ------------------------------------------------------------------------------
% FIRST PAGE FORMATING
\newcommand\firstpage[3]{

  \thispagestyle{firststyle}
  \null
  \vspace{6cm}

  {\Huge\sf\bfseries\doctitle}

  \vspace{8mm}

  {\huge\it{#1}\newline}

  {\LARGE\sf{#2}\newline}

  {\Large\sf{#3}\newline}

  \vspace{2cm}

  \newpage
}

% ------------------------------------------------------------------------------
% PART FORMATING

\renewcommand\thepart{\arabic{part}}
\titleformat{\part}[display]
  {
    \null
    \vfill
    \Huge\sf\bfseries
  }
  {                       % Formats the prefix (Title #)
    {\fontsize{80}{80}
      {\color{chaptergrey}
        \bf{Part} \bf\arabic{part}
      }
    }
  }
  {10mm}
  {                       % Formats the heading
    \Huge\sf\bfseries
  }
  [\vfill\clearpage]      % After the titleformat

% define the spacing of the parts
\titlespacing{\part}
  {0cm}
  {10cm}
  {0cm}

\newcommand{\nocontentsline}[3]{}
\newcommand{\tocless}[2]{
  \bgroup\let\addcontentsline=\nocontentsline#1{#2}\egroup
}

% this is required because else the part will create two toc entries
\newcommand\tocpart[1]{
  \tocless\part{#1}
  \addcontentsline{toc}
    {part}
    {Part \thepart \hspace{1mm} - #1}
}

% Title TOC format
\titlecontents{part}
  [0mm]                     % left margin
  {\vspace{4mm}\bf}                        % above code
  {
    \bf\thecontentslabel
    \hspace{4mm}
  }                         % numbered format
  {}                        % unnumbered format
  {                         % filler-page-format, (nothing)
    \titlerule*[0mm]{}
    \contentspage
  }[\vspace{4mm}]           % below code

% ------------------------------------------------------------------------------
% CHAPTER FORMATING
\titleformat{\chapter}[display]
  {
    \null
    \vfill
    \Huge\sf\bfseries
  }
  {}
  {10mm}
  {                       % Formats the heading
    \vspace{5mm}
    \Huge\sf\bfseries
  }
  [
    \huge\sf\doctitle
    \vfill\clearpage
  ]      % After the titleformat

% define the spacing of the parts
\titlespacing{\chapter}
  {0cm}
  {6cm}
  {0cm}

% Title TOC format
\titlecontents{chapter}
  [2mm]                     % left margin
  {}                        % above code
  {
    \bf\thecontentslabel
    \hspace{2mm}
  }                         % numbered format
  {}                        % unnumbered format
  {                         % filler-page-format, (nothing)
    \titlerule*[0mm]{}
    \contentspage
  }[\vspace{2mm}]           % below code

% ------------------------------------------------------------------------------
% TITLE FORMATING

\newcommand\resetthesectinos{
  % remove space between section numbers and section
  \renewcommand{\thesection}{\hspace{-5mm}}
  \renewcommand{\thesubsection}{\hspace{-5mm}}
  \renewcommand{\thesubsubsection}{\hspace{-5mm}}
}

% Also number subsubsections
\setcounter{secnumdepth}{3}

\titleformat{\section}
  {\LARGE\sf}               % font style
  {\thesection}             % Section prefix (numbering)
  {5mm}                     % pace between prefix and title
  {}                        % defines how the section is presented

% Title TOC format
\titlecontents{section}
  [3mm]                     % left margin
  {}                        % above code
  {
    \thecontentslabel
    \hspace{2mm}
  }                         % numbered format
  {}                        % unnumbered format
  {                         % filler-page-format, (nothing)
    \titlerule*[0mm]{}
    \contentspage
  }[\vspace{0mm}]           % below code


\titleformat{\subsection}
  {\sf\Large}      % Font style
  {\thesubsection}          % Section prefix
  {5mm}                     % Space between prefix and title
  {}                        % Defines how the section is presented

% Title TOC format
\titlecontents{subsection}
  [5mm]                     % left margin
  {}                        % above code
  {
    \thecontentslabel
    \hspace{2mm}
  }                         % numbered format
  {}                        % unnumbered format
  {                         % filler-page-format, (nothing)
    \titlerule*[0mm]{}
    \contentspage
  }[\vspace{2mm}]           % below code

\titleformat{\subsubsection}
  {\sf\large}      % Font style
  {\thesubsubsection}       % Section prefix
  {5mm}                     % Space between prefix and title
  {}                        % Defines how the section is presented


% Title TOC format
\titlecontents{subsubsection}
  [6mm]                     % left margin
  {}                        % above code
  {
    \thecontentslabel
    \hspace{2mm}
  }                         % numbered format
  {}                        % unnumbered format
  {                         % filler-page-format, (nothing)
    \titlerule*[0mm]{}
    \contentspage
  }

% ------------------------------------------------------------------------------
% GLOSSARY

\RequirePackage{nomencl}

\newglossarystyle{acronymindent}{
  \setglossarystyle{long}

  % glossary group skipp
  \renewcommand*{\glsgroupskip}{\vspace{3mm}}
  \renewenvironment{theglossary}
  {
    % bold name
    % \renewcommand{\glsnamefont}[1]{\textbf{#1}}
    \begin{longtable}[l]{@{}p{\dimexpr 1.6cm-\tabcolsep}p{0.8\hsize}}
  }
  {
    \end{longtable}
  }
}

% Make the name bold
\renewcommand{\glsnamefont}[1]{\textbf{#1}}

\newcommand\addglossary{

  \printnomenclature[2cm]
  % Akronyme
  \addcontentsline{toc}
    {section}
    {Akronyme}


  \printglossary[
    title=Akronyme,
    style=acronymindent,
    type=\acronymtype
  ]

  \newpage
  %  Glossar
  \addcontentsline{toc}
    {section}
    {Glossar}

  \printglossary[
    style=altlist,
    title=Glossar
  ]
}

% ------------------------------------------------------------------------------
% TABLE OF CONTENTS PARAGRAPH SPACING
\newcommand\addtableofcontents{
  \setlength{\parskip}{0mm}
  \tableofcontents
  \setlength{\parskip}{2mm}
}

% ------------------------------------------------------------------------------
% IMAGE AND CAPTION

% CAPTION
\definecolor{mainColor}{rgb}{0.7,0.7,0.7}
% \definecolor{mainColor}{HTML}{3C66FF}

\RequirePackage[margincaption,outercaption]{sidecap}
\sidecaptionvpos{figure}{t}
\sidecaptionvpos{table}{t}

\RequirePackage{caption}

\DeclareCaptionLabelFormat{lineLabel}{\raisebox{-.3ex}{\tikz\fill[mainColor] (0,0) rectangle (1mm, \baselineskip);}\enspace#1 #2}
\DeclareCaptionStyle{yReportCaptionStyle}{labelsep=quad, labelformat=lineLabel, singlelinecheck=false}
\captionsetup[figure]{style=yReportCaptionStyle, justification=RaggedRight, position=bottom}
\captionsetup[table]{style=yReportCaptionStyle, justification=RaggedRight, position=bottom}

\DeclareCaptionJustification{raggedouter}{\RaggedLeft}
\captionsetup[SCtable]{style=yReportCaptionStyle, justification=raggedouter}
\captionsetup[SCfigure]{style=yReportCaptionStyle, justification=raggedouter}


\captionsetup{
  font=footnotesize,
  justification=raggedright,
  singlelinecheck=false
}

% Default full width image
\newcommand\image[2]{
  \begin{figure}[H]

    \captionbox{#2\label{fig:#1}}{%
      \includegraphics[width=\textwidth]{#1}
    }

  \end{figure}
}

\newcommand\leftimage[2]{
  \begin{figure}[H]

    \captionbox{#2\label{fig:#1}}{%
      \hspace*{-28mm}
      \includegraphics[width=\textwidth+28mm]{#1}
    }

  \end{figure}
}

% Floating image (text wrap)
\newcommand\imagefloat[3]{
  \begin{wrapfigure}{r}{#3}

    \captionbox{#2\label{fig:#1}}{
      \includegraphics[width=#3]{#1}
    }

  \end{wrapfigure}
}

% Custom width image (no float)
\newcommand\imagewidth[3]{
  \begin{figure}[H]
    \centering
    \captionbox{#2\label{fig:#1}}{%
      \includegraphics[width=#3]{#1}
    }

  \end{figure}
}

\renewcommand{\arraystretch}{1.5}
\newcommand\workday[4]{
  \noindent{\begin{tabularx}{\textwidth}{ >{\hsize=.4\hsize}X >{\hsize=1.6\hsize}X }

    \bf{Datum} & {#1} \\
    \bf{Projektstatus} & {#2} \\
    \bf{Tagesablauf} & {#3} \\
    \bf{Reflexion} & {#4} \\
    \multicolumn{2}{X}{\bf{Scrum Board}} \\

    \end{tabularx}
  }
}

\newcommand{\listConfig}{
	\setlength{\topsep}{\baselineskip} % amount of extra vertical space at top of list
	\setlength{\partopsep}{0pt} % extra length at top if environment is preceded by a blank line (it should be a rubber length)
	\setlength{\parsep}{\baselineskip} % amount of vertical space between paragraphs within an item
	\setlength{\itemsep}{-3mm} % amount of extra vertical space between items
	\setlength{\leftmargin}{1cm} % horizontal distance between the left margins of the environment and the list; must be nonnegative
	\setlength{\rightmargin}{0cm} % horizontal distance betwen the right margins of the enviroment and the list; must be nonnegative
	\setlength{\itemindent}{0pt} % indentation of first line of an item; can be negative
	\setlength{\labelsep}{2mm} % separation between end of the box containing the label and the text of the first line of an item
}

% Itemized list
\newenvironment{items}
{
	\begin{list}
  {
		\textbf{•}
	}
  {
		\listConfig
	}
}
{
  \end{list}
}

% Does not work correctly, because the geometry package
% does not change the page size and messes up the next pages footer
\newenvironment{landscapepage}[1]
  {
    \newpage % Start on a new page

    \paperwidth=\pdfpageheight
    \paperheight=\pdfpagewidth
    \pdfpageheight=\paperheight
    \pdfpagewidth=\paperwidth
    \headwidth=\textheight

    \begingroup
    \vsize=\textwidth
    \hsize=\textheight

    \newgeometry{
      total={
        26cm,
        17cm,
      },
      left = 15mm,
      % right = 18mm,
      top = 20mm,
      % bottom = 32mm,
      headsep = .5mm
    }

    % Stretech header/footer across page
    \fancyhfoffset[E,O]{0pt} % Header and footer visible
  }
  {
    \restoregeometry
    \endgroup
    \newpage
    \paperwidth=\pdfpageheight
    \paperheight=\pdfpagewidth
    \pdfpageheight=\paperheight
    \pdfpagewidth=\paperwidth
    \headwidth=\textwidth
  }
