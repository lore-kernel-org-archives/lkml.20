Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2937A3A9612
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066568; cv=none; b=SZ4j6Uw9AvNID4mcbezfiHpqrpd/AXfFr4EcMo84yfoxsyUr/j9YFq35G4lf46y/XNyTx53D63GF66Lqlhp+atd395/CbYf9Xqsm6HXCllmY5bsJrShI5n5P29SxyI6hRprh2Y+cAzocPkJ4gjgqZTxBNzR0bfrxpXH8IML9nfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066568; c=relaxed/simple;
	bh=+Xw7XvPFFLa+61sXaRz3NyxnoeK2ADfUg+o7UpVqF3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duNE0etCx5eNE3GL8ryo1Efcx7SXONEWKhZhyl+wlsyfk9Yvzw6014gpAKia6Kzk7L8osPnbBZxmHknN2ziITTlNVbFtaOUw7PuGTcNc2a5TA/zNL8lzcjVwsKi2FbN1jKcC2wwPrdIfflmP2vEzidB7H9SMGT6Ca4xR9Ct/QjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQZYUp+B; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQZYUp+B"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499dd4900dfso5920575e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792066565; x=1792671365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V0H43nxYDJzvxsp3b2BgYqePwAV4z2ggg9D2f8rMBoQ=;
        b=cQZYUp+Bdkqr9fRTFgCsVJuVKhdBUvLmcg9fFdxlWPLmAcYO5jj+ZtPCIYq1zkTr9g
         0Aiw01PpcgQgbm4908KG5IcrCd7i1/hgtRLShiEYi8YGvB0g+gZ5JUR5velIrmKXIKEY
         /Ehw7VJCzhemKjTU2kTbqk1BdJxsv2U3ubIuwLAlIb81PJIB5hQuZ2pCQMcFaebEW4Cs
         tR6lnLIrXU60SB0fKJxBLJdz8i5GmpW+vk1dEUF03Qev1Y2sTQY5YX3xsew7PkPCYKrn
         IosQbzHs1aeGjCduWeVN2YomhdTJiBlFQ9sMubCJTufOKQP580VpCNxwzgvTWA4WsBQN
         BC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066565; x=1792671365;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0H43nxYDJzvxsp3b2BgYqePwAV4z2ggg9D2f8rMBoQ=;
        b=pXgXIiMG4dFmEKFbENNR7O6G0+Zt5FbG/JWbKPrrrV8nVy8fA/7kV/jEHWM756Mum3
         2tFnC/D8S0oj9C5fFv1OqEQ0vKcdGA8znNvdquHEcpsKxnZygJgtuUKFGw5wSKZgrPi5
         D9KQ0dzCtz58LvAo2fhMdd7nCp9jdd2fx1kbMCfPxNJu1Jeh9/aS0CChGTll3g+F5Ulh
         R0BjzWMZWNFthkTP+aWERLl/E5yM3G5EsTOQt0FguyDWUe8LZPe/ozF2V5fvp7b2rKh8
         jAEeK24xNzSJHeCR4budKA4hVaRDEW866ETbDwbfPLrIM4Nqof9NGM0a71ZDXtIjKHTz
         cFEA==
X-Forwarded-Encrypted: i=1; AKwUvBynuPkK1SSAX+0YSmPD4YYtzUfTvxszMszL19u23sL+IMvnxw2xUdcQvkjts50Fb3keGHH5RGasHDFvJ7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEWNwc8cWEIzlKxMbm4Pr/4n3xvB0Y5PxiSKbEocd8RwIAahzu
	v3lw+z0E/ZCBKM/TBSKmIqMJCJhxJJkWvySVAdccFh7DY1j372jReCcM
X-Gm-Gg: AYBFou0RDoZ6VpT6X4pkJvOwJV2Io8/R4dgA0365ezzSZsmJ77zYM7Zyd1qMaEF8JiM
	1tj+RBgmjRQ6NzLCekFC+osziv43G4fuamU+btXI6RZEsvqGQryAYpXucvvksLoU8UM8/BswaMP
	eaOdqky6BjuIkFJoQyTU9DuEHXhROl1eJtcs4UeAeJYx5wISypVNO9dI1p5RkZjxMz3G1cB8sCA
	SdEdnJi24bFCKUsn5gIcIAaRHzzz49xeIXfkBPU+1qkHnP1EK8i4qD7zPMzNX+E5NLflmh2xust
	3/NdJRf8SdKuTk2HwH6Mz90qrZ+61Pv3Xb8rM7PDg2lWga/OG9xVbvvvQUVktlLXPDMRD5AjmFo
	+h956O19mX/48yLgHlXjme1PF9wiUw02Uu9smr9pm8zwtW6URCFQh4SQMb/FWH0zLmcYEymmabR
	M0chuMF6dRdr64bp9R+jAfSu08RGiNFFWicrj5rNpUeHc8MwqQsMkW5F+plrEyqYYrxRMtwHWrg
	Oh1NliCqIXrJU1AsPgZ
X-Received: by 2002:a05:600c:1912:b0:4a0:73b:a222 with SMTP id 5b1f17b1804b1-4a18e3ee97dmr324453885e9.0.1792066565159;
        Thu, 15 Oct 2026 05:16:05 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd99febesm77642535e9.15.2026.10.15.05.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:16:04 -0700 (PDT)
Date: Thu, 15 Oct 2026 15:16:02 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Zhan Xusheng <zhanxusheng1024@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Zhan Xusheng <zhanxusheng@xiaomi.com>, 
	Ingo Molnar <mingo@redhat.com>, Balbir Singh <bsingharora@gmail.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	Josh Snyder <joshs@netflix.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] sched: Account I/O waits independently of delayed
 dequeue
Message-ID: <atC76vtYA12_jTar@lima-kdev.local>
References: <20261014081731.1068794-1-zhanxusheng@xiaomi.com>
 <fab66e31-7c7e-4a81-be59-1a4c1458ff43@arm.com>
 <4ce12bff-9532-4b27-98f2-a807bbccfaf7@arm.com>
 <20261015025912.1541134-1-zhanxusheng@xiaomi.com>
 <a71b6375-f460-49fc-aee6-9f01d58163c2@arm.com>
 <fd8578a1-e60b-4993-ab51-2b5d63abcf77@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fd8578a1-e60b-4993-ab51-2b5d63abcf77@arm.com>

On Thu, Oct 15, 2026 at 12:37:54PM +0100, Christian Loehle wrote:
Normally I wouldn't add these. But I changed my setup. It adds
these itself. Not a big fan of changes but this is way more easier...

> ---
>  include/linux/sched.h |  2 ++
>  kernel/sched/core.c   | 33 ++++++++++++++++++++-------------
>  kernel/sched/sched.h  |  5 -----
>  3 files changed, 22 insertions(+), 18 deletions(-)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index d35ae49a991f..d558816cc05a 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -880,6 +880,8 @@ struct task_struct {
>  	 */
>  	int				recent_used_cpu;
>  	int				wake_cpu;
> +	/* CPU charged while is_blocked && in_iowait. */
> +	int				iowait_cpu;
>  
>  	int				prio;
>  	int				static_prio;

I wondered if the charge could follow the task while it changes CPUs,
but I think that it would break down more easily than this.

Still, there could be a better approach but right now, I can't find
any. Maybe there's a section that we could reuse? But IDK.

> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 1fe40de6ebe3..85eba26f00d6 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -636,7 +636,7 @@ int task_llc(const struct task_struct *p)
>   *
>   * p->is_blocked <- { 0, 1 }:
>   *
> - *   is set by try_to_block_task() and cleared by ttwu_do_wakeup() and tracks
> + *   is set by try_to_block_task() and cleared by unblock_task() and tracks
>   *   if the task is blocked. Traditionally this would mirror p->on_rq, however
>   *   due things like DELAY_DEQUEUE and PROXY_EXEC, this can diverge.
>   *
> @@ -3737,12 +3737,22 @@ ttwu_stat(struct task_struct *p, int cpu, int wake_flags)
>  		__schedstat_inc(p->stats.nr_wakeups_sync);
>  }
>  
> +static inline void unblock_task(struct task_struct *p)
> +{
> +	if (p->is_blocked && p->in_iowait) {
> +		delayacct_blkio_end(p);
> +		atomic_dec(&cpu_rq(p->iowait_cpu)->nr_iowait);
> +	}
> +
> +	p->is_blocked = 0;
> +}
> +
>  /*
>   * Mark the task runnable.
>   */
>  static inline void ttwu_do_wakeup(struct task_struct *p)
>  {
> -	p->is_blocked = 0;
> +	unblock_task(p);
>  	WRITE_ONCE(p->__state, TASK_RUNNING);
>  	trace_sched_wakeup(p);
>  }
> @@ -3839,10 +3849,6 @@ ttwu_do_activate(struct rq *rq, struct task_struct *p, int wake_flags,
>  		en_flags |= ENQUEUE_RQ_SELECTED;
>  	if (wake_flags & WF_MIGRATED)
>  		en_flags |= ENQUEUE_MIGRATED;
> -	else if (p->in_iowait) {
> -		delayacct_blkio_end(p);
> -		atomic_dec(&task_rq(p)->nr_iowait);
> -	}
>  
>  	activate_task(rq, p, en_flags);
>  	wakeup_preempt(rq, p, wake_flags);
> @@ -4415,11 +4421,6 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
>  
>  		cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
>  		if (task_cpu(p) != cpu) {
> -			if (p->in_iowait) {
> -				delayacct_blkio_end(p);
> -				atomic_dec(&task_rq(p)->nr_iowait);
> -			}
> -
>  			wake_flags |= WF_MIGRATED;
>  			psi_ttwu_dequeue(p);
>  			set_task_cpu(p, cpu);
> @@ -6762,6 +6763,12 @@ static bool try_to_block_task(struct rq *rq, struct task_struct *p,
>  
>  	p->is_blocked = 1;
>  
> +	if (p->in_iowait) {
> +		p->iowait_cpu = cpu_of(rq);
> +		atomic_inc(&rq->nr_iowait);
> +		delayacct_blkio_start();
> +	}
> +

So now we increase this nr_iowait on try_to_block_task(), and decrease it on unblock_task().

Also, there's a wrong comment about this in here:

 /*
  * This task is about to go to sleep on IO. Increment rq->nr_iowait so 
  * that process accounting knows that this is a task in IO wait state.
  */
 long __sched io_schedule_timeout(long timeout)
 {
 	int token;
 	long ret;
 
 	token = io_schedule_prepare();
 	ret = schedule_timeout(timeout);
 	io_schedule_finish(token);
 
 	return ret;
 }

This doesn't even touch nr_iowait, so this is stale.
Maybe remove this comment or just correct this while in this?

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
