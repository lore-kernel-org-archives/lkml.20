Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5F5444708;
	Fri, 16 Oct 2026 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137679; cv=none; b=m24JK3Xi826UVgxjfeROP8uFov70XT3nSTRRJsJcdEfW6PjoJwLOYFfjzgMJ0mmNArxmdx58qksu8VHhFU84sHtiJGxTTmYbOGzorxEUn3nG13G2PyzlqahIuH1Xgz4hqKbeHYBam6cQEIIEOYccijumBYEPkwUjUNIt1EJgE3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137679; c=relaxed/simple;
	bh=pUCELfIu8Ki8HPvZMMy4CICLNVbW7jj5OSHsBSYzHVQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=hnkThtp7gotX8Wz7RDzwd3JWgNxSGRiyJdiNTxj0PcOMe4YipE2Dynz8T66FDGfVcFRVXtNqlBxYJr0Rl5VLxlnBNUZN13kp8qsrwbFZHvAMQ87FagNqzIQQftE4Q76PVbTT2GEItnPI+26kaIzW2V+8VWx5vNfQlj5Lg4rdVWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Z2ffFmdi; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ByEjQ11l; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Z2ffFmdi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ByEjQ11l"
Date: Fri, 16 Oct 2026 08:01:14 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792137676;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Kv7jL8b9/rFgS8Ru31hLxi9axDFmC67BcAnTA2FE8w=;
	b=Z2ffFmdiBECICgWVF/xFXfvCsmaUJTA0WLyzq4swFVZzY2ZElpjFLPw3GgVSAyJp1yJNJC
	6N1Bjk7OoO1PqlchCpAuAg29iXmFxQ2V9UZ14jsL61UiY/skd2lNaenlHiuuvpNBn+CB9W
	BLZojaZWHuq4JknNAofk98wtwOu5Pw/hRfd63bxDLMVj6HqGm0P+BWht+GvOTc7eYxrAYQ
	B5Emn/e7Y4TQJZDpFE4xHbnv1WYpp7tq/DEdK281e517ZMD5FkEl10vEF25lfXN2G4nD/i
	Ef9Cho6f6mwcs2DUCWz/3sPju0IjRbGcI6I4MlpqbbjKCfiOxPOr3XsIsi3kgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792137676;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Kv7jL8b9/rFgS8Ru31hLxi9axDFmC67BcAnTA2FE8w=;
	b=ByEjQ11lAeKN+919b8C10ryeVCJir60DC89JxJPYB0GTgSO1y65SaS2yXCQrwlxvXTRG1w
	f8bI0hJJsi7ntNAA==
From: "tip-bot2 for Kayra Cizmeci" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] Revert "sched/fair: Remove dead code on
 enqueue_task_fair()"
Cc: Christian Loehle <christian.loehle@arm.com>,
 Kayra Cizmeci <kayracizmeci@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261015082919.4344-1-kayracizmeci@gmail.com>
References: <20261015082919.4344-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179213767471.2666988.7617836767029075656.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     0a94d0ea8d8b464ff597ae2f534dd60b64b4da0f
Gitweb:        https://git.kernel.org/tip/0a94d0ea8d8b464ff597ae2f534dd60b64b=
4da0f
Author:        Kayra Cizmeci <kayracizmeci@gmail.com>
AuthorDate:    Thu, 15 Oct 2026 11:29:18 +03:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 16 Oct 2026 09:49:04 +02:00

Revert "sched/fair: Remove dead code on enqueue_task_fair()"

This reverts commit 819224e506bc7c2d61ec6a58ec6e876b505abce9.

The cfs_rq->curr =3D=3D se case can actually happen with CFS_BANDWIDTH,
so the removed code is needed. Document this.

Fixes: 819224e506bc ("sched/fair: Remove dead code on enqueue_task_fair()")
Reported-by: Christian Loehle <christian.loehle@arm.com>
Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lore.kernel.org/lkml/fd3f9d83-cb5b-496b-b7c1-b40f31cf795e@arm.c=
om/
Link: https://patch.msgid.link/20261015082919.4344-1-kayracizmeci@gmail.com
---
 kernel/sched/fair.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index a90e48d..0feec17 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8156,6 +8156,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p,=
 int flags)
 	struct sched_entity *se =3D &p->se;
 	struct cfs_rq *cfs_rq =3D &rq->cfs;
 	unsigned long weight;
+	bool curr;
=20
 	if (task_is_throttled(p) && enqueue_throttled_task(p))
 		return;
@@ -8184,14 +8185,25 @@ enqueue_task_fair(struct rq *rq, struct task_struct *=
p, int flags)
 	if (p->in_iowait)
 		cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT);
=20
+	curr =3D (cfs_rq->curr =3D=3D se);
+	/*
+	 * This can actually happen with CFS_BANDWIDTH, a task can be throttled
+	 * and dequeued, unthrottled from another CPU and then enqueued again
+	 * before schedule().
+	 */
+	if (curr)
+		place_entity(cfs_rq, se, flags);
=20
 	if (se->on_rq && se->sched_delayed)
 		requeue_delayed_entity(cfs_rq, se);
=20
 	weight =3D enqueue_hierarchy(p, flags);
-	reweight_eevdf(cfs_rq, se, weight, false);
-	place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
-	__enqueue_entity(cfs_rq, se);
+
+	if (!curr) {
+		reweight_eevdf(cfs_rq, se, weight, false);
+		place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
+		__enqueue_entity(cfs_rq, se);
+	}
=20
 	if (!rq_h_nr_queued && rq->cfs.h_nr_queued)
 		dl_server_start(&rq->fair_server);
