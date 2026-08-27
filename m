Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1581512B143
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842843; cv=none; b=ZFRVrzJTdElsroyl4v5URd+UX6X5BPwS+fHuXkvY4ukZzBjXaWsTYPfAyhabn+hTeC0VexVILCS5NrIwb8KrBghw+z5YQ7A7tjHvAuz1JuB8+WhVXpqI9+BWJvY88Qq2tpZ4gh/hILaBiTHP/Ucs7yCiPB6ZAGnes2j4TH/UiGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842843; c=relaxed/simple;
	bh=jJisQZmoNeN7kotHmPRNsBJPGAw/TRSxbkRa/fKpWQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fOOss3HsrX9J4m2twxHevONMFLvCCZIxTsHtg4iCbxINdosaRK3+eao67Q5fZ/Os0bIpPEAZO0DMkYNKLIfB87O566ViLu6n/u36NjCDoK2wps5EuLJG+PznMhrWBDrQSv4JyCHyimvjBDC67mv1DPz7qE3MFS9xamYSRLuLOjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=NUqznboS; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="NUqznboS"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787842837; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=W1iRT4lyQKFuaQ8WGWytO4MA57Ut0nnyv39VyIc+UCQ=;
	b=NUqznboSLegJ0EamEaARu/+g2Fc8Ns2APxwIJaZAUGOd06G82MWlkR+N7kWfH5/QnchLva2tlFMwCaIzmbpNnq0ZhdyJty4yHCNG1UXNcBzJvAbKcqlQUyGqG8haW7sifGJgfIwSz/lfJyWqC2Wj/ZYeSeYi08eFmv3Y7mM4Opw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X9jzaao_1787842824;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0X9jzaao_1787842824 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 27 Aug 2026 23:00:35 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org
Cc: hpa@zytor.com,
	xin@zytor.com,
	luto@kernel.org,
	jpoimboe@kernel.org,
	peterz@infradead.org,
	rostedt@goodmis.org,
	akpm@linux-foundation.org,
	rdunlap@infradead.org,
	elver@google.com,
	andreyknvl@gmail.com,
	glider@google.com,
	gor@linux.ibm.com,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Yuanhe Shu <xiangzao@linux.alibaba.com>
Subject: [PATCH 0/2] x86/fred: Fix stack depot exhaustion on FRED systems
Date: Thu, 27 Aug 2026 23:00:20 +0800
Message-ID: <20260827150022.1618235-1-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FRED replaces the IDT event entry stubs with asm_fred_entrypoint_user and
asm_fred_entrypoint_kernel, which live in .noinstr.text.  The IDT stubs
are the only code covered by __irqentry_text_start..__irqentry_text_end,
which in_irqentry_text() uses to find where an event entered the kernel.
With FRED the detection fails, filter_irq_stacks() no longer truncates
event stacks, and every trace saved from interrupt or exception context
by stack depot users (KASAN alloc/free tracking, SLUB object tracking,
...) becomes a unique combination of "event path x arbitrarily
interrupted context".  The depot grows without bound until it is
exhausted.

What we saw: a FRED-capable dual-socket system with KASAN (generic,
inline) and SLUB object tracking enabled hit the limit on both sockets
roughly 80 minutes after boot,

  Stack depot reached limit capacity
  WARNING: CPU: 286 PID: 128614 at lib/stackdepot.c:271 depot_alloc_stack+0x158/0x170

after which KASAN and SLUB stack tracking silently stop recording (new
traces get handle 0) until reboot.  The recorded traces confirmed the
mechanism: interrupt side traces ran through asm_fred_entrypoint_kernel
and continued into the frames of the interrupted task.

Patch 1 adds an optional arch_in_irqentry_text() hook to the generic
in_irqentry_text() check; no behavior change by itself.  Patch 2
implements it for x86 by bracketing the FRED entry text with
__fred_entry_text_start/end, the same way the IDT stubs are bracketed,
and makes X86_FRED select the new Kconfig symbol.

Unlike arm64 and s390, which hit the same symptom and could fix it by
placing their interrupt entry code in .irqentry.text, x86 has no such
section: it emits the markers as labels around the sequentially laid out
IDT stubs and defines __irq_entry to __invalid_section so that nothing
can land in that section.  The FRED entry points therefore cannot be
brought inside the existing range, and a second one has to be reported;
see patch 2 for the details.

Testing:

  - Build-tested on mainline: full vmlinux builds and link with
    CONFIG_X86_FRED=y, CONFIG_X86_KERNEL_IBT=y and KASAN (generic,
    inline), with and without CONFIG_KVM_INTEL=y; objtool link stage
    clean.
  - Runtime-tested by backporting both patches to the affected kernel (a
    6.6 based debug build) and rebooting that system with an unchanged
    command line: traces recorded from FRED event context now end at
    asm_fred_entrypoint_kernel instead of continuing into the
    interrupted task, and the pool count levels off at ~1230 pools
    within minutes of boot instead of reaching the 8192 pool limit.

Reproducing on current upstream:

  - On FRED hardware, any KASAN or SLUB_DEBUG kernel; on v6.17 and
    later, boot with stack_depot_max_pools=1024 to bring the
    exhaustion warning up in minutes instead of hours, and watch the
    pool count in /sys/kernel/debug/stackdepot/stats grow
    monotonically without the fix and converge with it.
  - Without FRED hardware, the KVM VMX interrupt forwarding path
    (CONFIG_X86_FRED=y + CONFIG_KVM_INTEL) exercises the new filtering
    as well, see patch 2.

Both patches are Cc'ed to stable and 2/2 depends on 1/2, so please pick
them up as a pair.  Patch 1 touches kernel/stacktrace.c and lib/Kconfig;
routing the series through tip:x86/entry with an Acked-by from Andrew
for 1/2 is probably the smoothest path.

Yuanhe Shu (2):
  stacktrace: Provide arch_in_irqentry_text() hook
  x86/fred: Fix stack depot filtering of FRED event stacks

 arch/x86/Kconfig                |  1 +
 arch/x86/entry/entry_64_fred.S  | 14 ++++++++++++++
 arch/x86/include/asm/sections.h |  1 +
 arch/x86/kernel/stacktrace.c    | 13 +++++++++++++
 include/linux/stacktrace.h      | 16 ++++++++++++++++
 kernel/stacktrace.c             |  3 ++-
 lib/Kconfig                     |  3 +++
 7 files changed, 50 insertions(+), 1 deletion(-)

base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
-- 
2.43.5

