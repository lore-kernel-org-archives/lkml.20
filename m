Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B745C4A92F6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363572; cv=none; b=O+8DvHOxJotn9CsDULYDXkJCY6+DTfXCzvN3kVkVigbI7vnx2Y8vaLvxqe5/ew0DhWc1YhYHZ0RXYOB4fEagXtu1dJxnaET/h0B2hizL9/2JQpJlqU94NQs/F/bB6zZ40jM2FSmz44+ZK6zs/7QtWdewABD8bLvL6P55dAWWI5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363572; c=relaxed/simple;
	bh=d5HCoFyNtqPgC1bFkjLirzG3piI3fORjjAxN04xzDvA=;
	h=From:To:Cc:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Subject; b=W99z+f60k7RlZOM8M7ViqcZZ0+Ie3/biVheQ1UOt/Sxc8XRor1pAuNOCQiZBQqPa85yxRsizXQj1PO/25k34gqQyyqcE0mr5C5duEw5KDV6VxaTFMxZyOGQZZvMTkad4djwz+G26Mtkl8IVu9iGfz8zqRFI8ua+INYX9nMoBI/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b=WvWbtQaT; arc=none smtp.client-ip=166.70.13.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b="WvWbtQaT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=d5HCoFyNtqPgC1bFkjLirzG3piI3fORjjAxN04xzDvA=; b=WvWbtQaTEUJBlo8/dAvTqooM98
	2uOzV1w2ArOI95LGFVH4TlbFTNUnESoujflrW7mqKOucS17+lVCc6UJLufqUZvHI+V84zqe0C2gCS
	uaINj2llytBGLJx51veBriI/B3TeNPL2P1VB69ezL+xQ507mvqnqKICHqfBXK+5UQlQc=;
Received: from in02.mta.xmission.com ([166.70.13.52]:42662)
	by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1x1n3a-006EGx-RR; Wed, 02 Sep 2026 09:39:22 -0600
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:39318 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1x1n3Z-00GOrH-P3; Wed, 02 Sep 2026 09:39:22 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>,  Frederic Weisbecker
 <frederic@kernel.org>,  Hyunwoo Kim <imv4bel@gmail.com>,
  brauner@kernel.org,  peterz@infradead.org,  anna-maria@linutronix.de,
  linux-kernel@vger.kernel.org
In-Reply-To: <apgwWTwG_oq3ij8n@redhat.com> (Oleg Nesterov's message of "Wed, 2
	Sep 2026 16:19:05 +0200")
References: <87mru7h09e.fsf@email.froward.int.ebiederm.org>
	<87tsofdvf2.ffs@fw13> <871pbfeaiv.ffs@fw13>
	<87zey3fep2.fsf@email.froward.int.ebiederm.org> <87pkyyd39l.ffs@fw13>
	<87h5kad0mx.ffs@fw13> <87bjaie2gc.fsf@email.froward.int.ebiederm.org>
	<87wlt5aybr.ffs@fw13> <87qzjcdh06.fsf@email.froward.int.ebiederm.org>
	<87ecfcbyt1.ffs@fw13> <apgwWTwG_oq3ij8n@redhat.com>
Date: Wed, 02 Sep 2026 10:39:16 -0500
Message-ID: <87ecfbd5nf.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1x1n3Z-00GOrH-P3;;;mid=<87ecfbd5nf.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;sPfnum=0;;;sPf=pass
X-XM-AID: U2FsdGVkX1/hfbkPOpwwB2Fz6QuNgXOydy1ABWZft/M=
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.1 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5009]
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Oleg Nesterov <oleg@redhat.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 607 ms - load_scoreonly_sql: 0.05 (0.0%),
	signal_user_changed: 11 (1.9%), b_tie_ro: 10 (1.6%), parse: 0.91
	(0.2%), extract_message_metadata: 3.5 (0.6%), get_uri_detail_list:
	1.55 (0.3%), tests_pri_-2000: 3.3 (0.5%), tests_pri_-1000: 2.3 (0.4%),
	tests_pri_-950: 1.18 (0.2%), tests_pri_-900: 0.82 (0.1%),
	tests_pri_-90: 207 (34.2%), check_bayes: 205 (33.8%), b_tokenize: 8
	(1.2%), b_tok_get_all: 7 (1.2%), b_comp_prob: 2.2 (0.4%),
	b_tok_touch_all: 183 (30.2%), b_finish: 1.32 (0.2%), tests_pri_0: 357
	(58.9%), check_dkim_signature: 0.67 (0.1%), check_dkim_adsp: 5.0
	(0.8%), poll_dns_idle: 1.70 (0.3%), tests_pri_10: 2.0 (0.3%),
	tests_pri_500: 9 (1.5%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH V2] signal: Prevent exec() race
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, anna-maria@linutronix.de, peterz@infradead.org, brauner@kernel.org, imv4bel@gmail.com, frederic@kernel.org, tglx@kernel.org, oleg@redhat.com
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out02.mta.xmission.com); SAEximRunCond expanded to false

Oleg Nesterov <oleg@redhat.com> writes:

> as for the change on exit_signal,
>
> On 09/01, Thomas Gleixner wrote:
>>
>> @@ -3120,6 +3137,7 @@ static void retarget_shared_pending(stru
>>
>>  void exit_signals(struct task_struct *tsk)
>>  {
>> +	LIST_HEAD(sigq_list);
>>  	int group_stop = 0;
>>  	sigset_t unblocked;
>>
>> @@ -3130,8 +3148,12 @@ void exit_signals(struct task_struct *ts
>>  	cgroup_threadgroup_change_begin(tsk);
>>
>>  	if (thread_group_empty(tsk) || (tsk->signal->flags & SIGNAL_GROUP_EXIT)) {
>> -		tsk->flags |= PF_EXITING;
>> +		scoped_guard(spinlock_irq, &tsk->sighand->siglock) {
>> +			tsk->flags |= PF_EXITING;
>> +			sigqueue_dequeue_pending(&tsk->pending, &sigq_list);
>> +		}
>>  		cgroup_threadgroup_change_end(tsk);
>> +		flush_sigqueue_list(&sigq_list);
>>  		return;
>>  	}
>>
>> @@ -3141,6 +3163,7 @@ void exit_signals(struct task_struct *ts
>>  	 * see wants_signal(), do_signal_stop().
>>  	 */
>>  	tsk->flags |= PF_EXITING;
>> +	sigqueue_dequeue_pending(&tsk->pending, &sigq_list);
>>
>>  	cgroup_threadgroup_change_end(tsk);
>>
>> @@ -3157,6 +3180,8 @@ void exit_signals(struct task_struct *ts
>>  out:
>>  	spin_unlock_irq(&tsk->sighand->siglock);
>>
>> +	flush_sigqueue_list(&sigq_list);
>> +
>>  	/*
>>  	 * If group stop has completed, deliver the notification.  This
>>  	 * should always go to the real parent of the group leader.
>
> This is subjective and mostly cosmetic, but what do you think
> about the alternative change below?
>
> I won't insist, but to me both the patch and resulting code look
> a bit simpler this way.

I agree that simply removing the special case that could skip grabbing
siglock is more maintainable.  Just one last thing to think about.

Oleg it appears you were the one who added the special case to skip
taking siglock.  So if you aren't worried about us removing it then
I am happy to see it go.

Eric


> Oleg.
> ---
>
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -3120,6 +3120,7 @@ static void retarget_shared_pending(struct task_struct *tsk, sigset_t *which)
>  
>  void exit_signals(struct task_struct *tsk)
>  {
> +	LIST_HEAD(sigq_list);
>  	int group_stop = 0;
>  	sigset_t unblocked;
>  
> @@ -3129,21 +3130,18 @@ void exit_signals(struct task_struct *tsk)
>  	 */
>  	cgroup_threadgroup_change_begin(tsk);
>  
> -	if (thread_group_empty(tsk) || (tsk->signal->flags & SIGNAL_GROUP_EXIT)) {
> -		tsk->flags |= PF_EXITING;
> -		cgroup_threadgroup_change_end(tsk);
> -		return;
> -	}
> -
>  	spin_lock_irq(&tsk->sighand->siglock);
>  	/*
>  	 * From now this task is not visible for group-wide signals,
>  	 * see wants_signal(), do_signal_stop().
>  	 */
>  	tsk->flags |= PF_EXITING;
> +	sigqueue_dequeue_pending(&tsk->pending, &sigq_list);
>  
>  	cgroup_threadgroup_change_end(tsk);
>  
> +	if (thread_group_empty(tsk) || (tsk->signal->flags & SIGNAL_GROUP_EXIT))
> +		goto out;
>  	if (!task_sigpending(tsk))
>  		goto out;
> @@ -3157,6 +3155,7 @@ void exit_signals(struct task_struct *tsk)
>  out:
>  	spin_unlock_irq(&tsk->sighand->siglock);
>  
> +	flush_sigqueue_list(&sigq_list);
>  	/*
>  	 * If group stop has completed, deliver the notification.  This
>  	 * should always go to the real parent of the group leader.
