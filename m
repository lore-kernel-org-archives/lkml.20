Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820812;
	b=xAK8YP/9r4IgAsHpT2cbcGGThlYHQ0D5kbdvEYz58upnE2XPR505dhhzLLFllvd2IvpN
	 xCgkblAnlWRiV3+H42MWI0o2p0fcQkMtH2/uBZtOwUu9xBHfpQXanQGgo+sresdMYk1hb
	 KZQN1uwe3U5deqGmUp6u2Pz7pn5mbP48m8UEe8BeQ/ItQ8OfeWylO1D4vipLDcMgjTTAv
	 klwmvIVDRdTxyYJ9/bJ7lY8PpnpYbRdV7DmyuYcvJw+Y97CX+wpzdd5dujXEsbGvfOt0f
	 rseXtp4tZh+CZ3cmMWkm5q8sJ0LDMrTDRzoaVFbSneCw5K4ywZlAlsAc7ps/HHCE26g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820812;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=n++1FYR53av45IT7y6ZwZLuw9qOcPTWy9lKraHjXFG4=;
	b=atY5cNNGAHeEY3Ni392yWj90FzqeJBngSPoSIaPwUeJVxzvHvChKUfdwQ+6H7sGhxG/x
	 dxQpiR9pl13wkzHMv7aY0tWH/QCpc5PQfikfm7j1Byhu141JGZZVaiCQPkwYwqyp9diZI
	 l7eLu3H45IGrY5K7W4quTikBcrDLasFMnIh9JZBwoUrYC/j4DU0LxOHIzBhKP06mJR3QU
	 oCfmbMbYMbhM05/NlkwCC4m1x73uUx+n+ebaTHl63FryeSCRDujzPT8Fbom/VVwpi0IBi
	 q1IkWXVUy2VeFTC4LrBtRAlPsstoC143CA4zM9RcPSlOSqXnzMB1Z5WyqEWNJ+FRz2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=H4Ka9C7t;
	arc=none smtp.remote-ip=115.124.28.52
Received: from out28-52.mail.aliyun.com (out28-52.mail.aliyun.com [115.124.28.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E16A606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E16A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=H4Ka9C7t
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1794820802; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=n++1FYR53av45IT7y6ZwZLuw9qOcPTWy9lKraHjXFG4=;
	b=H4Ka9C7ti0t20AwTisqYT+AGbrWQXoxERHogb301Hg3FQ7vGrjuLMCZ+zVg0+xXHmvakrs9+8Jm+mOT31zAORK0548Z8zHF+xFzRthNNlCTtzulRMmhK331/mZW6xA9Bv5oOZr+rcQYhYME2nJFAvKz9Cyr7GfEb9XjGcXEWKiQ=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.102071-0.00272966-0.895199;FP=3065667248978472099|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034254;MF=wangqk1@xiaopeng.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.k34O6Nd_1794820801;
Received: from DESKTOP-EL1SUEF.xiaopeng.local(mailfrom:wangqk1@xiaopeng.com fp:SMTPD_---.k34O6Nd_1794820801 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 16 Nov 2026 17:20:02 +0800
From: wangqk1 <wangqk1@xiaopeng.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org,
	xiedl3@xiaopeng.com
Subject: [PATCH] sched/rt: Quiesce RTO push before stopping CPUs on shutdown
Date: Mon, 16 Nov 2026 17:20:00 +0800
Message-ID: <20261116092000.120707-1-wangqk1@xiaopeng.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On arm64, machine_power_off(), machine_halt(), and machine_restart()
call smp_send_stop() without running CPU hotplug teardown. A stopped CPU
clears its online bit and parks, while its RT overload bit can remain in
root_domain::rto_mask.

An RTO push relay still in flight can select that stale bit and call
irq_work_queue_on() for the parked CPU, triggering
WARN_ON_ONCE(cpu_is_offline(cpu)). This was observed during normal
poweroff of a PREEMPT_RT kernel under RT load, about 5 ms after the
"Power down" message:

  irq_work_queue_on+0x138/0x148
  rto_push_irq_work_func+0x98
  irq_work_single
  generic_smp_call_function_single_interrupt

A cpu_online() check in rto_next_cpu() cannot close this race because
the target can stop after the check but before irq_work_queue_on().
Checking a shutdown flag only in rto_next_cpu() has the same problem:
a sender can be delayed after the check and resume after another CPU
has been stopped.

Quiesce RTO push from a syscore shutdown hook, before the machine
specific shutdown path can stop any CPU. rto_next_cpu() checks
rto_push_stopped for early termination, but correctness is enforced at
both actual queueing sites. tell_cpu_to_push() starts a relay chain, and
rto_push_irq_work_func() relays work to the next overloaded CPU.

Both sites use rto_push_queue(), which holds a global raw spinlock
across the final rto_push_stopped check and irq_work_queue_on(). The
shutdown hook takes the same lock before setting rto_push_stopped.

This gives two possible interleavings. If a sender gets the lock first,
queueing completes before the shutdown hook returns, hence before
smp_send_stop() can take the target offline. If shutdown gets the lock
first, the sender observes rto_push_stopped and does not queue. A raw
spinlock is required because the relay runs in hardirq context and must
also work on PREEMPT_RT. irq_work_queue_on() only claims and queues the
work and, for a remote CPU, sends an IPI. It does not wait for the remote
callback, so the lock critical section has no callback wait.

When the initial queue operation is rejected, tell_cpu_to_push() drops
the root_domain reference it just acquired. When a relay is rejected,
rto_push_irq_work_func() drops the reference owned by the chain. The
existing cpu < 0 path continues to release that reference as before.

There is no root_domain enumeration and no irq_work_sync(). Enumeration
through cpu_rq(cpu)->rd can miss an old root_domain that cpuset partition
changes detached from every runqueue while an in-flight chain still
holds a reference. Waiting for hard irq_work with irq_work_sync() also
introduces an unbounded shutdown wait. The final queueing gate covers
old and new root_domains without either dependency.

An RCU alternative was considered. The final check and queue operation
could run inside rcu_read_lock(), with shutdown setting
rto_push_stopped and then calling synchronize_rcu(). The grace period
would ensure that a sender which already passed the check finishes
queueing before any CPU is stopped.

RCU was not chosen because shutdown would then depend on a system-wide
RCU grace period, including unrelated readers and quiescent-state
progress, rather than only on short RTO queueing critical sections.
A delayed or stalled grace period would delay poweroff, halt, restart,
or kexec. The lock has the narrower liveness dependency and does not
wait for remote callbacks. Using only READ_ONCE(), an atomic flag, or a
static branch without a grace period or equivalent sender
synchronization would leave the original check-to-queue race open.

Each initial or relayed queue operation takes a global raw spinlock only
around the final flag check and irq_work_queue_on(), not around target
scanning, RT task pushing, or remote callback execution.

A/B testing on a 20-CPU arm64 6.18.14-rt4 PREEMPT_RT system used an RT
overload workload. The A/B latency differences were smaller than the
A/A run-to-run variation and could not be attributed to the patch.
These measurements do not isolate the cost of the lock or establish
zero overhead. Testing covered only the default root_domain.

This change prevents new RTO work from being queued after the shutdown
hook. It does not drain work that was already queued and does not clear
rto_mask. Work left on a CPU that is subsequently parked need not run
because the system is terminating. Panic and crash kexec do not pass
through syscore_shutdown() and retain their existing behavior.

Link: https://lore.kernel.org/linux-kernel/20261013030140.682182-2-wangqk1@xiaopeng.com/
Signed-off-by: wangqk1 <wangqk1@xiaopeng.com>
---
Test details:

The equivalent change was A/B tested on a 20-CPU arm64 6.18.14-rt4
PREEMPT_RT system, with five 60-second runs per kernel:

  cyclictest -t 80 -p 90 -i 50 -d 0 -D 60 -m -h 400 -q
  while :; do hackbench -g 50 -l 5000 -f 25; done  # background load

  Latency (us)          Without patch    With patch       Delta
  Median min                   1.137          1.163       +2.20%
  Median avg                   4.500          4.575       +1.67%
  Median max                  92.000         92.000        0.00%
  Worst max                   95             94          -1.05%

  rto_push_irq_work_func  Without patch    With patch
  Probe hits / 10.16 s              8372         11692
  Probe hits / second                824          1151

  A/A median avg drift, first two vs last two runs: 4.14%

The test binaries were identical, and probes were removed before the
formal runs with tracing disabled. The test did not cover concurrent
cpuset partitions.

This mainline version was build-tested with x86_64 defconfig as
kernel/sched/rt.o. No runtime testing was performed on this mainline
tree. The measurements above used the equivalent arm64 6.18 change.

 kernel/sched/rt.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 1535046a23ff..5431ca7dc7e9 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -4,6 +4,8 @@
  * policies)
  */
 
+#include <linux/syscore_ops.h>
+
 #include "sched.h"
 #include "pelt.h"
 
@@ -2087,6 +2089,17 @@ static void push_rt_tasks(struct rq *rq)
 
 #ifdef HAVE_RT_PUSH_IPI
 
+/*
+ * The shutdown paths stop secondary CPUs without hotplug teardown, leaving
+ * their RT overload bits in rto_mask. An rto push relay can then select a
+ * stopped CPU and queue irq_work to it.
+ *
+ * Serialize the final stopped check and the queue operation with the syscore
+ * shutdown hook, so no new work can be queued after the hook returns.
+ */
+static bool rto_push_stopped;
+static DEFINE_RAW_SPINLOCK(rto_push_queue_lock);
+
 /*
  * When a high priority task schedules out from a CPU and a lower priority
  * task is scheduled in, a check is made to see if there's any RT tasks
@@ -2134,6 +2147,12 @@ static int rto_next_cpu(struct root_domain *rd)
 	int next;
 	int cpu;
 
+	/* Shutdown has disabled rto push queueing. */
+	if (unlikely(READ_ONCE(rto_push_stopped))) {
+		rd->rto_cpu = -1;
+		return -1;
+	}
+
 	/*
 	 * When starting the IPI RT pushing, the rto_cpu is set to -1,
 	 * rt_next_cpu() will simply return the first CPU found in
@@ -2190,6 +2209,24 @@ static inline void rto_start_unlock(atomic_t *v)
 	atomic_set_release(v, 0);
 }
 
+/*
+ * Return false if the caller must drop the reference held by the push chain.
+ */
+static bool rto_push_queue(struct root_domain *rd, int cpu)
+{
+	unsigned long flags;
+	bool allowed = false;
+
+	raw_spin_lock_irqsave(&rto_push_queue_lock, flags);
+	if (likely(!READ_ONCE(rto_push_stopped))) {
+		irq_work_queue_on(&rd->rto_push_work, cpu);
+		allowed = true;
+	}
+	raw_spin_unlock_irqrestore(&rto_push_queue_lock, flags);
+
+	return allowed;
+}
+
 static void tell_cpu_to_push(struct rq *rq)
 {
 	int cpu = -1;
@@ -2219,7 +2256,8 @@ static void tell_cpu_to_push(struct rq *rq)
 	if (cpu >= 0) {
 		/* Make sure the rd does not get freed while pushing */
 		sched_get_rd(rq->rd);
-		irq_work_queue_on(&rq->rd->rto_push_work, cpu);
+		if (!rto_push_queue(rq->rd, cpu))
+			sched_put_rd(rq->rd);
 	}
 }
 
@@ -2257,8 +2295,38 @@ void rto_push_irq_work_func(struct irq_work *work)
 	}
 
 	/* Try the next RT overloaded CPU */
-	irq_work_queue_on(&rd->rto_push_work, cpu);
+	if (!rto_push_queue(rd, cpu))
+		sched_put_rd(rd);
+}
+
+/*
+ * Called with all CPUs still running, before machine_*() stops them. A sender
+ * either completes queueing before this hook returns, or observes the stopped
+ * state and drops its chain reference without queueing.
+ */
+static void rto_push_shutdown(void *data)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&rto_push_queue_lock, flags);
+	WRITE_ONCE(rto_push_stopped, true);
+	raw_spin_unlock_irqrestore(&rto_push_queue_lock, flags);
+}
+
+static const struct syscore_ops rto_push_syscore_ops = {
+	.shutdown = rto_push_shutdown,
+};
+
+static struct syscore rto_push_syscore = {
+	.ops = &rto_push_syscore_ops,
+};
+
+static int __init rto_push_syscore_init(void)
+{
+	register_syscore(&rto_push_syscore);
+	return 0;
 }
+device_initcall(rto_push_syscore_init);
 #endif /* HAVE_RT_PUSH_IPI */
 
 static void pull_rt_task(struct rq *this_rq)
