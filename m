Received: from mta0.migadu.com (out-236.mta0.migadu.com [91.218.175.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC6A3DB65A
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219293; cv=none; b=cAslaDRg5B4z0fx5MPim3qI0ngiA4GkwL5Hq2BxMufKazfHSH4z/kgq1sh83PGB1MdTt8iVJSQVfQHh/EZLw74KW41kXcl/ZRRbj7ajbraoP3SJzQik+SQ66Vl8zd7O7pqfC5+XijwXoD7vA0u/F0++6xKT1L64WKDqMtSeCG6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219293; c=relaxed/simple;
	bh=hn8aHMI48l5z8pToxeJAfl6ZBqelawA03wL2kfg//EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T87uV9oQYTmg1T9ibSxGCqwbN7yESn3+txAQ4UWfjZHWunrkzsFBO7ckB8ON9nUgi3A8F9P0qAmVVmRG0Dica8hDkl6+bpjGOGgo5eVoeyoU9PaptJIMN1I8JAQ4JGzlyCNZBcj8YkGj5WFhRLdZndVj+l+S9jQS5WXnqahI2VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=FCHnqYpk; arc=none smtp.client-ip=91.218.175.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="FCHnqYpk"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hn8aHMI48l5z8pToxeJAfl6ZBqelawA03wL2kfg//EU=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791219286; v=1; x=1791824086;
 b=FCHnqYpknRWkrGoOfNeqQglhs3kaItQAebbFnVjhBZBORgiuInHmEYNf6JyxGL1QAHZqubLQ
 a8HUyan0ivxW5j5Zb/kZhpaw4QLISjfdBQfTDgapT5EATcfQHGCA6JQNJIU23F7sohwu1Vc7L4I
 L+528yxBXoboaMn9jeyxTdBi+A9WTPkQtReMUgL6/JuPY0+Yd2wB9Ii/7qxDfwqnxKxioQiA/Ng
 hNNI9c/brRD/xXAzq7IVWCekd4qyncMuTf2pOA+9tLu6vSENTYrjo1ZnwQTHnX3E7W2cY9HoWwD
 szrypV15NFqyB9XZKNbL9Az/4RVMtjtwBDC+HDeCbk08g==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 058e47cfa9d0fb6c;
	Mon, 05 Oct 2026 16:54:36 +0000
X-Mizu-Trace-ID: 058e47cfa9d0fb6c
X-Migadu-Flow: FLOW_OUT
Date: Tue, 6 Oct 2026 00:54:27 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn,
	si.yanteng@linux.dev, srcres258@furdevs.cn,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Deng <theandy.deng@gmail.com>, Bailu Lin <bailu.lin@vivo.com>,
	Bernard Zhao <bernard@vivo.com>, Bryan Wu <bryan.wu@analog.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chucheng Luo <luochucheng@vivo.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Dave Young <hidave.darkstar@gmail.com>,
	Dongsheng Song <dongshneg.song@gmail.com>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	Eugene Teo <eugeneteo@kernel.sg>, Fu Wei <tekkamanninja@gmail.com>,
	Fu Wei <wefu@redhat.com>, gao chao <gaochao49@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hailong Liu <liu.hailong6@zte.com.cn>,
	Harry Wei <harryxiyou@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Junhua Huang <huang.junhua@zte.com.cn>,
	Kangkai Yin <e12051@motorola.com>,
	Leigang Zang <zangleigang@hisilicon.com>,
	Li Yang <leoyang.li@nxp.com>, Li Zefan <lizf@cn.fujitsu.com>,
	Maggie Chen <chenqi@beyondsoft.com>,
	Nicolas Pitre <nico@fluxnic.net>,
	Punit Agrawal <punitagrawal@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tang Yizhou <tangyeechou@gmail.com>,
	TripleX Chung <xxx.phy@gmail.com>,
	Wang Chen <wangchen@cn.fujitsu.com>,
	Wang Cong <xiyou.wangcong@gmail.com>,
	Wang Wenhu <wenhu.wang@vivo.com>, Wan Jiabing <wanjiabing@vivo.com>,
	wheelz <kernel.zeng@gmail.com>, Will Deacon <will@kernel.org>,
	Wu XiangCheng <bobwxc@email.cn>,
	Xiaochen Wang <wangxiaochen0@gmail.com>,
	Xudong Guan <xudong.guan@gmail.com>, xu xin <xu.xin16@zte.com.cn>,
	yaxinsn <yaxinsn@163.com>, Yinglin Luan <synmyth@gmail.com>,
	Zhang Le <r0bertz@gentoo.org>
Subject: Re: [PATCH v2 0/7] docs/zh_TW: remove duplicated maintainer contact
 information
Message-ID: <asPWQ2ysbTgW9Uib@wyuan.org>
References: <20260929115956.229610-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929115956.229610-1-chenyou910331@gmail.com>

Hi all,

Since there are already so many recipients, I'll simply reply to the
cover letter directly to avoid unnecessary noise.

On 2026-09-29 19:59:48 +0800, Chen-Yu Yeh <chenyou910331@gmail.com> wrote:

> MAINTAINERS already records who to contact about the zh_TW
> translations, yet every zh_TW file repeats that information in a
> per-file contact block.

And it is probably due to historical reasons that the styles of these
annotations are all different.

> The duplication has a concrete cost: the listed zh_TW maintainer
> address appeared in 58 files and there have been three separate
> attempts to rewrite it across the tree.  In the MAINTAINERS discussion
> Jon Corbet's conclusion was that, rather than churning all of those
> addresses once more, the best thing is simply to remove them.
> 
> There is a second reason.  The zh_TW tree was produced by converting
> zh_CN, and the credit blocks came across with the text: nearly every
> address removed here also appears in
> Documentation/translations/zh_CN/, several in more than a hundred
> files.  They credit the simplified-Chinese translation rather than
> zh_TW work, so keeping them would leave the wrong attribution in
> place.

Oh yes. This viewpoint might also come from me, so feel free to blame
me. ;-)

> Removed:
> 
>   - the :Translator: / :翻譯: / :校譯: / :譯者: credit blocks and the
>     譯者:: literal blocks
>   - the "please contact the ... maintainer" prose that introduces them
>   - the 英文版/中文版/繁體中文版 維護者|翻譯者|校譯者 lines, including
>     their continuation lines
>   - the maintainer metadata lines in the legacy headers (M:, zh_CN:,
>     zh_TW:, Maintainer:, Chinese maintainer:, Traditional Chinese
>     maintainer:)
> 
> Left alone: :Original:, :作者: (the author of the English original),
> :日期:, :更新:, the C: sync-commit references, copyright notices, and
> every address that is part of a document body, such as
> stable@vger.kernel.org and the examples in submitting-patches.
> 
> Attribution for past work is preserved in the git history.
> 
> Changes in v2:
>  - Rebased onto docs-next now that the zh_TW process/ series has
>    landed.  v1 no longer applied: that series added a translator entry
>    to fifteen of the blocks 1/7 removes, so 1/7 now removes those
>    entries too (they are mine; the same reasoning applies).
>  - Each patch now has its own commit message instead of sharing one
>    paragraph (Weijie).  The messages also no longer claim that the
>    Chinese credit lines of the legacy headers are kept; they were
>    removed in v1 as well, as this cover letter said.
>  - 7/7: the disclaimer's warning and note said much the same thing;
>    merge them into a single note, as disclaimer-zh_CN.rst has (Weijie).
>    It points readers at the zh_TW maintainers and reviewers rather than
>    at "the file's translator", since this series removes the
>    translator fields.
>  - Copied everyone whose address the series removes, as Jon asked on
>    v1, using current addresses where MAINTAINERS or .mailmap has one.
>    (IRQ.txt spells Eric Biederman's address "ebiederman@"; his address
>    is ebiederm@xmission.com.)

So for the whole v2 series:

Acked-by: Weijie Yuan <wy@wyuan.org>

(It doesn't seem to be complicated enough to give a "Reviewed-by" tag?)

> 
> Not changed: IRQ.txt, io_ordering.txt and the other plain-text files
> still lose their contact lines here, so that this series stands on its
> own; as agreed in the zh_TW scope discussion [1], they are removed
> altogether by a separate series.  The "聯繫譯者" wording in
> dev-tools/testing-overview.rst is left as it is, as Weijie suggested.
> 
> v1: https://lore.kernel.org/linux-doc/20260819145808.291567-1-chenyou910331@gmail.com/
> [1] https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com/
> 
> Chen-Yu Yeh (7):
>   docs/zh_TW: process: remove maintainer contact information
>   docs/zh_TW: admin-guide: remove maintainer contact information
>   docs/zh_TW: arch: remove maintainer contact information
>   docs/zh_TW: dev-tools: remove maintainer contact information
>   docs/zh_TW: filesystems: remove maintainer contact information
>   docs/zh_TW: cpu-freq: remove maintainer contact information
>   docs/zh_TW: remove the last maintainer contact references
> 
>  Documentation/translations/zh_TW/IRQ.txt       |  8 --------
>  .../translations/zh_TW/admin-guide/README.rst  |  5 -----
>  .../zh_TW/admin-guide/bootconfig.rst           |  2 --
>  .../zh_TW/admin-guide/bug-bisect.rst           |  5 -----
>  .../zh_TW/admin-guide/bug-hunting.rst          |  5 -----
>  .../zh_TW/admin-guide/clearing-warn-once.rst   |  2 --
>  .../zh_TW/admin-guide/cpu-load.rst             |  2 --
>  .../zh_TW/admin-guide/cputopology.rst          |  4 ----
>  .../translations/zh_TW/admin-guide/index.rst   |  2 --
>  .../translations/zh_TW/admin-guide/init.rst    |  5 -----
>  .../zh_TW/admin-guide/lockup-watchdogs.rst     |  1 -
>  .../zh_TW/admin-guide/mm/damon/index.rst       |  6 ------
>  .../zh_TW/admin-guide/mm/damon/lru_sort.rst    |  6 ------
>  .../zh_TW/admin-guide/mm/damon/reclaim.rst     |  6 ------
>  .../zh_TW/admin-guide/mm/damon/start.rst       |  6 ------
>  .../zh_TW/admin-guide/mm/damon/usage.rst       |  6 ------
>  .../zh_TW/admin-guide/mm/index.rst             |  5 -----
>  .../translations/zh_TW/admin-guide/mm/ksm.rst  |  5 -----
>  .../zh_TW/admin-guide/reporting-issues.rst     |  6 ------
>  .../admin-guide/reporting-regressions.rst      |  5 -----
>  .../zh_TW/admin-guide/security-bugs.rst        |  5 -----
>  .../translations/zh_TW/admin-guide/sysrq.rst   |  8 --------
>  .../zh_TW/admin-guide/tainted-kernels.rst      |  5 -----
>  .../translations/zh_TW/admin-guide/unicode.rst |  5 -----
>  .../translations/zh_TW/arch/arm/Booting        |  7 -------
>  .../zh_TW/arch/arm/kernel_user_helpers.txt     | 10 ----------
>  .../translations/zh_TW/arch/arm64/amu.rst      |  3 ---
>  .../translations/zh_TW/arch/arm64/booting.txt  |  8 --------
>  .../zh_TW/arch/arm64/elf_hwcaps.rst            |  3 ---
>  .../zh_TW/arch/arm64/hugetlbpage.rst           |  3 ---
>  .../translations/zh_TW/arch/arm64/index.rst    |  2 --
>  .../zh_TW/arch/arm64/legacy_instructions.txt   | 11 -----------
>  .../translations/zh_TW/arch/arm64/memory.txt   |  9 ---------
>  .../translations/zh_TW/arch/arm64/perf.rst     |  3 ---
>  .../zh_TW/arch/arm64/silicon-errata.txt        |  8 --------
>  .../zh_TW/arch/arm64/tagged-pointers.txt       |  9 ---------
>  .../zh_TW/arch/loongarch/booting.rst           |  4 ----
>  .../zh_TW/arch/loongarch/features.rst          |  1 -
>  .../zh_TW/arch/loongarch/index.rst             |  1 -
>  .../zh_TW/arch/loongarch/introduction.rst      |  1 -
>  .../zh_TW/arch/loongarch/irq-chip-model.rst    |  1 -
>  .../translations/zh_TW/arch/mips/booting.rst   |  4 ----
>  .../translations/zh_TW/arch/mips/features.rst  |  4 ----
>  .../translations/zh_TW/arch/mips/index.rst     |  4 ----
>  .../zh_TW/arch/mips/ingenic-tcu.rst            |  4 ----
>  .../translations/zh_TW/arch/openrisc/index.rst |  4 ----
>  .../zh_TW/arch/openrisc/openrisc_port.rst      |  4 ----
>  .../translations/zh_TW/arch/openrisc/todo.rst  |  4 ----
>  .../zh_TW/arch/parisc/debugging.rst            |  4 ----
>  .../translations/zh_TW/arch/parisc/index.rst   |  4 ----
>  .../zh_TW/arch/parisc/registers.rst            |  4 ----
>  .../translations/zh_TW/cpu-freq/core.rst       |  8 --------
>  .../zh_TW/cpu-freq/cpu-drivers.rst             |  8 --------
>  .../zh_TW/cpu-freq/cpufreq-stats.rst           |  8 --------
>  .../translations/zh_TW/cpu-freq/index.rst      |  4 ----
>  .../translations/zh_TW/dev-tools/gcov.rst      |  1 -
>  .../zh_TW/dev-tools/gdb-kernel-debugging.rst   |  1 -
>  .../translations/zh_TW/dev-tools/index.rst     |  1 -
>  .../translations/zh_TW/dev-tools/kasan.rst     |  1 -
>  .../translations/zh_TW/dev-tools/sparse.rst    |  5 -----
>  .../zh_TW/dev-tools/testing-overview.rst       |  1 -
>  .../translations/zh_TW/disclaimer-zh_TW.rst    | 12 ++++--------
>  .../translations/zh_TW/filesystems/debugfs.rst | 10 ----------
>  .../translations/zh_TW/filesystems/index.rst   |  2 --
>  .../translations/zh_TW/filesystems/sysfs.txt   | 10 ----------
>  .../zh_TW/filesystems/virtiofs.rst             |  8 --------
>  Documentation/translations/zh_TW/index.rst     |  2 +-
>  .../translations/zh_TW/io_ordering.txt         |  6 ------
>  .../translations/zh_TW/process/1.Intro.rst     | 10 ----------
>  .../translations/zh_TW/process/2.Process.rst   | 10 ----------
>  .../zh_TW/process/3.Early-stage.rst            |  9 ---------
>  .../translations/zh_TW/process/4.Coding.rst    |  9 ---------
>  .../translations/zh_TW/process/5.Posting.rst   | 10 ----------
>  .../zh_TW/process/6.Followthrough.rst          |  9 ---------
>  .../zh_TW/process/7.AdvancedTopics.rst         | 10 ----------
>  .../zh_TW/process/8.Conclusion.rst             |  9 ---------
>  .../process/code-of-conduct-interpretation.rst |  3 ---
>  .../zh_TW/process/code-of-conduct.rst          |  2 --
>  .../zh_TW/process/coding-style.rst             | 14 --------------
>  .../zh_TW/process/development-process.rst      |  2 --
>  .../zh_TW/process/email-clients.rst            | 12 ------------
>  .../process/embargoed-hardware-issues.rst      |  3 ---
>  .../translations/zh_TW/process/howto.rst       | 18 ------------------
>  .../translations/zh_TW/process/index.rst       |  3 ---
>  .../zh_TW/process/kernel-driver-statement.rst  |  2 --
>  .../process/kernel-enforcement-statement.rst   |  2 --
>  .../zh_TW/process/license-rules.rst            |  3 ---
>  .../zh_TW/process/magic-number.rst             |  8 --------
>  .../zh_TW/process/management-style.rst         |  2 --
>  .../zh_TW/process/programming-language.rst     |  3 ---
>  .../zh_TW/process/stable-api-nonsense.rst      | 10 ----------
>  .../zh_TW/process/stable-kernel-rules.rst      | 12 ------------
>  .../zh_TW/process/submit-checklist.rst         |  4 ----
>  .../zh_TW/process/submitting-patches.rst       | 12 ------------
>  .../process/volatile-considered-harmful.rst    | 12 ------------
>  95 files changed, 5 insertions(+), 525 deletions(-)
> 
> Range-diff against v1:
> 1:  b30ed7154694 ! 1:  57561af2e7e1 docs/zh_TW: process: remove maintainer contact information
>     @@ Metadata
>       ## Commit message ##
>          docs/zh_TW: process: remove maintainer contact information
>      
>     -    The zh_TW translations duplicate, in every file, contact information
>     -    that MAINTAINERS already records.  Those addresses have been churned
>     -    repeatedly: the listed zh_TW maintainer address alone appears in 58
>     -    files and there have now been three attempts to update it across the
>     -    tree.  Jon Corbet's conclusion in the MAINTAINERS discussion was that,
>     -    rather than rewriting all of them again, the best thing is simply to
>     -    remove them.
>     -
>     -    Most of the names in the credit blocks belong to the zh_CN translators:
>     -    the zh_TW tree was produced by converting zh_CN, so the credits came
>     -    across with the text.  Of the addresses removed here, nearly all also
>     -    appear in Documentation/translations/zh_CN/, several in more than a
>     -    hundred files.  They credit the simplified-Chinese translation, not
>     -    zh_TW work.
>     -
>     -    Remove the :Translator:/:翻譯:/:校譯:/:譯者: credit blocks and the
>     -    "please contact the ... maintainer" prose that introduces them, and
>     -    drop the maintainer metadata lines (M:, zh_CN:, zh_TW:, Maintainer:,
>     -    Chinese maintainer:, Traditional Chinese maintainer:) from the legacy
>     -    headers.  The translated bodies of the legacy files, including their
>     -    own credit lines, are left untouched.
>     -
>     -    Attribution for past work is preserved in the git history.
>     -
>     +    The zh_TW translations repeat, file by file, contact information that
>     +    MAINTAINERS already records.  Those addresses keep going stale: the
>     +    listed zh_TW maintainer address alone appeared in 58 files, and there
>     +    have been three attempts to update it across the tree.  In the
>     +    MAINTAINERS discussion Jon Corbet concluded that, rather than rewriting
>     +    them all again, they should simply be removed.

Offtopic & micronit: What's the point of rephrasing this paragraph?

>     +
>     +    Most of the names also credit the wrong work.  zh_TW was produced by
>     +    converting zh_CN and the credit blocks came across with the text, so
>     +    they name the simplified-Chinese translators; nearly every address
>     +    removed in this series also appears under
>     +    Documentation/translations/zh_CN/.

.. and this paragraph.

>     +
>     +    Start with process/, the largest area.  Remove the :Translator:, :譯者:
>     +    and :校譯: fields, the 譯者:: literal blocks in howto.rst and
>     +    stable-api-nonsense.rst, and the "contact the maintainer" paragraphs
>     +    that introduce the credits in magic-number.rst, stable-kernel-rules.rst
>     +    and volatile-considered-harmful.rst.  This includes the entries that the
>     +    recent process/ update added to fifteen of these blocks.  Attribution
>     +    for all of it stays in the git history.
>     +
>     +    Assisted-by: Claude:claude-opus-5-5
>          Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Oh, forget to meantion. Now "Aissisted-by: LLM" is preferred. But if
it's not necessary, then that's fine too.


[...]


>     +-.. warning::
>     +-     此文件的目的是爲讓中文讀者更容易閱讀和理解，而不是作爲一個分支。因此，
>     +-     如果您對此文件有任何意見或改動，請先嘗試更新原始英文文件。如果要更改或
>     +-     修正某處翻譯文件，請將意見或補丁發送給維護者（聯繫方式見下）。
>     +-
>       .. note::
>      -     如果您發現本文檔與原始文件有任何不同或者有翻譯問題，請聯繫該文件的譯者，
>      -     或者發送電子郵件給胡皓文以獲取幫助：<2023002089@link.tyut.edu.cn>。
>     -+     如果您發現本文檔與原始文件有任何不同或者有翻譯問題，請發建議或者補丁給
>     -+     繁體中文文件的維護者和審閱者（見 MAINTAINERS 檔案）。
>     - 
>     +-
>     ++     此文件的目的是讓中文讀者更容易閱讀與理解，而不是作為一個分支。
>     ++     因此，如果您對此文件有任何意見或更新，請先嘗試更新原始英文文件。
>     ++     如果您發現本文件與原始文件有任何不同，或有翻譯問題，請向繁體中文
>     ++     文件的維護者與審閱者提交建議或補丁（見MAINTAINERS檔案）。
>      
>       ## Documentation/translations/zh_TW/index.rst ##
>      @@
>     @@ Documentation/translations/zh_TW/index.rst
>       .. note::
>          內核文檔繁體中文版的翻譯工作正在進行中。如果您願意並且有時間參與這項工
>      -   作，歡迎提交補丁給胡皓文 <2023002089@link.tyut.edu.cn>。
>     -+   作，歡迎將補丁提交給繁體中文文件的維護者（見 MAINTAINERS 檔案）。
>     ++   作，歡迎將補丁提交給繁體中文文件的維護者（見MAINTAINERS檔案）。

OK, you prefer no space between CJK and ascii. ;-)

>       
>       與Linux 內核社區一起工作
>       ------------------------
> -- 
> 2.43.0
> 

Thanks!
