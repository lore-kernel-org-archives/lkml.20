Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794051409;
	b=mACPZCsr5bz1M4h2wzaE6hbLSJ2qJj+Im3P2zJxV7+CFX4SsfESSlxG3TQMJX0jpaXDt
	 ld8ZI5E8UJl3FiLEnSLUiH/tXdeg3/f6Om4KsER5cNcJ2mDeo570on6lr/I37W/TyUhmh
	 2g0avt0Tn+JuKfrdVwyOMuvI7ZKH8F7oK+ksexXR0ZZqb3+WRzddneySclZE4Tw+zZ2z5
	 FqJyXJTVB4puZ4oc2nwj1EVjR+fRgVlyvqxp5w/udDKSDy6ujBP++qKoWkSKr1FVu8uP2
	 OJuIyrC9+Qaoxb811alSTgEMaHGMVArxcAy1dgeYFGYUWudnKff5PJbDtkmAxqje9zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794051409;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=qR3Wm6eekTc+NqUi4oVe+7Xq25uRM/fM/h7o2eTGmI0=;
	b=5C4+ZD7i00fXOqiiP5vlpm4UlVMCcC9PjuJkBIpHfNXJXhhWw6bKjP6iVGxPRCVk1MwO
	 PXZA5nsgMwNC6LHI0IZ/elpYwEKY82A92gEalo8SP/ayyMHDYyHqJ2zLXMEqRiTlNDgAL
	 CXmoA9zuf47rpM1yQmE6Yd+HUEWYEVLdm3AN7/IFda+HEgMKylCh8CNjeTp2IZVLtNp19
	 5WPej2fmz8dwRL0kp0rFAIKELfhTr9hR4NcVaCor67dWE3e1MX9uZggAfbmWP2eZqUAzI
	 L2GMLyQX9dt8ZmC/F3lxwRGd/4OoNMTs4Fg+E3TD98j9Cte0Aj8haPB2D7JEgTDR6rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=sonkYySm;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB075606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB075606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=sonkYySm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qR3Wm6eekTc+NqUi4oVe+7Xq25uRM/fM/h7o2eTGmI0=; b=sonkYySmvVUJQBlRJPxf2BjpNT
	X6yXG7/pN9PBDd9CC3Efip/WK0KR+a3zTHb9pMA3y0DfUGMVgLU6BzPQdKPy/KsZ2SlgOmaarY1Uc
	S4nHEnjhMwrPxWFsTfuIJQpnY1TXXgzMY8JlWQ5pgu9hTB+P0TASd9jn3o2ibvPsr4Wl2T4Ii0ChT
	DHywGMtGCvpcF05bumVOxA8DOwaqYkHJSwqYlg6pldvobaxeEnhOXAFyTU9xQMoT69nYeOKCoJsMp
	DjP76pJqkjMZrqA/kldkxlZa8gOMKPA8vFU6HEPvA8uaBHJbQCagPqGfbmry57Jto3kzTF0IYB/an
	eTWXxXcg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPeiu-0000000HSFS-3SV4;
	Sat, 07 Nov 2026 11:36:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D63AA300339; Sat, 07 Nov 2026 12:36:39 +0100 (CET)
Date: Sat, 7 Nov 2026 12:36:39 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com, joshdon@google.com,
	tj@kernel.org, jakub@okonski.org
Subject: [PATCH v2 2/3] sched/fair: Make cfs_rq::idle the sum of ancestor
 tg::idle
Message-ID: <20261107113639.GK2668200@noisy.programming.kicks-ass.net>
References: <20261105165525.011876858@infradead.org>
 <20261105170157.616859418@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105170157.616859418@infradead.org>


Rather than keeping cfs_rq::idle as a copy of tg::idle, make it the sum of
all ancestor tg::idle. This makes it trivial to tell if the current cgroup
is marked idle somewhere along its ancestral path.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/debug.c |    1 
 kernel/sched/fair.c  |   88 +++++++++++++++++++++++++++++++--------------------
 kernel/sched/sched.h |    2 -
 3 files changed, 56 insertions(+), 35 deletions(-)

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
@@ -445,8 +445,10 @@ static int cfs_rq_is_idle(struct cfs_rq
 
 static int se_is_idle(struct sched_entity *se)
 {
-	if (entity_is_task(se))
-		return task_has_idle_policy(task_of(se));
+	if (entity_is_task(se)) {
+		return task_has_idle_policy(task_of(se)) ||
+			cfs_rq_is_idle(cfs_rq_of(se));
+	}
 	return cfs_rq_is_idle(group_cfs_rq(se));
 }
 
@@ -15659,19 +15661,20 @@ int alloc_fair_sched_group(struct task_g
 
 void online_fair_sched_group(struct task_group *tg)
 {
-	struct sched_entity *se;
-	struct rq_flags rf;
-	struct rq *rq;
 	int i;
 
 	for_each_possible_cpu(i) {
-		rq = cpu_rq(i);
-		se = tg_se(tg, i);
-		rq_lock_irq(rq, &rf);
+		struct cfs_rq *cfs_rq = tg_cfs_rq(tg, i);
+		struct sched_entity *se = tg_se(tg, i);
+		struct rq *rq = cpu_rq(i);
+
+		guard(rq_lock_irq)(rq);
+
 		update_rq_clock(rq);
 		attach_entity_cfs_rq(se);
 		sync_throttle(tg, i);
-		rq_unlock_irq(rq, &rf);
+
+		cfs_rq->idle = tg_cfs_rq(tg->parent, i)->idle;
 	}
 }
 
@@ -15780,6 +15783,43 @@ int sched_group_set_shares(struct task_g
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
@@ -15798,34 +15838,14 @@ int sched_group_set_idle(struct task_gro
 
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
