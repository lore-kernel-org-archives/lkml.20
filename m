Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CCD3CE4B5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542028; cv=none; b=bVR5UF5qnOqZ0vxzzyYHXk1xObqdQ9L5p/R59TgxPnaqhH2WLutlXi9o4nr8VGRCrvLtT9zbFjq7A9G9old2/x8DunwfqqYLtVSIXNvC3P/usr8V6TCnP4ZjDJ8QipQJtLEK0wkeTwkvCBSjxTU7nKhN+lvHdKSOhxy/NmuasFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542028; c=relaxed/simple;
	bh=ZESUfailFNltPVfDvW3JOisaJ6+AvyZIxxPbxsIOrY4=;
	h=From:To:Cc:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Subject; b=HnzBQGbItZC4gmh8Elyh7sQ7GZFCkQ7CL7Cob3LcbO2VDkbAKhUgPVX1TOEgiS1WbD377TzK2MXPLxeSvAth1qpi62AdwbeuzKFNST9rMh0Qw5YQfTQ+br5SG1aCpQLpOHF6fhrdbhxcwua/wYQT7tyfLUT+7xoNHax2B407hPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b=gu9H7twp; arc=none smtp.client-ip=166.70.13.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b="gu9H7twp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZESUfailFNltPVfDvW3JOisaJ6+AvyZIxxPbxsIOrY4=; b=gu9H7twpoozfBuIuBzFYuh5SQ+
	Laxbuc0sYpO532eTToZNgDs/jI2K/8svlPF4dG2pKL5avxoIIsM5nKinD2x3DpW89rxxHLSvbSRuM
	5AblGnb1IksF4OfZ8D9Y5WQImG0CSTvwXNFn4JkkCdFaEMTxrhBsVlqu2XFoNmnQQLEY=;
Received: from in02.mta.xmission.com ([166.70.13.52]:56460)
	by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1x2W8n-00BbpZ-Qe; Fri, 04 Sep 2026 09:47:45 -0600
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:58418 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1x2W8m-003Ui0-IW; Fri, 04 Sep 2026 09:47:45 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,  Hyunwoo Kim <imv4bel@gmail.com>,
  Oleg Nesterov <oleg@redhat.com>,  Frederic Weisbecker
 <frederic@kernel.org>,  Christian Brauner <brauner@kernel.org>,  Peter
 Zijlstra <peterz@infradead.org>,  John Stultz <jstultz@google.com>,  Ingo
 Molnar <mingo@kernel.org>,  Alexander Viro <viro@zeniv.linux.org.uk>
In-Reply-To: <871pb9cjbj.fsf@email.froward.int.ebiederm.org> (Eric
	W. Biederman's message of "Fri, 04 Sep 2026 07:06:08 -0500")
References: <20260904112100.683893401@kernel.org>
	<20260904112202.400768514@kernel.org>
	<871pb9cjbj.fsf@email.froward.int.ebiederm.org>
Date: Fri, 04 Sep 2026 10:47:38 -0500
Message-ID: <87ik4lauhx.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1x2W8m-003Ui0-IW;;;mid=<87ik4lauhx.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;sPfnum=0;;;sPf=pass
X-XM-AID: U2FsdGVkX1+0blsr+GOb0Zrw7ftqOOBdkGRauNePORI=
X-Spam-Level: **
X-Spam-Virus: No
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.1 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  1.5 XMNoVowels Alpha-numberic number with no vowels
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa02 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
	*  0.0 T_TooManySym_02 5+ unique symbols in subject
	*  0.2 XM_B_SpammyWords One or more commonly used spammy words
	*  0.4 FVGT_m_MULTI_ODD Contains multiple odd letter combinations
	*  1.0 T_XMDrugObfuBody_00 obfuscated drug references
X-Spam-DCC: XMission; sa02 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;Thomas Gleixner <tglx@kernel.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 799 ms - load_scoreonly_sql: 0.03 (0.0%),
	signal_user_changed: 3.8 (0.5%), b_tie_ro: 2.7 (0.3%), parse: 0.90
	(0.1%), extract_message_metadata: 10 (1.2%), get_uri_detail_list: 1.93
	(0.2%), tests_pri_-2000: 14 (1.7%), tests_pri_-1000: 2.1 (0.3%),
	tests_pri_-950: 1.07 (0.1%), tests_pri_-900: 0.70 (0.1%),
	tests_pri_-90: 352 (44.1%), check_bayes: 351 (43.9%), b_tokenize: 9
	(1.1%), b_tok_get_all: 41 (5.1%), b_comp_prob: 2.5 (0.3%),
	b_tok_touch_all: 294 (36.8%), b_finish: 0.84 (0.1%), tests_pri_0: 400
	(50.1%), check_dkim_signature: 0.42 (0.1%), check_dkim_adsp: 3.0
	(0.4%), poll_dns_idle: 1.51 (0.2%), tests_pri_10: 1.94 (0.2%),
	tests_pri_500: 9 (1.2%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [patch 7/8] posix-cpu-timers: Prevent enqueueing when
 PF_EXITING is set
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: viro@zeniv.linux.org.uk, mingo@kernel.org, jstultz@google.com, peterz@infradead.org, brauner@kernel.org, frederic@kernel.org, oleg@redhat.com, imv4bel@gmail.com, linux-kernel@vger.kernel.org, tglx@kernel.org
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out01.mta.xmission.com); SAEximRunCond expanded to false

"Eric W. Biederman" <ebiederm@xmission.com> writes:

2> Thomas Gleixner <tglx@kernel.org> writes:
>
>> To prepare for cleaning up POSIX CPU timers in do_exit(), prevent
>> enqueueing POSIX CPU timers on a task which has PF_EXITING set.
>>
>> Queueing a timer on such a task is pointless because the task won't expire
>> the timer anymore.
>>
>> Pretending that the timer is armed allows to keep the POSIX timer mechanism
>> "working" so that the timer stays accessible up to the point where a task
>> is unhashed.
>>
>> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
>> ---
>>  kernel/time/posix-cpu-timers.c |   27 +++++++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>
>> --- a/kernel/time/posix-cpu-timers.c
>> +++ b/kernel/time/posix-cpu-timers.c
>> @@ -628,6 +628,7 @@ static int posix_cpu_timer_del(struct k_
>>  	}
>>  
>>  	if (!ret) {
>> +		WARN_ON_ONCE(cpu_timer_queued(&timer->it.cpu));
>>  		put_pid(timer->it.cpu.pid);
>>  		timer->it_status = POSIX_TIMER_DISARMED;
>>  	}
>> @@ -674,6 +675,15 @@ void posix_cpu_timers_exit_group(struct
>>  	cleanup_timers(&tsk->signal->posix_cputimers);
>>  }
>>  
>> +static inline bool task_can_enqueue(struct k_itimer *timer, struct task_struct *p)
>> +{
>> +	if (likely(!(p->flags & PF_EXITING)))
>> +		return true;
>> +
>> +	/* Allow TGID type unless the last thread is on the way out. */
>> +	return clock_pid_type(timer->it_clock) == PIDTYPE_TGID && atomic_read(&p->signal->live);
>
> Couldn't this be?
>
> 	/* Allow TGID type unless the group is on the way out. */
> 	return (clock_pid_type(timer->it_clock) == PIDTYPE_TGID) &&
>         	!(p->signal->flags & SIGNAL_GROUP_EXIT);
>> +}
>
> I don't understand why we would want to re-arm a timer after it has
> been decided the group is dying.
>
> Plush I really don't like the idea of p->signal->live spreading to more
> places.  In the future that has the potential to complicate any changes
> to the group_dead calculation.

Hmm.

Now that I think about it this could be:

static inline bool task_can_enqueue(struct k_itimer *timer, struct task_struct *p)
{
	/* Is the process exiting? */
	if (signal->flags & SIGNAL_GROUP_EXIT)
        	return false;

	/* Is the thread exiting? */
	if ((clock_pid_type(timer->it_clock) == PIDTYPE_PID) &&
	    (p->flags & PF_EXITING))
		return false;

	return true;
}

Unless I am missing something subtle with the parts of shutdown.  As
there is a difference between starting the shutdown, and having reached
do_exit.

But unless there is some subtle reason to start a timer after some
thread has called exit() or after a fatal signal has been received
I suspect stopping as soon as SIGNAL_GROUP_EXIT is set is a good idea.



>>  /*
>>   * Insert the timer on the appropriate list before any timers that
>>   * expire later.  This must be called with the sighand lock held.
>> @@ -684,7 +694,24 @@ static void arm_timer(struct k_itimer *t
>>  	struct cpu_timer *ctmr = &timer->it.cpu;
>>  	u64 newexp = cpu_timer_getexpires(ctmr);
>>  
>> +	lockdep_assert_held(&p->sighand->siglock);
>> +
>>  	timer->it_status = POSIX_TIMER_ARMED;
>> +
>> +	/*
>> +	 * Don't enqueue timers when the task or the group is exiting. That
>> +	 * ensures that timer operations are still succeeding as long as the
>> +	 * tasks are visible, but won't enqueue the timers on the task or
>> +	 * process. They won't expire anyway because run_posix_cpu_timers()
>> +	 * exits early when PF_EXITING is set.
>> +	 *
>> +	 * Enqueue is skipped if PF_EXITING is set when the timer is per task
>> +	 * and when the last thread decremented p::signal::live to zero also for
>> +	 * per process timers.
>> +	 */
>> +	if (unlikely(!task_can_enqueue(timer, p)))
>> +		return;
>> +
>>  	if (!cpu_timer_enqueue(&base->tqhead, ctmr))
>>  		return;
>>  

Eric
