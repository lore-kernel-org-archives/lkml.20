Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1E5344052
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788173451; cv=none; b=gfW9w/VGj/uvgTfGoFr9glmH9aAhvvNVztQH8UquJEm9quovaRhW26ppXnABX3nGqzzGFFLP2NCSEsZ9xZLigWKgx7syi4K4Ra4S4eYA5fdX/34N3CppWCnNVmNbtSjXaXpcdX+xMSITy0cb6UQnjy3xF8AS1VBBFiOHnkbfPvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788173451; c=relaxed/simple;
	bh=UqUJNOkVZXkIXhJ2y2rjZtqEhaqmQw9SYyf25TAfm3s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Mv3jhdfmMEFbT1JyUQC69iJ0753dkNGwhbH7Hjk3lzuj04jZWFLEkKWaCuW7ucppRLAjWNIPQkpNvTdiNNs28p84lC+GqgOskWi65sbG3U1++m4xNxKe0b8YnmhoAaRaLpV+sToSQ51Qmv5f5CDTqQzAjL93eiWlhFeSah0I2GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dzo96jzE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dzo96jzE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184C11F000E9;
	Mon, 31 Aug 2026 10:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788173449;
	bh=I7Vwnup0xza2gfpH1/nGrmhVv2C3BQIyIgp2VmgT2Bs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Dzo96jzEHQXcoGrQLDRm8rL7gAYMp5rlxKCsqcYM8AVSFE+ANisNcsAGnohmWDHXq
	 D0GcY16N5KWXdzWvYePTRSauqWTmjE1OC3ijeQX5WmrXzKKK1ncWfwEppa9h535Y3p
	 +r1yPKUgsgrEJMnhEb8t85ck9PLSVuoN8dqF5Canh+MZRSI50MU7180p5BFA4yIml4
	 yXBTa58C5pPXRS0lyfhII0U2VA9FKz5z3QpQZyrt9i3wQFj3xN9u5CLidexbzvVPKZ
	 ViBjoJtoLzN3Bbch1icL7mrOap7a7m+mBFij7DC/HjQDWRIBiKSjWk9Crb95cTr1vg
	 wsG+yHrZef/QA==
From: Thomas Gleixner <tglx@kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Frederic Weisbecker
 <frederic@kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
 brauner@kernel.org, peterz@infradead.org, anna-maria@linutronix.de,
 linux-kernel@vger.kernel.org
Subject: [PATCH] signal: Prevent exec() race
In-Reply-To: <87pkyyd39l.ffs@fw13>
References: <875x10hrkt.ffs@fw13> <8733w3j1i1.ffs@fw13>
 <aowkvvxg8cPP5V0X@redhat.com> <aoww8qi_ce_8ECA9@redhat.com>
 <aoxOVAd8ooqHFW12@localhost.localdomain> <87pkz6gms6.ffs@fw13>
 <ao3kt-eRxw4agOj7@redhat.com> <87fr02gegn.ffs@fw13>
 <ao6zmDB9EjsqPIVN@redhat.com> <87zey8g05g.ffs@fw13>
 <ao8_NUo0ACPAA4QB@redhat.com>
 <87ecfki6l5.fsf@email.froward.int.ebiederm.org> <87se3zgb3m.ffs@fw13>
 <87mru7h09e.fsf@email.froward.int.ebiederm.org> <87tsofdvf2.ffs@fw13>
 <871pbfeaiv.ffs@fw13> <87zey3fep2.fsf@email.froward.int.ebiederm.org>
 <87pkyyd39l.ffs@fw13>
Date: Mon, 31 Aug 2026 12:50:46 +0200
Message-ID: <87h5kad0mx.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hyunwoo debugged the following KASAN UAF splat:

  BUG: KASAN: slab-use-after-free in __send_signal_locked+0xb27/0xba0
  Write of size 8 at addr ffff888007ed80c8 by task poc/79
  ...
  Call Trace:
   __send_signal_locked+0xb27/0xba0
   do_send_sig_info+0xa7/0x160
   do_send_specific+0x76/0xa0
   __x64_sys_tgkill+0x193/0x270
  ...
  Allocated by task 80:
   do_timer_create+0x1a4/0x1030
   __x64_sys_timer_create+0x145/0x190
  ...
  Freed by task 12:
   kmem_cache_free_bulk+0x1f8/0x4a0
   kvfree_rcu_bulk+0x14f/0x1c0
   kfree_rcu_work+0x128/0x1a0
  ...
  Last potentially related work creation:
   kvfree_call_rcu+0x39/0x390
   __flush_itimer_signals+0x211/0x320
   flush_itimer_signals+0x47/0x90
   begin_new_exec+0xa6b/0x28c0

It turned out that this happens with a non-leader exec() as Hyunwoo
explained:

de_thread() calls exchange_tids() before release_task(leader), so the
struct pid held by a SIGEV_THREAD_ID timer created against the leader's tid
now points to the thread which called execve(). pid_task() returns that
thread and lock_task_sighand() on it succeeds.

If the timer signal is blocked, its sigqueue stays queued on the leader's
task::pending. The next expiry of that timer can then run while
release_task() flushes the queue.

posixtimer_send_sigqueue() checks whether the sigqueue is already queued
with a plain list_empty(), which only reads list_head::next.
list_del_init() is not atomic and INIT_LIST_HEAD() stores list_head::next
before list_head::prev, so the check can pass in between. list_add_tail()
queues the entry on the task::pending of the live thread, and the
list_head::prev store from the flush then overwrites the list_head::prev
link that list_add_tail() has just set.

__flush_itimer_signals() does not undo that either. With list_head::prev
pointing at the entry itself, its list_del_init() only stores the same
values again, so the entry is not removed from the list. It is still there
after the last reference is dropped and the timer is freed by RCU, and the
list_add_tail() of a later tgkill() follows that list_head::prev into the
freed timer.

This problem is due to a recent commit which moved the sigqueue flush
out of the sighand lock held region. Before that it was properly
serialized.

Hyonwoo proposed to fix this by using list_del_init_careful(), but that
just papers over the underlying problem. After some disucssions and
various attempts to solve it, Eric pointed out that there is no reason
to flush task::pending late in release_task() and it should be done in
exit_signals() already.

As nothing can collect and deliver signals which are queued in a dying
task's pending queue, there is no reason to delay it further.

But it has to be ensured that no signals can be queued into it after that
point. exit_signals() sets PF_EXITING in task::flags, which can be used as
an indicator for this.

Cure it by:

  - Preventing signal queueing for task private signals (PIDTYPE_PID) when
    the task has PF_EXITING set in __send_signal_locked() and in
    posixtimer_send_sigqueue().

  - Protecting the unlocked setting of PF_EXITING in exit_signals() for the
    task group empty and the group exit case with sighand lock

  - Flushing task::pending signals right there.

    This can be done unlocked because PF_EXITING prevents further signals
    to be queued and there is no other code which accesses task::pending.

Fixes: fb3bbcfe344e ("exit: change the release_task() paths to call flush_sigqueue() lockless")
Reported-by: Hyunwoo Kim <imv4bel@gmail.com>
Debugged-by: Hyunwoo Kim <imv4bel@gmail.com>
Suggested-by: "Eric W. Biederman" <ebiederm@xmission.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: stable@vger.kernel.org
Closes: https://patch.msgid.link/aok1rdkBgZsynHZB@v4bel
---
 kernel/exit.c   |   11 ++++++-----
 kernel/signal.c |   23 ++++++++++++++++++++++-
 2 files changed, 28 insertions(+), 6 deletions(-)

--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -299,12 +299,13 @@ void release_task(struct task_struct *p)
 	free_pids(post.pids);
 	release_thread(p);
 	/*
-	 * This task was already removed from the process/thread/pid lists
-	 * and lock_task_sighand(p) can't succeed. Nobody else can touch
-	 * ->pending or, if group dead, signal->shared_pending. We can call
-	 * flush_sigqueue() lockless.
+	 * This task was already removed from the process/thread/pid lists and
+	 * lock_task_sighand(p) can't succeed. If it's the group leader then
+	 * flush tsk->signal->shared_pending. tsk->pending has been flushed
+	 * already in exit_signals(). Nothing else can touch
+	 * signal->shared_pending anymore, so flush_sigqueue() can be invoked
+	 * lockless.
 	 */
-	flush_sigqueue(&p->pending);
 	if (thread_group_leader(p))
 		flush_sigqueue(&p->signal->shared_pending);
 
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1030,6 +1030,10 @@ static int __send_signal_locked(int sig,
 	lockdep_assert_held(&t->sighand->siglock);
 
 	result = TRACE_SIGNAL_IGNORED;
+
+	if (unlikely(type == PIDTYPE_PID && (t->flags & PF_EXITING)))
+		goto ret;
+
 	if (!prepare_signal(sig, t, force))
 		goto ret;
 
@@ -1990,6 +1994,9 @@ void posixtimer_send_sigqueue(struct k_i
 	if (!likely(lock_task_sighand(t, &flags)))
 		return;
 
+	if (unlikely(tmr->it_pid_type == PIDTYPE_PID && (t->flags & PF_EXITING)))
+		return;
+
 	/*
 	 * Update @tmr::sigqueue_seq for posix timer signals with sighand
 	 * locked to prevent a race against dequeue_signal().
@@ -3118,6 +3125,16 @@ static void retarget_shared_pending(stru
 	}
 }
 
+/*
+ * tsk::flags has PF_EXITING set which prevents signals to be queued on
+ * tsk::pending. Nothing else can touch tsk::pending anymore so it can be
+ * flushed lockless.
+ */
+static inline void flush_pending_unlocked(struct task_struct *tsk)
+{
+	flush_sigqueue(&tsk->pending);
+}
+
 void exit_signals(struct task_struct *tsk)
 {
 	int group_stop = 0;
@@ -3130,8 +3147,10 @@ void exit_signals(struct task_struct *ts
 	cgroup_threadgroup_change_begin(tsk);
 
 	if (thread_group_empty(tsk) || (tsk->signal->flags & SIGNAL_GROUP_EXIT)) {
-		tsk->flags |= PF_EXITING;
+		scoped_guard(spinlock_irq, &tsk->sighand->siglock)
+			tsk->flags |= PF_EXITING;
 		cgroup_threadgroup_change_end(tsk);
+		flush_pending_unlocked(tsk);
 		return;
 	}
 
@@ -3157,6 +3176,8 @@ void exit_signals(struct task_struct *ts
 out:
 	spin_unlock_irq(&tsk->sighand->siglock);
 
+	flush_pending_unlocked(tsk);
+
 	/*
 	 * If group stop has completed, deliver the notification.  This
 	 * should always go to the real parent of the group leader.
