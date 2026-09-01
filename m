Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9ED488225
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283321; cv=none; b=tt5haKaCAHWV3n3bp68zIEBiVQiDH/gWGc0TxFsIzG6REj0cIEQI8M2Su95MPfktSw2ACaS9sIw0Mz7+lpmWtd0v/Y0/cc0ADaxjFvFgcTi2ATnX4uoVMY+pS3DEJJdTfNF7NOwEYHCh22G/4WSED1b0BIgOOfBCzMLM8p0vMSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283321; c=relaxed/simple;
	bh=8aJVUBA3aawPCimkIKXEaZd0deMb/WuZ1UgRXHZ1GMs=;
	h=From:To:Cc:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Subject; b=MYixoC9P3pZJAb79exvVPbYcu4V0jjxe4b2tjURf5b9ZNqEwBt6vi6JLq7ntR0x9fFFAusmYUoW6nHamvC5MO0F5RAlnV6ezzQt/mc2IJAKPeogLACwfCos4kSH6+B+BA269rcWpyZ+A3XojEsbgOB41KVlZQq6uwHUwMdm3nv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b=JtwFZzDw; arc=none smtp.client-ip=166.70.13.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b="JtwFZzDw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8aJVUBA3aawPCimkIKXEaZd0deMb/WuZ1UgRXHZ1GMs=; b=JtwFZzDwiFfX/MpbAywzSx8RZu
	FySsFQ3HIJlOtbuLXU5dcj1hOgpOy1LJhVz5A0EKFkGUxB5Kqw5sxneDu5tK73y86pHaTLrstci0D
	dZ6+19UBQBZaVeEY+OKYnGnWMUGVlv/ptoNYZ0/zPGaqvrs8g+RSD9yZC7/tOAOr4zB4=;
Received: from in01.mta.xmission.com ([166.70.13.51]:49368)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1x1SBD-00G6iz-K5; Tue, 01 Sep 2026 11:21:51 -0600
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:56968 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1x1SBC-00Djyp-Ez; Tue, 01 Sep 2026 11:21:51 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>,  Frederic Weisbecker
 <frederic@kernel.org>,  Hyunwoo Kim <imv4bel@gmail.com>,
  brauner@kernel.org,  peterz@infradead.org,  anna-maria@linutronix.de,
  linux-kernel@vger.kernel.org
In-Reply-To: <87wlt5aybr.ffs@fw13> (Thomas Gleixner's message of "Tue, 01 Sep
	2026 15:35:52 +0200")
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
	<87bjaie2gc.fsf@email.froward.int.ebiederm.org> <87wlt5aybr.ffs@fw13>
Date: Tue, 01 Sep 2026 12:21:45 -0500
Message-ID: <87qzjcdh06.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1x1SBC-00Djyp-Ez;;;mid=<87qzjcdh06.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;sPfnum=0;;;sPf=pass
X-XM-AID: U2FsdGVkX192/wOFlW/f3GiyY8axklOQ0lrOOyqGxck=
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.1 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa05 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
	*  0.0 XM_B_AI_SPAM_COMBINATION Email matches multiple AI-related
	*      patterns
X-Spam-DCC: XMission; sa05 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Thomas Gleixner <tglx@kernel.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 663 ms - load_scoreonly_sql: 0.04 (0.0%),
	signal_user_changed: 11 (1.6%), b_tie_ro: 9 (1.4%), parse: 1.25 (0.2%),
	 extract_message_metadata: 13 (2.0%), get_uri_detail_list: 3.1 (0.5%),
	tests_pri_-2000: 15 (2.3%), tests_pri_-1000: 2.8 (0.4%),
	tests_pri_-950: 1.48 (0.2%), tests_pri_-900: 1.00 (0.2%),
	tests_pri_-90: 182 (27.4%), check_bayes: 180 (27.2%), b_tokenize: 10
	(1.5%), b_tok_get_all: 33 (5.0%), b_comp_prob: 3.8 (0.6%),
	b_tok_touch_all: 128 (19.3%), b_finish: 1.09 (0.2%), tests_pri_0: 422
	(63.6%), check_dkim_signature: 0.55 (0.1%), check_dkim_adsp: 2.7
	(0.4%), poll_dns_idle: 0.85 (0.1%), tests_pri_10: 1.81 (0.3%),
	tests_pri_500: 8 (1.2%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] signal: Prevent exec() race
X-SA-Exim-Connect-IP: 166.70.13.51
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, anna-maria@linutronix.de, peterz@infradead.org, brauner@kernel.org, imv4bel@gmail.com, frederic@kernel.org, oleg@redhat.com, tglx@kernel.org
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out03.mta.xmission.com); SAEximRunCond expanded to false

Thomas Gleixner <tglx@kernel.org> writes:

> On Mon, Aug 31 2026 at 10:26, Eric W. Biederman wrote:
>>
>> This changes partially fixes another bug.  Recursive
>> UCOUNT_RLIMIT_SIGPENDING should be decremented when the process exits
>> and not when the process is reaped.
>>
>> Others have noticed possible races flushing the siqueue not
>> holding siglock.
>
> Yes. I doesn't work.
>
>> If I read the history correctly in flush_sigqueue with irqs
>> disabled can trigger the NMI lock-up detector.  So flush_sigqueue
>> was moved outside of siglock_irq.
>>
>> Apparently it took KASAN to make kmem_cache_free slow enough
>> to trigger the lock-up detector.
>>
>> The fix to avoid the lock-up detector was not comprehensive and
>> flush_sigqueue is still called in many places with irqs disabled.
>> So if necessary the code can probably just take siglock.
>
> Right, invoke flush_sigqueue() right after setting PF_EXITING.
>
> But we can be smarter than that. See below.
>
>> We can also avoid problems by updating the loops that go:
>> for_each_thread(p, q)
>> 	flush_sigqueue_mask(p, &flush, &t->pending)
>>
>> To include
>> 	if (t->flags & PF_EXITING)
>>         	continue;
>>
>> Or perhaps better tweak flush_sigqueue_mask to take t (and not p) and
>> perform the test of PF_EXITING there.  The only current uses I see of
>> the passed in task is to get a reference to signal_struct.
>
> Correct. Though that check would have to be limited to flushing
> tsk::pending not signal::shared_pending.

Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

I was just about to suggest removing the entire list under the lock,
and then cleaning up the list entries outside of the lock, then I saw
this email :)

I am not wild about the name sigqueue_splice_pending (what is being
spliced together).

Perhaps call it sigqueue_dequeue_pending?  I think that conveys what
is happening a little better.

Eric



>
> Thanks,
>
>         tglx
> ---
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -457,30 +457,44 @@ static void __sigqueue_free(struct sigqu
>  	kmem_cache_free(sigqueue_cachep, q);
>  }
>  
> -void flush_sigqueue(struct sigpending *queue)
> +static void flush_sigqueue_list(struct list_head *head)
>  {
> -	struct sigqueue *q;
> +	struct sigqueue *q, *tmp;
>  
> -	sigemptyset(&queue->signal);
> -	while (!list_empty(&queue->list)) {
> -		q = list_entry(queue->list.next, struct sigqueue , list);
> +	list_for_each_entry_safe(q, tmp, head, list) {
>  		list_del_init(&q->list);
>  		__sigqueue_free(q);
>  	}
>  }
>  
> +void flush_sigqueue(struct sigpending *queue)
> +{
> +	sigemptyset(&queue->signal);
> +	flush_sigqueue_list(&queue->list);
> +}
> +
> +static void sigqueue_splice_pending(struct sigpending *queue, struct list_head *head)
> +{
> +	sigemptyset(&queue->signal);
> +	list_splice_init(&queue->list, head);
> +}
> +
>  /*
>   * Flush all pending signals for this kthread.
>   */
>  void flush_signals(struct task_struct *t)
>  {
> -	unsigned long flags;
> +	LIST_HEAD(pending);
> +	LIST_HEAD(shared);
>  
> -	spin_lock_irqsave(&t->sighand->siglock, flags);
> -	clear_tsk_thread_flag(t, TIF_SIGPENDING);
> -	flush_sigqueue(&t->pending);
> -	flush_sigqueue(&t->signal->shared_pending);
> -	spin_unlock_irqrestore(&t->sighand->siglock, flags);
> +	scoped_guard(spinlock_irqsave, &t->sighand->siglock) {
> +		clear_tsk_thread_flag(t, TIF_SIGPENDING);
> +		sigqueue_splice_pending(&t->pending, &pending);
> +		sigqueue_splice_pending(&t->signal->shared_pending, &shared);
> +	}
> +
> +	flush_sigqueue_list(&pending);
> +	flush_sigqueue_list(&shared);
>  }
>  EXPORT_SYMBOL(flush_signals);
>  
> @@ -3125,18 +3139,9 @@ static void retarget_shared_pending(stru
>  	}
>  }
>  
> -/*
> - * tsk::flags has PF_EXITING set which prevents signals to be queued on
> - * tsk::pending. Nothing else can touch tsk::pending anymore so it can be
> - * flushed lockless.
> - */
> -static inline void flush_pending_unlocked(struct task_struct *tsk)
> -{
> -	flush_sigqueue(&tsk->pending);
> -}
> -
>  void exit_signals(struct task_struct *tsk)
>  {
> +	LIST_HEAD(sigq_list);
>  	int group_stop = 0;
>  	sigset_t unblocked;
>  
> @@ -3147,10 +3152,12 @@ void exit_signals(struct task_struct *ts
>  	cgroup_threadgroup_change_begin(tsk);
>  
>  	if (thread_group_empty(tsk) || (tsk->signal->flags & SIGNAL_GROUP_EXIT)) {
> -		scoped_guard(spinlock_irq, &tsk->sighand->siglock)
> +		scoped_guard(spinlock_irq, &tsk->sighand->siglock) {
>  			tsk->flags |= PF_EXITING;
> +			sigqueue_splice_pending(&tsk->pending, &sigq_list);
> +		}
>  		cgroup_threadgroup_change_end(tsk);
> -		flush_pending_unlocked(tsk);
> +		flush_sigqueue_list(&sigq_list);
>  		return;
>  	}
>  
> @@ -3160,6 +3167,7 @@ void exit_signals(struct task_struct *ts
>  	 * see wants_signal(), do_signal_stop().
>  	 */
>  	tsk->flags |= PF_EXITING;
> +	sigqueue_splice_pending(&tsk->pending, &sigq_list);
>  
>  	cgroup_threadgroup_change_end(tsk);
>  
> @@ -3176,7 +3184,7 @@ void exit_signals(struct task_struct *ts
>  out:
>  	spin_unlock_irq(&tsk->sighand->siglock);
>  
> -	flush_pending_unlocked(tsk);
> +	flush_sigqueue_list(&sigq_list);
>  
>  	/*
>  	 * If group stop has completed, deliver the notification.  This
