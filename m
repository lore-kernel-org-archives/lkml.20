Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5090A4E8E0D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065737; cv=pass; b=Fbq5jw/DSNzSVDPZZYCuPa9jNU1u+UQdfYrJoMosMAFiJZv2+s1/F6i+3wxZ8aKwA6fHseXrpbGuM4qXE/7sthOPduKVcnhA3DHOySw574iRE4XlgBG067fEnKLWRUtnJ/2xwlEp9mNXUefc9exgg4/RnCXJZv8Pyu8xUV4t6jM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065737; c=relaxed/simple;
	bh=ugSv4CYM3N2i0DNju0EHUA/uM7s+Ulvw7zSWPcq+/zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFdBRI3bk40aRzMsOCzX8ZeDB9fWdhh3p2yBvTbZOggproOhYc+fBJIVopTG3Kakgv/+ZklbADannhwrv/uHZ8M/1CjVaILm9ZihbVV6+Hp28hCv4exP2A8GxvfXc0VR1oLuok00Km9F2QQvRsKRNQ8WSP/ngyv++ocxeFgkzko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qPNghg+d; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qPNghg+d"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso7346250a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:02:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792065733; cv=none;
        d=google.com; s=arc-20260327;
        b=qNTuQLDoSUR7G2SDxpNq0JQ9t6hLT9kAc7XGlRVsbSpp2HZZw/GjBClRaHHqSZdzR9
         W6I0+1mY4qH0iIIgKxhyjaPgeMRQc91dJ7l7nnszqRiTNbtD7tr/J46YzKwd866rePVf
         ebwyU7VPvfKCzChAovqmjfdZyiZVGiWAsOriLg++DihtkNZip3PECmd223aQUYsU9oLh
         07Xp7+LgyUMMS7MsRy7UUnj+kGvqKLsD1H4TKYJNOV5n5qEQpYm58lYeeOe8Qec5f1zE
         Z4tC8gUDN6pdpRezNVBXu7/L1LDl3iW7k7jJhj0dPJjSZkxOJSkSre1jRd/uEOixGTi/
         5XXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JEqhtpB+Zby+PIlGCDUQg6WjweZp3J9rWc7Srfjl8uw=;
        fh=CDgtETo4i8lqaS00qwQzCxbgRxNvLD0DisskTOVvKgg=;
        b=Njb5g1Qo3JgtZxRyNNgyor41OUyJ3Zj3cczbh8pQkrRG+YKvSqp99xr8tkwHrvNJL6
         4CJXGqvjNJZbCDxs354OqFLVZaZ6VpS8NUIsfe19Zu+LAiaQuGLzXfIqVuhQJXKG2PD/
         09iFYcKmEnSu04Cnhmc2SV16k5fKy0ERWZoIyRx+E6D1j2tJxdYOlsDI5drQ7O4FYmR/
         r/rwUlSlFhymYnkbT7xEMEQRqyTJiZf8ZU7qLCLCl3aPmgMizG1OtEHD1Zhuffs00KUy
         O7+pTOwprdSq9UvikOtRJdJxGn8qaVtHHaRrhgbao0Hkn2EdwDdj2V9gLf0gmw3Czvfx
         PZ+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792065733; x=1792670533; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JEqhtpB+Zby+PIlGCDUQg6WjweZp3J9rWc7Srfjl8uw=;
        b=qPNghg+du+PBZ8MB7RkZSZOeVO4lLNm5FIc2QB1Yj2JWYVh2KFe7JFWveTebcyPCEU
         9RDYlra9xnjQLEYtdhxikCLilXxaZ6vherSoNsfWR5KEYrDjPug5sQ6Xte4BwSkS+OVp
         AXCrs5E2butL+5HYCJ50VyWE6/jVtS6r65mB0+SZP53iuD+anO3s4DEj8xPveNSsyv40
         Oes85CyyfKSxhxm/l06rSNTbTaYVlyBmEdBqAF5VEbfoO+qvTpo6ZbsOkIAQnrpl7Unm
         twQ0rTx5S/CSdOzTftNP0i/8NwGjzJTCHyMw9SNQ8kBRLaLNWrwyH/zvR787agP57gHz
         RwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065733; x=1792670533;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JEqhtpB+Zby+PIlGCDUQg6WjweZp3J9rWc7Srfjl8uw=;
        b=MwBaiwfFUHg+nFzhn/MjQbPqp+U4BmTuEPwUz8kp4y/DrAgyUgDiUXv78LEm/2qnHo
         kQrli774TQbwmmYIrEnyvpROKHm9uTmPJ3O7aF6beY75xf5v3B5+vAV1uIvLU648zPFY
         KqMy0FS+2TcMy6ZGWb3StgrYf88jNdar2xnATshLyo4aa9y3tb7CySvHi7YM0rmsayMt
         EX/uKABhFI5SGNWtleOS1zUgIS0PqcIs8R6gwQEj1FrS3pi9ivH7pzLOXx1gN4wsjZuS
         dNh2xA8MVZqSKiAD4ASUaHds2VlzYANLHpXPCdq87p6uvafxB5WNimitU6LtMamQ7xYz
         pgyA==
X-Forwarded-Encrypted: i=1; AKwUvBwRt29u5T2uGaCpmjMtvXe1ELCDABMB2XeNhZH4o7QDPKSZutaheW5O+YYVZAIbSs3120twVwTxQN2WEE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOQq3+bm/gSao+S7lhJ7MxgZXRi75tpA/LyB12ExjGqg1oQg/e
	gh3Ko0+/ugcLXQyLmTla0ZxExxsGtVz2Rrk3C+7DrgeBtu4CGUzAKsNqLMBu/pb8CiNL5No6MtB
	DIGBj+/vi78DjlyxciUwIqe4Rh0uT5TZMt+I3XqlDyg==
X-Gm-Gg: AYBFou1A6CgQKcccPA0s96g8+HVmzFV0VSAXImtZEtC3qTeZ4YH+eR2UPAyESQN/iEV
	ZHRdJxpoDsdhYhM5WXb169RHzDToV5aXkoS9tS3WO+N1Rdb48Uyj6pj8jAhfhcmFGnAU0V3Khrs
	HX6C2gYgnhFsUd232sLSLhpOfbQeOVgw2LAbad0vSeb+cnENypp3b7UGTSc8P0nRodq9InVKdB4
	GafVK4aiWOTlsO9HOM674JAD6/yWVFfuoidGCDryowzHSrL+vanilDSA+CdZDDkWF5DxqsPCmzD
	aSMmkGprmga1FxrLpLXOvntEpXZzmoJtzVcuXP4tF1X4dX9EyxKOm9o2JqC6fnOxSLSZBVFmlW+
	t28aA0MLmsUn/
X-Received: by 2002:a05:6402:2b92:b0:6b1:ef16:1850 with SMTP id
 4fb4d7f45d1cf-6b1ef161c44mr6732131a12.43.1792065733323; Thu, 15 Oct 2026
 05:02:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-hiperdispatchfix-v1-0-73fe41081070@linux.ibm.com>
 <aseIPhrDGCYFtJNE@gpd4> <90454932-1d82-450a-ac4c-499acdedb9d7@linux.ibm.com>
 <ffbeae31-0e93-4386-8e0e-dba13960b283@linux.ibm.com> <CAKfTPtCianGNWSu0s2J_B_aO_rtKWO17k9guYmwgXXLUHQE+SA@mail.gmail.com>
 <d412d939-4704-4246-a9bd-b49b457099b8@linux.ibm.com> <CAKfTPtAGiesy0FZQ3aOny_1QkqaX0P2MCOdkE42ERdihRJL99g@mail.gmail.com>
 <ce85388c-3ea0-4363-8c89-fe2bf71b284a@linux.ibm.com>
In-Reply-To: <ce85388c-3ea0-4363-8c89-fe2bf71b284a@linux.ibm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 15 Oct 2026 14:02:01 +0200
X-Gm-Features: AclHuK--zTS0aSJ0H3JJTTAh7_ndQC7xyA9YiZoCCOY9DqsahT_T78PB_dhOJyg
Message-ID: <CAKfTPtC70sx58uiaMEXv=vOk+o-Q_1PcHewiVjGCWMd_kvn=tA@mail.gmail.com>
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

On Tue, 13 Oct 2026 at 12:50, Mete Durlu <meted@linux.ibm.com> wrote:
>
> On 12/10/2026 16:49, Vincent Guittot wrote:
> > On Mon, 12 Oct 2026 at 13:04, Mete Durlu <meted@linux.ibm.com> wrote:
> >>
> >> On 09/10/2026 17:32, Vincent Guittot wrote:
> >>> On Thu, 8 Oct 2026 at 17:25, Mete Durlu <meted@linux.ibm.com> wrote:
> >>>>
> >>>> On 08/10/2026 16:58, Shrikanth Hegde wrote:
> >>>>> Hi Meter/Andrea.
> >>>>>
> >>>>> On 10/8/26 5:40 PM, Andrea Righi wrote:
> >>>>>> Hi Mete,
> >>>>>>
> >>>>>> On Thu, Oct 08, 2026 at 10:30:46AM +0200, Mete Durlu wrote:
> >>>>>>> Summary
> >>>>>>> ===========================================================================
> >>>>>>> On systems with asymmetric CPU capacities, the scheduler prefers
> >>>>>>> fully idle
> >>>>>>> cores over idle SMT siblings of busy cores. This works generally well
> >>>>>>> but
> >>>>>>> virtualized platforms where low capacity cores should be avoided are not
> >>>>>>> considered. Introduce a new config option and arch hook to prioritize
> >>>>>>> SMT utilization.
> >>>>>
> >>>>> That's true only under physical CPU contention right? or is it always?
> >>>>
> >>>> Right, because of that s390 treats all CPUs as equal and starts to
> >>>> assign lower capacities to CPUs with low entitlement once a certain
> >>>> steal time threshold is crossed (aka physical CPU contention).
> >>
> >> Hi,
> >> Sorry for causing a misunderstanding. I should have been more patient
> >> and detailed while writing my reply.
> >>
> >>> I'm not sure to get what your topology is because "if s390 treats all
> >>> CPUs as equal"  then you should never use select_idle_capacity()
> >>> because  their capacity should be fixed and equal and
> >>> SD_ASYM_CPUCAPACITY_FULL never set.
> >>
> >> On s390 the entitlement of the vCPUs are signified by an arch specific
> >> value we call polarization. We can tell which vCPUs are assigned high
> >> and low entitlement. This entitlement value tells us which vCPUs are
> >> prone to experience steal time first. Without any contention all
> >> vCPUs behave and perform *almost* the same(of course, we want
> >> some priority for CPUs with high entitlement).
> >>
> >> Prior to experiencing steal time(it's what we use to determine
> >> contention) to get the most out of the system we assign all vCPUs
> >> the same capacities, making the system symmetric like you say.
> >> While there is no contention s390's vCPUs also perform better if
> >> fully idle cores are selected for task placement.
> >>
> >>> If your hypervisor lowers the capacity once a certain threshold is
> >>> crossed, we already account for the steal time in the scheduler with
> >>> irq and remove it from the capacity available for tasks but the
> >>> original capacity doesn't change.
> >> s390's linux implementation has a mechanism called hiperdispatch,
> >> that checks topology changes along with system steal time (and soon
> >> the total free capacity of the pyhsical machine) periodically and
> >> makes vCPU capacity adjustments accordingly.
> >>
> >> After steal time starts ramping up and cross a certain threshold,
> >> we start assigning lower capacities to vCPUs with low entitlement to
> >> hint the scheduler that they should be avoided.
> >
> > If all your vCPUs starts with the same capacity, you should not use
> > asym_capacity or enabled it . What you describe above is system
> > pressure (steal time or other) on your vCPU that change over time but
> > not a capacity change. The value returned by arch_scale_cpu_capacity
> > is not supposed to change at runtime or you need to rebuild the
> > sched_domain topology. As an example, max_allowed_capacity does assume
> > capacity fixed otherwise the misfit detection will sometimes fails.
>
> Exactly for that reason on s390 we do topology updates after
> capacity updates. Topology changes caused by the underlying hypervisor
> or the cpu capacity changes can get reflected without a problem via
> topology rebuilds. Without topology rebuild we wouldn't even get
> the correct SD_ flags to trigger asym_capacity behavior like you say.

okay as long as you call rebuild_sched_domains(), this is safe but I'm
surprised that you chose to rebuild the topolgy because it's expensive

IMO you should use the pressure (steal or hw) reported to the
scheduler to decide when a cpu become less efficient than others

>
> > What you describe really fit into the prefered core that Shrikanth
> > Hegde has developped
>
> I agree, but Shrikanth's solution can not bring some of the
> behavior changes required. cpu_preferred_mask can help
> direct task placement away from low capacity cores but idle
> core first approach still places tasks to fully idle low
> capacity cores. This patches proposal tries to move tasks
> first to the idle SMT siblings.

We have compute capacity to decide which CPU is better than others.
The capacity of SMT CPU has also been somewhat random, but we should
find a way to fix this instead of adding a threshold to decide whether
to pack or spread tasks onto idle cores. With correct per CPU
capacity, we can easily decide if an idle low core is better or not
than the sibling of an already busy high core.

>
> Consider the following;
> On a system with 2 high capacity and 4 low capacity cpus.
> steal governor of vCPU backoff mechanism calculates 2 low capacity
> cpus should be taken off from the cpu_preferred_mask to decrease
> experienced steal time. cpu_preferred_mask has 2 high capacity
> and 2 low capacity cpus.
>
> Current behavior tires to place tasks to fully idle cores first
> even if they are low capacity cores.
>
>        c0(high) c1(high)  c2(low)  c3(low)  ...
> -------------------------------------------
> SMT 0 task     task      task     task
> SMT 1
>
>
> With the proposal, the fully idle core preference is circumvented
> and the most fitting SMT thread is selected.
>
>        c0(high) c1(high)  c2(low)  c3(low)  ...
> -------------------------------------------
> SMT 0 task     task
> SMT 1 task     task
>
> This is beneficial because at the time of contention(system pressure)
> low capacity cores could perform worse than SMT siblings of busy
> high capacity cores, even if there is not enough steal time for
> steal governor of Shrikanth's vCPU backoff to mark said low
> capacity cores as non-preferred.
>
> Andrea came up with an idea to extend Shrikanth's mechanism further
> by adding a soft affinity to a selected set of CPUs. Task placement
> would first fully load these CPUs before spilling load onto rest
> of the CPUs on cpu_preferred_mask. That would help achieve the
> behavior I describe above if the soft affinity covers high
> capacity CPUs.
>
> The discussion is still on going though. If Shrikanth thinks this is
> a worthwhile concept then I'd be glad to work on the implementation
> and provide the patches.
