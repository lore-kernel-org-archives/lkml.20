Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190093;
	b=wQBMpurRrAie6JWYp5PKPIGGBYo3Ujxu4/2aa5pFJ31W+RNgSIkBp51P9IjNC5HM1GPR
	 2qNPsB2cXYUQUX5NPrneQeBOpd0tmFnDehNHDeZjNobfBrcxjl0oAV+gJivghV4Q1eoA7
	 sz0l+gdn6C/VlDDk9tzUiBfHlAlPpLwttydQ68MipxnGq+AqdQ5FwC7bo6PmixbaVk8hI
	 28+ksElRs55+V1N7CKTrklIEnUVVEFhj3xrtpJnnpBSlT/scg3KFzhy5bROdosMCGkIHl
	 33da+V8BjAB8M2wipGEtoRXC7z227xOkM+4X5tRm4aGp5fiYDrcxKvDc7O0MOBb4m5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190093;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=xgv4DHMBLJw/6StjZfCtWOtaFd2675HBZJ/yttWEu4w=;
	b=f5IxmuizQ0irf51TbYWS9udEjg7DYESU3P8NA2j4FREvtLfrLg6qgDcPYaEF14iwkHeB
	 ba421OO2mOzVdtilehffUr+ODQ0kZPcF4tpgbqCCGtZN1JFbYRqZ7Ov7m+XCB1Sjgh2Hl
	 qOGjEvdaOOhUobC94jp/QQH+lPiDI8rAQPMV2G9cp/DUpIJ1Um4E2l19Cb4GTXu4KwgOo
	 kGR/YtVg63LDEjTMRvHyh89PMnNHj4/kw3YghrqdQUteKThZGAHhkd/XD+T4pFNMCAR+d
	 ahOti87m/NjzUa66WE3p2i0hJcP+bFuoGbhMLeUzxp1wPW2+wmsZ0jVlsvDke2Vu2Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=rmms7Ofe;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155F9606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 155F9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=rmms7Ofe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=xgv4DHMBLJw/6StjZfCtWOtaFd2675HBZJ/yttWEu4w=; b=rmms7OfeYwMgq/LxOVi7+2/p6q
	RqiCyX0Cjgov6etXbqdYQ3tJ6J7caxQzkcHo5iZqBXbLpGoOe0yrKdrDkj+cEB2fRkAUwlknLCTSW
	io4Q621B/2hBozhe8wp9alEpx2mLv/O3R/yRluxFVDjldFSvwkeY0PL1d66agJsKUt2fvwiCvjbxZ
	bKIbLzTm9Sv3cMRk5Qd+pir57bGBI7BhI+NmpGvReAttbqllutUSW2cZqD09peRWxmYNn8ry8rwo2
	ZvomEV/r6ZH7pUExBhmeeDkJVbIKJX9yasvKpUUrFYZP91DYm/Fh+Uux02Ff9LFxJiDxQAQg8g0di
	NpHiOVbw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2ek-00000003N6L-08j0;
	Wed, 28 Oct 2026 12:21:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CCA4E30120E; Wed, 28 Oct 2026 13:21:24 +0100 (CET)
Date: Wed, 28 Oct 2026 13:21:24 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	steve.wahl@hpe.com, justin.ernst@hpe.com, kyle.meyer@hpe.com,
	dimitri.sivanich@hpe.com, russ.anderson@hpe.com,
	linux-kernel@vger.kernel.org, mhiramat@kernel.org
Subject: [PATCH] x86: Drop KGDB support
Message-ID: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


KGDB does some horrible things, and with everybody having access to
virtualization these days, there is really no reason to use it over
Qemu's gdb-server.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/Kconfig                     |   2 -
 arch/x86/include/asm/kgdb.h          |  92 ----
 arch/x86/include/asm/text-patching.h |   1 -
 arch/x86/kernel/Makefile             |   1 -
 arch/x86/kernel/alternative.c        |  50 +--
 arch/x86/kernel/cpu/common.c         |  16 -
 arch/x86/kernel/early_printk.c       |   8 -
 arch/x86/kernel/kgdb.c               | 785 -----------------------------------
 arch/x86/kernel/kprobes/core.c       |  10 -
 arch/x86/kernel/kprobes/opt.c        |  11 +-
 arch/x86/kernel/traps.c              |  10 +-
 arch/x86/platform/uv/uv_nmi.c        |  76 ----
 12 files changed, 13 insertions(+), 1049 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index a5e29ffd5ddc..627553e8496f 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -82,7 +82,6 @@ config X86
 	select ARCH_HAS_DELAY_TIMER
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_DMA_OPS			if GART_IOMMU || XEN
-	select ARCH_HAS_EARLY_DEBUG		if KGDB
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_EXECMEM_ROX		if X86_64 && STRICT_MODULE_RWX
 	select ARCH_HAS_FAST_MULTIPLIER
@@ -198,7 +197,6 @@ config X86
 	select HAVE_ARCH_KASAN_VMALLOC		if X86_64
 	select HAVE_ARCH_KFENCE
 	select HAVE_ARCH_KMSAN			if X86_64
-	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_KSTACK_ERASE
 	select HAVE_ARCH_MMAP_RND_BITS		if MMU
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if MMU && COMPAT
diff --git a/arch/x86/include/asm/kgdb.h b/arch/x86/include/asm/kgdb.h
deleted file mode 100644
index aacaf2502bd2..000000000000
--- a/arch/x86/include/asm/kgdb.h
+++ /dev/null
@@ -1,92 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_X86_KGDB_H
-#define _ASM_X86_KGDB_H
-
-/*
- * Copyright (C) 2001-2004 Amit S. Kale
- * Copyright (C) 2008 Wind River Systems, Inc.
- */
-
-#include <asm/ptrace.h>
-
-/*
- * BUFMAX defines the maximum number of characters in inbound/outbound
- * buffers at least NUMREGBYTES*2 are needed for register packets
- * Longer buffer is needed to list all threads
- */
-#define BUFMAX			1024
-
-/*
- *  Note that this register image is in a different order than
- *  the register image that Linux produces at interrupt time.
- *
- *  Linux's register image is defined by struct pt_regs in ptrace.h.
- *  Just why GDB uses a different order is a historical mystery.
- */
-#ifdef CONFIG_X86_32
-enum regnames {
-	GDB_AX,			/* 0 */
-	GDB_CX,			/* 1 */
-	GDB_DX,			/* 2 */
-	GDB_BX,			/* 3 */
-	GDB_SP,			/* 4 */
-	GDB_BP,			/* 5 */
-	GDB_SI,			/* 6 */
-	GDB_DI,			/* 7 */
-	GDB_PC,			/* 8 also known as eip */
-	GDB_PS,			/* 9 also known as eflags */
-	GDB_CS,			/* 10 */
-	GDB_SS,			/* 11 */
-	GDB_DS,			/* 12 */
-	GDB_ES,			/* 13 */
-	GDB_FS,			/* 14 */
-	GDB_GS,			/* 15 */
-};
-#define GDB_ORIG_AX		41
-#define DBG_MAX_REG_NUM		16
-#define NUMREGBYTES		((GDB_GS+1)*4)
-#else /* ! CONFIG_X86_32 */
-enum regnames {
-	GDB_AX,			/* 0 */
-	GDB_BX,			/* 1 */
-	GDB_CX,			/* 2 */
-	GDB_DX,			/* 3 */
-	GDB_SI,			/* 4 */
-	GDB_DI,			/* 5 */
-	GDB_BP,			/* 6 */
-	GDB_SP,			/* 7 */
-	GDB_R8,			/* 8 */
-	GDB_R9,			/* 9 */
-	GDB_R10,		/* 10 */
-	GDB_R11,		/* 11 */
-	GDB_R12,		/* 12 */
-	GDB_R13,		/* 13 */
-	GDB_R14,		/* 14 */
-	GDB_R15,		/* 15 */
-	GDB_PC,			/* 16 */
-	GDB_PS,			/* 17 */
-	GDB_CS,			/* 18 */
-	GDB_SS,			/* 19 */
-	GDB_DS,			/* 20 */
-	GDB_ES,			/* 21 */
-	GDB_FS,			/* 22 */
-	GDB_GS,			/* 23 */
-};
-#define GDB_ORIG_AX		57
-#define DBG_MAX_REG_NUM		24
-/* 17 64 bit regs and 5 32 bit regs */
-#define NUMREGBYTES		((17 * 8) + (5 * 4))
-#endif /* ! CONFIG_X86_32 */
-
-static inline void arch_kgdb_breakpoint(void)
-{
-	asm("   int $3");
-}
-#define BREAK_INSTR_SIZE	1
-#define CACHE_FLUSH_IS_SAFE	1
-#define GDB_ADJUSTS_BREAK_OFFSET
-
-extern int kgdb_ll_trap(int cmd, const char *str,
-			struct pt_regs *regs, long err, int trap, int sig);
-
-#endif /* _ASM_X86_KGDB_H */
diff --git a/arch/x86/include/asm/text-patching.h b/arch/x86/include/asm/text-patching.h
index ea09381070e8..a1d284560ef8 100644
--- a/arch/x86/include/asm/text-patching.h
+++ b/arch/x86/include/asm/text-patching.h
@@ -33,7 +33,6 @@ extern void text_poke_apply_relocation(u8 *buf, const u8 * const instr, size_t i
  */
 extern void *text_poke(void *addr, const void *opcode, size_t len);
 extern void smp_text_poke_sync_each_cpu(void);
-extern void *text_poke_kgdb(void *addr, const void *opcode, size_t len);
 extern void *text_poke_copy(void *addr, const void *opcode, size_t len);
 #define text_poke_copy text_poke_copy
 extern void *text_poke_copy_locked(void *addr, const void *opcode, size_t len, bool core_ok);
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 31f46fd00527..1a16af34dee3 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -128,7 +128,6 @@ obj-$(CONFIG_CRASH_DUMP)	+= crash_dump_$(BITS).o crash.o
 obj-y				+= kprobes/
 obj-$(CONFIG_MODULES)		+= module.o
 obj-$(CONFIG_X86_32)		+= doublefault_32.o
-obj-$(CONFIG_KGDB)		+= kgdb.o
 obj-$(CONFIG_VM86)		+= vm86_32.o
 obj-$(CONFIG_EARLY_PRINTK)	+= early_printk.o
 
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index efbc11f8c336..d8add52ff923 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -7,7 +7,6 @@
 #include <linux/memory.h>
 #include <linux/execmem.h>
 #include <linux/cleanup.h>
-#include <linux/kgdb.h>
 #include <linux/mmap_lock.h>
 
 #include <asm/text-patching.h>
@@ -2393,25 +2392,17 @@ static void __poke_vmalloc_pages(struct page **pages, void *addr,
 static void poke_vmalloc_pages(struct page **pages, void *addr,
 			       bool cross_page_boundary)
 {
-	if (in_dbg_master()) {
-		/*
-		 * If called from kgdb cannot sleep, but all other CPUs stopped
-		 * anyway so safe to proceed without locks
-		 */
-		__poke_vmalloc_pages(pages, addr, cross_page_boundary);
-	} else {
-		/*
-		 * execmem ROX ranges are shared between modules and can be
-		 * collapsed to huge PMD entries, and this collapse can happen
-		 * concurrently with a racing set_memory_rox().
-		 *
-		 * Prevent vmalloc_to_page() from racing by acquiring an
-		 * init_mm read lock which pairs with the init_mm write lock in
-		 * cpa_collapse_large_pages().
-		 */
-		guard(mmap_read_lock)(&init_mm);
-		__poke_vmalloc_pages(pages, addr, cross_page_boundary);
-	}
+	/*
+	 * execmem ROX ranges are shared between modules and can be
+	 * collapsed to huge PMD entries, and this collapse can happen
+	 * concurrently with a racing set_memory_rox().
+	 *
+	 * Prevent vmalloc_to_page() from racing by acquiring an
+	 * init_mm read lock which pairs with the init_mm write lock in
+	 * cpa_collapse_large_pages().
+	 */
+	guard(mmap_read_lock)(&init_mm);
+	__poke_vmalloc_pages(pages, addr, cross_page_boundary);
 }
 
 static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t len)
@@ -2541,25 +2532,6 @@ void *text_poke(void *addr, const void *opcode, size_t len)
 	return __text_poke(text_poke_memcpy, addr, opcode, len);
 }
 
-/**
- * text_poke_kgdb - Update instructions on a live kernel by kgdb
- * @addr: address to modify
- * @opcode: source of the copy
- * @len: length to copy
- *
- * Only atomic text poke/set should be allowed when not doing early patching.
- * It means the size must be writable atomically and the address must be aligned
- * in a way that permits an atomic write. It also makes sure we fit on a single
- * page.
- *
- * Context: should only be used by kgdb, which ensures no other core is running,
- *	    despite the fact it does not hold the text_mutex.
- */
-void *text_poke_kgdb(void *addr, const void *opcode, size_t len)
-{
-	return __text_poke(text_poke_memcpy, addr, opcode, len);
-}
-
 void *text_poke_copy_locked(void *addr, const void *opcode, size_t len,
 			    bool core_ok)
 {
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 9bd50c68cd7e..8a4aabcd5d60 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -18,7 +18,6 @@
 #include <linux/sched/smt.h>
 #include <linux/init.h>
 #include <linux/kprobes.h>
-#include <linux/kgdb.h>
 #include <linux/mem_encrypt.h>
 #include <linux/smp.h>
 #include <linux/cpu.h>
@@ -2340,20 +2339,6 @@ static void initialize_debug_regs(void)
 	set_debugreg(0, 0);
 }
 
-#ifdef CONFIG_KGDB
-/*
- * Restore debug regs if using kgdbwait and you have a kernel debugger
- * connection established.
- */
-static void dbg_restore_debug_regs(void)
-{
-	if (unlikely(kgdb_connected && arch_kgdb_ops.correct_hw_break))
-		arch_kgdb_ops.correct_hw_break();
-}
-#else /* ! CONFIG_KGDB */
-#define dbg_restore_debug_regs()
-#endif /* ! CONFIG_KGDB */
-
 static inline void setup_getcpu(int cpu)
 {
 	unsigned long cpudata = vdso_encode_cpunode(cpu, early_cpu_to_node(cpu));
@@ -2511,7 +2496,6 @@ void cpu_init(void)
 	load_mm_ldt(&init_mm);
 
 	initialize_debug_regs();
-	dbg_restore_debug_regs();
 
 	doublefault_init_cpu_tss();
 
diff --git a/arch/x86/kernel/early_printk.c b/arch/x86/kernel/early_printk.c
index cba75306e5b6..ad7534771bcf 100644
--- a/arch/x86/kernel/early_printk.c
+++ b/arch/x86/kernel/early_printk.c
@@ -46,14 +46,6 @@ static void early_vga_write(struct console *con, const char *str, unsigned n)
 				writew(0x720, VGABASE + 2*(max_xpos*j + i));
 			current_ypos = max_ypos-1;
 		}
-#ifdef CONFIG_KGDB_KDB
-		if (c == '\b') {
-			if (current_xpos > 0)
-				current_xpos--;
-		} else if (c == '\r') {
-			current_xpos = 0;
-		} else
-#endif
 		if (c == '\n') {
 			current_xpos = 0;
 			current_ypos++;
diff --git a/arch/x86/kernel/kgdb.c b/arch/x86/kernel/kgdb.c
deleted file mode 100644
index 96af1242454e..000000000000
--- a/arch/x86/kernel/kgdb.c
+++ /dev/null
@@ -1,785 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- */
-
-/*
- * Copyright (C) 2004 Amit S. Kale <amitkale@linsyssoft.com>
- * Copyright (C) 2000-2001 VERITAS Software Corporation.
- * Copyright (C) 2002 Andi Kleen, SuSE Labs
- * Copyright (C) 2004 LinSysSoft Technologies Pvt. Ltd.
- * Copyright (C) 2007 MontaVista Software, Inc.
- * Copyright (C) 2007-2008 Jason Wessel, Wind River Systems, Inc.
- */
-/****************************************************************************
- *  Contributor:     Lake Stevens Instrument Division$
- *  Written by:      Glenn Engel $
- *  Updated by:	     Amit Kale<akale@veritas.com>
- *  Updated by:	     Tom Rini <trini@kernel.crashing.org>
- *  Updated by:	     Jason Wessel <jason.wessel@windriver.com>
- *  Modified for 386 by Jim Kingdon, Cygnus Support.
- *  Original kgdb, compatibility with 2.1.xx kernel by
- *  David Grothe <dave@gcom.com>
- *  Integrated into 2.2.5 kernel by Tigran Aivazian <tigran@sco.com>
- *  X86_64 changes from Andi Kleen's patch merged by Jim Houston
- */
-#include <linux/spinlock.h>
-#include <linux/kdebug.h>
-#include <linux/string.h>
-#include <linux/kernel.h>
-#include <linux/ptrace.h>
-#include <linux/sched.h>
-#include <linux/delay.h>
-#include <linux/kgdb.h>
-#include <linux/smp.h>
-#include <linux/nmi.h>
-#include <linux/hw_breakpoint.h>
-#include <linux/uaccess.h>
-#include <linux/memory.h>
-
-#include <asm/text-patching.h>
-#include <asm/debugreg.h>
-#include <asm/apicdef.h>
-#include <asm/apic.h>
-#include <asm/nmi.h>
-#include <asm/switch_to.h>
-
-struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] =
-{
-#ifdef CONFIG_X86_32
-	{ "ax", 4, offsetof(struct pt_regs, ax) },
-	{ "cx", 4, offsetof(struct pt_regs, cx) },
-	{ "dx", 4, offsetof(struct pt_regs, dx) },
-	{ "bx", 4, offsetof(struct pt_regs, bx) },
-	{ "sp", 4, offsetof(struct pt_regs, sp) },
-	{ "bp", 4, offsetof(struct pt_regs, bp) },
-	{ "si", 4, offsetof(struct pt_regs, si) },
-	{ "di", 4, offsetof(struct pt_regs, di) },
-	{ "ip", 4, offsetof(struct pt_regs, ip) },
-	{ "flags", 4, offsetof(struct pt_regs, flags) },
-	{ "cs", 4, offsetof(struct pt_regs, cs) },
-	{ "ss", 4, offsetof(struct pt_regs, ss) },
-	{ "ds", 4, offsetof(struct pt_regs, ds) },
-	{ "es", 4, offsetof(struct pt_regs, es) },
-#else
-	{ "ax", 8, offsetof(struct pt_regs, ax) },
-	{ "bx", 8, offsetof(struct pt_regs, bx) },
-	{ "cx", 8, offsetof(struct pt_regs, cx) },
-	{ "dx", 8, offsetof(struct pt_regs, dx) },
-	{ "si", 8, offsetof(struct pt_regs, si) },
-	{ "di", 8, offsetof(struct pt_regs, di) },
-	{ "bp", 8, offsetof(struct pt_regs, bp) },
-	{ "sp", 8, offsetof(struct pt_regs, sp) },
-	{ "r8", 8, offsetof(struct pt_regs, r8) },
-	{ "r9", 8, offsetof(struct pt_regs, r9) },
-	{ "r10", 8, offsetof(struct pt_regs, r10) },
-	{ "r11", 8, offsetof(struct pt_regs, r11) },
-	{ "r12", 8, offsetof(struct pt_regs, r12) },
-	{ "r13", 8, offsetof(struct pt_regs, r13) },
-	{ "r14", 8, offsetof(struct pt_regs, r14) },
-	{ "r15", 8, offsetof(struct pt_regs, r15) },
-	{ "ip", 8, offsetof(struct pt_regs, ip) },
-	{ "flags", 4, offsetof(struct pt_regs, flags) },
-	{ "cs", 4, offsetof(struct pt_regs, cs) },
-	{ "ss", 4, offsetof(struct pt_regs, ss) },
-	{ "ds", 4, -1 },
-	{ "es", 4, -1 },
-#endif
-	{ "fs", 4, -1 },
-	{ "gs", 4, -1 },
-};
-
-int dbg_set_reg(int regno, void *mem, struct pt_regs *regs)
-{
-	if (
-#ifdef CONFIG_X86_32
-	    regno == GDB_SS || regno == GDB_FS || regno == GDB_GS ||
-#endif
-	    regno == GDB_SP || regno == GDB_ORIG_AX)
-		return 0;
-
-	if (dbg_reg_def[regno].offset != -1)
-		memcpy((void *)regs + dbg_reg_def[regno].offset, mem,
-		       dbg_reg_def[regno].size);
-	return 0;
-}
-
-char *dbg_get_reg(int regno, void *mem, struct pt_regs *regs)
-{
-	if (regno == GDB_ORIG_AX) {
-		memcpy(mem, &regs->orig_ax, sizeof(regs->orig_ax));
-		return "orig_ax";
-	}
-	if (regno >= DBG_MAX_REG_NUM || regno < 0)
-		return NULL;
-
-	if (dbg_reg_def[regno].offset != -1)
-		memcpy(mem, (void *)regs + dbg_reg_def[regno].offset,
-		       dbg_reg_def[regno].size);
-
-#ifdef CONFIG_X86_32
-	switch (regno) {
-	case GDB_GS:
-	case GDB_FS:
-		*(unsigned long *)mem = 0xFFFF;
-		break;
-	}
-#endif
-	return dbg_reg_def[regno].name;
-}
-
-/**
- *	sleeping_thread_to_gdb_regs - Convert ptrace regs to GDB regs
- *	@gdb_regs: A pointer to hold the registers in the order GDB wants.
- *	@p: The &struct task_struct of the desired process.
- *
- *	Convert the register values of the sleeping process in @p to
- *	the format that GDB expects.
- *	This function is called when kgdb does not have access to the
- *	&struct pt_regs and therefore it should fill the gdb registers
- *	@gdb_regs with what has	been saved in &struct thread_struct
- *	thread field during switch_to.
- */
-void sleeping_thread_to_gdb_regs(unsigned long *gdb_regs, struct task_struct *p)
-{
-#ifndef CONFIG_X86_32
-	u32 *gdb_regs32 = (u32 *)gdb_regs;
-#endif
-	gdb_regs[GDB_AX]	= 0;
-	gdb_regs[GDB_BX]	= 0;
-	gdb_regs[GDB_CX]	= 0;
-	gdb_regs[GDB_DX]	= 0;
-	gdb_regs[GDB_SI]	= 0;
-	gdb_regs[GDB_DI]	= 0;
-	gdb_regs[GDB_BP]	= ((struct inactive_task_frame *)p->thread.sp)->bp;
-#ifdef CONFIG_X86_32
-	gdb_regs[GDB_DS]	= __KERNEL_DS;
-	gdb_regs[GDB_ES]	= __KERNEL_DS;
-	gdb_regs[GDB_PS]	= 0;
-	gdb_regs[GDB_CS]	= __KERNEL_CS;
-	gdb_regs[GDB_SS]	= __KERNEL_DS;
-	gdb_regs[GDB_FS]	= 0xFFFF;
-	gdb_regs[GDB_GS]	= 0xFFFF;
-#else
-	gdb_regs32[GDB_PS]	= 0;
-	gdb_regs32[GDB_CS]	= __KERNEL_CS;
-	gdb_regs32[GDB_SS]	= __KERNEL_DS;
-	gdb_regs[GDB_R8]	= 0;
-	gdb_regs[GDB_R9]	= 0;
-	gdb_regs[GDB_R10]	= 0;
-	gdb_regs[GDB_R11]	= 0;
-	gdb_regs[GDB_R12]	= 0;
-	gdb_regs[GDB_R13]	= 0;
-	gdb_regs[GDB_R14]	= 0;
-	gdb_regs[GDB_R15]	= 0;
-#endif
-	gdb_regs[GDB_PC]	= 0;
-	gdb_regs[GDB_SP]	= p->thread.sp;
-}
-
-static struct hw_breakpoint {
-	unsigned		enabled;
-	unsigned long		addr;
-	int			len;
-	int			type;
-	struct perf_event	* __percpu *pev;
-} breakinfo[HBP_NUM];
-
-static unsigned long early_dr7;
-
-static void kgdb_correct_hw_break(void)
-{
-	int breakno;
-
-	for (breakno = 0; breakno < HBP_NUM; breakno++) {
-		struct perf_event *bp;
-		struct arch_hw_breakpoint *info;
-		int val;
-		int cpu = raw_smp_processor_id();
-		if (!breakinfo[breakno].enabled)
-			continue;
-		if (dbg_is_early) {
-			set_debugreg(breakinfo[breakno].addr, breakno);
-			early_dr7 |= encode_dr7(breakno,
-						breakinfo[breakno].len,
-						breakinfo[breakno].type);
-			set_debugreg(early_dr7, 7);
-			continue;
-		}
-		bp = *per_cpu_ptr(breakinfo[breakno].pev, cpu);
-		info = counter_arch_bp(bp);
-		if (bp->attr.disabled != 1)
-			continue;
-		bp->attr.bp_addr = breakinfo[breakno].addr;
-		bp->attr.bp_len = breakinfo[breakno].len;
-		bp->attr.bp_type = breakinfo[breakno].type;
-		info->address = breakinfo[breakno].addr;
-		info->len = breakinfo[breakno].len;
-		info->type = breakinfo[breakno].type;
-		val = arch_install_hw_breakpoint(bp);
-		if (!val)
-			bp->attr.disabled = 0;
-	}
-	if (!dbg_is_early)
-		hw_breakpoint_restore();
-}
-
-static int hw_break_reserve_slot(int breakno)
-{
-	int cpu;
-	int cnt = 0;
-	struct perf_event **pevent;
-
-	if (dbg_is_early)
-		return 0;
-
-	for_each_online_cpu(cpu) {
-		cnt++;
-		pevent = per_cpu_ptr(breakinfo[breakno].pev, cpu);
-		if (dbg_reserve_bp_slot(*pevent))
-			goto fail;
-	}
-
-	return 0;
-
-fail:
-	for_each_online_cpu(cpu) {
-		cnt--;
-		if (!cnt)
-			break;
-		pevent = per_cpu_ptr(breakinfo[breakno].pev, cpu);
-		dbg_release_bp_slot(*pevent);
-	}
-	return -1;
-}
-
-static int hw_break_release_slot(int breakno)
-{
-	struct perf_event **pevent;
-	int cpu;
-
-	if (dbg_is_early)
-		return 0;
-
-	for_each_online_cpu(cpu) {
-		pevent = per_cpu_ptr(breakinfo[breakno].pev, cpu);
-		if (dbg_release_bp_slot(*pevent))
-			/*
-			 * The debugger is responsible for handing the retry on
-			 * remove failure.
-			 */
-			return -1;
-	}
-	return 0;
-}
-
-static int
-kgdb_remove_hw_break(unsigned long addr, int len, enum kgdb_bptype bptype)
-{
-	int i;
-
-	for (i = 0; i < HBP_NUM; i++)
-		if (breakinfo[i].addr == addr && breakinfo[i].enabled)
-			break;
-	if (i == HBP_NUM)
-		return -1;
-
-	if (hw_break_release_slot(i)) {
-		printk(KERN_ERR "Cannot remove hw breakpoint at %lx\n", addr);
-		return -1;
-	}
-	breakinfo[i].enabled = 0;
-
-	return 0;
-}
-
-static void kgdb_remove_all_hw_break(void)
-{
-	int i;
-	int cpu = raw_smp_processor_id();
-	struct perf_event *bp;
-
-	for (i = 0; i < HBP_NUM; i++) {
-		if (!breakinfo[i].enabled)
-			continue;
-		bp = *per_cpu_ptr(breakinfo[i].pev, cpu);
-		if (!bp->attr.disabled) {
-			arch_uninstall_hw_breakpoint(bp);
-			bp->attr.disabled = 1;
-			continue;
-		}
-		if (dbg_is_early)
-			early_dr7 &= ~encode_dr7(i, breakinfo[i].len,
-						 breakinfo[i].type);
-		else if (hw_break_release_slot(i))
-			printk(KERN_ERR "KGDB: hw bpt remove failed %lx\n",
-			       breakinfo[i].addr);
-		breakinfo[i].enabled = 0;
-	}
-}
-
-static int
-kgdb_set_hw_break(unsigned long addr, int len, enum kgdb_bptype bptype)
-{
-	int i;
-
-	for (i = 0; i < HBP_NUM; i++)
-		if (!breakinfo[i].enabled)
-			break;
-	if (i == HBP_NUM)
-		return -1;
-
-	switch (bptype) {
-	case BP_HARDWARE_BREAKPOINT:
-		len = 1;
-		breakinfo[i].type = X86_BREAKPOINT_EXECUTE;
-		break;
-	case BP_WRITE_WATCHPOINT:
-		breakinfo[i].type = X86_BREAKPOINT_WRITE;
-		break;
-	case BP_ACCESS_WATCHPOINT:
-		breakinfo[i].type = X86_BREAKPOINT_RW;
-		break;
-	default:
-		return -1;
-	}
-	switch (len) {
-	case 1:
-		breakinfo[i].len = X86_BREAKPOINT_LEN_1;
-		break;
-	case 2:
-		breakinfo[i].len = X86_BREAKPOINT_LEN_2;
-		break;
-	case 4:
-		breakinfo[i].len = X86_BREAKPOINT_LEN_4;
-		break;
-#ifdef CONFIG_X86_64
-	case 8:
-		breakinfo[i].len = X86_BREAKPOINT_LEN_8;
-		break;
-#endif
-	default:
-		return -1;
-	}
-	breakinfo[i].addr = addr;
-	if (hw_break_reserve_slot(i)) {
-		breakinfo[i].addr = 0;
-		return -1;
-	}
-	breakinfo[i].enabled = 1;
-
-	return 0;
-}
-
-/**
- *	kgdb_disable_hw_debug - Disable hardware debugging while we in kgdb.
- *	@regs: Current &struct pt_regs.
- *
- *	This function will be called if the particular architecture must
- *	disable hardware debugging while it is processing gdb packets or
- *	handling exception.
- */
-static void kgdb_disable_hw_debug(struct pt_regs *regs)
-{
-	int i;
-	int cpu = raw_smp_processor_id();
-	struct perf_event *bp;
-
-	/* Disable hardware debugging while we are in kgdb: */
-	set_debugreg(DR7_FIXED_1, 7);
-	for (i = 0; i < HBP_NUM; i++) {
-		if (!breakinfo[i].enabled)
-			continue;
-		if (dbg_is_early) {
-			early_dr7 &= ~encode_dr7(i, breakinfo[i].len,
-						 breakinfo[i].type);
-			continue;
-		}
-		bp = *per_cpu_ptr(breakinfo[i].pev, cpu);
-		if (bp->attr.disabled == 1)
-			continue;
-		arch_uninstall_hw_breakpoint(bp);
-		bp->attr.disabled = 1;
-	}
-}
-
-#ifdef CONFIG_SMP
-/**
- *	kgdb_roundup_cpus - Get other CPUs into a holding pattern
- *
- *	On SMP systems, we need to get the attention of the other CPUs
- *	and get them into a known state.  This should do what is needed
- *	to get the other CPUs to call kgdb_handle_exception().  Note that
- *	on some arches, the NMI approach is not used for rounding up all
- *	the CPUs.  For example, in case of MIPS, smp_call_function() is
- *	used to roundup CPUs.
- *
- *	On non-SMP systems, this is not called.
- */
-void kgdb_roundup_cpus(void)
-{
-	apic_send_IPI_allbutself(NMI_VECTOR);
-}
-#endif
-
-/**
- *	kgdb_arch_handle_exception - Handle architecture specific GDB packets.
- *	@e_vector: The error vector of the exception that happened.
- *	@signo: The signal number of the exception that happened.
- *	@err_code: The error code of the exception that happened.
- *	@remcomInBuffer: The buffer of the packet we have read.
- *	@remcomOutBuffer: The buffer of %BUFMAX bytes to write a packet into.
- *	@linux_regs: The &struct pt_regs of the current process.
- *
- *	This function MUST handle the 'c' and 's' command packets,
- *	as well packets to set / remove a hardware breakpoint, if used.
- *	If there are additional packets which the hardware needs to handle,
- *	they are handled here.  The code should return -1 if it wants to
- *	process more packets, and a %0 or %1 if it wants to exit from the
- *	kgdb callback.
- */
-int kgdb_arch_handle_exception(int e_vector, int signo, int err_code,
-			       char *remcomInBuffer, char *remcomOutBuffer,
-			       struct pt_regs *linux_regs)
-{
-	unsigned long addr;
-	char *ptr;
-
-	switch (remcomInBuffer[0]) {
-	case 'c':
-	case 's':
-		/* try to read optional parameter, pc unchanged if no parm */
-		ptr = &remcomInBuffer[1];
-		if (kgdb_hex2long(&ptr, &addr))
-			linux_regs->ip = addr;
-		fallthrough;
-	case 'D':
-	case 'k':
-		/* clear the trace bit */
-		linux_regs->flags &= ~X86_EFLAGS_TF;
-		atomic_set(&kgdb_cpu_doing_single_step, -1);
-
-		/* set the trace bit if we're stepping */
-		if (remcomInBuffer[0] == 's') {
-			linux_regs->flags |= X86_EFLAGS_TF;
-			atomic_set(&kgdb_cpu_doing_single_step,
-				   raw_smp_processor_id());
-		}
-
-		return 0;
-	}
-
-	/* this means that we do not want to exit from the handler: */
-	return -1;
-}
-
-static inline int
-single_step_cont(struct pt_regs *regs, struct die_args *args)
-{
-	/*
-	 * Single step exception from kernel space to user space so
-	 * eat the exception and continue the process:
-	 */
-	printk(KERN_ERR "KGDB: trap/step from kernel to user space, "
-			"resuming...\n");
-	kgdb_arch_handle_exception(args->trapnr, args->signr,
-				   args->err, "c", "", regs);
-	/*
-	 * Reset the BS bit in dr6 (pointed by args->err) to
-	 * denote completion of processing
-	 */
-	(*(unsigned long *)ERR_PTR(args->err)) &= ~DR_STEP;
-
-	return NOTIFY_STOP;
-}
-
-static DECLARE_BITMAP(was_in_debug_nmi, NR_CPUS);
-
-static int kgdb_nmi_handler(unsigned int cmd, struct pt_regs *regs)
-{
-	int cpu;
-
-	switch (cmd) {
-	case NMI_LOCAL:
-		if (atomic_read(&kgdb_active) != -1) {
-			/* KGDB CPU roundup */
-			cpu = raw_smp_processor_id();
-			kgdb_nmicallback(cpu, regs);
-			set_bit(cpu, was_in_debug_nmi);
-			touch_nmi_watchdog();
-
-			return NMI_HANDLED;
-		}
-		break;
-
-	case NMI_UNKNOWN:
-		cpu = raw_smp_processor_id();
-
-		if (__test_and_clear_bit(cpu, was_in_debug_nmi))
-			return NMI_HANDLED;
-
-		break;
-	default:
-		/* do nothing */
-		break;
-	}
-	return NMI_DONE;
-}
-
-static int __kgdb_notify(struct die_args *args, unsigned long cmd)
-{
-	struct pt_regs *regs = args->regs;
-
-	switch (cmd) {
-	case DIE_DEBUG:
-		if (atomic_read(&kgdb_cpu_doing_single_step) != -1) {
-			if (user_mode(regs))
-				return single_step_cont(regs, args);
-			break;
-		} else if (test_thread_flag(TIF_SINGLESTEP))
-			/* This means a user thread is single stepping
-			 * a system call which should be ignored
-			 */
-			return NOTIFY_DONE;
-		fallthrough;
-	default:
-		if (user_mode(regs))
-			return NOTIFY_DONE;
-	}
-
-	if (kgdb_handle_exception(args->trapnr, args->signr, cmd, regs))
-		return NOTIFY_DONE;
-
-	/* Must touch watchdog before return to normal operation */
-	touch_nmi_watchdog();
-	return NOTIFY_STOP;
-}
-
-int kgdb_ll_trap(int cmd, const char *str,
-		 struct pt_regs *regs, long err, int trap, int sig)
-{
-	struct die_args args = {
-		.regs	= regs,
-		.str	= str,
-		.err	= err,
-		.trapnr	= trap,
-		.signr	= sig,
-
-	};
-
-	if (!kgdb_io_module_registered)
-		return NOTIFY_DONE;
-
-	return __kgdb_notify(&args, cmd);
-}
-
-static int
-kgdb_notify(struct notifier_block *self, unsigned long cmd, void *ptr)
-{
-	unsigned long flags;
-	int ret;
-
-	local_irq_save(flags);
-	ret = __kgdb_notify(ptr, cmd);
-	local_irq_restore(flags);
-
-	return ret;
-}
-
-static struct notifier_block kgdb_notifier = {
-	.notifier_call	= kgdb_notify,
-};
-
-/**
- *	kgdb_arch_init - Perform any architecture specific initialization.
- *
- *	This function will handle the initialization of any architecture
- *	specific callbacks.
- */
-int kgdb_arch_init(void)
-{
-	int retval;
-
-	retval = register_die_notifier(&kgdb_notifier);
-	if (retval)
-		goto out;
-
-	retval = register_nmi_handler(NMI_LOCAL, kgdb_nmi_handler,
-					0, "kgdb");
-	if (retval)
-		goto out1;
-
-	retval = register_nmi_handler(NMI_UNKNOWN, kgdb_nmi_handler,
-					0, "kgdb");
-
-	if (retval)
-		goto out2;
-
-	return retval;
-
-out2:
-	unregister_nmi_handler(NMI_LOCAL, "kgdb");
-out1:
-	unregister_die_notifier(&kgdb_notifier);
-out:
-	return retval;
-}
-
-static void kgdb_hw_overflow_handler(struct perf_event *event,
-		struct perf_sample_data *data, struct pt_regs *regs)
-{
-	struct task_struct *tsk = current;
-	int i;
-
-	for (i = 0; i < 4; i++) {
-		if (breakinfo[i].enabled)
-			tsk->thread.virtual_dr6 |= (DR_TRAP0 << i);
-	}
-}
-
-void kgdb_arch_late(void)
-{
-	int i, cpu;
-	struct perf_event_attr attr;
-	struct perf_event **pevent;
-
-	/*
-	 * Pre-allocate the hw breakpoint instructions in the non-atomic
-	 * portion of kgdb because this operation requires mutexs to
-	 * complete.
-	 */
-	hw_breakpoint_init(&attr);
-	attr.bp_addr = (unsigned long)kgdb_arch_init;
-	attr.bp_len = HW_BREAKPOINT_LEN_1;
-	attr.bp_type = HW_BREAKPOINT_W;
-	attr.disabled = 1;
-	for (i = 0; i < HBP_NUM; i++) {
-		if (breakinfo[i].pev)
-			continue;
-		breakinfo[i].pev = register_wide_hw_breakpoint(&attr, NULL, NULL);
-		if (IS_ERR_PCPU(breakinfo[i].pev)) {
-			printk(KERN_ERR "kgdb: Could not allocate hw"
-			       "breakpoints\nDisabling the kernel debugger\n");
-			breakinfo[i].pev = NULL;
-			kgdb_arch_exit();
-			return;
-		}
-		for_each_online_cpu(cpu) {
-			pevent = per_cpu_ptr(breakinfo[i].pev, cpu);
-			pevent[0]->hw.sample_period = 1;
-			pevent[0]->overflow_handler = kgdb_hw_overflow_handler;
-			if (pevent[0]->destroy != NULL) {
-				pevent[0]->destroy = NULL;
-				release_bp_slot(*pevent);
-			}
-		}
-	}
-}
-
-/**
- *	kgdb_arch_exit - Perform any architecture specific uninitalization.
- *
- *	This function will handle the uninitalization of any architecture
- *	specific callbacks, for dynamic registration and unregistration.
- */
-void kgdb_arch_exit(void)
-{
-	int i;
-	for (i = 0; i < 4; i++) {
-		if (breakinfo[i].pev) {
-			unregister_wide_hw_breakpoint(breakinfo[i].pev);
-			breakinfo[i].pev = NULL;
-		}
-	}
-	unregister_nmi_handler(NMI_UNKNOWN, "kgdb");
-	unregister_nmi_handler(NMI_LOCAL, "kgdb");
-	unregister_die_notifier(&kgdb_notifier);
-}
-
-/**
- *	kgdb_skipexception - Bail out of KGDB when we've been triggered.
- *	@exception: Exception vector number
- *	@regs: Current &struct pt_regs.
- *
- *	On some architectures we need to skip a breakpoint exception when
- *	it occurs after a breakpoint has been removed.
- *
- * Skip an int3 exception when it occurs after a breakpoint has been
- * removed. Backtrack eip by 1 since the int3 would have caused it to
- * increment by 1.
- */
-int kgdb_skipexception(int exception, struct pt_regs *regs)
-{
-	if (exception == 3 && kgdb_isremovedbreak(regs->ip - 1)) {
-		regs->ip -= 1;
-		return 1;
-	}
-	return 0;
-}
-
-unsigned long kgdb_arch_pc(int exception, struct pt_regs *regs)
-{
-	if (exception == 3)
-		return instruction_pointer(regs) - 1;
-	return instruction_pointer(regs);
-}
-
-void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long ip)
-{
-	regs->ip = ip;
-}
-
-int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
-{
-	int err;
-
-	bpt->type = BP_BREAKPOINT;
-	err = copy_from_kernel_nofault(bpt->saved_instr, (char *)bpt->bpt_addr,
-				BREAK_INSTR_SIZE);
-	if (err)
-		return err;
-	err = copy_to_kernel_nofault((char *)bpt->bpt_addr,
-				 arch_kgdb_ops.gdb_bpt_instr, BREAK_INSTR_SIZE);
-	if (!err)
-		return err;
-	/*
-	 * It is safe to call text_poke_kgdb() because normal kernel execution
-	 * is stopped on all cores, so long as the text_mutex is not locked.
-	 */
-	if (mutex_is_locked(&text_mutex))
-		return -EBUSY;
-	text_poke_kgdb((void *)bpt->bpt_addr, arch_kgdb_ops.gdb_bpt_instr,
-		       BREAK_INSTR_SIZE);
-	bpt->type = BP_POKE_BREAKPOINT;
-
-	return 0;
-}
-
-int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
-{
-	if (bpt->type != BP_POKE_BREAKPOINT)
-		goto knl_write;
-	/*
-	 * It is safe to call text_poke_kgdb() because normal kernel execution
-	 * is stopped on all cores, so long as the text_mutex is not locked.
-	 */
-	if (mutex_is_locked(&text_mutex))
-		goto knl_write;
-	text_poke_kgdb((void *)bpt->bpt_addr, bpt->saved_instr,
-		       BREAK_INSTR_SIZE);
-	return 0;
-
-knl_write:
-	return copy_to_kernel_nofault((char *)bpt->bpt_addr,
-				  (char *)bpt->saved_instr, BREAK_INSTR_SIZE);
-}
-
-const struct kgdb_arch arch_kgdb_ops = {
-	/* Breakpoint instruction: */
-	.gdb_bpt_instr		= { 0xcc },
-	.flags			= KGDB_HW_BREAKPOINT,
-	.set_hw_breakpoint	= kgdb_set_hw_break,
-	.remove_hw_breakpoint	= kgdb_remove_hw_break,
-	.disable_hw_break	= kgdb_disable_hw_debug,
-	.remove_all_hw_break	= kgdb_remove_all_hw_break,
-	.correct_hw_break	= kgdb_correct_hw_break,
-};
diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index 133ff20caccd..65707e4cffae 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -37,7 +37,6 @@
 #include <linux/extable.h>
 #include <linux/kdebug.h>
 #include <linux/kallsyms.h>
-#include <linux/kgdb.h>
 #include <linux/ftrace.h>
 #include <linux/kasan.h>
 #include <linux/objtool.h>
@@ -311,15 +310,6 @@ static bool can_probe(unsigned long paddr)
 		if (insn_decode_kernel(&insn, (void *)__addr) < 0)
 			return false;
 
-#ifdef CONFIG_KGDB
-		/*
-		 * If there is a dynamically installed kgdb sw breakpoint,
-		 * this function should not be probed.
-		 */
-		if (insn.opcode.bytes[0] == INT3_INSN_OPCODE &&
-		    kgdb_has_hit_break(addr))
-			return false;
-#endif
 		addr += insn.length;
 	}
 
diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index 3f8fea52619f..821a416faf67 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -15,7 +15,6 @@
 #include <linux/extable.h>
 #include <linux/kdebug.h>
 #include <linux/kallsyms.h>
-#include <linux/kgdb.h>
 #include <linux/ftrace.h>
 #include <linux/objtool.h>
 #include <linux/pgtable.h>
@@ -297,15 +296,7 @@ static int can_optimize(unsigned long paddr)
 		ret = insn_decode_kernel(&insn, (void *)recovered_insn);
 		if (ret < 0)
 			return 0;
-#ifdef CONFIG_KGDB
-		/*
-		 * If there is a dynamically installed kgdb sw breakpoint,
-		 * this function should not be probed.
-		 */
-		if (insn.opcode.bytes[0] == INT3_INSN_OPCODE &&
-		    kgdb_has_hit_break(addr))
-			return 0;
-#endif
+
 		/* Recover address */
 		insn.kaddr = (void *)addr;
 		insn.next_byte = (void *)(addr + insn.length);
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 30aa8369957e..20a1fa62d5b2 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -20,7 +20,6 @@
 #include <linux/kprobes.h>
 #include <linux/uaccess.h>
 #include <linux/kdebug.h>
-#include <linux/kgdb.h>
 #include <linux/kernel.h>
 #include <linux/export.h>
 #include <linux/ptrace.h>
@@ -975,12 +974,6 @@ static bool do_int3(struct pt_regs *regs)
 {
 	int res;
 
-#ifdef CONFIG_KGDB_LOW_LEVEL_TRAP
-	if (kgdb_ll_trap(DIE_INT3, "int3", regs, 0, X86_TRAP_BP,
-			 SIGTRAP) == NOTIFY_STOP)
-		return true;
-#endif /* CONFIG_KGDB_LOW_LEVEL_TRAP */
-
 #ifdef CONFIG_KPROBES
 	if (kprobe_int3_handler(regs))
 		return true;
@@ -1205,7 +1198,7 @@ static bool notify_debug(struct pt_regs *regs, unsigned long *dr6)
 	 * consumed - hw_breakpoint_handler(), single_stop_cont().
 	 *
 	 * Notifiers will set bits in @virtual_dr6 to indicate the desire
-	 * for signals - ptrace_triggered(), kgdb_hw_overflow_handler().
+	 * for signals - ptrace_triggered().
 	 */
 	if (notify_die(DIE_DEBUG, "debug", regs, (long)dr6, 0, SIGTRAP) == NOTIFY_STOP)
 		return true;
@@ -1276,7 +1269,6 @@ static noinstr void exc_debug_kernel(struct pt_regs *regs, unsigned long dr6)
 	 * The kernel doesn't use TF single-step outside of:
 	 *
 	 *  - Kprobes, consumed through kprobe_debug_handler()
-	 *  - KGDB, consumed through notify_debug()
 	 *
 	 * So if we get here with DR_STEP set, something is wonky.
 	 *
diff --git a/arch/x86/platform/uv/uv_nmi.c b/arch/x86/platform/uv/uv_nmi.c
index 565ab43fa6b4..7d8a16945900 100644
--- a/arch/x86/platform/uv/uv_nmi.c
+++ b/arch/x86/platform/uv/uv_nmi.c
@@ -9,9 +9,7 @@
 
 #include <linux/cpu.h>
 #include <linux/delay.h>
-#include <linux/kdb.h>
 #include <linux/kexec.h>
-#include <linux/kgdb.h>
 #include <linux/moduleparam.h>
 #include <linux/nmi.h>
 #include <linux/sched.h>
@@ -184,8 +182,6 @@ enum action_t {
 	nmi_act_kdump,
 	nmi_act_dump,
 	nmi_act_ips,
-	nmi_act_kdb,
-	nmi_act_kgdb,
 	nmi_act_health,
 	nmi_act_max
 };
@@ -194,8 +190,6 @@ static const char * const actions[nmi_act_max] = {
 	[nmi_act_kdump] = "kdump",
 	[nmi_act_dump] = "dump",
 	[nmi_act_ips] = "ips",
-	[nmi_act_kdb] = "kdb",
-	[nmi_act_kgdb] = "kgdb",
 	[nmi_act_health] = "health",
 };
 
@@ -203,8 +197,6 @@ static const char * const actions_desc[nmi_act_max] = {
 	[nmi_act_kdump] = "do kernel crash dump",
 	[nmi_act_dump] = "dump process stack for each cpu",
 	[nmi_act_ips] = "dump Inst Ptr info for each cpu",
-	[nmi_act_kdb] = "enter KDB (needs kgdboc= assignment)",
-	[nmi_act_kgdb] = "enter KGDB (needs gdb target remote)",
 	[nmi_act_health] = "check if CPUs respond to NMI",
 };
 
@@ -868,70 +860,6 @@ static void uv_nmi_kdump(int cpu, int main, struct pt_regs *regs)
 	}
 }
 
-#ifdef CONFIG_KGDB
-#ifdef CONFIG_KGDB_KDB
-static inline int uv_nmi_kdb_reason(void)
-{
-	return KDB_REASON_SYSTEM_NMI;
-}
-#else /* !CONFIG_KGDB_KDB */
-static inline int uv_nmi_kdb_reason(void)
-{
-	/* Ensure user is expecting to attach gdb remote */
-	if (uv_nmi_action == nmi_act_kgdb)
-		return 0;
-
-	pr_err("UV: NMI error: KDB is not enabled in this kernel\n");
-	return -1;
-}
-#endif /* CONFIG_KGDB_KDB */
-
-/*
- * Call KGDB/KDB from NMI handler
- *
- * Note that if both KGDB and KDB are configured, then the action of 'kgdb' or
- * 'kdb' has no affect on which is used.  See the KGDB documentation for further
- * information.
- */
-static void uv_call_kgdb_kdb(int cpu, struct pt_regs *regs, int master)
-{
-	if (master) {
-		int reason = uv_nmi_kdb_reason();
-		int ret;
-
-		if (reason < 0)
-			return;
-
-		/* Call KGDB NMI handler as MASTER */
-		ret = kgdb_nmicallin(cpu, X86_TRAP_NMI, regs, reason,
-				&uv_nmi_slave_continue);
-		if (ret) {
-			pr_alert("KGDB returned error, is kgdboc set?\n");
-			atomic_set(&uv_nmi_slave_continue, SLAVE_EXIT);
-		}
-	} else {
-		/* Wait for KGDB signal that it's ready for slaves to enter */
-		int sig;
-
-		do {
-			cpu_relax();
-			sig = atomic_read(&uv_nmi_slave_continue);
-		} while (!sig);
-
-		/* Call KGDB as slave */
-		if (sig == SLAVE_CONTINUE)
-			kgdb_nmicallback(cpu, regs);
-	}
-	uv_nmi_sync_exit(master);
-}
-
-#else /* !CONFIG_KGDB */
-static inline void uv_call_kgdb_kdb(int cpu, struct pt_regs *regs, int master)
-{
-	pr_err("UV: NMI error: KGDB is not enabled in this kernel\n");
-}
-#endif /* !CONFIG_KGDB */
-
 /*
  * UV NMI handler
  */
@@ -974,10 +902,6 @@ static int uv_handle_nmi(unsigned int reason, struct pt_regs *regs)
 	case nmi_act_dump:
 		uv_nmi_dump_state(cpu, regs, master);
 		break;
-	case nmi_act_kdb:
-	case nmi_act_kgdb:
-		uv_call_kgdb_kdb(cpu, regs, master);
-		break;
 	default:
 		if (master)
 			pr_alert("UV: unknown NMI action: %d\n", uv_nmi_action);
