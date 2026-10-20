Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485511;
	b=E6LfD8pEFXYHm5vD9v7YotgEdnxanuV9krri6rCzIi5nl2V3M5BpzqJZUO+4GtH/UFZn
	 XBdQYInqn8SqdVjUxUxBerh5CjfVUhL05/lRbhE+faxckBkh62WdRPIAfTEvoM5Ncv+A+
	 WgUKX5VbesXzyyIYkBGoKArz2KZnhPnsgLyibWmZ0oDUUeOwd0D/JecUsq725LAO6V1zW
	 SbahzeKDsciXZkw9UZUb9zAgBsrBK17doLBFrnAR1XXt9cgJ7/c7saPsxFXqu5z0HjFaT
	 3LQeza6SZkGioG6CvuKly3YLWUuuBHrDZQw5X1+306kaJOAhcZQMmTrnxFOYmlqaoqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485511;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R/5vbREqg2hZN8NvnWwzWluRjNlFiSUX/2wnLt1GUwY=;
	b=OTeLAfJJs/YXmQZlVBtIiaoOlgH/g951dy+YZ7efesbmUK90GRpHJy7QaDBpR0YuPgRV
	 YDuPF6TIF9pTqh2JxsQgU1xVfWEqGCN6UMAp3TSa3IgBiwvnNgSlacX6FGV49zhZwXnaE
	 7Oom3xetW7qvrzcWdqv7RBwycaddYTfaBq9G4RA3kPIvFrlXTtQbd0tN4uEqY37KMp86M
	 H43RxzCnyK5PeENp8r9cZTaGAfDlReVxq/KDuTWMwjq7jokFDflC7lx/Q52lUvhs7YOuR
	 PYIe9ki5GTlVY/lUOSBjOuun0hL8fXL4n70SUH2YeJHldiwF9cpvyEGz2qplQt/cobA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.218
Received: from out28-218.mail.aliyun.com (out28-218.mail.aliyun.com [115.124.28.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E280260A2605
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E280260A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.0751195|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0562989-0.000553454-0.943148;FP=2587274393208849658|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037006180;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.jlWubV9_1792485503;
Received: from localhost.localdomain(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jlWubV9_1792485503 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 16:38:24 +0800
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
Subject: [RFC PATCH 4/6] sched/fair: Restrict newidle balance to LLC domain
Date: Tue, 20 Oct 2026 16:37:44 +0800
Message-ID: <20261020083746.37068-5-likunyu@open-hieco.net>
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

The newidle CPU path logic update is solely intended to quickly obtain
eligible tasks. By restricting task acquisition to the LLC (L3)
scheduling domain and avoiding traversal and task migration at levels
above it, this change avoids jitter in scenarios where the entire
machine is idle or the CPU load is relatively balanced. This is because
each traversal of higher-level scheduling domains remains costly, and
migrating tasks across dies (LLCs) incurs substantial short-term
overhead, such as TLB flushes/refills and page migration:

1. When overall CPU utilization is relatively low, avoid the
scenario where the whole CPU is idle yet cross-die (high-latency) tasks
are being pulled. In such cases, it is better to run only one logical
CPU per core to avoid cache interference and frequent TLB flushes. This
applies when:
    1.1. the CPU has multiple sleeping tasks (with delayed dequeue
disabled).
    1.2. the number of runnable tasks on the CPU is less than 2.

2. When overall CPU load is relatively balanced, refrain from
pulling cross-die (high-latency) tasks. This avoids task jitter and
prevents resource exhaustion (similar to the issues in 2.1).

[Implementation]

After extensive testing on a Hygon 7447v CPU server (Model 7, with 384
logical cores), several issues were identified. For example, when the CPU
first enters idle mode, cross-NUMA-node task pulling performs poorly in
certain test scenarios, including MySQL, UnixBench, and tbench. Likewise,
certain advantages were observed in tests using hackbench -l 2560 -g 4 and
in additional test groups.

However, its benefits in some respects are simply too great: it avoids
more time-consuming and extensive scheduling-domain traversal, as well
as cross-NUMA-node task pulling (avoiding the problem of low hit rates
from memory to L3 cache). Limiting the task-pulling range to the L3
cache is more efficient.

In actual testing, the following scenarios have shown significant
improvements:

1. unixbench: Overall improvement of 5% to 8% across 384 logical CPUs.

2. mysql: TPS and QPS increased by approximately 5% (this may not be
entirely accurate), while the 95th percentile latency decreased by
3% to 5%.

Tested-by: Li Wang (Hieco) <li.wang@linux.dev>
Signed-off-by: Li kunyu <likunyu@open-hieco.net>
---
 kernel/sched/fair.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6e2271484c86..f2bf4b53d8a9 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -14983,6 +14983,24 @@ static inline bool nohz_idle_balance(struct rq *this_rq, enum cpu_idle_type idle
 static inline void nohz_newidle_balance(struct rq *this_rq) { }
 #endif /* !CONFIG_NO_HZ_COMMON */
 
+/*
+ * is_smt_buddy_newidle_constrain - After enabling the smt_buddy_assist
+ *                                  feature, check whether the current
+ *                                  scheduling domain meets the conditions
+ *                                  for skipping statistics.
+ * @sd: The current scheduling domain that is to be traversed.
+ */
+static bool is_smt_buddy_newidle_constrain(struct sched_domain *sd)
+{
+	if (!sched_feat(SMT_BUDDY_ASSIST))
+		return false;
+
+	if (sd->flags & SD_NUMA)
+		return true;
+
+	return false;
+}
+
 /*
  * sched_balance_newidle is called by schedule() if this_cpu is about to become
  * idle. Attempts to pull tasks from other CPUs.
@@ -15080,7 +15098,8 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 				weight = (1024 + weight/2) / weight;
 			}
 
-			pulled_task = sched_balance_rq(this_cpu, this_rq,
+			if (!is_smt_buddy_newidle_constrain(sd))
+				pulled_task = sched_balance_rq(this_cpu, this_rq,
 						   sd, CPU_NEWLY_IDLE,
 						   &continue_balancing,
 							false);
-- 
2.47.3

