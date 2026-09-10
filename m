Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6483AE6EB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014681; cv=none; b=QX89vzzmdocMJnHwq+h0MFrvOf69XeTc2RAtIzeGpPB6UudDrJufsCPbfVjaGHkjaVmyNvTwHCELkwfn6AKjChTc7ZHrXcaM8NaPDwguL7Ps7mPu8YqD8F2p6Rw9PHuaFoNKtOfQ0S0rJ+5zwYPx1QI2Q1eZHR3z87zanambzMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014681; c=relaxed/simple;
	bh=9kEKGitU0KGtrdmgg+MeYLoaKIghma4epy46ju6KunM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=okmFt54gGaLJDcY7/hbhH3MSxaMjSqL85Vot7gzuHbWECj9ZhddbM49i0ZkWUatlY3uSRZ55gVp/+8H545PQ2o+mqOCpPhyesU/9C8M7SQplNr5osZLQe6taZZMsswOJGvatN2VGyR0Yc06taxTJ4HEzjQHaSdmk2lEasSOcQPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ObaLzogi; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ObaLzogi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=2p
	URnNgagNSzAGeA4erfdSykdqLoBlr6NUXAPfZFKc4=; b=ObaLzogiP9kGptYSMD
	DDWODHSGqZrNkfOyHEQGQQjc/z4+uJGfOHFVgpvz8LIWoqRJRwU3CMqgBT9KCi9D
	PNAAaD3i3nKpRbDzZdw6riUtWorq1Tzd6cSFxSvr485bZ1hO9qBtZdcsIH84zb13
	RhS0SL2zmVu2AUh22RPKSFySE=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXgp5AMqJqap0YBw--.51115S8;
	Thu, 10 Sep 2026 12:30:01 +0800 (CST)
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
Subject: [RFC PATCH RESEND 06/10] sched/fair: Modify active_load_balance_cpu_stop() to accommodate more scenarios
Date: Thu, 10 Sep 2026 12:29:46 +0800
Message-Id: <20260910042950.1619727-7-jackzxcui1989@163.com>
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
X-CM-TRANSID:_____wAXgp5AMqJqap0YBw--.51115S8
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr47Gw1xtr4kGrWUAr1rtFb_yoW5KF48pr
	WUKw4agw4DJayUZ390yF4xur1IgwsxWw47Jan2qF4rCF15G3s5tw1F9r1fuF45uFZ5CFna
	ya1Dtw47CFWUtFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEDGYhUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbC5wrh62qiMkqCDAAA3Z

Modify active_load_balance_cpu_stop() to make it more generalized, no
longer limited to the context of finding the busiest rq in the
sched_balance_rq() scenario to migrate to the dst rq. Change the variables
that start with 'busiest' to start with 'src'.

Additionally, adjust the reference to the active_balance variable from
busiest_rq->active_balance to this_rq()->active_balance. With these
changes, the CPU where the stop task is located can serve as either a dst
CPU or a src CPU, laying the groundwork for the upcoming preempt active
balance feature.

Signed-off-by: Xin Zhao <jackzxcui1989@163.com>
---
 kernel/sched/fair.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f10e709921fd..9ffd01717599 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13796,33 +13796,33 @@ update_next_balance(struct sched_domain *sd, unsigned long *next_balance)
 
 /*
  * active_load_balance_cpu_stop is run by the CPU stopper. It pushes
- * running tasks off the busiest CPU onto idle CPUs. It requires at
+ * one running task off the src CPU onto dst CPU. It requires at
  * least 1 task to be running on each physical CPU where possible, and
  * avoids physical / logical imbalances.
  */
 static int active_load_balance_cpu_stop(void *data)
 {
-	struct rq *busiest_rq = data;
-	int busiest_cpu = cpu_of(busiest_rq);
-	int target_cpu = busiest_rq->push_cpu;
+	struct rq *src_rq = data;
+	int src_cpu = cpu_of(src_rq);
+	int target_cpu = this_rq()->push_cpu;
 	struct rq *target_rq = cpu_rq(target_cpu);
 	struct sched_domain *sd;
 	struct task_struct *p = NULL;
 	struct rq_flags rf;
 
-	rq_lock_irq(busiest_rq, &rf);
+	rq_lock_irq(src_rq, &rf);
 	/*
 	 * Between queueing the stop-work and running it is a hole in which
 	 * CPUs can become inactive. We should not move tasks from or to
 	 * inactive CPUs.
 	 */
-	if (!cpu_active(busiest_cpu) || !cpu_active(target_cpu))
+	if (!cpu_active(src_cpu) || !cpu_active(target_cpu))
 		goto out_unlock;
 
-	WARN_ON_ONCE(!busiest_rq->active_balance);
+	WARN_ON_ONCE(!this_rq()->active_balance);
 
 	/* Is there any task to move? */
-	if (busiest_rq->nr_running <= 1)
+	if (src_rq->nr_running <= 1)
 		goto out_unlock;
 
 	/*
@@ -13830,12 +13830,12 @@ static int active_load_balance_cpu_stop(void *data)
 	 * we need to fix it. Originally reported by
 	 * Bjorn Helgaas on a 128-CPU setup.
 	 */
-	WARN_ON_ONCE(busiest_rq == target_rq);
+	WARN_ON_ONCE(src_rq == target_rq);
 
 	/* Search for an sd spanning us and the target CPU. */
 	rcu_read_lock();
 	for_each_domain(target_cpu, sd) {
-		if (cpumask_test_cpu(busiest_cpu, sched_domain_span(sd)))
+		if (cpumask_test_cpu(src_cpu, sched_domain_span(sd)))
 			break;
 	}
 
@@ -13844,14 +13844,14 @@ static int active_load_balance_cpu_stop(void *data)
 			.sd		= sd,
 			.dst_cpu	= target_cpu,
 			.dst_rq		= target_rq,
-			.src_cpu	= busiest_rq->cpu,
-			.src_rq		= busiest_rq,
+			.src_cpu	= src_rq->cpu,
+			.src_rq		= src_rq,
 			.idle		= CPU_IDLE,
 			.flags		= LBF_ACTIVE_LB,
 		};
 
 		schedstat_inc(sd->alb_count);
-		update_rq_clock(busiest_rq);
+		update_rq_clock(src_rq);
 
 		p = detach_one_task(&env);
 		if (p) {
@@ -13864,13 +13864,13 @@ static int active_load_balance_cpu_stop(void *data)
 	}
 	rcu_read_unlock();
 out_unlock:
-	rq_unlock(busiest_rq, &rf);
+	rq_unlock(src_rq, &rf);
 
 	if (p)
 		attach_one_task(target_rq, p);
 
 	local_irq_enable();
-	busiest_rq->active_balance = 0;
+	this_rq()->active_balance = 0;
 
 	return 0;
 }
-- 
2.34.1

