Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC024A5C55
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353501; cv=none; b=WmAlI5goiQsuZiFQMQP1ZSKa88Pt+O+E5UiDO/tyz+pHxwYR9bX6INAZ1YiyRU+o8XiRWbaI23pXZalNhwnlshDeJXIcAZt/3eAFpXwsaOWQ1UHimoqTLDKk2qP7pc60UVlVxzVaQei9G07hRiXBGPsyYmDM4kFPbzSRhHLa8AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353501; c=relaxed/simple;
	bh=zWUFtQ0OFpf3Izpq9TTF+b80Ep7btpGUWULX6UL8HCg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CfVWYGGnkfAUuRA+PflPnbfD8VmcIArArLMDN0NjtdDXzvgvtU3rPZR5hqE1Q5eh++VU3DPTeduiD1n7DfbRl4hN58QubtJ2EKjef9oysXM0stgnhJ5WO5B3wg3UhHNqqqcfRCGkM1JJ8ZQD7j3wi8EE1JzgbI+XHRyGyL665Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aF7xtRKx; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aF7xtRKx"
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-80d221f75c8so1557687a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790353499; x=1790958299; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kuB32MkZPc+XuzqWI7qs9zzr2PkaAGHh7pBlaVBsovk=;
        b=aF7xtRKxfQF83y4ztxBDfzYq/1pR+sD3uRyZaUhOcfs2/FtXncD4L/Y9gKJNlRurA4
         cybwq2fSV2CW+bqMbW7GueGqZpZ2sS4NrxxEWNYkPfTp0/ZiJ/EvlVITdgINRS+yd0XP
         PHSqiZTdomEbEhnBGrpIr/H6DiZ4YqV0VOY/c4zKEypfaskw4nxH4Ca9D5EaQNd0O6Bg
         qfKmLaN8li8cpZpbzWF3ndihzClT6IJGT4K2Uw2vuRIW9U5TQxFXmoO+276Cby3hJXz6
         TmP+O5ZbYBURJLUeYhLDU/XTLrn4rAlMFcQhpAmexM1Xm2WQDlOQBG2KllP2YgibGiMt
         1NVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353499; x=1790958299;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kuB32MkZPc+XuzqWI7qs9zzr2PkaAGHh7pBlaVBsovk=;
        b=R4M8v8qjw8PTiZYRFbgFeFc7p4gFbNlyzAshEPqfVhT40r9hwt+31knkcEHJvsrP9D
         vTcQnhDdtLCBgW5QAAL9JAWX3rJklhLTiNS4MUu+6/hMd3kEAWBUmKgP83Mu/jd2+8KH
         ffQ06oJHtW+PfoLJYi5ynJllrsaih7ZAe7+rlzJyBsPcL2BNNqR80t4xYX+LqoJDzWs6
         aoukz7xNUdN/ln9idi5y+W2Oz59HgndtJonBk17iIDi/08FnGAwFN3+zeoxpiFmc0QHZ
         W7Z4KVV9FexgcVK00DvpkKBKqQMzvzJo6NyHElS2KzMk9JdFxtK6rBjlbQmfEGTScd7f
         31Hw==
X-Gm-Message-State: AFuF++ldvdn4HvOUPO7GkqqOcIqKCJK3pADGCTAZLlFMFsTWexUDEqkG
	CrZs65Eu8dg5dFo0tRICQPKIW0GOe5Q3K4SaE/QY1mTE/QxQVWd+CZalNbzOVYrGxWgneL1ANvC
	Y9Jz1Ug==
X-Received: from ilto4.prod.google.com ([2002:a05:6e02:924:b0:50a:f2a7:e48a])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:11c5:b0:4d5:295c:a82e
 with SMTP id 5614622812f47-4d72f054253mr5623596b6e.59.1790353498397; Fri, 25
 Sep 2026 09:24:58 -0700 (PDT)
Date: Fri, 25 Sep 2026 16:24:48 +0000
In-Reply-To: <20260925162454.1403405-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260925162454.1403405-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925162454.1403405-3-avagin@google.com>
Subject: [PATCH 2/7] x86/fpu: Clean up and rename variables in signal frame handling
From: Andrei Vagin <avagin@google.com>
To: Borislav Petkov <bp@alien8.de>, "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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

