Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178111;
	b=NlcdxBfzqaioNF7nxe+O1Da1Sy5i19nVLlrfinZuEONO0MBkgGeSbuloYS1BZ4J66WEy
	 3YCKOCnRKb18B8RMx/M83ykj1y73WCaQv7Ym+TlfX0aTzofVz7EN9IbOBp3h0pybXib5v
	 7diU287uN0xH81Gng/p/5Inr2ZTGZ6ukAa2ROnCwBYTbbn9/D/1kUMOWIJc6h50dCEUDl
	 zbliRtXvTK8jL9+9gjvIOX+U9++mYcJoquiOohIwIc4gJKssqBnz6Sy7zYDrpSSaeXUyJ
	 hIdsL1JfH3Cd/FNq7LjswAk33Iv4/rR3HMIpqJlbe9iuFw1HZ+OdO4707xOUazuZEFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ctXIwpA5APE4t09UlGbNVi1os8Rg8qKlPHKBAuM/sJE=;
	b=jVosCGvuMUt1FxAYxYnZP7ylmhJBai0LXvIqLMMvxMMyu3FyPnUBrLK24BpSr3JIySpD
	 M48JfqtYrK8GGQwyffPIfACliCQy/MLOCBMreuPGjpPyy6vXyEZqcaaxpv4YyS9EiJTgE
	 pGDmF6ulZgyTDKJe1NR/yBhO35/FTRoTBrjY6ubRAP2k5nUSwfC2XEhjzP3rpZKFDaJZc
	 qtuoCLLgF+aj68ZAmJV2jDJ5mYcHt6MidEUkIaQccNrUR/Ad7MuaXiBpMlvWufHU8LFPk
	 OKAvhws3cmTB0OTcvMK5ccevol+HvXySftnk+BN+CHsOlsIOyWOsxyOEL4Ix5CsaljQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZ1bs4H7;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE76606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE76606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZ1bs4H7
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a68f888a41so827585e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178110; x=1793782910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ctXIwpA5APE4t09UlGbNVi1os8Rg8qKlPHKBAuM/sJE=;
        b=KZ1bs4H7QX70IlErO/onSp3JawGiMoKRFXZJJjwdVrzC52dw0W106LEfP9GaEjEtuB
         Hx4YFPMuIKag4ldjgCy3R1ftEd2ZHXas6V0ruwo++yQ8ir+BkesNvYe3eheZ1nseHwGp
         Um/DMlpwpVckr9bQOH0XIDm1ub0TRKWuWfBlzph5zNaPCdaPEbcjzPOu8EuUXf7Rv7/F
         QDh3vXmQScqf1Gd7R2nx71suNSPwIIKfqsK8Zbg5k4Jw8beMzbD7Te8//a9WZe2LiQzb
         xNz37p2CHuzCL47mh8pliF7TY7WWVZZrShnoaw/OEWWyBmXnDT2vWq8J1UB0EVeiTtCb
         RQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178110; x=1793782910;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctXIwpA5APE4t09UlGbNVi1os8Rg8qKlPHKBAuM/sJE=;
        b=eX4Kp9dzyeHyphAi6xg0ogXgbUzYbF7GpxoQihc1SGxsX/hlHCsfauYjNVH1SE+NC/
         qcNS9vp8Xko+z7IAQ/ekWtBh8lepi5v4oCrxRcPFR+X77zsZg3ANVKIL2S/Z73smOCak
         /Di4k0Lr652YuwSTYZzEIKj2HtrVp1fYWBl4POYF+zQuVATKPNg7xsU4QtWrKqmhjd8T
         1Y59F+S5UWaPU1C9CgDv1VhMbqAU8me1nKEvwmSXUTzxmvuJNqG3oO00vluC78VQP4J8
         kpnshusgIncxRrV1oONaylrLBd+DnIeNzh4yQ85Y198xgacFBNDdsAIn+2UXFD/GEq6m
         2fvA==
X-Forwarded-Encrypted: i=1; AKwUvBzbmqTOB9rRj9qCyr8/0PxUnfapiLREj5nVtN0jD3D6h7w9gKCAUNOgu60LY4MOXMK3qbwc2RDhOVe9KpI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDIqO23/QVnIRR0gzlV8+Phnnnc/45kqacPLt1HPt+JQq/PsGj
	SQ/SDSLv2i3X+jFRxrZJmeynEGyeCFlH9eUsW8FUfFrAE1gi4b6J0JLeVX+7vQ==
X-Gm-Gg: AYBFou09B3MwwdgIBNDNyBoquY7nGouVpaiBA8EJ5RHfqNm8UOXgDN8y5478L7gxIVl
	SVMShaMrG2Do4ZImMXRZ6hgZFJQ3x2z0eaYUCLfmJjxnSXqNEFOjfRLDX3dP4NZfocrbGhktVu8
	QxqIMdyowFvOeL6Ns9S9TXjKmwiabFUP60iqeEyRhzxtL/7yPcblAycqiKD94dT/zWdOjnQD1HG
	/ltGtZPFFZhU+PNmCOUwJU3Awan7mL0QB3Vu6ISeCgMBymJ3ZEDDsUUfgpYkWfjSMCYAb5QzXmv
	wOcOT4hlEqgmMYie5Umo3Or46uFbeO0lxD/6RN4JlHJsEUvJU4QAkK/nUMRABHNw3HGozgYKh8b
	LPKFNW4I7aS9ugEIpqKpDBvzdw+CA8RdliWMr7MdG2BrnRAoBV87VrXvH31CPSbBrsi4C8Nl+nM
	PY1eAy5QI/VSD+8x+y8hUyF+AyUWoUIp5KzSWIk9z2rByZpj0R2NH67N3HtU97lDLiNpsQ57wDI
	movGLqj3mWd0KCAxMNNdWo3g5Op30VyqI8ndYouFr+aL4MAcoDxRUtCiZSaJkLP0qeKJmjmt2K2
	3pdswkgwIDb6DoD28mYWIxU7iZ5NV2Z+KmK/KWYTMoblJNMxCVvKPV35
X-Received: by 2002:a05:6000:2dc3:b0:48e:3978:5577 with SMTP id ffacd0b85a97d-48e5d456cf6mr4808184f8f.5.1793178109578;
        Wed, 28 Oct 2026 02:01:49 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece5e4asm26744683f8f.59.2026.10.28.02.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:01:49 -0700 (PDT)
Date: Wed, 28 Oct 2026 12:01:45 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Qing Wang <wangqing7171@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Tim Chen <tim.c.chen@linux.intel.com>, Chen Yu <yu.c.chen@intel.com>, 
	Davi Chaves Azevedo <davichazbh@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] sched/fair: Replace random newidle_balance with
 Bresenham accumulator
Message-ID: <auGzaT-RjHdctV60@scheduler.schedules>
References: <20261028034449.2368071-1-wangqing7171@gmail.com>
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
In-Reply-To: <20261028034449.2368071-1-wangqing7171@gmail.com>

On Wed, Oct 28, 2026 at 11:44:49AM +0800, Qing Wang wrote:
> The current NI_RANDOM implementation uses a random dice roll to allow
> newidle_balance attempts according to the success rate. There is a better
> way to implement it.
> 
> Replace the random dice with a Bresenham accumulator that distributes the
> allowed attempts uniformly across a 1024-step window:
> 
> Each step does the following:
>   - Accumulate (1 + newidle_ratio) into newidle_window_pos.
>   - If the accumulator reaches 1024, allow the balance attempt and
>     subtract 1024.
> 
> This guarantees exactly (1 + newidle_ratio) newidle_balance operations per
> 1024 steps, uniformly spaced for any ratio in [0, 1023].

I still quite don't understand why we need this. If there's not a gain,
the old code is simpler. I'm not against this but still I'm just asking.
Changelog just says "better way to implement it" but doesn't say why
it is better.

> 
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Signed-off-by: Qing Wang <wangqing7171@gmail.com>
> ---
> v2:
> Removed sched_rnd_state and sched_rng() since they are no longer used.
> 
> v3:
> Corrected the code comments.
> 
> Performance testing results from Prateek using tbench
> (most sensitive workload for newidle balance):
> 
>     Clients:        tip                  bresenham_accm
>         1      321.65 (0.00 pct)       313.97 (-2.38 pct)
>         2      641.92 (0.00 pct)       638.74 (-0.49 pct)
>         4     1245.65 (0.00 pct)      1237.26 (-0.67 pct)
>         8     2435.80 (0.00 pct)      2442.23 ( 0.26 pct)
>        16     4717.66 (0.00 pct)      4688.19 (-0.62 pct)
>        32     9303.53 (0.00 pct)      9390.71 ( 0.93 pct)
>        64    18002.57 (0.00 pct)     17911.56 (-0.50 pct)
>       128    27729.26 (0.00 pct)     27621.95 (-0.38 pct)
>       256    47134.77 (0.00 pct)     46137.36 (-2.11 pct)
>       512    43179.41 (0.00 pct)     43277.53 ( 0.22 pct)
>      1024    40339.30 (0.00 pct)     40176.49 (-0.40 pct)
> 
> The %diff is within the noise range, indicating no performance regression.
> 
> 
>  include/linux/sched/topology.h |  1 +
>  kernel/sched/core.c            |  3 ---
>  kernel/sched/fair.c            | 19 ++++++++++++++-----
>  kernel/sched/sched.h           |  6 ------
>  kernel/sched/topology.c        |  1 +
>  5 files changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
> index f96812d71c51..e951d6f3fb0d 100644
> --- a/include/linux/sched/topology.h
> +++ b/include/linux/sched/topology.h
> @@ -113,6 +113,7 @@ struct sched_domain {
>  	unsigned int newidle_call;
>  	unsigned int newidle_success;
>  	unsigned int newidle_ratio;
> +	unsigned int newidle_window_pos;
>  	u64 newidle_stamp;
>  	u64 max_newidle_lb_cost;
>  	unsigned long last_decay_max_lb_cost;
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 1754d9f95f2c..4d764e68897c 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -128,7 +128,6 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(sched_dl_server_start_tp);
>  EXPORT_TRACEPOINT_SYMBOL_GPL(sched_dl_server_stop_tp);
>  
>  DEFINE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
> -DEFINE_PER_CPU(struct rnd_state, sched_rnd_state);
>  
>  #ifdef CONFIG_SCHED_PROXY_EXEC
>  DEFINE_STATIC_KEY_TRUE(__sched_proxy_exec);
> @@ -8927,8 +8926,6 @@ void __init sched_init_smp(void)
>  {
>  	sched_init_numa(NUMA_NO_NODE);
>  
> -	prandom_init_once(&sched_rnd_state);
> -
>  	/*
>  	 * There's no userspace yet to cause hotplug operations; hence all the
>  	 * CPU masks are stable and all blatant races in the below code cannot
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0f2364479f9d..172c4b53c11a 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -14198,6 +14198,7 @@ static inline void update_newidle_stats(struct sched_domain *sd, unsigned int su
>  		ratio += sd->newidle_success;
>  
>  		sd->newidle_ratio = min(1024, ratio);
> +		sd->newidle_window_pos = 0;

Why do we need to make this 0? We need
512 calls for this to happen. But for balance to run we need
newidle_window_pos to be 1024.

So, we reset newidle_window_pos per 512 calls but we need it to be 1024
in order for balance to work When weight is 1, the newidle balance just
doesn't run.

Or am I missing something :-)?



Thanks,

Kayra
