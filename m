Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABFD3769F4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 04:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788842083; cv=none; b=qoSEtCOAaZ8uMGXQyGPWMClZ2zivWITTdqQuQIjBWpQ3EYFNdnRMjjySMtchAta/Ep9VoggPl5YDtbkIAbmDayY/nhth5F6hDMHn/JqiorZgAjcqb+dXkUQTqmYn9MIrjs17/Bq5LQPnAIBHKUurU7yHKuQL1+lINbCp1JLS8hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788842083; c=relaxed/simple;
	bh=GpJ13KDRv1KtlmyYw9gNXVJEXhFgdRO5bHwPuyUvWYE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gOh6zWaP4Q4wrkIExu2WbYZ2KTvqZ+MGIHDkS3lQTmH0sXzBDId2FXebt5rFiTPApsuOHUJaDOYOoTJc3Vejx7En12CFNVNAh3Kb2mHoH8Cm6sssebU7mIyIcxYvNyEvlks7HalUwKM2vGCpsRkduAsUnEL84Hqw7lD1Nni1kFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gfNQz837; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gfNQz837"
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4519ef1babeso2778627fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788842076; x=1789446876; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=my0QXM+ikv9/PpCYzgn4TQ3ElcvYhNy4NwT6XgTRAzE=;
        b=gfNQz837a7l80YZeMwWSB+qSejnyEpCY+y93xb17HWuAogBBMo3Ua1UNaOVjhdf04l
         E4UupdXf3+5l5ON6mczu6iO0K7MktOWE8ADwIfTOnjcrneXD24Yyrq4kYA7zOWmUx86X
         dU0Sm8sywO4yL7O61w9W7NcCAP6I2IVceQSzxAwqW6VGxPb3YnPcyLbBtcfo6gu4MrKb
         +wMouzfju7W9GAnLG0PbSfOQXutwki+MduelNeLWE8DX7oJpw10w38O693HDYDGgBYcO
         6Ug2XzUndZv5NNNX/EkcxqWM9rntCpBsjgNStYh3Cxa0k3e8wLN2stvYDczguK4aidZI
         Z7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788842076; x=1789446876;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=my0QXM+ikv9/PpCYzgn4TQ3ElcvYhNy4NwT6XgTRAzE=;
        b=dGoQyVKF40ZJSUbzk+tPvbVzVZh3tGIHfiXsNOG4dELLhAou1tOnunMgNHWT+hQQrq
         VWGOpqSHmUEOEJPZz3GzahXiloizlOR3Am6eDIEcyRncRaDXqGihnKvGtHfh6GUM0B81
         YCeYONUjKi4cpixaobg4cCv/9KQB6r0yqK8cj3BSFAFb2mGcRx5ujRM8zar47p1OzN4a
         59gy63TZCuQnimC1lABc8nzgydbBUmtnoSymQAU55XROFOBHi3vemC2gUaQgl9wBUEP3
         s/c0DGIRAnh8D3nUWTriQtQHaWcftLkoscmR0rVcf0JLPKqY7kkqFLiAE2cstcxph9mN
         Vk9A==
X-Gm-Message-State: AFuF++lMl9ry8vN2QHKMPpUd6UJ0ae+ivqSmDmf2WzDy9Hs8077uvVed
	Mf1Ue+g+8jE8YZ73L6um/TXJjnFhWv5VAmf97JpzixGpLNHAvb0QwA0spwQJwWFHd6vyn94Pdrm
	3gaKP9g==
X-Received: from ilex16.prod.google.com ([2002:a05:6e02:6290:b0:50b:2126:7461])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:211:b0:6aa:ed21:6c95
 with SMTP id 006d021491bc7-6b6f7e6daa7mr14676398eaf.0.1788842075735; Mon, 07
 Sep 2026 21:34:35 -0700 (PDT)
Date: Tue,  8 Sep 2026 04:34:26 +0000
In-Reply-To: <20260908043427.1842515-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260908043427.1842515-1-avagin@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908043427.1842515-7-avagin@google.com>
Subject: [PATCH 6/7] x86/fpu: Pre-fault only required size of xstate buffer
From: Andrei Vagin <avagin@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Andrei Vagin <avagin@google.com>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

The kernel previously used the default task FPU state size (user_size)
to fault in the user buffer when restoring FPU registers from a signal
frame. This can lead to attempting to fault in memory past the end of
the actual frame if the frame was smaller than the default size.

Introduce consistency checks to calculate the actual required size for
the features enabled in the xfeatures mask, ensure that the provided
xstate_size is sufficient, and shrink it to the actual required size.
Use this validated size to fault in the user buffer.

Keep the strict check that the provided xstate_size does not exceed the
default user_size for now.

Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>
Signed-off-by: Andrei Vagin <avagin@google.com>
---
 arch/x86/kernel/fpu/signal.c | 38 +++++++++++++++++++++++++++---------
 arch/x86/kernel/fpu/xstate.c |  2 +-
 arch/x86/kernel/fpu/xstate.h |  2 ++
 3 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index d686d5f7f3d0..452ebef88511 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -29,7 +29,8 @@ static inline bool check_xstate_in_sigframe(struct fxregs_state __user *buf_fx,
 {
 	int min_xstate_size = sizeof(struct fxregs_state) +
 			      sizeof(struct xstate_header);
-	void __user *fpstate = buf_fx;
+	struct fpstate *fpstate = x86_task_fpu(current)->fpstate;
+	void __user *buf = buf_fx;
 	unsigned int magic2;
 
 	if (__copy_from_user(fx_sw, &buf_fx->sw_reserved[0], sizeof(*fx_sw)))
@@ -38,8 +39,8 @@ static inline bool check_xstate_in_sigframe(struct fxregs_state __user *buf_fx,
 	/* Check for the first magic field and other error scenarios. */
 	if (fx_sw->magic1 != FP_XSTATE_MAGIC1 ||
 	    fx_sw->xstate_size < min_xstate_size ||
-	    fx_sw->xstate_size > x86_task_fpu(current)->fpstate->user_size ||
-	    fx_sw->xstate_size > fx_sw->extended_size)
+	    fx_sw->xstate_size > fpstate->user_size ||
+	    fx_sw->extended_size < fx_sw->xstate_size + FP_XSTATE_MAGIC2_SIZE)
 		goto err_setfx;
 
 	/*
@@ -48,11 +49,27 @@ static inline bool check_xstate_in_sigframe(struct fxregs_state __user *buf_fx,
 	 * fpstate layout with out copying the extended state information
 	 * in the memory layout.
 	 */
-	if (__get_user(magic2, (__u32 __user *)(fpstate + fx_sw->xstate_size)))
+	if (__get_user(magic2, (__u32 __user *)(buf + fx_sw->xstate_size)))
 		return false;
+	if (unlikely(magic2 != FP_XSTATE_MAGIC2))
+		goto err_setfx;
 
-	if (likely(magic2 == FP_XSTATE_MAGIC2))
-		return true;
+	if (fx_sw->xstate_size != fpstate->user_size ||
+	    fx_sw->xfeatures != fpstate->user_xfeatures) {
+		unsigned int xsize;
+		u64 xfeatures;
+
+		/* Calculate size of enabled features only. */
+		xfeatures = fx_sw->xfeatures & fpstate->user_xfeatures;
+
+		xsize = xstate_calculate_size(xfeatures, false);
+		if (fx_sw->xstate_size < xsize)
+			return false;
+
+		fx_sw->xstate_size = xsize;
+	}
+
+	return true;
 err_setfx:
 	/*
 	 * The fallback to FX-only state is used to preserve backward
@@ -277,7 +294,8 @@ static int __restore_fpregs_from_user(void __user *buf, u64 task_xfeatures,
  * Attempt to restore the FPU registers directly from user memory.
  * Pagefaults are handled and any errors returned are fatal.
  */
-static bool restore_fpregs_from_user(void __user *buf, u64 xrestore_mask, bool fx_only)
+static bool restore_fpregs_from_user(void __user *buf, u64 xrestore_mask,
+				     bool fx_only, size_t xstate_size)
 {
 	struct fpu *fpu = x86_task_fpu(current);
 	int ret;
@@ -311,7 +329,7 @@ static bool restore_fpregs_from_user(void __user *buf, u64 xrestore_mask, bool f
 		if (ret != X86_TRAP_PF)
 			return false;
 
-		if (!fault_in_readable(buf, fpu->fpstate->user_size))
+		if (!fault_in_readable(buf, xstate_size))
 			goto retry;
 		return false;
 	}
@@ -501,8 +519,10 @@ bool fpu__restore_sig(void __user *buf, int ia32_frame)
 
 		fx_only = !fx_sw_user.magic1;
 		xrestore_mask = fx_sw_user.xfeatures;
+		size = fx_sw_user.xstate_size;
 	} else {
 		xrestore_mask = XFEATURE_MASK_FPSSE;
+		size = fpu->fpstate->user_size;
 	}
 
 	if (ia32_fxstate) {
@@ -512,7 +532,7 @@ bool fpu__restore_sig(void __user *buf, int ia32_frame)
 	}
 
 	/* Restore the FPU registers directly from user memory. */
-	success = restore_fpregs_from_user(buf_fx, xrestore_mask, fx_only);
+	success = restore_fpregs_from_user(buf_fx, xrestore_mask, fx_only, size);
 out:
 	if (unlikely(!success))
 		fpu__clear_user_states(fpu);
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index fe0a29f599d2..4fe148338382 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -587,7 +587,7 @@ static bool __init check_xstate_against_struct(int nr)
 	return true;
 }
 
-static unsigned int xstate_calculate_size(u64 xfeatures, bool compacted)
+unsigned int xstate_calculate_size(u64 xfeatures, bool compacted)
 {
 	unsigned int topmost, offset, i;
 
diff --git a/arch/x86/kernel/fpu/xstate.h b/arch/x86/kernel/fpu/xstate.h
index 38a2862f09d3..c73cf2444de6 100644
--- a/arch/x86/kernel/fpu/xstate.h
+++ b/arch/x86/kernel/fpu/xstate.h
@@ -55,6 +55,8 @@ extern int copy_sigframe_from_user_to_xstate(struct task_struct *tsk, const void
 extern void fpu__init_cpu_xstate(void);
 extern void fpu__init_system_xstate(unsigned int legacy_size);
 
+extern unsigned int xstate_calculate_size(u64 xfeatures, bool compacted);
+
 extern void __user *get_xsave_addr_user(struct xregs_state __user *xsave, int xfeature_nr);
 
 static inline u64 xfeatures_mask_supervisor(void)
-- 
2.55.0.979.g7e5102b832-goog

