Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB86481FA0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341829; cv=none; b=beae312/hCI/BswuW7xdYoPOTsDcEObIKuBiyybnzPNchges1ZsItuKQ4PKoU4u8Ta1C+ukKZQ/f15WE5UlKZ53sFXvQ6eJjqBsYDiwzU/2huCYOFILZDGL0WguWrLvly6yajjchnfm/KPydU8YNI+TyL2qKQXMULVP9SiVR/M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341829; c=relaxed/simple;
	bh=k0hnu9BD3w7dvRIyRaInVq6XUQ1RXg34EX+EhVAUxiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZB/VOJvsLG5pQ1tWRgAuVYw49tm77gHtfu1dq2XjK5xXcP6aTv6MXHHVy/114DuiBSB4VGaVdLS8zGfM5AXRJHm0J0D03bQ+pCRaPA6nh8Tpemjnxr63r/tGtBND2xLu0FEZ4Zojp/8QdNiHY6gZp4/jVioKNXc2a/FpF38CboI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=BFxJKsio; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="BFxJKsio"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=rk0FrkstbDnG6iBFsPZMZcbUkxEr/J2jWSlsev5bjjU=; b=BFxJKsioDVw3eEQfUIomMGUdiA
	Ku1srlzm/I+e23yI8TUBlqmIqJut34M/6Aucpl/sSs/fV6yTSjJbIe9RLxPklLg3pi3VrGLQ6fAxm
	38ALM8amhpPwlsAZXaqXeyfXtLsMY3x+tzfMwuxniQZPAMVHV1D/AoUaDvbwJ/jt9rRXz2H2WIlq8
	dZS7k6NKlRAs6UKRtwtnLCQShCA9IQHvNt0ZHGMJlpvlRb+1ZyoUvlBIqMTvUxTfB6kcSTenHivfi
	Wahq80z5o3QtmgFze00aolqsIK0qohhlY/ap1EqWv5XBPbXM1z14Aam3RWCNGORK8HcvBvRh05+AH
	KHfd0fHQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xA5gv-005KHR-1T;
	Fri, 25 Sep 2026 13:10:17 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 25 Sep 2026 06:09:52 -0700
Subject: [PATCH wq/for-7.4 v2 3/3] workqueue: add a
 percpu_concurrency_managed workqueue attribute
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-wq_final-v2-3-860ee052169e@debian.org>
References: <20260925-wq_final-v2-0-860ee052169e@debian.org>
In-Reply-To: <20260925-wq_final-v2-0-860ee052169e@debian.org>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, marco.crivellari@suse.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=5057; i=leitao@debian.org;
 h=from:subject:message-id; bh=k0hnu9BD3w7dvRIyRaInVq6XUQ1RXg34EX+EhVAUxiQ=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqtnKqAGzfDG/Ibu3Uo3R0CBeEoekGnW40iYNM3
 fzNcl9i2UmJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCarZyqgAKCRA1o5Of/Hh3
 bUs/D/sF79AZnKEuCL8Ze5ZQjnqIEoQoGI9xMVb0YHVzfS9BeBsH+k1wEvKl+QFz80kJc5ksBov
 eielOx2hinpgnL2TSQu97Ly/oij6xxrNCQbYy1fvBhi6YMHso8nYDYYdA8z+W65GWccOet/LrDX
 jL/xawOXHh6K8OhdXHQI9FMf1Ad6b8CMHDG4obokY5XpV0USEzvl9m9fbwQcCqIDemQNDVXUVWF
 N4+RJTV3qFqKInN/1jqUiTOQ8J+QOjuAY7MZD2G6cPf/DstxRUH71g2Qwp8H1Q7oCWyvojCi1Sr
 PNFKXZDkLrYMQGXFujIeaqQqxuJjk9s7G5KaaP1KW3vhpqLlgZYe2D/7Gzdbj2b6SldUL5yL8d3
 UYnEy6EM0BVkz8WBbJtnjdw62B5aE3QllmSddOP8KmpQLdERxo3n83GTkodLwmje82wdeE7N4NT
 9mio9NYRlrEAod+ufS06HLeTWCXRTrpfi0GR4b9EO6n5jh4EI0fGYdj4AXef59pFn5SnEYbZd9x
 VLIJzYjKPDLsDRUhuOaweqfSCz47KlXSyYc/PpnirT7Z7aXP2BIPwbq6K70QavVh6cn/LRJnu+S
 bj9GK1xzWVrt7m8qrmK8j3XjajgeXjedgqw4SqTpNS43gdOZPpJB/w/tgbmJ5T8eqfR/C+J8hmY
 RwGg/0MA2cCMLyg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Introduce percpu_concurrency_managed, similar to the discussion in [1],
and use it when deciding to do concurrency management, instead of
relying on WQ_PERCPU (the only WQ type that does CM as of now).

Do not set it for WQ_BH. BH uses static per-cpu pools too, but it forces
max_active to INT_MAX and does not impose the normal max-active
throttle.

The attr is workqueue-only. wqattrs_clear_for_pool() clears it before
attrs are stored in a worker_pool. Pool selection still uses WQ_PERCPU;
attrs do not switch a workqueue onto static per-cpu pools yet.

Link: https://lore.kernel.org/all/8a1437751a6da2c166284b1ca562fb0a@kernel.org/ [1]
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 include/linux/workqueue.h |  9 +++++++++
 kernel/workqueue.c        | 40 ++++++++++++++++++++++++++--------------
 2 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index a283766a192aaf..32747f797c4449 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -204,6 +204,15 @@ struct workqueue_attrs {
 	 */
 	enum wq_affn_scope affn_scope;
 
+	/**
+	 * @percpu_concurrency_managed: use per-cpu concurrency accounting
+	 *
+	 * Workqueues with this set meter active work per CPU against
+	 * percpu_max_active. Workqueues with this clear either use unbound
+	 * max_active accounting or do not impose a max_active limit.
+	 */
+	bool percpu_concurrency_managed;
+
 	/**
 	 * @ordered: work items must be executed one by one in queueing order
 	 */
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 545332d6118159..7059fc1bd9b090 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -424,9 +424,9 @@ struct workqueue_struct {
 
 static int wq_user_max_active(struct workqueue_struct *wq)
 {
-	if (wq->flags & WQ_UNBOUND)
-		return READ_ONCE(wq->saved_max_active);
-	return READ_ONCE(wq->saved_percpu_max_active);
+	if (READ_ONCE(wq->attrs->percpu_concurrency_managed))
+		return READ_ONCE(wq->saved_percpu_max_active);
+	return READ_ONCE(wq->saved_max_active);
 }
 
 /*
@@ -1861,11 +1861,13 @@ static bool pwq_tryinc_nr_active(struct pool_workqueue *pwq, bool fill)
 
 	lockdep_assert_held(&pool->lock);
 
-	/*
-	 * A concurrency-managed per-cpu pool accounts nr_active per pwq, so
-	 * pwq->nr_active against wq->percpu_max_active is sufficient.
-	 */
-	if (is_percpu_pool(pool)) {
+	/* BH workqueues use per-cpu pools but do not throttle max_active. */
+	if (pool->flags & POOL_BH) {
+		obtained = true;
+		goto out;
+	}
+
+	if (READ_ONCE(wq->attrs->percpu_concurrency_managed)) {
 		obtained = pwq->nr_active < READ_ONCE(wq->percpu_max_active);
 		goto out;
 	}
@@ -2091,6 +2093,7 @@ static void node_activate_pending_pwq(struct wq_node_nr_active *nna,
  */
 static void pwq_dec_nr_active(struct pool_workqueue *pwq)
 {
+	struct workqueue_struct *wq = pwq->wq;
 	struct worker_pool *pool = pwq->pool;
 	struct wq_node_nr_active *nna;
 
@@ -2102,16 +2105,15 @@ static void pwq_dec_nr_active(struct pool_workqueue *pwq)
 	 */
 	pwq->nr_active--;
 
-	/*
-	 * A concurrency-managed per-cpu pool only needs to kick the first
-	 * inactive work item on @pwq itself.
-	 */
-	if (is_percpu_pool(pool)) {
+	if (pool->flags & POOL_BH)
+		return;
+
+	if (READ_ONCE(wq->attrs->percpu_concurrency_managed)) {
 		pwq_activate_first_inactive(pwq, false);
 		return;
 	}
 
-	nna = wq_node_nr_active(pwq->wq, pool->node);
+	nna = wq_node_nr_active(wq, pool->node);
 
 	/*
 	 * If @pwq is for an unbound workqueue, it's more complicated because
@@ -5034,6 +5036,7 @@ static void copy_workqueue_attrs(struct workqueue_attrs *to,
 	 * get_unbound_pool() explicitly clears the fields.
 	 */
 	to->affn_scope = from->affn_scope;
+	to->percpu_concurrency_managed = from->percpu_concurrency_managed;
 	to->ordered = from->ordered;
 }
 
@@ -5044,6 +5047,7 @@ static void copy_workqueue_attrs(struct workqueue_attrs *to,
 static void wqattrs_clear_for_pool(struct workqueue_attrs *attrs)
 {
 	attrs->affn_scope = WQ_AFFN_NR_TYPES;
+	attrs->percpu_concurrency_managed = false;
 	attrs->ordered = false;
 	if (attrs->affn_strict)
 		cpumask_copy(attrs->cpumask, cpu_possible_mask);
@@ -5851,6 +5855,10 @@ int apply_workqueue_attrs(struct workqueue_struct *wq,
 	if (WARN_ON(!(wq->flags & WQ_UNBOUND)))
 		return -EINVAL;
 
+	/* Attrs cannot switch a workqueue to per-cpu pools yet. */
+	if (WARN_ON(attrs->percpu_concurrency_managed))
+		return -EINVAL;
+
 	mutex_lock(&wq_pool_mutex);
 	ret = apply_workqueue_attrs_locked(wq, attrs);
 	mutex_unlock(&wq_pool_mutex);
@@ -5942,6 +5950,10 @@ static struct workqueue_attrs *alloc_wq_std_attrs(struct workqueue_struct *wq)
 	if (wq->flags & __WQ_ORDERED)
 		attrs->ordered = true;
 
+	/* BH uses per-cpu pools but not max_active concurrency management. */
+	if ((wq->flags & WQ_PERCPU) && !(wq->flags & WQ_BH))
+		attrs->percpu_concurrency_managed = true;
+
 	return attrs;
 }
 

-- 
2.53.0-Meta

