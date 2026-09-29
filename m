Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D0D3B1EF2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672122; cv=none; b=B0XnHSQO7WvJIbS5DE3KQjn3IjV6nf1eqJVJfPjrCtMMjfJ71HzF3lIvHjmROXV59GliFp0lBIm/3Nn8OAjYHCB9v8TEahCKRWyK/qHKTdg21BDiHTUbYxPvzIowwFRbc5aIjgJeE0lGm9PRWyY6zs8EGbPz55CEdCMuEpRPGkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672122; c=relaxed/simple;
	bh=jd2JjDIMpXj6ei00jxyyCnP6kgz4nI2f348u4Ic0Y9E=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=clRM5nY4f0KmF3mP/WOQ8obmXYYzS+7aAh83IQuiJ14bTMezlNrgR6Ocq119ZMAAnfhTEYm5ROfcgTH7wc0CDbDQFrfg17RC9KwGywI6MGM0Pdr05ZgPZiQ9amxQr388coePKeKHJqSIz9cpRDE1vIlc49OxDvGgQYUxY6MWW7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=S0u6K4rP; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="S0u6K4rP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=kJKseSHc5dDi4WZsBXoSw43pKFkZS9DDXPEp/ZEqMEo=; b=S0u6K4rPDtJo7R5uOKT6Egk7TT
	jhgiVBK82rW+mJFMRqXn13LvsqJiU3AllKzvWPkunjrJtif3bmCiDNPZzGx4iWqN20vekLRpB1nBL
	iZxG9joYk0ZSTGEeMJ1+Ytr6dvRgSZCZ6QxyC0Ca6LWkCAmIXzUdf5c/HuDVPCb04wdBbmamt19pB
	5YNacUIACd/BROFl1APOlPK5A1XwJY3yodO+y/AeAX5lTAQ9+mKoX1zGf6s23oRdwXPE3SLqUmm8D
	SFfueH882QJhOugH0lb41CjHX69m4uyg7jJx6aOoTzntm1NDF9vEijcDrr5iVOEMnz6/u5/eJex7J
	AcQr77Lw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTcF-0000000BsLX-3BnR;
	Tue, 29 Sep 2026 08:55:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id BB10D30302A; Tue, 29 Sep 2026 10:55:10 +0200 (CEST)
Message-ID: <20260929085320.337703476@infradead.org>
User-Agent: quilt/0.68
Date: Tue, 29 Sep 2026 10:49:27 +0200
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
 tj@kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] sched/fair: Rework/fix task_h_load()
References: <20260929084923.092062266@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

There are a number of issues with task_h_load():

 - its hierarchy traversal is racy to the point of being broken; where
   originally it was meant to be used under rq->lock, but lacking an assertion
   for that fact, its use spread and violated this. The result is that the
   back-link state is prone to races.

 - it is rate-limited on jiffies, which is HZ, not the underlying PELT decay.

 - since its update is tied to task_h_load() usage, the cfs_rq->h_load numbers are
   not often 'up-to-date', rendering their output in sched/debug near useless.

Rework the whole thing to keep a more up-to-date and less broken cfs_rq->h_load
number.

Move the back-link tracking into for_each_sched_entity(), such that any such
loop sets up a path back. Use this to (optionally) re-compute cfs_rq->h_load on
enqueue, dequeue, set_next and tick, all sites that hold rq->lock.

This ensures that 'active' cgroups have reasonably up-to-date cfs_rq->h_load.
Additionally, have __update_blocked_fair() update cfs_rq->h_load for all
cgroups.

Finally, replace the jiffy rate-limit with one that is tied to the PELT decay.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/fair.c  |  117 +++++++++++++++++++++++++++++++++------------------
 kernel/sched/pelt.h  |    7 +++
 kernel/sched/sched.h |    1 
 3 files changed, 84 insertions(+), 41 deletions(-)

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5755,6 +5755,50 @@ static inline bool skip_blocked_update(s
 	return true;
 }
 
+static inline void __update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
+					  struct sched_entity *se,
+					  struct cfs_rq *p_cfs_rq)
+{
+	unsigned long load = cfs_rq->avg.load_avg;
+
+	if (cfs_rq != &cfs_rq->rq->cfs) {
+		/*
+		 * These last two arguments can be NULL when used outside of
+		 * the for_each_sched_entity() hierarchy iteration. Like in
+		 * __update_blocked_fair() where leaf_cfs_rq_list is iterated
+		 * instead.
+		 */
+		if (!se)
+			se = &container_of(cfs_rq, struct cfs_tg_state, cfs_rq)->se;
+		if (!p_cfs_rq)
+			p_cfs_rq = cfs_rq_of(se);
+
+		load = p_cfs_rq->h_load;
+		load = div64_ul(load * se->avg.load_avg,
+				p_cfs_rq->avg.load_avg + 1);
+	}
+
+	WRITE_ONCE(cfs_rq->h_load, load);
+}
+
+static inline bool update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
+					struct sched_entity *se,
+					struct cfs_rq *p_cfs_rq)
+{
+	/*
+	 * Mask out the segment bits, if the remaining bits match, then there
+	 * hasn't been a decay since the last time.
+	 */
+	if ((cfs_rq->last_h_load_update & ~PELT_SEGMENT_MASK) ==
+	    (cfs_rq->avg.last_update_time & ~PELT_SEGMENT_MASK))
+		return false;
+
+	__update_cfs_rq_h_load(cfs_rq, se, p_cfs_rq);
+
+	cfs_rq->last_h_load_update = cfs_rq->avg.last_update_time;
+	return true;
+}
+
 #else /* !CONFIG_FAIR_GROUP_SCHED: */
 
 static inline void update_tg_load_avg(struct cfs_rq *cfs_rq) {}
@@ -5768,6 +5812,10 @@ static inline int propagate_entity_load_
 
 static inline void add_tg_cfs_propagate(struct cfs_rq *cfs_rq, long runnable_sum) {}
 
+static inline bool update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
+					struct sched_entity *se,
+					struct cfs_rq *p_cfs_rq) { return false; }
+
 #endif /* !CONFIG_FAIR_GROUP_SCHED */
 
 #ifdef CONFIG_NO_HZ_COMMON
@@ -8199,6 +8247,9 @@ static unsigned long enqueue_hierarchy(s
 		flags = ENQUEUE_WAKEUP;
 	}
 
+	for_each_sched_entity_bl(se, cfs_rq)
+		update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
+
 	return weight;
 }
 
@@ -8330,6 +8381,9 @@ static void dequeue_hierarchy(struct tas
 		flags |= DEQUEUE_SLEEP;
 		flags &= ~(DEQUEUE_DELAYED | DEQUEUE_SPECIAL);
 	}
+
+	for_each_sched_entity_bl(se, cfs_rq)
+		update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
 }
 
 /*
@@ -11547,51 +11601,23 @@ static bool __update_blocked_fair(struct
 			*done = false;
 	}
 
-	return decayed;
-}
-
-/*
- * Compute the hierarchical load factor for cfs_rq and all its ascendants.
- * This needs to be done in a top-down fashion because the load of a child
- * group is a fraction of its parents load.
- */
-static void update_cfs_rq_h_load(struct cfs_rq *cfs_rq)
-{
-	struct sched_entity *se = cfs_rq_se(cfs_rq);
-	unsigned long now = jiffies;
-	unsigned long load;
-
-	if (cfs_rq->last_h_load_update == now)
-		return;
-
-	WRITE_ONCE(cfs_rq->h_load_next, NULL);
-	for_each_sched_entity(se, cfs_rq) {
-		WRITE_ONCE(cfs_rq->h_load_next, se);
-		if (cfs_rq->last_h_load_update == now)
-			break;
-	}
-
-	if (!se) {
-		cfs_rq->h_load = cfs_rq_load_avg(cfs_rq);
-		cfs_rq->last_h_load_update = now;
-	}
+	/*
+	 * The above (forward) leaf_cfs_rq_list traversal will have done
+	 * update_cfs_rq_load_avg() in a bottom-up fashion. Now iterate the
+	 * list backwards, such that we're ensured to have visited every
+	 * parent of the current group to update h_load in a top-down fashion.
+	 */
+	list_for_each_entry_reverse(cfs_rq, &rq->leaf_cfs_rq_list, leaf_cfs_rq_list)
+		update_cfs_rq_h_load(cfs_rq, NULL, NULL);
 
-	while ((se = READ_ONCE(cfs_rq->h_load_next)) != NULL) {
-		load = cfs_rq->h_load;
-		load = div64_ul(load * se->avg.load_avg,
-				cfs_rq_load_avg(cfs_rq) + 1);
-		cfs_rq = group_cfs_rq(se);
-		cfs_rq->h_load = load;
-		cfs_rq->last_h_load_update = now;
-	}
+	return decayed;
 }
 
 static unsigned long task_h_load(struct task_struct *p)
 {
 	struct cfs_rq *cfs_rq = task_cfs_rq(p);
 
-	update_cfs_rq_h_load(cfs_rq);
-	return div64_ul(p->se.avg.load_avg * cfs_rq->h_load,
+	return div64_ul(p->se.avg.load_avg * READ_ONCE(cfs_rq->h_load),
 			cfs_rq_load_avg(cfs_rq) + 1);
 }
 #else /* !CONFIG_FAIR_GROUP_SCHED: */
@@ -15331,6 +15357,11 @@ static void task_tick_fair(struct rq *rq
 
 		se = &curr->se;
 		reweight_eevdf(cfs_rq, se, weight, se->on_rq);
+
+		if (!hrtick) {
+			for_each_sched_entity_bl(se, cfs_rq)
+				update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
+		}
 	}
 
 	if (hrtick)
@@ -15545,11 +15576,15 @@ static void set_next_task_fair(struct rq
 		 */
 		list_move(&se->group_node, &rq->cfs_tasks);
 	}
-	if (!first)
-		return;
 
 	WARN_ON_ONCE(se->sched_delayed);
 
+	for_each_sched_entity_bl(se, cfs_rq)
+		update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
+
+	if (!first)
+		return;
+
 	update_misfit_status(p, rq);
 	sched_fair_update_stop_tick(rq, p);
 
@@ -15731,6 +15766,8 @@ static int __sched_group_set_shares(stru
 			update_load_avg(cfs_rq, se, UPDATE_TG);
 			update_cfs_group(se);
 		}
+		for_each_sched_entity_bl(se, cfs_rq)
+			update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
 		rq_unlock_irqrestore(rq, &rf);
 	}
 
--- a/kernel/sched/pelt.h
+++ b/kernel/sched/pelt.h
@@ -5,6 +5,13 @@
 
 #include "sched-pelt.h"
 
+/*
+ * Pelt uses apprixmate 'us' as ns/1024; and then uses time segments of 1024
+ * 'us'. As a result each segment is in fact '1<<20' ns.
+ */
+#define PELT_SEGMENT_NS		(1<<20)
+#define PELT_SEGMENT_MASK	(PELT_SEGMENT_NS-1)
+
 int __update_load_avg_blocked_se(u64 now, struct sched_entity *se);
 int __update_load_avg_se(u64 now, struct cfs_rq *cfs_rq, struct sched_entity *se);
 int __update_load_avg_cfs_rq(u64 now, struct cfs_rq *cfs_rq);
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -736,7 +736,6 @@ struct cfs_rq {
 	 */
 	unsigned long		h_load;
 	u64			last_h_load_update;
-	struct sched_entity	*h_load_next;
 
 	struct rq		*rq;	/* CPU runqueue to which this cfs_rq is attached */
 


