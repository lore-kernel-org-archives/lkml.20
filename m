Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5B444A3F4;
	Mon, 28 Sep 2026 07:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578888; cv=none; b=j5m4V3hXHWRGfV5gAkYIv2Xx7JOjith3CuP8BgwjmMXRXCHSCGD0sGEQNboc4VS92VeD9oohaHtmPqhYxPEUV32c4raVGPUyw8mpXVA/tNFd2rKCo21YSgJm2bokYdFCSpKbzrkWy3lNdLXnl8AjXkmywFHQiyvI2TKRnLBXsOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578888; c=relaxed/simple;
	bh=f50bVbVia2pXYcEZeIY94Fa+D9mZUASCi/9qBKIsozU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=K8BXAM7R4QJxarlF4nmhcL0C7tuq024T01Jvexhfi0/AfZf5IcLfks6Mt0H/NF37SMkm6OrtToDDFms3K1UCapfMbL/zBElUGCFPv8st41JhsvWAGKyd5ajSsF5xJfwgaaGA4mSjIrh1PWRcyS4UQqN7an7PFexGzqSrBAe299I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HvJysac4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9Ynr3aat; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HvJysac4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9Ynr3aat"
Date: Mon, 28 Sep 2026 07:01:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578882;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j6A5lYdRMA8+ip48Z/WWZ7cKK5hPBwSAjhxitb5AjYI=;
	b=HvJysac4j5MECrsYg9Lz2QR/FnMiQ3gXryMgkc4aIu+H4NxXD8CaQ/vEqF7P1NX2VtEFil
	X0tTkuWlFGdf7UVIQtsu3IaP11H99x5GOURXw90JaT7sUvI99uvOkJ/G+lx2FWazeOoIOC
	EENqCZB/er5YDPAvUrN5yRYBHLB2gUpLj3M/nRvEOtRcFZg9cK9pKalDT8aGY1oTh/9hP1
	kZkhmIJRiP9hkgAL8VTTDeZIcSFTh+rhJSQe60HfhuHF5wllRSKTjNfZfm1f+ADIgpv4xe
	Fc6jPPJ1P94Jie+4IHc6Uqyow3xxGb/14P/34Yo8oACSN8ng3QQsmNheI2cL4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578882;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j6A5lYdRMA8+ip48Z/WWZ7cKK5hPBwSAjhxitb5AjYI=;
	b=9Ynr3aat/70gKQdGMv9RT2gOt+MgcCigMNUbR5yfWv8m2IigVAORLsYbHYSSUdLkrUe58q
	X4H6iwfil1SvXfDA==
From: "tip-bot2 for Shrikanth Hegde" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/core: Push current task from non preferred CPU
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260928053728.797539-9-sshegde@linux.ibm.com>
References: <20260928053728.797539-9-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057888089.3910103.6669917755117281383.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     74699f56ebcfe0f401ee6ce4c5a72822101bb222
Gitweb:        https://git.kernel.org/tip/74699f56ebcfe0f401ee6ce4c5a72822101=
bb222
Author:        Shrikanth Hegde <sshegde@linux.ibm.com>
AuthorDate:    Mon, 28 Sep 2026 11:07:23 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:42 +02:00

sched/core: Push current task from non preferred CPU

Actively push out the current running task on a non-preferred CPU (NPC).
Since the task is currently running, a stopper thread must be queued
to push the task out. However, if the task is pinned only to
non-preferred CPUs, it will continue running there.
This helps to maintain userspace affinities, unlike CPU hotplug
or isolated cpusets.

The implementation follows the structure of __balance_push_cpu_stop(),
but is kept separate to handle the preferred-CPU specific conditions and
pending-work state under CONFIG_PREFERRED_CPU.

Add the npc_push_work_pending flag to protect the work buffer.

For now, only the currently running task is pushed out. This keeps the code
simpler. In the future, an optimization may be added to move all queued
tasks on the runqueue.

This works only for the FAIR scheduling class.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260928053728.797539-9-sshegde@linux.ibm.com
---
 kernel/sched/core.c  | 83 +++++++++++++++++++++++++++++++++++++++++++-
 kernel/sched/sched.h |  9 +++++-
 2 files changed, 92 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index d095fb1..0e40055 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5829,6 +5829,9 @@ void sched_tick(void)
 	unsigned long hw_pressure;
 	u64 resched_latency;
=20
+	if (!cpu_preferred(cpu))
+		sched_push_current_non_preferred_cpu(rq);
+
 	if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
 		arch_scale_freq_tick();
=20
@@ -11253,3 +11256,83 @@ void sched_change_end(struct sched_change_ctx *ctx)
 		p->sched_class->prio_changed(rq, p, ctx->prio);
 	}
 }
+
+#ifdef CONFIG_PREFERRED_CPU
+static DEFINE_PER_CPU(struct cpu_stop_work, npc_push_task_work);
+
+static int sched_non_preferred_cpu_push_stop(void *arg)
+{
+	struct task_struct *p =3D arg;
+	struct rq *rq =3D this_rq();
+	struct rq_flags rf;
+	int cpu;
+
+	if (cpu_preferred(rq->cpu)) {
+		scoped_guard(rq_lock_irqsave, rq)
+			rq->npc_push_work_pending =3D false;
+		put_task_struct(p);
+		return 0;
+	}
+
+	scoped_guard (raw_spinlock_irq, &p->pi_lock) {
+		/*
+		 * select_fallback_rq() may acquire the rq lock in case of
+		 * fallback. So call it before grabbing rq lock. If the task
+		 * migrates to another CPU before the rq lock is acquired,
+		 * subsequent validation of task's current rq will help to
+		 * safely bail out.
+		 */
+		cpu =3D select_fallback_rq(rq->cpu, p);
+		rq_lock(rq, &rf);
+		rq->npc_push_work_pending =3D false;
+		update_rq_clock(rq);
+		context_unsafe_alias(rq);
+
+		if (task_rq(p) =3D=3D rq && task_on_rq_queued(p))
+			rq =3D __migrate_task(rq, &rf, p, cpu);
+		rq_unlock(rq, &rf);
+	}
+
+	put_task_struct(p);
+	return 0;
+}
+
+/*
+ * Push the current task running on non-preferred CPU(npc).
+ * Using this non preferred CPU will lead to more contention
+ * in the host. So it is better not to use this CPU.
+ *
+ * Since task is running, call a stopper to push the task out. This is
+ * similar to how task moves during hotplug. In select_fallback_rq() a
+ * preferred CPU will be chosen and henceforth task shouldn't come back to
+ * this CPU again.
+ *
+ * Works for FAIR class only.
+ *
+ * If task is affined only on non-preferred CPUs, no point in moving it out.
+ */
+void sched_push_current_non_preferred_cpu(struct rq *rq)
+{
+	struct task_struct *push_task =3D rq->curr;
+
+	scoped_guard(rq_lock, rq) {
+		/* Push the task if its explicit affinity allows */
+		if (!task_can_migrate_to_preferred(push_task, rq->cpu))
+			return;
+
+		/* There is already a stopper thread. Don't race with it. */
+		if (rq->npc_push_work_pending)
+			return;
+
+		if (is_migration_disabled(push_task))
+			return;
+
+		rq->npc_push_work_pending =3D true;
+	}
+
+	/* sched_tick runs with interrupts disabled. */
+	get_task_struct(push_task);
+	stop_one_cpu_nowait(rq->cpu, sched_non_preferred_cpu_push_stop,
+			    push_task, this_cpu_ptr(&npc_push_task_work));
+}
+#endif
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index d41d23a..7d2ec52 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1326,6 +1326,9 @@ struct rq {
 #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
 	u64			prev_steal_time_rq;
 #endif
+#ifdef CONFIG_PREFERRED_CPU
+	bool			npc_push_work_pending;
+#endif
=20
 	/* calc_load related fields */
 	unsigned long		calc_load_update;
@@ -4299,4 +4302,10 @@ DEFINE_CLASS_IS_UNCONDITIONAL(sched_change)
=20
 #include "ext/ext.h"
=20
+#ifdef CONFIG_PREFERRED_CPU
+void sched_push_current_non_preferred_cpu(struct rq *rq);
+#else	/* !CONFIG_PREFERRED_CPU */
+static inline void sched_push_current_non_preferred_cpu(struct rq *rq) { }
+#endif
+
 #endif /* _KERNEL_SCHED_SCHED_H */
