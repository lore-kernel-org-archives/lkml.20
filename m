Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472284BFE85
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283692; cv=none; b=JE6DYPWldJHi95JktQwHc3Bhb2bMjj5d20d+Pf5gpAN+UB7mOoAk7xxJQxNcsVd4XcWckUqS5DzHO9Xgr+ihcqA8Y5kKkrF4EwaMhzb3ddpgX76oSF5kBiKCXJYoDEv9+i5kXHvc8bZf3aeCnNAM9Si7cTxbThN3Sbwc0vnAFME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283692; c=relaxed/simple;
	bh=zWUFtQ0OFpf3Izpq9TTF+b80Ep7btpGUWULX6UL8HCg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uKi2qjsjzAyvySDpfycYJbjUddsLBHk4kgG4iha8aBrZ2o/bPLTCt/oyPGMJ6ube7ywbSh/qn+gls8GzQWrONy62JKEAPdjmw9g7kHRcV8JUlefbslvbnyuNkZOo/lX03e1OHZRkDg4e6W+sBt0E9+StW92c3GQiW5RNmrTmWVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qv/AhzID; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qv/AhzID"
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab4dd46ddeso342535b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790283687; x=1790888487; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kuB32MkZPc+XuzqWI7qs9zzr2PkaAGHh7pBlaVBsovk=;
        b=qv/AhzID+HGl+Fx+DQ0ZcRM5XZ4MVrtvj+m0CzM2aytQHTKVS04BeFL8ZsZ5q4+t61
         axLx/VVFHXDqyut6wdorzzV8AnS03M4nxo6UIp46irC+Y1wt9lxaiQBua+2ps4qr39w7
         cEsTbk+Co4IgCDKtMLz4tO+anEj+LGxn2/zq6Sfl1VcSS1zKrIhsZVVH8IuDDaLofvx4
         qq6aNP6g8p918zx2PXp9D0G1f30sn5eXA/7UlwoipK7fty4eb3BR7mgQOgAFX+1WP47A
         hUq3AkDuyXNzoRW2lRtPhir9tMmDuZtjt8vuN1Fm9V4XzV3la6dYKaHymU5cJpohaAkl
         /R1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790283687; x=1790888487;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kuB32MkZPc+XuzqWI7qs9zzr2PkaAGHh7pBlaVBsovk=;
        b=A4HdBvRDJ4TVXV66e9uHiAjItQR2u8TJ98XPvkRVj9FvMwVXkLiFOIy5Qts1GFPVeF
         KsOLvB6Nwl9TzwD+uIvqjd0O7yJBersI/u/hYX4OSFk9sd/JC5blsjABHEUjCBppSC0k
         Fbti7Dh/+WB4SutxtQsKaToxyzMu4WSVrqSYR2eZdn8dBKGep5mQwnPdb2EmobZ8Jc0U
         8DKvvkJ/bXvFFQWLA/japGK2iNWmk6FGXIFiOTrgulbvoSG0m12tYc+dOaO/Ka/T2b5o
         Vvda84XHCtmb0oQLQSFSd0+HqVjLCI0Nt5Tx8KCEj5kA1C/lbjBk7lBcWzBntvayvV8/
         lfBQ==
X-Gm-Message-State: AFuF++nAdC+H9siYyJIFQeZjwlg9+S7dfBd4fKX8gcPfJ5x6dw+oK1c2
	Bo/CfgOAFAVM6ZnVdcCCZMWnp65AEluk5lMBSu5+rFI0zkeWOQQ+gfeKy1uIgRnsDfRoZOfFqET
	avu/ivg==
X-Received: from iobbj14.prod.google.com ([2002:a05:6602:35ce:b0:9b6:e72f:c47b])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:1990:b0:4b2:8e1c:5920
 with SMTP id 5614622812f47-4dc57e29203mr41742b6e.9.1790283686460; Thu, 24 Sep
 2026 14:01:26 -0700 (PDT)
Date: Thu, 24 Sep 2026 21:01:16 +0000
In-Reply-To: <20260924210121.87032-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924210121.87032-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924210121.87032-3-avagin@google.com>
Subject: [PATCH 2/7] x86/fpu: Clean up and rename variables in signal frame handling
From: Andrei Vagin <avagin@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Andrei Vagin <avagin@google.com>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Clean up signal frame handling code by renaming several variables for
clarity and consistency, and moving masking logic closer to its usage.

- Rename 'fxbuf' to 'buf_fx' in check_xstate_in_sigframe() for consistency.
- Rename label 'setfx' to 'err_setfx' in check_xstate_in_sigframe() to
  indicate it is an error path.
- In __restore_fpregs_from_user(), rename 'ufeatures' to 'task_xfeatures'
  and 'xrestore' to 'xrestore_mask'.
- Move the masking logic 'xrestore_mask &= task_xfeatures' from
  restore_fpregs_from_user() into __restore_fpregs_from_user().
- Rename 'xrestore' to 'xrestore_mask' in restore_fpregs_from_user() to
  match the name in __restore_fpregs_from_user() and __fpu_restore_sig().
- In __fpu_restore_sig(), rename 'buf' to 'buf_f' to distinguish it from
  'buf_fx', and 'user_xfeatures' to 'xrestore_mask'.

No functional changes.

Suggested-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Signed-off-by: Andrei Vagin <avagin@google.com>
---
 arch/x86/kernel/fpu/signal.c | 41 ++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index 33e1284bf3e4..cd7db6dc819b 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -24,15 +24,15 @@
  * Check for the presence of extended state information in the
  * user fpstate pointer in the sigcontext.
  */
-static inline bool check_xstate_in_sigframe(struct fxregs_state __user *fxbuf,
+static inline bool check_xstate_in_sigframe(struct fxregs_state __user *buf_fx,
 					    struct _fpx_sw_bytes *fx_sw)
 {
 	int min_xstate_size = sizeof(struct fxregs_state) +
 			      sizeof(struct xstate_header);
-	void __user *fpstate = fxbuf;
+	void __user *fpstate = buf_fx;
 	unsigned int magic2;
 
-	if (__copy_from_user(fx_sw, &fxbuf->sw_reserved[0], sizeof(*fx_sw)))
+	if (__copy_from_user(fx_sw, &buf_fx->sw_reserved[0], sizeof(*fx_sw)))
 		return false;
 
 	/* Check for the first magic field and other error scenarios. */
@@ -40,7 +40,7 @@ static inline bool check_xstate_in_sigframe(struct fxregs_state __user *fxbuf,
 	    fx_sw->xstate_size < min_xstate_size ||
 	    fx_sw->xstate_size > x86_task_fpu(current)->fpstate->user_size ||
 	    fx_sw->xstate_size > fx_sw->extended_size)
-		goto setfx;
+		goto err_setfx;
 
 	/*
 	 * Check for the presence of second magic word at the end of memory
@@ -53,7 +53,7 @@ static inline bool check_xstate_in_sigframe(struct fxregs_state __user *fxbuf,
 
 	if (likely(magic2 == FP_XSTATE_MAGIC2))
 		return true;
-setfx:
+err_setfx:
 	trace_x86_fpu_xstate_check_failed(x86_task_fpu(current));
 
 	/* Set the parameters for fx only state */
@@ -240,15 +240,18 @@ bool copy_fpstate_to_sigframe(void __user *buf, void __user *buf_fx, int size, u
 	return true;
 }
 
-static int __restore_fpregs_from_user(void __user *buf, u64 ufeatures,
-				      u64 xrestore, bool fx_only)
+static int __restore_fpregs_from_user(void __user *buf, u64 task_xfeatures,
+				      u64 xrestore_mask, bool fx_only)
 {
 	if (use_xsave()) {
-		u64 init_bv = ufeatures & ~xrestore;
+		u64 init_bv;
 		int ret;
 
+		/* Restore enabled features only. */
+		xrestore_mask &= task_xfeatures;
+		init_bv = task_xfeatures & ~xrestore_mask;
 		if (likely(!fx_only))
-			ret = xrstor_from_user_sigframe(buf, xrestore);
+			ret = xrstor_from_user_sigframe(buf, xrestore_mask);
 		else
 			ret = fxrstor_from_user_sigframe(buf);
 
@@ -266,20 +269,18 @@ static int __restore_fpregs_from_user(void __user *buf, u64 ufeatures,
  * Attempt to restore the FPU registers directly from user memory.
  * Pagefaults are handled and any errors returned are fatal.
  */
-static bool restore_fpregs_from_user(void __user *buf, u64 xrestore, bool fx_only)
+static bool restore_fpregs_from_user(void __user *buf, u64 xrestore_mask, bool fx_only)
 {
 	struct fpu *fpu = x86_task_fpu(current);
 	int ret;
 
-	/* Restore enabled features only. */
-	xrestore &= fpu->fpstate->user_xfeatures;
 retry:
 	fpregs_lock();
 	/* Ensure that XFD is up to date */
 	xfd_update_state(fpu->fpstate);
 	pagefault_disable();
 	ret = __restore_fpregs_from_user(buf, fpu->fpstate->user_xfeatures,
-					 xrestore, fx_only);
+					 xrestore_mask, fx_only);
 	pagefault_enable();
 
 	if (unlikely(ret)) {
@@ -324,7 +325,7 @@ static bool restore_fpregs_from_user(void __user *buf, u64 xrestore, bool fx_onl
 	return true;
 }
 
-static bool __fpu_restore_sig(void __user *buf, void __user *buf_fx,
+static bool __fpu_restore_sig(void __user *buf_f, void __user *buf_fx,
 			      bool ia32_fxstate)
 {
 	struct task_struct *tsk = current;
@@ -332,7 +333,7 @@ static bool __fpu_restore_sig(void __user *buf, void __user *buf_fx,
 	struct user_i387_ia32_struct env;
 	bool success, fx_only = false;
 	union fpregs_state *fpregs;
-	u64 user_xfeatures = 0;
+	u64 xrestore_mask = 0;
 
 	if (use_xsave()) {
 		struct _fpx_sw_bytes fx_sw_user;
@@ -341,14 +342,14 @@ static bool __fpu_restore_sig(void __user *buf, void __user *buf_fx,
 			return false;
 
 		fx_only = !fx_sw_user.magic1;
-		user_xfeatures = fx_sw_user.xfeatures;
+		xrestore_mask = fx_sw_user.xfeatures;
 	} else {
-		user_xfeatures = XFEATURE_MASK_FPSSE;
+		xrestore_mask = XFEATURE_MASK_FPSSE;
 	}
 
 	if (likely(!ia32_fxstate)) {
 		/* Restore the FPU registers directly from user memory. */
-		return restore_fpregs_from_user(buf_fx, user_xfeatures, fx_only);
+		return restore_fpregs_from_user(buf_fx, xrestore_mask, fx_only);
 	}
 
 	/*
@@ -356,7 +357,7 @@ static bool __fpu_restore_sig(void __user *buf, void __user *buf_fx,
 	 * to be ignored for histerical raisins. The legacy state is folded
 	 * in once the larger state has been copied.
 	 */
-	if (__copy_from_user(&env, buf, sizeof(env)))
+	if (__copy_from_user(&env, buf_f, sizeof(env)))
 		return false;
 
 	/*
@@ -420,7 +421,7 @@ static bool __fpu_restore_sig(void __user *buf, void __user *buf_fx,
 		 *
 		 * Preserve supervisor states!
 		 */
-		u64 mask = user_xfeatures | xfeatures_mask_supervisor();
+		u64 mask = xrestore_mask | xfeatures_mask_supervisor();
 
 		fpregs->xsave.header.xfeatures &= mask;
 		success = !os_xrstor_safe(fpu->fpstate,
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

