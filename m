Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192672;
	b=eTn9utGWhuuMKkEepPLJGKZmSZHFt5BUjHxM2hQx127edANDbJtkrT6no4Dyw3ILe0up
	 ODPgEyFWSghtaxcZj2Lr+I6QfMZIXU9bjtF0oqd6AziGfbf0X+nrxovjzft1mY8nzfuVT
	 jkL/8+Q4MrTI92kLtH9z/3lng4QaO7K7Aitv8aSTsixnUC4BCCxDfj6schT9RaqewATYC
	 CMH0+vHMbhN8Jf9HD9O5NUNaBr49+TFFpsrOJzOh7XxzYO2dYTuux9ZQ2jDwBs1OE6e0Y
	 10VDa0Uy7FvHf84ZlysQwLuRHIe4pXIOrIJYOtkrSbi3ZactX1xeI95z2truaoSYAQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192672;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aDtGXIe1LLstEZvUiRQX6VvektKTmjPDoJ5A3cyJTHY=;
	b=jIbGhJvYReK67sdaoBnm3pfOnBqp6XhUDoXrTwvIpdgjaZvR195x0V1wiFuvM26VkQ6i
	 yC25kwQym+60MlHt3rP8ev+J2seUVRADcalJsN9XA0XwTGkHB8wtC8K2AJ6x83gCMcu3d
	 pSAmyw54X1/DLa8an8aYOKSQLTDz/6UtEPW34zq7djSKD9c0/ytvXWiyt1LJHnh/4Y76W
	 lYGw/biMpc7lBrYsYjWFlRTQLY3PlBp4b2fQboObeu1l+DkB2o2udwhkDjpGWa0PGEGHw
	 IrQUhAD7B4A2YJjGlwmw0er1Z21bfsUmapPoKa3sPiH0b5773Wu6XZ/XNJO4IaIwMqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.124
Received: from out28-124.mail.aliyun.com (out28-124.mail.aliyun.com [115.124.28.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A61B606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A61B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08675164|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0894451-0.00145138-0.909104;FP=1425205512821779675|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083099174;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.jzgzWRR_1794192659;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jzgzWRR_1794192659 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 10:51:00 +0800
Subject: Re: [PATCH v2] sched/fair: Distribute burst-woken tasks when rq depth
 reaches 3x average
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org
References: <20261106062623.278004-1-likunyu@open-hieco.net>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <0808a491-3fcf-4dc7-28c1-82062e4e4040@open-hieco.net>
Date: Mon, 9 Nov 2026 10:51:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261106062623.278004-1-likunyu@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 2026/11/6 14:26, Li kunyu wrote:
> +/*
> + * Check if a CPU's rq depth reaches the 3x system-wide average threshold
> + * cached in root_domain (floored at 3 tasks).
> + */
> +static inline bool rq_burst_overloaded(struct rq *rq)
> +{
> +	if (unlikely(!rq->rd))
> +		return false;
> +
> +	return READ_ONCE(rq->nr_running) >= READ_ONCE(rq->rd->overload_nr_threshold);
> +}

After multiple rounds of testing, certain optimizations in this patch caused
performance regressions under specific workloads. I have fixed these issues in
v3, and after comprehensive testing confirmed satisfactory results, v3 will be
released.

> +static inline void reset_periodic_lb_interval(int cpu)
> +{
> +	struct sched_domain *sd;
> +	unsigned long next = jiffies + 1;
> +	struct rq *rq = cpu_rq(cpu);
> +
> +	if (time_after(READ_ONCE(rq->next_balance), next))
> +		WRITE_ONCE(rq->next_balance, next);
> +
> +	for_each_domain(cpu, sd) {
> +		if (READ_ONCE(sd->balance_interval) > sd->min_interval)
> +			WRITE_ONCE(sd->balance_interval, sd->min_interval);
> +	}
> +}

READ_ONCE and WRITE_ONCE have been removed from the two hotspots function above
to avoid excessive overhead.

>  /*
>   * select_task_rq_fair: Select target runqueue for the waking task in domains
>   * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,
> @@ -9920,6 +9947,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  	int want_affine = 0;
>  	/* SD_flags and WF_flags share the first nibble */
>  	int sd_flag = wake_flags & 0xF;
> +	struct rq *target_rq;
> 
>  
>  	/*
>  	 * required for stable ->cpus_allowed
> @@ -9942,6 +9970,17 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  		want_affine = !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr);
>  	}
>  
> +	target_rq = want_affine ? this_rq() : cpu_rq(prev_cpu);
> +	if (unlikely(rq_burst_overloaded(target_rq))) {
> +		int dist_cpu = cpumask_any_and_distribute(p->cpus_ptr, cpu_active_mask);
> +
> +		if (likely(dist_cpu < nr_cpumask_bits && cpu_rq(dist_cpu)->nr_running <
> +			   target_rq->nr_running)) {
> +			reset_periodic_lb_interval(dist_cpu);
> +			return dist_cpu;
> +		}
> +	}
> +

Move the CPU overload checking code to the end of the function to avoid jitter.
Invoke it only when no more suitable CPU can be selected; doing so yields a
stable improvement, with relatively balanced task distribution and overall CPU
usage.

-- 
thanks,
kunyu
