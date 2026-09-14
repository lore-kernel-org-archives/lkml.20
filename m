Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEDA47D92F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396458; cv=none; b=LSXxeq8Pt3asuBUroY1pXO2vEr31uNsbMLqZOhYJaKtgoSIWdydlPAoU0Bfv/7GgG8/Uj/YcLnJCRa605ugCvUPut5ptb5eG/4D7xQtAic360ulI5NVfTdg46ezXohEmFJlA4R+xs/yPl0WRR2J1jBuITXVCnoem+sNqFrdXGEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396458; c=relaxed/simple;
	bh=RVVORPPX4LHqCjOQicfqCDMLH6gSF3xGxhnnVVYzOTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Go+ujuzo+4cbYifkq3iQgWuoZTi/4x/SiDulSSNDN/4EI5ejEAnyISedaAjAqi9WSyK5mCDXBb0Hkhm2zUJhkeouMxgr4o9fXZ348D9YPnSapQtXNbyQ/y5QdieMxIHOpGsmcvL+6943VLu8srRvjUn2OjlvANamScwj6QzH9jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PaoFkCYh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D7nIgm/X; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PaoFkCYh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D7nIgm/X"
Date: Mon, 14 Sep 2026 16:34:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789396454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5bry0cf6Nh1e5HxtUnLJ/8n5/WRMFzD4V3EDM/zDbDM=;
	b=PaoFkCYhPHuTac7itjKqaKwmmr01cAMo+Au6KolBmQSAsZ/Vr/iHSHf3KIs/RgQUwgQtmL
	Dm1zXNRlOONBSAzq86Aw+IcLaRdtu1tTiQeq+nVlMB86xzS1S4fNaoBExeNw5DeaJHllJQ
	qlfPQrxZv+ehScvM9tK4ug74eLmHdkiAMVo/BuZKUCZ+y7xaFA++iuW+HKjKpkbKwN46gs
	M/ZkP9MDGIyOqP9qAwMFBoTxOIxK5lljsIqh+aP2hlO2ER/PIMa77qJFN6kFgwT1Wg0dQv
	8ZTqKUPWJnMzZzU7eXqPjUn2Uw0nwGIcx9B4vDIZe1FL9UJzo31+MhCHB+jUjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789396454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5bry0cf6Nh1e5HxtUnLJ/8n5/WRMFzD4V3EDM/zDbDM=;
	b=D7nIgm/XF1touj8rhxTmbwI+ukzf0BgX6AwekxnEJRa+3oMr8nox958P/K1NsC1cpYiJRm
	9+6IswOX2Z74xcDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v2] printk: Use two irq_works instead per-CPU
Message-ID: <20260914143412.1sMcp89V@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

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
- Use one irq_work (pending_wakeup_work) for klogd wakes. Schedule it
  only if there is a sleeper waiting.
- Use one irq_work (&pending_output_work) for output printing. Schedule
  it only if PRINTK_PENDING_OUTPUT passed.
- Drop unused PRINTK_PENDING_WAKEUP.
- Remove the preempt_disable() section. Its purpose was to ensure that
  printk_pending and wake_up_klogd_work is accessed from the same CPU.

Worst case is defer_console_output() where two irq_work are scheduled but
those get processed one after the other during the HZ tick so it
shouldn't get worse.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

v1=E2=80=A6v2: https://lore.kernel.org/all/20260911103832.w6C8cT4L@linutron=
ix.de/
  - Merge the preempt_disable() removal bits.
  - Keep the printk_percpu_data_ready() check. It is needed to to
    corrupt the irq_work lists.

 kernel/printk/printk.c | 53 ++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 6d3d18a50da74..d5cfd56f1a001 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4593,31 +4593,26 @@ bool pr_flush(int timeout_ms, bool reset_on_progres=
s)
 /*
  * Delayed printk version, for scheduler-internal messages:
  */
-#define PRINTK_PENDING_WAKEUP	0x01
-#define PRINTK_PENDING_OUTPUT	0x02
+#define PRINTK_PENDING_OUTPUT	0x01
=20
-static DEFINE_PER_CPU(int, printk_pending);
-
-static void wake_up_klogd_work_func(struct irq_work *irq_work)
+static void pending_wake_fn(struct irq_work *irq_work)
 {
-	int pending =3D this_cpu_xchg(printk_pending, 0);
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
=20
-static DEFINE_PER_CPU(struct irq_work, wake_up_klogd_work) =3D
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
+static struct irq_work pending_wakeup_work =3D IRQ_WORK_INIT_LAZY(pending_=
wake_fn);
+static struct irq_work pending_output_work =3D IRQ_WORK_INIT_LAZY(pending_=
output_fn);
=20
 static void __wake_up_klogd(int val)
 {
@@ -4631,7 +4626,6 @@ static void __wake_up_klogd(int val)
 	if (WARN_ON_ONCE(console_irqwork_blocked))
 		return;
=20
-	preempt_disable();
 	/*
 	 * Guarantee any new records can be seen by tasks preparing to wait
 	 * before this context checks if the wait queue is empty.
@@ -4643,12 +4637,11 @@ static void __wake_up_klogd(int val)
 	 *
 	 * This pairs with devkmsg_read:A and syslog_print:A.
 	 */
-	if (wq_has_sleeper(&log_wait) || /* LMM(__wake_up_klogd:A) */
-	    (val & PRINTK_PENDING_OUTPUT)) {
-		this_cpu_or(printk_pending, val);
-		irq_work_queue(this_cpu_ptr(&wake_up_klogd_work));
-	}
-	preempt_enable();
+	if (wq_has_sleeper(&log_wait)) /* LMM(__wake_up_klogd:A) */
+		irq_work_queue(&pending_wakeup_work);
+
+	if (val & PRINTK_PENDING_OUTPUT)
+		irq_work_queue(&pending_output_work);
 }
=20
 /**
@@ -4663,7 +4656,7 @@ static void __wake_up_klogd(int val)
  */
 void wake_up_klogd(void)
 {
-	__wake_up_klogd(PRINTK_PENDING_WAKEUP);
+	__wake_up_klogd(0);
 }
=20
 /**
@@ -4684,7 +4677,7 @@ void defer_console_output(void)
 	 * New messages may have been added directly to the ringbuffer
 	 * using vprintk_store(), so wake any waiters as well.
 	 */
-	__wake_up_klogd(PRINTK_PENDING_WAKEUP | PRINTK_PENDING_OUTPUT);
+	__wake_up_klogd(PRINTK_PENDING_OUTPUT);
 }
=20
 /**
--=20
2.55.0

