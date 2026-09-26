Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83253242BE;
	Sat, 26 Sep 2026 01:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790385171; cv=none; b=ZC7vmuuxnEtOcFX+VkddKip6doGWfhLAfNPsEzJn32cCDhfkvpi5o08gf177de7gaBk4Ox98e0BkQ8jkErjnVkYy2xNmg6Ear56a9MIixchKqSzHD5NcUdPv5Gum0BRC4vtwJMDCJcf0YJLUN4WEV1B1yGDsaXpSwPxxidQtSiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790385171; c=relaxed/simple;
	bh=RvBoUfm7zYSTZ2YvLmhP/ozkx7Hu4GaeHEwuP0lYp20=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=qMMw+GQAH9DpRafVEvCuRdxyj+IOzARQ+j/cZDudHS+1LKZ2lSQJDRD/hk8wAW6aDgIl+gPmtrGiJjrgcCrSFEP3dX6NkE+2A44GKKMhMpxZ0rxK0sUMUKppuOXNk5KaaNrHP+uUgdUBscesbokUmIyJ/yBBnk456EKkDkjNO+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UbSdd8Ta; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yfR+Wg5U; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UbSdd8Ta";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yfR+Wg5U"
Date: Sat, 26 Sep 2026 01:12:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790385165;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rg3qkWqwVg26g6Vi1nmSHlw1u6xeQ5DGV4ZqKoR1rY8=;
	b=UbSdd8TawcqGZEooIPUFD5Y0IY0cJ567jBsi1Y2nVHqMTh8TygbsUQDy9//sD0Jz04h8h+
	bT5+tDE+oIY5Dfl1kO2htfXjh8IjIipUbuoAVz7n9/+94DI0w9oMXHsWvnZU5ZnOIPAjc5
	+bX6Fyy3Yje3uGrGgBokUUs66uqwAqbNMgantpYl0/QiMm1ri4PStejlwXxFzMC9XzbZH7
	ui8aW89FGdZJT5hvwHe6/ToeuYnrPaX3t1KrlcMkdstR4YPJUKgqZmxxpN2AuLrYCd0YtG
	LJdFQlucKWBMDL1cDy++XhVRra4/iXkKLz/a4JTJ4ifzLNM8oYroowFETJR+oQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790385165;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rg3qkWqwVg26g6Vi1nmSHlw1u6xeQ5DGV4ZqKoR1rY8=;
	b=yfR+Wg5Unm6linzYTi+5ua0zDjnIgmT33Unnoq74FUO2aeMcrzHZDlEhozteo6QSKMj+RW
	qcRFIVUyRRo4c3DQ==
From: "tip-bot2 for Andrei Vagin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/fpu] x86/fpu: Extract restore_from_ia32_fxstate() and clean
 up fpu__restore_sig()
Cc: Andrei Vagin <avagin@google.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 "Chang S. Bae" <chang.seok.bae@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260925162454.1403405-4-avagin@google.com>
References: <20260925162454.1403405-4-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179038516353.3910103.17487951782791849401.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     6916dec7a02fe0f50d6dc80e5f5c55f11cebd874
Gitweb:        https://git.kernel.org/tip/6916dec7a02fe0f50d6dc80e5f5c55f11ce=
bd874
Author:        Andrei Vagin <avagin@google.com>
AuthorDate:    Fri, 25 Sep 2026 16:24:49=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 25 Sep 2026 12:14:57 -07:00

x86/fpu: Extract restore_from_ia32_fxstate() and clean up fpu__restore_sig()

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

Signed-off-by: Andrei Vagin <avagin@google.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>
Link: https://patch.msgid.link/20260925162454.1403405-4-avagin@google.com
---
 arch/x86/kernel/fpu/signal.c | 56 ++++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index cd7db6d..b9dcd0c 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -325,32 +325,26 @@ retry:
 	return true;
 }
=20
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
+static bool restore_from_ia32_fxstate(void __user *buf_f, void __user *buf_f=
x,
+				      u64 xrestore_mask, bool fx_only)
 {
 	struct task_struct *tsk =3D current;
 	struct fpu *fpu =3D x86_task_fpu(tsk);
 	struct user_i387_ia32_struct env;
-	bool success, fx_only =3D false;
 	union fpregs_state *fpregs;
-	u64 xrestore_mask =3D 0;
-
-	if (use_xsave()) {
-		struct _fpx_sw_bytes fx_sw_user;
-
-		if (!check_xstate_in_sigframe(buf_fx, &fx_sw_user))
-			return false;
-
-		fx_only =3D !fx_sw_user.magic1;
-		xrestore_mask =3D fx_sw_user.xfeatures;
-	} else {
-		xrestore_mask =3D XFEATURE_MASK_FPSSE;
-	}
+	bool success;
=20
-	if (likely(!ia32_fxstate)) {
-		/* Restore the FPU registers directly from user memory. */
-		return restore_fpregs_from_user(buf_fx, xrestore_mask, fx_only);
-	}
+	if (!IS_ENABLED(CONFIG_X86_32) && !IS_ENABLED(CONFIG_IA32_EMULATION))
+		return false;
=20
 	/*
 	 * Copy the legacy state because the FP portion of the FX frame has
@@ -450,10 +444,11 @@ static inline unsigned int xstate_sigframe_size(struct =
fpstate *fpstate)
 bool fpu__restore_sig(void __user *buf, int ia32_frame)
 {
 	struct fpu *fpu =3D x86_task_fpu(current);
-	void __user *buf_fx =3D buf;
+	bool success =3D false, fx_only =3D false;
 	bool ia32_fxstate =3D false;
-	bool success =3D false;
+	void __user *buf_fx =3D buf;
 	unsigned int size;
+	u64 xrestore_mask;
=20
 	if (unlikely(!buf)) {
 		fpu__clear_user_states(fpu);
@@ -482,10 +477,25 @@ bool fpu__restore_sig(void __user *buf, int ia32_frame)
 		success =3D !fpregs_soft_set(current, NULL, 0,
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
+		fx_only =3D !fx_sw_user.magic1;
+		xrestore_mask =3D fx_sw_user.xfeatures;
 	} else {
-		success =3D __fpu_restore_sig(buf, buf_fx, ia32_fxstate);
+		xrestore_mask =3D XFEATURE_MASK_FPSSE;
 	}
=20
+	if (ia32_fxstate)
+		success =3D restore_from_ia32_fxstate(buf, buf_fx, xrestore_mask, fx_only);
+	else
+		success =3D restore_fpregs_from_user(buf_fx, xrestore_mask, fx_only);
 out:
 	if (unlikely(!success))
 		fpu__clear_user_states(fpu);
