Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BEC4D8DA0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283695; cv=none; b=qES5pyJ1fsW+4LKMdzZ7zRglYRfs7lkQmN6Dk11HrX16/ZQRgBBYgghDjent7Kj6mm7FJPUk2GU2FfVqVx6EjaIkZUga32PS/EvOfSBxgviXhCw2k/a7Ux+zWRiCGEkrVpfLSIpyQWYSquXHH9SUjK9HsEYtVK1x9MlCvMTdnRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283695; c=relaxed/simple;
	bh=tM1fEi/PQAroXNwyfupEEjRLXuAl9ax4bNrf5+sYBPE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hl7iWEur7+xhCZRWjO5DU8PS5BAXuSOkW8Ygvs3I9NZFGzsa0sqzTxNNVA2fvBXTGfmDKvBgnj+HI8mZhH++okH7uPAEFOgragC6KW9DoojbFiKAx7OtWpllA4CxcK8Rz+9ZQNW0326Lytske7kiNFDPKj588+q0Sm9GvYbWZ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qlYMPA1J; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qlYMPA1J"
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c307941971so573577b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790283692; x=1790888492; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckIPpA4upIUvDnB35HI0PWHSY3LNEH7jGrCRpdYpN1I=;
        b=qlYMPA1JzSJcJaGUAEKZ11XmMZT8KokNR1D1PSIeNhPhVP5qPjzM6iNO8HpWogN4Wz
         nN10WmikpLX1TiMmgWaM85Jx89rYmI0Md4rcVupLvdBdf3vrBbP2BtRCniUtBOPUXNdX
         3BL/JH1m9bQzR/SRPvSSP03gq1LHUdvG9YpZCz5Q+kQ+JBJfY9JVQ4JCE6d7r5tb6lja
         8AkpsbmJIH7GOq+LDW4dOaJiXqGVfx5ubJCvDxWhGSXduLeA0G8FeEBFRnh9fdxC8RNG
         AkIEuTHw3iyVxpmqsh/DBcJaCHzmjq2ZVLLr+hrYMtt7LevXVNk4Fl/y62NbZJ8OhHIx
         4sCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790283692; x=1790888492;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckIPpA4upIUvDnB35HI0PWHSY3LNEH7jGrCRpdYpN1I=;
        b=JY6+gh62ja0mzyaA7cfCwpFXudT7fINiRr0dM+QD+oec1lraLROIBW0D3EzgxI98Ht
         nVG56ML6g3XwEoz0vEMUpnu2pxHsvBmOby6FTSrGsEMtgi2Fhtee/nOCSvgreHbVe5eJ
         jbDV6fWBf5ffyZHuuNG3tYyj/ySTN6zc5oYd+GxvXddYbfaxsXhJL0B2OCvPDSpTOVj2
         D3uDS9Vi1n5uC5xNrhfyXVuc15R75Fx6FUsPj1lQ76AehWiHZeTjJpN6QnWDoSBhnoB2
         gVcPKaElvvQhbjB4g21vuShMZB73KvuLqeG1/vD+Uvp5CnHfuwgc8zvYloXlmT5HLSGU
         DsGQ==
X-Gm-Message-State: AFuF++lbBtXslK40j5SsXkN+BJzNL2UjV0dC8CH3+ly/3tIJBqtv4tss
	XfRu8SOQdlATGu09d4IuDzEgW1cUBhRcCW8q5zE+RgOvllg4etddT+fZFIkawpI0RsHkpMeQRwA
	axeE3gA==
X-Received: from ilbeo28-n2.prod.google.com ([2002:a05:6e02:291c:20b0:50d:a931:a100])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:1719:b0:4b2:8d7b:390b
 with SMTP id 5614622812f47-4d72c6374d8mr3964788b6e.19.1790283691228; Thu, 24
 Sep 2026 14:01:31 -0700 (PDT)
Date: Thu, 24 Sep 2026 21:01:20 +0000
In-Reply-To: <20260924210121.87032-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924210121.87032-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924210121.87032-7-avagin@google.com>
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
index d56819fe491e..594ba36dec73 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -27,9 +27,10 @@
 static inline bool check_xstate_in_sigframe(struct fxregs_state __user *buf_fx,
 					    struct _fpx_sw_bytes *fx_sw)
 {
+	struct fpstate *fpstate = x86_task_fpu(current)->fpstate;
 	int min_xstate_size = sizeof(struct fxregs_state) +
 			      sizeof(struct xstate_header);
-	void __user *fpstate = buf_fx;
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
@@ -496,14 +514,16 @@ bool fpu__restore_sig(void __user *buf, int ia32_frame)
 
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
2.56.0.rc1.315.gc6ed9934b7-goog

