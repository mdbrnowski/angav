%%
%% Angav v0.1.0
%% Copyright (c) 2025 Michał Dobranowski
%%

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
\newif\ifangav@pretty\angav@prettyfalse
\newif\ifangav@answers\angav@answersfalse

\DeclareOption{pretty}{\angav@prettytrue}
\DeclareOption{answers}{\angav@answerstrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax


% ---------- Load base class ------------
\LoadClassWithOptions{scrartcl}


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


% ----------- Required packages ------------
\RequirePackage{mathtools}  % loads amsmath
\RequirePackage{amssymb}
\RequirePackage{amsthm,thmtools}

\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{tikz}
\usetikzlibrary{math,shapes.geometric,calc,positioning,fit,decorations.markings}
\tikzset{>=latex}
\RequirePackage{tkz-euclide}
\RequirePackage{nicematrix}
\NiceMatrixOptions{
  custom-line={letter=I, tikz=densely dashed, total-width=\pgflinewidth},
  custom-line={letter=S, tikz=solid, total-width=\pgflinewidth}
}
\RequirePackage{minted}
\setminted{
  style=tango,
  frame=lines,
  framesep=2mm,
  fontsize=\footnotesize
}
\RequirePackage{booktabs}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{relsize}  % for \mathlarger
\RequirePackage{yhmath}  % for \arc
\RequirePackage{esint}  % for nicer \idotsint

\RequirePackage{marginalia}
\marginaliasetup{style={\footnotesize}}

\RequirePackage[color=ColAccBad,textsize=footnotesize]{todonotes}

\RequirePackage{fontsetup}  % loads fontspec and New Computer Modern
\RequirePackage[lining]{raleway}  % loads Raleway sans serif font
\setmonofont{JetBrainsMono}[Scale=0.85]  % you need to have JetBrains Mono installed
\RequirePackage{microtype}
\RequirePackage{csquotes}
\RequirePackage{babel}


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
  \newcommand{\angav@theoremname}{Twierdzenie}
  \newcommand{\angav@lemmaname}{Lemat}
  \newcommand{\angav@corollaryname}{Wniosek}
  \newcommand{\angav@examplename}{Przykład}
  \newcommand{\angav@remarkname}{Uwaga}
  \newcommand{\angav@definitionname}{Definicja}
  \newcommand{\angav@factname}{Fakt}
  \newcommand{\angav@problemname}{Problem}
}{
  \newcommand{\angav@solutionname}{Solution}
  \newcommand{\angav@theoremname}{Theorem}
  \newcommand{\angav@lemmaname}{Lemma}
  \newcommand{\angav@corollaryname}{Corollary}
  \newcommand{\angav@examplename}{Example}
  \newcommand{\angav@remarkname}{Remark}
  \newcommand{\angav@definitionname}{Definition}
  \newcommand{\angav@factname}{Fact}
  \newcommand{\angav@problemname}{Problem}
}


% ----------- Custom environments ---------------
\newenvironment{solution}{\begin{proof}[\angav@solutionname]\small}{\normalsize\end{proof}}

\ifangav@pretty
  \RequirePackage[framemethod=TikZ]{mdframed}
  \mdfdefinestyle{mdtheorembox}{
    skipabove=12pt,
    skipbelow=2pt,
    linewidth=0.75pt,
    innerbottommargin=9pt,
    linecolor=BoxColor1,
    backgroundcolor=BoxColor1!5,
    nobreak=true
  }
  \declaretheoremstyle[
    headfont=\sffamily\bfseries\color{BoxColor1},
    mdframed={style=mdtheorembox},
    headpunct={\\[3pt]},
    postheadspace={0pt}
  ]{theorembox}
  \mdfdefinestyle{mdexamplebox}{
    skipabove=8pt,
    linewidth=2pt,
    rightline=false,
    leftline=true,
    topline=false,
    bottomline=false,
    linecolor=BoxColor2,
    backgroundcolor=BoxColor2!5,
    nobreak=true
  }
  \declaretheoremstyle[
    headfont=\sffamily\bfseries\color{BoxColor2},
    bodyfont=\normalfont\small,
    mdframed={style=mdexamplebox},
    headpunct={\\[3pt]},
    postheadspace={0pt}
  ]{examplebox}
  \mdfdefinestyle{mdremarkbox}{
    skipabove=8pt,
    linewidth=2pt,
    rightline=false,
    leftline=true,
    topline=false,
    bottomline=false,
    linecolor=black,
    backgroundcolor=black!3,
  }
  \declaretheoremstyle[
    headfont=\sffamily\bfseries,
    bodyfont=\normalfont\small,
    mdframed={style=mdremarkbox},
    headpunct={\\[3pt]},
    postheadspace={0pt}
  ]{remarkbox}
\else
  \declaretheoremstyle[headfont=\bfseries,bodyfont=\normalfont,spaceabove=\topsep,spacebelow=\topsep]{theorembox}
  \declaretheoremstyle[headfont=\bfseries,bodyfont=\normalfont,spaceabove=\topsep,spacebelow=\topsep]{examplebox}
  \declaretheoremstyle[headfont=\bfseries,bodyfont=\normalfont,spaceabove=\topsep,spacebelow=\topsep]{remarkbox}
\fi

\theoremstyle{definition}
\declaretheorem[style=theorembox,name=\angav@theoremname,numberwithin=section]{theorem}
\declaretheorem[style=theorembox,name=\angav@theoremname,numbered=no]{theorem*}
\declaretheorem[style=theorembox,name=\angav@lemmaname,sibling=theorem]{lemma}
\declaretheorem[style=theorembox,name=\angav@lemmaname,numbered=no]{lemma*}
\declaretheorem[style=theorembox,name=\angav@corollaryname,sibling=theorem]{corollary}
\declaretheorem[style=theorembox,name=\angav@corollaryname,numbered=no]{corollary*}
\declaretheorem[style=examplebox,name=\angav@examplename,sibling=theorem]{example}
\declaretheorem[style=examplebox,name=\angav@examplename,numbered=no]{example*}
\declaretheorem[style=remarkbox,name=\angav@remarkname,sibling=theorem]{remark}
\declaretheorem[style=remarkbox,name=\angav@remarkname,numbered=no]{remark*}
\declaretheorem[name=\angav@definitionname,sibling=theorem]{definition}
\declaretheorem[name=\angav@definitionname,numbered=no]{definition*}
\declaretheorem[name=\angav@factname,sibling=theorem]{fact}
\declaretheorem[name=\angav@factname,numbered=no]{fact*}
\declaretheorem[name=\angav@problemname,sibling=theorem]{problem}
\declaretheorem[name=\angav@problemname,numbered=no]{problem*}


% -------------- Custom commands ------------
\newcommand{\vocab}[1]{\emph{\color{MainColor}#1}}

\DeclareMathOperator{\cis}{cis}
\DeclareMathOperator*{\lcm}{lcm}
\DeclareMathOperator{\rank}{rank}
\newcommand{\opname}{\operatorname}

\newcommand{\floor}[1]{\left\lfloor #1 \right\rfloor}
\newcommand{\ceiling}[1]{\left\lceil #1 \right\rceil}
\newcommand{\ol}{\overline}
\newcommand{\ul}{\underline}
\newcommand{\arc}{\wideparen}
\newcommand{\eps}{\varepsilon}
\newcommand{\dg}{^\circ}
\renewcommand{\d}[1]{\ensuremath{\operatorname{d}\!{#1}}}
\newcommand{\p}[1]{\ensuremath{\partial{#1}}}
\newcommand{\ddx}{\frac{\d{}}{\d x}}
\newcommand{\dforall}[1]{\displaystyle\mathop{\mathlarger{\mathlarger{\forall}}}_{#1}\ }
\newcommand{\dexists}[1]{\displaystyle\mathop{\mathlarger{\mathlarger{\exists}}}_{#1}\ }
\newcommand{\dexistsone}[1]{\displaystyle\mathop{\mathlarger{\mathlarger{\exists!}}}_{#1}\ }

\newcommand{\NN}{{\symbb N}}
\newcommand{\ZZ}{{\symbb Z}}
\newcommand{\QQ}{{\symbb Q}}
\newcommand{\RR}{{\symbb R}}
\newcommand{\CC}{{\symbb C}}
\newcommand{\KK}{{\symbb K}}

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


% -------------- Page setup ------------
\addtokomafont{subtitle}{\Large}
\setkomafont{author}{\Large}
\setkomafont{date}{\small}
\setkomafont{caption}{\small}
\providecommand{\thetitle}{\@title}
\providecommand{\theauthor}{\@author}
\providecommand{\thedate}{\@date}
\RequirePackage[headsepline]{scrlayer-scrpage}
\renewcommand{\headfont}{}
\addtolength{\textheight}{3.14cm}
\setlength{\footskip}{0.5in}
\setlength{\headsep}{10pt}
\automark{section}
\ihead{\footnotesize\theauthor}
\chead{}
\ohead{\footnotesize\textbf{\thetitle}}
\cfoot{\pagemark}


% -------------- Answers ------------
\ifangav@answers
  \RequirePackage{answers}
  \renewcommand{\solutionextension}{out}

  \Newassociation{hint}{hintitem}{hints}
  \Opensolutionfile{hints}
  \newcommand{\makehints}{\Closesolutionfile{hints}\input{hints.out}}

  \Newassociation{answer}{hintitem}{answers}
  \Opensolutionfile{answers}
  \newcommand{\makeanswers}{\Closesolutionfile{answers}\input{answers.out}}
\fi
