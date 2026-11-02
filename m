Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619628;
	b=5msYWeJJFQrm7mRbYZXLRaDhscdJshWAPfSd1n9I8WGi0LtvsV+mIDmnHEDp5RyMfBT8
	 2qfts81WlK6hsUe13oklXUw3/UO5jZ0GEUv5A/kBt4LlkM3+vfzkcBHYkFfqM4/YNuuco
	 Bkb8ZbGVpMMFxjukJVld3WzHL+edVy+CDY1dZ1l+NahBrryLCqyCs8e6bx1T4QeUcCclx
	 ZkJHCDr8jb0lw6PrCDnR/MNG6+350SdLFLI4rPg4n3Jd+B3NjapxdMbMQiyRJgw9Kr46v
	 Az9LrOWBwF2/dqbb1m3NPlxNRe15UDq7SXO0qBGvH1QGeF5SvsjDPP3Ioz2pn8Nq6sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619628;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=nnI+HtVvJqAE6HJJf0gTc9OpPe4dBoQOZPr4axzErbo=;
	b=A47ZIKUc1bJZ170ZSuu/Nhwk2qIobokJFdi76PgqZaTmqGD4DOOJbpgPTf2GyB2qnlA/
	 XyDRqdth4f8/615Wsfi1EaWQ4KKhSoE+0eOt2jY5hD2w0tAVTXQxhqHheabg/8ZUKZZlw
	 9j/KEmph2GkwU9lPCVyGLrfYUNC1QS50+vM/MP/FBUE39tZ7NbZwJZqho+R1sZjgGf1Ze
	 8PkBdX9AC8G2Y65kKgnfBf33nfdurI0pRFrjGX+X3k+WZVu7NGpwjuqjBLmKsMj6PH6SE
	 3Jwwr9jeV9pSKoXCYldJsUiWuKqaVs/alktBBUDlHqQKShRC/PTb9L7vznY5QGsy7dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=F7cQpqgZ;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EB7606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3EB7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=F7cQpqgZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=nnI+HtVvJqAE6HJJf0gTc9OpPe4dBoQOZPr4axzErbo=; b=F7cQpqgZLdHYI7vh8BXhvrLop4
	IXG+wE0HUApS/gyTsc2YLV8pnkM3bdvVUcb3l3DOCLhmLADfV05JEbkcdR/KjCm337Cw/oxHFj3eV
	RrD1Lh5U7QLf5Mdadg6r1Mc1LHDGlf+Elykgtf4akNDN4xaqvQ1EgPUTCGAQnHECUJeT/hEhCtDnz
	UMDfDSKKXa+ErQktvjbJjC4ZRULnRXUVQrtn1Rq7NCjTMPpAMMnENvmWY6gZld8sDLyfNdTxlfFrz
	j02ZC8v4XAdeF8aimF635DoqiHGA4K9Uuxraw1f1/rdb3hxvFnv+dSZbjus5ukjnIPd9PMMi1w3Kn
	dQlObIdA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqOn-00000002K7X-1uLm;
	Mon, 02 Nov 2026 11:40:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 757503014C0; Mon, 02 Nov 2026 12:40:24 +0100 (CET)
Message-ID: <20261102114000.436794287@infradead.org>
User-Agent: quilt/0.68
Date: Mon, 02 Nov 2026 12:25:50 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 jpoimboe@kernel.org,
 leitao@debian.org,
 keescook@chromium.org,
 hpa@zytor.com
Subject: [PATCH 1/6] x86_64/entry: Unconditionally use -fno-jump-table
References: <20261102112549.714541309@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Currently we force -fno-jump-table for RETPOLINE=y || X86_KERNEL_IBT=y, which
means that it is effectively disabled for most everyone these days.

Simply unconditionally disable jump tables for x86_64 to take away the edge
case.

Doing so, allows removing the array_index_nospec() barrier in the syscall
dispatch since it cannot be an array index anymore.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/Kconfig            |    4 +---
 arch/x86/Makefile           |   27 ++++++++-------------------
 arch/x86/entry/syscall_32.c |    2 ++
 arch/x86/entry/syscall_64.c |    2 --
 4 files changed, 11 insertions(+), 24 deletions(-)

--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2366,10 +2366,8 @@ config CC_OPT_INDIRECT_BRANCH_CS_PREFIX
 config CC_OPT_CF_PROTECTION_NONE
 	def_string "$(cc-option-str,-fcf-protection=none)"
 
-# with jump tables off: the compilers use NOTRACK for them, which kernel IBT
-# does not allow
 config CC_OPT_CF_PROTECTION_BRANCH
-	def_string "$(cc-option-str,-fcf-protection=branch -fno-jump-tables)"
+	def_string "$(cc-option-str,-fcf-protection=branch)"
 
 config CC_OPT_FALIGN_JUMPS
 	def_string "$(cc-option-str,-falign-jumps=1)"
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -90,17 +90,8 @@ CC_FLAGS_FPU += -mhard-float
 endif
 
 ifeq ($(CONFIG_X86_KERNEL_IBT),y)
-#
-# Kernel IBT has S_CET.NOTRACK_EN=0, as such the compilers must not generate
-# NOTRACK prefixes. Current generation compilers unconditionally employ NOTRACK
-# for jump-tables, as such, disable jump-tables for now.
-#
-# (jump-tables are implicitly disabled by RETPOLINE)
-#
-#   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104816
-#
 KBUILD_CFLAGS += $(CONFIG_CC_OPT_CF_PROTECTION_BRANCH)
-KBUILD_RUSTFLAGS += -Zcf-protection=branch $(if $(call rustc-min-version,109300),-Cjump-tables=n,-Zno-jump-tables)
+KBUILD_RUSTFLAGS += -Zcf-protection=branch
 else
 KBUILD_CFLAGS += $(CONFIG_CC_OPT_CF_PROTECTION_NONE)
 endif
@@ -178,6 +169,13 @@ endif
         KBUILD_RUSTFLAGS += -Ccode-model=kernel
 
         percpu_seg := gs
+
+	# Due to retpolines and cf-protection=branch's implicit NOTRACK usage
+	# for jump-tables, blanked disable jump-tables for all x86_64 builds to
+	# get a consistent behaviour across configurations. This allows
+	# removing some array_index_nospec() usage.
+	KBUILD_CFLAGS += -fno-jump-tables
+	KBUILD_RUSTFLAGS += $(if $(call rustc-min-version,109300),-Cjump-tables=n,-Zno-jump-tables)
 endif
 
 ifeq ($(CONFIG_STACKPROTECTOR),y)
@@ -214,15 +212,6 @@ KBUILD_CFLAGS += -fno-asynchronous-unwin
 ifdef CONFIG_MITIGATION_RETPOLINE
   KBUILD_CFLAGS += $(RETPOLINE_CFLAGS)
   KBUILD_RUSTFLAGS += $(RETPOLINE_RUSTFLAGS)
-  # Additionally, avoid generating expensive indirect jumps which
-  # are subject to retpolines for small number of switch cases.
-  # LLVM turns off jump table generation by default when under
-  # retpoline builds, however, gcc does not for x86. This has
-  # only been fixed starting from gcc stable version 8.4.0 and
-  # onwards, but not for older ones. See gcc bug #86952.
-  ifndef CONFIG_CC_IS_CLANG
-    KBUILD_CFLAGS += -fno-jump-tables
-  endif
 endif
 
 ifdef CONFIG_MITIGATION_SLS
--- a/arch/x86/entry/syscall_32.c
+++ b/arch/x86/entry/syscall_32.c
@@ -75,7 +75,9 @@ early_param("ia32_emulation", ia32_emula
 static __always_inline void do_syscall_32_irqs_on(struct pt_regs *regs, unsigned long nr)
 {
 	if (likely(nr < IA32_NR_syscalls)) {
+#ifdef CONFIG_X86_32
 		nr = array_index_nospec(nr, IA32_NR_syscalls);
+#endif
 		regs->ax = ia32_sys_call(regs, (unsigned int)nr);
 	}
 }
--- a/arch/x86/entry/syscall_64.c
+++ b/arch/x86/entry/syscall_64.c
@@ -57,7 +57,6 @@ static noinline long x32_sys_call(const
 static __always_inline bool do_syscall_x64(struct pt_regs *regs, unsigned long nr)
 {
 	if (likely(nr < NR_syscalls)) {
-		nr = array_index_nospec(nr, NR_syscalls);
 		regs->ax = x64_sys_call(regs, (unsigned int)nr);
 		return true;
 	}
@@ -70,7 +69,6 @@ static __always_inline void do_syscall_x
 	nr -= __X32_SYSCALL_BIT;
 
 	if (IS_ENABLED(CONFIG_X86_X32_ABI) && likely(nr < X32_NR_syscalls)) {
-		nr = array_index_nospec(nr, X32_NR_syscalls);
 		regs->ax = x32_sys_call(regs, (unsigned int)nr);
 	}
 }


