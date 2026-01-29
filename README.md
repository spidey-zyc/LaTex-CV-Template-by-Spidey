
# Elegant Compact Resume Template (LaTeX)

一份基于 LaTeX 的紧凑型个人简历模板，专为计算机/人工智能方向学生设计。该模板优化了垂直空间利用率，支持个人照片自动比例调整，并内置了多栏对齐的自定义命令。

## 🚀 特性 (Features)

* **极致紧凑**：优化了页边距、行间距和列表间距，在一页纸内容纳更多高价值信息。
* **照片支持**：右上角照片自动保持宽高比，无需手动裁剪图片比例。
* **多栏布局**：内置 `\eduitem` 和 `\datedsubsectionWithRole` 命令，实现“左-中-右”完美对齐。
* **样式分离**：所有样式定义均封装在 `resume.cls` 中，`main.tex` 专注于内容编写。
* **中文支持**：基于 XeLaTeX 编译，支持外部字体文件配置。

## 🛠️ 环境依赖 (Prerequisites)

* **TeX 发行版**：TeX Live (推荐), MacTeX, 或 MiKTeX。
* **编译器**：必须使用 **XeLaTeX**。
* **字体文件**：需要将字体文件放入项目根目录的 `fonts` 文件夹中（见下文文件结构）。

## 📂 文件结构 (File Structure)

```text
.
├── main.tex                # [核心] 简历内容文件，在这里修改你的经历
├── resume.cls              # [核心] 样式定义文件，包含页边距、命令定义等
├── README.md               # 说明文档
├── images/
│   └── you.jpg             # 个人证件照，请确保文件名一致或在 main.tex 中修改
└── fonts/                  # 字体文件夹 (必须存在，否则报错)
    ├── Main/               # 英文字体 (如 TeX Gyre Termes)
    │   ├── texgyretermes-regular.otf
    │   ├── texgyretermes-bold.otf
    │   └── ...
    └── zh_CN-Adobe/        # 中文字体 (或其他你配置的字体)

```

## ⚡ 快速开始 (Quick Start)

1. **准备环境**：安装 TeX Live 或在 Overleaf 上新建项目。
2. **上传文件**：将 `main.tex`, `resume.cls` 以及 `images` 和 `fonts` 文件夹上传。
3. **替换照片**：将您的证件照重命名为 `you.jpg` 并覆盖 `images/` 目录下的同名文件。
4. **编译**：
* **本地编辑器 (VSCode/TeXStudio)**：选择编译器为 **XeLaTeX**。
* **Overleaf**：点击左上角 `Menu` -> `Compiler` -> 选择 `XeLaTeX`。


5. **开始写作**：打开 `main.tex` 填入您的真实信息。

## 📝 自定义命令指南 (Custom Commands)

本模板封装了几个核心命令，用于快速生成规范的排版。

### 1. 教育背景 (`\eduitem`)

用于一行内显示学校、学院/专业、成绩和时间，极大节省空间。

```latex
% 参数顺序：{学校} {学院/专业} {成绩/排名} {时间}
\eduitem{上海交通大学}{计算机学院 · 人工智能}{GPA: 89.93 (前25\%)}{2023.09 -- 至今}

```

### 2. 带职位的项目经历 (`\datedsubsectionWithRole`)

用于显示“项目名称 - 担任职位 - 时间”的三栏布局。中间的职位会自动左对齐。

```latex
% 参数顺序：{项目名称} {担任职位} {时间}
\datedsubsectionWithRole{\textbf{RAG 智能助教系统}}{项目负责人}{2025.11 -- 2025.12}

```

### 3. 照片设置 (`\yourphoto`)

在 `main.tex` 头部调用。

```latex
% 参数为照片宽度占页面宽度的比例 (0.13 约为 13%)
\yourphoto{0.13} 

```

## ⚙️ 高级配置 (Configuration)

如果您需要修改样式，请编辑 **`resume.cls`** 文件：

* **修改页边距**：找到 `\RequirePackage[...]{geometry}` 部分，调整 `top`, `bottom` 等数值。
* **修改基础字号**：修改第一行 `\LoadClass[10pt]{article}` (10pt 或 11pt)。
* **修改行间距**：调整 `\linespread{0.95}` 的数值。
* **修改各级标题字体**：调整 `\titleformat{\section}` 或 `\titleformat{\subsection}` 中的 `\large`, `\small` 等设置。

## ❓ 常见问题 (FAQ)

**Q1: 编译报错** `Package fontspec Error: The font ... cannot be found`

* **原因**：缺少字体文件或路径不对。
* **解决**：请确保项目根目录下有 `fonts` 文件夹，且内部结构与 `resume.cls` 中 `\setmainfont` 定义的路径一致。或者在 `main.tex` 中注释掉 `zh_CN-Adobefonts_external` 并启用 `zh_CN-Adobefonts_internal` 使用系统字体。

**Q2: 照片变形了？**

* **解决**：本模板已在 `resume.cls` 中强制启用了 `keepaspectratio`。如果依然变形，请检查 `resume.cls` 中是否包含 `\RequirePackage{graphicx}`。

**Q3: 想要更紧凑？**

* **解决**：在 `resume.cls` 中将 `\linespread{0.95}` 改为 `0.92`，或减小 `\titlespacing` 的数值。

---

Created based on open-source templates, customized for SJTU AI Class.

