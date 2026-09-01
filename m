Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0F033BBAF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266437; cv=none; b=GFApKyEhFbr8h4tDm4cQO7kUQQSO5gCE34dxyT6w1H1+ZtJKtKm2yqkrZNI+tUx81vYDu4uXy95lNiODbYeni1Qq8UkSDYRVMwW6ow/kY9JtmLAUUHRATBowN7Baa6hO2SYp1W/U0jjOX2wYgcbNYMAngBgyT8Tzn7iff8X51rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266437; c=relaxed/simple;
	bh=3SIYIyUDdQCF2JF0OHof9pEFQ12Gc2dS4P26EvEI7IU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gDwOhkzv8d6ze8YcoYIfRsmTo5eKJB4ZcqjAYt/HazgBbObOl8Dy7VUGZX+69tiRH5draYB5uvVZeB73BGg3h06Fr25Bx6htlifrEoEfQXBvzDEbKIzBSjByAN3CC346CSSNZt6bOPZel7L9BsVLnK+wRgI9TETHV3VVdhiyYx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=C/8s1xJi; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="C/8s1xJi"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788266431; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Rq5DIFRo4t/lykOEA+r/IF9YYlZ2m5dSpna+ACFRmxo=;
	b=C/8s1xJiAKmcMBlfH2idU87qar5CKhmGAKSCGjz62u0d1B9t738zSFRJRSXHuG7zuXXnmIt96TFngPV/Ltm8sckYql65X5o3CZICs/XYWrT4stv9/XPmpAw3W0yqXXBUq/M7pjGxonQl6XyNaQQPWAt3V/EpbdLFVK/oIxvTKNE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XA8SZsD_1788266415;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XA8SZsD_1788266415 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Sep 2026 20:40:29 +0800
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
	brads@mainlining.org,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Yuanhe Shu <xiangzao@linux.alibaba.com>
Subject: [PATCH v3 0/2] x86/fred: Fix stack depot exhaustion on FRED systems
Date: Tue,  1 Sep 2026 20:40:11 +0800
Message-ID: <20260901124013.1098560-1-xiangzao@linux.alibaba.com>
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

Patch 1 adds an optional arch_in_event_entry_text() hook to the generic
entry text check, and renames that check from in_irqentry_text() to
in_event_entry_text() since neither it nor the ranges it tests are
necessarily irq-only; no behavior change by itself.  Patch 2
implements it for x86 by bracketing the FRED entry text with
__fred_entry_text_start/end, the same way the IDT stubs are bracketed,
and reporting that range from <asm/sections.h>.

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
    inline), with and without CONFIG_KVM_INTEL=y, and with
    CONFIG_X86_FRED=n so that the generic fallback is used; objtool link
    stage clean.
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

Both patches carry the same Fixes: tag and are Cc'ed to stable, and 2/2
uses the hook added by 1/2, so they need to be applied together.

Changes in v3:

  - 1/2: drop the x86 details from the generic comment and phrase it as an
    instruction for future arch maintainers (Dave Hansen)
  - 1/2: restore Bradley Morgan's Reviewed-by - he confirmed the tag still
    holds for the reworked version
  - 2/2: state the caveat that the range cannot tell interrupt entry and
    syscall entry apart here rather than in the generic comment

Changes in v2:

  - 1/2: drop the new ARCH_HAS_IN_IRQENTRY_TEXT Kconfig symbol and use the
    #ifndef macro override pattern instead, with the fallback next to its
    only user in kernel/stacktrace.c (Peter Zijlstra)
  - 1/2: rename in_irqentry_text() to in_event_entry_text() and name the
    hook after it - the ranges are not necessarily irq-only; on x86 they
    cover the exception entry stubs too (Peter Zijlstra)
  - 1/2: carry the same Fixes: tag as 2/2 (Andrew Morton)
  - 1/2: drop Bradley Morgan's Reviewed-by since the patch changed
    materially
  - 2/2: implement the hook as a static inline in <asm/sections.h> next to
    the markers it tests, instead of a Kconfig gated function in
    arch/x86/kernel/stacktrace.c; arch/x86/Kconfig is no longer touched
  - 2/2: spell out, in the changelog and in a comment on the hook, why the
    range covering the ring 3 entry point, and therefore syscalls, does not
    change any trace (Peter Zijlstra)
  - 2/2: add Reported-by for Xiang Zheng, who found the exhaustion

v1: https://lore.kernel.org/r/20260827150022.1618235-1-xiangzao@linux.alibaba.com
v2: https://lore.kernel.org/r/20260831120221.2874445-1-xiangzao@linux.alibaba.com

Yuanhe Shu (2):
  stacktrace: Provide arch_in_event_entry_text() hook
  x86/fred: Fix stack depot filtering of FRED event stacks

 arch/x86/entry/entry_64_fred.S  | 14 ++++++++++++++
 arch/x86/include/asm/sections.h | 24 ++++++++++++++++++++++++
 kernel/stacktrace.c             | 19 ++++++++++++++++---
 3 files changed, 54 insertions(+), 3 deletions(-)


base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
-- 
2.43.7

