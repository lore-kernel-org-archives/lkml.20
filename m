Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793240900;
	b=OAwHxToQ6FLxJ6rl27Bjql1fGupDlSfMR5EzvbxX/xUyx8Nu04hpzvuF000uTUl5Trwe
	 KmLfH2ZegWqs1ED0nb3BjaH0HVaW7IIZxfwMtRzKniyquLdJTXS5jgUkflDq6yQzwnhRr
	 TRGxHypvfXXqOU87tPvPwd4vycivhwYn9xe6SROk4KxCyugDwRzj7xhLp4cpYK96S8tpO
	 FIunUDK8pfzsLOQqLRJh6E01XLYXOaBKwd9TVPSCplkhLPdIYkYlb4ivtgyP2nNqJguBh
	 XHeY4neG4ITN6QuU+Rk/wR8VSw+wAVbrbsy4e9ALwFDlT4R1o9uYUQ9T9mf6ESXD/XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240900;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=1GbYdbaiGfxxITdI36MsaSn6x9+xGnsrtdyhtRu9O8k=;
	b=pZ5S/Z1cionik55+h5QAEA6xnbe5408w+wDdaEXqa2gfJX3XcJrVKicPA2J9X9VQYS91
	 hRSDZaFxhR9HfvD3qq5aHFgvbicTHxVDjHKfh4GMhhSYcyLLb5dDshfH69yrjW1QKNKrN
	 lzEe7sLaPXGGQAqOa3iG+L6EvSZ+HNBPFKkWtKMlh300cF7XYdoVDcISn0+KqHuYJc11A
	 uSukpRE1xVrPv0YxpbhwYeSDfG4ikNRUuOAnpXgLreERqZpU3lGb595gXtG92jvjKeOTw
	 bib+WDS3B1vaki4Zk0wXRWr8llmjBoO0bfPQ+FK033CouRwcJ4uYuIT8Qfssv15O10g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD04606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD04606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFSnl6ym1z171YM;
	Thu, 29 Oct 2026 10:28:11 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFSnj4Sfzz171ZL;
	Thu, 29 Oct 2026 10:28:09 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id C687C16DE;
	Thu, 29 Oct 2026 10:28:02 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 29 Oct
 2026 10:28:08 +0800
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
Subject: [RFC PATCH v3 03/17] sched/topology: Add an iterator for cached NUMA node affinity rows
Date: Thu, 29 Oct 2026 10:20:21 +0800
Message-ID: <20261029022036.4002331-4-wujianyong@hygon.cn>
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

Provide for_each_affi_node() to walk the cached node affinity sequence.
Visit the local node first, then remote nodes by raw NUMA distance and
triangular tie rank. Include possible nodes without CPUs and skip holes
in the node ID space.

Pin one immutable row under RCU for the entire walk so rebuilding the
table cannot change the ordering midway through a migration decision.
If the table is unavailable, visit only the local node.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/sched.h    | 24 ++++++++++++++++++++++++
 kernel/sched/topology.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 4dba127f1d4f..5d3fa5d70d16 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -4140,6 +4140,30 @@ sched_cache_numa_key_cmp(struct sched_cache_numa_key a,
 	return 0;
 }
 
+struct affi_node_order_iter {
+	const int *order;
+	int root;
+	int nr_nodes;
+	int index;
+};
+
+/* Hold RCU continuously from begin() through the last next() call. */
+extern struct affi_node_order_iter affi_node_order_begin(int cpu);
+extern int affi_node_order_next(struct affi_node_order_iter *iter);
+
+/*
+ * Walk possible nodes, local first, then by raw NUMA distance and triangular
+ * tie rank. Pin one immutable row under RCU for the entire walk. The body
+ * must not sleep; break and return release the scoped lock. If the cached
+ * order is unavailable, visit only the local node.
+ */
+#define for_each_affi_node(cpu, node)					\
+	scoped_guard(rcu)						\
+		for (struct affi_node_order_iter __sn_iter =		\
+			     affi_node_order_begin((cpu));		\
+		     ({ int __sn_node = affi_node_order_next(&__sn_iter); \
+			__sn_node >= 0 && ((node) = __sn_node, true); });)
+
 /* Node IDs in, zero-based rank out; -1 if unavailable or invalid. */
 extern int affi_node_rank_of(int prefer_node, int node);
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 6b7b38eb7cd3..8d0fd0f8a67a 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1101,6 +1101,38 @@ void __init sched_cache_init_node_order(void)
 	sched_cache_numa_distance_update_end(true);
 }
 
+struct affi_node_order_iter affi_node_order_begin(int cpu)
+{
+	struct affi_node_order_topology *topo;
+	struct affi_node_order_iter iter = { };
+
+	RCU_LOCKDEP_WARN(!rcu_read_lock_any_held(), "node order read without RCU");
+	if (cpu < 0 || cpu >= nr_cpu_ids || !cpu_possible(cpu))
+		return iter;
+
+	iter.root = cpu_to_node(cpu);
+	if (iter.root < 0 || iter.root >= nr_node_ids || !node_possible(iter.root))
+		return iter;
+
+	iter.nr_nodes = 1;
+	topo = rcu_dereference_all(affi_node_order);
+	if (topo && iter.root < topo->size) {
+		iter.nr_nodes = topo->nr_nodes;
+		iter.order = topo->order + (size_t)iter.root * iter.nr_nodes;
+	}
+	return iter;
+}
+
+int affi_node_order_next(struct affi_node_order_iter *iter)
+{
+	int idx = iter->index;
+
+	if (idx >= iter->nr_nodes)
+		return -1;
+	iter->index++;
+	return iter->order ? iter->order[idx] : iter->root;
+}
+
 /*
  * Return @node's zero-based rank in @prefer_node's affinity order, with
  * @prefer_node itself ranked first. Both arguments are node IDs, not CPUs.
-- 
2.34.1


