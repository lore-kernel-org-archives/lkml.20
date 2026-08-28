Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77523E2ACA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787903818; cv=none; b=WoSldvBT1c3bnBT74hud54bkX8ZLFtUy5cm30sfll/XB2ARjVn6q7+bcluRVTW2wZnrxLlnJIXqsCMDHU9hBySrEIcdD6YYqggXRzWmWBTzd3DgX0iji7pITZdcr4QtLx8+tTyF971HU6fBq2hmMRehkWrIwZMtXiOiAjPx+3hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787903818; c=relaxed/simple;
	bh=zRlXqD+YzJf1lXrv65yKym55u+K3iRGHQUtIfc9XQ/4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=uHiVzG0f+AwQZYnpOMxpYrjMSzY1mRku7tjbTmiAp1eqSe/YDpekskUVvd4fxgzMVfcHYfAgvOKWkHrv4Us/UFUXNSHVtllEIwq5qt7pysDP3oSZrdVT7rEAcwh+BP/v7O0s038u9183luJcaqN5Z+tO3LXlQNdtHkODddklJYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=g7xOlsvL; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="g7xOlsvL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=qieUllO7DZXMqKGNoxOhT3YyL0Qj+wnboIe3/JX7lq8=; b=g7xOlsvL/Xx3OLIsGQYntVlzDy
	O4hDqWqkFnmRudz67ATpBJQivkAvOOeGA/nGyfRxjEd8LumxlqE6mn9mA1oNipm6JjKIrCEXTvihH
	wmsHNaPJpTrlYmthJQrhrThgpujLSoPU4Vdw9TSV5EFSd0/sHHkU3c4QtoO3/zcmrxDk7VxcTel89
	6syjes85X6bBerXh8FEBX4HLfFOa9xUb6juKBXcCPeG2nJYcZxzpIKpxfW2G8UMY97MA9AIABnSWH
	p560psWEr0dy4pj9ff9T7in8EslRo96ML5wei/2hF4QD17IF5dzi+LTI4yup1GGEsRGauFNDql5Wo
	QuP/QjXw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wzrS1-000000086R1-3AyS;
	Fri, 28 Aug 2026 07:56:38 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 4CA40303027; Fri, 28 Aug 2026 09:56:36 +0200 (CEST)
Message-ID: <20260828075558.660152190@infradead.org>
User-Agent: quilt/0.68
Date: Fri, 28 Aug 2026 09:41:03 +0200
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
Subject: [PATCH 4/4] sched/fair: Rework/fix task_h_load()
References: <20260828074059.232353141@infradead.org>
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
 kernel/sched/fair.c  |  108 ++++++++++++++++++++++++++++++++-------------------
 kernel/sched/pelt.h  |    7 +++
 kernel/sched/sched.h |    1 
 3 files changed, 76 insertions(+), 40 deletions(-)

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5541,6 +5541,44 @@ static inline bool skip_blocked_update(s
 	return true;
 }
 
+static inline void __update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
+					  struct sched_entity *se,
+					  struct cfs_rq *p_cfs_rq)
+{
+	unsigned long load = cfs_rq->avg.load_avg;
+
+	if (cfs_rq != &cfs_rq->rq->cfs) {
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
@@ -5554,6 +5592,10 @@ static inline int propagate_entity_load_
 
 static inline void add_tg_cfs_propagate(struct cfs_rq *cfs_rq, long runnable_sum) {}
 
+static inline bool update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
+					struct sched_entity *se,
+					struct cfs_rq *p_cfs_rq) { return false; }
+
 #endif /* !CONFIG_FAIR_GROUP_SCHED */
 
 #ifdef CONFIG_NO_HZ_COMMON
@@ -7966,6 +8008,9 @@ static unsigned long enqueue_hierarchy(s
 		flags = ENQUEUE_WAKEUP;
 	}
 
+	for_each_sched_entity_bl(se, cfs_rq)
+		update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
+
 	return weight;
 }
 
@@ -8107,6 +8152,9 @@ static void dequeue_hierarchy(struct tas
 		flags |= DEQUEUE_SLEEP;
 		flags &= ~(DEQUEUE_DELAYED | DEQUEUE_SPECIAL);
 	}
+
+	for_each_sched_entity_bl(se, cfs_rq)
+		update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
 }
 
 /*
@@ -11288,51 +11336,23 @@ static bool __update_blocked_fair(struct
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
@@ -14949,7 +14969,7 @@ static inline void task_tick_core(struct
 /*
  * se_fi_update - Update the cfs_rq->zero_vruntime_fi in a CFS hierarchy if needed.
  */
-static void se_fi_update(const struct sched_entity *se, unsigned int fi_seq,
+static void se_fi_update(struct sched_entity *se, unsigned int fi_seq,
 			 bool forceidle)
 {
 	struct cfs_rq *cfs_rq;
@@ -15039,6 +15059,11 @@ static void task_tick_fair(struct rq *rq
 
 		se = &curr->se;
 		reweight_eevdf(cfs_rq, se, weight, se->on_rq);
+
+		if (!hrtick) {
+			for_each_sched_entity_bl(se, cfs_rq)
+				update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
+		}
 	}
 
 	if (hrtick)
@@ -15230,6 +15255,9 @@ static void set_next_task_fair(struct rq
 			weight = __calc_prop_weight(cfs_rq, se, weight);
 	}
 
+	for_each_sched_entity_bl(se, cfs_rq)
+		update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
+
 	if (throttled)
 		task_throttle_setup_work(p);
 
@@ -15428,6 +15456,8 @@ static int __sched_group_set_shares(stru
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
 


