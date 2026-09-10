Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D75379C24
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014717; cv=none; b=MNILQZIS1bLv2p4AtpOlt2lQO2M/x56TzWy8KZqKLvTMHjHm0CEktLxy6z9OEfqrrI4jeGj/2OAVAMit6ltP31bVQAgIfHxxB0yyEfH1NztrhdmCOkbasiItq3S5RIlq00Olr8eBRuZFtZH36ppFKfVzKrCgBtbiPkzGrV1OVAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014717; c=relaxed/simple;
	bh=JyuRVYUXENtFmSue4479W+r7Lt9Y/8EY2DF4juzQW6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tdWiHvP/OaamovBcYmSIToo1HKHYgkHvJ6I/8+RRn9anvpRBQmSTPqM7AudviQExfYs4B3jJO05CbgPkRWCoaRrTdldbr+Uc1OUkEsN1f3ACgcm4qdVRoIjf80GvF/isSLcaJvf4zuSL33yLCvLnp89HG6r6tVDUyWA4l4XZbag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BEsuT74h; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BEsuT74h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=L7
	zCxf1hzQ1p+u7zu+dIehAq8l0mgUUnBoS0+XuNGiQ=; b=BEsuT74h3QY57fEmrt
	37jO6gpiixKu3vp/HtiTJMaddvBso/nZPH2cwWkbZnK2FMKOrMIsPuJamDEsJcbL
	uvBXNItzwq4ZYCg6utM+BhtiRGgmrzmRbdGT2QWh1JIRrCsShW15wM5rntSt2Q2/
	SRqnfR8E9OpS8VS5s52e9ma7s=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXgp5AMqJqap0YBw--.51115S12;
	Thu, 10 Sep 2026 12:30:07 +0800 (CST)
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
Subject: [RFC PATCH RESEND 10/10] sched/fair: Strive to find a task to migrate if newly idle when LB_PROMOTE
Date: Thu, 10 Sep 2026 12:29:50 +0800
Message-Id: <20260910042950.1619727-11-jackzxcui1989@163.com>
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
X-CM-TRANSID:_____wAXgp5AMqJqap0YBw--.51115S12
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr1DWw47WryDtw43GrWDXFb_yoWrAr47pr
	ZY9a1rKa1Dtw13t3sIkFsrZr1agws7Xr47JFZ7Jr1fCr45J34aqrnaqa43AF4rurs5Zr1a
	vrnrKw1j9w17trJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zigdbnUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbC5w-i7GqiMk+CsgAA3j

This patch is a core modification within this patch set. The simple_find
label in this patch implements a straightforward logic for finding a
migration task. It allows any instances in sched_balance_rq() that are
unable to find a migration task for various reasons to fallback to logic
executing the simple_find label to find one before exiting newly idle
process.

This patch addresses the newly idle scenario by preventing early exit in
cases when !ld_moved && !active_balance, effectively executing the logic
of simple_find label. Testing has shown that the situations listed below,
account for a significant proportion of early exits:
1. Failure in sched_balance_find_src_group
2. Failure in sched_balance_find_src_rq
3. ld_moved is 0 and active_balance has not been triggered

Of course, even with this change, it is still possible that no migration
task can be found. However, it at least ensures that all selectable CPUs
within the sched_domain have been thoroughly traversed.

Signed-off-by: Xin Zhao <jackzxcui1989@163.com>
---
 kernel/sched/fair.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1ae351ea5949..10ec7bb9e18c 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13470,6 +13470,8 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 	struct rq *busiest;
 	struct rq_flags rf;
 	struct cpumask *cpus = this_cpu_cpumask_var_ptr(load_balance_mask);
+	int cpu;
+	bool sfind = false;
 	struct lb_env env = {
 		.sd		= sd,
 		.dst_cpu	= this_cpu,
@@ -13504,15 +13506,41 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 	group = sched_balance_find_src_group(&env);
 	if (!group) {
 		schedstat_inc(sd->lb_nobusyg[idle]);
+		if (sched_feat(LB_PROMOTE))
+			goto simple_find;
 		goto out_balanced;
 	}
 
 	busiest = sched_balance_find_src_rq(&env, group);
 	if (!busiest) {
 		schedstat_inc(sd->lb_nobusyq[idle]);
+		if (sched_feat(LB_PROMOTE))
+			goto simple_find;
 		goto out_balanced;
 	}
+	goto begin_balance;
+
+simple_find:
+	if (env.idle != CPU_NEWLY_IDLE ||
+	    (env.dst_rq->nr_running > 0 || env.dst_rq->ttwu_pending))
+		goto out_balanced;
 
+	sfind = true;
+	env.migration_type = migrate_task;
+	env.imbalance = 1;
+
+	for_each_cpu_andnot(cpu, env.cpus, env.dst_grpmask) {
+		busiest = cpu_rq(cpu);
+		if (busiest->nr_running <= 1) {
+			__cpumask_clear_cpu(cpu, cpus);
+			continue;
+		}
+		break;
+	}
+	if (cpu >= nr_cpu_ids)
+		goto out_balanced;
+
+begin_balance:
 	WARN_ON_ONCE(busiest == env.dst_rq);
 
 	update_lb_imbalance_stat(&env, sd, idle);
@@ -13615,6 +13643,7 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 
 		/* All tasks on this runqueue were pinned by CPU affinity */
 		if (unlikely(env.flags & LBF_ALL_PINNED)) {
+check_redo:
 			__cpumask_clear_cpu(cpu_of(busiest), cpus);
 			/*
 			 * Attempting to continue load balancing at the current
@@ -13627,6 +13656,8 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 			if (!cpumask_subset(cpus, env.dst_grpmask)) {
 				env.loop = 0;
 				env.loop_break = SCHED_NR_MIGRATE_BREAK;
+				if (sfind)
+					goto simple_find;
 				goto redo;
 			}
 			goto out_all_pinned;
@@ -13668,8 +13699,11 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 		 * if the curr task on busiest CPU can't be
 		 * moved to this_cpu:
 		 */
-		if (!cpumask_test_cpu(this_cpu, busiest->curr->cpus_ptr))
+		if (!cpumask_test_cpu(this_cpu, busiest->curr->cpus_ptr)) {
+			if (sched_feat(LB_PROMOTE) && env.idle == CPU_NEWLY_IDLE)
+				goto check_redo;
 			goto out_one_pinned;
+		}
 
 		/* Record that we found at least one task that could run on this_cpu */
 		env.flags &= ~LBF_ALL_PINNED;
@@ -13703,6 +13737,8 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 	preempt_enable();
 
 out_unbalanced:
+	if (sched_feat(LB_PROMOTE) && !active_balance && env.idle == CPU_NEWLY_IDLE)
+		goto check_redo;
 	/* We were unbalanced, so reset the balancing interval */
 	sd->balance_interval = sd->min_interval;
 	goto out;
-- 
2.34.1

