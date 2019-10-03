
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lab_report}[2019/09/30 Lab report]

\LoadClass[14pt, a4paper, oneside, titlepage ]{extarticle}
\linespread{1.25}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1,T2A]{fontenc}
\RequirePackage[russian]{babel}

\RequirePackage[left=2cm, right=1.5cm, top=2cm, bottom=3cm]{geometry}

\RequirePackage{fancyhdr}
% Move page numbering to RHC
\fancypagestyle{plain}{ %
	\fancyhf{} % remove everything
	\renewcommand{\headrulewidth}{0pt} % remove lines as well
	\renewcommand{\footrulewidth}{0pt}
	\fancyhead[R]{\normalsize\thepage}
}
\pagestyle{plain}
\setlength{\headheight}{2cm}

\RequirePackage{titlesec}
\newcommand{\sectionbreak}{\clearpage}

% Title page arguments
\newcommand\labNumber[1]{\def\@labNumber{#1}}
\newcommand\course[1]{\def\@course{#1}}
\newcommand\variant[1]{\def\@variant{#1}}
\newcommand\group[1]{\def\@group{#1}}
\newcommand\teacher[1]{\def\@teacher{#1}}

% Title page format
\renewcommand\maketitle{
	\begin{titlepage}
		\begin{center}
			ФГБОУ ВПО Московский Государственный Технический Университет имени Баумана
			\bigbreak
			Факультет ИУ "Информатика и системы управления"\\
			Кафедра ИУ-3 "Информационные системы и телекоммуникации"
			\vfill
			{\Huge\textbf{Отчёт}\\}
			по лабораторной работе №\@labNumber\\
			по курсу "\@course"\\
			"\@title"\\
			Вариант \@variant\\
		\end{center}
		\vfill
		\begin{flushright}
			Выполнил: студент группы ИУ3-\@group\\
			\@author\\
			Проверил: \@teacher
		\end{flushright}
		\vfill
		\begin{center}
			Москва \the\year
		\end{center}
	\end{titlepage}
}

\RequirePackage{hyperref}
\RequirePackage{amsthm}

% Task environment
\newcounter{taskcounter}
\newenvironment{task}[1][]{
	\refstepcounter{taskcounter}
	\protected@edef\@currentlabelname{Задание~\thetaskcounter. #1.}
	\label{theorem:\thetaskcounter}
	\noindent\textbf{Задание~\thetaskcounter. #1.}
}{
	\medskip
}

% Auto creates task subsection based on tasks
\newcounter{taskDoneCounter}
\newcommand{\taskDoneSection}[1][]{
	\stepcounter{taskDoneCounter}
	\subsection{\nameref*{theorem:\thetaskDoneCounter}}
}

% Remove word hyphenating, skip errors for badness
\hyphenchar\font=-1
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000

\RequirePackage{listings}
\lstset{
	basicstyle=\linespread{0.5}\ttfamily\bfseries,
	breaklines=true,
	literate={\	}{{\ }}2 %remove tabs and place spaces
}

\RequirePackage{graphicx}
\RequirePackage{calc}
\graphicspath{ {./images/} }

\newlength{\imgwidth}
\newcommand\scalegraphics[1]{%   
    \settowidth{\imgwidth}{\includegraphics{#1}}%
    \setlength{\imgwidth}{\minof{\imgwidth}{\textwidth}}%
    \includegraphics[width=\imgwidth]{#1}%
}

\newcommand{\smartref}[2][Ссылка]{
	\hyperref[#2]{#1~\ref*{#2}}
}
\newcommand{\insertfigure}[3][:empty]{
	\begin{figure}[h]
		\centering
		\scalegraphics{#2}
		\caption{#3}
		\label{#1}
	\end{figure}
}

