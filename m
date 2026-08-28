Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C763B3E2ABA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787903816; cv=none; b=r+ucCfMCf4njv9ed6/HccQFN3iJhNRn4ihuuFAeftYiM3GctkHH+kZc8HUy/V0Yno71EQhKFhEAnRqc/bUzq//Ahiyx720qBF5563rf+JlsnSjpjgF41y7bYpTpUUHdBvZCmZX6OiZZ0ZivxdzOyHq2zNHJAN+vM2nMu7a9NpYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787903816; c=relaxed/simple;
	bh=SaMMzbjl6vWNTPXE3AZLpzSOl7NrxKo9JJPuMhsHP6A=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=NdR+1cVoKuniChn7BAEeDv2lHCku6AXQ2tcXHLXNGRoWsLbT1CTMR03O3ELAUw546d3oIGUB0LMEHfaRdCOjaSYKboMTAyarrLUB6DlP1oHn6gJiJZiom9V6jKTm/Nzp6Wv6N8FopPnrFxWs1IQ1WTC2qkz8YaZsE9WiNGw31W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MDdq5Epw; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MDdq5Epw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=LLqdVHIkMiv21YiQRIUu7pIEo2mOwrqXr51hi7vMDCQ=; b=MDdq5EpwwhgNWz2LfuBaaXTuwL
	lLAt1ecvyKCwSVZkmTz2FNkfbW/gw+/l6epKwsZrZaGT4V/ec74JqvGy4T8hLPdcbogaTivqKSR0w
	Ge7EnhyjcHU7DkjLuw0jyo9nTQm8P3Cfq1icZ97tx8xgBEOPcDFWWwIIDYO6qdDLolCL11L1TCdjB
	zFDrg7W0fOsUDFPdjynqX5Sh6mMVrhga/6i9ylwDKnwEueGxTAEcCqkYeI56HnlLRSW63LnIT/E5C
	z9CoexL9f6/55vVvDk94Zq2z6RgDM4sWcytAVrN8WziFLOViREnDL3h7IeYwvNrsmt0ven54C6tPH
	/pjbeVCA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wzrS1-000000086R0-3ECb;
	Fri, 28 Aug 2026 07:56:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 42DA83008E2; Fri, 28 Aug 2026 09:56:36 +0200 (CEST)
Message-ID: <20260828075558.438093356@infradead.org>
User-Agent: quilt/0.68
Date: Fri, 28 Aug 2026 09:41:01 +0200
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
Subject: [PATCH 2/4] sched/fair: Fold cfs_rq_of(se) into for_each_sched_entity()
References: <20260828074059.232353141@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Pretty much every for_each_sched_entity() loop does: cfs_rq = cfs_rq_of(se) as
the very first thing. Fold it into the for_each_sched_entity() macro.

This paves the way to have the macro track a backlink transparantly.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/fair.c |   81 +++++++++++++++++++++++-----------------------------
 1 file changed, 37 insertions(+), 44 deletions(-)

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -317,8 +317,8 @@ const struct sched_class fair_sched_clas
 #ifdef CONFIG_FAIR_GROUP_SCHED
 
 /* Walk up scheduling entities hierarchy */
-#define for_each_sched_entity(se) \
-		for (; se; se = se->parent)
+#define for_each_sched_entity(se, cfs_rq)				\
+	for (; (se) && ((cfs_rq) = cfs_rq_of(se)); (se) = (se)->parent)
 
 static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
 {
@@ -452,8 +452,8 @@ static int se_is_idle(struct sched_entit
 
 #else /* !CONFIG_FAIR_GROUP_SCHED: */
 
-#define for_each_sched_entity(se) \
-		for (; se; se = NULL)
+#define for_each_sched_entity(se, cfs_rq) \
+	for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
 
 static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
 {
@@ -2075,9 +2075,10 @@ static void update_curr(struct cfs_rq *c
 static void update_curr_fair(struct rq *rq)
 {
 	struct sched_entity *se = &rq->donor->se;
+	struct cfs_rq *cfs_rq;
 
-	for_each_sched_entity(se)
-		update_curr(cfs_rq_of(se));
+	for_each_sched_entity(se, cfs_rq)
+		update_curr(cfs_rq);
 }
 
 static inline void
@@ -4800,18 +4801,19 @@ static void reweight_task_fair(struct rq
 {
 	struct sched_entity *se = &p->se;
 	unsigned long weight = NICE_0_LOAD;
+	struct cfs_rq *cfs_rq = cfs_rq_of(se);
 
 	if (se->on_rq)
 		update_curr_fair(rq);
 
-	reweight_entity(cfs_rq_of(se), se, lw->weight);
+	reweight_entity(cfs_rq, se, lw->weight);
 	se->load.inv_weight = lw->inv_weight;
 
 	if (!se->on_rq)
 		return;
 
-	for_each_sched_entity(se)
-		weight = __calc_prop_weight(cfs_rq_of(se), se, weight);
+	for_each_sched_entity(se, cfs_rq)
+		weight = __calc_prop_weight(cfs_rq, se, weight);
 
 	reweight_eevdf(&rq->cfs, &p->se, weight, p->se.on_rq);
 }
@@ -6382,6 +6384,8 @@ static __always_inline void return_cfs_r
 
 static void set_delayed(struct sched_entity *se)
 {
+	struct cfs_rq *cfs_rq;
+
 	se->sched_delayed = 1;
 
 	/*
@@ -6392,15 +6396,14 @@ static void set_delayed(struct sched_ent
 	if (!entity_is_task(se))
 		return;
 
-	for_each_sched_entity(se) {
-		struct cfs_rq *cfs_rq = cfs_rq_of(se);
-
+	for_each_sched_entity(se, cfs_rq)
 		cfs_rq->h_nr_runnable--;
-	}
 }
 
 static void clear_delayed(struct sched_entity *se)
 {
+	struct cfs_rq *cfs_rq;
+
 	se->sched_delayed = 0;
 
 	/*
@@ -6412,11 +6415,8 @@ static void clear_delayed(struct sched_e
 	if (!entity_is_task(se))
 		return;
 
-	for_each_sched_entity(se) {
-		struct cfs_rq *cfs_rq = cfs_rq_of(se);
-
+	for_each_sched_entity(se, cfs_rq)
 		cfs_rq->h_nr_runnable++;
-	}
 }
 
 static void
@@ -7078,14 +7078,16 @@ void unthrottle_cfs_rq(struct cfs_rq *cf
 	walk_tg_tree_from(cfs_rq->tg, tg_nop, tg_unthrottle_up, (void *)rq);
 
 	if (!cfs_rq->load.weight) {
+		struct cfs_rq *cfs_rq_se;
+
 		if (!cfs_rq->on_list)
 			return;
 		/*
 		 * Nothing to run but something to decay (on_list)?
 		 * Complete the branch.
 		 */
-		for_each_sched_entity(se) {
-			if (list_add_leaf_cfs_rq(cfs_rq_of(se)))
+		for_each_sched_entity(se, cfs_rq_se) {
+			if (list_add_leaf_cfs_rq(cfs_rq_se))
 				break;
 		}
 	}
@@ -7931,13 +7933,12 @@ static unsigned long enqueue_hierarchy(s
 	struct sched_entity *se = &p->se;
 	int h_nr_idle = task_has_idle_policy(p);
 	int h_nr_runnable = 1;
+	struct cfs_rq *cfs_rq;
 
 	if (task_new && se->sched_delayed)
 		h_nr_runnable = 0;
 
-	for_each_sched_entity(se) {
-		struct cfs_rq *cfs_rq = cfs_rq_of(se);
-
+	for_each_sched_entity(se, cfs_rq) {
 		update_curr(cfs_rq);
 
 		if (!se->on_rq) {
@@ -8066,16 +8067,15 @@ static void dequeue_hierarchy(struct tas
 	bool task_sleep = flags & DEQUEUE_SLEEP;
 	bool task_delayed = flags & DEQUEUE_DELAYED;
 	bool task_throttled = flags & DEQUEUE_THROTTLE;
-	int h_nr_runnable = 0;
 	int h_nr_idle = task_has_idle_policy(p);
+	int h_nr_runnable = 0;
+	struct cfs_rq *cfs_rq;
 	bool dequeue = true;
 
 	if (task_sleep || task_delayed || !se->sched_delayed)
 		h_nr_runnable = 1;
 
-	for_each_sched_entity(se) {
-		struct cfs_rq *cfs_rq = cfs_rq_of(se);
-
+	for_each_sched_entity(se, cfs_rq) {
 		update_curr(cfs_rq);
 
 		if (dequeue) {
@@ -11301,8 +11301,7 @@ static void update_cfs_rq_h_load(struct
 		return;
 
 	WRITE_ONCE(cfs_rq->h_load_next, NULL);
-	for_each_sched_entity(se) {
-		cfs_rq = cfs_rq_of(se);
+	for_each_sched_entity(se, cfs_rq) {
 		WRITE_ONCE(cfs_rq->h_load_next, se);
 		if (cfs_rq->last_h_load_update == now)
 			break;
@@ -14948,9 +14947,9 @@ static inline void task_tick_core(struct
 static void se_fi_update(const struct sched_entity *se, unsigned int fi_seq,
 			 bool forceidle)
 {
-	for_each_sched_entity(se) {
-		struct cfs_rq *cfs_rq = cfs_rq_of(se);
+	struct cfs_rq *cfs_rq;
 
+	for_each_sched_entity(se, cfs_rq) {
 		if (forceidle) {
 			if (cfs_rq->forceidle_seq == fi_seq)
 				break;
@@ -15028,10 +15027,8 @@ static void task_tick_fair(struct rq *rq
 		unsigned long weight = NICE_0_LOAD;
 		struct cfs_rq *cfs_rq;
 
-		for_each_sched_entity(se) {
-			cfs_rq = cfs_rq_of(se);
+		for_each_sched_entity(se, cfs_rq) {
 			entity_tick(cfs_rq, se, hrtick);
-
 			weight = __calc_prop_weight(cfs_rq, se, weight);
 		}
 
@@ -15113,9 +15110,7 @@ static void propagate_entity_cfs_rq(stru
 	/* Start to propagate at parent */
 	se = se->parent;
 
-	for_each_sched_entity(se) {
-		cfs_rq = cfs_rq_of(se);
-
+	for_each_sched_entity(se, cfs_rq) {
 		update_load_avg(cfs_rq, se, UPDATE_TG);
 
 		if (!cfs_rq_pelt_clock_throttled(cfs_rq))
@@ -15218,9 +15213,7 @@ static void set_next_task_fair(struct rq
 	if (on_rq)
 		__dequeue_entity(cfs_rq, se);
 
-	for_each_sched_entity(se) {
-		cfs_rq = cfs_rq_of(se);
-
+	for_each_sched_entity(se, cfs_rq) {
 		if (!IS_ENABLED(CONFIG_FAIR_GROUP_SCHED) ||
 		    !first || !cfs_rq->h_curr)
 			set_next_entity(cfs_rq, se);
@@ -15420,13 +15413,14 @@ static int __sched_group_set_shares(stru
 	for_each_possible_cpu(i) {
 		struct rq *rq = cpu_rq(i);
 		struct sched_entity *se = tg_se(tg, i);
+		struct cfs_rq *cfs_rq;
 		struct rq_flags rf;
 
 		/* Propagate contribution to hierarchy */
 		rq_lock_irqsave(rq, &rf);
 		update_rq_clock(rq);
-		for_each_sched_entity(se) {
-			update_load_avg(cfs_rq_of(se), se, UPDATE_TG);
+		for_each_sched_entity(se, cfs_rq) {
+			update_load_avg(cfs_rq, se, UPDATE_TG);
 			update_cfs_group(se);
 		}
 		rq_unlock_irqrestore(rq, &rf);
@@ -15473,6 +15467,7 @@ int sched_group_set_idle(struct task_gro
 		struct sched_entity *se = tg_se(tg, i);
 		struct cfs_rq *grp_cfs_rq = tg_cfs_rq(tg, i);
 		bool was_idle = cfs_rq_is_idle(grp_cfs_rq);
+		struct cfs_rq *cfs_rq;
 		long idle_task_delta;
 		struct rq_flags rf;
 
@@ -15487,9 +15482,7 @@ int sched_group_set_idle(struct task_gro
 		if (!cfs_rq_is_idle(grp_cfs_rq))
 			idle_task_delta *= -1;
 
-		for_each_sched_entity(se) {
-			struct cfs_rq *cfs_rq = cfs_rq_of(se);
-
+		for_each_sched_entity(se, cfs_rq) {
 			if (!se->on_rq)
 				break;
 


