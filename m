Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0264F85C7;
	Wed, 23 Sep 2026 18:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188586; cv=none; b=apQ8kVxMpS6T9MVA7MrHZvQyZMbsloJwl6U6eIzoRuOQSN8dc4OwyXA3v8lZq9vmmjWGFEPKA78Dkckkw/drLjaMNhRXHcsnuZ3aJ3TCmqed8uO1EdCUo8qNfX10Vhc8VcYJ8QpFUuy3KzoGM2p3rcBuIY2yx59gV9h56+gedm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188586; c=relaxed/simple;
	bh=AZqQo31l0pIGAge7+A9VN/O3rkS67RAzi23WoK2DWvQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=PUQywkL1IwG3SHz0R0XUJKn3NCQz7EY01H1HdLGz4f5BDI0mobXZcNYP/pnZYiDHE859SZVjCerpUDhUR4G+tLUfzv+z6xF+FqDXsR6PeqYDnRU7nsa0D7CnFkt7EMQDJzcHNvxj67BPqzVReUYaGvAoMX2NR0mlRdIvjbzNBtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QPy9h7y7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lw1Oc2Gz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QPy9h7y7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lw1Oc2Gz"
Date: Wed, 23 Sep 2026 18:36:07 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790188570;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6KAB1UUBgc32VG1laLnrWOJDuybn6rpCkSiN+UKPKNE=;
	b=QPy9h7y7fRjqFFhr+mFcmbooDTB5Zaq6mD8HM1NAU3dxiR72J3+2CdKN3aiRQS54KG1Pzl
	MmLOiU5ZpbkF0DyJYj0z28zEdHbds+gRa09CLCG6MQi7o22YI/7OKml1OJIJv2qRHv1F41
	tLHJUc+z5hMgMbXMvwVoJaGw9qggCA3qIIFUUwkpRLbjyHK52Chh4EiV+T/QE0YLDVGFc8
	8Rf75Kah4O9a23IxbAFph51agYIT89DumqkDE4Wu8ywefzgDgp2gKvECC/RjLKo9dcJNB9
	8Zc1hPMOp2gdZggqJyTGfPeDmLutYuaQAhXlAuG341mcB33k8XUHCHNLi157Vg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790188570;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6KAB1UUBgc32VG1laLnrWOJDuybn6rpCkSiN+UKPKNE=;
	b=lw1Oc2Gz/1lps0jPkMjJDERuPDPNLxDWlaB2paZjfwOEtolk/IsB/NreTMKPzog7FKGIol
	r8j1vxE3rYC3FABA==
From: "tip-bot2 for Masami Hiramatsu (Google)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/mce: Fix hardware debug register corruption on
 task migration
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,  <stable@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <179005109564.388919.3937970081044095776.stgit@devnote2>
References: <179005109564.388919.3937970081044095776.stgit@devnote2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179018856795.2819794.6946917329832405467.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     b8d1d5b63a8ef532038eebd9d97d406860385668
Gitweb:        https://git.kernel.org/tip/b8d1d5b63a8ef532038eebd9d97d4068603=
85668
Author:        Masami Hiramatsu (Google) <mhiramat@kernel.org>
AuthorDate:    Tue, 22 Sep 2026 13:24:55 +09:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Wed, 23 Sep 2026 11:28:56 -07:00

x86/mce: Fix hardware debug register corruption on task migration

In exc_machine_check_user(), local_db_save() and local_db_restore() are
invoked in the outer entry stubs (DEFINE_IDTENTRY_MCE_USER,
DEFINE_FREDENTRY_MCE, and DEFINE_IDTENTRY_RAW), surrounding
exc_machine_check_user().

However, exc_machine_check_user() calls irqentry_exit_to_user_mode(), which
handles pending thread work and may schedule() if TIF_NEED_RESCHED is set. If
the task migrates to another CPU during schedule(), local_db_restore() runs on
the new CPU with the dr7 state saved from the old CPU. This corrupts the new
CPU's DR7 hardware debug register and leaves the old CPU's DR7 disabled.  In
short, local_db_save() and local_db_restore() pair must be run on the same
CPU.

To fix this, move local_db_save() and local_db_restore() inside
exc_machine_check_user() and exc_machine_check_kernel(). In
exc_machine_check_user(), DR7 is saved and restored strictly around
do_machine_check() to avoid schedule() during migration. In
exc_machine_check_kernel(), local_db_save() is called at the entry point to
prevent early memory accesses from triggering nested #DB exceptions, and
restored on all exits.

Fixes: cd840e424f27 ("x86/entry, mce: Disallow #DB during #MC")
Assisted-by: LLM
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: <stable@kernel.org>
Link: https://patch.msgid.link/179005109564.388919.3937970081044095776.stgit@=
devnote2
---
 arch/x86/kernel/cpu/mce/core.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index ab46960..39f2389 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2108,6 +2108,9 @@ bool filter_mce(struct mce *m)
 static __always_inline void exc_machine_check_kernel(struct pt_regs *regs)
 {
 	irqentry_state_t irq_state;
+	unsigned long dr7;
+
+	dr7 =3D local_db_save();
=20
 	WARN_ON_ONCE(user_mode(regs));
=20
@@ -2116,20 +2119,26 @@ static __always_inline void exc_machine_check_kernel(=
struct pt_regs *regs)
 	 * mce_check_crashing_cpu() for details.
 	 */
 	if (mca_cfg.initialized && mce_check_crashing_cpu())
-		return;
+		goto out;
=20
 	irq_state =3D irqentry_nmi_enter(regs);
=20
 	do_machine_check(regs);
=20
 	irqentry_nmi_exit(regs, irq_state);
+out:
+	local_db_restore(dr7);
 }
=20
 static __always_inline void exc_machine_check_user(struct pt_regs *regs)
 {
+	unsigned long dr7;
+
 	irqentry_enter_from_user_mode(regs);
=20
+	dr7 =3D local_db_save();
 	do_machine_check(regs);
+	local_db_restore(dr7);
=20
 	irqentry_exit_to_user_mode(regs);
 }
@@ -2138,21 +2147,13 @@ static __always_inline void exc_machine_check_user(st=
ruct pt_regs *regs)
 /* MCE hit kernel mode */
 DEFINE_IDTENTRY_MCE(exc_machine_check)
 {
-	unsigned long dr7;
-
-	dr7 =3D local_db_save();
 	exc_machine_check_kernel(regs);
-	local_db_restore(dr7);
 }
=20
 /* The user mode variant. */
 DEFINE_IDTENTRY_MCE_USER(exc_machine_check)
 {
-	unsigned long dr7;
-
-	dr7 =3D local_db_save();
 	exc_machine_check_user(regs);
-	local_db_restore(dr7);
 }
=20
 #ifdef CONFIG_X86_FRED
@@ -2169,28 +2170,20 @@ DEFINE_IDTENTRY_MCE_USER(exc_machine_check)
  */
 DEFINE_FREDENTRY_MCE(exc_machine_check)
 {
-	unsigned long dr7;
-
-	dr7 =3D local_db_save();
 	if (user_mode(regs))
 		exc_machine_check_user(regs);
 	else
 		exc_machine_check_kernel(regs);
-	local_db_restore(dr7);
 }
 #endif
 #else
 /* 32bit unified entry point */
 DEFINE_IDTENTRY_RAW(exc_machine_check)
 {
-	unsigned long dr7;
-
-	dr7 =3D local_db_save();
 	if (user_mode(regs))
 		exc_machine_check_user(regs);
 	else
 		exc_machine_check_kernel(regs);
-	local_db_restore(dr7);
 }
 #endif
=20
