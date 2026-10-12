Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B42D421EFB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804834; cv=none; b=p4gh1O106WRbxWwNPiCarw7phQMxO4VEpdRrh2q5E210OWgbomv/37+1FdUdDJl5lAeeQYezJmtirN9S1q9qaNBTxLYoMLk5pILyI/2QNf1UdB3a2MR7uwiMKf+TBgxFOwMs3UzQj+Xs1JRIXUWm+6Qpvcu4QfIPAFLC0F+GBGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804834; c=relaxed/simple;
	bh=m46YEtcQ2Gvub5QoH7BEbtypvD4dKmdxLdho3XwBhyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGkRiaePQ2ehoq5re84ZKLC0IfYiBlcph3kzLHYfna8XmBULnwpmK+VlvkVuRSyASVzlYkUJEx1dCSHre2SUBhVLuXotK/E8keyX6mi5nAMJHVXmqMdyxFRqCy5wpkZH812iGeZk7j4yGv5qADCbQQ1dBduhRvtx3bvG97sU5Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SFHsRl42; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SFHsRl42"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=h/y/vCoFSRfl1eERAKmvnno8/YrXAB41SiJlcY04cUg=; b=SFHsRl42e8syiyEtO7QLAslrWZ
	VzBcepG1E929fJwtNvqJmB0KAM093/D1GDBKm333NbIfP4xJ64QKi7P5UxHsTzN7z2ezp+N9yaKQm
	ylS+9z4z3TWWe/BMPwaLQ4XSCuz86tkAJD77v+9hou7UvWbG0nDm0u+z23VWqLiZiuKzdfBm88IPD
	DstrIEioUuc1wRBBJ16i37vLkM35IJVAGguOB+5bxYboERLvuibgcCnGrFz9ZFjhLscZ+o/cmRok5
	JMT8oUg/CTFil3vaIFvHlTktaG1qunY6QYxSXWsFM3IJg9bXp6ykkWEwFM42OpTB5IqNkn3v46S1p
	BXPMbIxg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEHl-00000004bvX-2nEi;
	Mon, 12 Oct 2026 11:33:42 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C97EE30063F; Mon, 12 Oct 2026 13:33:40 +0200 (CEST)
Date: Mon, 12 Oct 2026 13:33:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Shubhang Kaushik <shubhang@os.amperecomputing.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] sched/fair: Preserve wake-affine CPU for non-SMT
 reciprocal sync wakeups
Message-ID: <20261012113340.GS4121339@noisy.programming.kicks-ass.net>
References: <20261008-b4-sched-sync-wakeup-v5-1-1af9fab48965@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-b4-sched-sync-wakeup-v5-1-1af9fab48965@gentwo.org>

On Thu, Oct 08, 2026 at 03:22:37PM -0700, Shubhang Kaushik (Ampere) wrote:

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 57360f5cdde4fa66f4cba2cbb53d4e322134504e..ce624fdc1f4480bc6e7ae710950fcaa93ab32a3e 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9167,6 +9167,26 @@ static inline bool asym_fits_cpu(unsigned long util,
>  	return true;
>  }
>  
> +/*
> + * For reciprocal WF_SYNC handoffs, prefer the waker CPU when it has no
> + * other runnable task.
> + */
> +static bool prefer_sync_pair_cpu(struct task_struct *p, int cpu)
> +{
> +	struct rq *rq = cpu_rq(cpu);
> +
> +	if ((rq->nr_running - cfs_h_nr_delayed(rq)) != 1)
> +		return false;
> +
> +	if (sched_asym_cpucap_active()) {
> +		sync_entity_load_avg(&p->se);
> +		if (!task_fits_cpu(p, cpu))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>  /*
>   * Try and locate an idle core/thread in the LLC cache domain.
>   */
> @@ -9955,6 +9975,12 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  			if (cpu != prev_cpu)
>  				new_cpu = wake_affine(tmp, p, cpu, prev_cpu, sync);
>  
> +			if (sync && !sched_smt_active() &&
> +			    new_cpu == cpu &&
> +			    p->last_wakee == current &&
> +			    prefer_sync_pair_cpu(p, cpu))
> +				return cpu;
> +
>  			sd = NULL; /* Prefer wake_affine over balance flags */
>  			break;
>  		}

Hurmph.. just looking at this patch makes me go WTF. I've not read this
lengthy Changelog you put on top, because none of that survives unless
one goes trawl through git.

So this code is confusing as heck. Nor is is evident why it wants to be
!SMT.

The way I read this:

 if the new_cpu is the current cpu (default case) AND
    p was last woken by us AND
    random
      stay here.

The function babbles something about a sync-pair, but then doesn't
actually do anything with a pair, or ensures there is a pair.

I'm supposing what you're getting at is the earlier:

 'p->last_wakee == current' combined with the fact that current is now
 waking p

But then I have to note that last_wakee isn't all that nice, since
record_wakee() isn't guarded by in_task() -- it really should be.

Try and convince me with readable code?
