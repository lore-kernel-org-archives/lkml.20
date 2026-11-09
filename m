Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216536;
	b=4K00EyJZMRxRSL1JTXfK4EJ92BtCZ7bdhcin789xtImiLjgYvyLZPXMcfJTpkQt4AZyQ
	 G5EkcpOcL3y297KuiF8+ll9YbPXO54sHzlo5/03pBRv6MCtpWUbCHZ4EjtKo/VeWaYoRb
	 f0OSQ+QRRm7P1Cl9guwtYhTdAZuoxhq0qzLs+z9otErazQbg7xW003lDCzMj67LK44yX5
	 FwtO4goZ2m/wRdN7docCazMoYThkDK0FNbFJYDjFsIus/GIn5iNqDGFoZf6Jny8La6k8X
	 ixGoj20RqriJIYqFpsOloUzVdWr52oktdxTBQAx109o5tpPrLvo6mHQQaVXTLHhDm2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216536;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=axJt9zIbnu3XxnB5lhK2/p8aVQlixWhUErXnJo+02Rc=;
	b=4oEWPxv4ALgVF3b/afy8JwmYCWzGN//+xgFi42yB5RRhU+aKWE+8/5qRSy+Pd4WHo0cn
	 +pJRxhWMKYRDh/Lzxvel+GKMUGI6KfXrcpPFpiQxCI8jPQD+euybHZdU77dSKFmJ5ZNz9
	 OK7wtohWsQJ/mBy421deS0W1MiLiDk30kZAu+W5tKfxEkjkJ+MBTZfN8Qi3TSlq86TxsY
	 qHaMqk/xZ+Mm8ZxcRMwvizQwJGoC5UfTF4c5WtuoNKOoMl0qsG1yi+tsxjK8gOUK8UR1A
	 1ek4PhS0tju8IR0YDQAkjKzD4jxDe5Bwf/rGLj+4vBEenWZT+4sVjFp+93wk7aLxFTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="3/hOUXqh";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xPZoSbBJ;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9756E606D812;
	Mon,  9 Nov 2026 09:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9756E606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3/hOUXqh;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xPZoSbBJ
Date: Mon, 09 Nov 2026 09:28:52 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216534;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=axJt9zIbnu3XxnB5lhK2/p8aVQlixWhUErXnJo+02Rc=;
	b=3/hOUXqhpBzzvCdoE88/UxecDiCXTm7TquZSiaqxXPL8r9KKGEXAxSZiHD151XwNunBjjO
	RvVGNhgNj9vCFQK+pdjkFkr/W1qK9i9+Nz7fDTzyxjMFFztTelYGoC56Qoh0pcOEX8ykcU
	xwy4anS9e3/ILGI73x9Xja1Ieogz88WQv4/QmDUs8K6udjWbBwJu30jwtJX5rhAGb1Ufum
	qzezhldGBMWP2g+vLYR4cqPEvgYdX/YltPTxo+3OAXDTso4fGq8VV8Od2TFEhFxHBLbCiv
	HA4ekRfttl5+Q0rocuz+vjQ83sLSYRm3B2Yod3a99YU922bw0EvXPf5SvfsPcQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216534;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=axJt9zIbnu3XxnB5lhK2/p8aVQlixWhUErXnJo+02Rc=;
	b=xPZoSbBJGW0bUr/PBJv/+/QH7zNOoDABzbvZMjYTeTWWMimTifkf8bM21KLz0ynhF2yfB6
	mUaUCJ940QRqGuDQ==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/fair: Fold cfs_rq_of(se) into for_each_sched_entity()
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260929085320.091427386@infradead.org>
References: <20260929085320.091427386@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421653226.2093942.15000341505256690596.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     83e658059f19333130f6ea58d433a58f6f9b8d78
Gitweb:        https://git.kernel.org/tip/83e658059f19333130f6ea58d433a58f6f9=
b8d78
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Tue, 29 Sep 2026 10:49:25 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:17:46 +01:00

sched/fair: Fold cfs_rq_of(se) into for_each_sched_entity()

Pretty much every for_each_sched_entity() loop does: cfs_rq =3D cfs_rq_of(se)=
 as
the very first thing. Fold it into the for_each_sched_entity() macro.

This paves the way to have the macro track a backlink transparantly.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Link: https://patch.msgid.link/20260929085320.091427386@infradead.org
---
 kernel/sched/fair.c | 81 ++++++++++++++++++++------------------------
 1 file changed, 37 insertions(+), 44 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index a9da1bc..d5f937d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -317,8 +317,8 @@ const struct sched_class fair_sched_class;
 #ifdef CONFIG_FAIR_GROUP_SCHED
=20
 /* Walk up scheduling entities hierarchy */
-#define for_each_sched_entity(se) \
-		for (; se; se =3D se->parent)
+#define for_each_sched_entity(se, cfs_rq)				\
+	for (; (se) && ((cfs_rq) =3D cfs_rq_of(se)); (se) =3D (se)->parent)
=20
 static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
 {
@@ -452,8 +452,8 @@ static int se_is_idle(struct sched_entity *se)
=20
 #else /* !CONFIG_FAIR_GROUP_SCHED: */
=20
-#define for_each_sched_entity(se) \
-		for (; se; se =3D NULL)
+#define for_each_sched_entity(se, cfs_rq) \
+	for (; (se) && ((cfs_rq) =3D cfs_rq_of(se)); (se) =3D NULL)
=20
 static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
 {
@@ -2223,9 +2223,10 @@ static void update_curr(struct cfs_rq *cfs_rq)
 static void update_curr_fair(struct rq *rq)
 {
 	struct sched_entity *se =3D &rq->donor->se;
+	struct cfs_rq *cfs_rq;
=20
-	for_each_sched_entity(se)
-		update_curr(cfs_rq_of(se));
+	for_each_sched_entity(se, cfs_rq)
+		update_curr(cfs_rq);
 }
=20
 static inline void
@@ -4957,18 +4958,19 @@ static void reweight_task_fair(struct rq *rq, struct =
task_struct *p,
 {
 	struct sched_entity *se =3D &p->se;
 	unsigned long weight =3D NICE_0_LOAD;
+	struct cfs_rq *cfs_rq =3D cfs_rq_of(se);
=20
 	if (se->on_rq)
 		update_curr_fair(rq);
=20
-	reweight_entity(cfs_rq_of(se), se, lw->weight);
+	reweight_entity(cfs_rq, se, lw->weight);
 	se->load.inv_weight =3D lw->inv_weight;
=20
 	if (!se->on_rq)
 		return;
=20
-	for_each_sched_entity(se)
-		weight =3D __calc_prop_weight(cfs_rq_of(se), se, weight);
+	for_each_sched_entity(se, cfs_rq)
+		weight =3D __calc_prop_weight(cfs_rq, se, weight);
=20
 	reweight_eevdf(&rq->cfs, &p->se, weight, p->se.on_rq);
 }
@@ -6547,6 +6549,8 @@ static __always_inline void return_cfs_rq_runtime(struc=
t cfs_rq *cfs_rq);
=20
 static void set_delayed(struct sched_entity *se)
 {
+	struct cfs_rq *cfs_rq;
+
 	/*
 	 * Delayed se of cfs_rq have no tasks queued on them.
 	 * Do not adjust h_nr_runnable since __dequeue_task()
@@ -6569,15 +6573,14 @@ static void set_delayed(struct sched_entity *se)
 	pref_llc_running_dec(rq_of(cfs_rq_of(se)), task_of(se));
 	se->sched_delayed =3D 1;
=20
-	for_each_sched_entity(se) {
-		struct cfs_rq *cfs_rq =3D cfs_rq_of(se);
-
+	for_each_sched_entity(se, cfs_rq)
 		cfs_rq->h_nr_runnable--;
-	}
 }
=20
 static void clear_delayed(struct sched_entity *se)
 {
+	struct cfs_rq *cfs_rq;
+
 	se->sched_delayed =3D 0;
=20
 	/*
@@ -6596,11 +6599,8 @@ static void clear_delayed(struct sched_entity *se)
 	 */
 	pref_llc_running_inc(rq_of(cfs_rq_of(se)), task_of(se));
=20
-	for_each_sched_entity(se) {
-		struct cfs_rq *cfs_rq =3D cfs_rq_of(se);
-
+	for_each_sched_entity(se, cfs_rq)
 		cfs_rq->h_nr_runnable++;
-	}
 }
=20
 static void
@@ -7262,14 +7262,16 @@ void unthrottle_cfs_rq(struct cfs_rq *cfs_rq)
 	walk_tg_tree_from(cfs_rq->tg, tg_nop, tg_unthrottle_up, (void *)rq);
=20
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
@@ -8115,13 +8117,12 @@ static unsigned long enqueue_hierarchy(struct task_st=
ruct *p, int flags)
 	struct sched_entity *se =3D &p->se;
 	int h_nr_idle =3D task_has_idle_policy(p);
 	int h_nr_runnable =3D 1;
+	struct cfs_rq *cfs_rq;
=20
 	if (task_new && se->sched_delayed)
 		h_nr_runnable =3D 0;
=20
-	for_each_sched_entity(se) {
-		struct cfs_rq *cfs_rq =3D cfs_rq_of(se);
-
+	for_each_sched_entity(se, cfs_rq) {
 		update_curr(cfs_rq);
=20
 		if (!se->on_rq) {
@@ -8252,16 +8253,15 @@ static void dequeue_hierarchy(struct task_struct *p, =
int flags)
 	bool task_sleep =3D flags & DEQUEUE_SLEEP;
 	bool task_delayed =3D flags & DEQUEUE_DELAYED;
 	bool task_throttled =3D flags & DEQUEUE_THROTTLE;
-	int h_nr_runnable =3D 0;
 	int h_nr_idle =3D task_has_idle_policy(p);
+	int h_nr_runnable =3D 0;
+	struct cfs_rq *cfs_rq;
 	bool dequeue =3D true;
=20
 	if (task_sleep || task_delayed || !se->sched_delayed)
 		h_nr_runnable =3D 1;
=20
-	for_each_sched_entity(se) {
-		struct cfs_rq *cfs_rq =3D cfs_rq_of(se);
-
+	for_each_sched_entity(se, cfs_rq) {
 		update_curr(cfs_rq);
=20
 		if (dequeue) {
@@ -11587,8 +11587,7 @@ static void update_cfs_rq_h_load(struct cfs_rq *cfs_r=
q)
 		return;
=20
 	WRITE_ONCE(cfs_rq->h_load_next, NULL);
-	for_each_sched_entity(se) {
-		cfs_rq =3D cfs_rq_of(se);
+	for_each_sched_entity(se, cfs_rq) {
 		WRITE_ONCE(cfs_rq->h_load_next, se);
 		if (cfs_rq->last_h_load_update =3D=3D now)
 			break;
@@ -15281,9 +15280,9 @@ static inline void task_tick_core(struct rq *rq, stru=
ct task_struct *curr)
 static void se_fi_update(const struct sched_entity *se, unsigned int fi_seq,
 			 bool forceidle)
 {
-	for_each_sched_entity(se) {
-		struct cfs_rq *cfs_rq =3D cfs_rq_of(se);
+	struct cfs_rq *cfs_rq;
=20
+	for_each_sched_entity(se, cfs_rq) {
 		if (forceidle) {
 			if (cfs_rq->forceidle_seq =3D=3D fi_seq)
 				break;
@@ -15361,10 +15360,8 @@ static void task_tick_fair(struct rq *rq, struct tas=
k_struct *curr, int hrtick)
 		unsigned long weight =3D NICE_0_LOAD;
 		struct cfs_rq *cfs_rq;
=20
-		for_each_sched_entity(se) {
-			cfs_rq =3D cfs_rq_of(se);
+		for_each_sched_entity(se, cfs_rq) {
 			entity_tick(cfs_rq, se, hrtick);
-
 			weight =3D __calc_prop_weight(cfs_rq, se, weight);
 		}
=20
@@ -15446,9 +15443,7 @@ static void propagate_entity_cfs_rq(struct sched_enti=
ty *se)
 	/* Start to propagate at parent */
 	se =3D se->parent;
=20
-	for_each_sched_entity(se) {
-		cfs_rq =3D cfs_rq_of(se);
-
+	for_each_sched_entity(se, cfs_rq) {
 		update_load_avg(cfs_rq, se, UPDATE_TG);
=20
 		if (!cfs_rq_pelt_clock_throttled(cfs_rq))
@@ -15555,9 +15550,7 @@ static void set_next_task_fair(struct rq *rq, struct =
task_struct *p, enum snt_e=20
 	if (on_rq)
 		__dequeue_entity(cfs_rq, se);
=20
-	for_each_sched_entity(se) {
-		cfs_rq =3D cfs_rq_of(se);
-
+	for_each_sched_entity(se, cfs_rq) {
 		if (!IS_ENABLED(CONFIG_FAIR_GROUP_SCHED) ||
 		    !first || !cfs_rq->h_curr)
 			set_next_entity(cfs_rq, se);
@@ -15764,13 +15757,14 @@ static int __sched_group_set_shares(struct task_gro=
up *tg, unsigned long shares)
 	for_each_possible_cpu(i) {
 		struct rq *rq =3D cpu_rq(i);
 		struct sched_entity *se =3D tg_se(tg, i);
+		struct cfs_rq *cfs_rq;
 		struct rq_flags rf;
=20
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
@@ -15817,6 +15811,7 @@ int sched_group_set_idle(struct task_group *tg, long =
idle)
 		struct sched_entity *se =3D tg_se(tg, i);
 		struct cfs_rq *grp_cfs_rq =3D tg_cfs_rq(tg, i);
 		bool was_idle =3D cfs_rq_is_idle(grp_cfs_rq);
+		struct cfs_rq *cfs_rq;
 		long idle_task_delta;
 		struct rq_flags rf;
=20
@@ -15831,9 +15826,7 @@ int sched_group_set_idle(struct task_group *tg, long =
idle)
 		if (!cfs_rq_is_idle(grp_cfs_rq))
 			idle_task_delta *=3D -1;
=20
-		for_each_sched_entity(se) {
-			struct cfs_rq *cfs_rq =3D cfs_rq_of(se);
-
+		for_each_sched_entity(se, cfs_rq) {
 			if (!se->on_rq)
 				break;
=20
