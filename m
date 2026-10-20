Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485508;
	b=v2fLTyJ8kfaNgAk+wLzPFgob7KOM5bUsfvypD9Vv32lrqNruektMR6ySfyyDqAj6sY+u
	 LcKM9l32C69Wb4VrbbSU4TX48MwofCe5WF/3X9+yJpyvETpTI6phD7IDo7RFXQCW4HU3o
	 mpQi70dre/eBNFK0OofO+TBVh54uNFKbTcl4S0IV3V5y6xU0U16Gz73ryDA/qPrNcbwfF
	 nmtuWw6rhYhiHzLF8Kyac1HFF1KW1aX+m0GndOrijcPSNbYOBKHiPY+QleeFhTxOut9Ir
	 GTmaty1ZAPSVZqglvwbNdS7a71V9c4ZC7ENwEz7lpVEcFZDjdS/RtVnMV/4H4I9XMcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485508;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e8y/kWrfmAZJzM1pii0kBczM+tT4ZdsDF43zB4kqNSI=;
	b=gfcHbcMPGtEzIQjTgadRn9jOF5Xb4c1PehM38mo1jb7WA8N5iS3bAKx8wQpQVlADPisG
	 08VQLEPOBb7fP7px5o19JfHLkdZapLhU1tpQrjW7Kuxs4TgFNqMGBBrAruc9NmzBXAEdo
	 UqtZPadqNU3iTx/fDf8MKAA8oB6yH9QbYNdBY5VPiot7TMRkYSoNDT7DIBGv+XxnKMDm4
	 u+ljYk/uZrjCTJoPOXGY8Cb6RtGtkR9vvX8I7d+FfkSrSdJ707kpE3ROzkPdQ4gt54Jh8
	 VDZB+klp1ZlwE5NZMcjRTxmsbZf4GZjNXhQlu+js44oAzxy3QXE429vTt2ZlNUzI0JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.145
Received: from out28-145.mail.aliyun.com (out28-145.mail.aliyun.com [115.124.28.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A5A606A329
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10A5A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0131226-0.00196772-0.98491;FP=8703013179357746418|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037034017;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.jlWubFU_1792485489;
Received: from localhost.localdomain(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jlWubFU_1792485489 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 16:38:16 +0800
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
Subject: [RFC PATCH 1/6] sched/fair: Add SMT sibling push in periodic load balance
Date: Tue, 20 Oct 2026 16:37:41 +0800
Message-ID: <20261020083746.37068-2-likunyu@open-hieco.net>
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

[Purpose]

An attempt is made to migrate the task to an SMT sibling CPU. If the
migration fails (i.e., the conditions are not met), it generally incurs
no additional overhead.

Migration fails in the following scenarios: (1) the current CPU is in
the CPU_IDLE state; (2) the current CPU load is relatively low; (3) the
overall CPU load is evenly distributed. All three cases are expected, so
no intervention is necessary.

Migration succeeds in the following scenarios: (1) the current CPU load
is moderately high; (2) the current CPU spawns a large number of
processes or threads within a short period (i.e., bursty tasks);  (3)
the SMT sibling CPUs are idle while the current CPU meets the minimum
migration requirements. All three cases are expected and can achieve
rapid task distribution.

[Implementation]

When conceptualizing this plan, we attempted to add push functions in
multiple locations, and finally tested and analyzed that adding this
function in periodic load balancing is the most appropriate:

1. There is no need to consider complex locking logic, as the CPU is
already idle and the task is no longer running.

2. At this point, it is only necessary for the CFS load of the SMT
sibling CPU to be lower than a certain proportion of the current CPU,
which is more efficient.

3. After the current CPU load drops (task migration successful), there
is an opportunity to pull CFS tasks from other CPUs, which is meaningful
for the overall situation.

Tested-by: Li Wang (Hieco) <li.wang@linux.dev>
Signed-off-by: Li kunyu <likunyu@open-hieco.net>
---
 kernel/sched/fair.c     | 108 ++++++++++++++++++++++++++++++++++++++++
 kernel/sched/features.h |   9 ++++
 2 files changed, 117 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6e005f1e8dc9..a43a168f23ba 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -136,6 +136,15 @@ static unsigned int sysctl_sched_cfs_bandwidth_slice		= 5000UL;
 static unsigned int sysctl_numa_balancing_promote_rate_limit = 65536;
 #endif
 
+/*
+ * The imbalance percentage condition for pushing tasks to SMT sibling CPUs.
+ *
+ * (default: ~25%)
+ */
+static unsigned int sysctl_smt_buddy_imbalance_pct = 125;
+static unsigned int sysctl_smt_buddy_imbalance_pct_min = 105;
+static unsigned int sysctl_smt_buddy_imbalance_pct_max = 200;
+
 #ifdef CONFIG_SYSCTL
 static const struct ctl_table sched_fair_sysctls[] = {
 #ifdef CONFIG_CFS_BANDWIDTH
@@ -158,6 +167,15 @@ static const struct ctl_table sched_fair_sysctls[] = {
 		.extra1		= SYSCTL_ZERO,
 	},
 #endif /* CONFIG_NUMA_BALANCING */
+	{
+		.procname	= "smt_buddy_imbalance_pct",
+		.data		= &sysctl_smt_buddy_imbalance_pct,
+		.maxlen		= sizeof(unsigned int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= &sysctl_smt_buddy_imbalance_pct_min,
+		.extra2		= &sysctl_smt_buddy_imbalance_pct_max,
+	},
 };
 
 static int __init sched_fair_sysctl_init(void)
@@ -14226,6 +14244,94 @@ update_newidle_cost(struct sched_domain *sd, u64 cost, unsigned int success)
 	return false;
 }
 
+/*
+ * An exciting thing is that we have implemented an efficient push
+ * function process.
+ *
+ * It is applied in cycle load balancing and nohz_kick process.
+ * It can help us solve the problem of high workload of CFS tasks in
+ * the RQ queue.
+ */
+static bool smt_buddy_move_task(struct rq *src_rq)
+{
+	bool is_overload, is_move = false;
+	int src_cpu = cpu_of(src_rq), smt_cpu;
+	unsigned long src_cpu_runnable, smt_cpu_runnable;
+	struct sched_domain *smt_sd;
+	struct task_struct *p;
+	struct rq *smt_rq;
+	struct rq_flags rf;
+
+	if (!sched_feat(SMT_BUDDY_ASSIST) || !sched_smt_active())
+		goto exit;
+
+restart:
+	if (src_rq->nr_running < 2)
+		goto exit;
+
+	rcu_read_lock();
+
+	is_overload = false;
+	src_cpu_runnable = cpu_runnable(src_rq);
+	for_each_cpu(smt_cpu, cpu_smt_mask(src_cpu)) {
+		if (smt_cpu == src_cpu)
+			continue;
+
+		smt_cpu_runnable = cpu_runnable(cpu_rq(smt_cpu));
+		if ((src_cpu_runnable * 100 > smt_cpu_runnable * sysctl_smt_buddy_imbalance_pct)
+			&& cpu_active(smt_cpu)) {
+			is_overload = true;
+			break;
+		}
+	}
+
+	if (!is_overload) {
+		rcu_read_unlock();
+		goto exit;
+	}
+
+	smt_sd = lowest_flag_domain(src_cpu, SD_SHARE_CPUCAPACITY);
+	if (!smt_sd) {
+		rcu_read_unlock();
+		goto exit;
+	}
+
+	rcu_read_unlock();
+
+	rq_lock_irqsave(src_rq, &rf);
+	smt_rq = cpu_rq(smt_cpu);
+
+	struct lb_env env = {
+		.sd             = smt_sd,
+		.dst_cpu        = smt_cpu,
+		.dst_rq         = smt_rq,
+		.src_cpu        = src_cpu,
+		.src_rq         = src_rq,
+		.idle           = 0,		/* __CPU_NOT_IDLE */
+		.flags          = LBF_ACTIVE_LB,
+	};
+
+	/* Update the src_rq clock only once when migrating tasks. */
+	if (!is_move)
+		update_rq_clock(src_rq);
+
+	p = detach_one_task(&env);
+	if (!p) {
+		rq_unlock_irqrestore(src_rq, &rf);
+		goto exit;
+	}
+
+	rq_unlock(src_rq, &rf);
+	attach_one_task(smt_rq, p);
+	local_irq_restore(rf.flags);
+	is_move = true;
+
+	goto restart;
+
+exit:
+	return is_move;
+}
+
 /*
  * It checks each scheduling domain to see if it is due to be balanced,
  * and initiates a balancing operation if so.
@@ -14245,6 +14351,8 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
 	int need_decay = 0;
 	u64 max_cost = 0;
 
+	smt_buddy_move_task(rq);
+
 	rcu_read_lock();
 	for_each_domain(cpu, sd) {
 		/*
diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index 8f0dee8fc475..173e39bb950a 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -142,3 +142,12 @@ SCHED_FEAT(LATENCY_WARN, false)
  */
 SCHED_FEAT(NI_RANDOM, true)
 SCHED_FEAT(NI_RATE, true)
+
+/*
+ * Based on the scalability feature added on the basis of SMT, by pushing
+ * CFS tasks to SMT sibling CPUs, the load can be rapidly reduced.
+ * When the load of SMT sibling CPUs is relatively high compared to
+ * the scheduling domain (above SMT), CFS tasks can be migrated to other
+ * CPUs in the scheduling domain, achieving fast and efficient migration of CFS tasks.
+ */
+SCHED_FEAT(SMT_BUDDY_ASSIST, false)
-- 
2.47.3

