Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712372;
	b=Lt7uaEB/CS7Ft6uMrat7MPobqWRQxEEoLoHWIwNBNea1rAhUnj+0TxvdvEHygzKfxXSk
	 1IS/97tV4k6ytgk65RhYeef/W4ghWN/dOFw7v8K9O5klJu2knmUgJSBVH/PAh1XhdxxQh
	 jlxgk102dyp8vQ8juq0uMJ0cEPH9clXCggmEYBG5AXW7i4VDr/S4SZtDCZ5gnW0Q8TGQC
	 cuEfgZslfUOwFaqBcTuw8Vr1NmUSYuwjJhE7h6lS2rSZs5bcTcTfLTcIja/dDQN4FHmaW
	 KfDt1i+RFjwSq6BdIFuiS/PxoM6nACXOgrMBWcfBxNXeX+DjTZWNrO/sZA6w/gsJ3VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712372;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=LjWZpW1B8LjcCk1/0feGj1ZUuW6/ayLcrd09YMr6jlY=;
	b=khQcV9Ygse/2wMogdMsS5tpaScV5T9hZ9bF1C7kNzAEvNZaYVs38wLufKeEWVwhzAZDY
	 ShFvgPMILaZmnN53a/rf0mYZMevslYuQZ7An4lvj1WPd2c6wAU0xb9KJ+aYWm7jR1jDON
	 XB9zxdcEOqBkhmD7sF9T6zhj9MvMGLQkSpKZK9iV3QpapH7qV2Otsgw7/bn6o1Hq2yn/1
	 yr+d+pbZSvyrLMzQ0UU3w2I0WPAASrD8q9p2XGFQnZn7OoLzirXZfqZ8IskZnQuMtaDXn
	 dVu9FUins17m2mQ5LlgUOjJ33LSzs6X0sZzFu4dDjt1uicyZQ9+Aaj8gFoFY8fsLcHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IuFdJYDY;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TqXegdtY;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F55F606EE9A;
	Tue,  3 Nov 2026 13:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F55F606EE9A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IuFdJYDY;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TqXegdtY
Date: Tue, 03 Nov 2026 13:26:03 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793712365;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LjWZpW1B8LjcCk1/0feGj1ZUuW6/ayLcrd09YMr6jlY=;
	b=IuFdJYDY3HkPrMxRz7VV6fo6il8zVCn/X+XfeWzCsUHEIO3T5UO9GaY5SBhN6MDNwkFP7+
	FSTFEPWg5bpDiW3XXJKxyOImNnKeAQF2IGBC8FDlAv6qVU4gNwC4K6xFqZiqS0qzQHphOV
	myHV1qRwLoNqJ8DThPhMTVm2JartTVvu2HpPf6TSY96mr5bLOZzb4LsKphEgAVtJ81tZqV
	3PhVIiOPBo+ot9rVEGc8VLLvgmf7Y9UOZ91QhnB/C4Id7PkHMdcddj6Mia44EVSPBzjL7j
	+fu39rBV+1lnC7fG+QOldV9+Sspanl+Tdmhz0dNN7WxetJyw/zls3bOaHbKUMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793712365;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LjWZpW1B8LjcCk1/0feGj1ZUuW6/ayLcrd09YMr6jlY=;
	b=TqXegdtYETvBomGXuMQbshaKH4WHIFM+tnMUsaKNH9bz5Je4yeNgJxH3iazRHDeVyhEa3l
	2GbXAPSK+PV3NWDw==
From: "tip-bot2 for Juri Lelli" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/deadline: Fix stale root domain in cpuset
 bandwidth transfer
Cc: Weiheng Qiu <weihengqiuu@gmail.com>, Juri Lelli <juri.lelli@redhat.com>,
 Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103-b4-sched-dl-bw-fixes-v1-1-dd761fe005b4@redhat.com>
References: <20261103-b4-sched-dl-bw-fixes-v1-1-dd761fe005b4@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179371236348.1009794.4797641388786379495.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     b4a61fdc19c5c40f295b28ad318a3c4827d7d289
Gitweb:        https://git.kernel.org/tip/b4a61fdc19c5c40f295b28ad318a3c4827d=
7d289
Author:        Juri Lelli <juri.lelli@redhat.com>
AuthorDate:    Tue, 03 Nov 2026 12:26:29 +01:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 03 Nov 2026 14:18:04 +01:00

sched/deadline: Fix stale root domain in cpuset bandwidth transfer

dl_task_needs_bw_move() and set_cpus_allowed_dl() use task_rq(p)->rd
to determine a task's current root domain. For a sleeping task, this
is stale: it points to the rq of the CPU the task last ran on, which
may belong to a different root domain after a cpuset move.

This causes incorrect bandwidth accounting when a sleeping DL task is
moved between exclusive cpuset partitions and back:

  1. Move root->partition: task_rq(p)->rd =3D root, destination in
     partition -> different -> bandwidth transferred correctly.
  2. Move partition->root: task_rq(p)->rd is still root (task never
     ran) -> looks like same domain -> no transfer. Partition keeps
     stale bandwidth, root domain is short.

The root domain then over-admits, and when the task exits total_bw
underflows.

Introduce dl_task_root_domain_cpu() helper that uses the task's
cpus_mask (which still reflects the old/source cpuset at call time)
to find the root domain where the bandwidth is actually accounted,
instead of relying on the potentially stale task_rq(p)->rd.

Use cpus_mask rather than cpus_ptr, as the latter may be temporarily
narrowed to a single CPU by migrate_disable().

Reported-by: Weiheng Qiu <weihengqiuu@gmail.com>
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Link: https://patch.msgid.link/20261103-b4-sched-dl-bw-fixes-v1-1-dd761fe005b=
4@redhat.com
Closes: https://lore.kernel.org/all/14508cb2-805f-41ac-9f6b-bfd7c3d7cb1c@gmai=
l.com/
---
 kernel/sched/deadline.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c0ebdcd..68019da 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3324,14 +3324,28 @@ static void task_woken_dl(struct rq *rq, struct task_=
struct *p)
 	}
 }
=20
+/*
+ * Find the root domain where a DL task's bandwidth is currently
+ * accounted. For a sleeping task that was moved between cpusets
+ * without running, task_rq(p)->rd may be stale. Use the task's
+ * current cpus_mask (not yet updated to the new mask) to find the
+ * actual root domain. Use cpus_mask rather than cpus_ptr, which
+ * may be temporarily narrowed by migrate_disable().
+ */
+static unsigned int dl_task_root_domain_cpu(struct task_struct *p)
+{
+	unsigned int cpu;
+
+	cpu =3D cpumask_first_and(&p->cpus_mask, cpu_active_mask);
+	BUG_ON(cpu >=3D nr_cpu_ids);
+	return cpu;
+}
+
 static void set_cpus_allowed_dl(struct task_struct *p,
 				struct affinity_context *ctx)
 {
-	struct rq *rq;
-
 	WARN_ON_ONCE(!dl_task(p));
=20
-	rq =3D task_rq(p);
 	/*
 	 * Migrating a SCHED_DEADLINE task between exclusive
 	 * cpusets (different root_domains) entails a bandwidth
@@ -3339,16 +3353,16 @@ static void set_cpus_allowed_dl(struct task_struct *p,
 	 * domain (see cpuset_can_attach()).
 	 */
 	if (dl_task_needs_bw_move(p, ctx->new_mask)) {
-		struct dl_bw *src_dl_b;
+		unsigned int src_cpu =3D dl_task_root_domain_cpu(p);
+		struct dl_bw *src_dl_b =3D &cpu_rq(src_cpu)->rd->dl_bw;
=20
-		src_dl_b =3D dl_bw_of(cpu_of(rq));
 		/*
 		 * We now free resources of the root_domain we are migrating
 		 * off. In the worst case, sched_setattr() may temporary fail
 		 * until we complete the update.
 		 */
 		raw_spin_lock(&src_dl_b->lock);
-		__dl_sub(src_dl_b, p->dl.dl_bw, dl_bw_cpus(task_cpu(p)));
+		__dl_sub(src_dl_b, p->dl.dl_bw, dl_bw_cpus(src_cpu));
 		raw_spin_unlock(&src_dl_b->lock);
 	}
=20
@@ -3358,10 +3372,13 @@ static void set_cpus_allowed_dl(struct task_struct *p,
 bool dl_task_needs_bw_move(struct task_struct *p,
 			   const struct cpumask *new_mask)
 {
+	unsigned int cpu;
+
 	if (!dl_task(p))
 		return false;
=20
-	return !cpumask_intersects(task_rq(p)->rd->span, new_mask);
+	cpu =3D dl_task_root_domain_cpu(p);
+	return !cpumask_intersects(cpu_rq(cpu)->rd->span, new_mask);
 }
=20
 /* Assumes rq->lock is held */
