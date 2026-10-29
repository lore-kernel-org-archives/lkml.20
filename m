Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793242902;
	b=DrmN6itQ8UJcv/Dg/85vAxT543fElil90THDNeYVMXigyBUMfL6wA2lJh34TvXs8ODYo
	 0o+kPxe/rfR4OKnwDl0H33q97VyggyLfmmUq5VCFeOQp9sW6SxFrrykpRsqCVGDSYRFoW
	 9+SIkXraU1Mo/WBtTFjXLohyCx8Sjfs9rM2H1BJjeP/22Eo+vUo8FsW2x3+TvGTnBGQml
	 PfHYl/+rurLqKymCTGuj2Y0OoevFxlj1leqTRTRypr03JYPBa1nEizlMUVBxC//c3Ad/1
	 yRpUkRL4SqtWI8N5qfjJ9kXgh+pWiTGSgtbYcp68+GR1dx8sWvyeldKbqywzWtawjyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793242902;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=v2WxOJQXc1Rpx1VWweZKIZ05Pcv9QyrOy3INkyTffTk=;
	b=speu+OFWXrDZlZtNxnWyCpabIem867LcVWQj8zz+/O2gtytq2zBIB5aH7sN+s8oHgBU4
	 ktIj282nIHs3VYw1Sh4R3KTz6JwOToAX4ZYI8RPLLqm4E33Cel04G58CAb2KXN4/ttp47
	 85qLyYfx5SxUVA0nQZ3Z935xNcgK4hXeC78bMK9UiUTC6h3xXW5VHT8e4FN5LbrHong86
	 38Kdd5CLrGW5miushwAVypdoLJ58MJZXREGsBRiJlSgB40tealzwBo23XysYXJfzO72ZG
	 XNQoXdGBnTU+M+r69wh8dQJy/54fAsRV2kiVafMhFjydJKp7uhWlUMtRrx+I7wgDBgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862B0606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 862B0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFTX11XDmz171Ys;
	Thu, 29 Oct 2026 11:01:21 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFTWz08wDz171Yf;
	Thu, 29 Oct 2026 11:01:19 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 2405378B2;
	Thu, 29 Oct 2026 11:01:12 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 29 Oct
 2026 11:01:17 +0800
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
Subject: [RFC PATCH v3 15/17] sched/cache: Include recently used preferred nodes in LLC scans
Date: Thu, 29 Oct 2026 10:56:14 +0800
Message-ID: <20261029025614.4004884-1-wujianyong@hygon.cn>
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

get_scan_cpumasks() includes the current task's preferred NUMA node,
but other tasks sharing the mm may prefer different nodes. This makes
the LLC scan scope depend on which task performs the scan.

Record preferred nodes observed while accounting tasks that share the
mm, and include recently observed nodes in the scan mask. Expire stale
records using the LLC affinity timeout and clear them when the mm's
preferred cache state is invalidated.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 include/linux/mm_types.h |  6 +-----
 include/linux/sched.h    |  1 +
 kernel/sched/fair.c      | 44 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 5 deletions(-)

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
index 20a6a7f5c2f7..b93b6e6c9dea 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1594,6 +1594,9 @@ void mm_init_sched(struct mm_struct *mm,
 	mm->sc_stat.next_scan = jiffies;
 	mm->sc_stat.nr_running_avg = 0;
 	mm->sc_stat.footprint = 0;
+	mm->sc_stat.node_epoch = kcalloc(num_possible_nodes(),
+					 sizeof(*mm->sc_stat.node_epoch),
+					 GFP_KERNEL);
 	/*
 	 * The update to mm->sc_stat should not be reordered
 	 * before initialization to mm's other fields, in case
@@ -1602,6 +1605,14 @@ void mm_init_sched(struct mm_struct *mm,
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
@@ -1689,7 +1700,9 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 {
 	struct sched_cache_time *pcpu_sched;
 	struct mm_struct *mm = p->mm;
+	unsigned long *node_epoch;
 	int mm_sched_llc = -1;
+	int node, pref_nid = NUMA_NO_NODE;
 	unsigned long epoch;
 
 	if (!sched_cache_enabled())
@@ -1713,6 +1726,13 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 		epoch = rq->cpu_epoch;
 	}
 
+	node_epoch = mm->sc_stat.node_epoch;
+#ifdef CONFIG_NUMA_BALANCING
+	pref_nid = READ_ONCE(p->numa_preferred_nid);
+#endif
+	if (pref_nid != NUMA_NO_NODE && mm->sc_stat.node_epoch)
+		mm->sc_stat.node_epoch[pref_nid] = epoch;
+
 	/*
 	 * If this process hasn't hit task_cache_work() for a while invalidate
 	 * its preferred state.
@@ -1722,6 +1742,16 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
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
@@ -1765,10 +1795,12 @@ static void get_scan_cpumasks(cpumask_var_t cpus, struct task_struct *p)
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
@@ -1789,6 +1821,18 @@ static void get_scan_cpumasks(cpumask_var_t cpus, struct task_struct *p)
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


