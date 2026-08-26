Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A027912CDBE
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787771976; cv=none; b=dvB0XVREJJbEBbxWt8LZMD3DKOAy6pNwAz4Rsj2Wdqx92I5PbTdjZ0L+YG0cr/JCqafeI4fk+3dsZkRAMjqjkfqiv2G2ByyFYmAikcKEhFeEDRoUaysnngqWqCsl+80zzi4x6oqMmYaqQGaNtQq6uHkAofdQWRtx3Q/vECnldxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787771976; c=relaxed/simple;
	bh=SCtWU9nXjasWEFwEIVTP8Ts/MHnfr4JfnvEQlsWDkGY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UNaFnRi/EUxwQmncEbf7dchAWCdgexXrmrx/ZNaESHO7g9CHhnrZsVrbofvXDL+JZIPHkHYExKgJ4Pz6ZIK68+wKfPu8ibcGtRNxhdeNZk73x4q19b7SCHUOxjDEcFyXFTAmnKkvhbS2Yn3rZAJXDrh/JEJuRxYTbYlX6JueF4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4Kg7W+i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4Kg7W+i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1DAE1F000E9;
	Wed, 26 Aug 2026 19:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787771966;
	bh=saOmwzAj1Zm5MqmoMtZMX5mJHLX+x5Ej2P0xSU/mRn0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=L4Kg7W+iQhD4otZ0cTexsWvjMLfeDTGcvBWTxZJO1LHb9r7qgeHOapL519up9Tiyh
	 IFobIQBDiJ0PWexhiGV6UTktPI8uZg36zHxe4sNXCVIQZAhBiENE9uhWrE00tEUsL/
	 ZPDHBu4nnmRADpG+myWhl/Y8TVm0UiJKU/iyQK60S+wv2t2YiQPLDCiZGvZ4QHvGN+
	 bXHXXPFdz7LCU2BvwxvobukQVo6B9/5G3nlyfa3EPBFmOOi7v5kkUr6JIucAzE27yt
	 OCHJjRFDJmHwsMMPIrq5EM6ZKWUdIK0ZVvn8LscyMzNVSg7/0iAjVXhmckHxNcClPL
	 VGsmt4UwG6GEw==
From: Thomas Gleixner <tglx@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Frederic Weisbecker <frederic@kernel.org>, Hyunwoo Kim
 <imv4bel@gmail.com>, brauner@kernel.org, peterz@infradead.org,
 anna-maria@linutronix.de, ebiederm@xmission.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: Use list_del_init_careful() in flush_sigqueue()
In-Reply-To: <ao6zmDB9EjsqPIVN@redhat.com>
References: <aok1rdkBgZsynHZB@v4bel> <875x10hrkt.ffs@fw13>
 <8733w3j1i1.ffs@fw13> <aowkvvxg8cPP5V0X@redhat.com>
 <aoww8qi_ce_8ECA9@redhat.com> <aoxOVAd8ooqHFW12@localhost.localdomain>
 <87pkz6gms6.ffs@fw13> <ao3kt-eRxw4agOj7@redhat.com> <87fr02gegn.ffs@fw13>
 <ao6zmDB9EjsqPIVN@redhat.com>
Date: Wed, 26 Aug 2026 21:19:23 +0200
Message-ID: <87zey8g05g.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Aug 26 2026 at 11:36, Oleg Nesterov wrote:
> On 08/25, Thomas Gleixner wrote:
>>
>> On Tue, Aug 25 2026 at 20:53, Oleg Nesterov wrote:
>> >
>> > And I'd suggest to check t->exit_state instead of PF_EXITING,
>> > posixtimer_send_sigqueue() can't miss it if it is called after
>> > scoped_guard(spinlock_irq, lock).
>>
>> It neither can miss PF_EXITING which is also set under sighand lock.
>
> Yes, I didn't mean that the PF_EXITING check is wrong... nevermind.
>
>> Once begin_new_exec() sets bprm->point_of_no_return = true there is
>> _ZERO_ reason to queue any posix timer signal anymore. Any failure after
>> that point will be fatal and shut the whole process down.
>>
>> begin_new_exex()
>> {
>>         ...
>>
>> 	bprm->point_of_no_return = true;
>>
>> 	scoped_guard(spinlock_irq, &me->sighand->siglock)
>> 		me->signal->flags |= SIGNAL_EXEC;
>
> We already have me->signal->group_exec_task.

I know.

> In mt-exec case it is always set under ->siglock, and cleared after
> the last thread passes __exit_signal() which takes the same lock.

That should work too.

My preference was to keep posix timer signal queueing completely
disabled until the posix timer cleanup has been done independent of the
multi-threaded exec(). The group exec check was just added because it's
the same single conditional in posixtimer_send_sigqueue().

>>         de_thread(me)
>>         ...
>>
>>         // FIXME: This sequence should be cleaned up with a
>>         //        posix_timer_exec() function with a proper stub
>> 	//        for CONFIG_POSIX_TIMERS=n.
>>
>> #ifdef CONFIG_POSIX_TIMERS
>> 	spin_lock_irq(&me->sighand->siglock);
>> 	posix_cpu_timers_exit(me);
>> 	spin_unlock_irq(&me->sighand->siglock);
>> 	exit_itimers(me);
>> 	flush_itimer_signals();
>> #endif
>
> OK... unfortunately we can't do this CONFIG_POSIX_TIMERS sequence before
> de_thread()... Another not-yet-exited sub-thread can create a timer
> with it_pid = current->pid. Right?

Yes. 

>> and in posixtimer_send_sigqueue()
>>
>> 	if (!likely(lock_task_sighand(t, &flags)))
>> 		return;
>>
>> 	if (unlikely(t->signal->flags & (SIGNAL_EXEC)))
>> 		goto unlock;
>
> See above, I think it can check t->signal->group_exec_task. Perhaps along
> with SIGNAL_GROUP_EXIT.
>
> So. With this change release_task()->flush_sigqueue(&old_leader->pending)
> can still race with posixtimer_send_sigqueue(), but it will do nothing.
>
> But it also does "nothing" if tmr->sigq is already pending (!list_empty)
> so I am starting to think about the change below again...

Sure, but that's an orthogonal optimization once we fixed the exec()
mess :)
