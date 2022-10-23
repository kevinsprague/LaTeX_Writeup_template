\ProvidesClass{writeup}[CTF Writeup]
\LoadClass[11pt, letterpaper]{article}
\usepackage[letterpaper, portrait, margin=1in]{geometry}
\usepackage{xparse}
\usepackage{setspace}
\usepackage{xcolor}
\usepackage{caption}
\usepackage{listings}
\usepackage{graphicx}

\definecolor{codebg}{rgb}{0.95, 0.95, 0.95}
\definecolor{codepurple}{rgb}{0.5,0,0.5}
\definecolor{codegreen}{rgb}{0, 0.5, 0}
\definecolor{codered}{rgb}{0.5, 0, 0}

\lstset{
        escapeinside={(*@}{@*)},
        breaklines=true,
        basicstyle=\ttfamily \small,
        showspaces=false,
        showstringspaces=false,
        numbers=left,
        backgroundcolor=\color{codebg},
        keywordstyle=\color{codepurple},
        commentstyle=\color{codered},
        }

%%%%%%%%%%%%%%%% Variables %%%%%%%%%%%%%%%%%
\def \author#1{\def\@author{#1}}
\def \@author {}
\def \challenge#1{\def\@challenge{#1}}
\def \ctf#1{\def\@ctf{#1}}

\makeatletter
\def\maxwidth{%
  \ifdim\Gin@nat@width>\linewidth
    \linewidth
  \else
    \Gin@nat@width
  \fi
}

\def \printheader{
      \begin{center} 
        \titlesize{\underline{\textbf{{\@ctf} {\@challenge} Walkthrough}}} \\ 
        \vspace{6pt}
       \large Author: \@author 
        \end{center}
      \bigbreak
}


\let\ori@document=\document
\renewcommand{\document}{
    %Set the file to automatically print the header
    \ori@document
    \printheader
    \vspace{8pt}
}
%works:
\newcommand{\summary}[1]{\begin{center}\Large\textbf{Summary}\end{center}#1 \bigbreak}

\newenvironment{walkthrough}
{
    \Large\begin{center}\textbf{Walkthrough}\end{center}
    \newcounter{stepnum}\setcounter{stepnum}{1}
}{}
\newenvironment{conclusion}
{
    \Large\begin{center}\textbf{Conclusions}\end{center}
    \normalsize
}{}

\newenvironment{references}
{
    \Large\begin{center}\textbf{References}\end{center}
    \normalsize
    \begin{itemize}
}{\end{itemize}}
\newcommand{\reference}{\item[-]}
\newcommand{\codefile}[2][]{
    \minipage{\dimexpr\textwidth-2em}
        \lstinputlisting[#1]{#2}
    \endminipage
}

\newcommand{\image}[2][]{
    \begin{center}
    \minipage{\dimexpr\textwidth-2em}
    \centering
        \includegraphics[width=\maxwidth]{#2}
        \captionof{figure}{#1}
    \endminipage
    \end{center}
}

\newcommand{\codeimage}[4][]{
    \begin{center}
        \minipage{\dimexpr\textwidth-2em}
        \centering
            \codefile[#1]{#2}
            \includegraphics[width=\maxwidth]{#3}
            \captionof{figure}{#4}
        \endminipage
    \end{center}
}
\newcommand{\highlight}[2]{\colorbox{#1}{#2}}
\lstnewenvironment{codebox}[1][]{\lstset{#1}\minipage{\dimexpr\textwidth-2em}}{\endminipage}
\newcommand{\step}{\large\textbf{\subsection*{Step \arabic{stepnum}}}\stepcounter{stepnum}}
\def\titlesize{\huge}

