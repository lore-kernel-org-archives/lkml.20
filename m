Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D0246DFFA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189981; cv=none; b=tcNkgkyera/dvKaecVFrsZ2AfyzSTQIqAXEEPF6k7uvOQfXf9MPBanl+QGLOb2cbmxA8sLps3e54acv8nsinZxM3YeaDd0Q/XAVFv+vkUDB28EvdokLlBoaxDCC2BNZ0PKquuonq4GATq3jVlyThumjhyzinW66eNirSBKpwHTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189981; c=relaxed/simple;
	bh=cf1dANjouUun9fZVBXu/mp1lOxT94MHhsvTZMclo8no=;
	h=From:To:Cc:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Subject; b=N14/Zq6OGvSzyut9qs+8Mk4prsI0KmpceR5/Dy4uAiqDxr5HbuV2cbeTyHN0xRIHh0N7pGboLubXnDgNbIHTfx0M/1YwL3v/YHuo8OMQneenQgtxXdNhE6aLYZEgp1K7LQTc64+eqGwP2yvp2dHnVXI+zrgnfvmZ8JAJJrBXQb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b=YhQwwP2B; arc=none smtp.client-ip=166.70.13.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b="YhQwwP2B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cf1dANjouUun9fZVBXu/mp1lOxT94MHhsvTZMclo8no=; b=YhQwwP2BihS31qN2+5CaKaOZ/A
	yRKwP8DxB+AAW8ymmUVRtGfHZ2gmDr1b4nWtb2bX4nct9wR0SaBm8NpH6Tz9HvgXP/XaVzh7zF9Wj
	8woLv/217kUv9GqSFzcVgTiHUu0w3RvgQ0PViZbgiFeEnNDZmZPMdMBRmQtIx3e9T0O8=;
Received: from in01.mta.xmission.com ([166.70.13.51]:54168)
	by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1x13tq-002OeV-Nh; Mon, 31 Aug 2026 09:26:18 -0600
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:35846 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1x13to-00Apvl-IE; Mon, 31 Aug 2026 09:26:18 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>,  Frederic Weisbecker
 <frederic@kernel.org>,  Hyunwoo Kim <imv4bel@gmail.com>,
  brauner@kernel.org,  peterz@infradead.org,  anna-maria@linutronix.de,
  linux-kernel@vger.kernel.org
In-Reply-To: <87h5kad0mx.ffs@fw13> (Thomas Gleixner's message of "Mon, 31 Aug
	2026 12:50:46 +0200")
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
Date: Mon, 31 Aug 2026 10:26:11 -0500
Message-ID: <87bjaie2gc.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1x13to-00Apvl-IE;;;mid=<87bjaie2gc.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;sPfnum=0;;;sPf=pass
X-XM-AID: U2FsdGVkX1+woymFy1g9Z/xoSzTI3ze6/BUZ2T3I/n8=
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
	*  1.0 XM_B_SpammyTLD Contains uncommon/spammy TLD
X-Spam-DCC: XMission; sa05 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Thomas Gleixner <tglx@kernel.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 1598 ms - load_scoreonly_sql: 0.04 (0.0%),
	signal_user_changed: 9 (0.5%), b_tie_ro: 8 (0.5%), parse: 1.15 (0.1%),
	extract_message_metadata: 15 (1.0%), get_uri_detail_list: 3.9 (0.2%),
	tests_pri_-2000: 21 (1.3%), tests_pri_-1000: 2.1 (0.1%),
	tests_pri_-950: 0.98 (0.1%), tests_pri_-900: 0.74 (0.0%),
	tests_pri_-90: 110 (6.9%), check_bayes: 109 (6.8%), b_tokenize: 13
	(0.8%), b_tok_get_all: 14 (0.9%), b_comp_prob: 4.5 (0.3%),
	b_tok_touch_all: 72 (4.5%), b_finish: 0.93 (0.1%), tests_pri_0: 593
	(37.1%), check_dkim_signature: 0.88 (0.1%), check_dkim_adsp: 3.9
	(0.2%), poll_dns_idle: 830 (52.0%), tests_pri_10: 1.54 (0.1%),
	tests_pri_500: 840 (52.6%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] signal: Prevent exec() race
X-SA-Exim-Connect-IP: 166.70.13.51
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, anna-maria@linutronix.de, peterz@infradead.org, brauner@kernel.org, imv4bel@gmail.com, frederic@kernel.org, oleg@redhat.com, tglx@kernel.org
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out02.mta.xmission.com); SAEximRunCond expanded to false

Thomas Gleixner <tglx@kernel.org> writes:

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

This changes partially fixes another bug.  Recursive
UCOUNT_RLIMIT_SIGPENDING should be decremented when the process exits
and not when the process is reaped.


Others have noticed possible races flushing the siqueue not
holding siglock.

If I read the history correctly in flush_sigqueue with irqs
disabled can trigger the NMI lock-up detector.  So flush_sigqueue
was moved outside of siglock_irq.

Apparently it took KASAN to make kmem_cache_free slow enough
to trigger the lock-up detector.

The fix to avoid the lock-up detector was not comprehensive and
flush_sigqueue is still called in many places with irqs disabled.
So if necessary the code can probably just take siglock.


We can also avoid problems by updating the loops that go:
for_each_thread(p, q)
	flush_sigqueue_mask(p, &flush, &t->pending)

To include
	if (t->flags & PF_EXITING)
        	continue;

Or perhaps better tweak flush_sigqueue_mask to take t (and not p) and
perform the test of PF_EXITING there.  The only current uses I see of
the passed in task is to get a reference to signal_struct.


Eric

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
>  	/*
>  	 * If group stop has completed, deliver the notification.  This
>  	 * should always go to the real parent of the group leader.
