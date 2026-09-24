Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F304CC604
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283693; cv=none; b=mz95piCyJiJCJKAllP1SUF2Hd0fh24lHDlY4h7Ofm5O33p2FZV0MtnRu+8lk1ckvgg5qvTUJo8z1IhV28VDGfeOvAx60PRfBNpL6MGbCg4RQqvGI8ewtkDKtXMLtv0G6hTXfLNnVNiQycxzzbe0Uri9x/4Knn75hEXMY+zHBYHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283693; c=relaxed/simple;
	bh=4RpkI8KfXMOOmHjyMtN5zyDz4IiUQsJHKpCFwvHuwUI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=um8nVSUaleY7OFxLU1Y4o/UvoHTy0+Gbw7UXL5rUX5TKkvgcSApANZTQXTre5KsO3dCr5BESLu4UcKyBzmf323CcVi6u/O+ipCmxyH4PX6KMIWiNor9FrZYeQl9G9WaXUogrS6Y82pBNvS7npwbOj4nFfYhSfQZROj7+Tg5qztg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T90HGomE; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T90HGomE"
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cbf700ddccso383473b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790283688; x=1790888488; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=naZNUXTORfsHf0bPiWPQFHA5ELE5DP9iIGnMiQwp+lA=;
        b=T90HGomERP+29ScP2Q6aDcIy8CM/CSDu5B3apccO2MBKmW/IOfiQHBP9HgF9ESkD/G
         uFkkH9WtHF4SMaCzf6StQ4qUfQjXA5D0bfo9pfns/ersr5z2Q/j3eatZjjtVZQqSShNH
         tTgSabKnkY7axUSlRcbwVMafwqKzgqZINrdk9fWEHtcOxyCGSubQgNn9Q4BO22byFfwL
         zuloUGn1Y78c77+zN/vrJrg/dr7A9+OWsqVtiqpsA7b21pDNzhjtUZkZ856+Zo635pdJ
         E4qp1+K8+Qouz4eg8Gjh7lSdQQiGmmODhXupDOtmxD/Cr6TSwB3ELpxN2LGo+qljUKuf
         3HMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790283688; x=1790888488;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=naZNUXTORfsHf0bPiWPQFHA5ELE5DP9iIGnMiQwp+lA=;
        b=cTiqclMepuxv48vlDKjifc8cfsIIMMDPHZVC0V6ioqAmYKNyiOgYHmtrJUL1/o7DJx
         C+unl5Qdj8YhTu48Sgz9P3cJU2Mqe7jd13f3MFmDUgeQdV1MWO0oi+Y3ZT6IDkqXWysq
         q9aMpntZd2/bqaFX11u9NaG2JXf/WKWNqKElwQ45yja2URi8kDDIMBuPmbmVKktlqahD
         +Wy6kk/eAMpeF7numQkwzAy1ePfH9LS3k+/2+QwoY5vqAPn32RaduyQV6jhD9EpWApex
         n4xfpvNQM5s8gCHp2KCbbTLZdhODA/PVrEM1D0RwAdkBCIDbDI3yZM47mbjG9/ftbE3l
         neoA==
X-Gm-Message-State: AFuF++nKwYDEhxAmFH9MgMwI7OPnZUKPXeHqyxIMUA6qCQOROx1L/Xh4
	V5vL1+s2gMOj3PlL5iSjMVf/tO00mN7qlMK1YN3vJpWxO6cAY5wyeBTKtP3XwHA3p12r2ak58AX
	mIFkauA==
X-Received: from iobhi22.prod.google.com ([2002:a05:6602:1d56:b0:9ac:9ca2:2fe0])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:2518:b0:496:34a:d7e3
 with SMTP id 5614622812f47-4dc5a2bbdb0mr32861b6e.17.1790283687699; Thu, 24
 Sep 2026 14:01:27 -0700 (PDT)
Date: Thu, 24 Sep 2026 21:01:17 +0000
In-Reply-To: <20260924210121.87032-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924210121.87032-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924210121.87032-4-avagin@google.com>
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
2.56.0.rc1.315.gc6ed9934b7-goog

