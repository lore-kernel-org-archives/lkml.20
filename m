Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216533;
	b=3O81Yow4LUTGDXztKbP76h5QYGua6ZIDVajOs5W/igMXQOtDnH2OxeAbi6Y8rpE50AXO
	 INbdCUXgFYUxnvnbyEBlVQcx41gZzbbVge7/lzuBM16ijwdGMAXxbCyR6D1q0pTuNvENd
	 UlMjXNdk4OD3C6vHPRPA/lFITspDhV1DrY++fl2pWOIYETlFjKcFL3DdtMmWP9YB50Z58
	 60owYP6/7TP0LrghgrCVi2DtK1wvHn99Y9+NIu8Q0aO0g4w9w/FrT3A1qE7O9rQSzNFAc
	 woxhZPUBJLd7SbL+XLk9xAqbe6m/Ow+sr+GY/r+TtHY5B7jTz/LzTT34dohVezUW9dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216533;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=YIrTJaoX5e2xYLXcoqy6Lr209hscOACOvSwBCq+p7nE=;
	b=xlkVlBh5aJra0thjNTf4uTHkkUvBrHC18t3gqTNY/KZQhV5lLysaT4cc2f7Adhj38Uk2
	 ZuJoTVxv8uYtWsD50B8sdOzHJjyFtBZXQ2gYsyXoJM/cM9gKU+zMz2o8ieughJWCgzV0u
	 oBbvGvW8748ztgSZz9t2MWcsyw9Y1y5/DLmKzPCvVPub6FqaCtrwE5OcO9NdxMLbOUX9M
	 RNvmBntZ6b+nVeO2lJMyzy0PnnfjmsXQroBBFjBpjIjl2bvnlNqSaZu8zVaJmjAH2QUBX
	 EMuyIZn0NZYonMkmdXUwL/Q9yx5f92t7osVjI9pizdizB+qwZ7OPVqhP94ft89EFAFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=O6mZMCM9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Lus2cERL;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F616082BCA;
	Mon,  9 Nov 2026 09:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F616082BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=O6mZMCM9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Lus2cERL
Date: Mon, 09 Nov 2026 09:28:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216531;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YIrTJaoX5e2xYLXcoqy6Lr209hscOACOvSwBCq+p7nE=;
	b=O6mZMCM9V1xtF8Sjh5oqPaMjZYsKT9lQnGAcc6djV5NPm/C2rfe8Nr0Q7iouiQYMdADl99
	oZYjvXfmMRL6lTwUGmyFVXRrB6zfvRLcOvqZ6OhH4yx8Vw1baNYHBaECURYt4N/k3fWIbc
	AZ1pOkM8gLOrAaKpZj4D7wnmdkYqwmgbdT6VT88717nR3q32o8isP6tij3pDXcasaghgUX
	mGqudjUHvgBJ5+OFSnCzSEzKvn+vr3zabtVxs4tD4dPrgmagDJ9nLQTrVYTqG8NVxGRnIG
	+XANXpy25w1g979ltxVQRqr9UMr9HAw9GkUk9DQBYYuG6VzwHKQeHxqZyYtsHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216531;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YIrTJaoX5e2xYLXcoqy6Lr209hscOACOvSwBCq+p7nE=;
	b=Lus2cERLHQqf3rwS/CSrR6bYQlbJd5JZi3xxXwtY71xU3oK4vshMU53kMyJLmsvjIZHQyg
	cXmJtuhAR3LMOjBA==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/fair: Rework/fix task_h_load()
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260929085320.337703476@infradead.org>
References: <20260929085320.337703476@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421652915.2093942.15278277574563881471.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     9e3fa63360bc9ac17619ff076d38d29f57edeb0e
Gitweb:        https://git.kernel.org/tip/9e3fa63360bc9ac17619ff076d38d29f57e=
deb0e
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Tue, 29 Sep 2026 10:49:27 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:17:53 +01:00

sched/fair: Rework/fix task_h_load()

There are a number of issues with task_h_load():

 - its hierarchy traversal is racy to the point of being broken; where
   originally it was meant to be used under rq->lock, but lacking an assertion
   for that fact, its use spread and violated this. The result is that the
   back-link state is prone to races.

 - it is rate-limited on jiffies, which is HZ, not the underlying PELT decay.

 - since its update is tied to task_h_load() usage, the cfs_rq->h_load number=
s are
   not often 'up-to-date', rendering their output in sched/debug near useless.

Rework the whole thing to keep a more up-to-date and less broken cfs_rq->h_lo=
ad
number.

Move the back-link tracking into for_each_sched_entity(), such that any such
loop sets up a path back. Use this to (optionally) re-compute cfs_rq->h_load =
on
enqueue, dequeue, set_next and tick, all sites that hold rq->lock.

This ensures that 'active' cgroups have reasonably up-to-date cfs_rq->h_load.
Additionally, have __update_blocked_fair() update cfs_rq->h_load for all
cgroups.

Finally, replace the jiffy rate-limit with one that is tied to the PELT decay.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Link: https://patch.msgid.link/20260929085320.337703476@infradead.org
---
 kernel/sched/fair.c  | 117 +++++++++++++++++++++++++++---------------
 kernel/sched/pelt.h  |   7 +++-
 kernel/sched/sched.h |   1 +-
 3 files changed, 84 insertions(+), 41 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 31a583d..7f58c7b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5701,6 +5701,50 @@ static inline bool skip_blocked_update(struct sched_en=
tity *se)
 	return true;
 }
=20
+static inline void __update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
+					  struct sched_entity *se,
+					  struct cfs_rq *p_cfs_rq)
+{
+	unsigned long load =3D cfs_rq->avg.load_avg;
+
+	if (cfs_rq !=3D &cfs_rq->rq->cfs) {
+		/*
+		 * These last two arguments can be NULL when used outside of
+		 * the for_each_sched_entity() hierarchy iteration. Like in
+		 * __update_blocked_fair() where leaf_cfs_rq_list is iterated
+		 * instead.
+		 */
+		if (!se)
+			se =3D &container_of(cfs_rq, struct cfs_tg_state, cfs_rq)->se;
+		if (!p_cfs_rq)
+			p_cfs_rq =3D cfs_rq_of(se);
+
+		load =3D p_cfs_rq->h_load;
+		load =3D div64_ul(load * se->avg.load_avg,
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
+	if ((cfs_rq->last_h_load_update & ~PELT_SEGMENT_MASK) =3D=3D
+	    (cfs_rq->avg.last_update_time & ~PELT_SEGMENT_MASK))
+		return false;
+
+	__update_cfs_rq_h_load(cfs_rq, se, p_cfs_rq);
+
+	cfs_rq->last_h_load_update =3D cfs_rq->avg.last_update_time;
+	return true;
+}
+
 #else /* !CONFIG_FAIR_GROUP_SCHED: */
=20
 static inline void update_tg_load_avg(struct cfs_rq *cfs_rq) {}
@@ -5714,6 +5758,10 @@ static inline int propagate_entity_load_avg(struct sch=
ed_entity *se)
=20
 static inline void add_tg_cfs_propagate(struct cfs_rq *cfs_rq, long runnable=
_sum) {}
=20
+static inline bool update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
+					struct sched_entity *se,
+					struct cfs_rq *p_cfs_rq) { return false; }
+
 #endif /* !CONFIG_FAIR_GROUP_SCHED */
=20
 #ifdef CONFIG_NO_HZ_COMMON
@@ -8153,6 +8201,9 @@ static unsigned long enqueue_hierarchy(struct task_stru=
ct *p, int flags)
 		flags =3D ENQUEUE_WAKEUP;
 	}
=20
+	for_each_sched_entity_bl(se, cfs_rq)
+		update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
+
 	return weight;
 }
=20
@@ -8296,6 +8347,9 @@ static void dequeue_hierarchy(struct task_struct *p, in=
t flags)
 		flags |=3D DEQUEUE_SLEEP;
 		flags &=3D ~(DEQUEUE_DELAYED | DEQUEUE_SPECIAL);
 	}
+
+	for_each_sched_entity_bl(se, cfs_rq)
+		update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
 }
=20
 /*
@@ -11577,51 +11631,23 @@ static bool __update_blocked_fair(struct rq *rq, bo=
ol *done)
 			*done =3D false;
 	}
=20
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
-	struct sched_entity *se =3D cfs_rq_se(cfs_rq);
-	unsigned long now =3D jiffies;
-	unsigned long load;
-
-	if (cfs_rq->last_h_load_update =3D=3D now)
-		return;
-
-	WRITE_ONCE(cfs_rq->h_load_next, NULL);
-	for_each_sched_entity(se, cfs_rq) {
-		WRITE_ONCE(cfs_rq->h_load_next, se);
-		if (cfs_rq->last_h_load_update =3D=3D now)
-			break;
-	}
-
-	if (!se) {
-		cfs_rq->h_load =3D cfs_rq_load_avg(cfs_rq);
-		cfs_rq->last_h_load_update =3D now;
-	}
+	/*
+	 * The above (forward) leaf_cfs_rq_list traversal will have done
+	 * update_cfs_rq_load_avg() in a bottom-up fashion. Now iterate the
+	 * list backwards, such that we're ensured to have visited every
+	 * parent of the current group to update h_load in a top-down fashion.
+	 */
+	list_for_each_entry_reverse(cfs_rq, &rq->leaf_cfs_rq_list, leaf_cfs_rq_list)
+		update_cfs_rq_h_load(cfs_rq, NULL, NULL);
=20
-	while ((se =3D READ_ONCE(cfs_rq->h_load_next)) !=3D NULL) {
-		load =3D cfs_rq->h_load;
-		load =3D div64_ul(load * se->avg.load_avg,
-				cfs_rq_load_avg(cfs_rq) + 1);
-		cfs_rq =3D group_cfs_rq(se);
-		cfs_rq->h_load =3D load;
-		cfs_rq->last_h_load_update =3D now;
-	}
+	return decayed;
 }
=20
 static unsigned long task_h_load(struct task_struct *p)
 {
 	struct cfs_rq *cfs_rq =3D task_cfs_rq(p);
=20
-	update_cfs_rq_h_load(cfs_rq);
-	return div64_ul(p->se.avg.load_avg * cfs_rq->h_load,
+	return div64_ul(p->se.avg.load_avg * READ_ONCE(cfs_rq->h_load),
 			cfs_rq_load_avg(cfs_rq) + 1);
 }
 #else /* !CONFIG_FAIR_GROUP_SCHED: */
@@ -15375,6 +15401,11 @@ static void task_tick_fair(struct rq *rq, struct tas=
k_struct *curr, int hrtick)
=20
 		se =3D &curr->se;
 		reweight_eevdf(cfs_rq, se, weight, se->on_rq);
+
+		if (!hrtick) {
+			for_each_sched_entity_bl(se, cfs_rq)
+				update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
+		}
 	}
=20
 	if (hrtick)
@@ -15589,11 +15620,15 @@ static void set_next_task_fair(struct rq *rq, struc=
t task_struct *p, enum snt_e=20
 		 */
 		list_move(&se->group_node, &rq->cfs_tasks);
 	}
-	if (!first)
-		return;
=20
 	WARN_ON_ONCE(se->sched_delayed);
=20
+	for_each_sched_entity_bl(se, cfs_rq)
+		update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
+
+	if (!first)
+		return;
+
 	update_misfit_status(p, rq);
 	sched_fair_update_stop_tick(rq, p);
=20
@@ -15775,6 +15810,8 @@ static int __sched_group_set_shares(struct task_group=
 *tg, unsigned long shares)
 			update_load_avg(cfs_rq, se, UPDATE_TG);
 			update_cfs_group(se);
 		}
+		for_each_sched_entity_bl(se, cfs_rq)
+			update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
 		rq_unlock_irqrestore(rq, &rf);
 	}
=20
diff --git a/kernel/sched/pelt.h b/kernel/sched/pelt.h
index f921302..ef842ce 100644
--- a/kernel/sched/pelt.h
+++ b/kernel/sched/pelt.h
@@ -5,6 +5,13 @@
=20
 #include "sched-pelt.h"
=20
+/*
+ * Pelt uses apprixmate 'us' as ns/1024; and then uses time segments of 1024
+ * 'us'. As a result each segment is in fact '1<<20' ns.
+ */
+#define PELT_SEGMENT_NS		(1<<20)
+#define PELT_SEGMENT_MASK	(PELT_SEGMENT_NS-1)
+
 int __update_load_avg_blocked_se(u64 now, struct sched_entity *se);
 int __update_load_avg_se(u64 now, struct cfs_rq *cfs_rq, struct sched_entity=
 *se);
 int __update_load_avg_cfs_rq(u64 now, struct cfs_rq *cfs_rq);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index a993c7d..c8ddf1d 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -736,7 +736,6 @@ struct cfs_rq {
 	 */
 	unsigned long		h_load;
 	u64			last_h_load_update;
-	struct sched_entity	*h_load_next;
=20
 	struct rq		*rq;	/* CPU runqueue to which this cfs_rq is attached */
=20
