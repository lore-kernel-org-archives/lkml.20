Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052975;
	b=Fy9QIdd01vAxzyns14o3pTygZ+qvUv476M2r1YosdP74CxS+bbV59TiC7kKnYJSGRZCr
	 VI0+x60JBiaw9eacJLhmwx2Cms9LcXn0aDwN2MYSar1Yp9a/pbRCxlYTGyUiFqkmNbvNO
	 oyCsCTilsuprMQDd8N/q/x9HshTcP+abRWE8VrLQDP0RVGGfqwP7d/5HCE6bb+6TW+HSc
	 IX0egFFeU5/vO769js8cibvgB4YcrVYT2D5MYYY9L7BryRuUBt0cqIOvo+B3aPv3mpYxj
	 axB+iWT7Ps40nh2PwZA1lfHkcuDpq0AJaDGGl641gwhhQLIPoTvoVVfeDzQm3ix8xlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052975;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=GwuYvocZGprvYxRxRQEOU/oSFVEbST4uFKp+o2SkJus=;
	b=0IFOM1MB02KpG/I4bOwV3iXxKOU8JKxmisIUsnoVn67f91QDrWoJj4bA8BToURJ8+BFd
	 cLw6wywj4xuh7zb8Vvin2BApOcfUo7TeClTSnnHrNQMylSLw+ob5I7uYAOphW9P113kQX
	 wIEhmpevnDJi/Zj2teoK4gpFbUNyKrppXfjbbEk0W7KSm3iROHpyM21Dlzp/tvh2p4DT8
	 g+OSEBSOEjKFmcpXznxTm1bexopyvje4viL63HMiO1sNWOPzakSwmEXxrPdb0zvkfJV2y
	 09rI515FoL6+/f29vg6unOY8cyJthvUicYEse47MLGlQURZNAG5kd1YLjk6EpSSFVsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=KLDdibUM;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0BF606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F0BF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=KLDdibUM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=GwuYvocZGprvYxRxRQEOU/oSFVEbST4uFKp+o2SkJus=; b=KLDdibUMDSMnV2ItdMt6FNiyCS
	lK8dOezYjpXvJpEljYjUqRhkmRmtwi1To/Nz7zs5QoXR/rAefzLqmLgB5A3TBsoQUKB/7GmT9VVaJ
	5um16f/1j9YEqcqEoYUXmoNZgSGKMo9DDyH/FxqTMmKrvrvRicWtWmba0//9ZRsqm1bEQgJ6RNGtS
	nd0sOOyR3OYLPn9L1gRwpKzObGaDPIo6lcNB9UvEs91Sp9rEX5CyZDmBEFFYqWCO5JygsQH98xZQY
	3KCQlIPQBnA+6Jwyhzs7pTImUFYQ4Hc//edN3CQ1gZ11SQWj1aIsI/Ypo9zYPjHv6fLu5Px9RJtBv
	0yr2dhxg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPf8A-000000008z3-3rmL;
	Sat, 07 Nov 2026 12:02:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 3AF9B3031E1; Sat, 07 Nov 2026 13:02:45 +0100 (CET)
Message-ID: <20261107120207.891592828@infradead.org>
User-Agent: quilt/0.68
Date: Sat, 07 Nov 2026 12:59:23 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: peterz@infradead.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org,
 tj@kernel.org,
 ziqianlu@bytedance.com
Subject: [PATCH v2 10/12] sched/fair: Reflow pick_task_fair() / newidle
References: <20261107115913.261163891@infradead.org>
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

This is all histerical artifacts. Clean up the code to be less convoluted.

Note: this also re-enables balance for core-sched.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/fair.c |   51 +++++++++++++--------------------------------------
 1 file changed, 13 insertions(+), 38 deletions(-)

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6100,7 +6100,7 @@ static inline unsigned long cfs_rq_load_
 	return cfs_rq->avg.load_avg;
 }
 
-static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
+static void sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 	__must_hold(__rq_lockp(this_rq));
 
 static inline unsigned long task_util(struct task_struct *p)
@@ -10287,11 +10287,17 @@ struct task_struct *pick_task_fair(struc
 	struct cfs_rq *cfs_rq = &rq->cfs;
 	struct sched_entity *se;
 	struct task_struct *p;
-	int new_tasks;
 
 again:
-	if (!cfs_rq->h_nr_queued)
-		goto idle;
+	if (unlikely(!cfs_rq->h_nr_queued)) {
+		rq_modified_begin(rq, &fair_sched_class);
+		sched_balance_newidle(rq, rf);
+		if (rq_modified_above(rq, &fair_sched_class))
+			return RETRY_TASK;
+
+		if (!cfs_rq->h_nr_queued)
+			return NULL;
+	}
 
 	/* Might not have done put_prev_entity() */
 	if (cfs_rq->curr && cfs_rq->curr->on_rq)
@@ -10303,17 +10309,6 @@ struct task_struct *pick_task_fair(struc
 
 	p = task_of(se);
 	return p;
-
-idle:
-	if (sched_core_enabled(rq))
-		return NULL;
-
-	new_tasks = sched_balance_newidle(rq, rf);
-	if (new_tasks < 0)
-		return RETRY_TASK;
-	if (new_tasks > 0)
-		goto again;
-	return NULL;
 }
 
 static struct task_struct *
@@ -14869,13 +14864,8 @@ static inline void nohz_newidle_balance(
 /*
  * sched_balance_newidle is called by schedule() if this_cpu is about to become
  * idle. Attempts to pull tasks from other CPUs.
- *
- * Returns:
- *   < 0 - we released the lock and there are !fair tasks present
- *     0 - failed, no new tasks
- *   > 0 - success, new (fair) tasks present
  */
-static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
+static void sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 	__must_hold(__rq_lockp(this_rq))
 {
 	unsigned long next_balance = jiffies + HZ;
@@ -14892,7 +14882,7 @@ static int sched_balance_newidle(struct
 	 * Return 0; the task will be enqueued when switching to idle.
 	 */
 	if (this_rq->ttwu_pending)
-		return 0;
+		return;
 
 	/*
 	 * We must set idle_stamp _before_ calling sched_balance_rq()
@@ -14903,7 +14893,7 @@ static int sched_balance_newidle(struct
 
 	/* Do not pull tasks towards !preferred CPUs */
 	if (!cpu_preferred(this_cpu))
-		return 0;
+		return;
 
 	/*
 	 * This is OK, because current is on_cpu, which avoids it being picked
@@ -14932,7 +14922,6 @@ static int sched_balance_newidle(struct
 	t0 = sched_clock_cpu(this_cpu);
 	__sched_balance_update_blocked_averages(this_rq);
 
-	rq_modified_begin(this_rq, &fair_sched_class);
 	raw_spin_rq_unlock(this_rq);
 
 	for_each_domain(this_cpu, sd) {
@@ -14990,18 +14979,6 @@ static int sched_balance_newidle(struct
 	if (curr_cost > this_rq->max_idle_balance_cost)
 		this_rq->max_idle_balance_cost = curr_cost;
 
-	/*
-	 * While browsing the domains, we released the rq lock, a task could
-	 * have been enqueued in the meantime. Since we're not going idle,
-	 * pretend we pulled a task.
-	 */
-	if (this_rq->cfs.h_nr_queued && !pulled_task)
-		pulled_task = 1;
-
-	/* If a higher prio class was modified, restart the pick */
-	if (rq_modified_above(this_rq, &fair_sched_class))
-		pulled_task = -1;
-
 out:
 	/* Move the next balance forward */
 	if (time_after(this_rq->next_balance, next_balance))
@@ -15013,8 +14990,6 @@ static int sched_balance_newidle(struct
 		nohz_newidle_balance(this_rq);
 
 	rq_repin_lock(this_rq, rf);
-
-	return pulled_task;
 }
 
 /*


