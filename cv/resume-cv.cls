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
  \vspace{1cm}
}

% \bodysection takes three arguments: %
% header title, color, and content %
\usetikzlibrary{calc}
\newcommand{\bodysection}[3]{%
  \begin{center}
  \begin{tikzpicture}[remember picture, overlay]
    \node[rectangle, fill=#2, minimum width=\paperwidth, minimum height=1.25cm, anchor=center] (box){};
    \node[rectangle, anchor=text] (name) at ($(box.west)+(2.5,-.25)$) {%
      \fontsize{18pt}{23pt}\selectfont\color{black}%
      #1
    };
    \end{tikzpicture}
  \end{center}
  \vspace{.5cm}
  #3
  \vspace{.5cm}
}

% \jobentry takes 6 arguments: %
% role, team, company, start, end, and responsibilities % 
\usepackage{xstring}
\newcommand{\jobentry}[6]{%
  \begin{adjustwidth}{-1ex}{-1ex} % to compensate for the width of the invisible border
    \noindent\begin{tabu}{ | [0pt] X[l] | [0pt] X[r] | [0pt] }
    \textbf{#1} for \textbf{#2}, #3 & \textit{#4 to #5}\\
    \end{tabu}
  \end{adjustwidth}
  \begin{flushleft}
    \noindent Core responsibilities \IfStrEq{#5}{present}{include}{included}:\\
    #6
  \end{flushleft}
}

% \edentry takes 6 arguments: %
% degree, major/area of focus, honors, institution, month, and year %
\usepackage{xstring}
\newcommand{\edentry}[6]{%
  \begin{adjustwidth}{-1ex}{-1ex} % to compensate for the width of the invisible border
    \noindent\begin{tabu}{ | [0pt] X[4,l] | [0pt] X[r] | [0pt] }
    \textbf{#1} in \textbf{#2}\IfStrEq{#3}{}{}{ (#3)}, #4 & \textit{#5}\\
    \end{tabu}
  \end{adjustwidth}
  \begin{flushleft}
    \noindent Notable projects included:\\
    #6
  \end{flushleft}
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
    #1 ``#2''. \textit{#3}, #4\IfStrEq{#5}{}{.}{: \href{#5}{#5}}
  \end{flushleft}
}
