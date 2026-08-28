Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387173F106A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787903810; cv=none; b=ft8PpLeGNTFja/b5yVJGCSmv0703opdaBBe7pwRlu8fc6opxEuUmTf95pkZBRjQt2UBtfqUlRqeX+Rm4tBmLcWwal3etMvxJRxNGwRkY3PrMdicY81YDKg0B+3h7Z3tJQ0le5wjAi/Pe8v1ltgOGep1HLDG61yRpNqOaN7zdNxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787903810; c=relaxed/simple;
	bh=UNcuZVeYp4Bj5abLNKnDw5Ks1ljRuBQVfJiXPxSxGsU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=YCd8TiscvmU6ntvfYFamb3WudDIaj+ONlo5A03G89S9d7os7KN1NLrbboaFVQ/5Y8zKy0YdUDvz36WmoEZE2EjppVwIqzoIDTzjhi4z5KEnQr15k/n0iXmveKANCRzi5wICNweB/IeVqG5s/xjCm7LkjS2sl+rIeJFa5ep8OmiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pmMKbK9Y; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pmMKbK9Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=gKZldRxGMu2/vJWAh+lpOQibZ85xMWnHyys3uDe5DSc=; b=pmMKbK9YJ3BavoN9qXH6udMmRw
	ZARIgDnbnKhmyPLpMRFOy/u6gitCPeQBBCsb+eVzOa0UGl0xFHhLaOo3bDMUGJWtydEVKIkx0RJvj
	N/QoCSRLrmJKj27bh3SwgHl+WS8DryA6YlwJQcD5oj4B8pwW645LlTSq+zGdUgc9etdVsXqpmGGbn
	IviH9RGd0hy08ctJxVDOh2MMxiZZjAg8EC+nrRnBeIxhzevMTyhzc76pXBnpmQIflf4t59ecCrW6n
	9ho5x6NfHQtFsIX7gEUlYCyA2xNvTevEbL1hRNs6jx+qZUDEh6KfC4WWFQrlX/sAMNvx+zGtg2ypw
	XVfik7bA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzrS1-0000000EGKI-0vQr;
	Fri, 28 Aug 2026 07:56:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 4790A30301D; Fri, 28 Aug 2026 09:56:36 +0200 (CEST)
Message-ID: <20260828075558.542761795@infradead.org>
User-Agent: quilt/0.68
Date: Fri, 28 Aug 2026 09:41:02 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: peterz@infradead.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 tj@kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] sched/fair: Extend for_each_sched_entity() with a back-link
References: <20260828074059.232353141@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Leave a trail of bread crumbs, such that we can find out way back down the
hierarchy. No actual users yet, but split out because its a bit tricky.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/fair.c  |    9 +++++++--
 kernel/sched/sched.h |    1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -317,8 +317,13 @@ const struct sched_class fair_sched_clas
 #ifdef CONFIG_FAIR_GROUP_SCHED
 
 /* Walk up scheduling entities hierarchy */
-#define for_each_sched_entity(se, cfs_rq)				\
-	for (; (se) && ((cfs_rq) = cfs_rq_of(se)); (se) = (se)->parent)
+#define for_each_sched_entity(se, cfs_rq)					\
+	for (struct sched_entity *_BL = NULL;					\
+	     (se) && ((cfs_rq) = cfs_rq_of(se), (cfs_rq)->backlink = _BL, true);\
+	     (se) = (se)->parent, _BL = (se))
+
+#define for_each_sched_entity_bl(se, cfs_rq) \
+	for (; ((se) = (cfs_rq)->backlink); (cfs_rq) = group_cfs_rq(se))
 
 static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
 {
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -726,6 +726,7 @@ struct cfs_rq {
 	unsigned long		tg_runnable_avg_contrib;
 	long			propagate;
 	long			prop_runnable_sum;
+	struct sched_entity	*backlink;
 
 	/*
 	 *   h_load = weight * f(tg)


