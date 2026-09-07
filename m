Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1946C18DB2A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771511; cv=none; b=MGSmb9npUed7oe/QTGuSAAEThmQzYsWWnvNaZKrpa+93YxBnxNKd1pkhAv218Jat2C/i09bAg97JQDRVLuAjxke3oj56qz9SpOoTAkkQVQHec/VdJtvJTttt5xZDEe7BcAKT7y3eTxSj4OyLoYcVDC5sbPseQyrnnvBED2ik3OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771511; c=relaxed/simple;
	bh=eXWy9KsnkQKWsibdmTwCSWnahP6gUOLu80uexQgNmd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+srVIIAjvQsTbKhAJBXHNSwAqvkTqh993DdxnYBmaP86CFkjtDKgdpu7XEMBc5alAtJSkbl3IMpW2LGkGIB+8rx4j2rF51hiDDFdUrqmvMC3WpJ8Wg+PAI10M4A4MTprDcwe7a28DHWjbTC5ixFrMk4iKTtjDoDC/jp9u3/pZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rZZgbnQq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ASCaIR4P; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rZZgbnQq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ASCaIR4P"
Date: Mon, 7 Sep 2026 10:58:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788771507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IWShzSpNemoixNCKQ1tHGMIBJaTjZdIz7azemrEJ/1A=;
	b=rZZgbnQqldGMwax8BJQwUu7sIAj6JLfxe/390bXxDGcAsqDdJJih2NM5TxqeA7NT4CX3Es
	shjCSQqMyopdZkNnOE17ZByTlLDB/zv/MqROtFVs57Y6IfXxOUkMUkajUw1CZazY6XTFYI
	C+xFfM4QmnhW0CrSyqU0GeP05/2CpAVGJvYXn4s5ia0Lw1i7V6rcm6QJs5x4RuzlDUbUGD
	PQriX6JZD8xNQnKtZDFrpuBST09rM8Ty/bhE3Q4IJDydjFgnqwTQrVjCJv787rvysHTMun
	KkdRqL9qY2U319t0FPx0mUpQdwteYYqLLGLKWbXtrEf7PhwgiKHJGhCN54xI8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788771507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IWShzSpNemoixNCKQ1tHGMIBJaTjZdIz7azemrEJ/1A=;
	b=ASCaIR4PEgRgy1L7ObRxOXTJYbF/c8WL696tYVfpaFrzlhcW0Yl3iqXrk0tm/6qoROf380
	tq+f7pQKDTY/GWAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: syzbot <syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org
Cc: syzkaller-bugs@googlegroups.com, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [RFC PATCH] sched: irq: cpu-hotplug race vs set_cpus_allowed_ptr()
Message-ID: <20260907085825.f-CZ1Q5y@linutronix.de>
References: <6a9919ac.94649fcc.25487e.0005.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6a9919ac.94649fcc.25487e.0005.GAE@google.com>

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
task_struct::migration_pending set but it is NULL because noone
requested an affinity change while the task was in migrate-disable
section.

I see two ways of fixing this:
- Holding the cpus_read_lock while set_cpus_allowed_ptr() is invoked.
  This ensure that the CPU remains in the cpu_online_mask while the
  migration task moving the task over. Should the mask be already
  invalid, then it is rejected otherwise the operaton completes.
  Maybe we should also check if cpus_read_lock is held during the
  invocation of set_cpus_allowed_ptr() so we don't get this problem from
  other callers.

- Should __migrate_task() fail to return the requested rq make sure its
  CPU is part task_struct::cpus_mask. This ensures that the current CPU
  is still part of mask avoiding a possible push by migrate_enable().
  sched_class::set_cpus_allowed did not see this mask. It might be a bit
  inconsistent and feels a bit like select_fallback_rq() without the
  printk.

Both changes are implemented to illustrate, one is enough.
I can reproduce this back on v6.8, therefore I assume we have this since
day #1 of migrate-disable.

Reported-by: syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6a9919ac.94649fcc.25487e.0005.GAE@google.com/
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/irq/manage.c | 6 ++++--
 kernel/sched/core.c | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 57eff26fa646a..75b6798c1d97c 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -8,6 +8,7 @@
 
 #define pr_fmt(fmt) "genirq: " fmt
 
+#include <linux/cpuhplock.h>
 #include <linux/irq.h>
 #include <linux/kthread.h>
 #include <linux/module.h>
@@ -1044,8 +1045,9 @@ static void irq_thread_check_affinity(struct irq_desc *desc, struct irqaction *a
 		m = irq_data_get_effective_affinity_mask(&desc->irq_data);
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
index b998ef6b87af4..b090a374fa728 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2674,6 +2674,8 @@ static int migration_cpu_stop(void *data)
 		if (task_on_rq_queued(p)) {
 			update_rq_clock(rq);
 			rq = __migrate_task(rq, &rf, p, arg->dest_cpu);
+			if (rq != cpu_rq(arg->dest_cpu))
+				cpumask_set_cpu(rq->cpu, &p->cpus_mask);
 		} else {
 			p->wake_cpu = arg->dest_cpu;
 		}
-- 
2.55.0

