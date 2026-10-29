Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277402;
	b=EdLnlKIHbV+QTD2kQOCSbCdKPdCtCoivA6TAUat45lKfCZo9DwRgN0QI+UA1zyeDnHiA
	 57KFcrVKcrY0cJ3MvnW0OO7u0NFz9NCpVE0HntIowhOm+8+5HEDGC/nGO5doqkJFSBnz8
	 z9I6z1LMoq2ERQV+J3x+CH7xYMF2bwFUr1RsGZXkRCMjfHNGJWUZxUc7ywdQiHJBy8bnE
	 c/1DnFpP7Ey2OgOZs3fpUQH4dkY2UPohSRQ8F2Zl7o8i8wJrJn1M8POGzjZhml+02UnlB
	 +siH/0NQMljczmD5TCBDs0RjoVjXtFiu1NTSF1GhK7cop1HcIZTCWj5qf2m/FG90Lfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277402;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=9QRJnpzGaxZn9QpkoDMr2XhCCriEZHGlKeLfmhEAntg=;
	b=iozUEobod9Ua14HEuNshM0TXj3EeL1rg4gglN4Q9QUglCwiS7+XB0eR35zmPReVnyAwi
	 BLGjOOvR5fv3miJ6sZBJuuDSgLOuxn5/y+QbeiwtdNrl4rsVkqsou+oXCggMaS9b4pu3W
	 dp5kX09dwn/ngAe/c+AGgiSDSZ9NeJq9I7ckPJbMWhFsEyGyBr6JjqZ/M32EHn06YpzOU
	 UzoKktnGTPaEbDTGk0OmnrvrzPSXeqI31KoEHmv8q9NU10hSWGR5Y/LAf31jGlny4E8lJ
	 Tb1bh3evrW7pzPKfaUll5BzWWAHtMd3CMwllchbIz75nHvyweewu0Cj4sS7gtBezq9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=FJcL+fjg;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58486606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58486606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=FJcL+fjg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=9QRJnpzGaxZn9QpkoDMr2XhCCriEZHGlKeLfmhEAntg=; b=FJcL+fjgYNhQYLFJ0qL2lC9jgX
	apuWhjZ09TJit6Vr1JKQVukXV9aVAQaY4BA1SYTQ8f03NgTTSL3EpgZKHRdiy74nTo2tbI86rza1H
	LvGW0PEQFoWcdLjzhUZ7WOOXvxCVGBHaYO+/QmPQz4K9RXSqdbk9S3sptNwDu9kLtl3zJvLrXcQO6
	3kjcwF+MTpOb5zewlLbJiZs2crnEZ6G5Wpf4JfhyU8EjTf/BJoXONHjLK2sdynF3OgXJrpY+E//yZ
	iJI/8rb4WZYyMgG8BPfiXOORKjQ6wzGRTFTMncM45jDnATV0HR3oN4S69F8BS319AOmOKjNnMKz6x
	+NlSeWdQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMPN0-0031Xg-2Z;
	Thu, 29 Oct 2026 12:36:39 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 29 Oct 2026 05:33:46 -0700
Subject: [PATCH wq/for-7.5 v4 2/2] workqueue: Keep the limits of both
 max_active domains current
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-wq_final-v4-2-2985ea9f24fd@debian.org>
References: <20261029-wq_final-v4-0-2985ea9f24fd@debian.org>
In-Reply-To: <20261029-wq_final-v4-0-2985ea9f24fd@debian.org>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, marco.crivellari@suse.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=12126; i=leitao@debian.org;
 h=from:subject:message-id; bh=CT31xXwKaspxBoqz+HJpFWPpz0BdC26tuAnHbHqS1HE=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq4z3LWYDm8hr0IS2rJT8LRvrA0P+4a+H7GKd8c
 3qcL2qrE5CJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCauM9ywAKCRA1o5Of/Hh3
 bRwQD/96mQ6UrhwfDV5BNmWaJq9JscWJ6IWAHCz1EqE1Bsv40942Odbug8WopMKTHPSjUAzR2nf
 afSCiWkYDN89JuK3fjCAorvqxyulfbdzcoZCmLJzVdR1qkfNPtwBjhEx2Db3nJigxU5CTOobiXI
 TrbgdVpjUii8eny6EVUhJVLqDnaO9wZh2Uv9gxFBo/89xPcW5GTvTJtJ9jSWukdNdeODAo5w0QH
 vlbEp8WGxmIGMFFxVGfnM0wkjEvemU3DatMlMhzP4KYpEkmNdNGVwy1E/Uq8SmtShckm0Zz+K7B
 7OU/gPK6uyJlZL4CyJA6RU1Ac23Fe2BEm6pg+wNQ72WvJhI96Ur4YK7OrXFpC9sy63HzCey90jE
 f8R2iFNQGfOuU9DZFV8CT3+YwZuWBxs+f2pV20FaFmZWrpCtGHVcD9Exl6v99AUlRN5UzTXnFVh
 DQJeDMjlWBxqQByNTukJzjZnqnAJDVJRmyysjdU0zJrX1CTfDIhipCfgSaVzAjmN2zZWA3NtRzo
 JiOLit9t+egR/xYBP+vfynssbmyi/olr7YHQWkYUQOrIBwFK3my6SiIaEgu6GuJGlFrDQJJAXaP
 8NZT22w3Ayf2MXTE6Gl8RLLZDusyKMob3UCDU3IYJ9bOTd8/t65JP1AutaHx4eYJdalnclV5bZW
 rofKRb/kjuYH3mg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Commit 27db9dd7f84f3a ("workqueue: Give percpu workqueues their own
max_active") gave the percpu backend a limit of its own. A workqueue
carries max_active and min_active for the unbound backend and
percpu_max_active for the percpu one. Only the backend it is created on
gets its limits set. The other stays at zero.

The planned PERCPU affinity scope will let a workqueue switch backends
through its attributes, and a switch should land on a sensible limit.
Derive the other domain whenever the limits of the backend in use are
set.

The two numbers cannot simply be kept equal. percpu_max_active caps every
CPU on its own, while max_active is a workqueue wide budget distributed
among the nodes, with min_active as the per-node floor. A per-CPU limit
of 16 on a 64 CPU machine is not a workqueue wide limit of 16.

Convert between them as Tejun suggested [1]:

  U = unbound max_active, the system-wide target
  L = unbound min_active, the floor on each node
  P = percpu_max_active, the limit on each CPU
  N = online CPUs the workqueue is spread over, at least 1

  Setting P:
    U = min(P * N, WQ_MAX_ACTIVE)
    L = P

  Setting U:
    L = min(L, U)
    P = max(DIV_ROUND_UP(U, N), L)

  Setting L:
    L = clamp(L, 0, U)
    P = max(DIV_ROUND_UP(U, N), L)

For an unbound workqueue, N counts the online CPUs in its effective
cpumask, which wq_update_node_max_active() distributes max_active over.
For a percpu workqueue, N counts the online CPUs in wq_unbound_cpumask,
which an unbound scope would spread it over.

wq_rescale_max_active() does the conversion and publishes the limits
through wq_adjust_max_active(). The setters call it, and so does
apply_wqattrs_commit(), which runs when a workqueue is created and when
its attributes or the unbound cpumask change. workqueue_init_topology()
calls it too, as workqueues created before smp_init() counted only the
boot CPU.

N is not resampled on CPU hotplug, nor for a percpu workqueue when
wq_unbound_cpumask changes. Nothing reads the derived domain yet, and a
scope change goes through apply_wqattrs_commit(), which rederives it.

For a percpu workqueue, saved_max_active now holds the derived unbound
limit. start_flush_work() and max_active_show() want the limit the
workqueue was configured with, so they read it through
wq_user_max_active(). Both read it locklessly, so the saved limits are
written with WRITE_ONCE().

Suggested-by: Tejun Heo <tj@kernel.org>
Link: https://lore.kernel.org/all/ec6c22eddc8ce0b1ef2434ed62acd560@kernel.org/ [1]
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 kernel/workqueue.c | 152 ++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 120 insertions(+), 32 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 826a64c6055d0c..492ff2133c41a2 100644
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
@@ -569,6 +578,7 @@ static int worker_thread(void *__worker);
 static void workqueue_sysfs_unregister(struct workqueue_struct *wq);
 static void show_pwq(struct pool_workqueue *pwq);
 static void show_one_worker_pool(struct worker_pool *pool);
+static void wq_rescale_max_active(struct workqueue_struct *wq);
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/workqueue.h>
@@ -4549,7 +4559,7 @@ static bool start_flush_work(struct work_struct *work, struct wq_barrier *barr,
 	 * workqueues the deadlock happens when the rescuer stalls, blocking
 	 * forward progress.
 	 */
-	if (!from_cancel && (wq->saved_max_active == 1 || wq->rescuer))
+	if (!from_cancel && (wq_user_max_active(wq) == 1 || wq->rescuer))
 		touch_wq_lockdep_map(wq);
 
 	rcu_read_unlock();
@@ -5800,6 +5810,9 @@ static void apply_wqattrs_commit(struct apply_wqattrs_ctx *ctx)
 	if (ctx->wq->flags & WQ_UNBOUND)
 		wq_update_node_max_active(ctx->wq, -1);
 
+	/* derive the other max_active domain for the new effective cpumask */
+	wq_rescale_max_active(ctx->wq);
+
 	mutex_unlock(&ctx->wq->mutex);
 }
 
@@ -6031,6 +6044,42 @@ static int init_rescuer(struct workqueue_struct *wq)
 	return 0;
 }
 
+static int wq_nr_online_cpus(const struct cpumask *mask)
+{
+	return max(cpumask_weight_and(mask, cpu_online_mask), 1);
+}
+
+/* online CPUs an unbound backend of @wq would spread max_active over */
+static int wq_nr_effective_cpus(struct workqueue_struct *wq)
+{
+	lockdep_assert_held(&wq->mutex);
+
+	if (!(wq->flags & WQ_UNBOUND))
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
@@ -6040,65 +6089,69 @@ static void wq_init_max_active(struct workqueue_struct *wq, int max_active)
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
+	/* apply_wqattrs_commit() derives the other domain */
 	if (wq->flags & WQ_UNBOUND) {
 		wq->max_active = effective_max_active;
 		wq->min_active = min(effective_max_active, WQ_DFL_MIN_ACTIVE);
 		wq->saved_min_active = wq->min_active;
+		wq->saved_max_active = effective_max_active;
 	} else {
 		wq->percpu_max_active = effective_max_active;
+		wq->saved_percpu_max_active = effective_max_active;
 	}
-	wq->saved_max_active = effective_max_active;
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
+	 * Both domains are kept current so that a pwq on either kind of pool
+	 * has a valid limit.
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
@@ -6125,6 +6178,37 @@ static void wq_adjust_max_active(struct workqueue_struct *wq)
 	} while (activated);
 }
 
+/*
+ * Derive the saved limits of the max_active domain @wq's backend doesn't use
+ * from those of the one it does, with the current number of usable CPUs, and
+ * publish both.
+ */
+static void wq_rescale_max_active(struct workqueue_struct *wq)
+{
+	int nr_cpus;
+
+	lockdep_assert_held(&wq->mutex);
+
+	/* BH workqueues have no max_active limit in either domain */
+	if (wq->flags & WQ_BH)
+		return;
+
+	nr_cpus = wq_nr_effective_cpus(wq);
+
+	if (wq->flags & WQ_UNBOUND) {
+		WRITE_ONCE(wq->saved_percpu_max_active,
+			   wq_scale_to_percpu(wq->saved_max_active,
+					      wq->saved_min_active, nr_cpus));
+	} else {
+		WRITE_ONCE(wq->saved_max_active,
+			   wq_scale_to_unbound(wq->saved_percpu_max_active,
+					       nr_cpus));
+		wq->saved_min_active = wq->saved_percpu_max_active;
+	}
+
+	wq_adjust_max_active(wq);
+}
+
 __printf(1, 0)
 static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 						  unsigned int flags,
@@ -6459,11 +6543,14 @@ void workqueue_set_max_active(struct workqueue_struct *wq, int max_active)
 
 	mutex_lock(&wq->mutex);
 
-	wq->saved_max_active = max_active;
-	if (wq->flags & WQ_UNBOUND)
+	if (wq->flags & WQ_UNBOUND) {
+		WRITE_ONCE(wq->saved_max_active, max_active);
 		wq->saved_min_active = min(wq->saved_min_active, max_active);
+	} else {
+		WRITE_ONCE(wq->saved_percpu_max_active, max_active);
+	}
 
-	wq_adjust_max_active(wq);
+	wq_rescale_max_active(wq);
 
 	mutex_unlock(&wq->mutex);
 }
@@ -6492,7 +6579,7 @@ void workqueue_set_min_active(struct workqueue_struct *wq, int min_active)
 
 	mutex_lock(&wq->mutex);
 	wq->saved_min_active = clamp(min_active, 0, wq->saved_max_active);
-	wq_adjust_max_active(wq);
+	wq_rescale_max_active(wq);
 	mutex_unlock(&wq->mutex);
 }
 
@@ -7587,7 +7674,7 @@ static ssize_t max_active_show(struct device *dev,
 {
 	struct workqueue_struct *wq = dev_to_wq(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", wq->saved_max_active);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", wq_user_max_active(wq));
 }
 
 static ssize_t max_active_store(struct device *dev,
@@ -8822,11 +8909,12 @@ void __init workqueue_init_topology(void)
 	list_for_each_entry(wq, &workqueues, list) {
 		for_each_online_cpu(cpu)
 			unbound_wq_update_pwq(wq, cpu);
-		if (wq->flags & WQ_UNBOUND) {
-			mutex_lock(&wq->mutex);
+		mutex_lock(&wq->mutex);
+		if (wq->flags & WQ_UNBOUND)
 			wq_update_node_max_active(wq, -1);
-			mutex_unlock(&wq->mutex);
-		}
+		/* early workqueues counted only the boot CPU */
+		wq_rescale_max_active(wq);
+		mutex_unlock(&wq->mutex);
 	}
 
 	mutex_unlock(&wq_pool_mutex);

-- 
2.53.0-Meta

