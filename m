Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214351;
	b=2jMxvVL1LmpNTRwcG49bvpS+CVMcBqUAHMNsSpEcb26FnnmqLxNJijpNmByLJnJXb0K/
	 b66Qq0pEB7h397rJ9rskrzn5v35fBjxieqpYrxv5iXkAjtZZNJJfLs++t5aEc6E5uF7tp
	 37y2JgKrxOdRORFTOBqUJjgaNGBsAfH8j6tU6yf3MEOLABHzcpxzt2rcVk/tZjAkdrTrt
	 nc9W5uITj6jDI9WJPpbWVQrtlu5O9eNO68rs2+JZgg66q1yzUWw613rugF8gZFUUbgrxr
	 Gput5YqR/GnYq9kIF9rJU2LfkWkfEr0Zh4+Ex6OtmHsaXeNM51b+QwHsV+26i/skE/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214351;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7B/8YJJddP/By+iJgf5CUvPuwjkprDwdi3JWiutrN2w=;
	b=fCGyCfUVfknKv+3OWOGgcuislCQeLSQjbUckhIoP15eKT2sRtFGgQ2C9SGGAXRP91pOy
	 /6OgJJNGu0GzFxym70N78v8kvt9m3Bhh+wedvQV5DQokjoYJexlPFjPWoPzUqB5+iYJyE
	 0iS8iWa5A46NxxRUpPd1SWYboQTjbdtqWGljYIcht+CQblV2s14oCocEBkdC6x38Z69+1
	 TVDFg9i8UuNQm1w+5wkpjeNkVGmyaHZ02PHRu0xlmATvpcJ/w8mHiJYhWkTycCWTLsZ5y
	 0Mpnjbl9KvpJHmIonnHw/wWFyARQKa4qR/usPKxrfrskdWZXXS6Hd+DZjzU1CXjFj4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.146
Received: from out28-146.mail.aliyun.com (out28-146.mail.aliyun.com [115.124.28.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF4C606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF4C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1160336|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.24464-0.00299978-0.75236;FP=3732737311770812575|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034184;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.k-5ALSc_1794214340;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.k-5ALSc_1794214340 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 16:52:21 +0800
Subject: Re: [PATCH v3] sched/fair: Distribute burst-woken tasks when rq depth
 reaches 3x average
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org
References: <20261109083530.328796-1-likunyu@open-hieco.net>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <56803cce-a01f-8234-ff33-59b0616c6eb1@open-hieco.net>
Date: Mon, 9 Nov 2026 16:52:23 +0800
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
In-Reply-To: <20261109083530.328796-1-likunyu@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 2026/11/9 16:35, Li kunyu wrote:
> +/*
> + * Check if a CPU's rq depth reaches the 3x system-wide average threshold
> + * cached in root_domain (floored at 3 tasks).
> + */
> +static inline bool rq_burst_overloaded(int cpu)
> +{
> +	struct rq *rq = cpu_rq(cpu);
> +
> +	if (unlikely(!rq->rd))
> +		return false;
> +
> +	/* Directly compare the values to avoid excessive costs. */
> +	return rq->nr_running >= rq->rd->overload_nr_threshold;
> +}

This patch compares two forms of the condition:
return rq->nr_running >= rq->rd->overload_nr_threshold;
and
return rq->nr_running >= READ_ONCE(rq->rd->overload_nr_threshold);.
The results show that the READ_ONCE form led to an overall regression of over
3%, and its gains in tests such as stream100 were not significant.

> +static inline void reset_periodic_lb_interval(int cpu)
> +{
> +	struct sched_domain *sd;
> +	unsigned long next = jiffies + 1;
> +	struct rq *rq = cpu_rq(cpu);
> +
> +	if (time_after(rq->next_balance, next))
> +		rq->next_balance = next;
> +
> +	for_each_domain(cpu, sd) {
> +		if (sd->balance_interval > sd->min_interval)
> +			sd->balance_interval = sd->min_interval;
> +	}
> +}

Verification showed highly satisfactory results: performance improved in the
vast majority of tests. The test comparison is provided below:


type            pct
hackbench	+9.26%
tbench	        +9.71%
schbench 99th	-1.33%
stream-10	+6.36%
stream-100	+51.50%
unixbench	-0.89%
overall average	+12.44%


hackbench:
group   base    patch   pct
-g 1	0.2304	0.2276	+1.22%
-g 2	0.2758	0.3046	-10.44%
-g 4	0.3966	0.3540	+10.74%
-g 8	0.5548	0.4654	+16.11%
-g 16	0.8486	0.6946	+18.15%
-g 32	1.4126	1.1568	+18.11%
-g 64	2.5856	2.2542	+12.82%
-g 128	4.4390	4.1106	+7.40%


tbench(throughput):
clients   base          patch           pct
1	485.38	        472.76	        -2.60%
2	811.84	        795.97	        -1.95%
4	1319.69	        1495.91	        +13.35%
8	2233.84	        2306.09	        +3.23%
16	4274.34	        4658.40	        +8.98%
32	9101.24	        9277.60	        +1.94%
64	15915.37	16457.03	+3.40%
128	27476.97	23987.13	-12.70%
256	30459.23	44844.93	+47.23%
512	39785.47	45808.43	+15.14%
1024	39214.60	51276.10	+30.76%


schbench(99th):
threads base    patch   pct
1	13.4	14.2	-5.97%
2	16.0	16.4	-2.50%
4	21.8	22.4	-2.75%
8	34.2	34.8	-1.75%
16	53.0	52.8	+0.38%
32	90.8	91.2	-0.44%
64	206.2	206.6	-0.19%
128	4568.0	4660.8	-2.03%
256	7915.2	7800.0	+1.46%
512	11382.4	11324.8	+0.51%


stream-10:
operation base          patch           pct
Copy	135092.48	152646.20	+12.99%
Scale	147163.94	138799.66	-5.68%
Add	160465.16	175134.26	+9.14%
Triad	161968.50	176503.22	+8.97%


stream-100:
operation base          patch           pct
Copy	135501.48	251967.60	+85.95%
Scale	146273.42	219529.52	+50.08%
Add	161264.04	215075.54	+33.37%
Triad	157809.52	215536.66	+36.58%


unixbench:
cpu     base      patch         pct
1       1805.8	  1762.0	-2.43%
384 	119849.8  120644.5	+0.66%


-- 
thanks,
kunyu
