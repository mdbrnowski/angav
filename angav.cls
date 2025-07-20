\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{angav}[2025/07/17 LaTeX Angav Document Class]

% ---------- Require LuaLaTeX ----------
\RequirePackage{iftex}
\ifLuaTeX
  % continue
\else
  \ClassError{angav}{This class requires LuaLaTeX.}{}
\fi

% ---------- Class options ------------
\newif\ifangav@polish
\angav@polishfalse

% \DeclareOption{xyz}{\angav@xyztrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax


% ---------- Load base class ------------
\LoadClassWithOptions{scrartcl}


% ----------- Required packages ------------
\RequirePackage{mathtools,amssymb,amsthm}

\RequirePackage{multirow}
\RequirePackage{multicol}

\RequirePackage{marginalia}
\marginaliasetup{style={\footnotesize}}

\RequirePackage{fontsetup}  % loads fontspec and New Computer Modern
\RequirePackage[lining]{raleway}  % loads Raleway sans serif font
\setmonofont{JetBrainsMono}[Scale=0.85]
\RequirePackage{microtype}

\RequirePackage{babel}

% ----------- Color definitions ------------
\RequirePackage[svgnames]{xcolor}
% todo: change color names
\definecolor{AccColor1}{HTML}{C41E3A}     %#C41E3A
\definecolor{AccColor2}{HTML}{233F8D}     %#233F8D
\definecolor{AccColor3}{HTML}{D19820}     %#D19820
\definecolor{AccColor4}{HTML}{148670}     %#148670

\colorlet{ColAccGood}{AccColor4}          %#148670
\definecolor{ColAccBad}{HTML}{D14B20}     %#D14B20

\colorlet{MainColor}{AccColor1}           %#C41E3A
\definecolor{LinkColor1}{HTML}{329B71}    %#329B71
\colorlet{LinkColor2}{AccColor2}          %#233F8D

\definecolor{BoxColor1}{HTML}{081D56}     %#081D56
\definecolor{BoxColor2}{HTML}{A8760F}     %#A8760F

% ----------- Hyperref setup ---------------
\RequirePackage[colorlinks=true,hypertexnames=false,pdfusetitle]{hyperref}
\hypersetup{
  urlcolor=LinkColor1,
  linkcolor=LinkColor2,
  citecolor=LinkColor2
}

% ----------- Localization ---------------
\iflanguage{polish}{
  \babelprovide[transforms=oneletter.nobreak]{polish}
  \AtBeginDocument{
    % you can still use \le and \ge for the standard versions
    \renewcommand{\leq}{\leqslant}
    \renewcommand{\geq}{\geqslant}
    \renewcommand{\nleq}{\nleqslant}
    \renewcommand{\ngeq}{\ngeqslant}
    \renewcommand{\preceq}{\preccurlyeq}
    \renewcommand{\succeq}{\succcurlyeq}
  }
}{}

\iflanguage{polish}{
  \newcommand{\angav@solutionname}{Rozwiązanie}
}{
  \newcommand{\angav@solutionname}{Solution}
}

% ----------- Custom environments ---------------
\newenvironment{solution}{\begin{proof}[\angav@solutionname]\small}{\end{proof}}

% -------------- Custom commands ------------
\newcommand{\vocab}[1]{\emph{\color{MainColor}#1}}

\DeclareMathOperator{\cis}{cis}
\DeclareMathOperator*{\lcm}{lcm}
\DeclareMathOperator{\rank}{rank}

\newcommand{\sA}{{\symcal A}}
\newcommand{\sB}{{\symcal B}}
\newcommand{\sC}{{\symcal C}}
\newcommand{\sD}{{\symcal D}}
\newcommand{\sF}{{\symcal F}}
\newcommand{\sG}{{\symcal G}}
\newcommand{\sH}{{\symcal H}}
\newcommand{\sL}{{\symcal L}}
\newcommand{\sM}{{\symcal M}}
\newcommand{\sO}{{\symcal O}}
\newcommand{\sP}{{\symcal P}}
\newcommand{\sR}{{\symcal R}}
\newcommand{\sS}{{\symcal S}}

\newcommand{\scA}{{\symscr A}}
\newcommand{\scB}{{\symscr B}}
\newcommand{\scC}{{\symscr C}}
\newcommand{\scD}{{\symscr D}}
\newcommand{\scE}{{\symscr E}}
\newcommand{\scF}{{\symscr F}}
\newcommand{\scG}{{\symscr G}}
\newcommand{\scH}{{\symscr H}}

\newcommand{\km}{{\symscr m}}
\newcommand{\kp}{{\symscr p}}
\newcommand{\kq}{{\symscr q}}

\AtBeginDocument{
    \renewcommand{\Re}{\operatorname{Re}}
    \renewcommand{\Im}{\operatorname{Im}}
}
