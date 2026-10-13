Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B53A3955FE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791853975; cv=none; b=cFDSuV1gOIOFDph1eilWrWDGf1kRO5KuwEzgFiazchWa4JLohICovB2TUZx8pm0NFPSm6+KjW7WS3jUhBm2q684+ejtiR4HvhVji9VVdyXhLobVYVKJP1zoRYq1ND7JY3W4lTTF1u4zn6Rdaw5DswWY4wv4EzWFsq9q7gXJkaps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791853975; c=relaxed/simple;
	bh=l7fiPKsghZrIWz5gMulZPmZu6yv9bNbFXmB9XnNZjVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AoQrQMGbbNJv+lCRo31eH6kUeRXA9ufT8X5KNQqm9zjZ2IqjIYSA8yHE8ewI3WTSeL9p2CVX19GYosN4rquOyNEb58rQ7AQKcSUvmGWnymmA9fHa1VZJCu/99Btcwmg9IAQDtJdrqq2O3igN8bfJexDk54lxAWTUVrVsGW7ptdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=b3fNiPCq; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="b3fNiPCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1791853513;
	bh=l7fiPKsghZrIWz5gMulZPmZu6yv9bNbFXmB9XnNZjVA=;
	h=From:Date:Subject:To:Cc:From;
	b=b3fNiPCqQ/wP/xpioJ3lsUELU+ifyfkcjPLNvCUB6Zlisk1PFHVMuGfz6JZ5za4Uk
	 uvwv3SCqVWdQFRfoiDTJw8oGN/o1kmhgfH/6MJfKAiLx2Xowry/WoNFY2UfY42LtWT
	 uWQpYsTcfNDNlV4mCg+2pClGQ2cjVm8FBfr3SRWQ=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id 94036401B0;
	Mon, 12 Oct 2026 18:05:12 -0700 (PDT)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Date: Mon, 12 Oct 2026 18:04:58 -0700
Subject: [PATCH v6] sched/fair: Preserve wake-affine CPU for non-SMT
 reciprocal sync wakeups
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-b4-sched-sync-wakeup-v6-1-aa70cde14463@gentwo.org>
X-B4-Tracking: v=1; b=H4sIALmDzWoC/4XOzU7DMAzA8VeZciYoTpw05cR7IA75cNoIqZ2S0
 TFNfXeyHWCoqjj+LflnX1mlkqmyl8OVFVpyzfPUwjwdWBjdNBDPsTWTQhrRSeAeeQ0jRV4vU+B
 n90GfRy4wogiePETH2uqxUMpfd/btvfWY62kul/uVBW7Tf8AFOPAYekxgkWSXXgeaTuf5eS4Du
 4mLfFTkjiKbkgAMaiO8RL9R1KPS7SiqKb0ICS1EH63eKPirWKF2FGyKlkop3yjf9RtF/ygghN1
 RdFPApT45j7Y3f39Z1/UbH89DndEBAAA=
X-Change-ID: 20260721-b4-sched-sync-wakeup-04d40cbeb1da
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>, 
 Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
 linux-kernel@vger.kernel.org, "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791853512; l=4825;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=l7fiPKsghZrIWz5gMulZPmZu6yv9bNbFXmB9XnNZjVA=;
 b=jD8BX+ExUYSZ74s3AKUW9OSmoZ9dRf3vQ/uHM9oFc2Vn1ES2fsJ+w9VqCQGc5LmuB5lNyuBDr
 9HE17mH+QDGBd6MELcjnvb6XFUnh7/k4+GMfrMfo1HPal672JYDdQP+
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

For WF_SYNC wakeups, wake_affine() may select or retain the waker CPU,
but select_idle_sibling() can subsequently move the wakee to another
idle CPU.

Pipe-style ping-pong workloads exercise the following handoff:

  A wakes B
  B wakes A
  A wakes B

When A wakes B for the second time, B last woke A. Check
B.last_wakee == A before record_wakee(B) records A.last_wakee == B.

Within the existing non-wide wake-affine path, on non-SMT systems, keep
this reciprocal WF_SYNC wakee on the waker CPU when wake-affine selected
or retained it and the waker has no other runnable task. This preserves
the direct handoff instead of searching for another idle CPU.

Record last_wakee history only in task context. In IRQ or softirq
context, current is the interrupted task rather than the logical waker.

This does not introduce a generic WF_SYNC placement rule. SMT systems
continue through select_idle_sibling(), which can choose an idle sibling
or idle core. On asymmetric-capacity systems, continue to require that
the wakee fits on the waker CPU.

Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
---
Testing was performed on an 80-core non-SMT Ampere Altra system.

  perf bench sched pipe -l 1000000, 30 runs:

    tip/sched/core (4a3b51aab6e2 baseline):

    default:
      3.704 -> 2.267 usec/op mean,   about 38.8% improvement
      3.709 -> 2.264 usec/op median, about 39.0% improvement

    taskset -c 78,79:
      3.621 -> 2.255 usec/op mean,   about 37.7% improvement
      3.558 -> 2.261 usec/op median, about 36.5% improvement

Changes in v6:
  - Guard record_wakee() with in_task() so IRQ/softirq wakeups do not
    record the interrupted task as the waker.
  - Capture p->last_wakee == current before record_wakee() records p as
    current's last wakee.
  - Make the reciprocal handoff and non-SMT stacking rationale explicit
    in the code.

Link to v5: https://lore.kernel.org/r/20261008-b4-sched-sync-wakeup-v5-1-1af9fab48965@gentwo.org
---
 kernel/sched/fair.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4fa66f4cba2cbb53d4e322134504e..3d0d1a68ca84bebfed77a89c3c364a9562c75032 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8513,6 +8513,10 @@ static unsigned long capacity_of(int cpu)
 
 static void record_wakee(struct task_struct *p)
 {
+	/* IRQ/softirq current is the interrupted task, not the logical waker. */
+	if (!in_task())
+		return;
+
 	/*
 	 * Only decay a single time; tasks that have less then 1 wakeup per
 	 * jiffy will not have built up many flips.
@@ -9167,6 +9171,22 @@ static inline bool asym_fits_cpu(unsigned long util,
 	return true;
 }
 
+static bool can_stack_on_waker(struct task_struct *p, int cpu)
+{
+	struct rq *rq = cpu_rq(cpu);
+
+	if ((rq->nr_running - cfs_h_nr_delayed(rq)) != 1)
+		return false;
+
+	if (sched_asym_cpucap_active()) {
+		sync_entity_load_avg(&p->se);
+		if (!task_fits_cpu(p, cpu))
+			return false;
+	}
+
+	return true;
+}
+
 /*
  * Try and locate an idle core/thread in the LLC cache domain.
  */
@@ -9920,6 +9940,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 	struct sched_domain *tmp, *sd = NULL;
 	int cpu = smp_processor_id();
 	int new_cpu = prev_cpu;
+	bool reciprocal_wakeup = false;
 	int want_affine = 0;
 	/* SD_flags and WF_flags share the first nibble */
 	int sd_flag = wake_flags & 0xF;
@@ -9929,6 +9950,12 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 	 */
 	lockdep_assert_held(&p->pi_lock);
 	if (wake_flags & WF_TTWU) {
+		/*
+		 * Check if current is p's last wakee before recording p as
+		 * current's last wakee.
+		 */
+		reciprocal_wakeup = in_task() &&
+			p->last_wakee == current;
 		record_wakee(p);
 
 		if ((wake_flags & WF_CURRENT_CPU) &&
@@ -9955,6 +9982,19 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 			if (cpu != prev_cpu)
 				new_cpu = wake_affine(tmp, p, cpu, prev_cpu, sync);
 
+			/*
+			 * If wake-affine selected or kept the waker CPU, stack
+			 * a reciprocal WF_SYNC wakee there on non-SMT when it
+			 * has no other runnable task. On SMT, retain
+			 * select_idle_sibling() so it can consider idle
+			 * sibling/core placement.
+			 */
+			if (sync && !sched_smt_active() &&
+			    new_cpu == cpu &&
+			    reciprocal_wakeup &&
+			    can_stack_on_waker(p, cpu))
+				return cpu;
+
 			sd = NULL; /* Prefer wake_affine over balance flags */
 			break;
 		}

---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20260721-b4-sched-sync-wakeup-04d40cbeb1da

Best regards,
-- 
Shubhang Kaushik (Ampere) <sh@gentwo.org>

