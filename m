Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC2C2EEE8C;
	Sat, 26 Sep 2026 01:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790385164; cv=none; b=rQp5pM+iiaZPC/lil+IGKZOASWE0qkS+SS+7NXJPFa4BQSmDPTGRuo3tZLJJHMPkWhvINE19xfCkGtSUp7WG/+vYWRY2EZTEdKdbdvbfFjk9DJd5lSmFSIewGZZwLq9Zj9L29SAo+W5mcpIsdNVwvvUMnfdjQbKYCHsuMvfppRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790385164; c=relaxed/simple;
	bh=wUjm1tJrsDq5J48U6owIH3KOMv3gYShsVAvtNpmLY8Y=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Gx49X4u5OydbY2bUWx3Jx418ZrQEasxQq8Uk5JZbQU2d5gxte2wwBd1KTQx8iXPpjSgpSmg3I+VjudR6ELBitTYsOjbhE1yFg+kEdg6s6esd3s1PywvfLr86YofDrX8h2phqkqySVrBDUY5S0Tr0ja0kDGN9iz/ce54jdrPOPfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ThT8U0xo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bh3pcEmy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ThT8U0xo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bh3pcEmy"
Date: Sat, 26 Sep 2026 01:12:38 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790385160;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pEU08s5PO3nuNPfRDHwVxWYtD0IMxN0vLTOflcqr6J4=;
	b=ThT8U0xo3Sn3ER7bDggIYhX/t0EEDim0IYfDfJFEFpyMqDhx++xvQH20re6PdflfQlfhmt
	m2XT+7Xu/h/xMuoVuyEgAQyhTRV+eF/YW0pAsKB+z6XMzu8JJ8XGhutYl+ke2eJfRgnTA/
	I65ul9q/ILvuG0xaObKjg9hUSR1FPZEdJZ7+Y5CyiJqCU8F47McGYeGXpAo1d5acliEnjW
	l+r886/KqSHEiG5jrbP3THJZRt+lyPaJoLKxaU2+PKdFzSDfGFW+AS0ci4+oKL8HAM6fnG
	QxTl2EBtUHnbwTMJmVEzSJHl84ZcUn3nAy3+idcpwjU/Teumft1kKBUBJt/iOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790385160;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pEU08s5PO3nuNPfRDHwVxWYtD0IMxN0vLTOflcqr6J4=;
	b=bh3pcEmyUw5SmyCp9IJskr+Crm05hcU9o5IeOe46nGMkRbxrBs/4j+GBo6Qw6ANCrr5F7v
	aKQGYkTjoADOR2AA==
From: "tip-bot2 for Andrei Vagin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/fpu] x86/fpu: Pre-fault only required size of xstate buffer
Cc: Andrei Vagin <avagin@google.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 "Chang S. Bae" <chang.seok.bae@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260925162454.1403405-7-avagin@google.com>
References: <20260925162454.1403405-7-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179038515895.3910103.7057662521658607606.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     fd14edd82077b8655273b6d32503903a2ee35ffd
Gitweb:        https://git.kernel.org/tip/fd14edd82077b8655273b6d32503903a2ee=
35ffd
Author:        Andrei Vagin <avagin@google.com>
AuthorDate:    Fri, 25 Sep 2026 16:24:52=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 25 Sep 2026 12:26:05 -07:00

x86/fpu: Pre-fault only required size of xstate buffer

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

Signed-off-by: Andrei Vagin <avagin@google.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>
Link: https://patch.msgid.link/20260925162454.1403405-7-avagin@google.com
---
 arch/x86/include/asm/fpu/xstate.h |  2 ++-
 arch/x86/kernel/fpu/signal.c      | 38 ++++++++++++++++++++++--------
 arch/x86/kernel/fpu/xstate.c      |  2 +-
 3 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/fpu/xstate.h b/arch/x86/include/asm/fpu/xst=
ate.h
index 7a7dc9d..33343e5 100644
--- a/arch/x86/include/asm/fpu/xstate.h
+++ b/arch/x86/include/asm/fpu/xstate.h
@@ -111,6 +111,8 @@ int xfeature_size(int xfeature_nr);
 void xsaves(struct xregs_state *xsave, u64 mask);
 void xrstors(struct xregs_state *xsave, u64 mask);
=20
+unsigned int xstate_calculate_size(u64 xfeatures, bool compacted);
+
 int xfd_enable_feature(u64 xfd_err);
=20
 #ifdef CONFIG_X86_64
diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index d56819f..594ba36 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -27,9 +27,10 @@
 static inline bool check_xstate_in_sigframe(struct fxregs_state __user *buf_=
fx,
 					    struct _fpx_sw_bytes *fx_sw)
 {
+	struct fpstate *fpstate =3D x86_task_fpu(current)->fpstate;
 	int min_xstate_size =3D sizeof(struct fxregs_state) +
 			      sizeof(struct xstate_header);
-	void __user *fpstate =3D buf_fx;
+	void __user *buf =3D buf_fx;
 	unsigned int magic2;
=20
 	if (__copy_from_user(fx_sw, &buf_fx->sw_reserved[0], sizeof(*fx_sw)))
@@ -38,8 +39,8 @@ static inline bool check_xstate_in_sigframe(struct fxregs_s=
tate __user *buf_fx,
 	/* Check for the first magic field and other error scenarios. */
 	if (fx_sw->magic1 !=3D FP_XSTATE_MAGIC1 ||
 	    fx_sw->xstate_size < min_xstate_size ||
-	    fx_sw->xstate_size > x86_task_fpu(current)->fpstate->user_size ||
-	    fx_sw->xstate_size > fx_sw->extended_size)
+	    fx_sw->xstate_size > fpstate->user_size ||
+	    fx_sw->extended_size < fx_sw->xstate_size + FP_XSTATE_MAGIC2_SIZE)
 		goto err_setfx;
=20
 	/*
@@ -48,11 +49,27 @@ static inline bool check_xstate_in_sigframe(struct fxregs=
_state __user *buf_fx,
 	 * fpstate layout with out copying the extended state information
 	 * in the memory layout.
 	 */
-	if (__get_user(magic2, (__u32 __user *)(fpstate + fx_sw->xstate_size)))
+	if (__get_user(magic2, (__u32 __user *)(buf + fx_sw->xstate_size)))
 		return false;
+	if (unlikely(magic2 !=3D FP_XSTATE_MAGIC2))
+		goto err_setfx;
=20
-	if (likely(magic2 =3D=3D FP_XSTATE_MAGIC2))
-		return true;
+	if (fx_sw->xstate_size !=3D fpstate->user_size ||
+	    fx_sw->xfeatures !=3D fpstate->user_xfeatures) {
+		unsigned int xsize;
+		u64 xfeatures;
+
+		/* Calculate size of enabled features only. */
+		xfeatures =3D fx_sw->xfeatures & fpstate->user_xfeatures;
+
+		xsize =3D xstate_calculate_size(xfeatures, false);
+		if (fx_sw->xstate_size < xsize)
+			return false;
+
+		fx_sw->xstate_size =3D xsize;
+	}
+
+	return true;
 err_setfx:
 	/*
 	 * The fallback to FX-only state is used to preserve backward
@@ -277,7 +294,8 @@ static int __restore_fpregs_from_user(void __user *buf, u=
64 task_xfeatures,
  * Attempt to restore the FPU registers directly from user memory.
  * Pagefaults are handled and any errors returned are fatal.
  */
-static bool restore_fpregs_from_user(void __user *buf, u64 xrestore_mask, bo=
ol fx_only)
+static bool restore_fpregs_from_user(void __user *buf, u64 xrestore_mask,
+				     bool fx_only, size_t xstate_size)
 {
 	struct fpu *fpu =3D x86_task_fpu(current);
 	int ret;
@@ -311,7 +329,7 @@ retry:
 		if (ret !=3D X86_TRAP_PF)
 			return false;
=20
-		if (!fault_in_readable(buf, fpu->fpstate->user_size))
+		if (!fault_in_readable(buf, xstate_size))
 			goto retry;
 		return false;
 	}
@@ -496,14 +514,16 @@ bool fpu__restore_sig(void __user *buf, int ia32_frame)
=20
 		fx_only =3D !fx_sw_user.magic1;
 		xrestore_mask =3D fx_sw_user.xfeatures;
+		size =3D fx_sw_user.xstate_size;
 	} else {
 		xrestore_mask =3D XFEATURE_MASK_FPSSE;
+		size =3D fpu->fpstate->user_size;
 	}
=20
 	if (ia32_fxstate)
 		success =3D restore_from_ia32_fxstate(buf, buf_fx, xrestore_mask, fx_only);
 	else
-		success =3D restore_fpregs_from_user(buf_fx, xrestore_mask, fx_only);
+		success =3D restore_fpregs_from_user(buf_fx, xrestore_mask, fx_only, size);
 out:
 	if (unlikely(!success))
 		fpu__clear_user_states(fpu);
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index efa7879..a2b6ede 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -587,7 +587,7 @@ static bool __init check_xstate_against_struct(int nr)
 	return true;
 }
=20
-static unsigned int xstate_calculate_size(u64 xfeatures, bool compacted)
+unsigned int xstate_calculate_size(u64 xfeatures, bool compacted)
 {
 	unsigned int topmost, offset, i;
=20
