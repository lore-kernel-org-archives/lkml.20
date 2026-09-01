Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AF546D2C3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788296975; cv=none; b=hDLVWefOFOrU7d99Vc/nCzJZ8VYdIwRgUCN6wuqLRLDInqRlZyZBzX17VQ00/BkjVq/oi5+X1fVkITIm6F5+axuaQalOvmbW06r4vKTIJS94pZ3E9y8a9xUj81EMuvbd40et16snrGW7CaU64eYTSYe1dkag1rOhxsbIZZXwxiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788296975; c=relaxed/simple;
	bh=dWq0Hsvabaeu3if9h1sTAB1tB8RuO6hGS3QqLcgbe88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rfEvVLYBtDjt1qjIG63J6+29gkArBzy/fEcJImcnfnJLo6d4A2ItC5aVRcxmaI64anDdVV9UqLSUpowB8FLx+rQs0yvtVa07YKUa8XUIxOInVFN7jrMlbXZE+sY6TF59ss/9UENZ7IcpY2BHTPwGOMQ4RWRKLsuv7AgpfOFIgcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZgcUDXK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZgcUDXK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFED1F00A3A;
	Tue,  1 Sep 2026 21:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788296973;
	bh=YqA6In0vQoyIiEIT3xAW1GcUan5VbSgu4FJAqfplFCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NZgcUDXKUdYPigQE867JzbgvIShD3QPnX7vdtN/4dxKgJJGwlMWP/NxBsglFbIKbf
	 fV+a20vWHG5bfNSwnRYqvgrCUcqg1HbU8WZSwyv8T3ef+SEJkYLdjY1G8pZ2zf3JfN
	 ehLZWg2VLg+SHGNzVAb9AnvwZC5JeeiEvok0tN1wCNYoCLX11OeGmkKEyL/cBhQbpD
	 mOCfR+CXoL/RrLh7cfePRtd43XpKFd8juOxra8514Hgb/27Qg+Zrbxg5iYB7ZcOMMV
	 qIA7UAaXAZI9US+Cp6yA+DX2Rrs8RJ71BDTc6vIJR1g3AHbeSzvV0rxlcDyBPAfEqV
	 +J+Uf71vdH+mA==
From: Tejun Heo <tj@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	Yao Kai <yaokai34@huawei.com>,
	liuyongqiang <liuyongqiang13@huawei.com>,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 3/3] workqueue: Make flush_workqueue() visit only pwqs active since the last flush
Date: Tue,  1 Sep 2026 11:09:29 -1000
Message-ID: <20260901210929.3092513-4-tj@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901210929.3092513-1-tj@kernel.org>
References: <20260901210929.3092513-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

636b927eba5b ("workqueue: Make unbound workqueues to use per-cpu
pool_workqueues") fixed unbound workqueue scalability on large machines but
made flush_workqueue() walk one pwq per possible CPU, cycling each pool
lock, up to three times per flush. 85f0d8e39aff ("workqueue: Reduce
expensive locks for unbound workqueue") coalesced same-pool locks for
unbound workqueues but the walk remains. Yao Kai reported the XFS CIL
workqueue, flushed on every log force, spending up to 64us per flush in the
walk on a 128-CPU machine.

Idle pwqs can't just be skipped: the lock-and-advance of every pwq's work
color is what keeps a concurrently queued work item from being stamped with
a retired color unseen by the flusher, which would let a later flush return
before it finishes.

Track active pwqs instead. Each workqueue gets a wq_flush_pnode per node
with a lock, a mirror of wq->work_color and a list of pwqs. Queueing to an
off-list pwq syncs pwq->work_color from the mirror and adds it under
fpn->lock, and flush_workqueue_prep_pwqs() advances the mirror and splices
the list in one fpn->lock section per node before visiting the pwqs under
pool->lock as before. That replaces the fence: a racing queueing either gets
its pwq on the list before the splice or stamps the advanced color. A pwq
stays on the list until a visit finds nothing in flight, so a cascade arming
an older color still finds it, barriers need no separate add as the work
item they follow keeps the pwq on the list, and pwq_release_workfn() removes
a released pwq under wq->mutex.

On a 192-CPU 2-node machine, flushing an idle per-cpu workqueue goes from
40k to 4.2M per second and an idle unbound one from 450k to 4.3M. 16 threads
each queueing a work item and flushing, go from 30k to 110k flushes per
second on a per-cpu workqueue and 60k to 180k on an unbound one. Dense
flushes with every pwq active are unchanged on per-cpu workqueues and 15-20%
slower on unbound ones. The queue path is unchanged.

Reported-by: Yao Kai <yaokai34@huawei.com>
Link: https://lore.kernel.org/all/0a030145-c108-4365-ba2d-ac1973a1e352@huawei.com/
Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/workqueue.c | 235 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 192 insertions(+), 43 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index d19d2e59ec05..2cc22be3ac07 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -161,6 +161,9 @@ struct llc_shard_layout {
  * LN: pool->lock and wq_node_nr_active->lock protected for writes. Either for
  *     reads.
  *
+ * FN: wq_flush_pnode->lock protected. list_empty(&pwq->flush_node) can also be
+ *     tested with only pool->lock held.
+ *
  * K: Only modified by worker while holding pool->lock. Can be safely read by
  *    self, while holding pool->lock or from IRQ context if %current is the
  *    kworker.
@@ -277,6 +280,7 @@ struct pool_workqueue {
 	int			total_in_flight; /* L: sum of nr_in_flight[] */
 	int			nr_in_flight[WORK_NR_COLORS];
 						/* L: nr of in_flight works */
+	struct list_head	flush_node;	/* FN: node on wq_flush_pnode->pwqs */
 	bool			plugged;	/* L: execution suspended */
 
 	/*
@@ -345,6 +349,21 @@ struct wq_node_nr_active {
 	struct list_head	pending_pwqs;	/* LN: pwqs with inactive works */
 };
 
+/*
+ * Per-node list of pwqs active since the last flush so that flushes visit only
+ * those. One per possible node plus the NUMA_NO_NODE fallback at nr_node_ids,
+ * each allocated on its node. A pwq is added when a work item is queued to it
+ * while off the list and removed by a flush which finds it with nothing in
+ * flight. ->work_color mirrors wq->work_color. Reading it and adding the pwq in
+ * one ->lock section keeps queueing coherent against flushing: a work item is
+ * either stamped with the new color or its pwq is visible to the flusher.
+ */
+struct wq_flush_pnode {
+	raw_spinlock_t		lock;		/* nests inside pool locks */
+	int			work_color;	/* FN: mirrors wq->work_color */
+	struct list_head	pwqs;		/* FN: pwqs active since last flush */
+};
+
 /*
  * The externally visible workqueue.  It relays the issued work items to
  * the appropriate worker_pool through its pool_workqueues.
@@ -360,6 +379,7 @@ struct workqueue_struct {
 	struct wq_flusher	*first_flusher;	/* WQ: first flusher */
 	struct list_head	flusher_queue;	/* WQ: flush waiters */
 	struct list_head	flusher_overflow; /* WQ: flush overflow list */
+	struct wq_flush_pnode	**flush_pnodes; /* I: per-node flush membership */
 
 	struct list_head	maydays;	/* MD: pwqs requesting rescue */
 	struct worker		*rescuer;	/* MD: rescue worker */
@@ -1658,6 +1678,22 @@ static struct wq_node_nr_active *wq_node_nr_active(struct workqueue_struct *wq,
 	return wq->node_nr_active[node];
 }
 
+/**
+ * wq_flush_pnode - Determine wq_flush_pnode to use
+ * @wq: workqueue of interest
+ * @node: NUMA node, can be %NUMA_NO_NODE
+ *
+ * Return @wq's wq_flush_pnode for @node, the nr_node_ids fallback if @node is
+ * %NUMA_NO_NODE.
+ */
+static struct wq_flush_pnode *wq_flush_pnode(struct workqueue_struct *wq, int node)
+{
+	if (node == NUMA_NO_NODE)
+		node = nr_node_ids;
+
+	return wq->flush_pnodes[node];
+}
+
 /**
  * wq_update_node_max_active - Update per-node max_actives to use
  * @wq: workqueue to update
@@ -2473,6 +2509,20 @@ static void __queue_work(int cpu, struct workqueue_struct *wq,
 	if (WARN_ON(!list_empty(&work->entry)))
 		goto out;
 
+	/*
+	 * Add @pwq to its wq_flush_pnode list if off it. Syncing ->work_color
+	 * in the same fpn->lock section is what keeps a concurrent flush from
+	 * missing @work, see wq_flush_pnode.
+	 */
+	if (unlikely(list_empty(&pwq->flush_node))) {
+		struct wq_flush_pnode *fpn = wq_flush_pnode(wq, pool->node);
+
+		raw_spin_lock(&fpn->lock);
+		pwq->work_color = fpn->work_color;
+		list_add_tail(&pwq->flush_node, &fpn->pwqs);
+		raw_spin_unlock(&fpn->lock);
+	}
+
 	pwq_inc_nr_in_flight(pwq, pwq->work_color);
 	work_flags = work_color_to_flags(pwq->work_color);
 
@@ -4049,6 +4099,14 @@ static void insert_wq_barrier(struct pool_workqueue *pwq,
 		__set_bit(WORK_STRUCT_LINKED_BIT, bits);
 	}
 
+	/*
+	 * Flushes must wait for barriers too as a barrier pins @pwq and a
+	 * worker until it runs and destroy_workqueue()'s drain relies on that.
+	 * @target being in flight keeps @pwq on its wq_flush_pnode list, so no
+	 * need to add it here.
+	 */
+	WARN_ON_ONCE(list_empty(&pwq->flush_node));
+
 	pwq_inc_nr_in_flight(pwq, work_color);
 	work_flags |= work_color_to_flags(work_color);
 
@@ -4061,23 +4119,23 @@ static void insert_wq_barrier(struct pool_workqueue *pwq,
  * @flush_color: new flush color, < 0 for no-op
  * @work_color: new work color, < 0 for no-op
  *
- * Prepare pwqs for workqueue flushing.
+ * Prepare pwqs for workqueue flushing. Only the pwqs on @wq's wq_flush_pnode
+ * lists, which have been active since the last flush, are visited.
  *
- * If @flush_color is non-negative, flush_color on all pwqs should be
- * -1.  If no pwq has in-flight commands at the specified color, all
- * pwq->flush_color's stay at -1 and %false is returned.  If any pwq
- * has in flight commands, its pwq->flush_color is set to
- * @flush_color, @wq->nr_pwqs_to_flush is updated accordingly, pwq
- * wakeup logic is armed and %true is returned.
+ * If @flush_color >= 0, flush_color on all visited pwqs should be -1. If no
+ * visited pwq has in-flight work items at the specified color, all
+ * pwq->flush_color's stay at -1 and return %false. If any visited pwq has
+ * in-flight work items, set its pwq->flush_color to @flush_color, update
+ * @wq->nr_pwqs_to_flush accordingly, arm pwq wakeup logic and return %true.
  *
- * The caller should have initialized @wq->first_flusher prior to
- * calling this function with non-negative @flush_color.  If
- * @flush_color is negative, no flush color update is done and %false
- * is returned.
+ * The caller should have initialized @wq->first_flusher prior to calling this
+ * function with non-negative @flush_color. If @flush_color < 0, no flush color
+ * update is done and %false is returned.
  *
- * If @work_color is non-negative, all pwqs should have the same
- * work_color which is previous to @work_color and all will be
- * advanced to @work_color.
+ * If @work_color >= 0, all visited pwqs and every wq_flush_pnode's work color
+ * mirror are advanced to @work_color. The mirrors of nodes with no active pwqs
+ * must be advanced too as a pwq added to a list later stamps the color it reads
+ * from the mirror.
  *
  * CONTEXT:
  * mutex_lock(wq->mutex).
@@ -4089,50 +4147,81 @@ static void insert_wq_barrier(struct pool_workqueue *pwq,
 static bool flush_workqueue_prep_pwqs(struct workqueue_struct *wq,
 				      int flush_color, int work_color)
 {
+	struct pool_workqueue *pwq, *next;
 	bool wait = false;
-	struct pool_workqueue *pwq;
-	struct worker_pool *current_pool = NULL;
+	int node;
 
 	if (flush_color >= 0) {
 		WARN_ON_ONCE(atomic_read(&wq->nr_pwqs_to_flush));
 		atomic_set(&wq->nr_pwqs_to_flush, 1);
 	}
 
-	/*
-	 * For unbound workqueue, pwqs will map to only a few pools.
-	 * Most of the time, pwqs within the same pool will be linked
-	 * sequentially to wq->pwqs by cpu index. So in the majority
-	 * of pwq iters, the pool is the same, only doing lock/unlock
-	 * if the pool has changed. This can largely reduce expensive
-	 * lock operations.
-	 */
-	for_each_pwq(pwq, wq) {
-		if (current_pool != pwq->pool) {
-			if (likely(current_pool))
-				raw_spin_unlock_irq(&current_pool->lock);
-			current_pool = pwq->pool;
-			raw_spin_lock_irq(&current_pool->lock);
+	for_each_node_with_fallback(node) {
+		struct wq_flush_pnode *fpn = wq->flush_pnodes[node];
+		struct worker_pool *current_pool = NULL;
+		LIST_HEAD(to_visit);
+		LIST_HEAD(to_keep);
+
+		/*
+		 * Advance the node's color mirror and take its active pwqs.
+		 * Work items queued to off-list pwqs afterwards carry the new
+		 * color and don't need visiting.
+		 */
+		raw_spin_lock_irq(&fpn->lock);
+		if (work_color >= 0) {
+			WARN_ON_ONCE(work_color != work_next_color(fpn->work_color));
+			fpn->work_color = work_color;
 		}
+		list_splice_init(&fpn->pwqs, &to_visit);
+		raw_spin_unlock_irq(&fpn->lock);
+
+		/*
+		 * Unbound workqueues map multiple pwqs to one pool. Only cycle
+		 * pool->lock when the pool changes.
+		 */
+		list_for_each_entry_safe(pwq, next, &to_visit, flush_node) {
+			if (current_pool != pwq->pool) {
+				if (likely(current_pool))
+					raw_spin_unlock_irq(&current_pool->lock);
+				current_pool = pwq->pool;
+				raw_spin_lock_irq(&current_pool->lock);
+			}
 
-		if (flush_color >= 0) {
-			WARN_ON_ONCE(pwq->flush_color != -1);
+			if (flush_color >= 0) {
+				WARN_ON_ONCE(pwq->flush_color != -1);
 
-			if (pwq->nr_in_flight[flush_color]) {
-				pwq->flush_color = flush_color;
-				atomic_inc(&wq->nr_pwqs_to_flush);
-				wait = true;
+				if (pwq->nr_in_flight[flush_color]) {
+					pwq->flush_color = flush_color;
+					atomic_inc(&wq->nr_pwqs_to_flush);
+					wait = true;
+				}
 			}
-		}
 
-		if (work_color >= 0) {
-			WARN_ON_ONCE(work_color != work_next_color(pwq->work_color));
-			pwq->work_color = work_color;
+			if (work_color >= 0) {
+				WARN_ON_ONCE(work_color != work_next_color(pwq->work_color));
+				pwq->work_color = work_color;
+			}
+
+			/*
+			 * A cascade can arm a color retired several advances
+			 * ago, so keep a pwq listed while any color has work
+			 * items in flight.
+			 */
+			if (pwq->total_in_flight)
+				list_move_tail(&pwq->flush_node, &to_keep);
+			else
+				list_del_init(&pwq->flush_node);
 		}
 
-	}
+		if (current_pool)
+			raw_spin_unlock_irq(&current_pool->lock);
 
-	if (current_pool)
-		raw_spin_unlock_irq(&current_pool->lock);
+		if (!list_empty(&to_keep)) {
+			raw_spin_lock_irq(&fpn->lock);
+			list_splice_tail(&to_keep, &fpn->pwqs);
+			raw_spin_unlock_irq(&fpn->lock);
+		}
+	}
 
 	if (flush_color >= 0 && atomic_dec_and_test(&wq->nr_pwqs_to_flush))
 		complete(&wq->first_flusher->done);
@@ -5129,6 +5218,47 @@ static int alloc_node_nr_active(struct wq_node_nr_active **nna_ar)
 	return -ENOMEM;
 }
 
+static void free_flush_pnodes(struct workqueue_struct *wq)
+{
+	int node;
+
+	if (!wq->flush_pnodes)
+		return;
+
+	for_each_node_with_fallback(node)
+		kfree(wq->flush_pnodes[node]);
+	kfree(wq->flush_pnodes);
+	wq->flush_pnodes = NULL;
+}
+
+static int alloc_flush_pnodes(struct workqueue_struct *wq)
+{
+	struct wq_flush_pnode *fpn;
+	int node;
+
+	wq->flush_pnodes = kcalloc(nr_node_ids + 1, sizeof(*wq->flush_pnodes), GFP_KERNEL);
+	if (!wq->flush_pnodes)
+		return -ENOMEM;
+
+	for_each_node_with_fallback(node) {
+		fpn = kzalloc_node(sizeof(*fpn), GFP_KERNEL,
+				   node < nr_node_ids ? node : NUMA_NO_NODE);
+		if (!fpn)
+			goto err_free;
+
+		raw_spin_lock_init(&fpn->lock);
+		fpn->work_color = wq->work_color;
+		INIT_LIST_HEAD(&fpn->pwqs);
+		wq->flush_pnodes[node] = fpn;
+	}
+
+	return 0;
+
+err_free:
+	free_flush_pnodes(wq);
+	return -ENOMEM;
+}
+
 static void rcu_free_wq(struct rcu_head *rcu)
 {
 	struct workqueue_struct *wq =
@@ -5137,6 +5267,7 @@ static void rcu_free_wq(struct rcu_head *rcu)
 	if (wq->flags & WQ_UNBOUND)
 		free_node_nr_active(wq->node_nr_active);
 
+	free_flush_pnodes(wq);
 	wq_free_lockdep(wq);
 	free_percpu(wq->cpu_pwq);
 	free_workqueue_attrs(wq->attrs);
@@ -5317,6 +5448,19 @@ static void pwq_release_workfn(struct kthread_work *work)
 		list_del_rcu(&pwq->pwqs_node);
 		is_last = list_empty(&wq->pwqs);
 
+		/*
+		 * An idle pwq can linger on its wq_flush_pnode list until the
+		 * next flush. wq->mutex excludes flushers, which never drop it
+		 * with pwqs on their private lists.
+		 */
+		if (!list_empty(&pwq->flush_node)) {
+			struct wq_flush_pnode *fpn = wq_flush_pnode(wq, pool->node);
+
+			raw_spin_lock_irq(&fpn->lock);
+			list_del_init(&pwq->flush_node);
+			raw_spin_unlock_irq(&fpn->lock);
+		}
+
 		/*
 		 * For ordered workqueue with a plugged dfl_pwq, restart it now.
 		 */
@@ -5367,6 +5511,7 @@ static void init_pwq(struct pool_workqueue *pwq, struct workqueue_struct *wq,
 	pwq->refcnt = 1;
 	INIT_LIST_HEAD(&pwq->inactive_works);
 	INIT_LIST_HEAD(&pwq->pending_node);
+	INIT_LIST_HEAD(&pwq->flush_node);
 	INIT_LIST_HEAD(&pwq->pwqs_node);
 	INIT_LIST_HEAD(&pwq->mayday_node);
 	kthread_init_work(&pwq->release_work, pwq_release_workfn);
@@ -5982,6 +6127,9 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 
 	INIT_LIST_HEAD(&wq->list);
 
+	if (alloc_flush_pnodes(wq) < 0)
+		goto err_free_wq;
+
 	if (flags & WQ_UNBOUND) {
 		if (alloc_node_nr_active(wq->node_nr_active) < 0)
 			goto err_free_wq;
@@ -6025,6 +6173,7 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 		free_node_nr_active(wq->node_nr_active);
 err_free_wq:
 	free_workqueue_attrs(wq->attrs);
+	free_flush_pnodes(wq);
 	kfree(wq);
 	return NULL;
 err_unlock_destroy:
-- 
2.55.0

