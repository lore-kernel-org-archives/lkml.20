Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285894;
	b=3YWrEUv05MTGaZT8t7mtlz/5NTHLTbFo7YV0imCtlryFvb/xspQ4SfQ7vW1cyJfsH+83
	 o+CCTGVsg0vbab2FSrQZMrAnwWW8ruLzd1TbXqpAZGdBm6jdLq6v/UiN12KGX0UO8/KvF
	 ZIQqO0tv/V4z3iV/g+FxVpCx0XC9t7/6jygE2IbQqAYAe4gZhWgHihQFSudfDvYzKI8Cm
	 cFQ8XY5B6EMP71lLihOjh00pyfI/agErmLhpDUwjD8lqcNPlUO6tlLjpaTdfvROR62EXs
	 7/wwZfkolBHwspHE6Hwj6d47SkeC5jtvnR6bzDfPZkzR8+veEpqPxaP+wB9P+Yvc37A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GdSjMsCITlSqE8vgApaYl4U5QfVkIMv+UvZLtzoWlOw=;
	b=Di26KzsCEsQnBsYm2CcbOC82qwxtLG9vqv6UewfBwB0VjznVe2aO8kTGpUdO3xt9dFJ1
	 0bo2NqxRzz2NVz5N7MabUrq+NkTjKKJ4dEIBgYqqDj587s/Ry9lmYJxo8BfQAyXwEtplK
	 5KCK7Wu58NWkStzuHaax+eJMD13xVtEI6GoNe9ldhc5Rx3yM9/A1HWOAK0tmi78SGp1KI
	 7MlgFAMVlO+mdiwAngsNd35DLgYMiVL4Ls4z8m8uRp55S3hILk6N/z03QDSDD8ZBEn6ly
	 tmOU4EA5KPwB8MomRwownZPXHs/3YfNskHTkJw9gcHNyMbk1YJMhibljQNlCUtJlBFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=IyceX664;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7723606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7723606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=IyceX664
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-82380b0f55dso746264a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1794285893; x=1794890693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GdSjMsCITlSqE8vgApaYl4U5QfVkIMv+UvZLtzoWlOw=;
        b=IyceX664QnWk7MxnS6KTjpYCGYqeVNPtzWoxQPzJUlPcqeheb3eIVRjM5VhSiJzbPq
         CiR4M58pOstIzq6FGIGIjFgOGVvRMcMQp0QTzlgLpIhrqu6C0DSQkcjw96rn//ijzuow
         ERgw1P1n/IQMz1zO4C/BDgScvQDj3roafwqDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285893; x=1794890693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GdSjMsCITlSqE8vgApaYl4U5QfVkIMv+UvZLtzoWlOw=;
        b=0Jd6K+J0ZDnE7hMrp4C62shtJBqkuwWip0EbBpupAjAyp+GaJ1esqEF5SlVXyCVRQB
         Oz58Gvt34mvsN1IUgScjUshtR8jg1KfujKz1ddZHFvW5FYS8bB3dSsV12A1Sev6M+i3j
         sJvD88kK5x0kFJtKTdKn/PGjADZpGbxTCc5JzaWAcSyDVX84fB2O4bhRqXTkmFwadnNS
         yRKMDRWL/4/R+2Pw14Wr6I1v1112r9r2uzeaXxX/eFMFrhkgxJE/yopQvIxpUWB7MXeQ
         OB76IPcz2pOrXwftwEpozzWSDzvrm8lGmdo1YsgyKOv+vUGSOA0ZNd05u5Amqc+PHlLB
         rGBg==
X-Forwarded-Encrypted: i=1; AL+hErFQJIM+BZdsV+WmQjMmsFrk5VtPVekBwxk6uh6MC/v1/Fe0QdXVvnd3WBXJZpDLKpjnAiSZw5nEyzG3QC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z//uP7J3peoPnepiu2c5r6tDPvkRLZ7RKwG1skvg7ZTeLWmJ0ra
	//ohJUkoE+2I+jK7Kdn8AYQn7F5PXeCG6Zn8np/3r5MCEgDmsJOSQ4NNxJFuKvUyASit1HkEYYw
	4zMHKGaU=
X-Gm-Gg: AYBFou0Tl4B2wGU+q8qlHKiS3E+69DwhJOoPimF9T3+3d09OtAV7OCQLFiRDqVTd5Xo
	pC7tqBbRXDHG9e/R0ICUIdP3ARaPlV/8vLWfPp3nnTJpkDxJD2ONZKqdVS5jbCPohMWME6ZJEqH
	moAmsDx6DKi7lHfIDvvvo8lDYPEpeMItRQB4aUbtGXS35ptGJ/jZwDiWSy5sA+9sgOBC8CJ2P29
	yRTUKbbomp5cCo4wEVKOEBoUho8yOz25TOhHIcL4vqWASwP29EZl6UEmFnV9m3XT/wGvUGVmP/y
	mcy+RosTn//KedMIsC5TdvPXLJ2Bv/ME9jOzrBA5HqhCOwTSsb0J13Qo35y/OudC1yiXWpcJ/S0
	06lttmZ8XIOOb0G7oK6U/ILxYYGyxs0ZagQKf3NVgKkzsFCLVAnE4oNf/dt/y4KCcbuDGRXV1YK
	PVvthfMsTmOEJftoHNSoBb25DmdWDxfGpqHRiSOdpVaSxY8oDQN1NXVk3eeNXTQu5PwZP88gCpE
	Yq3EzX6gdVI7cC3h4pf8HPlbTkOi3uSllNdmDROe2GFYHO0VBMTocsCO5650jixE4KDKKedvqog
	52M4LZWqZAcA8TGtPsalPiMceenzH366cltPk3biTAT2Narx0Tp2cRCy7GJtNGP1zTPIHEkriqa
	dHBDO3CO0hVaj7EhZgvzid+j/zrG2zw==
X-Received: by 2002:a05:6830:3d8f:b0:846:5d82:8b69 with SMTP id 46e09a7af769-860dc819839mr929680a34.20.1794285892757;
        Mon, 09 Nov 2026 20:44:52 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm1084109a34.8.2026.11.09.20.44.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:44:52 -0800 (PST)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: jhs@mojatatu.com,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] net/sched: serialize autonomous timers with qdisc resets
Date: Mon,  9 Nov 2026 20:44:50 -0800
Message-ID: <20261110044450.51921-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Autonomous qdisc timers can race with queue resets during graft and
destruction. A timer can read qdisc_sleeping before a graft, acquire
that root's lock after the graft, and modify queues protected by the
replacement root's lock. __qdisc_destroy() also resets detached qdiscs
without the tree lock before their destroy callbacks stop the timers.
In SFQ, either race can corrupt skb lists and flow-slot state.

Add a helper that acquires the sleeping-root lock under RCU and retries
if the root changed. Use it in the SFQ, RED, PIE, FQ-PIE and DualPI2
timers. Route default-qdisc attachment and scheduler shutdown through
dev_graft_qdisc(), so all live root replacements hold the previous
root's lock. A validated root then remains current until the timer
unlocks.

Hold the tree lock across the final qdisc reset and release it before
calling the destroy callback so synchronous timer cancellation can
complete. Detached TAPRIO children can have different sleeping roots,
so defer their final resets to taprio_destroy() and lock each subtree
separately. Keep those resets before hardware offload is disabled.

The issue was found by an LLM.

Fixes: 225d9b89c937 ("sch_sfq: rehash queues in perturb timer")
Fixes: 47e8dbb6e763 ("net/sched: do not reset queues in graft operations")
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
Changes in v2:
- Serialize the final qdisc reset with autonomous timers, addressing
  the remaining destruction race identified in review.
- Reset detached TAPRIO children under their individual root locks.
- Add the two Fixes tags.

v1: https://lore.kernel.org/netdev/20261030042312.74363-1-kylebot@openai.com/
Review: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261030042312.74363-1-kylebot@openai.com

I have a reproducer for this issue and can share via DM

 include/net/sch_generic.h | 20 ++++++++++++++++++++
 net/sched/sch_dualpi2.c   |  3 +--
 net/sched/sch_fq_pie.c    |  3 +--
 net/sched/sch_generic.c   | 11 +++++++----
 net/sched/sch_pie.c       |  3 +--
 net/sched/sch_red.c       |  3 +--
 net/sched/sch_sfq.c       |  3 +--
 net/sched/sch_taprio.c    | 16 ++++++++++++++++
 8 files changed, 48 insertions(+), 14 deletions(-)

diff --git a/include/net/sch_generic.h b/include/net/sch_generic.h
index 1acaadb3e2cf..e234256e6ae8 100644
--- a/include/net/sch_generic.h
+++ b/include/net/sch_generic.h
@@ -608,6 +608,26 @@ static inline spinlock_t *qdisc_root_sleeping_lock(const struct Qdisc *qdisc)
 	return qdisc_lock(root);
 }
 
+/* The caller must hold rcu_read_lock().  dev_graft_qdisc() changes the
+ * sleeping root under the old root's lock, so retry if it changed while
+ * we were waiting for that lock.
+ */
+static inline spinlock_t *qdisc_lock_root_sleeping(const struct Qdisc *qdisc)
+{
+	struct Qdisc *root;
+	/* Lock of the sleeping root observed under RCU. */
+	spinlock_t *lock;
+
+	for (;;) {
+		root = qdisc_root_sleeping(qdisc);
+		lock = qdisc_lock(root);
+		spin_lock(lock);
+		if (root == qdisc_root_sleeping(qdisc))
+			return lock;
+		spin_unlock(lock);
+	}
+}
+
 static inline struct net_device *qdisc_dev(const struct Qdisc *qdisc)
 {
 	return qdisc->dev_queue->dev;
diff --git a/net/sched/sch_dualpi2.c b/net/sched/sch_dualpi2.c
index 4947def7c49e..8a74ceaab29d 100644
--- a/net/sched/sch_dualpi2.c
+++ b/net/sched/sch_dualpi2.c
@@ -750,8 +750,7 @@ static enum hrtimer_restart dualpi2_timer(struct hrtimer *timer)
 	spinlock_t *root_lock; /* to lock qdisc for probability calculations */
 
 	rcu_read_lock();
-	root_lock = qdisc_lock(qdisc_root_sleeping(sch));
-	spin_lock(root_lock);
+	root_lock = qdisc_lock_root_sleeping(sch);
 
 	WRITE_ONCE(q->pi2_prob, calculate_probability(sch));
 	hrtimer_set_expires(&q->pi2_timer, next_pi2_timeout(q));
diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
index 5982847df8f8..a1b5126db640 100644
--- a/net/sched/sch_fq_pie.c
+++ b/net/sched/sch_fq_pie.c
@@ -394,8 +394,7 @@ static void fq_pie_timer(struct timer_list *t)
 	int max_cnt, i;
 
 	rcu_read_lock();
-	root_lock = qdisc_lock(qdisc_root_sleeping(sch));
-	spin_lock(root_lock);
+	root_lock = qdisc_lock_root_sleeping(sch);
 
 	/* Limit this expensive loop to 2048 flows per round. */
 	max_cnt = min_t(int, q->flows_cnt - q->flows_cursor, 2048);
diff --git a/net/sched/sch_generic.c b/net/sched/sch_generic.c
index d2e0d20f3ba1..fbbc07700160 100644
--- a/net/sched/sch_generic.c
+++ b/net/sched/sch_generic.c
@@ -1106,7 +1106,7 @@ struct Qdisc *qdisc_create_dflt(struct netdev_queue *dev_queue,
 }
 EXPORT_SYMBOL(qdisc_create_dflt);
 
-/* Under qdisc_lock(qdisc) and BH! */
+/* Under sch_tree_lock(qdisc) and BH! */
 
 void qdisc_reset(struct Qdisc *qdisc)
 {
@@ -1154,8 +1154,10 @@ static void __qdisc_destroy(struct Qdisc *qdisc)
 #endif
 	gen_kill_estimator(&qdisc->rate_est);
 
+	/* Autonomous timers can still run after the qdisc was detached. */
+	sch_tree_lock(qdisc);
 	qdisc_reset(qdisc);
-
+	sch_tree_unlock(qdisc);
 
 	if (ops->destroy)
 		ops->destroy(qdisc);
@@ -1213,6 +1215,7 @@ struct Qdisc *dev_graft_qdisc(struct netdev_queue *dev_queue,
 	struct Qdisc *oqdisc = rtnl_dereference(dev_queue->qdisc_sleeping);
 	spinlock_t *root_lock;
 
+	/* Pairs with qdisc_lock_root_sleeping() in asynchronous callbacks. */
 	root_lock = qdisc_lock(oqdisc);
 	spin_lock_bh(root_lock);
 
@@ -1236,8 +1239,8 @@ static void shutdown_scheduler_queue(struct net_device *dev,
 	struct Qdisc *qdisc_default = _qdisc_default;
 
 	if (qdisc) {
+		qdisc = dev_graft_qdisc(dev_queue, qdisc_default);
 		rcu_assign_pointer(dev_queue->qdisc, qdisc_default);
-		rcu_assign_pointer(dev_queue->qdisc_sleeping, qdisc_default);
 
 		qdisc_put(qdisc);
 	}
@@ -1261,7 +1264,7 @@ static void attach_one_default_qdisc(struct net_device *dev,
 
 	if (!netif_is_multiqueue(dev))
 		qdisc->flags |= TCQ_F_ONETXQUEUE | TCQ_F_NOPARENT;
-	rcu_assign_pointer(dev_queue->qdisc_sleeping, qdisc);
+	dev_graft_qdisc(dev_queue, qdisc);
 }
 
 static void attach_default_qdiscs(struct net_device *dev)
diff --git a/net/sched/sch_pie.c b/net/sched/sch_pie.c
index 3b7863ffd284..9367065db4b1 100644
--- a/net/sched/sch_pie.c
+++ b/net/sched/sch_pie.c
@@ -429,8 +429,7 @@ static void pie_timer(struct timer_list *t)
 	spinlock_t *root_lock;
 
 	rcu_read_lock();
-	root_lock = qdisc_lock(qdisc_root_sleeping(sch));
-	spin_lock(root_lock);
+	root_lock = qdisc_lock_root_sleeping(sch);
 	pie_calculate_probability(&q->params, &q->vars, sch->qstats.backlog);
 
 	/* reset the timer to fire after 'tupdate'. tupdate is in jiffies. */
diff --git a/net/sched/sch_red.c b/net/sched/sch_red.c
index d7598214270b..a7601b879092 100644
--- a/net/sched/sch_red.c
+++ b/net/sched/sch_red.c
@@ -333,8 +333,7 @@ static inline void red_adaptative_timer(struct timer_list *t)
 	spinlock_t *root_lock;
 
 	rcu_read_lock();
-	root_lock = qdisc_lock(qdisc_root_sleeping(sch));
-	spin_lock(root_lock);
+	root_lock = qdisc_lock_root_sleeping(sch);
 	red_adaptative_algo(&q->parms, &q->vars);
 	mod_timer(&q->adapt_timer, jiffies + HZ/2);
 	spin_unlock(root_lock);
diff --git a/net/sched/sch_sfq.c b/net/sched/sch_sfq.c
index 8bbcfc9e85d9..2bd3fc65053a 100644
--- a/net/sched/sch_sfq.c
+++ b/net/sched/sch_sfq.c
@@ -611,8 +611,7 @@ static void sfq_perturbation(struct timer_list *t)
 
 	get_random_bytes(&nkey, sizeof(nkey));
 	rcu_read_lock();
-	root_lock = qdisc_lock(qdisc_root_sleeping(sch));
-	spin_lock(root_lock);
+	root_lock = qdisc_lock_root_sleeping(sch);
 	q->perturbation = nkey;
 	if (!q->filter_list && q->tail)
 		sfq_rehash(sch);
diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
index 4f69ef3d847a..b7489cf4bba9 100644
--- a/net/sched/sch_taprio.c
+++ b/net/sched/sch_taprio.c
@@ -2041,6 +2041,10 @@ static void taprio_reset(struct Qdisc *sch)
 
 	hrtimer_cancel(&q->advance_timer);
 
+	/* Destroy resets each detached subtree under its own root lock. */
+	if (!refcount_read(&sch->refcnt))
+		return;
+
 	if (q->qdiscs) {
 		for (i = 0; i < dev->num_tx_queues; i++)
 			if (q->qdiscs[i])
@@ -2063,6 +2067,18 @@ static void taprio_destroy(struct Qdisc *sch)
 	hrtimer_cancel(&q->advance_timer);
 	qdisc_synchronize(sch);
 
+	if (q->qdiscs) {
+		for (i = 0; i < dev->num_tx_queues; i++) {
+			struct Qdisc *child = q->qdiscs[i];
+
+			if (!child)
+				continue;
+			sch_tree_lock(child);
+			qdisc_reset(child);
+			sch_tree_unlock(child);
+		}
+	}
+
 	taprio_disable_offload(dev, q, NULL);
 
 	if (q->qdiscs) {

base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.55.0.openai.911.g06873a30d2f3

