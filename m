Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485513;
	b=kAS2fJsY1zH2xlZ8xnWAJ2lZM2wQhnGz+S8tGtNaFYZFJCIuxFe/2r8+6kXMsWgEqNqv
	 Et2lYDMbFNNg6WTTI4j28sjIs9jSg9H8+B4GE1LpDrQ+Y7t+Rig3aKLsoOd3VY8tOzeMb
	 08ikP1AndzCeZEMPgdOSdhGXkXjqJFB86+PNAmoHHpViCrxGunMY0ChpaOnnVugn0yMxX
	 hziSPsRJUfYbRWM1E/ZJfEOuxKpJBc6TnfTwfiva3YNJV4awDmTpS2sBQLKd374lkkV4J
	 hfCd6iZmopCGfQFNTVtebxjBvj763J4XLNuZ+Aen2UZNqiqu54qv9rAOz6UR13JRpmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485513;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2gA4KOi3Hn2Vyaj2KE97BdlJ8z8R0YsWY+qFIgELBLk=;
	b=wyYkCX9UpsBKLRvaDJLvNiSBfYXuLacUx4FRr5EFqGcnrzvO6OEyZR/ULQ1dzA6RK9Zv
	 C74d3Pqcq47rTTcaXGVl4ZymxKBqYWE8Qb/KMqkOmkIWHniC9PfWugOtGSaHEt6ytpNQU
	 1VOeJEFXfya0JGaOCSHv8c574B4XfF7QdImukmWa/vZ19KNv+34B9PAoEC7oxBIkhwUGB
	 TbkJ7pYFrNocDbJB2/oYu5DAYnDkYyYaIOd3eUjSobE785eJhKWjTbwuHehqSrQNDMQEo
	 Pr1KUgsAFue7fMQ9Jxz+jbHWRP445kgiog2n0zctgWOT76fB4FkoF0T2rNhHfwFan4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.75
Received: from out28-75.mail.aliyun.com (out28-75.mail.aliyun.com [115.124.28.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B6D606A333
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7B6D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436305|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_enroll_verification|0.0337373-0.00132636-0.964936;FP=3442958109706642802|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037026024;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.jlWubSp_1792485500;
Received: from localhost.localdomain(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jlWubSp_1792485500 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 16:38:22 +0800
From: Li kunyu <likunyu@open-hieco.net>
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
	Li kunyu <likunyu@open-hieco.net>,
	"Li Wang (Hieco)" <li.wang@linux.dev>
Subject: [RFC PATCH 3/6] sched/fair: SMT sibling exclusion after successful push
Date: Tue, 20 Oct 2026 16:37:43 +0800
Message-ID: <20261020083746.37068-4-likunyu@open-hieco.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020083746.37068-1-likunyu@open-hieco.net>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In sched_balance_domains(), after a task is successfully pushed to its
SMT sibling CPU, the pull process continues. To prevent the already-pushed
task from being pulled again, both the SMT scheduling domain and the
sibling CPUs are skipped during selection. As a result, SMT sibling CPUs
are not selected.

This patch skips SMT sibling CPUs.

Tested-by: Li Wang (Hieco) <li.wang@linux.dev>
Signed-off-by: Li kunyu <likunyu@open-hieco.net>
---
 kernel/sched/fair.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 12b3223c6403..6e2271484c86 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10657,6 +10657,8 @@ struct lb_env {
 	enum fbq_type		fbq_type;
 	enum migration_type	migration_type;
 	struct list_head	tasks;
+
+	bool			is_smt_move_task;
 };
 
 /*
@@ -13377,7 +13379,20 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
 	struct sched_domain __maybe_unused *sd_tmp;
 	unsigned int busiest_nr = 0;
 	int __maybe_unused dst_llc;
-	int i;
+	int i, smt_cpu, dst_cpu = env->dst_cpu;
+
+	if (sched_feat(SMT_BUDDY_ASSIST) && env->is_smt_move_task) {
+		/*
+		 * Remove the SMT sibling CPU from the mask to avoid the
+		 * extremely rare case of pulling tasks from it.
+		 */
+		for_each_cpu(smt_cpu, cpu_smt_mask(dst_cpu)) {
+			if (smt_cpu == dst_cpu)
+				continue;
+
+			cpumask_clear_cpu(smt_cpu, env->cpus);
+		}
+	}
 
 	for_each_cpu_and(i, sched_group_span(group), env->cpus) {
 		unsigned long capacity, load, util;
@@ -13743,7 +13758,7 @@ static atomic_t sched_balance_running = ATOMIC_INIT(0);
  */
 static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 			struct sched_domain *sd, enum cpu_idle_type idle,
-			int *continue_balancing)
+			int *continue_balancing, bool is_smt_move_task)
 {
 	int ld_moved, cur_ld_moved, active_balance = 0;
 	struct sched_domain *sd_parent = sd->parent;
@@ -13761,6 +13776,7 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 		.cpus		= cpus,
 		.fbq_type	= all,
 		.tasks		= LIST_HEAD_INIT(env.tasks),
+		.is_smt_move_task = is_smt_move_task,
 	};
 	bool need_unlock = false;
 
@@ -14390,8 +14406,15 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
 
 		interval = get_sd_balance_interval(sd, busy);
 		if (time_after_eq(jiffies, sd->last_balance + interval)) {
+			/*
+			 * When a task is successfully pushed to its SMT sibling CPU:
+			 * 1. Skip traversal of the SMT scheduling domain.
+			 * 2. Continue pulling tasks from heavily loaded CPUs.
+			 * 3. Avoid pulling tasks from SMT sibling CPUs.
+			 */
 			if (!is_smt_buddy_run(sd, is_smt_move_task) &&
-				sched_balance_rq(cpu, rq, sd, idle, &continue_balancing)) {
+				sched_balance_rq(cpu, rq, sd, idle, &continue_balancing,
+					is_smt_move_task)) {
 				/*
 				 * The LBF_DST_PINNED logic could have changed
 				 * env->dst_cpu, so we can't know our idle
@@ -15059,7 +15082,8 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 
 			pulled_task = sched_balance_rq(this_cpu, this_rq,
 						   sd, CPU_NEWLY_IDLE,
-						   &continue_balancing);
+						   &continue_balancing,
+							false);
 
 			t1 = sched_clock_cpu(this_cpu);
 			domain_cost = t1 - t0;
-- 
2.47.3

