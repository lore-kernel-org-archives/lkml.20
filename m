Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C06D2F7F19
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788127465; cv=none; b=LHqPepGBvze3Lfc+aDCUpoc/QRsejjiPPsB6l6QxWnKmP6lctnKZH3HGTGg1ghJ+3aHOYZ3QJvDsY076tU/K6Ltj8PXzFQoOhPbtRwXBgifDMa3H6/JLvQUeob5xg4CMVDvp5gwMax+K1Ng0qTIV20ySEPsHN/s8hC2Pc8yWw5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788127465; c=relaxed/simple;
	bh=Xh9x1iMv2LVjid8UlU3cQtrYBqc3FfLYUom54GAnilQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Subject; b=sjMFrncAB6wx2jiGvmRS4i5zkmXs0U2a5SXCJ783uK1PeDAVnST/zmt4Max8dzzdrlIfz79gh22zXybuN08sWN6HHVTFhbVlbpvKShBXgrDuRKwgdkZPEkHEtNL96viOVqmt8WCoGcexDntTq94M9fERm6NbymCr1BgOs6Pjawo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b=U3qouB6n; arc=none smtp.client-ip=166.70.13.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b="U3qouB6n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Xh9x1iMv2LVjid8UlU3cQtrYBqc3FfLYUom54GAnilQ=; b=U3qouB6noV9NzrEJHYouEzQU40
	0NBAzS0OVucjYPGAe22L4dt4BU4Mii4mMpxB1BRW92fFsh2v1qmmMCwSf4IGGdqKw0jfmdhL6ygN9
	fzawDUruVvnY+WTd4pqt5dDjdhVzcikVAgP1RVNkCCck8p1Xt/yimFAoYmsj6nowGCMw=;
Received: from in01.mta.xmission.com ([166.70.13.51]:37140)
	by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1x0ndP-0017Ln-QA; Sun, 30 Aug 2026 16:04:15 -0600
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:38232 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1x0ndO-009cY6-OY; Sun, 30 Aug 2026 16:04:15 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>,  Frederic Weisbecker
 <frederic@kernel.org>,  Hyunwoo Kim <imv4bel@gmail.com>,
  brauner@kernel.org,  peterz@infradead.org,  anna-maria@linutronix.de,
  linux-kernel@vger.kernel.org
In-Reply-To: <871pbfeaiv.ffs@fw13> (Thomas Gleixner's message of "Sun, 30 Aug
	2026 20:19:36 +0200")
References: <875x10hrkt.ffs@fw13> <8733w3j1i1.ffs@fw13>
	<aowkvvxg8cPP5V0X@redhat.com> <aoww8qi_ce_8ECA9@redhat.com>
	<aoxOVAd8ooqHFW12@localhost.localdomain> <87pkz6gms6.ffs@fw13>
	<ao3kt-eRxw4agOj7@redhat.com> <87fr02gegn.ffs@fw13>
	<ao6zmDB9EjsqPIVN@redhat.com> <87zey8g05g.ffs@fw13>
	<ao8_NUo0ACPAA4QB@redhat.com>
	<87ecfki6l5.fsf@email.froward.int.ebiederm.org> <87se3zgb3m.ffs@fw13>
	<87mru7h09e.fsf@email.froward.int.ebiederm.org> <87tsofdvf2.ffs@fw13>
	<871pbfeaiv.ffs@fw13>
Date: Sun, 30 Aug 2026 17:04:09 -0500
Message-ID: <87zey3fep2.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1x0ndO-009cY6-OY;;;mid=<87zey3fep2.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;sPfnum=0;;;sPf=pass
X-XM-AID: U2FsdGVkX1+Lpv5eEEZPMJKRV79UUyt8GYamVPgEWEM=
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.1 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  0.5 XMGappySubj_01 Very gappy subject
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa08 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_02 5+ unique symbols in subject
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa08 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Thomas Gleixner <tglx@kernel.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 585 ms - load_scoreonly_sql: 0.07 (0.0%),
	signal_user_changed: 12 (2.0%), b_tie_ro: 10 (1.8%), parse: 1.27
	(0.2%), extract_message_metadata: 5 (0.9%), get_uri_detail_list: 2.7
	(0.5%), tests_pri_-2000: 4.4 (0.8%), tests_pri_-1000: 2.6 (0.4%),
	tests_pri_-950: 1.15 (0.2%), tests_pri_-900: 0.81 (0.1%),
	tests_pri_-90: 93 (16.0%), check_bayes: 92 (15.6%), b_tokenize: 11
	(1.8%), b_tok_get_all: 9 (1.6%), b_comp_prob: 3.5 (0.6%),
	b_tok_touch_all: 61 (10.5%), b_finish: 1.54 (0.3%), tests_pri_0: 443
	(75.7%), check_dkim_signature: 0.98 (0.2%), check_dkim_adsp: 3.9
	(0.7%), poll_dns_idle: 1.06 (0.2%), tests_pri_10: 1.93 (0.3%),
	tests_pri_500: 9 (1.6%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] signal: Use list_del_init_careful() in flush_sigqueue()
X-SA-Exim-Connect-IP: 166.70.13.51
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, anna-maria@linutronix.de, peterz@infradead.org, brauner@kernel.org, imv4bel@gmail.com, frederic@kernel.org, oleg@redhat.com, tglx@kernel.org
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out02.mta.xmission.com); SAEximRunCond expanded to false

Thomas Gleixner <tglx@kernel.org> writes:

> On Fri, Aug 28 2026 at 00:56, Thomas Gleixner wrote:
>> On Thu, Aug 27 2026 at 13:43, Eric W. Biederman wrote:
>>> The obvious place to clean up task::pending i.e. signals is in
>>> exit_signals().
>>>
>>> I expect if I read through the history again that I would find that
>>> exit_signals() used to call flush_sigqueue, and that during the addition
>>> of posix thread signal handling flush_sigqueue was moved into
>>> __exit_signal in release_task because knowing if the entire thread group
>>> is dead was not available during that part of 2.5.
>>>
>>> We should honor PF_EXITING on a task and simply stop delivering
>>> signals to it.  Today the code goes halfway there and does not
>>> set sig-pending after PF_EXITING is set.
>>
>> If flushing tsk::pending in exit_signals() is safe and stopping signals
>> to be queued when PF_EXITING is observed under sighand lock, then sure
>> that's the right thing to do. I'll look into that tomorrow.
>
> By some definition of tomorrow. :)
>
> Something like the below?

Yes.

It all comes after
   ptrace_event(PTRACE_EVENT_EXIT, code) and
   coredump_task_exit(tsk, core_state)
so should be completely invisible to userspace.

I don't see any problems with your proposed patch.

I am pondering what it would take to move
"flush_sigqueue(&p->signal->shared_pending);"
into do_exit in the group_dead case.

Perhaps exit_signals could perform the decrement of signal->live
and return group_dead.  If so all of the work could be performed
in exit_signals().  As a follow-on change of cource.

But before I even propose something like that I have another change
in this area that I need to post.

Eric



> ---
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
> + * tsk::flags has PF_EXITING set which prevents signals to be queued for on
> + * tsk::pending. Nothing else can touch the tsk::pending anymore so it can be
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
