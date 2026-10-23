Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792793078;
	b=2fOmPAhI/0EF/1B588FjZlOIPdDDRvHVKcJYwKFjdh6CKnOgmHc38/Y/kiviGTOsecdO
	 r1mQpPRI1bu19efukWj7yRiFFk2429lD/TFIdB/2pT+2YbDb8fB5bySCOgW9I77NpvVHQ
	 zghNrqj32g+IkDmv7vIyCVWyZycAps8K4tDYG+kp9zbmizl6YtotjkSvZDlastfGPU6VE
	 bAnWgBeVmnyXvvratsHwQSX+CfWR+q140z9ib/vP/fLYrBxeVC04D7YBICQAaB1LPs4Hn
	 AJbCLoeYkGEe0Ad3bhHHj6UYK5kLB+as2yMbbH4YgXMUFscMXmOWF6nIBNHX5zO3h0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792793078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Imkl+lCh2amOIl7OPjvbW89tay83MnRUpglGigXbVZc=;
	b=Ni2L3j/5vDI2HN9d4l9sTUJkn/vjyM9rnpB7cLKEaPK224hccaudbVHhJNX/QNWAibvP
	 qe/fVRnFa239qcVkJi1cXjETpZyWBTrLqiHOqX8uNfN/qhiHlnzcN8LgBkSyeerzqsyAc
	 qmc2/J4a2XINLPe3jASq5be8lAZCyToMjIqKaPlj5Wvk3IBR7f/vJ56PPoHggR7bPFegb
	 qYjYVT3kUQmpHL5ABdKa3OHnlc3pCpKzKrabHvCx8D4E0eWIzgyKxKPvDsrD8B/cSTxZI
	 5oR0Di8QxD9z/JFPrS6MepgLFNpxx5UKya1cPZCv8svluZxS2i21VSAh8WCM/cL88Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nJz4YTly;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C007D606A324
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C007D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nJz4YTly
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd6532dbd7bso914076a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792793077; x=1793397877; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Imkl+lCh2amOIl7OPjvbW89tay83MnRUpglGigXbVZc=;
        b=nJz4YTlyQjA9yhfPGayLubWiPznTnhWnuhC9g3N2tu/z88e6JsJnN/GjpTR8KGXvO3
         Yino0qR35XlyS9tLzjeryKm1XtkcwvZtzt0t6GRCaokobHgex32lACLssvFz4EWulf4M
         +Zf+krG3mAF5hAnWQk/9Ync8wQRqKpa2pEqaMz4vTq9PXMq+T3pKYvYvfTx5BJz3zkR0
         f8YDQ2OaMgYy/a39p1bXpmlPpWXTwtj7r7RdYmZIIY2udj/JdKJKVah+eBKEtQNSoone
         rVNiVUxR7kYIjsZ1fXuUoC6uVbsQsVv55Gcx9l1z/pjVRSpooOqNWQt7p9YKLbqfB2Pt
         ajQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792793077; x=1793397877;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Imkl+lCh2amOIl7OPjvbW89tay83MnRUpglGigXbVZc=;
        b=FFleIbP1JxnhoynZuU48URMBjENdZqs9hqyOzvNzhCwWsoV4Uf4Y669wYoDHXNJZYc
         yfopj8O6ej8SLsGeDDtZ44IxZk3LT405h1bjMliPKFvYoV+tDQOQjWSATK/PZps5ogHh
         RAq7DhEU0d3UZNGlhtxtlT9VGsBHyfM0YTcuaI+P3On0aloC1lBQjgoPSHfLCIKG/BFR
         yHVqKH01I9ko73mZVo8Si4M8b3Az93B7w8O5Qa50Sk1R0Hu/Z8DKkz+JdCIA6m045MSU
         vhnDio1kGBp+RKkBxY+DlTPL+7VFn6VktC4XuFjkzmkOkZxIQ/sRtHtpSf49zT5PIJAr
         VYWg==
X-Gm-Message-State: AFq9FYJm10BSeVIN4juTl5X2kbZiIAy7Zay3cxvQpGMNXRahBOme5QrT
	yQgkZa4X7dHxu2vbKTe3c6tJRgXAkh692V02iagBcUs0RX633u3zpEnRObCdprFdte+GJw9IkWt
	Zpy44n7paDG7WwgCYOI+lnTyAXej0/wohAlneh7x2KdN2vHyaJC3BwJeCBBV0+nI484d6CYHN9X
	RBPmRiXq5DIG4EjOjNFr9/G/zG1y6zUbxlHM1MpTGNzwU3bfbJ
X-Received: from pgdo3-n1.prod.google.com ([2002:a05:6a02:6203:10b0:cd8:b2f9:5623])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:548d:b0:3e0:c3f8:4821
 with SMTP id adf61e73a8af0-3e7cd4da8b4mr309163637.41.1792793076595; Fri, 23
 Oct 2026 15:04:36 -0700 (PDT)
Date: Fri, 23 Oct 2026 22:04:14 +0000
In-Reply-To: <20261023220431.1106611-1-jstultz@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023220431.1106611-1-jstultz@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023220431.1106611-4-jstultz@google.com>
Subject: [PATCH v33 3/7] sched/core: Activate blocked donor when no owner is found
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, John Stultz <jstultz@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Valentin Schneider <vschneid@redhat.com>, 
	Suleiman Souhlal <suleiman@google.com>, Andrea Righi <arighi@nvidia.com>, Metin Kaya <Metin.Kaya@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef <qyousef@layalina.io>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, kuyo chang <kuyo.chang@mediatek.com>, 
	hupu <hupu.gm@gmail.com>, Zhan Xusheng <zhanxusheng@xiaomi.com>, 
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su <sh_def@163.com>, 
	"Shubhang Kaushik (Ampere)" <sh@gentwo.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

From: K Prateek Nayak <kprateek.nayak@amd.com>

mutex_unlock_slowpath() follows:

    if (owner & MUTEX_FLAG_HANDOFF)
        break /* ... and do __mutex_handoff() */

    if (atomic_long_try_cmpxchg_release(&lock->owner, &owner, __owner_flags(owner))) {
        if (owner & MUTEX_FLAG_WAITERS)
            break; /* ... and wake up the forst waiter. */

MUTEX_FLAG_HANDOFF is only set by first-waiter after it has been woken
up and in absence of MUTEX_FLAG_HANDOFF, the owner clears itself from
the lock_word and wakes up the first waiter to try a
__mutex_trylock_or_handoff().

MUTEX_FLAG_HANDOFF exists to prevent new optimistic spinners from
trying to hijack the lock from waiter all the time and potentially
starving them but it is not necessary for MUTEX_FLAG_HANDOFF to be
always set in presence of a waiter.

If a blocked donor is deactivated when no owner is observed, it may not
be woken up until it becomes the first waiter and is naturally woken up
which breaks proxy in the interim.

Wake up the blocked donor and allow it to grab the lock when no owner is
observed. If the task manages to grab the lock, the block chain will
follow at the next proxy migration. If the task fails to grab the lock,
same situation is restored and everyone migrated to the CPU of new
owner.

Similarly, do the same for the NULL blocked_on/mutex pointer for
consistency.

Fixes: f13beb010e4a ("sched: Have try_to_wake_up() handle return-migration for PROXY_WAKING case")
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: John Stultz <jstultz@google.com>
---
v33:
* Added similar logic for the null mutex/blocked_on case

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Suleiman Souhlal <suleiman@google.com>
Cc: Andrea Righi <arighi@nvidia.com>
Cc: Metin Kaya <Metin.Kaya@arm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Zimuzo Ezeozue <zezeozue@google.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Qais Yousef <qyousef@layalina.io>
Cc: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: kuyo chang <kuyo.chang@mediatek.com>
Cc: hupu <hupu.gm@gmail.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>
Cc: zhidao su (Xiaomi) <soolaugust@gmail.com>
Cc: Hui Su <sh_def@163.com>
Cc: Shubhang Kaushik (Ampere) <sh@gentwo.org>
Cc: kernel-team@android.com
---
 kernel/sched/core.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 729ebaca35e1a..2cb42de255f7a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6921,6 +6921,19 @@ static inline void proxy_reacquire_rq_lock(struct rq *rq, struct rq_flags *rf)
 	update_rq_clock(rq);
 }
 
+static void
+proxy_activate(struct rq *rq, struct rq_flags *rf, struct task_struct *p)
+	__must_hold(__rq_lockp(rq))
+{
+	lockdep_assert_rq_held(rq);
+	proxy_resched_idle(rq);
+	proxy_release_rq_lock(rq, rf);
+
+	wake_up_process(p);
+
+	proxy_reacquire_rq_lock(rq, rf);
+}
+
 /*
  * If the blocked-on relationship crosses CPUs, migrate @p to the
  * owner's CPU.
@@ -7013,11 +7026,11 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 		struct mutex *mutex = p->blocked_on;
 		if (!mutex) {
 			clear_task_blocked_on(p, mutex);
-			if (task_current(rq, p)) {
+			if (task_current(rq, p) || p->wake_cpu == task_cpu(p)) {
 				p->is_blocked = 0;
 				return p;
 			}
-			goto deactivate;
+			goto activate;
 		}
 
 		/*
@@ -7046,14 +7059,15 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 			/*
 			 * If there is no owner, either clear blocked_on
 			 * and return p (if it is current and safe to
-			 * just run on this rq), or return-migrate the task.
+			 * just run on this rq), or wake the task to try
+			 * and grab the lock it is blocked on.
 			 */
 			__clear_task_blocked_on(p, NULL);
-			if (task_current(rq, p)) {
+			if (task_current(rq, p) || p->wake_cpu == task_cpu(p)) {
 				p->is_blocked = 0;
 				return p;
 			}
-			goto deactivate;
+			goto activate;
 		}
 
 		if (!READ_ONCE(owner->on_rq) || owner->se.sched_delayed) {
@@ -7143,6 +7157,9 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 
 resched_idle:
 	return proxy_resched_idle(rq);
+activate:
+	proxy_activate(rq, rf, p);
+	return NULL;
 deactivate:
 	proxy_deactivate(rq, p);
 	return NULL;
-- 
2.56.0.257.gf7497c7d27-goog

