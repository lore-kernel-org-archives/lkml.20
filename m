Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41E4496D2E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945154; cv=none; b=VKBpu0tHJ3tT2vTnh0QJ0YFGEd3W7vEXkM8ge3RP3+y+1HatuZVT9pVQPcomnhqZ8VwAAC368A32dxoj9Pnb/sn+EnxEPdQt6LJ34P1W+eKIfypVSQEUaW03gSYizx/3AHp6P4QrTVdQEF2acaIS1HkfBgoyxUHBA3Y70bFm+jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945154; c=relaxed/simple;
	bh=hxUO5Igy0W7EyFlDN5fY4TXl+gk8bGci7Vn3ccTQG4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OynbqDNa+7f3F5kV7mAXA1QOplczcXxFX4KAO2TWxAvjtQneW4VI25lV3nyY3L6nTb64rrSL1Op54ZN50hLnvFkK63LD1Ko8Ht9f+a9MxsXQxeUynhtfqNK06xzUd3t0PctsAxXGDY6mdy4/FpVGO6m3Hb1E0KwVHJzstNc/HmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sfRqnRTq; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sfRqnRTq"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hx7mr3VmVzKp6P;
	Fri, 02 Oct 2026 14:45:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790945148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j/26+k03Ys7YtKOFZGg1RR9UPUx8C444z1ZD3oGXPhw=;
	b=sfRqnRTqpaBoOeG60UXIBtcTBl+m3PDE66kHBa+PAI5GHZm9FyuwzRE6Kd6IpJ6mMeWA96
	NKgHH7JMD0mjpPgI4xtkfcX8XMv0ZMZ8O2AZlQ5vndW5GvFho3S5BJoDYxkwdGrLydvxai
	iVYXXfkIzVQhdG4laiqgfVM8q5QgrbkeIBhHOnG466455tzwvzlii7W6WkCIs1ZkBbOpCJ
	aGzJkzQjn95S/1n2ILoaP212N01L1ChERAjbtLUyBR830+RNJBUEnpKgIFpWD0X8odvYY0
	vbhjrv1bCPEH4Kix+0irTY7C8qsHXoYQqRhbDBLmCp4LAJg8MIn+GQZhAxXFCA==
From: Tor Vic <torvic9@mailbox.org>
To: peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org,
	Tor Vic <torvic9@mailbox.org>
Subject: [RFC PATCH 2/2] sched/fair: Remove sched_base_slice scaling altogether
Date: Fri,  2 Oct 2026 14:45:38 +0200
Message-ID: <20261002124538.79658-3-torvic9@mailbox.org>
In-Reply-To: <20261002124538.79658-1-torvic9@mailbox.org>
References: <20261002124538.79658-1-torvic9@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: tdqrattbsuigh8xym8putxgc661o5eu6
X-MBO-RS-ID: b37ec2e3a226b9b9a1d

After having removed the 'none' and 'linear' scalings, remove the
entire tunable scaling mechanism altogether, and just set a fixed
default sched_base_slice of 2 msec.

This can still be changed through debugfs.

Signed-off-by: Tor Vic <torvic9@mailbox.org>
---
 kernel/sched/core.c  |  1 -
 kernel/sched/fair.c  | 53 +++-----------------------------------------
 kernel/sched/sched.h |  3 ---
 3 files changed, 3 insertions(+), 54 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1fe40de6ebe3..2a8a242e20e5 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8942,7 +8942,6 @@ void __init sched_init_smp(void)
 	if (set_cpus_allowed_ptr(current, housekeeping_cpumask(HK_TYPE_DOMAIN)) < 0)
 		BUG();
 	current->flags &= ~PF_NO_SETAFFINITY;
-	sched_init_granularity();
 
 	init_sched_rt_class();
 	init_sched_dl_class();
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 2f9b7d2fe813..3d59af44abdf 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -67,10 +67,10 @@
  * Under EEVDF this is the request size used to compute the virtual
  * deadline; see update_deadline().
  *
- * (default: 0.70 msec * (1 + ilog(ncpus)), units: nanoseconds)
+ * (default: 2 msec)
  */
-unsigned int sysctl_sched_base_slice			= 700000ULL;
-static unsigned int normalized_sysctl_sched_base_slice	= 700000ULL;
+unsigned int sysctl_sched_base_slice			= 2000000ULL;
+static unsigned int normalized_sysctl_sched_base_slice	= 2000000ULL;
 
 __read_mostly unsigned int sysctl_sched_migration_cost	= 500000UL;
 
@@ -173,38 +173,6 @@ static inline void update_load_set(struct load_weight *lw, unsigned long w)
 	lw->inv_weight = 0;
 }
 
-/*
- * Increase the granularity value when there are more CPUs,
- * because with more CPUs the 'effective latency' as visible
- * to users decreases. But the relationship is not linear,
- * so pick a second-best guess by going with the log2 of the
- * number of CPUs.
- *
- * This idea comes from the SD scheduler of Con Kolivas:
- */
-static unsigned int get_update_sysctl_factor(void)
-{
-	unsigned int cpus = min_t(unsigned int, num_online_cpus(), 8);
-	unsigned int factor = 1 + ilog2(cpus);
-
-	return factor;
-}
-
-static void update_sysctl(void)
-{
-	unsigned int factor = get_update_sysctl_factor();
-
-#define SET_SYSCTL(name) \
-	(sysctl_##name = (factor) * normalized_sysctl_##name)
-	SET_SYSCTL(sched_base_slice);
-#undef SET_SYSCTL
-}
-
-void __init sched_init_granularity(void)
-{
-	update_sysctl();
-}
-
 #ifndef CONFIG_64BIT
 #define WMULT_CONST	(~0U)
 #define WMULT_SHIFT	32
@@ -1242,17 +1210,6 @@ struct sched_entity *__pick_last_entity(struct cfs_rq *cfs_rq)
 /**************************************************************
  * Scheduling class statistics methods:
  */
-int sched_update_scaling(void)
-{
-	unsigned int factor = get_update_sysctl_factor();
-
-#define WRT_SYSCTL(name) \
-	(normalized_sysctl_##name = sysctl_##name / (factor))
-	WRT_SYSCTL(sched_base_slice);
-#undef WRT_SYSCTL
-
-	return 0;
-}
 
 static void clear_buddies(struct cfs_rq *cfs_rq, struct sched_entity *se);
 
@@ -15011,15 +14968,11 @@ void sched_balance_trigger(struct rq *rq)
 
 static void rq_online_fair(struct rq *rq)
 {
-	update_sysctl();
-
 	update_runtime_enabled(rq);
 }
 
 static void rq_offline_fair(struct rq *rq)
 {
-	update_sysctl();
-
 	/* Ensure any throttled groups are reachable by pick_next_task */
 	unthrottle_offline_cfs_rqs(rq);
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 7a36b3210757..a323fdeb7125 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2302,8 +2302,6 @@ extern int group_balance_cpu(struct sched_group *sg);
 extern void update_sched_domain_debugfs(void);
 extern void dirty_sched_domain_sysctl(int cpu);
 
-extern int sched_update_scaling(void);
-
 static inline const struct cpumask *task_user_cpus(struct task_struct *p)
 {
 	if (!p->user_cpus_ptr)
@@ -2987,7 +2985,6 @@ extern void schedule_idle(void);
 asmlinkage void schedule_user(void);
 
 extern void sysrq_sched_debug_show(void);
-extern void sched_init_granularity(void);
 extern void update_max_interval(void);
 
 extern void init_sched_dl_class(void);
-- 
2.55.0

