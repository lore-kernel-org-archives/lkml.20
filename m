Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6483603EB
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559981; cv=pass; b=DTSnYdRNQ9xgd5vBjh05yzlazsXEaxX/J6trOVxak/8Ipx3q8xkx/yiH92R4SDtILj8JPSYV7AbE5OcbfGOtPM58cF9b0bkSfnop98NW41iyjtkFegp8Ea2Nq2yxYS8wQXFZVgMtdNqWSQ7Wtt4c/wOsPGB0h/AUvecuBsCknNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559981; c=relaxed/simple;
	bh=i+0vhK7KdeGd+TGTohnPLeaq8+FtlOZk1wYHZyh90FQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qbuT0XEb33tGdW2NQjcR6Z7UPWA71lvizXWB1FPPAzDivtwJ+sjc2Dt797s5ktjM19+b4twd35ExL7kl4Rs3foprnnEdsw4DlpOfcUSXmpvuPp0LnFIhNK0sr5VJxCh73FZyGDjA3iwVjuSsp8kd6Ix4p77x6T7yHaMMSbRDkj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CtZrAhk0; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CtZrAhk0"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso3287089a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791559975; cv=none;
        d=google.com; s=arc-20260327;
        b=svbCI3T3GeFXKbaMLVyv0WWMnOlakCvdnnZremcfu13g6eMc3O4abETSXMTz7UFtZm
         pX7kJVHUznXcwrjNEAqu+mJONWVP0WiMW8NrFIAmZAhyCjFe+6WH6x/Ou3Dz8A4sC8RJ
         ddp1EXVQ/IdthyMZJliAPDD/361EBvFbQtcZe8w6IN2zVfrNlI54lsi0P5N0MLc0yLMA
         HMpE3s2LcRfesZzXUe8DrxapzWvUlRw/CVOsKDvR4Eo33DWykmKMlv+Eht6pT3Bwvscm
         wKxQXoJivg0hoa5yK9WzZ7LfW71ibnLOO63bt5eOUNOilPD73++hmo5J+/bK+VwD8Rar
         n6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YuC8idDGGF55BIM+qITaoxGd31XXSYrZn6NB7JRdTHE=;
        fh=gBJQuj2O+EOmP2/sh1zmWl1+r3jpqTzzb6TZWbIWOzY=;
        b=eSOb8PY9ac2NEfyx3qH04NWZLgcmUysTbKWM5lEP8avPjkODKcc2vAX99eemiCqEnq
         Kic5IESHJFI31lgMxFIKQVjqCOixz24skX2CrpmVU9tck8XQPf3OBGDOmL0dB8KnezuU
         EIVkzmOe8j7ae05rXQcGdHWm56BuNMOu1xTeiLhkvtXfzCR/5BHG+wPlEPN2YAUQnKEQ
         /t0m7FzQXg0vdP02eLMIDkNdHxTpc5Qk2YmMnEkm/k7hwqIn+b38L9OJM3vtrPJ4e+9r
         w7gxE2jiO3Do5G/35Ph2UazGw8msqz1+pnL96xFv2rNpRGmf0e/b2O5GwEz5blbRwnbw
         SS0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791559975; x=1792164775; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuC8idDGGF55BIM+qITaoxGd31XXSYrZn6NB7JRdTHE=;
        b=CtZrAhk06XJVPA3KbHXo5YjFBR/aoyoBajOt7gh06knG8NjYhGncWVUiZwdLftW+Ye
         BM4TfdgAchHN/SVbhZy12Yb5AKTI92DS5o0SWbAToipit4ymSgqH/0nkbkPg2KFm9V/n
         vns0SmZdFxVdavIq83XTxmXyYB4z722jpnWRNGRs3DFfvBRyKSryi96YZTMxbwo9lnTb
         z8bsDiuDPb5Z3jnR0t16Nq4Fo3yin0BgkX5Zbh+uCfE/3dLo8n5m+7yK8RvgA/WCK+41
         SRFNm6MrHAQl+VtuOUsNwIAXDzdbYKeasYeCqm5zmapUuXBo9kPeNrBPBay5Xpf14LXb
         HwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791559975; x=1792164775;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YuC8idDGGF55BIM+qITaoxGd31XXSYrZn6NB7JRdTHE=;
        b=qfCFcx1KoUozOBCAUwNQq1PCljLKbtEWNxDDMUd4cfS9sYtqS54AYs8QjUxnQzwpXi
         V1/seC28X5oYGA5j1Hqsz1glH3qv8lSS65lVYvpxTn3jw9xUwYP9O0ULwvcrpZrAQelz
         BsQP+1Mnyj0NFcqk9Fw4qbk5BacG4szlnhuVP2wvUqtHrh8z/19WEyYdsZT/mQyfy5y9
         EjXBlNGUD1aPJqGjlVwWE0FpIam+L1ZcBxXA+K6vDI6lXTga9t5SsdsoeOAACfgMIGga
         pUO7+sQlT3YTiGMqrlJdtmK+Abqy48ap46MKPy3bG4nWeDg8fbCKK+PRLFBuZMDsBrTi
         3r8w==
X-Forwarded-Encrypted: i=1; AKwUvBz+iWs5y+yD9ol8GzY1ng8L2yafI95L10YZlKXPTLgz40LnQ0n/uCJi1NyzdtQJrmdlTG0mKka7L2Dcgjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZgXeFmRtJKbrSNZKKvzl4CSuJct5jplxFK211WU0VhqDhF/pK
	VcL0xbvZBuGODNe3FYbVe1BTUvHJrJrH/Bdy+aNMbGUoJuAPHb26ZRtwtdD1iWZoWRhMz+FpJuP
	bHgvVX5Nhejlxhql8L4k47XAHKSmrtr3zK37JBlSEdg==
X-Gm-Gg: AYBFou285XQ5JJtocVPvrIMIAxP929Ka/W/HkXTJu5hVEPuEehDJ7e+q0H3XPkfSX3Y
	x5lCNUhmzM5M78wtAF/vdcF2nevfIattDUu8XRcpUnDqjDCA2AJkhN3u9ChPjENOCKv3DRhC8Wb
	MT7tjBl8ltq3XNqnfQIgq0AnUk1smZ7ArOZxDhzaRJXyQvTMTE3cizVo6HUzRNvDqlrEpLEoBiT
	UsGxTd/PnCNDx8DObtMc92JECyvtaKdmvEm9oOBTWpzAZ/StH+wiKor6IRLB12WS9i5diqu+DjY
	MnnSmb50BxlWGMo+zxCO2sp7sfRK0CnINr1jbLcc1KQux3+Kw5snq/6jRhOlYHSolv63QTWg/Ua
	9guzvnMS7AfYhXGn39VZrkQ==
X-Received: by 2002:a05:6402:a215:10b0:6af:a5bd:419d with SMTP id
 4fb4d7f45d1cf-6b17ae879d0mr1750601a12.4.1791559972891; Fri, 09 Oct 2026
 08:32:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-hiperdispatchfix-v1-0-73fe41081070@linux.ibm.com>
 <aseIPhrDGCYFtJNE@gpd4> <90454932-1d82-450a-ac4c-499acdedb9d7@linux.ibm.com> <ffbeae31-0e93-4386-8e0e-dba13960b283@linux.ibm.com>
In-Reply-To: <ffbeae31-0e93-4386-8e0e-dba13960b283@linux.ibm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 9 Oct 2026 17:32:41 +0200
X-Gm-Features: AclHuK8rsnsr2XjircQ2Y2044oxS5c-q2qAVaXI6vBuK4i4-8JPIJQDlG10RXcU
Message-ID: <CAKfTPtCianGNWSu0s2J_B_aO_rtKWO17k9guYmwgXXLUHQE+SA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] sched: Introduce idle SMT priority for asymmetric
 capacity systems
To: Mete Durlu <meted@linux.ibm.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, Andrea Righi <arighi@nvidia.com>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Tim Chen <tim.c.chen@linux.intel.com>, 
	Chen Yu <yu.c.chen@intel.com>, Ilya Leoshkevich <iii@linux.ibm.com>, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Oct 2026 at 17:25, Mete Durlu <meted@linux.ibm.com> wrote:
>
> On 08/10/2026 16:58, Shrikanth Hegde wrote:
> > Hi Meter/Andrea.
> >
> > On 10/8/26 5:40 PM, Andrea Righi wrote:
> >> Hi Mete,
> >>
> >> On Thu, Oct 08, 2026 at 10:30:46AM +0200, Mete Durlu wrote:
> >>> Summary
> >>> ===========================================================================
> >>> On systems with asymmetric CPU capacities, the scheduler prefers
> >>> fully idle
> >>> cores over idle SMT siblings of busy cores. This works generally well
> >>> but
> >>> virtualized platforms where low capacity cores should be avoided are not
> >>> considered. Introduce a new config option and arch hook to prioritize
> >>> SMT utilization.
> >
> > That's true only under physical CPU contention right? or is it always?
>
> Right, because of that s390 treats all CPUs as equal and starts to
> assign lower capacities to CPUs with low entitlement once a certain
> steal time threshold is crossed (aka physical CPU contention).

I'm not sure to get what your topology is because "if s390 treats all
CPUs as equal"  then you should never use select_idle_capacity()
because  their capacity should be fixed and equal and
SD_ASYM_CPUCAPACITY_FULL never set.
If your hypervisor lowers the capacity once a certain threshold is
crossed, we already account for the steal time in the scheduler with
irq and remove it from the capacity available for tasks but the
original capacity doesn't change.

>
> >>>
> >>> Background
> >>> ===========================================================================
> >>> The scheduler has been moving toward better utilization of fully idle
> >>> cores
> >>> and avoiding SMT penalties. This trend (notably after commit
> >>> 25a32e400a14
> >>> ("sched/fair: Prefer fully-idle SMT cores in asym-capacity idle
> >>> selection")
> >>> broke the behavior s390 is relying on to concentrate workloads on its
> >>> high-capacity cores. On s390 CPU capacities represent the CPUs runtime
> >>> entitlement assigned by the hypervisor. The idle SMT siblings of busy
> >>> high-capacity cores start to perform better than fully idle low-capacity
> >>> cores as the whole machine(containing the logical partitions) starts
> >>> approaching to a {fully,over}loaded state. Grouping load on high-
> >>> capacity
> >>> cores keeps shared low-capacity cores(which are shared more
> >>> aggressively)
> >>> idle longer, reducing noise to neighboring partitions and improving
> >>> overall performance.
> >>>
>
> [...snip...]
>
> >>> Considerations and Open Questions
> >>> ===========================================================================
> >>> The main goal for this series is adding a simple mechanism for
> >>> architectures to switch between idle core and idle SMT priority while
> >>> keeping the introduced footprint as small as possible. But there are
> >>> some ideas and questions to consider;
> >>>
> >>> 1. Should arch_needs_idle_smt_prio() hook be removed?
> >>>     The architecture hook is there to allow for any sort of logic to
> >>>     dynamically decide when to flip the mechanism, but it can also be
> >>>     removed if everyone agrees that this behaviour is not something that
> >>>     should be dynamically flipped. It can be simply tied to detection of
> >>>     asymmetric capacities and selection of Kconfig option.
> >>>
> >>> 2. Is there a simpler way to implement this mechanism?
> >>>     The proposed approach is chosen as the other features effecting the
> >>>     scheduler's behavior, use the same method. If there is a more
> >>>     efficient way to implement the same mechanism I'd be glad to use
> >>>     that instead.
> >>>
> >>> 3. There are no performance measurements *yet*.
> >>>     On s390 the ideal conditions for this mechanism to be beneficial
> >>>     usually surface when the whole system is fully loaded and resource
> >>>     sharing between the logical partitions starts to get expensive.
> >>>     Creating such an environment requires time, therefore no benchmark
> >>>     results are available yet.
> >
> > If it only under contention, then you probably don't want to use low
> > cores for
> > anything right? If above is yes, then using steal governor would help to
> > avoid low
> > core if you mark them as non-preferred. (which i guess you guys are
> > exploring already)
>
> IMO it should be dynamically adjustable depending on the contention
> level. But yes, on worst case low capacity cores should be avoided by
> marking them as non-preferred.
>
> > But, find_new_ilb isn't aware of preferred CPU state as of initial patches.
> > I had thought of making a change to pick a idle preferred CPU instead of
> > a idle non-preferred
> > core for idle load balancing. It is not done due to below reasons.
> > - Performance numbers didn't show any major improvements with real life
> > workloads.
> > - Code becomes quite complex for find_new_ilb.
>
> IIUC, find_new_ilb() finds an idle CPU that can do load balancing
> for other idle CPUs. As long as the tasks don't land on non-preferred
> CPUs, where ilb occurs should not matter. (At least for s390)
>
> >>
> >> I'm wondering if we could build on Shrikanth's cpu_preferred_mask
> >> infrastructure
> >> to express a "soft preference" for the s390 higher-entitlement CPUs.
> >> Unlike the
> >> mask's current behavior, soft preference would allow tasks to spill
> >> onto other
> >> CPUs once the preferred CPUs have no idle threads available (we have
> >> something
> >> like this in sched_ext's scx_cosmos).
> >>
> >
> > cpu_preferred infra won't allow to spill over if preferred CPUs don't
> > have an idle CPU.
> > It rather enforces packing onto preferred CPUs even if it means rq has
> > more than 1 task.
>
> I think what Andrea has in mind is something similar to what he did with
> select_idle_capacity(). Depending on the state of the non-preferred mask
> and other factors cores and SMT siblings can be evaluated as ideal
> candidate somehow. Wouldn't it be possible to extend the
> infrastructure you introduced to achieve this?
>
> >> That might let us preserve the general preference for fully idle SMT
> >> cores while
> >> searching in this order: fully idle preferred cores, idle SMT threads on
> >> preferred cores, then non-preferred cores. This current patch series
> >> seems to
> >> drop the first distinction, allowing a partially idle preferred core
> >> to win even
> >> when another preferred core is fully idle.
> >>
> >> This would need to coexist with the steal governor's stronger use of
> >> cpu_preferred_mask, so I'm suggesting it as a potential direction to
> >> explore
> >> rather than a drop-in replacement.
>
> I think this makes a lot of sense. An approach to first fill preferred
> CPUs before spilling to the non-preferred cores until contention
> forces the evacuation of non-prefered CPUs.
>
> Shrikanth, would it make sense if I try to find a way to extend your
> current implementation in this way?
>
> Thanks!
> -Mete
