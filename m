Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220814CA789
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789601009; cv=none; b=qxBUpfI9369QRDvOlfY9Gn3KONMkXX4TpQkGUmTnT6jS8yru+tPT7Ib1ReFJLbmLa3A9jRd3F6BCPW+VYOKuCurgQ4krP4QIF6ayNS8rX7eDaOL0HccNmnIwXtHTu8s2kw77awOjD4O0seyGRiEia6oAJdnWIdmFlw9AM9niwlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789601009; c=relaxed/simple;
	bh=tOsL8yVQjJBfGBSYp5apPW7reiq1zsapq097WRfiYqU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j7vLC/IcsuCRCwL/ktZWMgLvidk8fmqKWuMY3o2LZzjCgrHBsQWXSdFUzyXBhifjLtheleYQawLniEMabwly7b1KrkurEV+yrwQ6fPFOhI6b6YNrnM00vlZiT4ysX7867u3M8BsKsMWA/w2Pm2n1fU3fNZAWPt0cbHMAOjbF+CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t1oVdHAl; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t1oVdHAl"
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28db6c77aso402290b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789601006; x=1790205806; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60qM00PG0+A9imsiTqm+yezTKZHIiFhyf2ORUWD9cE4=;
        b=t1oVdHAlkrsDVPGK7KLFFxNjsZEPHc2/Q4f8H6rmPR4WqyK2Qkzo1eLZcwyEKSyGAp
         SGALemAFn/lMgGeKaO82DiuyDs1Ter9ko6erWFZOUAIFb391trhajE2Fcc79eYmBtvaC
         y2CuYB0T9ILhhPJtv/p/I53uSLAX++HuV1a11Wds6VqqLBerWa6OK/DtVwkZjlA5C/Q2
         9PnB64jzwOVJM3Yk+v4VamRCUdptTmMvlZm6s99+uV9KWM/fxnNUHVFkm3snlqGazYf0
         xnADxoosBuyjW0RyvGZ4RhCu5Bm7HkDRLAP5lWVsDKEvX/Oj8pZJjZ1MA29oDetQ43tD
         Fmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789601006; x=1790205806;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60qM00PG0+A9imsiTqm+yezTKZHIiFhyf2ORUWD9cE4=;
        b=sihDo86CrVDKTPknZr/T5tMH4CmLmCNBzLFaPmquqIu8d3miS6GMt9x2PO9RUdStvg
         TQiBg3qjTg0Xq8y9vsrlrFrcoVwjPiN6eqJnvrdVxyi8a1TNSPfBGnZSyInvYhmTyD1y
         UpGFQZVo+p5TRNO4fVoa33mPiwXcjo8XaqfHdoxDPcvN9D+7iHxDDlhL8DjGBxF8L0vY
         AOD74g2J6xXC7YipTRGeXU0brvhieekY3QU4bu1NLsFJACiFd+NgXCkchObAMFuLLkSS
         wyTYv9FCCZvCbtucV2TGq7qEUrOGg0m9d98KGpup//Ad8yYEGdLovuSeG+J0aMNuwpyL
         iQyw==
X-Gm-Message-State: AFuF++l9eRjNBKHRHDuKcZcNMt1Bx/VSw+aaMOANlwJk2S9+6KCAquGe
	1zOUMWoe54Zdl4XJ6/QAeje4guRmvwLVGIG3ShiDXuayC593p5xkY++5Z2eu7p296X4X/4bRglG
	PXGHL7g==
X-Received: from ilbbm8.prod.google.com ([2002:a05:6e02:3308:b0:50a:f72b:548d])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:4c86:b0:6c2:4204:6052
 with SMTP id 006d021491bc7-6c7d27e0ec3mr4526532eaf.35.1789601005886; Wed, 16
 Sep 2026 16:23:25 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:23:09 +0000
In-Reply-To: <20260916232310.490786-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260916232310.490786-1-avagin@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260916232310.490786-7-avagin@google.com>
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
 arch/x86/kernel/fpu/xstate.h |  2 ++
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index 050e58691964..1c4d83f3c44b 100644
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
@@ -501,14 +519,16 @@ bool fpu__restore_sig(void __user *buf, int ia32_frame)
 
 		fx_only = !fx_sw_user.magic1;
 		xrestore_mask = fx_sw_user.xfeatures;
+		size = fx_sw_user.xstate_size;
 	} else {
 		xrestore_mask = XFEATURE_MASK_FPSSE;
+		size = fpu->fpstate->user_size;
 	}
 
 	if (ia32_fxstate)
 		success = restore_from_ia32_fxstate(buf, buf_fx, xrestore_mask, fx_only);
 	else
-		success = restore_fpregs_from_user(buf_fx, xrestore_mask, fx_only);
+		success = restore_fpregs_from_user(buf_fx, xrestore_mask, fx_only, size);
 out:
 	if (unlikely(!success))
 		fpu__clear_user_states(fpu);
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
2.55.0.1082.g2b9226bbc0-goog

