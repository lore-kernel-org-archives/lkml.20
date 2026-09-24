Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5DF3093DB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790220894; cv=none; b=oMGz2QfgvrIv1M5ySMhYD7sQH+/1VXUrC8HExnLsl8UDkGfUsDY2OiRVClw9zeZQCALZj9NKNUiNrbH3bZTdyqVPpHISnrXvPhycrpNFDuPweGbMFlw12BKs17c3OaTIBhuaZzFxyE4ekaAu4w8sdau3aQvC5smyLVPhkxOoQKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790220894; c=relaxed/simple;
	bh=qXuwc2NCdt/oP/F58y1XPpZykFAEFtYozFa+H+16HQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lWMUYuDUhNeaLWnkAveLrdy3P51Kusvq1QDREL8Jm8fruSE4SYqAWz+R/vuV4nTOu8imBbZZhsUAxSQexQmP93Mh+nkqA3ZopfJGWKcjGv6RKZMrbRX9sWhz2JuGSUAl2aPUJR3HJH9d8ILFmrNkXUIqjLRG0cZrGJgpwybZXyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z41XUcuh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z41XUcuh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24311F000FF;
	Thu, 24 Sep 2026 03:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790220893;
	bh=YI19gfVsQEb9ICIUW63rrve6UgrBHxTKbs0UVY7pOhw=;
	h=From:To:Cc:Subject:Date;
	b=Z41XUcuhrkXxMt6j33GWuMcG1X6XuZHFBTCcPQOji2KVoItBN2oi4rB3ZoO8+tdle
	 pwOWqwLOWg2y6dv2GCTxWr9ulJTZ9TdO9BzIJ/d8slw1/9YtvdhJrlKbx4tyeJBCyQ
	 lwH1wy232v2dF2wXh+UZCc4yi2VX8AXdWjL/I0mND2SLhYhXJz2L4pHVC6S03boW6C
	 qhs3auqDdgQUSN4M2M9ZA/pum0K+q4V+PIbZTXsNltJuXa9/J7uImNWdZAtfklrKpi
	 fSf7gB38Txf3zEkreRajNr5aY3zZ6J+XfhVTZPZTVME7sIUMLPj6piJXV2zhxv3MQi
	 ZDOaTIXb8Jo+A==
From: Eric Biggers <ebiggers@kernel.org>
To: x86@kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2] x86/fpu: Remove unnecessary checks for X86_FEATURE_FPU
Date: Wed, 23 Sep 2026 20:34:05 -0700
Message-ID: <20260924033405.57613-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit ab05214025ee ("x86/fpu: Remove MATH_EMULATION and related
glue code"), X86_FEATURE_FPU is mandatory.  If it's absent, the kernel
halts execution in fpu__init_system_early_generic().

Therefore, remove unnecessary checks for X86_FEATURE_FPU that occur
later in x86/fpu code.

This makes struct swregs_state and the extern declarations of
fpregs_soft_get and fpregs_soft_set all unused.  So remove those too.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---

v2: Remove more unnecessary code.

 arch/x86/include/asm/fpu/regset.h |  6 ++----
 arch/x86/include/asm/fpu/sched.h  |  1 -
 arch/x86/include/asm/fpu/types.h  | 25 -------------------------
 arch/x86/kernel/fpu/bugs.c        |  4 ----
 arch/x86/kernel/fpu/core.c        | 13 +------------
 arch/x86/kernel/fpu/init.c        |  6 +-----
 arch/x86/kernel/fpu/regset.c      |  6 ------
 arch/x86/kernel/fpu/signal.c      | 16 +---------------
 arch/x86/kernel/fpu/xstate.c      |  5 -----
 9 files changed, 5 insertions(+), 77 deletions(-)

diff --git a/arch/x86/include/asm/fpu/regset.h b/arch/x86/include/asm/fpu/regset.h
index 697b77e96025a..433720990f5de 100644
--- a/arch/x86/include/asm/fpu/regset.h
+++ b/arch/x86/include/asm/fpu/regset.h
@@ -9,10 +9,8 @@
 
 extern user_regset_active_fn regset_fpregs_active, regset_xregset_fpregs_active,
 				ssp_active;
-extern user_regset_get2_fn fpregs_get, xfpregs_get, fpregs_soft_get,
-				 xstateregs_get, ssp_get;
-extern user_regset_set_fn fpregs_set, xfpregs_set, fpregs_soft_set,
-				 xstateregs_set, ssp_set;
+extern user_regset_get2_fn fpregs_get, xfpregs_get, xstateregs_get, ssp_get;
+extern user_regset_set_fn fpregs_set, xfpregs_set, xstateregs_set, ssp_set;
 
 /*
  * xstateregs_active == regset_fpregs_active. Please refer to the comment
diff --git a/arch/x86/include/asm/fpu/sched.h b/arch/x86/include/asm/fpu/sched.h
index 89004f4ca208d..48d74371a75a9 100644
--- a/arch/x86/include/asm/fpu/sched.h
+++ b/arch/x86/include/asm/fpu/sched.h
@@ -32,7 +32,6 @@ extern void fpu_flush_thread(void);
 static inline void switch_fpu(struct task_struct *old, int cpu)
 {
 	if (!test_tsk_thread_flag(old, TIF_NEED_FPU_LOAD) &&
-	    cpu_feature_enabled(X86_FEATURE_FPU) &&
 	    !(old->flags & (PF_KTHREAD | PF_USER_WORKER))) {
 		struct fpu *old_fpu = x86_task_fpu(old);
 
diff --git a/arch/x86/include/asm/fpu/types.h b/arch/x86/include/asm/fpu/types.h
index 93e99d2583d6f..ea02832f7043c 100644
--- a/arch/x86/include/asm/fpu/types.h
+++ b/arch/x86/include/asm/fpu/types.h
@@ -74,30 +74,6 @@ struct fxregs_state {
 /* Copy both mxcsr & mxcsr_flags with a single u64 memcpy: */
 #define MXCSR_AND_FLAGS_SIZE sizeof(u64)
 
-/*
- * Software based FPU emulation state. This is arbitrary really,
- * it matches the x87 format to make it easier to understand:
- */
-struct swregs_state {
-	u32			cwd;
-	u32			swd;
-	u32			twd;
-	u32			fip;
-	u32			fcs;
-	u32			foo;
-	u32			fos;
-	/* 8*10 bytes for each FP-reg = 80 bytes: */
-	u32			st_space[20];
-	u8			ftop;
-	u8			changed;
-	u8			lookahead;
-	u8			no_update;
-	u8			rm;
-	u8			alimit;
-	struct math_emu_info	*info;
-	u32			entry_eip;
-};
-
 /*
  * List of XSAVE features Linux knows about:
  */
@@ -369,7 +345,6 @@ struct xregs_state {
 union fpregs_state {
 	struct fregs_state		fsave;
 	struct fxregs_state		fxsave;
-	struct swregs_state		soft;
 	struct xregs_state		xsave;
 	u8 __padding[PAGE_SIZE];
 };
diff --git a/arch/x86/kernel/fpu/bugs.c b/arch/x86/kernel/fpu/bugs.c
index edbafc5940e33..4b84cd0a9d24f 100644
--- a/arch/x86/kernel/fpu/bugs.c
+++ b/arch/x86/kernel/fpu/bugs.c
@@ -29,10 +29,6 @@ void __init fpu__init_check_bugs(void)
 {
 	s32 fdiv_bug;
 
-	/* kernel_fpu_begin/end() relies on patched alternative instructions. */
-	if (!boot_cpu_has(X86_FEATURE_FPU))
-		return;
-
 	kernel_fpu_begin();
 
 	/*
diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index d1aeecd57f5ed..67d4db38c4cbb 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -491,7 +491,7 @@ void kernel_fpu_begin_mask(unsigned int kfpu_mask)
 	if (likely(kfpu_mask & KFPU_MXCSR) && boot_cpu_has(X86_FEATURE_XMM))
 		ldmxcsr(MXCSR_DEFAULT);
 
-	if (unlikely(kfpu_mask & KFPU_387) && boot_cpu_has(X86_FEATURE_FPU))
+	if (unlikely(kfpu_mask & KFPU_387))
 		asm volatile ("fninit");
 }
 EXPORT_SYMBOL_GPL(kernel_fpu_begin_mask);
@@ -672,9 +672,6 @@ int fpu_clone(struct task_struct *dst, u64 clone_flags, bool minimal,
 
 	fpstate_reset(dst_fpu);
 
-	if (!cpu_feature_enabled(X86_FEATURE_FPU))
-		return 0;
-
 	/*
 	 * Enforce reload for user space tasks and prevent kernel threads
 	 * from trying to save the FPU registers on context switch.
@@ -833,11 +830,6 @@ void fpu__clear_user_states(struct fpu *fpu)
 	WARN_ON_FPU(fpu != x86_task_fpu(current));
 
 	fpregs_lock();
-	if (!cpu_feature_enabled(X86_FEATURE_FPU)) {
-		fpu_reset_fpstate_regs();
-		fpregs_unlock();
-		return;
-	}
 
 	/*
 	 * Ensure that current's supervisor states are loaded into their
@@ -874,9 +866,6 @@ void fpu_flush_thread(void)
  */
 void switch_fpu_return(void)
 {
-	if (!cpu_feature_enabled(X86_FEATURE_FPU))
-		return;
-
 	fpregs_restore_userregs();
 }
 EXPORT_SYMBOL_FOR_KVM(switch_fpu_return);
diff --git a/arch/x86/kernel/fpu/init.c b/arch/x86/kernel/fpu/init.c
index 0d33c217b71c1..1a92ec433f9d3 100644
--- a/arch/x86/kernel/fpu/init.c
+++ b/arch/x86/kernel/fpu/init.c
@@ -31,8 +31,6 @@ static void fpu__init_cpu_generic(void)
 
 	cr0 = read_cr0();
 	cr0 &= ~(X86_CR0_TS|X86_CR0_EM); /* clear TS and EM */
-	if (!boot_cpu_has(X86_FEATURE_FPU))
-		cr0 |= X86_CR0_EM;
 	write_cr0(cr0);
 
 	/* Flush out any pending x87 state: */
@@ -184,9 +182,7 @@ static void __init fpu__init_system_xstate_size_legacy(void)
 	 * Note that the size configuration might be overwritten later
 	 * during fpu__init_system_xstate().
 	 */
-	if (!cpu_feature_enabled(X86_FEATURE_FPU)) {
-		size = sizeof(struct swregs_state);
-	} else if (cpu_feature_enabled(X86_FEATURE_FXSR)) {
+	if (cpu_feature_enabled(X86_FEATURE_FXSR)) {
 		size = sizeof(struct fxregs_state);
 		fpu_user_cfg.legacy_features = XFEATURE_MASK_FPSSE;
 	} else {
diff --git a/arch/x86/kernel/fpu/regset.c b/arch/x86/kernel/fpu/regset.c
index 0986c2200adc5..f96affd834a14 100644
--- a/arch/x86/kernel/fpu/regset.c
+++ b/arch/x86/kernel/fpu/regset.c
@@ -407,9 +407,6 @@ int fpregs_get(struct task_struct *target, const struct user_regset *regset,
 
 	sync_fpstate(fpu);
 
-	if (!cpu_feature_enabled(X86_FEATURE_FPU))
-		return fpregs_soft_get(target, regset, to);
-
 	if (!cpu_feature_enabled(X86_FEATURE_FXSR)) {
 		return membuf_write(&to, &fpu->fpstate->regs.fsave,
 				    sizeof(struct fregs_state));
@@ -441,9 +438,6 @@ int fpregs_set(struct task_struct *target, const struct user_regset *regset,
 	if (pos != 0 || count != sizeof(struct user_i387_ia32_struct))
 		return -EINVAL;
 
-	if (!cpu_feature_enabled(X86_FEATURE_FPU))
-		return fpregs_soft_set(target, regset, pos, count, kbuf, ubuf);
-
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &env, 0, -1);
 	if (ret)
 		return ret;
diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index 33e1284bf3e43..13fbc455bb793 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -187,14 +187,6 @@ bool copy_fpstate_to_sigframe(void __user *buf, void __user *buf_fx, int size, u
 	ia32_fxstate &= (IS_ENABLED(CONFIG_X86_32) ||
 			 IS_ENABLED(CONFIG_IA32_EMULATION));
 
-	if (!cpu_feature_enabled(X86_FEATURE_FPU)) {
-		struct user_i387_ia32_struct fp;
-
-		fpregs_soft_get(current, NULL, (struct membuf){.p = &fp,
-						.left = sizeof(fp)});
-		return !copy_to_user(buf, &fp, sizeof(fp));
-	}
-
 	if (!access_ok(buf, size))
 		return false;
 
@@ -477,13 +469,7 @@ bool fpu__restore_sig(void __user *buf, int ia32_frame)
 	if (!access_ok(buf, size))
 		goto out;
 
-	if (!IS_ENABLED(CONFIG_X86_64) && !cpu_feature_enabled(X86_FEATURE_FPU)) {
-		success = !fpregs_soft_set(current, NULL, 0,
-					   sizeof(struct user_i387_ia32_struct),
-					   NULL, buf);
-	} else {
-		success = __fpu_restore_sig(buf, buf_fx, ia32_fxstate);
-	}
+	success = __fpu_restore_sig(buf, buf_fx, ia32_fxstate);
 
 out:
 	if (unlikely(!success))
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 97cfd4fb6cc00..c2ff90cfc4392 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -810,11 +810,6 @@ void __init fpu__init_system_xstate(unsigned int legacy_size)
 	int err;
 	int i;
 
-	if (!boot_cpu_has(X86_FEATURE_FPU)) {
-		pr_info("x86/fpu: No FPU detected\n");
-		return;
-	}
-
 	if (!boot_cpu_has(X86_FEATURE_XSAVE)) {
 		pr_info("x86/fpu: x87 FPU will use %s\n",
 			boot_cpu_has(X86_FEATURE_FXSR) ? "FXSAVE" : "FSAVE");

base-commit: c0a44d1745d3f209e4840b78ab75274fb74f01a0
-- 
2.55.0

