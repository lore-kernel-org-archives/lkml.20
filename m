Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D79E455603;
	Mon, 28 Sep 2026 07:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578900; cv=none; b=ACLgF3GV5NBzXN4+S5ZE7A464SqKzRoF+VKaYacp4Ur7Oq3vBlg4De1QyQ7h+QH6diegmtrhq1uNqJw+/QSf2eF5GqdRL2DBSrdEZTp+VCu3xP+DooptvuLDn1Fa3q+7LxZqzXF7t+/6iEGXmFmO7oyvgFbWaxyE0TYuN1gdyTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578900; c=relaxed/simple;
	bh=d+neYrwIalxZdGpcQludDDlnaD6zTIvZGvDH0NOavoo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=noHRlMFqlrVLjMNprL3izdqCacWh4gp8qQTeLt49N5spsckCKf2tLRaRjeLu1BZzH8VxJizO9OvCzFtz/IQTbXQ4NDSxTkjWH4TIlyEqRzQtGqTA3DKo6x/XYufKATK+kDgyLNbna/1t+53v+EhAno2pXZTTH3Xw1d7PtDvN+HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zukVPjyj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=P1Xejzol; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zukVPjyj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P1Xejzol"
Date: Mon, 28 Sep 2026 07:01:34 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790578896;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ie267plxn2+mXtW95FslOvxItXh79aI7/EUFWxkVGjU=;
	b=zukVPjyjPU5pM2MZyPYLYrjJZTnYC2zLDTgGKtJJOqyvYtRN4GuKUhLHE5EBrJ3KPz0joo
	DMUvqeKNF+TB55mG1AbDHyP/4c+IgPPkwf4va0CKeXqwDiCIWZYCMW3EBipePDWxFM6WYH
	0IAsUt7M2XmN/FXEKKqMTgxV3Pgob2S7tzALLCDjdtx3ofPEABGabuWIwwb0g9wergXma+
	YfRHWv8rD8HZVh2N0lw6lKtoHkIJQEq/UuGE+U+4Zt8wOkLnGNcb4Mow6QIziVxYq5T6VE
	M/F/OBomfv7SeA9PVfFBiSW9eETz15eFDe0rXpyoFNEFBjqMzHQjRg3zEEo48g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790578896;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ie267plxn2+mXtW95FslOvxItXh79aI7/EUFWxkVGjU=;
	b=P1XejzolDMU99nzMXhbkZsXrRa7fkZDEqsiWW5jrxW5h/x+MD8k8iTEQPcBsb+D+2RFBoz
	akBLMUkw1ha7DYAQ==
From: "tip-bot2 for Andrea Righi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched: Add sched_ext hooks for proxy execution
Cc: Andrea Righi <arighi@nvidia.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260922165445.943315-6-arighi@nvidia.com>
References: <20260922165445.943315-6-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179057889446.3910103.4166195861955272362.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     be100c77178ef2299a080eb698720832a870248b
Gitweb:        https://git.kernel.org/tip/be100c77178ef2299a080eb698720832a87=
0248b
Author:        Andrea Righi <arighi@nvidia.com>
AuthorDate:    Tue, 22 Sep 2026 18:51:44 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 28 Sep 2026 08:44:39 +02:00

sched: Add sched_ext hooks for proxy execution

Proxy execution splits the scheduling context (the donor) from the
execution context (the lock owner). sched_ext needs to observe that
split at three points in __schedule():

 - whether a blocked EXT task can be retained on the runqueue as a
   donor,
 - when a donor's scheduling context starts driving a lock owner,
 - after proxy resolution, when deferred reenqueue work that was blocked
   by an active proxy relationship can be retried.

Introduce scx_allow_proxy_exec(), scx_proxy_donor_start() and
scx_proxy_reenqueue_retry(), and add their call sites in __schedule().
The implementations are empty here and are filled in by the sched_ext
changes that follow, so that all the sched core changes needed by proxy
execution stay together in the preparatory patches.

SCHED_PROXY_EXEC still depends on !SCHED_CLASS_EXT, so the new hooks are
inert: they are compiled out with CONFIG_SCHED_CLASS_EXT=3Dn and
unreachable otherwise.

This is a preparatory change to support proxy execution with sched_ext.
No functional change.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260922165445.943315-6-arighi@nvidia.com
---
 kernel/sched/core.c    | 12 +++++++-----
 kernel/sched/ext/ext.c | 13 +++++++++++++
 kernel/sched/ext/ext.h |  7 +++++++
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 35374e0..acc8931 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7243,13 +7243,12 @@ static void __sched notrace __schedule(int sched_mode)
 		}
 	} else if (!preempt && prev_state) {
 		/*
-		 * We pass task_is_blocked() as the should_block arg
-		 * in order to keep mutex-blocked tasks on the runqueue
-		 * for slection with proxy-exec (without proxy-exec
-		 * task_is_blocked() will always be false).
+		 * Keep mutex-blocked tasks on the runqueue for proxy execution
+		 * only when their scheduling class allows it. Without proxy
+		 * execution, task_is_blocked() always returns false.
 		 */
 		try_to_block_task(rq, prev, &prev_state,
-				  !task_is_blocked(prev));
+				  !task_is_blocked(prev) || !scx_allow_proxy_exec(prev));
 		switch_count =3D &prev->nvcsw;
 	}
=20
@@ -7270,6 +7269,7 @@ pick_again:
 			}
 			if (next =3D=3D rq->idle) {
 				zap_balance_callbacks(rq);
+				scx_proxy_reenqueue_retry(rq, next);
 				goto keep_resched;
 			}
 		}
@@ -7290,6 +7290,8 @@ pick_again:
 			donor->sched_class->put_prev_task(rq, donor, donor);
 			donor->sched_class->set_next_task(rq, donor, SNT_PICK);
 		}
+		scx_proxy_donor_start(rq);
+		scx_proxy_reenqueue_retry(rq, next);
 	} else {
 		rq_set_donor(rq, next);
 	}
diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 53275bc..3f79156 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -24,6 +24,11 @@
=20
 DEFINE_RAW_SPINLOCK(scx_sched_lock);
=20
+bool scx_allow_proxy_exec(const struct task_struct *p)
+{
+	return true;
+}
+
 /*
  * NOTE: sched_ext is in the process of growing multiple scheduler support a=
nd
  * scx_root usage is in a transitional state. Naked dereferences are safe if=
 the
@@ -1079,6 +1084,10 @@ static void schedule_deferred_locked(struct rq *rq)
 	schedule_deferred(rq);
 }
=20
+void scx_proxy_reenqueue_retry(struct rq *rq, struct task_struct *next)
+{
+}
+
 void schedule_dsq_reenq(struct scx_sched *sch, struct scx_dispatch_q *dsq,
 			u64 reenq_flags, struct rq *locked_rq)
 {
@@ -3065,6 +3074,10 @@ static void set_next_task_scx(struct rq *rq, struct ta=
sk_struct *p, enum snt_e t
 	}
 }
=20
+void scx_proxy_donor_start(struct rq *rq)
+{
+}
+
 static enum scx_cpu_preempt_reason
 preempt_reason_from_class(const struct sched_class *class)
 {
diff --git a/kernel/sched/ext/ext.h b/kernel/sched/ext/ext.h
index 0b7fc46..3cfbfeb 100644
--- a/kernel/sched/ext/ext.h
+++ b/kernel/sched/ext/ext.h
@@ -20,6 +20,9 @@ void scx_rq_deactivate(struct rq *rq);
 int scx_check_setscheduler(struct task_struct *p, int policy);
 bool task_should_scx(int policy);
 bool scx_allow_ttwu_queue(const struct task_struct *p);
+bool scx_allow_proxy_exec(const struct task_struct *p);
+void scx_proxy_donor_start(struct rq *rq);
+void scx_proxy_reenqueue_retry(struct rq *rq, struct task_struct *next);
 void init_sched_ext_class(void);
=20
 static inline u32 scx_cpuperf_target(s32 cpu)
@@ -54,6 +57,10 @@ static inline void scx_rq_deactivate(struct rq *rq) {}
 static inline int scx_check_setscheduler(struct task_struct *p, int policy) =
{ return 0; }
 static inline bool task_on_scx(const struct task_struct *p) { return false; }
 static inline bool scx_allow_ttwu_queue(const struct task_struct *p) { retur=
n true; }
+static inline bool scx_allow_proxy_exec(const struct task_struct *p) { retur=
n true; }
+static inline void scx_proxy_donor_start(struct rq *rq) {}
+static inline void scx_proxy_reenqueue_retry(struct rq *rq,
+					     struct task_struct *next) {}
 static inline void init_sched_ext_class(void) {}
=20
 #endif	/* CONFIG_SCHED_CLASS_EXT */
