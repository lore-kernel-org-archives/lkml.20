Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39E43AC0FC;
	Thu, 10 Sep 2026 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030929; cv=none; b=Nvs+MNVfwWewKZr80vsxZQePr9x1FvGQ0su76s2V42LeKgmVc0A/aS+8PYQt9UncsGMZRnF2KfHblIoc8Q+vPW1i7gT2YkmMO3jStBll8uPmCVymrkbs85MSGxHW8ZWaLcHVTuirZGvKp7721ROi/h1xmE7MN/AcSaYrnstuISw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030929; c=relaxed/simple;
	bh=bEJUuXBioSS67+lobFaSYctT8AaM90cx4VVR5VuMBJ4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=qfCawG2EDp/udVTl5O9XJ+s5CDjHn48XgNkQ4gD5GOWc5eiHOhksGYl7bbYvFMEhObeDKwnU1OSDnR4dczS1D6QwD0CAsHOBXys/lsAuPH1NbvaC5WAqjP4j6h9OjQ00m9HG1xR8H3J5tmlJ4K/B9BCrgCi9JIvoRzS6knZJQu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yU46ZSyo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vJYKniDl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yU46ZSyo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vJYKniDl"
Date: Thu, 10 Sep 2026 09:02:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789030924;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WLWDlWGJ70mi1URLREdbqQMOOkibZmjUTV0R6CT2W0k=;
	b=yU46ZSyo4tPrHtmgLiu5FmrIJDt8zc4brzzNWDRi2HqkkhWqF3bxsjDB5jwxJlyMBFH174
	aAWMoLkQ09oN8DVf16LCuUsk4YbfU8Ka+zxT2oiJqgCgXi9azk253dDgONufdKPOmYNe0t
	hsT2dgFXNV46NEdxnTpfXgK3/rfVOe1ocnJv9yeVslEaeNHig9CU7OHjxsYPdJ664T/HkK
	7Qm2nJiMUDw+KN2tVMX+EaTCPxTcep9d/g27GUauuNqIAwb6LqhOeJfXuSM3Lw6OR3E0uS
	V+MNO9wzS3d0Zfe+CxWa0x/gl0t6flOlhi+yfJDPfMLEKfSgkCNzMfUWxLeSRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789030924;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WLWDlWGJ70mi1URLREdbqQMOOkibZmjUTV0R6CT2W0k=;
	b=vJYKniDlF7EJo9nZewQItGUQ0KtfRicB3QqzbXsH4OFLiK7wsPYBLp/JMdRjzW0I8GAJ4K
	JOGlEfyyT3+vFCCA==
From: "tip-bot2 for Hui Su" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/core: Call wq_worker_tick() for the
 execution context
Cc: Hui Su <sh_def@163.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Tejun Heo <tj@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260902150208.1209922-2-sh_def@163.com>
References: <20260902150208.1209922-2-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178903092291.623050.6164374266661576402.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     f5741d2b34519d387edf6e9798fc7030c20a35f3
Gitweb:        https://git.kernel.org/tip/f5741d2b34519d387edf6e9798fc7030c20=
a35f3
Author:        Hui Su <sh_def@163.com>
AuthorDate:    Wed, 02 Sep 2026 23:02:09 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 10 Sep 2026 10:22:52 +02:00

sched/core: Call wq_worker_tick() for the execution context

wq_worker_tick() accounts CPU time and detects CPU-intensive work for
the kworker that is actually running. With proxy execution, rq->donor
is the scheduling context while rq->curr is the execution context.

Calling the hook with rq->donor can skip workqueue accounting when a
kworker is executing on behalf of a donor task. It can also account a
blocked kworker when the donor is a worker but rq->curr is the task
actually executing. The former can delay WORKER_CPU_INTENSIVE handling
and pool concurrency management, which can delay pending kernel work
and userspace operations depending on it.

Use rq->curr for the workqueue tick hook while retaining rq->donor for
scheduler accounting.

Fixes: af0c8b2bf67b ("sched: Split scheduler and execution contexts")
Signed-off-by: Hui Su <sh_def@163.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Tejun Heo <tj@kernel.org>
Link: https://patch.msgid.link/20260902150208.1209922-2-sh_def@163.com
---
 kernel/sched/core.c |  9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index b998ef6..7885ff7 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5776,8 +5776,8 @@ void sched_tick(void)
 {
 	int cpu =3D smp_processor_id();
 	struct rq *rq =3D cpu_rq(cpu);
-	/* accounting goes to the donor task */
-	struct task_struct *donor;
+	/* scheduler accounting goes to the donor task */
+	struct task_struct *curr, *donor;
 	struct rq_flags rf;
 	unsigned long hw_pressure;
 	u64 resched_latency;
@@ -5788,6 +5788,7 @@ void sched_tick(void)
 	sched_clock_tick();
=20
 	rq_lock(rq, &rf);
+	curr =3D rq->curr;
 	donor =3D rq->donor;
=20
 	psi_account_irqtime(rq, donor, NULL);
@@ -5813,8 +5814,8 @@ void sched_tick(void)
=20
 	perf_event_task_tick();
=20
-	if (donor->flags & PF_WQ_WORKER)
-		wq_worker_tick(donor);
+	if (curr->flags & PF_WQ_WORKER)
+		wq_worker_tick(curr);
=20
 	if (!scx_switched_all()) {
 		rq->idle_balance =3D idle_cpu(cpu);
