Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742202;
	b=J1f2j3UTD7paiScAAYdhXqd8i6fVDU/C2eUoHALeQIag1e2lBgLg7wbHuOMyXDYPPHWE
	 NLwaDBBwG38Vg+aQ2JqoibpwNFqCFMd6yuwDFYo61BfoWV3GyqR+I6wpbinmn/0GvVVN5
	 YM9+9LAopqw/s2/6GhDDSYUwsjN3Yad0RQfSHxV7KVktMrn+WiZwxcD4D34XMEql1J1Zf
	 pDrSVYKmwKVvRhNxWmrTysMrZelwUBgoMhp33pq8nZDfU6jGADsANVP6wWNia1Da4tn2O
	 Se7ZQW6oZpVUE4+NP5Q9khWi+1HBCtFcEXWzRmegUWwE0iM80cuPH9XqTZuNVBfwefw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EYQpUy2+UXHetX7SiIFEVlzkVPlss1fJ3bnZiOcyqFE=;
	b=CsOGzhJkkm11qUZ8qSH55scO5ifE3uDsnTQe4Inug9zkrgWCB93NwoujdF779/lAX/rf
	 5wlJarygjpgvGV+G10zGKx+jlqg0xcPAe3DBZvgnjNuZGEDjnvWW7oKBBI28DZ75SeEkp
	 3gHX6HGsd0AQxcDxbvDCmuf0ulU5iugkH3lqOSkPkwPwGsHvq7jC1rT06Fbk6uMzRxxN8
	 k1uD3R3wkGld330GOf165Jq9h/STZdsMLQhdiKBDOlsLderBm7iM4S8Lrg6MKXWoQtkSi
	 vq56p5jfO3mXDhwcNqslJ41sZpT8ojzxEt3zPHMJ3efHLZU7WHGpFkQZ9roaBBg+qSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SsQtromT;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA4B606D80D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFA4B606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SsQtromT
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso6438885a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742200; x=1794347000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYQpUy2+UXHetX7SiIFEVlzkVPlss1fJ3bnZiOcyqFE=;
        b=SsQtromTo/HIdlfEAXhLjXB0F+mQY/mTPJGTY/AdMhxMT4Co/jksH3ATOK7UClXaNk
         6ly24cSLtBRbiwl46yC2xMYkXFqW41k2J0hzR2aGviJeeeNi7HyO3FRp7u06UWRMk5j7
         zgYqIrIv4mkGgs6tVrQ4HlAP4pTYaC7zIiFnJp5bhdCaz3m2hOxmKPVBUGEt36BIhEsZ
         W/tw2IlrSFcgVU+lwEKiFxH2q96gYO/aWd5jGIaNcAXgPqigzW1pgqN4VbqcF9tz0mJD
         LB0l6j1pTC+G1EPUsx1Ce3eXPUa1zuFqydeoplLRcjjHWjLui8iPkkIvO06y3mpqgXzo
         FATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742200; x=1794347000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYQpUy2+UXHetX7SiIFEVlzkVPlss1fJ3bnZiOcyqFE=;
        b=ICWM6sh/D6nadqKq3GfhNyTiwKJnrOO+XPOi8SOImj/wToQkE1V5l4m8umwgio8dGd
         GfRwNdeXbwr73IG1M0pqxV4F32+FIEzZSf6oNBS0ypXro/j/7Tvs1/M1zdbTjJ2uURgc
         eCtfFv+nNTEi2MVYJJpOl78akxoZ62q6LJyvvaV0GkGU1n5KEKioPCn3NEYKFOLHxzb1
         JWKfGgfx5NyKPYQEKH/kjs8HP9uY0xsMy3PCiqEy6GG5aToB3t/nb2PLfBJaWXxBYkyd
         KbgeiWlLOFQCaEO4zaGHhi7qyTK3z8fdLw7VtbofZ194ROBFsUAzYcphvu6GgxrNQSYk
         W91Q==
X-Forwarded-Encrypted: i=1; AKwUvBwnkobl0jxZKLwyixdloUKpXmutfGdfjjUeI0IgW9VlSgzvXQ+841wzdn861R8RIAq8tD7HP+sYGVMbhnU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HcRBhHr5ikMAExTL5WxAUsdwQgBBje9xCyTJ5OmQhiIdzBLdE
	ROHvmqqhbezDZpC9dV68+rA/f6eTGtRCIARgjocOgpKTgZrRS/ZWQtI7
X-Gm-Gg: AYBFou2Z/S3OpO0y1Uy6mQKWh/YxWeZxOQgwHZY2V0kecNoKfm7pgoQCBy2EXUpmZF1
	KKV4V4waHfjhyqvWr/yCo6Fzlmjps5LyR5AM+qI7zv6MMGZyHeWy8Wv+qSRmV8jeCe0kKDOGcMt
	lSZI5zYVxhNqNds/yN3wtyx340Aclxjk9vlx1I3k36D6MWNklTARKmC9Dj4V/MmD1Qj5XI8ccWY
	EiuNyeOJKANMQ94wz5cfi5Sn2+id/cgxXjBiLayyDtHI+GubT21ATkZM82ZjxCYCRJ493HXgUpi
	g9v4RQC1vo8WTkr5DSLijdLRswit1UGlegv8x8B2f/EJIbgupHQHd8MhV0a4jXa/xGAngvdbdJv
	BkxSX+doVX9X4KXxR009mk/sG1n0hKMN3i4ueED6h4VElx1SH077hI0Jl1N77Ps7/+iibZyBKYP
	zv0TwsQaMR3H1FehbQ0Tta28f/RjfUf/2bQFNzSq0IIbF+xSCiDKaCQuunT7lozZbRDlxw5ez21
	9A+/4wGbXubSkSheu3VckPnK3KLfQFqMaO3z8keWNTRl0oy9+GBe3HeFEzznDaLF7qHFvrYmzMu
	YlDpQFyDXBkB8ei6Fha5vTcuB0Rrm9BHLUhBVLJYfgmqWvw0HHH7/7GS066AWDJ2x4GX/Tmzs6h
	Dpjyo9GAbaAW7R9pl
X-Received: by 2002:a05:6402:2808:b0:6b5:4f5c:cb8 with SMTP id 4fb4d7f45d1cf-6b54f5c316cmr1114042a12.44.1793742199980;
        Tue, 03 Nov 2026 13:43:19 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:19 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 07/14] alpha: use generic entry helpers for interrupts and exceptions
Date: Tue,  3 Nov 2026 22:35:13 +0100
Message-ID: <20261103214120.1099893-8-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
References: <20261103214120.1099893-1-linmag7@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use irqentry_enter()/irqentry_exit() for ordinary interrupts and
exceptions and centralize hardirq accounting in do_entInt(). Keep the
saved switch_stack available for signals and fault fixups; register
restoration and PAL_rti remain in assembly.

Interrupts now save a switch_stack too; generic exit handles kernel IRQ
state restoration. Keep kernel FEN recovery outside entry bookkeeping,
since it can interrupt FP saves and restores during entry or exit.
The special kernel unaligned-access path is unchanged.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/entry-common.h |   7 --
 arch/alpha/kernel/entry.S             | 138 ++++++----------------------------
 arch/alpha/kernel/irq.c               |   8 +-
 arch/alpha/kernel/irq_alpha.c         |  41 +++-------
 arch/alpha/kernel/process.c           |   2 +-
 arch/alpha/kernel/signal.c            |   7 +-
 arch/alpha/kernel/traps.c             | 118 +++++++++++++++++++++++------
 arch/alpha/mm/fault.c                 |  25 +++++-
 8 files changed, 154 insertions(+), 192 deletions(-)

diff --git a/arch/alpha/include/asm/entry-common.h b/arch/alpha/include/asm/entry-common.h
index 85dabd1021da012269eb28acb3ce2da21e0ad706..1d3b3d67235858419a069b7d9e4ce44f2e4e5525 100644
--- a/arch/alpha/include/asm/entry-common.h
+++ b/arch/alpha/include/asm/entry-common.h
@@ -6,13 +6,6 @@
 #include <asm/syscall.h>
 #include <asm/thread_info.h>
 
-#define arch_exit_to_user_mode_work arch_exit_to_user_mode_work
-
-static __always_inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
-				unsigned long ti_work)
-{
-}
-
 #define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
 static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
 						 unsigned long ti_work)
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index d67ccfc8abac4b97ceb6fa8c7bad8024b9bf5660..2233eb6da7065e7d85cbc668a09e565bcfd75a52 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -185,77 +185,25 @@
  * Non-syscall kernel entry points.
  */
 
-CFI_START_OSF_FRAME entInt
+/* Keep the switch_stack available to generic exit work and fault fixups. */
+.macro EXCEPTION_ENTRY name, handler, regs_arg
+CFI_START_OSF_FRAME \name
 	SAVE_ALL
-	lda	$8, 0x3fff
-	lda	$26, ret_from_exception
-	bic	$sp, $8, $8
-	mov	$sp, $19
-	jsr	$31, do_entInt
-CFI_END_OSF_FRAME entInt
-
-CFI_START_OSF_FRAME entArith
-	SAVE_ALL
-	lda	$8, 0x3fff
-	lda	$26, ret_from_exception
-	bic	$sp, $8, $8
-	mov	$sp, $18
-	jsr	$31, do_entArith
-CFI_END_OSF_FRAME entArith
-
-CFI_START_OSF_FRAME entMM
-	SAVE_ALL
-/* save $9 - $15 so the inline exception code can manipulate them.  */
-	subq	$sp, 64, $sp
-	.cfi_adjust_cfa_offset	64
-	stq	$9, 0($sp)
-	stq	$10, 8($sp)
-	stq	$11, 16($sp)
-	stq	$12, 24($sp)
-	stq	$13, 32($sp)
-	stq	$14, 40($sp)
-	stq	$15, 48($sp)
-	.cfi_rel_offset	$9, 0
-	.cfi_rel_offset	$10, 8
-	.cfi_rel_offset	$11, 16
-	.cfi_rel_offset	$12, 24
-	.cfi_rel_offset	$13, 32
-	.cfi_rel_offset	$14, 40
-	.cfi_rel_offset	$15, 48
-	addq	$sp, 64, $19
-/* handle the fault */
+	mov	$sp, \regs_arg
+	DO_SWITCH_STACK
 	lda	$8, 0x3fff
 	bic	$sp, $8, $8
-	jsr	$26, do_page_fault
-/* reload the registers after the exception code played.  */
-	ldq	$9, 0($sp)
-	ldq	$10, 8($sp)
-	ldq	$11, 16($sp)
-	ldq	$12, 24($sp)
-	ldq	$13, 32($sp)
-	ldq	$14, 40($sp)
-	ldq	$15, 48($sp)
-	addq	$sp, 64, $sp
-	.cfi_restore	$9
-	.cfi_restore	$10
-	.cfi_restore	$11
-	.cfi_restore	$12
-	.cfi_restore	$13
-	.cfi_restore	$14
-	.cfi_restore	$15
-	.cfi_adjust_cfa_offset	-64
-/* finish up the syscall as normal.  */
+	jsr	$26, \handler
+	ldgp	$gp, 0($26)
+	UNDO_SWITCH_STACK
 	br	ret_from_exception
-CFI_END_OSF_FRAME entMM
+CFI_END_OSF_FRAME \name
+.endm
 
-CFI_START_OSF_FRAME entIF
-	SAVE_ALL
-	lda	$8, 0x3fff
-	lda	$26, ret_from_exception
-	bic	$sp, $8, $8
-	mov	$sp, $17
-	jsr	$31, do_entIF
-CFI_END_OSF_FRAME entIF
+EXCEPTION_ENTRY entInt, do_entInt, $19
+EXCEPTION_ENTRY entArith, do_entArith, $18
+EXCEPTION_ENTRY entMM, do_page_fault, $19
+EXCEPTION_ENTRY entIF, do_entIF, $17
 
 CFI_START_OSF_FRAME entUna
 	lda	$sp, -256($sp)
@@ -391,53 +339,17 @@ entUnaUser:
 	.cfi_restore	$0
 	.cfi_adjust_cfa_offset	-256
 	SAVE_ALL		/* setup normal kernel stack */
-	lda	$sp, -64($sp)
-	.cfi_adjust_cfa_offset	64
-	stq	$9, 0($sp)
-	stq	$10, 8($sp)
-	stq	$11, 16($sp)
-	stq	$12, 24($sp)
-	stq	$13, 32($sp)
-	stq	$14, 40($sp)
-	stq	$15, 48($sp)
-	.cfi_rel_offset	$9, 0
-	.cfi_rel_offset	$10, 8
-	.cfi_rel_offset	$11, 16
-	.cfi_rel_offset	$12, 24
-	.cfi_rel_offset	$13, 32
-	.cfi_rel_offset	$14, 40
-	.cfi_rel_offset	$15, 48
+	mov	$sp, $19
+	DO_SWITCH_STACK
 	lda	$8, 0x3fff
-	addq	$sp, 64, $19
 	bic	$sp, $8, $8
 	jsr	$26, do_entUnaUser
-	ldq	$9, 0($sp)
-	ldq	$10, 8($sp)
-	ldq	$11, 16($sp)
-	ldq	$12, 24($sp)
-	ldq	$13, 32($sp)
-	ldq	$14, 40($sp)
-	ldq	$15, 48($sp)
-	lda	$sp, 64($sp)
-	.cfi_restore	$9
-	.cfi_restore	$10
-	.cfi_restore	$11
-	.cfi_restore	$12
-	.cfi_restore	$13
-	.cfi_restore	$14
-	.cfi_restore	$15
-	.cfi_adjust_cfa_offset	-64
+	ldgp	$gp, 0($26)
+	UNDO_SWITCH_STACK
 	br	ret_from_exception
 CFI_END_OSF_FRAME entUna
 
-CFI_START_OSF_FRAME entDbg
-	SAVE_ALL
-	lda	$8, 0x3fff
-	lda	$26, ret_from_exception
-	bic	$sp, $8, $8
-	mov	$sp, $16
-	jsr	$31, do_entDbg
-CFI_END_OSF_FRAME entDbg
+EXCEPTION_ENTRY entDbg, do_entDbg, $16
 
 
 /*
@@ -499,10 +411,11 @@ restore_other:
 	call_pal PAL_rti
 
 ret_from_exception:
+	.cfi_restore_state
 	ldq	$0, SP_OFF($sp)
 	and	$0, 8, $0
-	beq	$0, ret_to_kernel
-	br	ret_to_user_from_exception
+	beq	$0, restore_other
+	br	restore_all
 
 ret_to_user_from_exception:
 
@@ -513,13 +426,6 @@ ret_to_user_from_exception:
 	UNDO_SWITCH_STACK
 	br	restore_all
 
-ret_to_kernel:
-	.cfi_restore_state
-	lda	$16, 7
-	call_pal PAL_swpipl
-	LOCKDEP_HARDIRQS_ON_RESTORE SP_OFF($sp)
-	br restore_other
-
 CFI_END_OSF_FRAME entSys
 
 /*
diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
index 5867a165504511a6e693bc6a200e7e9a69415103..c7dfa895c64832a4669a44d0bf92e99d0c5247ee 100644
--- a/arch/alpha/kernel/irq.c
+++ b/arch/alpha/kernel/irq.c
@@ -86,9 +86,7 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 }
 
 /*
- * handle_irq handles all normal device IRQ's (the special
- * SMP cross-CPU interrupts have their own specific
- * handlers).
+ * Device IRQs use this path. do_entInt() handles hardirq accounting.
  */
 
 #define MAX_ILLEGAL_IRQS 16
@@ -109,8 +107,6 @@ handle_irq(int irq)
 	static unsigned int illegal_count=0;
 	struct irq_desc *desc;
 
-	irq_enter();
-
 	desc = irq_to_desc(irq);
 	if (!desc || ((unsigned) irq > ACTUAL_NR_IRQS &&
 	    illegal_count < MAX_ILLEGAL_IRQS)) {
@@ -118,10 +114,8 @@ handle_irq(int irq)
 		illegal_count++;
 		printk(KERN_CRIT "device_interrupt: invalid interrupt %d\n",
 		       irq);
-		irq_exit();
 		return;
 	}
 
 	generic_handle_irq_desc(desc);
-	irq_exit();
 }
diff --git a/arch/alpha/kernel/irq_alpha.c b/arch/alpha/kernel/irq_alpha.c
index 8366d6de439d1cd26fd0cadb3fb26f93a7cee8a1..270d98116ffef4ea9c314222fe64c8e3b19628e5 100644
--- a/arch/alpha/kernel/irq_alpha.c
+++ b/arch/alpha/kernel/irq_alpha.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/irq-entry-common.h>
 #include <linux/sched.h>
 #include <linux/irq.h>
 #include <linux/kernel_stat.h>
@@ -41,38 +42,25 @@ EXPORT_SYMBOL(perf_irq);
  * The main interrupt entry point.
  */
 
-asmlinkage void
+asmlinkage noinstr void
 do_entInt(unsigned long type, unsigned long vector,
 	  unsigned long la_ptr, struct pt_regs *regs)
 {
+	irqentry_state_t state;
 	struct pt_regs *old_regs;
 
-	/*
-	 * Disable interrupts during IRQ handling.
-	 * Note that there is no matching local_irq_enable() due to
-	 * severe problems with RTI at IPL0 and some MILO PALcode
-	 * (namely LX164).
-	 *
-	 * PALcode has already raised PS.IPL to the level of the interrupt
-	 * being delivered.  For an IPL 7 entry - a machine check or a system
-	 * event - that is IPL_MAX, which is what arch_irqs_disabled() tests
-	 * for, so local_irq_disable() would decide interrupts were already
-	 * off and skip trace_hardirqs_off().  lockdep would then spend the
-	 * whole handler believing interrupts are enabled.  Drive the
-	 * annotation from lockdep's own state rather than the hardware IPL.
-	 */
+	/* PALcode raises IPL only to the level of the delivered interrupt. */
 	raw_local_irq_disable();
-	if (lockdep_hardirqs_enabled())
-		trace_hardirqs_off();
+	state = irqentry_enter(regs);
 
+	instrumentation_begin();
+	irq_enter_rcu();
 	old_regs = set_irq_regs(regs);
 
 	switch (type) {
 	case 0:
 #ifdef CONFIG_SMP
-		irq_enter();
 		handle_ipi(regs);
-		irq_exit();
 		break;
 #else
 		irq_err_count++;
@@ -80,23 +68,16 @@ do_entInt(unsigned long type, unsigned long vector,
 		break;
 #endif
 	case 1:
-		/* handle_irq() already does irq_enter()/irq_exit() */
 		handle_irq(RTC_IRQ);
 		break;
 	case 2:
-		irq_enter();
 		alpha_mv.machine_check(vector, la_ptr);
-		irq_exit();
 		break;
 	case 3:
-		irq_enter();
 		alpha_mv.device_interrupt(vector);
-		irq_exit();
 		break;
 	case 4:
-		irq_enter();
 		perf_irq(la_ptr, regs);
-		irq_exit();
 		break;
 	default:
 		pr_crit("Hardware intr %lu %lx? Huh?\n", type, vector);
@@ -105,11 +86,11 @@ do_entInt(unsigned long type, unsigned long vector,
 	}
 
 	set_irq_regs(old_regs);
+	irq_exit_rcu();
+	instrumentation_end();
 
-	/*
-	 * Intentionally no local_irq_enable(): Alpha historically avoids
-	 * enabling at IPL0 here due to PAL/RTI issues (LX164/MILO note).
-	 */
+	/* Do not lower IPL here before PAL_rti (LX164/MILO PALcode). */
+	irqentry_exit(regs, state);
 }
 
 void notrace lockdep_on_restore(unsigned long ps,
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 7861c9e767b720a5939553e9ff3218519ee8e4b5..2182496c535661f399a73400e308c0a7fc6d76f1 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -136,7 +136,7 @@ common_shutdown_1(void *generic_ptr)
 		/* If we've gotten here after SysRq-b, leave interrupt
 		   context before taking over the console. */
 		if (in_hardirq())
-			irq_exit();
+			irq_exit_rcu();
 		/* This has the effect of resetting the VGA video origin.  */
 		console_lock();
 		do_take_over_console(&dummy_con, 0, MAX_NR_CONSOLES-1, 1);
diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index c6dd0f2864ade320d59cf1531764640bc6713aa6..244fec20294b81e0c749a07321f917befb62b1a7 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -538,11 +538,12 @@ do_signal(struct pt_regs *regs, unsigned long r0, unsigned long r19)
 		ptrace_set_bpt(current);	/* re-set breakpoint */
 }
 
-asmlinkage void alpha_exit_to_user_mode(struct pt_regs *regs)
+asmlinkage noinstr void alpha_exit_to_user_mode(struct pt_regs *regs)
 {
+	instrumentation_begin();
 	local_irq_disable();
-	irqentry_exit_to_user_mode_prepare(regs);
-	exit_to_user_mode();
+	instrumentation_end();
+	irqentry_exit_to_user_mode(regs);
 }
 
 void arch_do_signal_or_restart(struct pt_regs *regs)
diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
index db6277b3bed03b6d7fd97f483eaa6873d351bbe0..a4209bca38063882a5bebe8dd3a285fd2b39e218 100644
--- a/arch/alpha/kernel/traps.c
+++ b/arch/alpha/kernel/traps.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/cpu.h>
+#include <linux/irq-entry-common.h>
 #include <linux/jiffies.h>
 #include <linux/mm.h>
 #include <linux/sched/signal.h>
@@ -174,9 +175,9 @@ long alpha_fp_emul_imprecise(struct pt_regs *regs, unsigned long writemask);
 long alpha_fp_emul (unsigned long pc, unsigned long summary);
 #endif
 
-asmlinkage void
-do_entArith(unsigned long summary, unsigned long write_mask,
-	    struct pt_regs *regs)
+static void
+handle_entArith(unsigned long summary, unsigned long write_mask,
+		struct pt_regs *regs)
 {
 	long si_code = FPE_FLTINV;
 
@@ -196,25 +197,29 @@ do_entArith(unsigned long summary, unsigned long write_mask,
 	send_sig_fault_trapno(SIGFPE, si_code, (void __user *) regs->pc, 0, current);
 }
 
-asmlinkage void
-do_entIF(unsigned long type, struct pt_regs *regs)
+asmlinkage noinstr void
+do_entArith(unsigned long summary, unsigned long write_mask,
+	    struct pt_regs *regs)
 {
-	int signo, code;
+	irqentry_state_t state;
 
-	if (type == 3) { /* FEN fault */
-		/* Irritating users can call PAL_clrfen to disable the
-		   FPU for the process.  The kernel will then trap in
-		   do_switch_stack and undo_switch_stack when we try
-		   to save and restore the FP registers.
+	raw_local_irq_disable();
+	state = irqentry_enter(regs);
+
+	instrumentation_begin();
+	local_irq_restore(regs->ps);
+	handle_entArith(summary, write_mask, regs);
+	local_irq_disable();
+	instrumentation_end();
+
+	irqentry_exit(regs, state);
+}
+
+static void
+handle_entIF(unsigned long type, struct pt_regs *regs)
+{
+	int signo, code;
 
-		   Given that GCC by default generates code that uses the
-		   FP registers, PAL_clrfen is not useful except for DoS
-		   attacks.  So turn the bleeding FPU back on and be done
-		   with it.  */
-		current_thread_info()->pcb.flags |= 1;
-		__reload_thread(&current_thread_info()->pcb);
-		return;
-	}
 	if (!user_mode(regs)) {
 		if (type == 1) {
 			const unsigned int *data
@@ -330,6 +335,34 @@ do_entIF(unsigned long type, struct pt_regs *regs)
 	send_sig_fault(SIGILL, ILL_ILLOPC, (void __user *)regs->pc, current);
 }
 
+asmlinkage noinstr void
+do_entIF(unsigned long type, struct pt_regs *regs)
+{
+	irqentry_state_t state;
+
+	raw_local_irq_disable();
+	if (type == 3) {
+		/*
+		 * Kernel FEN faults can interrupt entry or exit while saving user FP
+		 * state or restoring it. Re-enable the FPU without running entry hooks.
+		 */
+		current_thread_info()->pcb.flags |= 1;
+		__reload_thread(&current_thread_info()->pcb);
+		if (!user_mode(regs))
+			return;
+	}
+	state = irqentry_enter(regs);
+
+	instrumentation_begin();
+	local_irq_restore(regs->ps);
+	if (type != 3)
+		handle_entIF(type, regs);
+	local_irq_disable();
+	instrumentation_end();
+
+	irqentry_exit(regs, state);
+}
+
 /* There is an ifdef in the PALcode in MILO that enables a 
    "kernel debugging entry point" as an unprivileged call_pal.
 
@@ -337,14 +370,31 @@ do_entIF(unsigned long type, struct pt_regs *regs)
    several versions of MILO included in distributions have it enabled,
    and if we don't put something on the entry point we'll oops.  */
 
-asmlinkage void
-do_entDbg(struct pt_regs *regs)
+static void
+handle_entDbg(struct pt_regs *regs)
 {
 	die_if_kernel("Instruction fault", regs, 0, NULL);
 
 	force_sig_fault(SIGILL, ILL_ILLOPC, (void __user *)regs->pc);
 }
 
+asmlinkage noinstr void
+do_entDbg(struct pt_regs *regs)
+{
+	irqentry_state_t state;
+
+	raw_local_irq_disable();
+	state = irqentry_enter(regs);
+
+	instrumentation_begin();
+	local_irq_restore(regs->ps);
+	handle_entDbg(regs);
+	local_irq_disable();
+	instrumentation_end();
+
+	irqentry_exit(regs, state);
+}
+
 
 /*
  * entUna has a different register layout to be reasonably simple. It
@@ -649,7 +699,7 @@ s_reg_to_mem (unsigned long s_reg)
 static int unauser_reg_offsets[32] = {
 	R(r0), R(r1), R(r2), R(r3), R(r4), R(r5), R(r6), R(r7), R(r8),
 	/* r9 ... r15 are stored in front of regs.  */
-	-64, -56, -48, -40, -32, -24, -16,	/* padding at -8 */
+	-64, -56, -48, -40, -32, -24, -16,	/* r26 at -8 */
 	R(r16), R(r17), R(r18),
 	R(r19), R(r20), R(r21), R(r22), R(r23), R(r24), R(r25), R(r26),
 	R(r27), R(r28), R(gp),
@@ -658,9 +708,9 @@ static int unauser_reg_offsets[32] = {
 
 #undef R
 
-asmlinkage void
-do_entUnaUser(void __user * va, unsigned long opcode,
-	      unsigned long reg, struct pt_regs *regs)
+static void
+handle_entUnaUser(void __user *va, unsigned long opcode,
+		  unsigned long reg, struct pt_regs *regs)
 {
 	static DEFINE_RATELIMIT_STATE(ratelimit, 5 * HZ, 5);
 
@@ -913,6 +963,24 @@ give_sigbus:
 	return;
 }
 
+asmlinkage noinstr void
+do_entUnaUser(void __user *va, unsigned long opcode,
+	      unsigned long reg, struct pt_regs *regs)
+{
+	irqentry_state_t state;
+
+	raw_local_irq_disable();
+	state = irqentry_enter(regs);
+
+	instrumentation_begin();
+	local_irq_restore(regs->ps);
+	handle_entUnaUser(va, opcode, reg, regs);
+	local_irq_disable();
+	instrumentation_end();
+
+	irqentry_exit(regs, state);
+}
+
 void
 trap_init(void)
 {
diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index f09f69894cfd65d814ab1cf498c946043fb9e8a3..a46553b5e7d91f6209e2323e92d086989676262c 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -5,6 +5,7 @@
  *  Copyright (C) 1995  Linus Torvalds
  */
 
+#include <linux/irq-entry-common.h>
 #include <linux/sched/signal.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
@@ -130,9 +131,9 @@ static bool is_prefetch(struct pt_regs *regs)
 	       (1ul << (insn >> 26) & 0x30f00001400ul);
 }
 
-asmlinkage void
-do_page_fault(unsigned long address, unsigned long mmcsr,
-	      long cause, struct pt_regs *regs)
+static void
+handle_page_fault(unsigned long address, unsigned long mmcsr,
+		  long cause, struct pt_regs *regs)
 {
 	struct vm_area_struct * vma;
 	struct mm_struct *mm = current->mm;
@@ -309,3 +310,21 @@ retry:
 	}
 #endif
 }
+
+asmlinkage noinstr void
+do_page_fault(unsigned long address, unsigned long mmcsr,
+	      long cause, struct pt_regs *regs)
+{
+	irqentry_state_t state;
+
+	raw_local_irq_disable();
+	state = irqentry_enter(regs);
+
+	instrumentation_begin();
+	local_irq_restore(regs->ps);
+	handle_page_fault(address, mmcsr, cause, regs);
+	local_irq_disable();
+	instrumentation_end();
+
+	irqentry_exit(regs, state);
+}
-- 
2.43.0

