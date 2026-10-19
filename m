Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B160919CCF5
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396074; cv=none; b=qe28Ytg6Yl7R96lKh9SZ+jeEQtnag3bq1Z7n3ZPbvVtJ/s9azkhtNpFNxd3u0H4+hNyDRq+oIsy1UCrumANWg1LClYVeu0NAVCaVXWGBP8IZmGnachsA05BrX5gwBgWzwvvAUND8+E69zxOnkgIiEDiNRG0Xhja4J9AhhUcoCJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396074; c=relaxed/simple;
	bh=Ni84wmzEwyjfCyRdEXQhLz0l6VkKLxYT9iXvNFgKTiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ue43eFFQ5TrZ+jvu9LqYt+ID5XESp/QZIB2twtCOHlvxs1tDExRrAnC7q3u7ALNVtw8z7ES3yWMddxZ3ktuc+TGEdH1a4Ij8SAXbI1peKy6X74w7+igwHqNkS1nD2J5/k9tSWMrCo9ZCC91KQx5UdKHNEzbT0DDf+4r/tQl/rxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kE+sZ/cc; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kE+sZ/cc"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCA9F1477;
	Mon, 19 Oct 2026 00:47:48 -0700 (PDT)
Received: from [10.0.128.106] (e127648.arm.com [10.0.128.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4AA03F7D8;
	Mon, 19 Oct 2026 00:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792396072; bh=Ni84wmzEwyjfCyRdEXQhLz0l6VkKLxYT9iXvNFgKTiw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kE+sZ/ccr+FrFAZ4NHxLy9qSUNmpKA7qeRKkROZ4X5bWWDMoVigr/Niy0e4E4yp4N
	 YaWhP/cqU9sZAw76UwbA/XfmvcqjAB5+1konA1exuBnlN4JP6PSRtwdiBaQXuU+2Di
	 EplqBqQkMLTHT99BzHd+lX2QW2bf+9Wv/Z22esOw=
Message-ID: <a6c27dc2-ea8b-4c33-8c16-088d7501f9ac@arm.com>
Date: Mon, 19 Oct 2026 08:47:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/core: Use the scheduling context for remote ticks
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Connor O'Brien
 <connoro@google.com>, John Stultz <jstultz@google.com>,
 Shubhang Kaushik <shubhang@os.amperecomputing.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: linux-kernel@vger.kernel.org
References: <20261016-remote-tick-proxy-v1-1-272757a50a07@gentwo.org>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261016-remote-tick-proxy-v1-1-272757a50a07@gentwo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 22:13, Shubhang Kaushik (Ampere) wrote:
> sched_tick_remote() invokes task_tick() for rq->curr. With proxy
> execution, rq->curr is the mutex-owner execution context while
> rq->donor is the blocked task that supplies the scheduling context.
> 
> A mutex-blocked task remains queued for proxy execution. If that task
> is SCHED_FIFO, or the only SCHED_RR task, sched_can_stop_tick() permits
> the full-nohz tick to stop. find_proxy_task() can then select its mutex
> owner as rq->curr while retaining the blocked task as rq->donor.
> 
> sched_tick() and hrtick() already invoke task_tick() for rq->donor.
> Make sched_tick_remote() do the same. Keep rq->curr for the execution
> time sanity check.
> 
> Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_proxy_task()")
> 
> Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>


NIT: no empty newline between the above two

> ---
> Testing was performed on an Ampere Altra system with
> CONFIG_SCHED_PROXY_EXEC=y and CONFIG_NO_HZ_FULL=y, booted with:
> 
>   sched_proxy_exec=1 nohz_full=78
> 
> On the unpatched baseline: 70dd4ee72eb2 (7.3.0-rc7), mutex locktorture
> with four writers pinned to CPU 78 and RT boosting triggered:
> 
>   WARNING: kernel/sched/core.c:5895 at sched_tick_remote...
>   Workqueue: events_unbound sched_tick_remote
> 
> This warning is WARN_ON_ONCE(rq->curr != rq->donor), demonstrating that
> a full-nohz remote tick can run while the executing task and scheduling
> context differ.
> 
> The patched kernel completed the same 10-minute workload without
> scheduler warnings or locktorture failures.
> ---
>  kernel/sched/core.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 1fe40de6ebe3cb9a8cfa2e6104a2a4cd4515f739..14aab4cde12b4dc9cccf45087ca956ecec2aa379 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5885,14 +5885,9 @@ static void sched_tick_remote(struct work_struct *work)
>  	if (tick_nohz_tick_stopped_cpu(cpu)) {
>  		guard(rq_lock_irq)(rq);
>  		struct task_struct *curr = rq->curr;
> +		struct task_struct *donor = rq->donor;
>  
>  		if (cpu_online(cpu)) {
> -			/*
> -			 * Since this is a remote tick for full dynticks mode,
> -			 * we are always sure that there is no proxy (only a
> -			 * single task is running).
> -			 */
> -			WARN_ON_ONCE(rq->curr != rq->donor);
>  			update_rq_clock(rq);
>  
>  			if (!is_idle_task(curr)) {
> @@ -5903,7 +5898,11 @@ static void sched_tick_remote(struct work_struct *work)
>  				u64 delta = rq_clock_task(rq) - curr->se.exec_start;
>  				WARN_ON_ONCE(delta > (u64)NSEC_PER_SEC * 30);
>  			}
> -			curr->sched_class->task_tick(rq, curr, 0);
> +			/*
> +			 * Proxy execution runs the mutex owner in @curr on behalf of the
> +			 * blocked task in @donor. The scheduler tick applies to @donor.
> +			 */
> +			donor->sched_class->task_tick(rq, donor, 0);
>  
>  			calc_load_nohz_remote(rq);
>  		}
> 
> ---
> base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
> change-id: 20261016-remote-tick-proxy-237fc1da63c8
> 
> Best regards,

The sashiko review looks legitimate, mind picking that up, too?
https://sashiko.dev/#/patchset/20261016-remote-tick-proxy-v1-1-272757a50a07%40gentwo.org

