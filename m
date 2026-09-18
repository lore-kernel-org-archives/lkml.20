Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EC23876A1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741558; cv=none; b=Ct+1FgF3bkHtPOohs54RFFRrYMObmjA598e3scBim/HLwDbH7bjsf1HD3L6qRH143NxX5ELG8V80l0AGzD47hFlW5+s8IzY9OARjG++IhjKyPNqZ9JiSZlIe1M4EudbB0706ihhx++NQSQy5uozkkSUNolct7VLiK2hciJ2s4ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741558; c=relaxed/simple;
	bh=iTP33CeJKSOUaA/Zn+hMtqQTpJaAZgbgUaQmX+iMFoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o2PrQyP38neNBZJGaWo5sbHm0sXKnCEa+6t57NCKcrxs+MuKVCbd4YfgM9EVEpdzavM5TdrP4VS9xzhJhZbTTmDID1UQKU4TTyx83ma32eX3HE3paR1M8cS38uv8EUWnVjTVR0ZyQFUUnRlUK4preoufsQkcik5enkrMXRhl/6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=s2UA+mvK; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="s2UA+mvK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=6NMW/Nho9XykeGyvUq9sJtzumS4a/caq3j8CGCoh14c=; b=s2UA+mvK+RbpxcInGx+KuYOnxX
	+R8AhDRa5YnNcPygQQN50E/QqegF4AcIYeko+OdscXdP6v1rVLfs3RhVAtIYh95YR+4mYozCnZ61u
	cOcGg+ZObm9oWn5f0kSPGsD0yw7VC022Exh/x36zJ2n3AKvlh1vvWp+e9DxGtAGkwKebt3BQs84mH
	kF0oFH5S+x9KuWOGwqPHPyooMCvSMmfFoyFIJtHgj66f1AqqYLHQe01xdTJ12SbMyKtB0mFF+MVji
	QKBeByIIWnL9zyjqEbFqPHO7bffQ0DoQXLXkf70nzcgpqI9cYL6QxEN6wEm7I922hQdkqSAIqo5Gb
	ef9FdhiQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x7ZXC-006n9S-1v;
	Fri, 18 Sep 2026 14:25:50 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 18 Sep 2026 07:25:35 -0700
Subject: [PATCH RFC 3/3] workqueue: Back every workqueue with the unbound
 machinery
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-wq_final-v1-3-5c43c08a26bc@debian.org>
References: <20260918-wq_final-v1-0-5c43c08a26bc@debian.org>
In-Reply-To: <20260918-wq_final-v1-0-5c43c08a26bc@debian.org>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, marco.crivellari@suse.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=7438; i=leitao@debian.org;
 h=from:subject:message-id; bh=iTP33CeJKSOUaA/Zn+hMtqQTpJaAZgbgUaQmX+iMFoU=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqrUngbNYbvrcs+33qNAzq0PcOOWAQFRoExrebk
 srJHLB02u+JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaq1J4AAKCRA1o5Of/Hh3
 bdVaD/4zMPzA/UkNQX+nrxJVMSFOYqp/gD7D58glzMD21ebpqS3MgQiPU6UzlQqaEKFjgtp6K4X
 8zA2lFTx+gt2Hqmz6t3GjhyKde/+j2+MW5pJE/dVZ1Z3rsN5VJ+rd3nuBhvBouMDtGMgxe94ID7
 5aZltYbCa+19m8/y78Nr+lvP9EwHHy+31Nq8ahXk+JGTAiKP8MABun/CkfqBJOTrPerBa9oVACe
 vfNs5iUFf4x1Bki8wcYlzL7LEEWlckoAaHdkyE6i2ZCFIFTt691yDOAiV9WcDG6SUG5ZzTiasvH
 U3JWR5dU6jDsln74+wK7EP4uOYGoEhqn/UtIZ3r/MNrIXcjTAIR0CkGj1qsQf7P9mjeQayw90tL
 YyUbZJ51cMNLXMSpqc1HY67I04rdYxlIZO67b9H8uLSONzgbmtRQWSQTwARu3JUGfg/dKc3FSYe
 W+zv/RbhM55+MjDrn9FmJRlcSyenjT3YgGCQzuzkeY0fh2yn6oG46qQKAeuflTxxFu4TOpDcoiM
 3Atj0TyXTpAcGCtQrGQrJmHkNQEwXozR+N5y5jHnKfrb/B4ri0CH/ivK4ng+8ab96+90IAKw2+I
 Ih8EFGk+7boxNQBDPPGxiaFXbl04hWUjhRvePOWFch5ZQmxfQ3sV1Fev0lwS8/x4zdcvw1rA5Je
 DbLpFbT1YKUjWyg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Now all workqueues will be WQ_UNBOUND, including WQ_PERCPU, and
the attributes will define the affinity and concurrency management.

It gives WQ_PERCPU a single meaning. It no longer selects per-cpu pools;
it only asserts "this workqueue is concurrency managed and may not leave
that backend."

This opens up space for a lot of optimizations down the line, but I want
to stop here to discuss if this is the right approach.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 kernel/workqueue.c | 51 +++++++++++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index f86e8d0770ca22..da4d3e6cc5ee91 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -1669,7 +1669,7 @@ static bool is_percpu_pool(struct worker_pool *pool)
 static struct wq_node_nr_active *wq_node_nr_active(struct workqueue_struct *wq,
 						   int node)
 {
-	BUG_ON(!(wq->flags & WQ_UNBOUND));
+	BUG_ON(wq->flags & WQ_PERCPU);
 
 	if (node == NUMA_NO_NODE)
 		node = nr_node_ids;
@@ -2453,10 +2453,10 @@ static void __queue_work(int cpu, struct workqueue_struct *wq,
 retry:
 	/* pwq which will be used unless @work is executing elsewhere */
 	if (req_cpu == WORK_CPU_UNBOUND) {
-		if (wq->flags & WQ_UNBOUND)
-			cpu = wq_select_unbound_cpu(raw_smp_processor_id());
-		else
+		if (wq->flags & WQ_PERCPU)
 			cpu = raw_smp_processor_id();
+		else
+			cpu = wq_select_unbound_cpu(raw_smp_processor_id());
 	}
 
 	pwq = rcu_dereference(*per_cpu_ptr(wq->cpu_pwq, cpu));
@@ -2500,7 +2500,7 @@ static void __queue_work(int cpu, struct workqueue_struct *wq,
 	 * on it, so the retrying is guaranteed to make forward-progress.
 	 */
 	if (unlikely(!pwq->refcnt)) {
-		if (wq->flags & WQ_UNBOUND) {
+		if (!(wq->flags & WQ_PERCPU)) {
 			raw_spin_unlock(&pool->lock);
 			cpu_relax();
 			goto retry;
@@ -2669,7 +2669,7 @@ bool queue_work_node(int node, struct workqueue_struct *wq,
 	 * workqueue_select_cpu_near would need to be updated to allow for
 	 * some round robin type logic.
 	 */
-	WARN_ON_ONCE(!(wq->flags & WQ_UNBOUND));
+	WARN_ON_ONCE(wq->flags & WQ_PERCPU);
 
 	local_irq_save(irq_flags);
 
@@ -5297,7 +5297,7 @@ static void rcu_free_wq(struct rcu_head *rcu)
 	struct workqueue_struct *wq =
 		container_of(rcu, struct workqueue_struct, rcu);
 
-	if (wq->flags & WQ_UNBOUND)
+	if (!(wq->flags & WQ_PERCPU))
 		free_node_nr_active(wq->node_nr_active);
 
 	free_flush_pnodes(wq);
@@ -5799,7 +5799,7 @@ static void apply_wqattrs_commit(struct apply_wqattrs_ctx *ctx)
 		ctx->dfl_pwq = install_pwq(ctx->wq, -1, ctx->dfl_pwq);
 
 	/* update node_nr_active->max, which only unbound workqueues have */
-	if (ctx->wq->flags & WQ_UNBOUND)
+	if (!(ctx->wq->flags & WQ_PERCPU))
 		wq_update_node_max_active(ctx->wq, -1);
 
 	mutex_unlock(&ctx->wq->mutex);
@@ -5841,8 +5841,8 @@ int apply_workqueue_attrs(struct workqueue_struct *wq,
 {
 	int ret;
 
-	/* only unbound workqueues can change attributes */
-	if (WARN_ON(!(wq->flags & WQ_UNBOUND)))
+	/* a percpu workqueue is pinned to the concurrency managed backend */
+	if (WARN_ON(wq->flags & WQ_PERCPU))
 		return -EINVAL;
 
 	/* concurrency management comes from WQ_PERCPU, it is not applied */
@@ -5882,7 +5882,7 @@ static void unbound_wq_update_pwq(struct workqueue_struct *wq, int cpu)
 
 	lockdep_assert_held(&wq_pool_mutex);
 
-	if (!(wq->flags & WQ_UNBOUND) || wq->attrs->ordered)
+	if (wq->attrs->ordered || wq->attrs->concurrency_managed)
 		return;
 
 	/*
@@ -6085,7 +6085,7 @@ static void wq_adjust_max_active(struct workqueue_struct *wq)
 	WRITE_ONCE(wq->min_active, new_min);
 	WRITE_ONCE(wq->percpu_max_active, new_max);
 
-	if (wq->flags & WQ_UNBOUND)
+	if (!(wq->flags & WQ_PERCPU))
 		wq_update_node_max_active(wq, -1);
 
 	if (new_max == 0)
@@ -6170,6 +6170,13 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 		flags &= ~WQ_PERCPU;
 	}
 
+	/*
+	 * Every workqueue is backed by the unbound machinery now. WQ_PERCPU no
+	 * longer picks a backend, it only says the workqueue is concurrency
+	 * managed and may not leave that backend.
+	 */
+	flags |= WQ_UNBOUND;
+
 	if (flags & WQ_BH) {
 		/*
 		 * BH workqueues always share a single execution context per CPU
@@ -6200,7 +6207,7 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 	if (alloc_flush_pnodes(wq) < 0)
 		goto err_free_wq;
 
-	if (flags & WQ_UNBOUND) {
+	if (!(flags & WQ_PERCPU)) {
 		if (alloc_node_nr_active(wq->node_nr_active) < 0)
 			goto err_free_wq;
 	}
@@ -6239,7 +6246,7 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 	 */
 	if (pwq_release_worker)
 		kthread_flush_worker(pwq_release_worker);
-	if (wq->flags & WQ_UNBOUND)
+	if (!(wq->flags & WQ_PERCPU))
 		free_node_nr_active(wq->node_nr_active);
 err_free_wq:
 	free_workqueue_attrs(wq->attrs);
@@ -6488,8 +6495,7 @@ EXPORT_SYMBOL_GPL(workqueue_set_max_active);
 void workqueue_set_min_active(struct workqueue_struct *wq, int min_active)
 {
 	/* min_active is only meaningful for non-ordered unbound workqueues */
-	if (WARN_ON((wq->flags & (WQ_BH | WQ_UNBOUND | __WQ_ORDERED)) !=
-		    WQ_UNBOUND))
+	if (WARN_ON(wq->flags & (WQ_BH | WQ_PERCPU | __WQ_ORDERED)))
 		return;
 
 	mutex_lock(&wq->mutex);
@@ -7185,7 +7191,7 @@ int workqueue_online_cpu(unsigned int cpu)
 	list_for_each_entry(wq, &workqueues, list) {
 		struct workqueue_attrs *attrs = wq->attrs;
 
-		if (wq->flags & WQ_UNBOUND) {
+		if (!(wq->flags & WQ_PERCPU)) {
 			const struct wq_pod_type *pt = wqattrs_pod_type(attrs);
 			int tcpu;
 
@@ -7220,7 +7226,7 @@ int workqueue_offline_cpu(unsigned int cpu)
 	list_for_each_entry(wq, &workqueues, list) {
 		struct workqueue_attrs *attrs = wq->attrs;
 
-		if (wq->flags & WQ_UNBOUND) {
+		if (!(wq->flags & WQ_PERCPU)) {
 			const struct wq_pod_type *pt = wqattrs_pod_type(attrs);
 			int tcpu;
 
@@ -7395,7 +7401,8 @@ static int workqueue_apply_unbound_cpumask(const cpumask_var_t unbound_cpumask)
 	lockdep_assert_held(&wq_pool_mutex);
 
 	list_for_each_entry(wq, &workqueues, list) {
-		if (!(wq->flags & WQ_UNBOUND) || (wq->flags & __WQ_DESTROYING))
+		if ((wq->flags & __WQ_DESTROYING) ||
+		    wq->attrs->concurrency_managed)
 			continue;
 
 		ctx = apply_wqattrs_prepare(wq, wq->attrs, unbound_cpumask);
@@ -7556,7 +7563,7 @@ static ssize_t per_cpu_show(struct device *dev, struct device_attribute *attr,
 {
 	struct workqueue_struct *wq = dev_to_wq(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", (bool)!(wq->flags & WQ_UNBOUND));
+	return scnprintf(buf, PAGE_SIZE, "%d\n", (bool)(wq->flags & WQ_PERCPU));
 }
 static DEVICE_ATTR_RO(per_cpu);
 
@@ -7932,7 +7939,7 @@ int workqueue_sysfs_register(struct workqueue_struct *wq)
 		return ret;
 	}
 
-	if (wq->flags & WQ_UNBOUND) {
+	if (!(wq->flags & WQ_PERCPU)) {
 		struct device_attribute *attr;
 
 		for (attr = wq_sysfs_unbound_attrs; attr->attr.name; attr++) {
@@ -8800,7 +8807,7 @@ void __init workqueue_init_topology(void)
 	list_for_each_entry(wq, &workqueues, list) {
 		for_each_online_cpu(cpu)
 			unbound_wq_update_pwq(wq, cpu);
-		if (wq->flags & WQ_UNBOUND) {
+		if (!(wq->flags & WQ_PERCPU)) {
 			mutex_lock(&wq->mutex);
 			wq_update_node_max_active(wq, -1);
 			mutex_unlock(&wq->mutex);

-- 
2.53.0-Meta

