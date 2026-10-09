Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268784C754C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548551; cv=none; b=Vfv/3+baUD8XKGfenRC171pp6UtCNs/E60M/YB8SHdYVwKXjlA15zO5QwnUp5N8unY2wOB1IvHH4uqioKn8tWt6qMFZcnD+SJTw2qn1AsKVzmAaGbWqI/TKnG9jBMM7EOUJPO4HhyoLu/rwggLx3M/4gq23ghkt7q6H4ONNBbY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548551; c=relaxed/simple;
	bh=bAiiMD25FSLWLeKuRcQL+bjhgpnOJ2fZWJ24WpVhZus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BE9YA0l2jn0JqVeUq4VYNwDt/nV84ze873ASUKgn4jCuiIkMVOBRs33r2S0ljfrq8pBmPamYKX/3sOEE2itpl64DqSu19DEZjiXMaSazFbmYaOPTP9Jqnoz+wFJqKJxAkP8z3Z0OiggjRNhVacp2xhT/simDT1jNzrSsymgpnKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=NZw0iS+n; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="NZw0iS+n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=bZhFCYyiIzZj/21j7PWKGyGcymyxo0AhH9/tJkKlnh0=; b=NZw0iS+nchAqLsefEQfvuOVAbp
	uCxwJNbtOISv33dFbe1SpJbolgFiCzM/bbGMbenhIg8xOFdp/FDmuwg5xLbLsUlbC1CgQeb0sa01Y
	a1bh/hTBxx3kdZenT4N0R6AAq3Ek61AHnfAuh1oX1Eq3ZR951Pw0jdQhpfqXxoLA1yxfQ0ouvx5gq
	NF1Fd59lPuSnNXE2ywWN2R2OcoA9tsfi/uwb5JnODMNG/KXRfuOd2QhrxnMOGpxHE/Kgd1IBa/jpq
	jdaJ6xpe29syRu0itlX3/uwSqeq0Vr4766l2aHaQNikI9bw5cTZ/Lbvl4It8o/LQ7InqBfY9LWoff
	shZ03jbw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xF9cE-000Wjn-0f;
	Fri, 09 Oct 2026 12:22:22 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 09 Oct 2026 05:18:35 -0700
Subject: [PATCH wq/for-7.4 v3 2/3] workqueue: Keep the limits of both
 max_active domains current
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-wq_final-v3-2-eb0b095b9de3@debian.org>
References: <20261009-wq_final-v3-0-eb0b095b9de3@debian.org>
In-Reply-To: <20261009-wq_final-v3-0-eb0b095b9de3@debian.org>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, marco.crivellari@suse.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=9283; i=leitao@debian.org;
 h=from:subject:message-id; bh=bAiiMD25FSLWLeKuRcQL+bjhgpnOJ2fZWJ24WpVhZus=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqyNxzG7UAYIlz1CFf9YhhLWTv52tOPE1LJMC0q
 BHwwL9U05WJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCasjccwAKCRA1o5Of/Hh3
 bSp3EACRO893/hF/A9352kBRt4PSv1sIghpaGWVzrtt3GVIU3Zs3ytrUyc+hyZbAEG+DsOoax1v
 LRNrhiqE205Z7OxXyoQwjur5nFETSGAWrPuzkZGHrq79Tl8Nisv4M4jT+XPNjgNSJWY9AVgxGUc
 ICLeGl3Fc7PVbpGOHkizlFwl1cZw2PiCxxOHa8wnlPknv3TZUS1FW6SPpNOzXcC/MHMLNwNvawM
 0mkBT8h0KeBU+3agbOxaE8uny+Wj9p8yDGxIfWjPwbzYPiC+0nBqka8PGczngyS5xVvKFeF4g06
 56JGOAqGMVY59aO8wDLvcJ15tPJJx2sEYMOO41Sdxa8BJ0inBWvwdn/0c1yW3LgxNqfqIpklfaC
 ELEhX94n5k6Xgb8cMIX0ZYTazke5offW4yKCEWZ6Eb4srHU3wlFIzHgNWsAtvSZrW3gycIZonl+
 LKcHNMr2ZvaDmQXlP4y63g9xqYxbALnKdJ3qgUzC22G/6XVDDSHPDrAyOmkaY0tpYxMRfHZw8i6
 FzPUrdhe0B9V9UuuYEKJTToPXbvL6SKc+aI4G7hf4vBSiMqDZr6nmRrevC16UcZ9v27i3jiFVta
 6DPJPMR7ntozyV+EzatopgWagKiIT0KXZpuKDst49Mx65BlJ6LV4h4Hw701JDBcx2kMIqonVieW
 l+Z03BEDbGWnBpw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Commit 27db9dd7f84f3a ("workqueue: Give percpu workqueues their own
max_active") gave the percpu backend a limit of its own, so a workqueue
now carries limits for both scopes, but just one is used today.

Given that we are introducing a new PERCPU affinity scope which will be
able to do CM, we want to keep both values set, so, the transition from
scopes would be able to succeed. This cannot be done under the flip, given
this is RCU protected. See discussion at [1]

The two numbers cannot simply be kept equal. percpu_max_active caps every
CPU on its own, while max_active is a workqueue wide budget distributed
among the nodes with min_active as the per-node floor. A per-CPU limit of
16 on a 64 CPU machine is not a workqueue wide limit of 16.

Use the scale function suggested by Tejun in [1].

N is the online CPUs the unbound backend of the workqueue may actually
use. For a workqueue whose own cpumask has been narrowed, that is
unbound_effective_cpumask(), not the global wq_unbound_cpumask -- the
latter overcounts and makes percpu_max_active come out too low.
wq_update_node_max_active() already distributes max_active the same way;
match it.

Suggested-by: Tejun Heo <tj@kernel.org>
Link: https://lore.kernel.org/all/ec6c22eddc8ce0b1ef2434ed62acd560@kernel.org/ [1]
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 kernel/workqueue.c | 126 +++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 99 insertions(+), 27 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 97d2c9c0a7d6ab..244a199f2dd61a 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -393,6 +393,7 @@ struct workqueue_struct {
 	int			min_active;	/* WO: min active works */
 	int			saved_max_active; /* WQ: saved max_active */
 	int			saved_min_active; /* WQ: saved min_active */
+	int			saved_percpu_max_active; /* WQ: percpu limit */
 
 	struct workqueue_attrs	*attrs;	/* PW: workqueue attributes */
 	struct pool_workqueue __rcu *dfl_pwq;   /* PW: only for unbound wqs */
@@ -421,6 +422,14 @@ struct workqueue_struct {
 	struct wq_node_nr_active *node_nr_active[]; /* I: per-node nr_active */
 };
 
+static int wq_user_max_active(struct workqueue_struct *wq)
+{
+	if (wq->flags & WQ_UNBOUND)
+		return READ_ONCE(wq->saved_max_active);
+
+	return READ_ONCE(wq->saved_percpu_max_active);
+}
+
 /*
  * Each pod type describes how CPUs should be grouped for unbound workqueues.
  * See the comment above workqueue_attrs->affn_scope.
@@ -4549,7 +4558,7 @@ static bool start_flush_work(struct work_struct *work, struct wq_barrier *barr,
 	 * workqueues the deadlock happens when the rescuer stalls, blocking
 	 * forward progress.
 	 */
-	if (!from_cancel && (wq->saved_max_active == 1 || wq->rescuer))
+	if (!from_cancel && (wq_user_max_active(wq) == 1 || wq->rescuer))
 		touch_wq_lockdep_map(wq);
 
 	rcu_read_unlock();
@@ -6031,74 +6040,121 @@ static int init_rescuer(struct workqueue_struct *wq)
 	return 0;
 }
 
+static int wq_nr_online_cpus(const struct cpumask *mask)
+{
+	return max(cpumask_weight_and(mask, cpu_online_mask), 1);
+}
+
+static int wq_nr_effective_cpus(struct workqueue_struct *wq)
+{
+	lockdep_assert_held(&wq->mutex);
+
+	if (!installed_pwq(wq, -1))
+		return wq_nr_online_cpus(wq_unbound_cpumask);
+
+	return wq_nr_online_cpus(unbound_effective_cpumask(wq));
+}
+
+static int wq_scale_to_unbound(int percpu_max, int nr_cpus)
+{
+	return min_t(s64, (s64)percpu_max * nr_cpus, WQ_MAX_ACTIVE);
+}
+
+static int wq_scale_to_percpu(int max_active, int min_active, int nr_cpus)
+{
+	return max(DIV_ROUND_UP(max_active, nr_cpus), min_active);
+}
+
+static void wq_init_bh_max_active(struct workqueue_struct *wq)
+{
+	wq->max_active = INT_MAX;
+	wq->min_active = INT_MAX;
+	wq->percpu_max_active = INT_MAX;
+	wq->saved_max_active = INT_MAX;
+	wq->saved_min_active = INT_MAX;
+	wq->saved_percpu_max_active = INT_MAX;
+}
+
 static void wq_init_max_active(struct workqueue_struct *wq, int max_active)
 {
 	int effective_max_active;
+	int nr_cpus = wq_nr_online_cpus(wq_unbound_cpumask);
 
 	if (wq->flags & WQ_BH) {
 		/*
 		 * BH workqueues always share a single execution context per CPU
 		 * and don't impose any max_active limit.
 		 */
-		effective_max_active = INT_MAX;
-	} else {
-		effective_max_active = max_active ?: WQ_DFL_ACTIVE;
-		effective_max_active = wq_clamp_max_active(effective_max_active,
-							   wq->flags, wq->name);
+		wq_init_bh_max_active(wq);
+		return;
 	}
 
+	effective_max_active = max_active ?: WQ_DFL_ACTIVE;
+	effective_max_active = wq_clamp_max_active(effective_max_active,
+						   wq->flags, wq->name);
+
 	if (wq->flags & WQ_UNBOUND) {
 		wq->max_active = effective_max_active;
 		wq->min_active = min(effective_max_active, WQ_DFL_MIN_ACTIVE);
-		wq->saved_min_active = wq->min_active;
+		wq->percpu_max_active =
+			wq_scale_to_percpu(effective_max_active, wq->min_active,
+					   nr_cpus);
 	} else {
 		wq->percpu_max_active = effective_max_active;
+		wq->max_active =
+			wq_scale_to_unbound(effective_max_active, nr_cpus);
+		wq->min_active = effective_max_active;
 	}
-	wq->saved_max_active = effective_max_active;
+
+	wq->saved_max_active = wq->max_active;
+	wq->saved_min_active = wq->min_active;
+	wq->saved_percpu_max_active = wq->percpu_max_active;
 }
 
 /**
  * wq_adjust_max_active - update a wq's max_active to the current setting
  * @wq: target workqueue
  *
- * If @wq isn't freezing, set the limit that applies to @wq's backing to the
- * saved_max_active and activate inactive work items accordingly. If @wq is
- * freezing, clear it to zero.
+ * If @wq isn't freezing, publish the saved limits of both domains and activate
+ * inactive work items accordingly. If @wq is freezing, clear them to zero.
  */
 static void wq_adjust_max_active(struct workqueue_struct *wq)
 {
+	int new_max, new_min, new_percpu_max;
 	bool activated;
-	int new_max, new_min;
 
 	lockdep_assert_held(&wq->mutex);
 
 	if ((wq->flags & WQ_FREEZABLE) && workqueue_freezing) {
 		new_max = 0;
 		new_min = 0;
+		new_percpu_max = 0;
 	} else {
 		new_max = wq->saved_max_active;
 		new_min = wq->saved_min_active;
+		new_percpu_max = wq->saved_percpu_max_active;
 	}
 
 	/*
-	 * Update the limit and then kick inactive work items if more active
+	 * Update both domains and then kick inactive work items if more active
 	 * work items are allowed. This doesn't break work item ordering
 	 * because new work items are always queued behind existing inactive
 	 * work items if there are any.
+	 *
+	 * Which domain a pwq honours follows its pool, see
+	 * pwq_tryinc_nr_active(). Keeping both current means a pwq is never
+	 * metered against a limit nobody set.
 	 */
-	if (wq->flags & WQ_UNBOUND) {
-		if (wq->max_active == new_max && wq->min_active == new_min)
-			return;
+	if (wq->max_active == new_max && wq->min_active == new_min &&
+	    wq->percpu_max_active == new_percpu_max)
+		return;
 
-		WRITE_ONCE(wq->max_active, new_max);
-		WRITE_ONCE(wq->min_active, new_min);
-		wq_update_node_max_active(wq, -1);
-	} else {
-		if (wq->percpu_max_active == new_max)
-			return;
+	WRITE_ONCE(wq->max_active, new_max);
+	WRITE_ONCE(wq->min_active, new_min);
+	WRITE_ONCE(wq->percpu_max_active, new_percpu_max);
 
-		WRITE_ONCE(wq->percpu_max_active, new_max);
-	}
+	if (wq->flags & WQ_UNBOUND)
+		wq_update_node_max_active(wq, -1);
 
 	if (new_max == 0)
 		return;
@@ -6448,6 +6504,8 @@ EXPORT_SYMBOL_GPL(destroy_workqueue);
  */
 void workqueue_set_max_active(struct workqueue_struct *wq, int max_active)
 {
+	int nr_cpus;
+
 	/* max_active doesn't mean anything for BH workqueues */
 	if (WARN_ON(wq->flags & WQ_BH))
 		return;
@@ -6459,9 +6517,20 @@ void workqueue_set_max_active(struct workqueue_struct *wq, int max_active)
 
 	mutex_lock(&wq->mutex);
 
-	wq->saved_max_active = max_active;
-	if (wq->flags & WQ_UNBOUND)
+	nr_cpus = wq_nr_effective_cpus(wq);
+
+	if (wq->flags & WQ_UNBOUND) {
+		wq->saved_max_active = max_active;
 		wq->saved_min_active = min(wq->saved_min_active, max_active);
+		wq->saved_percpu_max_active =
+			wq_scale_to_percpu(max_active, wq->saved_min_active,
+					   nr_cpus);
+	} else {
+		wq->saved_percpu_max_active = max_active;
+		wq->saved_max_active = wq_scale_to_unbound(max_active,
+							   nr_cpus);
+		wq->saved_min_active = max_active;
+	}
 
 	wq_adjust_max_active(wq);
 
@@ -6492,6 +6561,9 @@ void workqueue_set_min_active(struct workqueue_struct *wq, int min_active)
 
 	mutex_lock(&wq->mutex);
 	wq->saved_min_active = clamp(min_active, 0, wq->saved_max_active);
+	wq->saved_percpu_max_active =
+		wq_scale_to_percpu(wq->saved_max_active, wq->saved_min_active,
+				   wq_nr_effective_cpus(wq));
 	wq_adjust_max_active(wq);
 	mutex_unlock(&wq->mutex);
 }
@@ -7563,7 +7635,7 @@ static ssize_t max_active_show(struct device *dev,
 {
 	struct workqueue_struct *wq = dev_to_wq(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", wq->saved_max_active);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", wq_user_max_active(wq));
 }
 
 static ssize_t max_active_store(struct device *dev,

-- 
2.53.0-Meta

