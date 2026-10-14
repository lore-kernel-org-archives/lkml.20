Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0328855294B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996921; cv=none; b=lApwwczHAWTXGwwYq9U92X15SguxOHTZ78kgJbgr0RnlRKGFKTtLyQbXOJXmDNfM6ryMxAUIjybybfkTZ2xvHHAsrRQdsyKtySM1LXqQw7jMtR+zjjdi0jJugBb/C6+ZwoUaamFicDHxzmCB5TBt4ACcSpTzZE5WPE7bGl0ClV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996921; c=relaxed/simple;
	bh=DGDUe8UlKm0pO73l+RcfFlhtfGoouGXVYMbcq/3jJgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YPTMnUwGsSV6rYpK5WqLIZo6vuwculG+QKttG1umPhPNm/82PwNUuUHrhWTQi5MokqgQpzqYVlMdSYXORApJkSUu9UtPFXS/6jtN+AD54ZADlDbCx15On6q9bo5fMBpY/UE7ZVXTV8PfTbvcWZLjv1n+Q9z0tHx0/utZ6c2MIns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvxqxzCQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvxqxzCQ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b10e28b95so375574f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996918; x=1792601718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pRaMD7sl4vWkCAdq9lkZ+wTKNo8sjKodhQHexyfoSo=;
        b=PvxqxzCQeld+cNMt0yv7ha5414Apv03sEb7NKsj0W154LkdOWea40lsJ6vGzNHjGnw
         0fyRpwt2pXYKoCpPjRbzXQ4leEtxY9HAd6bY3L0khrWAj1hbYalzuDgR2KzMmHzFfWp6
         Mp/Fges6rbQ5pLWqU+6aKIIqVdXZ6RLCHPkUauPg44ejud4NaGRxzJ4U2vc71IY3yJ68
         VnVk5s0Nai81e8kgez4wn5g4CsH5oFd7+zDPNN68cVx2oOx5H82N1OzfPMuT80Fpx1tF
         7l3/3pexps8l5namvINbse8VEoXIZqzcH8JPy0R2dg8qFAHn3iLf4PA+A4yYwEsROxzP
         2exQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996918; x=1792601718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pRaMD7sl4vWkCAdq9lkZ+wTKNo8sjKodhQHexyfoSo=;
        b=crS51sRHSw6/pIFz/+YkMsgSft67w8lW8OXY56CHXWB7zoURCi90YDzNo4pBZv5Dty
         lpVVxu0GgLiuxfqPK4d94GitPaPVTOGeuBbLUm31Y6F7iesbWNqc80m5RwIW/I1chd+R
         /IXjryHQyyFwIafRcnRzTGQyvn0ivYLW/xvOyBC+WqqRgbEhNvrpEtND36ksbY5fVZ+C
         pb07jdU/2677jfh2NVH4qWMTkBU84Y4HgNNMozwGc4Z1nCxQFNoPq6vYunruL95AD3er
         9D1OpW8FSq1sx40l5l8qUXyAvO4iS+OKeYYU2v8EG4YuP5TG3P+QgeaytCEuAh2/m6W/
         uLGg==
X-Forwarded-Encrypted: i=1; AKwUvBzhEgUYfb0y/pj3nlJt04krTWt6GRw7NN4tEFc2TKEZyOBZfA75jLjb5wamdgejLwPH7NYys0lXIB+zOB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzba+v95SsEzywhQehrn7NDiMu9XdamPOv2mBnhKpeoW9pK/Cu
	f66EDaNO8dEzIiMSpdZYwHKB8u80dBDr+SmWEp3iijoL9gm4SKpZ+6ek
X-Gm-Gg: AYBFou1S20yI6D2YDU+3zb/fR9/xlzzUV0+ft0rwnaowPUo87aJAkcCqHmuaIan4rTH
	gjoJ8UaJPugPG56POeSfQSUrIHeJHNiP/j7WAW1T6FhGHNW7pafekzXJX2Vau1KHgdhRogeiSfB
	JO/0Sp9pOs2fSD+647ML8rY2OCCw59CsOOgR06WQoJ2x9tkBuS7f0G3GHrJeB53/nNLNWhGzV1X
	PvaKpfkzC3IYEz2NJe64e+JULJTc4LaGy+I1C6YYdbiNcHDKBC9EcGhDEjE0GOIRY+kqfEWKr4Z
	tiZaDoNG8A9cEcH58IGiDgvCWq+7d3l8ywYX/5bgVO/U9TjUf3OHNOcdFTnnL2nCCa4ssF3m00M
	Fm5ttl6Mkyums/buvUe7E76xdTQi7IR8KGj9oYpaKg2X/jLTIYskAOwEdoZK5WRNRl/416BQlrw
	1egfpY7ZnN7Rtt2kWDwBaLEtjfSp0wg5DNQiz2DxnkVK0N0QFgOdPxhkNwBfcnAHNNAlkLsMOXT
	a3soWmJJawMP68YB6nnBw==
X-Received: by 2002:a05:600c:1e0f:b0:4a1:8469:e6c8 with SMTP id 5b1f17b1804b1-4a18e46f48fmr336600435e9.1.1791996917809;
        Wed, 14 Oct 2026 09:55:17 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm3606965e9.11.2026.10.14.09.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:55:17 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: christian.loehle@arm.com
Cc: bsingharora@gmail.com,
	dietmar.eggemann@arm.com,
	joshs@netflix.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	zhanxusheng1024@gmail.com,
	zhanxusheng@xiaomi.com,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: Re: [PATCH] sched: Account blkio delay independently of delayed dequeue
Date: Wed, 14 Oct 2026 19:55:13 +0300
Message-ID: <20261014165513.31582-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <4ce12bff-9532-4b27-98f2-a807bbccfaf7@arm.com>
References: <4ce12bff-9532-4b27-98f2-a807bbccfaf7@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Christian,

> Starting blkio delay accounting in __block_task() ties the interval to
> removal from the runqueue. With EEVDF delayed dequeue, this misses the
> initial part of an I/O sleep, or the entire sleep if the task wakes
> before it is dequeued. Final dequeue can also run in another task's
> context, causing delayacct_blkio_start() to timestamp the wrong task.

> Start accounting in try_to_block_task(), when the current task commits
> to blocking, before delayed dequeue or proxy execution can retain it on
> the runqueue. End accounting when clearing is_blocked, including queued
> wakeups and the proxy execution paths that let the current task continue.

> Reported-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> Closes: https://lore.kernel.org/r/20261014081731.1068794-1-zhanxusheng@xiaomi.com
> Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>

Aha. Again one of these Proxy Exec. &  Delayed Dequeue dou causing issue type of issue.

> @@ -636,7 +636,7 @@ int task_llc(const struct task_struct *p)
>   *
>   * p->is_blocked <- { 0, 1 }:
>   *
> - *   is set by try_to_block_task() and cleared by ttwu_do_wakeup() and tracks
> + *   is set by try_to_block_task() and cleared by unblock_task() and tracks
>   *   if the task is blocked. Traditionally this would mirror p->on_rq, however
>   *   due things like DELAY_DEQUEUE and PROXY_EXEC, this can diverge.
>   *

Nice...

> @@ -3737,12 +3737,20 @@ ttwu_stat(struct task_struct *p, int cpu, int wake_flags)
>  		__schedstat_inc(p->stats.nr_wakeups_sync);
>  }
>  
> +static inline void unblock_task(struct task_struct *p)
> +{
> +	if (p->is_blocked && p->in_iowait)
> +		delayacct_blkio_end(p);
> +
> +	p->is_blocked = 0;
> +}
> +

Hm. So if I'm understanding this correctly were trying to track the changes on is_blocked here, correct?
try_to_block_task() finally found his lost twin!

> static inline void ttwu_do_wakeup(struct task_struct *p)
>  {
> -	p->is_blocked = 0;
> +	unblock_task(p);
>  	WRITE_ONCE(p->__state, TASK_RUNNING);
>  	trace_sched_wakeup(p);
>  }
> @@ -3839,10 +3847,8 @@ ttwu_do_activate(struct rq *rq, struct task_struct *p, int wake_flags,
>  		en_flags |= ENQUEUE_RQ_SELECTED;
>  	if (wake_flags & WF_MIGRATED)
>  		en_flags |= ENQUEUE_MIGRATED;
> -	else if (p->in_iowait) {
> -		delayacct_blkio_end(p);
> +	else if (p->in_iowait)
>  		atomic_dec(&task_rq(p)->nr_iowait);
> -	}
>  
>  	activate_task(rq, p, en_flags);
>  	wakeup_preempt(rq, p, wake_flags);
> @@ -4415,10 +4421,8 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
>  
>  		cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
>  		if (task_cpu(p) != cpu) {
> -			if (p->in_iowait) {
> -				delayacct_blkio_end(p);
> +			if (p->in_iowait)
>  				atomic_dec(&task_rq(p)->nr_iowait);
> -			}
>  
>  			wake_flags |= WF_MIGRATED;
>  			psi_ttwu_dequeue(p);
> @@ -6762,6 +6766,9 @@ static bool try_to_block_task(struct rq *rq, struct task_struct *p,
>  
>  	p->is_blocked = 1;
>  
> +	if (p->in_iowait)
> +		delayacct_blkio_start();
> +
>  	/*
>  	 * We check should_block after signal_pending because we
>  	 * will want to wake the task in that case. But if
> @@ -6934,7 +6941,7 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>  		if (!mutex) {
>  			clear_task_blocked_on(p, mutex);
>  			if (task_current(rq, p)) {
> -				p->is_blocked = 0;
> +				unblock_task(p);
>  				return p;
>  			}
>  			goto deactivate;
> @@ -6970,7 +6977,7 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>  			 */
>  			__clear_task_blocked_on(p, NULL);
>  			if (task_current(rq, p)) {
> -				p->is_blocked = 0;
> +				unblock_task(p);
>  				return p;
>  			}
>  			goto deactivate;
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 4c25fbe84fb5..638c7709654a 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -3072,10 +3072,8 @@ static inline void __block_task(struct rq *rq, struct task_struct *p)
>  	if (p->sched_contributes_to_load)
>  		rq->nr_uninterruptible++;
>  
> -	if (p->in_iowait) {
> +	if (p->in_iowait)
>  		atomic_inc(&rq->nr_iowait);
> -		delayacct_blkio_start();
> -	}
>  
>  	ASSERT_EXCLUSIVE_WRITER(p->on_rq);
>  

Hmmmm.... HMMMMMMMM....

I mean, looks clean to me. The is_blocked status is followed correctly.
The only place its made 0 is only unblock_task(). And blocking is only on try_to_block_task().

Hope I'm not missing something...

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
















I have no work todo tomorrow, so I can review as many patches as I want.
But I guess no one cares, so I put this down here. As a joke too,
I need to do more jokes. To entertain our sched people.

Thanks,
Kayra




