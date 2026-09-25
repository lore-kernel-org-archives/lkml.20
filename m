Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA52548A8BB;
	Fri, 25 Sep 2026 10:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333656; cv=none; b=s2VbaoZod9O3mvxGRQbp60gjYGsmB/osLlWRHS1lgGFju+1EAviJDjtDGab8KhyZKDnUruIelz3M3/RmekicrNlI7JJwM4+KN5KhXLYoHh7X5kJPk4jlgd0BVjbfXt1iPFra8Gn1fgK/Jm5hGal5uqdKrWAqlKfaDZirPi3ULs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333656; c=relaxed/simple;
	bh=iU9RowY6TAY1PSp2OA+eNQJVbY4ho6Bm+znllhn6OoA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=mbmZ0Dc97rhK+QdB7YZAY8InNvlUDW/fKTgDl9U0H+xhymVj90QrmY4Ul4CbGzAeAFqW0uKKT2+CGBpPbEapn4VUuIk2gouaiMB8ZgXFzEFI9hAU1mSh37ZSahyllzFn9tM18gijAITvrxufnlSuAjyjNw+2Vw6Aqt6PI3x+3Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bzho6rx3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TuOa1LsT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bzho6rx3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TuOa1LsT"
Date: Fri, 25 Sep 2026 10:54:10 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333652;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gj+PeqyaJatbnTzxyymyL8aQ1T0QHKlD93BNeNX6gkQ=;
	b=bzho6rx3MUb9IQZOs0e+Jbq2Porr4xMQplN/jKP5x1geAXdBDYmAfTn2xuhXMD0+UEmyAF
	t8Wh/XfDKqtg0JYqOn2QzTFo97lpfRq4u5u+eeXZpdcbZ537Eo6Ff32ZkGFnsk2V8Dvoga
	szwU3otl0RdO8nREtQj6Hhu4LDBb3LNGMaMcvskI1dYmhwsfuR2MpLaqd3ApgaLLKBLYLX
	VQUkwOtM5izp0R1r+jzz2Xc5O9aN+UdYQP4VWUcB2vgJREtXE8eI/uBeajp1hkUqS3Xj9f
	8EacL3LT1x5lMP2kHAidKXEbyBVV2HxPZ7mDQv7Rr++fPZONkJMm6tX5dVZr4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333652;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gj+PeqyaJatbnTzxyymyL8aQ1T0QHKlD93BNeNX6gkQ=;
	b=TuOa1LsTAoVnAuwh0/UX7aCc7SCIJIIAHncLe+0FU5CBE0q7AOblhyDGgyk3wbhB6sz1yb
	6ODuvMASlsOKYNCw==
From: "tip-bot2 for Hui Su" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/core: Remove redundant core_sched_seq
Cc: Hui Su <sh_def@163.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260915163138.2973969-1-sh_def@163.com>
References: <20260915163138.2973969-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033365058.2819794.4873909017186114311.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     fbbc63fed0b09c8c5cf3972db8922ae98406ceec
Gitweb:        https://git.kernel.org/tip/fbbc63fed0b09c8c5cf3972db8922ae9840=
6ceec
Author:        Hui Su <sh_def@163.com>
AuthorDate:    Wed, 16 Sep 2026 01:31:38 +09:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:58 +02:00

sched/core: Remove redundant core_sched_seq

core_sched_seq records whether an rq has consumed the pick made by the
last core-wide selection.

However, rq->core_pick already carries the same per-rq state. A core-wide
selection leaves core_pick populated only for siblings which still need to
consume their picks. It is cleared when the current CPU consumes its pick,
when a sibling is already running the selected task, or when a pending pick
is consumed through the fastpath. The CPU offline path clears it as well.

core_task_seq and core_pick_seq serve a separate purpose. core_task_seq
changes when the task set changes and for each new core-wide pick, while
core_pick_seq records the task sequence on which the selection was made.
Their equality therefore establishes that a pending core_pick is still
valid.

Consequently, once core_pick_seq =3D=3D core_task_seq, a non-NULL core_pick is
sufficient to tell that this rq still has a pick to consume.
core_sched_seq duplicates that pending/consumed state.

Remove core_sched_seq and use core_pick directly as the pending marker.

Testing included an instrumented comparison of the old and new pending
predicates under core-scheduling stress. Additional guest tests exercised
repeated core-cookie lifecycles, forced idle, and CPU hotplug under load.
No predicate divergence or kernel warning was observed.

Signed-off-by: Hui Su <sh_def@163.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260915163138.2973969-1-sh_def@163.com
---
 kernel/sched/core.c  | 10 ++++------
 kernel/sched/sched.h |  1 -
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index d368aaf..ee9b443 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6276,10 +6276,7 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 	 * selection. In this case, do a core-wide selection.
 	 */
 	if (rq->core->core_pick_seq =3D=3D rq->core->core_task_seq &&
-	    rq->core->core_pick_seq !=3D rq->core_sched_seq &&
 	    rq->core_pick) {
-		WRITE_ONCE(rq->core_sched_seq, rq->core->core_pick_seq);
-
 		next =3D rq->core_pick;
 		rq->dl_server =3D rq->core_dl_server;
 		rq->core_pick =3D NULL;
@@ -6311,11 +6308,13 @@ restart:
 	}
=20
 	/*
-	 * core->core_task_seq, core->core_pick_seq, rq->core_sched_seq
+	 * core->core_task_seq, core->core_pick_seq
 	 *
 	 * @task_seq guards the task state ({en,de}queues)
 	 * @pick_seq is the @task_seq we did a selection on
-	 * @sched_seq is the @pick_seq we scheduled
+	 *
+	 * Once a core-wide selection is committed, a non-NULL core_pick denotes
+	 * a pick which still needs to be consumed on this CPU.
 	 *
 	 * However, preemptions can cause multiple picks on the same task set.
 	 * 'Fix' this by also increasing @task_seq for every pick.
@@ -6422,7 +6421,6 @@ restart:
=20
 	rq->core->core_pick_seq =3D rq->core->core_task_seq;
 	next =3D rq->core_pick;
-	rq->core_sched_seq =3D rq->core->core_pick_seq;
=20
 	/* Something should have been selected for current CPU */
 	WARN_ON_ONCE(!next);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 1b64be5..f7d0b64 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1371,7 +1371,6 @@ struct rq {
 	struct task_struct	*core_pick;
 	struct sched_dl_entity	*core_dl_server;
 	unsigned int		core_enabled;
-	unsigned int		core_sched_seq;
 	struct rb_root		core_tree;
=20
 	/* shared state -- careful with sched_core_cpu_deactivate() */
