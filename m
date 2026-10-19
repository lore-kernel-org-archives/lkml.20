Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431645;
	b=EukkH8Wh7+E9kqKyxnaLqajUxxMSgMbXLlaewbgq4uns8mw3AGicZHHKCjkH/faByGU5
	 zWvQW26IPLSy0eJgYn+Q0pAhcQc9kQA7TPZyD42GNpgXH6aTkcEuR2b95S6faBskhutfc
	 o4C8kUi8AlPWPERhtheEeOxeTNFpTSffp67lniRGJ16tr7WpmEgaQGzDlc/0CRiwoVJUM
	 8x1IEL6idWnItRGWbcfF6uiw2BDJ4WBKRnozvL6zhdgW9Kkt+IN544SgMySwSZD+cGYRH
	 9PA12deiQ8+7PPexLXvt7MnlWZZzLLSyOMIw0rXsIRWsgMXgip94QMnEYmXLKzHg5EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=v/jQlKFAyJ7SNrHZqzyWb+ytcJqElZtVWjRhCqgh3p4=;
	b=ruGlBnkJ3yTlY7/ZUrAyOBvDFYTHBtAvTGYeKJ4j2I6Rv0KLvFpjxIPD9set5olF9ipq
	 /7kxtyZvhYVFQeEIsKZEw03V0IyyKk/PQfUsqQWV1vN6VPS6eYH0a5zWFjWnkTRCrDEIz
	 jCdO8ATtuexj2RTVdpSjoBH+IPdk/Gt54LDutYz1gF3NAL4AHXT8gpUveB/57B5e/E0aJ
	 Tf8wlpfQT44S8YDyhPzTiZFZP93krNkNAwmK9JHnokdOE1HAz6MGPJzBvHQd0lJV68GyC
	 71Po9GdnzvEdDQMQs3kLVgTscR1gNX122kx2RmTCVj+pWFqW5jykYXUUqUxYnZt7cAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rwO+geMN;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B338F606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B338F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rwO+geMN
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018485638so1702925e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431643; x=1793036443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v/jQlKFAyJ7SNrHZqzyWb+ytcJqElZtVWjRhCqgh3p4=;
        b=rwO+geMN8P92g4uMjYww7zQs4KafmBZ6y5pnceGltnBYeDHTpb+xFKOSp1AVFNYq1M
         Qjo3VmaJQkkenKPMJSitDdJKzkItcxsJKpybpJdQBC+0Xz34++QZz/V6QUAtwqXQILV0
         dRiTiLcIGxjkUiKF477Y2HuwjDIW4oqr6GRiedK4v1bHCpnq4xK1wzjlCGGw2mZz8VA0
         T5njn9XdDlZj5WYOsAU+w+/S4FJ4O9OMXZvd0/ingqhp55IPamK499UovJcrtvHkzC5F
         6/W8lH/8YcGN6Nk9fWfwf9oYqD9jKk2o2TRoc3/0sDm78eOLRi5Y8BbMal7avIC8k2Y/
         e43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431643; x=1793036443;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/jQlKFAyJ7SNrHZqzyWb+ytcJqElZtVWjRhCqgh3p4=;
        b=Kkmij4RByNEV9/t/b4UhlzFbzEzbtaYd9/LMQ8VIb2HruK794KPJhrNFcy06SCzwO3
         u8gkEn/oTGpY++oMzql2HJ/KR0pxg3Kounys2Vcq4nZxmP1sdQ44FfqoyYzAhMctaRsj
         sozAZlFmp0P85Qa/zrf2Pog2V3/CZY118Ljk+B5m4W08+hZta1ac9tYODokUuuRJDz03
         98u3LUfCXeFUcrWvr9A9NFtsnDI3EBQGxAQLAijI20XRR1SDmlUwvXDXb6xJH+s21y/1
         H2x6EgNYrpgsEvCGHYYUJhcR5Ybex8fNih7QyYUVExwwDvSL1yCPosCN0QmO53HeB3BO
         g5fg==
X-Forwarded-Encrypted: i=1; AKwUvByPsMKHmvrko9WUNbB0CsMvR20BGsPDfEqgBRU/SplzJAlOCnBsuqzFEL+UD5tTmHLkG/2rIqwN5mklDIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJD1Bufj8fKhMRZ0wDrZXXNqya55nOXX/S7joTxK737mhqmil2C
	k8FXse20qCl7kZGlYKVXb3PEDwg9M/U7NIoknng0RI0PN2Unwwy3Ib5m
X-Gm-Gg: AYBFou1YjmbZk2EmXj4fFwnvoQ3vyjgPVoDSsjh1z9duCRdaOrhJtaivsikveHslXCi
	/SgcYO1lKz1Tc2/nFW9cgpK8M4zHEaCC4+alJPqZrO7l2Kiihe7x/va6h5dlBmSPpJg7djVXuw/
	dlPkbF2EJUgxeufbjHWuFqZCzlJTSQ7wup0qzBSK1ueoiu+AScbN5Te/8LJ9uVbHkb9e16UsJzu
	bC5cXJWkopZqwpwV9c1B2RPy/bMi+JDbiYYYEn2LrFOhGSqifBar7dv+FcI/U5EeOmXgLZpsBYB
	yKXzgJzCrDn4I4YXACWAOPSRho+B1IwEjnnMsXoddaZgRug1E+1PZMhQb24dngnMIAnT8ctURw7
	W63hMov3R6LIcOM6/4lPKdHb1qJVZzcrPGey4h6bRbP/GFxNjJ5hlzifzDXFfQjvGq6tK7huFpI
	DrVEB4nzpLzMqZBfOSgpFHTiXRGuODXX/Exgu/o1hn28BjXDFypqum546+lePJenvxjP4tkaWTZ
	HeywthHeEqZGjTSGgOY+B5hdA==
X-Received: by 2002:a05:600c:4e11:b0:4a0:13d8:cd0c with SMTP id 5b1f17b1804b1-4a1d75e6f90mr171746505e9.2.1792431642805;
        Mon, 19 Oct 2026 10:40:42 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cce2fbsm6991445e9.10.2026.10.19.10.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:40:42 -0700 (PDT)
Date: Mon, 19 Oct 2026 20:40:39 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Shubhang Kaushik <shubhang@os.amperecomputing.com>, "Christoph Lameter (Ampere)" <cl@gentwo.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/rt,dl: Remove unreachable migration-disabled
 push checks
Message-ID: <atZR51V-xwaRL6OL@scheduler.schedules>
References: <20261014-sched-rt-dead-md-push-v2-1-9f57f1a530dc@gentwo.org>
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
In-Reply-To: <20261014-sched-rt-dead-md-push-v2-1-9f57f1a530dc@gentwo.org>

Hi Shubhang :-),

On Wed, Oct 14, 2026 at 03:32:10PM -0700, Shubhang Kaushik (Ampere) wrote:
> push_rt_task() and push_dl_task() select their candidates with
> pick_next_pushable_task() and pick_next_pushable_dl_task(),
> respectively. Both helpers skip migration-disabled tasks.
> 
> The source rq lock is held after candidate selection. The selected task
> is queued, not executing, and cannot enter a migration-disabled region
> while that lock is held.
> 
> find_lock_lowest_rq() and find_lock_later_rq() can drop the source rq
> lock. If that happens, they recheck is_migration_disabled() after
> reacquiring the locks and reject a task that changed state. Their
> callers then either exit or retry with a task selected by the same
> helper, which again excludes migration-disabled tasks.
> 
> The migration-disabled fallback in push_rt_task() and the corresponding
> check in push_dl_task() are therefore unreachable. Remove them. The RT
> fallback is the only user of the @pull argument, so remove that
> argument too.
> 
> This does not change the migration-disabled handling in pull_rt_task()
> or pull_dl_task(), which use different candidate selectors and retain
> their existing donor-push recovery.
> 
> Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
> ---
> Tested on 80-core SMP, non-SMT Ampere Altra system:
> 
>   - Built and booted with CONFIG_IRQ_WORK=y.
>   - Ran repeated SCHED_FIFO affinity changes among CPUs 78 and 79 with
>     RT_PUSH_IPI enabled and disabled; both runs completed and cleaned
>     up all worker tasks.
>   - With RT_PUSH_IPI enabled, function tracing confirmed repeated
>     execution of rto_push_irq_work_func() via irq_work_single().
> 
> Changes in v2:
>   - Also remove the unreachable migration-disabled check in push_dl_task().
>   - Clarify that both push paths exclude migration-disabled tasks.
> 
> Link to v1: https://lore.kernel.org/r/20261014-sched-rt-dead-md-push-v1-1-5f9757be3c80@gentwo.org
> ---
>  kernel/sched/deadline.c |  3 ---
>  kernel/sched/rt.c       | 48 +++---------------------------------------------
>  2 files changed, 3 insertions(+), 48 deletions(-)
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index 0663c00c41c04213fda2ebaf16a0bdf34e0849a8..e9d952853f14aaf48cdca6f89135090adee5f6ba 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -3158,9 +3158,6 @@ static int push_dl_task(struct rq *rq)
>  		return 0;
>  	}
>  
> -	if (is_migration_disabled(next_task))
> -		return 0;
> -
>  	if (WARN_ON(next_task == rq->curr))
>  		return 0;

I sadly started writing from the diff below. But again,
pick_next_pushable_dl_task() already can't return a task with
is_migration_disabled() true.

>  
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index 85303add726df4c2da846c427aab2d627fca9589..f85edc6f896c72d2251b5eb59ee7ffd0e23934f5 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -1957,7 +1957,7 @@ static struct rq *find_lock_lowest_rq(struct task_struct *task, struct rq *rq)
>   * running task can migrate over to a CPU that is running a task
>   * of lesser priority.
>   */
> -static int push_rt_task(struct rq *rq, bool pull)
> +static int push_rt_task(struct rq *rq)
>  {
>  	struct task_struct *next_task;
>  	struct rq *lowest_rq;
> @@ -1981,48 +1981,6 @@ static int push_rt_task(struct rq *rq, bool pull)
>  		return 0;
>  	}
>  
> -	if (is_migration_disabled(next_task)) {
> -		struct task_struct *push_task = NULL;
> -		int cpu;

Yeah well. This is never true since pick_next_pushable_task() does not
returns a task with is_migration_disabled() true AFAICT tho.

> -
> -		if (!pull || rq->push_busy)
> -			return 0;
> -
> -		/*
> -		 * Invoking find_lowest_rq() on anything but an RT task doesn't
> -		 * make sense. Per the above priority check, curr has to
> -		 * be of higher priority than next_task, so no need to
> -		 * reschedule when bailing out.
> -		 *
> -		 * Note that the stoppers are masqueraded as SCHED_FIFO
> -		 * (cf. sched_set_stop_task()), so we can't rely on rt_task().
> -		 */
> -		if (rq->donor->sched_class != &rt_sched_class)
> -			return 0;
> -
> -		cpu = find_lowest_rq(rq->curr);
> -		if (cpu == -1 || cpu == rq->cpu)
> -			return 0;
> -
> -		/*
> -		 * Given we found a CPU with lower priority than @next_task,
> -		 * therefore it should be running. However we cannot migrate it
> -		 * to this other CPU, instead attempt to push the current
> -		 * running task on this CPU away.
> -		 */
> -		push_task = get_push_task(rq);
> -		if (push_task) {
> -			preempt_disable();
> -			raw_spin_rq_unlock(rq);
> -			stop_one_cpu_nowait(rq->cpu, push_cpu_stop,
> -					    push_task, &rq->push_work);
> -			preempt_enable();
> -			raw_spin_rq_lock(rq);
> -		}
> -
> -		return 0;
> -	}
> -
>  	if (WARN_ON(next_task == rq->curr))
>  		return 0;
>  
> @@ -2078,7 +2036,7 @@ static int push_rt_task(struct rq *rq, bool pull)
>  static void push_rt_tasks(struct rq *rq)
>  {
>  	/* push_rt_task will return true if it moved an RT */
> -	while (push_rt_task(rq, false))
> +	while (push_rt_task(rq))
>  		;
>  }
>  
> @@ -2236,7 +2194,7 @@ void rto_push_irq_work_func(struct irq_work *work)
>  	 */
>  	if (has_pushable_tasks(rq)) {
>  		raw_spin_rq_lock(rq);
> -		while (push_rt_task(rq, true))
> +		while (push_rt_task(rq))
>  			;
>  		raw_spin_rq_unlock(rq);
>  	}
> 
> ---
> base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053

Someone who writes their base :-)

> change-id: 20261014-sched-rt-dead-md-push-c88b47c3e2f0
> 
> Best regards,
> -- 
> Shubhang Kaushik (Ampere) <sh@gentwo.org>
>

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>

