Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAC33B71B7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028370; cv=pass; b=p6qOoxbpi2wmDRjHMwyym/XpviAJd86ZzC2TSpFwxgV7ch7q+JTcGacGWXRHvPjN+gDVWQf3pvSOOgw4/Yo2UTOApUM1Q+o17KNzG4ABonr3HZzbB9I9rbRKw+H3iRuru7OmiZZeU13XWuAN0o4rLy+jW5oTLcy4ddqdwlEX+ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028370; c=relaxed/simple;
	bh=K2GAiQiK/4u6Ovc1cbUO3z+pu5qtI5i/H1nT+4BbYT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=In+1LQtpLM1J+qDBK0TEo2angJe5i4s4U/elaSbfm/7SsRhkgvhTL4PUDmW3ku7MYy/1552h6RMdJ08Mx0W96keTBfMDvxGH8JxG2+3YBjk39HRm0CRzLaFPLZnIBe6CoaTLrkIpZ6aQJ68qukjtPkGaVWt8fDffn975k8EFcl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F916H9Y4; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F916H9Y4"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1fso298051666b.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789028366; cv=none;
        d=google.com; s=arc-20260327;
        b=eoxinjsU6Rmn/h1/LYRNHIybTl+sT28JgyfAsmoonlkmJnoMjB1AVAgXDPoUCNfGbM
         nBxgJkH8ru5hOeGqCWgzCMtkKGnw5GbbGtHgWN7taSJWoksHXweSPGJw43fBIdFTGnmW
         QMRyJ9Pfp1W+4MgMx/Nc90+VMjNcNwjp9gdbze4+tdbAXnBsiT+nnim8Cz9nDVAx1NYR
         6ZRq7FpRcPU5yGdw905Siw9bDly5nYP34yIM63tU42fbdQzTHVk3x5VQtBLFRyt1pUX2
         gMagcR27kJpGyd7262PKHJolqW7J7rtFYt9EUEDBz0XU+EOEZJaiN2LpEgQFsFICcx9X
         WG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QoLOo1pL9NwyVcDoXZ1U/S/IRYh4VYE5bjthZYgZJ5s=;
        fh=+niziz8WjwSb9xGNlwjmyQ+mhtdhoCQmXrs4hyrLHQY=;
        b=eBRW7+02d5hXiQa5C0v4MBMjITxNqsB1Oe0+QUXH76D90kIzaGJhLIFIKqKKIbrP4n
         oHjICDHDDsU28ZLcu9GOuQxA1VcwseQbWaf97KYbKyibYLO7bgclbM+PCJQCWEouQRG9
         zLVXRfZdSuGQ4JzKaH61hNohywxOUB6pK50k07QArB66JxabJE+C2dySiUNt04jklder
         u4lM3FAnjvHncKNiQeyBZr6OBzt2pK7oyOM5rfIY/BSm8OzWtN0xvQEQUClLH9XqWCVT
         XLpjfy4uCGQVq9/T42X2X4YoMTpelzve5H4VU2l6VXqbxy4k1EPdmPZ1m//huFv3n2fe
         YPFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789028366; x=1789633166; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QoLOo1pL9NwyVcDoXZ1U/S/IRYh4VYE5bjthZYgZJ5s=;
        b=F916H9Y4go+GInpcVb83p5OjDIGrrpvulobU4ERrGFqvSdXW1i6tYti6jvRz6nxrft
         fSeCUBCYfld+EHxbX0TDuR/GiWi0biQWDzb0KfcvKX4luuLt7bLLN3sFkPrkcPtxLRZz
         whF+knYe52+pSBa6nUhhXxvpKUw8d1q85rPHTOaBUXgQJT5jqPJQdQzsjgeSSksogCKz
         BErN3G9SgXNydMwv4RCymmUy+GFnLQGzVl3ET/fs2jVRAhIpCjzarWdHFRVMu/gFgc0Z
         8LBJyjg756kIAlvMSEXnRi4A9gu6BnD/ZCEaU7lkPosoxO9uLeBPaC/6KwCFBiM94kw8
         Y0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789028366; x=1789633166;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QoLOo1pL9NwyVcDoXZ1U/S/IRYh4VYE5bjthZYgZJ5s=;
        b=dDOIE63Ei4bgDLEmMMPQR1qnb+wXgQoZldllNqeAUMzP8JLAKLOHoc36x+ZZartJu8
         wZCETcw9l7TZMBbKiTVvAnCpJ/237UXDx71TguYS5zPYFD2QIYV0QchPaYEISx/ViaUB
         i89MaAel/qnhK1qMNGU3b7FK9EcRnwDrXnt88aBb2I0fy48sU8PcvO3wjBUqAUZ3uMS8
         HRvse52lPJ7JdX1b3DGvKUFMfx4fchXQNCE0sgf2GNF5Djqpjl2nfLhItoCqVYcOlAUj
         ukdY9SNYA4KdtGMr9+GpgeUyD23vOMBForNGeU2BBmsPWl79CxLaKmJg/xwa6++1OhIv
         CKVA==
X-Forwarded-Encrypted: i=1; AKwUvBwht9KecRxNRkEEE+AX2jTmQTzXRtIXDJBtnlDMOj2mQoq5YNatGVBgfjAM+hKaijsefSAtdgmEh5Y7DMc=@vger.kernel.org
X-Gm-Message-State: AFuF++meOM81KLqufTGvww6AbUC61p9bd9Oybolfy9FPiSemGSCkYKUF
	jQ/whrYYQTTsCNCm1QNA29bx/LlMKfaMJehKA9ruuGC+mNxs4YjUKaWppnLFfRKnrlNdDU8hwjV
	BsgMbkH3jK8FDdOzDosYXhBuFGDt+WsLIrDob2OvHVw==
X-Gm-Gg: AYBFou1yEg9Nqikh/Djaf+/RM/YtfDlUcaUsNv3jFYy8MNaqvnjJaSlIfmZwmQGUFRV
	1J8MF70y8DQhz0Lx8XQNwqN3ZThqRdnAFJb/Oid4JZEgp6ijLzoMcJbGhgYdITduRC47UnkyQSY
	p6xtSpw4U8UKINvIiWTRT/5ieSzBmBTrCykdZklF0UIZ9VbGUzOuo6IvX4SBp8UbrZ9a/2CPQ08
	AvwZc6Pkq9GGA9ksLDsU6SJjn2FV0AKho9iaj0X3HmjxxxerYrbY1/nNo9zvIZ8SJO/PFMkZZ1Q
	30oy6ZZokPsi/u3FHjR8qEpYZIXEW8n1y9NvMhtgkVQ3KYzrG/s865aqLadpxPLu4vyFRk03gfm
	VYe30Y7S6DQoJ
X-Received: by 2002:a17:906:7308:b0:c25:8e53:45ca with SMTP id
 a640c23a62f3a-c292b1d17c0mr1019545866b.21.1789028366226; Thu, 10 Sep 2026
 01:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910042950.1619727-1-jackzxcui1989@163.com> <20260910042950.1619727-6-jackzxcui1989@163.com>
In-Reply-To: <20260910042950.1619727-6-jackzxcui1989@163.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 10 Sep 2026 10:19:13 +0200
X-Gm-Features: AcwNN1WCPNUfbHwVPQC6u-JCMBrpBQBPwJmyEif5Q5jKdFl1o7AzP9-8o2TbVQg
Message-ID: <CAKfTPtAmB8pQms38CWoXPmG7bL64mY8L7Gyd=_LvNoM7wvEgdA@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 05/10] sched/fair: Introduce
 select_task_rq_fair_thin() to select rq when LB_PROMOTE
To: Xin Zhao <jackzxcui1989@163.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 06:30, Xin Zhao <jackzxcui1989@163.com> wrote:
>
> The logic of select_task_rq_fair() is relatively complex, and on typical
> embedded systems, the number of CPUs in sd_llc domain is often limited to
> a maximum of 4, and sometimes only 2. This makes the complex logic of
> select_task_rq_fair() seem less necessary. Additionally, the update logic
> for the nr_idle_scan value that select_task_rq_fair() relies on is also
> quite time-consuming.
>
> Moreover, embedded systems require better real-time performance, and with
> fewer CPUs available, it becomes necessary to bind certain tasks across
> the sd_llc range. The default enabled feature, SD_WAKE_AFFINE, causes
> select_task_rq_fair() to take the fast path, often overlooking some idle
> CPUs across sd_llc domain, leading to increased scheduling latency.
>
> To address this, we introduce the select_task_rq_fair_thin() function,
> which serves as a streamlined version of select_task_rq_fair(). It can
> quickly perform CPU selection while also considering the real-time
> requirements of embedded systems. select_task_rq_fair_thin() retains the
> priority selection logic for prev_cpu and recent_used_cpu, and it will
> prioritize CPUs within the sd_llc. If there are no idle CPUs in the
> sd_llc, it will then look for other available CPUs to run.
>
> When the LB_PROMOTE feature is enabled, select_task_rq_fair_thin() will
> replace the original select_task_rq_fair(), and the update logic for
> nr_idle_scan that select_task_rq_fair() relies on will no longer need to
> be executed.
>
> Testing has shown that in our system with 18 CPUs running at 2.1GHz, where
> the first three sd_llc domains each contains 4 CPUs and the last sd_llc
> contains 2 CPUs, under same fillback scenario, select_task_rq_fair_thin()
> executes 25% faster than the original select_task_rq_fair(). It saves 22ms
> over a 10-second period, with this optimization accounting for 0.174% of
> total system time. Additionally, we measured the execution time of
> update_idle_cpu_scan, which took 0.5ms over the same 10-second period. If
> we use select_task_rq_fair_thin() instead, this time can be eliminated,
> accounting for 0.04% of total system time. Therefore, the overall
> optimization contributes to a reduction of 0.214% of total system time.
>
> Signed-off-by: Xin Zhao <jackzxcui1989@163.com>
> ---
>  kernel/sched/fair.c | 52 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 20d03ceed9d7..f10e709921fd 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9661,6 +9661,51 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
>         return target;
>  }
>
> +/*
> + * A streamlined version of select_task_rq_fair().
> + * It runs faster than select_task_rq_fair, especially when there are not
> + * many CPUs. It will prioritize selecting an idle CPU in the following order:
> + * 1. prev_cpu
> + * 2. recent_used_cpu
> + * 3. cpu belongs to intersection of sd_llc and cpus_ptr
> + * 4. cpu belongs to cpus_ptr but not belongs to sd_llc
> + * If there is no idle CPU in cpus_ptr, it will select prev_cpu.
> + */
> +static int select_task_rq_fair_thin(struct task_struct *p, int prev_cpu, int wake_flags)

We don't want yet another select idle cpu function.
The only reason select_idle_sibling() would not select an idle cpu in
your llc is nr_idle_scan which will abort the loop before checking all
CPUs. You should look at why nr_idle_scan doesn't keep all CPUs in
your small size use cases


> +{
> +       int recent_used_cpu, target, cpu, start = nr_cpu_ids;
> +       struct sched_domain *sd;
> +
> +       if (likely(available_idle_cpu(prev_cpu)))
> +               return prev_cpu;
> +
> +       recent_used_cpu = p->recent_used_cpu;
> +       p->recent_used_cpu = prev_cpu;
> +       if (recent_used_cpu != prev_cpu && available_idle_cpu(recent_used_cpu))
> +               return recent_used_cpu;
> +
> +       target = prev_cpu;
> +       rcu_read_lock();
> +
> +       sd = rcu_dereference(per_cpu(sd_llc, target));
> +       if (sd)
> +               start = cpumask_first_and(sched_domain_span(sd), p->cpus_ptr);
> +       if (start >= nr_cpu_ids)
> +               start = cpumask_first(p->cpus_ptr);
> +
> +       for_each_cpu_wrap(cpu, p->cpus_ptr, start) {
> +               if (available_idle_cpu(cpu)) {
> +                       target = cpu;
> +                       goto unlock;
> +               }
> +       }
> +
> +unlock:
> +       rcu_read_unlock();
> +
> +       return target;
> +}
> +
>  /*
>   * select_task_rq_fair: Select target runqueue for the waking task in domains
>   * that have the relevant SD flag set. In practice, this is SD_BALANCE_WAKE,
> @@ -9682,6 +9727,9 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>         /* SD_flags and WF_flags share the first nibble */
>         int sd_flag = wake_flags & 0xF;
>
> +       if (sched_feat(LB_PROMOTE))
> +               return select_task_rq_fair_thin(p, prev_cpu, wake_flags);
> +
>         /*
>          * required for stable ->cpus_allowed
>          */
> @@ -12564,8 +12612,10 @@ static void update_idle_cpu_scan(struct lb_env *env,
>          * So the write of this hint only occurs during periodic load
>          * balancing, rather than CPU_NEWLY_IDLE, because the latter
>          * can fire way more frequently than the former.
> +        * When LB_PROMOTE is enabled, select_task_rq_fair() is no longer
> +        * used, and there is no need to update nr_idle_scan.
>          */
> -       if (!sched_feat(SIS_UTIL) || env->idle == CPU_NEWLY_IDLE)
> +       if (!sched_feat(SIS_UTIL) || env->idle == CPU_NEWLY_IDLE || sched_feat(LB_PROMOTE))
>                 return;
>
>         sd_share = sd->shared;
> --
> 2.34.1
>
