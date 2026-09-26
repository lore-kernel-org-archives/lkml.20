Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF946361965;
	Sat, 26 Sep 2026 05:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790402063; cv=none; b=rOWaWUmUtT2DaGwMG18i6pd/ef9MyQYWXJE6brmctk1/dYO0C+FwueU6iESClIYaakncg+1mfOsS2aNAfomwCQLDp6NLYi5sjmDOYPm5WgcchYntdG0sJcyOt7x5NNEAqDL5qup32Sl7dyIJ5XyszTETFNSp5FyZXOEXitYjoI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790402063; c=relaxed/simple;
	bh=+7W+bhyWMTvMaVSEHJPYSWxf2O2tjcuXbDG5/AtHPfc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Q4QAxZIAPLxFbFGyd7cOamT564hsRgByuU2MO0BumJjWAkRr4giBblxZLUMe+VC/Mz9OoW+86BuLjViGGl0vdsYcGkuiV5T8W4dY7FpbUWjTdcWnrHh4/0MYpmj3gfZKd3NsOu0z32ztIthrfIumeSbmqdeEUR938z0DD89YLIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yx+5m4Uq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=417MKIVV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yx+5m4Uq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="417MKIVV"
Date: Sat, 26 Sep 2026 05:54:17 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790402059;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EzYyGtk176OXZUNk1iDFHKVg/azsk2obUf0AhywmSMs=;
	b=yx+5m4UqtpDNKhUxV+/Rh70hLYnm4F444Kt7hHgca5PDOPUNbnEuUBViF46Nrta4sJ7uWC
	CmI/wLOuCY4QQ4cOEQm10wFgIz0t46Ev5+PZ0s4OZ4y3A8YY0k7jrJHkSvn3qECFH5Nhpm
	vb//k179qGlwFJ9rg5OH52sjiq55x964+3PTxTAN7fi0OP47uwGSeinqYk8pBe8t1sNsAZ
	F3QKgUqHrI9p+YxltsugJ0MG4OwZnSR0Bzb6DmEjXJ7+8TZQmP8HaThXfjMLhPj++qG7yO
	t7ZbKh6oxyq23enEyaFyu71bDal9OUaeVKgjqxQ5LUginz2JOgWYrt33Waq0Pw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790402059;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EzYyGtk176OXZUNk1iDFHKVg/azsk2obUf0AhywmSMs=;
	b=417MKIVVKuAFUPcqaYuq8kNxFBl7NT2ZOUvUy/aF/mYrWsMzZh8Yuk1Bak0m190LlMar31
	wlMzorQzbSCH7ZCg==
From: "tip-bot2 for Eric Biggers" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/fpu] x86/fpu: Remove unnecessary checks for X86_FEATURE_FPU
Cc: Eric Biggers <ebiggers@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260924033405.57613-1-ebiggers@kernel.org>
References: <20260924033405.57613-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179040205775.3910103.9692398889354910887.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     67639ee98521c1592190c5c67047067a9c3a3fd5
Gitweb:        https://git.kernel.org/tip/67639ee98521c1592190c5c67047067a9c3=
a3fd5
Author:        Eric Biggers <ebiggers@kernel.org>
AuthorDate:    Fri, 25 Sep 2026 21:30:07 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 25 Sep 2026 21:35:37 -07:00

x86/fpu: Remove unnecessary checks for X86_FEATURE_FPU

Since

  ab05214025ee ("x86/fpu: Remove MATH_EMULATION and related glue code"),

X86_FEATURE_FPU is mandatory.  If it's absent, the kernel halts execution in
fpu__init_system_early_generic().

Therefore, remove unnecessary checks for X86_FEATURE_FPU that occur later in
x86/fpu code.

This makes struct swregs_state and the extern declarations of fpregs_soft_get
and fpregs_soft_set all unused.  So remove those too.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20260924033405.57613-1-ebiggers@kernel.org
---
 arch/x86/include/asm/fpu/regset.h |  6 ++----
 arch/x86/include/asm/fpu/sched.h  |  1 -
 arch/x86/include/asm/fpu/types.h  | 25 -------------------------
 arch/x86/kernel/fpu/bugs.c        |  4 ----
 arch/x86/kernel/fpu/core.c        | 13 +------------
 arch/x86/kernel/fpu/init.c        |  6 +-----
 arch/x86/kernel/fpu/regset.c      |  6 ------
 arch/x86/kernel/fpu/signal.c      | 15 ---------------
 arch/x86/kernel/fpu/xstate.c      |  5 -----
 9 files changed, 4 insertions(+), 77 deletions(-)

diff --git a/arch/x86/include/asm/fpu/regset.h b/arch/x86/include/asm/fpu/reg=
set.h
index 697b77e..4337209 100644
--- a/arch/x86/include/asm/fpu/regset.h
+++ b/arch/x86/include/asm/fpu/regset.h
@@ -9,10 +9,8 @@
=20
 extern user_regset_active_fn regset_fpregs_active, regset_xregset_fpregs_act=
ive,
 				ssp_active;
-extern user_regset_get2_fn fpregs_get, xfpregs_get, fpregs_soft_get,
-				 xstateregs_get, ssp_get;
-extern user_regset_set_fn fpregs_set, xfpregs_set, fpregs_soft_set,
-				 xstateregs_set, ssp_set;
+extern user_regset_get2_fn fpregs_get, xfpregs_get, xstateregs_get, ssp_get;
+extern user_regset_set_fn fpregs_set, xfpregs_set, xstateregs_set, ssp_set;
=20
 /*
  * xstateregs_active =3D=3D regset_fpregs_active. Please refer to the comment
diff --git a/arch/x86/include/asm/fpu/sched.h b/arch/x86/include/asm/fpu/sche=
d.h
index 89004f4..48d7437 100644
--- a/arch/x86/include/asm/fpu/sched.h
+++ b/arch/x86/include/asm/fpu/sched.h
@@ -32,7 +32,6 @@ extern void fpu_flush_thread(void);
 static inline void switch_fpu(struct task_struct *old, int cpu)
 {
 	if (!test_tsk_thread_flag(old, TIF_NEED_FPU_LOAD) &&
-	    cpu_feature_enabled(X86_FEATURE_FPU) &&
 	    !(old->flags & (PF_KTHREAD | PF_USER_WORKER))) {
 		struct fpu *old_fpu =3D x86_task_fpu(old);
=20
diff --git a/arch/x86/include/asm/fpu/types.h b/arch/x86/include/asm/fpu/type=
s.h
index 93e99d2..ea02832 100644
--- a/arch/x86/include/asm/fpu/types.h
+++ b/arch/x86/include/asm/fpu/types.h
@@ -75,30 +75,6 @@ struct fxregs_state {
 #define MXCSR_AND_FLAGS_SIZE sizeof(u64)
=20
 /*
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
-	/* 8*10 bytes for each FP-reg =3D 80 bytes: */
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
-/*
  * List of XSAVE features Linux knows about:
  */
 enum xfeature {
@@ -369,7 +345,6 @@ struct xregs_state {
 union fpregs_state {
 	struct fregs_state		fsave;
 	struct fxregs_state		fxsave;
-	struct swregs_state		soft;
 	struct xregs_state		xsave;
 	u8 __padding[PAGE_SIZE];
 };
diff --git a/arch/x86/kernel/fpu/bugs.c b/arch/x86/kernel/fpu/bugs.c
index edbafc5..4b84cd0 100644
--- a/arch/x86/kernel/fpu/bugs.c
+++ b/arch/x86/kernel/fpu/bugs.c
@@ -29,10 +29,6 @@ void __init fpu__init_check_bugs(void)
 {
 	s32 fdiv_bug;
=20
-	/* kernel_fpu_begin/end() relies on patched alternative instructions. */
-	if (!boot_cpu_has(X86_FEATURE_FPU))
-		return;
-
 	kernel_fpu_begin();
=20
 	/*
diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index d1aeecd..67d4db3 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -491,7 +491,7 @@ void kernel_fpu_begin_mask(unsigned int kfpu_mask)
 	if (likely(kfpu_mask & KFPU_MXCSR) && boot_cpu_has(X86_FEATURE_XMM))
 		ldmxcsr(MXCSR_DEFAULT);
=20
-	if (unlikely(kfpu_mask & KFPU_387) && boot_cpu_has(X86_FEATURE_FPU))
+	if (unlikely(kfpu_mask & KFPU_387))
 		asm volatile ("fninit");
 }
 EXPORT_SYMBOL_GPL(kernel_fpu_begin_mask);
@@ -672,9 +672,6 @@ int fpu_clone(struct task_struct *dst, u64 clone_flags, b=
ool minimal,
=20
 	fpstate_reset(dst_fpu);
=20
-	if (!cpu_feature_enabled(X86_FEATURE_FPU))
-		return 0;
-
 	/*
 	 * Enforce reload for user space tasks and prevent kernel threads
 	 * from trying to save the FPU registers on context switch.
@@ -833,11 +830,6 @@ void fpu__clear_user_states(struct fpu *fpu)
 	WARN_ON_FPU(fpu !=3D x86_task_fpu(current));
=20
 	fpregs_lock();
-	if (!cpu_feature_enabled(X86_FEATURE_FPU)) {
-		fpu_reset_fpstate_regs();
-		fpregs_unlock();
-		return;
-	}
=20
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
index 0d33c21..1a92ec4 100644
--- a/arch/x86/kernel/fpu/init.c
+++ b/arch/x86/kernel/fpu/init.c
@@ -31,8 +31,6 @@ static void fpu__init_cpu_generic(void)
=20
 	cr0 =3D read_cr0();
 	cr0 &=3D ~(X86_CR0_TS|X86_CR0_EM); /* clear TS and EM */
-	if (!boot_cpu_has(X86_FEATURE_FPU))
-		cr0 |=3D X86_CR0_EM;
 	write_cr0(cr0);
=20
 	/* Flush out any pending x87 state: */
@@ -184,9 +182,7 @@ static void __init fpu__init_system_xstate_size_legacy(vo=
id)
 	 * Note that the size configuration might be overwritten later
 	 * during fpu__init_system_xstate().
 	 */
-	if (!cpu_feature_enabled(X86_FEATURE_FPU)) {
-		size =3D sizeof(struct swregs_state);
-	} else if (cpu_feature_enabled(X86_FEATURE_FXSR)) {
+	if (cpu_feature_enabled(X86_FEATURE_FXSR)) {
 		size =3D sizeof(struct fxregs_state);
 		fpu_user_cfg.legacy_features =3D XFEATURE_MASK_FPSSE;
 	} else {
diff --git a/arch/x86/kernel/fpu/regset.c b/arch/x86/kernel/fpu/regset.c
index 0986c22..f96affd 100644
--- a/arch/x86/kernel/fpu/regset.c
+++ b/arch/x86/kernel/fpu/regset.c
@@ -407,9 +407,6 @@ int fpregs_get(struct task_struct *target, const struct u=
ser_regset *regset,
=20
 	sync_fpstate(fpu);
=20
-	if (!cpu_feature_enabled(X86_FEATURE_FPU))
-		return fpregs_soft_get(target, regset, to);
-
 	if (!cpu_feature_enabled(X86_FEATURE_FXSR)) {
 		return membuf_write(&to, &fpu->fpstate->regs.fsave,
 				    sizeof(struct fregs_state));
@@ -441,9 +438,6 @@ int fpregs_set(struct task_struct *target, const struct u=
ser_regset *regset,
 	if (pos !=3D 0 || count !=3D sizeof(struct user_i387_ia32_struct))
 		return -EINVAL;
=20
-	if (!cpu_feature_enabled(X86_FEATURE_FPU))
-		return fpregs_soft_set(target, regset, pos, count, kbuf, ubuf);
-
 	ret =3D user_regset_copyin(&pos, &count, &kbuf, &ubuf, &env, 0, -1);
 	if (ret)
 		return ret;
diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index 594ba36..1f721ac 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -212,14 +212,6 @@ bool copy_fpstate_to_sigframe(void __user *buf, void __u=
ser *buf_fx, int size, u
 	ia32_fxstate &=3D (IS_ENABLED(CONFIG_X86_32) ||
 			 IS_ENABLED(CONFIG_IA32_EMULATION));
=20
-	if (!cpu_feature_enabled(X86_FEATURE_FPU)) {
-		struct user_i387_ia32_struct fp;
-
-		fpregs_soft_get(current, NULL, (struct membuf){.p =3D &fp,
-						.left =3D sizeof(fp)});
-		return !copy_to_user(buf, &fp, sizeof(fp));
-	}
-
 	if (!access_ok(buf, size))
 		return false;
=20
@@ -499,13 +491,6 @@ bool fpu__restore_sig(void __user *buf, int ia32_frame)
 	if (!access_ok(buf, size))
 		goto out;
=20
-	if (!IS_ENABLED(CONFIG_X86_64) && !cpu_feature_enabled(X86_FEATURE_FPU)) {
-		success =3D !fpregs_soft_set(current, NULL, 0,
-					   sizeof(struct user_i387_ia32_struct),
-					   NULL, buf);
-		goto out;
-	}
-
 	if (use_xsave()) {
 		struct _fpx_sw_bytes fx_sw_user;
=20
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index a2b6ede..561eec7 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -811,11 +811,6 @@ void __init fpu__init_system_xstate(unsigned int legacy_=
size)
 	int err;
 	int i;
=20
-	if (!boot_cpu_has(X86_FEATURE_FPU)) {
-		pr_info("x86/fpu: No FPU detected\n");
-		return;
-	}
-
 	if (!boot_cpu_has(X86_FEATURE_XSAVE)) {
 		pr_info("x86/fpu: x87 FPU will use %s\n",
 			boot_cpu_has(X86_FEATURE_FXSR) ? "FXSAVE" : "FSAVE");
