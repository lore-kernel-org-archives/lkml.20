Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B51C4F6471
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617333; cv=none; b=HHYih9L8LLsjHIU1Z1god20c2xKQPYd3jcbcm79nMIu9di4xAD27mIYH/m9wgjf+2ealckqP1/qlD8+IVoZhpnKWl/LrY476Wj9GwKarAUMaJNYj9iQpo/3EhXTqRoyHv5KCBvTYWiA5vDdP7RUH971OvagIFu11cGYGhZMbUuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617333; c=relaxed/simple;
	bh=z3qI62qf4mT1gEi8u87wgjjXgOWjBMNHyAjBz41QMeQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tMdddhZw7Wp+YQAWoxkSbFZwpud8vKUxbwoXui4DdOo4ETclIK3QxTIX3HRbbsiSz+P2VMIjd58tLXE73084gyUdm9Yf4G8I0M+1nsQgNBziBOxE8skGpdq2HXGyXc3fX3hUUPCNGd0uC7zUgP1xo+QHZwrVIGgAFZllTbCG97o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QaeWoEEt; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QaeWoEEt"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e6b5c5f44so50955955e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617327; x=1791222127; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvWsjS4kJdvoXcVGD6geTFWpf+d6azd0mBr60JzC1QM=;
        b=QaeWoEEteMcnPyDKE1CvBElqp8ump6EO5ObA9YQ1xYHSoiawrxPCMTY40Ik98EqRIp
         PK0i3HCeGRWCzEoitDjN0PZTc+0cMvR8fO8pIkHwpWdDlHGFXsGPZgO0M3d0zqmfD2B+
         jqr1sNOO8HRROPzPhmuYRhoUQxOXsfNY3MFXMWdl9bJ2rhkBGcOJyPf1sL7ACYn70rvI
         1HkQUOD+doKHr0iGxVZwe7/27xbimMdGkyPo41MlgVfGNGcOTKRuuAnjpzcAiBjpLdqX
         7kOme88ugQ0x5VvcH9xyNnQ3gEbD7FM1oEoni2lnhpQnX7S4KFGM1T4OKe+Id5WrwVow
         QGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617327; x=1791222127;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvWsjS4kJdvoXcVGD6geTFWpf+d6azd0mBr60JzC1QM=;
        b=MysXrJtc/ivE+TsF4URn49OPS+giYNrLNSOTHVqrxO0WtPugPS8Gd6iCcP0X6S/ZxT
         yMcUDsU2G0rVCPYgFc3BGXnrcGaxQxLFt5xjciB71nkQEmnaqUO76tqrF96T5oqDcygG
         gfuPNmGqsjDjNRam9p1pAg4c/ruIircWVgxTMPEXUzIeLltASn7lByrscSNN23RJNhFu
         uglu3tbNxQ6M93BvCJ0xjWgOYQAssejd44Az5gEqYGc6Djmj5/XFnS/jaaomBm2m9BV3
         HuIQI363cI7AXGcvRGVx4cBgEVxgmrEuoM0UzIs20ROEnJl+bAv1AcH90haHxWm4ymy8
         0qXw==
X-Forwarded-Encrypted: i=1; AKwUvByNb3s9v25K5qLz+Wy+jB4w5u77kuA/KSiUO3qy32VLBt07By7yrJIDqAbqGtzJh3q/R6pzL2lr/G655Cg=@vger.kernel.org
X-Gm-Message-State: AFuF++k9Nw1x5We3s2+Ls/9OGv5DhIke4HuP5WE5fm8xEBceTsVm4geG
	WqJHQEAeDFht1KKW2iUbp3cWGXrDN8N/1pIp6x2Sz3sefZ0O31cXOPf5nNBxYP2vbuPJz9t2UZf
	cjzUs5Y6/DTB6Uw==
X-Received: from wmpr40.prod.google.com ([2002:a05:600c:3228:b0:49f:fde6:649f])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6287:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49fe7babaadmr223084505e9.20.1790617327143;
 Mon, 28 Sep 2026 10:42:07 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:22 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-16-smostafa@google.com>
Subject: [RFC PATCH 15/15] arm64: mm: Set stack size from the kernel command line
From: Mostafa Saleh <smostafa@google.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	akpm@linux-foundation.org, urezki@gmail.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, kees@kernel.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, gustavoars@kernel.org, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

Select CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE for arm64 and override
arch_vm_stack_pages() to a value set from the command line, this
value have the following properties:
- Aligned to page size (doesn't need to be a power of 2), so it can
  be 12kB for example
- Min value is chosen to be 8kB
- Max value will be the default stack size on arm64 which is used to
  allocate the VA range for the kernel stack.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../admin-guide/kernel-parameters.txt         |  7 ++++++
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/include/asm/memory.h               | 12 ++++++++++
 arch/arm64/kernel/entry.S                     | 10 +++++---
 arch/arm64/kernel/setup.c                     | 24 +++++++++++++++++++
 5 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 33cd30996e47..e6ef22f01e01 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2920,6 +2920,13 @@ Kernel parameters
 
 	keepinitrd	[HW,ARM] See retain_initrd.
 
+	kernel_stack_pages=
+			[ARM64,EARLY]
+			Format: <integer>
+			Number of pages mapped for each task kernel stack.
+			The virtual area stays THREAD_SIZE and only its top
+			pages are mapped.
+
 	kernelcore=	[KNL,X86,PPC,EARLY]
 			Format: nn[KMGTPE] | nn% | "mirror"
 			This parameter specifies the amount of memory usable by
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 020fcaf36b1b..5e09ae904e34 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -58,6 +58,7 @@ config ARM64
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_ZONE_DMA_SET if EXPERT
+	select ARCH_HAS_VARIABLE_STACK_SIZE
 	select ARCH_HAVE_ELF_PROT
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_HAVE_TRACE_MMIO_ACCESS
diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index 4545d9b39bd5..1d300b16032d 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -113,6 +113,13 @@
 #define DIRECT_MAP_PHYSMEM_END	__pa(PAGE_END - 1)
 
 #define MIN_THREAD_SHIFT	(14 + KASAN_THREAD_SHIFT)
+#define MIN_KERNEL_STACK_SHIFT	(13 + KASAN_THREAD_SHIFT)
+
+#if (MIN_KERNEL_STACK_SHIFT < PAGE_SHIFT)
+#define MIN_KERNEL_STACK_SIZE	PAGE_SIZE
+#else
+#define MIN_KERNEL_STACK_SIZE	(UL(1) << MIN_KERNEL_STACK_SHIFT)
+#endif
 
 /*
  * VMAP'd stacks are allocated at page granularity, so we must ensure that such
@@ -130,6 +137,11 @@
 
 #define THREAD_SIZE		(UL(1) << THREAD_SHIFT)
 
+#ifndef __ASSEMBLY__
+extern unsigned long kernel_stack_pages;
+#define arch_vm_stack_pages()	(kernel_stack_pages)
+#endif
+
 #define THREAD_ALIGN		THREAD_SIZE
 
 #define IRQ_STACK_SIZE		THREAD_SIZE
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index ea733b673970..39e68aace0a6 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -76,9 +76,13 @@
 	msr	spsel, #0
 	mov	x1, sp
 	msr	spsel, #1
-	sub	x1, x1, x0
-	cmp	x1, #THREAD_SIZE
-	b.lo	.Lstack_ok\@
+
+	add	x0, x0, #THREAD_SIZE
+	sub	x1, x0, x1
+	adr_l	x0, kernel_stack_pages
+	ldr	x0, [x0]
+	cmp	x1, x0, lsl #PAGE_SHIFT
+	b.ls	.Lstack_ok\@
 
 	/* Check whether we are on the IRQ, SDEI or EFI stacks. */
 	stp	x2, x30, [sp, #-16]!
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 29c6100f0c50..34559048dcca 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -278,6 +278,30 @@ u64 cpu_logical_map(unsigned int cpu)
 	return __cpu_logical_map[cpu];
 }
 
+unsigned long kernel_stack_pages __ro_after_init = THREAD_SIZE / PAGE_SIZE;
+
+static int __init setup_kernel_stack_pages(char *str)
+{
+	unsigned long min = MIN_KERNEL_STACK_SIZE / PAGE_SIZE;
+	unsigned long max = THREAD_SIZE / PAGE_SIZE;
+	unsigned long val;
+
+	if (!str)
+		return -EINVAL;
+
+	if (kstrtoul(str, 10, &val) || val < min || val > max) {
+		pr_err("Invalid kernel_stack_pages=%s, should be between %lu and %lu\n",
+		       str, min, max);
+		return 0;
+	}
+
+	kernel_stack_pages = val;
+	pr_info("Kernel stack size set to %lu KiB\n", (val * PAGE_SIZE) / SZ_1K);
+
+	return 0;
+}
+early_param("kernel_stack_pages", setup_kernel_stack_pages);
+
 void __init __no_sanitize_address setup_arch(char **cmdline_p)
 {
 	setup_initial_init_mm(_text, _etext, _edata, _end);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

