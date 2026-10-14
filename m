Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317F137E5E7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971233; cv=none; b=YlMG1Xe739+bx9EvhzZWdBW9XP3HC/by1enklkJrM8iUYA5MQG0lFqJbDDXU4iCir20JB/e+sLy8sXektWjxDMoETjsBAYvTHRE7aeXmQdNwOEllgB1muuf6KZu3/RrNkp9o13tJUyI/P4socWF+O+tYP+H8hvi/rDpNOYGpiII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971233; c=relaxed/simple;
	bh=aBVtLn5MQ5LxZew5OowEB1FNLtrfaSSvIihL5rNHeJo=;
	h=Subject:Content-Type:Date:In-Reply-To:From:Message-Id:
	 Mime-Version:References:To:Cc; b=SlVsrWucWDkkXQy39nkb7zcq1nlyPDU5+X5GbVMpsGRvfgyR4JHad1FAuZkiOHcsKU89GFPfPbHZ96MoVmfasIH4Q5gLfqMmzD4UKxuB0T95/ZDMSIs41r0Yrf9bBiXpsHonFi31NnZZsKUWzuiGLUotq1vGxoDbvikDYN46O+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UNWzPU7G; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UNWzPU7G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791971227; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=WvSSi/qfex9riZEpa78JUEMn8C07c1f5TdCJDgGPBWk=;
 b=UNWzPU7G/WKZtu+E2SlLjQSyjdH2ozBiMRrQCqdQqq5uL1k0IAqbf/KeqKt8zVXJcxSJQo
 zrJUKakCB1m4nYJM9XRplGQTbkVW/1I6uGihVaxjpdYxmsee2npPP6+63lie70RzZyArXm
 uffBP67OCtRFibDRnc+We89rPxhlooK2tkuZWVOSHDFybamQBqL3rVwMJFsYnmqss/nSNI
 f71ZrO9ONsgcj8ur58DpsJozBPqLznHK9aIcpuAOjqt7vTYtUAI9/w3eaV8jr6OszJjWP9
 B6b45DhBabq0hc2bhkMa6pKo/reYOT7Dnp4x2TAVjVRJ8zUCKviIM0L0rOV0zQ==
Subject: [PATCH 6/6] sched/numa: ignore preferred nodes without normal balancing
Content-Type: text/plain; charset=UTF-8
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 7bit
Date: Wed, 14 Oct 2026 17:43:47 +0800
In-Reply-To: <20261014094347.99157-1-lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <20261014094347.99157-7-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26acf4f99+c2e24e+vger.kernel.org+lizhe.67@bytedance.com>
References: <20261014094347.99157-1-lizhe.67@bytedance.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>, 
	<gourry@gourry.net>, <joshua.hahnjy@gmail.com>, <ziy@nvidia.com>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <mgorman@suse.de>, 
	<riel@redhat.com>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>, 
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>, 
	<vschneid@redhat.com>, <kprateek.nayak@amd.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, "Li Zhe" <lizhe.67@bytedance.com>

numa_preferred_nid is normal AutoNUMA task-placement state.
Memory-tiering-only mode uses NUMA hint faults to drive page promotion,
not CPU placement.

Even after tiering-only faults stop updating normal placement statistics,
a task can still have a preferred NUMA node from earlier normal balancing
or from previously polluted state. Several scheduler paths consume that
stale state when the NUMA balancing static key is enabled, including
explicit NUMA task migration, sched-cache preferred LLC and scan CPU mask
selection, load-balance locality checks, fbq classification, and wakeup
group selection.

Add a small helper for normal NUMA placement being enabled and use it to
ignore numa_preferred_nid when NUMA_BALANCING_NORMAL is disabled. Keep
the preferred-node migration retry timestamp update before the normal-mode
check so accepted non-normal sysctl states do not leave stale retry state
behind.

Keep the rq nr_numa_running and nr_preferred_running accounting unchanged
so runtime mode changes do not make enqueue/dequeue accounting asymmetric;
the load balancer simply stops consuming those counters while normal
balancing is off.

This does not clear numa_preferred_nid and does not change memory-tiering
promotion decisions.

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 kernel/sched/fair.c | 55 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 11 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ec08406d1364..11b54bb353ad 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1328,6 +1328,21 @@ static int select_idle_sibling(struct task_struct *p, int prev_cpu, int cpu);
 static unsigned long task_h_load(struct task_struct *p);
 static unsigned long capacity_of(int cpu);
 
+#ifdef CONFIG_NUMA_BALANCING
+static inline bool numa_balancing_normal_enabled(void)
+{
+	return sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL;
+}
+
+static inline int task_numa_preferred_nid(struct task_struct *p)
+{
+	if (!numa_balancing_normal_enabled())
+		return NUMA_NO_NODE;
+
+	return p->numa_preferred_nid;
+}
+#endif
+
 /* Give new sched_entity start runnable values to heavy its load in infant time */
 void init_entity_runnable_average(struct sched_entity *se)
 {
@@ -1890,10 +1905,12 @@ static int get_pref_llc(struct task_struct *p, struct sched_cache_group *grp)
 		 * than sched_setnuma() at least -- and thus the
 		 * conflict only exists for a short period of time.
 		 */
-		if (static_branch_likely(&sched_numa_balancing) &&
-		    p->numa_preferred_nid >= 0 &&
-		    cpu_to_node(mm_sched_cpu) != p->numa_preferred_nid)
-			mm_sched_llc = -1;
+		if (static_branch_likely(&sched_numa_balancing)) {
+			int pref_nid = task_numa_preferred_nid(p);
+
+			if (pref_nid >= 0 && cpu_to_node(mm_sched_cpu) != pref_nid)
+				mm_sched_llc = -1;
+		}
 #endif
 	}
 
@@ -2009,7 +2026,7 @@ static void get_scan_cpumasks(cpumask_var_t cpus, struct task_struct *p,
 	 * current running node to mitigate the bouncing risk.
 	 * TBD: numa_group should be considered during task aggregation.
 	 */
-	pref_nid = p->numa_preferred_nid;
+	pref_nid = task_numa_preferred_nid(p);
 	/* honor the task's preferred node */
 	if (pref_nid == NUMA_NO_NODE)
 		goto out;
@@ -3649,6 +3666,9 @@ static void numa_migrate_preferred(struct task_struct *p)
 	interval = min(interval, msecs_to_jiffies(p->numa_scan_period) / 16);
 	p->numa_migrate_retry = jiffies + interval;
 
+	if (!numa_balancing_normal_enabled())
+		return;
+
 	/* Success if task is already running on preferred CPU */
 	if (task_node(p) == p->numa_preferred_nid)
 		return;
@@ -10740,6 +10760,9 @@ static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
 	if (!static_branch_likely(&sched_numa_balancing))
 		return 0;
 
+	if (!numa_balancing_normal_enabled())
+		return 0;
+
 	if (!p->numa_faults || !(env->sd->flags & SD_NUMA))
 		return 0;
 
@@ -12533,6 +12556,9 @@ static bool update_sd_pick_busiest(struct lb_env *env,
 #ifdef CONFIG_NUMA_BALANCING
 static inline enum fbq_type fbq_classify_group(struct sg_lb_stats *sgs)
 {
+	if (!numa_balancing_normal_enabled())
+		return all;
+
 	if (sgs->sum_h_nr_running > sgs->nr_numa_running)
 		return regular;
 	if (sgs->sum_h_nr_running > sgs->nr_preferred_running)
@@ -12542,6 +12568,9 @@ static inline enum fbq_type fbq_classify_group(struct sg_lb_stats *sgs)
 
 static inline enum fbq_type fbq_classify_rq(struct rq *rq)
 {
+	if (!numa_balancing_normal_enabled())
+		return regular;
+
 	if (rq->nr_running > rq->nr_numa_running)
 		return regular;
 	if (rq->nr_running > rq->nr_preferred_running)
@@ -12843,17 +12872,21 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 		if (sd->flags & SD_NUMA) {
 			int imb_numa_nr = sd->imb_numa_nr;
 #ifdef CONFIG_NUMA_BALANCING
-			int idlest_cpu;
+			int pref_nid = task_numa_preferred_nid(p);
 			/*
 			 * If there is spare capacity at NUMA, try to select
 			 * the preferred node
 			 */
-			if (cpu_to_node(this_cpu) == p->numa_preferred_nid)
-				return NULL;
+			if (pref_nid != NUMA_NO_NODE) {
+				int idlest_cpu;
 
-			idlest_cpu = cpumask_first(sched_group_span(idlest));
-			if (cpu_to_node(idlest_cpu) == p->numa_preferred_nid)
-				return idlest;
+				if (cpu_to_node(this_cpu) == pref_nid)
+					return NULL;
+
+				idlest_cpu = cpumask_first(sched_group_span(idlest));
+				if (cpu_to_node(idlest_cpu) == pref_nid)
+					return idlest;
+			}
 #endif /* CONFIG_NUMA_BALANCING */
 			/*
 			 * Otherwise, keep the task close to the wakeup source
-- 
2.20.1
