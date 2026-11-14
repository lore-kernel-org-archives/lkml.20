Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794647201;
	b=jFUk3TwBZAT2v71IVEBJeqkigmcTgoUkBTUDEIV3Hbpr5M44+PqO1QJqbika5BpYQ5u7
	 kdNVeENv0SUNBDflKFxbsbzM5Gs8UtFxy7sGicSoRQGXda8LQGRlUBuJNOWLcMsZf9m40
	 pnYK+zEwPZklTfV27W4XqFEb+mWvy/YM9MQ1eEtTlfrSNlPsJkp9oGsihzsXPPZXGhaXV
	 jq8eAGFIZ7tnsFXh6+EFsfOp+e53asVh0wEcVc0weexF0epl+GKoKIokTozB33Z7KO/zw
	 z/6XRf+eJ3SyaRhGNsSX4q/lZC5fHh/6nBOpmwAcQoRhdlO+BFK2f8bFFW3gFFEwzhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=KC/D7lIYHzmkgBpZ+9jVAdY9saV20tL5VSJJ2hWkrLU=;
	b=lhW2VfnruBuf7d/Lf5dEoxGGuUQzdhbmZOQ/VSvJ025++N5Jxt6rmy8STS+h5nGcqION
	 qwLgbBkY5zvNXZoHdQwyG2tPO9Z3lQHkUqIPFCdpa/oGHbiCLbNKw/VadvkBSEYeOty/s
	 ElnCo76ijNt51PggHe9gpR1Wiuayl7D8MyEzY77+AaTHSV3E4lwO8Irrf8H0IgpxvlEMN
	 5ISzvu/eryhRcVX52Tgt0PRxNBfI5dJWDqYptTGF50zerzcvgsvnSPbN17Kk3q3guMLUt
	 CQ+x3tiCMCgscVXhCdCY+DTfqwf1j99mQ19zPkZj7naKX+1Gwekz+QSHTdvbbp+BFiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KAPee24q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C926606A8A3
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C926606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KAPee24q
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b71b012e3cso2355285a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:06:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794647198; cv=none;
        d=google.com; s=arc-20260327;
        b=qyOYb9aNNSR3fHD/eOsfnm+4C3U03CWvC+7Le2j7HoZZbwOx/HjXIn+SRc23typE5a
         Sg4PYfj4WyEySyDTZUrSsji470geioJxaWH+ZuSl/BGi+O+ePueoVzGmINocqOv7OFhZ
         n+hLBk6x9EAjDNT6xVH5/XWJLYSsejChVFI/SpwtcgiVnOmI+bIKLagU5PTqIOkrJAep
         oPXgJD95WAEv8pAoRVvjhSrbjIUPuEy5Q+ofwesqfVD0ie2ALiSfvzxu1pF5aOnWjJna
         2tZu6VGcIAbux2uA0Hq/SUL8pWR1FGl5v7SQJ7WqO+wlPo/OJAqdyjM/ZoFIcaBKLMzI
         lbeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KC/D7lIYHzmkgBpZ+9jVAdY9saV20tL5VSJJ2hWkrLU=;
        fh=bNcHxkWoE7rHfQxAexbYOHsiKwHEdfgdHfYJsxxKYHU=;
        b=hm+1eQ4g/yUKwyZ12glYaYnzEY7VPpWJ/6UN6Ed6QG/7RRjpFWgFSCDyFBYl5Um9lk
         HVi5ldk4CvrzrFnX6ymxTLi+K+L0j0d1Cf8F2G7/SXmQTgYZFy1If2IZ1zIaoQhuGAiy
         cVDsRG1f91aXeM5lDPB/cLVWGOiPDPd3/n7Hb8HK4OlZC3gvHVwyIqXUrL1zGKcYGKkQ
         cmvpEFAVjj3HgrQykHE9L392A73tsKz84pkRGpPJujs8xKgICd2PXjwGaSjOKBQ1IdqM
         TdPtnFU1bwAxLSmPpCWptdJkwYRrLy2rjBZ/ZDu9u1DMHL+zMgroC7MYNlLHHfcaOz0X
         t7PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794647198; x=1795251998; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KC/D7lIYHzmkgBpZ+9jVAdY9saV20tL5VSJJ2hWkrLU=;
        b=KAPee24q6sgn4tuwSJPcT5mLv4nmEJVkDQTJnS3b+A4tCcKaMvDPOKxx1Aj0rGa2QG
         leV18YbE0vVTDhU6LlzF8ZTir96MSfp1D2V5a222yjeNBxo5wagZiO/Hvlp4pN2zlZEv
         zjPCTuFUfgk6vHc1CIzwSsiGn7lPWY1kINJj1S8C8gFjTkfHPDCH1bWLsj1S7GvjH1Uw
         kkP2Dpe85Kp+wwGyRSZPVJrpSiifJHeFp9Yvp1P3aUVrF41YQ4YzFYP7QidbmC3DxWva
         vhXpThWJ6cLfCK9UzT26tub/pSdMc5opTCc+FAnKvTp8qMyme2PvTxUQdpWKoB8soGua
         csMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794647198; x=1795251998;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KC/D7lIYHzmkgBpZ+9jVAdY9saV20tL5VSJJ2hWkrLU=;
        b=QWzAqzU1/98JPOlwqR3CW3OtUH5oWj7x4z4DneX1MWhS1N7dEpSwu4aKA2oHAG8YJ2
         xmJFlSCysnVsozaQ26TwRfsTj3aAcTBUt91Liuo6oI0v1yS5WIGRzSmuuU6gRrU/bqzb
         g6BG/9KcIo3+Rr8GlwbhkrbrXQRuvw1puneJbE/4lqx8hnuKFt0t9HVT1tUNaZ8LnYWd
         IGZsqh9HXPuOhkE9RcEztALnsL9vOTCl0rfPuBEd7GFSS3WiLTY966U0VwdRXGNBNhfR
         gYBqWN0YUklel+bN1VJnoe13BQIQ8m97fIe0YN1W1kSipmIU8Qv2srt8QarQf6e+hFJs
         f3BA==
X-Forwarded-Encrypted: i=1; AL+hErHkAJ1KvMXnxG2Gzp6HK/ZQfn3g8WhMKbrt3hH2U+6Wu9/ja6s/XlEyAfh9EFg7x4Kl7fte2x+e2qNMpYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vqpvPHUD9E1L6W4T4LTFGvldA22UteVniXl9kZmD5luH20yOD
	HiLITs4rCfTQYxeW7KL/nCVITqVzehO+yLLJne+UeEExNB7pYQrSdXsHH6DiKMQgvjgTsGfTHSf
	feRQ+NUBLrMpIqSEK3A/5Tsxuj7UoBsvjWX+YYCWUDw==
X-Gm-Gg: AYBFou1uUpUZiknv0ys4ZGnwIFwHDqHs7COUtVUrLWpI4u8hG/iC0M87IG1Tp2Nlkx0
	4aSVwd1GotcCyv2FcGMCARnFlKlO6AiQTnNJUT6Y5s/4O7sXf4mBdS9UHgwhZyaPxRu+0BU4SoS
	OgxaazqzoXthxz24eRwatrISeMuc2qwI3m6NyPhk67IGmubCvmWHu83k+z5h6sngDNB6IcyRsEG
	plnF2G/4Ji2YiRhi3u6qOxCF7mf7qF8zjXI4xc6ysQOXsP9xB/Gjelob6EsVayVM6qtbBpHkvNO
	a2uf5oaEgQ/JeVnuxP8uP7gs8Xtr1C7jr+Qu9yvd55IR20Qslo0YI3bopAqZrwFSglSWU1eFMmO
	7nZ4rZvJQwfcQ/yb2yneNnxVg9bUrgNPy0GW164OkvUoGGiWLoIl9ItrRqoSyyKgMJFuu0ZsLl9
	Os6+tpG8Ql9w6+fg0=
X-Received: by 2002:a05:6402:4506:b0:6b7:defd:acf9 with SMTP id
 4fb4d7f45d1cf-6b7defdb6bemr1404551a12.34.1794647198143; Sat, 14 Nov 2026
 01:06:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avdIycF_mZV8CHKb@gpd4> <20261113182601.569981-1-usama.arif@linux.dev>
 <aveB5xbos9hRa3Nn@gpd4>
In-Reply-To: <aveB5xbos9hRa3Nn@gpd4>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Sat, 14 Nov 2026 10:06:25 +0100
X-Gm-Features: AclHuK_wLmstZb0WHt9M0jEhM6A8d8lYmDBXOAyA5nS1_mXmCAMCKdveqZ2jn3M
Message-ID: <CAKfTPtCgzJakXU1o7C2EMEVTnD_mVS_xrdOJkQ9d_70U4_yCPg@mail.gmail.com>
Subject: Re: [PATCH] Revert "sched/fair: Add SIS_UTIL support to select_idle_capacity()"
To: Andrea Righi <arighi@nvidia.com>
Cc: Usama Arif <usama.arif@linux.dev>, peterz@infradead.org, mingo@redhat.com, 
	kprateek.nayak@amd.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	samuelcrossley@gmail.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, kas@kernel.org, riel@surriel.com, 
	Arnav Aghav <aghav@meta.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 22:32, Andrea Righi <arighi@nvidia.com> wrote:
>
> On Fri, Nov 13, 2026 at 10:26:00AM -0800, Usama Arif wrote:
> > On Fri, 13 Nov 2026 18:28:41 +0100 Andrea Righi <arighi@nvidia.com> wrote:
> >
> > > Hi Usama,
> > >
> >
> > Hello Andrea!
> >
> > > On Fri, Nov 13, 2026 at 07:31:57AM -0800, Usama Arif wrote:
> > > > This reverts commit 61ea17a63719 ("sched/fair: Add SIS_UTIL support to
> > > > select_idle_capacity()").
> > > >
> > > > That commit applied the SIS_UTIL scan budget to select_idle_capacity().
> > > > The early checks in select_idle_sibling() consider a few specific
> > > > candidates: the target, previous and recently used CPUs. If none is
> > > > selected, the asymmetric path calls select_idle_capacity() to search
> > > > the allowed domain. With SIS_UTIL enabled, a zero scan budget makes it
> > > > return -1 before that search. The caller then returns the selected
> > > > target, even if an unexamined CPU in the domain is idle and fits the
> > > > task.
> > >
> > > Isn't this consistent with select_idle_cpu(), which also skips the scan
> > > when the SIS_UTIL budget is zero? Missing an idle CPU is an intentional
> > > tradeoff of that heuristic. Could you clarify why we should remove the
> > > budget specifically from the asymmetric path?
> > >
> >
> > It is consistent.
> >
> > Symmetric path also has this (I didnt check this before sending the patch).
> > The service is running on Grace servers which report capacity differences
> > and updating the kernel from 6.16 resulted in the problem I outlined below.
> >
> > Maybe the symmetric path needs to be audited as well?
> >
> > Or maybe this service should not have ever run with SIS_UTIL at all..
> > (The only thing is that kernel upgrade caused a serious regression)
> >
> > (Should have made this patch RFC :))
> >
> > > >
> > > > The budget is derived from aggregate CFS utilization. High aggregate
> > > > utilization can coexist with idle CPUs when a task wakes.
> > > >
> > > > On a 72-CPU NVIDIA grace arm64 server, small reported capacity differences
> > > > (1013-1024) within the single LLC activate asymmetric selection. Both
> > > > the reference and affected kernels were observed with a zero scan
> > > > hint. The reference kernel ignored it and still searched the domain.
> > > > A latency-sensitive, wakeup-heavy production workload saw its reported
> > > > minute p50 latencies average 129 ms on the reference kernel and 223 ms
> > > > on the affected kernel.
> > >
> > > Have you tried forcing the symmetric idle-selection path through
> > > select_idle_cpu(), with SIS_UTIL both enabled and disabled?
> > >
> >
> > This cant be done from a running kernel, right? My understanding is
> > that the cpu capacities come from firmware, so cant be changed at
> > runtime to be constant across all CPUs in kernel?
> >
> > Changing kernel on a production service can be a bit of a process.
>
> Yeah, this would require a patch and a reboot. Unfortunately there isn't
> an existing runtime switch to force symmetric/asym idle selection.
>
> >
> > > It'd be useful to see whether disabling SIS_UTIL produces the same
> > > improvement there and whether symmetric idle selection performs better
> > > overall on this system.
> > >
> > > >
> > > > Disabling SIS_UTIL reduced the aggregate involuntary context switch
> > > > rate of worker main threads from 71.6k/s to 13.3k/s; re-enabling it
> > > > raised the rate to 73.7k/s. A five-minute disabled run also reduced
> > > > kernel CPU time per request by 10.9%. The available minute p50 samples
> > > > averaged 149 ms, compared with 241 ms before the trial.
> > > >
> > > > These measurements come from disabling SIS_UTIL on the installed
> > > > kernel. The feature toggle also disables the symmetric scan limit and
> > > > shared scan-hint updates.
> > > >
> > > > Restore the search of the allowed domain, retaining the capacity,
> > > > uclamp and SMT selection rules and their early returns. Domains with
> > > > no suitable idle CPU can again require a full scan, potentially increasing
> > > > scan CPU cost.
> > >
> > > Yeah, this is my main concern, full scans can become quite expensive on
> > > large systems with lots of CPUs in the same LLC.
> > >
> >
> > Yeah I imagine this was the reason for the initial patch.
> >
> > The same workload on 6.16 kernel placed 69% of wakeups on an idle CPU,
> > the affected kernel with the patch that this is reverting only placed 7%.
>
> That's a substantial difference, I agree the regression should be
> addressed. Perhaps this points to a limitation of the SIS_UTIL
> heuristic?
>
> We could investigate incorporating observed idle CPU availability into
> the SIS_UTIL budget calculation, rather than relying solely on aggregate
> utilization. Periodic load balancing already collects idle CPU
> statistics, which might help distinguish actual saturation from high
> utilization with CPUs still available.

We want to keep same behavior for select_idle_cpu and
select_idle_capacity with both using the same SIS_UTIL algorithm.

That being said, the current algorithm is probably a bit too cautious,
particularly for systems with a small number of CPUs

And for a latency-sensitive workload, it would be good to consider
setting a shorter slice to the latency sensistive task would run 1st
even on a busy CPU

>
> Prateek, do you have any thoughts on this? Do you see a way to improve
> SIS_UTIL for this workload while keeping the symmetric and asymmetric
> paths consistent?
>
> >
> > Do you know how much CPU usage can be attributed to the scan on these
> > large systems if you do full scans?
>
> I don't have a measured CPU-cost figure for this case. My concern is
> the worst-case scan cost under frequent wakeups when few or no CPUs
> are idle.
>
> Thanks,
> -Andrea
>
> >
> > > Thanks,
> > > -Andrea
> > >
> > > >
> > > > Reported-by: Arnav Aghav <aghav@meta.com>
> > > > Fixes: 61ea17a63719 ("sched/fair: Add SIS_UTIL support to select_idle_capacity()")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Usama Arif <usama.arif@linux.dev>
> > > > ---
> > > >  kernel/sched/fair.c | 19 -------------------
> > > >  1 file changed, 19 deletions(-)
> > > >
> > > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > > index d4cc0caee6265..def5cda2e6bad 100644
> > > > --- a/kernel/sched/fair.c
> > > > +++ b/kernel/sched/fair.c
> > > > @@ -9091,7 +9091,6 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
> > > >   int fits, best_fits = ASYM_IDLE_THREAD_MISFIT;
> > > >   int cpu, best_cpu = -1;
> > > >   struct cpumask *cpus;
> > > > - int nr = INT_MAX;
> > > >
> > > >   cpus = this_cpu_cpumask_var_ptr(select_rq_mask);
> > > >   cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
> > > > @@ -9100,28 +9099,10 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
> > > >   util_min = uclamp_eff_value(p, UCLAMP_MIN);
> > > >   util_max = uclamp_eff_value(p, UCLAMP_MAX);
> > > >
> > > > - if (sched_feat(SIS_UTIL) && sd->shared) {
> > > > -         /*
> > > > -          * Same nr_idle_scan hint as select_idle_cpu(), nr only limits
> > > > -          * the scan when not preferring an idle core.
> > > > -          */
> > > > -         nr = READ_ONCE(sd->shared->nr_idle_scan) + 1;
> > > > -         /* overloaded domain is unlikely to have idle cpu/core */
> > > > -         if (nr == 1)
> > > > -                 return -1;
> > > > - }
> > > > -
> > > >   for_each_cpu_wrap(cpu, cpus, target) {
> > > >           bool preferred_core = !has_idle_core || is_core_idle(cpu);
> > > >           unsigned long cpu_cap = capacity_of(cpu);
> > > >
> > > > -         /*
> > > > -          * Stop when the nr_idle_scan is exhausted (mirrors
> > > > -          * select_idle_cpu() logic).
> > > > -          */
> > > > -         if (!has_idle_core && --nr <= 0)
> > > > -                 return best_cpu;
> > > > -
> > > >           if (!choose_idle_cpu(cpu, p))
> > > >                   continue;
> > > >
> > > > --
> > > > 2.53.1-Meta
> > > >
> > > >
> > >
> >
