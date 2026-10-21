Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576260;
	b=EoDzJDJ1qJ517fTv/jmHbwXPcs289+V1ETUaY+1pGlc/IxEwPAC0SD3w2iNuo127/Q57
	 dQvf+zbZ6Tj5saFOSnoaUK+0QqoMLNstv7QXbrIr7JjS/RfwoUYpa5cVAzdNnQX1tBPXE
	 WNB6JmtZsNplwuorX1aMkZAMZ7l+Q0EyKgZbFyzH8myQHCTZmYn+aSNE7VQJrBQ0PfQq1
	 095EFDgVScNB9I8XgMIQhEEREVEJJxYzHHAsnEu5M9LILjN7Woii0MlokSgIKloF16ln0
	 4UyMEuoTU1vXgYiPEayUjjYxJoNrG3SPBAjqT0m4zzlxCZk37W7gTXWnO05jGadJxCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576260;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Gj14+6ERs5BNxVFhs6FoPpNpwx/q9oNO84DjGdFJ6hQ=;
	b=A+iK+PuQkZcmesjTxoq2UvrDtuQ0t40pLysfGSpfvepXP/8YTA424AGytZg70T1eox8K
	 DSRIlwPYT7Vx3H2cnSoio3bZLuvM6D9I9NF9OckxwVf8Robvj7wyJDN7MP28bN1VC8BIF
	 i1KO6yB+xQ3R5jUOrQ8BEHt1oweeghi3cOtAdB1YIH00dpVogpIY4uvn9tiQtJ+bvEUDc
	 hS+3+8AbBy8jYETjVUXvVjK5KXeckV2lpxKapBNEowaeNma9Ynje2DIa5R4obN9uEcri7
	 bMb7b03KLyPWRIMO59ZIqXpGbYHBLEnRPGn5JMeR+uR2Si9NGXSqmanKkRGThSJ3n4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JcXCQ2bp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C12D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JcXCQ2bp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B351F000C9;
	Wed, 21 Oct 2026 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792576259;
	bh=Gj14+6ERs5BNxVFhs6FoPpNpwx/q9oNO84DjGdFJ6hQ=;
	h=Date:From:To:Cc:Subject;
	b=JcXCQ2bpPf2CIoQfKoyGaz8wrYDUR1KyS4R8r8Dlv5KXr9rvCVH5QvJwQNbIpkHru
	 oiN6eRPkS/GoNz4dVzJqvr0PeoT565Aeyai6cX6nI49GUF//Fkw4vRXsDDAyvC+UBw
	 A6RfD0kii+sP5CAqxxu8PB3MAbS+FHxJHI2XZGEwLEXkK62fG0uqtd4SSAFoBBcNeK
	 47xQCfo9wWHlyoqdwKa6IJlUahgZm4U680rRpLoYYVRhGvvaQHlaYvKvRNnxS0jcFS
	 WbWLlUFgTn5b2lYwb00Yt2LeKeHNxmXaaPHeoShewkOP7OHz5rcpNudUiFT7UTwSnk
	 POVqZTcbpQfSg==
Date: Wed, 21 Oct 2026 11:50:56 +0200
From: Thomas Gleixner <tglx@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] irq/core for v7.4-rc1
Message-ID: <179257622431.804100.15107946105101279363.tglx@fw13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Linus,

please pull the latest irq/core branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-core-2026-10=
-20

up to:  e74798f2f8e1: genirq/proc: Fix missing CPU header in /proc/interrupts

Updates for the generic interrupt subsystem:

  - Skip programming of MSI/MSI-X related data while a PCI channel is
    offline (Link is down) in the error recovery code path. Accessing an
    offline channel results in a BUS error which affects the underlying
    Root Port.

    Check for pci_channel_offline() and if true avoid the writes and just
    cache the modifications which are subsequently applied when the Link
    has recovered.

  - Prevent a stack UAF when a faulting interrupt thread exits. On X86 the
    crash causes the stack to be discarded, which contains the callback
    head for the exit task_work to run the destructor. If the stack is
    clobbered before the destructor runs, then the indirect call of the
    task work function ends up in a random place. Move the callback head
    into the interrupt action to prevent that.

  - Prevent an UAF in the interrupt thread exit code which can happen when a
    faulting interrupt thread exits and races with a concurrent free_irq()
    by synchronizing free_irq() against thread exit.

  - Ensure that interrupt context accounting is accurate on interrupt
    return when checking for soft interrupt invocation.

    The code removed the hard interrupt context prematurely so that the
    subsequent code appeared to be in task context according to the preempt
    counter. That confuses ftrace, perf and K*SAN which get their recording
    context wrong. On Preempt-RT this can result in misbehaviour when BPF
    programs are attached to the affected region.

    Cure it by preserving the hard interrupt count up to the point where
    soft interrupts are actually invoked and switch directly to soft
    interrupt processing right there. That avoids the intermediate "in task
    context" state.

  - The usual small fixes and improvements

Thanks,

	tglx

------------------>
Enlin Mu (1):
      softirq: Remove redundant h->action from preempt_count mismatch error

Haris Okanovic (1):
      genirq/proc: Fix missing CPU header in /proc/interrupts

Hemanth Selam (1):
      genirq: Fix typos in comments

Karl Mehltretter (1):
      softirq: Preserve interrupt context on return from interrupt

Lukas Beckmann (1):
      genirq: Discard cpumask of irqaffinity=3D boot parameter if parsing fai=
ls

Richard Patel (2):
      genirq: Defer kfree(irqaction) until irq_thread_dtor() finishes
      genirq: Move interrupt thread exit_work object to irqaction

Vidya Sagar (1):
      PCI/MSI: Skip MSI/MSI-X programming while the channel is offline


 Documentation/core-api/entry.rst | 16 ++++++----
 drivers/pci/msi/msi.c            | 15 ++++++++--
 drivers/pci/msi/msi.h            |  8 +++++
 include/linux/interrupt.h        |  2 ++
 kernel/irq/internals.h           |  2 ++
 kernel/irq/irqdesc.c             | 10 ++++++-
 kernel/irq/manage.c              | 31 +++++++++++++------
 kernel/irq/msi.c                 |  4 +--
 kernel/irq/proc.c                | 24 ++++++++++-----
 kernel/softirq.c                 | 64 ++++++++++++++++++++++++++++++--------=
--
 10 files changed, 134 insertions(+), 42 deletions(-)

diff --git a/Documentation/core-api/entry.rst b/Documentation/core-api/entry.=
rst
index 79fdaed954d9..09942135aad1 100644
--- a/Documentation/core-api/entry.rst
+++ b/Documentation/core-api/entry.rst
@@ -197,8 +197,9 @@ return true, handles NOHZ tick state and interrupt time a=
ccounting. This
 means that up to the point where irq_enter_rcu() is invoked in_hardirq()
 returns false.
=20
-irq_exit_rcu() handles interrupt time accounting, undoes the preemption
-count update and eventually handles soft interrupts and NOHZ tick state.
+irq_exit_rcu() handles interrupt time accounting, handles soft interrupts if
+possible, handles the NOHZ tick state and finally undoes the preemption count
+update.
=20
 In theory, the preemption count could be updated in irqentry_enter(). In
 practice, deferring this update to irq_enter_rcu() allows the preemption-cou=
nt
@@ -207,10 +208,13 @@ irqentry_exit(), which are described in the next paragr=
aph. The only downside
 is that the early entry code up to irq_enter_rcu() must be aware that the
 preemption count has not yet been updated with the HARDIRQ_OFFSET state.
=20
-Note that irq_exit_rcu() must remove HARDIRQ_OFFSET from the preemption count
-before it handles soft interrupts, whose handlers must run in BH context rat=
her
-than irq-disabled context. In addition, irqentry_exit() might schedule, which
-also requires that HARDIRQ_OFFSET has been removed from the preemption count.
+Note that soft interrupt handlers must run in BH context rather than in hard
+interrupt context. irq_exit_rcu() therefore replaces HARDIRQ_OFFSET with
+SOFTIRQ_OFFSET in the preemption count while it handles soft interrupts and
+puts HARDIRQ_OFFSET back afterwards, so that the remaining interrupt exit wo=
rk
+is still attributed to the interrupt. HARDIRQ_OFFSET is removed before
+irq_exit_rcu() returns because irqentry_exit() might schedule, which requires
+that HARDIRQ_OFFSET has been removed from the preemption count.
=20
 Even though interrupt handlers are expected to run with local interrupts
 disabled, interrupt nesting is common from an entry/exit perspective. For
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 80a9db417dc8..8a0133a6a286 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -133,7 +133,9 @@ void pci_msi_update_mask(struct msi_desc *desc, u32 clear=
, u32 set)
 	raw_spin_lock_irqsave(lock, flags);
 	desc->pci.msi_mask &=3D ~clear;
 	desc->pci.msi_mask |=3D set;
-	pci_write_config_dword(dev, desc->pci.mask_pos, desc->pci.msi_mask);
+	/* Cached either way, for __pci_restore_msi_state() to replay */
+	if (!pci_channel_offline(dev))
+		pci_write_config_dword(dev, desc->pci.mask_pos, desc->pci.msi_mask);
 	raw_spin_unlock_irqrestore(lock, flags);
 }
=20
@@ -249,7 +251,7 @@ void __pci_write_msi_msg(struct msi_desc *entry, struct m=
si_msg *msg)
 {
 	struct pci_dev *dev =3D msi_desc_to_pci_dev(entry);
=20
-	if (dev->current_state !=3D PCI_D0 || pci_dev_is_disconnected(dev)) {
+	if (dev->current_state !=3D PCI_D0 || pci_channel_offline(dev)) {
 		/* Don't touch the hardware now */
 	} else if (entry->pci.msi_attrib.is_msix) {
 		pci_write_msg_msix(entry, msg);
@@ -976,6 +978,15 @@ int pci_msix_write_tph_tag(struct pci_dev *pdev, unsigne=
d int index, u16 tag)
 	if (!msi_desc || msi_desc->pci.msi_attrib.is_virtual)
 		return -ENXIO;
=20
+	/*
+	 * The tag update below is a write to the MSI-X Table followed by a
+	 * flush read, neither of which can be completed while the Link is
+	 * down. Check as late as possible, as the Link can go down at any
+	 * point. Let the caller disable TPH.
+	 */
+	if (pci_channel_offline(pdev))
+		return -EIO;
+
 	FIELD_MODIFY(PCI_MSIX_ENTRY_CTRL_ST, &msi_desc->pci.msix_ctrl, tag);
 	pci_msix_write_vector_ctrl(msi_desc, msi_desc->pci.msix_ctrl);
 	/* Flush the write */
diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
index 0b420b319f50..f987cf897264 100644
--- a/drivers/pci/msi/msi.h
+++ b/drivers/pci/msi/msi.h
@@ -36,6 +36,10 @@ static inline void pci_msix_write_vector_ctrl(struct msi_d=
esc *desc, u32 ctrl)
 {
 	void __iomem *desc_addr =3D pci_msix_desc_addr(desc);
=20
+	/* The Table is unreachable while the Link is down */
+	if (pci_channel_offline(msi_desc_to_pci_dev(desc)))
+		return;
+
 	if (desc->pci.msi_attrib.can_mask)
 		writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
 }
@@ -43,6 +47,10 @@ static inline void pci_msix_write_vector_ctrl(struct msi_d=
esc *desc, u32 ctrl)
 static inline void pci_msix_mask(struct msi_desc *desc)
 {
 	desc->pci.msix_ctrl |=3D PCI_MSIX_ENTRY_CTRL_MASKBIT;
+
+	if (pci_channel_offline(msi_desc_to_pci_dev(desc)))
+		return;
+
 	pci_msix_write_vector_ctrl(desc, desc->pci.msix_ctrl);
 	/* Flush write to device */
 	readl(desc->pci.mask_base);
diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 3bf969ad8fe0..50745608dc15 100644
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
=20
 extern irqreturn_t no_action(int cpl, void *dev_id);
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
=20
 /*
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 3a818f07a101..7cbcc3fb9e6d 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -28,7 +28,15 @@ static struct lock_class_key irq_desc_lock_class;
 static int __init irq_affinity_setup(char *str)
 {
 	alloc_bootmem_cpumask_var(&irq_default_affinity);
-	cpulist_parse(str, irq_default_affinity);
+	if (cpulist_parse(str, irq_default_affinity) < 0) {
+		/*
+		 * Clear the mask so that init_irq_default_affinity()
+		 * defaults it later.
+		 */
+		cpumask_clear(irq_default_affinity);
+		pr_warn("irqaffinity: incorrect CPU range, using default\n");
+		return 1;
+	}
 	/*
 	 * Set at least the boot cpu. We don't want to end up with
 	 * bugreports caused by random commandline masks
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 57eff26fa646..3b647d9b458a 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -21,6 +21,7 @@
 #include <linux/sched/isolation.h>
 #include <uapi/linux/sched/types.h>
 #include <linux/task_work.h>
+#include <linux/wait_bit.h>
=20
 #include "internals.h"
=20
@@ -1176,17 +1177,14 @@ void wake_threads_waitq(struct irq_desc *desc)
 		wake_up(&desc->wait_for_threads);
 }
=20
-static void irq_thread_dtor(struct callback_head *unused)
+static void __irq_thread_dtor(struct irqaction *action)
 {
 	struct task_struct *tsk =3D current;
 	struct irq_desc *desc;
-	struct irqaction *action;
=20
 	if (WARN_ON_ONCE(!(current->flags & PF_EXITING)))
 		return;
=20
-	action =3D kthread_data(tsk);
-
 	pr_err("exiting task \"%s\" (%d) is an active IRQ thread (irq %d)\n",
 	       tsk->comm, tsk->pid, action->irq);
=20
@@ -1203,6 +1201,14 @@ static void irq_thread_dtor(struct callback_head *unus=
ed)
 	irq_finalize_oneshot(desc, action);
 }
=20
+static void irq_thread_dtor(struct callback_head *work)
+{
+	struct irqaction *action =3D container_of(work, struct irqaction, thread_dt=
or);
+
+	__irq_thread_dtor(action);
+	clear_and_wake_up_bit(IRQTF_EXIT_WORK, &action->thread_flags);
+}
+
 static void irq_wake_secondary(struct irq_desc *desc, struct irqaction *acti=
on)
 {
 	struct irqaction *secondary =3D action->secondary;
@@ -1244,7 +1250,6 @@ static void wake_up_and_wait_for_irq_thread_ready(struc=
t irq_desc *desc,
  */
 static int irq_thread(void *data)
 {
-	struct callback_head on_exit_work;
 	struct irqaction *action =3D data;
 	struct irq_desc *desc =3D irq_to_desc(action->irq);
 	irqreturn_t (*handler_fn)(struct irq_desc *desc,
@@ -1263,8 +1268,9 @@ static int irq_thread(void *data)
 	else
 		handler_fn =3D irq_thread_fn;
=20
-	init_task_work(&on_exit_work, irq_thread_dtor);
-	task_work_add(current, &on_exit_work, TWA_NONE);
+	set_bit(IRQTF_EXIT_WORK, &action->thread_flags);
+	init_task_work(&action->thread_dtor, irq_thread_dtor);
+	task_work_add(current, &action->thread_dtor, TWA_NONE);
=20
 	while (!irq_wait_for_interrupt(desc, action)) {
 		irqreturn_t action_ret;
@@ -1283,6 +1289,7 @@ static int irq_thread(void *data)
 	 * oneshot mask bit can be set.
 	 */
 	task_work_cancel_func(current, irq_thread_dtor);
+	clear_and_wake_up_bit(IRQTF_EXIT_WORK, &action->thread_flags);
 	return 0;
 }
=20
@@ -1853,6 +1860,12 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, s=
truct irqaction *new)
 	return ret;
 }
=20
+static void irq_stop_thread(struct irqaction *action)
+{
+	kthread_stop_put(action->thread);
+	wait_on_bit(&action->thread_flags, IRQTF_EXIT_WORK, TASK_UNINTERRUPTIBLE);
+}
+
 /*
  * Internal function to unregister an irqaction - used to free
  * regular and special interrupts that are part of the architecture.
@@ -1958,9 +1971,9 @@ static struct irqaction *__free_irq(struct irq_desc *de=
sc, void *dev_id)
 	 * the same bit to a newly requested action.
 	 */
 	if (action->thread) {
-		kthread_stop_put(action->thread);
+		irq_stop_thread(action);
 		if (action->secondary && action->secondary->thread)
-			kthread_stop_put(action->secondary->thread);
+			irq_stop_thread(action->secondary);
 	}
=20
 	/* Last action releases resources */
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index fb5f372215bf..b22d74496af1 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -142,7 +142,7 @@ static int msi_insert_desc(struct device *dev, struct msi=
_desc *desc,
  *				insert it at @init_desc->msi_index
  *
  * @dev:	Pointer to the device for which the descriptor is allocated
- * @domid:	The id of the interrupt domain to which the desriptor is added
+ * @domid:	The id of the interrupt domain to which the descriptor is added
  * @init_desc:	Pointer to an MSI descriptor to initialize the new descriptor
  *
  * Return: 0 on success or an appropriate failure code.
@@ -416,7 +416,7 @@ EXPORT_SYMBOL_GPL(msi_domain_first_desc);
  * @domid:	The id of the interrupt domain which should be walked.
  * @filter:	Descriptor state filter
  *
- * The first invocation of msi_next_desc() has to be preceeded by a
+ * The first invocation of msi_next_desc() has to be preceded by a
  * successful invocation of __msi_first_desc(). Consecutive invocations are
  * only valid if the previous one was successful. All these operations have
  * to be done within the same MSI mutex held region.
diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
index 1b835725f7b1..0c0df16de581 100644
--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -462,7 +462,7 @@ int __weak arch_show_interrupts(struct seq_file *p, int p=
rec)
 static DEFINE_RAW_SPINLOCK(irq_proc_constraints_lock);
=20
 static struct irq_proc_constraints {
-	bool		print_header;
+	loff_t		first_pos;
 	unsigned int	num_prec;
 	unsigned int	chip_width;
 } irq_proc_constraints __read_mostly =3D {
@@ -543,14 +543,13 @@ static int irq_seq_show(struct seq_file *p, void *v)
 	struct irqaction *action;
=20
 	/* Print header for the first interrupt? */
-	if (constr->print_header) {
+	if (p->index =3D=3D constr->first_pos) {
 		unsigned int cpu;
=20
 		seq_printf(p, "%*s", constr->num_prec + 8, "");
 		for_each_online_cpu(cpu)
 			seq_printf(p, "CPU%-8d", cpu);
 		seq_putc(p, '\n');
-		constr->print_header =3D false;
 	}
=20
 	if (desc =3D=3D ARCH_PROC_IRQDESC)
@@ -635,14 +634,25 @@ static void *irq_seq_next_desc(loff_t *pos)
=20
 static void *irq_seq_start(struct seq_file *f, loff_t *pos)
 {
-	if (!*pos) {
-		struct irq_proc_constraints *constr =3D f->private;
+	struct irq_proc_constraints *constr =3D f->private;
+	bool first =3D !*pos;
+	void *ret;
=20
+	if (first) {
 		constr->num_prec =3D READ_ONCE(irq_proc_constraints.num_prec);
 		constr->chip_width =3D READ_ONCE(irq_proc_constraints.chip_width);
-		constr->print_header =3D true;
 	}
-	return irq_seq_next_desc(pos);
+
+	ret =3D irq_seq_next_desc(pos);
+
+	/*
+	 * Record position of the first output record so that irq_seq_show()
+	 * knows where to write the header.
+	 */
+	if (first)
+		constr->first_pos =3D *pos;
+
+	return ret;
 }
=20
 static void *irq_seq_next(struct seq_file *f, void *v, loff_t *pos)
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 5d02c36c40e3..7fc2200392cd 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -350,8 +350,8 @@ static inline void ksoftirqd_run_end(void)
 	local_irq_enable();
 }
=20
-static inline void softirq_handle_begin(void) { }
-static inline void softirq_handle_end(void) { }
+static inline bool softirq_handle_begin(void) { return false; }
+static inline void softirq_handle_end(bool from_irq_exit) { }
=20
 static inline bool should_wake_ksoftirqd(void)
 {
@@ -481,15 +481,38 @@ void __local_bh_enable_ip(unsigned long ip, unsigned in=
t cnt)
 }
 EXPORT_SYMBOL(__local_bh_enable_ip);
=20
-static inline void softirq_handle_begin(void)
+static inline bool softirq_handle_begin(void)
 {
-	__local_bh_disable_ip(_RET_IP_, SOFTIRQ_OFFSET);
+	if (!in_hardirq()) {
+		__local_bh_disable_ip(_RET_IP_, SOFTIRQ_OFFSET);
+		return false;
+	}
+
+	/*
+	 * Only reached from irq_exit(), with HARDIRQ_OFFSET still set.
+	 * Replace it with SOFTIRQ_OFFSET before handle_softirqs() enables
+	 * interrupts. Use the raw operation to preserve the preemption
+	 * disable location recorded by irq_enter_rcu(), and update lockdep
+	 * directly.
+	 */
+	__preempt_count_sub(HARDIRQ_OFFSET - SOFTIRQ_OFFSET);
+	lockdep_softirqs_off(_RET_IP_);
+	WARN_ON_ONCE(irq_count() !=3D SOFTIRQ_OFFSET);
+
+	return true;
 }
=20
-static inline void softirq_handle_end(void)
+static inline void softirq_handle_end(bool from_irq_exit)
 {
-	__local_bh_enable(SOFTIRQ_OFFSET);
-	WARN_ON_ONCE(in_interrupt());
+	if (!from_irq_exit) {
+		__local_bh_enable(SOFTIRQ_OFFSET);
+		WARN_ON_ONCE(in_interrupt());
+		return;
+	}
+
+	lockdep_softirqs_on(_RET_IP_);
+	__preempt_count_add(HARDIRQ_OFFSET - SOFTIRQ_OFFSET);
+	WARN_ON_ONCE(irq_count() !=3D HARDIRQ_OFFSET);
 }
=20
 static inline void ksoftirqd_run_begin(void)
@@ -605,6 +628,7 @@ static void handle_softirqs(bool ksirqd)
 	unsigned long old_flags =3D current->flags;
 	int max_restart =3D MAX_SOFTIRQ_RESTART;
 	struct softirq_action *h;
+	bool from_irq_exit;
 	bool in_hardirq;
 	__u32 pending;
 	int softirq_bit;
@@ -618,7 +642,7 @@ static void handle_softirqs(bool ksirqd)
=20
 	pending =3D local_softirq_pending();
=20
-	softirq_handle_begin();
+	from_irq_exit =3D softirq_handle_begin();
 	in_hardirq =3D lockdep_softirq_start();
 	account_softirq_enter(current);
=20
@@ -645,8 +669,8 @@ static void handle_softirqs(bool ksirqd)
 		h->action();
 		trace_softirq_exit(vec_nr);
 		if (unlikely(prev_count !=3D preempt_count())) {
-			pr_err("huh, entered softirq %u %s %p with preempt_count %08x, exited wit=
h %08x?\n",
-			       vec_nr, softirq_to_name[vec_nr], h->action,
+			pr_err("huh, entered softirq %u %s with preempt_count %08x, exited with %=
08x?\n",
+			       vec_nr, softirq_to_name[vec_nr],
 			       prev_count, preempt_count());
 			preempt_count_set(prev_count);
 		}
@@ -670,7 +694,7 @@ static void handle_softirqs(bool ksirqd)
=20
 	account_softirq_exit(current);
 	lockdep_softirq_end(in_hardirq);
-	softirq_handle_end();
+	softirq_handle_end(from_irq_exit);
 	current_restore_flags(old_flags, PF_MEMALLOC);
 }
=20
@@ -716,7 +740,7 @@ static inline void tick_irq_exit(void)
=20
 	/* Make sure that timer wheel updates are propagated */
 	if ((sched_core_idle_cpu(cpu) && !need_resched()) || tick_nohz_full_cpu(cpu=
)) {
-		if (!in_hardirq())
+		if (hardirq_count() =3D=3D HARDIRQ_OFFSET)
 			tick_nohz_irq_exit();
 	}
 #endif
@@ -748,8 +772,12 @@ static inline void __irq_exit_rcu(void)
 	lockdep_assert_irqs_disabled();
 #endif
 	account_hardirq_exit(current);
-	preempt_count_sub(HARDIRQ_OFFSET);
-	if (!in_interrupt() && local_softirq_pending()) {
+
+	/*
+	 * HARDIRQ_OFFSET is still set. Only the outermost interrupt handles
+	 * softirqs, and only if it did not hit a softirq or BH disabled section.
+	 */
+	if (irq_count() =3D=3D HARDIRQ_OFFSET && local_softirq_pending()) {
 		/*
 		 * If we left hrtimers unarmed, make sure to arm them now,
 		 * before enabling interrupts to run softirq.
@@ -758,11 +786,17 @@ static inline void __irq_exit_rcu(void)
 		invoke_softirq();
 	}
=20
+	/*
+	 * Wake the timer thread even if the interrupt hit a softirq or a
+	 * section with BHs disabled. Only the outermost interrupt can wake it.
+	 */
 	if (IS_ENABLED(CONFIG_IRQ_FORCED_THREADING) && force_irqthreads() &&
-	    local_timers_pending_force_th() && !(in_nmi() | in_hardirq()))
+	    local_timers_pending_force_th() &&
+	    hardirq_count() =3D=3D HARDIRQ_OFFSET)
 		wake_timersd();
=20
 	tick_irq_exit();
+	preempt_count_sub(HARDIRQ_OFFSET);
 }
=20
 /**

