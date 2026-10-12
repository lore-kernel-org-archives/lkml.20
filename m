Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132683B47C9
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831236; cv=none; b=mF1QN8E0Vo6LRbvw2wH/PSfjn2M2SGQhJm8K3UPKexyNuhH7vTyRQisQx3pBv60wQZgTYdCECXP/w34OMq49vrnCskptI+4wEptD3cc/SUcPlfrLPdzKe84YC4STireh1w6ukmipsAvCTTSw5My1aSJ6nwYelDN4qa3BFsQ/dfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831236; c=relaxed/simple;
	bh=H29dGlgnv0fmHWhXTMTbL9D1uRoXiHQqrNQF3Cjsylk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Vw+71ISDMwmTLVrAXA/RXLiDrz3vo+IuToqxSmfrana0+c2iPKTYiMmE8p3Ta1jmDtSar8qqkT/ztYKxokwo7dm5wAjYRMbQk07jePAz92IUhKtycnbn8vf6PXq+nwH+C4JsMYuDUs4Uq3rufRsbgkRM3WNZTrtSmxlMoHrlFus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=q2wOUtOq; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="q2wOUtOq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1791831227;
	bh=H29dGlgnv0fmHWhXTMTbL9D1uRoXiHQqrNQF3Cjsylk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=q2wOUtOqhkpZBGAJN+jbrQ7NnN5FjsjwPz23uDMog4JVwf5v2EyNzzyLTjijoEwVn
	 NMLizURDOLsCh2ldmoXy1voT9CbthvSQNZ1WrMBwZMff4VXZWKViOu0wrdHYOQUz94
	 +f4Va3AIOGT4gJvPjw/vZduU6mFumlY61G5w/2G8=
Received: by gentwo.org (Postfix, from userid 1007)
	id 7B3764029C; Mon, 12 Oct 2026 11:53:47 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 78DF2401B0;
	Mon, 12 Oct 2026 11:53:47 -0700 (PDT)
Date: Mon, 12 Oct 2026 11:53:47 -0700 (PDT)
From: Shubhang <sh@gentwo.org>
To: Peter Zijlstra <peterz@infradead.org>
cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
    Vincent Guittot <vincent.guittot@linaro.org>, 
    Dietmar Eggemann <dietmar.eggemann@arm.com>, 
    Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
    Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
    K Prateek Nayak <kprateek.nayak@amd.com>, 
    Christian Loehle <christian.loehle@arm.com>, 
    Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
    Shrikanth Hegde <sshegde@linux.ibm.com>, 
    "Christoph Lameter (Ampere)" <cl@gentwo.org>, 
    Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] sched/fair: Preserve wake-affine CPU for non-SMT
 reciprocal sync wakeups
In-Reply-To: <20261012113340.GS4121339@noisy.programming.kicks-ass.net>
Message-ID: <6e29ac5e-cf6c-d299-d72c-eef828bcfbe7@gentwo.org>
References: <20261008-b4-sched-sync-wakeup-v5-1-1af9fab48965@gentwo.org> <20261012113340.GS4121339@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi Peter,

Thanks for the review.

On Mon, 12 Oct 2026, Peter Zijlstra wrote:

> On Thu, Oct 08, 2026 at 03:22:37PM -0700, Shubhang Kaushik (Ampere) wrote:
>
>> +static bool prefer_sync_pair_cpu(struct task_struct *p, int cpu)
>> +{
>> +	struct rq *rq = cpu_rq(cpu);
>> +
>> +	if ((rq->nr_running - cfs_h_nr_delayed(rq)) != 1)
>> +		return false;
>> +
>> +	if (sched_asym_cpucap_active()) {
>> +		sync_entity_load_avg(&p->se);
>> +		if (!task_fits_cpu(p, cpu))
>> +			return false;
>> +	}
>> +
>> +	return true;
>> +}
>> +
>>  /*
>>   * Try and locate an idle core/thread in the LLC cache domain.
>>   */
>> @@ -9955,6 +9975,12 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>>  			if (cpu != prev_cpu)
>>  				new_cpu = wake_affine(tmp, p, cpu, prev_cpu, sync);
>>
>> +			if (sync && !sched_smt_active() &&
>> +			    new_cpu == cpu &&
>> +			    p->last_wakee == current &&
>> +			    prefer_sync_pair_cpu(p, cpu))
>> +				return cpu;
>> +
>>  			sd = NULL; /* Prefer wake_affine over balance flags */
>>  			break;
>>  		}
>
> Hurmph.. just looking at this patch makes me go WTF. I've not read this
> lengthy Changelog you put on top, because none of that survives unless
> one goes trawl through git.
>
> So this code is confusing as heck. Nor is is evident why it wants to be
> !SMT.
>
> The way I read this:
>
> if the new_cpu is the current cpu (default case) AND
>    p was last woken by us AND
>    random
>      stay here.
>
> The function babbles something about a sync-pair, but then doesn't
> actually do anything with a pair, or ensures there is a pair.
>
> I'm supposing what you're getting at is the earlier:
>
> 'p->last_wakee == current' combined with the fact that current is now
> waking p
>
> But then I have to note that last_wakee isn't all that nice, since
> record_wakee() isn't guarded by in_task() -- it really should be.
>
> Try and convince me with readable code?
>

Yes, I see. It seems implicit that v5 relies on the earlier 
record_wakee(p) update to establish current->last_wakee == p, while the 
placement decision only shows p->last_wakee == current.

I will respin it so the reciprocal state is recorded as a local boolean
immediately after record_wakee(p):

         reciprocal_wakeup = in_task() &&
                 current->last_wakee == p &&
                 p->last_wakee == current;

The later placement decision will use that named state rather than a
bare last_wakee comparison.

Yes, I will add the in_task() guard to record_wakee() itself. Otherwise,
an IRQ/softirq wakeup records the interrupted task as the waker and can
create a false last_wakee relationship.

Lastly, I will make the non-SMT restriction explicit at the decision
point. On a non-SMT CPU, stacking the reciprocal WF_SYNC wakee behind
the waker preserves the intended handoff when the waker is its only
runnable task. On SMT, an idle sibling or idle core may run the wakee
in parallel, so select_idle_sibling() remains responsible for that
placement.

So I'll send a v6 with these changes accordingly.

Thanks,
Shubhang Kaushik
