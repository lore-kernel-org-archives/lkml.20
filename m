Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898726;
	b=4fwkTr++cYUFUj7M1mO4iRqf2dRUA7QKwY80yi+/dr6pLr6hLeS+4BB8c4g0tNjmOLgp
	 YNiSuwXGn6s7/B6MZKtUik+aaV/UHws9R4TL6lE3QZQKUgaCzCaL3E2Y3JvF2XPUld0WT
	 YPaUTmT/MITLVm08sxUgdZNCUtu1dlYmrupbnVzOsYQHXYbhb2NY5wSkRjlXb18UGq2bL
	 +45O7lGcEwsjJBH1oTUqzwPPBDXdfRwLHhqQfb8j74hxCOukAoGDP37wCl+CU/6lFsMP3
	 s1x8cBF8PRzxU9kDFdpLR7PCwgQDNmy6PnflzYVs7BLsAVePuxRpiWbsZimMl44ICxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898726;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=XzfpQo4DFsbCw12kqqIGFGd8tmvKzUTd5S7dw/SOGKg=;
	b=4eDFuutuHrEe4NGRCWbY5F1Q5PRRQ8V92hAhiqWBD/MklFTw1i9JjyaCCreSAh6xhr0R
	 jAoMsATq+68gmCf5usDnIE6buWNWJudObJ9kD5uPLopjwadxDMUEAlmK9xeuQAS6VQm2m
	 s3JJDKUo/S3F3ih+y3il/wr9/xcDgP6vEcuCEAMvVzshxQQrS/Hk1pPmwwHd+cPpMdauA
	 3TPDbOksSGym/SJ5uAd5DtwvwACgxhoyhalVNuuV4WMi8R/qknIECUXtIcGXoyhp/zdYn
	 Fvr07hESKYftG2nzq50wOI1d51Exd82qCSIkRr2TkpdynG+rGaKyMnofZCCF2Zt09Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lGDv35pm;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2B8606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B2B8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lGDv35pm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=XzfpQo4DFsbCw12kqqIGFGd8tmvKzUTd5S7dw/SOGKg=; b=lGDv35pm7zUF0m25q8ZSEG/h62
	VscQkvxBm4wXPBHSHjZ0ZLR2vodvv9Up1Fpy7Bs7ACmlQk2+G6Cvd5DvZVaSOLtuEncB7xdeJI9fb
	3/3nv5hdb2q93hes6K1eDGPwMN9IIWyNOeu2TmSofSJMvcghTzwvHRfZh13o+va26RJgq6Uzp6fXP
	vlF4lrp+zhGqvW8Sy8qhVE0+Q7vP9pSzexLldrKientti01yuDrZqeL+IMxLxEZSAKqhKIw0/SuOe
	2vaVdEsX/KULlBgT8m2DlpXBt67ftdzl8ArTK6xzeoX36qtCg+9aKUj9/8OcXurdE2ulR1zBGA5Xe
	uaZhc3jQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP10H-00000009yGu-29cV;
	Thu, 05 Nov 2026 17:11:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 8E7DF30057E; Thu, 05 Nov 2026 18:11:56 +0100 (CET)
Message-ID: <20261105170157.616859418@infradead.org>
User-Agent: quilt/0.68
Date: Thu, 05 Nov 2026 17:55:27 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 joshdon@google.com,
 tj@kernel.org,
 jakub@okonski.org
Subject: [PATCH 2/3] sched/fair: Make cfs_rq::idle the sum of ancestor tg::idle
References: <20261105165525.011876858@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Rather than keeping cfs_rq::idle as a copy of tg::idle, make it the sum of
all ancestor tg::idle. This makes it trivial to tell if the current cgroup
is marked idle somewhere along its ancestral path.

This makes se_id_idle() behave differently. Notably is will now be true
when there is a idle cgroup anywhere in the ancestor path. This
addresses an issue where preemption of cgroup::idle was overlooked when
flattening the runqueue.

Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c  |    2 -
 kernel/sched/debug.c |    1 
 kernel/sched/fair.c  |   73 ++++++++++++++++++++++++++++++++-------------------
 kernel/sched/sched.h |    4 +-
 4 files changed, 50 insertions(+), 30 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8970,7 +8970,7 @@ void __init sched_init(void)
 		rq->nr_running = 0;
 		rq->calc_load_active = 0;
 		rq->calc_load_update = jiffies + LOAD_FREQ;
-		init_cfs_rq(&rq->cfs);
+		init_cfs_rq(&rq->cfs, NULL);
 		init_rt_rq(&rq->rt);
 		init_dl_rq(&rq->dl);
 #ifdef CONFIG_FAIR_GROUP_SCHED
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1090,6 +1090,7 @@ void print_cfs_rq(struct seq_file *m, in
 	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_runnable", cfs_rq->h_nr_runnable);
 	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_queued", cfs_rq->h_nr_queued);
 	SEQ_printf(m, "  .%-30s: %d\n", "h_nr_idle", cfs_rq->h_nr_idle);
+	SEQ_printf(m, "  .%-30s: %d\n", "idle", cfs_rq->idle);
 	SEQ_printf(m, "  .%-30s: %ld\n", "load", cfs_rq->load.weight);
 	SEQ_printf(m, "  .%-30s: %lu\n", "load_avg",
 			cfs_rq->avg.load_avg);
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15594,8 +15594,10 @@ static void set_next_task_fair(struct rq
 		hrtick_start_fair(rq, p);
 }
 
-void init_cfs_rq(struct cfs_rq *cfs_rq)
+void init_cfs_rq(struct cfs_rq *cfs_rq, struct cfs_rq *parent)
 {
+	if (parent)
+		cfs_rq->idle = parent->idle;
 	cfs_rq->tasks_timeline = RB_ROOT_CACHED;
 	cfs_rq->zero_vruntime = (u64)(-(1LL << 20));
 	raw_spin_lock_init(&cfs_rq->removed.lock);
@@ -15646,7 +15648,7 @@ int alloc_fair_sched_group(struct task_g
 			goto err;
 
 		se = tg_se(tg, i);
-		init_cfs_rq(cfs_rq);
+		init_cfs_rq(cfs_rq, tg_cfs_rq(parent, i));
 		init_tg_cfs_entry(tg, cfs_rq, se, i, tg_se(parent, i));
 		init_entity_runnable_average(se);
 	}
@@ -15780,6 +15782,43 @@ int sched_group_set_shares(struct task_g
 	return ret;
 }
 
+struct tg_set_idle_struct {
+	long idle;
+	int cpu;
+};
+
+static int tg_set_idle_up(struct task_group *tg, void *data)
+{
+	struct tg_set_idle_struct *tsi = data;
+	struct cfs_rq *grp_cfs_rq = tg_cfs_rq(tg, tsi->cpu);
+	struct sched_entity *se = tg_se(tg, tsi->cpu);
+	int old_idle = grp_cfs_rq->idle;
+	int task_delta;
+
+	grp_cfs_rq->idle += tsi->idle;
+
+	if (!!old_idle == !!grp_cfs_rq->idle)
+		return 0;
+
+	task_delta = grp_cfs_rq->h_nr_queued - grp_cfs_rq->h_nr_idle;
+	if (!task_delta)
+		return 0;
+
+	task_delta *= tsi->idle;
+	for_each_sched_entity(se) {
+		struct cfs_rq *cfs_rq = cfs_rq_of(se);
+
+		if (!se->on_rq)
+			break;
+
+		cfs_rq->h_nr_idle += task_delta;
+
+		if (cfs_rq_is_idle(cfs_rq))
+			break;
+	}
+	return 0;
+}
+
 int sched_group_set_idle(struct task_group *tg, long idle)
 {
 	int i;
@@ -15798,34 +15837,14 @@ int sched_group_set_idle(struct task_gro
 
 	for_each_possible_cpu(i) {
 		struct rq *rq = cpu_rq(i);
-		struct sched_entity *se = tg_se(tg, i);
-		struct cfs_rq *grp_cfs_rq = tg_cfs_rq(tg, i);
-		bool was_idle = cfs_rq_is_idle(grp_cfs_rq);
-		long idle_task_delta;
 
 		guard(rq_lock_irqsave)(rq);
 
-		grp_cfs_rq->idle = idle;
-		if (WARN_ON_ONCE(was_idle == cfs_rq_is_idle(grp_cfs_rq)))
-			continue;
-
-		idle_task_delta = grp_cfs_rq->h_nr_queued -
-				  grp_cfs_rq->h_nr_idle;
-		if (!cfs_rq_is_idle(grp_cfs_rq))
-			idle_task_delta *= -1;
-
-		for_each_sched_entity(se) {
-			struct cfs_rq *cfs_rq = cfs_rq_of(se);
-
-			if (!se->on_rq)
-				break;
-
-			cfs_rq->h_nr_idle += idle_task_delta;
-
-			/* Already accounted at parent level and above. */
-			if (cfs_rq_is_idle(cfs_rq))
-				break;
-		}
+		struct tg_set_idle_struct tsi = {
+			.idle = idle ? 1 : -1,
+			.cpu = i,
+		};
+		walk_tg_tree_from(tg, tg_nop, tg_set_idle_up, &tsi);
 	}
 
 	/* Idle groups have minimum weight. */
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -751,7 +751,7 @@ struct cfs_rq {
 	struct list_head	leaf_cfs_rq_list;
 	struct task_group	*tg;	/* Group that "owns" this runqueue */
 
-	/* Locally cached copy of our task_group's idle value */
+	/* Sum of all ancestor tg->idle. */
 	int			idle;
 
 # ifdef CONFIG_CFS_BANDWIDTH
@@ -3520,7 +3520,7 @@ print_numa_stats(struct seq_file *m, int
 		 unsigned long tpf, unsigned long gsf, unsigned long gpf);
 #endif /* CONFIG_NUMA_BALANCING */
 
-extern void init_cfs_rq(struct cfs_rq *cfs_rq);
+extern void init_cfs_rq(struct cfs_rq *cfs_rq, struct cfs_rq *parent);
 extern void init_rt_rq(struct rt_rq *rt_rq);
 extern void init_dl_rq(struct dl_rq *dl_rq);
 


