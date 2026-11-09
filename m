Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237001;
	b=aYptLA32jN3bjiTm52vqD0U/CiDIOP5ZkfEPk6tPiUUqIiGueABJycmXK/AltJUYLzxo
	 r3q8xiakHa1bm4yeZXhMDwLmR4T5ZYkOgxePDQ98hYgZ/04d8reRSZlJIIj6HyQqHdGgk
	 4XUlZjFfAvZfSUA1iyetGtfPt7Hd6F/65InEOmguyIEFVrOkRkCbV3qD25WHt6MM+cAtD
	 Epa3DMfg9W+1AHHwPW0BI1/erAyPAY4O9UNzX0ULzQfhpyXvGUsSE64YiBWpbtTK9WrVE
	 /9rY70d+Dp1M2ic14F4EMH0DZMhYdNvYef4FIDnMF2QL6SoDbnQL+BIxdoZmqa/Uuzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lZQni7749kY6di5K85y+7kMNZ7RgyRVrDwfii0NID74=;
	b=zKQDxNYpCvSuHPzac/TkO+vKic28ghB1xg0lHvdxdIPZi0CNR3LbzNoqFNTCeRG9tfPX
	 nkLsmB9MaF1I7eVA6VnjfODOpbVfXptn8xE7ipHBYTnkV/dFsbscdSO7RXhrHkPzVjs73
	 Pe7qnhNWyoC36tOtqFcm+E3VDbl5enBztydXjejyWZq9LXSdmRSJ6FFwvKTI1CA36+6uY
	 bh/i7nWneWQzlwvY0vGao/fKVrHsVP/KlgVFfUpIMuo/11Ww8TSmBgXYs2I7jKFU2SYoR
	 VUyiqsH791LTB/BaBxUlRIFrfc8umejYEhT2DgcHspE4GbvpfJ1yDOgDNe82Eqk1m/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bJOPBrqP;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A830606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A830606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bJOPBrqP
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-496aa002966so24909f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794237000; x=1794841800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lZQni7749kY6di5K85y+7kMNZ7RgyRVrDwfii0NID74=;
        b=bJOPBrqPxgvh8unCpa6M/ONU+benRZ9sQ3lR+0vN+7Agp9Gkfb1f2hGrM1sSt8fqae
         44lOCT1YTDoJ3bvfvknd/pYunQGIyo41vwVtNNTdAywd+TaVf/Cl+xL9ITeMINs457XK
         HcmFmC+zRtuo5tL/uVSqa3JudeKQfK8jBl1bnrAdh16fuKLf45VywHmi0zc4Xwu2vBiT
         tUks2cgUhNCjuw1Oz9O006Tqmozdi5UIyRycugO+R6WtzDyC7lAQXRM5XJVfspMCOLZ0
         I6uOBL5Ik4On0F3VT+IPN6Gd2yIxwX4CS3q4bZuRUpUZ9ze1dIjWTeCol5IDOec2BkPJ
         wr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794237000; x=1794841800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZQni7749kY6di5K85y+7kMNZ7RgyRVrDwfii0NID74=;
        b=CZ5RBuU6o62sz222dr4z149qV4c1QVXavJCfvJYNfnrcLTloW85IJwImeQDFcDVXUH
         vQUnra8Z+9ZmnIzqKZBD8ciMfZUyr6v8TNCwi0iOoswYgRvxG7WVATvudX4OSOX5FtHj
         eTi2QtC1WYJMESXFk6HvCnAEuHAxDphP+Odp7rRHnj25kCUGab2stIqbKd4uU5yqghA2
         /5NiiWkENVgUSXrO1uU12Mu66gYEezjzX3+RxXzCdWg3UvLpaWi98JSeTspvuZqEmMKv
         aTRbv0A4cvD3gciYYzKm6+yvWlg+UveEKdXXOAomPxOAy/xhUCAuDf00KGeGiD9QtL6Z
         O1gA==
X-Forwarded-Encrypted: i=1; AL+hErG7ZBWypDMfrSft0GTNoyg5KfqOkEH0XRECeCgR4kTB3z6XvD2DbExR+Mm9iIMMhP8009HTKrLksrX6nV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AIBzDO6WYWqNJSJa5vgpxXmqLZKptHj06hyEArjnfvZlBeZuw
	RhqA9sDkE2SNwNwKuNkpXXDBICrfpN8qJLCAbEZsNBouryON7ILGa20D
X-Gm-Gg: AYBFou0CHB0INDpikey9/920rhE4YwOk/8xu+6oOg4rpE4zDNL9u2C7Rb2y12rf2fkF
	uGUpIOxQqSrtG5NRhyoqgrZGUA5tIO9jUaKUfuzCmAKJaQXdu7zu2vWYsqTbgXxZhxLQRwJyJkb
	Or4NUASV93e7yn1AJ7KJ7/c0IkXJNR5kROFUri3pyn3uxeVL1jjrbfxCGkzjZGxj7KJGTxNI//d
	raSOBnjQqzjX9B60umiD7TCikN64SBz6xt1wVcdIwrnryGM99iBfnWqZclVrOgSnUrdJAYW6jCo
	mU1LxXX4BvYJhFxGxpLriXeS3wG5rmeRkj2Lw5GQFaGSqZ0S2kfu3j9eAKi84pRaY45698f6RSP
	dIDNncjZQbz96IC2hptO54BI96uj0uyYEupkhYYoXcY0VHDK3KWVAKaF7v1+O1OOWsrm2Z6FUqv
	+dv7BePXUMEsZ9549VJDvQlQqWXhty3GjepqGqg1d/ize77uWgjI2AjlwheEZdRZryIO7WvrUZT
	5A93BvmpH8TECX7zhvtTcVNK39Opu/mDHEmo/Ih8YbOxOOL5ykMA7nkX0LmgVN23roZZCL9eSar
	SSR1iKDeSx8fTA6LbiUWQKNcUp157J11+7kvDSrilbqqKP2PDK3zCfTrsMBaFot7WocryQWGVWr
	d
X-Received: by 2002:a05:6000:290a:b0:48d:f4e6:7b2 with SMTP id ffacd0b85a97d-49583545a31mr8438110f8f.3.1794236999592;
        Mon, 09 Nov 2026 07:09:59 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597e005e6sm10111112f8f.56.2026.11.09.07.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:09:59 -0800 (PST)
Date: Mon, 9 Nov 2026 18:09:56 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ben Segall <bsegall@google.com>, Juri Lelli <juri.lelli@redhat.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Mel Gorman <mgorman@suse.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Valentin Schneider <vschneid@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH] sched/fair: Skip sched-domain traversal when wake affine
 is disabled
Message-ID: <avHZrLRHmIgRu-a7@scheduler.schedules>
References: <20261109120522.1704752-2-srikar@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261109120522.1704752-2-srikar@linux.ibm.com>


Hi!

On Mon, Nov 09, 2026 at 05:35:22PM +0530, Srikar Dronamraju wrote:
> In select_task_rq_fair(), TTWU wakeups for which wake_wide() returns
> true, or where the waking CPU is not in the task's allowed CPU mask,
> want_affine is set to false.
> 
> For these wakeups, the scheduler does not perform wake-affine placement.
> The existing code already treats this as a fast-path by exiting the
> sched-domain walk before locating an SD_BALANCE_WAKE domain, ultimately
> falling through to select_idle_sibling().

Not before locating. If it doesn't locates SD_BALANCE_WAKE in the first
check it just leaves.

AFAICT SD_BALANCE_WAKE is not set anywhere tho.

So if you wanna do this, maybe you can do something like:

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d4cc0caee626..b40b2eb5e577 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10016,6 +10016,9 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 		}
 
 		want_affine = !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr);
+
+		if (!want_affine)
+			return select_idle_sibling(p, prev_cpu, new_cpu);
 	}
 
 	for_each_domain(cpu, tmp) {

> 
> However, select_task_rq_fair() still enters the sched-domain traversal
> only to break out almost immediately. Avoid this unnecessary work by
> jumping directly to the existing fast path when want_affine is false.
> 
> As part of this cleanup:
> 
>   - Move want_affine into the WF_TTWU block where it is used.
>   - Skip the sched-domain traversal entirely when want_affine is false.
>   - Remove the now redundant want_affine test from the
>     SD_WAKE_AFFINE check.
>   - Remove the corresponding !want_affine loop termination logic.
> 
> This preserves existing wakeup placement behavior while avoiding
> unnecessary sched-domain iteration for TTWU wakeups that cannot make
> use of wake-affine placement.
> 
> Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
> ---
>  kernel/sched/fair.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 3ebec186f982..58ff55e093cb 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8832,7 +8832,6 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  	struct sched_domain *tmp, *sd = NULL;
>  	int cpu = smp_processor_id();
>  	int new_cpu = prev_cpu;
> -	int want_affine = 0;
>  	/* SD_flags and WF_flags share the first nibble */
>  	int sd_flag = wake_flags & 0xF;
>  
> @@ -8841,6 +8840,8 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  	 */
>  	lockdep_assert_held(&p->pi_lock);
>  	if (wake_flags & WF_TTWU) {
> +		int want_affine;
> +
>  		record_wakee(p);
>  
>  		if ((wake_flags & WF_CURRENT_CPU) &&
> @@ -8855,6 +8856,8 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  		}
>  
>  		want_affine = !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr);
> +		if (!want_affine)
> +			goto fast_path;
>  	}
>  
>  	for_each_domain(cpu, tmp) {
> @@ -8862,7 +8865,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  		 * If both 'cpu' and 'prev_cpu' are part of this domain,
>  		 * cpu is a valid SD_WAKE_AFFINE target.
>  		 */
> -		if (want_affine && (tmp->flags & SD_WAKE_AFFINE) &&
> +		if ((tmp->flags & SD_WAKE_AFFINE) &&
>  		    cpumask_test_cpu(prev_cpu, sched_domain_span(tmp))) {
>  			if (cpu != prev_cpu)
>  				new_cpu = wake_affine(tmp, p, cpu, prev_cpu, sync);
> @@ -8878,8 +8881,6 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  		 */
>  		if (tmp->flags & sd_flag)
>  			sd = tmp;
> -		else if (!want_affine)
> -			break;
>  	}


This just changes the behavior.

Old Code WF_FORK 1, WF_TTWU 0:

want_affine = 0, so we skip the first if block in the loop then leave
once we find a domain without our flag. And go with slow path.


New Code:

want_affine is moved away and early exit is removed. So we enter the if
block and try to find a domain with prev_cpu. Because WF_TTWU 
is 0, we just return new_cpu. Or if we can't fimd the domain with
prev_cpu, slow path.


Cheers,

Kayra
