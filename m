Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E39A443311;
	Fri, 16 Oct 2026 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137350; cv=none; b=iZWAPS+lE3v1wf6MYfiIn+kwwHtG84Ye2MtohRu6ft/BLwMK3Ev78yBf32RR39/BT/GBlT00UkFaCjFPZQGajgMhXkE/TXDAjMxl4Bl6P46cewcB3fY06EfNspFWizXsK8mImtJ964DEFdDPAleLCNER4TH/g/5T0iGWa28HSuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137350; c=relaxed/simple;
	bh=nyDo1fz7KIxbMVB6J4llHppN7fEw28mEz2XD1d0nBZQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=QJ4YlFWmYNrpPFLuH/nXyCCvOy7wqxSrV3zd1CVhEvIc1Ia3zQFayJuPjXAIKRd4bmMzewViKrY7kqTzH3aZYmM7bepbxvuM49m7pfA0rsrDzXFlK4Y1BKLWfuWl1XBj9ZpF2t4Q484SBS8/3sPcc7do/s/ugV4PirQaXWU+PF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q9yzE9Nf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uE6GJ1Yi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q9yzE9Nf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uE6GJ1Yi"
Date: Fri, 16 Oct 2026 07:55:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792137343;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l7AhbFTQvuq3e3GKt4BzhHvZftzKvjV0A7Rghyr4Tyo=;
	b=Q9yzE9Nf2UeibYDAz0ENHQWuJlmoB1ubh0EJLVxnBwsysCBJ43XO2EqTKWwDpqhEatxLiK
	Xz720pTfjDbTF12dMvW2isciqe3Ka4GlaXGlSc6Ue5A9NZotkNZbJEbDn19rBE7pGcLq46
	svOq1ctkBddcImK9SLB3divmzfdwCr0iRoYBHt4q/XdgYGRf/WjOyneSFmKmqdPT0G328/
	BIsIsXyVg1Jm35NgJ3dMA+Iloli+ppl1KbedPCNagMQQ9peqfQ3LuQ2oh+VYuGhLHtcpOm
	iN95gPI17cusYidfd1aPfOp/SUeSKSFrQJdapTdEUNwEZzwVu4JSktVGBGAq2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792137343;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l7AhbFTQvuq3e3GKt4BzhHvZftzKvjV0A7Rghyr4Tyo=;
	b=uE6GJ1YiEkqFScF/coftRrGK57OvHqKnxPCBS3m3IikALUM/bfayV+oxEYlaFIXwewNDsi
	IFl3oJRL24riYiBw==
From: "tip-bot2 for Hui Su" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/fair: Avoid overflow in place_entity()
Cc: Hui Su <sh_def@163.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260928124754.1692077-1-sh_def@163.com>
References: <20260928124754.1692077-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179213734207.2666988.8900131874393139062.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     2f93bcb3f9aaf6ceee1aec0a97d4fe386d48e781
Gitweb:        https://git.kernel.org/tip/2f93bcb3f9aaf6ceee1aec0a97d4fe386d4=
8e781
Author:        Hui Su <sh_def@163.com>
AuthorDate:    Mon, 28 Sep 2026 21:47:54 +09:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 16 Oct 2026 09:49:00 +02:00

sched/fair: Avoid overflow in place_entity()

place_entity() inflates an entity's virtual lag with

    lag * (load + weight) / load

Commit 4823725d9d1d ("sched/fair: Increase weight bits for avg_vruntime")
replaced the scaled-down weights used in this calculation with
avg_vruntime_weight(), removing the arithmetic headroom provided by
scale_load_down().

The multiplication can overflow s64 before the division even when the
final quotient is representable. A task's hierarchical effective weight
can be as small as 2 after avg_vruntime_weight() scaling under group
scheduling, while entity_lag() bounds |vlag| by

    calc_delta_fair(cfs_rq_max_slice(cfs_rq) + TICK_NSEC, se)

For example, with HZ=3D1000, NICE_0_LOAD=3D1048576, and the minimum scaled
hierarchical weight scale_load(2)=3D2048, this bound is 891289600. With 114
maximum-weight entities, the runqueue load is 10361604096. The
intermediate product is:

    891289600 * (10361604096 + 2)
        =3D 9235189971864780800
        > S64_MAX

The signed overflow corrupts the entity's placement.

Rewrite

    lag * (load + weight) / load

as

    lag + lag * weight / load

The two expressions are equivalent, but the latter avoids multiplying the
virtual lag by the total runqueue weight. entity_lag() bounds vlag against
the entity's effective weight, so the remaining lag * weight product stays
bounded. rescale_entity() preserves this scale across h_load changes and
already relies on the same product when rescaling vlag.

Keep the original zero-load warning semantics by multiplying lag by weight
after replacing the divisor with one.

Fixes: 4823725d9d1d ("sched/fair: Increase weight bits for avg_vruntime")
Signed-off-by: Hui Su <sh_def@163.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260928124754.1692077-1-sh_def@163.com
---
 kernel/sched/fair.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5..0f23644 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6463,12 +6463,20 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_enti=
ty *se, int flags)
 		load =3D cfs_rq->sum_weight;
 		if (curr && curr->on_rq)
 			load +=3D avg_vruntime_weight(cfs_rq, curr->h_load.weight);
-
-		weight =3D avg_vruntime_weight(cfs_rq, se->h_load.weight);
-		lag *=3D load + weight;
 		if (WARN_ON_ONCE(!load))
 			load =3D 1;
-		lag =3D div64_long(lag, load);
+
+		weight =3D avg_vruntime_weight(cfs_rq, se->h_load.weight);
+
+		/*
+		 * Rewrite, because the product (W + w_i)*vl'_i might
+		 * overflow s64:
+		 *
+		 *   vl_i =3D (W + w_i)*vl'_i / W
+		 *        =3D (W*vl'_i + w_i*vl'_i) / W
+		 *        =3D vl'_i + w_i*vl'_i/W
+		 */
+		lag +=3D div64_long(lag * weight, load);
=20
 		/*
 		 * A heavy entity (relative to the tree) will pull the
