\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{recipe}
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
\usepackage{xcolor}
\usepackage{xifthen}

% \setcolors takes three arguments: %
% title banner color, header color, and text color %
\newcommand{\setcolors}[3]{ %
  \gdef\@bcolor{#1}
  \gdef\@hcolor{#2}
  \gdef\@tcolor{#3}
} %

% \@bcolor returns the banner color %
\def\@bcolor{ %
  \ClassError{recipe}{banner color not provided}{}
} %

% \@tcolor returns the text color %
\def\@tcolor{ %
  \ClassError{recipe}{text color not provided}{}
} 

% \@hcolor returns the header color %
\def\@hcolor{ %
  \ClassError{recipe}{header color not provided}{}
} %

% \namesection takes 1 argument: %
% name of the recipe %
\usepackage{tikz}
\usetikzlibrary{positioning}
\usepackage{anyfontsize}
\usepackage{calc}
\newcommand{\namesection}[1]{ %
  \definecolor{background}{HTML}{\@bcolor}
  \begin{tikzpicture}[remember picture, overlay]
    \node[rectangle, fill=background, anchor=north, minimum width=\paperwidth, minimum height=5cm] (box) at (current page.north){};
    \node[rectangle, below = 1.5cm of current page.north] (name) at (current page.north){%
      \fontsize{35pt}{45pt}\selectfont\color[HTML]{\@tcolor}
      #1
    };
    \end{tikzpicture}
} %
