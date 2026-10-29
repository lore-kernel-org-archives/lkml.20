Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793242506;
	b=UFeYLLJgIz3SIGiIPAeYWFUBQIuMz/zILGwDR+18P3gr8iZeitcXf2M8B0qGj0YyelGT
	 j8j3NtsLJ/V0oAEf9yxanS4YcNSRFbb3D5ftSaBG9zFq+b7LioFDn0Ip6T5JI6kTQXvCI
	 3PGIbXw3AAOEFv2UcZg6oEyDw2Xpd2HsSMShAQX2lhevWwyOn+Yj34CPEfRRjO+yi8MQp
	 htTnn/G8EpGOmy1LAY5JGkLilPQdF5xHCr44oZ8OqTueVt9QBpzM7FZMipoj0kaHGVHJ1
	 QyMzP+lLRd1hmEwHb3MbB0hrv0x6XbwT2Rd7TBls0OPyu2dcK+PkA0bx64It6e/vAqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793242506;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=nwzRLqo3JIwT8sW8EedZYwfWsX0Ld8ECZ+PVvahOUys=;
	b=1KRSJ1xs0UnLFHko8MHS/xNK//R0HbJ95qSd7LCv93qeuZfQAW/giSaZepc927Vqu/N/
	 fLkaHs6DweWph0JZiQddgyDqlqCRP+lcv8/Te2+8QwhEAZjV1qpgyMmjmi8JCn/6ZgH2X
	 BHomWbX3vVliGdfvxVOs0ufprjg7/1njZhwJC6Fq4jb8RVxoyrW4729NHTPiElz/Li3qY
	 VBuCtHScsBc0Ou7k4Q/C+aJyQUDDyyy579XFYKP5zy8bX6PMWNSxdY0Rd3/va9ZSIwwSN
	 dJZTWVAMJzFWbZmhIhJcKUkcBJ9E/4B1KAtdeAjkOvHXbQ3sJh3VzdlQE4eP0MwS0Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0073606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0073606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFTNX0rb9zwXwL;
	Thu, 29 Oct 2026 10:54:52 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFTNW2YXfzwXwL;
	Thu, 29 Oct 2026 10:54:51 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 036E1314AC01;
	Thu, 29 Oct 2026 10:54:27 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 29 Oct
 2026 10:54:48 +0800
From: Jianyong Wu <wujianyong@hygon.cn>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Chen Yu <yu.c.chen@intel.com>, Tim Chen
	<tim.c.chen@linux.intel.com>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld
	<pauld@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand <david@kernel.org>, <maddy@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, <ljs@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <wujianyong@hygon.cn>, <jianyong.wu@outlook.com>,
	<zhongyuan@hygon.cn>, <huangsj@hygon.cn>, <wangfengyu@hygon.cn>,
	<yingzhiwei@hygon.cn>
Subject: [RFC PATCH v3 14/17] sched/cache: Consider LLC load when selecting a single-task source rq
Date: Thu, 29 Oct 2026 10:50:11 +0800
Message-ID: <20261029025011.4004061-1-wujianyong@hygon.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029022036.4002331-1-wujianyong@hygon.cn>
References: <20261029022036.4002331-1-wujianyong@hygon.cn>
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
Content-Type: text/plain
X-ClientProxiedBy: cncheex05.Hygon.cn (172.23.18.115) To cncheex04.Hygon.cn
 (172.23.18.114)

When a source sched group spans multiple LLCs and every eligible rq has
at most one runnable task, migrate_task selects the first eligible rq.
It cannot distinguish an LLC above the aggregation threshold from one
at the threshold. If the selected rq is in an LLC at the threshold, the
cache-aware migration checks can veto the pull, while the LLC above the
threshold is never selected. The excess then persists.

For example, consider a two-socket machine with this topology:

  Socket 0: NUMA nodes 0-3
  Socket 1: NUMA nodes 4-7
  Each node: four LLCs
  Each LLC: four cores with SMT2, exposing eight logical CPUs

With a 50% aggregation threshold, each LLC can hold four full-utilization
tasks at the threshold. Suppose a workload has its preferred LLC in
node 6, with the node affinity order starting with 6, 7, 4, 5, followed
by the nodes in socket 0. One LLC in node 7 holds five CPU-bound tasks,
while every other LLC in socket 1 holds four. Each task runs on its own
rq, and socket 0 has spare capacity.

When socket 0 balances against socket 1, rq-level task counts select
the first CPU in node 4. Moving its task would leave node 4 below the
threshold, so the migration checks forbid it and active balance is not
started. Every such pass fails the same way: the five-task LLC stays
above the threshold while socket 0 has room. Balancing within node 7
does not help either, since moving a task to a sibling LLC with four
tasks merely reverses their task counts.

With cache-aware scheduling enabled, at domains above the LLC, track a
candidate rq in the LLC with the highest utilization within the source
group. Use it when the maximum runnable task count is one. In the
example, socket 0 then pulls from the five-task LLC. Node 7 remains
filled, so the move is permitted and brings that LLC back to the
threshold.

Keep task-count priority when an eligible rq has more than one runnable
task. Use the per-CPU scratch mask added earlier to sample each LLC
once during the existing scan.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1e286296cd65..20a6a7f5c2f7 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13357,8 +13357,18 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
 #ifdef CONFIG_SCHED_CACHE
 	int last_node = -1, node_num = 0, llc_max;
 	int *cache_data, *affi;
+	unsigned long llc_util, llc_cap;
+	struct sched_domain *llc_sd, *sd_self;
+	struct rq *llc_busiest = NULL;
+	unsigned long llc_busiest_util = 0;
+	struct cpumask *llcs_cpumask = NULL;
 
 	lb_affi_scratch(&cache_data, &affi, &llc_max);
+	sd_self = rcu_dereference_all(this_rq()->sd);
+	if (sd_self)
+		llcs_cpumask = sd_self->llc_stats_mask;
+	if (llcs_cpumask)
+		cpumask_clear(llcs_cpumask);
 #endif
 
 	for_each_cpu_and(i, sched_group_span(group), env->cpus) {
@@ -13472,6 +13482,34 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
 				busiest_nr = nr_running;
 				busiest = rq;
 			}
+#ifdef CONFIG_SCHED_CACHE
+			/*
+			 * When every eligible rq has at most one runnable task,
+			 * task-count comparisons select the first non-empty rq,
+			 * favoring lower-numbered CPUs regardless of LLC load.
+			 * This can leave LLC load uneven even when individual
+			 * runqueues have the same number of runnable tasks.
+			 *
+			 * Track an rq in the LLC with the highest utilization
+			 * during the same scan. Use it only if no eligible rq
+			 * has more than one runnable task, preserving task-count
+			 * priority while helping resolve LLC imbalance.
+			 */
+			if (busiest_nr < 2 &&
+				!(env->sd->flags & SD_SHARE_LLC) &&
+				nr_running == 1 && sched_cache_enabled() &&
+				llcs_cpumask && !cpumask_test_cpu(i, llcs_cpumask) &&
+				get_llc_stats(i, &llc_util, &llc_cap)) {
+				if (!llc_busiest || llc_util > llc_busiest_util) {
+					llc_busiest_util = llc_util;
+					llc_busiest = rq;
+				}
+				llc_sd = rcu_dereference_all(per_cpu(sd_llc, i));
+				if (llc_sd)
+					cpumask_or(llcs_cpumask, llcs_cpumask,
+						   sched_domain_span(llc_sd));
+			}
+#endif
 			break;
 
 		case migrate_misfit:
@@ -13514,6 +13552,11 @@ static struct rq *sched_balance_find_src_rq(struct lb_env *env,
 		}
 	}
 
+#ifdef CONFIG_SCHED_CACHE
+	if (busiest_nr == 1 && llc_busiest)
+		return llc_busiest;
+#endif
+
 	return busiest;
 }
 
-- 
2.34.1


