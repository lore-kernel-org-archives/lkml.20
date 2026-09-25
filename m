Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBAA4DD3D2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353507; cv=none; b=SNZnNbhTKuv7Iafg8StQaqHRIE537v90Bqh3xp0jsxYQhgZKu6ZYxNUExNjdKxFKbAtOvu+6OEt/sFG/pIsK3AHpu6EIwI3PUKTDZ87qKyRqT++TfXDg392Y4RChQEgEcCvpE4Y/ImwVVdAxIkpB9iex4GfdHDXnbUcoFBij9Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353507; c=relaxed/simple;
	bh=yEgEYIrZj3QAGoZhdi3VOVw9RaeaNUc0l6OanggLNxA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BBXCmjDKeKjUQNyqSneVPUignIk/jfXY+ZqZw+BO6Yf1OjP8FZIl+8XSFHseeo6a7+uflAuDPdl2cewarQMcBdmsr3+leQ1gYc0W10h/ET+GrrPj+NijXlwAuACmBTdrhkBVRjuUIE4JEUdVgzt3wxesFHBy6jXtMX2IHsaVGxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V3uE2L44; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V3uE2L44"
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a7de733fa9so1945884b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790353504; x=1790958304; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVokVkXsBxrU1ZmBuYsXUCzHPSAStb0IXxoHN5jrub8=;
        b=V3uE2L444rK3QeOg2jzfdHFCqcU2OzRdi5G8jE6EDEqf5Sibc9IpMPouaZ0Fl8KDSI
         CnlRiQN2O68CNrY/j+JRYKN+Tp+bnHrWTlEMZsJIdxOV1YsSWRDPXsnEHDK7+RBDLeB0
         iXLphBq6Fk0csa6bUm/sHWVBRSqG+sx17kPrfblzfq1Lfhrsar2LnirF0oxjMeDKHMbc
         hnLYccBIen/+iOjGUIKFrqE3PQ2j+HVOzkkwxdELluf3R8Bpi6Jrn7Cf+Itjd4rWHf0i
         u1oSNzs/X6jGc3nqtY7DbtG2XsSkOab9DNU0icayXVCKg7BlOOxI9ZZ/CZlOJRmBuzYF
         8x8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353504; x=1790958304;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVokVkXsBxrU1ZmBuYsXUCzHPSAStb0IXxoHN5jrub8=;
        b=jMQ6YLLlVnowNohrAi9elDHcLOx8rdN4kuzL4HkHe+KqkXBVZ0zTiqgb8jgc1yBqng
         ibFAIGj7euCCtDciqHOFddHQw+hqvexbEJAczdhllKzd6DplMbkXXNyP/o+iI/OdSfz7
         ltBvwdta9GbK2+tbIJSYIJCQ9Tf7IiGHx3dfEkeXHei1UfTUI+FKEyTX30ladDSoRtS5
         D7WNd6aN/4mFgXlydwGhe6Y3XGtHDDNU6vU9XX6BmQokkwyAOXPydrWeCIerueOkU6qN
         VPk+D8YqYJ/6kvOtbwdUnkLW/nM4dy5AYE8OPmnuPf9eieDBkqfZstnf/uNKHSAMsSEb
         NvRw==
X-Gm-Message-State: AFuF++nqKX/Um93uh6O/1P66FY/68Xi9wf/v+9PfQ++lyOeKy7+VKNTJ
	c/Muikb/W+h/fgL3Zi8NDvBYK7aNUqXqRJJya4xE2GaevVU8sB3h1GNQbEuB+/qhmssE6T3cytI
	O8+ZZsg==
X-Received: from ioed25.prod.google.com ([2002:a05:6602:2819:b0:9c3:8b15:2c82])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:1493:b0:4c4:3997:ef2f
 with SMTP id 5614622812f47-4d72c6379c8mr6172859b6e.17.1790353503851; Fri, 25
 Sep 2026 09:25:03 -0700 (PDT)
Date: Fri, 25 Sep 2026 16:24:52 +0000
In-Reply-To: <20260925162454.1403405-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260925162454.1403405-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925162454.1403405-7-avagin@google.com>
Subject: [PATCH 6/7] x86/fpu: Pre-fault only required size of xstate buffer
From: Andrei Vagin <avagin@google.com>
To: Borislav Petkov <bp@alien8.de>, "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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
 arch/x86/include/asm/fpu/xstate.h |  2 ++
 arch/x86/kernel/fpu/signal.c      | 38 +++++++++++++++++++++++--------
 arch/x86/kernel/fpu/xstate.c      |  2 +-
 3 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/fpu/xstate.h b/arch/x86/include/asm/fpu/xstate.h
index 7a7dc9d56027..33343e5d54b0 100644
--- a/arch/x86/include/asm/fpu/xstate.h
+++ b/arch/x86/include/asm/fpu/xstate.h
@@ -111,6 +111,8 @@ int xfeature_size(int xfeature_nr);
 void xsaves(struct xregs_state *xsave, u64 mask);
 void xrstors(struct xregs_state *xsave, u64 mask);
 
+unsigned int xstate_calculate_size(u64 xfeatures, bool compacted);
+
 int xfd_enable_feature(u64 xfd_err);
 
 #ifdef CONFIG_X86_64
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
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index efa7879d2f97..a2b6ede343fd 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -587,7 +587,7 @@ static bool __init check_xstate_against_struct(int nr)
 	return true;
 }
 
-static unsigned int xstate_calculate_size(u64 xfeatures, bool compacted)
+unsigned int xstate_calculate_size(u64 xfeatures, bool compacted)
 {
 	unsigned int topmost, offset, i;
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

