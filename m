Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B89A2D46CE
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791702821; cv=none; b=RKEoaZZmxTm1bHUzzHUFVXliwpa58X/uPRNiHg+NxES1KYCF/zNd0DZ/WxNgIu1/oLELNUC67vW9fQeJgWIZqW1lQ19YtXQx0Z7FmxEYXjld0beIhFz5U426FgPq+7Hau9q82Grvea8Mk/WyiaVC77CfX2WvFwOrhHxdpG/hhCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791702821; c=relaxed/simple;
	bh=6ebPOKjhN8Ps81D+vpVbiOaEFG9SSaG9YH0GaCOzwTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k72ChfELdkXLWu1ElZhoRiqhGpjHVpxHPA54u3LSqvWTC7RhQIoqXPbYPqy4dthMg8h85MCVr7KCjNlNIoiRMiSajSGoaCuWiR7ce/ZaQPxVznzF4Kjh3KWivW2KWQamnF+oGXw824ed8Uc8kt7nKoa8EdSu/Vq0079Jcp09O/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=D9Ob/WLt; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="D9Ob/WLt"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D385E1756;
	Sun, 11 Oct 2026 00:13:33 -0700 (PDT)
Received: from [10.57.79.3] (unknown [10.57.79.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24C043F882;
	Sun, 11 Oct 2026 00:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791702817; bh=6ebPOKjhN8Ps81D+vpVbiOaEFG9SSaG9YH0GaCOzwTQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D9Ob/WLtcpyXcAxuRmhjCRv8rPOgJRs/4bif55q0vf+84jfybOsyTvgaIEzjnuFZJ
	 fChuEop63cpjRFgab7Iug46FiQtolButTRM5scAjdJ1Snw3jwYKhxpakvB/dvlo1cW
	 6qVFW7ovw01OFAoTuVQxKzzFplXEQYr/By/S86RQ=
Message-ID: <ed2c3c89-f556-4fad-b17b-cc08f2eab84a@arm.com>
Date: Sun, 11 Oct 2026 08:13:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/eevdf: Fix vprot across reweighting
To: Kayra Cizmeci <kayracizmeci@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: elif.topuz@arm.com, linux-kernel@vger.kernel.org, sh@gentwo.org,
 Ingo Molnar <mingo@kernel.org>
References: <20261003114656.105721-1-kayracizmeci@gmail.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261003114656.105721-1-kayracizmeci@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/3/26 12:46, Kayra Cizmeci wrote:
> Currently in reweighting, while a tasks vruntime changes dead protection
> could go alive, or alive protection could decrease, increase and go dead.
> 
> To fix this, implement rel_vprot similar to rel_deadline. Only

Ah nice find, please allow me to look at this code for a bit if that's
the best way to implement this, will review then, for now

Tested-by: Christian Loehle <christian.loehle@arm.com>

> major difference is that rel_vprot is not dependent on
> PLACE_REL_DEADLINE, because there are no mechanisms (unlike deadline)
> that recalculate vprot. So it gets carried.
> 
> Fixes: 80390ead2080 ("sched/fair: Separate se->vlag from se->vprot")
> Fixes: bcd74b2ffdd0 ("sched/fair: Only set slice protection at pick time")
> Link: https://lore.kernel.org/all/20261001164609.244156-1-kayracizmeci@gmail.com/
> Link: https://lore.kernel.org/all/e4700a93-ebd5-4c7e-88b5-d606437a13c0@arm.com/
> Co-developed-by: Christian Loehle <christian.loehle@arm.com>
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>

FWIW my SOB shouldn't be there anymore.

> Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> ---
> Hi all,
> 
> Base is commit 4a3b51aab6e25244d97936aa65e6d5425adf98e1
> on tip/sched/core.
> 
> NOTE: Christian, this version is really different from yours.
> I still added the tags, hope that's not a problem.
> If it is tho, please let me know.
> 
> I've thought a lot about this. I was at first thinking about
> a simpler approach, but to be similar and consistent with the
> current approaches to the similar problem on rel_deadline,
> I thought this would be better. 
> 
> 
> I also ran some tests, from a VM that was inside a VM that
> was working on MacOS on my Mac. (This is like a war crime...)
> 
> 
> MY GREAT AND DEFINITELY 100% CORRECT ULTRAMEGA TEST 
> 
> We first pin 2 tasks to the same CPU, (let's say TA and TB)
> Then we change TA's nice value 3000 times between 0 and 10 (like, 0,10,0,10...)
> We save weight and rem = (s64)(se->vprot - se->vruntime) on both
> __dequeue_task() and enqueue_task_fair().
> 
> Then, we multiply weight and rem for both savings and
> divide them. If they are between 0.95-1.05 we accept the
> results as correct, if not well... Wrong.
> 
> I'm also terrible at math and a bit less terrible on coding
> so these results should be 100% correct.
> 
> MY GREAT AND DEFINITELY 100% CORRECT ULTRAMEGA TEST RESULTS:
> 
> NRTP = NO_RUN_TO_PARITY
> 
>        Live Protection Wrong Counts
>   +--------+-------------+--------------+
>   |        |     BASE    | BASE + PATCH |
>   +--------+-------------+--------------+
>   | Normal |  6002/6002  |    0/6003    |
>   +--------+-------------+--------------+
>   |  NRTP  |    53/53    |     0/55     |
>   +--------+-------------+--------------+
> 
> On Base Normal, maximum amount of increase was 4.49x,
> while the maximum amount of decrease was 0.17x and the average was
> 1.64x.
> 
> While on Base NRTP, maximum amount of increase was 2.27x,
> maximum amount of decrease was 0.31x and the average was
> 1.08x.
> 
> Well that's all. You may or may not ask where are the revived ones are.
> This test does not really covers that part. 
> 
> Or as I like to say it, my computer ate that part.
> 
> That's really really all. Aside from the code :-).
> 
> 
>  include/linux/sched.h |  1 +
>  kernel/sched/core.c   |  1 +
>  kernel/sched/fair.c   | 34 ++++++++++++++++++++++++----------
>  3 files changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 7b91cae4a59c..bd9e2d119910 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -584,6 +584,7 @@ struct sched_entity {
>  	unsigned char			on_rq;
>  	unsigned char			sched_delayed;
>  	unsigned char			rel_deadline;
> +	unsigned char			rel_vprot;
>  	unsigned char			custom_slice;
>  					/* hole */
>  
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 71d3c948e14a..f1241f572cdc 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4638,6 +4638,7 @@ static void __sched_fork(u64 clone_flags, struct task_struct *p)
>  	p->se.vruntime			= 0;
>  	p->se.vlag			= 0;
>  	p->se.rel_deadline		= 0;
> +	p->se.rel_vprot			= 0;
>  	INIT_LIST_HEAD(&p->se.group_node);
>  
>  	/* A delayed task cannot be in clone(). */
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index b42a0ca2a69e..0bcd3a77aba4 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4614,7 +4614,7 @@ dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  }
>  
>  static void
> -rescale_entity(struct sched_entity *se, unsigned long weight, bool rel_vprot)
> +rescale_entity(struct sched_entity *se, unsigned long weight)
>  {
>  	long old_weight = se->h_load.weight;
>  
> @@ -4712,7 +4712,7 @@ rescale_entity(struct sched_entity *se, unsigned long weight, bool rel_vprot)
>  	if (se->rel_deadline)
>  		se->deadline = div64_long(se->deadline * old_weight, weight);
>  
> -	if (rel_vprot)
> +	if (se->rel_vprot)
>  		se->vprot = div64_long(se->vprot * old_weight, weight);
>  }
>  
> @@ -4720,7 +4720,6 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
>  			   unsigned long weight, bool on_rq)
>  {
>  	bool curr = cfs_rq->curr == se;
> -	bool rel_vprot = false;
>  	u64 avruntime = 0;
>  
>  	if (se->h_load.weight == weight)
> @@ -4733,7 +4732,7 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
>  		se->rel_deadline = 1;
>  		if (curr && protect_slice(se)) {
>  			se->vprot -= avruntime;
> -			rel_vprot = true;
> +			se->rel_vprot = 1;
>  		}
>  
>  		cfs_rq->h_nr_queued--;
> @@ -4741,17 +4740,23 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
>  			__dequeue_entity(cfs_rq, se);
>  	}
>  
> -	rescale_entity(se, weight, rel_vprot);
> +	rescale_entity(se, weight);
>  
>  	update_load_set(&se->h_load, weight);
>  
>  	if (on_rq) {
> -		if (rel_vprot)
> -			se->vprot += avruntime;
>  		se->deadline += avruntime;
>  		se->rel_deadline = 0;
>  		se->vruntime = avruntime - se->vlag;
>  
> +		if (se->rel_vprot) {
> +			se->vprot += avruntime;
> +			se->rel_vprot = 0;
> +		} else if (curr) {
> +			/* Reweighting must not revive expired slice protection. */
> +			cancel_protect_slice(se);
> +		}
> +
>  		if (!curr)
>  			__enqueue_entity(cfs_rq, se);
>  		cfs_rq->h_nr_queued++;
> @@ -6297,6 +6302,11 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>  
>  	se->vruntime = vruntime - lag;
>  
> +	if (se->rel_vprot) {
> +		se->vprot += se->vruntime;
> +		se->rel_vprot = 0;
> +	}
> +
>  	if (update_zero)
>  		update_zero_vruntime(cfs_rq, -lag);
>  
> @@ -8143,9 +8153,13 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
>  
>  	dequeue_hierarchy(p, flags);
>  
> -	if (sched_feat(PLACE_REL_DEADLINE) && !task_sleep) {
> -		se->deadline -= se->vruntime;
> -		se->rel_deadline = 1;
> +	if (!task_sleep) {
> +		se->vprot = protect_slice(se) ? se->vprot - se->vruntime : 0;
> +		se->rel_vprot = 1;
> +		if (sched_feat(PLACE_REL_DEADLINE)) {
> +			se->deadline -= se->vruntime;
> +			se->rel_deadline = 1;
> +		}
>  	}
>  	if (se != cfs_rq->curr)
>  		__dequeue_entity(cfs_rq, se);

