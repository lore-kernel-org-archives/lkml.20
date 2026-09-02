Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C5D3A0E99;
	Wed,  2 Sep 2026 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335695; cv=none; b=Bx7FqD6jFYsI36SranPqsCutJu5lhNIkUsWjJt+oHkaBZsWMAmDS5kudePhyMy3i1G+i9bRqMJ2ny2g2eWH3GaFTf/Wyndia10ouleIDI8PRh0Mk+mFVJgYjX94vScsgnfIXFZqjYs9uwjVCzd6rYwDH1ScU89o2+zIheuNFJFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335695; c=relaxed/simple;
	bh=3ONZfadA4HP8b9RLscu3UxXlLv5Y+vV07MSurob3phI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=TMkziQybD9o3IIBhkX2URSwJlR0LodBNnEUgdINunPmiOYHVtYfWCYU9ZY+NCMECgs8ywURworOl+p5fhR1P4TWHmyMkSBsXTDom9nEhuxm+qu1gDcvIm3wqYtyZfZ+kFP+Sf71rv4sGo5a+Nx5z5nkdKx72uu7pyx5E2MD5BHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Vj+rJKuW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ge/K2Olj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Vj+rJKuW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ge/K2Olj"
Date: Wed, 02 Sep 2026 07:54:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788335691;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w849ujDzIxFf1gKWuCBgIAk3pOCsC79AebHPpoSy3c8=;
	b=Vj+rJKuW9vMfn0amA1ZJke96Klla01TmEDEMnTMnn1DPALJMSsr4RJEfSco1nTtjFkx7LG
	GcmXdUinQuBeh9upngrbat+xT4oWL7xbAXCaKh3sjlltUR9AZvFGslyKTdd262RQpGA6QW
	V1CM41PWonRJPH/lBDbcK+J90Fxszreo9cdZLW+RDwBkloGvcxY5bRZUNYug8fnkGG7eKV
	ixnkIlx6F85kp+GeXn1KotFoEblqGaBDbOudugChTZxdRbEBfwGRwxaxFF4TB9yWwlE6dE
	Ltjw1wUy83vy1n0E9v7WVbMqnmSc7RKL5jhpn0x+iU9ar/TjRGZ4q9jy/y45wA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788335691;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w849ujDzIxFf1gKWuCBgIAk3pOCsC79AebHPpoSy3c8=;
	b=ge/K2Olj5qqJWHq1H/PXElQWJtDj1lsPpSDbT+lapDMTrpcO4sanUYNqcgrJMUeTbjR5y9
	AbznfhGTQr24RmBg==
From: "tip-bot2 for Mark Rutland" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched: dynamic: Simplify irqentry_exit_cond_resched()
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Mete Durlu <meted@linux.ibm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260803191731.3244294-5-mark.rutland@arm.com>
References: <20260803191731.3244294-5-mark.rutland@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833568940.3717435.8240283789106719999.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     aa4178f63847f86e3b27b9e53ee8ccbd6ed6bf8c
Gitweb:        https://git.kernel.org/tip/aa4178f63847f86e3b27b9e53ee8ccbd6ed=
6bf8c
Author:        Mark Rutland <mark.rutland@arm.com>
AuthorDate:    Mon, 03 Aug 2026 20:17:29 +01:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:37:23 +02:00

sched: dynamic: Simplify irqentry_exit_cond_resched()

PREEMPT_DYNAMIC is now limited to the FULL and LAZY preemption models.
In either model, irqentry_exit_cond_resched() is always called and never
disabled.

Remove the unnecessary code for this when PREEMPT_DYNAMIC is selected.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Mete Durlu <meted@linux.ibm.com>
Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
Link: https://patch.msgid.link/20260803191731.3244294-5-mark.rutland@arm.com
---
 include/linux/irq-entry-common.h | 17 +----------------
 kernel/entry/common.c            | 17 ++---------------
 kernel/sched/core.c              |  7 -------
 3 files changed, 3 insertions(+), 38 deletions(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-commo=
n.h
index 0bb6c03..2be273b 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -346,22 +346,7 @@ typedef struct irqentry_state {
  *
  * Conditional reschedule with additional sanity checks.
  */
-void raw_irqentry_exit_cond_resched(void);
-
-#ifdef CONFIG_PREEMPT_DYNAMIC
-#if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
-#define irqentry_exit_cond_resched_dynamic_enabled	raw_irqentry_exit_cond_re=
sched
-#define irqentry_exit_cond_resched_dynamic_disabled	NULL
-DECLARE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resch=
ed);
-#define irqentry_exit_cond_resched()	static_call(irqentry_exit_cond_resched)=
()
-#elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
-DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void);
-#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
-#endif
-#else /* CONFIG_PREEMPT_DYNAMIC */
-#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
-#endif /* CONFIG_PREEMPT_DYNAMIC */
+void irqentry_exit_cond_resched(void);
=20
 /**
  * irqentry_enter_from_kernel_mode - Establish state before invoking the irq=
 handler
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e3d381f..e234b04 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -123,7 +123,7 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *r=
egs)
 /**
  * arch_irqentry_exit_need_resched - Architecture specific need resched func=
tion
  *
- * Invoked from raw_irqentry_exit_cond_resched() to check if resched is need=
ed.
+ * Invoked from irqentry_exit_cond_resched() to check if resched is needed.
  * Defaults return true.
  *
  * The main purpose is to permit arch to avoid preemption of a task from an =
IRQ.
@@ -134,7 +134,7 @@ static inline bool arch_irqentry_exit_need_resched(void);
 static inline bool arch_irqentry_exit_need_resched(void) { return true; }
 #endif
=20
-void raw_irqentry_exit_cond_resched(void)
+void irqentry_exit_cond_resched(void)
 {
 	if (!preempt_count()) {
 		/* Sanity check RCU and thread stack */
@@ -145,19 +145,6 @@ void raw_irqentry_exit_cond_resched(void)
 			preempt_schedule_irq();
 	}
 }
-#ifdef CONFIG_PREEMPT_DYNAMIC
-#if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
-DEFINE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resche=
d);
-#elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
-DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void)
-{
-	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
-		return;
-	raw_irqentry_exit_cond_resched();
-}
-#endif
-#endif
=20
 noinstr void irqentry_exit(struct pt_regs *regs, irqentry_state_t state)
 {
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 844f374..0e9022f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7849,9 +7849,6 @@ EXPORT_SYMBOL(__cond_resched_rwlock_write);
 # endif
=20
 /*
- * SC:irqentry_exit_cond_resched
- *
- *
  * NONE:
  *   (unselectable)
  *
@@ -7859,11 +7856,9 @@ EXPORT_SYMBOL(__cond_resched_rwlock_write);
  *   (unselectable)
  *
  * FULL:
- *   irqentry_exit_cond_resched <- irqentry_exit_cond_resched
  *   dynamic_preempt_lazy       <- false
  *
  * LAZY:
- *   irqentry_exit_cond_resched <- irqentry_exit_cond_resched
  *   dynamic_preempt_lazy       <- true
  */
=20
@@ -7907,14 +7902,12 @@ static void __sched_dynamic_update(int mode)
 {
 	switch (mode) {
 	case preempt_dynamic_full:
-		preempt_dynamic_enable(irqentry_exit_cond_resched);
 		preempt_dynamic_key_disable(preempt_lazy);
 		if (mode !=3D preempt_dynamic_mode)
 			pr_info("Dynamic Preempt: full\n");
 		break;
=20
 	case preempt_dynamic_lazy:
-		preempt_dynamic_enable(irqentry_exit_cond_resched);
 		preempt_dynamic_key_enable(preempt_lazy);
 		if (mode !=3D preempt_dynamic_mode)
 			pr_info("Dynamic Preempt: lazy\n");
