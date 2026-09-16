Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12E54E430C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789601006; cv=none; b=DnDW1tz2ysMtdZJukPfHhnCOT9B2pjtJyTNiIbpdAuCwaUJe8sP00VXTPbXMRKs/6JKv66+pjjZdF7Tbt/iNfsmsCbGOSQkC5XOiixF7A7TDk7g55/uQG4kUkVarKh6ZJE0ERpsNxZ4mQ0dF73SZurUcxtn/g9HqQEuW2UU5j0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789601006; c=relaxed/simple;
	bh=DYk1VYryoqgT8taACmdSymRTefB0VVOx3RJwmin9CBs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s9wJuZTI+ilKdSmOCINBeBCCaZSFSqziJLTVt2k8b9bW1+0SeFtvp6ZDBJMWtdsPzPul04lllpzU6tLKZUz+xlxUGYof/N2Tq5CVOdxYQIYHemxljOAmKSpn0a+UkQeo1PAYdBlvHrDusSZxntkk28kRE77xgSVt2wkmZWYkoio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U4ruqLkd; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U4ruqLkd"
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c1b7981b4eso155049eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789601003; x=1790205803; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7SLsHGqtebxwp2xnD0z2ZKL+UE4NxRki3rz5pBthOQc=;
        b=U4ruqLkdAAiosAUzmlAs18M2oOfB4HZIIW5B9Dz3pV7a0ICtx0ekbrqXKbzmQt7fA+
         suBm5/+811JSDnzxvAC+PzjpLi3IfA8CnV7uhftqk9Dibze3+InFDUyYtnDngmlJ4Y0R
         yZqJv59O0qLP/RNkWsrp4JkXpzEeYvYy/ZYwe3NXbkGJZG6I8vZM2Oz265VqULc8et1V
         /tEat6dXEa0F0GfpjcEb5+N9AMqzh+cifOTscMkh22RFved+HeypY7JTCniiFBUJksp+
         DBPyTs1ljNkr0fDhkyZSWR0OszLXI+2y6K82H7106wLj7qEmW+zm8nDbMfgGHS8AfJ3Z
         hj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789601003; x=1790205803;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7SLsHGqtebxwp2xnD0z2ZKL+UE4NxRki3rz5pBthOQc=;
        b=JcDlzdzvKwSeXZim4KG9uCPBRK6H6nqfl336NwFNkhU4cTHlVxOq+PXCn00uIavh1t
         oQs90El6fOVYrVrLiDIf94xit24hLpel/WyzLLVmSv81dZYdAvnogBbFk4rUVs9QV2hC
         bq5WbG64GFslZOUYpqjMnKe2MQdqps5beaCIBUY6rrDYoVKcCg/wWFkcszXZsBNEgAzw
         0a3jeZX1/1Q9OIPeFwC51cNRBTP3S4JnAJiXKmyJJw9S1sXuxowGsPeksf7g7Rwrx8sd
         4MjVzC1sJKPU+nnw6fM/tXw72tEnA8gEIupceoEEfuaWRdA0N/up9ZABFl4JQP3gq19P
         uDNw==
X-Gm-Message-State: AFuF++k1Eio/SCvVzHRypmgSEG0I+vPOu6KPiialbD6mD65d+dC14Mx3
	vxDCv5Z53UYUvIOwO8rD0maZ9vYc1m7OU9A2heaPcuN7SQ8kLMbPunardwzmJ8PbuY33tm2781p
	ZOtCxsA==
X-Received: from iobb2.prod.google.com ([2002:a05:6602:2182:b0:9c0:e97:5e02])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:1f14:b0:6bb:4fd:e33e
 with SMTP id 006d021491bc7-6c7d5100120mr4456674eaf.68.1789601003065; Wed, 16
 Sep 2026 16:23:23 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:23:06 +0000
In-Reply-To: <20260916232310.490786-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260916232310.490786-1-avagin@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260916232310.490786-4-avagin@google.com>
Subject: [PATCH 3/7] x86/fpu: Extract restore_from_ia32_fxstate() and clean up fpu__restore_sig()
From: Andrei Vagin <avagin@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Andrei Vagin <avagin@google.com>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

When restoring an FPU signal frame for a 32-bit or IA32-compat task on
FXSR-enabled systems, a legacy 32-bit FP frame is present alongside the
FX/XSAVE frame. Because the legacy FP frame duplicates the FP state
portion of the FX/XSAVE frame, for backward compatibility it is treated
as the source of truth, and its state is folded into the FX/XSAVE state
before restoring the registers.

Currently, most of __fpu_restore_sig() is dedicated to handling this
32-bit legacy/compat fpstate, while the native direct restore path lives
in restore_fpregs_from_user(). Having the compat handling intermixed
with the main signal restoration flow makes it tricky to quickly see
what code is doing what.

Extract the 32-bit legacy/compat FPU restore handling into a separate
helper function, restore_from_ia32_fxstate(), and inline the remainder
of __fpu_restore_sig() directly into fpu__restore_sig().

Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>
Signed-off-by: Andrei Vagin <avagin@google.com>
---
 arch/x86/kernel/fpu/signal.c | 63 ++++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index cd7db6dc819b..db069947bdb8 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -325,32 +325,24 @@ static bool restore_fpregs_from_user(void __user *buf, u64 xrestore_mask, bool f
 	return true;
 }
 
-static bool __fpu_restore_sig(void __user *buf_f, void __user *buf_fx,
-			      bool ia32_fxstate)
+#if defined(CONFIG_X86_32) || defined(CONFIG_IA32_EMULATION)
+/*
+ * Restore FPU state from a signal frame when a legacy 32-bit FP frame
+ * (buf_f) is present.
+ *
+ * The legacy FP frame duplicates the FP state portion of the FX/XSAVE
+ * frame (buf_fx). For backward compatibility, the legacy FP frame is
+ * treated as the source of truth, and its state is folded into the
+ * FX/XSAVE state before restoring the registers.
+ */
+static bool restore_from_ia32_fxstate(void __user *buf_f, void __user *buf_fx,
+				      u64 xrestore_mask, bool fx_only)
 {
 	struct task_struct *tsk = current;
 	struct fpu *fpu = x86_task_fpu(tsk);
 	struct user_i387_ia32_struct env;
-	bool success, fx_only = false;
 	union fpregs_state *fpregs;
-	u64 xrestore_mask = 0;
-
-	if (use_xsave()) {
-		struct _fpx_sw_bytes fx_sw_user;
-
-		if (!check_xstate_in_sigframe(buf_fx, &fx_sw_user))
-			return false;
-
-		fx_only = !fx_sw_user.magic1;
-		xrestore_mask = fx_sw_user.xfeatures;
-	} else {
-		xrestore_mask = XFEATURE_MASK_FPSSE;
-	}
-
-	if (likely(!ia32_fxstate)) {
-		/* Restore the FPU registers directly from user memory. */
-		return restore_fpregs_from_user(buf_fx, xrestore_mask, fx_only);
-	}
+	bool success;
 
 	/*
 	 * Copy the legacy state because the FP portion of the FX frame has
@@ -436,6 +428,13 @@ static bool __fpu_restore_sig(void __user *buf_f, void __user *buf_fx,
 	fpregs_unlock();
 	return success;
 }
+#else
+static inline bool restore_from_ia32_fxstate(void __user *buf_f, void __user *buf_fx,
+					     u64 xrestore_mask, bool fx_only)
+{
+	return false;
+}
+#endif
 
 static inline unsigned int xstate_sigframe_size(struct fpstate *fpstate)
 {
@@ -450,10 +449,11 @@ static inline unsigned int xstate_sigframe_size(struct fpstate *fpstate)
 bool fpu__restore_sig(void __user *buf, int ia32_frame)
 {
 	struct fpu *fpu = x86_task_fpu(current);
-	void __user *buf_fx = buf;
+	bool success = false, fx_only = false;
 	bool ia32_fxstate = false;
-	bool success = false;
+	void __user *buf_fx = buf;
 	unsigned int size;
+	u64 xrestore_mask;
 
 	if (unlikely(!buf)) {
 		fpu__clear_user_states(fpu);
@@ -482,10 +482,25 @@ bool fpu__restore_sig(void __user *buf, int ia32_frame)
 		success = !fpregs_soft_set(current, NULL, 0,
 					   sizeof(struct user_i387_ia32_struct),
 					   NULL, buf);
+		goto out;
+	}
+
+	if (use_xsave()) {
+		struct _fpx_sw_bytes fx_sw_user;
+
+		if (!check_xstate_in_sigframe(buf_fx, &fx_sw_user))
+			goto out;
+
+		fx_only = !fx_sw_user.magic1;
+		xrestore_mask = fx_sw_user.xfeatures;
 	} else {
-		success = __fpu_restore_sig(buf, buf_fx, ia32_fxstate);
+		xrestore_mask = XFEATURE_MASK_FPSSE;
 	}
 
+	if (ia32_fxstate)
+		success = restore_from_ia32_fxstate(buf, buf_fx, xrestore_mask, fx_only);
+	else
+		success = restore_fpregs_from_user(buf_fx, xrestore_mask, fx_only);
 out:
 	if (unlikely(!success))
 		fpu__clear_user_states(fpu);
-- 
2.55.0.1082.g2b9226bbc0-goog

