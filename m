Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482B740B0E0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913698; cv=none; b=Ay4Z3iNwKrsuE4bWia/BFD+8u5R/xhJDIobqmRlw0pGdW9/k86InF38PNHFw7k6l+YhD6Rjj28YxstoY/QmRETR+fhM2I0XeWm051uKyezkfQQLXuKSJ2CxjafnZpTku10VHhH+WP+lU6OrTPZSnkN2JBGYE8LJgqXJ2o/5CfAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913698; c=relaxed/simple;
	bh=G789OFSfy/zeFOuHjvxGhSXQbcu+r91cSrKTd2413RU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=dulb/QPdwe5tBydToEpaOBFW0UlieCgUH96/G/gk5ZUzVsbGHVtUzqy6QEgcb9W6NsdCGHIqfG+Qs6qmOTmp43IsCLpjrZamo+PHVkkqypk3mEjqLmHcgX/Kl/V3X6pHFB6Bj/GYYk24INitQZR4lud77xEMOR8VHAWQKrMY8Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pyfNR8EJ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pyfNR8EJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=yJF0pF69jvkgkwzXDva8zPof6zLxO8fmfRsAa0Wb640=; b=pyfNR8EJHoXm+j81EThV0X+Ia6
	zNCPX3FHMM3PHafl5mQbGJguSzpfKhyuny7TeImyx5BBOLcOpS8dM/fvTJnhjrqmr4PXfViGXRk/w
	l5WLgUz1msN9dj5kcyUd4mcXmVgVUIcastvo3na2sqoqarIOnqEz9eSA4AGz2gKsawCCq0AEHcEr+
	wfUXlY3ruNz3R2VrhfbKjSn1Y8F+UWSJPG+gTceSDK/6JtHqgB63I8Ai+zpuaZ2Hl9VD2PFoOEq97
	zIXHzGLHWr4FHu7xnSP9Ro4FFcL8VqZjjqGwLac4HdLEgHxzO7JWMhy1c1sb6hfu9y3rQjHtP3aMs
	0UgzV9gg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzu1S-0000000EWAg-43j3;
	Fri, 28 Aug 2026 10:41:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id D6ED8303046; Fri, 28 Aug 2026 12:41:21 +0200 (CEST)
Message-ID: <20260828104018.483560652@infradead.org>
User-Agent: quilt/0.68
Date: Fri, 28 Aug 2026 12:17:01 +0200
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
 tj@kernel.org
Subject: [PATCH 2/7] sched/core: Simplify/fix time updates
References: <20260828101659.812011872@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Directly test RQCF_UPDATED instead of using convoluted logic to try and
divinate the same.

Notably, the multi-pick loop's pick_task() can, when it ends up balancing, lock
and unlock the calling CPUs RQ and 'lose' the RQCF_UPDATED tag, which then
trips set_next_task().

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c |   41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6208,11 +6208,16 @@ extern void task_vruntime_update(struct
 
 static void queue_core_balance(struct rq *rq);
 
+static void opt_update_rq_clock(struct rq *rq)
+{
+	if (!(rq->clock_update_flags & RQCF_UPDATED))
+		update_rq_clock(rq);
+}
+
 static struct task_struct *
 pick_next_task(struct rq *rq, struct rq_flags *rf)
 	__must_hold(__rq_lockp(rq))
 {
-	bool core_clock_updated = (rq == rq->core);
 	struct task_struct *next, *p, *max;
 	const struct cpumask *smt_mask;
 	int i, cpu, seq, occ = 0;
@@ -6269,10 +6274,7 @@ pick_next_task(struct rq *rq, struct rq_
 	/* reset state */
 	rq->core->core_cookie = 0UL;
 	if (rq->core->core_forceidle_count) {
-		if (!core_clock_updated) {
-			update_rq_clock(rq->core);
-			core_clock_updated = true;
-		}
+		opt_update_rq_clock(rq->core);
 		sched_core_account_forceidle(rq);
 		/* reset after accounting force idle */
 		rq->core->core_forceidle_start = 0;
@@ -6299,14 +6301,11 @@ pick_next_task(struct rq *rq, struct rq_
 	 * and there are no cookied tasks running on siblings.
 	 */
 	if (!need_sync) {
+		opt_update_rq_clock(rq);
+
 		next = pick_task(rq, rf);
-		if (unlikely(next == RETRY_TASK)) {
-			/* rq lock may have been dropped, clocks invalidated */
-			core_clock_updated = false;
-			if (!(rq->clock_update_flags & RQCF_UPDATED))
-				update_rq_clock(rq);
+		if (unlikely(next == RETRY_TASK))
 			goto restart;
-		}
 
 		if (!next->core_cookie) {
 			rq->core_pick = NULL;
@@ -6329,6 +6328,7 @@ pick_next_task(struct rq *rq, struct rq_
 	 */
 	max = NULL;
 	for_each_cpu_wrap(i, smt_mask, cpu) {
+		struct rq_flags rf_i = *rf;
 		rq_i = cpu_rq(i);
 
 		/*
@@ -6336,18 +6336,12 @@ pick_next_task(struct rq *rq, struct rq_
 		 * pick_next_task(). If the current cpu is not the core,
 		 * the core may also have been updated above.
 		 */
-		if (i != cpu && (rq_i != rq->core || !core_clock_updated))
-			update_rq_clock(rq_i);
+		opt_update_rq_clock(rq_i);
 
-		p = pick_task(rq_i, rf);
+		p = pick_task(rq_i, &rf_i);
 		if (unlikely(seq != rq->core->core_task_seq ||
-			     WARN_ON_ONCE(p == RETRY_TASK))) {
-			/* rq lock may have been dropped, clocks invalidated */
-			core_clock_updated = false;
-			if (!(rq->clock_update_flags & RQCF_UPDATED))
-				update_rq_clock(rq);
+			     WARN_ON_ONCE(p == RETRY_TASK)))
 			goto restart;
-		}
 
 		rq_i->core_pick = p;
 		rq_i->core_dl_server = rq_i->dl_server;
@@ -6356,6 +6350,13 @@ pick_next_task(struct rq *rq, struct rq_
 			max = p;
 	}
 
+	/*
+	 * The above loop does @cpu first, if any sibling (which comes later)
+	 * does a LOCK+UNLOCK of @rq in order to (try) steal a task, our
+	 * RQCF_UPDATED got lost.
+	 */
+	rq->clock_update_flags |= RQCF_UPDATED;
+
 	cookie = rq->core->core_cookie = max->core_cookie;
 
 	/*


