Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA183E0220;
	Wed,  2 Sep 2026 07:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333732; cv=none; b=KTAb97MklfOopFqn4cnmXP62OOGj/1wXxixirt5z6nEwaYQP7mC7GErhAREMjEsmpip5IwECMfT2MlaGgSy3/vFLpSRL3Zqt/cuGzCTpxA1QMxaWVA1wsCS1auTH4YOvcBkLJa/SB/0ipGzc9llTKuSeM60fumIdENLBdrowugM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333732; c=relaxed/simple;
	bh=XRz1ZuvLXqo80o1y9DU5ARUNhBrs3fEqUxy+bF38hOc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=S8iwKowVZqgHvpLwvX8j3nZDgR3J73ZfDP7XYbZENxbHlnyS70bvp1svb0v5bUNuUVWJIP+PVwph9WR593TknPAKkDdiFX7SOgIkTc2LRM2P2NpDHI+8V5Wx31tY/EaENa+QYxy1Ce+6XzRZzlrLAZweL8ekLCymht+MAXYu2CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AqrX5v/F; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D/3esavf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AqrX5v/F";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D/3esavf"
Date: Wed, 02 Sep 2026 07:22:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788333722;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0PuF4k3/6BLQ81QbJx+6A09PWMhZ7bs/EZ6LV2qir5Q=;
	b=AqrX5v/Fc1TB0SLPhvRMxkDLt3+phHIynizI+Zl7H2pPO0GWqqmKipiyWkheD4119zAex9
	ECJ7qSsi/VNQaTBCIMl0BugAOGuV6pLS35x9rdvoaSPK2m3xZaNlQPUQGMrlkUsoYMJZ7V
	eovw19eq2zI/LJSeXRCW0py53uQWJRR9B1filNhvsMXSou4qBTqI9CgTSF4ezTuaRq80Bb
	ugywlzOBUz44MHDvdZw/TwEts/00ZSk2op7pzWn1qvMJntfWd6QLBp4e/XPVBlYRWuOM1t
	FpMHEbevbBtBqw9aU7x2elpeXsWwJtTA+vr3zHICCtCn0uyHPLTlEiFIQxioPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788333722;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0PuF4k3/6BLQ81QbJx+6A09PWMhZ7bs/EZ6LV2qir5Q=;
	b=D/3esavf2/U1CCUxyFPEKVdTaJZmjhm2CM/L0yp8gLHu6T6v+Ll9MNfMurWE2Q407FA8Pl
	3dgzz8dLXrnGcnDA==
From: "tip-bot2 for Wanwu Li" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/urgent] sched/fair: Use cfs_rq->h_curr in throttle_cfs_rq()
Cc: Wanwu Li <liwanwu@kylinos.cn>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Aaron Lu <ziqianlu@bytedance.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260831101141.391382-2-liwanwu@kylinos.cn>
References: <20260831101141.391382-2-liwanwu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833372069.3717435.13671449224557298994.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     f8610c57f4078c63d1d4e2f3d7134f3dc1768403
Gitweb:        https://git.kernel.org/tip/f8610c57f4078c63d1d4e2f3d7134f3dc17=
68403
Author:        Wanwu Li <liwanwu@kylinos.cn>
AuthorDate:    Mon, 31 Aug 2026 18:11:40 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:17:49 +02:00

sched/fair: Use cfs_rq->h_curr in throttle_cfs_rq()

After commit 85570f10a4c6 ("sched/eevdf: Move to a single runqueue"),
cfs_rq->curr is only maintained on the root cfs_rq (set/cleared from
set_next_task_fair()/put_prev_task_fair()), while cfs_rq->h_curr is
the per-level current entity, set by set_next_entity() at every level
of the hierarchy. For an intermediate cfs_rq (a cgroup), cfs_rq->curr
is always NULL, but cfs_rq->h_curr is the group entity at that level.

throttle_cfs_rq() reads cfs_rq->curr to decide whether there is a
running entity at the throttled level, in which case it should request
a full sched_cfs_bandwidth_slice() of runtime and arm the deferred
throttle task_work via task_throttle_setup_work(). For intermediate
cfs_rqs the check is always false, so bandwidth-controlled cgroups
always get just 1ns of runtime and never arm the deferred throttle
work; the running task then escapes throttling until the next pick
arms the work instead, even though there is an on-rq entity at this
level.

Switch the read to cfs_rq->h_curr so intermediate bandwidth-controlled
cgroups behave consistently with the root cfs_rq, matching the
existing usage of cfs_rq->h_curr in update_curr() and
check_enqueue_throttle().

Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
Signed-off-by: Wanwu Li <liwanwu@kylinos.cn>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Aaron Lu <ziqianlu@bytedance.com>
Tested-by: Aaron Lu <ziqianlu@bytedance.com>
Link: https://patch.msgid.link/20260831101141.391382-2-liwanwu@kylinos.cn
---
 kernel/sched/fair.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 5d47de5..73797d6 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6978,14 +6978,14 @@ static int tg_throttle_down(struct task_group *tg, vo=
id *data)
 static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
 {
 	struct cfs_bandwidth *cfs_b =3D tg_cfs_bandwidth(cfs_rq->tg);
-	struct sched_entity *curr =3D cfs_rq->curr;
+	struct sched_entity *curr =3D cfs_rq->h_curr;
 	struct rq *rq =3D rq_of(cfs_rq);
=20
 	scoped_guard(raw_spinlock, &cfs_b->lock) {
 		u64 target_runtime =3D 1;
=20
 		/*
-		 * If cfs_rq->curr is still runnable, we are here from an
+		 * If cfs_rq->h_curr is still runnable, we are here from an
 		 * update_curr(). Request sysctl_sched_cfs_bandwidth_slice
 		 * worth of bandwidth to continue running.
 		 *
