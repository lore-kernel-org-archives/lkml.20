Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AFE3BD65D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619640; cv=none; b=eEqLPXAVzIsthVzyvsweS3zcH4tWbs7p/KrEnUlY9PB1GP7Z7nviKoOKVufGJkBC0IFxqQPb5W1E26Nt0Vdbhop8ept6yn6qIK/0zOisBIUXsZ79pvxqgz8EtVqZz4WxYWRJQe32HZ6HOZBI6M4lKbIe55/+ELPfcX1UP+aIjrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619640; c=relaxed/simple;
	bh=JhcozAA+A9t065vQxyaqGS89nG6vza/RKha5TtWKih8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i5vPwdKcNRUiWqzxDjecOyNbW008Sfkb+J57UhqrgdVLhA85dYbdXS2RS+P6ybJXOOToaSI2BZDFFwa4pcF4aZDkLXRvsDN88pquWxAMPd5dYrXGo3TzV17gcdGyfha5FnGHiCUheYBCQ5dZSVqPqPOA2ct8+84pvn8rErOeaJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o+62nOvL; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o+62nOvL"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8710450f731so589453b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789619638; x=1790224438; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k62DQxnbCWh2Ug5s4Hdgmh9l39pPAQ2b4OqnI14O8ic=;
        b=o+62nOvLNXkkNEHYY+1Z+buzVC5pTum2kqeaaD9m3bKpUywHpzVWyk/LHNP21unR8A
         S19pZaxWnDN9YmX4YGT8wOI9JNGJF7OHojHTevuosuVpTZWQeKGAAp5Rg+seM7zEunSJ
         I201Tc0uTxfNWcOEUfgsrGAOWKvMp2xLjRqr7NgZiDcYGiCywBi8cfwLdptgw5+XXI8r
         3sn6Bgu3T8Y0GohusHjgTYBL30CPqEQfBuQchOcepkGAgQJVV9jRXaeqIBNsJdtxXk8r
         iNV2GXNCJkHOychTx04p74+q79W5DPj1Pbmvw30mZdYp9rtQNjcuLQj53EJyiEcLGtFa
         U/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619638; x=1790224438;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k62DQxnbCWh2Ug5s4Hdgmh9l39pPAQ2b4OqnI14O8ic=;
        b=RJBPYUwcPRE+4UWpSHiHNDZ2abfZYoz9zQSClTPVb8R9NHQSXN/lSeidpbkSKECtvx
         3MMPJHhPKirYy97csy3WOzu6cxsiNgPNCHGcoVvc1fPz5qCdapG3ZzKO8tuXhHl7N+Dn
         fNpvBXv3alqdJjSmCtwA4BUvbWk3U0RKi4C0KeX02GxaXW09x9XmHPjsVEzp+p6/6S1G
         R2YhAJn056WFCWLEj9UchzoTECHnFDiO66zn2lXHhOCos/l7PRFd1m4asfAPV/8BhYgS
         8m1HLF1ReDQX+qssF5Ep2lhAeqECzypWmTbuDuJw8dPYKyvufuks+3iKxkeIo4+N/s1D
         /F9w==
X-Gm-Message-State: AFuF++k93Uq5uUhwKm/sJZOpVssKvW8rf+dUZYX+KQYpJ0kXFKiuMOhI
	6w5rskpaIuW0LovslYU7tXTS4CpLndjAeu6SWlsxmE93yIhKw3LdSvjlhuTq1qHi7BqX1EH6ZJr
	LpWZ6NQ52ucDWrJWuaTYyHS0yTvya/QTTL8t6Nw/cFR1yHc44w2gmuK2/3YSHt8TKEtdiR60hNy
	SE0y7zsX+a/ElTp4WZGyduoxTL2vOfhQ2H2cYwiALx/1y+vnnzSIK6oRc=
X-Received: from pfbgd6.prod.google.com ([2002:a05:6a00:8306:b0:86a:854f:170b])
 (user=suleiman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2d8c:b0:86c:f33d:e3d6 with SMTP id d2e1a72fcca58-872374c06e9mr10511822b3a.9.1789619637384;
 Wed, 16 Sep 2026 21:33:57 -0700 (PDT)
Date: Thu, 17 Sep 2026 04:33:27 +0000
In-Reply-To: <20260917043339.2093426-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917043339.2093426-4-suleiman@google.com>
Subject: [RFC PATCH 03/12] futex: Add "ping" parameter to pi_state management
 functions and export them.
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

In preparation to adding FUTEX_PING, allow the pi_state management
functions to use a different wait_lock, and make them non-static.
Also rename handle_exit_race() to pi_handle_exit_race().

Signed-off-by: Suleiman Souhlal <suleiman@google.com>
---
 kernel/futex/futex.h | 10 ++++++++
 kernel/futex/pi.c    | 61 +++++++++++++++++++++++++-------------------
 2 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index f00f0863ed44..e450f60b180b 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -395,6 +395,16 @@ extern int refill_pi_state_cache(void);
 extern void get_pi_state(struct futex_pi_state *pi_state);
 extern void put_pi_state(struct futex_pi_state *pi_state);
 extern int fixup_pi_owner(u32 __user *uaddr, struct futex_q *q, int locked);
+extern int pi_handle_exit_race(u32 __user *uaddr, u32 uval);
+extern struct futex_pi_state *alloc_pi_state(void);
+extern int attach_to_pi_state(u32 __user *uaddr, u32 uval,
+			      struct futex_pi_state *pi_state,
+			      struct futex_pi_state **ps,
+			      bool ping);
+extern int attach_to_pi_owner(u32 __user *uaddr, u32 uval, union futex_key *key,
+			      struct futex_pi_state **ps,
+			      struct task_struct **exiting,
+			      bool ping);
 
 /*
  * Express the locking dependencies for lockdep:
diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index ceeeca1910ca..aefcc0491d60 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -33,7 +33,7 @@ int refill_pi_state_cache(void)
 	return 0;
 }
 
-static struct futex_pi_state *alloc_pi_state(void)
+struct futex_pi_state *alloc_pi_state(void)
 {
 	struct futex_pi_state *pi_state = current->futex.pi_state_cache;
 
@@ -252,9 +252,10 @@ void put_pi_state(struct futex_pi_state *pi_state)
  * the pi_state against the user space value. If correct, attach to
  * it.
  */
-static int attach_to_pi_state(u32 __user *uaddr, u32 uval,
-			      struct futex_pi_state *pi_state,
-			      struct futex_pi_state **ps)
+int attach_to_pi_state(u32 __user *uaddr, u32 uval,
+		       struct futex_pi_state *pi_state,
+		       struct futex_pi_state **ps,
+		       bool ping)
 {
 	pid_t pid = uval & FUTEX_TID_MASK;
 	u32 uval2;
@@ -284,7 +285,8 @@ static int attach_to_pi_state(u32 __user *uaddr, u32 uval,
 	 * Now that we have a pi_state, we can acquire wait_lock
 	 * and do the state validation.
 	 */
-	raw_spin_lock_irq(&pi_state->pi_mutex.wait_lock);
+	if (!ping)
+		raw_spin_lock_irq(&pi_state->pi_mutex.wait_lock);
 
 	/*
 	 * Since {uval, pi_state} is serialized by wait_lock, and our current
@@ -348,8 +350,10 @@ static int attach_to_pi_state(u32 __user *uaddr, u32 uval,
 		goto out_einval;
 
 out_attach:
-	get_pi_state(pi_state);
-	raw_spin_unlock_irq(&pi_state->pi_mutex.wait_lock);
+	if (!ping) {
+		get_pi_state(pi_state);
+		raw_spin_unlock_irq(&pi_state->pi_mutex.wait_lock);
+	}
 	*ps = pi_state;
 	return 0;
 
@@ -370,7 +374,7 @@ static int attach_to_pi_state(u32 __user *uaddr, u32 uval,
 	return ret;
 }
 
-static int handle_exit_race(u32 __user *uaddr, u32 uval)
+int pi_handle_exit_race(u32 __user *uaddr, u32 uval)
 {
 	u32 uval2;
 
@@ -419,7 +423,8 @@ static int handle_exit_race(u32 __user *uaddr, u32 uval)
 }
 
 static void __attach_to_pi_owner(struct task_struct *p, union futex_key *key,
-				 struct futex_pi_state **ps)
+				 struct futex_pi_state **ps,
+				 bool ping)
 {
 	/*
 	 * No existing pi state. First waiter. [2]
@@ -429,18 +434,20 @@ static void __attach_to_pi_owner(struct task_struct *p, union futex_key *key,
 	 */
 	struct futex_pi_state *pi_state = alloc_pi_state();
 
-	/*
-	 * Initialize the pi_mutex in locked state and make @p
-	 * the owner of it:
-	 */
-	__assume_ctx_lock(&pi_state->pi_mutex.wait_lock);
-	rt_mutex_init_proxy_locked(&pi_state->pi_mutex, p);
+	if (!ping) {
+		/*
+		 * Initialize the pi_mutex in locked state and make @p
+		 * the owner of it:
+		 */
+		__assume_ctx_lock(&pi_state->pi_mutex.wait_lock);
+		rt_mutex_init_proxy_locked(&pi_state->pi_mutex, p);
+		WARN_ON(!list_empty(&pi_state->list));
+		list_add(&pi_state->list, &p->futex.pi_state_list);
+	}
 
 	/* Store the key for possible exit cleanups: */
 	pi_state->key = *key;
 
-	WARN_ON(!list_empty(&pi_state->list));
-	list_add(&pi_state->list, &p->futex.pi_state_list);
 	/*
 	 * Assignment without holding pi_state->pi_mutex.wait_lock is safe
 	 * because there is no concurrency as the object is not published yet.
@@ -453,9 +460,10 @@ static void __attach_to_pi_owner(struct task_struct *p, union futex_key *key,
  * Lookup the task for the TID provided from user space and attach to
  * it after doing proper sanity checks.
  */
-static int attach_to_pi_owner(u32 __user *uaddr, u32 uval, union futex_key *key,
-			      struct futex_pi_state **ps,
-			      struct task_struct **exiting)
+int attach_to_pi_owner(u32 __user *uaddr, u32 uval, union futex_key *key,
+		       struct futex_pi_state **ps,
+		       struct task_struct **exiting,
+		       bool ping)
 {
 	pid_t pid = uval & FUTEX_TID_MASK;
 	struct task_struct *p;
@@ -471,7 +479,7 @@ static int attach_to_pi_owner(u32 __user *uaddr, u32 uval, union futex_key *key,
 		return -EAGAIN;
 	p = find_get_task_by_vpid(pid);
 	if (!p)
-		return handle_exit_race(uaddr, uval);
+		return pi_handle_exit_race(uaddr, uval);
 
 	if (unlikely(p->flags & PF_KTHREAD)) {
 		put_task_struct(p);
@@ -508,7 +516,7 @@ static int attach_to_pi_owner(u32 __user *uaddr, u32 uval, union futex_key *key,
 			return -EBUSY;
 		}
 
-		int ret = handle_exit_race(uaddr, uval);
+		int ret = pi_handle_exit_race(uaddr, uval);
 
 		raw_spin_unlock_irq(&p->pi_futex_lock);
 		put_task_struct(p);
@@ -530,7 +538,7 @@ static int attach_to_pi_owner(u32 __user *uaddr, u32 uval, union futex_key *key,
 		}
 	}
 
-	__attach_to_pi_owner(p, key, ps);
+	__attach_to_pi_owner(p, key, ps, ping);
 	raw_spin_unlock_irq(&p->pi_futex_lock);
 
 	put_task_struct(p);
@@ -614,7 +622,8 @@ int futex_lock_pi_atomic(u32 __user *uaddr, struct futex_hash_bucket *hb,
 	 */
 	top_waiter = futex_top_waiter(hb, key);
 	if (top_waiter)
-		return attach_to_pi_state(uaddr, uval, top_waiter->pi_state, ps);
+		return attach_to_pi_state(uaddr, uval, top_waiter->pi_state,
+		    ps, false);
 
 	/*
 	 * No waiter and user TID is 0. We are here because the
@@ -651,7 +660,7 @@ int futex_lock_pi_atomic(u32 __user *uaddr, struct futex_hash_bucket *hb,
 		 */
 		if (set_waiters) {
 			raw_spin_lock_irq(&task->pi_futex_lock);
-			__attach_to_pi_owner(task, key, ps);
+			__attach_to_pi_owner(task, key, ps, false);
 			raw_spin_unlock_irq(&task->pi_futex_lock);
 		}
 		return 1;
@@ -671,7 +680,7 @@ int futex_lock_pi_atomic(u32 __user *uaddr, struct futex_hash_bucket *hb,
 	 * attach to the owner. If that fails, no harm done, we only
 	 * set the FUTEX_WAITERS bit in the user space variable.
 	 */
-	return attach_to_pi_owner(uaddr, newval, key, ps, exiting);
+	return attach_to_pi_owner(uaddr, newval, key, ps, exiting, false);
 }
 
 /*
-- 
2.55.0.1082.g2b9226bbc0-goog

