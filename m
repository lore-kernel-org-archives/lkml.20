Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2B42D12ED;
	Sun, 30 Aug 2026 06:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788072279; cv=none; b=Z6oecD0oY3CZNnvqUM2GUFAOt2ZbLRVEiV2nPpEstJmu1C7Dqkjo++wDFkEKihaP5s3G0UtGR1AFrWTnaJpaBL7CJmhCPlMiHlqk4FapABoIFGCxojpEwgExsdXHvb73sreWid7FI1UsIaOCMgo8YEhTUYKoIjh8T2U5jPhmpRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788072279; c=relaxed/simple;
	bh=VwsROau0ZKyG09M4l+Rtyi6Mbz4cNj6fRhsXKQVwYRw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Nx/wm1VWrCIFAjzNhobCJS33hO3Kl0sUdpgPle3oYImDZmA3GYc/BRw6SuKSXaTmdXDQNINZQ0lI0qemfrqQvK/iHvaVsh8tz4EZ/jr3EAVSo7FdpMC1zK/x3rVe1fd8DP7eIwI8G71j9lKCNPzKb60sJSL5NlqcJryq2iiI0OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xex/9zMb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=T2aihuH8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xex/9zMb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="T2aihuH8"
Date: Sun, 30 Aug 2026 06:44:29 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788072271;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1InnOoGMaLNZjQfG/BhCp0xkvzCy+Pjij+o1XrJumE0=;
	b=xex/9zMb8b3UW0l82nIRVAABmhIx4x8q3GZM286u0aRV7IhQxAaWKLGSIZqaDHJIcuS4Z1
	UBzS1D0mXnvXqAJsciwKe6UQFmpGepihcZPspbvqVY9r8L30iOgL10UWuz8nQGfMKmuMOc
	+j4j1ofC2lSrTBbwwYEXARqenAQ/ZGth6FUmiaSyE4PBLcokFMicd6DTgYXYzhTVPLZbiM
	9TfG1WXgsxYUlSTHEXtx9WhsS1/o9lPe46GiGtcKvCoUaP+YGuO9sTUt7iqCcR2P2hDlXr
	sec+QXYJuWFDJ6m/e9KhrJynr8xvRd4SIAl7UuJ6upegohqSrbXgWBQ0xoFS0Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788072271;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1InnOoGMaLNZjQfG/BhCp0xkvzCy+Pjij+o1XrJumE0=;
	b=T2aihuH8C3LJZFa+Ow0oONXSCjpQR3jmONzXxpadqc+/QFgOVnUvzmjJpIwHeEMWU6Q76v
	oJHDMtxDLtZYzXBA==
From: "tip-bot2 for Boqun Feng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/urgent] interrupt: Disable interrupt before modifying
 hardirq_disable counter
Cc: Thomas Gleixner <tglx@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Bradley Morgan <brads@mainlining.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260829213412.14303-1-boqun@kernel.org>
References: <20260829213412.14303-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178807226993.3717435.9686654480412551040.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     a155ac8f0c523bd53f412196dcbb104ad1f4595f
Gitweb:        https://git.kernel.org/tip/a155ac8f0c523bd53f412196dcbb104ad1f=
4595f
Author:        Boqun Feng <boqun@kernel.org>
AuthorDate:    Sat, 29 Aug 2026 14:34:12 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 30 Aug 2026 08:39:04 +02:00

interrupt: Disable interrupt before modifying hardirq_disable counter

Currently a softirq may be pending longer then expected if the
triggering interrupt happens in-between hardirq_disable_enter() and
_local_interrupt_disable() in local_interrupt_disable():

    local_interrupt_disable():
      hardirq_disable_enter();
      <interrupt>
      ...
      __irq_exit_rcu():
        // false because hardirq_disable_count() is not 0
        if (.. && !hardirq_disable_count() && ..) {
	  invoke_softirq();
	}
      _local_interrupt_disable();

, it'll defer the softirq to the next interrupt which can be forever.

The order between hardirq_disable_enter() and _local_interrupt_disable()
is to optimize re-disabling interrupts if they are already disabled, but
as 1) local_interrupt_disable() is not widely used yet and 2) the proper
way to achieve this optimization may need fixing up the counter at
entry/exit time [1], so reverse the order for now to avoid the softirq
pending issue.

Because of this fix, the part of saving the current state is separated
from irq disabling, and the logic of local_interrupt_disable() becomes:

    local_irq_save(flags);
    if (counter++ =3D=3D 0) {
      this_cpu(local_interrupt_disable_state) =3D flags;
    }

Therefore change the helper function _local_interrupt_disable() to
_local_interrupt_save_state() which only saves the current irqflags
(when interrupts get disabled the first time).

Fixes: e901c1510e24 ("irq,spin_lock: Add counted interrupt disabling/enabling=
")
Reported-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Link: https://patch.msgid.link/20260829213412.14303-1-boqun@kernel.org
Link: https://lore.kernel.org/lkml/87v78wezid.ffs@fw13/ [1]
Closes: https://lore.kernel.org/lkml/87jypbfu1t.ffs@fw13/
---
 include/linux/interrupt_rc.h | 19 ++++++++-----------
 kernel/softirq.c             | 17 ++++-------------
 2 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
index b9a7f05..e68e1be 100644
--- a/include/linux/interrupt_rc.h
+++ b/include/linux/interrupt_rc.h
@@ -20,11 +20,8 @@
 /* Per-CPU interrupt disabling state for local_interrupt_{disable,enable}().=
 */
 DECLARE_PER_CPU(unsigned long, local_interrupt_disable_state);
=20
-static __always_inline void __local_interrupt_disable(void)
+static __always_inline void __local_interrupt_save_state(unsigned long flags)
 {
-	unsigned long flags;
-
-	local_irq_save(flags);
 	raw_cpu_write(local_interrupt_disable_state, flags);
 }
=20
@@ -36,9 +33,9 @@ static __always_inline void __local_interrupt_enable(void)
 }
=20
 #ifndef INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
-static __always_inline void _local_interrupt_disable(void)
+static __always_inline void _local_interrupt_save_state(unsigned long flags)
 {
-	__local_interrupt_disable();
+	__local_interrupt_save_state(flags);
 }
=20
 static __always_inline void _local_interrupt_enable(void)
@@ -46,27 +43,27 @@ static __always_inline void _local_interrupt_enable(void)
 	__local_interrupt_enable();
 }
 #else
-extern void _local_interrupt_disable(void);
+extern void _local_interrupt_save_state(unsigned long flags);
 extern void _local_interrupt_enable(void);
 #endif
=20
 #else /* !MODULE */
-extern void _local_interrupt_disable(void);
+extern void _local_interrupt_save_state(unsigned long flags);
 extern void _local_interrupt_enable(void);
 #endif /* !MODULE */
=20
 static inline void local_interrupt_disable(void)
 {
 	int new_count;
+	unsigned long flags;
=20
 	WARN_ON_ONCE(in_nmi());
=20
+	local_irq_save(flags);
 	new_count =3D hardirq_disable_enter();
=20
-	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
-
 	if ((new_count & HARDIRQ_DISABLE_MASK) =3D=3D HARDIRQ_DISABLE_OFFSET)
-		_local_interrupt_disable();
+		_local_interrupt_save_state(flags);
 }
=20
 static inline void local_interrupt_enable(void)
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 7980a4a..5d02c36 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -91,11 +91,11 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
=20
 DEFINE_PER_CPU(unsigned long, local_interrupt_disable_state);
=20
-void _local_interrupt_disable(void)
+void _local_interrupt_save_state(unsigned long flags)
 {
-	__local_interrupt_disable();
+	__local_interrupt_save_state(flags);
 }
-EXPORT_SYMBOL(_local_interrupt_disable);
+EXPORT_SYMBOL(_local_interrupt_save_state);
=20
 void _local_interrupt_enable(void)
 {
@@ -749,16 +749,7 @@ static inline void __irq_exit_rcu(void)
 #endif
 	account_hardirq_exit(current);
 	preempt_count_sub(HARDIRQ_OFFSET);
-	/*
-	 * Interrupts may happen between hardirq_disable_enter() and
-	 * local_irq_save() in local_interrupt_disable(), if irq_exit() invokes
-	 * softirq here, we may have a softirq handler calling
-	 * local_interrupt_disable() but it won't disable the IRQ because
-	 * hardirq disabling count is already 1, hence we need to prevent
-	 * invoking softirq when a local_interrupt_disable() is ongoing.
-	 */
-	if (!in_interrupt() && !hardirq_disable_count() &&
-	    local_softirq_pending()) {
+	if (!in_interrupt() && local_softirq_pending()) {
 		/*
 		 * If we left hrtimers unarmed, make sure to arm them now,
 		 * before enabling interrupts to run softirq.
