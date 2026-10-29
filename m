Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289492;
	b=Os9G0zXP8jOA1zW+vBQGiS865iwGJ8efAvfX24MutUCYCctCwYOs+c0xJJF1HUtWrW/0
	 +EJreXqCH/9vhAREwBEASnWaVXVjsZnQBJ7+wZUtOCCXeKew4qhGGtYO9gj5anA4dvzvk
	 W2pl3Er35LVR7TRFUaaXR+ymxICfyC0ufe9ua9rI4xpw1S/ZgrZ3olH8HTaym9IHx3eVk
	 uELIM37CMlpCJuMziiQPjtXqhd70CVuiC6UcWzWB8ydFY0U6RveVyCY6ebYFnuJ96iZGB
	 vrF0tvjZFeCNBKweJ50+iicYeIFVcsWJUnoANvSh1Q+jpslVSaYSJUI1MsFxrxmIhHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289492;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=k2I63yhJbwmslyvWvc9CH36xBxNme+lVQ3/KYN5XZAc=;
	b=JGgHzUJVA9O6nOIH3uhDAQXOUzY2CbkQBUjZi0pHLVPsc43pDHexDCvRDzXDE5hsJ+o0
	 bz+naiLwWrDeBVQDTSZHcfdABatvaqUnR2F2uG+mrS4E7dWp4VTDwmmtU1fYQW2ROWJh7
	 fpyNWzqf8Y4zxhJxntW3mb5dmVz2r3snukA/MXmuu0m+aLG7ta4potb8ZmA/4Lp3ntofI
	 bR+W+RYIB8AlM8UkOCAUBoWJGJnCuqX2owbCF/gJJK7LTfM/zn91PyDI5hbKjFpT8DPla
	 lv777AtRNIJxRMHD99IypZlWQb2URJ+NF24hCu57SC50FSvMfVNxMFDU7BGzYlkSt4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZlsZ+lJm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8369606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8369606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZlsZ+lJm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FC871682;
	Thu, 29 Oct 2026 08:58:07 -0700 (PDT)
Received: from [10.0.128.129] (e127648.arm.com [10.0.128.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 064583F59E;
	Thu, 29 Oct 2026 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793289490; bh=APlMWSZByN0rN/4h418IJMR9VJaO/VjvM+xUFyTpx5c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZlsZ+lJm+78mnx59mp3Fr/wdFB+j3yE6brDgcrHapcB0TPzdmhIJ3P4D6f+WvTUJt
	 G6xv5rirjpnFbwrYYxYMoDKURkjjwRpwXlNpDeDrOwJA73iAT/Rdbs94icH0w4hsjx
	 LuC26PmEqd7sW+TfM29nrZ540yHh+zjKhjZyKJmY=
Message-ID: <c4740152-e873-4409-b3a8-16c5a49548dd@arm.com>
Date: Thu, 29 Oct 2026 15:58:07 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
To: Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Wei Wang <wvw@google.com>
References: <20261029131354.11030-1-qyousef@layalina.io>
 <20261029131354.11030-2-qyousef@layalina.io>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261029131354.11030-2-qyousef@layalina.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 13:13, Qais Yousef wrote:
> Static keys are not guaranteed to be enabled atomically across CPUs.  Or
> across callsites on the same CPUs. Which means when sched_uclamp_used is
> enabled, some CPUs/callsites will return true for uclamp_is_used() while
> others won't, leading to asymmetric uclamp_rq_{inc, dec}_id. If we
> decrement without increment this is safe as documented in the code. But
> an increment without a decrement is a problem and will leave the
> uclamp_rq in a corrupt state.
> 
> The reported case seems to happen due to callsites on the same CPU not
> seeing the flipped state.
> 
> Plugging the race is hard as discussed in [1]. Take it for granted and
> do correction actions on going to idle to guarantee this state is
> transient for a short period after uclamp_sched_used is enabled.
> 
> [1] https://lore.kernel.org/lkml/CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com/
> 
> Reported-by: Wei Wang <wvw@google.com>
> Fixes: 46609ce227039 ("sched/uclamp: Protect uclamp fast path code with static key")
> Signed-off-by: Qais Yousef <qyousef@layalina.io>
> ---
>  kernel/sched/core.c  |  2 +-
>  kernel/sched/idle.c  | 19 +++++++++++++++++++
>  kernel/sched/sched.h |  3 +++
>  3 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index d7c3b43158dea..c6780358a7975 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2111,7 +2111,7 @@ static void uclamp_post_fork(struct task_struct *p)
>  	uclamp_update_util_min_rt_default(p);
>  }
>  
> -static void __init init_uclamp_rq(struct rq *rq)
> +void init_uclamp_rq(struct rq *rq)
>  {
>  	enum uclamp_id clamp_id;
>  	struct uclamp_rq *uc_rq = rq->uclamp;
> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> index 76f3c84ca6846..84301fc49e699 100644
> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -502,6 +502,25 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
>  	 * lost_idle_time of clock_pelt
>  	 */
>  	update_idle_rq_clock_pelt(rq);
> +
> +	/*
> +	 * Due to a race condition when enabling sched_uclamp_used static key,
> +	 * we can end up with imbalance where uclamp_rq_inc_id() has happened
> +	 * on a CPU without uclamp_rq_dec_id() on another CPU that hasn't seen
> +	 * the static key flipped. The race condition is unlikely, but ensure
> +	 * the uclamp_rq() state is set properly on each entry to idle.
> +	 *
> +	 * The reset will cause the uclamp_max from uclamp_idle_value() to be
> +	 * lost. Since we are imbalanced, hard to know what is right. So just
> +	 * cleanup. This should be a transient error state once we recover
> +	 * everything should work as expected.
> +	 *
> +	 * We need to be careful of some paths that can force idle with tasks
> +	 * are still queued.
> +	 */
> +	if (uclamp_is_used() &&
> +	    !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))

just checking nr_running isn't enough as CFS bandwidth throttling (a fun one
recently!) will decrement it through dequeue_task_fair() without calling
uclamp_rq_dec(), i.e. it's clamps must remain valid AFAICS.

> +		init_uclamp_rq(rq);
>  }
>  
>  struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf)
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 7d2ec527b8a25..d87bdbd2121df 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -3704,6 +3704,7 @@ static inline unsigned long cpu_util_rt(struct rq *rq)
>  #ifdef CONFIG_UCLAMP_TASK
>  
>  unsigned long uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id);
> +void init_uclamp_rq(struct rq *rq);
>  
>  /*
>   * When uclamp is compiled in, the aggregation at rq level is 'turned off'
> @@ -3802,6 +3803,8 @@ uclamp_eff_value(struct task_struct *p, enum uclamp_id clamp_id)
>  	return SCHED_CAPACITY_SCALE;
>  }
>  
> +static inline void init_uclamp_rq(struct rq *rq) {}
> +
>  static inline bool uclamp_rq_is_capped(struct rq *rq) { return false; }
>  
>  static inline bool uclamp_is_used(void)

