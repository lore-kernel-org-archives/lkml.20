Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5A845C6E0;
	Mon, 28 Sep 2026 07:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578905; cv=none; b=ObX3Z9hV5xqgGTMxkEOAl4DIWKS0IBAS/TozMyL70E6ykXjRwnim13X9m9tIx7dc2QcMb1RiW+/DQqepNaj8RqkzIr34edBcqH0sFzfgEkiB8wxalF9sUnCs3RTsKigJN4KXB26KJf4E18KaI7elFH4zwJU1CJLJiltDlk/9t8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578905; c=relaxed/simple;
	bh=ZBBKfzcfiFJhClhWr+FXbJInQlGgpZHIJK3LzPxxIRE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=BZYLUcIFxZkIeY6NabVuiYGGXXKKzlLw6i5dMRmREZzLKpsxAZ8Su8zggqGsxeEgItybwwKorySecg8Pc9/ZmDkvg4k3ecuo8SypmeCbsgraL52bX/f+byNnk6cEk9JsQHqpvJXN9g0WEHneli3i9npyYRrzMbLmk+bW5w/MSlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JCmZRorS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Hu63YoW4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JCmZRorS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Hu63YoW4"
Date: Mon, 28 Sep 2026 07:01:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578902;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/L5rYmKI2T45Q6xQW/ApGtckg/5Fv5nw3Iss3e1wyoU=;
	b=JCmZRorSe8Sx5dhSgsmLATFyZqjUtlxX9PYhBG8IRQOsUjqw8RjrAkLv/GM7xiRxmI463L
	B9gIcvJpwP2bQwmxuDtpEvz/ND1aeWoYZaiyUn6dcf/GrRtk6hL8u2j4mQAsdjiZzJHz0g
	08UdPY1WPzivs7w512nBEQO1BVmh/UNnKRQlAmqMh6LkCQh02eUUMEMwG3bEApq2c64G1u
	EyQamMqg0By2UlGb9MqRhTIe6k+CKc1Rh4IarKHwFe/q/LAFL82PvqZipxbQKjOu3RQUx6
	2kprObGigLzd7zKNNxC0thCUZaOaeZ1ERAQBMLEmdM+iDuBEccpk/el58EDF/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578902;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/L5rYmKI2T45Q6xQW/ApGtckg/5Fv5nw3Iss3e1wyoU=;
	b=Hu63YoW4jXg9Gql4hfsUE1088PjZFOMOZlpv6D3iRQzjTaCUCdrADs2hoDhGm+UVO1+vOa
	E9ikVWKUkjyLLTCg==
From: "tip-bot2 for Andrea Righi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/core: Drop mutex locks before proxy rescheduling
Cc: Andrea Righi <arighi@nvidia.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 K Prateek Nayak <kprateek.nayak@amd.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260922165445.943315-2-arighi@nvidia.com>
References: <20260922165445.943315-2-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057890072.3910103.566976227943604547.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     313b652837d0541684680a7d07a95c5560441d4f
Gitweb:        https://git.kernel.org/tip/313b652837d0541684680a7d07a95c55604=
41d4f
Author:        Andrea Righi <arighi@nvidia.com>
AuthorDate:    Tue, 22 Sep 2026 18:51:40 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:38 +02:00

sched/core: Drop mutex locks before proxy rescheduling

find_proxy_task() can call proxy_resched_idle() from return
expressions inside mutex wait_lock and blocked task lock guard scopes.
Return expressions are evaluated before scoped guards are released, so
proxy_resched_idle() invokes scheduling-class callbacks while both raw
spinlocks are held.

Route these cases through a common label outside the guard scopes. The
common label is required because a direct return would evaluate
proxy_resched_idle() before guard cleanup and run the class callbacks
under the proxy-exec locks again.

This is a preparatory change to support proxy execution with sched_ext.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Link: https://patch.msgid.link/20260922165445.943315-2-arighi@nvidia.com
---
 kernel/sched/core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index ee9b443..f34e73c 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6980,7 +6980,7 @@ find_proxy_task(struct rq *rq, struct task_struct *dono=
r, struct rq_flags *rf)
 		if (!READ_ONCE(owner->on_rq) || owner->se.sched_delayed) {
 			/* XXX Don't handle blocked owners/delayed dequeue yet */
 			if (curr_in_chain)
-				return proxy_resched_idle(rq);
+				goto resched_idle;
 			__clear_task_blocked_on(p, NULL);
 			goto deactivate;
 		}
@@ -6992,7 +6992,7 @@ find_proxy_task(struct rq *rq, struct task_struct *dono=
r, struct rq_flags *rf)
 			 * and leave that CPU to sort things out.
 			 */
 			if (curr_in_chain)
-				return proxy_resched_idle(rq);
+				goto resched_idle;
 			goto migrate_task;
 		}
=20
@@ -7005,7 +7005,7 @@ find_proxy_task(struct rq *rq, struct task_struct *dono=
r, struct rq_flags *rf)
 			 * case we should end up back in find_proxy_task(), this time
 			 * hopefully with all relevant tasks already enqueued.
 			 */
-			return proxy_resched_idle(rq);
+			goto resched_idle;
 		}
=20
 		/*
@@ -7042,7 +7042,7 @@ find_proxy_task(struct rq *rq, struct task_struct *dono=
r, struct rq_flags *rf)
 			 * So schedule rq->idle so that ttwu_runnable() can get the rq
 			 * lock and mark owner as running.
 			 */
-			return proxy_resched_idle(rq);
+			goto resched_idle;
 		}
 		/*
 		 * OK, now we're absolutely sure @owner is on this
@@ -7062,6 +7062,8 @@ find_proxy_task(struct rq *rq, struct task_struct *dono=
r, struct rq_flags *rf)
 	}
 	return owner;
=20
+resched_idle:
+	return proxy_resched_idle(rq);
 deactivate:
 	proxy_deactivate(rq, p);
 	return NULL;
