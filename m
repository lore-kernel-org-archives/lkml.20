Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.72.0.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792611703;
	b=LWD5/e0Z1UJ52QKW+O31iO8XMlVhJuOvychXbGKR4DVb08dfEg/p8LmpE0TCWtVXQh5v
	 jBs0z/iqoKlohYnUE2zH62R55qk6XjKQPU+QqV0zMmCuUWrpMN3YZ1YI3CMOwVkfF2lQZ
	 6eejQ0JT+W9eO5LxvV0Bu0Y//H9yIHE2T/g4Tg8SUviBmoUxpFmqUZQVOxfQ4mjknbEAS
	 SDatmZJefC0SD3lpE6XIN3yRtUaDhwZ6GDrcHPOc4IzKGw8PVWvr6Q1BT9htk/H7sAO4a
	 aV8Fnto83jr2YIM6SJVJKnEY2aCAvjMjjQsS+7buJgrvY1ohR3jz7wLcULZPiXHbfeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792611703;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=NgkQoXkgpK2sGjYpbm2KHffmsrL6QXfO4giZc0eF7UA=;
	b=eybrmTErXVr53OnB8sXwQIdv5TBobHl7bWjaUx+rU1GDcIqtrQH9ROQ2NKJvDgxdBrB8
	 cYftwEiFt9wGNa90kl8BkJk9PYyivWxVeD6COLLeoES6Yw9cRAFXhExjJBwjkCtsBC1OZ
	 ddpqD1naZ62zt82Aa4/yPHeHq/D8zPYp6PLbw8NXBfF+RlMhzh5TzSiwNini88laYyzLc
	 y8QJlQ6nIcNA/gegDwDiAtOaQAYpMWKZfAV9u10EBLjMYRBmMDvzCDrZPGE8THHmiNKO1
	 NLn0XP8wfdJx3LPgAxcKwXQSS9RPNqaP461vrXnk/ECV5LQip9uLhGHJYJ364pEirdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gentwo.org;
	spf=pass smtp.mailfrom=gentwo.org;
	dkim=pass header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=YYaPHnv+;
	arc=none smtp.remote-ip=62.72.0.81
Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCC1606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FCC1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=YYaPHnv+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1792610988;
	bh=Q3+HsUdu3d/EUxk8By48lCwrk1lztJ3pfJKy4nwymFY=;
	h=From:Date:Subject:To:Cc:From;
	b=YYaPHnv+RQQH61lelvthtAzl7/+8rQrgNUbbRdiBBGBbQ2YTLI0lm2gFsCgxmp8ao
	 9cEJ2YA1HH3Tl0XhsqQs7QsLgtcQ1y6zvWKD3YtmpzeAmymal50dPQj130KzD9S21W
	 T4XuKrPYUyJ+1YqNSzD6E3A2U3j0p7mEzi9aWWbI=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id 917C54014B;
	Wed, 21 Oct 2026 12:29:47 -0700 (PDT)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Date: Wed, 21 Oct 2026 12:29:45 -0700
Subject: [PATCH v7] sched/fair: Preserve wake-affine CPU for non-SMT
 reciprocal sync wakeups
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-sched-sync-wakeup-v7-1-91995ba5b596@gentwo.org>
X-B4-Tracking: v=1; b=H4sIAKgS2WoC/4XQTWrDMBAF4KsErauikcaS3FXvUbLQz8gWBTtYq
 ZMQfPcqWbQuxnT5BuZ7w9xZoSlTYW+HO5toziWPQw3m5cBC74aOeI41MymkFkYC98hL6Cnychs
 Cv7hP+jpxgRFF8OQhOlZXTxOlfH2yH8ea+1zO43R7tszwmP4DzsCBx9BiAoskTXrvaDhfxtdx6
 thDnOVakTuKrEoC0Nho4SX6jaLWitlRVFVaERJaiD7aZqPgr2KF2lGwKo1USvlKedNulOZHASH
 sjtJUBVxqk/NoW729Ra8U2PuLropzRoRIgKjVH2VZlm++y+KqFwIAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792610987; l=3961;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=Q3+HsUdu3d/EUxk8By48lCwrk1lztJ3pfJKy4nwymFY=;
 b=HROFmQFT9tLpwZkIWpeJxIoyLlCEFqR7668Kcho9yvqTOVQouIPtr5un1XmH9s2oK9hiWvXuF
 VwCBUk4GG66Ce4QC+wAGmwCl+CHoGm5Ng8O8pgpn0jAGyiZMKf3b9bB
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

For WF_SYNC wakeups, wake_affine() may select or retain the waker CPU,
but select_idle_sibling() can subsequently move the wakee to another
idle CPU.

Pipe-style ping-pong workloads exercise the following handoff:

  A wakes B
  B wakes A
  A wakes B

When A wakes B for the second time, B last woke A. record_wakee(B)
records B as A's last wakee; together with B.last_wakee == A, this
identifies the reciprocal handoff.

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

    baseline: mainline at a804c5742bff

    default:
      4.030 -> 2.366 usec/op mean,   about 41.3% improvement
      4.110 -> 2.334 usec/op median, about 43.2% improvement

    taskset -c 78,79:
      4.200 -> 2.348 usec/op mean,   about 44.1% improvement
      4.294 -> 2.316 usec/op median, about 46.1% improvement

Changes in v7:
  - Record the wakee before testing the reciprocal wakeup relationship.
  - Explicitly require both directions of the current <-> wakee history,
    making the reciprocal handoff visible at the placement decision.

Link to v6: https://lore.kernel.org/r/20261012-b4-sched-sync-wakeup-v6-1-aa70cde14463@gentwo.org
---
 kernel/sched/fair.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b5546cd27dba08603fad190ba78f4bc1811c8452..0d7fb30170aa4850c2430c4747fe66499c636e3e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8470,6 +8470,10 @@ static unsigned long capacity_of(int cpu)
 
 static void record_wakee(struct task_struct *p)
 {
+	/* IRQ/softirq current is the interrupted task, not the logical waker. */
+	if (!in_task())
+		return;
+
 	/*
 	 * Only decay a single time; tasks that have less then 1 wakeup per
 	 * jiffy will not have built up many flips.
@@ -9145,6 +9149,22 @@ static inline bool asym_fits_cpu(unsigned long util,
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
@@ -9953,6 +9973,19 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 			if (cpu != prev_cpu)
 				new_cpu = wake_affine(tmp, p, cpu, prev_cpu, sync);
 
+			/*
+			 * record_wakee() established current->last_wakee == p.
+			 * A reciprocal wakeup also requires that p was last
+			 * woken by current.
+			 */
+			if (sync && !sched_smt_active() &&
+			    new_cpu == cpu &&
+			    in_task() &&
+			    current->last_wakee == p &&
+			    p->last_wakee == current &&
+			    can_stack_on_waker(p, cpu))
+				return cpu;
+
 			sd = NULL; /* Prefer wake_affine over balance flags */
 			break;
 		}

---
base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
change-id: 20260721-b4-sched-sync-wakeup-04d40cbeb1da

Best regards,
-- 
Shubhang Kaushik (Ampere) <sh@gentwo.org>

