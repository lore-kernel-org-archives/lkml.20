Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D281858F063
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661217; cv=pass; b=Xf8bgiZjHgaT3A0KdiETJFRclSFXaVyGR/8kvwPZBRLxIKoURLIcGnZzsgCbmrgKfGyc3YFKVCsCmCxZaSZYehekkfyrTn2ci5dyUcKvpJPD0i8S2omwkMTmTQn2/Ruj4J2wDyL3boOSJHqDAvpVUdez9NWEfgO7x2qxpLPpc0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661217; c=relaxed/simple;
	bh=De/999h84+l9BVfIL2AOjoR3XEAJ+zsNfEgHR7DHgHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XgzXHcLx5isoWgtD+v8ofw3ms9qOjASvLEYz5HeV5fH84luJKXrhL1W5WFlmBJJ+CXzvY/bAH61mtYSCD/SmHjNs2R+nmD8UYAlBAlVowTE7S98abiI4/fiCTMclVWDsju8qfNNFOujBUDIWdNRZJKNy66uamuHJJdjv+OuX9yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TVMDzdko; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TVMDzdko"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so171727766b.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789661214; cv=none;
        d=google.com; s=arc-20260327;
        b=TBDaWQ2ih0lpsHY/23tEGi9/zGUp5K1Rlx+EJCjPBOEYDn8aqc2iaE4hY67EdFvy27
         RawYLWCom1GRGMvnpjPUDsTpaU4EkIAiwQ0zXwncFTL1i17IbjlZ0l7xFf0uP5vrEKAs
         yVvACqyxUM2yD5yovIl1zkAYSeN7uVqY8csbPNUBaluNNibtvO0pXNqSSb69GvPJZxew
         oQaFxPFEnu9WJpjW1N2QXkIUL8lU2iCmzqt6cs8MsAmlE77tMhmgcKY9d0p0RiyyVI6i
         uDK7wt5DiaEuS22QjRLpFW0MqLI7h2iOrVlhvWWpW3CZDfaEcRsjDP0aNNa/UbAHXMqH
         pdgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l7vZZOfF1oChOGtrYGJqCH6mbY72WxmGbaYDIaKFF2w=;
        fh=H8TYnqwDoJthABfkYNmWgxm9OFMtOEFAm55VMEnrc7M=;
        b=G+JR6lzol4hRBkgkjFPJLU6w1ihYvUJoMT0d0MpqEDdfk2MYIIgbnG1kkKl8h91O5X
         2eQzUlIZe9R/E4JZfncYwLBw9IQo6NMDQQDP6VyRCWUsR8tuiGhYacnNEbSTC6YRGluJ
         8fMuvBeETeMIqet07sNcDjqmG2OBwXQkIuxLohdh4lduKESCJfLH3uQP8Agd88ZebYLc
         vgalsKw1zLOWUH+OjBmOtOzR+BQf4kuBAKtL6c0NfvDKq8urRVFLCKcGT5XDogAX0r3j
         o2g6+77+rQ1E9u9lPvBeIHXat+fy+WN3x8zzswFYwYUSaGXISX/DuZdd+W2BWyKlPKTv
         M01Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789661214; x=1790266014; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7vZZOfF1oChOGtrYGJqCH6mbY72WxmGbaYDIaKFF2w=;
        b=TVMDzdkopOmt2usUSN7tJ/CXOAKGsQSGVXc0qJUp5OMsXpsmYcMBMfwu/yvo9kPLKh
         ZIxjvXgL35LY5U3tJHHSoD1Qa/FXvj4TjWY1Q9zekXLpuLwNi75KOjyi49n/PdIWj5On
         PFmmIjoHGmSbXQV6IG7fwRtI/IrpSmqMSNKmwQ56m4vn88CkXK3zwHGXeXirPV4lREVt
         ktDuyUVikiSZ2Asg7JvIDU2MiA3AnAqyWEqsQXVfwPfFi8rS5VazlX80JqsKsPx4Sidu
         KkQQu3joPJPcStZIdaRdq3Vw26q/XEhcgyHWptSrP7nL3lKF2wDNLDc+/oNCgvd8RA6U
         eg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789661214; x=1790266014;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l7vZZOfF1oChOGtrYGJqCH6mbY72WxmGbaYDIaKFF2w=;
        b=HVjqOAUizgJEFdedAzcyxA86aDQEppzUyOoqgiZZ65Dp3Hb7JSeDmFJKuRAvicB9Ow
         2b3dYiwm8eflMwmMj6K/tfBwVniR4enmxd09TmAVO+W7JQhsJsWUvRbe6AXoaixpHsCB
         Ey72H+jmvV4LJkZc6Ww7N6pm++kiLgISigVDoEqE4at4KyJp7hMwt0cLshjp66o5yQik
         1jbC2XVodokmxNuH/xJI3RQRuqJ2JYNY25sG5CjUR5pQGnXQZqJzSf6EejmFQi3WFOeg
         gSakDjRxWGAP/YH/VOJ8SU1zVhZsfGCPfXXVxiv4gM4oagBc0bhOwocIWYc2wm4E+hhy
         nJ/w==
X-Forwarded-Encrypted: i=1; AKwUvBwV4q+JsvgRTkU2Ji47/9VCm0ZK8T1C7xb9M5Z0yebJ/5gJ0C8gq9yZcF3K8p2nk+MR3oU8zO1uugixtSU=@vger.kernel.org
X-Gm-Message-State: AFuF++n3Tdccl9SjuT50+VzFgIcgw2hIjl3/OOAwlNR91hT1ZPt4Sf3c
	QjvERoJ9qBwg7PzBRls2XUVK1/fU4STPg8JyEwmuu+xWo4dqlkljqcrIB9m88qF1tvNqZc6+YTh
	NLMtqpr0rL+G1J5dv9B/NLurXMLDGpkeXwzefnuxs7w==
X-Gm-Gg: AYBFou17mklDdtkvBPeki4oiPQHLasXyL69k7DNlsoXW+63W1kjcQX1v9AU0BdTKi8f
	7SlrRQXHlAkbk4jX0cA4WB+Mv/mkHL2DOumm9laszGjzaYm1lFzv/s16dLa7IGw4mOhgBsxoFWD
	LaYD5KgvXAtn0JkLm1B9beTda0hJCo0L6MZEjDWyOp1fQjECRsVUWlQrnuz3+sxvK462E9CxwBd
	KS8XNGd+2Rwg0QaqbArCe3RGmMOFBdFw/7l/GhAwplyLujgrCO9E0yp4WM6NlyVOTa4pb+hIb6z
	LYC8Bv5E7qIqWhIOUmDnka9CT4rsDHvUfZEr2KdRSpqu+NQJiC2SzewGGM3nHXZg0DhArHrCLA7
	keL5WyHbJiD/l
X-Received: by 2002:a17:906:c108:b0:c29:3821:ae6c with SMTP id
 a640c23a62f3a-c29e532ba26mr550909566b.37.1789661213976; Thu, 17 Sep 2026
 09:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917153915.1563875-1-christian.loehle@arm.com> <20260917153915.1563875-3-christian.loehle@arm.com>
In-Reply-To: <20260917153915.1563875-3-christian.loehle@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 17 Sep 2026 18:06:42 +0200
X-Gm-Features: AcwNN1VDgoUHXaC_qbFB1CwxOWF1VmJqBSwM0r22FFa4FgrlUpPPIB6AguxFn6o
Message-ID: <CAKfTPtBft2pVrsZQGJu0UBjuqaGJ2ViE9N6YExLvBnpgEXDvag@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] sched/fair: Randomize equally shallow slow-path candidates
To: Christian Loehle <christian.loehle@arm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Beata Michalska <beata.michalska@arm.com>, Elif Topuz <elif.topuz@arm.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Shubhang Kaushik <sh@gentwo.org>, Christoph Lameter <cl@gentwo.org>, 
	Huang Shijie <shijie@os.amperecomputing.com>, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 17:41, Christian Loehle
<christian.loehle@arm.com> wrote:
>
> Picking the first eligible idle CPU leaves a scan-order bias. Concurrent
> slow-path selectors can choose the same CPU before either task is enqueued.
>
> Use reservoir sampling for equal exit latencies, resetting the candidate
> count when a shallower candidate appears. Use the per-CPU scheduler PRNG
> and reciprocal_scale() to avoid variable division or a second scan.
>
> Use a u64 latency key with U64_MAX for unpublished states. Published
> states take precedence; when none are found, sample among the idle CPUs
> without a published state.
>
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>  kernel/sched/fair.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index ff5793bddc35..810343f40316 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -24,6 +24,7 @@
>  #include <linux/mmap_lock.h>
>  #include <linux/hugetlb_inline.h>
>  #include <linux/jiffies.h>
> +#include <linux/math.h>
>  #include <linux/mm_api.h>
>  #include <linux/highmem.h>
>  #include <linux/hrtimer.h>
> @@ -8458,7 +8459,8 @@ static int
>  sched_balance_find_dst_group_cpu(struct sched_group *group, struct task_struct *p, int this_cpu)
>  {
>         unsigned long load, min_load = ULONG_MAX;
> -       unsigned int min_exit_latency = UINT_MAX;
> +       u64 min_exit_latency = U64_MAX;
> +       unsigned int nr_candidates = 0;
>         int least_loaded_cpu = this_cpu;
>         int shallowest_idle_cpu = -1;
>         int i;
> @@ -8479,12 +8481,16 @@ sched_balance_find_dst_group_cpu(struct sched_group *group, struct task_struct *
>
>                 if (available_idle_cpu(i)) {
>                         struct cpuidle_state *idle = idle_get_state(rq);
> -                       if (idle && idle->exit_latency < min_exit_latency) {
> -                               min_exit_latency = idle->exit_latency;
> -                               shallowest_idle_cpu = i;
> -                       } else if ((!idle || idle->exit_latency == min_exit_latency) &&
> -                                  shallowest_idle_cpu == -1) {
> +                       u64 exit_latency = idle ? idle->exit_latency : U64_MAX;
> +
> +                       if (shallowest_idle_cpu == -1 || exit_latency < min_exit_latency) {
> +                               min_exit_latency = exit_latency;
>                                 shallowest_idle_cpu = i;
> +                               nr_candidates = 1;
> +                       } else if (exit_latency == min_exit_latency) {
> +                               nr_candidates++;
> +                               if (!reciprocal_scale(sched_rng(), nr_candidates))
> +                                       shallowest_idle_cpu = i;
>                         }
>                 } else if (shallowest_idle_cpu == -1) {
>                         load = cpu_load(cpu_rq(i));
> --
> 2.34.1
>
