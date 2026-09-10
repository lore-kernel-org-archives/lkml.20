Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662B93AAF57
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014680; cv=none; b=lDmP+JAYPI4/PHUI65yMZ6F8qnRBJHchz/l2RpQH2FFL7yUYhMnPVRGuAt+oTkh3BLOYrePVMeqn5/xb1JY+feHELaF/A9NC9wumz+AZx58CMHsMn1evcCaNTAENDbaWpNkD1PVHisPMasXYA5VWLWptSs9nHFYxt0x1Q8A0I3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014680; c=relaxed/simple;
	bh=wrEPrEhzPywTkV5zFcDwTZrPWZGDw0UPGGLR4mG1UIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aSUnSVdVBRVdnF+thfr4Bhn2ONVTQ01aL+NG9P8EHruokgCRi5/ogwouHm36HnvYjPZzPqhNS86lX6JIdFVgD4l+GOShQ7QfjD9iHGSdQEsNNQkCxDrnJXweBgHnz49IMtf6ZzuR9B871Vcpkpnr0LHPN8fioXVqPPsjFCKQAjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FsIDDZR7; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FsIDDZR7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=tX
	BLjoyVcqoSnCe5hTKnzGr+xFkpChqXdUEH+D46IKk=; b=FsIDDZR71g4x3myDUf
	mOmBD6PhW1IeOqc4w+O/YzKy0O8EkAP6HC1WxSIRVB1bJHvcDf5S/OTZ0LdMgdfv
	QSmEAGkKFqiZ+jqZwjT1mOtOMGEW+pXvBVeCSZWTa8M5Mjjd/SGlVx3ODuJ6jfm9
	0XBEPl/D/hqsbG9yNXoeVno4Q=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXgp5AMqJqap0YBw--.51115S9;
	Thu, 10 Sep 2026 12:30:03 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org,
	Xin Zhao <jackzxcui1989@163.com>
Subject: [RFC PATCH RESEND 07/10] sched/fair: Trigger active balance if a CFS task is preempted when LB_PROMOTE
Date: Thu, 10 Sep 2026 12:29:47 +0800
Message-Id: <20260910042950.1619727-8-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910042950.1619727-1-jackzxcui1989@163.com>
References: <20260910042950.1619727-1-jackzxcui1989@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXgp5AMqJqap0YBw--.51115S9
X-Coremail-Antispam: 1Uf129KBjvJXoW3XF4fJry5KF15Zry7CFW3Jrb_yoW7trWfpr
	Wvya4rJa1DJ3W2q3ySkr48Zr13Wwn5Jayxtan7Jw4rAF15K34rt3Zavw13Wr45Crn5uF4a
	yr1jv3y2k3W8JF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziqYLQUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbC6Avh62qiMkuC8AAA3q

When LB_PROMOTE is on, in addition to the scenarios modified in the
previous patches regarding .select_task_rq implement, preemption of CFS
tasks also needs to be addressed. Once a CFS task is preempted by a
real-time task, if that task is executing logic in a critical section that
does not support priority inheritance, such as read-write locks or
read-write semaphores, it may lead to performance issues.

By adding this checkpoint for when a CFS task is preempted, we can migrate
the task to an idle CPU, thus alleviating such performance problems.
Additionally, the patch set for the LB_PROMOTE feature does not alter the
logic of task_hot(), so this patch will not significantly increase the
frequency of load balance migration.

The newly introduced function preempt_active_balance() will be triggered
in __schedule() when it detects that the previous task has been preempted
while the LB_PROMOTE feature is enabled. preempt_active_balance() will
first check whether the currently preempted task has other CPUs available
to run on. If there are idle CPUs available, the preempted task will be
migrated to one of those idle CPUs.

The implementation of preempt_active_balance() considers the desire not to
introduce additional "holes" of rq locks, so the migration triggering
action is deferred to the balance_callback which is trigger_preempt_alb().
trigger_preempt_alb() will issue a stop work to allow the idle target CPU
to perform the migration.

After the modifications made by the previous patches, we can reuse
active_load_balance_cpu_stop() to assist in this migration action. In
preempt_active_balance(), we use list_move_tail to move the currently
preempted task to position where detach_one_task() will first traverse,
allowing active_load_balance_cpu_stop() to prioritize finding the task.

Signed-off-by: Xin Zhao <jackzxcui1989@163.com>
---
 kernel/sched/core.c  |  3 ++
 kernel/sched/fair.c  | 80 ++++++++++++++++++++++++++++++++++++++++++++
 kernel/sched/sched.h |  2 ++
 3 files changed, 85 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 2e7cde033a31..757ea5ef303d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7227,6 +7227,9 @@ static void __sched notrace __schedule(int sched_mode)
 
 		trace_sched_switch(preempt, prev, next, prev_state);
 
+		if (sched_feat(LB_PROMOTE) && preempt)
+			preempt_active_balance(prev);
+
 		/* Also unlocks the rq: */
 		rq = context_switch(rq, prev, next, &rf);
 	} else {
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 9ffd01717599..d2b538abdf3e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13875,6 +13875,86 @@ static int active_load_balance_cpu_stop(void *data)
 	return 0;
 }
 
+static DEFINE_PER_CPU(struct balance_callback, preempt_push_head);
+static DEFINE_PER_CPU(int, push_cpu);
+
+static void trigger_preempt_alb(struct rq *rq)
+{
+	unsigned long flags;
+	int active_balance = 0;
+	int src_cpu = rq->cpu;
+	int idle_cpu = per_cpu(push_cpu, src_cpu);
+	struct rq *dst_rq = cpu_rq(idle_cpu);
+
+	preempt_disable();
+	raw_spin_rq_unlock(rq);
+	raw_spin_rq_lock_irqsave(dst_rq, flags);
+	if (dst_rq->active_balance)
+		goto unlock_rq;
+	dst_rq->active_balance = 1;
+	dst_rq->push_cpu = idle_cpu;
+	active_balance = 1;
+
+unlock_rq:
+	raw_spin_rq_unlock_irqrestore(dst_rq, flags);
+	if (active_balance) {
+		stop_one_cpu_nowait(idle_cpu, active_load_balance_cpu_stop, rq,
+				    &dst_rq->active_balance_work);
+	}
+	preempt_enable();
+	raw_spin_rq_lock(rq);
+}
+
+static void queue_preempt_alb_callback(struct rq *rq, int dst_cpu)
+{
+	per_cpu(push_cpu, rq->cpu) = dst_cpu;
+	queue_balance_callback(rq, &per_cpu(preempt_push_head, rq->cpu), trigger_preempt_alb);
+}
+
+void preempt_active_balance(struct task_struct *prev)
+{
+	struct rq *this_rq = this_rq();
+	int this_cpu = smp_processor_id(), cpu;
+	int start = nr_cpu_ids, idle_cpu = nr_cpu_ids;
+	struct sched_domain *sd;
+
+	if (unlikely(prev->sched_class != &fair_sched_class))
+		return;
+
+	if (unlikely(prev->migration_disabled))
+		return;
+
+	cpu = prev->recent_used_cpu;
+	if (cpu != this_cpu && available_idle_cpu(cpu) && !cpu_rq(cpu)->active_balance) {
+		idle_cpu = cpu;
+		goto active_balance;
+	}
+
+	rcu_read_lock();
+
+	sd = rcu_dereference(per_cpu(sd_llc, this_cpu));
+	if (sd)
+		start = cpumask_first_and(sched_domain_span(sd), prev->cpus_ptr);
+	if (start >= nr_cpu_ids)
+		start = cpumask_first(prev->cpus_ptr);
+
+	for_each_cpu_wrap(cpu, prev->cpus_ptr, start) {
+		if (cpu != this_cpu && available_idle_cpu(cpu) && !cpu_rq(cpu)->active_balance) {
+			idle_cpu = cpu;
+			goto unlock;
+		}
+	}
+
+unlock:
+	rcu_read_unlock();
+	if (idle_cpu == nr_cpu_ids)
+		return;
+
+active_balance:
+	list_move_tail(&prev->se.group_node, &this_rq->cfs_tasks);
+	queue_preempt_alb_callback(this_rq, idle_cpu);
+}
+
 /*
  * Scale the max sched_balance_rq interval with the number of CPUs in the system.
  * This trades load-balance latency on larger machines for less cross talk.
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 26ae13c86b69..11848708e5ce 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -4193,6 +4193,8 @@ extern struct balance_callback *splice_balance_callbacks(struct rq *rq);
 extern void __balance_callbacks(struct rq *rq, struct rq_flags *rf);
 extern void balance_callbacks(struct rq *rq, struct balance_callback *head);
 
+extern void preempt_active_balance(struct task_struct *prev);
+
 /*
  * The 'sched_change' pattern is the safe, easy and slow way of changing a
  * task's scheduling properties. It dequeues a task, such that the scheduler
-- 
2.34.1

