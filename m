Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44383783BB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801591; cv=none; b=orAWWPD05l2MEYvUBW4h/2cbFlMeH2r6OLKpvMslS+i+Sl0QXY/Yrd1xAZZR8HqqhtaelYAIwuYEYOiTyRw8XPyvQvEelUYYk2ijxmAl1waJsZ0zc0NcpemN2rLNeIFzzGJTRxHxnxzFTH4nseBcSxUSxtm9lwe+vtflWpRML0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801591; c=relaxed/simple;
	bh=okcEIJH7GFF4AW5kN1B5wpZMQI+aGdR2ruVQdZ+dc7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cX06qwzHuJtvehmft9SOwUFr4cUYwdNfGpOM06+Q6P7lfJ8XsfHZXu5aqSwAyP3Qh8m0qRvDyiO1BAK3BOZY5YIaFAUpEl+YzFwatiwPOGFmWKF66CaqYUg2O7YOT5slYG/vEk9kic61HDm9qshRYuDHJz7Jn3Nqgl/VO4XmLLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PNUNI7Vq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xndS3Oen; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PNUNI7Vq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xndS3Oen"
Date: Mon, 12 Oct 2026 12:39:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791801587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U6h7MCBN0PR5UEqXz+h1WBgI29H1YjPXsRqL1KmkGZU=;
	b=PNUNI7VqHBRPPNxdIGQES12R8jyqvweCldaOBQ/cfvMM7McQDCCbK6IarlwqNu7elceVto
	b+piJL27yhKcEJMCpp9EcY+sdW30SUxDa/Cq1O1dxYSkjaYOK5rgMVZzL6Yyk6pVOsRG3g
	EqLIUxBjFGB6Q4HtTZBi4wpSvB3e9d+DTABb6sxN3gMTrp7/WnQL6kARibZT5qpSgOUm1G
	IqkG3M7AZyFEHASV0TZLDz+J7oG45xNQGM3Zia+Q2wVG+6c//XrIL+MkomLgTywVBkYV/J
	u8wj5nTV0nteNqtNG4naTdWSvUUdACSH7G2Y81ZDJK9MbJsBxeNenp0UuzP9wQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791801587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U6h7MCBN0PR5UEqXz+h1WBgI29H1YjPXsRqL1KmkGZU=;
	b=xndS3Oen2HMfzwfTlJqnk25+OFzVwzMtpMzBCR5mwVo0ROHSjA/EtRVtv1Hq+QMKsc4O5V
	8SpxW1I/GUwXlEBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: syzbot <syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [RFC PATCH v2] sched: irq: cpu-hotplug race vs set_cpus_allowed_ptr()
Message-ID: <20261012103946.aOSAmrRe@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

syzbot reported a race of assigning a CPU affinity during CPU hotplug
operation.
After the affinity of an IRQ has been changed, the IRQ-core sets
IRQTF_AFFINITY and wakes the relevant interrupt threads which need to
adjust their affinity mask. The thread will then invoke
set_cpus_allowed_ptr() to update the mask. Based on the new mask a CPU
is chosen on which the thread should run.

It is verified that this CPU is online however there is no guarantee
that this CPU remains online while affine_move_task() is moving _this_
task. Since the current task requests the migration the stopper/
migration_cpu_stop() is involved at which point the task pauses for a
while. If the CPU goes offline (or is no longer cpu_online_mask) then
__migrate_task() (due to is_cpu_allowed() reject) will return the rq of
the CPU on which the task is currently running (which does not match
it's task_struct::cpus_mask).

The aftermath:
The IRQ-thread's CPU and task's cpus_mask do not match. A
migrate_disable()-> schedule() will change task_struct::cpus_ptr
ensuring that the following migrate_enable() will update the task to the
requested affinity mask. At this point, affine_move_task() expects
task_struct::migration_pending set but it is NULL because no one
requested an affinity change while the task was in migrate-disable
section.

I see two ways of fixing this:
- Holding the cpus_read_lock while set_cpus_allowed_ptr() is invoked.
  This ensure that the CPU remains in the cpu_online_mask while the
  migration task moving the task over. Should the mask be already
  invalid, then it is rejected otherwise the operation completes.

  sashiko complains about deadlock of cpus_write_lock() in the CPU down
  path and calling irq_migrate_all_off_this_cpu() vs
  irq_thread_check_affinity() doing cpus_read_lock().
  As far as I see, there is no deadlock because the mask is updated, the
  tread is woken, the tread blocks with cpus_read_lock() until the CPU is
  down.
  There is nothing that waits for the interrupt thread to complete,
  there is no synchronize_irq() invocation which would be required for
  the deadlock to happen.

- Should __migrate_task() fail to return the requested rq make sure its
  CPU is part task_struct::cpus_mask. This ensures that the current CPU
  is still part of mask avoiding a possible push by migrate_enable().
  sched_class::set_cpus_allowed did not see this mask. It might be a bit
  inconsistent and feels a bit like select_fallback_rq() without the
  printk.

  Sashiko complains:
| If __migrate_task() fails (e.g., due to a concurrent CPU offline event), =
this
| fallback code forcibly modifies p->cpus_mask with cpumask_set_cpu(). This
| skips the required p->sched_class->set_cpus_allowed() callback and fails =
to
| update p->nr_cpus_allowed.
| Can this bypass global EDF real-time invariants for SCHED_DEADLINE (as
| set_cpus_allowed_dl() is skipped), and allow unprivileged tasks to escape
| affinity boundaries, giving them access to CPUs outside their cpusets?

  We did do_set_cpus_allowed() for CPU X and can't migrate there now. We
  also don't know if the invocation was successful.
 =20
  Looking at this, it is not possible acquire the CPU-hotplug lock here
  and not every caller holds it. This seems to be limited to
  migrate-disable. Should this happen without the lock, then during the
  wake-up the scheduler will just print "process =E2=80=A6 no longer affine=
 to
  cpu" pick a CPU and be done with it.
  Maybe set the bit followed by do_set_cpus_allowed()?

Both changes are implemented to illustrate, one is enough.
I can reproduce this back on v6.8, therefore I assume we have this since
day #1 of migrate-disable.

Reported-by: syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6a9919ac.94649fcc.25487e.0005.GAE@googl=
e.com/
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

v1=E2=80=A6v2: https://lore.kernel.org/all/20260907085825.f-CZ1Q5y@linutron=
ix.de/
  - Repost with collected notes.

 kernel/irq/manage.c | 6 ++++--
 kernel/sched/core.c | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 57eff26fa646a..75b6798c1d97c 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -8,6 +8,7 @@
=20
 #define pr_fmt(fmt) "genirq: " fmt
=20
+#include <linux/cpuhplock.h>
 #include <linux/irq.h>
 #include <linux/kthread.h>
 #include <linux/module.h>
@@ -1044,8 +1045,9 @@ static void irq_thread_check_affinity(struct irq_desc=
 *desc, struct irqaction *a
 		m =3D irq_data_get_effective_affinity_mask(&desc->irq_data);
 		cpumask_copy(mask, m);
 	}
-
-	set_cpus_allowed_ptr(current, mask);
+	scoped_guard(cpus_read_lock) {
+		set_cpus_allowed_ptr(current, mask);
+	}
 	free_cpumask_var(mask);
 }
 #else
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1fe40de6ebe3c..5896be82e6ddc 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2674,6 +2674,8 @@ static int migration_cpu_stop(void *data)
 		if (task_on_rq_queued(p)) {
 			update_rq_clock(rq);
 			rq =3D __migrate_task(rq, &rf, p, arg->dest_cpu);
+			if (rq !=3D cpu_rq(arg->dest_cpu))
+				cpumask_set_cpu(rq->cpu, &p->cpus_mask);
 		} else {
 			p->wake_cpu =3D arg->dest_cpu;
 		}
--=20
2.55.0

