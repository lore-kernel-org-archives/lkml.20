Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898726;
	b=3gNkeOzdmeEVQ/5i3K/X8j37Scv0NhWzbAnQBWasvy6E5XyEEhOX8K9TvWxYy0zTK4os
	 DZsMmSzImwSZHgMCrVV+tSR6smWMWDgtzj5ZOJZJnvhH4KeJhdWKzYrIolcecNZ3jMEtY
	 bKjLdUwcKL0jbDUXqbi5SefxzbF2b2sPOR6jINAA+leD6veAxnRtTzgG1m+zvqs0NI5pf
	 Qxp5I0uXfmXny+tmIcK9KrPVzTB94b4PiYYU6HggbF+v3FBEDwwhp3QWcipor8l6Go49j
	 z1Lzh3r2jLXJnjjW3m103eoKJ86hNUO5AT6vX1trgMsNMMTsSUo8LYBRdsfAiClB7dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898726;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=ySuCP1G/RTjcqPBMRZ2udxn37Hv0yGwRm2XsM7V6HKU=;
	b=bwLM7eLh3yoI8uBD4FMQGL8S4ABEojJoA5TD5HG66IBA7cdTiOglg7ghJUDSLWsDr+/W
	 Fucgq96JUaxekuKt9pc80eO0B8ppa2qlrx9iKZw5rLfdPIIbp0nEs9ZUF7yKg9Gjj3HNY
	 LoFXTGXvOjPBfyMp0e8Ll1Tiiwc7FJfR8UBDFysqBjSHqRKVY8Gsst0fbpK5FdvLab9Jh
	 mqASh7wC7hC2ly3VEX0/boc8dcLuvv2U+zDuVdsod5eesuf2Ep1QDWgl+C5G4zunBUd83
	 M/Y3LaTk9QxLDjjMOTzkfmVSppnrmQN75UhVkekm2t1ckAEoB5y91F82VdJBPTmj+Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CaO0GH+j;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9780606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9780606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CaO0GH+j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=ySuCP1G/RTjcqPBMRZ2udxn37Hv0yGwRm2XsM7V6HKU=; b=CaO0GH+jxPhpQz3uVVjVX/gs8G
	37KA2UIM/tz/C0gPzSe4AKRSs0greFwEECzdHiDlQfHtXc7gRFCXhyDtDMHSxPu64cTd6osH8PN9P
	mmj+k859qmJEo+zQQwZ90gwx7yYlLetQstyv+tjTRElrwN9bIBZqqvxyU2QIMuD01jfFpzMX/7ZFc
	7nNWitCVeXBfkN+I+g3xpeN2cRDBzANcUy0fa/rFFVSDGtNJ4sRrHsiHa8380VgJQ4DRHtUivVNVD
	k2hqFe9MfONmUnbulFfgv2Tz10x3RkxwQWIRwkNmVsLU8Kqghb/2NbwaH7CUKm6W1Km/uJF5+1AyZ
	RJ2p+PWA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP10H-00000003JiZ-2Yfd;
	Thu, 05 Nov 2026 17:11:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 9409D302FFB; Thu, 05 Nov 2026 18:11:56 +0100 (CET)
Message-ID: <20261105170157.765325702@infradead.org>
User-Agent: quilt/0.68
Date: Thu, 05 Nov 2026 17:55:28 +0100
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
Subject: [RFC][PATCH 3/3] sched/eevdf: Fix sched idle task group preemption
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

From: Vincent Guittot <vincent.guittot@linaro.org>

Even with flat hierarchy which puts all runnable tasks in the same cfs rq,
we need to parse the hierarchy to check for sched_idle task group.

Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
Reported-by: Jakub Okoński <jakub@okonski.org>
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lore.kernel.org/all/58dc8e8a-7260-43ce-aebb-8d9c29a6afc9@okonski.org/
Link: https://patch.msgid.link/20261019182622.1584454-1-vincent.guittot@linaro.org
---

Changes since v1:
- fix prototype and cleanup unsued variable

 kernel/sched/fair.c |   87 ++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 74 insertions(+), 13 deletions(-)

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -433,6 +433,38 @@ static inline struct sched_entity *paren
 	return se->parent;
 }
 
+static void
+find_matching_se(struct sched_entity **se, struct sched_entity **pse)
+{
+	int se_depth, pse_depth;
+
+	/*
+	 * preemption test can be made between sibling entities who are in the
+	 * same cfs_rq i.e who have a common parent. Walk up the hierarchy of
+	 * both tasks until we find their ancestors who are siblings of common
+	 * parent.
+	 */
+
+	/* First walk up until both entities are at same depth */
+	se_depth = (*se)->depth;
+	pse_depth = (*pse)->depth;
+
+	while (se_depth > pse_depth) {
+		se_depth--;
+		*se = parent_entity(*se);
+	}
+
+	while (pse_depth > se_depth) {
+		pse_depth--;
+		*pse = parent_entity(*pse);
+	}
+
+	while (!is_same_group(*se, *pse)) {
+		*se = parent_entity(*se);
+		*pse = parent_entity(*pse);
+	}
+}
+
 static int tg_is_idle(struct task_group *tg)
 {
 	return tg->idle > 0;
@@ -476,6 +508,11 @@ static inline struct sched_entity *paren
 	return NULL;
 }
 
+static inline void
+find_matching_se(struct sched_entity **se, struct sched_entity **pse)
+{
+}
+
 static inline int tg_is_idle(struct task_group *tg)
 {
 	return 0;
@@ -10130,7 +10167,40 @@ preempt_sync(struct rq *rq, int wake_fla
 }
 
 /*
- * Preempt the current task with a newly woken task if needed:
+ * Preempt an idle entity in favor of a non-idle entity (and don't preempt
+ * in the inverse case).
+ */
+static inline enum preempt_wakeup_action
+wakeup_preempt_sched_idle(struct sched_entity *cse, struct sched_entity *pse)
+{
+	int cse_is_idle, pse_is_idle;
+
+	cse_is_idle = se_is_idle(cse);
+	pse_is_idle = se_is_idle(pse);
+
+	if (cse_is_idle || pse_is_idle) {
+		find_matching_se(&cse, &pse);
+		WARN_ON_ONCE(!pse);
+
+		cse_is_idle = se_is_idle(cse);
+		pse_is_idle = se_is_idle(pse);
+
+		/*
+		 * Preempt an idle entity in favor of a non-idle entity (and
+		 * don't preempt in the inverse case).
+		 */
+		if (cse_is_idle && !pse_is_idle)
+			return PREEMPT_WAKEUP_RESCHED;
+
+		if (cse_is_idle != pse_is_idle)
+			return PREEMPT_WAKEUP_NONE;
+	}
+
+	return PREEMPT_WAKEUP_PICK;
+}
+
+/*
+ * Preempt the current task with a newly woken task if needed.
  */
 static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_flags)
 {
@@ -10138,7 +10208,6 @@ static void wakeup_preempt_fair(struct r
 	struct task_struct *donor = rq->donor;
 	struct sched_entity *nse, *se = &donor->se, *pse = &p->se;
 	struct cfs_rq *cfs_rq = &rq->cfs;
-	int cse_is_idle, pse_is_idle;
 
 	/*
 	 * XXX Getting preempted by higher class, try and find idle CPU?
@@ -10175,22 +10244,14 @@ static void wakeup_preempt_fair(struct r
 	if (!sched_feat(WAKEUP_PREEMPTION))
 		return;
 
-	WARN_ON_ONCE(!pse);
-
-	cse_is_idle = se_is_idle(se);
-	pse_is_idle = se_is_idle(pse);
+	preempt_action = wakeup_preempt_sched_idle(se, pse);
 
-	nse = se;
-	/*
-	 * Preempt an idle entity in favor of a non-idle entity (and don't preempt
-	 * in the inverse case).
-	 */
-	if (cse_is_idle && !pse_is_idle)
+	if (preempt_action == PREEMPT_WAKEUP_RESCHED)
 		goto preempt;
 
 	update_curr_fair(rq);
 
-	if (cse_is_idle != pse_is_idle)
+	if (preempt_action == PREEMPT_WAKEUP_NONE)
 		goto update;
 
 	/*


