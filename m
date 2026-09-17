Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8945A3C4B89
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619651; cv=none; b=sFR4AHhLcEdlCWwMtTtrhYGo8Dk7fNd7cArqcRR26BK0faHZEXt3pZ3P0WW4CMhqtAP3CCiTP4+QeZpjeSw1dtok0TZVj3/repPxlRwr4nrfDmVb6C87xe/fD1tBaWJs8y/VLV90HqKtaiV7O8X4xxR8IcG6xr7Rsi31o1KrWS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619651; c=relaxed/simple;
	bh=0glP17tViegVOrpC8YhTjfFSd82Ld3O+ArMRj7ieEOM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d3PEqNN4MzA6D6lbIl0PPYNV5x0AjSE0fExyVXUmLyeBWGVlE9GNGOjKoY3AK9Ncr62Nfix74Tu9ZhuYhIFMmUZRaf0I6rRHGggg3mKMkKiFdBil8vLliSDEMTShh30Ti1a+gMVfoIzD9Fe/C7249BdiOEXCKoZ3/5BA5MZ63YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RAbqJs52; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RAbqJs52"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f80c76e6so8937425ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789619645; x=1790224445; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10JHcTrzupSF1uhcqjTzPBoiXPS1yfbQ+6EhNUxQ2A4=;
        b=RAbqJs52RFEfyKIVYgt+cPUT+BYlMfrszsVtxoqvrhrKxpnvgY3zHb8oNiPrX0kYJ6
         v46mI7ZWoCdDVk9Y4hMywhmk57lucQL2YypmLEsUDdTp8Jx2su9oFQcplZro7ZfEL8lY
         5sOHH0MPo97IjtI6ICePGJpiHWFs5E7YOHipAKRZTFyHzaTREJHAuZH2SaBQcpGq+hYJ
         pXGoP9+bpdTOPZEMWeyyNTWqEkP+RqGlgcm9DGAsftFKP5+75adBzAVzNY5u+zNmqTnI
         H/afQf4gO1zBCeP1EEEOQH6G4X75sKKEi9K9gtYszuS6X7TyxfhaYvDu3LtBxSu1xpeO
         1ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619645; x=1790224445;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10JHcTrzupSF1uhcqjTzPBoiXPS1yfbQ+6EhNUxQ2A4=;
        b=JHE+SHmOWU+YoxnIR+ogRofmdVMmSesb3yBRxIfFbygvU1RjdWzHHHMzLls832ZcV7
         Ue5wAyZ+k+rFzC2T4129zdzkUlemoCHmWV0tKBJLU/4gO24/PwvJqVriQxCCFIaKWTzH
         28pi7pDAWJO5JhR9ar7XVYCsIo6L7PUwbvVWZSCrvWtMmh4pcBX+VhqiHUsS/tudteau
         WYxKMxuJKgB9SFS6ihnN34mRvgE+38RdIqFRi2Mn6PmZP4nvILsKzPgZSWn5AUcN139J
         Imd9LSSi2BJZzktJe/G3RNhdLekVJ/ovQUwsZBT+uCptVXwrFw9cMHumaXQb0xs49xOr
         qZRA==
X-Gm-Message-State: AFuF++kQnkWub2Tr1ggyMH0tZrrYyqXl/8WI8YHDAGakjRHWWFfVK3pF
	ySikycqFqoyTDjkBDaWRAjUoJ8BJ3RPiZ2t+s/GwLVJ8dYLs4I1P5hun7bQqUSObB1PFtXWtbMD
	ftDL6gtlVMaHVQioqahXSy7X/7VyGQ/YKt1JlZufLR/ODJ+eCvN7j7cEE9ecJCz6O2jRlxJVSAv
	TUSl73ZI+xRqKrZxHcKs/StssqT/F259GftU4/w2TzTEzWpt8vcFfo2G8=
X-Received: from plcz17.prod.google.com ([2002:a17:903:4091:b0:2dd:1604:ef9d])
 (user=suleiman job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:da85:b0:2dd:89b1:7fd3 with SMTP id d9443c01a7336-2dd8dc06d6amr102021715ad.4.1789619644397;
 Wed, 16 Sep 2026 21:34:04 -0700 (PDT)
Date: Thu, 17 Sep 2026 04:33:32 +0000
In-Reply-To: <20260917043339.2093426-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917043339.2093426-9-suleiman@google.com>
Subject: [RFC PATCH 08/12] futex: Implement PING futex handoff.
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

Implement handoff for PING futexes, to prevent starvation in case of
a waiter being repeatedly stolen from.

Currently engages after being stolen from once, after which the next
unlocker hands off the futex such that it can't be stolen.

Signed-off-by: Suleiman Souhlal <suleiman@google.com>
---
 kernel/futex/futex.h |  2 ++
 kernel/futex/ping.c  | 45 ++++++++++++++++++++++++++++++++++----------
 2 files changed, 37 insertions(+), 10 deletions(-)

diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index c0560d30aaaa..113289779dd1 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -174,6 +174,8 @@ struct futex_pi_state {
 
 	struct task_struct *owner;
 	refcount_t refcount;
+	bool handoff;
+	bool pickup;
 
 	union futex_key key;
 } __randomize_layout;
diff --git a/kernel/futex/ping.c b/kernel/futex/ping.c
index 689f149f7150..5bf2293bf582 100644
--- a/kernel/futex/ping.c
+++ b/kernel/futex/ping.c
@@ -7,7 +7,8 @@
 #include "futex.h"
 
 static int futex_trylock_ping_state(u32 __user *uaddr,
-				    struct futex_pi_state *ping_state);
+				    struct futex_pi_state *ping_state,
+				    bool handoff);
 
 static void ping_state_update_owner(struct futex_pi_state *ping_state,
 				    struct task_struct *new_owner)
@@ -144,7 +145,8 @@ static void give_ping_state_to_next_waiter(struct futex_hash_bucket *hb,
 
 /* Returns >0 if lock acquired, <0 on error */
 static int futex_trylock_ping_state(u32 __user *uaddr,
-				    struct futex_pi_state *ping_state)
+				    struct futex_pi_state *ping_state,
+				    bool handoff)
 {
 	struct task_struct *owner;
 	u32 uval, new, newtid;
@@ -152,13 +154,15 @@ static int futex_trylock_ping_state(u32 __user *uaddr,
 
 	ret = 0;
 	raw_spin_lock_irq(&ping_state->ping_mutex.wait_lock);
+	ret = futex_get_value_locked(&uval, uaddr);
+	if (ret)
+		goto err;
 	owner = ping_mutex_owner(&ping_state->ping_mutex);
 	if (owner == NULL) {
 		newtid = task_pid_vnr(current);
 
-		ret = futex_get_value_locked(&uval, uaddr);
-		if (ret)
-			goto err;
+		WARN_ON_ONCE(ping_state->handoff || ping_state->pickup);
+
 		if (uval & FUTEX_TID_MASK) {
 			ret = -EAGAIN;
 			goto err;
@@ -171,7 +175,19 @@ static int futex_trylock_ping_state(u32 __user *uaddr,
 			ping_state_update_owner(ping_state, current);
 		WRITE_ONCE(ping_state->ping_mutex.owner, current);
 		ret = 1;
-	}
+	} else if (ping_state->pickup) {
+		if (owner != current) {
+			ret = -EAGAIN;
+			goto err;
+		}
+		if ((uval & FUTEX_TID_MASK) != task_pid_vnr(current)) {
+			ret = -EINVAL;
+			goto err;
+		}
+		ping_state->pickup = 0;
+		ret = 1;
+	} else if (handoff && !ping_state->handoff)
+		ping_state->handoff = 1;
 	raw_spin_unlock_irq(&ping_state->ping_mutex.wait_lock);
 	return ret;
 
@@ -233,7 +249,7 @@ static int futex_lock_ping_atomic(u32 __user *uaddr,
 		_ps = top_waiter->ping_state;
 		if (_ps == NULL)
 			return -EINVAL;
-		ret = futex_trylock_ping_state(uaddr, _ps);
+		ret = futex_trylock_ping_state(uaddr, _ps, false);
 		if (ret > 0) {
 			/* We stole the lock from the top waiter. */
 			raw_spin_lock_irq(&_ps->ping_mutex.wait_lock);
@@ -297,7 +313,7 @@ int futex_lock_ping(u32 __user *uaddr, unsigned int flags, ktime_t *time,
 	struct hrtimer_sleeper timeout, *to;
 	struct task_struct *exiting;
 	struct futex_q q = futex_q_init;
-	bool queued;
+	bool queued, should_handoff;
 	int ret;
 
 	if (refill_pi_state_cache())
@@ -369,6 +385,7 @@ int futex_lock_ping(u32 __user *uaddr, unsigned int flags, ktime_t *time,
 		}
 
 		queued = false;
+		should_handoff = false;
 		while (1) {
 			set_task_blocked_on(current, &q.ping_state->ping_mutex,
 					    BO_T_PING_FUTEX);
@@ -398,13 +415,15 @@ int futex_lock_ping(u32 __user *uaddr, unsigned int flags, ktime_t *time,
 				goto out_unqueue;
 			}
 
-			ret = futex_trylock_ping_state(uaddr, q.ping_state);
+			ret = futex_trylock_ping_state(uaddr, q.ping_state,
+						       should_handoff);
 			if (ret > 0) {
 				/* Got the futex */
 				ret = 0;
 				goto out_unqueue;
 			} else if (ret < 0)
 				goto out_unqueue;
+			should_handoff = true;
 		}
 
 out_unqueue:
@@ -526,6 +545,13 @@ int futex_unlock_ping(u32 __user *uaddr, unsigned int flags)
 	 * no top_waiter.
 	 */
 	new = FUTEX_WAITERS;
+	if (ping_state->handoff) {
+		new |= task_pid_vnr(top_waiter->task);
+		ping_state->handoff = 0;
+		ping_state->pickup = 1;
+		WRITE_ONCE(ping_state->ping_mutex.owner, top_waiter->task);
+	} else
+		WRITE_ONCE(ping_state->ping_mutex.owner, NULL);
 	ret = lock_pi_update_atomic(uaddr, uval, new);
 	if (ret) {
 		raw_spin_unlock_irq(&ping_state->ping_mutex.wait_lock);
@@ -543,7 +569,6 @@ int futex_unlock_ping(u32 __user *uaddr, unsigned int flags)
 	}
 
 	ping_state_update_owner(ping_state, top_waiter->task);
-	WRITE_ONCE(ping_state->ping_mutex.owner, NULL);
 	raw_spin_unlock_irq_wake(&ping_state->ping_mutex.wait_lock, &wake_q);
 	put_ping_state(ping_state);
 	return 0;
-- 
2.55.0.1082.g2b9226bbc0-goog

