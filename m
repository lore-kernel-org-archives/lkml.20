Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C143E49EA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176147; cv=none; b=STzWUTdC4GcP/lVK15lp7XXbILFopHpFJMxwn3ut6TSYykFF3L75JWfn9qNhndB/+F1T42m/x+ZeFO6mWWu6mbzC/AddfmTccR0+QpJyLwxy0OAwAKj45GrovEOx20W7Vv3/yZbhh/6x77/5Xo/XSMhLzOlpsM3/tgrSGkSl7l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176147; c=relaxed/simple;
	bh=G34vVcBjtNuLm4zHDPCP/nu6CBRB1VjWl+bJfL5dI6M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iHoAv1DhxIPTifsTH2yAsENS8rv0JQz+JPuE34iOR2qdB1h7mSqFEwJQIGd2Uo9+j4aEUiqhX6ZvmQD3WS0G6UqiZU7SeBerENTWLilLy10wsPWeqUo40sxAeweOwMWLhRUj5Bg9mhN4Gpy97mdtivme/KpEZiHg20+ykIrbu0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2bnDORB; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2bnDORB"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482e2fdf6ebso2818710f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788176143; x=1788780943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nZYkEx3Ctxi7NgTIVrUS9p9a6fw6J6p+pzkMHeaVtDE=;
        b=U2bnDORByAdPy15g+nFZ+ZgWqreRRVGpaEMaw8lWfvTHT3fZD/c+KzVQ4dJYeqCKFf
         Cbq0HOyt9/yl4X6XAiJ7yzmrjAsqx6Z2D8vuK17mXCRxrpo9cBeteABX4YkebFux3od0
         Id09y5x1pskqgtxayiiUrU9QMm7TEDRzegaIuYWhTxzUZkogvmh8oiC7QiMIa5AKCSjs
         o+3XVrSNKQJRcCLp+z/UyNk+AgJ8Dea/7k9xV0mE7sNXOhbYIorjaPGpinWwHpEpuV7q
         A2wr3qAvIP5frkjGzbWJt0XHzjO40ECbRXPDZQiZvLMTy3DBa1f4ngL3q8JVuqrmpO+6
         IA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176143; x=1788780943;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZYkEx3Ctxi7NgTIVrUS9p9a6fw6J6p+pzkMHeaVtDE=;
        b=R2ZIgbDgYSkk4cKGunlRe9CWy5r2gb3JG5n5qiWiRh5K6cZbGZtuG12XdKR5D1MHHC
         mDbcThI5dvwzegvH0KboTqxSi1LRphYh1JplLy/LkK4/MbAQnMJMVqfKprcS59pj+2Zn
         Ra+/eshqyQixHEhLjlCoAO7evd0h5l5R3Fdv5miqFHPntjAx2wefxRzTC6BcPBE2Y07b
         b/lUeZAh8SJl5MnVAU4rOp2Ci0c78hwPFdDKBxOLRGnTlDIMnKVJd7SbM4z2NkHH/AtW
         mlbrAAADByOGzNWkhkpCq5Cx2NeBfCL7qima4M5T7FRWEXFvsA2PsbxCtmqFYosUuajr
         Dizg==
X-Forwarded-Encrypted: i=1; AKwUvBzIBiV9trxwniCMJFQq6KHfo4j1EsrvOtNXCqemJlh8dnlOD+pDWuMk1vA3XPhrxzAP9LWuRpoAVMbjzoU=@vger.kernel.org
X-Gm-Message-State: AFuF++nEz+f1IclpRPoMN/12t3V+7AO73LcmkK7hEh6/OgEKVh/BxR3e
	kbLGkkbaRsEoxVcBF1P8hlh1cB5Yh1qyOYbzNcgLFa4S1GUX8GU0b7mlSPbjINUG
X-Gm-Gg: AYBFou19vtQQmjQJr6BULjZYCLnlHPi7Y183rqdeEacRZurNUd/8/aheuPfH0Ixqlnj
	OKCyLPWGeus75YwxheJGHYEfVvxOGuFqXtUSP8j7rtZlXGM+I0v3+M6Vl6qhYqNFlE2kS/Xw5GW
	K+AnoZsOgpTlBYULOMtHOj2i9taKVfNTm+gGMcDLnuFeJnGEFuQzME8ux8wxI/svetD7s/BTHcU
	Kn3+7ci8+OGhPnnc7qrTv1d3WM5i3MHQXO1MKX7jPrSrOCPEpmwYJyhxlJOZLijXInXbctsplQr
	HIy9Zq0gn0xK7eQ63NWVEx0xImqGr9pMXxOcf+CkRH37VduwOoH0s6+yF5AMQND8Cq65faIqmB/
	6JR0UG1CpMpzwbDC4D9sRhundEJLjwg4QuWT4Fr+FQMmfFsiFnbj9iaKbVfi5jKL+Do+U3pr74b
	MuBBv8eZpC2MqWAiC7VkFPFrU2p1mFgouPWaQ3aeUwUk5F9LfqQZKoLHOtv8Px0yP/k2oraRyGT
	3d7Zs+PUtqVQzbOu8L/F/rs7I66XmFOp96r
X-Received: by 2002:a05:6000:2284:b0:482:eabd:642c with SMTP id ffacd0b85a97d-48440fcd986mr130563f8f.1.1788176143141;
        Mon, 31 Aug 2026 04:35:43 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20793sm21651095f8f.17.2026.08.31.04.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:35:42 -0700 (PDT)
Date: Mon, 31 Aug 2026 12:35:38 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Oleg Nesterov
 <oleg@redhat.com>, Frederic Weisbecker <frederic@kernel.org>, Hyunwoo Kim
 <imv4bel@gmail.com>, brauner@kernel.org, peterz@infradead.org,
 anna-maria@linutronix.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: Prevent exec() race
Message-ID: <20260831123538.45cb6d93@pumpkin>
In-Reply-To: <87h5kad0mx.ffs@fw13>
References: <875x10hrkt.ffs@fw13>
	<8733w3j1i1.ffs@fw13>
	<aowkvvxg8cPP5V0X@redhat.com>
	<aoww8qi_ce_8ECA9@redhat.com>
	<aoxOVAd8ooqHFW12@localhost.localdomain>
	<87pkz6gms6.ffs@fw13>
	<ao3kt-eRxw4agOj7@redhat.com>
	<87fr02gegn.ffs@fw13>
	<ao6zmDB9EjsqPIVN@redhat.com>
	<87zey8g05g.ffs@fw13>
	<ao8_NUo0ACPAA4QB@redhat.com>
	<87ecfki6l5.fsf@email.froward.int.ebiederm.org>
	<87se3zgb3m.ffs@fw13>
	<87mru7h09e.fsf@email.froward.int.ebiederm.org>
	<87tsofdvf2.ffs@fw13>
	<871pbfeaiv.ffs@fw13>
	<87zey3fep2.fsf@email.froward.int.ebiederm.org>
	<87pkyyd39l.ffs@fw13>
	<87h5kad0mx.ffs@fw13>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 12:50:46 +0200
Thomas Gleixner <tglx@kernel.org> wrote:

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

Is that unlikely() going do the right thing?
Pretty much the only way to avoid a branch in the 'usual' path is to test
PF_EXITING first.
So you could do:
	if (unlikely(t->flags & PF_EXITING) && type == PIDTYPE_PID)
		goto ret;
(assuming t->flags is unlikely to be a cache miss).
Or, if you can persuade the compiler not to use a branch for the ?:
	if (unlikely(t->flags & (type == PIDTYPE_PID ? PF_EXITING : 0)))
		goto ret;

David

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
>  	/*
>  	 * If group stop has completed, deliver the notification.  This
>  	 * should always go to the real parent of the group leader.
> 

