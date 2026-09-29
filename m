Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB1A51AED6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683222; cv=none; b=FEp5xBwVw1JYbjt2yUdX8kUZZlPA+BgRFifOnKVurjpF7bHmnaB/Ct/2RA7A01dDWBtASs3j7Y+rq6Z5y8BIo3CRKs8q/GPcxe1C1gJ5k19CqeHZsxcxT+s2lHCJKk3dZSrElpglL6oXyocLJ1DYdlRqaUqHftVWOvT8P+SZh3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683222; c=relaxed/simple;
	bh=B/zVAu/XkqUw72TzAQIGzvw9D8uPhA0Q57m09lRjYC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kparSo2IsLA1fL8gcMq88TjDHzpD9aWX0KoHr+T54rzg2nyJdudGRz6V0MJGa6G1Lt9t763Gd9xo4Td9+gnSDXF92QhU1syWnq9COplhRkanyKnb4tjgpnumEhWEY5QK5E1/2KaiTEm/rMoQw4M1G0pIvZxa9DasG5fwjosCSTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNCY5Pi1; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNCY5Pi1"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2df9f8c6f09so3752155ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790683219; x=1791288019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/YgzHqXxyOcjo4DAjpJoutcpOwGqhRiEdyZyzIlt/o=;
        b=eNCY5Pi1++/A65UOwFaiBX7G8O8lFDPQS+s8brsZt2JITfdimU5BGZ4TBLYrHPBlaH
         iOIqNb1WOqqCg18dqSWK3aNRB5FTNk90RVLftKRCEJqkhMkOeVdqQLfzHBwAQ4zcAeki
         iXhX+WNaA/fUxOA2WmKO6AAFVTlUTdA+35Jlae0gCXJQEeg9psoZ8NdSFPhP3JrMlhds
         7jj0WM6sHPWY76SioVemEkWmPjiSGzUdJ0jruBArf6attFsPGV1Xi/wj2+P7OHqkiwWE
         QIVANeATkpvbHkRrQ6n2pRc+hT4IzXwPWKttOU4LpOsO0HEk5CsHKGkrJWgtGWYSmfG/
         CFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683219; x=1791288019;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/YgzHqXxyOcjo4DAjpJoutcpOwGqhRiEdyZyzIlt/o=;
        b=bpipkdbbWEz3JCU05tt6mIiVoMzxGfTeik2ZHMXaYRymRvelZwZVezAZkbEK9EtSNm
         eIkTX/S5sSy2sP4PTG685gkpVlSn49h3wfY6tsF1uOAdqzYzDTukLXtW4OCBeQls3pap
         PZ141lnCsCB/b10Ylm6mFYIkTwS3YgwffbzVV5y0mHt29BeDdff6ZycrfrPucjch+qyT
         hT2lkpApTgZxqukghKJzmQSlG6IGntDYS1hi3DYTFpO/oAJx7aK4WJ6OqDmM2sih1q/S
         YKPMvyF8ETjkEtb0ObhnL+R5J465gkNoV0REaWIUzHMRQKFHdDpSd/QNxX1GLesBQMZq
         ghbQ==
X-Forwarded-Encrypted: i=1; AKwUvBz50N8Dg3Y1/RYky/dQWA0DCPVn9XwVH6UywVn1UFyzsol/KS6LDu8LWMWPd4aD39asMqD0vrjwroQZlOY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgPLMdqokOy/ORNuLVzDW/OxL3cvan3t2SgwTPupHCXynkHmUN
	37Advny4uq1r3Ev4WZnS7Mk85fSbMGs1M7+5BYJ+vpZBM8pIAjRvalen
X-Gm-Gg: AYBFou3IxDUUgMaJySIzUsteZai+IpMh/0YGxrHcjb006hjC3feqno1PZFE10LPoPut
	Yd5irR+y2XsRwtPBmaCG83WGpVIkPjYv+fv+5focHzWYyJ35kRsZ0wesuLyIzEyfaW1vIkA3Lrh
	WN/TlCU5Z9iMw3Ark7CbsF1XvX4whxum2+E+5KXxwUF+EXoYya1XrMERpWDu1A+CUFc+sgLD06v
	+I3o9ds1H6Z3uNNOoiWwlh3ESNI6XwbRYX3FC1/1cH5iWbxdCSvb7vwHaH5q5hzEdchaUYfo8Ai
	YkEJv4rzkIV5cLNObG38TbWUpuzTsocEUoZHmjxiq16cgQDWi5+UfQehjCCOt1meTi9Quzu9zSG
	MP3ifK3Au2hIyRWGmRSYNUGguNgDV8U9fCfQfNzJLx98sDXTFImuBqtEoH58AlimaklKokYzOTd
	OHng/g5meLesxSJ6aay/YdgolkwZtcQpPE4HPgbj1IRiarlmC5qZDwTzZKmJStM4lZ3m1vpXvMT
	i1riPVa/7Mb+itRmKdf4n1tPJUi9UwIhNonXXUXqz/HzgVeT11aE9qW9A==
X-Received: by 2002:a17:903:1ad0:b0:2da:dd0a:99e0 with SMTP id d9443c01a7336-2df8e6db03amr161882505ad.2.1790683216611;
        Tue, 29 Sep 2026 05:00:16 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm55882605ad.45.2026.09.29.05.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:00:15 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org
Cc: dzm91@hust.edu.cn,
	wy@wyuan.org,
	si.yanteng@linux.dev,
	srcres258@furdevs.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Deng <theandy.deng@gmail.com>,
	Bailu Lin <bailu.lin@vivo.com>,
	Bernard Zhao <bernard@vivo.com>,
	Bryan Wu <bryan.wu@analog.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chucheng Luo <luochucheng@vivo.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Dave Young <hidave.darkstar@gmail.com>,
	Dongsheng Song <dongshneg.song@gmail.com>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	Eugene Teo <eugeneteo@kernel.sg>,
	Fu Wei <tekkamanninja@gmail.com>,
	Fu Wei <wefu@redhat.com>,
	gao chao <gaochao49@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hailong Liu <liu.hailong6@zte.com.cn>,
	Harry Wei <harryxiyou@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Junhua Huang <huang.junhua@zte.com.cn>,
	Kangkai Yin <e12051@motorola.com>,
	Leigang Zang <zangleigang@hisilicon.com>,
	Li Yang <leoyang.li@nxp.com>,
	Li Zefan <lizf@cn.fujitsu.com>,
	Maggie Chen <chenqi@beyondsoft.com>,
	Nicolas Pitre <nico@fluxnic.net>,
	Punit Agrawal <punitagrawal@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tang Yizhou <tangyeechou@gmail.com>,
	TripleX Chung <xxx.phy@gmail.com>,
	Wang Chen <wangchen@cn.fujitsu.com>,
	Wang Cong <xiyou.wangcong@gmail.com>,
	Wang Wenhu <wenhu.wang@vivo.com>,
	Wan Jiabing <wanjiabing@vivo.com>,
	wheelz <kernel.zeng@gmail.com>,
	Will Deacon <will@kernel.org>,
	Wu XiangCheng <bobwxc@email.cn>,
	Xiaochen Wang <wangxiaochen0@gmail.com>,
	Xudong Guan <xudong.guan@gmail.com>,
	xu xin <xu.xin16@zte.com.cn>,
	yaxinsn <yaxinsn@163.com>,
	Yinglin Luan <synmyth@gmail.com>,
	Zhang Le <r0bertz@gentoo.org>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 0/7] docs/zh_TW: remove duplicated maintainer contact information
Date: Tue, 29 Sep 2026 19:59:48 +0800
Message-ID: <20260929115956.229610-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MAINTAINERS already records who to contact about the zh_TW
translations, yet every zh_TW file repeats that information in a
per-file contact block.  The duplication has a concrete cost: the
listed zh_TW maintainer address appeared in 58 files and there have
been three separate attempts to rewrite it across the tree.  In the
MAINTAINERS discussion Jon Corbet's conclusion was that, rather than
churning all of those addresses once more, the best thing is simply to
remove them.

There is a second reason.  The zh_TW tree was produced by converting
zh_CN, and the credit blocks came across with the text: nearly every
address removed here also appears in
Documentation/translations/zh_CN/, several in more than a hundred
files.  They credit the simplified-Chinese translation rather than
zh_TW work, so keeping them would leave the wrong attribution in place.

Removed:

  - the :Translator: / :翻譯: / :校譯: / :譯者: credit blocks and the
    譯者:: literal blocks
  - the "please contact the ... maintainer" prose that introduces them
  - the 英文版/中文版/繁體中文版 維護者|翻譯者|校譯者 lines, including
    their continuation lines
  - the maintainer metadata lines in the legacy headers (M:, zh_CN:,
    zh_TW:, Maintainer:, Chinese maintainer:, Traditional Chinese
    maintainer:)

Left alone: :Original:, :作者: (the author of the English original),
:日期:, :更新:, the C: sync-commit references, copyright notices, and
every address that is part of a document body, such as
stable@vger.kernel.org and the examples in submitting-patches.

Attribution for past work is preserved in the git history.

Changes in v2:
 - Rebased onto docs-next now that the zh_TW process/ series has
   landed.  v1 no longer applied: that series added a translator entry
   to fifteen of the blocks 1/7 removes, so 1/7 now removes those
   entries too (they are mine; the same reasoning applies).
 - Each patch now has its own commit message instead of sharing one
   paragraph (Weijie).  The messages also no longer claim that the
   Chinese credit lines of the legacy headers are kept; they were
   removed in v1 as well, as this cover letter said.
 - 7/7: the disclaimer's warning and note said much the same thing;
   merge them into a single note, as disclaimer-zh_CN.rst has (Weijie).
   It points readers at the zh_TW maintainers and reviewers rather than
   at "the file's translator", since this series removes the
   translator fields.
 - Copied everyone whose address the series removes, as Jon asked on
   v1, using current addresses where MAINTAINERS or .mailmap has one.
   (IRQ.txt spells Eric Biederman's address "ebiederman@"; his address
   is ebiederm@xmission.com.)

Not changed: IRQ.txt, io_ordering.txt and the other plain-text files
still lose their contact lines here, so that this series stands on its
own; as agreed in the zh_TW scope discussion [1], they are removed
altogether by a separate series.  The "聯繫譯者" wording in
dev-tools/testing-overview.rst is left as it is, as Weijie suggested.

v1: https://lore.kernel.org/linux-doc/20260819145808.291567-1-chenyou910331@gmail.com/
[1] https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com/

Chen-Yu Yeh (7):
  docs/zh_TW: process: remove maintainer contact information
  docs/zh_TW: admin-guide: remove maintainer contact information
  docs/zh_TW: arch: remove maintainer contact information
  docs/zh_TW: dev-tools: remove maintainer contact information
  docs/zh_TW: filesystems: remove maintainer contact information
  docs/zh_TW: cpu-freq: remove maintainer contact information
  docs/zh_TW: remove the last maintainer contact references

 Documentation/translations/zh_TW/IRQ.txt       |  8 --------
 .../translations/zh_TW/admin-guide/README.rst  |  5 -----
 .../zh_TW/admin-guide/bootconfig.rst           |  2 --
 .../zh_TW/admin-guide/bug-bisect.rst           |  5 -----
 .../zh_TW/admin-guide/bug-hunting.rst          |  5 -----
 .../zh_TW/admin-guide/clearing-warn-once.rst   |  2 --
 .../zh_TW/admin-guide/cpu-load.rst             |  2 --
 .../zh_TW/admin-guide/cputopology.rst          |  4 ----
 .../translations/zh_TW/admin-guide/index.rst   |  2 --
 .../translations/zh_TW/admin-guide/init.rst    |  5 -----
 .../zh_TW/admin-guide/lockup-watchdogs.rst     |  1 -
 .../zh_TW/admin-guide/mm/damon/index.rst       |  6 ------
 .../zh_TW/admin-guide/mm/damon/lru_sort.rst    |  6 ------
 .../zh_TW/admin-guide/mm/damon/reclaim.rst     |  6 ------
 .../zh_TW/admin-guide/mm/damon/start.rst       |  6 ------
 .../zh_TW/admin-guide/mm/damon/usage.rst       |  6 ------
 .../zh_TW/admin-guide/mm/index.rst             |  5 -----
 .../translations/zh_TW/admin-guide/mm/ksm.rst  |  5 -----
 .../zh_TW/admin-guide/reporting-issues.rst     |  6 ------
 .../admin-guide/reporting-regressions.rst      |  5 -----
 .../zh_TW/admin-guide/security-bugs.rst        |  5 -----
 .../translations/zh_TW/admin-guide/sysrq.rst   |  8 --------
 .../zh_TW/admin-guide/tainted-kernels.rst      |  5 -----
 .../translations/zh_TW/admin-guide/unicode.rst |  5 -----
 .../translations/zh_TW/arch/arm/Booting        |  7 -------
 .../zh_TW/arch/arm/kernel_user_helpers.txt     | 10 ----------
 .../translations/zh_TW/arch/arm64/amu.rst      |  3 ---
 .../translations/zh_TW/arch/arm64/booting.txt  |  8 --------
 .../zh_TW/arch/arm64/elf_hwcaps.rst            |  3 ---
 .../zh_TW/arch/arm64/hugetlbpage.rst           |  3 ---
 .../translations/zh_TW/arch/arm64/index.rst    |  2 --
 .../zh_TW/arch/arm64/legacy_instructions.txt   | 11 -----------
 .../translations/zh_TW/arch/arm64/memory.txt   |  9 ---------
 .../translations/zh_TW/arch/arm64/perf.rst     |  3 ---
 .../zh_TW/arch/arm64/silicon-errata.txt        |  8 --------
 .../zh_TW/arch/arm64/tagged-pointers.txt       |  9 ---------
 .../zh_TW/arch/loongarch/booting.rst           |  4 ----
 .../zh_TW/arch/loongarch/features.rst          |  1 -
 .../zh_TW/arch/loongarch/index.rst             |  1 -
 .../zh_TW/arch/loongarch/introduction.rst      |  1 -
 .../zh_TW/arch/loongarch/irq-chip-model.rst    |  1 -
 .../translations/zh_TW/arch/mips/booting.rst   |  4 ----
 .../translations/zh_TW/arch/mips/features.rst  |  4 ----
 .../translations/zh_TW/arch/mips/index.rst     |  4 ----
 .../zh_TW/arch/mips/ingenic-tcu.rst            |  4 ----
 .../translations/zh_TW/arch/openrisc/index.rst |  4 ----
 .../zh_TW/arch/openrisc/openrisc_port.rst      |  4 ----
 .../translations/zh_TW/arch/openrisc/todo.rst  |  4 ----
 .../zh_TW/arch/parisc/debugging.rst            |  4 ----
 .../translations/zh_TW/arch/parisc/index.rst   |  4 ----
 .../zh_TW/arch/parisc/registers.rst            |  4 ----
 .../translations/zh_TW/cpu-freq/core.rst       |  8 --------
 .../zh_TW/cpu-freq/cpu-drivers.rst             |  8 --------
 .../zh_TW/cpu-freq/cpufreq-stats.rst           |  8 --------
 .../translations/zh_TW/cpu-freq/index.rst      |  4 ----
 .../translations/zh_TW/dev-tools/gcov.rst      |  1 -
 .../zh_TW/dev-tools/gdb-kernel-debugging.rst   |  1 -
 .../translations/zh_TW/dev-tools/index.rst     |  1 -
 .../translations/zh_TW/dev-tools/kasan.rst     |  1 -
 .../translations/zh_TW/dev-tools/sparse.rst    |  5 -----
 .../zh_TW/dev-tools/testing-overview.rst       |  1 -
 .../translations/zh_TW/disclaimer-zh_TW.rst    | 12 ++++--------
 .../translations/zh_TW/filesystems/debugfs.rst | 10 ----------
 .../translations/zh_TW/filesystems/index.rst   |  2 --
 .../translations/zh_TW/filesystems/sysfs.txt   | 10 ----------
 .../zh_TW/filesystems/virtiofs.rst             |  8 --------
 Documentation/translations/zh_TW/index.rst     |  2 +-
 .../translations/zh_TW/io_ordering.txt         |  6 ------
 .../translations/zh_TW/process/1.Intro.rst     | 10 ----------
 .../translations/zh_TW/process/2.Process.rst   | 10 ----------
 .../zh_TW/process/3.Early-stage.rst            |  9 ---------
 .../translations/zh_TW/process/4.Coding.rst    |  9 ---------
 .../translations/zh_TW/process/5.Posting.rst   | 10 ----------
 .../zh_TW/process/6.Followthrough.rst          |  9 ---------
 .../zh_TW/process/7.AdvancedTopics.rst         | 10 ----------
 .../zh_TW/process/8.Conclusion.rst             |  9 ---------
 .../process/code-of-conduct-interpretation.rst |  3 ---
 .../zh_TW/process/code-of-conduct.rst          |  2 --
 .../zh_TW/process/coding-style.rst             | 14 --------------
 .../zh_TW/process/development-process.rst      |  2 --
 .../zh_TW/process/email-clients.rst            | 12 ------------
 .../process/embargoed-hardware-issues.rst      |  3 ---
 .../translations/zh_TW/process/howto.rst       | 18 ------------------
 .../translations/zh_TW/process/index.rst       |  3 ---
 .../zh_TW/process/kernel-driver-statement.rst  |  2 --
 .../process/kernel-enforcement-statement.rst   |  2 --
 .../zh_TW/process/license-rules.rst            |  3 ---
 .../zh_TW/process/magic-number.rst             |  8 --------
 .../zh_TW/process/management-style.rst         |  2 --
 .../zh_TW/process/programming-language.rst     |  3 ---
 .../zh_TW/process/stable-api-nonsense.rst      | 10 ----------
 .../zh_TW/process/stable-kernel-rules.rst      | 12 ------------
 .../zh_TW/process/submit-checklist.rst         |  4 ----
 .../zh_TW/process/submitting-patches.rst       | 12 ------------
 .../process/volatile-considered-harmful.rst    | 12 ------------
 95 files changed, 5 insertions(+), 525 deletions(-)

Range-diff against v1:
1:  b30ed7154694 ! 1:  57561af2e7e1 docs/zh_TW: process: remove maintainer contact information
    @@ Metadata
      ## Commit message ##
         docs/zh_TW: process: remove maintainer contact information
     
    -    The zh_TW translations duplicate, in every file, contact information
    -    that MAINTAINERS already records.  Those addresses have been churned
    -    repeatedly: the listed zh_TW maintainer address alone appears in 58
    -    files and there have now been three attempts to update it across the
    -    tree.  Jon Corbet's conclusion in the MAINTAINERS discussion was that,
    -    rather than rewriting all of them again, the best thing is simply to
    -    remove them.
    -
    -    Most of the names in the credit blocks belong to the zh_CN translators:
    -    the zh_TW tree was produced by converting zh_CN, so the credits came
    -    across with the text.  Of the addresses removed here, nearly all also
    -    appear in Documentation/translations/zh_CN/, several in more than a
    -    hundred files.  They credit the simplified-Chinese translation, not
    -    zh_TW work.
    -
    -    Remove the :Translator:/:翻譯:/:校譯:/:譯者: credit blocks and the
    -    "please contact the ... maintainer" prose that introduces them, and
    -    drop the maintainer metadata lines (M:, zh_CN:, zh_TW:, Maintainer:,
    -    Chinese maintainer:, Traditional Chinese maintainer:) from the legacy
    -    headers.  The translated bodies of the legacy files, including their
    -    own credit lines, are left untouched.
    -
    -    Attribution for past work is preserved in the git history.
    -
    +    The zh_TW translations repeat, file by file, contact information that
    +    MAINTAINERS already records.  Those addresses keep going stale: the
    +    listed zh_TW maintainer address alone appeared in 58 files, and there
    +    have been three attempts to update it across the tree.  In the
    +    MAINTAINERS discussion Jon Corbet concluded that, rather than rewriting
    +    them all again, they should simply be removed.
    +
    +    Most of the names also credit the wrong work.  zh_TW was produced by
    +    converting zh_CN and the credit blocks came across with the text, so
    +    they name the simplified-Chinese translators; nearly every address
    +    removed in this series also appears under
    +    Documentation/translations/zh_CN/.
    +
    +    Start with process/, the largest area.  Remove the :Translator:, :譯者:
    +    and :校譯: fields, the 譯者:: literal blocks in howto.rst and
    +    stable-api-nonsense.rst, and the "contact the maintainer" paragraphs
    +    that introduce the credits in magic-number.rst, stable-kernel-rules.rst
    +    and volatile-considered-harmful.rst.  This includes the entries that the
    +    recent process/ update added to fifteen of these blocks.  Attribution
    +    for all of it stays in the git history.
    +
    +    Assisted-by: Claude:claude-opus-5-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/process/1.Intro.rst ##
    @@ Documentation/translations/zh_TW/process/1.Intro.rst
     -
     - 吳想成 Wu XiangCheng <bobwxc@email.cn>
     - 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
    +- 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
     -
      .. _tw_development_process_intro:
      
    @@ Documentation/translations/zh_TW/process/2.Process.rst
     -
     - 吳想成 Wu XiangCheng <bobwxc@email.cn>
     - 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
    +- 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
     -
      .. _tw_development_process:
      
    @@ Documentation/translations/zh_TW/process/5.Posting.rst
     -
     - 吳想成 Wu XiangCheng <bobwxc@email.cn>
     - 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
    +- 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
     -
      .. _tw_development_posting:
      
    - 發佈補丁
    + 發布補丁
     
      ## Documentation/translations/zh_TW/process/6.Followthrough.rst ##
     @@
    @@ Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
     -
     - 吳想成 Wu XiangCheng <bobwxc@email.cn>
     - 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
    +- 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
     -
      .. _tw_development_advancedtopics:
      
    - 高級主題
    + 進階主題
     
      ## Documentation/translations/zh_TW/process/8.Conclusion.rst ##
     @@
    @@ Documentation/translations/zh_TW/process/8.Conclusion.rst
     -
     - 吳想成 Wu XiangCheng <bobwxc@email.cn>
     - 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
    +- 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
      
      .. _tw_development_conclusion:
      
    @@ Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
      :Original: :ref:`Documentation/process/code-of-conduct-interpretation.rst <code_of_conduct_interpretation>`
     -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
     -             Hu Haowen <2023002089@link.tyut.edu.cn>
    +-             Chen-Yu Yeh <chenyou910331@gmail.com>
      
      .. _tw_code_of_conduct_interpretation:
      
    @@ Documentation/translations/zh_TW/process/coding-style.rst
     - - Li Zefan <lizf@cn.fujitsu.com>
     - - Wang Chen <wangchen@cn.fujitsu.com>
     - - Hu Haowen <2023002089@link.tyut.edu.cn>
    +- - 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
     -
    - Linux 內核代碼風格
    - ==================
    + Linux 核心程式碼風格
    + ====================
      
     
      ## Documentation/translations/zh_TW/process/development-process.rst ##
    @@ Documentation/translations/zh_TW/process/email-clients.rst
     - - Xiaochen Wang <wangxiaochen0@gmail.com>
     - - yaxinsn <yaxinsn@163.com>
     - - Hu Haowen <2023002089@link.tyut.edu.cn>
    +- - Chen-Yu Yeh <chenyou910331@gmail.com>
     -
    - Linux郵件客戶端配置信息
    + Linux郵件客戶端設定資訊
      =======================
      
     
    @@ Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
      :Original: :ref:`Documentation/process/embargoed-hardware-issues.rst <embargoed_hardware_issues>`
     -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
     -             Hu Haowen <2023002089@link.tyut.edu.cn>
    +-             Chen-Yu Yeh <chenyou910331@gmail.com>
      
    - 被限制的硬件問題
    + 被限制的硬體問題
      ================
     
      ## Documentation/translations/zh_TW/process/howto.rst ##
    @@ Documentation/translations/zh_TW/process/howto.rst
     -                   陳琦  Maggie Chen <chenqi@beyondsoft.com>
     -                   王聰  Wang Cong <xiyou.wangcong@gmail.com>
     -                   胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
    +-                   葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
     -
    - 如何參與Linux內核開發
    + 如何參與Linux核心開發
      =====================
      
     @@ Documentation/translations/zh_TW/process/howto.rst: Kees Cook, Andrew Morton, Andi Kleen, Vadim Lobanov, Jesper Juhl, Adrian
      Bunk, Keri Harris, Frans Pop, David A. Wheeler, Junio Hamano, Michael
    - Kerrisk和Alex Shepard的評審、建議和貢獻。沒有他們的幫助，這篇文檔是不可
    + Kerrisk和Alex Shepard的評審、建議和貢獻。沒有他們的幫助，這篇文件是不可
      能完成的。
     -
     -
    @@ Documentation/translations/zh_TW/process/index.rst
      :Original: :ref:`Documentation/process/index.rst <process_index>`
     -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
     -             Hu Haowen <2023002089@link.tyut.edu.cn>
    +-             Chen-Yu Yeh <chenyou910331@gmail.com>
      
      .. _tw_process_index:
      
    @@ Documentation/translations/zh_TW/process/license-rules.rst
      :Original: :ref:`Documentation/process/license-rules.rst <kernel_licensing>`
     -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
     -             Hu Haowen <2023002089@link.tyut.edu.cn>
    +-             Chen-Yu Yeh <chenyou910331@gmail.com>
      
      .. _tw_kernel_licensing:
      
    @@ Documentation/translations/zh_TW/process/programming-language.rst
      :Original: :ref:`Documentation/process/programming-language.rst <programming_language>`
     -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
     -             Hu Haowen <2023002089@link.tyut.edu.cn>
    +-             Chen-Yu Yeh <chenyou910331@gmail.com>
      
      .. _tw_programming_language:
      
    @@ Documentation/translations/zh_TW/process/stable-api-nonsense.rst
     -        中文版校譯者： 李陽  Li Yang <leoyang.li@nxp.com>
     -                      胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
     -
    - Linux 內核驅動接口
    + Linux 內核驅動介面
      ==================
      
     @@ Documentation/translations/zh_TW/process/stable-api-nonsense.rst: Linux能成爲強壯，穩定，成熟的操作系統，這也是你最開始選
    @@ Documentation/translations/zh_TW/process/stable-kernel-rules.rst
      
      :Original: :ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
      
    --如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
    +-如果想評論或更新本文的內容，請直接聯繫原文件的維護者。如果你使用英文
     -交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
     -譯存在問題，請聯繫中文版維護者::
     -
    @@ Documentation/translations/zh_TW/process/stable-kernel-rules.rst
     -            - 李陽  Li Yang <leoyang.li@nxp.com>
     -            - Kangkai Yin <e12051@motorola.com>
     -            - 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
    +-            - 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
     -
    - 所有你想知道的事情 - 關於linux穩定版發佈
    - ========================================
    + 所有你想知道的事情 - 關於Linux -stable 版本發布
    + ===============================================
      
     
      ## Documentation/translations/zh_TW/process/submit-checklist.rst ##
    @@ Documentation/translations/zh_TW/process/submitting-patches.rst
     - - 李陽 Li Yang <leoyang.li@nxp.com>
     - - 王聰 Wang Cong <xiyou.wangcong@gmail.com>
     - - 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
    +- - 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
     -
     -
    - 提交補丁：如何讓你的改動進入內核
    + 提交補丁：如何讓你的改動進入核心
      ================================
      
     
2:  63a10f491ef4 ! 2:  45f9aeb5676b docs/zh_TW: admin-guide: remove maintainer contact information
    @@ Metadata
      ## Commit message ##
         docs/zh_TW: admin-guide: remove maintainer contact information
     
    -    The zh_TW translations duplicate, in every file, contact information
    -    that MAINTAINERS already records.  Those addresses have been churned
    -    repeatedly: the listed zh_TW maintainer address alone appears in 58
    -    files and there have now been three attempts to update it across the
    -    tree.  Jon Corbet's conclusion in the MAINTAINERS discussion was that,
    -    rather than rewriting all of them again, the best thing is simply to
    -    remove them.
    -
    -    Most of the names in the credit blocks belong to the zh_CN translators:
    -    the zh_TW tree was produced by converting zh_CN, so the credits came
    -    across with the text.  Of the addresses removed here, nearly all also
    -    appear in Documentation/translations/zh_CN/, several in more than a
    -    hundred files.  They credit the simplified-Chinese translation, not
    -    zh_TW work.
    -
    -    Remove the :Translator:/:翻譯:/:校譯:/:譯者: credit blocks and the
    -    "please contact the ... maintainer" prose that introduces them, and
    -    drop the maintainer metadata lines (M:, zh_CN:, zh_TW:, Maintainer:,
    -    Chinese maintainer:, Traditional Chinese maintainer:) from the legacy
    -    headers.  The translated bodies of the legacy files, including their
    -    own credit lines, are left untouched.
    -
    -    Attribution for past work is preserved in the git history.
    +    Remove the :翻譯:, :譯者:, :校譯: and :Translator: fields from the
    +    admin-guide/ translations.  MAINTAINERS records who looks after zh_TW,
    +    and the people named in these fields are the zh_CN translators whose
    +    work this tree was converted from, not maintainers of the zh_TW text.
     
    +    Assisted-by: Claude:claude-opus-5-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/admin-guide/README.rst ##
3:  754d5c54732b ! 3:  1211b349d82a docs/zh_TW: arch: remove maintainer contact information
    @@ Metadata
      ## Commit message ##
         docs/zh_TW: arch: remove maintainer contact information
     
    -    The zh_TW translations duplicate, in every file, contact information
    -    that MAINTAINERS already records.  Those addresses have been churned
    -    repeatedly: the listed zh_TW maintainer address alone appears in 58
    -    files and there have now been three attempts to update it across the
    -    tree.  Jon Corbet's conclusion in the MAINTAINERS discussion was that,
    -    rather than rewriting all of them again, the best thing is simply to
    -    remove them.
    -
    -    Most of the names in the credit blocks belong to the zh_CN translators:
    -    the zh_TW tree was produced by converting zh_CN, so the credits came
    -    across with the text.  Of the addresses removed here, nearly all also
    -    appear in Documentation/translations/zh_CN/, several in more than a
    -    hundred files.  They credit the simplified-Chinese translation, not
    -    zh_TW work.
    -
    -    Remove the :Translator:/:翻譯:/:校譯:/:譯者: credit blocks and the
    -    "please contact the ... maintainer" prose that introduces them, and
    -    drop the maintainer metadata lines (M:, zh_CN:, zh_TW:, Maintainer:,
    -    Chinese maintainer:, Traditional Chinese maintainer:) from the legacy
    -    headers.  The translated bodies of the legacy files, including their
    -    own credit lines, are left untouched.
    -
    -    Attribution for past work is preserved in the git history.
    -
    +    Remove the contact and credit information from the arch/ translations.
    +    MAINTAINERS records who looks after zh_TW, and nearly all of the names
    +    here are those of the zh_CN translators whose work this tree was
    +    converted from.
    +
    +    arch/ has the most varied shapes.  The reStructuredText files carry
    +    :翻譯: or :Translator: fields, or in four arm64 files a bare
    +    "Translator:" line without the leading colon.  The plain-text arm and
    +    arm64 files carry a legacy header: from it, drop the M:, zh_CN:,
    +    zh_TW:, Maintainer:, Chinese maintainer: and Traditional Chinese
    +    maintainer: lines, including the English maintainers they list, and
    +    the Chinese lines that repeat them.  The C: lines and the Chinese notes
    +    recording the commit each translation was made from are kept, as is
    +    the rest of the header.
    +
    +    Assisted-by: Claude:claude-opus-5-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/arch/arm/Booting ##
4:  42d9524f941d ! 4:  394a9d630046 docs/zh_TW: dev-tools: remove maintainer contact information
    @@ Metadata
      ## Commit message ##
         docs/zh_TW: dev-tools: remove maintainer contact information
     
    -    The zh_TW translations duplicate, in every file, contact information
    -    that MAINTAINERS already records.  Those addresses have been churned
    -    repeatedly: the listed zh_TW maintainer address alone appears in 58
    -    files and there have now been three attempts to update it across the
    -    tree.  Jon Corbet's conclusion in the MAINTAINERS discussion was that,
    -    rather than rewriting all of them again, the best thing is simply to
    -    remove them.
    -
    -    Most of the names in the credit blocks belong to the zh_CN translators:
    -    the zh_TW tree was produced by converting zh_CN, so the credits came
    -    across with the text.  Of the addresses removed here, nearly all also
    -    appear in Documentation/translations/zh_CN/, several in more than a
    -    hundred files.  They credit the simplified-Chinese translation, not
    -    zh_TW work.
    -
    -    Remove the :Translator:/:翻譯:/:校譯:/:譯者: credit blocks and the
    -    "please contact the ... maintainer" prose that introduces them, and
    -    drop the maintainer metadata lines (M:, zh_CN:, zh_TW:, Maintainer:,
    -    Chinese maintainer:, Traditional Chinese maintainer:) from the legacy
    -    headers.  The translated bodies of the legacy files, including their
    -    own credit lines, are left untouched.
    -
    -    Attribution for past work is preserved in the git history.
    +    Remove the :Translator: lines from the dev-tools/ translations, and the
    +    Traditional Chinese maintainer lines from the plain-text header of
    +    sparse.rst; the rest of that header is kept.  MAINTAINERS records who
    +    looks after zh_TW, so the per-file copies only go stale.
     
    +    Assisted-by: Claude:claude-opus-5-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/dev-tools/gcov.rst ##
5:  c3d27ddf03ac ! 5:  c6a621e970c4 docs/zh_TW: filesystems: remove maintainer contact information
    @@ Metadata
      ## Commit message ##
         docs/zh_TW: filesystems: remove maintainer contact information
     
    -    The zh_TW translations duplicate, in every file, contact information
    -    that MAINTAINERS already records.  Those addresses have been churned
    -    repeatedly: the listed zh_TW maintainer address alone appears in 58
    -    files and there have now been three attempts to update it across the
    -    tree.  Jon Corbet's conclusion in the MAINTAINERS discussion was that,
    -    rather than rewriting all of them again, the best thing is simply to
    -    remove them.
    -
    -    Most of the names in the credit blocks belong to the zh_CN translators:
    -    the zh_TW tree was produced by converting zh_CN, so the credits came
    -    across with the text.  Of the addresses removed here, nearly all also
    -    appear in Documentation/translations/zh_CN/, several in more than a
    -    hundred files.  They credit the simplified-Chinese translation, not
    -    zh_TW work.
    -
    -    Remove the :Translator:/:翻譯:/:校譯:/:譯者: credit blocks and the
    -    "please contact the ... maintainer" prose that introduces them, and
    -    drop the maintainer metadata lines (M:, zh_CN:, zh_TW:, Maintainer:,
    -    Chinese maintainer:, Traditional Chinese maintainer:) from the legacy
    -    headers.  The translated bodies of the legacy files, including their
    -    own credit lines, are left untouched.
    -
    -    Attribution for past work is preserved in the git history.
    +    Remove the credit information from the filesystems/ translations: the
    +    :Translator: field in index.rst, the 譯者 literal blocks in debugfs.rst
    +    and virtiofs.rst, and the maintainer and translator lines in the
    +    plain-text header of sysfs.txt, whose remaining header is kept.
    +    MAINTAINERS records who looks after zh_TW, and the names here credit
    +    the zh_CN translations this tree was converted from.
     
    +    Assisted-by: Claude:claude-opus-5-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/filesystems/debugfs.rst ##
6:  73210c2b2665 ! 6:  2270bf4ca6b7 docs/zh_TW: cpu-freq: remove maintainer contact information
    @@ Metadata
      ## Commit message ##
         docs/zh_TW: cpu-freq: remove maintainer contact information
     
    -    The zh_TW translations duplicate, in every file, contact information
    -    that MAINTAINERS already records.  Those addresses have been churned
    -    repeatedly: the listed zh_TW maintainer address alone appears in 58
    -    files and there have now been three attempts to update it across the
    -    tree.  Jon Corbet's conclusion in the MAINTAINERS discussion was that,
    -    rather than rewriting all of them again, the best thing is simply to
    -    remove them.
    -
    -    Most of the names in the credit blocks belong to the zh_CN translators:
    -    the zh_TW tree was produced by converting zh_CN, so the credits came
    -    across with the text.  Of the addresses removed here, nearly all also
    -    appear in Documentation/translations/zh_CN/, several in more than a
    -    hundred files.  They credit the simplified-Chinese translation, not
    -    zh_TW work.
    -
    -    Remove the :Translator:/:翻譯:/:校譯:/:譯者: credit blocks and the
    -    "please contact the ... maintainer" prose that introduces them, and
    -    drop the maintainer metadata lines (M:, zh_CN:, zh_TW:, Maintainer:,
    -    Chinese maintainer:, Traditional Chinese maintainer:) from the legacy
    -    headers.  The translated bodies of the legacy files, including their
    -    own credit lines, are left untouched.
    -
    -    Attribution for past work is preserved in the git history.
    +    Remove the :翻譯: and :校譯: blocks from the cpu-freq/ translations.
    +    They name the translators and reviewers of the zh_CN documents these
    +    files were converted from; MAINTAINERS records who looks after zh_TW.
     
    +    Assisted-by: Claude:claude-opus-5-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/cpu-freq/core.rst ##
7:  f9936743dff7 ! 7:  798f87603270 docs/zh_TW: remove the last maintainer contact references
    @@ Metadata
      ## Commit message ##
         docs/zh_TW: remove the last maintainer contact references
     
    -    disclaimer-zh_TW.rst is included by every zh_TW document and told
    -    readers to mail the listed maintainer directly; index.rst asked
    -    would-be contributors to send patches to the same address.  Point both
    -    at MAINTAINERS instead, so the contact information lives in one place,
    -    and drop the remaining contact blocks in the top-level files.
    +    disclaimer-zh_TW.rst is included by every zh_TW document.  It carried a
    +    warning telling readers to send changes to "the maintainer (contact
    +    details below)" and a note giving the previous zh_TW maintainer's name
    +    and address, while index.rst asked contributors to send patches to that
    +    same address.
     
    -    This mirrors disclaimer-zh_CN.rst, which names no address and refers to
    -    the Chinese documentation maintainers and reviewers instead.
    +    Replace the warning and the note, which said much the same thing, with
    +    a single note as disclaimer-zh_CN.rst has, pointing readers at the zh_TW
    +    maintainers and reviewers in MAINTAINERS, and point index.rst there as
    +    well.  Also drop the maintainer lines from the legacy headers of
    +    IRQ.txt and io_ordering.txt.
     
    +    Suggested-by: Weijie Yuan <wy@wyuan.org>
    +    Assisted-by: Claude:claude-opus-5-5
         Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
     
      ## Documentation/translations/zh_TW/IRQ.txt ##
    @@ Documentation/translations/zh_TW/IRQ.txt: Documentation/core-api/irq/index.rst 
     
      ## Documentation/translations/zh_TW/disclaimer-zh_TW.rst ##
     @@
    - .. warning::
    -      此文件的目的是爲讓中文讀者更容易閱讀和理解，而不是作爲一個分支。因此，
    -      如果您對此文件有任何意見或改動，請先嘗試更新原始英文文件。如果要更改或
    --     修正某處翻譯文件，請將意見或補丁發送給維護者（聯繫方式見下）。
    -+     修正某處翻譯文件，請將意見或補丁發送給繁體中文文件的維護者（見
    -+     MAINTAINERS 檔案）。
    + :orphan:
      
    +-.. warning::
    +-     此文件的目的是爲讓中文讀者更容易閱讀和理解，而不是作爲一個分支。因此，
    +-     如果您對此文件有任何意見或改動，請先嘗試更新原始英文文件。如果要更改或
    +-     修正某處翻譯文件，請將意見或補丁發送給維護者（聯繫方式見下）。
    +-
      .. note::
     -     如果您發現本文檔與原始文件有任何不同或者有翻譯問題，請聯繫該文件的譯者，
     -     或者發送電子郵件給胡皓文以獲取幫助：<2023002089@link.tyut.edu.cn>。
    -+     如果您發現本文檔與原始文件有任何不同或者有翻譯問題，請發建議或者補丁給
    -+     繁體中文文件的維護者和審閱者（見 MAINTAINERS 檔案）。
    - 
    +-
    ++     此文件的目的是讓中文讀者更容易閱讀與理解，而不是作為一個分支。
    ++     因此，如果您對此文件有任何意見或更新，請先嘗試更新原始英文文件。
    ++     如果您發現本文件與原始文件有任何不同，或有翻譯問題，請向繁體中文
    ++     文件的維護者與審閱者提交建議或補丁（見MAINTAINERS檔案）。
     
      ## Documentation/translations/zh_TW/index.rst ##
     @@
    @@ Documentation/translations/zh_TW/index.rst
      .. note::
         內核文檔繁體中文版的翻譯工作正在進行中。如果您願意並且有時間參與這項工
     -   作，歡迎提交補丁給胡皓文 <2023002089@link.tyut.edu.cn>。
    -+   作，歡迎將補丁提交給繁體中文文件的維護者（見 MAINTAINERS 檔案）。
    ++   作，歡迎將補丁提交給繁體中文文件的維護者（見MAINTAINERS檔案）。
      
      與Linux 內核社區一起工作
      ------------------------
-- 
2.43.0

