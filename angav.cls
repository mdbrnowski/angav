\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{angav}[2025/07/17 LaTeX Angav Document Class]

% ---------- Require LuaLaTeX ----------
\RequirePackage{iftex}
\ifLuaTeX
  % continue
\else
  \ClassError{angav}{This class requires LuaLaTeX. Please compile with 'lualatex'.}{}
\fi

% ---------- Class options ------------


% ---------- Load base class ------------
\LoadClass{scrartcl}


% ----------- Required packages ------------


% ----------- Color definitions ------------


% ----------- Hyperref setup ---------------


% -------------- Custom commands ------------


