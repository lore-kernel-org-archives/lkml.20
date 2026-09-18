Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF7B3A4F3B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741550; cv=none; b=AxoFpSFpHzxOVIQf+NC7je/69aRkOTRSSA5CJhP/IUbNCqO0SN/XS+nfSwDzOg5idEH17SUxALRHy5ph+OLzfrxiEnYsXi7aSO7cPY5xDSyoHcROmpnkCl0w/JeJAhT/XaG6I7Z+iedNceCVkNgLimuY+iBPxDAFNL0Fc75V2go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741550; c=relaxed/simple;
	bh=5Hwqbfy8RdpERP0rf8VELLjud0A0y8xSKq9Vf04oooQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIwLrWRwvsX3jequEqtwHkg45B4KMhktmNKbKHbE7mHOgkcAOkVjnhYB3/30GOOHIQVO8zMNdROGp0fD8z16Nx58O6P0TPqMMPvyZMOg1+AQqtDciK51+58ux7S5+dMSA9B7G5IZqDy4G4d7pglx9Huf4eUW54JTYSgm2xokLM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=hcsmyg4o; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="hcsmyg4o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=4yh9QPWkCyce8lBJo2JXbcB5jmBdkfD2PJs0cugwfys=; b=hcsmyg4oaYWZtOq+JKE+mTGVv+
	ACXBUZzCTrknpdkMKX+GsWP1FDdrGrsvgO/D3ttVeMHQ7xPhXtRWrbTnYwy4/qASg5drwXlXu+cYY
	FzrnsHjQsEbRGQ3y/efYlFUnA26tSs4YFTV+ooEpoKpjonWS/oOnWPsfi2TN3ej0J3mMbTGVKySXE
	peEs8PHm6XMeArJ6CIq18Q1blS+GOlMzncjMgSG9TYCQvTLo3goaaWgC0mHdiZCqQml4F1LJkBPAw
	ClVS4VaeuQO7oWF80duRI+L5+Rz8y7qrw3O/UxkNMSzawzVSJbdXd2XsrYwjdv/Llu6DN9rf2Xu4c
	7DxpWlyQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x7ZX5-006n91-0o;
	Fri, 18 Sep 2026 14:25:43 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 18 Sep 2026 07:25:33 -0700
Subject: [PATCH RFC 1/3] workqueue: Maintain both max_active limits
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-wq_final-v1-1-5c43c08a26bc@debian.org>
References: <20260918-wq_final-v1-0-5c43c08a26bc@debian.org>
In-Reply-To: <20260918-wq_final-v1-0-5c43c08a26bc@debian.org>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, marco.crivellari@suse.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=3696; i=leitao@debian.org;
 h=from:subject:message-id; bh=5Hwqbfy8RdpERP0rf8VELLjud0A0y8xSKq9Vf04oooQ=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqrUng5+RGpg3uGcDqpWjdd+L+VaMHTAZTQ4mwh
 XaY2Xqtp6CJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaq1J4AAKCRA1o5Of/Hh3
 bU/BD/4gDeshxZm/8qYUboPQzr/rQjSQB966JZibu2EW7dh+WqdBVS5ylUp9sqIVYA9F1PJOUbJ
 llnDK4pPDM4CslUYuQ50al5Eu6wdnBe8MYq32jrioT7fQ0vbiLtvzOPXgcvcqcXg1szFDctAES9
 i8sc1u4XnVRmVcChOXbbddnI0KpIFlK/bDh5ZrOdTbw1tXKvg3Mf82DO3JH33xo038ruyahE+KL
 hav0BY8BrZMOkGcghK4AgDfhxX+kWAmHyJlSCDWzt46D8B2CT7NLP9ZMpGhJ69/iJVrWoqi4JjJ
 2OEtEqo//88pvXlFJn+eRvc7xURGl1rYDfCgx+t8sA3bjcHS3ethCKQ9bKCUNe2ckyoTurMR1oP
 iBoMb0t8UCiDpL0oHybwvM4UsjJ8/UyKGIwLk5l7Lq0v9qhwPXF60hEHuTGSJ0Pn2mT9bCbIREB
 y79Mt90cTQwhzVrtsa6wSqVZbEdxOKMpwUmaEf5hvqG4LOC3Si76jeSyGHcq5Is+CIOqmxlTTFl
 rNm2TgcVlxtkgvG7sRa8cdb45X+grK3bs+S7cTyTvbV8OPiPu6vQ1OJIcfdg5yMailZv2v5ErtB
 PEMeMOWpb4WL0bhW++606F6EdqXWLbk/zYXpzniGUmGGVVc/7x6azH5F+5qUGbFelg3V7LcJadJ
 PmUM4QiwOG10HJQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

I've done commit 27db9dd7f84f3a ("workqueue: Give percpu workqueues
their own max_active"), but, later I found the solution was not that
simple.

I want to keep only one active, either percpu_max_active or max_active.
But there is no instant at which the backend flips,
apply_wqattrs_commit() swaps the slots one CPU at a time:

        for_each_possible_cpu(cpu)
                ctx->pwq_tbl[cpu] = install_pwq(ctx->wq, cpu,
                                                ctx->pwq_tbl[cpu]);

__queue_work() reads a slot under rcu_read_lock() plus pool->lock, it
never takes wq->mutex. So partway through that loop, CPU 0 already has
a concurrency-managed pwq while CPU 7 still has a pod-backed one, and
work can be queued to either.

So, let's keep both values the same, which is silly for now. Maybe we
should revert commit 27db9dd7f84f3a ("workqueue: Give percpu workqueues
their own max_active"). Not convinced yet.

Link: https://lore.kernel.org/all/amESSqf0TMmzhFGz@slm.duckdns.org/
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 kernel/workqueue.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index e618108c6127da..1c4f8bdd1cd509 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -6055,24 +6055,25 @@ static void wq_adjust_max_active(struct workqueue_struct *wq)
 	}
 
 	/*
-	 * Update the limit and then kick inactive work items if more active
+	 * Update both limits and then kick inactive work items if more active
 	 * work items are allowed. This doesn't break work item ordering
 	 * because new work items are always queued behind existing inactive
 	 * work items if there are any.
+	 *
+	 * Which one a pwq honours follows its pool, see pwq_tryinc_nr_active().
+	 * Keeping both current means a pwq is never metered against a limit
+	 * that was never set.
 	 */
-	if (wq->flags & WQ_UNBOUND) {
-		if (wq->max_active == new_max && wq->min_active == new_min)
-			return;
+	if (wq->max_active == new_max && wq->min_active == new_min &&
+	    wq->percpu_max_active == new_max)
+		return;
 
-		WRITE_ONCE(wq->max_active, new_max);
-		WRITE_ONCE(wq->min_active, new_min);
-		wq_update_node_max_active(wq, -1);
-	} else {
-		if (wq->percpu_max_active == new_max)
-			return;
+	WRITE_ONCE(wq->max_active, new_max);
+	WRITE_ONCE(wq->min_active, new_min);
+	WRITE_ONCE(wq->percpu_max_active, new_max);
 
-		WRITE_ONCE(wq->percpu_max_active, new_max);
-	}
+	if (wq->flags & WQ_UNBOUND)
+		wq_update_node_max_active(wq, -1);
 
 	if (new_max == 0)
 		return;
@@ -6169,14 +6170,11 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 
 	/* init wq */
 	wq->flags = flags;
-	if (flags & WQ_UNBOUND) {
-		wq->max_active = max_active;
-		wq->min_active = min(max_active, WQ_DFL_MIN_ACTIVE);
-		wq->saved_min_active = wq->min_active;
-	} else {
-		wq->percpu_max_active = max_active;
-	}
+	wq->max_active = max_active;
+	wq->min_active = min(max_active, WQ_DFL_MIN_ACTIVE);
+	wq->percpu_max_active = max_active;
 	wq->saved_max_active = max_active;
+	wq->saved_min_active = wq->min_active;
 	mutex_init(&wq->mutex);
 	atomic_set(&wq->nr_pwqs_to_flush, 0);
 	INIT_LIST_HEAD(&wq->pwqs);
@@ -6452,8 +6450,7 @@ void workqueue_set_max_active(struct workqueue_struct *wq, int max_active)
 	mutex_lock(&wq->mutex);
 
 	wq->saved_max_active = max_active;
-	if (wq->flags & WQ_UNBOUND)
-		wq->saved_min_active = min(wq->saved_min_active, max_active);
+	wq->saved_min_active = min(wq->saved_min_active, max_active);
 
 	wq_adjust_max_active(wq);
 

-- 
2.53.0-Meta

