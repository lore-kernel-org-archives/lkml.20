Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB1746C836;
	Mon, 28 Sep 2026 07:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578903; cv=none; b=nyQHS3E5LqgbIKZwugRUY5DPvee/Ws1VxEUrHdnCsJkqirTG1J0MkeS/SBliEAyYlNTfQ/dDFxflVO6+hdfy6+2L9ZlEfMGtMcq2C8zawrhT+0jp2OQMvnsWw2TyFdM+WLANjsrn1tUNjq/55brnBnMjIvBuC01ZXCzlurOAdKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578903; c=relaxed/simple;
	bh=+TCa9zYiu78JImC9jqp425Q9x5gEehtm0l+M91JSC2I=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=oWcGYZj+tYndqllmKB9lfWsJbWJOtds+b78xc6xXJLhUj09+Swk5O+o8I7AgXL5NudTeVGGvGzCcxdE57OO4Xrh4KpclnkJK/hQVjSfdJuAIunR3zN/yd0IpJQgoNRNvtAFPsjQigZRc7VukjmF9JSyjWJWv5f78PN3CR/EFXTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AvE5ccbT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PAquzShj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AvE5ccbT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PAquzShj"
Date: Mon, 28 Sep 2026 07:01:39 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578900;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uOyCBhBgueoSU0QnW6hbNmOoqKF3HUtSifiKnb+DRaU=;
	b=AvE5ccbToc83DCc0qj18TbtQJDKwXlOTP4ZargQ/wgvU1FWN00wdrKzSyJG759yScn7/3h
	bsVf3/7SHhJnHNqDil1mHvgOLJEh47NdSHuFsRoXs11w8tS3xw7ZpJNLiChcViPHf2dg33
	tcTELtBQSZncD/fJNk3rKLZoPHwiAC+owT95uc8sIqPPcTy+7iK5j2P4LWDs0IO8S+OV/I
	foKQRBY6cikcN4HkFWxSW7HkO/ss7YPfXvSH+hAfX6+WVVkX9OHU3zCcBoieVqxxJlz6+f
	k545fPasgswLz8o5P0U2kdA9jt3b4q8y+rhNCBEnYX/2S2fpW+8M6X2hlF7wAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578900;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uOyCBhBgueoSU0QnW6hbNmOoqKF3HUtSifiKnb+DRaU=;
	b=PAquzShjy+arjPc4VHeKgwf6mAP9bWhzTU4dvWmLv79l8AH0z8/SoEh1ZKtrrbV/u0char
	yMQGEP2X/4h2F4DQ==
From: "tip-bot2 for Andrea Righi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/core: Dequeue waking proxy donors before reset
Cc: Andrea Righi <arighi@nvidia.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260922165445.943315-3-arighi@nvidia.com>
References: <20260922165445.943315-3-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057889925.3910103.15593802008016754489.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     8f8c0417e97382c3473ef56b0cd472badb40e4a0
Gitweb:        https://git.kernel.org/tip/8f8c0417e97382c3473ef56b0cd472badb4=
0e4a0
Author:        Andrea Righi <arighi@nvidia.com>
AuthorDate:    Tue, 22 Sep 2026 18:51:41 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:38 +02:00

sched/core: Dequeue waking proxy donors before reset

proxy_needs_return() resets an active donor while holding blocked_lock.
proxy_reset_donor() invokes scheduling-class callbacks, adding an
unnecessary raw-spinlock nesting.

For an EXT donor, resetting rq->donor first calls put_prev_task_scx()
while SCX_TASK_QUEUED and is_blocked are still set. That path reenqueues
the retained donor through scx_do_enqueue_task(), only for the following
block_task() to dequeue it again.

Split block_task() so the waking donor is first dequeued from its
scheduling class while it is still rq->donor. This lets
dequeue_task_scx() end the donor's running session and clear
SCX_TASK_QUEUED before proxy_reset_donor() invokes put_prev_task_scx().
Keep the generic on_rq state set until donor references are replaced,
then complete the runqueue removal.

This follows the normal sleep ordering, avoids transiently re-enqueuing
the waking donor, and moves the scheduling-class callbacks outside
blocked_lock.

This is a preparatory change to support proxy execution with sched_ext.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260922165445.943315-3-arighi@nvidia.com
---
 kernel/sched/core.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f34e73c..07cc171 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2252,7 +2252,8 @@ void deactivate_task(struct rq *rq, struct task_struct =
*p, int flags)
 	dequeue_task(rq, p, flags);
 }
=20
-static void block_task(struct rq *rq, struct task_struct *p, unsigned long t=
ask_state)
+static bool dequeue_block_task(struct rq *rq, struct task_struct *p,
+			       unsigned long task_state)
 {
 	int flags =3D DEQUEUE_NOCLOCK;
=20
@@ -2273,9 +2274,15 @@ static void block_task(struct rq *rq, struct task_stru=
ct *p, unsigned long task_
 	 *
 	 * Where __schedule() and ttwu() have matching control dependencies.
 	 *
-	 * After this, schedule() must not care about p->state any more.
+	 * Once the caller invokes __block_task(), schedule() must not care about
+	 * p->state any more.
 	 */
-	if (dequeue_task(rq, p, DEQUEUE_SLEEP | flags))
+	return dequeue_task(rq, p, DEQUEUE_SLEEP | flags);
+}
+
+static void block_task(struct rq *rq, struct task_struct *p, unsigned long t=
ask_state)
+{
+	if (dequeue_block_task(rq, p, task_state))
 		__block_task(rq, p);
 }
=20
@@ -3781,6 +3788,8 @@ static inline void proxy_reset_donor(struct rq *rq)
  */
 static inline bool proxy_needs_return(struct rq *rq, struct task_struct *p)
 {
+	bool dequeued;
+
 	/*
 	 * Typically per __set_task_cpu(), task_cpu(p) =3D=3D p->wake_cpu.
 	 *
@@ -3803,12 +3812,23 @@ static inline bool proxy_needs_return(struct rq *rq, =
struct task_struct *p)
 		/* If already current, don't need to return migrate */
 		if (task_current(rq, p))
 			return false;
-
-		/* If we're return migrating the rq->donor, switch it out for idle */
-		if (task_current_donor(rq, p))
-			proxy_reset_donor(rq);
 	}
-	block_task(rq, p, TASK_WAKING);
+
+	dequeued =3D dequeue_block_task(rq, p, TASK_WAKING);
+
+	/*
+	 * Dequeue @p from its scheduling class before resetting rq->donor.
+	 * In particular, sched_ext needs to end the donor's running session
+	 * and clear SCX_TASK_QUEUED before put_prev_task_scx() is called by
+	 * proxy_reset_donor(); otherwise it would reenqueue the blocked donor.
+	 *
+	 * Keep on_rq set until all donor references have been replaced.
+	 */
+	if (task_current_donor(rq, p))
+		proxy_reset_donor(rq);
+
+	if (dequeued)
+		__block_task(rq, p);
 	return true;
 }
 #else /* !CONFIG_SCHED_PROXY_EXEC */
