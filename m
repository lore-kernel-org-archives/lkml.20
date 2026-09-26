Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329EA262D0B;
	Sat, 26 Sep 2026 01:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790385171; cv=none; b=kxKaYMug1xiWaGgSG2tfJ5MjIAHI6mfQg7Npefhg4bafZqgg47AJDzmbLaiVoU9GmW9HVBfTFZMRjHCKSs4Gs6EgRu1pBoGzfbFMsaZjSqOKhkmKaWmYa4VvA2DMeEUGP2u7cTUzG5SxbjA8ptR/p+GzjrRpm+4mZPYb1YpnLDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790385171; c=relaxed/simple;
	bh=jAX8xyUxcaKKiAKkRmFpdAJNZekb5318sPEUwshp57Q=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ABu6I8prtk/BbaTtO/CUtiBWiHCvEiDwN/cjTlffljK41YRMum3rS8V7EpYq+tSO+UEwEJin/IygAYeWiQ0WyGHnMbDpAYVcClRJmQobUdIgd8fjwzcQGNWcToTvaiy63mz/j2Sk2O93kuHLxKwoq8ebslKcATk3DiXGsE9KoKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Lh8RGg7S; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=P4OgWfnD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Lh8RGg7S";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P4OgWfnD"
Date: Sat, 26 Sep 2026 01:12:44 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790385166;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pEmBsqW76XP41GSNtN0qOBHUVdaNWlP2Xpy3if826ko=;
	b=Lh8RGg7Sf1GAXgxH5lSCjWqcgknClHjRUBg2ep4kTU1p1gHM0WhEApirEp/pVer6OJhVVe
	vl1ukx9KCDTF5sak2F/Ls9N0jQYlCK5y9ESNvonCDKwJGJSKA6daXDCvHbWxbd/yyIiXTB
	GVrYggqAloyRI0z80fXmi2QfkTDz8hUIIDUnuyGAenhQMxSA8Q5QlQ0HtJosSNp3gk6hEA
	FOzFCtSy6UJorESLGEl8NCvaQWt/6zfHp/moS3ZRPNecJBgr4NK9OeK0IH+luKg+GIr6ve
	8Q1euMIEUlRg8cmQc7h6j9+1T31Og+Rwg5QpcZVOAbiecX9fismHPyVPyQOfmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790385166;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pEmBsqW76XP41GSNtN0qOBHUVdaNWlP2Xpy3if826ko=;
	b=P4OgWfnDAYZzFw7w4CwAwcTREseRDkI/MXn1u2It2R3AoGqFvPCt7F5WRiu8lvf8O4k7av
	gxkz4Xi6EfDrfnCg==
From: "tip-bot2 for Andrei Vagin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/fpu] x86/fpu: Clean up and rename variables in signal frame
 handling
Cc: Ingo Molnar <mingo@kernel.org>, Andrei Vagin <avagin@google.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260925162454.1403405-3-avagin@google.com>
References: <20260925162454.1403405-3-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179038516494.3910103.1876876389004612306.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     344907fab5fdf2ab908e5d2f456cda87a51e9497
Gitweb:        https://git.kernel.org/tip/344907fab5fdf2ab908e5d2f456cda87a51=
e9497
Author:        Andrei Vagin <avagin@google.com>
AuthorDate:    Fri, 25 Sep 2026 16:24:48=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 25 Sep 2026 12:09:09 -07:00

x86/fpu: Clean up and rename variables in signal frame handling

Clean up signal frame handling code by renaming several variables for
clarity and consistency, and moving masking logic closer to its usage.

- Rename 'fxbuf' to 'buf_fx' in check_xstate_in_sigframe() for consistency.
- Rename label 'setfx' to 'err_setfx' in check_xstate_in_sigframe() to
  indicate it is an error path.
- In __restore_fpregs_from_user(), rename 'ufeatures' to 'task_xfeatures'
  and 'xrestore' to 'xrestore_mask'.
- Move the masking logic 'xrestore_mask &=3D task_xfeatures' from
  restore_fpregs_from_user() into __restore_fpregs_from_user().
- Rename 'xrestore' to 'xrestore_mask' in restore_fpregs_from_user() to
  match the name in __restore_fpregs_from_user() and __fpu_restore_sig().
- In __fpu_restore_sig(), rename 'buf' to 'buf_f' to distinguish it from
  'buf_fx', and 'user_xfeatures' to 'xrestore_mask'.

No functional changes.

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Andrei Vagin <avagin@google.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Link: https://patch.msgid.link/20260925162454.1403405-3-avagin@google.com
---
 arch/x86/kernel/fpu/signal.c | 41 +++++++++++++++++------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index 33e1284..cd7db6d 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -24,15 +24,15 @@
  * Check for the presence of extended state information in the
  * user fpstate pointer in the sigcontext.
  */
-static inline bool check_xstate_in_sigframe(struct fxregs_state __user *fxbu=
f,
+static inline bool check_xstate_in_sigframe(struct fxregs_state __user *buf_=
fx,
 					    struct _fpx_sw_bytes *fx_sw)
 {
 	int min_xstate_size =3D sizeof(struct fxregs_state) +
 			      sizeof(struct xstate_header);
-	void __user *fpstate =3D fxbuf;
+	void __user *fpstate =3D buf_fx;
 	unsigned int magic2;
=20
-	if (__copy_from_user(fx_sw, &fxbuf->sw_reserved[0], sizeof(*fx_sw)))
+	if (__copy_from_user(fx_sw, &buf_fx->sw_reserved[0], sizeof(*fx_sw)))
 		return false;
=20
 	/* Check for the first magic field and other error scenarios. */
@@ -40,7 +40,7 @@ static inline bool check_xstate_in_sigframe(struct fxregs_s=
tate __user *fxbuf,
 	    fx_sw->xstate_size < min_xstate_size ||
 	    fx_sw->xstate_size > x86_task_fpu(current)->fpstate->user_size ||
 	    fx_sw->xstate_size > fx_sw->extended_size)
-		goto setfx;
+		goto err_setfx;
=20
 	/*
 	 * Check for the presence of second magic word at the end of memory
@@ -53,7 +53,7 @@ static inline bool check_xstate_in_sigframe(struct fxregs_s=
tate __user *fxbuf,
=20
 	if (likely(magic2 =3D=3D FP_XSTATE_MAGIC2))
 		return true;
-setfx:
+err_setfx:
 	trace_x86_fpu_xstate_check_failed(x86_task_fpu(current));
=20
 	/* Set the parameters for fx only state */
@@ -240,15 +240,18 @@ retry:
 	return true;
 }
=20
-static int __restore_fpregs_from_user(void __user *buf, u64 ufeatures,
-				      u64 xrestore, bool fx_only)
+static int __restore_fpregs_from_user(void __user *buf, u64 task_xfeatures,
+				      u64 xrestore_mask, bool fx_only)
 {
 	if (use_xsave()) {
-		u64 init_bv =3D ufeatures & ~xrestore;
+		u64 init_bv;
 		int ret;
=20
+		/* Restore enabled features only. */
+		xrestore_mask &=3D task_xfeatures;
+		init_bv =3D task_xfeatures & ~xrestore_mask;
 		if (likely(!fx_only))
-			ret =3D xrstor_from_user_sigframe(buf, xrestore);
+			ret =3D xrstor_from_user_sigframe(buf, xrestore_mask);
 		else
 			ret =3D fxrstor_from_user_sigframe(buf);
=20
@@ -266,20 +269,18 @@ static int __restore_fpregs_from_user(void __user *buf,=
 u64 ufeatures,
  * Attempt to restore the FPU registers directly from user memory.
  * Pagefaults are handled and any errors returned are fatal.
  */
-static bool restore_fpregs_from_user(void __user *buf, u64 xrestore, bool fx=
_only)
+static bool restore_fpregs_from_user(void __user *buf, u64 xrestore_mask, bo=
ol fx_only)
 {
 	struct fpu *fpu =3D x86_task_fpu(current);
 	int ret;
=20
-	/* Restore enabled features only. */
-	xrestore &=3D fpu->fpstate->user_xfeatures;
 retry:
 	fpregs_lock();
 	/* Ensure that XFD is up to date */
 	xfd_update_state(fpu->fpstate);
 	pagefault_disable();
 	ret =3D __restore_fpregs_from_user(buf, fpu->fpstate->user_xfeatures,
-					 xrestore, fx_only);
+					 xrestore_mask, fx_only);
 	pagefault_enable();
=20
 	if (unlikely(ret)) {
@@ -324,7 +325,7 @@ retry:
 	return true;
 }
=20
-static bool __fpu_restore_sig(void __user *buf, void __user *buf_fx,
+static bool __fpu_restore_sig(void __user *buf_f, void __user *buf_fx,
 			      bool ia32_fxstate)
 {
 	struct task_struct *tsk =3D current;
@@ -332,7 +333,7 @@ static bool __fpu_restore_sig(void __user *buf, void __us=
er *buf_fx,
 	struct user_i387_ia32_struct env;
 	bool success, fx_only =3D false;
 	union fpregs_state *fpregs;
-	u64 user_xfeatures =3D 0;
+	u64 xrestore_mask =3D 0;
=20
 	if (use_xsave()) {
 		struct _fpx_sw_bytes fx_sw_user;
@@ -341,14 +342,14 @@ static bool __fpu_restore_sig(void __user *buf, void __=
user *buf_fx,
 			return false;
=20
 		fx_only =3D !fx_sw_user.magic1;
-		user_xfeatures =3D fx_sw_user.xfeatures;
+		xrestore_mask =3D fx_sw_user.xfeatures;
 	} else {
-		user_xfeatures =3D XFEATURE_MASK_FPSSE;
+		xrestore_mask =3D XFEATURE_MASK_FPSSE;
 	}
=20
 	if (likely(!ia32_fxstate)) {
 		/* Restore the FPU registers directly from user memory. */
-		return restore_fpregs_from_user(buf_fx, user_xfeatures, fx_only);
+		return restore_fpregs_from_user(buf_fx, xrestore_mask, fx_only);
 	}
=20
 	/*
@@ -356,7 +357,7 @@ static bool __fpu_restore_sig(void __user *buf, void __us=
er *buf_fx,
 	 * to be ignored for histerical raisins. The legacy state is folded
 	 * in once the larger state has been copied.
 	 */
-	if (__copy_from_user(&env, buf, sizeof(env)))
+	if (__copy_from_user(&env, buf_f, sizeof(env)))
 		return false;
=20
 	/*
@@ -420,7 +421,7 @@ static bool __fpu_restore_sig(void __user *buf, void __us=
er *buf_fx,
 		 *
 		 * Preserve supervisor states!
 		 */
-		u64 mask =3D user_xfeatures | xfeatures_mask_supervisor();
+		u64 mask =3D xrestore_mask | xfeatures_mask_supervisor();
=20
 		fpregs->xsave.header.xfeatures &=3D mask;
 		success =3D !os_xrstor_safe(fpu->fpstate,
