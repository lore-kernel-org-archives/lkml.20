Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A3C4C2247
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215901; cv=none; b=tVmjxC+VcpVcuTfp2q9qSq5TVRNuGMNcDil8lv3o++CWjnUo2evBwkvtbVaYLbRUGCse0JfswRFdB26K3br3zN/xeELOqmeAqQaKgmx8qa6omMjfQVwrG9/TBYL47tRx/ncB00cFR2+gJ8aOR8EtTgH7IhQwbZKUA5SXC+gYovE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215901; c=relaxed/simple;
	bh=NREAtkckTJS7Rgm5WxX0oAn2XgDJTjfslmcI/YdSoG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JynPi2+wE56PT+V5edYdlBhoeGMMBe0gwPuZ280Lbd4EKPg9eI0nDGfXiKQOCSMatvHuvXayB144YEottbivPCrO4VGWlYKcueot+CD6r0nw5rnm29v9RgJvnLX65ssLJkIVW/FBquS/l/pEo4jkTpTAF30TxmHZh0LWuVXSsKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r+KLJbLS; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+KLJbLS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b93204449so1008665e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791215898; x=1791820698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHGq165bL6ZkwlwLwwziFcNqAcI7e1VaujqMV2T4VM8=;
        b=r+KLJbLSmKagbw5fS6kftdbby7C4IKtVO+L58OTUPAtoCwwbu7u5TvaCn9u7+8salQ
         DdtdH6ou6VVsLKTMjI9Xmqvl8rY1MTIgYSk0jyyl8LXbXDD4OuZh1xFAhA3mdm/hUluh
         5CJbX6eYkCBvihY+g6GSjZrPOBBowz7ykxqO6++qAzTosxw3vzHkuagCZM4w+a2cmce1
         HEOxKkVi/+kcq+GCwVHqw6qnPL3hRnBT0R004Lw/Uq2gXOYacNUbh2eez+KaX8Awuy0B
         TBU/52o52CmbzriRpS8SdGBuAcFMqPRFto+uHOXvdsrlKQA3kSasHElRRsV4S0KdZgYk
         QDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791215898; x=1791820698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oHGq165bL6ZkwlwLwwziFcNqAcI7e1VaujqMV2T4VM8=;
        b=R/lKubIUUS3gFKqIiTxC1TRzhgoEhU4KZ7BB7/Pdqj0g9jf5VDMFAAAne9VCKZrB6L
         MninJglobtYUunF9JnJ69+rjdhFuUowmDh5jPP4t6M8NFeC8N/DmLalWQX2nK9Yagw3Z
         cwaoRFZCBgFRM7RB3OJwPV5PtOB8BywLcrxvPQ/2AXM+rl+cKZWqyi0WAQLvGjuiU5AQ
         35ziIqdyn4SIo8XvgBE+vG/ff0tLM5iyJDW3c9W8ZPgd/pY/GjA//sBzMqUUcSOEooZ7
         EYWbWXENIDQ9WQNV3hC4l9oL9p3sBc+Yxax404gDCOPJr7YPQHsKtxFKnszMyHw7kOaL
         +JMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbFt3gKi7+6FQ1Uc4BY9nGxaQeZA/B8CDeE+2Bl/MTGmB2uUfYttZW8/J+rahMw2K0xqGPmxWRqCzGcyo=@vger.kernel.org
X-Gm-Message-State: AFuF++mfh46DTGO/TIIB9f+9SxY5QmJWxpTYk26qvqujZIdFJ7+zURHK
	RUO9MjuGMWfwPt339LuGPTaOR+aTgN1APOU1Z2rucowwk7gGZ3XokXSL
X-Gm-Gg: AYBFou2k4cI1K1+Tp+cfwYKUyX6OwY1H+aSpqSNQXRih07Jkvg3mJWx2USEb+ixNPo2
	QK1eJPbl5c96iTasWJnBd+XX2mGzLcQS/SUq2FIeDJrnSBLgd6Mu4X9P8wcaEeeBpDgLcf9/vhB
	e/glDY4Sg6AU2ATe5clZltQWFRfzMA6WTH0P679kH14FLHiIFIa0kiK5h1f4q1KCXWqplz2oRiZ
	sWSbZUwvTZWWkGG///zxuA2mAvBXI15oQ8LAvYaPnKXDcV8LtB0zzfFtARY7AlRo3tepQwK62dD
	MA+j81uN4ZlmPLC/vZcImxyzS5QnFZ5ad0Wqij2fJkLlmgJttc1VN/dGtYTTop0NWwaxDMFfNFb
	WgYQIyZyUSq2VchFev0QrENfVnSIdiiGJUiObYxMqebqvTUBRrPFIOc/mE2trZfG4ankoHJNBke
	XD3d8xTwl0mS++Yev5tpZelr/8lI+ovJyI3scX2xx5n+ePbfQquGzxhbBsO6FhFA9Ou0+Tv3isn
	xEidfbgjFQdEyeqpAyQB+2K2VCnRCc=
X-Received: by 2002:a05:600c:6217:b0:4a0:1e9f:64f6 with SMTP id 5b1f17b1804b1-4a027454f31mr164261805e9.0.1791215897683;
        Mon, 05 Oct 2026 08:58:17 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1787e7792sm1644085e9.0.2026.10.05.08.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:58:17 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: vincent.guittot@linaro.org
Cc: arighi@nvidia.com,
	bsegall@google.com,
	changwoo@igalia.com,
	christian.loehle@arm.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	lukasz.luba@arm.com,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	pierre.gondois@arm.com,
	qyousef@layalina.io,
	rafael@kernel.org,
	rostedt@goodmis.org,
	sched-ext@lists.linux.dev,
	sshegde@linux.ibm.com,
	tj@kernel.org,
	void@manifault.com,
	vschneid@redhat.com
Subject: Re: [PATCH 04/18 v2] sched/eevdf: Compare min slice during wake_affine
Date: Mon,  5 Oct 2026 18:58:13 +0300
Message-ID: <20261005155813.25126-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002154415.2270586-5-vincent.guittot@linaro.org>
References: <20261002154415.2270586-5-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Add a new level in wake affine where we check on which CPU the task
> would most probably run 1st between this and prev CPUs.

> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>


> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index ad72b8536d6c..eeac0aaba3cd 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8422,6 +8422,9 @@ static int wake_wide(struct task_struct *p)
>   * wake_affine_idle() - only considers 'now', it check if the waking CPU is
>   *			cache-affine and is (or	will be) idle.
>   *
> + * wake_affine_slice() - only considers 'now', it check if the waking CPU can
> + *			 be preempted becaus using longerslice.
> + *
>   * wake_affine_weight() - considers the weight to reflect the average
>   *			  scheduling latency of the CPUs. This seems to work
>   *			  for the overloaded case.
> 

Nice. A typo. 'becaus'. 'be' wanted to be part of Santa Claus instead of 'cause'.


> +static int
> +wake_affine_slice(struct task_struct *p, int this_cpu, int prev_cpu)
> +{
> +	struct sched_entity *se = &p->se;
> +
> +	if (se->slice < get_rq_min_slice(cpu_rq(prev_cpu)))
> +		return prev_cpu;
> +
> +	if (se->slice < get_rq_min_slice(cpu_rq(this_cpu)))
> +		return this_cpu;
> +
> +	return nr_cpumask_bits;
> +}
> +
>  static int
>  wake_affine_weight(struct sched_domain *sd, struct task_struct *p,
>  		   int this_cpu, int prev_cpu, int sync)
> @@ -8508,6 +8525,9 @@ static int wake_affine(struct sched_domain *sd, struct task_struct *p,
>  	if (sched_feat(WA_IDLE))
>  		target = wake_affine_idle(this_cpu, prev_cpu, sync);
>  
> +	if (sched_feat(PREEMPT_SHORT) && target == nr_cpumask_bits)
> +		target = wake_affine_slice(p, this_cpu, prev_cpu);
> +
> 	if (sched_feat(WA_WEIGHT) && target == nr_cpumask_bits)
> 		target = wake_affine_weight(sd, p, this_cpu, prev_cpu, sync);
>

Also,

Scene (Why I always start like this? Answer is... IDK neither. :>):

CPU0 has an RT task running named TA, and CPU1 has a fair task running
named TB that has 100 ms slice.

cfs_rq_min_slice() looks only to rq's cfs_rq skipping others like dl
and rt. The value that's coming from cfs_rq_min_slice() is then checked if it
equals to the currently saved value.

So if the cfs_rq is empty, cfs_rq_min_slice() just returns the starting value of min,
that is ~0ULL. And we write this.

In the case of CPU0 and CPU1 the behavior will change whenether or not which one
of these is prev or this CPU. If CPU0 is prev it will be chosen, if not CPU1 will.

IDK if this is tolerated tho. But shouldn't this be changed?

Or Am I getting something wrong?

(To y'all that are currently attending to LPC, enjoy! I'm sadly only enjoying my room.)

Thanks,
Kayra :>


