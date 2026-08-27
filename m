Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB73D240611
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834016; cv=none; b=S8/Fmk9N7SFHoW6iPo8sFbZAT57WIbi8SnppnbsLexxxAux/U4gDUs2Nb9lQpRPX2PvQE1rX4YlGzU1YFMutNO6Jhg5+EJt2YfN7GP04yiYQLQYGxk+sHWu1r28X1wnoF30F8wFrmjkc2w2e6lUi1+4SJC+M3DNS6Eji9J4K9Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834016; c=relaxed/simple;
	bh=UvPRhhhVigrShFCX9DpWGxRC5a8fDdbDHIx66tSdKfM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eFyhvdJEUkWsEJgt5SuoKr60YWTlGv3EP4tI9/778hPIuVFezbRolyHD4E+tkNcErdAURgFmf1oC1F2XYdvIx7DXhFjGfpi/WWL7ZkM9mhc/h2bjzkxwu7X609WIxGFrGXL22KCZoI4YauvAewR33uPr4uxFHfyqTaNmfqZ+TGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1Bq0VzSz38T;
	Thu, 27 Aug 2026 20:33:07 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1Bm3NbqzBJY4k;
	Thu, 27 Aug 2026 20:33:04 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 10C1B78AD;
	Thu, 27 Aug 2026 20:32:57 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 27 Aug
 2026 20:33:02 +0800
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
Subject: [RFC PATCH v2 01/23] sched/topology: Add llc_to_node() to translate LLC id to NUMA node
Date: Thu, 27 Aug 2026 20:27:54 +0800
Message-ID: <20260827122816.756234-2-wujianyong@hygon.cn>
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

Building an LLC affinity/distance matrix requires knowing which NUMA
node each LLC belongs to. Add a per-LLC-id -> NUMA-node map
(llc_to_node_map) derived from the possible CPU set, and expose it
via llc_to_node().

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 include/linux/topology.h |  4 +++
 kernel/sched/topology.c  | 56 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/include/linux/topology.h b/include/linux/topology.h
index 709a2dcf4c73..9967739a180c 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -177,6 +177,10 @@ static inline int cpu_to_mem(int cpu)
 
 #endif	/* [!]CONFIG_HAVE_MEMORYLESS_NODES */
 
+#ifdef CONFIG_SCHED_CACHE
+int llc_to_node(int llc);
+#endif
+
 #if defined(topology_die_id) && defined(topology_die_cpumask)
 #define TOPOLOGY_DIE_SYSFS
 #endif
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 622e2e01974c..c6928c6b17b6 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -685,6 +685,11 @@ DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
 DEFINE_STATIC_KEY_FALSE(sched_asym_cpucapacity);
 DEFINE_STATIC_KEY_FALSE(sched_cluster_active);
 
+#ifdef CONFIG_SCHED_CACHE
+static int __rcu *llc_to_node_map;
+static void rebuild_llc_node_map(int size);
+#endif
+
 static void update_top_cache_domain(int cpu)
 {
 	struct sched_domain_shared *sds = NULL;
@@ -856,6 +861,56 @@ DEFINE_STATIC_KEY_FALSE(sched_cache_active);
 /* user wants cache aware scheduling [0 or 1] */
 int sysctl_sched_cache_user = 1;
 
+int llc_to_node(int llc)
+{
+	int node = -1;
+	int *map = NULL;
+
+	rcu_read_lock();
+	map = rcu_dereference(llc_to_node_map);
+	if (map && llc >= 0 && llc <= max_lid)
+		node = map[llc];
+	rcu_read_unlock();
+
+	return node;
+}
+
+static void rebuild_llc_node_map(int size)
+{
+	int *new_map, *old_map;
+	u8 *seen_llc;
+	int cpu, llc;
+
+	new_map = kcalloc(size, sizeof(int), GFP_KERNEL);
+	if (!new_map)
+		return;
+	seen_llc = kcalloc(size, sizeof(*seen_llc), GFP_KERNEL);
+	if (!seen_llc) {
+		kfree(new_map);
+		return;
+	}
+
+	/*
+	 * for_each_possible_cpu() revisits the same LLC non-consecutively
+	 * under SMT (each node's LLCs are walked once per thread), so
+	 * dedup by llc id via seen_llc[], not by comparing against the
+	 * immediately preceding CPU's llc.
+	 */
+	for_each_possible_cpu(cpu) {
+		llc = per_cpu(sd_llc_id, cpu);
+		if (llc < 0 || llc >= size || seen_llc[llc])
+			continue;
+		seen_llc[llc] = 1;
+		new_map[llc] = cpu_to_node(cpu);
+	}
+	kfree(seen_llc);
+
+	old_map = rcu_dereference_protected(llc_to_node_map, true);
+	rcu_assign_pointer(llc_to_node_map, new_map);
+	synchronize_rcu();
+	kfree(old_map);
+}
+
 /*
  * Get the effective LLC size in bytes that @cpu's bottom sched_domain
  * can use. A CPU within a cpuset partition can only use a proportion
@@ -925,6 +980,7 @@ static bool alloc_sd_llc(const struct cpumask *cpu_map,
 		}
 	}
 
+	rebuild_llc_node_map(max_lid + 1);
 	return true;
 err:
 	for_each_cpu(i, cpu_map) {
-- 
2.34.1


