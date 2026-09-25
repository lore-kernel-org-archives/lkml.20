Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E36C48C8DC;
	Fri, 25 Sep 2026 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333657; cv=none; b=fwcnec4NiXOpRioszNeeWX5wOGzreLPb5F31yVj9Y4azOfTc1E6qHzoTZPe3bZUAdI/48L4dQ6KwmHDZTFV7KS7B+3ImLbXWluuTG/+5bFfwPyFj9IkQ4fPfUpzt2ZRrltzEmmvw9tn6qqSaDl6iw8V6b+AUjt3Cl/KAVVkq6+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333657; c=relaxed/simple;
	bh=kn368oa8dZTWJxKwzCNMgYDrP20oa7OuhC6dLxINcyg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=tvW0ufswShsWF0JvOvMY2E5qY37hKrLL2tvEWFcau+IcinpzZkuoqijth2M1nGB1ai6CjVs4YIfKZ4nWc7WsI5LyHn0ipp54SvVraMTyzqRlbCmy1Em3gzRZrAGYr67XB2c9ZCKLb5Xw3J3nx9JsdBzRqzJaFuoXoEV3n77olTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YNFn1U34; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=o1+31VkP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YNFn1U34";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="o1+31VkP"
Date: Fri, 25 Sep 2026 10:54:12 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333653;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V80PKrv1FAdTqNZVngLOouBxH8ZB1gJVH0y2Oj2qILo=;
	b=YNFn1U34R0LSjUxPrAFfW8DqcN/GSlE4RFgVPm2ewMe+j6wsP4Ya5Ipbex0//V9OkfNbj9
	MI8StGAdlcN6cN7+y1SSFWAMIdeBQ2x2KehY2b3ei0WUPg8Gm1QzCifpg5frF4zxAcXISh
	f7DF+qDXK0tZYrV9V6EeLPR8p5wHUa9PebXxed7HQ8QjJ+OZSSU+sikepHulTHNS9r6UHY
	0VHw7UiIxSOouvu4d1/xKxPSCYhogv7+p2B006TbyXAd/Oe7fw5Gar/8naCevLX5HjLxAK
	WwILhjVX2LqS7oKw7APU3ZeuQxWsRKr5PdRW0eEURMlQ+jow/3rWvOabtBJLvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333653;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V80PKrv1FAdTqNZVngLOouBxH8ZB1gJVH0y2Oj2qILo=;
	b=o1+31VkPeOveEzOateOpPVgUZmnL88k9sJeFlxSsanwY/3I9D4MoYsNOddDqgCWUcWhtde
	u1/Oz7+HxE/Xl9Dw==
From: "tip-bot2 for Kayra Cizmeci" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/fair: Remove dead code on enqueue_task_fair()
Cc: Kayra Cizmeci <kayracizmeci@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260911155449.1249726-1-kayracizmeci@gmail.com>
References: <20260911155449.1249726-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033365207.2819794.11851486661940182495.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     819224e506bc7c2d61ec6a58ec6e876b505abce9
Gitweb:        https://git.kernel.org/tip/819224e506bc7c2d61ec6a58ec6e876b505=
abce9
Author:        Kayra Cizmeci <kayracizmeci@gmail.com>
AuthorDate:    Fri, 11 Sep 2026 18:54:48 +03:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:57 +02:00

sched/fair: Remove dead code on enqueue_task_fair()

The 'cfs_rq->curr =3D=3D se' path on enqueue_task_fair() seems to be unachiev=
able.

Remove the code that depends on this cfs_rq->curr =3D=3D se case on
enqueue_task_fair() and bool curr too since there are two possibilities
and one has been removed, we can proceed directly with the other.

Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260911155449.1249726-1-kayracizmeci@gmail.com
---
 kernel/sched/fair.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 36861f4..a03e7f4 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7988,7 +7988,6 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p,=
 int flags)
 	struct sched_entity *se =3D &p->se;
 	struct cfs_rq *cfs_rq =3D &rq->cfs;
 	unsigned long weight;
-	bool curr;
=20
 	if (task_is_throttled(p) && enqueue_throttled_task(p))
 		return;
@@ -8017,23 +8016,14 @@ enqueue_task_fair(struct rq *rq, struct task_struct *=
p, int flags)
 	if (p->in_iowait)
 		cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT);
=20
-	/*
-	 * XXX comment on the curr thing
-	 */
-	curr =3D (cfs_rq->curr =3D=3D se);
-	if (curr)
-		place_entity(cfs_rq, se, flags);
=20
 	if (se->on_rq && se->sched_delayed)
 		requeue_delayed_entity(cfs_rq, se);
=20
 	weight =3D enqueue_hierarchy(p, flags);
-
-	if (!curr) {
-		reweight_eevdf(cfs_rq, se, weight, false);
-		place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
-		__enqueue_entity(cfs_rq, se);
-	}
+	reweight_eevdf(cfs_rq, se, weight, false);
+	place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
+	__enqueue_entity(cfs_rq, se);
=20
 	if (!rq_h_nr_queued && rq->cfs.h_nr_queued)
 		dl_server_start(&rq->fair_server);
