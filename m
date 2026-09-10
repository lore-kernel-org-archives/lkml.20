Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF804A0905
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052141; cv=none; b=StRoDjqra578hk7ae7C8UOghRtHGx8fCxzpdcspG6A61LBuh/sY0I81zyPpkppDkvUANOZIzkaX0swRMIhZSvoWyMvOmftA3XMuDysCHWF0pHQ/G6ZwwANAW29E2jeW/NL4YxzxlmDeeLA8Nqi0aNTH4MplgtstUwXCXV8fmoEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052141; c=relaxed/simple;
	bh=iUmX7xwBOdLuORHq56tUAF4FC5C6OctphCzxQIwPX6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dAVgmnEb2/qKb/ucG8G/uwKDI9GtsrZDv5tCAJvdvL2LVfkUeTW1C1RzlWzqFwusTCSLai835xI3SwNjIdRfhzy8vCvg/DXq1baepWqNePGH+qK5AjqeaFLwzAwdRRCjuP1HiZiGdaE5M5KPg1b325z+2xTDtgMBE3tFLvCgdq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=easagslF; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="easagslF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=oz6RGj/PQEpqn4o/qi03F2U5MZb51VPgoSqrIPYTw44=; b=easagslFcwbfCU6Oe719P2qPgk
	nBhiUbWKDum2atxrhZrgcUniTH3Xz+W3Ph9YjIjERjkwDdg8UuuaM2p2wN+6+mndrz0DAr0YlsjxF
	7Nh4vkkPqt2aZ6vPk3DQReXa53DtRSnI8ILZBOHdqLhzKwfWQQowtofFGE8udQZjPOu8srm3W6umG
	DbsG3TtBdIzRkIE613UG00YRSyxQzyRCcKfiIzK+RXpR+jB0LpXN1hGRZHAuwL0ObQBbSSzczdzOF
	wTR2K/UOlDuG5HQFVEnnlWblPuveglBQimAr826qOMM+ehA0Dr1w0nrCMWK8WEwo2NHOJyRuK3OvK
	HxI5BONg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4gBa-000aXr-14;
	Thu, 10 Sep 2026 14:55:34 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 10 Sep 2026 07:54:12 -0700
Subject: [PATCH wq/for-7.4 1/2] workqueue: give percpu workqueues their own
 max_active
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-realsplit_last_v2-v1-1-464d64b71b29@debian.org>
References: <20260910-realsplit_last_v2-v1-0-464d64b71b29@debian.org>
In-Reply-To: <20260910-realsplit_last_v2-v1-0-464d64b71b29@debian.org>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: marco.crivellari@suse.com, linux-kernel@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=4430; i=leitao@debian.org;
 h=from:subject:message-id; bh=iUmX7xwBOdLuORHq56tUAF4FC5C6OctphCzxQIwPX6Y=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqosTfA1nAcaC/elwWgiLJRZuqaQOIEhxXA2O49
 Z0ZHjzArJiJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqLE3wAKCRA1o5Of/Hh3
 bQQ4D/9peq3+3X8dk/AbcsGpMJGnQuROIMxcs2XXknJduu3KmhnJtl0oSQV3Z0DgejnNLmC+w2I
 dIkoTSC8vh19iPKTVGV9EzTCIXTMqvgxIZHzpegN6t+mWry6y7vEr7LTCSJMTz2j2L16kl+vdaV
 zAVu7Atp1OnW8HGaW5pBM8zSd+PgiyTBEeuSHaP6HHHM8vTpDMGCGqxVKCcX16xgCaOQm4PxKcH
 +yeYq6fZwDWIL5YibTv7qiwF5hCcc7D0MjCzK2gwg+BP3H2yonETLhSJAeeb1wAU7Hk8SFhFZ9z
 S5GQ1UlvK7QPOd/bZPG4EpbgIS9r6/mPCFMQu0uqWXLh8YMGpx0pGYWSsiiD9NRfsO4A1zv/4l4
 adObvEMGq76Z45I/Yt75POM68tKIrbXH6N2LxOTBdNMkoDwSSzfGjJyFjQA2/5jZ0xYb1Q90D4e
 meb6LmosxrBfrLyLtGucpp1Rl7utIanK7T9x2aa2g5cmqpmnYXUKfjrXPT866heDhiGkjx2gSD9
 QpbvKxxcdYSohqypQt13ea0ZnRdZ3YghTRMYDKqmC7upjwBCpqmKcI7glfWIa2mEdx1DYGzjjt1
 lz0XsZ1zXTUaZ9ZtAaacci48xk0omYqw4de3gN1pbVBtr1N7zzmKKlxP4NkIQ53fpupuo/J7JlY
 Sky98npTv7TR85g==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

wq->max_active means two different things, depending on how the workqueue
is backed. On a concurrency managed per-cpu pool it caps pwq->nr_active,
so it is a per-cpu limit. On an unbound pool it feeds
wq_node_nr_active() and is shared by the whole workqueue.

Tejun once said [1]:

	It kinda sucks that max_active's meaning is different across the
	boundary tho. Maybe percpu max_active should be separate into
	its own field, idk.

Add wq->percpu_max_active for the first meaning and leave max_active as
the system wide one. wq_adjust_max_active() updates whichever of the two
applies, and min_active stays with max_active as only the unbound side
uses it.

Suggested-by: Tejun Heo <tj@kernel.org>
Link: https://lore.kernel.org/all/amESSqf0TMmzhFGz@slm.duckdns.org/ [1]
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 kernel/workqueue.c | 44 +++++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index f868011e291f4b..8232a60e107cf7 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -389,6 +389,7 @@ struct workqueue_struct {
 
 	/* See alloc_workqueue() function comment for info on min/max_active */
 	int			max_active;	/* WO: max active works */
+	int			percpu_max_active; /* WO: max active works per cpu */
 	int			min_active;	/* WO: min active works */
 	int			saved_max_active; /* WQ: saved max_active */
 	int			saved_min_active; /* WQ: saved min_active */
@@ -1855,10 +1856,10 @@ static bool pwq_tryinc_nr_active(struct pool_workqueue *pwq, bool fill)
 
 	/*
 	 * A concurrency-managed per-cpu pool accounts nr_active per pwq, so
-	 * pwq->nr_active against wq->max_active is sufficient.
+	 * pwq->nr_active against wq->percpu_max_active is sufficient.
 	 */
 	if (is_percpu_pool(pool)) {
-		obtained = pwq->nr_active < READ_ONCE(wq->max_active);
+		obtained = pwq->nr_active < READ_ONCE(wq->percpu_max_active);
 		goto out;
 	}
 
@@ -6016,9 +6017,9 @@ static int init_rescuer(struct workqueue_struct *wq)
  * wq_adjust_max_active - update a wq's max_active to the current setting
  * @wq: target workqueue
  *
- * If @wq isn't freezing, set @wq->max_active to the saved_max_active and
- * activate inactive work items accordingly. If @wq is freezing, clear
- * @wq->max_active to zero.
+ * If @wq isn't freezing, set the limit that applies to @wq's backing to the
+ * saved_max_active and activate inactive work items accordingly. If @wq is
+ * freezing, clear it to zero.
  */
 static void wq_adjust_max_active(struct workqueue_struct *wq)
 {
@@ -6035,20 +6036,25 @@ static void wq_adjust_max_active(struct workqueue_struct *wq)
 		new_min = wq->saved_min_active;
 	}
 
-	if (wq->max_active == new_max && wq->min_active == new_min)
-		return;
-
 	/*
-	 * Update @wq->max/min_active and then kick inactive work items if more
-	 * active work items are allowed. This doesn't break work item ordering
+	 * Update the limit and then kick inactive work items if more active
+	 * work items are allowed. This doesn't break work item ordering
 	 * because new work items are always queued behind existing inactive
 	 * work items if there are any.
 	 */
-	WRITE_ONCE(wq->max_active, new_max);
-	WRITE_ONCE(wq->min_active, new_min);
+	if (wq->flags & WQ_UNBOUND) {
+		if (wq->max_active == new_max && wq->min_active == new_min)
+			return;
 
-	if (wq->flags & WQ_UNBOUND)
+		WRITE_ONCE(wq->max_active, new_max);
+		WRITE_ONCE(wq->min_active, new_min);
 		wq_update_node_max_active(wq, -1);
+	} else {
+		if (wq->percpu_max_active == new_max)
+			return;
+
+		WRITE_ONCE(wq->percpu_max_active, new_max);
+	}
 
 	if (new_max == 0)
 		return;
@@ -6145,10 +6151,14 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 
 	/* init wq */
 	wq->flags = flags;
-	wq->max_active = max_active;
-	wq->min_active = min(max_active, WQ_DFL_MIN_ACTIVE);
-	wq->saved_max_active = wq->max_active;
-	wq->saved_min_active = wq->min_active;
+	if (flags & WQ_UNBOUND) {
+		wq->max_active = max_active;
+		wq->min_active = min(max_active, WQ_DFL_MIN_ACTIVE);
+		wq->saved_min_active = wq->min_active;
+	} else {
+		wq->percpu_max_active = max_active;
+	}
+	wq->saved_max_active = max_active;
 	mutex_init(&wq->mutex);
 	atomic_set(&wq->nr_pwqs_to_flush, 0);
 	INIT_LIST_HEAD(&wq->pwqs);

-- 
2.53.0-Meta

