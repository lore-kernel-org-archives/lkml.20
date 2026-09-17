Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D433A3E97
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619652; cv=none; b=sY6kPfSHMymx3EvsbSpZkt29kZYVId6mcuh6yCIIa9ppa2Fj1fxO/3IAVlNw2FbMotYJcW4BLygjjkaNvOKTbJgjTfP7C23i84Tg7TVoSekMUJbmvaJpU1m1EJcg6byz+QsWQduNUxT5aleBppXN7bTWchEZqzsEDGfRM5BiO7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619652; c=relaxed/simple;
	bh=FlAJUxDZTy5DSJRi9+xcyW9t9UxoCG7ph8kRU5Qs0dk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qQvCQLIKtyMsAO97OG5SuaBgurMl1qVKXhOORJs1a39d28WMnfz3pu3x9Er96IWt6Z3GUYr2rXrR0vw3YUuWfrznIjcVWTi6T3AWaYja0eCw07uL2e5qTyXkCFUExv/sz0R9EPMy2bTS07eFYm9iQgBxkSQCHzoJt2CDc9ncZAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RK14xgq9; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RK14xgq9"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso793864a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789619648; x=1790224448; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wrAa7nuWDHelhYsLr/ekNyZ1GNe9/NxFjXsAX7Nn//k=;
        b=RK14xgq9211rmze2EJ+F1XiinhPrCBbqcrcHxErR7I9qGYtetoX8IU9Erqz7r8SRIH
         ujke+e+L1Qp2Cb1xymUkTrpxLXLs5km7fVViCQZzFR6rxsfFvPwJMDYzbDjPmir+GtG9
         WQwi3pjkyFVMnF2JT5/hBTxDKJV2WBlsoOdCISB8yt4ZLxfKgWMyxhARzLkKH/K9MUcs
         CTZjjkkrKfJKcKKuFBxpewwh76t1KaDJtJZULRXCPwcxyDuEXqRsLswfJb/r+YXXq0ic
         sNqf84OJlaNlMPu7ADYWa87r4SxieVLDtso4yGkjU0hB5fBeHVG1CvdeyiQBMDtV4jfv
         H/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619648; x=1790224448;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrAa7nuWDHelhYsLr/ekNyZ1GNe9/NxFjXsAX7Nn//k=;
        b=WI0n7J+ATZdlLCB2oloXJE6hoE0AJA0wiqDbayQHw8Qdj0KAwZdYTskjnLEaga/OwL
         jR6no1SQpcZXdD25jVq1Hs+oe50YtJkF243QCeU7Yh25GoYCnMDbCNGrBiYIOqP2vZkR
         5ORUW2ETd6cQbhExn3Kus+6mvTOsJHIEUpJMEWee+/ygNUZ6c5G2kmA+876dZL66Wn9I
         T8LrlxWVWwLlEnq7cNNpKpjaTqFq3ygwXJwzed2LBT7VNe2vGGUtQFYDtcJzE07/Z6qI
         xuNzuxn4WH5MEqr713xT5rtH2B1I46saj3NN53Wa4zLoTm73xQvIcXvj604rjCAiboEB
         bNxA==
X-Gm-Message-State: AFuF++n07Ulz433fBN2f5NfhUw/C2+WrLrGTiCB8g5ahjMBFdM3NQtQc
	B7DUQwFN/nesID9YZ8qM2CvWWjo/XVKe77rH29oCIbtVMBf3cVP9XULZjTspgWdOV7W764g0S2Q
	gXVSuH7Wg9FbwCxrqIuZhpTzLOWSrbwMlmo9e6jtkQbrjsX714nfI36YI+guFPogFVreL4S0Jlz
	R6HHqprFYMP4tVpv+j8ssvlxGrthpzKplxfW0tk4s5TQ1HbRoTBYodyeo=
X-Received: from pjbmv12.prod.google.com ([2002:a17:90b:198c:b0:39e:ac:d0ad])
 (user=suleiman job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:6c8f:b0:39e:345b:3322 with SMTP id 98e67ed59e1d1-39e345b3c87mr3835430a91.23.1789619647121;
 Wed, 16 Sep 2026 21:34:07 -0700 (PDT)
Date: Thu, 17 Sep 2026 04:33:34 +0000
In-Reply-To: <20260917043339.2093426-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917043339.2093426-11-suleiman@google.com>
Subject: [RFC PATCH 10/12] futex: Optimistic spinning for PING futexes.
From: Suleiman Souhlal <suleiman@google.com>
To: linux-kernel@vger.kernel.org
Cc: Suleiman Souhlal <suleiman@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	zhidao su <soolaugust@gmail.com>, John Stultz <jstultz@google.com>, 
	Qais Yousef <qyousef@google.com>, ssouhlal@FreeBSD.org
Content-Type: text/plain; charset="UTF-8"

This allows a thread to spin on the owner of the futex instead of
unconditionally spinning, if the owner is currently running on
another CPU.

TODO: Currently allows every task to attempt to spin at the same time.
In the future, spinning will probably either use an osq or only the
top waiter will be allowed to wait. We've seen some long latencies
when using an osq that we still need to investigate.

Signed-off-by: Suleiman Souhlal <suleiman@google.com>
---
 kernel/futex/ping.c | 80 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 67 insertions(+), 13 deletions(-)

diff --git a/kernel/futex/ping.c b/kernel/futex/ping.c
index df701b437f16..e5765b2d3834 100644
--- a/kernel/futex/ping.c
+++ b/kernel/futex/ping.c
@@ -301,6 +301,50 @@ static int futex_lock_ping_atomic(u32 __user *uaddr,
 	return attach_to_pi_owner(uaddr, newval, key, ps, exiting, true);
 }
 
+/*
+ * Returns >0 on successfully having taken the lock, <0 on error
+ */
+static int ping_spin_or_trylock(u32 __user *uaddr,
+				struct futex_pi_state *ping_state,
+				bool handoff)
+{
+	struct task_struct *owner = ping_mutex_owner(&ping_state->ping_mutex);
+	struct task_struct *new;
+	int ret;
+
+	if (owner && !owner_on_cpu(owner))
+		return 0;
+
+	/*
+	 * XXX We'll want to try to limit spinning either with an osq or
+	 * by only allowing the top waiter to spin.
+	 */
+
+	while (1) {
+		new = ping_mutex_owner(&ping_state->ping_mutex);
+		ret = 0;
+		if (!owner || !new || new == current) {
+			ret = futex_trylock_ping_state(uaddr, ping_state,
+			    handoff);
+			if (ret != 0)
+				break;
+			/* Spin on new owner if we didn't get the lock */
+			owner = ping_mutex_owner(&ping_state->ping_mutex);
+			goto next;
+		}
+		if (new != owner) {
+			owner = ping_mutex_owner(&ping_state->ping_mutex);
+			goto next;
+		}
+		if (!owner_on_cpu(owner) || need_resched())
+			break;
+next:
+		cpu_relax();
+	}
+
+	return ret;
+}
+
 /*
  * Return values:
  *     < 0: error.
@@ -387,9 +431,6 @@ int futex_lock_ping(u32 __user *uaddr, unsigned int flags, ktime_t *time,
 		queued = false;
 		should_handoff = false;
 		while (1) {
-			set_task_blocked_on(current, &q.ping_state->ping_mutex,
-					    BO_T_PING_FUTEX);
-
 			set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
 			if (!queued) {
 				futex_queue(&q, hb, current);
@@ -400,6 +441,26 @@ int futex_lock_ping(u32 __user *uaddr, unsigned int flags, ktime_t *time,
 				__release(q->lock_ptr);
 			}
 
+			preempt_disable();
+			set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
+			ret = ping_spin_or_trylock(uaddr, q.ping_state,
+						   should_handoff);
+			if (ret > 0) {
+				/* Got the futex */
+				ret = 0;
+				preempt_enable();
+				futex_q_lockptr_lock(&q);
+				goto out_unqueue;
+			} else if (ret < 0) {
+				preempt_enable();
+				futex_q_lockptr_lock(&q);
+				goto out_unqueue;
+			}
+			preempt_enable();
+
+			set_task_blocked_on(current, &q.ping_state->ping_mutex,
+					    BO_T_PING_FUTEX);
+
 			futex_do_wait(&q, to);
 
 			clear_task_blocked_on(current,
@@ -414,19 +475,12 @@ int futex_lock_ping(u32 __user *uaddr, unsigned int flags, ktime_t *time,
 				ret = -EINTR;
 				goto out_unqueue;
 			}
-
-			ret = futex_trylock_ping_state(uaddr, q.ping_state,
-						       should_handoff);
-			if (ret > 0) {
-				/* Got the futex */
-				ret = 0;
-				goto out_unqueue;
-			} else if (ret < 0)
-				goto out_unqueue;
 			should_handoff = true;
 		}
 
 out_unqueue:
+		__set_current_state(TASK_RUNNING);
+
 		/*
 		 * We got a pending signal or timeout, but the futex was handed
 		 * off to us. Fix up the return value to indicate success.
@@ -581,7 +635,7 @@ int futex_unlock_ping(u32 __user *uaddr, unsigned int flags)
 	 * no top_waiter.
 	 */
 	new = FUTEX_WAITERS;
-	if (ping_state->handoff) {
+	if (ping_state->handoff) { /* Don't handoff to donor */
 		new |= task_pid_vnr(next);
 		ping_state->handoff = 0;
 		ping_state->pickup = 1;
-- 
2.55.0.1082.g2b9226bbc0-goog

