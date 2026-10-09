Received: from mail-108-mta34.mxroute.com (mail-108-mta34.mxroute.com [136.175.108.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3FB4E50A4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558259; cv=none; b=EB0AHYLBcQo5b4m9mdEEzGKe6y4s9OA4JC1X3/eNDI/fTxgzwynnFVRI+M4xoq3SnCYz8IeDp/Uwqsb2yC1c0Gw6wCe0OKs2yRMdNIaHFRjI4Nh1LJ23S/YXSn4qbjnFUz0YxmRfZK1GobdAo4cYu4MWmDYX1IWscEh2pud9ieE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558259; c=relaxed/simple;
	bh=odGJqkgPJV28/bKnW+uNsBk274e0UPVwxBMIcJEqVa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lU72YhFhjQ4BXtGxbccS23xUPebtaKJl58twz6CySxqrt5ulthM7yrWPJOY3F26DfbjaaJNBR4vCnNW/E0AJBfCRrnfzt+xUfFMNd7r66+1HULASBqt0JE0lm4ofNkZElG4JcunRk/dvpNcQaTT9JOkzjS/cqi2S7k5mT5dsEKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=pVKzmps5; arc=none smtp.client-ip=136.175.108.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="pVKzmps5"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta34.mxroute.com (ZoneMTA) with ESMTPSA id 1a1212cc82c00028b2.009
 for <linux-kernel@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 09 Oct 2026 14:59:05 +0000
X-Zone-Loop: 3d28d50cf0bc8a11454b6ac43f54d3aed315f4f2a05a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=tBhXsjyKZbyU7+v7lqzG7pWhMjXOS1Moc684oyPfZlw=; b=pVKzmps5wF8Vm6qI4/gWL6Za8F
	91/8d3UDg+FgN5uEnQYxbUwGpB5UPNc+TC+q4A6H2elv2a+8Xhbzl9XlotwmDRik9vmrI8/aspzam
	utohZxq8Id8BU+K41q9GFjSTrtRq5EtW/X9VJzTnZ1CiIyP7piXD+Cwo+AVFmcyCywFELNW6Tjqbr
	rG53GtvkE4P2mgAGehFa2TljBtDoR2GleY5wbuYtr4xPjhaGpDIySv2F+gMlcOXZ46xscjQUlJDJH
	JwEghc8NXRHZbSCPGucdrV4nlZkP27FdYYbNAd7xzuY3mXp7OHB4Of1SSb+S7T3HCuCB+qSwYi4/w
	on3/lrlQ==;
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
Subject: [PATCH 2/2] genirq: move IRQ thread exit_work object to irqaction
Date: Fri,  9 Oct 2026 14:58:42 +0000
Message-ID: <20261009145842.1616117-3-ripatel@wii.dev>
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

irq_thread() registers irq_thread_dtor() as exit task_work using
a stack-allocated callback_head.  On normal IRQ thread exit, this
work gets cancelled and never runs.

On x86, an abnormal IRQ thread exit (e.g. handler oops) discards
the stack, including the callback_head, while that callback_head
is still pending. By the time exit_task_work() runs, the stack
memory formerly backing callback_head is already clobbered.

  irq_thread()                      <-- on_exit_work allocated
    ** IRQ handler faults **
    oops_end()
      rewind_stack_and_make_dead()  <-- on_exit_work freed
  make_task_dead()
    do_exit(SIGSEGV)
      ...
      exit_shm()                    <-- on_exit_work clobbered
      ...
      exit_task_work()              <-- stack use-after-free
        exit_shm()+0x30             <-- wild jump to return addr

Thus, a benign threaded IRQ oops (e.g. a NULL pointer deref) is
turned into a wild jump. This is caught by kernel IBT:

  ** first fault **
  Oops: general protection fault, kernel NULL pointer dereference 0x3c0: 0000 [#1] SMP NOPTI
  ...
  ** second fault **
  Missing ENDBR: exit_shm+0x30/0x1c0
  kernel BUG at arch/x86/kernel/cet.c:133!
  ...
   ? task_work_run+0x5c/0x90
   ? do_exit+0x209/0x460
   ? rewind_stack_and_make_dead+0x16/0x20
  ...
  note: irq/165-AudioDS[1427] exited with irqs disabled
  Fixing recursive fault but reboot is needed!

Fix this by storing the callback_head in struct irqaction.
The irqaction is only freed once irq_thread_dtor() finishes.

Fixes: 2deb4be28077 ("x86/dumpstack: When OOPSing, rewind the stack before do_exit()")
Cc: stable@vger.kernel.org
Signed-off-by: Richard Patel <ripatel@wii.dev>
---
 include/linux/interrupt.h | 2 ++
 kernel/irq/manage.c       | 9 ++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 52bb684090c0..ee2dd5349697 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -119,6 +119,7 @@ typedef irqreturn_t (*irq_handler_t)(int, void *);
  * @thread_flags:	flags related to @thread
  * @thread_mask:	bitmask for keeping track of @thread activity
  * @dir:	pointer to the proc/irq/NN/name entry
+ * @thread_dtor:	task_work for @thread irregular exit cleanup
  */
 struct irqaction {
 	irq_handler_t		handler;
@@ -137,6 +138,7 @@ struct irqaction {
 	unsigned long		thread_mask;
 	const char		*name;
 	struct proc_dir_entry	*dir;
+	struct callback_head	thread_dtor;
 } ____cacheline_internodealigned_in_smp;
 
 extern irqreturn_t no_action(int cpl, void *dev_id);
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index e882a0693a39..4fbb8f960dbf 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1200,9 +1200,9 @@ static void __irq_thread_dtor(struct irqaction *action)
 	irq_finalize_oneshot(desc, action);
 }
 
-static void irq_thread_dtor(struct callback_head *unused)
+static void irq_thread_dtor(struct callback_head *work)
 {
-	struct irqaction *action = kthread_data(current);
+	struct irqaction *action = container_of(work, struct irqaction, thread_dtor);
 
 	__irq_thread_dtor(action);
 	clear_and_wake_up_bit(IRQTF_EXIT_WORK, &action->thread_flags);
@@ -1249,7 +1249,6 @@ static void wake_up_and_wait_for_irq_thread_ready(struct irq_desc *desc,
  */
 static int irq_thread(void *data)
 {
-	struct callback_head on_exit_work;
 	struct irqaction *action = data;
 	struct irq_desc *desc = irq_to_desc(action->irq);
 	irqreturn_t (*handler_fn)(struct irq_desc *desc,
@@ -1269,8 +1268,8 @@ static int irq_thread(void *data)
 		handler_fn = irq_thread_fn;
 
 	set_bit(IRQTF_EXIT_WORK, &action->thread_flags);
-	init_task_work(&on_exit_work, irq_thread_dtor);
-	task_work_add(current, &on_exit_work, TWA_NONE);
+	init_task_work(&action->thread_dtor, irq_thread_dtor);
+	task_work_add(current, &action->thread_dtor, TWA_NONE);
 
 	while (!irq_wait_for_interrupt(desc, action)) {
 		irqreturn_t action_ret;
-- 
2.52.0

