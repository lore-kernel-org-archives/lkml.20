Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196975;
	b=X8MCR8IwfNACVqJAnkQjmiOSIYKq22GLQjPhyNV9FXjq+Rojrw80XuBpuBM75Yi9o0n3
	 UAEoQSNVwB3QGksT6B1o/TKmV03ANz5JHRn2RREeJ0VCdeG16NAsBTtMrjlcpwgC7Jgcq
	 SQjBxi56w5JhyrKmkJ9i5+lPwMiukdUhrIPXJGkqEKn/xtxJQSOS019/dwTKEbEYNcjdH
	 NjfrmIgxt7abn77/bGgpW4l1hb8FFV4vGbFvPBDQ927LacPaImkmAZs/soJwA5844QBEr
	 OiOzLV4FlHRzVXggjv0EOEJkEzGWUfznR0CJQCnVhScMN39ZlOyY822e6QP1bxUr5bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196975;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:CC:
	 Subject:User-Agent:In-Reply-To:References:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Iawofvh+HVBczhzEyFCTAo9HeLlcp7DGXD91u5rejkc=;
	b=ZpZiMWicR+XeqMvht1O0Nmg93uhI07hxzb2G3/hmnIh/jvvK04GHSgWVvoZcdr64Igy1
	 m8aUJ9ON7ZDbB1+8fGEn0vBUxNF77rxgaWM4abyMpQKEpcL3r6Qy3bXimiTGhNKLbNKIz
	 vw/7+WGIPiIC16M+57IcdOcPPtPFg06NHG8dz7AnY8qRek5HX2R4FwO+1zd5LgH9Brzus
	 sDWtjfwNWbsAJg+tcZd4gKWcrMJQKtkBd+V5oeAkOS/B+nVBjUS3pj2caU6eTJoW3E7g0
	 t3CdGzTxTUwers2XWah00A/tMY7yrWgFj8Qcw5So8uQoXU8KskMzo1nrAs3nFPydeHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zytor.com;
	spf=pass smtp.mailfrom=zytor.com;
	dkim=pass header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026092801 header.b=CLVpqlP5;
	arc=none smtp.remote-ip=198.137.202.136
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ADE606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64ADE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026092801 header.b=CLVpqlP5
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 69SEFqfh2746361
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 28 Oct 2026 07:15:53 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 69SEFqfh2746361
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026092801; t=1793196954;
	bh=Iawofvh+HVBczhzEyFCTAo9HeLlcp7DGXD91u5rejkc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=CLVpqlP5flTMwx5HUdQlpg4WTIq1UZfq6aHhemhFuwIt9iZV50WYGyWBa1aZLdfsG
	 Dzb9PlPO/Ril+0DUwlUnMUCZwPTv3ko+HhkpV9oi/QepmsJFZmmAxWJJ+twyi2fYwj
	 j/uvuVJkaXUxkhNhKiMWilsEWe25HrjkYoxxsMhQsYu1/KVyDeqPXLwpf0fZyUGhHm
	 Mw+jYX5yiTQjyR35h3DjoO0U0WmvQ3Hfnlyb5UqDlW+9IvMwbQc2+36csEuoYhdGnc
	 /oRMp595vpEBHoiRqmg9Sl4+PtwMkV1fT+Df+yB2tK8vS70tNw7yVqg0wnCPc8Ttmo
	 Q39CLWqlZSPZw==
Date: Wed, 28 Oct 2026 07:15:46 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
CC: tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, steve.wahl@hpe.com, justin.ernst@hpe.com,
        kyle.meyer@hpe.com, dimitri.sivanich@hpe.com, russ.anderson@hpe.com,
        linux-kernel@vger.kernel.org, mhiramat@kernel.org
Subject: Re: [PATCH] x86: Drop KGDB support
User-Agent: K-9 Mail for Android
In-Reply-To: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net>
References: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net>
Message-ID: <28F95BAB-6D5B-4C70-A9F2-14B752EBF022@zytor.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 28, 2026 5:21:24 AM PDT, Peter Zijlstra <peterz@infradead=2Eorg>=
 wrote:
>
>KGDB does some horrible things, and with everybody having access to
>virtualization these days, there is really no reason to use it over
>Qemu's gdb-server=2E
>
>Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead=2Eorg>
>---
> arch/x86/Kconfig                     |   2 -
> arch/x86/include/asm/kgdb=2Eh          |  92 ----
> arch/x86/include/asm/text-patching=2Eh |   1 -
> arch/x86/kernel/Makefile             |   1 -
> arch/x86/kernel/alternative=2Ec        |  50 +--
> arch/x86/kernel/cpu/common=2Ec         |  16 -
> arch/x86/kernel/early_printk=2Ec       |   8 -
> arch/x86/kernel/kgdb=2Ec               | 785 ---------------------------=
--------
> arch/x86/kernel/kprobes/core=2Ec       |  10 -
> arch/x86/kernel/kprobes/opt=2Ec        |  11 +-
> arch/x86/kernel/traps=2Ec              |  10 +-
> arch/x86/platform/uv/uv_nmi=2Ec        |  76 ----
> 12 files changed, 13 insertions(+), 1049 deletions(-)
>
>diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>index a5e29ffd5ddc=2E=2E627553e8496f 100644
>--- a/arch/x86/Kconfig
>+++ b/arch/x86/Kconfig
>@@ -82,7 +82,6 @@ config X86
> 	select ARCH_HAS_DELAY_TIMER
> 	select ARCH_HAS_DEVMEM_IS_ALLOWED
> 	select ARCH_HAS_DMA_OPS			if GART_IOMMU || XEN
>-	select ARCH_HAS_EARLY_DEBUG		if KGDB
> 	select ARCH_HAS_ELF_RANDOMIZE
> 	select ARCH_HAS_EXECMEM_ROX		if X86_64 && STRICT_MODULE_RWX
> 	select ARCH_HAS_FAST_MULTIPLIER
>@@ -198,7 +197,6 @@ config X86
> 	select HAVE_ARCH_KASAN_VMALLOC		if X86_64
> 	select HAVE_ARCH_KFENCE
> 	select HAVE_ARCH_KMSAN			if X86_64
>-	select HAVE_ARCH_KGDB
> 	select HAVE_ARCH_KSTACK_ERASE
> 	select HAVE_ARCH_MMAP_RND_BITS		if MMU
> 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if MMU && COMPAT
>diff --git a/arch/x86/include/asm/kgdb=2Eh b/arch/x86/include/asm/kgdb=2E=
h
>deleted file mode 100644
>index aacaf2502bd2=2E=2E000000000000
>--- a/arch/x86/include/asm/kgdb=2Eh
>+++ /dev/null
>@@ -1,92 +0,0 @@
>-/* SPDX-License-Identifier: GPL-2=2E0 */
>-#ifndef _ASM_X86_KGDB_H
>-#define _ASM_X86_KGDB_H
>-
>-/*
>- * Copyright (C) 2001-2004 Amit S=2E Kale
>- * Copyright (C) 2008 Wind River Systems, Inc=2E
>- */
>-
>-#include <asm/ptrace=2Eh>
>-
>-/*
>- * BUFMAX defines the maximum number of characters in inbound/outbound
>- * buffers at least NUMREGBYTES*2 are needed for register packets
>- * Longer buffer is needed to list all threads
>- */
>-#define BUFMAX			1024
>-
>-/*
>- *  Note that this register image is in a different order than
>- *  the register image that Linux produces at interrupt time=2E
>- *
>- *  Linux's register image is defined by struct pt_regs in ptrace=2Eh=2E
>- *  Just why GDB uses a different order is a historical mystery=2E
>- */
>-#ifdef CONFIG_X86_32
>-enum regnames {
>-	GDB_AX,			/* 0 */
>-	GDB_CX,			/* 1 */
>-	GDB_DX,			/* 2 */
>-	GDB_BX,			/* 3 */
>-	GDB_SP,			/* 4 */
>-	GDB_BP,			/* 5 */
>-	GDB_SI,			/* 6 */
>-	GDB_DI,			/* 7 */
>-	GDB_PC,			/* 8 also known as eip */
>-	GDB_PS,			/* 9 also known as eflags */
>-	GDB_CS,			/* 10 */
>-	GDB_SS,			/* 11 */
>-	GDB_DS,			/* 12 */
>-	GDB_ES,			/* 13 */
>-	GDB_FS,			/* 14 */
>-	GDB_GS,			/* 15 */
>-};
>-#define GDB_ORIG_AX		41
>-#define DBG_MAX_REG_NUM		16
>-#define NUMREGBYTES		((GDB_GS+1)*4)
>-#else /* ! CONFIG_X86_32 */
>-enum regnames {
>-	GDB_AX,			/* 0 */
>-	GDB_BX,			/* 1 */
>-	GDB_CX,			/* 2 */
>-	GDB_DX,			/* 3 */
>-	GDB_SI,			/* 4 */
>-	GDB_DI,			/* 5 */
>-	GDB_BP,			/* 6 */
>-	GDB_SP,			/* 7 */
>-	GDB_R8,			/* 8 */
>-	GDB_R9,			/* 9 */
>-	GDB_R10,		/* 10 */
>-	GDB_R11,		/* 11 */
>-	GDB_R12,		/* 12 */
>-	GDB_R13,		/* 13 */
>-	GDB_R14,		/* 14 */
>-	GDB_R15,		/* 15 */
>-	GDB_PC,			/* 16 */
>-	GDB_PS,			/* 17 */
>-	GDB_CS,			/* 18 */
>-	GDB_SS,			/* 19 */
>-	GDB_DS,			/* 20 */
>-	GDB_ES,			/* 21 */
>-	GDB_FS,			/* 22 */
>-	GDB_GS,			/* 23 */
>-};
>-#define GDB_ORIG_AX		57
>-#define DBG_MAX_REG_NUM		24
>-/* 17 64 bit regs and 5 32 bit regs */
>-#define NUMREGBYTES		((17 * 8) + (5 * 4))
>-#endif /* ! CONFIG_X86_32 */
>-
>-static inline void arch_kgdb_breakpoint(void)
>-{
>-	asm("   int $3");
>-}
>-#define BREAK_INSTR_SIZE	1
>-#define CACHE_FLUSH_IS_SAFE	1
>-#define GDB_ADJUSTS_BREAK_OFFSET
>-
>-extern int kgdb_ll_trap(int cmd, const char *str,
>-			struct pt_regs *regs, long err, int trap, int sig);
>-
>-#endif /* _ASM_X86_KGDB_H */
>diff --git a/arch/x86/include/asm/text-patching=2Eh b/arch/x86/include/as=
m/text-patching=2Eh
>index ea09381070e8=2E=2Ea1d284560ef8 100644
>--- a/arch/x86/include/asm/text-patching=2Eh
>+++ b/arch/x86/include/asm/text-patching=2Eh
>@@ -33,7 +33,6 @@ extern void text_poke_apply_relocation(u8 *buf, const u=
8 * const instr, size_t i
>  */
> extern void *text_poke(void *addr, const void *opcode, size_t len);
> extern void smp_text_poke_sync_each_cpu(void);
>-extern void *text_poke_kgdb(void *addr, const void *opcode, size_t len);
> extern void *text_poke_copy(void *addr, const void *opcode, size_t len);
> #define text_poke_copy text_poke_copy
> extern void *text_poke_copy_locked(void *addr, const void *opcode, size_=
t len, bool core_ok);
>diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
>index 31f46fd00527=2E=2E1a16af34dee3 100644
>--- a/arch/x86/kernel/Makefile
>+++ b/arch/x86/kernel/Makefile
>@@ -128,7 +128,6 @@ obj-$(CONFIG_CRASH_DUMP)	+=3D crash_dump_$(BITS)=2Eo =
crash=2Eo
> obj-y				+=3D kprobes/
> obj-$(CONFIG_MODULES)		+=3D module=2Eo
> obj-$(CONFIG_X86_32)		+=3D doublefault_32=2Eo
>-obj-$(CONFIG_KGDB)		+=3D kgdb=2Eo
> obj-$(CONFIG_VM86)		+=3D vm86_32=2Eo
> obj-$(CONFIG_EARLY_PRINTK)	+=3D early_printk=2Eo
>=20
>diff --git a/arch/x86/kernel/alternative=2Ec b/arch/x86/kernel/alternativ=
e=2Ec
>index efbc11f8c336=2E=2Ed8add52ff923 100644
>--- a/arch/x86/kernel/alternative=2Ec
>+++ b/arch/x86/kernel/alternative=2Ec
>@@ -7,7 +7,6 @@
> #include <linux/memory=2Eh>
> #include <linux/execmem=2Eh>
> #include <linux/cleanup=2Eh>
>-#include <linux/kgdb=2Eh>
> #include <linux/mmap_lock=2Eh>
>=20
> #include <asm/text-patching=2Eh>
>@@ -2393,25 +2392,17 @@ static void __poke_vmalloc_pages(struct page **pa=
ges, void *addr,
> static void poke_vmalloc_pages(struct page **pages, void *addr,
> 			       bool cross_page_boundary)
> {
>-	if (in_dbg_master()) {
>-		/*
>-		 * If called from kgdb cannot sleep, but all other CPUs stopped
>-		 * anyway so safe to proceed without locks
>-		 */
>-		__poke_vmalloc_pages(pages, addr, cross_page_boundary);
>-	} else {
>-		/*
>-		 * execmem ROX ranges are shared between modules and can be
>-		 * collapsed to huge PMD entries, and this collapse can happen
>-		 * concurrently with a racing set_memory_rox()=2E
>-		 *
>-		 * Prevent vmalloc_to_page() from racing by acquiring an
>-		 * init_mm read lock which pairs with the init_mm write lock in
>-		 * cpa_collapse_large_pages()=2E
>-		 */
>-		guard(mmap_read_lock)(&init_mm);
>-		__poke_vmalloc_pages(pages, addr, cross_page_boundary);
>-	}
>+	/*
>+	 * execmem ROX ranges are shared between modules and can be
>+	 * collapsed to huge PMD entries, and this collapse can happen
>+	 * concurrently with a racing set_memory_rox()=2E
>+	 *
>+	 * Prevent vmalloc_to_page() from racing by acquiring an
>+	 * init_mm read lock which pairs with the init_mm write lock in
>+	 * cpa_collapse_large_pages()=2E
>+	 */
>+	guard(mmap_read_lock)(&init_mm);
>+	__poke_vmalloc_pages(pages, addr, cross_page_boundary);
> }
>=20
> static void *__text_poke(text_poke_f func, void *addr, const void *src, =
size_t len)
>@@ -2541,25 +2532,6 @@ void *text_poke(void *addr, const void *opcode, si=
ze_t len)
> 	return __text_poke(text_poke_memcpy, addr, opcode, len);
> }
>=20
>-/**
>- * text_poke_kgdb - Update instructions on a live kernel by kgdb
>- * @addr: address to modify
>- * @opcode: source of the copy
>- * @len: length to copy
>- *
>- * Only atomic text poke/set should be allowed when not doing early patc=
hing=2E
>- * It means the size must be writable atomically and the address must be=
 aligned
>- * in a way that permits an atomic write=2E It also makes sure we fit on=
 a single
>- * page=2E
>- *
>- * Context: should only be used by kgdb, which ensures no other core is =
running,
>- *	    despite the fact it does not hold the text_mutex=2E
>- */
>-void *text_poke_kgdb(void *addr, const void *opcode, size_t len)
>-{
>-	return __text_poke(text_poke_memcpy, addr, opcode, len);
>-}
>-
> void *text_poke_copy_locked(void *addr, const void *opcode, size_t len,
> 			    bool core_ok)
> {
>diff --git a/arch/x86/kernel/cpu/common=2Ec b/arch/x86/kernel/cpu/common=
=2Ec
>index 9bd50c68cd7e=2E=2E8a4aabcd5d60 100644
>--- a/arch/x86/kernel/cpu/common=2Ec
>+++ b/arch/x86/kernel/cpu/common=2Ec
>@@ -18,7 +18,6 @@
> #include <linux/sched/smt=2Eh>
> #include <linux/init=2Eh>
> #include <linux/kprobes=2Eh>
>-#include <linux/kgdb=2Eh>
> #include <linux/mem_encrypt=2Eh>
> #include <linux/smp=2Eh>
> #include <linux/cpu=2Eh>
>@@ -2340,20 +2339,6 @@ static void initialize_debug_regs(void)
> 	set_debugreg(0, 0);
> }
>=20
>-#ifdef CONFIG_KGDB
>-/*
>- * Restore debug regs if using kgdbwait and you have a kernel debugger
>- * connection established=2E
>- */
>-static void dbg_restore_debug_regs(void)
>-{
>-	if (unlikely(kgdb_connected && arch_kgdb_ops=2Ecorrect_hw_break))
>-		arch_kgdb_ops=2Ecorrect_hw_break();
>-}
>-#else /* ! CONFIG_KGDB */
>-#define dbg_restore_debug_regs()
>-#endif /* ! CONFIG_KGDB */
>-
> static inline void setup_getcpu(int cpu)
> {
> 	unsigned long cpudata =3D vdso_encode_cpunode(cpu, early_cpu_to_node(cp=
u));
>@@ -2511,7 +2496,6 @@ void cpu_init(void)
> 	load_mm_ldt(&init_mm);
>=20
> 	initialize_debug_regs();
>-	dbg_restore_debug_regs();
>=20
> 	doublefault_init_cpu_tss();
>=20
>diff --git a/arch/x86/kernel/early_printk=2Ec b/arch/x86/kernel/early_pri=
ntk=2Ec
>index cba75306e5b6=2E=2Ead7534771bcf 100644
>--- a/arch/x86/kernel/early_printk=2Ec
>+++ b/arch/x86/kernel/early_printk=2Ec
>@@ -46,14 +46,6 @@ static void early_vga_write(struct console *con, const=
 char *str, unsigned n)
> 				writew(0x720, VGABASE + 2*(max_xpos*j + i));
> 			current_ypos =3D max_ypos-1;
> 		}
>-#ifdef CONFIG_KGDB_KDB
>-		if (c =3D=3D '\b') {
>-			if (current_xpos > 0)
>-				current_xpos--;
>-		} else if (c =3D=3D '\r') {
>-			current_xpos =3D 0;
>-		} else
>-#endif
> 		if (c =3D=3D '\n') {
> 			current_xpos =3D 0;
> 			current_ypos++;
>diff --git a/arch/x86/kernel/kgdb=2Ec b/arch/x86/kernel/kgdb=2Ec
>deleted file mode 100644
>index 96af1242454e=2E=2E000000000000
>--- a/arch/x86/kernel/kgdb=2Ec
>+++ /dev/null
>@@ -1,785 +0,0 @@
>-// SPDX-License-Identifier: GPL-2=2E0-or-later
>-/*
>- */
>-
>-/*
>- * Copyright (C) 2004 Amit S=2E Kale <amitkale@linsyssoft=2Ecom>
>- * Copyright (C) 2000-2001 VERITAS Software Corporation=2E
>- * Copyright (C) 2002 Andi Kleen, SuSE Labs
>- * Copyright (C) 2004 LinSysSoft Technologies Pvt=2E Ltd=2E
>- * Copyright (C) 2007 MontaVista Software, Inc=2E
>- * Copyright (C) 2007-2008 Jason Wessel, Wind River Systems, Inc=2E
>- */
>-/***********************************************************************=
*****
>- *  Contributor:     Lake Stevens Instrument Division$
>- *  Written by:      Glenn Engel $
>- *  Updated by:	     Amit Kale<akale@veritas=2Ecom>
>- *  Updated by:	     Tom Rini <trini@kernel=2Ecrashing=2Eorg>
>- *  Updated by:	     Jason Wessel <jason=2Ewessel@windriver=2Ecom>
>- *  Modified for 386 by Jim Kingdon, Cygnus Support=2E
>- *  Original kgdb, compatibility with 2=2E1=2Exx kernel by
>- *  David Grothe <dave@gcom=2Ecom>
>- *  Integrated into 2=2E2=2E5 kernel by Tigran Aivazian <tigran@sco=2Eco=
m>
>- *  X86_64 changes from Andi Kleen's patch merged by Jim Houston
>- */
>-#include <linux/spinlock=2Eh>
>-#include <linux/kdebug=2Eh>
>-#include <linux/string=2Eh>
>-#include <linux/kernel=2Eh>
>-#include <linux/ptrace=2Eh>
>-#include <linux/sched=2Eh>
>-#include <linux/delay=2Eh>
>-#include <linux/kgdb=2Eh>
>-#include <linux/smp=2Eh>
>-#include <linux/nmi=2Eh>
>-#include <linux/hw_breakpoint=2Eh>
>-#include <linux/uaccess=2Eh>
>-#include <linux/memory=2Eh>
>-
>-#include <asm/text-patching=2Eh>
>-#include <asm/debugreg=2Eh>
>-#include <asm/apicdef=2Eh>
>-#include <asm/apic=2Eh>
>-#include <asm/nmi=2Eh>
>-#include <asm/switch_to=2Eh>
>-
>-struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] =3D
>-{
>-#ifdef CONFIG_X86_32
>-	{ "ax", 4, offsetof(struct pt_regs, ax) },
>-	{ "cx", 4, offsetof(struct pt_regs, cx) },
>-	{ "dx", 4, offsetof(struct pt_regs, dx) },
>-	{ "bx", 4, offsetof(struct pt_regs, bx) },
>-	{ "sp", 4, offsetof(struct pt_regs, sp) },
>-	{ "bp", 4, offsetof(struct pt_regs, bp) },
>-	{ "si", 4, offsetof(struct pt_regs, si) },
>-	{ "di", 4, offsetof(struct pt_regs, di) },
>-	{ "ip", 4, offsetof(struct pt_regs, ip) },
>-	{ "flags", 4, offsetof(struct pt_regs, flags) },
>-	{ "cs", 4, offsetof(struct pt_regs, cs) },
>-	{ "ss", 4, offsetof(struct pt_regs, ss) },
>-	{ "ds", 4, offsetof(struct pt_regs, ds) },
>-	{ "es", 4, offsetof(struct pt_regs, es) },
>-#else
>-	{ "ax", 8, offsetof(struct pt_regs, ax) },
>-	{ "bx", 8, offsetof(struct pt_regs, bx) },
>-	{ "cx", 8, offsetof(struct pt_regs, cx) },
>-	{ "dx", 8, offsetof(struct pt_regs, dx) },
>-	{ "si", 8, offsetof(struct pt_regs, si) },
>-	{ "di", 8, offsetof(struct pt_regs, di) },
>-	{ "bp", 8, offsetof(struct pt_regs, bp) },
>-	{ "sp", 8, offsetof(struct pt_regs, sp) },
>-	{ "r8", 8, offsetof(struct pt_regs, r8) },
>-	{ "r9", 8, offsetof(struct pt_regs, r9) },
>-	{ "r10", 8, offsetof(struct pt_regs, r10) },
>-	{ "r11", 8, offsetof(struct pt_regs, r11) },
>-	{ "r12", 8, offsetof(struct pt_regs, r12) },
>-	{ "r13", 8, offsetof(struct pt_regs, r13) },
>-	{ "r14", 8, offsetof(struct pt_regs, r14) },
>-	{ "r15", 8, offsetof(struct pt_regs, r15) },
>-	{ "ip", 8, offsetof(struct pt_regs, ip) },
>-	{ "flags", 4, offsetof(struct pt_regs, flags) },
>-	{ "cs", 4, offsetof(struct pt_regs, cs) },
>-	{ "ss", 4, offsetof(struct pt_regs, ss) },
>-	{ "ds", 4, -1 },
>-	{ "es", 4, -1 },
>-#endif
>-	{ "fs", 4, -1 },
>-	{ "gs", 4, -1 },
>-};
>-
>-int dbg_set_reg(int regno, void *mem, struct pt_regs *regs)
>-{
>-	if (
>-#ifdef CONFIG_X86_32
>-	    regno =3D=3D GDB_SS || regno =3D=3D GDB_FS || regno =3D=3D GDB_GS |=
|
>-#endif
>-	    regno =3D=3D GDB_SP || regno =3D=3D GDB_ORIG_AX)
>-		return 0;
>-
>-	if (dbg_reg_def[regno]=2Eoffset !=3D -1)
>-		memcpy((void *)regs + dbg_reg_def[regno]=2Eoffset, mem,
>-		       dbg_reg_def[regno]=2Esize);
>-	return 0;
>-}
>-
>-char *dbg_get_reg(int regno, void *mem, struct pt_regs *regs)
>-{
>-	if (regno =3D=3D GDB_ORIG_AX) {
>-		memcpy(mem, &regs->orig_ax, sizeof(regs->orig_ax));
>-		return "orig_ax";
>-	}
>-	if (regno >=3D DBG_MAX_REG_NUM || regno < 0)
>-		return NULL;
>-
>-	if (dbg_reg_def[regno]=2Eoffset !=3D -1)
>-		memcpy(mem, (void *)regs + dbg_reg_def[regno]=2Eoffset,
>-		       dbg_reg_def[regno]=2Esize);
>-
>-#ifdef CONFIG_X86_32
>-	switch (regno) {
>-	case GDB_GS:
>-	case GDB_FS:
>-		*(unsigned long *)mem =3D 0xFFFF;
>-		break;
>-	}
>-#endif
>-	return dbg_reg_def[regno]=2Ename;
>-}
>-
>-/**
>- *	sleeping_thread_to_gdb_regs - Convert ptrace regs to GDB regs
>- *	@gdb_regs: A pointer to hold the registers in the order GDB wants=2E
>- *	@p: The &struct task_struct of the desired process=2E
>- *
>- *	Convert the register values of the sleeping process in @p to
>- *	the format that GDB expects=2E
>- *	This function is called when kgdb does not have access to the
>- *	&struct pt_regs and therefore it should fill the gdb registers
>- *	@gdb_regs with what has	been saved in &struct thread_struct
>- *	thread field during switch_to=2E
>- */
>-void sleeping_thread_to_gdb_regs(unsigned long *gdb_regs, struct task_st=
ruct *p)
>-{
>-#ifndef CONFIG_X86_32
>-	u32 *gdb_regs32 =3D (u32 *)gdb_regs;
>-#endif
>-	gdb_regs[GDB_AX]	=3D 0;
>-	gdb_regs[GDB_BX]	=3D 0;
>-	gdb_regs[GDB_CX]	=3D 0;
>-	gdb_regs[GDB_DX]	=3D 0;
>-	gdb_regs[GDB_SI]	=3D 0;
>-	gdb_regs[GDB_DI]	=3D 0;
>-	gdb_regs[GDB_BP]	=3D ((struct inactive_task_frame *)p->thread=2Esp)->bp=
;
>-#ifdef CONFIG_X86_32
>-	gdb_regs[GDB_DS]	=3D __KERNEL_DS;
>-	gdb_regs[GDB_ES]	=3D __KERNEL_DS;
>-	gdb_regs[GDB_PS]	=3D 0;
>-	gdb_regs[GDB_CS]	=3D __KERNEL_CS;
>-	gdb_regs[GDB_SS]	=3D __KERNEL_DS;
>-	gdb_regs[GDB_FS]	=3D 0xFFFF;
>-	gdb_regs[GDB_GS]	=3D 0xFFFF;
>-#else
>-	gdb_regs32[GDB_PS]	=3D 0;
>-	gdb_regs32[GDB_CS]	=3D __KERNEL_CS;
>-	gdb_regs32[GDB_SS]	=3D __KERNEL_DS;
>-	gdb_regs[GDB_R8]	=3D 0;
>-	gdb_regs[GDB_R9]	=3D 0;
>-	gdb_regs[GDB_R10]	=3D 0;
>-	gdb_regs[GDB_R11]	=3D 0;
>-	gdb_regs[GDB_R12]	=3D 0;
>-	gdb_regs[GDB_R13]	=3D 0;
>-	gdb_regs[GDB_R14]	=3D 0;
>-	gdb_regs[GDB_R15]	=3D 0;
>-#endif
>-	gdb_regs[GDB_PC]	=3D 0;
>-	gdb_regs[GDB_SP]	=3D p->thread=2Esp;
>-}
>-
>-static struct hw_breakpoint {
>-	unsigned		enabled;
>-	unsigned long		addr;
>-	int			len;
>-	int			type;
>-	struct perf_event	* __percpu *pev;
>-} breakinfo[HBP_NUM];
>-
>-static unsigned long early_dr7;
>-
>-static void kgdb_correct_hw_break(void)
>-{
>-	int breakno;
>-
>-	for (breakno =3D 0; breakno < HBP_NUM; breakno++) {
>-		struct perf_event *bp;
>-		struct arch_hw_breakpoint *info;
>-		int val;
>-		int cpu =3D raw_smp_processor_id();
>-		if (!breakinfo[breakno]=2Eenabled)
>-			continue;
>-		if (dbg_is_early) {
>-			set_debugreg(breakinfo[breakno]=2Eaddr, breakno);
>-			early_dr7 |=3D encode_dr7(breakno,
>-						breakinfo[breakno]=2Elen,
>-						breakinfo[breakno]=2Etype);
>-			set_debugreg(early_dr7, 7);
>-			continue;
>-		}
>-		bp =3D *per_cpu_ptr(breakinfo[breakno]=2Epev, cpu);
>-		info =3D counter_arch_bp(bp);
>-		if (bp->attr=2Edisabled !=3D 1)
>-			continue;
>-		bp->attr=2Ebp_addr =3D breakinfo[breakno]=2Eaddr;
>-		bp->attr=2Ebp_len =3D breakinfo[breakno]=2Elen;
>-		bp->attr=2Ebp_type =3D breakinfo[breakno]=2Etype;
>-		info->address =3D breakinfo[breakno]=2Eaddr;
>-		info->len =3D breakinfo[breakno]=2Elen;
>-		info->type =3D breakinfo[breakno]=2Etype;
>-		val =3D arch_install_hw_breakpoint(bp);
>-		if (!val)
>-			bp->attr=2Edisabled =3D 0;
>-	}
>-	if (!dbg_is_early)
>-		hw_breakpoint_restore();
>-}
>-
>-static int hw_break_reserve_slot(int breakno)
>-{
>-	int cpu;
>-	int cnt =3D 0;
>-	struct perf_event **pevent;
>-
>-	if (dbg_is_early)
>-		return 0;
>-
>-	for_each_online_cpu(cpu) {
>-		cnt++;
>-		pevent =3D per_cpu_ptr(breakinfo[breakno]=2Epev, cpu);
>-		if (dbg_reserve_bp_slot(*pevent))
>-			goto fail;
>-	}
>-
>-	return 0;
>-
>-fail:
>-	for_each_online_cpu(cpu) {
>-		cnt--;
>-		if (!cnt)
>-			break;
>-		pevent =3D per_cpu_ptr(breakinfo[breakno]=2Epev, cpu);
>-		dbg_release_bp_slot(*pevent);
>-	}
>-	return -1;
>-}
>-
>-static int hw_break_release_slot(int breakno)
>-{
>-	struct perf_event **pevent;
>-	int cpu;
>-
>-	if (dbg_is_early)
>-		return 0;
>-
>-	for_each_online_cpu(cpu) {
>-		pevent =3D per_cpu_ptr(breakinfo[breakno]=2Epev, cpu);
>-		if (dbg_release_bp_slot(*pevent))
>-			/*
>-			 * The debugger is responsible for handing the retry on
>-			 * remove failure=2E
>-			 */
>-			return -1;
>-	}
>-	return 0;
>-}
>-
>-static int
>-kgdb_remove_hw_break(unsigned long addr, int len, enum kgdb_bptype bptyp=
e)
>-{
>-	int i;
>-
>-	for (i =3D 0; i < HBP_NUM; i++)
>-		if (breakinfo[i]=2Eaddr =3D=3D addr && breakinfo[i]=2Eenabled)
>-			break;
>-	if (i =3D=3D HBP_NUM)
>-		return -1;
>-
>-	if (hw_break_release_slot(i)) {
>-		printk(KERN_ERR "Cannot remove hw breakpoint at %lx\n", addr);
>-		return -1;
>-	}
>-	breakinfo[i]=2Eenabled =3D 0;
>-
>-	return 0;
>-}
>-
>-static void kgdb_remove_all_hw_break(void)
>-{
>-	int i;
>-	int cpu =3D raw_smp_processor_id();
>-	struct perf_event *bp;
>-
>-	for (i =3D 0; i < HBP_NUM; i++) {
>-		if (!breakinfo[i]=2Eenabled)
>-			continue;
>-		bp =3D *per_cpu_ptr(breakinfo[i]=2Epev, cpu);
>-		if (!bp->attr=2Edisabled) {
>-			arch_uninstall_hw_breakpoint(bp);
>-			bp->attr=2Edisabled =3D 1;
>-			continue;
>-		}
>-		if (dbg_is_early)
>-			early_dr7 &=3D ~encode_dr7(i, breakinfo[i]=2Elen,
>-						 breakinfo[i]=2Etype);
>-		else if (hw_break_release_slot(i))
>-			printk(KERN_ERR "KGDB: hw bpt remove failed %lx\n",
>-			       breakinfo[i]=2Eaddr);
>-		breakinfo[i]=2Eenabled =3D 0;
>-	}
>-}
>-
>-static int
>-kgdb_set_hw_break(unsigned long addr, int len, enum kgdb_bptype bptype)
>-{
>-	int i;
>-
>-	for (i =3D 0; i < HBP_NUM; i++)
>-		if (!breakinfo[i]=2Eenabled)
>-			break;
>-	if (i =3D=3D HBP_NUM)
>-		return -1;
>-
>-	switch (bptype) {
>-	case BP_HARDWARE_BREAKPOINT:
>-		len =3D 1;
>-		breakinfo[i]=2Etype =3D X86_BREAKPOINT_EXECUTE;
>-		break;
>-	case BP_WRITE_WATCHPOINT:
>-		breakinfo[i]=2Etype =3D X86_BREAKPOINT_WRITE;
>-		break;
>-	case BP_ACCESS_WATCHPOINT:
>-		breakinfo[i]=2Etype =3D X86_BREAKPOINT_RW;
>-		break;
>-	default:
>-		return -1;
>-	}
>-	switch (len) {
>-	case 1:
>-		breakinfo[i]=2Elen =3D X86_BREAKPOINT_LEN_1;
>-		break;
>-	case 2:
>-		breakinfo[i]=2Elen =3D X86_BREAKPOINT_LEN_2;
>-		break;
>-	case 4:
>-		breakinfo[i]=2Elen =3D X86_BREAKPOINT_LEN_4;
>-		break;
>-#ifdef CONFIG_X86_64
>-	case 8:
>-		breakinfo[i]=2Elen =3D X86_BREAKPOINT_LEN_8;
>-		break;
>-#endif
>-	default:
>-		return -1;
>-	}
>-	breakinfo[i]=2Eaddr =3D addr;
>-	if (hw_break_reserve_slot(i)) {
>-		breakinfo[i]=2Eaddr =3D 0;
>-		return -1;
>-	}
>-	breakinfo[i]=2Eenabled =3D 1;
>-
>-	return 0;
>-}
>-
>-/**
>- *	kgdb_disable_hw_debug - Disable hardware debugging while we in kgdb=
=2E
>- *	@regs: Current &struct pt_regs=2E
>- *
>- *	This function will be called if the particular architecture must
>- *	disable hardware debugging while it is processing gdb packets or
>- *	handling exception=2E
>- */
>-static void kgdb_disable_hw_debug(struct pt_regs *regs)
>-{
>-	int i;
>-	int cpu =3D raw_smp_processor_id();
>-	struct perf_event *bp;
>-
>-	/* Disable hardware debugging while we are in kgdb: */
>-	set_debugreg(DR7_FIXED_1, 7);
>-	for (i =3D 0; i < HBP_NUM; i++) {
>-		if (!breakinfo[i]=2Eenabled)
>-			continue;
>-		if (dbg_is_early) {
>-			early_dr7 &=3D ~encode_dr7(i, breakinfo[i]=2Elen,
>-						 breakinfo[i]=2Etype);
>-			continue;
>-		}
>-		bp =3D *per_cpu_ptr(breakinfo[i]=2Epev, cpu);
>-		if (bp->attr=2Edisabled =3D=3D 1)
>-			continue;
>-		arch_uninstall_hw_breakpoint(bp);
>-		bp->attr=2Edisabled =3D 1;
>-	}
>-}
>-
>-#ifdef CONFIG_SMP
>-/**
>- *	kgdb_roundup_cpus - Get other CPUs into a holding pattern
>- *
>- *	On SMP systems, we need to get the attention of the other CPUs
>- *	and get them into a known state=2E  This should do what is needed
>- *	to get the other CPUs to call kgdb_handle_exception()=2E  Note that
>- *	on some arches, the NMI approach is not used for rounding up all
>- *	the CPUs=2E  For example, in case of MIPS, smp_call_function() is
>- *	used to roundup CPUs=2E
>- *
>- *	On non-SMP systems, this is not called=2E
>- */
>-void kgdb_roundup_cpus(void)
>-{
>-	apic_send_IPI_allbutself(NMI_VECTOR);
>-}
>-#endif
>-
>-/**
>- *	kgdb_arch_handle_exception - Handle architecture specific GDB packets=
=2E
>- *	@e_vector: The error vector of the exception that happened=2E
>- *	@signo: The signal number of the exception that happened=2E
>- *	@err_code: The error code of the exception that happened=2E
>- *	@remcomInBuffer: The buffer of the packet we have read=2E
>- *	@remcomOutBuffer: The buffer of %BUFMAX bytes to write a packet into=
=2E
>- *	@linux_regs: The &struct pt_regs of the current process=2E
>- *
>- *	This function MUST handle the 'c' and 's' command packets,
>- *	as well packets to set / remove a hardware breakpoint, if used=2E
>- *	If there are additional packets which the hardware needs to handle,
>- *	they are handled here=2E  The code should return -1 if it wants to
>- *	process more packets, and a %0 or %1 if it wants to exit from the
>- *	kgdb callback=2E
>- */
>-int kgdb_arch_handle_exception(int e_vector, int signo, int err_code,
>-			       char *remcomInBuffer, char *remcomOutBuffer,
>-			       struct pt_regs *linux_regs)
>-{
>-	unsigned long addr;
>-	char *ptr;
>-
>-	switch (remcomInBuffer[0]) {
>-	case 'c':
>-	case 's':
>-		/* try to read optional parameter, pc unchanged if no parm */
>-		ptr =3D &remcomInBuffer[1];
>-		if (kgdb_hex2long(&ptr, &addr))
>-			linux_regs->ip =3D addr;
>-		fallthrough;
>-	case 'D':
>-	case 'k':
>-		/* clear the trace bit */
>-		linux_regs->flags &=3D ~X86_EFLAGS_TF;
>-		atomic_set(&kgdb_cpu_doing_single_step, -1);
>-
>-		/* set the trace bit if we're stepping */
>-		if (remcomInBuffer[0] =3D=3D 's') {
>-			linux_regs->flags |=3D X86_EFLAGS_TF;
>-			atomic_set(&kgdb_cpu_doing_single_step,
>-				   raw_smp_processor_id());
>-		}
>-
>-		return 0;
>-	}
>-
>-	/* this means that we do not want to exit from the handler: */
>-	return -1;
>-}
>-
>-static inline int
>-single_step_cont(struct pt_regs *regs, struct die_args *args)
>-{
>-	/*
>-	 * Single step exception from kernel space to user space so
>-	 * eat the exception and continue the process:
>-	 */
>-	printk(KERN_ERR "KGDB: trap/step from kernel to user space, "
>-			"resuming=2E=2E=2E\n");
>-	kgdb_arch_handle_exception(args->trapnr, args->signr,
>-				   args->err, "c", "", regs);
>-	/*
>-	 * Reset the BS bit in dr6 (pointed by args->err) to
>-	 * denote completion of processing
>-	 */
>-	(*(unsigned long *)ERR_PTR(args->err)) &=3D ~DR_STEP;
>-
>-	return NOTIFY_STOP;
>-}
>-
>-static DECLARE_BITMAP(was_in_debug_nmi, NR_CPUS);
>-
>-static int kgdb_nmi_handler(unsigned int cmd, struct pt_regs *regs)
>-{
>-	int cpu;
>-
>-	switch (cmd) {
>-	case NMI_LOCAL:
>-		if (atomic_read(&kgdb_active) !=3D -1) {
>-			/* KGDB CPU roundup */
>-			cpu =3D raw_smp_processor_id();
>-			kgdb_nmicallback(cpu, regs);
>-			set_bit(cpu, was_in_debug_nmi);
>-			touch_nmi_watchdog();
>-
>-			return NMI_HANDLED;
>-		}
>-		break;
>-
>-	case NMI_UNKNOWN:
>-		cpu =3D raw_smp_processor_id();
>-
>-		if (__test_and_clear_bit(cpu, was_in_debug_nmi))
>-			return NMI_HANDLED;
>-
>-		break;
>-	default:
>-		/* do nothing */
>-		break;
>-	}
>-	return NMI_DONE;
>-}
>-
>-static int __kgdb_notify(struct die_args *args, unsigned long cmd)
>-{
>-	struct pt_regs *regs =3D args->regs;
>-
>-	switch (cmd) {
>-	case DIE_DEBUG:
>-		if (atomic_read(&kgdb_cpu_doing_single_step) !=3D -1) {
>-			if (user_mode(regs))
>-				return single_step_cont(regs, args);
>-			break;
>-		} else if (test_thread_flag(TIF_SINGLESTEP))
>-			/* This means a user thread is single stepping
>-			 * a system call which should be ignored
>-			 */
>-			return NOTIFY_DONE;
>-		fallthrough;
>-	default:
>-		if (user_mode(regs))
>-			return NOTIFY_DONE;
>-	}
>-
>-	if (kgdb_handle_exception(args->trapnr, args->signr, cmd, regs))
>-		return NOTIFY_DONE;
>-
>-	/* Must touch watchdog before return to normal operation */
>-	touch_nmi_watchdog();
>-	return NOTIFY_STOP;
>-}
>-
>-int kgdb_ll_trap(int cmd, const char *str,
>-		 struct pt_regs *regs, long err, int trap, int sig)
>-{
>-	struct die_args args =3D {
>-		=2Eregs	=3D regs,
>-		=2Estr	=3D str,
>-		=2Eerr	=3D err,
>-		=2Etrapnr	=3D trap,
>-		=2Esignr	=3D sig,
>-
>-	};
>-
>-	if (!kgdb_io_module_registered)
>-		return NOTIFY_DONE;
>-
>-	return __kgdb_notify(&args, cmd);
>-}
>-
>-static int
>-kgdb_notify(struct notifier_block *self, unsigned long cmd, void *ptr)
>-{
>-	unsigned long flags;
>-	int ret;
>-
>-	local_irq_save(flags);
>-	ret =3D __kgdb_notify(ptr, cmd);
>-	local_irq_restore(flags);
>-
>-	return ret;
>-}
>-
>-static struct notifier_block kgdb_notifier =3D {
>-	=2Enotifier_call	=3D kgdb_notify,
>-};
>-
>-/**
>- *	kgdb_arch_init - Perform any architecture specific initialization=2E
>- *
>- *	This function will handle the initialization of any architecture
>- *	specific callbacks=2E
>- */
>-int kgdb_arch_init(void)
>-{
>-	int retval;
>-
>-	retval =3D register_die_notifier(&kgdb_notifier);
>-	if (retval)
>-		goto out;
>-
>-	retval =3D register_nmi_handler(NMI_LOCAL, kgdb_nmi_handler,
>-					0, "kgdb");
>-	if (retval)
>-		goto out1;
>-
>-	retval =3D register_nmi_handler(NMI_UNKNOWN, kgdb_nmi_handler,
>-					0, "kgdb");
>-
>-	if (retval)
>-		goto out2;
>-
>-	return retval;
>-
>-out2:
>-	unregister_nmi_handler(NMI_LOCAL, "kgdb");
>-out1:
>-	unregister_die_notifier(&kgdb_notifier);
>-out:
>-	return retval;
>-}
>-
>-static void kgdb_hw_overflow_handler(struct perf_event *event,
>-		struct perf_sample_data *data, struct pt_regs *regs)
>-{
>-	struct task_struct *tsk =3D current;
>-	int i;
>-
>-	for (i =3D 0; i < 4; i++) {
>-		if (breakinfo[i]=2Eenabled)
>-			tsk->thread=2Evirtual_dr6 |=3D (DR_TRAP0 << i);
>-	}
>-}
>-
>-void kgdb_arch_late(void)
>-{
>-	int i, cpu;
>-	struct perf_event_attr attr;
>-	struct perf_event **pevent;
>-
>-	/*
>-	 * Pre-allocate the hw breakpoint instructions in the non-atomic
>-	 * portion of kgdb because this operation requires mutexs to
>-	 * complete=2E
>-	 */
>-	hw_breakpoint_init(&attr);
>-	attr=2Ebp_addr =3D (unsigned long)kgdb_arch_init;
>-	attr=2Ebp_len =3D HW_BREAKPOINT_LEN_1;
>-	attr=2Ebp_type =3D HW_BREAKPOINT_W;
>-	attr=2Edisabled =3D 1;
>-	for (i =3D 0; i < HBP_NUM; i++) {
>-		if (breakinfo[i]=2Epev)
>-			continue;
>-		breakinfo[i]=2Epev =3D register_wide_hw_breakpoint(&attr, NULL, NULL);
>-		if (IS_ERR_PCPU(breakinfo[i]=2Epev)) {
>-			printk(KERN_ERR "kgdb: Could not allocate hw"
>-			       "breakpoints\nDisabling the kernel debugger\n");
>-			breakinfo[i]=2Epev =3D NULL;
>-			kgdb_arch_exit();
>-			return;
>-		}
>-		for_each_online_cpu(cpu) {
>-			pevent =3D per_cpu_ptr(breakinfo[i]=2Epev, cpu);
>-			pevent[0]->hw=2Esample_period =3D 1;
>-			pevent[0]->overflow_handler =3D kgdb_hw_overflow_handler;
>-			if (pevent[0]->destroy !=3D NULL) {
>-				pevent[0]->destroy =3D NULL;
>-				release_bp_slot(*pevent);
>-			}
>-		}
>-	}
>-}
>-
>-/**
>- *	kgdb_arch_exit - Perform any architecture specific uninitalization=2E
>- *
>- *	This function will handle the uninitalization of any architecture
>- *	specific callbacks, for dynamic registration and unregistration=2E
>- */
>-void kgdb_arch_exit(void)
>-{
>-	int i;
>-	for (i =3D 0; i < 4; i++) {
>-		if (breakinfo[i]=2Epev) {
>-			unregister_wide_hw_breakpoint(breakinfo[i]=2Epev);
>-			breakinfo[i]=2Epev =3D NULL;
>-		}
>-	}
>-	unregister_nmi_handler(NMI_UNKNOWN, "kgdb");
>-	unregister_nmi_handler(NMI_LOCAL, "kgdb");
>-	unregister_die_notifier(&kgdb_notifier);
>-}
>-
>-/**
>- *	kgdb_skipexception - Bail out of KGDB when we've been triggered=2E
>- *	@exception: Exception vector number
>- *	@regs: Current &struct pt_regs=2E
>- *
>- *	On some architectures we need to skip a breakpoint exception when
>- *	it occurs after a breakpoint has been removed=2E
>- *
>- * Skip an int3 exception when it occurs after a breakpoint has been
>- * removed=2E Backtrack eip by 1 since the int3 would have caused it to
>- * increment by 1=2E
>- */
>-int kgdb_skipexception(int exception, struct pt_regs *regs)
>-{
>-	if (exception =3D=3D 3 && kgdb_isremovedbreak(regs->ip - 1)) {
>-		regs->ip -=3D 1;
>-		return 1;
>-	}
>-	return 0;
>-}
>-
>-unsigned long kgdb_arch_pc(int exception, struct pt_regs *regs)
>-{
>-	if (exception =3D=3D 3)
>-		return instruction_pointer(regs) - 1;
>-	return instruction_pointer(regs);
>-}
>-
>-void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long ip)
>-{
>-	regs->ip =3D ip;
>-}
>-
>-int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
>-{
>-	int err;
>-
>-	bpt->type =3D BP_BREAKPOINT;
>-	err =3D copy_from_kernel_nofault(bpt->saved_instr, (char *)bpt->bpt_add=
r,
>-				BREAK_INSTR_SIZE);
>-	if (err)
>-		return err;
>-	err =3D copy_to_kernel_nofault((char *)bpt->bpt_addr,
>-				 arch_kgdb_ops=2Egdb_bpt_instr, BREAK_INSTR_SIZE);
>-	if (!err)
>-		return err;
>-	/*
>-	 * It is safe to call text_poke_kgdb() because normal kernel execution
>-	 * is stopped on all cores, so long as the text_mutex is not locked=2E
>-	 */
>-	if (mutex_is_locked(&text_mutex))
>-		return -EBUSY;
>-	text_poke_kgdb((void *)bpt->bpt_addr, arch_kgdb_ops=2Egdb_bpt_instr,
>-		       BREAK_INSTR_SIZE);
>-	bpt->type =3D BP_POKE_BREAKPOINT;
>-
>-	return 0;
>-}
>-
>-int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
>-{
>-	if (bpt->type !=3D BP_POKE_BREAKPOINT)
>-		goto knl_write;
>-	/*
>-	 * It is safe to call text_poke_kgdb() because normal kernel execution
>-	 * is stopped on all cores, so long as the text_mutex is not locked=2E
>-	 */
>-	if (mutex_is_locked(&text_mutex))
>-		goto knl_write;
>-	text_poke_kgdb((void *)bpt->bpt_addr, bpt->saved_instr,
>-		       BREAK_INSTR_SIZE);
>-	return 0;
>-
>-knl_write:
>-	return copy_to_kernel_nofault((char *)bpt->bpt_addr,
>-				  (char *)bpt->saved_instr, BREAK_INSTR_SIZE);
>-}
>-
>-const struct kgdb_arch arch_kgdb_ops =3D {
>-	/* Breakpoint instruction: */
>-	=2Egdb_bpt_instr		=3D { 0xcc },
>-	=2Eflags			=3D KGDB_HW_BREAKPOINT,
>-	=2Eset_hw_breakpoint	=3D kgdb_set_hw_break,
>-	=2Eremove_hw_breakpoint	=3D kgdb_remove_hw_break,
>-	=2Edisable_hw_break	=3D kgdb_disable_hw_debug,
>-	=2Eremove_all_hw_break	=3D kgdb_remove_all_hw_break,
>-	=2Ecorrect_hw_break	=3D kgdb_correct_hw_break,
>-};
>diff --git a/arch/x86/kernel/kprobes/core=2Ec b/arch/x86/kernel/kprobes/c=
ore=2Ec
>index 133ff20caccd=2E=2E65707e4cffae 100644
>--- a/arch/x86/kernel/kprobes/core=2Ec
>+++ b/arch/x86/kernel/kprobes/core=2Ec
>@@ -37,7 +37,6 @@
> #include <linux/extable=2Eh>
> #include <linux/kdebug=2Eh>
> #include <linux/kallsyms=2Eh>
>-#include <linux/kgdb=2Eh>
> #include <linux/ftrace=2Eh>
> #include <linux/kasan=2Eh>
> #include <linux/objtool=2Eh>
>@@ -311,15 +310,6 @@ static bool can_probe(unsigned long paddr)
> 		if (insn_decode_kernel(&insn, (void *)__addr) < 0)
> 			return false;
>=20
>-#ifdef CONFIG_KGDB
>-		/*
>-		 * If there is a dynamically installed kgdb sw breakpoint,
>-		 * this function should not be probed=2E
>-		 */
>-		if (insn=2Eopcode=2Ebytes[0] =3D=3D INT3_INSN_OPCODE &&
>-		    kgdb_has_hit_break(addr))
>-			return false;
>-#endif
> 		addr +=3D insn=2Elength;
> 	}
>=20
>diff --git a/arch/x86/kernel/kprobes/opt=2Ec b/arch/x86/kernel/kprobes/op=
t=2Ec
>index 3f8fea52619f=2E=2E821a416faf67 100644
>--- a/arch/x86/kernel/kprobes/opt=2Ec
>+++ b/arch/x86/kernel/kprobes/opt=2Ec
>@@ -15,7 +15,6 @@
> #include <linux/extable=2Eh>
> #include <linux/kdebug=2Eh>
> #include <linux
Is that really true? What if the debugging depends on specific hardware?
