Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186042;
	b=io+ztE4mQsJnIh57pYSdrTd7RIB4ygPNmAXpDAEymjDRAbnlkKH3eWHMCio8Dog061Qn
	 HOZW9bI6DiZhr/AeMkTkbZCsl7bWZKTJTzMvNqKLdDbnNVKcoGD5jUZcS47srncxqe9Wp
	 biJTEbkwHCgI9EbDSFy9QuIi3/uGoeo2RSm+oYpmmEsb60/g01HiicQo/64EYIADnWkvj
	 dMlkYo8tUVaA6NUvant2/zluSYqdhsdS5b1dG3OQ4BJV5ceJ23nQZQ8Wdh10nAyglLpX7
	 +blpCSzT+ZDlU3vUNkbDTILuIBvw7XgxeXuZ5/+zrgKiklyUEd98bRfRo1PtLH959uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186042;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aOArbF4ko41YnuuSNzpV88GpBFoKZGCogUKhM0O0y+0=;
	b=5Dv1VdisxDaXn/4U83E6+TUjTlTmKEJHb/qbCNc3pm1rVJq+Y8lqAaelWC/WMMm5juXk
	 FrKD/x3fts01jjPPbKZNmnf0Kgo0/xZw2uKjfT9ehlHMumX7Miywqh6XNh2NHkkWg8i+k
	 A7wISwVfP/ytXF9VkjPLohj6wp5RXwYrAdG2ABOZZvBAjq67gWJ+bKob6g9kxOocw0rWM
	 W1R2SxZDurcSlETyoP0sMJmCAbgfGX3Gos1WcDM24ptyeHBjjiKu911mrWpClC8tJATOL
	 VJ4pck4zPCxoVzDLryu9jYMMiiDFsAmWSuKatSVtUG6f9roOxLbJx1O4QF/mNvumYbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EkV0+H+u;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0369606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0369606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EkV0+H+u
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B59A416A3;
	Wed, 28 Oct 2026 04:13:56 -0700 (PDT)
Received: from [10.0.128.129] (e127648.arm.com [10.0.128.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E98E63F673;
	Wed, 28 Oct 2026 04:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793186039; bh=uw0mPLw/CJz/1EJwdg1nj+TAPjoS++kJBF2usGrItoc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EkV0+H+uU9PlDmI8eftnDh3/3Le4E6KfE6w5BQTsxVhduqrk3W76LD8eXV1X7c61g
	 EgGphVzOUFnKftMWJPCwBF14Tr+Gx5ZZi4CxsYYFl230YPukDn3nnfOF5BLxG/oRhQ
	 kVwyFwHlFBFbq+l5BaQOWHJiXx9nt/t/BO9yOclA=
Message-ID: <97ab857d-9d9e-40d4-a243-253d1c2e411f@arm.com>
Date: Wed, 28 Oct 2026 11:13:55 +0000
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
Subject: Re: [PATCH v3 1/2] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
To: Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Wei Wang <wvw@google.com>
References: <20261028020512.10245-1-qyousef@layalina.io>
 <20261028020512.10245-2-qyousef@layalina.io>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261028020512.10245-2-qyousef@layalina.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 02:05, Qais Yousef wrote:
> Static keys are not guaranteed to be enabled atomically across CPUs.
> Which means when sched_uclamp_used is enabled, some CPUs will return
> true for uclamp_is_used() while others won't, leading to asymmetric
> ulcamp_rq_{inc, dec}_id. If we decrement without increment this is safe
> as documented in the code. But an increment without a decrement is
> a problem and will leave the uclamp_rq in a corrupt state.
> 
> The race for increment without a decrement is interesting as it means
> a CPU has seen the static key flipped and incremented while enqueueing
> a task, but the task was dequeued on another CPU that hasn't seen the
> static key flipped - we need to be wary this might be a symptom of
> something else going wrong.
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
>  kernel/sched/idle.c  | 17 +++++++++++++++++
>  kernel/sched/sched.h |  3 +++
>  3 files changed, 21 insertions(+), 1 deletion(-)
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
> index 76f3c84ca6846..c722b23e07dc2 100644
> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -502,6 +502,23 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
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
> +	 */
> +	if (uclamp_is_used()) {
> +		if (unlikely(!uclamp_rq_is_idle(rq)))
> +			init_uclamp_rq(rq);
> +	}
>  }
>  


I haven't checked the other cases, but sashiko notes a few issues with this.
The sched_ext one and the core-scheduling cases seem legitimate, i.e. the idle
task may be scheduled while the rq actually isn't idle and clamps should be
maintained?

