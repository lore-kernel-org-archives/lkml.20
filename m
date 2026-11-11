Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395923;
	b=C2bJHfIzSy/iuDCcEe0LVFSW4q5pIi8z584RlDvcMBoj9Yu+hE+xIbZFqtrXi28mXZLz
	 ZuiFsRqrgeIfMdxGgJJus1Sm50nq+Rxq+84iTdDjVIu5ZqEToRgT2ozYF2785qndLortw
	 iza3R7M5NjVf2jU4TpZgscHKrYz6eiGS7qOoD38T5+Kk+F/xVtjJmfSVxtkY5y2SUBtUM
	 OTKy81XgMapksayggJrG3hWLlq3ZldFNxdJ+1oDdcojBfUD1lyjWjXtRMAzyswR5qKUpK
	 t4qKOIl6Zr1HZjkGTMNubHPsR26xPZyJbCm0VC2zMo7tjPZIL094djQeVsG5+Iuc3oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395923;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gbb5/JrvocffQuZSaZam6/3YrXzZsMmpr77C9zCyhqA=;
	b=Nox4jg1N2F/Xf4wFAAX52eARvYC6Yu0DHM+GUttle83/jWxT1YTMSeY4wvGFMIOtpNS1
	 JY8hD3dFBv08IESbosRaItLqj79pkb0mFc9MTakbjJ3WREE1VbKKT5sL87FGGt2WFKkvR
	 Gp8Tyjk+AdGsAMnmX9g+9JbShvL1L4CgH9bjk6HZFgkNfVGxo9giOsjLJ95ppYMSFLGlm
	 Rmn3MReWdUkCbuONn7yoRWEemy8HQFNhwatow/4NFNbxAjw1r6tfKcaov37vntepzrCDO
	 f6gwFs3iSImCHKubYkrELrvnLl9nhYqEPCjPa3S2w+dwypqhowFbNvVqBuFUDbbWprA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mxen09gE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A24B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mxen09gE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D5A1F00A05;
	Wed, 11 Nov 2026 11:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395923;
	bh=gbb5/JrvocffQuZSaZam6/3YrXzZsMmpr77C9zCyhqA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mxen09gE5XaD4VgrOvldmvy70LCI25w2vvwvVGJMhgZrmM0hxTeDgkwkBYWnxGuX5
	 eYXqN78265OXPLZ8k56vDssY7kWSrtflkhY9vkTmCuFtBXkrm376s9S4D3Di3T+eoD
	 p9yyb0eIaXLARayPYcdxMcNJ59/1BDbLGl+Bc7T3r5prrgTaZli+Ee0JvJ5CpGiFpb
	 KbM+vm7pqTduO0JnMVPi9g3Sc77z1qwWINpagYyzhb5bfGAlQFpMWeE4WKpMLoc9H/
	 Kh0pdALCeVe1+pZ2ohjkZNoLFGCk0LXJtFUutZWwMiSQ28Emvmhy2TleIMoSqkrMoS
	 Nwlkrr8SbVyZQ==
Date: Wed, 11 Nov 2026 01:18:42 -1000
Message-ID: <a98c40701cc874318e7fe475d90795c6@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 12/12] sched: Remove sched_class::balance()
In-Reply-To: <20261107120208.153536827@infradead.org>
References: <20261107115913.261163891@infradead.org> <20261107120208.153536827@infradead.org>
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

Hello,

On Sat, Nov 07, 2026 at 12:59:25PM +0100, Peter Zijlstra wrote:
>  static struct task_struct *pick_task_rt(struct rq *rq, struct rq_flags *rf)
>  {
> -	struct task_struct *p;
> +	rq_modified_begin(rq, &rt_sched_class);
> +	balance_rt(rq, rf);
> +	if (rq_modified_above(rq, &rt_sched_class))
> +		return RETRY_TASK;

This exposes an underlying problem on the DL side. rq->next_class is
raised only by wakeup_preempt(), but dl_server_start(), dl_task_timer()
and dl_server_timer() enqueue a DL entity and open-code resched_curr()
without going through it. prev_balance() ran before any class was
picked, so it didn't matter. Now, pick_task_dl() has already returned
NULL when balance_rt() drops the lock, and rq_modified_above() is the
only thing which can notice a DL entity queued in the meantime:

  CPU0 RT task blocks, pick_task_dl() returns NULL
       pick_task_rt(), balance_rt() drops the rq lock
  CPU1 wakes a fair task onto CPU0, dl_server_start()
  CPU0 relocks, rq_modified_above() is false
       picks an RT task with the fair server queued

resched_curr() doesn't help as __schedule() clears it on prev after the
pick. I can trigger this with NO_RT_PUSH_IPI and a delay added in the
lock drop. With RT_PUSH_IPI, pull_rt_task() doesn't drop the lock.

Maybe the DL sites should raise rq->next_class where they enqueue and
resched, so that they behave the same as regular wakeups?

Thanks.

--
tejun
