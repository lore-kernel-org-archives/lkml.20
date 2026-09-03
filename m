Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6BD2D94AF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788401229; cv=none; b=lY62YHygYvxf3r0zcp2rXQDgVFherSqlkaYAGke5EygMLQqKhfKWMhjo9ojAftHix3C1RuC46c50XEL6mvvKv2IzoHYqp7eQI2ig6HUO+5YMkBkIOwa8EhlsV9/3ME22cM0XdCMezknc4D+5UvuAWbk7ojQi4eJO9H7HCxaV+YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788401229; c=relaxed/simple;
	bh=tD8Qpf7ftewxEp4Bj3I0Yt6b7ADYEMhbImgHpemHPZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JumzpDLH+oOuPZncN6y32x0ku8zeUsf10opH+F5zi4jIhjKSItka3nqaMWQmcyn2e/cOa91Ly1sDTx3RCnyg20YYsDK/y7192j7IynOt7r7emfhYzMFv//8RABm+tkoF+O582/SOg5/b8J5bdZi3rmRo0K1oOnDmr0REqClZN0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MF4SsTRZ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MF4SsTRZ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8535a9be75eso1501762b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788401227; x=1789006027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLiBEf56KUZE4qZF5I60oVw8Krdvzmq6q16qyKi+bTM=;
        b=MF4SsTRZg906mJd2gH41Ff1XUuWpn4BMcN79vwtzaId2O+h14AYk2OFGjGVQyMzCOu
         9WOnXF5zukhbm2de5/tWN0q7lWGHRS+ELV1Zj9JbGaZozj/3muUQ+iqrXzZgSz/ypTe3
         oniSN4lxdpJYGbI3D1RChMCjXZX+9KTtQsBLuT/YS+rBYnLUNrCwv70c9v451+RWHHWc
         6v9MNW6XKGZZ+pGXrn+oKVtv2VlZpx+UR1pilt7NeSjfk6DBNmCs+RpToQj77A0GjuvR
         l/YBK8Na+CEqmAV5VDgF01aw6rOsp7FNPv8e+03joxwUDqjExDEEVyxUKRBs5etiECef
         kr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788401227; x=1789006027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLiBEf56KUZE4qZF5I60oVw8Krdvzmq6q16qyKi+bTM=;
        b=e55QcOWMfrR4dkW6jfISgO1lXtYXj6PELx3786Fgq8OmG92iTINXbkP7nCbBObtETs
         rOG+1+UHxKB4KYai2OHR0LaukYSfLT1+u5P3QfucZHiSfAo9Ri0ZXv9aQwGBycTydGCr
         5971ZG6baRKR9HHj+snbnNvWoID20yGjQnkBUJzScTBEwXSSMZKHzncIWXhl1jssH2Gp
         Pf33wvKKAEgC7tm/c6hvFHMqV3UsFwQ+SV7naXan2efHvy2I4ZHRyNp0FIYvtD+HQR92
         q5MeDO6FObERe0nH7bUzFs2omKN4fZdAo0hZy7crNPJjbHxzmTE28V8fxS2suALIUe5b
         nieA==
X-Forwarded-Encrypted: i=1; AKwUvBx/TxoUH4xNsj7FAOcLobzsEfHCJanOH4HqdYj8Z0GYdgSd8v3F73a864eCS/i5HwrqNg9SxKbeUZfZZkM=@vger.kernel.org
X-Gm-Message-State: AFuF++lEdWENRqzf8jlWlBmf9tMV8LeSnZHq9ZEQmPswNOPPbcKX8zuh
	Gqx81YVxYwcjiVWHoCkrEog2M2dtI9Vvklj/V96IIp3wIcwau2BjRzmo
X-Gm-Gg: AYBFou3+D2lpQfuzP8R0V9vxEbuCK3yrI3e2ww+tU3rUd6nToY7kGFY51PIEooLU3bk
	+B1qzU7T6eQHnLbel5aHEG3jgcMl4CEJLEMqtUFXAL04hiHo/T+6+0F/70DtaQCK7o5uJhtne+u
	Q1JrVevJtnDxiLkDzR76ZKXnqj33WBZnZdawIzlRTMg4U+iCcmw3kvEWIksfXUw7gv3nYZ8Fbqs
	+wy4EcWeM3AmsuSAbkeSCjOS9yOATVR6yL7k98m2V5OElf7YHwA1Hh1TZiIXrA62N6f83nys87J
	/BRu8p8IisvBWIEyw+7pqEHbh7zECzmijP8X0XepcAQzzUBR+m5JcVIRiFjD8lm5QS7ETX2lDHe
	NWdeceHYiKySQCSipFyZ1UuTiQ2L66ypeldbmaB4XRW1k0osGx7HWYLQF3/FEDAN4YPFH7ax/aY
	5WyRDirfTSkzKqC6voFA90WIWDODxmrUO0Riq2FPjaX6hSHI4ncxcfz8c/AWvYSvwh0ZNF7MKVZ
	UA+k86D/URV0A==
X-Received: by 2002:a05:6a00:2e83:b0:852:6588:4b7e with SMTP id d2e1a72fcca58-85ed8018787mr12177278b3a.12.1788401227172;
        Wed, 02 Sep 2026 19:07:07 -0700 (PDT)
Received: from PC-2B0BA19500175.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db23f7b8bsm2005423b3a.2.2026.09.02.19.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 19:07:06 -0700 (PDT)
From: Lu Wang <wanglu.priv@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Lu Wang <wanglu.priv@gmail.com>,
	linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Ricardo Neri-Calderon <ricardo.neri-calderon@linux.intel.com>
Subject: [PATCH v4] sched/cache: Honor migrate_llc_task semantics in active load balance
Date: Thu,  3 Sep 2026 10:06:56 +0800
Message-ID: <20260903020656.3793626-1-wanglu.priv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813045241.3039862-1-wanglu.priv@gmail.com>
References: <20260813045241.3039862-1-wanglu.priv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CAS introduced the migrate_llc_task migration type to direct tasks
toward their preferred LLC, but its semantics can be lost when passive
load balance falls back to active load balance. This may allow ALB to
select a candidate whose preferred LLC does not match the destination,
moving it away from its preferred LLC.

Example scenario:

src_rq has two runnable tasks, p1 and p2. p1 prefers dst_rq (dst_llc),
while p2 prefers src_rq (src_llc). In this case, migrate_llc_task is
set because src_rq has at least one task, p1, that wants to migrate to
dst_rq. In ALB, can_migrate_task() finds p2 and returns true for it,
thus moving p2 out of its preferred LLC.

Solution:

The CPU stopper in ALB constructs a fresh lb_env that does not inherit
migration_type from the passive load-balance pass. Two approaches are
possible:

(a) Add a new member to struct rq so ALB can inherit migrate_llc_task
    from the passive LB that triggered it.

(b) Define a new flag LBF_ACTIVE_LB_LLC and select the stopper callback
    at kick time to preserve the migration semantics across the
    asynchronous boundary.

We choose (b) because it avoids passing migration_type through the
stopper, which would affect the meaning of migration_type for
delayed-dequeue tasks.

Fixes: e4c9a4cb244a ("sched/cache: Add migrate_llc_task migration type for cache-aware balancing")
Suggested-by: "Chen, Yu C" <yu.c.chen@intel.com>
Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Lu Wang <wanglu.priv@gmail.com>
---
Changes in v4:
 - Rebase onto current tip sched/core (ef9293b3b7, 2026-09-03),
   which includes Tim Chen's commit f0d243a96f26 ("sched/fair: Avoid
   creating misfits during cache-aware balancing").
   No functional changes vs v3.
 - Link to V3: https://lore.kernel.org/all/20260813045241.3039862-1-wanglu.priv@gmail.com/

Changes in v3:
 - Updated commit message and helper comment description, no code changes
 - Link to V2: https://lore.kernel.org/all/20260809105343.1189051-1-wanglu.priv@gmail.com/

Changes in v2:
 - Select the stopper callback at kick time to preserve
   migrate_llc_task semantics in active load balance without passing
   migration_type across the stopper, which affects delayed-dequeue tasks.
 - Link to V1: https://lore.kernel.org/all/20260801122252.2476258-1-wanglu.priv@gmail.com/

 kernel/sched/fair.c | 57 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 51 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b8bd308c2d..6323c2157c 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10387,6 +10387,7 @@ enum migration_type {
 #define LBF_SOME_PINNED	0x08
 #define LBF_ACTIVE_LB	0x10
 #define LBF_LLC_PINNED	0x20
+#define LBF_ACTIVE_LB_LLC	0x40
 
 struct lb_env {
 	struct sched_domain	*sd;
@@ -10805,6 +10806,21 @@ alb_break_llc(struct lb_env *env)
 	return false;
 }
 
+/*
+ * Returns true if p's preferred LLC does not match the destination CPU
+ * under migrate_llc_task semantics. Passive LB passes migrate_llc_task
+ * in env->migration_type, while active LB carries LBF_ACTIVE_LB_LLC in
+ * env->flags to avoid overwriting env->migration_type.
+ */
+static inline bool
+migrate_llc_task_wrong_dst(struct task_struct *p, struct lb_env *env)
+{
+	return sched_cache_enabled() &&
+	       (env->migration_type == migrate_llc_task ||
+		env->flags & LBF_ACTIVE_LB_LLC) &&
+	       READ_ONCE(p->preferred_llc) != llc_id(env->dst_cpu);
+}
+
 /*
  * Check if migrating task p from env->src_cpu to
  * env->dst_cpu breaks LLC localiy.
@@ -10833,8 +10849,7 @@ static bool migrate_degrades_llc(struct task_struct *p, struct lb_env *env)
 	 * run on env->dst_cpu, skip the tasks do not prefer
 	 * env->dst_cpu, and find the one that prefers.
 	 */
-	if (env->migration_type == migrate_llc_task &&
-	    READ_ONCE(p->preferred_llc) != llc_id(env->dst_cpu))
+	if (migrate_llc_task_wrong_dst(p, env))
 		return true;
 
 	if (can_migrate_llc_task(env, p) != mig_forbid)
@@ -10856,6 +10871,12 @@ alb_break_llc(struct lb_env *env)
 	return false;
 }
 
+static inline bool
+migrate_llc_task_wrong_dst(struct task_struct *p, struct lb_env *env)
+{
+	return false;
+}
+
 static inline bool
 migrate_degrades_llc(struct task_struct *p, struct lb_env *env)
 {
@@ -10955,7 +10976,7 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 	 * 4) too many balance attempts have failed.
 	 */
 	if (env->flags & LBF_ACTIVE_LB)
-		return 1;
+		return !migrate_llc_task_wrong_dst(p, env);
 
 	degrades = migrate_degrades_locality(p, env);
 	if (!degrades) {
@@ -13340,6 +13361,20 @@ static int need_active_balance(struct lb_env *env)
 }
 
 static int active_load_balance_cpu_stop(void *data);
+static int active_load_balance_llc_cpu_stop(void *data);
+
+/*
+ * migration_type is checked elsewhere to decide migration policy, so
+ * it shouldn't be repurposed just to flag an LLC-directed active
+ * balance across the stopper. Pick the callback here instead.
+ */
+static inline cpu_stop_fn_t alb_stop_fn(struct lb_env *env)
+{
+	if (env->migration_type == migrate_llc_task)
+		return active_load_balance_llc_cpu_stop;
+
+	return active_load_balance_cpu_stop;
+}
 
 static int should_we_balance(struct lb_env *env)
 {
@@ -13685,7 +13720,7 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 	}
 	if (active_balance) {
 		stop_one_cpu_nowait(cpu_of(busiest),
-				    active_load_balance_cpu_stop, busiest,
+				    alb_stop_fn(&env), busiest,
 				    &busiest->active_balance_work);
 	}
 	preempt_enable();
@@ -13790,7 +13825,7 @@ update_next_balance(struct sched_domain *sd, unsigned long *next_balance)
  * least 1 task to be running on each physical CPU where possible, and
  * avoids physical / logical imbalances.
  */
-static int active_load_balance_cpu_stop(void *data)
+static int __active_load_balance_cpu_stop(void *data, unsigned int lb_flags)
 {
 	struct rq *busiest_rq = data;
 	int busiest_cpu = cpu_of(busiest_rq);
@@ -13840,7 +13875,7 @@ static int active_load_balance_cpu_stop(void *data)
 			.src_cpu	= busiest_rq->cpu,
 			.src_rq		= busiest_rq,
 			.idle		= CPU_IDLE,
-			.flags		= LBF_ACTIVE_LB,
+			.flags		= LBF_ACTIVE_LB | lb_flags,
 		};
 
 		schedstat_inc(sd->alb_count);
@@ -13868,6 +13903,16 @@ static int active_load_balance_cpu_stop(void *data)
 	return 0;
 }
 
+static int active_load_balance_cpu_stop(void *data)
+{
+	return __active_load_balance_cpu_stop(data, 0);
+}
+
+static int active_load_balance_llc_cpu_stop(void *data)
+{
+	return __active_load_balance_cpu_stop(data, LBF_ACTIVE_LB_LLC);
+}
+
 /*
  * Scale the max sched_balance_rq interval with the number of CPUs in the system.
  * This trades load-balance latency on larger machines for less cross talk.
-- 
2.43.0

