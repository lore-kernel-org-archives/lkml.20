Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667F02F3C18
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269757; cv=none; b=JT81B22vi9I+VI/s9/0a3lrL5eVMGBGwMlEOQBLkJX6TY/wv03qFJzNNBHfE4Q11886Pfh8ZK1lx+8AL1DmRXfXb2E7CLsrK7TY731mbe5Z9exh/9kY7tcEM/2p3B20WylcnuFBw4KmV2UlIs235EPoSnBRDd0jvM6B9lKZ2dCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269757; c=relaxed/simple;
	bh=dONpJz9pDD2pBmEcpY6gUuPfKWQcAsbKCf8Sn1/zKMY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CLRiJRwHbY3+AKcU19/wW51hU7mtItOejRzzDgYZgHUd3WAhP8zDFu/cTgDzi6TDWRGIwbRb/DJG8fE8KHUvVYFjO4CwY/RzFhecaP2AJBGYxuROipfaW8Nd5ewO5gSlhyOuPEcKKwLBSPGHBQUq4QN0UnSQOyeKPYcN+fCqK1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SN2Zbp4k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SN2Zbp4k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DEB01F000E9;
	Tue,  1 Sep 2026 13:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788269755;
	bh=At4u3yl4MiljIZoOYQR5cpNbzb/KVSL5oMn+ZrYRePU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=SN2Zbp4kU53RVw8zOIwVp3+/MTZG7r6d8O2H/5zkKbT9DRmMdo0VdbQgZ3sMQmuSd
	 B0+5ssgb80S99F47Fg4AMp4RoikX8hJ17P2rJ5GxSkHwoZwrPdF96T/QABO5I7hb0A
	 8AGdAZ1obMYYoL0fgU4BPQzZPp8lQr6BJYkfd3UOQQpo31eCsgDsd0KV3Agw7SJ7bk
	 TZFADWCl1mn297/HsNP+ITw/QYqNddJbSq1bNVLI/z0SmKthxDstBr2HDedoogrocW
	 uOEkqXU0HB+bi24IN3ljDpZPEj9pxO8KRFgKkVLinJ5tFbOQnXveIBl9692MdU/JAe
	 wxVy6l+FAJmHg==
From: Thomas Gleixner <tglx@kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Frederic Weisbecker
 <frederic@kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
 brauner@kernel.org, peterz@infradead.org, anna-maria@linutronix.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: Prevent exec() race
In-Reply-To: <87bjaie2gc.fsf@email.froward.int.ebiederm.org>
References: <875x10hrkt.ffs@fw13> <8733w3j1i1.ffs@fw13>
 <aowkvvxg8cPP5V0X@redhat.com> <aoww8qi_ce_8ECA9@redhat.com>
 <aoxOVAd8ooqHFW12@localhost.localdomain> <87pkz6gms6.ffs@fw13>
 <ao3kt-eRxw4agOj7@redhat.com> <87fr02gegn.ffs@fw13>
 <ao6zmDB9EjsqPIVN@redhat.com> <87zey8g05g.ffs@fw13>
 <ao8_NUo0ACPAA4QB@redhat.com>
 <87ecfki6l5.fsf@email.froward.int.ebiederm.org> <87se3zgb3m.ffs@fw13>
 <87mru7h09e.fsf@email.froward.int.ebiederm.org> <87tsofdvf2.ffs@fw13>
 <871pbfeaiv.ffs@fw13> <87zey3fep2.fsf@email.froward.int.ebiederm.org>
 <87pkyyd39l.ffs@fw13> <87h5kad0mx.ffs@fw13>
 <87bjaie2gc.fsf@email.froward.int.ebiederm.org>
Date: Tue, 01 Sep 2026 15:35:52 +0200
Message-ID: <87wlt5aybr.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Aug 31 2026 at 10:26, Eric W. Biederman wrote:
>
> This changes partially fixes another bug.  Recursive
> UCOUNT_RLIMIT_SIGPENDING should be decremented when the process exits
> and not when the process is reaped.
>
> Others have noticed possible races flushing the siqueue not
> holding siglock.

Yes. I doesn't work.

> If I read the history correctly in flush_sigqueue with irqs
> disabled can trigger the NMI lock-up detector.  So flush_sigqueue
> was moved outside of siglock_irq.
>
> Apparently it took KASAN to make kmem_cache_free slow enough
> to trigger the lock-up detector.
>
> The fix to avoid the lock-up detector was not comprehensive and
> flush_sigqueue is still called in many places with irqs disabled.
> So if necessary the code can probably just take siglock.

Right, invoke flush_sigqueue() right after setting PF_EXITING.

But we can be smarter than that. See below.

> We can also avoid problems by updating the loops that go:
> for_each_thread(p, q)
> 	flush_sigqueue_mask(p, &flush, &t->pending)
>
> To include
> 	if (t->flags & PF_EXITING)
>         	continue;
>
> Or perhaps better tweak flush_sigqueue_mask to take t (and not p) and
> perform the test of PF_EXITING there.  The only current uses I see of
> the passed in task is to get a reference to signal_struct.

Correct. Though that check would have to be limited to flushing
tsk::pending not signal::shared_pending.

Thanks,

        tglx
---
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -457,30 +457,44 @@ static void __sigqueue_free(struct sigqu
 	kmem_cache_free(sigqueue_cachep, q);
 }
 
-void flush_sigqueue(struct sigpending *queue)
+static void flush_sigqueue_list(struct list_head *head)
 {
-	struct sigqueue *q;
+	struct sigqueue *q, *tmp;
 
-	sigemptyset(&queue->signal);
-	while (!list_empty(&queue->list)) {
-		q = list_entry(queue->list.next, struct sigqueue , list);
+	list_for_each_entry_safe(q, tmp, head, list) {
 		list_del_init(&q->list);
 		__sigqueue_free(q);
 	}
 }
 
+void flush_sigqueue(struct sigpending *queue)
+{
+	sigemptyset(&queue->signal);
+	flush_sigqueue_list(&queue->list);
+}
+
+static void sigqueue_splice_pending(struct sigpending *queue, struct list_head *head)
+{
+	sigemptyset(&queue->signal);
+	list_splice_init(&queue->list, head);
+}
+
 /*
  * Flush all pending signals for this kthread.
  */
 void flush_signals(struct task_struct *t)
 {
-	unsigned long flags;
+	LIST_HEAD(pending);
+	LIST_HEAD(shared);
 
-	spin_lock_irqsave(&t->sighand->siglock, flags);
-	clear_tsk_thread_flag(t, TIF_SIGPENDING);
-	flush_sigqueue(&t->pending);
-	flush_sigqueue(&t->signal->shared_pending);
-	spin_unlock_irqrestore(&t->sighand->siglock, flags);
+	scoped_guard(spinlock_irqsave, &t->sighand->siglock) {
+		clear_tsk_thread_flag(t, TIF_SIGPENDING);
+		sigqueue_splice_pending(&t->pending, &pending);
+		sigqueue_splice_pending(&t->signal->shared_pending, &shared);
+	}
+
+	flush_sigqueue_list(&pending);
+	flush_sigqueue_list(&shared);
 }
 EXPORT_SYMBOL(flush_signals);
 
@@ -3125,18 +3139,9 @@ static void retarget_shared_pending(stru
 	}
 }
 
-/*
- * tsk::flags has PF_EXITING set which prevents signals to be queued on
- * tsk::pending. Nothing else can touch tsk::pending anymore so it can be
- * flushed lockless.
- */
-static inline void flush_pending_unlocked(struct task_struct *tsk)
-{
-	flush_sigqueue(&tsk->pending);
-}
-
 void exit_signals(struct task_struct *tsk)
 {
+	LIST_HEAD(sigq_list);
 	int group_stop = 0;
 	sigset_t unblocked;
 
@@ -3147,10 +3152,12 @@ void exit_signals(struct task_struct *ts
 	cgroup_threadgroup_change_begin(tsk);
 
 	if (thread_group_empty(tsk) || (tsk->signal->flags & SIGNAL_GROUP_EXIT)) {
-		scoped_guard(spinlock_irq, &tsk->sighand->siglock)
+		scoped_guard(spinlock_irq, &tsk->sighand->siglock) {
 			tsk->flags |= PF_EXITING;
+			sigqueue_splice_pending(&tsk->pending, &sigq_list);
+		}
 		cgroup_threadgroup_change_end(tsk);
-		flush_pending_unlocked(tsk);
+		flush_sigqueue_list(&sigq_list);
 		return;
 	}
 
@@ -3160,6 +3167,7 @@ void exit_signals(struct task_struct *ts
 	 * see wants_signal(), do_signal_stop().
 	 */
 	tsk->flags |= PF_EXITING;
+	sigqueue_splice_pending(&tsk->pending, &sigq_list);
 
 	cgroup_threadgroup_change_end(tsk);
 
@@ -3176,7 +3184,7 @@ void exit_signals(struct task_struct *ts
 out:
 	spin_unlock_irq(&tsk->sighand->siglock);
 
-	flush_pending_unlocked(tsk);
+	flush_sigqueue_list(&sigq_list);
 
 	/*
 	 * If group stop has completed, deliver the notification.  This
