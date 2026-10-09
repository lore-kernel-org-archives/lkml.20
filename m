Received: from mail-108-mta193.mxroute.com (mail-108-mta193.mxroute.com [136.175.108.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036434E3220
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558258; cv=none; b=D5miYOuoC76N5kRPXBSlG2VzmERdXK99gmvSSyy0tHectbMV29unD9+huZY4m/Czb3rMziC1Hnf+WtapbkTHVmpEzic5kwS4/3jTnMoa+HlozguNJwU2ncUBUiZm2LgsiMzUZUP93ih151sBlwJDPquPxNZryNoQkahG6uaYw5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558258; c=relaxed/simple;
	bh=cT9nU4/wHb7oRtTsNt6qdE4TpIJIG3Dvu7SoCNGUmdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6rDG6WV1UATDqzzejHq8vBWrFdo6KznBpEK1dBVxqXX1X/qO5CNExzSJi27G1KegSJhuxv7XKCNQOAhCjencFDKUnjBhOWfL7uF5kIcpCmGOkNqFjrvpzvUVgWvtBa1XTtolpeb8DCzrZQVFDtAXz1aMATVgXUcSdigCjgToPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=Z1Z0Jjq+; arc=none smtp.client-ip=136.175.108.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="Z1Z0Jjq+"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta193.mxroute.com (ZoneMTA) with ESMTPSA id 1a1212cc06f00028b2.009
 for <linux-kernel@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 09 Oct 2026 14:59:03 +0000
X-Zone-Loop: e08846709ec02807c7dd4b425e73d6fc8b605cfb3982
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dPvGUU74ClVgziN3/mRJwORr8OkZqlxW2eWGnAwVWNQ=; b=Z1Z0Jjq+LSVr63DMCsdzUkCTMd
	I2KJCUIbbwZg+15FWRMgnwcpS2j6XQxJdgQPCwKoIGdDH+L8vtDlJMewCVL1GT0MYBkPjcK8d+Gd1
	mr0JWDe317GXBegOoMUJfvJYHtH4Uo2cwPOSfainWMHmENwDAdSJxAoZY4FJ57Jc9GBdrbnlQmVAW
	euYnFk8D4fLU7h3hSpj+6jhX0DWbyJUu6PceKcNgKqIhdrtlCbR6Z0+1+HgRbQ6OcHONL/D3UNZ0s
	HrWy0cyAYh/WJDpnQXv4faEDpZPyMj88WI05MDRp4DhUOMf+FSpChcIuBeNPIeRTAti5TQNvIFo65
	J9yaRYNg==;
From: Richard Patel <ripatel@wii.dev>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	David Rubin <david@vortan.dev>,
	PJ Waskiewicz <pwaskiewicz@jumptrading.com>
Subject: [PATCH 1/2] genirq: defer kfree(irqaction) until irq_thread_dtor() finishes
Date: Fri,  9 Oct 2026 14:58:41 +0000
Message-ID: <20261009145842.1616117-2-ripatel@wii.dev>
In-Reply-To: <20261009145842.1616117-1-ripatel@wii.dev>
References: <20261009145842.1616117-1-ripatel@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: ripatel@wii.dev

When an IRQ thread exits abnormally via do_exit() (e.g. the IRQ
handler oopses) without returning from irq_thread(), a concurrent
call to free_irq() could free the irqaction before the
irq_thread_dtor() exit task work runs.

  irq thread (oopsed)                 free_irq()
  -------------------                 ----------
  do_exit()
    exit_mm()
      complete_vfork_done()  -------> kthread_stop() returns
    exit_files() ...                  kfree(action)
    exit_task_work()
      irq_thread_dtor()
        action->...                   <- use-after-free

Track the pending exit work with the IRQTF_EXIT_WORK thread flag,
and have __free_irq() wait for the bit to clear before kfree().

irq_thread_dtor() only runs on irq_thread abnormal exit. If that
dtor also faults, free_irq() will hang indefinitely, but double
IRQ thread faults require a reboot anyways.

Fixes: ed3e694d78cc ("move exit_task_work() past exit_files() et.al.")
Cc: stable@vger.kernel.org
Signed-off-by: Richard Patel <ripatel@wii.dev>
---
 kernel/irq/internals.h |  2 ++
 kernel/irq/manage.c    | 25 +++++++++++++++++++------
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index 0ce21dd45404..2c30e7537987 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -36,6 +36,7 @@ extern struct irqaction chained_action;
  * IRQTF_AFFINITY  - irq thread is requested to adjust affinity
  * IRQTF_FORCED_THREAD  - irq action is force threaded
  * IRQTF_READY     - signals that irq thread is ready
+ * IRQTF_EXIT_WORK - irq thread exit task_work is pending
  */
 enum {
 	IRQTF_RUNTHREAD,
@@ -43,6 +44,7 @@ enum {
 	IRQTF_AFFINITY,
 	IRQTF_FORCED_THREAD,
 	IRQTF_READY,
+	IRQTF_EXIT_WORK,
 };
 
 /*
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 57eff26fa646..e882a0693a39 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1176,17 +1176,14 @@ void wake_threads_waitq(struct irq_desc *desc)
 		wake_up(&desc->wait_for_threads);
 }
 
-static void irq_thread_dtor(struct callback_head *unused)
+static void __irq_thread_dtor(struct irqaction *action)
 {
 	struct task_struct *tsk = current;
 	struct irq_desc *desc;
-	struct irqaction *action;
 
 	if (WARN_ON_ONCE(!(current->flags & PF_EXITING)))
 		return;
 
-	action = kthread_data(tsk);
-
 	pr_err("exiting task \"%s\" (%d) is an active IRQ thread (irq %d)\n",
 	       tsk->comm, tsk->pid, action->irq);
 
@@ -1203,6 +1200,14 @@ static void irq_thread_dtor(struct callback_head *unused)
 	irq_finalize_oneshot(desc, action);
 }
 
+static void irq_thread_dtor(struct callback_head *unused)
+{
+	struct irqaction *action = kthread_data(current);
+
+	__irq_thread_dtor(action);
+	clear_and_wake_up_bit(IRQTF_EXIT_WORK, &action->thread_flags);
+}
+
 static void irq_wake_secondary(struct irq_desc *desc, struct irqaction *action)
 {
 	struct irqaction *secondary = action->secondary;
@@ -1263,6 +1268,7 @@ static int irq_thread(void *data)
 	else
 		handler_fn = irq_thread_fn;
 
+	set_bit(IRQTF_EXIT_WORK, &action->thread_flags);
 	init_task_work(&on_exit_work, irq_thread_dtor);
 	task_work_add(current, &on_exit_work, TWA_NONE);
 
@@ -1283,6 +1289,7 @@ static int irq_thread(void *data)
 	 * oneshot mask bit can be set.
 	 */
 	task_work_cancel_func(current, irq_thread_dtor);
+	clear_and_wake_up_bit(IRQTF_EXIT_WORK, &action->thread_flags);
 	return 0;
 }
 
@@ -1853,6 +1860,12 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
 	return ret;
 }
 
+static void irq_stop_thread(struct irqaction *action)
+{
+	kthread_stop_put(action->thread);
+	wait_on_bit(&action->thread_flags, IRQTF_EXIT_WORK, TASK_UNINTERRUPTIBLE);
+}
+
 /*
  * Internal function to unregister an irqaction - used to free
  * regular and special interrupts that are part of the architecture.
@@ -1958,9 +1971,9 @@ static struct irqaction *__free_irq(struct irq_desc *desc, void *dev_id)
 	 * the same bit to a newly requested action.
 	 */
 	if (action->thread) {
-		kthread_stop_put(action->thread);
+		irq_stop_thread(action);
 		if (action->secondary && action->secondary->thread)
-			kthread_stop_put(action->secondary->thread);
+			irq_stop_thread(action->secondary);
 	}
 
 	/* Last action releases resources */
-- 
2.52.0

