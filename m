Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD59F399019
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044887; cv=none; b=Kh+KQnWz+Gl+1l2xFBUtzvlJz2USAwCu8/6BJzY4nW3wip1swMjS8MCkoYhLyOFRNI9jys3ZlvTCXmgnrJJcWKLYTkRHt7ZgGezpMXDwdeMNoKA+BwGWeaVseqUGDooGxr0YOdrl8pn8XaWQT/181fcUbyVxlKwPULoSoW8tL58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044887; c=relaxed/simple;
	bh=uBgEHjMRztmNvI8x4K5Hpe0CQRVl1p5IHgcah0StMNc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nycs+MmAkXZf3idj+lHTusPgmjcUjJZed8owAh2lic1mq7nhsTJMqKO+AuFU716izhxvTvXGHo3saWQgc1Ylhj4Ce48qWep8WwmjQl2zTA976qSuGDg4wSnZFz7AUYO53+uuAcyqpT8t2fkLCzcZMYMrGkkk0BsP6p6jS7cWGMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=waiAPtbk; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="waiAPtbk"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86fa6b15ed3so5175252b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790044885; x=1790649685; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTF1Ty23vE9j/y3WmMVN9fD9sKgUQnO+BUVOnnHysik=;
        b=waiAPtbkBc5KepHuDCXJaBxwOsowyobYWvCIWdBXTkvjUqm64SKsv7xWIerXDvxsIf
         A5FUUzCzW48FF/Kzags6YVmJEBeIz+/XRYfwfN9faEBge75jKV0mCNy6GespWFMa8ODn
         se7sDEvrdvgw2Z7TmoV+09NLRNKeIILFx7kTvUfcFv0KjftHs7CQKiD5U1pGju2Nd1Kv
         DQn72dzWLIX9dVIENGcnDwc/+r89j1Egog6ZJQbrZ6ud8/97qfEmhNy3irVBzuaA0+i9
         Nv6VWfnssGzB3Y9bUPfrVN9tiOdW4uZ5bxhJVRRJYTULDGO6UjQGT8saYUVohhQfawld
         aR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044885; x=1790649685;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTF1Ty23vE9j/y3WmMVN9fD9sKgUQnO+BUVOnnHysik=;
        b=Ry/21qJKcdrvQaYcPqEp5Z0HgYj9IK/V6HzljrRl9GhWQ3Q58tC8n0zaXkG/68tiZf
         EPZCCduQyj08o7G7c26QFnhHb16cga6THni/yXp0eCOM3gPChjOztP5j7/XV6zHNVVJG
         LoUORK9vo/sPc6RoYJMTXdrKawWoDy4og93zlQXVv/AlaEKirtXpjp0g+r65Sa3aWmpw
         jmDO6JiFels7Qe0bnlV7qZ4eQDWMExt7iEb8rx0x1ygMDfJh7pj1KgMwwBH5QQKWfIJ1
         u10T8AnRBio9YdCHTRYXpYldh2P8WM15ahxfrG+P30GuHer13rV7Lrr+QY7QpROZ6lgR
         At1w==
X-Gm-Message-State: AFuF++k1/7Xp9Xnts7pUmB9Kpvq6gw4m+J4CQBwyPCnf8c2V6SRJn7p4
	S/tdLOcvJcHl0ff4BdoVUkVh5jeinfKdODkFap+UcK/VStjkCd5Qbh53nvpyan2rMpMVyAIStvY
	YgYCIymY8WMWe1defAqcAhXr+jM9ufq9Xra8Qu78OoBd7em0Xa6A9AbsCr4mN5JJP+k6yL/9fEB
	U9Hy73gMwkbDoe6kf15ATGeUNYczeqkIoOZsjWQbN1YiEgdGgn
X-Received: from pfbgd13.prod.google.com ([2002:a05:6a00:830d:b0:845:e46a:599e])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1249:b0:878:3783:8a83
 with SMTP id d2e1a72fcca58-87837839389mr10251227b3a.53.1790044884514; Mon, 21
 Sep 2026 19:41:24 -0700 (PDT)
Date: Tue, 22 Sep 2026 02:41:11 +0000
In-Reply-To: <20260922024117.1514332-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922024117.1514332-1-jstultz@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922024117.1514332-2-jstultz@google.com>
Subject: [PATCH v32 1/2] sched/core: Activate blocked donor when no owner is found
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, John Stultz <jstultz@google.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef <qyousef@layalina.io>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Suleiman Souhlal <suleiman@google.com>, 
	Andrea Righi <arighi@nvidia.com>, kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, 
	kernel-team@android.com
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

Fixes: f13beb010e4a ("sched: Have try_to_wake_up() handle return-migration for PROXY_WAKING case")
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: John Stultz <jstultz@google.com>
---
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Qais Yousef <qyousef@layalina.io>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ben Segall <bsegall@google.com>
Cc: Zimuzo Ezeozue <zezeozue@google.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Metin Kaya <Metin.Kaya@arm.com>
Cc: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Suleiman Souhlal <suleiman@google.com>
Cc: Andrea Righi <arighi@nvidia.com>
Cc: kuyo chang <kuyo.chang@mediatek.com>
Cc: hupu <hupu.gm@gmail.com>
Cc: kernel-team@android.com
---
 kernel/sched/core.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1aa22df5529ed..00d9e3520e79d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6851,6 +6851,19 @@ static inline void proxy_reacquire_rq_lock(struct rq *rq, struct rq_flags *rf)
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
@@ -6976,14 +6989,15 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
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
@@ -7071,6 +7085,9 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 	}
 	return owner;
 
+activate:
+	proxy_activate(rq, rf, p);
+	return NULL;
 deactivate:
 	proxy_deactivate(rq, p);
 	return NULL;
-- 
2.55.0.1082.g2b9226bbc0-goog

