Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E520F455631
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548547; cv=none; b=PVOjUlGsS/L6urCifA3txjO7cQanoevClwivPLNrs2SwCXVStRzFotjXwxOcxkDEnjLejS7fw9n/iorJ/aXg3wJbvfEUVqyq+gu3peb8hBArk7p7H5Dubn4j6l+xNWZIZwQgTxYGbwbULn1pd6FiUg1NHzLeqhyUOkJ2nrSjis0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548547; c=relaxed/simple;
	bh=6H+jK8t5EVcHym9bQz3wYEhNOXxkCJqemeh0+zOb1Ow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pzpVJ5bbEhbxd+uhjBrZXqhyGSLnVmGDEDn98j0dSFMSRmnl/fmtQtiEajWzNWLybGD9SicAKBNfzCELBK2IxWqTHIlNcEGB7upi8lav5U7vC/P2nD0eVEtQHs/zDYd/TDleeftJGhqKQKe5kt4zg402hA43e90vuJw3nFAkcpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=MPiGW98v; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="MPiGW98v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=4g1fBnwGCqOFcJC4/q7/4QYTmnxLj3dcDmGbPv9ky5w=; b=MPiGW98vQ/R+vrVQeLVjfPxiTH
	6GvAipLn2JVltSTJZElijfM9ER3ArovSSPrwGuJAcxjDWy9bdZB/sW+eFAEF9V4bDNqKn+sWhx6XS
	Jv9PKwL8eXztaZ+u/GSAJWYAM1nexyRDE+igDYMtowVEJs7dhW7AyyVFRbDa9mJj8gnwhtJaHZPfI
	4P/mWR0ooweYhrmIZ644d9LV/YwhmYFCcMGZDYbzK78nqH/dQ0eY68+d3/ee9NtkAD8lTg8tFWwY/
	VRO52N09rqAXrKV7EO9dG8UoGlc+9RAIPMUwxPcClltUd0UfHw4V9VNoVwrbhQotgx2kiCqh1MRTq
	y0adT0GA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xF9cA-000Wjd-2L;
	Fri, 09 Oct 2026 12:22:19 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 09 Oct 2026 05:18:34 -0700
Subject: [PATCH wq/for-7.4 v3 1/3] workqueue: Move the initial max_active
 setup into a helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-wq_final-v3-1-eb0b095b9de3@debian.org>
References: <20261009-wq_final-v3-0-eb0b095b9de3@debian.org>
In-Reply-To: <20261009-wq_final-v3-0-eb0b095b9de3@debian.org>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, marco.crivellari@suse.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=2548; i=leitao@debian.org;
 h=from:subject:message-id; bh=6H+jK8t5EVcHym9bQz3wYEhNOXxkCJqemeh0+zOb1Ow=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqyNxzlbyrT+bM25ODoEuE8NpHwcgQ+T5V5OXqg
 9O4DpweBwiJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCasjccwAKCRA1o5Of/Hh3
 bXcNEACBpN83d49RG2hUibBDuYj1pcyCBCUJYgMUObr3tZjXfDAJc7PGWT960uVlNk28nA6Xsq6
 fBt1piCun5T283vk9xYkjx8XzwU3Q4xGbujL3hiyYwZn3Do7ImdfSHz2Nw6qL8fQIMa/DiMmVhv
 ul8o6lUtlqffYamrcIvgH+ZZII/PUhTwOiHByOr2c193RJq5vsB5XVXKe4gUhV0YPcfBOHv1Pju
 ouz1Nh+0F5U15iioFNYfmEhqJsiynhIkOP6bilLPQl+WIhHLWp/vBmJtsAaq97UClihQen6Xg9v
 NZR8PhXCTzS0EnvzJ+GLH3ob5MqGX+0TTXC5ohdeZVWs/1zowzrOV2HkUBMoJt06MX7rVhYprJl
 QowPjZo+Qnx169Zc2R6Qveji+ufml3wniQeXeyofja3D17PRWaWmbHd6QK6HsWt+RJMEXKFb4bL
 nieVfA9p+iQl3C5CnysOIOGn9gOD+g76P3wh95VMEXVLJeDP3dnJ7V7X/k0e0oxAz9pcTcH1JCO
 agLYusp2IwTSA8JXhXx4NBjvM1WW6oxR9/qkCKEruUzv74PpT2sATZdElShUxAzN1nbLy1FVurt
 43NHWpCgQiyJi0d5I4GipE4ObAyUTrUl0fwUP7ugQSSzSUoNyqiFeduRVfEPeSMVZqmzvmU0EAY
 aACck6oMLiLpR8A==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Extract the max/min active assignment into a helper, simplifying
__alloc_workqueue() and keeping the next patch easier to review and reason
about.

PS: Eventually, wq_init_max_active() and wq_adjust_max_active() can share
some code, but, keep this as a simple code movement for now, and then we
can come back to it.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 kernel/workqueue.c | 46 +++++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index e618108c6127da..97d2c9c0a7d6ab 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -6031,6 +6031,32 @@ static int init_rescuer(struct workqueue_struct *wq)
 	return 0;
 }
 
+static void wq_init_max_active(struct workqueue_struct *wq, int max_active)
+{
+	int effective_max_active;
+
+	if (wq->flags & WQ_BH) {
+		/*
+		 * BH workqueues always share a single execution context per CPU
+		 * and don't impose any max_active limit.
+		 */
+		effective_max_active = INT_MAX;
+	} else {
+		effective_max_active = max_active ?: WQ_DFL_ACTIVE;
+		effective_max_active = wq_clamp_max_active(effective_max_active,
+							   wq->flags, wq->name);
+	}
+
+	if (wq->flags & WQ_UNBOUND) {
+		wq->max_active = effective_max_active;
+		wq->min_active = min(effective_max_active, WQ_DFL_MIN_ACTIVE);
+		wq->saved_min_active = wq->min_active;
+	} else {
+		wq->percpu_max_active = effective_max_active;
+	}
+	wq->saved_max_active = effective_max_active;
+}
+
 /**
  * wq_adjust_max_active - update a wq's max_active to the current setting
  * @wq: target workqueue
@@ -6156,27 +6182,9 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 		flags &= ~WQ_PERCPU;
 	}
 
-	if (flags & WQ_BH) {
-		/*
-		 * BH workqueues always share a single execution context per CPU
-		 * and don't impose any max_active limit.
-		 */
-		max_active = INT_MAX;
-	} else {
-		max_active = max_active ?: WQ_DFL_ACTIVE;
-		max_active = wq_clamp_max_active(max_active, flags, wq->name);
-	}
-
 	/* init wq */
 	wq->flags = flags;
-	if (flags & WQ_UNBOUND) {
-		wq->max_active = max_active;
-		wq->min_active = min(max_active, WQ_DFL_MIN_ACTIVE);
-		wq->saved_min_active = wq->min_active;
-	} else {
-		wq->percpu_max_active = max_active;
-	}
-	wq->saved_max_active = max_active;
+	wq_init_max_active(wq, max_active);
 	mutex_init(&wq->mutex);
 	atomic_set(&wq->nr_pwqs_to_flush, 0);
 	INIT_LIST_HEAD(&wq->pwqs);

-- 
2.53.0-Meta

