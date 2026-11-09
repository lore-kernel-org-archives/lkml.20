Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242233;
	b=3GwiTy/4VD9Y9yWCwyiFqB7WEVRhoyFv5OhJpywq3r1c48YHAkGteYAenOBR6AIysG2s
	 dchjRoMQATHjm771QoVSf/WQFZsLsg/9o1X1Qj//dvroOCgL4e0CP5LEZyMWIlp+MIT23
	 lVErxVzfgx3bP3qZ48M6n73L0czg5mj4SFQHbIJgvKutnPZ5Iy+/PDy5EuFO1oDA82j8m
	 Qe70NsCwm/X11suTUUitYH0XtnYkT7ygA7uFmnW+8piwt7YG3OWZAqGehIhnP6R2FFP22
	 B9Iv35Xgg0u7sCEDhQJWF298oa3trg5+ifub9A873QdnzYK6XqTI/xemOx9jmVAxv6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iV4MSBv1m3zZ0qC3foM53r7HPoheP/jpXByvwGcGppE=;
	b=dR9Hd52kAvl1G5mInDzq7L7HkKkeElnPqswHVw6QVmjXcAX+nxo6coGUD6fW5td0jA2N
	 Spv8NUsrNmZ4FKOXSprN3ou1ymxnyGYfUMpP+wsxcfPeYUufz5zxPC4qP+qD8f5UOGkOt
	 Pq3S+BkA0dnPcuOs/DwL7GHdbGzQnhVTgs6UWZOte1+83GdZnXpJIIqO/nl2m+7cvJsmu
	 UozmJO+tSlvICsLxH+cna0AkSmX2DxkTjlo11yjOGST7xCZGMPIh+TsXOEnjt2rSG7+CU
	 Qz0uygR+I/2WqBlXNKUQNBuzkw58SH1vq6usouKpLd1LPzc+g1p1G/eyGo8R5fGycQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yws5LF30;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC76160A6F73
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC76160A6F73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yws5LF30
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a215e64962so12864025e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242224; x=1794847024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iV4MSBv1m3zZ0qC3foM53r7HPoheP/jpXByvwGcGppE=;
        b=Yws5LF30Z2wid/h4tykUTOKqTeT9cQcfslDLmkbZlQw9Izn/7WGTX1dEN1ghmHggmp
         umPWUOl93KVzCjwqFruWZcnxebbzO9b0ZJB+4bSJK9kCfTb0Bw+7t67XdThVAyy4Yb1+
         qrUQo2O1uSlq+zC82D6i+4TmgrFa9toHBPdjxq8o9HKfhz+T3gUfBl3rRJTDQkjlTGGF
         6KxpY232OYJlaQEsltoGBTcA+KeuesFJBbEqo9RJU27WFD+gb8OMnl122VyLKNfmBQpK
         krVJ2NxT9oGSwKoIhj5p8Y5C6OS6qduPG+jhXUGQkGjsyFd+dtrYk0wHZ2PSwX5Pvt3E
         n7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242224; x=1794847024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iV4MSBv1m3zZ0qC3foM53r7HPoheP/jpXByvwGcGppE=;
        b=K6+jMXjpKz6jsyM7UkrJOV0gRmw5yk4n7LFGunluCP29ccmGBjEi/9keEGpJeowShF
         oYy0BpwTd6TAXqRhADcD83bV0Sh48XPux2XsWoh84CG/L4qt3Tzdyf4uXCOVfs+8Lhr5
         cRJ8hwlr9sPtg9hsMozMEoVxGdzuUzkWFmKG22OWHoN0fmpRE1zytG2Z6al+Oe0Rpsb6
         vcEypIuxiP00NxG3/yf8VkI2mIaYCOx/rC1yfmdyizituWmIo0pcwD/Ma2pdFUNAW2Mj
         1krw5kNyRQ9CzlJsfqY4nhIn+DUh4k7Wy+d64aspS7NllVEDfRKWdvYwOe6vWdkcCO27
         Tj5w==
X-Forwarded-Encrypted: i=1; AL+hErHt9zIUxhdyQfIBf90/XwpbiF6wnw+s7Un2dmsL7d51vAWxz/5W7niW1/Gq8YbEw6BkGYA8NcO4aNe6vrc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+paUweFidTb1H8JL9PjpCDrRSnFnS0Puo11mKXWUAD2QwwlTuc
	vi0hTpIo9rGHhJ6JjKf+hrG+c60T9saww2Jhw6mwjIOpqE3Qpp2sEDPbwdASAA==
X-Gm-Gg: AYBFou0fCHd+Uyhn0SY2+IkVYjcu4sjzzi6XRGzp3DG2JyGv6ky+4F24j7/Z39jDq5G
	E3Wawl9nWgOHrzZgEDS5/EmQKN6SeIhilouq5+9YtbvyV6r8/1U1C8MEs5RxwwaR6/2Iyj0myO3
	d7Mff8vWniFPgU+V3kXR7xFlVtxeuCI75mxePFtdmRtFmaqUFRyqoBP4HVppBSQyneSDCBxdNDw
	ieNs5hqcAJUkRhW+ldKqhVT/57983V5XYWwFrgqHW+7ESaEX9Lxz1NHDgJ60bEh86O+BGAMJBC1
	Zcnxd76RX4spwo2LWLd/8R2hZXtCQMAgHK1WdJbGF5kxMUr7UoBnLLbgqbfItG7yqSJC1ocDeU6
	vK0o5J0qrpZOLLLp+YZ3vSEWZf3ns1/IbXe5zLstH+fRmnugTZcuqErBpXxxOhWr1a/tJ4SwN9g
	aVbK4wkSmZpnInO1IBiMdogabIR/EA6VvbIpG8d9W9/TVOpRqU2cGWkBSlNPiqTWN8Twe/m0NyX
	GVkNuk1vofd/+3sM9rJt1c9kF0uHkWz4EpP5rFzAhrFdNbhZ5TXoxYaeFPtJUavhG9n91DGfoLp
	iwBa5ABdlhLUD3CGSN97yBR+mgQvpIQLSys/ti3AHemk648=
X-Received: by 2002:a05:600c:4f13:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4b963ca28a4mr104820785e9.34.1794242224184;
        Mon, 09 Nov 2026 08:37:04 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b96cd012e1sm138851295e9.8.2026.11.09.08.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:37:03 -0800 (PST)
From: Yuri Andriaccio <yurand2000@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: [RFC PATCH v7 27/29] sched/rt: Integrate cpuset and cpu controllers
Date: Mon,  9 Nov 2026 17:36:13 +0100
Message-ID: <20261109163616.195264-28-yurand2000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109163616.195264-1-yurand2000@gmail.com>
References: <20261109163616.195264-1-yurand2000@gmail.com>
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

Integrate the cpuset and cpu controllers:
- cpuset cannot be changed if the HCBS cgroup is active (non-max)
  or any of the group's children is active (cpuset_can_change function).
- introduce cpuset_effective_cpus to read the cpuset's effective mask.
- update struct dl_bandwidth to store the effective mask of the cgroup.
- remove the dl_internal_runtime in dl_bandwidth as this value is now
  per-cpu/server and equal to dl_se->dl_runtime.
- update schedulability checks to account for cpumasks.
- update cpu.rt.effective.local interface to show per-cpu internal
  values.

Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
---
 include/linux/cpuset.h  |   2 +
 kernel/cgroup/cpuset.c  |  31 +++++
 kernel/sched/core.c     |  22 +++-
 kernel/sched/deadline.c |  13 ++-
 kernel/sched/rt.c       | 249 ++++++++++++++++++++++++++--------------
 kernel/sched/sched.h    |   9 +-
 6 files changed, 237 insertions(+), 89 deletions(-)

diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
index 914983387e95..6487bdbbdeb3 100644
--- a/include/linux/cpuset.h
+++ b/include/linux/cpuset.h
@@ -81,6 +81,8 @@ extern void cpuset_cpus_allowed_locked(struct task_struct *p, struct cpumask *ma
 extern void cpuset_cpus_allowed(struct task_struct *p, struct cpumask *mask);
 extern bool cpuset_cpus_allowed_fallback(struct task_struct *p);
 extern int cpuset_num_cpus(struct cgroup *cgroup);
+extern void cpuset_effective_cpus(struct cgroup *cgroup, struct cpumask *mask);
+extern int cpuset_can_change(struct cgroup *cgroup);
 extern nodemask_t cpuset_mems_allowed(struct task_struct *p);
 #define cpuset_current_mems_allowed (current->mems_allowed)
 void cpuset_init_current_mems_allowed(void);
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 3219f927c35e..c7fd878154c6 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2572,6 +2572,10 @@ static int update_cpumask(struct cpuset *cs, struct cpuset *trialcs,
 	if (cpumask_equal(cs->cpus_allowed, trialcs->cpus_allowed))
 		return 0;
 
+	/* Disallow change if subtree has any allocated rt-cgroup */
+	if (!cpuset_can_change(cs->css.cgroup))
+		return -EINVAL;
+
 	compute_trialcs_excpus(trialcs, cs);
 	trialcs->prs_err = PERR_NONE;
 
@@ -2632,6 +2636,10 @@ static int update_exclusive_cpumask(struct cpuset *cs, struct cpuset *trialcs,
 	if (cpumask_equal(cs->exclusive_cpus, trialcs->exclusive_cpus))
 		return 0;
 
+	/* Disallow change if subtree has any allocated rt-cgroup */
+	if (!cpuset_can_change(cs->css.cgroup))
+		return -EINVAL;
+
 	/*
 	 * Reject the change if there is exclusive CPUs conflict with
 	 * the siblings.
@@ -3585,6 +3593,10 @@ static ssize_t cpuset_partition_write(struct kernfs_open_file *of, char *buf,
 	else
 		return -EINVAL;
 
+	/* Disallow change if subtree has any allocated rt-cgroup */
+	if (!cpuset_can_change(cs->css.cgroup))
+		return -EINVAL;
+
 	mutex_lock(&cpuset_top_mutex);
 	cpus_read_lock();
 	wait_attach_done_lock();
@@ -4354,6 +4366,25 @@ int cpuset_num_cpus(struct cgroup *cgrp)
 	return nr;
 }
 
+void cpuset_effective_cpus(struct cgroup *cgrp, struct cpumask *mask)
+{
+	struct cpuset *cs;
+
+	if (!is_in_v2_mode()) {
+		cpumask_copy(mask, cpu_online_mask);
+		return;
+	}
+
+	guard(rcu)();
+	cs = css_cs(cgroup_e_css(cgrp, &cpuset_cgrp_subsys));
+	if (!cs) {
+		cpumask_copy(mask, cpu_online_mask);
+		return;
+	}
+
+	cpumask_copy(mask, cs->effective_cpus);
+}
+
 void __init cpuset_init_current_mems_allowed(void)
 {
 	nodes_setall(current->mems_allowed);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index e4e50202896d..59bd9599c509 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8970,6 +8970,8 @@ void __init sched_init(void)
 	init_defrootdomain();
 
 #ifdef CONFIG_RT_GROUP_SCHED
+	BUG_ON(!alloc_dl_bandwidth(&root_task_group.dl_bandwidth, GFP_NOWAIT));
+
 	init_dl_bandwidth(&root_task_group.dl_bandwidth,
 			  global_rt_period(), 0, &root_task_group);
 #endif /* CONFIG_RT_GROUP_SCHED */
@@ -10426,6 +10428,19 @@ static void __maybe_unused cpu_period_quota_print(struct seq_file *sf,
 	seq_printf(sf, " %ld\n", period);
 }
 
+static void __maybe_unused cpu_period_quota_single_print(struct seq_file *sf, int cpu,
+							 long period, long quota)
+{
+	seq_printf(sf, "%d ", cpu);
+
+	if (quota < 0)
+		seq_puts(sf, "runtime=max");
+	else
+		seq_printf(sf, "runtime=%ld", quota);
+
+	seq_printf(sf, " period=%ld\n", period);
+}
+
 /* caller should put the current value in *@periodp before calling */
 static int __maybe_unused cpu_period_quota_parse(char *buf, u64 *period_us_p,
 						 u64 *quota_us_p)
@@ -10486,9 +10501,12 @@ static int cpu_rt_internal_show(struct seq_file *sf, void *v)
 {
 	struct task_group *tg = css_tg(seq_css(sf));
 	u64 period_us, runtime_us;
+	int cpu;
 
-	tg_rt_internal_bandwidth(tg, &period_us, &runtime_us);
-	cpu_period_quota_print(sf, period_us, runtime_us);
+	for_each_possible_cpu(cpu) {
+		tg_rt_internal_bandwidth(tg, cpu, &period_us, &runtime_us);
+		cpu_period_quota_single_print(sf, cpu, period_us, runtime_us);
+	}
 	return 0;
 }
 
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 6220d793ae91..0282258db3e9 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -592,14 +592,25 @@ static inline int is_leftmost(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq
 
 static void init_dl_rq_bw_ratio(struct dl_rq *dl_rq);
 
+struct dl_bandwidth *alloc_dl_bandwidth(struct dl_bandwidth *dl_b, gfp_t gfp_flags) {
+	if (!alloc_cpumask_var(&dl_b->active_mask, gfp_flags))
+		return NULL;
+
+	return dl_b;
+}
+
+void free_dl_bandwidth(struct dl_bandwidth *dl_b) {
+	free_cpumask_var(dl_b->active_mask);
+}
+
 void init_dl_bandwidth(struct dl_bandwidth *dl_b, u64 period, u64 runtime,
 		       struct task_group *active_context)
 {
 	raw_spin_lock_init(&dl_b->dl_runtime_lock);
 	dl_b->dl_period = period;
 	dl_b->dl_runtime = runtime;
-	dl_b->dl_internal_runtime = 0;
 	dl_b->active_context = active_context;
+	cpumask_clear(dl_b->active_mask);
 }
 
 
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index fffb6ec30e68..37e4b24183ab 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -172,6 +172,7 @@ void free_rt_sched_group(struct task_group *tg)
 
 	kfree(tg->rt_rq);
 	kfree(tg->dl_se);
+	free_dl_bandwidth(&tg->dl_bandwidth);
 }
 
 static inline void __rt_rq_free(struct rt_rq **rt_rq)
@@ -206,6 +207,7 @@ static int __alloc_rt_sched_group_data(struct task_group *tg) {
 	struct rt_rq **tg_rt_rq __free(rt_rq_free) = NULL;
 	struct sched_dl_entity **tg_dl_se __free(dl_se_free) = NULL;
 	struct sched_dl_entity *dl_se __free(kfree) = NULL;
+	struct dl_bandwidth *dl_b __free(dl_bandwidth_free) = NULL;
 	struct rq *s_rq __free(kfree) = NULL;
 	int i;
 
@@ -218,6 +220,10 @@ static int __alloc_rt_sched_group_data(struct task_group *tg) {
 	if (!tg_dl_se)
 		return 0;
 
+	dl_b = alloc_dl_bandwidth(&tg->dl_bandwidth, GFP_KERNEL);
+	if(!dl_b)
+		return 0;
+
 	for_each_possible_cpu(i) {
 		s_rq = kzalloc_node(sizeof(struct rq),
 				    GFP_KERNEL, cpu_to_node(i));
@@ -235,6 +241,7 @@ static int __alloc_rt_sched_group_data(struct task_group *tg) {
 
 	tg->rt_rq = no_free_ptr(tg_rt_rq);
 	tg->dl_se = no_free_ptr(tg_dl_se);
+	retain_and_null_ptr(dl_b);
 
 	return 1;
 }
@@ -1416,7 +1423,8 @@ static int find_lowest_rt_rq(struct task_struct *task)
 			* different capacities of the CPUs when searching for
 			* the lowest_mask.
 			*/
-			if (dl_se->dl_throttled || !rt_task_fits_capacity(task, cpu))
+			if (!dl_se->dl_runtime || dl_se->dl_throttled ||
+			    !rt_task_fits_capacity(task, cpu))
 				continue;
 
 			if (prio >= lowest_prio) {
@@ -1567,7 +1575,8 @@ static struct rt_rq *find_lock_lowest_rt_rq(struct task_struct *task, struct rt_
 			 * check the task migration disable flag here too.
 			 */
 			if (unlikely(is_migration_disabled(task) ||
-				     (dl_group && lowest_dl_se->dl_throttled) ||
+				     (dl_group && lowest_dl_se->dl_throttled &&
+				      !lowest_dl_se->dl_runtime) ||
 				     !cpumask_test_cpu(lowest_rq->cpu, &task->cpus_mask) ||
 				     task != pick_next_pushable_task(rt_rq))) {
 
@@ -2418,114 +2427,132 @@ static int tg_subtree_has_rt_tasks(struct task_group *tg) {
 			         dl_bandwidth_read(tg)->active_context);
 }
 
+static inline u64 tg_cpu_period(const struct dl_bandwidth *dl_b, int cpu) {
+	return cpumask_test_cpu(cpu, dl_b->active_mask) ? dl_b->dl_period : 0;
+}
+
+static inline u64 tg_cpu_runtime(const struct dl_bandwidth *dl_b, int cpu) {
+	return cpumask_test_cpu(cpu, dl_b->active_mask) ? dl_b->dl_runtime : 0;
+}
+
 struct tg_update_data {
 	struct task_group *tg;
-	u64 rt_period;
-	u64 rt_runtime;
+	struct dl_bandwidth dl_b;
 };
 
 struct tg_compute_children_bw_data {
 	struct tg_update_data update;
 	struct task_group *active_context;
-	u64 period;
-	u64 runtime_sum;
+	const struct cpumask *mask;
+	u64 *rt_runtime_sum;
 };
 
 static int __tg_compute_children_runtime(struct task_group *tg, void *data) {
 	struct tg_compute_children_bw_data *d = data;
 	const struct task_group *parent_active_context;
-	const struct dl_bandwidth *dl_b_parent, *dl_b = dl_bandwidth_read(tg);
-	u64 period, runtime;
+	const struct dl_bandwidth *reference_dl_b, *dl_b_parent, *dl_b;
+	u64 reference_period, period, runtime;
+	int cpu;
 
 	/* Skip the current task group from the sum. */
 	if (tg == d->active_context)
 		return 0;
 
-	period = dl_b->dl_period;
-	runtime = dl_b->dl_runtime;
+	reference_dl_b = dl_bandwidth_read(d->active_context);
+	dl_b = dl_bandwidth_read(tg);
 	if (tg == d->update.tg) {
-		period = d->update.rt_period;
-		runtime = d->update.rt_runtime;
+		dl_b = &d->update.dl_b;
 	}
-	if (runtime == RUNTIME_INF || period == 0)
+
+	/* Skip the task group if runtime = `max` */
+	if (dl_b->dl_runtime == RUNTIME_INF)
 		return 0;
 
+	/* Skip the task group if it's parent active context is not current */
 	dl_b_parent = dl_bandwidth_read(tg->parent);
 	parent_active_context = dl_b_parent->active_context;
 	if (tg->parent == d->update.tg) {
 		if (dl_b_parent->dl_runtime != RUNTIME_INF &&
-		    d->update.rt_runtime == RUNTIME_INF)
+		    d->update.dl_b.dl_runtime == RUNTIME_INF)
 			parent_active_context = dl_bandwidth_read(tg->parent->parent)->active_context;
-		else if (d->update.rt_runtime != RUNTIME_INF)
+		else if (d->update.dl_b.dl_runtime != RUNTIME_INF)
 			parent_active_context = tg->parent;
 	}
 
 	if (parent_active_context != d->active_context)
 		return 0;
 
-	d->runtime_sum += mul_u64_u64_div_u64(runtime, d->period, period);
+	for_each_cpu(cpu, d->mask) {
+		reference_period = tg_cpu_period(reference_dl_b, cpu);
+		period = tg_cpu_period(dl_b, cpu);
+		runtime = tg_cpu_runtime(dl_b, cpu);
+
+		if (period)
+			d->rt_runtime_sum[cpu] += mul_u64_u64_div_u64(runtime, reference_period, period);
+	}
+
 	return 0;
 }
 
-static u64
-tg_compute_children_runtime(struct task_group *tg,
-			    u64 normalization_period,
-			    struct tg_update_data *data)
+static void tg_compute_children_runtime(struct task_group *tg,
+					struct tg_update_data *data,
+					const struct cpumask *mask,
+					u64 *sum_runtime)
 {
+	int cpu;
 	struct tg_compute_children_bw_data sum_data = {
 		.active_context = tg,
-		.period = normalization_period,
-		.runtime_sum = 0,
+		.rt_runtime_sum = sum_runtime,
+		.mask = mask,
 		.update = *data,
 	};
 
+	for_each_cpu(cpu, mask)
+		sum_runtime[cpu] = 0;
+
 	lockdep_assert(rcu_read_lock_held());
 	walk_tg_tree_from(tg, __tg_compute_children_runtime, tg_nop, &sum_data);
-	return sum_data.runtime_sum;
 }
 
 struct rt_schedulable_data {
 	struct tg_update_data update;
-	u64 rt_runtime_remainder;
+	u64 *children_runtime;
+	u64 *rt_runtime_remainder;
 };
 
 static int __tg_rt_schedulable(struct task_group *tg, void *data)
 {
 	struct rt_schedulable_data *d = data;
 	const struct dl_bandwidth *dl_b;
-	u64 total, sum = 0;
-	u64 period, runtime;
+	u64 total, runtime;
+	int cpu;
 
 	dl_b = dl_bandwidth_read(tg);
-	period = dl_b->dl_period;
-	runtime = dl_b->dl_runtime;
-
 	if (tg == d->update.tg) {
-		period = d->update.rt_period;
-		runtime = d->update.rt_runtime;
+		dl_b = &d->update.dl_b;
 	}
 
 	/*
 	 * "max" groups are always schedulable, as they defer their access
 	 * control to their first non-max parent.
 	 */
-	if (runtime == RUNTIME_INF)
+	if (dl_b->dl_runtime == RUNTIME_INF)
 		return 0;
 
 	/*
 	 * Cannot have more runtime than the period.
 	 */
-	if (runtime > period)
+	if (dl_b->dl_runtime > dl_b->dl_period)
 		return -EINVAL;
 
 	/*
 	 * Ensure we don't starve existing RT tasks if runtime turns zero.
 	 */
-	if (dl_bandwidth_enabled() && !runtime && tg != &root_task_group &&
+	if (dl_bandwidth_enabled() && !dl_b->dl_runtime && tg != &root_task_group &&
 	    tg_subtree_has_rt_tasks(tg))
 		return -EBUSY;
 
-	total = to_ratio(period, runtime);
+	total = to_ratio(dl_b->dl_period, dl_b->dl_runtime);
 
 	/*
 	 * Nobody can have more than the global setting allows.
@@ -2542,16 +2569,18 @@ static int __tg_rt_schedulable(struct task_group *tg, void *data)
 	 * The sum of our children's runtime, plus our own bw, should not
 	 * exceed our own max.
 	 */
-	total = runtime;
-	sum = tg_compute_children_runtime(tg, period, &d->update);
-	if (sum > total)
-		return -EINVAL;
+	tg_compute_children_runtime(tg, &d->update, cpu_possible_mask, d->children_runtime);
+	for_each_possible_cpu(cpu) {
+		runtime = tg_cpu_runtime(dl_b, cpu);
+		if (d->children_runtime[cpu] > runtime)
+			return -EINVAL;
 
-	/*
-	 * Compute remaining runtime
-	 */
-	if (tg == d->update.tg)
-		d->rt_runtime_remainder = total - sum;
+		/*
+		 * Compute remaining runtime
+		 */
+		if (tg == d->update.tg)
+			d->rt_runtime_remainder[cpu] = runtime - d->children_runtime[cpu];
+	}
 
 	return 0;
 }
@@ -2559,15 +2588,25 @@ static int __tg_rt_schedulable(struct task_group *tg, void *data)
 static int tg_rt_schedulable(struct tg_update_data *data, u64 *remainder_runtime)
 {
 	int err;
+	u64 *children_runtime __free(kfree) = NULL;
+	u64 *rt_runtime_remainder __free(kfree) = NULL;
 	struct rt_schedulable_data d = {
-		.update = (struct tg_update_data) {
-			.tg = data->tg,
-			.rt_period = data->rt_period,
-			.rt_runtime = data->rt_runtime,
-		},
-		.rt_runtime_remainder = 0,
+		.update = *data,
+		.children_runtime = NULL,
+		.rt_runtime_remainder = NULL,
 	};
 
+	children_runtime = kcalloc(nr_cpu_ids, sizeof(u64), GFP_NOWAIT);
+	if (!children_runtime)
+		return -ENOMEM;
+
+	rt_runtime_remainder = kcalloc(nr_cpu_ids, sizeof(u64), GFP_NOWAIT);
+	if (!rt_runtime_remainder)
+		return -ENOMEM;
+
+	d.children_runtime = children_runtime;
+	d.rt_runtime_remainder = rt_runtime_remainder;
+
 	/*
 	 * Walk the cgroup tree and check schedulability constraints.
 	 */
@@ -2576,7 +2615,7 @@ static int tg_rt_schedulable(struct tg_update_data *data, u64 *remainder_runtime
 	if (err)
 		return err;
 
-	*remainder_runtime = d.rt_runtime_remainder;
+	memcpy(remainder_runtime, rt_runtime_remainder, array_size(nr_cpu_ids, sizeof(u64)));
 	return 0;
 }
 
@@ -2626,16 +2665,25 @@ int tg_rt_bandwidth(struct task_group *tg,
 	return 0;
 }
 
-int tg_rt_internal_bandwidth(struct task_group *tg,
+int tg_rt_internal_bandwidth(struct task_group *tg, int cpu,
 			     u64 *rt_period_us, u64 *rt_runtime_us)
 {
 	const struct dl_bandwidth *dl_b;
+	cpumask_var_t mask __free(free_cpumask_var) = CPUMASK_VAR_NULL;
+
+	if (!alloc_cpumask_var(&mask, GFP_NOWAIT))
+		return 0;
+
+	cpuset_effective_cpus(tg->css.cgroup, mask);
 
 	guard(raw_spinlock_irq)(dl_bw_lock_of_tg(tg));
 	dl_b = dl_bandwidth_read(tg);
 
-	*rt_runtime_us = dl_b->dl_internal_runtime;
-	*rt_runtime_us = DIV64_U64_ROUND_CLOSEST(*rt_runtime_us, NSEC_PER_USEC);
+	*rt_runtime_us = -1;
+	if (dl_b->dl_runtime != RUNTIME_INF || !cpumask_test_cpu(cpu, mask)) {
+		*rt_runtime_us = tg->dl_se[cpu]->dl_runtime;
+		*rt_runtime_us = DIV64_U64_ROUND_CLOSEST(*rt_runtime_us, NSEC_PER_USEC);
+	}
 
 	*rt_period_us = div64_u64(dl_b->dl_period, NSEC_PER_USEC);
 
@@ -2646,11 +2694,13 @@ int tg_set_rt_bandwidth(struct task_group *tg,
 			u64 rt_period_us, u64 rt_runtime_us)
 {
 	struct tg_update_data update;
+	struct dl_bandwidth *__update_dl_b __free(dl_bandwidth_free) = NULL;
 	struct task_group *parent_ctx;
-	struct dl_bandwidth *dl_b;
+	struct dl_bandwidth *dl_b_write;
+	const struct dl_bandwidth *dl_b;
 	u64 rt_period, rt_runtime, old_rt_runtime;
-	u64 rt_actual_runtime = 0;
-	u64 runtime, children_runtime;
+	u64 *rt_actual_runtime __free(kfree) = NULL;
+	u64 period, runtime;
 	struct sched_attr attr;
 	int err, i;
 
@@ -2692,14 +2742,9 @@ int tg_set_rt_bandwidth(struct task_group *tg,
 	if (rt_runtime != RUNTIME_INF && !__checkparam_dl(&attr, true))
 		return -EINVAL;
 
-	update = (struct tg_update_data) {
-		.tg = tg,
-		.rt_period  = rt_period,
-		.rt_runtime = rt_runtime,
-	};
-
 	guard(mutex)(&rt_constraints_mutex);
-	old_rt_runtime = dl_bandwidth_read(tg)->dl_runtime;
+	dl_b = dl_bandwidth_read(tg);
+	old_rt_runtime = dl_b->dl_runtime;
 
 	/*
 	 * Disallow changing from/to "max" and a HCBS reservation if the group
@@ -2713,15 +2758,28 @@ int tg_set_rt_bandwidth(struct task_group *tg,
 	     tg_subtree_has_rt_tasks(tg))
 		return -EINVAL;
 
-	err = tg_rt_schedulable(&update, &rt_actual_runtime);
+	rt_actual_runtime = kcalloc(nr_cpu_ids, sizeof(u64), GFP_NOWAIT);
+	if (!rt_actual_runtime)
+		return -ENOMEM;
+
+	__update_dl_b = alloc_dl_bandwidth(&update.dl_b, GFP_NOWAIT);
+	if(!__update_dl_b)
+		return -ENOMEM;
+
+	init_dl_bandwidth(&update.dl_b, rt_period, rt_runtime, dl_b->active_context);
+	update.tg = tg;
+
+	cpuset_effective_cpus(tg->css.cgroup, update.dl_b.active_mask);
+
+	err = tg_rt_schedulable(&update, rt_actual_runtime);
 	if (err)
 		return err;
 
 	scoped_guard(raw_spinlock_irq, dl_bw_lock_of_tg(tg)) {
-		dl_b = dl_bandwidth_write(tg);
-		dl_b->dl_period  = rt_period;
-		dl_b->dl_runtime = rt_runtime;
-		dl_b->dl_internal_runtime = rt_actual_runtime;
+		dl_b_write = dl_bandwidth_write(tg);
+		dl_b_write->dl_period  = rt_period;
+		dl_b_write->dl_runtime = rt_runtime;
+		cpumask_copy(dl_b_write->active_mask, update.dl_b.active_mask);
 	}
 
 	if (tg == &root_task_group)
@@ -2737,15 +2795,13 @@ int tg_set_rt_bandwidth(struct task_group *tg,
 	    (rt_runtime != RUNTIME_INF && old_rt_runtime == RUNTIME_INF))
 	{
 		if (rt_runtime == RUNTIME_INF)
-			tg_update_active_context(tg, dl_b->active_context, parent_ctx);
+			tg_update_active_context(tg, update.dl_b.active_context, parent_ctx);
 		else
-			tg_update_active_context(tg, dl_b->active_context, tg);
-
+			tg_update_active_context(tg, update.dl_b.active_context, tg);
 	}
 
-	WARN_ON(rt_runtime == RUNTIME_INF && rt_actual_runtime != 0);
 	for_each_possible_cpu(i) {
-		dl_init_tg(tg->dl_se[i], rt_actual_runtime, rt_period);
+		dl_init_tg(tg->dl_se[i], rt_actual_runtime[i], tg_cpu_period(dl_b, i));
 	}
 
 	/*
@@ -2754,24 +2810,49 @@ int tg_set_rt_bandwidth(struct task_group *tg,
 	if (parent_ctx == &root_task_group)
 		return 0;
 
-	scoped_guard(raw_spinlock_irq, dl_bw_lock_of_tg(parent_ctx)) {
-		dl_b = dl_bandwidth_write(parent_ctx);
+	dl_b = dl_bandwidth_read(parent_ctx);
 
-		runtime = dl_b->dl_runtime;
-		children_runtime = tg_compute_children_runtime(parent_ctx, dl_b->dl_period, &update);
+	tg_compute_children_runtime(parent_ctx, &update, update.dl_b.active_mask, rt_actual_runtime);
+	for_each_cpu(i, update.dl_b.active_mask) {
+		period = tg_cpu_period(dl_b, i);
+		runtime = tg_cpu_runtime(dl_b, i) - rt_actual_runtime[i];
 
-		rt_period = dl_b->dl_period;
-		rt_actual_runtime = runtime - children_runtime;
-		dl_b->dl_internal_runtime = rt_actual_runtime;
+		dl_init_tg(parent_ctx->dl_se[i], runtime, period);
 	}
 
-	for_each_possible_cpu(i) {
-		dl_init_tg(parent_ctx->dl_se[i], rt_actual_runtime, rt_period);
-	}
+	return 0;
+}
+
+static int __tg_subtree_is_max(struct task_group *tg, void *data) {
+	const struct dl_bandwidth *dl_b;
+
+	guard(raw_spinlock_irq)(dl_bw_lock_of_tg(tg));
+	dl_b = dl_bandwidth_read(tg);
+	if (dl_b->dl_runtime != RUNTIME_INF)
+		return 1;
 
 	return 0;
 }
 
+int cpuset_can_change(struct cgroup *cgroup) {
+	struct task_group *tg;
+	int err;
+
+	if (!rt_group_sched_enabled())
+		return 1;
+
+	guard(rcu)();
+	tg = css_tg(cgroup_e_css(cgroup, &cpu_cgrp_subsys));
+	if (!tg)
+		return 0;
+
+	err = walk_tg_tree_from(tg, __tg_subtree_is_max, tg_nop, NULL);
+	if (err)
+		return 0;
+
+	return 1;
+}
+
 int sched_rt_can_attach(struct task_group *tg)
 {
 	struct task_group *ctx;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 323befba5609..9410d1909729 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -316,8 +316,8 @@ struct rt_prio_array {
 struct dl_bandwidth {
 	raw_spinlock_t		dl_runtime_lock;
 	u64			dl_runtime;
-	u64			dl_internal_runtime;
 	u64			dl_period;
+	cpumask_var_t		active_mask;
 	struct task_group	*active_context;
 };
 
@@ -586,7 +586,7 @@ extern bool cfs_task_bw_constrained(struct task_struct *p);
 
 extern int tg_rt_bandwidth(struct task_group *tg,
 			   u64 *rt_period_us, u64 *rt_runtime_us);
-extern int tg_rt_internal_bandwidth(struct task_group *tg,
+extern int tg_rt_internal_bandwidth(struct task_group *tg, int cpu,
 				    u64 *rt_period_us, u64 *rt_runtime_us);
 extern int tg_set_rt_bandwidth(struct task_group *tg,
 			       u64 rt_period_us, u64 rt_runtime_us);
@@ -3054,6 +3054,11 @@ extern void resched_curr(struct rq *rq);
 extern void resched_curr_lazy(struct rq *rq);
 extern void resched_cpu(int cpu);
 
+extern struct dl_bandwidth *alloc_dl_bandwidth(struct dl_bandwidth *dl_b, gfp_t gfp_flags);
+extern void free_dl_bandwidth(struct dl_bandwidth *dl_b);
+
+DEFINE_FREE(dl_bandwidth_free, struct dl_bandwidth *, if (_T) free_dl_bandwidth(_T))
+
 extern void init_dl_bandwidth(struct dl_bandwidth *dl_b, u64 period, u64 runtime,
 			      struct task_group *active_context);
 extern void init_dl_entity(struct sched_dl_entity *dl_se);
-- 
2.56.0

