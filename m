Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756363;
	b=PFfcNOoCKRmtZKwtKld8jDxwuZTWyAnhTxGARU3qtVggeHMStF3jz/UMPvlkz509PMZr
	 fUh4RQS1+i+oK51ebM50kzThQfgV8GWgoR3JzCv1ym72nMuEOhdrPrfc8d7kxjqARDsJP
	 65Z1G51r/zKEidiZKmrO9xhYmd4U7ZFG1Qa9Va5kza+BNZpJiBnituuoxc4MFrNXIyubg
	 MhBq5DhLwRTfYRFfdOmyClEflJnSrsLBabumUg76V1EXw/q8b/ijfgrz7Fc9DY5c4L6eY
	 zTyNPL8RPK+pahHCilHtkj6kxXQKudsEawqaELmoPmBhAx5pZTPeSw2hRiX0tW4BU5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756363;
	h=DMARC-Filter:DKIM-Signature:Date:X-Original-From:
	 Content-Transfer-Encoding:Cc:Message-Id:Content-Type:In-Reply-To:
	 X-Lms-Return-Path:References:From:To:Mime-Version:Content-Disposition:
	 Subject;
	bh=6LMAwYkSq9kQKla3Va96AKNyDdc0sw1oMlQa+NUfPjw=;
	b=cRp0pFshfoZmSwQruDjlbFtpg+5VH1R+yj1QXcHcVywEo68KrxhO3W0lo+4IIIi82DPv
	 0Pi+sk2Sg0VXXwwhlhC8fNVeQZg5LDLoVjJVd1ZPYDLesIziEIK5IOH5yCwnXj3kkJ1yE
	 o33bmb7Ka194YrTkyUvqvx2HiXucrbw9HLjkx5Ms21h+871toLQ1wMYxZH55P8l4qBIpE
	 OqtPIxh/JoXkSRj7Nkqoh2CKwPVVM+cGD6XLprteZPJuuoEv5ScfkGQyLg+kmNk9J1nPJ
	 JJEDCA515H2XntiNCKD9ns7+0c307kfaYRubZn0Pp3eHLPGyoSXQ1TyftGTI4BT5K0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=UEE9mJy9;
	arc=none smtp.remote-ip=209.127.230.111
Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC744606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC744606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=UEE9mJy9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792756357; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=6LMAwYkSq9kQKla3Va96AKNyDdc0sw1oMlQa+NUfPjw=;
 b=UEE9mJy9llQlbMrdaDT3D/1txQrxODPCANDbJj1P3VCnOaZVxtv9P2rm1iyw/VbpaHtUWh
 yWqKRHMje1eKAUeV+pB4Q+sOJNTfzza5LiO7V6K1iu1lviiFPug8SC96n3HrOghgotQJe4
 O2Alk6W7m0XWeofaW85Uj5rXzNiG1RVBUfqmWsdEuqfDDByWqf3zpzU1j8zRNDqCZodF6v
 Tj/wz3PDoUbgjG2vTqpNYg95ntJAuKsa+AlyoFS5P9614mfsGuUOUAplE+S+z1IxnRvEF+
 SnooO+OLtJXQDLQcMf8JoTLuu2PQVngk9bjcjZpQ3cOoupykSvXqNuk2/a7xAQ==
Date: Fri, 23 Oct 2026 19:52:01 +0800
X-Original-From: Aaron Lu <ziqianlu@bytedance.com>
Content-Transfer-Encoding: 7bit
Cc: "Ingo Molnar" <mingo@redhat.com>, 
	"Peter Zijlstra" <peterz@infradead.org>, 
	"Juri Lelli" <juri.lelli@redhat.com>, 
	"Vincent Guittot" <vincent.guittot@linaro.org>, 
	"Dietmar Eggemann" <dietmar.eggemann@arm.com>, 
	"Steven Rostedt" <rostedt@goodmis.org>, 
	"Ben Segall" <bsegall@google.com>, "Mel Gorman" <mgorman@suse.de>, 
	"Valentin Schneider" <vschneid@redhat.com>, 
	"K Prateek Nayak" <kprateek.nayak@amd.com>, 
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Message-Id: <20261023115201.GA1775284@bytedance.com>
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20261022235234.150957-1-4ncienth@gmail.com>
X-Lms-Return-Path: <lba+26adb4a82+27092e+vger.kernel.org+ziqianlu@bytedance.com>
References: <20261022235234.150957-1-4ncienth@gmail.com>
From: "Aaron Lu" <ziqianlu@bytedance.com>
To: "Daehyeon Ko" <4ncienth@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [PATCH] sched/fair: Clear throttle state when leaving the fair class

On Fri, Oct 23, 2026 at 08:52:33AM +0900, Daehyeon Ko wrote:
> Task-based CFS bandwidth throttling removes a task's fair sched_entity
> while the scheduler core still considers the task queued. p->throttled
> carries the fair-specific state across dequeue/enqueue operations.
> 
> DEQUEUE_CLASS removes the task from cfs_rq->throttled_limbo_list
> but retains the bit. If the last finite CFS quota is disabled while
> the task runs in another class, it is absent from the unthrottle walk and
> the bit survives.
> Returning to fair while cfs_bandwidth_used() is false then performs a real
> fair enqueue with p->throttled still set.
> 
> After bandwidth is re-enabled, a class-change dequeue treats the
> stale bit as limbo state and skips __dequeue_task(). p->se.on_rq therefore
> remains set, and put_prev_task_fair() places the entity in the EEVDF tree
> while the task moves to RT. On exit, the fair picker can select the
> TASK_DEAD task. __schedule() then returns to do_task_dead(),
> which hits BUG().
> 
> Keep p->throttled across migrations and group moves, but clear it on
> DEQUEUE_CLASS because fair-specific state must not outlive fair-class
> membership. A later return to fair uses the normal enqueue path. That path
> still respects a throttled cfs_rq.
> 
> A KASAN, LOCKDEP and DEBUG_LIST v7.3 kernel reproduced the do_task_dead()
> BUG in 3/3 root and 3/3 delegated uid-1000 runs with CapPrm=CapEff=0 and
> RLIMIT_RTPRIO=1. The fix passed both matrices plus a 3/3 class-switch
> control with bandwidth continuously enabled, without a scheduler warning,
> KASAN report, lockdep splat or crash.
> 
> An AI coding assistant analyzed the state mismatch and drafted the initial
> reproducer, fix candidate and this changelog. The source paths, trigger,
> controls and results were rechecked against the cited revisions.
> 
> Fixes: e1fad12dcb66 ("sched/fair: Switch to task based throttle model")
> Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Aaron Lu <ziqianlu@bytedance.com>
Thanks!

> ---
>  kernel/sched/fair.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0feec172fd37eb..524fe88bbb381a 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -6957,8 +6957,8 @@ static void dequeue_throttled_task(struct task_struct *p, int flags)
>  	WARN_ON_ONCE(p->se.on_rq);
>  	list_del_init(&p->throttle_node);
>  
> -	/* task blocked after throttled */
> -	if (flags & DEQUEUE_SLEEP) {
> +	/* Task blocked after throttling or is leaving the fair class. */
> +	if (flags & (DEQUEUE_SLEEP | DEQUEUE_CLASS)) {
>  		p->throttled = false;
>  		return;
>  	}
> -- 
> 2.55.0
