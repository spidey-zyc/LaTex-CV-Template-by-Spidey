\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2025/01/29 Custom Resume Class]
\LoadClass[11pt]{article}

% ==============================================================================
% 基础宏包加载
% ==============================================================================
% 禁用缩进
\setlength{\parindent}{0pt}
% XeTeX 支持
\RequirePackage{xltxtra}
% 逻辑控制
\RequirePackage{xifthen}
% 图标字体
\RequirePackage{fontawesome}
% 颜色支持
\RequirePackage[usenames,dvipsnames]{xcolor}
% 图片支持 (新增)
\RequirePackage{graphicx}
% 绘图支持 (用于绝对定位照片，新增)
\RequirePackage{tikz}

% ==============================================================================
% 字体设置
% ==============================================================================
\RequirePackage{fontspec}
% 主英文字体设置 (保留原模板逻辑)
\setmainfont[
  Path = fonts/Main/ ,
  Extension = .otf ,
  UprightFont = *-regular ,
  BoldFont = *-bold ,
  ItalicFont = *-italic ,
  BoldItalicFont = *-bolditalic ,
  SmallCapsFont = Fontin-SmallCaps
]{texgyretermes}

% ==============================================================================
% 页面布局与间距 (已修改为紧凑模式)
% ==============================================================================
\RequirePackage[
	a4paper,
	top=1.2cm, 
	bottom=1.2cm, 
	left=1.2cm, 
	right=1.2cm,
	nohead
]{geometry}

% 全局行间距 (紧凑)
\linespread{0.95}

% ==============================================================================
% 标题格式设置 (titlesec)
% ==============================================================================
\RequirePackage{titlesec}

% 一级标题 (\section) - 修改为 \large (大号)
\titleformat{\section} 
  {\large\scshape\raggedright} 
  {}{0em} 
  {} 
  [\titlerule]
% 一级标题间距 - 更加紧凑
\titlespacing*{\section}{0cm}{1.2ex plus .2ex minus .2ex}{0.5ex plus .2ex}

% 二级标题 (\subsection) - 修改为 \small (小号) + 加粗
\titleformat{\subsection}
  {\small\bfseries\raggedright}
  {}{0em}
  {}
% 二级标题间距
\titlespacing*{\subsection}{0cm}{0.8ex plus .2ex minus .2ex}{0.2ex plus .2ex}

% ==============================================================================
% 列表格式设置 (enumitem)
% ==============================================================================
\RequirePackage{enumitem}
% 去除列表间隙，左缩进 2em
\setlist{noitemsep} 
\setlist[itemize]{topsep=0.2ex, parsep=0ex, partopsep=0ex, leftmargin=2em}
\setlist[enumerate]{topsep=0.2ex, parsep=0ex, partopsep=0ex, leftmargin=2em}

% ==============================================================================
% 辅助命令定义
% ==============================================================================

% 引用上标支持
\RequirePackage[super]{nth}

% 原始日期章节命令 (保留兼容性)
\newcommand{\datedsection}[2]{%
  \section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{%
  \subsection[#1]{#1 \hfill #2}%
}
\newcommand{\datedline}[2]{%
  {\par #1 \hfill #2 \par}%
}

% ==============================================================================
% 个人信息模块 (已调整字体大小)
% ==============================================================================

% 姓名：从 \Huge 改为 \huge
\newcommand{\name}[1]{
  \centerline{\huge\scshape{#1}} 
  \vspace{1.2ex}
}

% 联系方式：从 \large 改为 \normalsize
\newcommand{\contactInfo}[2]{
  \centerline{\sffamily\normalsize{\ 手机：{#1} \textperiodcentered\ \ 邮箱：{#2}}} 
  \vspace{1.2ex}
}

% 其他信息：从 \large 改为 \normalsize
\newcommand{\otherInfo}[4]{
  \centerline{\sffamily\normalsize{\ {#1}}
    \ifthenelse{\isempty{#2}}{ }{\textperiodcentered\ \ {#2} }
    \ifthenelse{\isempty{#3}}{ }{\textperiodcentered\ \ {#3} }
    \ifthenelse{\isempty{#4}}{ }{\textperiodcentered\ \ {#4} }
  }
  \vspace{0.7ex}
}

% 照片：已修改为保持纵横比 (keepaspectratio)
\newcommand{\yourphoto}[1]{
  \hfill \smash{\includegraphics[width={#1}\paperwidth, keepaspectratio]{images/you.jpg}}
}

% 角色/子标题描述
\newcommand{\role}[2]{
  {\par \textit{#1} ~ #2 \par}
  \vspace{0.5ex}
}

% ==============================================================================
% 新增自定义命令 (您之前在 .tex 中添加的)
% ==============================================================================

% 三栏子标题 (项目名 - 职位 - 时间)
\newcommand{\datedsubsectionWithRole}[3]{%
  \subsection[#1]{%
    #1 \hfill 
    \makebox[0pt][l]{\hspace{-9cm} #2 }% 保持您习惯的定位方式
    \makebox[0pt][r]{\textnormal{#3}}%
  }
}

% 教育背景四栏显示
% 参数：#1 学校 | #2 学院/专业 | #3 成绩 | #4 时间
\newcommand{\eduitem}[4]{%
  {% 开启局部分组
    \small % 强制使用 small 字号
    \textbf{#1} \hfill #2 \hfill #3 \hfill #4%
  }% 关闭分组
  \vspace{0.5ex}%
}

% ==============================================================================
% 【新增】全局正文大小设置
% ==============================================================================
% 在文档开始时自动执行 \small，将全局正文设定为小号字体
\AtBeginDocument{\small}

\endinput