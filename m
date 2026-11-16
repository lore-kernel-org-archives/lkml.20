Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794828604;
	b=V3wbdXwJQ2XRdNDf2r0IXoZp5UbOhlP9KkjxNhL6l8ncQSXBMLPno7KBpwNDQCGGWNTi
	 dzuEHKjRXPhZCCcHNR1Jv6ym/pYPZiskX9I0oyx26PM+cnSmV8YVtsG0cQgqxmerfeRTk
	 6lI1+uIyw4O7Xk0w1bfxUKuntj6sdrlO4aC1YtYJI4dh9YrjrSt4K9qgBOEqcdpAIRsJQ
	 eZNyRYVMqUVP4We1cn3whVT3LqVLu9sH37bvSV69Ow6/Hiqgkj611jb9Fd2lDDXFpGnmm
	 XToXrhJyaX0aAPIgeC9B76LLQdooN4NXeg/ST6Txo/iPXkVzUnkGVXkBnHG+APaCaMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fo1Q9a5oDGB+GNHnDE3DBftZI0/AVZ850YCZ03USDA0=;
	b=Tm6k32+8Or3Wd9Gt8ovfkBOdQLdXKgTAFoE93lI65Xg3nU7hIX5yuINjw72uMlmi0NYM
	 qV2HAaOrjuPbhA9J3BDu3xJgk58yTN4sCqG6LVKdYL1u2ByimXYv8KtZSP+N1Q5lmfV01
	 /Bo6wDb+4X+MoutSHx2F4/CvvhlxTT2uw6cmphsJj3CqqfRAsEth2Dx2CvYBgdmx1aZtD
	 os9E1oX81DXxcYmd1MT+ET8pxuO2TZu5/y+xSGmo6wBBENe7FvwtgD/JP4YMGsn+xgqnG
	 gXpnMsAA6iPVbDzK6Wws6+yVs9RgXAw8JY/nxuYphY8XnDBUnSlJWVaZ3yL9/zTANPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nxpKyqDR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FCA606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43FCA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nxpKyqDR
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so4013231a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:30:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794828603; cv=none;
        d=google.com; s=arc-20260327;
        b=kayUhaU5GZ6DXhRc2q/1I0X88FniDHJDX6kCeEQCIP0Q7TbFcFLAnVv+Ej5bd/K0HW
         Iz8UWO/6Qvybfpp6u3CWyIQ2IgcKfAc7+L0F25HPdOoGWqPPKiZ5HlL08zGdw5mIzSCy
         +lILjPp7Ozy+iWnLmlCsa2iyUELKa7QF0zNgoHUXhbZixCFUw7KoqurvInAZbpCpvUX7
         dJdSHNYj8dVzJjlt5xNyJJTKLVhHKIog6N+p+uQlU0/Msn2bgXXoEHP6sfoxyrSEENgl
         H4gocX+cYuO7oGuUyZ4x0P7Cywb8gtMs6jZU+IVCakIvr8en3/5Qh95pGkwTIzPHIMiE
         FklQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fo1Q9a5oDGB+GNHnDE3DBftZI0/AVZ850YCZ03USDA0=;
        fh=Qp8YOZlsoJaitRDOSTa/1TnklNSfgNBLAupuRn75Q/Q=;
        b=GewTDJ5OxQGC4L/GPoioc3dQ+0luumd8skEZnr0Gml6tsOLWULGYjb0MVu0lEsQf2Y
         3nVG1NIbFLFlsKmzK3pFKQrX45Ngf90ixscrMCIVgLTYjuoiNgfZNRYO+wHnc4p+xcHY
         09kW+DULo/N0Vz3QBiB+vbttEJi3qHPqGFirLICE3ZnmtUe5GF6jLGuH4P+ywlAH9GXV
         HlWpw7EdSLMZ6SHjHW+qpMg/x1W6CAe/AoorT+04fpFfOjoEOtj88jOth6Q4yToxv2V+
         eEqFPDFEY6McbFDi8kGPYswEXWukqtfrUCSvIdI1I1/xWE7H2U0HUdH3IBdDhEBfsWWh
         1rnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794828603; x=1795433403; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fo1Q9a5oDGB+GNHnDE3DBftZI0/AVZ850YCZ03USDA0=;
        b=nxpKyqDRa7xhM/1/tEZ1f5OCe+Rz2dCF/G8AzyKVDgamvmr55SATFRyYakN2ZV1s3f
         guq73J+uHphSyTVegqcFRE5J6Uk9l/kkdraABpz+ZPI+suejQl+wGkWNxmzr+ZI/yBQ4
         QI8CrRDVw5UWrx2KR0kpf+Qw8m3Lkxr8yResEJKBfvcIpMSzNTiAGdbAAncHY5b+hevL
         fGIXHAkHlv8Dl7AH7ictF2mO/F+aDw0WVoOGgh1N5CSFNSrhkMJT8ejpbxaSB1+cSUG7
         6smuGkzxiEmGyfUixjR3+9EIYGOTVYHCz+7P6cFxFN/A5oLAnPUzP7k4rrvVJJzwg4tZ
         +rGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828603; x=1795433403;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fo1Q9a5oDGB+GNHnDE3DBftZI0/AVZ850YCZ03USDA0=;
        b=ox7okHYdFOYL5afh8yVThwUj8CI6mUFfhRVQBHWkorZpvvbN3St1cW36XMwvLOf48g
         XH9BJcgLv9C3IsR0zdRqoCrTVhpGZIaXLYPDYxtOwf26q3XLBdIPmQIFdYFpjRBj54Iw
         RWQCXQsnpGFOpP8FY5SFRIwZY3Gvp4/+Qyr906pEXivz9u/4ig/g6F4mLKJEfdlxNwsA
         cXAKvhgn3Kg59qnRuC5o1d0Am4nudd9I0l9LCil9nMDjpeUoMcpmv/NDzqctpT9oLMAM
         x8yl5qV8A642QsYjhq//Qc+5hZk5SZRWNYNjK/DH/hyqygBdD9x15tJIGaYdFX7KMWoZ
         Tplg==
X-Forwarded-Encrypted: i=1; AL+hErH/phJbzuBwS5O3gDb+6o94CNsR0m+CHRcGEk58UhhXDHhZRf5LPLOdalq8kDSVxRLf0xtzJTCFMtgFFhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vI02jSpnDLEYRLr9atmIeq63oKDiLxE2h5AYr51g8pNo6t8lr
	hDg2hteBHhEXOgaaKJTWHSuaXawZREgv77PPhn7fJbepiDgbS707HvcxP5P7BNCBtEoUb17o+/b
	sXoaV/ZYdcioxyHQq/PYn7NW+azB6Bek2OXKjhg3yRw==
X-Gm-Gg: AYBFou0Uxz8Ej6bycyAS1m0sXsVaNvUCDb7VzXnWMu+USPNbGiOzGJiKlv91RyNt7c2
	D3yzY5OGjqre4V85OZxTsfIi1NPjTnb2Xsyw7IouvPfiqZcod4izMFkDxGraTv4KGLSH9Z8Q+YA
	WAT9HsiiQxnCFnCwz2qZoWd00AG+TRNTlXcptxjGF2oQKQleFhpnqIvWpwj0ah1vXXe2BBAgkLY
	QppfdctBn6j6FZ1dyM03JDMdh3mcfneTnVbd2mHpLTkCYBnwj+ydO1g6kaQ1NJaMLpwlM8se4n7
	6Tl1DAyuOWRW7A0PfupqcsIA55tEwxQ7x8aEEOm7jhVhqGL9P7LEkylKzXXnBi49F7oux4tInPp
	Lfkn7Fav6htefOqAL54glse25Q7jeYQGSkOaK+PygqeqdbpzufBPv5gfaqOTsV7LewPllktRUpu
	2uIWTVS6h94yR6L43y
X-Received: by 2002:aa7:ca5a:0:b0:6b5:90b9:e1f4 with SMTP id
 4fb4d7f45d1cf-6b7c09576c7mr5644743a12.15.1794828602474; Mon, 16 Nov 2026
 03:30:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <18e837a02ddbadb6.3137322e32332e3235332e313736.1b3220.0000sendgmr@google.com>
In-Reply-To: <18e837a02ddbadb6.3137322e32332e3235332e313736.1b3220.0000sendgmr@google.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 16 Nov 2026 12:29:50 +0100
X-Gm-Features: AclHuK-sVAeke7ICDYOqeVlaJhDz2L_3ltiqCUGGZVBHxiUIt-zZehAKoYhQBjY
Message-ID: <CAKfTPtDooueKfU_OORqM-1NNt3KFR1MmeGENnfFbn=NF+_hgPg@mail.gmail.com>
Subject: Re: [PATCH] sched/pelt: Skip redundant decay and divisions when
 sched_avg is zero
To: Chris Wiseman <chriswiseman@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Qais Yousef <qyousef@google.com>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Nov 2026 at 13:26, Chris Wiseman <chriswiseman@google.com> wrote:
>
> Commit d040e0734fb3 ("schied/fair: Skip calculating @contrib without
> load") skipped __accumulate_pelt_segments() inside accumulate_sum() when
> load is zero, noting that ___update_load_sum() is called with load == 0
> 45x more often than with non-zero load.
>
> However, when load is zero and sa->load_sum, sa->runnable_sum,
> sa->util_sum, and sa->load_avg have already decayed to zero,
> accumulate_sum() still executes decay_load(0, periods) three times and
> returns periods > 0 whenever a 1024us PELT period boundary is crossed.
> Consequently, ___update_load_sum() returns 1 and the caller invokes
> ___update_load_avg(), performing three divisions of zero (0 / divider)
> and reporting a false decay to callers such as
> __sched_balance_update_blocked_averages() -> cpufreq_update_util()
> (wired up in commit bef69dd87828 ("sched/cpufreq: Move the
> cfs_rq_util_change() call to cpufreq_update_util()")).
>
> In addition, update_irq_load_avg(rq, 0) unconditionally invokes a second
> ___update_load_sum(rq->clock, &rq->avg_irq, 1, 1, 1) call even when
> running == 0. Because the first ___update_load_sum() call already
> advanced last_update_time to rq->clock & ~1023ULL, the second call sees
> delta < 1024 and always returns 0 after redundant clock and capacity
> scaling arithmetic.
>
> When !load and unlikely(!(sa->load_sum | sa->runnable_sum |
> sa->util_sum | sa->load_avg)), update sa->period_contrib and return 0
> directly from ___update_load_sum(), while still flushing any pending
> rate-limited cfs_rq->tg_load_avg_contrib in __update_blocked_fair().
> In update_irq_load_avg(), skip the capacity scaling and second
> ___update_load_sum() call when !running.
>
> Evaluating update_other_load_avgs() over 1,000,000 randomized steps
> confirms bit-for-bit identical sched_avg state across all fields, while
> 10,000,000-iteration microbenchmarks on x86_64 show:
>
>   Regime (1ms blocked-avg updates)      Base (cyc)  Patched (cyc)   Delta
>   ------------------------------------  ----------  -------------  ------
>   Idle RT/DL/HW/IRQ                          72.53          18.33  -74.7%
>   100% active RT+DL+HW+IRQ (worst)           99.21          99.68   +0.5%
>
> Spurious decay returns from update_other_load_avgs() when RT, DL, HW,
> and IRQ averages are already zero drop from 100% of 1ms updates to 0.
>
> Signed-off-by: Chris Wiseman <chriswiseman@google.com>
> ---
>  kernel/sched/fair.c |  2 ++
>  kernel/sched/pelt.c | 28 +++++++++++++++++++++-------
>  2 files changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index f77e722..83d3928 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -11538,6 +11538,8 @@ static bool __update_blocked_fair(struct rq *rq, bool *done)
>
>                         if (cfs_rq == &rq->cfs)
>                                 decayed = true;
> +               } else if (cfs_rq->tg_load_avg_contrib) {
> +                       update_tg_load_avg(cfs_rq);

Normally the cfs_rq is removed  once it has been decayed which
includes tg_load_avg_contrib so they should not be updated

This is because of your change which prevents updating update_tg_load_avg

>                 }
>
>                 /* Propagate pending load changes to the parent, if any: */
> diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
> index 779eb58..935b8a4 100644
> --- a/kernel/sched/pelt.c
> +++ b/kernel/sched/pelt.c
> @@ -214,8 +214,18 @@ ___update_load_sum(u64 now, struct sched_avg *sa,
>          *
>          * Also see the comment in accumulate_sum().
>          */
> -       if (!load)
> +       if (!load) {
> +               /*
> +                * Skip decay and divisions when sums are already zero; check
> +                * load_avg for newly forked tasks (init_entity_runnable_average).
> +                */
> +               if (unlikely(!(sa->load_sum | sa->runnable_sum | sa->util_sum |
> +                              sa->load_avg))) {

why load_avg ? when load_sum == 0, load_avg must be 0

> +                       sa->period_contrib = (delta + sa->period_contrib) % 1024;
> +                       return 0;

I would prefer that this to be included in accumulate_sum before step 1

Wouldn't it be enough to skip the decay_load and
__accumulate_pelt_segments in accumulate_sum but still return the
decay. And in ___update_load_avg() set the *_avg to 0 instead of doing
the div when the *_sum is 0


> +               }
>                 runnable = running = 0;
> +       }
>
>         /*
>          * Now we know we crossed measurement unit boundaries. The *_avg
> @@ -437,8 +447,10 @@ int update_irq_load_avg(struct rq *rq, u64 running)
>          * clock_task. Instead we directly scale the running time to
>          * reflect the real amount of computation
>          */
> -       running = cap_scale(running, arch_scale_freq_capacity(cpu_of(rq)));
> -       running = cap_scale(running, arch_scale_cpu_capacity(cpu_of(rq)));
> +       if (running) {
> +               running = cap_scale(running, arch_scale_freq_capacity(cpu_of(rq)));
> +               running = cap_scale(running, arch_scale_cpu_capacity(cpu_of(rq)));
> +       }

fair enough

>
>         /*
>          * We know the time that has been used by interrupt since last update
> @@ -455,10 +467,12 @@ int update_irq_load_avg(struct rq *rq, u64 running)
>                                 0,
>                                 0,
>                                 0);
> -       ret += ___update_load_sum(rq->clock, &rq->avg_irq,
> -                               1,
> -                               1,
> -                               1);
> +       if (running) {
> +               ret += ___update_load_sum(rq->clock, &rq->avg_irq,
> +                                       1,
> +                                       1,
> +                                       1);
> +       }

fair enough

>
>         if (ret) {
>                 ___update_load_avg(&rq->avg_irq, 1);
> --
> 2.52.0.rc1
