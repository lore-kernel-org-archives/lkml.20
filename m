Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6F7318ED2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223381; cv=none; b=Rp1/Vo8W8GoUa8jPOiN5qFHoeNnEYyC3eQJkMifZ9hJgBJskRYPXV1gmiJkdzMuE7rl3VqNYPXQRYcari8+MZ9CwZgHRLYBv7+T1KoE1w0V8HPj5VNZZ4CfMn3kKsRfFUj23dEaD/jYwhYM8Teu2zi5pf4C8x2IEP/G4ZkDZIvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223381; c=relaxed/simple;
	bh=pVlFrXyRPMoilQAeEOQdUfMs6W76Ng/9nHuuJx2B/go=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J+4ZQUIXBKnojtDu5NoEjDGnJz47Ea4MlV6wjQ+ypqJ2LRimEmYlvR1XzfzaHaVncPU5Y4fmQopEARDEzgCR1qQFOAzg5zmYuojGX7CESi+BX2y2jwRtVJjsAsotadocyMs27oYWoROvE8yPMcJ3zsflpzK1tOCVIcU2I+XuKfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tuHc9G8t; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tuHc9G8t"
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c7f887ac6bso2481096b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790223372; x=1790828172; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Olld7wn72Rs8HlMT4HtQFLvrZ9j1PJvn2XP9d4jJL8A=;
        b=tuHc9G8tQdxaEqoTL3rFkZE33IUzHGnEebd6pTh6Sb549jYDG7m6gK1C8qHqFEjJHW
         FUjLjq/umiedJu0xemWAqv5QfGaHqp0xlR7Yarm6jMM40g53YhOGqW3Ru4ulZpRxRXCQ
         Ok9XDKTQBpswjFsYdtJTXGtdYX2HGiuO7S7zRokbAjbOm05hy2zOIB1tKBZwR+fKZ4nM
         dRcp+qnnJ828EK+3P6GGqKgrrOSeqi0ecPCSUN/ifdzlx1Lo6Zkun3lhRCNBkDd1OOTB
         g56aM3UECs5vD2enxNo6pepowwm3BnQazDiSVuIkiRJCThj6BlqWDRs1bxFoZoaNDORh
         980Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790223372; x=1790828172;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Olld7wn72Rs8HlMT4HtQFLvrZ9j1PJvn2XP9d4jJL8A=;
        b=gkl2ezLc1BahqC5WDT+Z41F2K6JatAK5xjiFQLS4MhQe0LUlcbeqVLdUGdvcjBxDnM
         BZYOzaoWGqk8nvd6I2kHfivrfP/L5zkHe7OEi0HivOx08FYrI0D22ld1dCWWKh5BESSW
         D5v762+HzGq3JGwI8ZOLFDdXZfC85c8SRXO5aLsb2rMKsG4OBXDyWaYCAk6GvW6KSOJq
         +gzRU4jVM0iSnWu2+ONo5rfToGhmyKysQ3MTNoQrbb/7fHujVUhzv2hQ57cuQXBHaau2
         7PzkQJtno/pFupjhuqnSsWHsM1S/Ojnr0g5HZi2r791Lg4IApxKfFI7oxHyPwQCTIkam
         oWrg==
X-Gm-Message-State: AFuF++lU/juzNcSzDIf0vQ/IZCHcsGjuFcd6JWdtSvbQFii9GMKp2sKW
	DlrvDKaLLwG4zQ9Y1X5Dy/ZntrKi/Jm+ZXPQ6bV5cg3QssuPoNP4gmwpM1QuD2v583vq0W/O71m
	kfQxi1A==
X-Received: from ilbdv16-n2.prod.google.com ([2002:a05:6e02:4010:20b0:50d:488e:cf6f])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:1705:b0:4cb:f21b:6f83
 with SMTP id 5614622812f47-4d72ea690a5mr1229457b6e.22.1790223372048; Wed, 23
 Sep 2026 21:16:12 -0700 (PDT)
Date: Thu, 24 Sep 2026 04:16:02 +0000
In-Reply-To: <20260924041604.3209659-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924041604.3209659-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924041604.3209659-7-avagin@google.com>
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
2.56.0.rc1.310.g51773c2048-goog

