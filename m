Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA237344D9B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687512; cv=none; b=odezDpJJvgyVtT7WDN4OBBMHsxF9SxXQ+06HC8P4X6bFGL9Hp5ru7L52JbXlhCYqFjwprpqj2vPh42VbwE0tgotWdhbaR42Mxt7jENl02NP+ngiW6koriuk735gH+e94VTe52fM++j3dMPzAbSmnhG278HB2dSt/4l6G9MyrtWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687512; c=relaxed/simple;
	bh=R6kFxCZVX72XrWiajw8nRAAiIuYHm0i+6cXR/3YROXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bgGhcZavykOBL9n94x0/34del9jUDBXe3Cqp4509AkThW+zDd/d/JrgNI1dqCNl6Wf0kz7qjsU4JEFyX6WcN+bTKjI8HHx1Y48UUdVumn1rDSK2Ebq34/h881YmgHLtD9WJPEqKv8Z/Avmgu9HVrAYVJzWDcwM8x4sk0xjGrDXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NuGXzFGr; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NuGXzFGr"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39b1a806664so542744a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687510; x=1791292310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uGrOClVLUVSeKZG/0dZ4YmywGDt3y47Ha22ocFOhKk=;
        b=NuGXzFGrXco0otUoioz/EvhIQ2hmF6KrJQrD7+BpYWmLcPWGPrhOK6K/c4fCjfYS00
         pMRBa7TOu4eNx7L599jApJdAx3jjHd/+1tvtydWggQQuplm3rOzRQ9Sc+g9tOotaMB5S
         m80KcvuU5m/6fa3jECPoRSqTIuOX2XNvf1xgBP7oq9KeguvP2iiWqsSKQ5bt3vnNFsyw
         oscK0pvxOE2YkYu1DN6VrDh5g7+7KeIQNB9sW4EHMFIInbmWpy0inWlp8EK9jK692+j8
         RwdnIHZC523QkkSlaUeHyu+Po1IVtqdaaw8kU32TfLOPqQBRMbRzZ4anynFKfPQG3GOS
         LshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687510; x=1791292310;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0uGrOClVLUVSeKZG/0dZ4YmywGDt3y47Ha22ocFOhKk=;
        b=TXsCa2KeVb1VMQ473W6o3TfxBnbyczr+A0oH2kL8r7IDHHDvqqAzNLxx6nSUEJMvNR
         h3O/4uQv8KEpSWUA1TVyvGR5N0n67eUDfzawFH+fJ3cSwSNfbmZjVB+Zk7ip5fgXDHRB
         5AH6nrotknAuF86Y+WTKn3z7se2IsgkJoGJk5o8tErx30BcA5qLCITKIHAyQ3f935v3n
         7UW2/KCEgT0+kjcIRaWqOMy/ZX+ECSnnZGFDre3/0lNjcE0fgkssOQoxePXwmJJB0J8U
         5wduG8HveOZXFrp6/7Tt+5uC9s6jTYACqoau2bgyzpxUpGpmIj4GMVvnpaXiYr7znBYv
         W06w==
X-Forwarded-Encrypted: i=1; AKwUvBxw7CTF98zc3GZxXBKQBOHgeVJaqHpVMAyU8K57aaFpCf1fOBMJn3bbw1izGJou2na0PGAsOgn3Zz6TCdo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6Oods7tmGXuy2NhR8hLU3Ck2oka2o9Nu4EtkhnWqFvnOFbhTL
	BGWCSYzq2DplYE6dyQ7YhbtnXhj1U9OVgWg03+OUB1jWDbCdCjHBhheW
X-Gm-Gg: AYBFou2cofTAWWzxHVICVZH5CXr2NBMtA0GgkJAtcNJVSyBkgBNdxaIjWi3ofmyYydE
	8+ZqDAQI0InugyYlosBID0F9fcLlq11oidqOk2qsyIj9QoFubrwS+ozfSopwAh93USk4ljid1N7
	UjBAouRk5XxLOjh88izQIKTq7p9Ox63bHHSNLUwXLwAMsIAFPLkGrUTNxB6QLiMcMoAseTjf8FU
	HFMD1qXxyplNEETww3+kCBxW+z95GGCbih9498X/lmHkshQ5L3wrElw5P1izzzAmB2TVMhv4OkC
	AzBi6TKZdey3pAq8a56TEMKONFDizQg5M4e/7QuCc5+dKfKiDREuu3cgqliME32f/MAyAkkqxcT
	Rwhp7LYouL4RVhEU+VBDd+BKEQJR7K0IrUqeU4cgGw6uStY2ejhWinHLknrIRE7CTkD/UhkxPCE
	bWh3gstI7vsT0WKkuMnXXmoPlGXSzDvUTi5kcVW2FY/ADNpk4m0EbRakgUGl1Qxb3Yi2T/7JXTx
	Q8w5rA8Fhh9INh408GluKMAkpIlzsMPE6hn1ACNtJiF4M3M6nULDS48TQ==
X-Received: by 2002:a17:90a:da8d:b0:3a4:9fcd:6189 with SMTP id 98e67ed59e1d1-3a49fcd6271mr2463240a91.2.1790687510139;
        Tue, 29 Sep 2026 06:11:50 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985fed22sm5582137a91.9.2026.09.29.06.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:11:49 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org
Cc: dzm91@hust.edu.cn,
	wy@wyuan.org,
	si.yanteng@linux.dev,
	srcres258@furdevs.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 0/3] docs/zh_TW: mark translations that are not kept in sync
Date: Tue, 29 Sep 2026 21:11:37 +0800
Message-ID: <20260929131142.266819-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As agreed in the zh_TW scope discussion [1], process/ is the part of
zh_TW that is kept current; everything else now says in the file
itself that nobody keeps it in sync, and points readers at the English
original.  The rule is per file: the two documents that moved into
process/ with the relocation series are marked until someone updates
them.

  1/3 adds the notice and applies it to those two files
  2/3 applies it to the other 58 translations (one line each)
  3/3 links filesystems/ and cpu-freq/, which nothing linked before, via
      a translated subsystem-apis.rst, as the English tree does

The notice deliberately has no :orphan: marker: included after
disclaimer-zh_TW.rst, a second one renders as an empty "orphan" field.
(Two existing pages already show that field, because something precedes
the disclaimer include: a stray byte-order mark in
process/kernel-enforcement-statement.rst and a highlight directive in
gdb-kernel-debugging.rst.  Not fixed here.)

One consequence worth knowing: checktransupdate.py reads the "update to
commit" line of a translation's latest commit only, so any tree-wide
patch like 2/3 makes it report every touched file as current.  The
contact-block cleanup already had that effect on most of the tree.
Fixing it belongs in the tool, not in the translations.

This applies on top of the relocation series sent alongside it,
"[PATCH 0/4] docs/zh_TW: relocate translations to follow the English
layout".

[1] https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com/

Chen-Yu Yeh (3):
  docs/zh_TW: add a notice for translations not kept in sync
  docs/zh_TW: mark translations outside the maintained set
  docs/zh_TW: link filesystems/ and cpu-freq/ from the index

 .../translations/zh_TW/admin-guide/README.rst |  1 +
 .../zh_TW/admin-guide/bootconfig.rst          |  1 +
 .../zh_TW/admin-guide/bug-bisect.rst          |  1 +
 .../zh_TW/admin-guide/bug-hunting.rst         |  1 +
 .../zh_TW/admin-guide/clearing-warn-once.rst  |  1 +
 .../zh_TW/admin-guide/cpu-load.rst            |  1 +
 .../zh_TW/admin-guide/cputopology.rst         |  1 +
 .../translations/zh_TW/admin-guide/index.rst  |  1 +
 .../translations/zh_TW/admin-guide/init.rst   |  1 +
 .../zh_TW/admin-guide/lockup-watchdogs.rst    |  1 +
 .../zh_TW/admin-guide/mm/damon/index.rst      |  1 +
 .../zh_TW/admin-guide/mm/damon/lru_sort.rst   |  1 +
 .../zh_TW/admin-guide/mm/damon/reclaim.rst    |  1 +
 .../zh_TW/admin-guide/mm/damon/start.rst      |  1 +
 .../zh_TW/admin-guide/mm/damon/usage.rst      |  1 +
 .../zh_TW/admin-guide/mm/index.rst            |  1 +
 .../translations/zh_TW/admin-guide/mm/ksm.rst |  1 +
 .../zh_TW/admin-guide/reporting-issues.rst    |  1 +
 .../admin-guide/reporting-regressions.rst     |  1 +
 .../translations/zh_TW/admin-guide/sysrq.rst  |  1 +
 .../zh_TW/admin-guide/tainted-kernels.rst     |  1 +
 .../zh_TW/admin-guide/unicode.rst             |  1 +
 .../translations/zh_TW/arch/arm64/amu.rst     |  1 +
 .../zh_TW/arch/arm64/elf_hwcaps.rst           |  1 +
 .../zh_TW/arch/arm64/hugetlbpage.rst          |  1 +
 .../translations/zh_TW/arch/arm64/index.rst   |  1 +
 .../translations/zh_TW/arch/arm64/perf.rst    |  1 +
 .../translations/zh_TW/arch/index.rst         |  2 +
 .../zh_TW/arch/loongarch/booting.rst          |  1 +
 .../zh_TW/arch/loongarch/features.rst         |  1 +
 .../zh_TW/arch/loongarch/index.rst            |  1 +
 .../zh_TW/arch/loongarch/introduction.rst     |  1 +
 .../zh_TW/arch/loongarch/irq-chip-model.rst   |  1 +
 .../translations/zh_TW/arch/mips/booting.rst  |  1 +
 .../translations/zh_TW/arch/mips/features.rst |  1 +
 .../translations/zh_TW/arch/mips/index.rst    |  1 +
 .../zh_TW/arch/mips/ingenic-tcu.rst           |  1 +
 .../zh_TW/arch/openrisc/index.rst             |  1 +
 .../zh_TW/arch/openrisc/openrisc_port.rst     |  1 +
 .../translations/zh_TW/arch/openrisc/todo.rst |  1 +
 .../zh_TW/arch/parisc/debugging.rst           |  1 +
 .../translations/zh_TW/arch/parisc/index.rst  |  1 +
 .../zh_TW/arch/parisc/registers.rst           |  1 +
 .../translations/zh_TW/cpu-freq/core.rst      |  1 +
 .../zh_TW/cpu-freq/cpu-drivers.rst            |  1 +
 .../zh_TW/cpu-freq/cpufreq-stats.rst          |  1 +
 .../translations/zh_TW/cpu-freq/index.rst     |  1 +
 .../translations/zh_TW/dev-tools/gcov.rst     |  1 +
 .../translations/zh_TW/dev-tools/index.rst    |  1 +
 .../translations/zh_TW/dev-tools/kasan.rst    |  1 +
 .../translations/zh_TW/dev-tools/sparse.rst   |  4 +-
 .../zh_TW/dev-tools/testing-overview.rst      |  1 +
 .../zh_TW/filesystems/debugfs.rst             |  1 +
 .../translations/zh_TW/filesystems/index.rst  |  1 +
 .../translations/zh_TW/filesystems/tmpfs.rst  |  1 +
 .../zh_TW/filesystems/virtiofs.rst            |  1 +
 Documentation/translations/zh_TW/index.rst    |  6 +-
 .../debugging/gdb-kernel-debugging.rst        |  1 +
 .../zh_TW/process/security-bugs.rst           |  1 +
 .../translations/zh_TW/staging/index.rst      |  1 +
 .../zh_TW/staging/magic-number.rst            |  1 +
 .../translations/zh_TW/subsystem-apis.rst     | 99 +++++++++++++++++++
 .../translations/zh_TW/unmaintained-zh_TW.rst |  6 ++
 63 files changed, 173 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_TW/subsystem-apis.rst
 create mode 100644 Documentation/translations/zh_TW/unmaintained-zh_TW.rst

-- 
2.43.0

