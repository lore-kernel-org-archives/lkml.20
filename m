Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70323BED23
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619651; cv=none; b=Z8cmdciA+YwKSSpxw6vzdMhdQgWSMXYLIpbCXmZU15DMIU+Tj0PDJNnUCIaQ/QfZaq6ewNrpIfY9GKEfZjaUqoa2CY6UE2nqoHELlIMfjy3THSH0e3/0mbD2r04+7+Uzq6fZx7Pi1UT71lZ9JDQLVhszmvzptVhyzvYNdKK0I7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619651; c=relaxed/simple;
	bh=EhzHdBWaVd2CA9AxJQCiWMZlyt1B78tq9q2Ffexiep4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OzDvIR8S6LlxAAgWo92sIibojN4lquLkAS6zqD1yqinXXsAxQfU1I7stcPIDqqQ9hnzzh+6let0s0bVSMuZtBtQenzaR3bDN58YUVEeLMMTHzqm9s97Zy0unm0jxFkx3iaJAWZa1Xas+fJLut4YlE7KHPu1uEBCbYa9hIyMuem8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D7ziT+dx; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D7ziT+dx"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86b3c58d686so765193b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789619646; x=1790224446; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48US/8NeMBTIu8PjHXwAbDh6N6z1er052DCS5yC+V3k=;
        b=D7ziT+dx7hz0U0OorMZ94kqWCStA4nxePKYH+vj8imiFfD1tJA2KD5u31OqaPG0Iwg
         WQWStHhh+TZJxGcYQ4bK8JSnxpURuUBBTcwORq8YNljFlFRGrN++fEvj2GzeX2Kx2Z/j
         e3QmbM1xtpNMZjSumESJ06DUYkmwEkudAsHkBEvYXAySzsEaqCU8ql3pPm7U2O3ClGmi
         ogvpjWNYR9YJty4x5SSkZGcr9oJfhDjWJbq35BqmySlGgsUquhGBplwaUMw0xuQ72bVM
         yzSNWw3e8nYURSu/vsjjVqUxzNaq8yH+olncUnGlixQ9fRY1QlUb+QyL/zTTAPFQfloh
         ymvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619646; x=1790224446;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48US/8NeMBTIu8PjHXwAbDh6N6z1er052DCS5yC+V3k=;
        b=Oc0F6KpGBaIZVx59edB6lO+BhhUIhaLl+HffEF/BLZJuWRuiIf43FslFHUK6T/jGhd
         df52AHW+wmPtPvLBhNRBJaYyc0BMYS1PijRh1jK2Rjfrr77M/Lz5QQE0BFGR2berqI+G
         nkkXHVHE7VvpMcf5Y5sDT4XtcREKSQAEybgo/kfsew9On9s49IQOoTfYeJQb2e002iKk
         gEAL5JRxXKlO0W5XP/uilVu9UYHK95zqH3e8jnuzCoTlkhbZ+Fs6nHP4n4j5meHBTp6S
         Kh5X9KqO+zEm6xjx+fDXVFEd4HF/yJFshWezILVlAu4AhFNNye96Cb22+3Xt7jwZ4LAU
         Iy2Q==
X-Gm-Message-State: AFuF++nPSutiNo2W+qF5G9I5MXAjezumlzvJ/qcWFZvBK7nG9HBwoOcb
	2ofOmFIyvAT99uE24z5N9Gbef+pkYhTgmZ6uTN3XPkwuF+dASXP1Ns+xEYdrdzwpQlLJN3tjlKz
	lRQZVeDH9saxF055zAlF9Klrp0022yD6+SlGPAngPJNCu1ygv5KNtNdeuW+X7CwiF4M71D4Jg0x
	S2UFvlCOSBS1MRvRgaMw8eJFMgxSBWdmFq/7eInnxTTEbmeyZUHQJfQCY=
X-Received: from pfbcz3.prod.google.com ([2002:aa7:9303:0:b0:848:41c3:4371])
 (user=suleiman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:6087:b0:872:20f2:3294 with SMTP id d2e1a72fcca58-8723dd0f2b6mr11493394b3a.21.1789619645832;
 Wed, 16 Sep 2026 21:34:05 -0700 (PDT)
Date: Thu, 17 Sep 2026 04:33:33 +0000
In-Reply-To: <20260917043339.2093426-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917043339.2093426-10-suleiman@google.com>
Subject: [RFC PATCH 09/12] futex: Wake up donor in PING futex unlock.
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

Now that PING blockers can act as donors, it makes sense to wake up
the donor instead of the top_waiter when unlocking.

Signed-off-by: Suleiman Souhlal <suleiman@google.com>
---
 kernel/futex/ping.c | 56 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 10 deletions(-)

diff --git a/kernel/futex/ping.c b/kernel/futex/ping.c
index 5bf2293bf582..df701b437f16 100644
--- a/kernel/futex/ping.c
+++ b/kernel/futex/ping.c
@@ -478,10 +478,46 @@ int futex_lock_ping(u32 __user *uaddr, unsigned int flags, ktime_t *time,
 	return ret;
 }
 
+#ifdef CONFIG_SCHED_PROXY_EXEC
+static inline
+struct task_struct *ping_current_proxy_donor(struct futex_pi_state *ping_state)
+{
+	struct task_struct *ret = NULL;
+
+	if (sched_proxy_exec()) {
+		struct task_struct *donor;
+
+		raw_spin_lock(&current->blocked_lock);
+		donor = current->blocked_donor;
+		if (donor) {
+			void *ping_lock = (void *)&ping_state->ping_mutex;
+
+			raw_spin_lock_nested(&donor->blocked_lock,
+					     SINGLE_DEPTH_NESTING);
+			if (__get_task_blocked_on(donor) == ping_lock) {
+				ret = get_task_struct(donor);
+				__clear_task_blocked_on(donor, ping_lock);
+				current->blocked_donor = NULL;
+			}
+			raw_spin_unlock(&donor->blocked_lock);
+		}
+		raw_spin_unlock(&current->blocked_lock);
+	}
+	return ret;
+}
+#else
+static inline
+struct task_struct *ping_current_proxy_donor(struct futex_pi_state *ping_state)
+{
+	return NULL;
+}
+#endif
+
 int futex_unlock_ping(u32 __user *uaddr, unsigned int flags)
 {
 	struct futex_pi_state *ping_state;
 	u32 new, uval, vpid = task_pid_vnr(current);
+	struct task_struct *next;
 	union futex_key key = FUTEX_KEY_INIT;
 	struct futex_q *top_waiter;
 	DEFINE_WAKE_Q(wake_q);
@@ -528,15 +564,15 @@ int futex_unlock_ping(u32 __user *uaddr, unsigned int flags)
 	if (!ping_state)
 		goto out_unlock;
 	raw_spin_lock_irq(&ping_state->ping_mutex.wait_lock);
-	if (ping_state->owner != current) {
-		raw_spin_unlock_irq(&ping_state->ping_mutex.wait_lock);
-		goto out_unlock;
-	}
+
+	next = ping_current_proxy_donor(ping_state);
 	get_ping_state(ping_state);
 	/* Leave it queued, it gets unqueued on the lock side */
-	get_task_struct(top_waiter->task);
-	wake_q_add_safe(&wake_q, top_waiter->task);
-	clear_task_blocked_on(top_waiter->task, &ping_state->ping_mutex);
+	if (next == NULL) {
+		next = get_task_struct(top_waiter->task);
+		clear_task_blocked_on(next, &ping_state->ping_mutex);
+	}
+	wake_q_add_safe(&wake_q, next);
 	spin_unlock(&hb->lock);
 
 	/*
@@ -546,10 +582,10 @@ int futex_unlock_ping(u32 __user *uaddr, unsigned int flags)
 	 */
 	new = FUTEX_WAITERS;
 	if (ping_state->handoff) {
-		new |= task_pid_vnr(top_waiter->task);
+		new |= task_pid_vnr(next);
 		ping_state->handoff = 0;
 		ping_state->pickup = 1;
-		WRITE_ONCE(ping_state->ping_mutex.owner, top_waiter->task);
+		WRITE_ONCE(ping_state->ping_mutex.owner, next);
 	} else
 		WRITE_ONCE(ping_state->ping_mutex.owner, NULL);
 	ret = lock_pi_update_atomic(uaddr, uval, new);
@@ -568,7 +604,7 @@ int futex_unlock_ping(u32 __user *uaddr, unsigned int flags)
 		}
 	}
 
-	ping_state_update_owner(ping_state, top_waiter->task);
+	ping_state_update_owner(ping_state, next);
 	raw_spin_unlock_irq_wake(&ping_state->ping_mutex.wait_lock, &wake_q);
 	put_ping_state(ping_state);
 	return 0;
-- 
2.55.0.1082.g2b9226bbc0-goog

