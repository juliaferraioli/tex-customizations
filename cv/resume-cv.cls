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
\usepackage{xcolor}
\usepackage{xifthen}

% \namesection takes four arguments: %
% fill color, text color, first name, last name %
\usepackage{tikz}
\usetikzlibrary{positioning}
\usepackage{anyfontsize}
\usepackage{calc}
\newcommand{\namesection}[4]{%
  \definecolor{background}{HTML}{#1}
  \begin{tikzpicture}[remember picture, overlay]
    \node[rectangle, fill=background, anchor=north, minimum width=\paperwidth, minimum height=5cm] (box) at (current page.north){};
    \node[rectangle, below = 1.5cm of current page.north] (name) at (current page.north){%
      \fontsize{35pt}{45pt}\selectfont\color[HTML]{#2}%
      #3 #4
    };
    \node[rectangle, below = 1.5cm of name] (line) at (name){%
      \color[HTML]{#2}\noindent\rule{\paperwidth-3cm}{1pt}
    };
  \end{tikzpicture}
  \vspace{1.25cm}
}

% \contactsection takes up to 4 arguments: %
% text color, left, center, and right, aligned respectively %
\usepackage{changepage}
\usepackage{tabu}
\newcommand{\contactsection}[4]{%
  \begin{adjustwidth}{1cm}{1cm}
    \begin{center}
      \color[HTML]{#1}\begin{tabu}{ | [0pt] X[l] | [0pt] X[c] | [0pt] X[r] | [0pt] }
        #2 & #3 & #4 \\
      \end{tabu}
    \end{center}
  \end{adjustwidth}
  \vspace{1cm}
}

% \bodysection takes three arguments: %
% header title, background color, text color, and content %
\usetikzlibrary{calc}
\newcommand{\bodysection}[4]{%
  \definecolor{background}{HTML}{#2}
  \begin{center}
    \begin{tikzpicture}[remember picture, overlay]
      \node[rectangle, fill=background, minimum width=\paperwidth, minimum height=1.25cm, anchor=center] (box){};
      \node[rectangle, anchor=text] (name) at ($(box.west)+(2.5,-.25)$) {%
        \fontsize{18pt}{23pt}\selectfont\color{#3}%
        #1
      };
    \end{tikzpicture}
  \end{center}
  \vspace{.5cm}
  #4
  \vspace{.5cm}
}

% \jobentry takes 6 arguments: %
% role, team, company, start, end, and responsibilities % 
\usepackage{xstring}
\newcommand{\jobentry}[6]{%
  \begin{adjustwidth}{-1ex}{-1ex} % to compensate for the width of the invisible border
    \noindent\begin{tabu}{ | [0pt] X[l] | [0pt] X[-.75,r] | [0pt] }
      \textbf{#1}\ifthenelse{\isempty{#2}}{}{ for \textbf{#2}}\ifthenelse{\isempty{#3}}{ & \textit{#4 to #5}}{, #3 & \textit{#4 to #5}} \\
    \end{tabu}
  \end{adjustwidth}
  \begin{flushleft}
    #6
  \end{flushleft}
}

% \edentry takes up to 7 arguments: %
% degree, major/area of focus, honors, institution, month, year, and projects %
\usepackage{xstring}
\newcommand{\edentry}[7]{%
  \begin{adjustwidth}{-1ex}{-1ex} % to compensate for the width of the invisible border
    \noindent\begin{tabu}{ | [0pt] X[3,l] | [0pt] X[r] | [0pt] }
      \textbf{#1} in \textbf{#2}\ifthenelse{\isempty{#3}}{}{ (#3)}, #4 & \textit{#5} \\
    \end{tabu}
  \end{adjustwidth}
  \ifthenelse{\isempty{#6}}{}{
    \begin{flushleft}
      \vspace{-.25cm}\textit{With a focus in #6}
    \end{flushleft}
  }

  \ifthenelse{\isempty{#7}}{}{
    \begin{flushleft}
      \noindent Notable projects included:\\
      #7
    \end{flushleft}
  }
}

% \skillentry takes 2 arguments: %
% category and free-form description of skill(s) (will be rendered as plain text) %
\newcommand{\skillentry}[2]{%
  \begin{flushleft}
    \textbf{#1:} #2\\
  \end{flushleft}
}

% \pubentry takes 5 arguments: %
% author(s), title, book/proceedings/etc... title, date, link %
\usepackage{hyperref}
\hypersetup{
  colorlinks=false,
}
\newcommand{\pubentry}[5]{%
  \begin{flushleft}
    #1 ``#2''. \textit{#3}, #4\ifthenelse{\isempty{#5}}{.}{: \href{#5}{#5}}
  \end{flushleft}
}