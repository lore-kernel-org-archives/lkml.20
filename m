Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2B64DD3DA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353503; cv=none; b=mBMG2rkIzSS1HkDSaNZlhF0op94sVfs11qoUmZa8MySDqpTOO7pNb04Jw563YCAU6bc3DO3dWe8PoEWdlUPJbAfkD3jo7stzWZTyPyue08v+qu3MZvr8g6FfJf1r9CsRUKrfbTuodbihJsIJQxQq58QY6EQCuU1j4U+PohYorPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353503; c=relaxed/simple;
	bh=4RpkI8KfXMOOmHjyMtN5zyDz4IiUQsJHKpCFwvHuwUI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ETiYTieYuh5fini7+4YArh6JG1jWobzaJDb7rBapSz+2ri+SdF560jOq5E6F7SM2Q2/F2BcoOvUK/2x/Ym0a2XFJa0l224T2VUet6NdH7Zm9IaC5QNq7Wtzlz+0DcfZTsOMrAwN9a5Nc0WMRHUHXwKUtnCR61zO5dGo5XVROw7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uhet9PgE; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uhet9PgE"
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-467c2c754f8so1065003fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790353500; x=1790958300; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=naZNUXTORfsHf0bPiWPQFHA5ELE5DP9iIGnMiQwp+lA=;
        b=uhet9PgEDJPI8lVKCan4ReN16Mzg5a31xU1fWFiCa3Imhy0Hzq0nCdfHaYirkdywxS
         WysJ/quByxOEuyxKND05xPbHXL0qdPOmU14JFzfmFWW3iKyuNNIedJGOgKf6V8/aqdyZ
         U5UqCle3pZrr6h0btWACTaS1w6klIqNMdJXS8Xwgb0Bgk1URfkEKbmDuK7z3JDNKOTyM
         I+60ujTU9N0XjqdPUQA8NB3l3aiBGNECi+k57uPKRvb80Q1X58SY6dPEz81E4phpv7qp
         ZmrFSLDgdI3A+z0pRCzsgC3ybnIQwM7GuHKbEcYOs79EOeB05Z5X86Nmj/4tUmWEgLHx
         Z8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353500; x=1790958300;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=naZNUXTORfsHf0bPiWPQFHA5ELE5DP9iIGnMiQwp+lA=;
        b=nA1MOSy9eldDmoy6CFFsSR9p6AcinebsRy3j/sTKpSDJ17mei4gHlW7rDpf3sDAnoE
         b3ZEUOVvQSiU72wKYD9wRa6bW3Hk7xqYUiCEoT9hV30sA4TCGOBA4cjGIcAeU23DJ3cj
         81iMGeH5Vxz9MlJNEWPvIdKJTRqJvfOfZHwqnjtf3T8a+JzlVohHpbvXRa8yV4gPocno
         UA7KuKoI1sA7hOpznf/SeS1lre8eMaapEYjnTb+88E62Ly8PXZGz9VstGQOSfZNh95li
         akQy22JOljoh62aeC80sIkneU3QnqFEm3ex7LKX+2cvcRYhOfxGRZm6xUG8SRmiqY4Lu
         4C1g==
X-Gm-Message-State: AFuF++l9USDGzB9uZR7Q1DQloouYb1Bk7yKe8nNwwdIQ+OdFEnTv633W
	npk3qmt3D/CKDZwOMduW/H9nYTEExBAAQpz9IRBNNAzthmmcvHKkoftuRHLUrYH46wocQ/pGQS2
	Dk7HAvw==
X-Received: from iobhz13.prod.google.com ([2002:a05:6602:694d:b0:9c4:b532:6de3])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:2213:b0:489:5d05:552c
 with SMTP id 5614622812f47-4dc5a2b9effmr2884513b6e.18.1790353500183; Fri, 25
 Sep 2026 09:25:00 -0700 (PDT)
Date: Fri, 25 Sep 2026 16:24:49 +0000
In-Reply-To: <20260925162454.1403405-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260925162454.1403405-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925162454.1403405-4-avagin@google.com>
Subject: [PATCH 3/7] x86/fpu: Extract restore_from_ia32_fxstate() and clean up fpu__restore_sig()
From: Andrei Vagin <avagin@google.com>
To: Borislav Petkov <bp@alien8.de>, "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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
 arch/x86/kernel/fpu/signal.c | 56 +++++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index cd7db6dc819b..b9dcd0cd0e41 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -325,32 +325,26 @@ static bool restore_fpregs_from_user(void __user *buf, u64 xrestore_mask, bool f
 	return true;
 }
 
-static bool __fpu_restore_sig(void __user *buf_f, void __user *buf_fx,
-			      bool ia32_fxstate)
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
+	bool success;
 
-	if (likely(!ia32_fxstate)) {
-		/* Restore the FPU registers directly from user memory. */
-		return restore_fpregs_from_user(buf_fx, xrestore_mask, fx_only);
-	}
+	if (!IS_ENABLED(CONFIG_X86_32) && !IS_ENABLED(CONFIG_IA32_EMULATION))
+		return false;
 
 	/*
 	 * Copy the legacy state because the FP portion of the FX frame has
@@ -450,10 +444,11 @@ static inline unsigned int xstate_sigframe_size(struct fpstate *fpstate)
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
@@ -482,10 +477,25 @@ bool fpu__restore_sig(void __user *buf, int ia32_frame)
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
2.56.0.rc1.315.gc6ed9934b7-goog

