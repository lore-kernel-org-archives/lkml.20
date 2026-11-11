Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357034;
	b=xUo8I9K4CMhSXnakjxmVgsGCE2OFMj0APsTqSFP/U0rlMjXjabwGc+XIH9OohneYYbzQ
	 E79lQ896ldZ6bhFk1JpXrC9e5+lKt7VdinMnYzTr6pKSfsiQGYNDLuoVNG2XplSxQVxW0
	 X6ihluFFPKLrk/26nocRQJZ2y0Hf4V/ANj+3h5mo9I2RYDnS9YLfDRMDNikbkoe2uxg/j
	 u56H/tkVJkyOuAQGt1m0D3MEsMo/j+5jgPMmkRCx/fH1o68vsPWMWbmdz4zkZ83BxmcUu
	 gOGRk3suAXz8+R7yyJ5/ioROBGQRvl+L3yuNNbqYe6r9telWB2iPGQEBJARMHIVPrHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357034;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=fyP5v1CTPlYJWxNH1PTy4DE4jhImB/4+OPJ6P+f3TxM=;
	b=twchTN3gtnmCPNi7KNAu2ANIpDWDSHuyWgJQZ93l84VRVd5WnJsGfsdtAte6Yo75UBKt
	 YOqkCB/AxbrJEFy5958oeD/BHsdkY2ov9DmL8UXNy/yq0m7diGyNQmI42izPjOr1Z/I7z
	 pO5+wlGI597JIrehiZWVBr5Sq7E5sMpZIAsQX2tEG0aR/C8zZXHEWZbHxhDl6JFfkhh4e
	 nCYxlPY0ir4P8ovFzAq3o1Y2z4P1OLwQh1vetL5CE4NZcPJLFDcUrOf3vtDQv4mmqEpUG
	 x1tJhxlrLl6xQThV08nlau06ZRRtinHuTp7/ToYJnGhxehmexKYykJbWUXqWzKwNqrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ecd50wAD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63405606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ecd50wAD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152351F0089F;
	Wed, 11 Nov 2026 00:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794357034;
	bh=fyP5v1CTPlYJWxNH1PTy4DE4jhImB/4+OPJ6P+f3TxM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Ecd50wADDSrFFXq7DHyX4Y6TAjgEfKTM/oZxdBAE/YXui7ZYgvaqRuCkO3p2v1fbL
	 0sey6GL681Q1TXZbnpWnAbL9CWsep+gvdDGtodjVeUK9Bzd4b/a4Fx9cHxhBaJ00eE
	 nWktA5RUIiiTDFFhG0KthhO0Gz88hwsSJywR8bio92sde39/tyo4yk0nEg7RnZbREp
	 gXZ49LmIfhm1u8XP9WbPxl8OPXbKBI+2w0QQkfiuD4LJwIZmvoiTVty1kiqaPRjCW8
	 c39mKt3gwOMpDH3S2NlqafMQgkcJyYAXUuA9DY4kZvAf13DRD/9OLuqI9NGHG2fR6R
	 3QDNUZGcnarag==
Date: Tue, 10 Nov 2026 14:30:33 -1000
Message-ID: <69d54f4e77e99f41ea0fb22b7381a522@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 01/12] sched/core: Fix pick_next_task() self recursion
In-Reply-To: <20261107120206.744550421@infradead.org>
References: <20261107115913.261163891@infradead.org> <20261107120206.744550421@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello, Peter.

On Sat, Nov 07, 2026 at 12:59:14PM +0100, Peter Zijlstra wrote:
> Since RETRY_TASK is only possible when a higher priority task gets enqueued
> during the lock break, this must mean core_task_seq will also be incremented
> and is thus completely covered by the seq number mismatch.

This doesn't hold for sched_ext, which returns RETRY_TASK whenever
dispatch released the rq lock, e.g. ops.dispatch() inserting a task into
a remote CPU's local DSQ, with no enqueue or dequeue on this core.

[ ... ]

>  		if (!next->core_cookie) {
> +			/*
> +			 * pick_task() can drop the core rq lock through
> +			 * newidle balance. If a sibling established a
> +			 * core-wide cookie while the lock was dropped, the
> +			 * uncookied no-sync fast path is no longer valid.
> +			 */
> +			if (unlikely(rq->core->core_cookie))
> +				goto restart;
> +
>  			rq->core_pick = NULL;
>  			rq->core_dl_server = NULL;

This only catches a sibling selection which has already committed. One
still in flight has reset core_cookie to 0 and may have set this CPU's
core_pick, which the fast path then clears without changing
core_task_seq. It needs three or more SMT siblings (e.g. POWER), so it
isn't a common case:

1. CPU2 is in the fast path and drops the lock in newidle.
2. CPU1 starts a core-wide selection: bumps core_task_seq, resets
   core_cookie, sets rq2->core_pick and drops the lock in
   pick_task(rq3).
3. CPU2 retakes the lock, sees core_cookie == 0, clears rq2->core_pick
   and commits.
4. CPU1 retakes the lock, passes the seq check and hands the NULL
   rq2->core_pick to cookie_equals().

This becomes reachable with 10/12 ("sched/fair: Reflow pick_task_fair()
/ newidle"), where pick_task_fair() can drop the lock in newidle without
returning RETRY_TASK, and reliably oopses in __schedule() on an SMT4 VM.

One way could be bumping core_task_seq when the fast path commits after
the seq moved, so that the in-flight selection restarts. Another would
be testing seq != core_task_seq instead of core_cookie, at the cost of
restarting on any enqueue or dequeue during the lock break.

[ ... ]

>  		p = pick_task(rq_i, rf);
> -		if (unlikely(p == RETRY_TASK)) {
> +		if (unlikely(seq != rq->core->core_task_seq ||
> +			     WARN_ON_ONCE(p == RETRY_TASK))) {

As sched_ext can return RETRY_TASK with core_task_seq unchanged, this
triggers reliably with a BPF scheduler running cookied tasks. The
restart is still correct. Can the WARN_ON_ONCE() be dropped? The plain
RETRY_TASK test is still needed as the seq can match.

Thanks.

--
tejun
