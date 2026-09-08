Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A07B364926
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 04:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788842076; cv=none; b=sUoRlivayOHMgRcjBHY4StQYSM5q1AU7R0+uCgZKhvA11BPpT0susi/lEYr3v3JRaRZvor/pFPb3UbUSDE+4P7uIy7C9BZmhB9MsMhVuyCrf0iC7J/LTXZtGWGbXF5yOTwozvbz5BtkBCZLyjOIK8KV8GyjRXpVyOE+sRgV+im8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788842076; c=relaxed/simple;
	bh=OT8/M/0/yhqxETfMx73ZRyufQ+Q63Q+7ezLnv92HfdU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ikZiOBs1LN0iRlqlmnT6Auqul202LP3vyXAgj+Zg9/EYK5YUVs3twbB2w08SVBvm5WeQiRjvqLCsZcPRAOnBUXPNALlXLy0gV8nIHxzlECuS0QvQPunlYud6eumWIwf0DKB9OHxQi0dZ4eJR3rNwnp+gtzbaye4vF6E3wiErV70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mb0H9f9/; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mb0H9f9/"
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6bc3374cb0cso283890eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788842073; x=1789446873; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cCyDq/GM83Q8gTiNm48MdWVZRtnNjAWy4/ex2uDp03k=;
        b=Mb0H9f9/NK9fVxa89CR+nY3ARFei3lpPy/TOgh5mkcY/avEF1hOE1/28jL91QoctOs
         pYGqUOtXRq+eslXafZWF/4hk8X2xbGfRIcUv0J3YU2bCacP5d4DvxgfvuQ6IBUUPPNP/
         CxQ6GiWXdSkT/li7Jert86Ja+y+8Q1zIjcvAp1CbzHXIsVuk5E0+qxXf77iiCYfIF2jM
         qsIo9z61r2fjnAIUY1TUsrEE1jXaYMSPC/QKINKPRj2gw80ijsobytuepkZRnerDRlrT
         trujnkZip3iAfzLNIOP0hH7snrRnXfWRrU+6DZHTWkffk3MNC9N7vrAUbhnB8uo2DWxb
         QzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788842073; x=1789446873;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cCyDq/GM83Q8gTiNm48MdWVZRtnNjAWy4/ex2uDp03k=;
        b=PUt9QsSMKvQ46r3jjZSxYuX0XXQ715fVcJWFZk1OfRoIsShFUcnLqsnFS7SJX520hs
         OesPyhQBGjJDEltW4qBnkWsoD5NNjBZ7JN4hyQeqe2AJsdg0E7jzMgalmaEV5Y80rPLq
         cnQZ7/MCYKsGOSRvvWcv+ITn+EJ/ieU7toVft/hpjbR+OH3az1Ygl9WywzZ3fC+11Vk3
         KL5Rjq9QQ93KLc6U7RGtyznO9CrZyTUMFIR0ksRpmKGRM/wKoSpDhNn/UcWAEdB+btpm
         g869yxR5brQVV3ZHQQAxX00xuy/K7pdryFLzazjrd86pniUfJ+OFq8QOHnB92N1Hj8hO
         fODw==
X-Gm-Message-State: AFuF++kImFxU/gcHKjvKRktKZjFycFVmt//0byle9sY1VaNKX6tYxHUK
	s2WOiPPVBq2z7t6wkfzuLl6ZH2fEgZkshNuDnXWUFOhENkqPp7Gef6Ma4B+hDps6mo2tUslkYJA
	K4W7ONg==
X-Received: from ilbeb18.prod.google.com ([2002:a05:6e02:4612:b0:509:86e0:7b73])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:221e:b0:6b0:40d9:8ac6
 with SMTP id 006d021491bc7-6b6fb8d2aa7mr16910166eaf.9.1788842073017; Mon, 07
 Sep 2026 21:34:33 -0700 (PDT)
Date: Tue,  8 Sep 2026 04:34:23 +0000
In-Reply-To: <20260908043427.1842515-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260908043427.1842515-1-avagin@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908043427.1842515-4-avagin@google.com>
Subject: [PATCH 3/7] x86/fpu: Extract restore_from_ia32_fxstate() and clean up fpu__restore_sig()
From: Andrei Vagin <avagin@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Andrei Vagin <avagin@google.com>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

Improve readability of the signal frame restoration code. Previously,
most of __fpu_restore_sig() was dedicated to handling the 32-bit compat
fpstate, while the native direct path lived in restore_fpregs_from_user().
Having the compat handling intermixed with the main flow made it tricky
to quickly see what code was doing what.

Extract the 32-bit legacy/compat FPU restore handling into a separate
helper function, restore_from_ia32_fxstate(), and inline the remainder
of __fpu_restore_sig() directly into fpu__restore_sig().

The legacy 32-bit FP frame duplicates the FP state portion of the
FX/XSAVE frame. For backward compatibility, the legacy FP frame is
treated as the source of truth, and its state is folded into the
FX/XSAVE state before restoring the registers.

Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Signed-off-by: Andrei Vagin <avagin@google.com>
---
 arch/x86/kernel/fpu/signal.c | 67 +++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 24 deletions(-)

diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index cd7db6dc819b..60063a7a44f8 100644
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
@@ -482,10 +482,29 @@ bool fpu__restore_sig(void __user *buf, int ia32_frame)
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
+	}
+
+	if (ia32_fxstate) {
+		success = restore_from_ia32_fxstate(buf, buf_fx,
+						    xrestore_mask, fx_only);
+		goto out;
 	}
 
+	/* Restore the FPU registers directly from user memory. */
+	success = restore_fpregs_from_user(buf_fx, xrestore_mask, fx_only);
 out:
 	if (unlikely(!success))
 		fpu__clear_user_states(fpu);
-- 
2.55.0.979.g7e5102b832-goog

