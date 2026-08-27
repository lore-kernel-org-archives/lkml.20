Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551C423ED5E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834030; cv=none; b=L9Xe3jjE8z+Ab54nrMBtqGEuJzDB2gk2sCE1FE2ZyazFL5dbqki+wqBUCLgqwkBDxBkEdZJlTU+PAoHjMJyIf0zZumCPSW8UEjcLlhzmwxHGsa27nFdAjhOvR5pMcypjuaKk2Af4VPvF4Hw8aqtix/WWs3Z6Rze5CeuulRJvN0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834030; c=relaxed/simple;
	bh=9FgykJ4y2wiLOF303qk6SsIwAXQNW09bxbT3TAhtkno=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=emQknI4TJXwNaJdc8mrMJDUn+uXQfSV5mRu3K4YVFeQ5TRzIzmGGaHdDoSCserhcmQv8QP14BBkRB0zbmjY5umJPgwIbcz1umgHnE+xd7ZvTmvIctqBPPEKbMxyB0NBzJu2uCvyyc85/vZ8Wm+M+kZzrfnUoE3sHvZltnyNQQWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1CH0Wc3zBJb6p;
	Thu, 27 Aug 2026 20:33:31 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1CD5j8MzBJb6l;
	Thu, 27 Aug 2026 20:33:28 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 9464936F1F84;
	Thu, 27 Aug 2026 20:29:46 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 27 Aug
 2026 20:33:27 +0800
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
 Hildenbrand <david@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <wujianyong@hygon.cn>, <jianyong.wu@outlook.com>,
	<zhongyuan@hygon.cn>, <huangsj@hygon.cn>, <wangfengyu@hygon.cn>,
	<yingzhiwei@hygon.cn>, <justin.he@arm.com>
Subject: [RFC PATCH v2 10/23] sched/topology: Add per-sd scratch for the load balance affinity score
Date: Thu, 27 Aug 2026 20:28:03 +0800
Message-ID: <20260827122816.756234-11-wujianyong@hygon.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827122816.756234-1-wujianyong@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: cncheex05.Hygon.cn (172.23.18.115) To cncheex04.Hygon.cn
 (172.23.18.114)

The affinity score computed during load balancing needs two small arrays,
one entry per LLC: the LLCs that sit closer to the balance destination than
to the source, and the weight of each. Their size is only known once the
sched domains have been built, which is why the load balancer currently has
to allocate them on every call.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 include/linux/sched/topology.h |  6 ++++++
 kernel/sched/topology.c        | 28 +++++++++++++++++++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index b31d2cf16592..569ff562dbdb 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -122,6 +122,12 @@ struct sched_domain {
 	unsigned int *llc_counts __counted_by_ptr(llc_max);
 	unsigned long llc_bytes;
 	unsigned int *numa_counts;
+	/*
+	 * Scratch for the load balance affinity score, llc_max entries each.
+	 * Only the bottom sd owns them, like llc_counts above.
+	 */
+	int *affi_ids;
+	int *affi_weights;
 #endif
 
 #ifdef CONFIG_SCHEDSTATS
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 901e593e70d7..73d0c44dea92 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -644,6 +644,8 @@ static void destroy_sched_domain(struct sched_domain *sd)
 	/* only the bottom sd has llc_counts/numa_counts array */
 	kfree(sd->llc_counts);
 	kfree(sd->numa_counts);
+	kfree(sd->affi_ids);
+	kfree(sd->affi_weights);
 #endif
 	kfree(sd);
 }
@@ -855,11 +857,15 @@ cpu_attach_domain(struct sched_domain *sd, struct root_domain *rd, int cpu)
 			sd->llc_max = tmp->llc_max;
 			sd->llc_bytes = tmp->llc_bytes;
 			sd->numa_counts = tmp->numa_counts;
+			sd->affi_ids = tmp->affi_ids;
+			sd->affi_weights = tmp->affi_weights;
 			/* make sure destroy_sched_domain() does not free it */
 			tmp->llc_counts = NULL;
 			tmp->llc_max = 0;
 			tmp->llc_bytes = 0;
 			tmp->numa_counts = NULL;
+			tmp->affi_ids = NULL;
+			tmp->affi_weights = NULL;
 #endif
 			/*
 			 * sched groups hold the flags of the child sched
@@ -1438,6 +1444,7 @@ static bool alloc_sd_llc(const struct cpumask *cpu_map,
 {
 	struct sched_domain *sd, *top_llc, *parent;
 	unsigned int *p_llc, *p_node;
+	int *p_ids, *p_w;
 	int i;
 
 	for_each_cpu(i, cpu_map) {
@@ -1451,8 +1458,22 @@ static bool alloc_sd_llc(const struct cpumask *cpu_map,
 		p_node = kcalloc_node(nr_node_ids, sizeof(unsigned int),
 				 GFP_KERNEL, cpu_to_node(i));
 
-		if (!p_llc || !p_node)
+		/* Scratch for the affinity score, see cal_affinity_score(). */
+		p_ids = kcalloc_node(max_lid + 1, sizeof(int),
+				 GFP_KERNEL, cpu_to_node(i));
+		p_w = kcalloc_node(max_lid + 1, sizeof(int),
+				 GFP_KERNEL, cpu_to_node(i));
+
+		if (!p_llc || !p_node || !p_ids || !p_w) {
+			kfree(p_llc);
+			kfree(p_node);
+			kfree(p_ids);
+			kfree(p_w);
 			goto err;
+		}
+
+		sd->affi_ids = p_ids;
+		sd->affi_weights = p_w;
 
 		top_llc = sd;
 		/*
@@ -1498,10 +1519,15 @@ static bool alloc_sd_llc(const struct cpumask *cpu_map,
 		sd = *per_cpu_ptr(d->sd, i);
 		if (sd) {
 			kfree(sd->llc_counts);
+			kfree(sd->numa_counts);
+			kfree(sd->affi_ids);
+			kfree(sd->affi_weights);
 			sd->llc_counts = NULL;
 			sd->llc_max = 0;
 			sd->llc_bytes = 0;
 			sd->numa_counts = NULL;
+			sd->affi_ids = NULL;
+			sd->affi_weights = NULL;
 		}
 	}
 
-- 
2.34.1


