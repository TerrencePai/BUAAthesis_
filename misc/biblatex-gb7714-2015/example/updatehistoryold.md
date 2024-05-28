
### date of update: 2018-04-03 to version v1.0k

- Changes to pkg code:

	* �������������������ƣ��Ը���֧��Ӣ/��/��/��/��/�еȶ����ԡ�(20180524)

	sorting mechanism for different languages was redesigned to improve the support of languages like english/Russian/french/japanese/korean.

	* ������һ��gbtitlelinkѡ������������ױ����ĳ����ӡ�(20180524)

	add an option gbtitlelink to set hyperlink for the reference title.

	* ���� liuhui �ȵĽ��飬�޸�textcite�����еı�㣬ȥ����/et alǰ��ͺ���Ķ��š�(20180523)

	del the comma before and after ��/et al in the cite label for command textcite��suggested by liuhui and others.

	* ���Ӷ����ݿ⣬���ݼ����������ͼ����������Ŀ���͵Ĵ�������mark��medium���Ը��õ�ʵ�ֱ�׼��Ҫ����Ŀ���ͺ���������Lee zeping��gbt7714���һ���Լ���bib�ļ��� ��20180520��
		
	add entry types��database, dataset, software, map, archive and fields: mark, medium to meet GB/T 7714-2015 betterly. the nomenclature of added entry types and fields is in keep with Pkg gbt7714 developed by Lee zeping to be compatible with bib files.

	* ������ѡ��gbfieldstd�����ڿ���һЩ������⣬��ַ����ȸ�ʽ�� ��20180515��

	add an option gbfieldstd to control the format of some fields like title, url, volume.

	* ������ѡ��gbcodegbk�����ڼ���GBK������ļ�������Դ��biblatex-caspervector�� ��20180509��

	add an option gbcodegbk to deal tex file encoded with GBK, the solution originated from biblatex-caspervector.

	* ������ѡ��gbstrict�����ڿ���bib�ļ���һЩ�������������Ŀ����Ϊ�˼���һЩbib�ļ��� ��20180509��

	add an option gbstrict to control the output of some unnecessary fields, in order to be compatible with some bib file.

	* �����������������bibauthorfont��bibtitlefont��bibpubfont�����ڿ������ױ������ߡ����⡢��������������ɫ����20180427��

	add 3 font set cmds��bibauthorfont��bibtitlefont��bibpubfont to control the font and color of author��title��and publication items.

	* �����˱�ע����authornumcite�������ڱ�ע��ǩ��ͬʱ������ߺ�˳����롣��20180427��

	add a citation cmd��authornumcite to print author and numeric number at the same time.


	* ������gbpunctinѡ����ڿ���inbook�������Ƿ����������Դ����ǰ��//���ţ���Ҫ��Ϊ�����û����ơ�

	add an option gbpunctin to control the output of // before bookauthor for entry types like inbook.

	* ����������������Դ������Ϊeditor�ǳ������ε����⣬����ܼ򵥵����������bookauthor�Ͳ���������⣬������ǰһֱû�з��֣�������־�����������л��

	correct a bug that the editor appears twice for the entry with booktitle's bookauthor is editor, which is reported by Yang zhihong,3ks!

	* ������github�ϵ�wiki��

	WIKI on github was accomplished.

	* ������gbnamefmt�е�һЩС����

	correct some flaws for gbnamefmt option.

	* �޸��˴������ڼ���3.11�汾

	change the separator before related block for v3.11.

	* ҳ�뷶Χ�ļ������en dash��Ϊhyphen

	change the pages range separator from en dash to hyphen.
		
	* ������v3.7���ϰ汾��ר�������й������ں���������⣬��bug���������빫������û��ʹ��printtext�����첽�������ƻ����¡�

	correct a bug of newsdate in patent for biblatex >v3.7, which added an additional dot before urldate caused by broken asynchronous punctuation .

	* ������texlive2017���ϰ汾��beamer���б��������������⣬����beamer���bibmacro\{title\}��patch�����������ͬ����ͨ�ĵ��࣬��bug������beamer������patch�����ݷ����仯���¡�

	correct a bug of punctuation after title with beamer for >texlive2017, the bug is caused by the update of beamer.
		
### date of change: 2018-01-20 to version v1.0j
* Changes to pkg code:
	- "*.bbx": add an option `gbtype` to control the type and carrier identifier after title.
    - "*.bbx": change the version code switch mechanism.
    - "*.bbx": change the option align to `gbalign` for standardising option terminology.
    - "*.bbx": add an option `gbnamefmt` to control the letter case and format of author's name��and eliminate the comma in author names of the chinese references exported from cnki by `zotero`��these demand raised by liuxiaotao.
    - "*.bbx": correct the delimiter between author and year for author-year style with right using of the `\nameyeardelim`
	- "*.bbx": add an cmd `\yearcite` to print year info only for author-year style when author has been written manually.
    
### date of change: 2017-11-21 to version v1.0i
* Changes to pkg code:
    - "*.bbx": add a new solution for multi-language bibliography based on related entry other than the old @set method for biblatex version >3.8, because biblatex(>v3.8) does not copy info from its first member any longer.
	- "*.bbx": correct a bug of entry's title with `\LaTeX{}` macro reported by liubenyuan. this bug is raised in CJK char check function when StrChar from xtring pkg to extract chars. 
    - "*.bbx": deal compatibility problem of author-year style for biblatex v>3.8a, include `labeldate`->`labeldateparts` and `DeclareSortingScheme` -> `DeclareSortingTemplate`.
    - "*.bbx": change the version check macro,using macro form pkg xstring. change version switch method, define version's code first then switch depend on the biblatex version.
	- "*.bbx": replace the `\iffieldundef{year}` by `\iffieldequalstr{year}{}` in `\newbibmacro*{modifydate}`, for the year field is defined with empty string for biblatex version >3.7 after biber dealing with none date info.
	- "*.bbx": change the date format control mechanism for biblatex version >3.7, lower versions keep the old fansion.
	- "*.bbx": rewrite the volume and number parsing macro using `xstring` pkg.
	- "*.bbx": correct a bug with option `gbnoauthor` when book entry has none author.
* Changes to documentation:
	- biblatex-gb7714-2015.tex: revise this document 


### date of change: 2017-04-11 to version v1.0h
* Changes to pkg code:
    - "*.bbx": deal compatibility problem of author year style for texlive2017, because the old cmd `printdateextralabel` with biblatex3.4 has been replaced by `printlabeldateextra` with biblatex3.7 in texlive2017.
    - "*.bbx": change the seperator between multi-language reference text from cmd par to cmd newline for the gb7714-2015 align style
	- "*.bbx": fix a flaw reported by Lee Zeping. remove the comma between `journaltitle` and (number) when the volume is undefined.
    - "*.bbx": add an option `gbpub` to control the publishing info. if `gbpub=false`, publishing info's format is the biblatex standard style, otherwise is gb7714-2015 style. The origin idea comes from Wayne08.
    - "*.bbx": fix a flaw reported by zjsdut@163.com. remove the dot before url when url is the only info available��
    - "*.bbx": add an option gbnoauthor for author-year style. when author is undefined, set option gbnoauthor=true then author with "����"or"NOAUTHOR" will be defined. note that with biblatex version 3.7 or higher for multiple DeclareStyleSourcemap support, code can be simplifed, because the realization code now with texlive2016(biblatex 3.4) is subjected to the one DeclareStyleSourcemap constraint.
* Changes to documentation:
	- biblatex-gb7714-2015.tex: revise this document 
	- *.bib: correct a warning which is caused by long multi-line url info.
    
    
### date of change: 2017-02-26 to version v1.0g
* Changes to pkg code:
	- "*.bbx": deal the compatibility problem for some entrytypes: `mastersthesis`,`phdthesis`,`www`,`electronic`,`standard`,`techreport`,`conference`, and `newspaper`. these entrytypes can be used in the source bib file.
	- "*.bbx": for online type, the revised/changed date is denoted by date/enddate/eventdate
	- "*.bbx": modify the usera field's format, taking into account the standard style's package option url, proposed by Sheng Wenbo.
	- "*.bbx": add a no breakthinspace after the entrytype identifier (like [M]//) to make the next word break correctly
    - "*.bbx": add a feature for automatically dealing with special character(like &/%/#)��compatibility with texlive2015 is done
* Changes to documentation:
	- biblatex-gb7714-2015.tex: revise this document and add some explication
	- *.bib: refine the bib source file
* Changes to tool code:
	- "*.pl": realize the feature of transformation from gb7714-2015 style bibography text to bib file using perl script gb7714texttobib.pl


### date of change: 2016-12-31 to version v1.0f

* Changes to pkg code:
	- "*.bbx": use function iffieldequalstr instead of customized function for testing the value of note field eqs standard/news
	- "*.bbx": deal the compatibility problem for texlive2015, include:
		1. DeclareBibliographyOption of biblatex 3.0 in texlive2015 cmd has no type argument
		2. pkg xstring is not loaded with biblatex 3.0 in texlive2015
		3. new defined bibliography environment with gb7714-2015 label align sytle not works
* Changes to documentation:
	- biblatex-gb7714-2015.tex: add an explaination for the author field input format


### date of change: 2016-12-07 to version v1.0e

* Changes to pkg code:to fix a few bugs
	- "*.bbx": add overwite option when map keywords field with note field
	- "*.bbx": modify the punction after publisher in gb7714-2015.bbx
	- "*.bbx": modify some newbibmacro* to renewbibmacro* to eleminate warnings
	- "*.bbx": add a package option align=right,left,gb7714-2015 for users to choose numeric label align style
	- "*.cbx": restore the origin parencite definition for users to use superscript citecmd(cite) and inline citecmd(parencite) in one document
* Changes to documentation:
	- biblatex-gb7714-2015.tex: add a summary of the features of the package and a compile guide
	- *.bib: refine the bib database
* Changes to tool code:
	- *.sh/bat: add the autoexec files for windows/linux OS 

### date of change: 2016-11-24 to version v1.0d

* Changes to pkg code:to fix a few bugs to work with beamer class correctly
	- "*.bbx": redefine the DeclareFieldFormat for title to eleminate the redundant dot after title in beamer class
	- "*.bbx": add some comment in drivers to eleminate the needless space

* Changes to documentation:
	- biblatex-gb7714-2015.tex: revise this document and add some explication


### date of change: 2016-11-14 to version v1.0c

* Changes to pkg code:to fix a few bugs
	- "*ay.bbx": add noauthor or "����" for the authoryear style
	- "*ay.bbx": add some map cmds to automatically fill the userb field for sorting of the authoryear style
	- "*ay.bbx": add a command yearpagescite for the authoryear style
	- "*.bbx": add a dot after the null publisher with nothing followed
	- "*.bbx": modify the english local string backrefpage to chinese "����ҳ:"
	- "*ay.bbx": add some options such as uniquelist,labeldate,uniquename for the authoryear style

* Changes to documentation:
	- biblatex-gb7714-2015.tex: revise this document.

### date of change: 2016-11-11 to version v1.0b

* Changes to pkg code:to match the GBT7714-2015 standard
	- "*.bbx": change a few local strings from english.blx such as bibliography,references
	- "*.bbx": set new maxnamenumber for authoryear style
	- "*.bbx": add translator field and modify version format for report and manual driver 
	- "*.bbx": remove the space before edition/version field, which was brought in with testCJKfirst function

* Changes to documentation:
	- biblatex-gb7714-2015.tex: correct a few flaws and add more instructions.
	- "*.bib":: refine some entries


### date of change: 2016-10-23 to version v1.0a

* Changes to pkg code:
	- "*.bbx","*.cbx": add some information like version information.

* Changes to documentation:
	- biblatex-gb7714-2015.tex: correct a few flaws .
	- paperone.bib: refine some entries.
