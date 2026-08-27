Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D37723392B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834030; cv=none; b=E4sg3RLVgDAWb5K1P7zZ8ZkLe7fra2KURzEfWOTN9jhP2kkYS+pG/466FH9FtivsQuL9uIYpqzi+SWHtSYr4VusCv02PBFHEGEpgu7op6Hixn0uocLzsTb0olfmQ5WHvv4NEuG1svzDMHs9J/Vjrhkh25BX/MgmSW+b1NUKifU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834030; c=relaxed/simple;
	bh=2QpXok1pzUi1UDzsKIRCZTOiTxuHUoOePLeJOUs/NZQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YEwiCzFYkoUTr/gamJoKw98Jh5XBsSEDZ24GumALaiRPwL2iRhM1rKVuJyZPBQod8l7wObTXjVbKD984h3oHdXUfmvCnA2qUjMbRXWE9gmrzSd+uZAgIFVlTpxZWMKI6GH5RXqRiD1ZgWxxRk16ojX+RAcvFvlZ9To1mALHiYGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1C90WT9zBJb6j;
	Thu, 27 Aug 2026 20:33:25 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1C757JlzBJb6f;
	Thu, 27 Aug 2026 20:33:23 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 8184F36F1F84;
	Thu, 27 Aug 2026 20:29:41 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 27 Aug
 2026 20:33:21 +0800
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
Subject: [RFC PATCH v2 08/23] sched/topology: Introduce a per-CPU tasks NUMA preferred counter
Date: Thu, 27 Aug 2026 20:28:01 +0800
Message-ID: <20260827122816.756234-9-wujianyong@hygon.cn>
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

Like the existed task LLC preferred counter, sd->llc_counts, introduce
sd->numa_counts to denotes the task number that prefer each NUMA node in
a certain rq.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 include/linux/sched/topology.h |  1 +
 kernel/sched/topology.c        | 33 +++++++++++++++++++++++++++------
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index b5d9d7c2b8ad..b31d2cf16592 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -121,6 +121,7 @@ struct sched_domain {
 	unsigned int llc_max;
 	unsigned int *llc_counts __counted_by_ptr(llc_max);
 	unsigned long llc_bytes;
+	unsigned int *numa_counts;
 #endif
 
 #ifdef CONFIG_SCHEDSTATS
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 46ae1f94e9f5..901e593e70d7 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -641,8 +641,9 @@ static void destroy_sched_domain(struct sched_domain *sd)
 	free_sched_domain_shared(sd->shared);
 
 #ifdef CONFIG_SCHED_CACHE
-	/* only the bottom sd has llc_counts array */
+	/* only the bottom sd has llc_counts/numa_counts array */
 	kfree(sd->llc_counts);
+	kfree(sd->numa_counts);
 #endif
 	kfree(sd);
 }
@@ -853,10 +854,12 @@ cpu_attach_domain(struct sched_domain *sd, struct root_domain *rd, int cpu)
 			sd->llc_counts = tmp->llc_counts;
 			sd->llc_max = tmp->llc_max;
 			sd->llc_bytes = tmp->llc_bytes;
+			sd->numa_counts = tmp->numa_counts;
 			/* make sure destroy_sched_domain() does not free it */
 			tmp->llc_counts = NULL;
 			tmp->llc_max = 0;
 			tmp->llc_bytes = 0;
+			tmp->numa_counts = NULL;
 #endif
 			/*
 			 * sched groups hold the flags of the child sched
@@ -1434,7 +1437,7 @@ static bool alloc_sd_llc(const struct cpumask *cpu_map,
 			 struct s_data *d)
 {
 	struct sched_domain *sd, *top_llc, *parent;
-	unsigned int *p;
+	unsigned int *p_llc, *p_node;
 	int i;
 
 	for_each_cpu(i, cpu_map) {
@@ -1442,9 +1445,13 @@ static bool alloc_sd_llc(const struct cpumask *cpu_map,
 		if (!sd)
 			goto err;
 
-		p = kcalloc_node(max_lid + 1, sizeof(unsigned int),
+		p_llc = kcalloc_node(max_lid + 1, sizeof(unsigned int),
 				 GFP_KERNEL, cpu_to_node(i));
-		if (!p)
+
+		p_node = kcalloc_node(nr_node_ids, sizeof(unsigned int),
+				 GFP_KERNEL, cpu_to_node(i));
+
+		if (!p_llc || !p_node)
 			goto err;
 
 		top_llc = sd;
@@ -1459,12 +1466,25 @@ static bool alloc_sd_llc(const struct cpumask *cpu_map,
 
 		if (top_llc->flags & SD_SHARE_LLC) {
 			sd->llc_max = max_lid + 1;
-			sd->llc_counts = p;
+			sd->llc_counts = p_llc;
 			sd->llc_bytes = get_effective_llc_bytes(i, top_llc);
 		} else {
 			/* avoid memory leak */
-			kfree(p);
+			kfree(p_llc);
+		}
+
+		parent = top_llc;
+		/* Like above, find the lowest SD_NUMA domain */
+		for (parent = rcu_dereference_protected(top_llc->parent, true);
+		     parent; parent = rcu_dereference_protected(parent->parent, true)) {
+			if (parent->flags & SD_NUMA)
+				break;
 		}
+
+		if (parent)
+			sd->numa_counts = p_node;
+		else
+			kfree(p_node);
 	}
 
 	rebuild_llc_node_map(max_lid + 1);
@@ -1481,6 +1501,7 @@ static bool alloc_sd_llc(const struct cpumask *cpu_map,
 			sd->llc_counts = NULL;
 			sd->llc_max = 0;
 			sd->llc_bytes = 0;
+			sd->numa_counts = NULL;
 		}
 	}
 
-- 
2.34.1


