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
\usepackage{longtable}

% \namesection takes four arguments: %
% fill color, text color, first name, last name %
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

% \contactsection takes up to 3 arguments: %
% left, center, right, aligned respectively %
\usepackage{changepage}
\usepackage{tabu}
\newcommand{\contactsection}[3]{%
\begin{adjustwidth}{1cm}{1cm}
  \begin{center}
    \begin{tabu}{ | [0pt] X[l] | [0pt] X[c] | [0pt] X[r] | [0pt] }
      #1 & #2 & #3\\
    \end{tabu}
  \end{center}
  \end{adjustwidth}
  \vspace{1.25cm}
}

% \bodysection takes three arguments: %
% header title, color, and content %
\newcommand{\bodysection}[3]{%
  \begin{center}
  \begin{tikzpicture}[remember picture, overlay]
    \node[rectangle, fill=#2, minimum width=\paperwidth, minimum height=1.5cm, anchor=center] (box){};
    %at (current bounding box){};
    \node[rectangle] (name) at (box) {%
      \fontsize{20pt}{25pt}\selectfont\color{black}%
      #1
    };
    \end{tikzpicture}
  \end{center}
  \vspace{1.25cm}
  #3
}

% \jobentry takes 6 arguments: %
% role, team, company, start, end, and responsibilities % 
\usepackage{xstring}
\newcommand{\jobentry}[6]{%

  \begin{adjustwidth}{-1ex}{-1ex} % to compensate for the width of the invisible border
    \noindent\begin{tabu}{ | [0pt] X[l] | [0pt] X[r] | [0pt] }
    #1 for #2, #3 & #4 to #5\\
    \end{tabu}
  \end{adjustwidth}

  \begin{flushleft}
    \noindent Core responsibilities \IfStrEq{#5}{present}{include}{included}:\\
    #6
  \end{flushleft}
}
