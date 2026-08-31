Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7F33B635C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200756; cv=none; b=ZWSu2Yo117Zgj70NhK2m9h/nu/qFtyvPggzRP1l7Jpu6cZJN5oyRGopS8WwDhxvdyuBBCYbvA6hlJ1Dw40oDMxoF9bGwcoAVbiCR0JOVCzI913DRwPxdP8KI+AchcltCABD6JgF2rmrNXoy3QbwnFKcsIgkHbeWBSIcu6KzDupE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200756; c=relaxed/simple;
	bh=NMnn1Np1J02pg568k78cSUeWp5XR3Mfy7whOylXzj6I=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZEXo8kCrRL0EdDCa3rkq6THjYpBfr0fM39VmmDYmAgO0TWeDetNMGBj1MqIbsaKm80Hrbf+l+ZTS0Cw6zBQH4uvL3ZkjBCWQyF/OKW1gd2ZXBjpBxERHB/rPASGP2xtx94WfPv9cyjEI+QKj0YNkb78DeqIG7LAmDv+bTP0vfl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=joOhqAIS; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="joOhqAIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1788200267;
	bh=NMnn1Np1J02pg568k78cSUeWp5XR3Mfy7whOylXzj6I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=joOhqAISv05R69oCmbLPw2JKFiIH6hM3hniYnOHi2YAUqRPOMJK9QqDWCKNoALYJk
	 hJA9oGyb3csfGbwPb1kWpLczmxC2RNlDmHRAz6KshMDYwFuBDmzC5LQ7WGg86K7Mfm
	 NZq5wp8Rdjeiend4Ci29VUxAPFZUFCQhy8iVPROs=
Received: by gentwo.org (Postfix, from userid 1007)
	id 7AB8D4046F; Mon, 31 Aug 2026 11:17:47 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 785F9401C8;
	Mon, 31 Aug 2026 11:17:47 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:17:47 -0700 (PDT)
From: Shubhang <sh@gentwo.org>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
    Juri Lelli <juri.lelli@redhat.com>, 
    Vincent Guittot <vincent.guittot@linaro.org>, 
    Dietmar Eggemann <dietmar.eggemann@arm.com>, 
    Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
    Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
    K Prateek Nayak <kprateek.nayak@amd.com>, John Stultz <jstultz@google.com>, 
    Zhan Xusheng <zhanxusheng@xiaomi.com>, 
    Christopher Lameter <cl@os.amperecomputing.com>, 
    Shubhang Kaushik <shubhang@os.amperecomputing.com>
cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] sched/core: Skip rq->avg_idle update without a valid
 idle_stamp
In-Reply-To: <20260807-master-v3-1-c328354efed3@gentwo.org>
Message-ID: <746602fd-e9d5-128f-bd6c-e5ce7c756916@gentwo.org>
References: <20260807-master-v3-1-c328354efed3@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi,

Could you please let me know whether it is suitable for the sched/core
tree for v7.3, or whether further work is needed?

Thanks,
Shubhang Kaushik

On Fri, 7 Aug 2026, Shubhang Kaushik (Ampere) wrote:

> Commit 4b603f1551a73 ("sched: Update rq->avg_idle when a task is moved
> to an idle CPU") moved rq->avg_idle accounting out of the wakeup path and
> into put_prev_task_idle(), so that the idle interval is consumed whenever
> the idle task is switched out.
>
> The wakeup-side accounting that it replaced only updated rq->avg_idle
> when rq->idle_stamp was non-zero. The new helper lost that validity
> check and unconditionally computes:
>
> 	rq_clock(rq) - rq->idle_stamp
>
> If rq->idle_stamp is zero, this uses rq_clock(rq) as the sample. That is
> not a valid idle duration and can immediately drive rq->avg_idle to its
> clamp.
>
> This can happen when sched_balance_newidle() returns before setting
> rq->idle_stamp, for example when this_rq->ttwu_pending is set. In that
> case the rq can switch to the idle task with idle_stamp still zero and
> leave idle again when the pending wakeup is processed.
>
> Other paths can also switch to the idle task without setting
> rq->idle_stamp via newidle_balance(), for example find_proxy_task() or
> force-idling.
>
> Restore the idle_stamp validity check in update_rq_avg_idle() and skip
> the rq->avg_idle update when there is no measured idle interval.
>
> Fixes: 4b603f1551a73 ("sched: Update rq->avg_idle when a task is moved to an idle CPU")
> Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Acked-by: John Stultz <jstultz@google.com>
> Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
> ---
> Temporary tracing under hackbench load confirmed that
> update_rq_avg_idle() can be reached with rq->idle_stamp == 0.
> Hackbench showed no material regression versus v7.2-rc5 mainline.
>
> Related discussion:
>  https://lore.kernel.org/r/20260423023322.1293923-1-firelzrd@gmail.com
>
> This is a narrower variant of the earlier proposal. It keeps the
> rq->idle_stamp guard in update_rq_avg_idle(), but intentionally does not
> stamp idle entry from set_next_task_idle(), preserving the existing
> newidle accounting model and avoiding force-idle/proxy-exec accounting
> concerns.
> ---
> Changes in v3:
>  - Describe the sched_balance_newidle()/ttwu_pending path as an
>    example of entering idle without a valid rq->idle_stamp.
>  - Drop unlikely() from the idle_stamp check.
>  - Add Acked-by from John Stultz.
>
> Link to v2: https://lore.kernel.org/r/20260806-master-v2-1-e1f3a1a0c903@gentwo.org
>
> Changes in v2:
>  - Add Reviewed-by from Prateek.
>  - Mention find_proxy_task() and force-idling as examples of paths that
>    can switch to the idle task without a valid rq->idle_stamp.
>  - Cc John Stultz.
>
> Link to v1: https://lore.kernel.org/r/20260728-master-v1-1-f95d9b0147d2@gentwo.org
> ---
> kernel/sched/core.c | 10 ++++++++--
> 1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 96226707c2f6135341aa779b8262f113e103d8ad..68fa724cd668fb6c4cead329d05fa95e2f1ea5db 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3732,11 +3732,17 @@ static inline void ttwu_do_wakeup(struct task_struct *p)
>
> void update_rq_avg_idle(struct rq *rq)
> {
> -	u64 delta = rq_clock(rq) - rq->idle_stamp;
> -	u64 max = 2*rq->max_idle_balance_cost;
> +	u64 idle_stamp = rq->idle_stamp;
> +	u64 delta, max;
> +
> +	if (!idle_stamp)
> +		return;
> +
> +	delta = rq_clock(rq) - idle_stamp;
>
> 	update_avg(&rq->avg_idle, delta);
>
> +	max = 2 * rq->max_idle_balance_cost;
> 	if (rq->avg_idle > max)
> 		rq->avg_idle = max;
> 	rq->idle_stamp = 0;
>
> ---
> base-commit: 3f008280327ba5ad132965abab0c7846283cef0c
> change-id: 20260728-master-55cd7cc13290
>
> Best regards,
> -- 
> Shubhang Kaushik (Ampere) <sh@gentwo.org>
>
