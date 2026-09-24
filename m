Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E5F309EE9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223373; cv=none; b=aoxZIGTcdBoSkHAntjtjoaq2s0tmvFVry5HZvpELB+nUBV3703XwOPa8xavNP/MUBmbpghj02aPqzgVoEE5k9k1hlUA9NTYiUnkOkESwUssnMnuPq+dS6cf/qynq9MpL36ePJ50CjLO4LPWw4wbz8LM5F8n95wvtmj9Yszpi45M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223373; c=relaxed/simple;
	bh=zpTsHsdhvX0iPTlbayTEc1FmShanIfURQhpU//AP8tI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gy7eQCGb5/C9qT5uSeQYnZh4iSVH3/8EEuL0ev4+DxvzVqwVVk6j3JjNMiWl3Icm14TmCt0fbsikbx08QaLK8J9B144ydy2F4d/uY7oRvzvA1lsZi7mZbYdDRg7EcqAom8QO1izvjYGShMhMRPTc0ehmkAFqPtz2UosVeMMsyls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=glsg9Y19; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="glsg9Y19"
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f4e8568ccdso2955844a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790223369; x=1790828169; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xcw9Mgm3kBNox5yRvORKHD3/cac/jIReOJZK/oYGkSs=;
        b=glsg9Y195zjeGCb8DMlENcEhBDvZPWwjh3d4V2Vr5Ts4s/87yFFw92UGTYHkCJc4GO
         pCZVJCHiP0Kd1rM4Jj9JzJtmpf363NZsUM3LKxl64PLNplnL7HFDkRLfHpOpPO241rLU
         CsxAA5OxoDEykw1Oigvzyb6jn8Pq+68Qqu5SAXnZVCFF4gLLll+V0uITwwnXRFAeku8n
         dcJkOmHfzXzi1ugHpj5CyQyqkvT+AdT13Ewf6pKeedtprEti2L0WeW30QN7k39sPqfSR
         GdRKIi5qh3+/KTxUaXBB2lExezaJ7ZKBo1VfbU1OEx4jgSFG82J7C8s5dQa4GmuSofaV
         57LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790223369; x=1790828169;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcw9Mgm3kBNox5yRvORKHD3/cac/jIReOJZK/oYGkSs=;
        b=0Ax7+hvS0icQxUU4hNTLbxlGfml7tWQJwZxMmmCDVx3bmExVVIkSgDwvbqVESDklqo
         5p2jcQSQ3us+sOEipUM73QtVcilCbv2O6sQhIB11Omx4Pqbz9vity/9qZiKnnUhZfLte
         IBxyf3DSmeBvmnNVPH9FRTXa4Xcx07HWs1XTZrHAJBQCItDr34RpcOw/no7NHENZcGkr
         YokKhdi0zzapBMkCeIRX+ULY+Iiuv9JGPw9/g06stTWEhSjh8MvOiM3Aq+S4TM3oUExv
         5LoZFaR01bcGamGQybS6JbI/uvPwygdUEhozdM9X6VXzDryQtraHJT0ikmM8EqVEYBDy
         6AHw==
X-Gm-Message-State: AFuF++nOHG9avQEyxIRWYsqP5ExGN6kxbhG3b7+9GLc4k6lMMgZGsN7R
	5yYc9c2I+Zzd0/45zn8CE0bUZw0AHvIAVxjbkSdYs86X22nC6nTjqt1DmZke/QcFee0Qdx8mera
	do1UPag==
X-Received: from ioxv7.prod.google.com ([2002:a05:6602:587:b0:9c3:8639:712f])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:238e:b0:4d6:9153:2965
 with SMTP id 5614622812f47-4d72b63ec49mr1377005b6e.54.1790223368785; Wed, 23
 Sep 2026 21:16:08 -0700 (PDT)
Date: Thu, 24 Sep 2026 04:15:59 +0000
In-Reply-To: <20260924041604.3209659-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924041604.3209659-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924041604.3209659-4-avagin@google.com>
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
2.56.0.rc1.310.g51773c2048-goog

