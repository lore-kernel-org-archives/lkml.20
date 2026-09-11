Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A118D33D4E4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123118; cv=none; b=ZLxMHUa0q6uFW2bsZFvqr1GYPjO4j6mvUwK6SCUg5vVIPT8ZT02iVC/bBxY4yCwUcjPbRlHP/z2BWumsohzsnHzbrFJFNJ86T9fqJiVoyrUah/fpQjoSLEjw6hXKszWfEMY5RBtuKAy8VARNSmT6N5OPvMh9IOL5nfqyjlRZjec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123118; c=relaxed/simple;
	bh=LAVns05l0shqrv5YXGXh/bL+VhXFccFoSCZrEkFyw48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i2BTaFx1Gn4ybA8LtSGo+ZBNj2xEyvwP9s1NVqBDvXZYYV1NmTcIo0jw1jgqCdfoGikj+d1Wb5vEu0bcGUHw/jfXDhBJoVYbD74FmZr9onnIRTBLVqvSfUSPjfsf1KfU5/Yo8iewZYxk1Tv54Y5Z9eol2E57vmkO2qBM09vcJ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DpC9czYd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SRiqxNo/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DpC9czYd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SRiqxNo/"
Date: Fri, 11 Sep 2026 12:38:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789123113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=klimaypujjhwn2JmyARJOlvTLh93pB/Nr4Z2Yd7Xgvk=;
	b=DpC9czYdHTYibndZhw8I7b6cuvGog3q7RpTyygH3KCQyXJ3nPnL8M5aQlsST5c9IUtbZYy
	c7qfKNzGnzsfE6f3mfjMOdNYP+nQ6lQvALumRvUWjrDhwyxwpvKD8RVbmUHaDccqr0uKRu
	VA6TFcBvAJmworr6gHyrtuqflupGwWNJt7hwIEsvo+k6nVtphSiZdYjfXlmrzNxK81q1Z+
	XL2+IeVD39ulXCRzl6of4AMfU1ITVpsozrKnarFbQTXTrggBCzJPThMUJKaxqhuvNfm5X+
	/O3turqbg0e4zW0KENEg3OMWaGGfgRFu+/Z6wx0etUNLCY9ZzK+wt3BPdu1Szw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789123113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=klimaypujjhwn2JmyARJOlvTLh93pB/Nr4Z2Yd7Xgvk=;
	b=SRiqxNo/78g6ZXbhBmtUc+Y8meryYguAb+QxLAjWF6zfK46Am9CAbJUPEbm2LEKwkcdC5d
	cvujQGXr+8XYVuDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] printk: Use two irq_works instead per-CPU
Message-ID: <20260911103832.w6C8cT4L@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

In commit b845b517b5e37 ("printk: robustify printk") initially got its
delayed wake up which is today implemented via the irq_work. Back then
it was a variable which was assigned to 1 if a pending wake up was
waiting. This variable was checked on each timer tick. Therefore it
makes sense to assign a per-CPU variable with this task to avoid cache
line bouncing when each CPU reads the variable on each timer tick
simultaneously.

Today we have a irq_work which is enqueued onto a list and handled if it
has work items assigned. This list is already per-CPU.

We could replace the per-CPU irq_work and the per-CPU printk_pending with
two irq_work structs: One for PRINTK_PENDING_WAKEUP and the other for
PRINTK_PENDING_OUTPUT.
While unrolling the conditions in __wake_up_klogd() it becomes obvious
that PRINTK_PENDING_WAKEUP is always passed as an argument but never
checked. The return value wq_has_sleeper() of does not really matter
it's sole purpose is to enforce the needed memory barrier.

Redo the irq_work by:
- use one irq_work (pending_wakeup_work) for klogd wakes. Schedule it
  only if there is a sleeper waiting.
- use one irq_work (&pending_output_work) for output printing. Schedule
  it only if PRINTK_PENDING_OUTPUT passed.
- Drop unused PRINTK_PENDING_WAKEUP.
- Remove the printk_percpu_data_ready() check because per-CPU data is no
  longer used by __wake_up_klogd().

Worst case is defer_console_output() where two irq_work are scheduled but
those get processed one after the other during the HZ tick so it
shouldn't get worse.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/printk/printk.c | 55 ++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 31 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 3fcdf4b4e2e53..7c5a220e84323 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4593,37 +4593,29 @@ bool pr_flush(int timeout_ms, bool reset_on_progress)
 /*
  * Delayed printk version, for scheduler-internal messages:
  */
-#define PRINTK_PENDING_WAKEUP	0x01
-#define PRINTK_PENDING_OUTPUT	0x02
+#define PRINTK_PENDING_OUTPUT	0x01
 
-static DEFINE_PER_CPU(int, printk_pending);
-
-static void wake_up_klogd_work_func(struct irq_work *irq_work)
+static void pending_wake_fn(struct irq_work *irq_work)
 {
-	int pending = this_cpu_xchg(printk_pending, 0);
-
-	if (pending & PRINTK_PENDING_OUTPUT) {
-		if (force_legacy_kthread()) {
-			if (printk_legacy_kthread)
-				wake_up_interruptible(&legacy_wait);
-		} else {
-			if (console_trylock())
-				console_unlock();
-		}
-	}
-
-	if (pending & PRINTK_PENDING_WAKEUP)
-		wake_up_interruptible(&log_wait);
+	wake_up_interruptible(&log_wait);
 }
 
-static DEFINE_PER_CPU(struct irq_work, wake_up_klogd_work) =
-	IRQ_WORK_INIT_LAZY(wake_up_klogd_work_func);
+static void pending_output_fn(struct irq_work *irq_work)
+{
+	if (force_legacy_kthread()) {
+		if (printk_legacy_kthread)
+			wake_up_interruptible(&legacy_wait);
+	} else {
+		if (console_trylock())
+			console_unlock();
+	}
+}
+
+struct irq_work pending_wakeup_work = IRQ_WORK_INIT_LAZY(pending_wake_fn);
+struct irq_work pending_output_work = IRQ_WORK_INIT_LAZY(pending_output_fn);
 
 static void __wake_up_klogd(int val)
 {
-	if (!printk_percpu_data_ready())
-		return;
-
 	/*
 	 * It is not allowed to call this function when console irq_work
 	 * is blocked.
@@ -4643,11 +4635,12 @@ static void __wake_up_klogd(int val)
 	 *
 	 * This pairs with devkmsg_read:A and syslog_print:A.
 	 */
-	if (wq_has_sleeper(&log_wait) || /* LMM(__wake_up_klogd:A) */
-	    (val & PRINTK_PENDING_OUTPUT)) {
-		this_cpu_or(printk_pending, val);
-		irq_work_queue(this_cpu_ptr(&wake_up_klogd_work));
-	}
+	if (wq_has_sleeper(&log_wait)) /* LMM(__wake_up_klogd:A) */
+		irq_work_queue(&pending_wakeup_work);
+
+	if (val & PRINTK_PENDING_OUTPUT)
+		irq_work_queue(&pending_output_work);
+
 	preempt_enable();
 }
 
@@ -4663,7 +4656,7 @@ static void __wake_up_klogd(int val)
  */
 void wake_up_klogd(void)
 {
-	__wake_up_klogd(PRINTK_PENDING_WAKEUP);
+	__wake_up_klogd(0);
 }
 
 /**
@@ -4684,7 +4677,7 @@ void defer_console_output(void)
 	 * New messages may have been added directly to the ringbuffer
 	 * using vprintk_store(), so wake any waiters as well.
 	 */
-	__wake_up_klogd(PRINTK_PENDING_WAKEUP | PRINTK_PENDING_OUTPUT);
+	__wake_up_klogd(PRINTK_PENDING_OUTPUT);
 }
 
 /**
-- 
2.55.0

