Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.101.248.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779309;
	b=XQxlnj1GnlpN4M8TbgxKb8kM28TWXMn9NdPW+J79cHaaitRWfW0neCJXfykizQANYK58
	 BW0famdzdygvMuh/uolOxo3+AvX4qSRIr9YuxO0uId7evCsrMXnCZ1Me5FZw8NGmS6+K2
	 e+CjxRvUqYT9VznPWciPmlu3w27JfitBd6eFhOhJldEa/K/79XMuBbIPyXIF8fvSY+KqB
	 v7JmlG691zpRmegil/5VBNxwGMm0cVn4LujVwB9JqtP77bPaMqEtZiPSaHm6by3rnN3pk
	 2oGBSle/uGYP8Wr8z7EHtASP0T3PGq9bE/U3vMkyvdBlMOob+DULOK9Rzhwhapot58Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779309;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=20OFjXqDAUFebxhfRbSk3AMkASKLgpy3vc0uSMo1PbI=;
	b=i6M9xtmwMbeOW79YElQSr/YXWpbPG0861POZ0EvLkspGV56x4NJFIF4GEAnEqCdo+n4N
	 yKxVJk/9MGoWEuIK8CBF+RvIC7Q+B0nZAVwz24lMHDqmjgMQ33kQ5VBTrBYmdTm6zk8Ww
	 TE6ZXfb2fdPAVR4+9B3bR6dGSLz3qvktB5fMCA/vhzTzFzAxBAt3xFn0o+RmLJe1MkrZ9
	 4T6x3Cy2pye1gHLMTT2wxxc5My1jqFcynUAqfA8nQNjqX5XM8O4ZCOXnwr5xTTZE9GUsy
	 dyD0T7cVNMuDqEBBacjks7ELOYwY/9JD65Iy11w41XmlS8ZZi/Sz3nZEkyuBkoY1quQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=46.101.248.176
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net (zg8tndyumtaxlji0oc4xnzya.icoremail.net [46.101.248.176])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E925C606A333;
	Wed,  4 Nov 2026 08:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E925C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMDmLqVa5upqb1VvAQ--.34315S2;
	Wed, 04 Nov 2026 16:01:30 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAX3zhI5upqAXAcAA--.20243S3;
	Wed, 04 Nov 2026 16:01:23 +0800 (CST)
Message-ID: <ed42999d-9a78-40f6-a961-7711d834c95f@hust.edu.cn>
Date: Wed, 4 Nov 2026 16:01:21 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] docs/zh_CN: update sphinx.rst translation
To: Jiandong Qiu <qiujiandong1998@gmail.com>, alexs@kernel.org,
 si.yanteng@linux.dev, wy@wyuan.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1793279600.git.qiujiandong1998@gmail.com>
 <e349e9ea6a9c7ad38f3fd2220ca51f26db102354.1793279600.git.qiujiandong1998@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <e349e9ea6a9c7ad38f3fd2220ca51f26db102354.1793279600.git.qiujiandong1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMDmLqVa5upqb1VvAQ--.34315S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoW3ur4fJw45Cw45Kr47CrW8tFb_yoW8Xr4UGo
	WIk3yrCw10kw15Jw1rK3ySy3W8CF4fGF4xAa1UGw1a9F1UCr1rtw1rGw43XrWfCrZ8GF15
	AFy3ZF18AFn8Aa98n29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOL7k0a2IF6FyUM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xv
	wVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxV
	WUAVWUtwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY
	07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI
	0_Gr1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4U
	JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2
	xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2Iq
	xVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jDkucUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/29/26 9:29 PM, Jiandong Qiu wrote:
> Update zh_CN translation of doc-guide/sphinx.rst.
>
> Update the translation through commit f1c2db1f145b
> ("docs: move test_doc_build.py to tools/docs")
>
> - cleanup the file header anchor `_sphinxdoc_zh`
> - sync the Chinese translation with current Sphinx build requirements
> - add sections on HTML math rendering and minimum-version testing
> - refresh guidance for tables, cross-references, and commit references
>
> Signed-off-by: Jiandong Qiu <qiujiandong1998@gmail.com>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>   .../translations/zh_CN/doc-guide/sphinx.rst   | 167 ++++++++++++++----
>   1 file changed, 133 insertions(+), 34 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/doc-guide/sphinx.rst b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> index 3375c6f3a811..11e846fc97e4 100644
> --- a/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> +++ b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> @@ -1,10 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/doc-guide/sphinx.rst
>   
> -:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
> -.. _sphinxdoc_zh:
> +:译者:
> + - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> + - 裘剑东 Jiandong Qiu <qiujiandong1998@gmail.com>
>   
>   简介
>   ====
> @@ -14,7 +15,7 @@ Linux内核使用 `Sphinx <http://www.sphinx-doc.org/>`_ 来把 ``Documentation`
>   换成漂亮的文档。使用 ``make htmldocs`` 或 ``make pdfdocs`` 命令即可构建HTML
>   或PDF格式的文档。生成的文档放在 ``Documentation/output`` 文件夹中。
>   
> -reStructuredText文件可能包含包含来自源文件的结构化文档注释或kernel-doc注释。
> +reStructuredText文件可能包含来自源文件的结构化文档注释或kernel-doc注释。
>   通常它们用于描述代码的功能、类型和设计。kernel-doc注释有一些特殊的结构和
>   格式，但除此之外，它们还被作为reStructuredText处理。
>   
> @@ -26,7 +27,7 @@ reStructuredText文件可能包含包含来自源文件的结构化文档注释
>   安装Sphinx
>   ==========
>   
> -Documentation/ 下的ReST文件现在使用sphinx1.7或更高版本构建。
> +Documentation/ 下的ReST文件现在使用 ``sphinx`` 3.4.3 或更高版本构建。
>   
>   这有一个脚本可以检查Sphinx的依赖项。更多详细信息见
>   :ref:`sphinx-pre-install_zh` 。
> @@ -38,21 +39,13 @@ Documentation/ 下的ReST文件现在使用sphinx1.7或更高版本构建。
>   ``virtualenv-3`` 或 ``virtualenv`` 在虚拟环境中安装Sphinx，具体取决于发行版
>   如何打包Python3。
>   
> -.. note::
> -
> -   #) html输出建议使用RTD主题。根据Sphinx版本的不同，它应该用
> -      ``pip install sphinx_rtd_theme`` 单独安装。
> +总之，如您要安装最新版的Sphinx，应执行::
>   
> -   #) 一些ReST页面包含数学表达式。由于Sphinx的工作方式，这些表达式是使用 LaTeX
> -      编写的。它需要安装amsfonts和amsmath宏包，以便显示。
> +       $ virtualenv sphinx_latest
> +       $ . sphinx_latest/bin/activate
> +       (sphinx_latest) $ pip install -r Documentation/sphinx/requirements.txt
>   
> -总之，如您要安装Sphinx 2.4.4版本，应执行::
> -
> -       $ virtualenv sphinx_2.4.4
> -       $ . sphinx_2.4.4/bin/activate
> -       (sphinx_2.4.4) $ pip install -r Documentation/sphinx/requirements.txt
> -
> -在运行 ``. sphinx_2.4.4/bin/activate`` 之后，提示符将变化，以指示您正在使用新
> +在运行 ``. sphinx_latest/bin/activate`` 之后，提示符将变化，以指示您正在使用新
>   环境。如果您打开了一个新的shell，那么在构建文档之前，您需要重新运行此命令以再
>   次进入虚拟环境中。
>   
> @@ -76,6 +69,23 @@ PDF和LaTeX构建
>   根据发行版的不同，您可能还需要安装一系列 ``texlive`` 软件包，这些软件包提供了
>   ``XeLaTeX`` 工作所需的最小功能集。
>   
> +HTML中的数学表达式
> +------------------
> +
> +有些ReST页面中包含数学表达式。由于Sphinx的工作方式，这些表达式使用LaTeX
> +符号书写。Sphinx在HTML输出中渲染数学表达式有两种方式：一种是名为 `imgmath`_
> +的扩展，它将数学表达式转换成图像并嵌入到HTML页面中。
> +另一种是名为 `mathjax`_ 的扩展，它将数学表达式的渲染交由支持 JavaScript
> +的浏览器处理。
> +在6.1版内核文档之前，前者是唯一可用的方式，并且需要安装大量texlive软件包，
> +其中包括amsfonts和amsmath等。
> +
> +自内核6.1版本起，无需安装任何texlive软件包即可构建包含数学表达式的HTML
> +页面。更多信息请参阅 :ref:`choice_of_math_renderer_zh`。
> +
> +.. _imgmath: https://www.sphinx-doc.org/en/master/usage/extensions/math.html#module-sphinx.ext.imgmath
> +.. _mathjax: https://www.sphinx-doc.org/en/master/usage/extensions/math.html#module-sphinx.ext.mathjax
> +
>   .. _sphinx-pre-install_zh:
>   
>   检查Sphinx依赖项
> @@ -108,7 +118,29 @@ PDF和LaTeX构建
>   
>   ``--no-virtualenv``
>   
> -	使用Sphinx的系统打包，而不是Python虚拟环境。
> +	使用系统发行版提供的Sphinx软件包，而不是Python虚拟环境。
> +
> +安装最小版本的Sphinx
> +--------------------
> +
> +在修改Sphinx构建系统时，确保其最小支持版本仍然可用非常重要。
> +然而，在现代发行版上，这样做正变得越来越困难，因为在Python 3.13及以上版本
> +环境下，已经无法安装该最小版本。
> +
> +要按照 Documentation/translations/zh_CN/process/changes.rst
> +中定义的最低支持Python版本进行测试，可以使用该版本创建一个虚拟环境，
> +并安装最小依赖::
> +
> +	/usr/bin/python3.9 -m venv sphinx_min
> +	. sphinx_min/bin/activate
> +	pip install -r Documentation/sphinx/min_requirements.txt
> +
> +更全面的测试可以使用以下脚本完成:
> +
> +	tools/docs/test_doc_build.py
> +
> +该脚本会为每个受支持的Python版本创建一个虚拟环境，并可选择针对一定范围内的
> +Sphinx版本构建文档。
>   
>   Sphinx构建
>   ==========
> @@ -117,17 +149,66 @@ Sphinx构建
>   的格式：请参阅 ``make help`` 的文档部分。生成的文档放在 ``Documentation/output``
>   下相应格式的子目录中。
>   
> -要生成文档，显然必须安装Sphinx（ ``sphinx-build`` ）。要让HTML输出更漂亮，可以
> -使用Read the Docs Sphinx主题（ ``sphinx_rtd_theme`` ）。对于PDF输出，您还需要
> -``XeLaTeX`` 和来自ImageMagick（https://www.imagemagick.org）的 ``convert(1)`` 。
> -所有这些软件在大多发行版中都可用或已打包。
> +要生成文档，显然必须安装Sphinx（ ``sphinx-build`` ）。对于PDF输出，您还需
> +要 ``XeLaTeX`` 和来自 ImageMagick（https://www.imagemagick.org）的
> +``convert(1)`` 。\ [#ink]_ 所有这些软件在各大发行版中都很常见，
> +也都有对应的软件包。
>   
>   要传递额外的选项给Sphinx，可以使用make变量 ``SPHINXOPTS`` 。例如，使用
>   ``make SPHINXOPTS=-v htmldocs`` 获得更详细的输出。
>   
> +也可以通过make变量 ``DOCS_CSS`` 传入一个额外的DOCS_CSS覆盖文件，以自定义
> +html布局。
> +
> +默认情况下，构建HTML文档时使用的是"Alabaster"主题；该主题随Sphinx一同提供，
> +无需单独安装。也可以通过make变量 ``DOCS_THEME`` 覆盖Sphinx主题。
> +
> +.. note::
> +
> +   有些人可能更喜欢在html输出中使用RTD主题。根据Sphinx版本的不同，它可能需要
> +   单独安装，可使用 ``pip install sphinx_rtd_theme`` 进行安装。
> +
> +还有一个make变量 ``SPHINXDIRS`` ，在测试构建某个文档子集时很有用。例如，您可
> +以通过运行 ``make SPHINXDIRS=doc-guide htmldocs`` 构建
> +``Documentation/doc-guide`` 下的文档。 ``make help`` 的文档部分会显示可指定的
> +子目录列表。
>   
>   要删除生成的文档，请运行 ``make cleandocs`` 。
>   
> +.. [#ink] 如果还安装了来自 Inkscape（https://inkscape.org）的 ``inkscape(1)`` ，
> +	  则能够提升嵌入到PDF文档中的图像质量，尤其是在5.18及之后的内核版本中。
> +
> +.. _choice_of_math_renderer_zh:
> +
> +数学渲染器的选择
> +----------------
> +
> +自内核 6.1 版本起， ``mathjax`` 可作为html输出中数学渲染器的后备方案。\ [#sph1_8_zh]_
> +
> +数学渲染器会根据可用命令按如下方式选择：
> +
> +.. table:: HTML 中数学渲染器的选择
> +
> +    ============ ================= ============
> +    数学渲染器   所需命令          图像格式
> +    ============ ================= ============
> +    imgmath      latex, dvipng     PNG（栅格）
> +    mathjax
> +    ============ ================= ============
> +
> +也可以通过设置环境变量 ``SPHINX_IMGMATH`` 来覆盖该选择，如下所示：
> +
> +.. table:: 设置 ``SPHINX_IMGMATH`` 的效果
> +
> +    ====================== ==========
> +    设置                   渲染器
> +    ====================== ==========
> +    ``SPHINX_IMGMATH=yes`` imgmath
> +    ``SPHINX_IMGMATH=no``  mathjax
> +    ====================== ==========
> +
> +.. [#sph1_8_zh] 数学渲染器的后备机制要求Sphinx >= 1.8。
> +
>   编写文档
>   ========
>   
> @@ -187,7 +268,8 @@ Sphinx构建
>          ~~~~~~~~
>   
>     尽管RST没有规定具体的顺序（“没有强加一个固定数量和顺序的节标题装饰风格，最终
> -  按照的顺序将是实际遇到的顺序。”），但是拥有一个通用级别的文档更容易遵循。
> +  按照的顺序将是实际遇到的顺序。”），但整体上让较高层级的标题样式保持一致，
> +  会更便于阅读和理解文档结构。
>   
>   * 对于插入固定宽度的文本块（用于代码样例、用例等）： ``::`` 用于语法高亮意义不
>     大的内容，尤其是短代码段； ``.. code-block:: <language>`` 用于需要语法高亮的
> @@ -218,15 +300,24 @@ C域
>   神奇力量，如果给定函数名的索引项存在，文档构建系统会自动将对 ``function()``
>   的引用转换为交叉引用。如果在内核文档中看到 ``c:func:`` 的用法，请删除它。
>   
> -
> -列表
> +表格
>   ----
>   
> -我们建议使用 *列式表* 格式。 *列式表* 格式是二级列表。与ASCII艺术相比，它们对
> -文本文件的读者来说可能没有那么舒适。但其优点是易于创建或修改，而且修改的差异
> -（diff）更有意义，因为差异仅限于修改的内容。
> +reStructuredText 为表格语法提供了多种选项。内核文档中的表格通常优先使用
> +*simple table* 或 *grid table* 语法。更多细节请参阅
> +`reStructuredText 用户参考中的表格语法`_ 。
> +
> +.. _reStructuredText 用户参考中的表格语法:
> +   https://docutils.sourceforge.io/docs/user/rst/quickref.html#tables
>   
> -*平铺表* 也是一个二级列表，类似于 *列式表* ，但具有一些额外特性：
> +列式表
> +~~~~~~
> +
> +列式表（``list-table``）格式对于无法用常规Sphinx ASCII艺术格式轻松排版的表格来说
> +可能很有用。然而，这种格式对于纯文本文档的读者来说几乎无法理解，因此，
> +除非有充分的理由，否则应避免使用。
> +
> +``flat-table`` 也是一个二级列表，类似于 ``list-table`` ，但具有一些额外特性：
>   
>   * 列范围：使用 ``cspan`` 修饰，可以通过其他列扩展单元格
>   
> @@ -302,15 +393,15 @@ C域
>   
>   从一页文档到另一页文档的交叉引用可以通过简单地写出文件路径来完成，无特殊格式
>   要求。路径可以是绝对路径或相对路径。绝对路径从“Documentation/”开始。例如，要
> -交叉引用此页，以下写法皆可，取决于具体的文档目录（注意 ``.rst`` 扩展名是可选
> +交叉引用此页，以下写法皆可，取决于具体的文档目录（注意 ``.rst`` 扩展名是必需
>   的）::
>   
>       参见 Documentation/doc-guide/sphinx.rst 。此法始终可用。
>       请查看 sphinx.rst ，仅在同级目录中有效。
>       请阅读 ../sphinx.rst ，上级目录中的文件。
>   
> -如果要使用相对路径，则需要使用Sphinx的 ``doc`` 修饰。例如，从同一目录引用此页
> -的操作如下::
> +如果希望链接显示的文本不同于文档标题，则需要使用 Sphinx 的 ``doc`` 修饰。例
> +如::
>   
>       参见 :doc:`sphinx文档的自定义链接文本 <sphinx>`.
>   
> @@ -318,7 +409,15 @@ C域
>   个没有任何特殊作用的 ``:doc:`` 用法，请将其转换为文档路径。
>   
>   有关交叉引用kernel-doc函数或类型的信息，请参阅
> -Documentation/doc-guide/kernel-doc.rst 。
> +Documentation/translations/zh_CN/doc-guide/kernel-doc.rst 。
> +
> +引用提交
> +~~~~~~~~
> +
> +对 git 提交的引用如果采用以下格式书写，会自动转换为超链接::
> +
> +    commit 72bf4f1767f0
> +    commit 72bf4f1767f0 ("net: do not leave an empty skb in write queue")
>   
>   .. _sphinx_kfigure_zh:
>   

