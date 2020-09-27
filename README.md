# 复旦大学研究生latex模板

根据研究生[课程设计](classthesis/classfdu.pdf)与[周报](reportthesis/reportfdu.pdf)排版需求，编写的latex模板

## 文件结构导引

### 课程设计

课程设计涉及到的主要文件(按依赖关系由上而下)：
-- classthesis/(根目录)
--- FDU.cfg    % 预定义文件
--- fdubib.bst % bib版式
--- bib/database.bib % 导入bibtex
--- fduthesis.cls % tex版式文件
--- figures/ % 图片文件夹
--- classfdu.tex % tex文件
--- classfdu.pdf % tex编译后生成的pdf文件

如果刚刚入门latex，那么你仅对database.bib, classfdu.tex与figures/文件夹有可读可写权限，其余文件仅可读，不慎修改可能导致不可控的错误。

### 周报

课程设计涉及到的主要文件(按依赖关系由上而下)：

-- reportthesis/(根目录)
--- RFDU.cfg    % 预定义文件
--- fdubib.bst % bib版式
--- bib/database.bib % 导入bibtex
--- fdureport.cls % tex版式文件
--- figures/ % 图片文件夹
--- reportfdu.tex % tex文件
--- reportfdu.pdf % tex编译后生成的pdf文件

如果刚刚入门latex，那么你仅对database.bib, reportfdu.tex与figures/文件夹有可读可写权限，其余文件仅可读，不慎修改可能导致不可控的错误。

## 使用指南

### 基本使用

推荐使用 texlive + texstudio

- 通过texstudio打开template文件，进行毕业论文主体写作

- 推荐使用bib进行文献管理，用文本编辑器打开database.bib，插入文献引用(可通过谷歌学术获取)。

- 编译流程为

xelatex classfdu.tex(F5)
bibtex classfdu.aux(F8)
xelatex classfdu.tex(F5)
补充说明: 第一步编译后会在同级文件夹下生成template.aux，使用texstudio打开(文件类型选择all files)，按F8编译(或下拉悬浮栏的Tools找到Bibliography)。 之后需要再对classfdu.tex进行编译，才能看到正确的文献引用。

### 小工具推荐

作为一个相信技术改变生活的肥宅，自然是不愿意手动敲公式啦

#### 著名的数学OCR公式识别

欢迎使用fdu邮箱注册mathpix snip~
[注册链接](https://accounts.mathpix.com/signup?referral_code=PsQY22tjw3)

#### 表格生成

在线的表格生成网站
[tablesgenerator](https://www.tablesgenerator.com/)

不过表格生成我用的比较少，一般还是自己手敲，如果是有现成的excel才会考虑生成

### 致谢&参考站点

本模板主要改自于兰州大学本科生毕业设计模板（因为复旦的毕设模板全lua脚本有秀到我...tql改不动...），以下是递归参考站点列表

- [suchot 2017毕设模板](https://github.com/suchot/LZUThesis2017)
- [VealM 2020毕设模板](https://github.com/VealM/LZUthesis2020)
- [yuh 2020毕设模板](https://github.com/yuhlzu/LZUThesis2020)
- [fdu 毕设模板](https://github.com/stone-zeng/fduthesis)
  
如果希望学习latex的使用，推荐根据1 3模板的主文件进行学习，介绍详尽且全面。
如果觉得本模板有用也不要吝啬你的star~
有问题或建议pull issues~我有空来改（但估计会鸽...这学期真的好忙...忙到系统梳理下latex知识框架的时间都没有...）

