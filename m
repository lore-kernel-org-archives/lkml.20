Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9108F3B5301
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 18:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788113980; cv=none; b=s/yn8od3SA92dA9JrtTspwOaA9p9o/WgIN9GC7kFoR7m08y7MkUwfvhSp29SdEHseC9bgtTET4mWWpdSiM2YbI9hdFfVrBBzvJZ9M7Pz1s5MzwZIgWpnu0MAV1JyHzUVPxCMrQgEFrfijiF7xOE84TAxnWHz+o5E+v+nj5GCZ/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788113980; c=relaxed/simple;
	bh=W+YSrzqi9Ln/ZgtnBm0b8oxawJ0iaid5JsCCwVkOwLE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tDpCsIPVMry8C0r5rUwFv50v2iFZfnHAO6yyRvikIJeeNwr493Nh5wqHxnKJATyrmYKZMzmUN4i43ZoyUrrzDXmZY2Ht5UzqEqp6qfM3NuMWdytaMfeFFtn+A3V9gpJkLAhNqSKYpYRToFSh8vYDd1Z58cZVNHQi1mbeRd9zfEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcnP+MB/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcnP+MB/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8176B1F000E9;
	Sun, 30 Aug 2026 18:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788113979;
	bh=xFqplNj4g6ay7dx433+7mYF6FGqS2F+MaKRiRScvVvs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WcnP+MB/6kQha7bgl4gGPR3ODFwboy5hhZLjx7brH8Sdgte+Wy/PRwVbhZECHrZG/
	 Gm1em+Nby5YlE6Ra60R1f4Y9RigSnP2gQH7Q1tB2NyfbPLIUXviuPCa/malo/5Z233
	 7PMw3XBn08j/qEw5+ICzZwO1TSAuRXxwbFEnjTn74muJxEheQj2bGanWnQ7T1dgGZD
	 RJmHXwxDfF6KcUsEf4qcopaaTnuvztojt7yRbLKILEtYI2cGEw5b7+PQmlZhxPP4qH
	 iVi7obpJtIjdhWRENrCYm+OKD7g2ClzFmVEqk5GsOxdf3cRbjRPPTAog33QpHejJv2
	 02Ej5jwfO6gCg==
From: Thomas Gleixner <tglx@kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Frederic Weisbecker
 <frederic@kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
 brauner@kernel.org, peterz@infradead.org, anna-maria@linutronix.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: Use list_del_init_careful() in flush_sigqueue()
In-Reply-To: <87tsofdvf2.ffs@fw13>
References: <875x10hrkt.ffs@fw13> <8733w3j1i1.ffs@fw13>
 <aowkvvxg8cPP5V0X@redhat.com> <aoww8qi_ce_8ECA9@redhat.com>
 <aoxOVAd8ooqHFW12@localhost.localdomain> <87pkz6gms6.ffs@fw13>
 <ao3kt-eRxw4agOj7@redhat.com> <87fr02gegn.ffs@fw13>
 <ao6zmDB9EjsqPIVN@redhat.com> <87zey8g05g.ffs@fw13>
 <ao8_NUo0ACPAA4QB@redhat.com>
 <87ecfki6l5.fsf@email.froward.int.ebiederm.org> <87se3zgb3m.ffs@fw13>
 <87mru7h09e.fsf@email.froward.int.ebiederm.org> <87tsofdvf2.ffs@fw13>
Date: Sun, 30 Aug 2026 20:19:36 +0200
Message-ID: <871pbfeaiv.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Aug 28 2026 at 00:56, Thomas Gleixner wrote:
> On Thu, Aug 27 2026 at 13:43, Eric W. Biederman wrote:
>> The obvious place to clean up task::pending i.e. signals is in
>> exit_signals().
>>
>> I expect if I read through the history again that I would find that
>> exit_signals() used to call flush_sigqueue, and that during the addition
>> of posix thread signal handling flush_sigqueue was moved into
>> __exit_signal in release_task because knowing if the entire thread group
>> is dead was not available during that part of 2.5.
>>
>> We should honor PF_EXITING on a task and simply stop delivering
>> signals to it.  Today the code goes halfway there and does not
>> set sig-pending after PF_EXITING is set.
>
> If flushing tsk::pending in exit_signals() is safe and stopping signals
> to be queued when PF_EXITING is observed under sighand lock, then sure
> that's the right thing to do. I'll look into that tomorrow.

By some definition of tomorrow. :)

Something like the below?

Thanks,

        tglx
---
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
+ * tsk::flags has PF_EXITING set which prevents signals to be queued for on
+ * tsk::pending. Nothing else can touch the tsk::pending anymore so it can be
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
