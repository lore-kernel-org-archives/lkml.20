Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015832;
	b=GifEFz1wL6TIrxrkDDdmJnlzvdRiNWfeaeXQQOhGufJuxuI/WxGFVYTuqNJffh+OTNl5
	 2mENLEepUwliQBuQ1kSyX6IzlAh6c+315PZWq7IAPPcDPl4FcJuCErzIYmG/UPum00E7z
	 UCsUmVEbWXXPG2FaI/fPW031hSXFBgXdeSxuW7T4TbWUOmggdUJmQO4f5qXs5PnNPQl8C
	 AkEYGG3tXUG9+g2ZEq2hvaWlE+rU74JIAxCAfAvpcY+i4G7wkX8mpEZAaqn6gDGMxOTsK
	 5i9szwVo5NDFBYaPAAszOSyJjFnwbUG3JNZB+9pt6oQOvT+43VpCGgzmRLGNeaIGu9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015832;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=d1toWpq2JslyLlyG3aYJlW9m6pwk9hmbElNCBQSd9jY=;
	b=rQK41wgObpxHJlwajyqOrBd8UWfonTJ2gfbJvvhO4E/slaVRSrI+aXgdjUVxE8qobM3s
	 g4nKVOdTdCSOQBBdHjth4Um+CUlwQuauYmsZ4/RyTrJVv1h17ioF5ntrApmFxccZnUZzP
	 XfPnI9ewrUgvfvoou34i04HIi8k3h7Ojxfu2g0Nue2joZMFTM87NiN4HNWvNKL3IgsYgJ
	 HClOu+J7M7hCq7ApKlhPphzAtnjfZmoBArcFEWHo3AIjTwiGiztBmu0BkiINP7gcCJjHh
	 UJ4T7fwUSEaJ/6daOcy8LrXGkokVMjKOp6u6LvdoNgmh6Wq5gQgZ7uVBx0jSjhqQ7KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FXvZhC4Q;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EB1606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4EB1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FXvZhC4Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=d1toWpq2JslyLlyG3aYJlW9m6pwk9hmbElNCBQSd9jY=; b=FXvZhC4Qo5iKOcqfAfZmoBk6UK
	OyhF6ves/ljJtdqtiFHl422N7zOxHOfD3hJrjHEToG0ydDNHgMynaZmiIeKha7hPVsyrNPntlaGcW
	mwB5XQ8QmHYiCvffuiS6MDmL32IO4YDAbo6CH5RXLQwQHmd9/pEfaeffRY0GDZDZOh6uJfD2oseFp
	R+jA47zvgn/b5GCJof3GO+BKgbsNOSuDCX+zAc4O6jjpKZe/x2cm0XX1VMM+2oNysRf8MLclox2JP
	YFmNDlgqg3gqUTOYp+RKGH4a0e+UuemDSXg+nE2In8Puqh5w0IQB88Ia69tCyhYzG3Xkczt8FbAA4
	oC9Py09Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJK8-0000000Dmff-07ld;
	Mon, 26 Oct 2026 11:57:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0E4A13014C0; Mon, 26 Oct 2026 12:57:07 +0100 (CET)
Date: Mon, 26 Oct 2026 12:57:07 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/autogroup: Fix task_group UAF during thread
 creation
Message-ID: <20261026115707.GF2668200@noisy.programming.kicks-ass.net>
References: <20261023013631.881730-1-4ncienth@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023013631.881730-1-4ncienth@gmail.com>

On Fri, Oct 23, 2026 at 10:36:31AM +0900, Daehyeon Ko wrote:
> sched_cgroup_fork() assigns a CLONE_THREAD child in the root CPU cgroup to
> p->signal->autogroup->tg before the child is visible on the thread list.
> Autogroup ownership is per signal_struct: CLONE_THREAD reuses the existing
> signal_struct and does not acquire an autogroup reference for the child.
> 
> ksys_setsid() releases tasklist_lock before calling
> sched_autogroup_create_attach(), so tasklist_lock does not serialize the
> autogroup move against this unpublished part of copy_process():
> 
>   clone(CLONE_THREAD) caller      sibling setsid() caller
>   -------------------------       -----------------------
>   sched_cgroup_fork()
>                                   sched_autogroup_create_attach()
>                                     autogroup_move_group()
>                                       lock(siglock)
>                                       signal->autogroup = new
>                                       for_each_thread()
>                                       unlock(siglock)
>                                       autogroup_kref_put(old)
>   lock(siglock)
>   list_add_tail_rcu(thread_node)
>   unlock(siglock)
>   wake_up_new_task()
> 
> The iteration cannot see the unpublished child. The final put can therefore
> drop the signal's last reference to the old autogroup. Two RCU callbacks
> then free its per-CPU cfs_rq and task_group while p->sched_task_group,
> p->se.cfs_rq, and p->se.parent still point into them.
> 
> At the last failure-free point in copy_process(), revalidate the child's
> scheduler group while holding the shared siglock and keep the lock held
> through thread-list publication. An autogroup move then either completes
> before revalidation, or blocks until publication and includes the child.
> 
> If the group changed, update p->sched_task_group under p->pi_lock, clear
> p->se.cfs_rq so set_task_rq_fair() cannot inspect the freed old runqueue,
> and call set_task_rq() to rebuild the fair and RT group links. The TASK_NEW
> child has no attached load to migrate.
> 
> An unprivileged clone()/setsid() reproducer running as uid/gid 65534 with
> all capability sets empty triggered a KASAN task_group slab use-after-free
> in wake_up_new_task() on an unmodified Linux v7.3 kernel. The allocation
> came from sched_create_group(), and the free ran from
> sched_free_group_rcu().
> The fix completed 1,024 iterations of both the original race sweep and a
> delayed-setsid stress schedule without a KASAN, lockdep, oops, or panic
> report.
> 
> An AI coding assistant helped identify and validate the race, construct
> the reproducer, and draft and test this fix.
> 
> Fixes: b1e8206582f9 ("sched: Fix yet more sched_fork() races")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>

> diff --git a/kernel/fork.c b/kernel/fork.c
> index 10f2d05d816a5f..6df4ff21d1b780 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -2500,6 +2500,15 @@ __latent_entropy struct task_struct *copy_process(
>  
>  	/* No more failure paths after this point. */
>  
> +	/*
> +	 * A concurrent autogroup move can replace signal->autogroup after
> +	 * sched_cgroup_fork() but before this task is on the thread list.
> +	 * Recheck while holding siglock so the move either precedes this check or
> +	 * observes the new thread after publication below.
> +	 */
> +	if (clone_flags & CLONE_THREAD)
> +		sched_autogroup_fork_finalize(p, args);
> +
>  	/*
>  	 * Copy seccomp details explicitly here, in case they were changed
>  	 * before holding sighand lock.
> diff --git a/kernel/sched/autogroup.c b/kernel/sched/autogroup.c
> index e380cf9372bbd2..50ad43e7648fc5 100644
> --- a/kernel/sched/autogroup.c
> +++ b/kernel/sched/autogroup.c
> @@ -215,6 +215,36 @@ void sched_autogroup_fork(struct signal_struct *sig)
>  	sig->autogroup = autogroup_task_get(current);
>  }
>  
> +/**
> + * sched_autogroup_fork_finalize - recheck a new thread's scheduler group
> + * @p: new task
> + * @kargs: clone arguments holding the pinned cgroup set
> + *
> + * The caller must hold the shared sighand lock and keep it held through
> + * thread-list publication.  The task is still TASK_NEW and has no attached
> + * scheduler load.
> + */
> +void sched_autogroup_fork_finalize(struct task_struct *p,
> +				   struct kernel_clone_args *kargs)
> +{
> +	struct task_group *tg;
> +	unsigned long flags;
> +
> +	lockdep_assert_held(&p->sighand->siglock);
> +
> +	raw_spin_lock_irqsave(&p->pi_lock, flags);
> +	tg = container_of(kargs->cset->subsys[cpu_cgrp_id],
> +			  struct task_group, css);
> +	tg = autogroup_task_group(p, tg);
> +	if (tg != p->sched_task_group) {
> +		p->sched_task_group = tg;
> +		/* Do not let set_task_rq_fair() inspect the possibly freed cfs_rq. */
> +		p->se.cfs_rq = NULL;

I'm not sure this works; afaict this will result in a NULL deref
instead. 

> +		set_task_rq(p, task_cpu(p));
> +	}
> +	raw_spin_unlock_irqrestore(&p->pi_lock, flags);
> +}
> +
>  void sched_autogroup_exit(struct signal_struct *sig)
>  {
>  	autogroup_kref_put(sig->autogroup);


Can't we make ksys_setsid() more complicated instead? Have it create the
autogroup in advance, move under the tasklist_lock and destroy on
failure or something?

