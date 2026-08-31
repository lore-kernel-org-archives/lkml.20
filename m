Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD66408039
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180748; cv=none; b=Qhbj2tWVkOT5VQEAr4QIekTEHRjTz2Wx64nzwZSjz6GIBaMufNXv9jirpowbHzYZlpXlWwQ1uD56tjSbWXMkZ6IuOEcd9UcG/UY+jSpWOWubc86qAKnMi3geCLuN4oCcIxW7Sx1Lahg7S3xktrmuOBQGRpJJzgMFOAzG/opAoUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180748; c=relaxed/simple;
	bh=XuBUEl5/eokYy8lPACr5LOkImSqVXCxuICsOkd9K8zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9xr+ydNANf5YbOYGNpNMcoHpP+IK5/dkmzA+QOQb4w/vJy1qC47GYqGB4TWwwRsJprZLSH+wWpSS084dmGH6K2KlH8nIk+1FNSeFbYqYtxPfJU8oPwUQFv6pTOlcQxaP50gHs03dpqkid8Rvjh7r6IRz7HBNxQSHpRFvzu3m3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBjWBodG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBjWBodG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4823E1F00A3F;
	Mon, 31 Aug 2026 12:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788180742;
	bh=/Y7NRox9U9DMWkxyO3a+3Pxa5fVKnrpEfmS1tYHwr9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UBjWBodGuts0RZByVVny9TZrWWqZpStXCavqg034vM9ejNwzW/t+G83YBalm7ER4a
	 5nJZvwggS1MBSDp57P1uEK9dhpdARulK2YoDiLYnMaL0tb9QVMDnWFlpMWFqrJDO2Z
	 NstrGp2L/Y5BpmAdJe5Hfqb/AF4ekaf3yZZCP8zglNSkdeNzpwqKYFTaL/0sXM5Upi
	 BbZXElI3nsR3/39PyTQxJEC5sZ9mIYvVWXaNZbVuSlJ87t5d2GMAqfpq1kJYIxTHnI
	 At3TGcCSLDejHppQh9MdzMVhsAJSKE41gmQthy/0thgzw32Vw0wHZJpW3B99ZIOxOg
	 XZw4TpVgoO18g==
Date: Mon, 31 Aug 2026 14:52:19 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
	Oleg Nesterov <oleg@redhat.com>, Hyunwoo Kim <imv4bel@gmail.com>,
	brauner@kernel.org, peterz@infradead.org, anna-maria@linutronix.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: Prevent exec() race
Message-ID: <apV5A6IGNIe2Uh4f@localhost.localdomain>
References: <87zey8g05g.ffs@fw13>
 <ao8_NUo0ACPAA4QB@redhat.com>
 <87ecfki6l5.fsf@email.froward.int.ebiederm.org>
 <87se3zgb3m.ffs@fw13>
 <87mru7h09e.fsf@email.froward.int.ebiederm.org>
 <87tsofdvf2.ffs@fw13>
 <871pbfeaiv.ffs@fw13>
 <87zey3fep2.fsf@email.froward.int.ebiederm.org>
 <87pkyyd39l.ffs@fw13>
 <87h5kad0mx.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h5kad0mx.ffs@fw13>

Le Mon, Aug 31, 2026 at 12:50:46PM +0200, Thomas Gleixner a écrit :
> Hyunwoo debugged the following KASAN UAF splat:
> 
>   BUG: KASAN: slab-use-after-free in __send_signal_locked+0xb27/0xba0
>   Write of size 8 at addr ffff888007ed80c8 by task poc/79
>   ...
>   Call Trace:
>    __send_signal_locked+0xb27/0xba0
>    do_send_sig_info+0xa7/0x160
>    do_send_specific+0x76/0xa0
>    __x64_sys_tgkill+0x193/0x270
>   ...
>   Allocated by task 80:
>    do_timer_create+0x1a4/0x1030
>    __x64_sys_timer_create+0x145/0x190
>   ...
>   Freed by task 12:
>    kmem_cache_free_bulk+0x1f8/0x4a0
>    kvfree_rcu_bulk+0x14f/0x1c0
>    kfree_rcu_work+0x128/0x1a0
>   ...
>   Last potentially related work creation:
>    kvfree_call_rcu+0x39/0x390
>    __flush_itimer_signals+0x211/0x320
>    flush_itimer_signals+0x47/0x90
>    begin_new_exec+0xa6b/0x28c0
> 
> It turned out that this happens with a non-leader exec() as Hyunwoo
> explained:
> 
> de_thread() calls exchange_tids() before release_task(leader), so the
> struct pid held by a SIGEV_THREAD_ID timer created against the leader's tid
> now points to the thread which called execve(). pid_task() returns that
> thread and lock_task_sighand() on it succeeds.
> 
> If the timer signal is blocked, its sigqueue stays queued on the leader's
> task::pending. The next expiry of that timer can then run while
> release_task() flushes the queue.
> 
> posixtimer_send_sigqueue() checks whether the sigqueue is already queued
> with a plain list_empty(), which only reads list_head::next.
> list_del_init() is not atomic and INIT_LIST_HEAD() stores list_head::next
> before list_head::prev, so the check can pass in between. list_add_tail()
> queues the entry on the task::pending of the live thread, and the
> list_head::prev store from the flush then overwrites the list_head::prev
> link that list_add_tail() has just set.
> 
> __flush_itimer_signals() does not undo that either. With list_head::prev
> pointing at the entry itself, its list_del_init() only stores the same
> values again, so the entry is not removed from the list. It is still there
> after the last reference is dropped and the timer is freed by RCU, and the
> list_add_tail() of a later tgkill() follows that list_head::prev into the
> freed timer.
> 
> This problem is due to a recent commit which moved the sigqueue flush
> out of the sighand lock held region. Before that it was properly
> serialized.
> 
> Hyonwoo proposed to fix this by using list_del_init_careful(), but that
> just papers over the underlying problem. After some disucssions and
> various attempts to solve it, Eric pointed out that there is no reason
> to flush task::pending late in release_task() and it should be done in
> exit_signals() already.
> 
> As nothing can collect and deliver signals which are queued in a dying
> task's pending queue, there is no reason to delay it further.
> 
> But it has to be ensured that no signals can be queued into it after that
> point. exit_signals() sets PF_EXITING in task::flags, which can be used as
> an indicator for this.
> 
> Cure it by:
> 
>   - Preventing signal queueing for task private signals (PIDTYPE_PID) when
>     the task has PF_EXITING set in __send_signal_locked() and in
>     posixtimer_send_sigqueue().
> 
>   - Protecting the unlocked setting of PF_EXITING in exit_signals() for the
>     task group empty and the group exit case with sighand lock
> 
>   - Flushing task::pending signals right there.
> 
>     This can be done unlocked because PF_EXITING prevents further signals
>     to be queued and there is no other code which accesses task::pending.
> 
> Fixes: fb3bbcfe344e ("exit: change the release_task() paths to call flush_sigqueue() lockless")
> Reported-by: Hyunwoo Kim <imv4bel@gmail.com>
> Debugged-by: Hyunwoo Kim <imv4bel@gmail.com>
> Suggested-by: "Eric W. Biederman" <ebiederm@xmission.com>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: stable@vger.kernel.org
> Closes: https://patch.msgid.link/aok1rdkBgZsynHZB@v4bel
> ---
>  kernel/exit.c   |   11 ++++++-----
>  kernel/signal.c |   23 ++++++++++++++++++++++-
>  2 files changed, 28 insertions(+), 6 deletions(-)
> 
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -299,12 +299,13 @@ void release_task(struct task_struct *p)
>  	free_pids(post.pids);
>  	release_thread(p);
>  	/*
> -	 * This task was already removed from the process/thread/pid lists
> -	 * and lock_task_sighand(p) can't succeed. Nobody else can touch
> -	 * ->pending or, if group dead, signal->shared_pending. We can call
> -	 * flush_sigqueue() lockless.
> +	 * This task was already removed from the process/thread/pid lists and
> +	 * lock_task_sighand(p) can't succeed. If it's the group leader then
> +	 * flush tsk->signal->shared_pending. tsk->pending has been flushed
> +	 * already in exit_signals(). Nothing else can touch
> +	 * signal->shared_pending anymore, so flush_sigqueue() can be invoked
> +	 * lockless.
>  	 */
> -	flush_sigqueue(&p->pending);
>  	if (thread_group_leader(p))
>  		flush_sigqueue(&p->signal->shared_pending);
>  
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -1030,6 +1030,10 @@ static int __send_signal_locked(int sig,
>  	lockdep_assert_held(&t->sighand->siglock);
>  
>  	result = TRACE_SIGNAL_IGNORED;
> +
> +	if (unlikely(type == PIDTYPE_PID && (t->flags & PF_EXITING)))
> +		goto ret;
> +
>  	if (!prepare_signal(sig, t, force))
>  		goto ret;
>  
> @@ -1990,6 +1994,9 @@ void posixtimer_send_sigqueue(struct k_i
>  	if (!likely(lock_task_sighand(t, &flags)))
>  		return;
>  
> +	if (unlikely(tmr->it_pid_type == PIDTYPE_PID && (t->flags & PF_EXITING)))
> +		return;
> +
>  	/*
>  	 * Update @tmr::sigqueue_seq for posix timer signals with sighand
>  	 * locked to prevent a race against dequeue_signal().
> @@ -3118,6 +3125,16 @@ static void retarget_shared_pending(stru
>  	}
>  }
>  
> +/*
> + * tsk::flags has PF_EXITING set which prevents signals to be queued on
> + * tsk::pending. Nothing else can touch tsk::pending anymore so it can be
> + * flushed lockless.
> + */
> +static inline void flush_pending_unlocked(struct task_struct *tsk)
> +{
> +	flush_sigqueue(&tsk->pending);
> +}
> +
>  void exit_signals(struct task_struct *tsk)
>  {
>  	int group_stop = 0;
> @@ -3130,8 +3147,10 @@ void exit_signals(struct task_struct *ts
>  	cgroup_threadgroup_change_begin(tsk);
>  
>  	if (thread_group_empty(tsk) || (tsk->signal->flags & SIGNAL_GROUP_EXIT)) {
> -		tsk->flags |= PF_EXITING;
> +		scoped_guard(spinlock_irq, &tsk->sighand->siglock)
> +			tsk->flags |= PF_EXITING;
>  		cgroup_threadgroup_change_end(tsk);
> +		flush_pending_unlocked(tsk);
>  		return;
>  	}
>  
> @@ -3157,6 +3176,8 @@ void exit_signals(struct task_struct *ts
>  out:
>  	spin_unlock_irq(&tsk->sighand->siglock);
>  
> +	flush_pending_unlocked(tsk);
> +

Is the following situation possible?

CPU 0                                CPU 1                   CPU 2
-----                                -----                   -----

exit_signals()
   spin_lock(sighand)
   tsk->flags |= PF_EXITING;
   spin_unlock(sighand)

   flush_pending_unlocked(tsk);

  ...
  do_task_dead()
                                     de_thread()
                                        // acquired tsk->flags
                                        // and signal flushed
                                        // through tasklist_lock
                                        transfer_pid()
                                                           
                                                           posix_timer_fn()
                                                              posixtimer_send_sigqueue()
                                                                 // happen to see new leader
                                                                 t = posixtimer_get_target(tmr)
                                                                 lock_task_sighand()
                                                                 // passes !PF_EXITING cond
                                                                 // but what makes sure that flush_pending_unlocked()
                                                                 // is observed here? So that signal list isn't messed up
                                                                 // pid_task() doesn't have acquire semantics
                                        release_task()


-- 
Frederic Weisbecker
SUSE Labs
