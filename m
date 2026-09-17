Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EBA3A3E97
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619644; cv=none; b=fOx1VuUCHkGOmvfAdJTPWoFXR83ftayRbY26Um/cw9lMjjVRZMkUQNJK5onCY8333sFgGnTg2tb+0tjKF7KRkqEU8VbLtnGJBPa0K/YquuwZGH9upEmMIWBQ9U43kYz5y/P7gAv/Xk341Dy8golGIKPWiW74OvgCOV4n0874Mfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619644; c=relaxed/simple;
	bh=4CRAupY4QvRM4EhlfkuMpd5r53+BH1uGNeskJjHP14Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eonxpvyVbAU1yAes0GVJWvM8o2KHdJClYmKBwP+vmvvjVZSOhqoxanlhe7Fajz0x7gc5q5oFdC7irdfvh36xyHyLjv+MgzUJMwuoNhFLSOSOvNQg9i6jvzgGYWUhkc5ludxA0UJDTg6DWgW22QmdnyGZGBQpCXRxfQudtCA0ivM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VYy2A4Xj; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VYy2A4Xj"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso548642a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789619642; x=1790224442; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJznT2p9kSqAbUumLQMmYK9dyBk6t2Lz114HtNv5sRM=;
        b=VYy2A4XjDp9DuqyARLHUipcFmXxQORgBW6ZRr3kpPkOE3hPCZh25rfSiSJtYcy9tab
         QfqNU79xvEjM/4B2olKV6z0zdDe7jm002TKDMtcOgsp0G4cI68YHCfU9jUWWqwdRC75L
         HkIzTUAs5ZuBoK++n/915+USBGd+ZzMWi2RdeXXXMTVFiGROw5OaFTWB8N1n77sMlwl7
         2QRNWQ9oaw1b2/3tcXRvSU8/qboq6QiGJQC+nfJ2TZ1mI2QupuQOVFOQC24wUGCDr2Js
         SVh4niT0H1xix5bdSsRzB4erzw7DHO90ntRNB5QbbqraM+DZozBqgcfyRAe4Ae5X8ZOF
         ZOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619642; x=1790224442;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJznT2p9kSqAbUumLQMmYK9dyBk6t2Lz114HtNv5sRM=;
        b=ZOKsD/JhQa1bNaNhbLCN+MatUcH20pVTDnt9JG54R5SD0GvLWlnKFEg0XO7sSzFdlB
         J92hEU2QkIEDKE1OatCw/8e+vVAI8gWVVxLOaHePkWBWq/bh0ZBERT0FRa1gSjPeSm8l
         IMweW59AKM5P8Z4tw3gQr8lNawZOqMyKve3dUtWFDQDIb7meT0ymaGQ/IV2CNTl8B61n
         r+wg2pebyL0XS7zIri78UJO2EdS9WgFURWW1Liz3flnlh5CBBAltrtozHvfjjMIWZ4Gc
         Oessk0EFH6IrOJ3L7LxaykOgoCeFtwyAc4imFjYpY4f2f8yIUSnciXSYzhVF3iGEiztP
         QAHQ==
X-Gm-Message-State: AFuF++lL3i73Z9CVFlxFkSPDu6fVkCx9M3j+yxVX4XhIATzD/QlGzZEp
	7eiQVFUFBfMQ0Thf6v84GQ+bPK6KUidg5uK3GQSA6x71RtYt2e9rICL3j9dAbkU8KIP4XmBg+2v
	eszMhpkoR6VWa5HxD7bKPdW2IVzxr6YpgO/RSH4qI8xLNSybD4smUkbUMAzlkvZOsAO7jnQMqaT
	ZSD+AYZMC0d9eWkatOarKBKX4V49865kVaVm2eYLnX9SYTFLsugSjG47Q=
X-Received: from pgbm11-n1.prod.google.com ([2002:a05:6a02:618b:10b0:cc5:a28:4194])
 (user=suleiman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:1193:b0:3da:ebec:69c1 with SMTP id adf61e73a8af0-3dd5f7acb7amr13562703637.24.1789619641754;
 Wed, 16 Sep 2026 21:34:01 -0700 (PDT)
Date: Thu, 17 Sep 2026 04:33:30 +0000
In-Reply-To: <20260917043339.2093426-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917043339.2093426-7-suleiman@google.com>
Subject: [RFC PATCH 06/12] futex: Address aborting from futex_lock_ping()
 while owning ping_state.
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

It is possible to unsuccesfully get out of the futex_lock_ping() loop
while owning the ping_state. This can happen when a waiting task gets
chosen by an unlocker as the top waiter, but gets a signal or its timeout
expires.
When this happens, wake up the next waiter and give them the ping_state.

Signed-off-by: Suleiman Souhlal <suleiman@google.com>
---
 kernel/futex/ping.c | 72 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 61 insertions(+), 11 deletions(-)

diff --git a/kernel/futex/ping.c b/kernel/futex/ping.c
index 3d732489513b..ebcd3c4a7793 100644
--- a/kernel/futex/ping.c
+++ b/kernel/futex/ping.c
@@ -105,6 +105,43 @@ static void futex_unqueue_ping(struct futex_q *q)
 	q->ping_state = NULL;
 }
 
+/*
+ * We own the ping_state but weren't able to get the futex.
+ * Wake up the next waiter and give them ownership.
+ */
+static void give_ping_state_to_next_waiter(struct futex_hash_bucket *hb,
+					   union futex_key *key,
+					   struct futex_pi_state *ping_state)
+{
+	struct futex_q *top_waiter;
+	DEFINE_WAKE_Q(wake_q);
+
+	raw_spin_lock_irq(&ping_state->ping_mutex.wait_lock);
+	/*
+	 * Someone else got the futex and we don't need to do anything
+	 * anymore, as it's their responsibility now.
+	 */
+	if (ping_state->owner && ping_state->owner != current)
+		goto out;
+
+	top_waiter = futex_top_waiter(hb, key);
+	/*
+	 * There are no other waiters but we leave the WAITERS bit set
+	 * (with no owner or ping_state) to be cleaned up at a later unlock,
+	 * at the cost of an extra syscall at the next lock operation, to
+	 * keep things simple.
+	 */
+	if (!top_waiter)
+		goto out;
+	get_ping_state(ping_state);
+	get_task_struct(top_waiter->task);
+	wake_q_add_safe(&wake_q, top_waiter->task);
+	ping_state_update_owner(ping_state, top_waiter->task);
+
+out:
+	raw_spin_unlock_irq_wake(&ping_state->ping_mutex.wait_lock, &wake_q);
+}
+
 /* Returns >0 if lock acquired, <0 on error */
 static int futex_trylock_ping_state(u32 __user *uaddr,
 				    struct futex_pi_state *ping_state)
@@ -365,18 +402,31 @@ int futex_lock_ping(u32 __user *uaddr, unsigned int flags, ktime_t *time,
 		}
 
 out_unqueue:
+		/*
+		 * We got a pending signal or timeout, but the futex was handed
+		 * off to us. Fix up the return value to indicate success.
+		 */
+		if ((ret == -EINTR || ret == -ETIMEDOUT) &&
+		    ping_mutex_owner(&q.ping_state->ping_mutex) == current)
+			ret = 0;
+
+		/*
+		 * We are the pi_state owner but don't own the futex.
+		 * This can happen if we get picked by the previous
+		 * owner but get out without acquiring the lock for
+		 * some reason.
+		 * Wake up the next waiter and give the ping_state to them.
+		 */
 		if (ret != 0 && q.ping_state->owner == current) {
-			/*
-			 * We are pi_state owner but don't own the futex.
-			 * This can happen if we get picked by the previous
-			 * owner but get out without acquiring the lock for
-			 * some reason.
-			 * A later commit addresses this.
-			 */
-			WARN_ON_ONCE(1);
-		}
-		/* This also puts the ping_state */
-		futex_unqueue_ping(&q);
+			if (!plist_node_empty(&q.list))
+				__futex_unqueue(&q);
+			give_ping_state_to_next_waiter(hb, &q.key,
+						       q.ping_state);
+			put_ping_state(q.ping_state);
+		} else
+			/* This also puts the ping_state */
+			futex_unqueue_ping(&q);
+
 out_unlock:
 		futex_q_unlock(hb);
 		__release(q.lock_ptr);
-- 
2.55.0.1082.g2b9226bbc0-goog

