Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB4D9460
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787883220; cv=none; b=XRNTSuD5ERsEN8ABNyRC45a5DuUVLBBYvYGK6zi4HRcuKRE48AWq5f7b48Pj+g0x+bld3kDtd9QflCf6pChMpr6d3chY16H0J7QnxelscSUvPKqm52OY7GQab9jItCA5K4A2qsi2X6XsHsM+TcmK8Orme5BsN6H3/uJ8BEuFQ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787883220; c=relaxed/simple;
	bh=UjFxVpItTORxHB8sFWvGebEljaonQTGn1Er2pmyORyg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i6Bxr2rkXBwnyW80jekgkwiMVohu8mxa4dQ741NdnhccmVu3McrPhPg5Siel9nVjffjlk+XhpuiL+HYLHFwstrhY8GyMtzlGCdaZbkk5Uwjnr9WRQuQ4R8ogrYM7cIGkHpE2ti7a1F+q2hyAG4dh39oBR9MJs/s5WSa7RKyCJAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hWMPD0dwrz3L52B;
	Fri, 28 Aug 2026 10:13:20 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hWMP96d8qz3L52B;
	Fri, 28 Aug 2026 10:13:17 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id B225C3104800;
	Fri, 28 Aug 2026 10:09:34 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 28 Aug
 2026 10:13:16 +0800
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
Subject: [RFC PATCH v2 18/23] sched/cache: Scan all prefer nodes in thread group
Date: Fri, 28 Aug 2026 10:09:24 +0800
Message-ID: <20260828020924.785596-1-wujianyong@hygon.cn>
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
X-ClientProxiedBy: cncheex06.Hygon.cn (172.23.18.116) To cncheex04.Hygon.cn
 (172.23.18.114)

get_scan_cpumasks only scan the current task's preferred node.However,
each of task inside a thread group may have its own preferred node. Thus,
each scan may have different scan scope which may make it unstable to find
preferred LLC.

To address this issue, record all of the active preferred nodes from all
of the whole thread group. Then, take them all into the scan scope.
Additinally, remove the preferred node from the scan scope if it has not
been touched for a while like preferred llc invalidation does.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 include/linux/mm_types.h |  6 +-----
 include/linux/sched.h    |  1 +
 kernel/sched/fair.c      | 42 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index b18c2b2e7d2c..7fef34c6f33a 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1626,11 +1626,7 @@ static inline int mm_alloc_sched_noprof(struct mm_struct *mm)
 
 #define mm_alloc_sched(...)	alloc_hooks(mm_alloc_sched_noprof(__VA_ARGS__))
 
-static inline void mm_destroy_sched(struct mm_struct *mm)
-{
-	free_percpu(mm->sc_stat.pcpu_sched);
-	mm->sc_stat.pcpu_sched = NULL;
-}
+void mm_destroy_sched(struct mm_struct *mm);
 #else /* !CONFIG_SCHED_CACHE */
 
 static inline int mm_alloc_sched(struct mm_struct *mm) { return 0; }
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 1e4136c2b2a3..7fd4ea8c9037 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2393,6 +2393,7 @@ struct sched_cache_time {
 
 struct sched_cache_stat {
 	struct sched_cache_time __percpu *pcpu_sched;
+	unsigned long *node_epoch;
 	raw_spinlock_t lock;
 	unsigned long epoch;
 	u64 nr_running_avg;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 00f49e767583..27cb05373a1d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1605,6 +1605,9 @@ void mm_init_sched(struct mm_struct *mm,
 	mm->sc_stat.next_scan = jiffies;
 	mm->sc_stat.nr_running_avg = 0;
 	mm->sc_stat.footprint = 0;
+	mm->sc_stat.node_epoch = kcalloc(num_possible_nodes(),
+					 sizeof(*mm->sc_stat.node_epoch),
+					 GFP_KERNEL);
 	/*
 	 * The update to mm->sc_stat should not be reordered
 	 * before initialization to mm's other fields, in case
@@ -1613,6 +1616,14 @@ void mm_init_sched(struct mm_struct *mm,
 	smp_store_release(&mm->sc_stat.pcpu_sched, _pcpu_sched);
 }
 
+void mm_destroy_sched(struct mm_struct *mm)
+{
+	free_percpu(mm->sc_stat.pcpu_sched);
+	mm->sc_stat.pcpu_sched = NULL;
+	kfree(mm->sc_stat.node_epoch);
+	mm->sc_stat.node_epoch = NULL;
+}
+
 /* because why would C be fully specified */
 static __always_inline void __shr_u64(u64 *val, unsigned int n)
 {
@@ -1700,7 +1711,9 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 {
 	struct sched_cache_time *pcpu_sched;
 	struct mm_struct *mm = p->mm;
+	unsigned long *node_epoch;
 	int mm_sched_llc = -1;
+	int node, pref_nid;
 	unsigned long epoch;
 
 	if (!sched_cache_enabled())
@@ -1724,6 +1737,11 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 		epoch = rq->cpu_epoch;
 	}
 
+	node_epoch = mm->sc_stat.node_epoch;
+	pref_nid = READ_ONCE(p->numa_preferred_nid);
+	if (pref_nid != NUMA_NO_NODE && mm->sc_stat.node_epoch)
+		mm->sc_stat.node_epoch[pref_nid] = epoch;
+
 	/*
 	 * If this process hasn't hit task_cache_work() for a while invalidate
 	 * its preferred state.
@@ -1733,6 +1751,16 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 	    exceed_llc_capacity(mm, cpu_of(rq))) {
 		if (READ_ONCE(mm->sc_stat.cpu) != -1)
 			WRITE_ONCE(mm->sc_stat.cpu, -1);
+
+		if (node_epoch)
+			memset(mm->sc_stat.node_epoch, 0,
+				sizeof(*node_epoch) * num_possible_nodes());
+	} else if (node_epoch) {
+		for_each_node(node) {
+			if ((long)(epoch - READ_ONCE(node_epoch[node])) >
+			    llc_epoch_affinity_timeout)
+				WRITE_ONCE(node_epoch[node], 0);
+		}
 	}
 
 	mm_sched_llc = get_pref_llc(p, mm);
@@ -1777,10 +1805,12 @@ static void get_scan_cpumasks(cpumask_var_t cpus, struct task_struct *p)
 {
 #ifdef CONFIG_NUMA_BALANCING
 	int cpu, curr_cpu, nid, pref_nid;
+	unsigned long *node_epoch;
 
 	if (!static_branch_likely(&sched_numa_balancing))
 		goto out;
 
+	node_epoch = p->mm->sc_stat.node_epoch;
 	cpu = READ_ONCE(p->mm->sc_stat.cpu);
 	if (cpu != -1)
 		nid = cpu_to_node(cpu);
@@ -1801,6 +1831,18 @@ static void get_scan_cpumasks(cpumask_var_t cpus, struct task_struct *p)
 	if (pref_nid == NUMA_NO_NODE)
 		goto out;
 
+	if (node_epoch) {
+		int node;
+
+		for_each_node(node) {
+			if (node == pref_nid)
+				continue;
+
+			if (node_epoch[node] > 0)
+				cpumask_or(cpus, cpus, cpumask_of_node(node));
+		}
+	}
+
 	cpumask_or(cpus, cpus, cpumask_of_node(pref_nid));
 
 	/* honor the task's preferred LLC CPU */
-- 
2.34.1


