Received: from mta0.migadu.com (out-250.mta0.migadu.com [91.218.175.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AEB14F70
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788077899; cv=none; b=KPIPldkOEZkzOQI9V4VuQ0C+i5/O5TYN/isHkf01b9Hwjz5v3R/05Qqcfn/PcNOnGzQru/IdSCpPr+pPkYg7Qf4ApCbup7GtdJwP6Rrgm47iS3sqdkscMvDTA6PZISe6IxsrtXU6r35xdjtH3DKEoJSGkoQNOEA0Qu5K5RnDhJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788077899; c=relaxed/simple;
	bh=NAuA52VSPA72V2eVkgdvw0tVVN3Vtsno0NxmUpvk53E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbzWuiTvOV2rbaook0jW5gkx6PI0BkeevlQ21zPzKsWvI0AaLieFcmZtzTZ5HKLCz9nWrL27L69hJu4B2/HZSK3FSLW1d8GqQX0UCc5VXxHNxrtp1X31oCtZfer62CPFZk2Mu3/BR+tlNXTkIp5NhP/wc+buAqpngIQmRoaKaHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BhbXhRka; arc=none smtp.client-ip=91.218.175.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BhbXhRka"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NAuA52VSPA72V2eVkgdvw0tVVN3Vtsno0NxmUpvk53E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788077890; v=1; x=1788682690;
 b=BhbXhRkaGTAura+VoLoQY9CThEVbxndEdsUI4t+LoWVRf3B590XsYliG7Cc8ZyGzJci2hHuO
 jkqknIeSw+yE2C4lXdn7e/IiluavNn+mIdYx2mss/akzhOPU5e0IROVj0bIubduPUx9xpSYQoWa
 qskg8DfTVWOuqn7SZy0eIvT4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 813fea7be6b6f147;
	Sun, 30 Aug 2026 08:18:00 +0000
X-Mizu-Trace-ID: 813fea7be6b6f147
X-Migadu-Flow: FLOW_OUT
Date: Sun, 30 Aug 2026 16:17:41 +0800
From: Chen Yu <chen.yu@linux.dev>
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: Zhan Xusheng <zhanxusheng1024@gmail.com>, yu.c.chen@intel.com,
	peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: sched/fair: which tasks should nr_pref_llc_running be compared
 against?
Message-ID: <apPnJaUS5vq2f85J@three-body>
References: <20260827135000.735138-1-zhanxusheng@xiaomi.com>
 <59e2b8265fc650266b93d8f523c366edfa912428.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59e2b8265fc650266b93d8f523c366edfa912428.camel@linux.intel.com>

On Thu, Aug 27, 2026 at 01:57:33PM -0700, Tim Chen wrote:
> On Thu, 2026-08-27 at 21:50 +0800, Zhan Xusheng wrote:
> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> ---
>  kernel/sched/fair.c | 45 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index d78467ec6ee1..1673b17273c5 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1544,7 +1544,14 @@ static void account_llc_dequeue(struct rq *rq, struct task_struct *p)
>  
>  	rq->nr_llc_running--;
>  	if (p->pref_llc_queued) {
> -		rq->nr_pref_llc_running--;
> +		/*
> +		 * If the task is being finally dequeued while still delayed,
> +		 * set_delayed() already removed it from nr_pref_llc_running;
> +		 * skip here to avoid underflow. Clearing pref_llc_queued also
> +		 * stops the subsequent clear_delayed() from re-adding it.
> +		 */
> +		if (!p->se.sched_delayed)
> +			rq->nr_pref_llc_running--;

Should we also do similar check in account_llc_enqueue()? It is possible during
load balance migration, a migrate_load allows the task to be migrated across
CPUs. And load balance leverages detach_tasks()/attach_tasks() to move tasks.
During this stage the p->se.sched_delayed remained unchanged:
In enqueue_task_fair(), only when if (se->on_rq && se->sched_delayed) is true,
p->se.sched_delayed will be cleared by requeue_delayed_entity() - during migration,
se->on_rq is false.

As a result, attach_tasks -> enqueue_hierarchy -> enqueue_entity -> account_llc_enqueue(rq, p)
incorrectly increase rq->nr_pref_llc_running - even that task is in delayed state, and
not runnable.

>  		/*
>  		 * Update the status in case
>  		 * other logic might query
> @@ -1572,6 +1579,24 @@ static void account_llc_dequeue(struct rq *rq, struct task_struct *p)
>  	}
>  }
>  
> +/*
> + * A task becoming delay-dequeued leaves the runnable set while staying
> + * queued. Keep nr_pref_llc_running in the runnable domain (like
> + * h_nr_runnable) so alb_break_llc() can compare the two directly.
> + */
>

Regarding alb_break_llc(), since we have compared nr_pref_llc_running vs 
nr_runnable, I wonder if we should also change the code?
	if (env->src_rq->nr_pref_llc_running &&
 	    env->src_rq->nr_pref_llc_running == env->src_rq->cfs.h_nr_runnable)
		unsigned long util = 0;
		struct task_struct *cur;
 
                if (env->src_rq->cfs.h_nr_runnable <= 1)
                        return true;

thanks,
Chenyu
