Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793240833;
	b=lebRQCAkxhCR6YkSXksk2/yGcHBDGF42Yytc5rfi0i/9vnzuN3leOvN3YUOHavi2h8ok
	 2j83UQ0d1sDiB0ihogvU3OZIFZwPqmxkOZLuNjVRXKUlQtm7hXhgKJDoYCW8xJ+arvnYr
	 DsARKFvNogjD6gCX5z2MoURvKdlQPFN/g0htgu93YO22jI2AHpwu6XSbmbhLae1wyiuFX
	 0Lvo56x8WSqBthgp3QAC2bWklS2ynYCm1oI+fiSeLmpZ+h0tLEDaO5UplbBRvjrcI0WTq
	 2MlS/GcWTleEYky74U3DGpCy13ce34r01LWcGDfN4tOosdtbhxxbX+vvEa6iUDHgwWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240833;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=d0potvkYEPRlBVs0JY9bGCY/Z9bEA7EZBxzgXkkqzVY=;
	b=3h7z9mi/I77G7zdTIPFyJu8+nOIu1a1qKkPX9JBF2SxwFD94veqb3napGUyFmbBdBoW6
	 qfXhMg201l+ejN6ZPL0zrvZV5g8zjRujSE8ppYRudy//IuJLb9v2K1HjL2W1yuUyTSd5G
	 5Vjhh5vwmvwkzS6D7GazXGOGjfCrOol2xXPTmPS5oVrRB39dWc3NdU3Zn6Fe8vc9XByTK
	 FUOJOWbKjVxWdNOBZxRwMn3j3wpCXoI0ni8AGwj5n+lIHcM0ZZouYkah1+cnOFITdJCEu
	 W5NwL/BoQbOTGyB/pqzgtquDYX14JqSy5tZWMdl/4HA2RSDwHiPA4Lw4OcIdNDWRdTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04AAE606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04AAE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFSmJ6wZ1z171YL;
	Thu, 29 Oct 2026 10:26:56 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFSmH3wZqz171Yc;
	Thu, 29 Oct 2026 10:26:55 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 38BA2314AC01;
	Thu, 29 Oct 2026 10:26:32 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 29 Oct
 2026 10:26:54 +0800
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
Subject: [RFC PATCH v3 01/17] sched/topology: Add llc_to_node() to translate LLC ID to NUMA node
Date: Thu, 29 Oct 2026 10:20:19 +0800
Message-ID: <20261029022036.4002331-2-wujianyong@hygon.cn>
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

Building LLC affinity sequences requires knowing which NUMA node each
LLC belongs to. Add a per-LLC-ID NUMA-node map derived from possible
CPUs that currently hold an LLC ID, and expose it to the scheduler
through llc_to_node(). Unassigned IDs return NUMA_NO_NODE.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/sched.h    |  1 +
 kernel/sched/topology.c | 93 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 91 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 56acf502ba26..4ee223416012 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -4107,6 +4107,7 @@ static inline bool sched_cache_enabled(void)
 }
 
 extern void sched_cache_active_set(void);
+extern int llc_to_node(int llc);
 
 #endif
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 622e2e01974c..18171d2338fe 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -685,6 +685,24 @@ DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
 DEFINE_STATIC_KEY_FALSE(sched_asym_cpucapacity);
 DEFINE_STATIC_KEY_FALSE(sched_cluster_active);
 
+#ifdef CONFIG_SCHED_CACHE
+/*
+ * LLC id to NUMA node map. The number of entries lives inside the
+ * RCU-protected allocation so that a reader bound-checks against the
+ * length of the very map it dereferenced. max_lid is updated by
+ * __sched_domains_alloc_llc_id() well before rebuild_llc_node_map()
+ * installs the matching map, so it must not be used as the bound.
+ */
+struct llc_node_map {
+	int nr_llc;
+	int node[];
+};
+
+static struct llc_node_map __rcu *llc_to_node_map;
+static void rebuild_llc_node_map(int size);
+
+#endif
+
 static void update_top_cache_domain(int cpu)
 {
 	struct sched_domain_shared *sds = NULL;
@@ -856,6 +874,64 @@ DEFINE_STATIC_KEY_FALSE(sched_cache_active);
 /* user wants cache aware scheduling [0 or 1] */
 int sysctl_sched_cache_user = 1;
 
+int llc_to_node(int llc)
+{
+	struct llc_node_map *map;
+	int node = -1;
+
+	rcu_read_lock();
+	map = rcu_dereference(llc_to_node_map);
+	if (map && llc >= 0 && llc < map->nr_llc)
+		node = map->node[llc];
+	rcu_read_unlock();
+
+	return node;
+}
+
+static void rebuild_llc_node_map(int size)
+{
+	struct llc_node_map *new_map, *old_map;
+	int cpu, llc, node;
+
+	lockdep_assert_held(&sched_domains_mutex);
+	if (size <= 0)
+		goto fail;
+
+	new_map = kzalloc(struct_size(new_map, node, size), GFP_KERNEL);
+	if (!new_map)
+		goto fail;
+
+	new_map->nr_llc = size;
+	for (llc = 0; llc < size; llc++)
+		new_map->node[llc] = NUMA_NO_NODE;
+
+	/*
+	 * for_each_possible_cpu() revisits the same LLC non-consecutively
+	 * under SMT (each node's LLCs are walked once per thread), so
+	 * dedup by populated node entries, not by comparing against the
+	 * immediately preceding CPU's llc.
+	 */
+	for_each_possible_cpu(cpu) {
+		llc = per_cpu(sd_llc_id, cpu);
+		if (llc < 0 || llc >= size || new_map->node[llc] >= 0)
+			continue;
+		node = cpu_to_node(cpu);
+		if (node >= 0 && node < nr_node_ids && node_possible(node))
+			new_map->node[llc] = node;
+	}
+
+publish:
+	old_map = rcu_dereference_protected(llc_to_node_map,
+					    lockdep_is_held(&sched_domains_mutex));
+	rcu_assign_pointer(llc_to_node_map, new_map);
+	kfree_rcu_mightsleep(old_map);
+	return;
+
+fail:
+	new_map = NULL;
+	goto publish;
+}
+
 /*
  * Get the effective LLC size in bytes that @cpu's bottom sched_domain
  * can use. A CPU within a cpuset partition can only use a proportion
@@ -3040,7 +3116,8 @@ static int __sched_domains_alloc_llc_id(void)
 	return lid;
 }
 
-static void __sched_domains_free_llc_id(int cpu)
+/* Return true only when the last CPU releases the LLC ID. */
+static bool __sched_domains_free_llc_id(int cpu)
 {
 	int i, lid, max;
 
@@ -3048,14 +3125,14 @@ static void __sched_domains_free_llc_id(int cpu)
 
 	lid = per_cpu(sd_llc_id, cpu);
 	if (lid == -1 || lid >= nr_cpu_ids)
-		return;
+		return false;
 
 	per_cpu(sd_llc_id, cpu) = -1;
 
 	for_each_cpu(i, llc_mask(cpu)) {
 		/* An online CPU owns the llc_id. */
 		if (per_cpu(sd_llc_id, i) == lid)
-			return;
+			return false;
 	}
 
 	__cpumask_clear_cpu(lid, sched_domains_llc_id_allocmask);
@@ -3064,12 +3141,18 @@ static void __sched_domains_free_llc_id(int cpu)
 	/* shrink max lid to save memory */
 	if (max < max_lid)
 		max_lid = max;
+	return true;
 }
 
 void sched_domains_free_llc_id(int cpu)
 {
 	sched_domains_mutex_lock();
+#ifdef CONFIG_SCHED_CACHE
+	if (__sched_domains_free_llc_id(cpu))
+		rebuild_llc_node_map(max_lid + 1);
+#else
 	__sched_domains_free_llc_id(cpu);
+#endif
 	sched_domains_mutex_unlock();
 }
 
@@ -3139,6 +3222,10 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 		}
 	}
 
+#ifdef CONFIG_SCHED_CACHE
+	/* The map depends on assigned LLC IDs, not on sd_llc allocations. */
+	rebuild_llc_node_map(max_lid + 1);
+#endif
 	if (WARN_ON(!topology_span_sane(cpu_map)))
 		goto error;
 
-- 
2.34.1


