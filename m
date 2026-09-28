Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7949145FFD5;
	Mon, 28 Sep 2026 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578900; cv=none; b=DVjr4BIgejecc+ZJ+hDeOh20V2CNa9XVtlJA4QnrSuzif7qEki5k7ux+E6DAupmZDm5fT1nmF9v3lc/VHpaRudoCqiQL8vKs3iNj+aqcQ2OLaFpoIfwr6Gs1N1NKZw0+IwvQz4zimja489XgStolTrsbn+vSQaQvgOoJVFDic10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578900; c=relaxed/simple;
	bh=1PngQJLGWJXY/tN8pzH42n8QOQZxCqfkdEHSj8/Zm6A=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=nTJnTWK4isYpgn6AlyJFotCyMKItLkVNP2Lh7bszWFSPF2mmrZQ3XZmE9afL8GO3uFyMOwDFbQLvUjoTOrVXIHkjNbGFeJUzs5j1XCIx6PpcSAEDVjkVHKLxeM3+SbULkKXlpJdDuCPUCidzyEMgX5VN8H2Sra6NkVN0aFm8yPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Kc6KpqMg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=B4spenfE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Kc6KpqMg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="B4spenfE"
Date: Mon, 28 Sep 2026 07:01:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578897;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QES2SPlZUDExt+orwwuD2P21BkjPUVXsCdBNP2Nh8CQ=;
	b=Kc6KpqMgDm/6ebcEbSRxOvuVLk5LL2kxUw1ILq+/4raxGTs8jw5HOXDqcxckbZZ+GPx2jZ
	Fvdbj7jCOojM6+x5MSR4PlVTF93D4ic+9C+a5mJ+WWtA6QUXPtCg2vWLmu3NMm/sNdUoro
	88wS0O5YC90LL7VGUXpGZT/2Uxbh72VvVj8Gpydi5UQAIztCbZgx9RMJQvt2oYma9EH+e9
	3zgMkeHj+R/7w4EDsxEfsQL0AvQPQfkmJMKMY8W0BV7p/5Q/eXGRV2ra8eHhmBpLULtghx
	tGpp7rJKtOBnkpspqJYSKwTJmCgsqDOPFGeBrfbtvhT1Iq0pQw46oICFMVhitw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578897;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QES2SPlZUDExt+orwwuD2P21BkjPUVXsCdBNP2Nh8CQ=;
	b=B4spenfEnKdaNbRVrJD3tHaOcEhM0t4ps+0peEil92O0NuJOHvkWcsfqnVOo6qYUYLfDlx
	PDLvuV9bTsC3J8Cw==
From: "tip-bot2 for Andrea Righi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched: Add helper to block retained proxy donors
Cc: Andrea Righi <arighi@nvidia.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 John Stultz <jstultz@google.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260922165445.943315-5-arighi@nvidia.com>
References: <20260922165445.943315-5-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057889601.3910103.2077462865881471204.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     57c75e3ae38c40acb5882a57c36f2d5234e066d0
Gitweb:        https://git.kernel.org/tip/57c75e3ae38c40acb5882a57c36f2d5234e=
066d0
Author:        Andrea Righi <arighi@nvidia.com>
AuthorDate:    Tue, 22 Sep 2026 18:51:43 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:39 +02:00

sched: Add helper to block retained proxy donors

Scheduler ownership changes may need to turn a mutex-blocked task
retained on the runqueue for proxy execution back into a normally
blocked task.

Add sched_proxy_block_task() to perform that transition while holding
p->pi_lock and the task's runqueue lock. Reset an active donor to the
physical current task before blocking it. If DELAY_DEQUEUE keeps a FAIR
donor queued, the immediately following sched_change_begin() completes
the dequeue through switching_from_fair() before recording its queued
state.

This is a preparatory change to support proxy execution with sched_ext.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: John Stultz <jstultz@google.com>
Link: https://patch.msgid.link/20260922165445.943315-5-arighi@nvidia.com
---
 kernel/sched/core.c  | 28 ++++++++++++++++++++++++++++
 kernel/sched/sched.h |  6 ++++++
 2 files changed, 34 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 6b42f91..35374e0 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6834,6 +6834,34 @@ static void proxy_deactivate(struct rq *rq, struct tas=
k_struct *donor)
 	block_task(rq, donor, state);
 }
=20
+/*
+ * Remove a retained proxy donor before changing its scheduler ownership.
+ * The caller holds p->pi_lock, so p cannot wake and migrate if block_task()
+ * drops it from the runqueue. If DELAY_DEQUEUE keeps a blocked fair task
+ * queued, switching_from_fair() completes the dequeue in the immediately
+ * following sched_change_begin().
+ */
+void sched_proxy_block_task(struct rq *rq, struct task_struct *p)
+{
+	unsigned long state =3D READ_ONCE(p->__state);
+
+	lockdep_assert_held(&p->pi_lock);
+	lockdep_assert_rq_held(rq);
+
+	if (!p->is_blocked || !task_on_rq_queued(p))
+		return;
+	if (WARN_ON_ONCE(state =3D=3D TASK_RUNNING))
+		return;
+
+	if (task_current_donor(rq, p))
+		proxy_reset_donor(rq);
+
+	if (!p->se.sched_delayed)
+		block_task(rq, p, state);
+
+	WARN_ON_ONCE(task_on_rq_queued(p) && !p->se.sched_delayed);
+}
+
 static inline void proxy_release_rq_lock(struct rq *rq, struct rq_flags *rf)
 	__releases(__rq_lockp(rq))
 {
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index a0f391f..d41d23a 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2516,6 +2516,12 @@ static inline bool task_is_blocked(struct task_struct =
*p)
 	return !!p->blocked_on;
 }
=20
+#ifdef CONFIG_SCHED_PROXY_EXEC
+void sched_proxy_block_task(struct rq *rq, struct task_struct *p);
+#else
+static inline void sched_proxy_block_task(struct rq *rq, struct task_struct =
*p) {}
+#endif
+
 static inline int task_on_cpu(struct rq *rq, struct task_struct *p)
 {
 	return p->on_cpu;
