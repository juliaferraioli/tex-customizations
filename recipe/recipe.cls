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
} %

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
    \node[rectangle, fill=background, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node[rectangle, below = 1.5cm of current page.north] (name) at (current page.north){ %
      \fontsize{35pt}{45pt}\selectfont\color[HTML]{\@tcolor}
      #1
    };
  \end{tikzpicture}
  \vspace{2cm}
  \linebreak
} % 

% \narration takes one argument: %
% the description of the recipe %
\newcommand{\narration}[1]{ %
  \fontsize{12pt}{14pt}\selectfont\color[HTML]{000000}
  #1
  \vspace{1cm}
} %

% \ingredients prints the ingredients header %
\usetikzlibrary{calc}
\newcommand{\ingredients}[0]{ %
  \definecolor{background}{HTML}{\@hcolor}
  \begin{center}
    \begin{tikzpicture}[remember picture, overlay]
      \node[rectangle, fill=background, minimum width=\paperwidth, minimum height=1.5cm, anchor=center] (box){};
      \node[rectangle, anchor=text] (name) at ($(box.west)+(2.5,-.25)$){ %
        \fontsize{18pt}{24pt}\selectfont\color[HTML]{\@tcolor}
        Ingredients
      };
    \end{tikzpicture}
  \end{center}
  \vspace{1cm}
} %

% \ingredientitem takes three arguments: %
% name of the ingredient, quantity of the ingredient, and type of measurement %
\newcommand{\ingredientitem}[3]{ %
  \fontsize{10pt}{12pt}\selectfont\color[HTML]{000000}
  #1: #2 #3
} %
