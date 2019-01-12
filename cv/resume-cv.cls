\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume-cv}
\LoadClass{article}

% Global settings
\usepackage{fontspec}
\setmainfont[
  Ligatures=TeX,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic
]{Roboto}

% Header section
\usepackage{tikz}
\usepackage{anyfontsize}
\newcommand{\namesection}[4]{%
  \begin{tikzpicture}[remember picture, overlay]
    \node[rectangle, fill=#1, anchor=north, minimum width=\paperwidth, minimum height=5cm] (box) at (current page.north){};
    \node[rectangle, anchor=center] at (box){%
      \fontsize{40pt}{50pt}\selectfont\color{#2}%
      #3 #4%
    }; 
  \end{tikzpicture}
}

