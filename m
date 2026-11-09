Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213851;
	b=XmW4TxflSdQA+3UO5hoJknHsrvGClJqvwT+uYh5VpEYu5LFO60pADERVUs1ITA5TrD7X
	 GIPzFDX01A6nFn03ci+6D6UzBq9sJp0M7AeDvBQdrW9GuuvYb4vJSMcdr3VUsuAhwYcnP
	 kqV1hrSyB7Jp1ZCG0UOUK5T4gguRIkyIBtpAaDmYI0gweUeZNNiQcJNGVYoQsgJ1CtqT1
	 ic80jX+3L9yTpPzPCRsVLR+rhrzCI8TaMP/MNtb9mBNWefYaRO44VFjVaJJJOq+cb+aEd
	 kAVm2enroH9hfWt02PDgO3yjQgzlpGUiWoKKARMUtx9GyHpsLTlwB3N3vTrovwe8AVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213851;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=czr1nWIBAEGJWi1Z3Ut1rrmuz0hxkDa9007Rag5lxHA=;
	b=uhjKUN97hz7EOtqyfVV2uHY5pNHoazkxXSMDz8+xGk5DwEa3Q9f3VB9Bi1h/sGPbu2bs
	 0CPc9iRNSDGX9LQRst4Pk5h+O1OqSf34PgsaS4LqJPeZUWoJHxZ6HcoxsbPLNssAZwzoC
	 xCVeQXOVEyxYgFWOWHqFW1OSQ2xigb38gaIbX1G9lFq7P7M24bwYFxWOcTrOCB+GqwzXz
	 9da1t6u3NL7fhbDJmeC1ouFdHNzEBo61vQbO/D1fPiy1YiChKo1MnOCODo1/fSdmbaHmt
	 98SiHG/1T8o/XrNgaUD+PwuiZwC3aFPrv3k+AKAeUuE/6VGPubus+fTTDOm7/9CN13g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RhJOjFwp;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="9Dpqk/aZ";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F92C6082BEE;
	Mon,  9 Nov 2026 08:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F92C6082BEE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RhJOjFwp;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9Dpqk/aZ
Date: Mon, 09 Nov 2026 08:44:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794213850;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=czr1nWIBAEGJWi1Z3Ut1rrmuz0hxkDa9007Rag5lxHA=;
	b=RhJOjFwpNN3g8wpPmmOEgsgG5eE8kqjKvsCdneqctQq9oIEHW2ZVSbG/3BJGyTvZKibIMM
	4pHfdoVbkfgmNEAvySbiOqrEyeIAIdULC238GfJfwA4JbmV8GnWvOVIndbrhaozTCd8FX3
	KGgliF9vGLBi53+qqXT/yCu09nbDZhBymscO4I6syXhZIIR/rdbp6ONsHb3AvQg7FHoYVn
	mMeZRQkDQTDktUrJbV2P3foLIPMIE3LdUB/roS2QA6E7+3gzhvoZBPabZprFdS2EybSDst
	k/MkemFVDiyA6IcUX0L+lS3K+pEoWQNS9wp+nDg4+2dJzrGgIOdJMpMoj3wnUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794213850;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=czr1nWIBAEGJWi1Z3Ut1rrmuz0hxkDa9007Rag5lxHA=;
	b=9Dpqk/aZMTNzBnYDOlqTOwpJhMEDaQeA6ARI19z+R3v5fqcQiIS4ZpjBunhXY0Xr2oS2MR
	ATFZ2cEeiGIsQMCA==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/fair: Fold cfs_rq_of(se) into for_each_sched_entity()
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
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
Message-ID: <179421384816.2093942.17022883840209529771.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     aa5ebfa11bb027d8dfd92ec651b265ea8d962081
Gitweb:        https://git.kernel.org/tip/aa5ebfa11bb027d8dfd92ec651b265ea8d9=
62081
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Tue, 29 Sep 2026 10:49:25 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 09 Nov 2026 09:39:55 +01:00

sched/fair: Fold cfs_rq_of(se) into for_each_sched_entity()

Pretty much every for_each_sched_entity() loop does: cfs_rq =3D cfs_rq_of(se)=
 as
the very first thing. Fold it into the for_each_sched_entity() macro.

This paves the way to have the macro track a backlink transparantly.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
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
