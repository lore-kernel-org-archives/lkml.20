Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646260;
	b=OsBQMUUmENamGP1nSHsATHYoZ4QormgmgIRAHMc+drWAnW/SNwEFspLdR9EbDOAHlK1y
	 3f7WukDsQYvdyDanjlH/XYgf4ptMSytM6+dv7b7Eqw1TDQV5qfH9Dvwx+bp154M1Ra3rX
	 W+rAGQfxFfX7HWtfZdrWTLfo8G+zjA9fvYBd7wi5JWCGoVge0NKDvObkWEyatoT9AVnBt
	 XgBvh1BBPtqns2QQaHnknlVAsXlQ5+BRrXFlUDqXSVM3kKo/bLKSzBW4TCxdwuk0TrV4v
	 U4NKO4IPVPIWnhiyUpWu7Zj7n6sy0b/MqXOjIzBnfoqc4nRIcSpoSGGalbh4mw8oW1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yI/KRMuZRPijWcltjKclweO2FOu/JT/OWUV8SsmHo1Y=;
	b=hZNnkzu1IOnSWSqJews+yJpUqG3kC7IYo4UoFJNKrsf9YAXJcJWOCpHMjjWzfuvHcgzt
	 WrEIBQauGJLzQxhvJhfgB2e7NZ/ZOfpLxUpjjroQTSItn9lB/2/zCgjc2vzo2csWRjuar
	 8CgxAgGtu7nH9f7EsCX3BZW1AI1Xbz/itnfBz5kwlKa60cEB9mBa8jTMwUuvWHsnXJd5t
	 antHIMoRCL3+oLEi5happyPY71FR52aCB97egy3UUw6POEyDUE+YGXIWFJ6/HxBs1JWbK
	 19rrbf4gkcZ6mU/HI1mYpv20YVfcxRanmIb5N4iq8MRRRHy9OaByey0rU0Xp5ypBf+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qI8Dm1lc;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A419F606A332
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A419F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qI8Dm1lc
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so9975075e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646258; x=1793251058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yI/KRMuZRPijWcltjKclweO2FOu/JT/OWUV8SsmHo1Y=;
        b=qI8Dm1lc6l4Pm124YVTo0ElbcftWuaEQ4GUynWy9sON0zmFKegF1hgN/8G0IXY5sNz
         i3tk9CDskvKX7y4UqVoiblcDq6ju1fpVmO/jKOtZpM2j9CIJmFUOLYcuZVP3eSvzgIiW
         WnlIJ9lm6R/XwfcfwIAkdK3NpVRLXGW05c4emxzVr5SPkYM6ivtHtodRLZ2W52iBdoMR
         D033B8ZVWX3dzDj7cK4rAQlVRRMnEDvBrtxHoVVDBa/BTfXcrv7ObYbCrvHjaxSXL3ZZ
         0F3154PeUwnYQJPZOkffD1b06f2onhTKkNudOsZdNQ+sfKqznFIqV8dzf2eWkbbWx4qC
         oHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646258; x=1793251058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yI/KRMuZRPijWcltjKclweO2FOu/JT/OWUV8SsmHo1Y=;
        b=gd60BCET6UoxTrma8U1X7UuGXPUuqau++jSd5IgIc86irzm7xRF8gnsdq96sDu+AUi
         jbBBnzrKBJ3yP9lK/fbHB9KBqKpstHqK77CgAXtMJToqYxKFbIUTSSR//EszDO6B2GNZ
         IRCgrBtb+L4UPRdwzObHNk1oVEwI//QkeDn3p7f+7Bn6QGzPbyGyFjpykxand9duMqqd
         eSwI4+BpIsTiGDlJ9CasI3Ve4GXlcIwKhjKpuzVYOscCAny3xJH/IyIwDrs/fmDLdgtg
         IeaUIE2XbTR41CoAbDiOUP2p50C3EyhLMAA67lTj0woGwlk5ow8fZ3CioBoyp5J8uWYd
         gGKg==
X-Forwarded-Encrypted: i=1; AKwUvBwPEc+PMDc6W6/h4ZRsx3lh6zCP5npVdp8u54IB3yyecJ3fJZKBAxJsfJz4Q3exEZR5AYb4cQIA1ZbKa3g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMIqjow9hLLK6rmN5Tx+5GJTq1chTHQ2k0i/8XNkafX5jTnNAB
	5+gU+9yvkUWATQnVO7ArYOkjMEW7Hci+fKv/hPFp5xdhAfJT04LQ02Pv
X-Gm-Gg: AYBFou06I0fRBtukoGo26niEcE+k+JBr+uNm9S6o/bsKbOuILDrj7LjpvOcBDG5AptL
	o8fwcDlfarKartyRhbOVG4s35xP7zNLkAjlPj9JAdeMn66Y9gP5zl1Z4vF5yLNccWW83+WQsepW
	pbOPqs0KVkhom5cuZrTxbG7W9UBud1gGyt18U40zl9m0icP5Op7NcdS1XmgbRQT3MKeUi7Tsk+y
	qP5RgiaZZfKLBdG+swGB/mu6Gcy4gMTIni402zYv1F2PL4f9O/EQhbqPb2y/g++Y2xQgc1r78uN
	d7gSsWuMwVQXDOX68DkV4W0musLVoFkOPX9EpqdeXpM8SNzOcGXb9YJ1rqkpEPcBPULf1RtER7R
	KYukNPpz3XstLWFZ9RtQGeiOkS7d/Id51Rg6qUZfxRgSiKWn8tIZVRhoin0M2Qsy0RGFbb3PE94
	U4bdj1QrUwn4v6WNp8uiAJJCB3cYWK7Gtmg0Z3XGW6TYRwLkpmwgazF49rKuLLg4btM76N/LKhO
	sDPEKGRHZToyrFnHLzT1M3WW0WlHGc/pVPjbueOqkVRREytGanmT/TWWQRy0aGnpnM682IB/l8r
	JoRRSnnivVBmZyckY5uwL1fDF/MGCcfFnnAXWi33vIcA1HYXGjzQCk3/bCDr5Z/290GMMXiI+QX
	1CfggC1xRMZvFFeqSoeDMcYGNBZxGpNLJbBgGiXRRe7qOGmPqMt8bjMw3Dh9euCvRq7mCO+p2Kg
	0fKbxl
X-Received: by 2002:a05:600c:1f88:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4a1fdd15bc6mr83285535e9.31.1792646257872;
        Wed, 21 Oct 2026 22:17:37 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:37 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 08/12] entry: Classify ordinary hardirq return-tail work as hardirq context
Date: Thu, 22 Oct 2026 07:16:50 +0200
Message-Id: <20261022051654.79224-9-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An ordinary hardirq removes its original count and lockdep state before the
return path may preempt. Traceable return-tail callbacks then appear to run
in the interrupted task or softirq context and can collide with recursion
state owned by that context.

Use the saved ordinary-hardirq provenance to restore only preempt-count and
lockdep classification after the preemption decision. Keep it across
traceable return-tail work, deferred hrtimer rearming, IRQ-on preparation,
and context-tracking preparation.

Before removing the raw tail state, prepare the count and lockdep teardown
and close late regular or forced-thread softirq work. Complete any pending
RCU quiescent-state transition only after that raw teardown.

Do not repeat interrupt accounting, RCU or tick entry. Existing non-hardirq
return paths remain unchanged.

Assisted-by: LLM
---
 include/linux/hardirq.h          |  5 +++
 include/linux/irq-entry-common.h | 59 ++++++++++++++++++++++++++++++--
 kernel/softirq.c                 | 18 ++++++++++
 3 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
index ad27a06c859a0..a120e3756d076 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -27,6 +27,7 @@ static __always_inline void rcu_irq_enter_check_tick(void)
 
 void irq_enter_rcu_preempt_counted(void);
 bool irq_exit_rcu_preempt_counted_prepare(void);
+void noinstr irqentry_hardirq_tail_exit(void);
 
 /*
  * Prepare every potentially instrumentable part of hardirq teardown before
@@ -37,6 +38,10 @@ static __always_inline bool irqentry_hardirq_exit_prepare(void)
 {
 	bool do_sub;
 
+	/*
+	 * Preempt-on tracing can raise deferred work. The caller must perform
+	 * the final worker closure before removing the raw hardirq count.
+	 */
 	do_sub = preempt_count_sub_prepare(HARDIRQ_OFFSET);
 	lockdep_hardirq_exit_prepare();
 	return do_sub;
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 2ed637cf66b0c..c6bdd5a2522e8 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -355,6 +355,28 @@ typedef struct irqentry_state {
 
 irqentry_state_t noinstr irqentry_hardirq_enter(struct pt_regs *regs);
 
+/**
+ * irqentry_hardirq_tail_enter - Restore ordinary-hardirq return-tail state
+ * @state: Return value from the matching irqentry_hardirq_enter()
+ *
+ * Restore only the hardirq classification which traceable return-tail work
+ * needs. Accounting, RCU and tick handling belong to the completed interrupt
+ * and must not be repeated here.
+ */
+static __always_inline void
+irqentry_hardirq_tail_enter(irqentry_state_t state)
+{
+	if (!state.hardirq)
+		return;
+
+	__preempt_count_add(HARDIRQ_OFFSET);
+	lockdep_hardirq_enter();
+
+	instrumentation_begin();
+	preempt_count_add_finish(HARDIRQ_OFFSET);
+	instrumentation_end();
+}
+
 /**
  * irqentry_exit_cond_resched - Conditionally reschedule on return from interrupt
  *
@@ -505,7 +527,9 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
  *
  * The rearm on return to user mode needs no such annotation: no locks are
  * held there, so it uses the same lock chains as the rearm in hardirq
- * context.
+ * context. Ordinary-hardirq return paths do not use this wrapper: their saved
+ * provenance restores both the hardirq count and lockdep nesting across the
+ * whole traceable tail and they call hrtimer_rearm_deferred() directly.
  */
 static __always_inline void irqentry_hrtimer_rearm_deferred(void)
 {
@@ -520,7 +544,9 @@ static __always_inline void irqentry_hrtimer_rearm_deferred(void)
  * @state:	Return value from matching call to irqentry_enter_from_kernel_mode()
  *
  * This is to be invoked after irqentry_exit_to_kernel_mode_preempt() and before
- * actually returning to the interrupted context.
+ * actually returning to the interrupted context. If @state records ordinary
+ * hardirq provenance, the caller must first invoke
+ * irqentry_hardirq_tail_enter() exactly once.
  *
  * There are no requirements for the CPU state other than being able to complete
  * the tracing, lockdep and RCU state transitions. After this function returns
@@ -529,6 +555,31 @@ static __always_inline void irqentry_hrtimer_rearm_deferred(void)
 static __always_inline void
 irqentry_exit_to_kernel_mode_after_preempt(struct pt_regs *regs, irqentry_state_t state)
 {
+	struct ct_irq_exit_state ct_state = { };
+
+	if (state.hardirq) {
+		if (!regs_irqs_disabled(regs)) {
+			instrumentation_begin();
+			hrtimer_rearm_deferred();
+			/* Tell the tracer that the return will enable IRQs. */
+			trace_hardirqs_on_prepare();
+			lockdep_hardirqs_on_prepare_irqtail();
+			instrumentation_end();
+		}
+
+		if (state.exit_rcu)
+			ct_state = ct_irq_exit_prepare();
+
+		irqentry_hardirq_tail_exit();
+
+		if (state.exit_rcu)
+			ct_irq_exit_finish(ct_state);
+
+		if (!regs_irqs_disabled(regs))
+			lockdep_hardirqs_on(CALLER_ADDR0);
+		return;
+	}
+
 	if (!regs_irqs_disabled(regs)) {
 		/*
 		 * If RCU was not watching on entry this needs to be done
@@ -570,7 +621,8 @@ irqentry_exit_to_kernel_mode_after_preempt(struct pt_regs *regs, irqentry_state_
  *
  * This is the counterpart of irqentry_enter_from_kernel_mode() and combines
  * the calls to irqentry_exit_to_kernel_mode_preempt() and
- * irqentry_exit_to_kernel_mode_after_preempt().
+ * irqentry_exit_to_kernel_mode_after_preempt(). It also establishes the
+ * conditional hardirq return tail between those calls.
  *
  * The requirement for the CPU state is that it can schedule. After the function
  * returns the tracing, lockdep and RCU state transitions are completed and the
@@ -585,6 +637,7 @@ static __always_inline void irqentry_exit_to_kernel_mode(struct pt_regs *regs,
 	irqentry_exit_to_kernel_mode_preempt(regs, state);
 	instrumentation_end();
 
+	irqentry_hardirq_tail_enter(state);
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
 
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 63427d29cb6d1..80d12deeb694a 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -833,6 +833,24 @@ irq_exit_wake_late_softirqs(unsigned int wake_flags)
 		irq_exit_wake_ksoftirqd();
 }
 
+/**
+ * irqentry_hardirq_tail_exit - Close work and remove return-tail state
+ *
+ * Run every instrumentable teardown operation, including the final worker
+ * closure, before removing the raw hardirq count and lockdep nesting.
+ */
+void noinstr irqentry_hardirq_tail_exit(void)
+{
+	bool do_sub;
+
+	instrumentation_begin();
+	do_sub = irqentry_hardirq_exit_prepare();
+	irq_exit_wake_late_softirqs(0);
+	instrumentation_end();
+
+	irqentry_hardirq_exit_finish(do_sub);
+}
+
 static __always_inline unsigned int __irq_exit_rcu(bool keep_hardirq_count)
 {
 	unsigned int wake_flags = 0;
-- 
2.39.5 (Apple Git-154)

