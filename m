Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EBB49E15A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341824; cv=none; b=puRB7eKx64gkD/yiHpR68dLIngevypPn5+ZQ19z8igis3zgybvPGr0SYAp37pvcvsLu2YE9ac/8BiKU4VqZP/3iORR9nTD10FZ75ekIAO+Dkv7Z7ehSKg2z2vmyxSOv56Fd3COiW5EVChmdrIrxRvvmPJpcUNcukSb1aW2viyTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341824; c=relaxed/simple;
	bh=83QO8hsbbBBhIBxJkof5NxX1xVqKyYGXjmuab4TXNRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gDPMnM9Vk+XKSFdzAZ9wwEeLaLfPXsTIKwuPPy58unsdTXCEJQ6w7/3IUJ2U9PxCIvKophtwf3Nf2fLSU+OMjYoXW6ebZB6a28bcXzrd8SdEZBYHPYodjrWQtDd4Syw8stbgBxi4WDMLKzH6DFUTecQY7n7VdWDe3wkNU+g8Ryg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=OGl/QfV6; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="OGl/QfV6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=DgcwXSNTzVn+aPhhMw6V5JUd1cTzn44VIyELhqMp1go=; b=OGl/QfV6w/CCxK9mcaXK3GiVeb
	sbYcaImO1SN9VHaDF+WRZR/gqgGZyIczY8+8f/iAA2J0UqZId2pcE9uBYX3/GtjuYnerRRUKCLXe8
	s31/0rwkJedYd0r+cmlblJvQdHKBkEVeW5mQBxAAGfD75rnTImPq1OPrkPsMB+vR9hiG9hP6fjgWV
	9vBIBzTbv7lptFrvuISjExIzqAumiDNRfWryrCCuIGgbmefmQV6keypwVuG1FfN9YGLkRmCAd9Uwb
	QwbtWk2Dvg+8LIKPAJdr8fYIfafFeo3M3Gof4OyjHneAmaH60iYbq0DDDAqwbEU/f2PVxd1kf7BPH
	6IqPWCKw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xA5gr-005KHE-2F;
	Fri, 25 Sep 2026 13:10:14 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 25 Sep 2026 06:09:51 -0700
Subject: [PATCH wq/for-7.4 v2 2/3] workqueue: Keep the limits of both
 max_active domains current
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-wq_final-v2-2-860ee052169e@debian.org>
References: <20260925-wq_final-v2-0-860ee052169e@debian.org>
In-Reply-To: <20260925-wq_final-v2-0-860ee052169e@debian.org>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, marco.crivellari@suse.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=8302; i=leitao@debian.org;
 h=from:subject:message-id; bh=83QO8hsbbBBhIBxJkof5NxX1xVqKyYGXjmuab4TXNRQ=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqtnKq3Dp6s1sCDc0Pe7q3h6uu80ac0cYtefWju
 QhfsQHn8JGJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCarZyqgAKCRA1o5Of/Hh3
 bZuGEACU4tyzo4WHkX0+/8KDx1/zO2kWTlDgwaBot1y2SUCxjg0W7aKxBZKcvSSbYX4MSQYTIjR
 n+DBRfT5lsefL5+hpTuicjf2r7u4Wsosg/T7bxOh2d0Eg/kUGtEHsG5nABc8LAB/caFpuSMey4a
 c9y8Dv2TTCidLa5Z0oV8BNvRuWxHH7ZQ47yw0ER4y/+qYIXc6hKiyxeQ6bqxG51t7J5OMtZVhA1
 +qIXcvqUPNkQ/RCynV6JEwfK/4rarNV9j3OWNkn/CdO8qop0pLeS8ZpLzrH/8/Uni9ngW2EvOoU
 8JKLi35JXMwemzw1vnsbvqfiHshJschbEus5y7323FikSj/EUZhLqa5KFGo5yo0gtxn6A36rnPG
 scW3cuFcwZNNlkzdlnqFbFGhEVk9oca0x0z8MdP30WY5HQTBgYf7+ZIME+egvwRpGtToF9/7Sus
 qkggUpQUwU+qKlddpvCR/EhuBTQgTnWSbc8zHIG5IB9LXKy9t2IV3D3sLCDVNyrpCmwBZ4K+QT5
 9rx4BZ5Xxl/B/qW90bE8432EXS4S1yHsnBy/AtiaM+yKmoza8YOW2egMpBDcLXO8OffPSxZGNLx
 HN4yvfVyoUd9fN2lwLo/XoSSBszffdLaPwAz/aWcWJfL1SGP2oTrGaMB5VHnU2SV2xNXv74p5Zj
 Bu8a8WtKFI+51Ew==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Commit 27db9dd7f84f3a ("workqueue: Give percpu workqueues their own
max_active") gave the percpu backend a limit of its own, so a workqueue
now carries limits for two both scopes, but just one is used today.

Given that we are introducing a WQ_AFFN_CPU which will be able to do CM,
we want to keep both values set, so, the transition from scopes would be
able to succeed. This cannot be done under the flip, given this is RCU
protected. See discussion at [1]

The two numbers cannot simply be kept equal. percpu_max_active caps every
CPU on its own, while max_active is a workqueue wide budget distributed
among the nodes with min_active as the per-node floor. A per-CPU limit of
16 on a 64 CPU machine is not a workqueue wide limit of 16.

Use the scale function suggested by Tejun in [1].

Suggested-by: Tejun Heo <tj@kernel.org>
Link: https://lore.kernel.org/all/ec6c22eddc8ce0b1ef2434ed62acd560@kernel.org/ [1]
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 kernel/workqueue.c | 97 +++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 75 insertions(+), 22 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 97d2c9c0a7d6ab..545332d6118159 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -393,6 +393,7 @@ struct workqueue_struct {
 	int			min_active;	/* WO: min active works */
 	int			saved_max_active; /* WQ: saved max_active */
 	int			saved_min_active; /* WQ: saved min_active */
+	int			saved_percpu_max_active; /* WQ: percpu limit */
 
 	struct workqueue_attrs	*attrs;	/* PW: workqueue attributes */
 	struct pool_workqueue __rcu *dfl_pwq;   /* PW: only for unbound wqs */
@@ -421,6 +422,13 @@ struct workqueue_struct {
 	struct wq_node_nr_active *node_nr_active[]; /* I: per-node nr_active */
 };
 
+static int wq_user_max_active(struct workqueue_struct *wq)
+{
+	if (wq->flags & WQ_UNBOUND)
+		return READ_ONCE(wq->saved_max_active);
+	return READ_ONCE(wq->saved_percpu_max_active);
+}
+
 /*
  * Each pod type describes how CPUs should be grouped for unbound workqueues.
  * See the comment above workqueue_attrs->affn_scope.
@@ -4549,7 +4557,7 @@ static bool start_flush_work(struct work_struct *work, struct wq_barrier *barr,
 	 * workqueues the deadlock happens when the rescuer stalls, blocking
 	 * forward progress.
 	 */
-	if (!from_cancel && (wq->saved_max_active == 1 || wq->rescuer))
+	if (!from_cancel && (wq_user_max_active(wq) == 1 || wq->rescuer))
 		touch_wq_lockdep_map(wq);
 
 	rcu_read_unlock();
@@ -6031,9 +6039,25 @@ static int init_rescuer(struct workqueue_struct *wq)
 	return 0;
 }
 
+static int wq_nr_online_cpus(const struct cpumask *mask)
+{
+	return max(cpumask_weight_and(mask, cpu_online_mask), 1);
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
 static void wq_init_max_active(struct workqueue_struct *wq, int max_active)
 {
 	int effective_max_active;
+	int nr_cpus = wq_nr_online_cpus(wq_unbound_cpumask);
 
 	if (wq->flags & WQ_BH) {
 		/*
@@ -6050,55 +6074,69 @@ static void wq_init_max_active(struct workqueue_struct *wq, int max_active)
 	if (wq->flags & WQ_UNBOUND) {
 		wq->max_active = effective_max_active;
 		wq->min_active = min(effective_max_active, WQ_DFL_MIN_ACTIVE);
-		wq->saved_min_active = wq->min_active;
+		wq->percpu_max_active = wq_scale_to_percpu(effective_max_active,
+							   wq->min_active,
+							   nr_cpus);
+	} else if (wq->flags & WQ_BH) {	/* BH implies !WQ_UNBOUND */
+		wq->max_active = effective_max_active;
+		wq->min_active = effective_max_active;
+		wq->percpu_max_active = effective_max_active;
 	} else {
 		wq->percpu_max_active = effective_max_active;
+		wq->max_active = wq_scale_to_unbound(effective_max_active,
+						     nr_cpus);
+		wq->min_active = min(effective_max_active, wq->max_active);
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
@@ -6448,6 +6486,8 @@ EXPORT_SYMBOL_GPL(destroy_workqueue);
  */
 void workqueue_set_max_active(struct workqueue_struct *wq, int max_active)
 {
+	int nr_cpus;
+
 	/* max_active doesn't mean anything for BH workqueues */
 	if (WARN_ON(wq->flags & WQ_BH))
 		return;
@@ -6456,12 +6496,22 @@ void workqueue_set_max_active(struct workqueue_struct *wq, int max_active)
 		return;
 
 	max_active = wq_clamp_max_active(max_active, wq->flags, wq->name);
+	nr_cpus = wq_nr_online_cpus(wq_unbound_cpumask);
 
 	mutex_lock(&wq->mutex);
 
-	wq->saved_max_active = max_active;
-	if (wq->flags & WQ_UNBOUND)
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
+		wq->saved_min_active = min(max_active, wq->saved_max_active);
+	}
 
 	wq_adjust_max_active(wq);
 
@@ -6492,6 +6542,9 @@ void workqueue_set_min_active(struct workqueue_struct *wq, int min_active)
 
 	mutex_lock(&wq->mutex);
 	wq->saved_min_active = clamp(min_active, 0, wq->saved_max_active);
+	wq->saved_percpu_max_active =
+		wq_scale_to_percpu(wq->saved_max_active, wq->saved_min_active,
+				   wq_nr_online_cpus(wq_unbound_cpumask));
 	wq_adjust_max_active(wq);
 	mutex_unlock(&wq->mutex);
 }
@@ -7563,7 +7616,7 @@ static ssize_t max_active_show(struct device *dev,
 {
 	struct workqueue_struct *wq = dev_to_wq(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", wq->saved_max_active);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", wq_user_max_active(wq));
 }
 
 static ssize_t max_active_store(struct device *dev,

-- 
2.53.0-Meta

