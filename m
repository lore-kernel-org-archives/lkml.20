Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793083960;
	b=VlEjKUjZFVT9US4V/jx5lOBxfhXNj1quI5CszwP+oki47m4XGHUOdJpogty9QWKKWXve
	 Kjl5PJUT5FCv+rj4InSLJe069fSLJhXm+2mAdVmZ+jUyjzDl/6GCilUQoROPr2Rykuu4N
	 rATYJjvOyoJfWptJkbHudpEOVtGdXwFVVJz4Tk0bT5GhmwbLeYrUpulO1qFokK/qPPE97
	 ResWbJ8Isq71d2RWKTt4YjdhZcUEk5twS9UU66x+GEfCM900GgPCQWB8kivKZI+x0zm7h
	 wPEJftjLzWcZ9neMSTZLi8d6yG5B3ZORqQx7ph5i7t1QEu+fGpUefTee41MNaEgdxJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793083960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zBTr+aLfoHutgtRMLFhVSfnloOb2GCy4j9NdEp3TABY=;
	b=466mWEVbJCHYsNwmtWCN5UBE17VebLkGbvxvQk6TqM5MHsjPaN9y+tEmUJN/h3CpCn4s
	 Gf2qnoxQ1QajM0i27+wXZFX9bdP4LZa/r+haib/AUZ7XSNlmWmFhd5ukB7j/C3AefR2SE
	 4NR/f3JJJ4p5caUQp1eymzgfsZ6iTGmbMh3stdYmV9hlJhOTK0KEIgyxEFnMp2RN5QLBy
	 u97czMGoxEjk9WOgbUugLOxxW+6MX9XuJ2ISdD17DnpDMkQF3dS9Gbcj3S2wLOd8N3X0F
	 kt0W/Tw/ElI2k9xK1dLwioVG4omYw09QczHRyaqQAlEQZiariyqbzlsPnK/+RPk9Ndg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p3ncFKIj;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45690606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45690606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p3ncFKIj
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso5290195e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793083958; x=1793688758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zBTr+aLfoHutgtRMLFhVSfnloOb2GCy4j9NdEp3TABY=;
        b=p3ncFKIjxLhsdDygTGtYUoWUmAaNODQO3kiwcGcBYCCOdn1XpK8mkIdK/LTWVcapvm
         Jxtk3Rm4mbYTo6JJqyK6x7bQr15OSFAB0AbT2rRlZreAAwHhvGNiWbkj4mqo4pSVvd1P
         LmsdDbENLiZDPR7OlsHOppbeeXXfvo9YT9y/UamTZ9iWL+t7jBBbPOSYSyFsm0aFwuHI
         +vFhnebeYiFT9qyqH0K7AAkwdZaLENAxOrWHxiPmofgEl10vOxcWGg81ehSVOfB4bJ19
         6dR9G8WIG/P1RiSiFC3UxspUb1DVpUoeqZboGOX6Fodrb2bfXM+ZhOWSiZtMHPr7bu2/
         Hg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793083958; x=1793688758;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zBTr+aLfoHutgtRMLFhVSfnloOb2GCy4j9NdEp3TABY=;
        b=Z4dJUUSUhlf3uk37sB87AtpMpRuxYxFfxgbb86hKWfJsDh6S5jrv1Bh5IDGgfnHpvZ
         YPW7mCZwbPG8IFZ/U4q3452XjKuBrxdHRFd3rc156IzflKiT2gKUWH6tyzdzbZYz0lqe
         7NTPwxH6LJmL1Ndx8IwNg3LUTtvhmaUCWgG9y/tsaTPLSYg3cDNm6JVDBAMCNKGKFmTw
         Wd+paHz8av39ZX0iQBMzlGqGjNNgI7j4vK+xjBRKJgMwnBuOEfugH+pfWzwDDIRRA1E6
         4jOzP9b9OYXTdZs1nRfrU/N42yHLFXi8QIJ1y8HaSbByuluuTErDm1GcMlGsnISod5Z0
         DHgw==
X-Forwarded-Encrypted: i=1; AKwUvBxTp7u5nkK/2zlZid/Bc+RRkW0wix/paTdtEmQfkA7+KCwniQ6FCDkzCUPrujNg57/oSkgnjUzH99xcblk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJD0pctshM6kTEnVqmu1UdBIEG5vjzW5W4nh5Yasqq3wa9TvRpI
	PhM7evfVeZKEKUXXhBqDRTrgT/mWfKmbIcPvfh913YVge/QXmFVzNp3k
X-Gm-Gg: AYBFou396jea2/1hAMZDpfRiiMFaqnIYilFWz3y8tYC+YTXW08rK1ejshwYu+cS0lIi
	o2whbLyE4984fHFQg4CthfCjYLZ+OGU4waxBXMwH1k58Id9R2EHqP19XqW8hPeefTFo9Qc/7+eJ
	eJJXMhwItfvwnRkDkEqZeKtjfnK+uRM+7FBIUuC6W6ACkSq/0YKFxnBR0ca4u2i24CDpJ6LF2ie
	q3KCLzCCExc7rj+D4bKW8ZSnT0TnAQz2qxd9jOXvyDLVyN9xbcow0udMp8FJd6gTyCiUCMkD3VZ
	WaAIPtcqGh+hnMq6ANUM8DHVjrFlc76xZ0L4HAX5uP4Iw4BAJMcxjQrOgGiEG8Dvr/ivdgWKmLa
	j9jYnUZ9nb3GJB0MtNFTwvOzAqx2OL7cq5nh2ryAiD8SYcRkgRp7IJSFGj/MtW9wLe+nNKbv0gB
	UVqX982onRXpQgE3FEo7Ld8W4qIWj2pLVNXdgsBGYOmYz06g+SETdHrZpNHowbyBt0VL8An3d9/
	ciHndntI/9DP2t59IyCy/9MiqTz4zQmm5BKrRcgi2vfPTNhxVTO4YUP50LLl29ijkPWp8KNQZrX
	f6F3sPg=
X-Received: by 2002:a05:600c:8b88:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4a35ac6a906mr154315185e9.1.1793083958464;
        Mon, 26 Oct 2026 23:52:38 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm116147835e9.3.2026.10.26.23.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:52:37 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:52:33 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: albin_yang@163.com, albinwyang@tencent.com, bsegall@google.com, 
	chen.yu@linux.dev, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com, peterz@infradead.org, 
	rostedt@goodmis.org, vincent.guittot@linaro.org, vschneid@redhat.com
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for proxy-migrated
 blocked donors
Message-ID: <auBEeDRRFKZOGlZA@scheduler.schedules>
References: <72a6eb77-0461-477b-a0e9-c06a486e3e0e@amd.com>
 <20261026133831.4111227-1-albin_yang@163.com>
 <36f12b2f-9fc8-46e9-8312-536c918722f1@amd.com>
 <auA7AQ_S9iwPHr4d@scheduler.schedules>
 <4ac4564e-08fb-4639-a89e-a2ad54cee3f7@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4ac4564e-08fb-4639-a89e-a2ad54cee3f7@amd.com>

On Tue, Oct 27, 2026 at 11:54:35AM +0530, K Prateek Nayak wrote:
> Hello Kayra,
> 
> On 10/27/2026 11:41 AM, Kayra Cizmeci wrote:
> >> So all things considered, I think the following should work unless I'm
> >> terribly mistaken yet again :-) I've left my reasoning as comments:
> >>
> >> diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
> >> index ebe0a7765f98..c4c624deb25b 100644
> >> --- a/kernel/sched/stats.h
> >> +++ b/kernel/sched/stats.h
> >> @@ -239,6 +239,15 @@ static inline void psi_account_irqtime(struct rq *rq, struct task_struct *curr,
> >>  static inline void sched_info_dequeue(struct rq *rq, struct task_struct *t)
> >>  {
> >>  	unsigned long long delta = 0;
> >> +	/*
> >> +	 * If a task is blocked (blocked donor, delayed dequeue task),
> >> +	 * do not account the queued time as runnable. A task that is
> >> +	 * blocking would have already cleared the "last_queued"
> >> +	 * indicator from sched_info_arrive() when it got a chance to
> >> +	 * run on the CPU.
> >> +	 */
> >> +	if (t->is_blocked)
> >> +		t->sched_info.last_queued = 0;
> >>  
> >>  	if (!t->sched_info.last_queued)
> >>  		return;
> >> @@ -290,7 +299,23 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
> >>   */
> >>  static inline void sched_info_enqueue(struct rq *rq, struct task_struct *t)
> >>  {
> >> -	if (!t->sched_info.last_queued)
> >> +	/*
> >> +	 * "t->is_blocked" is only cleared after the enqueue is done and
> >> +	 * the task is woken up. If the task is blocked, update the
> >> +	 * "last_queued" timestamp to that of last enqueue - if the task
> >> +	 * is still blocked while it leaves the runqueue, this timestamp
> >> +	 * is ignored and is cleared at sched_info_dequeue().
> >> +	 *
> >> +	 * To transition a task back to blocked after wakeup, it has to
> >> +	 * run on the CPU and naturally reach a safe preemption point.
> >> +	 * sched_info_arrive() will do the correct wait time accounting
> >> +	 * based on the last "last_queued".
> >> +	 *
> >> +	 * Any movement of task after being marked not blocked will be
> >> +	 * correctly captured as queued time at enqueue + dequeue
> >> +	 * boundaries when "t->is_blocked" cleared.
> >> +	 */
> >> +	if (!t->sched_info.last_queued || t->is_blocked)
> >>  		t->sched_info.last_queued = rq_clock(rq);
> >>  }
> >>  
> >> ---
> >>
> >> That "t->is_blocked" check in sched_info_enqueue() may not be
> >> necessary either but I've left it in there for now since I did my
> >> quick testing with it.
> > 
> > 
> > Hi Prateek,
> > 
> > IMO too doing this with is_blocked would be cleaner.
> > 
> > But I think this not works on a case where a donor is in a different CPU
> > from its owner, like:
> > 
> > A holds the mutex M in CPU0, B is the waiter and its on CPU1.
> > 
> > proxy_migrate_task() gets B to CPU0.
> >> After that, A suddenly wants to goto CPU1. And it goes.
> > Now B goes back to its home CPU next to A.
> > 
> > Now in here, timer starts.
> > 
> > And suddenly A drops the mutex. Now B is not is_blocked.
> > 
> > Because B is back to its home CPU, there is no dequeue.
> > Even if there was B is not is_blocked so timer wouldn't be reset.
> > 
> > Normally we need to add the time that task waited for itself.
> > But in this case we add the time task waited for its mutex + for itself.
> > 
> > Or am I missssssing something?
> 
> Indeed. That is possible and can probably be fixed by doing a
> sched_info_enqueue() in proxy_needs_return() for
> task_cpu(p) == p->wake_cpu case like:
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 04b62c16fa8c..3d261a4e5b0b 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3838,8 +3838,11 @@ static inline bool proxy_needs_return(struct rq *rq, struct task_struct *p)
>  	 * will not apply. But if it did, this check is the safe way around
>  	 * and would migrate.
>  	 */
> -	if (task_cpu(p) == p->wake_cpu)
> +	if (task_cpu(p) == p->wake_cpu) {
> +		/* Begin wait time accounting before marking !is_blocked. */
> +		sched_info_enqueue(rq, p);
>  		return false;
> +	}
>  
>  	scoped_guard(raw_spinlock, &p->blocked_lock) {
>  		/* Task is waking up; clear any blocked_on relationship */
> ---
> 
> Not sure if this solution is ugly or not for calling
> sched_info_enqueue() out of the enqueue path :-)

I think this fixes the issue. BTW I think this should skip curr, no?
On a case like this:

C holds M1 in CPU0, D waits that mutex in CPU1. A holds mutex M2 in
CPU2. B is the working task on CPU1 but it wants mutex M2 and we enter
__schedule(). B gets is_blocked. D gets chosen. We open the rq lock to
get D to CPU0. While this happens A drops the mutex and wakes up B.
we enter ttwu_runnable() and B is still curr. And we start the timer.

Or am I MISSSING something?




> 
> -- 
> Thanks and Regards,
> Prateek
> 

Thanks,

Kayra
