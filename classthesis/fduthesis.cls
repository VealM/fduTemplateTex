\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{LZUthesis}[2017/9/10 V0.1 Thesis for LZUer]
\LoadClass[cs4size, a4paper, UTF8, openany, hyperref, chinese,oneside]{ctexbook}
\AtEndOfPackage{\input{FDU.cfg}}  %很关键的一个文件
%                                          --基于 szsdk修改
%  LZU.cls  ---thanks for  https://github.com/szsdk/LZUthesis/blob/master/LZU.cls

%=======footnote
%尾注
%=======footnote
\RequirePackage[perpage, bottom]{footmisc}

%%=======page
%页面边距
%论文页边距一般要求：上边距2.5cm、下边距2.5cm,左边距2.5cm,右边距2.0cm,页眉页脚1.5cm。
%%=======page
\RequirePackage[top=2.5cm, bottom=2.5cm,outer=2.5cm, inner=2.0cm, headheight=1.5cm, footskip=1.5cm, heightrounded]{geometry}


%=======package
%数学宏包
%图像宏包
%颜色宏包
%字体宏包
%=======package
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{graphicx}
\graphicspath{{figures/}{figure/}{pictures/}
      {picture/}{pic/}{pics/}{image/}{images/}}
\RequirePackage[svgnames]{xcolor}
\RequirePackage{mathptmx}% %Times New Roman字体
\RequirePackage{float}%控制图片位置 参数H
\setCJKfamilyfont{yahei}{微软雅黑}
\RequirePackage[T1]{fontenc}

\RequirePackage{booktabs}

%=======head and foot
%页眉页脚
%=======head and foot
\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\RequirePackage{etoolbox}
\pagestyle{fancy}          % Enables the custom headers/footers

% 前置页版式
\fancypagestyle{frontmatterstyle}{ 
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}

    \fancyfoot{} % clear all footer fields
    %\fancyfoot[C]{\thepage} %
    \cfoot[C]{\thepage}
    \renewcommand{\thepage}{\Roman{page}}
}
\appto\frontmatter{\pagestyle{frontmatterstyle}}

\DeclareOption{doublelines}{
    \def\LZU@doublelines {}
}
\ProcessOptions\relax

\fancypagestyle{mainmatterstyle}{
    \fancyhf{}
    \lhead{\zihao{-5}复旦大学课程论文}%
    \rhead{\zihao{-5}\@title}
    % Footers
    \fancyfoot{} % clear all footer fields
    \cfoot[C]{\thepage}
    \renewcommand\headrule{ \kern 0.8pt \hrule width \hsize height 0.3pt}
}

\appto\mainmatter{\pagestyle{mainmatterstyle}}
\appto\mainmatter{\linespread{1.3889}\selectfont}   %行距
\fancypagestyle{plain}{
    \thispagestyle{mainmatterstyle}
}
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{empty}}}



%=======format
%标题样式
%
%=======format
\usepackage[font=small]{caption}

\RequirePackage[titles]{tocloft}
\renewcommand\cftchapdotsep{0.5} 				%虚线间隔
\renewcommand\cftdotsep{0.5} 					%虚线间隔
\renewcommand{\cftchapafterpnum}{\vspace{6pt}} %章节间隔 ，节前6磅
\setlength{\cftbeforesecskip}{6pt}				%章节间隔 ，节前6磅
\renewcommand\cftchapfont{\zihao{4}}
\renewcommand\cftsecfont{\zihao{-4}}
\renewcommand\cftsubsecfont{\zihao{-4}}
\renewcommand\cftchappagefont{\mdseries}
\setlength\cftbeforetoctitleskip{24pt}
\setlength\cftaftertoctitleskip{18pt}


%%=======information
% 标题页信息
%
%%=======information
\newtoks\advisor
\newtoks\college
\newtoks\major
\newtoks\grade
\newtoks\id
\newtoks\titlextra %标题多余一行时添加
%=======english title
\newtoks\entitle
\newtoks\entitletra %标题多余一行时添加
%%=======statement
%标题页
%需要添加循环函数，判定多于一行的情况
%%=======statement

\RequirePackage{array}
\def\LZU@underline[#1]#2{%
    \underline{\hbox to #1{\hfill#2\hfill}}}
\def\LZUunderline{\@ifnextchar[\LZU@underline\underline}

\RequirePackage{makecell}
%\RequirePackage{pgffor}
\RequirePackage{forloop}
\RequirePackage{xstring}
\renewcommand\maketitle{%
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
        \includegraphics[width=8cm]{fdu.png}\\
        \vspace*{21.8pt}
        {\yahei \fontsize{28bp}{0pt}\ziju{0}{\LZU@label@thesis\\}}
        \vspace{21.8pt}
        %{\zihao{4}\yahei（本\ 科\ 生）}
        \par
        \zihao{3}
        \def\tabcolsep{6pt}
        \expandarg
        \newcounter{title_str_number}
        \vspace*{50pt}
        \begin{tabular}{ll}
            \bfseries \songti \LZU@label@titleZh
            %\textbf{\LZU@label@titleZh}
            \forloop{title_str_number}{1}{\value{title_str_number}<6}{%
                \StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]%
                \IfStrEq{\mygroup}{}{}{%
                    & {\StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]\LZUunderline[258pt]{\bfseries \songti\fontspec{Times New Roman}\zihao{3}\mygroup}}\\[0.40cm]%
                }%
            }%
            \bfseries \songti \LZU@label@titleEn
            %\textbf{\LZU@label@titleEn}
            \forloop{title_str_number}{1}{\value{title_str_number}<6}{%
                \StrFindGroup{\the\entitle}{\value{title_str_number}}[\mygroup]%
                \IfStrEq{\mygroup}{}{}{%
                    & {\StrFindGroup{\the\entitle}{\value{title_str_number}}[\mygroup]\LZUunderline[258pt]{\fontspec{Times New Roman-Bold}\zihao{3}\mygroup}}\\[0.40cm]%
                }%
            }%
        \end{tabular}
            \begin{tabular}{cc}
            \\ \hspace*{\fill} \\        
            {\songti \LZU@label@author} &
            {\LZUunderline[258pt]{\songti \zihao{3}\@author}}\\[0.40cm]
            { \songti \LZU@label@advisor} &
            {\LZUunderline[258pt]{ \songti \zihao{3}  \the\advisor}} \\[0.40cm]
            { \songti \LZU@label@college} &
            {\LZUunderline[258pt]{ \songti  \zihao{3} \the\college}} \\[0.40cm]
            { \songti \LZU@label@major} &
            {\LZUunderline[258pt]{ \songti  \zihao{3} \the\major}}\\[0.40cm]
            { \songti \LZU@label@grade} &
            {\LZUunderline[258pt]{ \songti \zihao{3}  \the\grade}}\\[0.40cm]
            { \songti \LZU@label@id} &
            {\LZUunderline[258pt]{ \songti \zihao{3}  \the\id}}\\[0.40cm]
        \end{tabular}
        %\par
        %\vspace{70pt}
        %{\yahei \ziju{0.3}\zihao{3}\LZU@label@schooladdress }
    \end{center}
    \clearpage
}
\newcommand\makestatement{
    \newcommand\fifth{0.2\textwidth}
    \newcommand\middlespace{0.08\textwidth}

    \thispagestyle{empty}
%\cleardoublepage
    \baselineskip 22.5pt
    \parskip 0pt

    \begin{center}
        {\bfseries\songti\zihao{3}{诚信责任书}}
    \end{center}

    本人郑重声明:本人所呈交的学位论文,是在导师的指导下独立进行研究所取得的成果。毕业论文（设计）中凡引用他人已经发表或未发表的成果、数据、观点等, 均已明确注明出处。除文中已经注明引用的内容外, 不包含任何其他个人或集体已经发表或在网上发表的论文。

    本声明的法律责任由本人承担。

    \vskip1cm

    \begin{center}
        \begin{tabular*}{\textwidth}{rm{\fifth}lm{\fifth} cm{\fifth}rp{\fifth}lm{\fifth}}
            论\hfill 文\hfill 作\hfill 者\hfill 签\hfill 名 ：&\LZUunderline[\fifth]{} & \hspace{\middlespace} & 日\hfill 期：&\LZUunderline[\fifth]{}
        \end{tabular*}
    \end{center}

    \vskip2.0cm

    \begin{center}
        {\bfseries\songti\zihao{3}{关于毕业论文（设计）使用授权的声明}}
    \end{center}

    本人在导师指导下所完成的论文及相关的职务作品，知识产权归属兰州大学。本人完全了解兰州大学有关保存、使用毕业论文的规定，同意学校保存或向国家有关部门或机构送交论文的纸质版和电子版，允许论文被查阅和借阅；本人授权兰州大学可以将本毕业论文的全部或部分内容编入有关数据库进行检索，可以采用任何复制手段保存和汇编本毕业论文。本人离校后发表、使用毕业论文或与该论文直接相关的学术论文或成果时，第一署名单位仍然为兰州大学。

    本学位论文研究内容：

    $\square$ 可以公开

    $\square$ 不宜公开，已在学位办公室办理保密申请，解密后适用本授权书。

    （请在以上选项内选择其中一项打“$\surd$”）

    \vskip2cm
    \begin{center}
        \begin{tabular*}{\textwidth}{rm{\fifth}lm{\fifth}cm{\fifth}rp{\fifth}lm{\fifth}}
            论\hfill 文\hfill 作\hfill 者\hfill 签\hfill 名 ：&\LZUunderline[\fifth]{} & \hspace{\middlespace} &  导\hfill 师\hfill 签\hfill 名 ：&\LZUunderline[\fifth]{} \\
            日\hfill 期：&\LZUunderline[\fifth]{} & \hspace{\middlespace} & 日\hfill 期：&\LZUunderline[\fifth]{}
        \end{tabular*}
    \end{center}
    \clearpage
}



%=======abstract
%摘要页
%
%=======abstract
\newcommand{\ZhAbstract}[2]{%
    \phantomsection
    \addcontentsline{toc}{chapter}{中文摘要}
    \thispagestyle{frontmatterstyle}
   % \thispagestyle{empty}
   %\thispagestyle{plain}
   %\setcounter{page}{1}
   % \pagenumbering{Roman}
    \begin{center}%
        \setlength{\parskip}{24pt}
        \begin{minipage}{0.8\textwidth}
            \linespread{1.3889}
            \centering
            \zihao{2}\heiti\bfseries \noindent\@title\the\titlextra%
        \end{minipage}
    \end{center}%
    \begin{center}%
        \linespread{1}
        \setlength{\parskip}{24pt}
%        \zihao{3}\heiti \bfseries 摘\phantom{空}要   %  要求效果
        \zihao{3}\heiti  中文摘要    				  %事例页面表现效果
    \end{center}%
    \setlength{\baselineskip}{20pt} 
    \selectfont
    \setlength{\parskip}{0pt}
    \vspace{10pt}
    \par #1\\%
    \vbox{}\\
    {\songti \bfseries 关键词：} #2
    \newpage
}

\newcommand{\EnAbstract}[2]{%
    \phantomsection
    \addcontentsline{toc}{chapter}{英文摘要}
    %\thispagestyle{frontmatterstyle}
    % \thispagestyle{empty}
    \thispagestyle{plain}
   \setcounter{page}{1}
    \pagenumbering{Roman}
    \begin{center}%
        \setlength{\parskip}{24pt}
        \begin{minipage}{0.8\textwidth}
            \linespread{1}
            \selectfont
            \centering
            \zihao{2} \bfseries \noindent \expandafter\MakeUppercase\expandafter{\the\entitle\ \the\entitletra}%
        \end{minipage}
    \end{center}%
    \begin{center}%
        \linespread{1}
        \selectfont
        \setlength{\parskip}{24pt}
        \zihao{3}\fontspec{Arial}\bfseries Abstract%
    \end{center}%
    \setlength{\parskip}{0pt}
    \setlength{\baselineskip}{20pt} %行距20磅
    \selectfont
    \vspace{11pt}
    \par #1\\%
    \vbox{}\\
    {\bfseries Key Words:} #2
    \newpage
}



%%=======space
\newcommand\LZUspace{\phantom{永}}


%=======appendix
%附录页和感谢页
%
%=======appendix
\newcommand{\Appendix}{%

    \setcounter{section}{0}
    \renewcommand{\thechapter}{A}%

\clearpage
\phantomsection
	\addcontentsline{toc}{chapter}{附\qquad 录}
    \chapter*{附 \LZUspace\LZUspace 录}
    \zihao{5}
}

\newcommand{\Thanks}{%
\clearpage
\phantomsection
	\addcontentsline{toc}{chapter}{致\qquad 谢}
    \chapter*{致\LZUspace\LZUspace 谢}
    \zihao{-4}\fangsong
}

\newcommand{\Intro}{%
\clearpage
\phantomsection
	\addcontentsline{toc}{chapter}{引\quad 言}
    \chapter*{引\LZUspace\LZUspace 言}
    \zihao{-4}

}
%---------------------------
%超链接
%---------------------------
\RequirePackage[unicode,psdextra]{hyperref} % Required for hyperlinks
\hypersetup{hidelinks,breaklinks=true,bookmarksopen=false}
%自动写入pdf信息
\AtBeginDocument{
    \hypersetup{
        pdftitle = {\@title},
        pdfauthor = {\@author},
        pdfsubject = {兰州大学本科毕业论文}
    }
}


\RequirePackage[nameinlink]{cleveref}
\crefformat{equation}{#2式(#1)#3}
\crefformat{figure}{#2图#1#3}
\crefformat{table}{#2表#1#3}
\crefformat{chapter}{#2第\zhnumber{#1}章#3}
\crefformat{section}{#2#1节#3}
\crefformat{subsection}{#2#1小节#3}
\crefformat{subsubsection}{#2#1小节#3}


%---------------------------
%论文成绩
%---------------------------
\RequirePackage{tabularx}
\newtoks \supervisorcomment
\newtoks \recommendedgrade
\newtoks \supervisorsignature
\newtoks \committeecomment
\newtoks \finalgrade
\newcommand{\Grade}{
\clearpage
\phantomsection
\thispagestyle{empty}
%\addcontentsline{toc}{chapter}{论文（设计）成绩}
\begin{center}
    \zihao{-3}\bfseries\songti
    \begin{tabularx}{\textwidth}{|X|}
        \multicolumn{1}{c}{\zihao{3}\heiti\mdseries 毕业论文（设计）成绩}\\
        \hline
        导师评语\\%
        \centerline{%
            \begin{minipage}[t][10cm][t]{0.92\textwidth}
                \setlength\parindent{\ccwd}
                \zihao{-4} \the \supervisorcomment   
            \end{minipage}}\\
        {\heiti\mdseries 建议成绩}\LZUunderline[80pt]{\the \recommendedgrade}\hfill {\heiti\mdseries 指导教师（签字）}\LZUunderline[80pt]{
\the \supervisorsignature}\\
        \hline
        {\heiti\mdseries 答辩委员会意见}\\
\centerline{%
            \begin{minipage}[t][2cm][t]{0.92\textwidth}
                \setlength\parindent{\ccwd}
                \zihao{-4} \the\committeecomment
            \end{minipage}}
        \hfill {\heiti\mdseries 答辩委员会负责人（签字）}\underline{\hspace{80pt}}\\
        \hline
        \\[2.3cm]
        {\heiti\mdseries 成}\LZUspace\LZUspace {\heiti\mdseries 绩}\LZUunderline[80pt]{\the \finalgrade}\hfill {\heiti\mdseries 学院（盖章）}\underline{\hspace{80pt}}\\
        \hfill{\zihao{-4}\heiti\mdseries 年\hspace{20pt}月\hspace{20pt}日}\\
        \hline
    \end{tabularx}
\end{center}
\newpage
}



%\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{empty}}}

%item style
\usepackage{enumitem}
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}




%======%math theorem
% 英文名称改为汉字
%
%======%math theorem
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\theorembodyfont{\rmfamily\songti}
\theoremheaderfont{\rmfamily\heiti}
\theoremsymbol{\ensuremath{\square}}
\newtheorem*{proof}{证明}
\theoremstyle{plain}
\theoremsymbol{}
\qedsymbol{\ensuremath{\square}}
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{conjecture}{猜想}[chapter]

\crefname{theorem}{定理}{定理}
\crefname{assumption}{假设}{假设}
\crefname{definition}{定义}{定义}
\crefname{proposition}{命题}{命题}
\crefname{lemma}{引理}{引理}
\crefname{theorem}{定理}{定理}
\crefname{axiom}{公理}{公理}
\crefname{corollary}{推论}{推论}
\crefname{example}{例}{例}
\crefname{remark}{注释}{注释}
\crefname{conjecture}{猜想}{猜想}



%---------------------------
%程序伪代码实现
%---------------------------
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\floatname{algorithm}{算法}  
\renewcommand{\algorithmicrequire}{\textbf{输入:}}  
\renewcommand{\algorithmicensure}{\textbf{输出:}}  




%---------------------------
%程序代码展示
%---------------------------
%\RequirePackage{listings}
%\RequirePackage{courier}
%\lstset{
%    basicstyle=\rmfamily\normalsize,
%    rulesepcolor= \color{gray}, %代码块边框颜色
%    breaklines=true,  %代码过长则换行
%    numbers=left, %行号在左侧显示
%    numberstyle= \small,%行号字体
    %keywordstyle= \color{red},%关键字颜色
%    commentstyle=\color{gray}, %注释颜色
%    frame=shadowbox,%用方框框住代码块
%    columns=flexible
%    }

\RequirePackage{listings}

\lstset{
 breaklines=true, %对过长的代码自动换行
 columns=fixed,       
 numbers=left,                                        % 在左侧显示行号
 numberstyle=\tiny\color{gray},                       % 设定行号格式
 frame=none,                                          % 不显示背景边框
 backgroundcolor=\color[RGB]{245,245,244},            % 设定背景颜色
 keywordstyle=\color[RGB]{40,40,255},                 % 设定关键字颜色
 numberstyle=\footnotesize\color{darkgray},           
 commentstyle=\it\color[RGB]{0,96,96},                % 设置代码注释的格式
 stringstyle=\rmfamily\slshape\color[RGB]{128,0,0},   % 设置字符串格式
 showstringspaces=false,                              % 不显示字符串中的空格
 language=tex,   
 alsolanguage=[ANSI]C, %可以添加很多个alsolanguage,如alsolanguage=matlab,alsolanguage=VHDL等
 alsolanguage=python,
 alsolanguage=java,
 alsolanguage=XML,
 alsolanguage=c++,
 alsolanguage=matlab,
}






  
%改变图表的编号格式
\renewcommand{\thefigure}{\thechapter-\@arabic\c@figure}
\renewcommand{\thetable}{\thechapter-\@arabic\c@table}   


%%=======%
%参考文献
%=======%
\newtoks\bibdatabase
\RequirePackage{ }
\newcommand{\printbib}{
\zihao{5}
\bibliographystyle{fdubib}
%\bibliographystyle{unsrt}
\clearpage
\phantomsection
\addcontentsline{toc}{chapter}{参考文献}
\bibliography{\the \bibdatabase}
}


\endinput
%%
%% End of file `fduthesis.cls'.
