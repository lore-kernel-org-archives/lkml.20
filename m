Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EE844062F;
	Fri, 25 Sep 2026 10:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333652; cv=none; b=qnjlXw41WqirBcgcGVNk5xC5M4aPUa/fonBSDvIcslMh/7+U+qwQN2+Cg2QXGqdjxW0GXnXMFt2tVBTV5YmVyqTEAHXbQJ8zCXXBD5ZLAuSeoVxb3D7KdjMAqJ2pE/20pXqGhR5fylUWs7m48BGZjLOPrGW0Zb7dgdUnV0JUaWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333652; c=relaxed/simple;
	bh=Lwh95UEB6xorG/HaUxhJ47vicnBc+t/uSkXEDARvHvM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ncVnhxPMvn/hfG5uxy50adv2FLTmcLmexlPcb3gL4mpuQwpG3X3V/6ERof4VhSDC2jeNcgUoo4UlPtHw49gWOMkIgEymS5Emp0MmTdjyJFNHfemKhjTBEqE6Bzdrr7lt6G5hvhFXwLEJyEa2nLGkvnuScbmE9tNosCq8n4/Z5qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SFUixy9i; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Fo7OItb0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SFUixy9i";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Fo7OItb0"
Date: Fri, 25 Sep 2026 10:54:04 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333646;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XRd0o/CcSmpZfEjvNREV8R4swTYyag9PSYLu00yho5I=;
	b=SFUixy9ibRGncUMR+UCxlkpPIWhDJzsUr8viJHOUCpL3xwVpJzAtGDdrd3w5KXUHa532pt
	mP+DhcYunestf+o5Yp9Bv34HT/kGweIo60YH1K32ABInef5uUrwkZAyhq6wP9J0w3Jo4TK
	t0Yv69jRxDOFzOCSWnckxyy6AIKDRxyO5cOo9moIxneA4BQC5gvPTPmOJbLaeQHfbRMnu2
	t7aSuwu17PwYa67SwlWVFzFaM1JISpr63tCmhxd2ZqxlZsOe+d/w5t2uBtFGN8mmQ9j5aM
	DEPL0tceQRzNbKTbHlmZp1jpEs0MLMx5JPZ/6yLaSbzhD7ZLbcVSJn7VraOKYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333646;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XRd0o/CcSmpZfEjvNREV8R4swTYyag9PSYLu00yho5I=;
	b=Fo7OItb0R1BYHt73oZaaIBqNi65s1Z3665E/V3pLDbg4+hW3bkPaTz0cqhB+MDB8fFdtip
	RQBN2/KuIkXW5YBA==
From: "tip-bot2 for Vincent Guittot" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/eevdf: Align update_protect_slice to
 set_protect_slice
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921152238.3804392-3-vincent.guittot@linaro.org>
References: <20260921152238.3804392-3-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033364470.2819794.1149607755856219834.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     4bf32ec3327d2d2286e96508cd128ce1592f43ce
Gitweb:        https://git.kernel.org/tip/4bf32ec3327d2d2286e96508cd128ce1592=
f43ce
Author:        Vincent Guittot <vincent.guittot@linaro.org>
AuthorDate:    Mon, 21 Sep 2026 17:22:32 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:59 +02:00

sched/eevdf: Align update_protect_slice to set_protect_slice

Apply the same logic as for set_protect_slice when updating it.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260921152238.3804392-3-vincent.guittot@linar=
o.org
---
 kernel/sched/fair.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0969be2..82155d9 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -821,12 +821,6 @@ static u64 ineligible_vruntime(struct cfs_rq *cfs_rq)
 	if (curr && !curr->on_rq)
 		curr =3D NULL;
=20
-	/*
-	 * This is called from set_next_task_fair(.first=3Dtrue) /
-	 * set_protect_slice() so curr had better be set and on_rq.
-	 */
-	WARN_ON_ONCE(!curr);
-
 	if (weight) {
 		s64 runtime =3D cfs_rq->sum_w_vruntime;
=20
@@ -1138,10 +1132,19 @@ static inline void set_protect_slice(struct cfs_rq *c=
fs_rq, struct sched_entity=20
=20
 static inline void update_protect_slice(struct cfs_rq *cfs_rq, struct sched_=
entity *se)
 {
-	u64 slice =3D cfs_rq_min_slice(cfs_rq);
 	u64 vruntime =3D min_vruntime(se->vruntime, avg_vruntime(cfs_rq));
+	u64 slice =3D normalized_sysctl_sched_base_slice;
+	u64 vprot;
+
+	if (sched_feat(RUN_TO_PARITY))
+		slice =3D cfs_rq_min_slice(cfs_rq);
+
+	vprot =3D min_vruntime(se->vprot, vruntime + calc_delta_fair(slice, se));
=20
-	se->vprot =3D min_vruntime(se->vprot, vruntime + calc_delta_fair(slice, se)=
);
+	if (sched_feat(PREEMPT_SHORT) && slice !=3D se->slice)
+		vprot =3D min_vruntime(vprot, ineligible_vruntime(cfs_rq));
+
+	se->vprot =3D vprot;
 }
=20
 static inline bool protect_slice(struct sched_entity *se)
