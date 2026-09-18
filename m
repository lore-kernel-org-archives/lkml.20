Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD94D4B44CC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728249; cv=none; b=FdRvIwq2UdN4ajdMtgUyXFVU/NZMDAYPjqMw+8hyNCJzInpa8qVAvIwm0w4mqNsoguJgmbSdasL9lLduFLFATQoSIoESyUGnUnj8383Be86GURNQZygJpMv2HGsexHJGOGcS9siL81vFbzgoxVO5tiZ4+zCk91UtDS803rpqH5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728249; c=relaxed/simple;
	bh=25KoN45DFO+5TO3s3t48+URwbBPvv7hMTJZwBaafVvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDeG+vv0S+mDsw9Zd3wDpqZcXXidNT5LTBEAawHpTFBepSIBcVW/idTMwO6cTnXy5mN6Jkskgk1H/JQdI+Mtkstin2ewyLaN++LxB6Wghqq75nUBRZ6t7Ibbwx4/AxVXComxnxsecGogEe7oy10WYnvhJqR3fJmP7b02aKzdRzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dAo1nz81; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dAo1nz81"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=30G0DuF4TUWn1IDJFhjGeypVIwcR3gbMKVFWKjxu2e0=; b=dAo1nz81ooGUcmmsF9HuEj0dta
	pMpFLqeqOuhCRi8+heqvw1VZr2EnGI6R+Q/dFjshTl+Wj7ZQ62TPZiJJqmyoQZRfKk9RCfsSYyuSy
	5Sn+SI/vgKjqDVVmWAhM+yPsgm4gcWfXV9aqVbFaGfQND4jOryV37vi+Ryks2eJ0QRsq1lj84GBSN
	jDKX5tpnPjUqmljBXu07LHxwHkG0vwsCMBnDSXnPgjLmVewezkX3bMTbbAt9NrDDTnPerVDud8cvS
	lck0RYBJjL4uQELnzFbSUJuffSkJkAeBBUQv465VNQNOMiUM/INFZY4zw8v2/XEMvbhwHjhts13LS
	jr76IpYQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7W4L-0000000GyrP-3ijx;
	Fri, 18 Sep 2026 10:43:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 17D27300328; Fri, 18 Sep 2026 12:43:49 +0200 (CEST)
Date: Fri, 18 Sep 2026 12:43:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/mmcid: Bound the CID allocation busy wait
Message-ID: <20260918104349.GL776954@noisy.programming.kicks-ass.net>
References: <20260918013454.1850369-1-xujiakai24@mails.ucas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918013454.1850369-1-xujiakai24@mails.ucas.ac.cn>

On Fri, Sep 18, 2026 at 01:34:54AM +0000, Jiakai Xu wrote:
> mm_get_cid() spins forever when no CID is available. All callers hold
> either a runqueue lock or mm::mm_cid::lock with interrupts disabled,
> so the loop relies on another CPU releasing a CID within a short
> window.
> 
> That assumption fails in two ways:
> 
>  1) In steady state per task mode CIDs are owned by their tasks for
>     their whole lifetime and are only released on task exit or
>     execve(). When the CID bitmap is exhausted, the spinning task
>     blocks everything on its CPU with interrupts disabled, which
>     escalates to RCU stalls and can lock up the machine when e.g. a
>     text_poke IPI targets the spinning CPU.
> 
>  2) During a mode transition the fixup thread has to acquire the
>     runqueue lock of the spinning task's CPU to release per CPU owned
>     CIDs. That lock is held by the spinning task, so neither context
>     can make progress - a livelock.
> 
> Bound the retry loop and return MM_CID_UNSET on exhaustion. All call
> sites cope with that:
> 
>  - The schedule in paths (mm_cid_from_task()/mm_cid_from_cpu()) set
>    both the per CPU and the task storage to MM_CID_UNSET and retry on
>    the next schedule in. The plain per CPU value left behind by
>    mm_drop_cid_on_cpu() has no owner in the bitmap anymore, so the
>    task must not adopt it as its own CID. A task running with an
>    unset CID is an already established state for lazily assigned
>    tasks (see mm_cid_fixup_cpus_to_tasks()).
> 
>  - sched_mm_cid_fork() stores the unset CID in the task and the per
>    CPU storage, which the schedule in path handles the same way.
> 
> This also prevents an exhausted allocation from feeding MM_CID_UNSET
> into the transition bit handling, which would later hand MM_CID_UNSET
> as bit number to clear_bit().

This all sounds horribly wrong. It fails to explain why the transition
isn't happening, nor does it explain how it doesn't utterly
violate/break user space.

> Fixes: 9a723ed7facff ("sched/mmcid: Provide new scheduler CID mechanism")
> Signed-off-by: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
> ---
>  kernel/sched/sched.h | 51 ++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 45 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index e656c7059bf86..6de25f546e3a6 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -3964,11 +3964,27 @@ static inline unsigned int __mm_get_cid(struct mm_struct *mm, unsigned int max_c
>  	return cid;
>  }
>  
> +/*
> + * The retry loop covers the transient contention window where a CID is
> + * concurrently released. It must be bound because all callers hold a
> + * runqueue lock or mm::mm_cid::lock with interrupts disabled. An
> + * unbounded wait livelocks with the context which is expected to
> + * release a CID: in steady state per task mode CIDs are owned by their
> + * tasks until exit and during a mode transition the fixup thread needs
> + * the runqueue lock which the spinning task holds.
> + *
> + * On exhaustion MM_CID_UNSET is returned, which all callers handle by
> + * letting the task run without a CID. It retries on the next schedule
> + * in or fork.
> + */
> +#define MM_CID_GET_RETRIES	32
> +
>  static inline unsigned int mm_get_cid(struct mm_struct *mm)
>  {
>  	unsigned int cid = __mm_get_cid(mm, READ_ONCE(mm->mm_cid.max_cids));
> +	unsigned int tries = MM_CID_GET_RETRIES;
>  
> -	while (cid == MM_CID_UNSET) {
> +	while (cid == MM_CID_UNSET && tries--) {
>  		cpu_relax();
>  		cid = __mm_get_cid(mm, num_possible_cpus());
>  	}
> @@ -4030,9 +4046,22 @@ static __always_inline void mm_cid_from_cpu(struct task_struct *t, unsigned int
>  			else
>  				cpu_cid = cid_to_cpu_cid(tcid);
>  		}
> -		/* Still nothing, allocate a new one */
> -		if (!cid_on_cpu(cpu_cid))
> -			cpu_cid = cid_to_cpu_cid(mm_get_cid(mm));
> +		/* Still nothing, allocate a new one. On pool exhaustion
> +		 * set both storages to MM_CID_UNSET: the plain per CPU
> +		 * value left by mm_drop_cid_on_cpu() no longer has an
> +		 * owner in the bitmap and must not be adopted by the
> +		 * task. It will be retried on the next schedule in.
> +		 */

This comment style is broken and inconsistent with your earlier comment.

> +		if (!cid_on_cpu(cpu_cid)) {
> +			unsigned int ncid = mm_get_cid(mm);
> +
> +			if (ncid == MM_CID_UNSET) {
> +				mm_cid_update_pcpu_cid(mm, MM_CID_UNSET);
> +				mm_cid_update_task_cid(t, MM_CID_UNSET);
> +				return;
> +			}
> +			cpu_cid = cid_to_cpu_cid(ncid);
> +		}
>  
>  		/* Handle the transition mode flag if required */
>  		if (mode & MM_CID_TRANSIT)
> @@ -4065,9 +4094,19 @@ static __always_inline void mm_cid_from_task(struct task_struct *t, unsigned int
>  			else
>  				tcid = cpu_cid_to_cid(cpu_cid);
>  		}
> -		/* Still nothing, allocate a new one */
> -		if (!cid_on_task(tcid))
> +		/* Still nothing, allocate a new one. On pool exhaustion
> +		 * keep the CID unset. It will be retried on the next
> +		 * schedule in.
> +		 */

Again, broken comment style.

> +		if (!cid_on_task(tcid)) {
>  			tcid = mm_get_cid(mm);
> +
> +			if (tcid == MM_CID_UNSET) {
> +				mm_cid_update_pcpu_cid(mm, tcid);
> +				mm_cid_update_task_cid(t, tcid);
> +				return;
> +			}
> +		}
>  		/* Set the transition mode flag if required */
>  		tcid |= mode & MM_CID_TRANSIT;
>  	}
