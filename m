Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E084B481647
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523583; cv=none; b=cATFvU6/eOJLyg/SDIPD2NtVaWzBfrnm8wI3plYw03R4ks0X99xZlR7Z9fo6hDuW9zh3WGUjC8Lp74kbA0fuh5jIMiYGpzH9Jkh5EatdV6h6+kVfsC2d+Fm6TIwjjLclo8d4FBOdLDgu4+1lBPDykU01YGolYuyUQOdiiJ8HqVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523583; c=relaxed/simple;
	bh=/ORfFco1F4drQGsF5t31hcJjMb5ghwHYvUrVtq1Azco=;
	h=From:To:Cc:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Subject; b=M7VCaDfQIbc1fd4HYzmyiWpLyZCcf4ir6MzIdxswd02QWbq/ij8JOEXWhTxtCg3zj5LdNIA8q8EJ2HqGg48PxUbcE7TG8guVhMukH3kNp4CQ6lyOfD06HiQqeFmrZ2YfHIyzTBNH/e/BIz4ynuYxuxk3jZoDl55Uh/sHcmFl510=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b=kbOjni+G; arc=none smtp.client-ip=166.70.13.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b="kbOjni+G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/ORfFco1F4drQGsF5t31hcJjMb5ghwHYvUrVtq1Azco=; b=kbOjni+G6al/jFwRkYVacXj2P/
	iMyfA70DDC6uc5rzeaZjaAyztJcmhEWnB4LOp6c3zaar+2Um6Ns+cMTGMgYkJLYEVJEW4MtjEa3FR
	FUBJ3cwvgyFB9fHudNpIpZ+F5aU2rWWcABKZ289NGfqfmosgTNyL19q/Bf2id5YeZO4c=;
Received: from in02.mta.xmission.com ([166.70.13.52]:48372)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1x2SgQ-003zkT-NX; Fri, 04 Sep 2026 06:06:14 -0600
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:46620 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1x2SgP-0035SB-Kg; Fri, 04 Sep 2026 06:06:14 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,  Hyunwoo Kim <imv4bel@gmail.com>,
  Oleg Nesterov <oleg@redhat.com>,  Frederic Weisbecker
 <frederic@kernel.org>,  Christian Brauner <brauner@kernel.org>,  Peter
 Zijlstra <peterz@infradead.org>,  John Stultz <jstultz@google.com>,  Ingo
 Molnar <mingo@kernel.org>,  Alexander Viro <viro@zeniv.linux.org.uk>
In-Reply-To: <20260904112202.400768514@kernel.org> (Thomas Gleixner's message
	of "Fri, 04 Sep 2026 13:22:49 +0200")
References: <20260904112100.683893401@kernel.org>
	<20260904112202.400768514@kernel.org>
Date: Fri, 04 Sep 2026 07:06:08 -0500
Message-ID: <871pb9cjbj.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1x2SgP-0035SB-Kg;;;mid=<871pb9cjbj.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;sPfnum=0;;;sPf=pass
X-XM-AID: U2FsdGVkX18ook4WXEVJePT02q9ro+7v4QumrS6SgOY=
X-Spam-Level: *
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.1 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  0.7 XMSubLong Long Subject
	*  1.5 XMNoVowels Alpha-numberic number with no vowels
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.4 FVGT_m_MULTI_ODD Contains multiple odd letter combinations
	*  0.2 XM_B_SpammyWords One or more commonly used spammy words
	*  0.0 T_TooManySym_02 5+ unique symbols in subject
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;Thomas Gleixner <tglx@kernel.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 623 ms - load_scoreonly_sql: 0.05 (0.0%),
	signal_user_changed: 13 (2.0%), b_tie_ro: 11 (1.8%), parse: 0.97
	(0.2%), extract_message_metadata: 4.3 (0.7%), get_uri_detail_list: 2.0
	(0.3%), tests_pri_-2000: 3.5 (0.6%), tests_pri_-1000: 2.4 (0.4%),
	tests_pri_-950: 0.97 (0.2%), tests_pri_-900: 0.98 (0.2%),
	tests_pri_-90: 244 (39.2%), check_bayes: 242 (38.9%), b_tokenize: 9
	(1.4%), b_tok_get_all: 9 (1.4%), b_comp_prob: 2.8 (0.4%),
	b_tok_touch_all: 218 (34.9%), b_finish: 1.15 (0.2%), tests_pri_0: 333
	(53.4%), check_dkim_signature: 0.59 (0.1%), check_dkim_adsp: 3.2
	(0.5%), poll_dns_idle: 0.99 (0.2%), tests_pri_10: 2.4 (0.4%),
	tests_pri_500: 10 (1.5%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [patch 7/8] posix-cpu-timers: Prevent enqueueing when
 PF_EXITING is set
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: viro@zeniv.linux.org.uk, mingo@kernel.org, jstultz@google.com, peterz@infradead.org, brauner@kernel.org, frederic@kernel.org, oleg@redhat.com, imv4bel@gmail.com, linux-kernel@vger.kernel.org, tglx@kernel.org
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out03.mta.xmission.com); SAEximRunCond expanded to false

Thomas Gleixner <tglx@kernel.org> writes:

> To prepare for cleaning up POSIX CPU timers in do_exit(), prevent
> enqueueing POSIX CPU timers on a task which has PF_EXITING set.
>
> Queueing a timer on such a task is pointless because the task won't expire
> the timer anymore.
>
> Pretending that the timer is armed allows to keep the POSIX timer mechanism
> "working" so that the timer stays accessible up to the point where a task
> is unhashed.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>  kernel/time/posix-cpu-timers.c |   27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> --- a/kernel/time/posix-cpu-timers.c
> +++ b/kernel/time/posix-cpu-timers.c
> @@ -628,6 +628,7 @@ static int posix_cpu_timer_del(struct k_
>  	}
>  
>  	if (!ret) {
> +		WARN_ON_ONCE(cpu_timer_queued(&timer->it.cpu));
>  		put_pid(timer->it.cpu.pid);
>  		timer->it_status = POSIX_TIMER_DISARMED;
>  	}
> @@ -674,6 +675,15 @@ void posix_cpu_timers_exit_group(struct
>  	cleanup_timers(&tsk->signal->posix_cputimers);
>  }
>  
> +static inline bool task_can_enqueue(struct k_itimer *timer, struct task_struct *p)
> +{
> +	if (likely(!(p->flags & PF_EXITING)))
> +		return true;
> +
> +	/* Allow TGID type unless the last thread is on the way out. */
> +	return clock_pid_type(timer->it_clock) == PIDTYPE_TGID && atomic_read(&p->signal->live);

Couldn't this be?

	/* Allow TGID type unless the group is on the way out. */
	return (clock_pid_type(timer->it_clock) == PIDTYPE_TGID) &&
        	!(p->signal->flags & SIGNAL_GROUP_EXIT);
> +}

I don't understand why we would want to re-arm a timer after it has
been decided the group is dying.

Plush I really don't like the idea of p->signal->live spreading to more
places.  In the future that has the potential to complicate any changes
to the group_dead calculation.

>  /*
>   * Insert the timer on the appropriate list before any timers that
>   * expire later.  This must be called with the sighand lock held.
> @@ -684,7 +694,24 @@ static void arm_timer(struct k_itimer *t
>  	struct cpu_timer *ctmr = &timer->it.cpu;
>  	u64 newexp = cpu_timer_getexpires(ctmr);
>  
> +	lockdep_assert_held(&p->sighand->siglock);
> +
>  	timer->it_status = POSIX_TIMER_ARMED;
> +
> +	/*
> +	 * Don't enqueue timers when the task or the group is exiting. That
> +	 * ensures that timer operations are still succeeding as long as the
> +	 * tasks are visible, but won't enqueue the timers on the task or
> +	 * process. They won't expire anyway because run_posix_cpu_timers()
> +	 * exits early when PF_EXITING is set.
> +	 *
> +	 * Enqueue is skipped if PF_EXITING is set when the timer is per task
> +	 * and when the last thread decremented p::signal::live to zero also for
> +	 * per process timers.
> +	 */
> +	if (unlikely(!task_can_enqueue(timer, p)))
> +		return;
> +
>  	if (!cpu_timer_enqueue(&base->tqhead, ctmr))
>  		return;
>  
