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

% \setcolors takes two arguments: %
% title color, header color %
\newcommand{\setcolors}[2]{
  \gdef\@tcolor{#1}
  \gdef\@hcolor{#2}
}

% \@tcolor returns the title color %
\def\@tcolor{
  \ClassError{recipe}{title color not provided}{}
}

% \@hcolor returns the header color %
\def\@hcolor{
  \ClassError{recipe}{header color not provided}{}
  }

% \namesection takes 1 argument: %
% name of the recipe %
\newcommand{\namesection}[1]{%
  \fontsize{35pt}{45pt}\selectfont\color[HTML]{\@tcolor}
  #1
}
