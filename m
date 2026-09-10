Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F974718D6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076789; cv=none; b=pkgRfdwfSZItJ/ngq+SlWPR3peMVfeDLKwc7vuLS2PoCrL1Pra3BvT+WtG41IKqJ6Fm7P64/kHP3hRY/ntixsqcTdPIGyNLtnk6sG+RgUwGmAPHVoh5tS4fv7IzvTUKxhEl3vF7Qf9fqEKtwlp9jujPA9gt41bGNupWuolqbVOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076789; c=relaxed/simple;
	bh=sbD9hfXQ7OtAtqFT1zI48XAOHHjxUonCsM9Cq30ELco=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=b8Qc80HquAWGFNiVIF5z1xjyinOeJJfUl5ETGpQhE4QE4UATp2vjEiRah25VruUUyxP3S00A3EcM/mmZil8mtXygvmdDOFNJxnvT7fzM/tcnMetUOQJFhp7/26Wb1vsqpP0sc3WpLVfOLsBW9X/sr/pmCczs9peKVXh1ySAwKcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=l19MH/Zm; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="l19MH/Zm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1789074857;
	bh=sbD9hfXQ7OtAtqFT1zI48XAOHHjxUonCsM9Cq30ELco=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l19MH/ZmNoUeo5DlSs7WZ2uw1r6u+3trMDFySn/4Ve8iYO2/gFOXiq+ZlKM4XXQmz
	 YftWlfLpr2uDrzhyKnGTcQCZaL8iFpZQdI7JNG4SOe5lQu8AvTr5ldoG8tegF9ChWr
	 pXb9Ijg70+2r98AD0ejGbJHsHQ85UikDToOc7PcY=
Received: by gentwo.org (Postfix, from userid 1007)
	id 7DFCD406D5; Thu, 10 Sep 2026 14:14:17 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 7A6DB4014B;
	Thu, 10 Sep 2026 14:14:17 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:14:17 -0700 (PDT)
From: Shubhang <sh@gentwo.org>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
    vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
    bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
    kprateek.nayak@amd.com, shubhang@os.amperecomputing.com, cl@gentwo.org, 
    linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH] sched/fair: Restart hrtick after same-task repicks
In-Reply-To: <20260826040037.201697-1-zhanxusheng1024@gmail.com>
Message-ID: <6cc15e71-f6a1-496c-f3d5-3958369a8c00@gentwo.org>
References: <20260813-sched-fair-hrtick-restart-v1-1-4230d1e18fbb@gentwo.org> <20260826040037.201697-1-zhanxusheng1024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi Zhan,

Thanks for the review.

My original intent behind h_nr_runnable == h_nr_queued was to avoid
rearming an hrtick merely because delayed dequeued entities remain
queued. However, that condition also suppresses the rearm when there is
a real competing runnable entity plus an unrelated delayed entity. Which 
makes it be restrictive. I will change this to h_nr_runnable > 1 and add
a mixed workload test that exercises delayed dequeue.

Ack, I will also rework the rq flag. The reason I put the rearm on the
same task repick path was to retain the normal schedule side deferred
hrtick programming, rather than start a timer directly from the hrtick
callback. But the extra state does not appear necessary: the same task
path can check whether fair hrtick is enabled, inactive, and has another
runnable fair entity, then rearm directly.

Thanks,
Shubhang Kaushik

On Wed, 26 Aug 2026, Zhan Xusheng wrote:

> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
>
> On Thu, 13 Aug 2026 14:23:48 -0700, Shubhang Kaushik (Ampere) wrote:
>> +		rq->hrtick_rearm_fair = hrtick_enabled_fair(rq) &&
>> +				rq->cfs.h_nr_runnable > 1 &&
>> +				rq->cfs.h_nr_runnable == rq->cfs.h_nr_queued;
>
> The last term switches the fix off whenever anything on the rq sits in
> delayed dequeue.  set_delayed() decrements h_nr_runnable and leaves
> h_nr_queued alone (kernel/sched/fair.c:6398), clear_delayed() puts it
> back (6418), so the two differ exactly while a delay-dequeued entity is
> present.  With DELAY_DEQUEUE that is routine, and it says nothing about
> whether the running task still needs its slice bounded.
>
> Your test cannot show that either way: two CPU-bound tasks pinned to one
> CPU never sleep, so nothing is ever delay-dequeued there and the term is
> true for the whole run.  Adding a third task that sleeps in a loop should
> bring the missed hrtick back while the term is false.
>
> If the intent is only to skip rqs whose other queued entities are not
> competing for the CPU, h_nr_runnable > 1 already says that by itself.
>
>> +static inline void hrtick_rearm_fair(struct rq *rq, struct task_struct *p)
>> +{
>> +	if (rq->hrtick_rearm_fair)
>> +		__hrtick_rearm_fair(rq, p);
>> +}
>
> What does the rq field buy?  __hrtick_rearm_fair() already tests
> hrtick_enabled_fair(), hrtick_active() and the class, and a same-task
> repick that finds no hrtick armed wants one regardless of what triggered
> the repick.  If there is a same-task repick that must not arm one, the
> changelog is the place to name it.
>
> Last one is only a question.  entity_tick() -> update_curr() ->
> update_deadline() has already pushed se->deadline by a slice before
> task_tick_fair() reaches the queued branch, so hrtick_start_fair() would
> compute a valid delay if called right there, with no new field and no
> change to put_prev_set_next_task().  The difference I can see is that the
> tick callback runs with rq->hrtick_sched == 0, so hrtick_start() would
> program the hrtimer immediately from inside its own callback instead of
> leaving it to hrtick_schedule_exit().  Is that what moved you to the pick
> side?
>
> Thanks,
> Zhan Xusheng
>
