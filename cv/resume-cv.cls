\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume-cv}
\LoadClass{article}
 
% Document settings %
\usepackage{fontspec}
\setmainfont[
  Ligatures=TeX,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic
]{Roboto}
\usepackage{geometry}
\geometry{legalpaper, portrait, margin=2.5cm}

% Header section %
\usepackage{tikz}
\usetikzlibrary{positioning}
\usepackage{anyfontsize}
\usepackage{calc}
\newcommand{\namesection}[4]{%
  \begin{tikzpicture}[remember picture, overlay]
    \node[rectangle, fill=#1, anchor=north, minimum width=\paperwidth, minimum height=5cm] (box) at (current page.north){};
    \node[rectangle, below = 1.5cm of current page.north] (name) at (current page.north){%
      \fontsize{35pt}{45pt}\selectfont\color{#2}%
      #3 #4
    };
    \node[rectangle, below = 1.5cm of name] (line) at (name){%
      \noindent\rule{\paperwidth-3cm}{0.5pt}
    };
  \end{tikzpicture}
  \vspace{1.25cm}
}

% Contact section %
\usepackage{tabu}
\newcommand{\contactsection}[3]{%
  \begin{tabu}{| [0pt] X[l] | [0pt] X[c] | [0pt] X[r] | [0pt] }
    #1 & #2 & #3\\
  \end{tabu}
}
