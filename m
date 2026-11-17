Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794926528;
	b=xgXfzTynp3eAtvNSI4fRbI0ZudiVhIF88vFNMVkuvR8O9pFkCYxoGbjn+buie6Hv8SRt
	 XhZhtkdoCDiWotOvz3tS5FtTRkiEhhzddsK09C7Y7zb/Mq7gS8JNuPlaKeaWnJupkG2J1
	 b4aetFWRNB1NecjJjpV9yoZBIR2tuFXFC8WQmED/f5Mh+n0CjLAedwNssew0X2T2Z8+Ov
	 6qtACyFyAf91bjGAPb/GKmAKEz4s3S8/6ZtIXeVyqDgvRyZYY9TQgdCyGGlvfMmhVybFT
	 hVIF3OfuXpcUxGGNQE3niA9pT9+CwrxZdFvkwfYqgwhOCJ3oN1w9Ed8wqq62hClqzvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=tWnvFLVVK+eVByaXEA6NbigkSCOsM28fjdBUWGjbIXM=;
	b=UY3KseGHkitkQU3cKuu0VYl2Ly0nObQQ6TBghsGuqustxDUt8HpCcjHBAhagVJly5NM+
	 szYCv8awvcIMW1mYzOPrdgejDr6aeS5xJvZs1mWZ1rMI5IXJ1eepsKKYDUIIxwJr/UjJy
	 DdwR/ERgQK7l0R9aoQlXzekzLXJcDHuYhFX6T9fFuy5PnZSdmSryb/rWexQFd8ZN11DlQ
	 ENon3G5d7mFVH/vcf9W+Sh3GmovwyGaLbjwotYmoNRXCZcEheObKQ50wCA03yBgMFAJro
	 vFt21bg5Ym0awfjU8r5wWiCTCnYqnzEcDh5KwoxFejz5bDnPYaxeFYVym2h0KLE7LVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jfa0e0v3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD42F606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD42F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jfa0e0v3
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so639367a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:42:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794926526; cv=none;
        d=google.com; s=arc-20260327;
        b=YVuoZ3hhRaTNcQF/ZXDAlxd9Sm7cl3dfsIAbldMoX/klSo6b02TAAvxqxHguDjjKKP
         eu6qEyX1uD1nKPurdz/AwfJipFGT79UUz6AXOSRpCsjDBLnMOl7j/zBHfxItU8Ph64JZ
         l4urk58C/0moXYeSVv7TnQ/pXw2oJ08tzUXK/3rk132mX/I/g4KpHdpdzSyJ8DNHI7lr
         ZaCPU1eKRiCBO1kQqXLhe7tHoOM7Ecuu/Ch6cIk4KtKFZZlSTGpHY7P4SehInqmkiziM
         Wg7LIYdZWQTUrmU19WHc/3+x9TmWw+Ytx6i/JaAHT/yQzpOznAdG/LpOlnKHdwgDluMP
         7DrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tWnvFLVVK+eVByaXEA6NbigkSCOsM28fjdBUWGjbIXM=;
        fh=tqBNW3wAOMBOqzPLRfm/DR3RyFj2PHv45d58KPCw2xQ=;
        b=Dm0pqD7s9hr0x0UVdzea49MfFC69hNbV3nHqrT74CFifZsjBJlKLBPHoBQyRdbTekj
         9f7jHRFvOLH5GuGsgeLCgte1BXHPdPJFrwvBRvcGa7pwoCFBFOgg5XW/AO3/19gel+YP
         jFdJz+ckX5f1fmy4PVi3Q69/z5TusRxISrtTmERcwuL9khqEG5030IQKsIi8nDW5KZxd
         5yFFvzN2oc2FX0WQbqMxc/nu1r1flhzh7O6uCV+6SSthf9Q2Z0UifIPX9pkee7mHw9m4
         5n4FfPCegP8r120uvIu5LVibjWt+I1m9BNmM+w5NNlKbM4OTatVflGzqxKoek1Z1GA/w
         xINQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794926526; x=1795531326; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWnvFLVVK+eVByaXEA6NbigkSCOsM28fjdBUWGjbIXM=;
        b=Jfa0e0v3mWW81xesxOfpFH1yS5g0TA42ZqSTnoqxyRv82Wm1EbZur1Dt5Fu2yO4iBI
         DX9PQLQTgboGYvDS81otASYvDbPr/8+c+rgk5cbRmcZfN5bb7ThSHnHkQVJrP2Hp9DAm
         guVT/aszdMZCNsmFEwz/KeB2OfuZGnLOA9smM5qePX+bvOpgF+up6bw8mfGgFhVBhVwM
         zaTB939yMqVV514cpw7MJTg5ESgfo+yfYBtDHwNNJfzmSwB2wodtGmwnIhOn3XtCj/ED
         xuLfZxb40DUn7BzFPghPTrSlj28WZrOD6KY3o/tU6QaNNzaHQYGygtxiJnrwtbeqofVC
         onxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926526; x=1795531326;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tWnvFLVVK+eVByaXEA6NbigkSCOsM28fjdBUWGjbIXM=;
        b=K5hei/xUf/RoJTamkOcJvjWvJiuIZEMZOzZD1SCKO4bK7cxd40IrAczds2RA7uKHcw
         hcYXQwzopaPnSH+2ge7nQKkJsa6AHW+mTnwpJYcTmDVfMOo2SRbT4k4+n/SyUQuFF0a5
         MHWHYYU8LgRdbFLNmLl1c3KrAW2ZMuWlEFLokNEyeqox4NhIv09hZsUDrEGPbDmP/Ims
         5g9ENNjra5mgCViaJwN1CHIEAJbLmrlJghiL1a3+UYEZTw5wFnt13WexjmLUvE7xgCCT
         qJ4zbltnKCKYhNj9jwzrbaNzUWHdud0eaz3uqUQTin4CjNxTArlMHpH07wtkeZphRdBi
         Suew==
X-Forwarded-Encrypted: i=1; AL+hErH06itV6htmGxvphHMMSwhs59pgIrsQAzmGbFEIIFPi71MqV+okwZeesM8BZqy5Ie6ObY1q1G67kn6uhEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GZN0flqj61Xh/38DH2wFkQguPRLTVfu6ksZrVntR4/7PDcITr
	+Zqxl6Mfa9VxlwfKHhYd68lSGNyvctq0W3ycM/pDki3Lwq4ktyZYr2vFQHW/3GP8cmKrJHIXl6B
	fHQ8E4utXsuFaDTS0ygl+Zn+wC4iYV96iM0PIeivW2A==
X-Gm-Gg: AYBFou2sC0lPElUUe9fGBIz42XieG4dkY0jR/JhZOBNbZ81GZ5PiogdhZVlSvOgxznF
	qpH+nZzhx0qJ8RPdns30LFxCO23TSDZZqhE5w6o2b8RDvJtoVbUKYW5GWQ/Pe6QkfsJrbS5D+CE
	lW4AARaWoeVaAT+D33qWLucvYbJF8q0/ov2bBckaqBSX6OH4T2Uvbd3rBmVK6LLqm6CJIpVRXXD
	WvX2miSgSsH3l5GJY4L1osBc554Zi2YW9QfQNfXlPR6WI97a1F61/5xRCzP5NtaDsZZuQO78Tdh
	jV6c29GPQVcBKQOaWK4vLTcXJC8cpaY4UI1o7nuca7UqDyuyMB5BFklboPaVKsVnY3DyrZk0BX0
	KT5WFLfOW5qSkdLgqc4/6CE0AmePSNHmvWNdE/uPhjBE5eEv+vxKbPA2gY+nxkiopeGu00w==
X-Received: by 2002:a05:6402:90a:b0:6b7:b872:27c0 with SMTP id
 4fb4d7f45d1cf-6b7c0c86ac7mr10628358a12.44.1794926525844; Tue, 17 Nov 2026
 06:42:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <18e8d60c92652608.3137322e32332e3235332e313736.371783.0000sendgmr@google.com>
In-Reply-To: <18e8d60c92652608.3137322e32332e3235332e313736.371783.0000sendgmr@google.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 17 Nov 2026 15:41:52 +0100
X-Gm-Features: AclHuK_XLj_2KZOT3ocFAVnYCkbytOM7aPSnG5uVbdJPGPLESaBULMQnKpjjZtA
Message-ID: <CAKfTPtDH1Oy=Robnn9v8WuEOGyv0vdOLHhDx4HmofYWqmM9s0w@mail.gmail.com>
Subject: Re: [PATCH v2] sched/pelt: Skip redundant decay and divisions when
 sched_avg is zero
To: Chris Wiseman <chriswiseman@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Qais Yousef <qyousef@google.com>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 13:50, Chris Wiseman <chriswiseman@google.com> wrote:
>
> Commit d040e0734fb3 ("schied/fair: Skip calculating @contrib without
> load") skipped __accumulate_pelt_segments() inside accumulate_sum() when
> load is zero, noting that ___update_load_sum() is called with load == 0
> 45x more often than with non-zero load.
>
> However, when load is zero and sa->load_sum, sa->runnable_sum, and
> sa->util_sum have already decayed to zero, accumulate_sum() still
> executes decay_load(0, periods) three times whenever a 1024us PELT
> period boundary is crossed, and ___update_load_avg() still executes
> three divisions of zero (0 / divider).
>
> In addition, update_irq_load_avg(rq, 0) unconditionally invokes
> cap_scale() twice and a second ___update_load_sum(rq->clock,
> &rq->avg_irq, 1, 1, 1) call even when running == 0. Because the first
> ___update_load_sum() call already advanced last_update_time to
> rq->clock & ~1023ULL, the second call sees delta < 1024 and always
> returns 0 after redundant clock and capacity scaling arithmetic.
>
> In accumulate_sum(), when !load and !(sa->load_sum | sa->runnable_sum |
> sa->util_sum), update sa->period_contrib and return periods before
> Step 1. In ___update_load_avg(), set *_avg to 0 instead of dividing when
> the corresponding *_sum is 0. In update_irq_load_avg(), skip the
> capacity scaling and second ___update_load_sum() call when !running.
>
> Evaluating update_other_load_avgs() over 1,000,000 randomized steps
> confirms bit-for-bit identical sched_avg state and return values across
> all fields, while 20,000,000-iteration microbenchmarks on x86_64 and
> arm64 show:
>
>   Regime (1ms blocked-avg updates)      Base (cyc)  Patched (cyc)   Delta
>   ------------------------------------  ----------  -------------  ------
>   x86_64 Idle RT/DL/HW/IRQ                   78.53          32.82  -58.2%
>   x86_64 100% active RT+DL+HW+IRQ           116.01         117.63   +1.4%
>   arm64  Idle RT/DL/HW/IRQ                   77.78          37.91  -51.3%
>   arm64  100% active RT+DL+HW+IRQ           120.40         113.52   -5.7%
>
> Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>

FWIW, you can remove the suggested-by. I only commented on your v1 but
it didn't deeply change what you proposed.

> Signed-off-by: Chris Wiseman <chriswiseman@google.com>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
> Changes in v2:
> - Move the zero-sum fast path into accumulate_sum() before Step 1 and
>   still return periods (Vincent Guittot).
> - Avoid dividing in ___update_load_avg() when *_sum is 0, dropping the
>   sa->load_avg check and the kernel/sched/fair.c change (Vincent Guittot).
> - Add arm64 cycle measurements alongside x86_64.
> - v1: https://lore.kernel.org/r/18e837a02ddbadb6.3137322e32332e3235332e313736.1b3220.0000sendgmr@google.com
>
>  kernel/sched/pelt.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
> index 779eb58a4261..7308fb28b0fa 100644
> --- a/kernel/sched/pelt.c
> +++ b/kernel/sched/pelt.c
> @@ -109,6 +109,11 @@ accumulate_sum(u64 delta, struct sched_avg *sa,
>         delta += sa->period_contrib;
>         periods = delta / 1024; /* A period is 1024us (~1ms) */
>
> +       if (!load && !(sa->load_sum | sa->runnable_sum | sa->util_sum)) {
> +               sa->period_contrib = delta % 1024;
> +               return periods;
> +       }
> +
>         /*
>          * Step 1: decay old *_sum if we crossed period boundaries.
>          */
> @@ -262,9 +267,11 @@ ___update_load_avg(struct sched_avg *sa, unsigned long load)
>         /*
>          * Step 2: update *_avg.
>          */
> -       sa->load_avg = div_u64(load * sa->load_sum, divider);
> -       sa->runnable_avg = div_u64(sa->runnable_sum, divider);
> -       WRITE_ONCE(sa->util_avg, sa->util_sum / divider);
> +       sa->load_avg = sa->load_sum ? div_u64(load * sa->load_sum, divider) : 0;
> +       sa->runnable_avg = sa->runnable_sum ?
> +                               div_u64(sa->runnable_sum, divider) : 0;
> +       WRITE_ONCE(sa->util_avg,
> +                  sa->util_sum ? sa->util_sum / divider : 0);
>  }
>
>  /*
> @@ -437,8 +444,10 @@ int update_irq_load_avg(struct rq *rq, u64 running)
>          * clock_task. Instead we directly scale the running time to
>          * reflect the real amount of computation
>          */
> -       running = cap_scale(running, arch_scale_freq_capacity(cpu_of(rq)));
> -       running = cap_scale(running, arch_scale_cpu_capacity(cpu_of(rq)));
> +       if (running) {
> +               running = cap_scale(running, arch_scale_freq_capacity(cpu_of(rq)));
> +               running = cap_scale(running, arch_scale_cpu_capacity(cpu_of(rq)));
> +       }
>
>         /*
>          * We know the time that has been used by interrupt since last update
> @@ -455,10 +464,12 @@ int update_irq_load_avg(struct rq *rq, u64 running)
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
>
>         if (ret) {
>                 ___update_load_avg(&rq->avg_irq, 1);
> --
> 2.47.0
