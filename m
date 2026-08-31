Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D3E531B05
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188999; cv=pass; b=sqJTNAkrm2WH6VAmLMLPcrHbmKhVEa9QsdjAtEl/MR5f/xtR1B1b5U91OUMHb9o0IE7sM7OOKKwzno9KCyPmFgbjroXmbPOwvcGx7BmrH55pWUvvJI3KpdV1PfUiBgBX5dJb4WrNbXR2Lu0tpRCTChY5sWHXdAjY1jXieyGOjr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188999; c=relaxed/simple;
	bh=EvAXVNP9yVBqvEJz1b62aPEGqoOpJmPXDM4IPy03jPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UqvQsumh9fKrxrodbzdO/8J5i859RXXXOC7UJ3A95AxFwftmIJ8abhnN2ht3ddeGNuP7yi37AEGocE9n+sCBOUgn2EdFTBt5yMu5ncbNmrDnwkVFNQl/OFu3EXjV7WwSx7nv/053ROjtEGiYUHMLbk79+TLVoMEGBHr0G87eVlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mSMIWHJB; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mSMIWHJB"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso6068982a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788188995; cv=none;
        d=google.com; s=arc-20260327;
        b=gW35j+dyAJzmgf0MEULxtWl1l4ZU4UDl98mmVpCDVAdVrA0v/FpCR3C6afKwcJ5FFF
         3EgmbQO0heYq+X8+XjXmTnshXr/DrM40srtnvAPO/Yan4CTPYxpiXKqV04eJ0pQ/GUVu
         lW8amFwL+OXwta7UM6KGuTNV9mGtdJ+NBmICJ+m4lX6AvkDGdrURh+INAPV2OU//vxjG
         uoN6LyPBSBHJym2vJykTDI4zpdTJ+FpMsiSB15a2fHFVE7s6mBYqPQSr9gKU/ET+BDcH
         wwCJ2tcYCbVDXluxaOT9ONe5CG3rmDRWXG+kj5/DprAmg1VpCN8VSqSpuPpAq38uB+bt
         ADAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JrzNzCE+6e/7fYHlEvlqtxiIjYnJBRLeb7tYosECYm8=;
        fh=Gk7cv/5fEMPnRtwEdo6FJHCE6nBojlfu3nG+9UbBQUM=;
        b=JObVACm/qx8vg8fA3rOp3ys/s6nKnc4QQKOKCBUt7UUmIvYUpXLM821iv5jXKG14qq
         dQZLlaGqc2aLUJEobyb3CVhekF18GfZpk/oTHHda4cgpmLCksbb+LTdNQH4jWaGksqFy
         LbFF7wPtdIj/spznmLztmNAJiULxOD1i9Qt22RDGBvD6uXJcw0BIJslzr7BxruN9YPC+
         mo1/e0FmN+xt0n9hNBJD1Xofn9yzfMSA9rNEm8B5uUndLanartoXoTYlb0FvUOE+b+TF
         Wcb8Cd1aopvpVJ0aH5uM2WR5Eqku0CXojvSiFhGhehEpaxlP6mtVDlln8Xfl5CQBHOUj
         LT1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788188995; x=1788793795; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JrzNzCE+6e/7fYHlEvlqtxiIjYnJBRLeb7tYosECYm8=;
        b=mSMIWHJBwX9NJCptLTDwjdr/vUNtplrhjaHwHudcen/iZIlQ7ZH6HyFPYeLZKXI5nB
         njiMFuEHgy1j4ptSD41PSqvjHzrBrScWz84DcQ4etgTewG63hJlLNiqZJnoJD0qpkmZU
         s7M2+hLTzb8gnVvHyAy6RzmDJxPuFFcR/19Qt4uU91DShYcWtPV3yRFlXAwEVwA/mm4b
         NcXwMp3q+PTH2rVM+/nB++rVjLSWcOvor1V2YazNk18anof2Uj6vnrTXT6rcdAmIGwra
         8NpMToxVb2dblHflR+IWBwsYv7sH7nL8oWihXbw+M6VWKJPWG9ZNqRQ0HXz1qwxRcLWD
         hyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188995; x=1788793795;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JrzNzCE+6e/7fYHlEvlqtxiIjYnJBRLeb7tYosECYm8=;
        b=qoiqn0ImRECYW7ZfJANnI51AegsZ8JuH2C1yysP+XZh2Gv2lGvV9V/pqRiHf9TFP3M
         XtObDlET96BYPFbDTJLNOPJW3S++ECYbctBSUfqklz+napgBSmnSjerE7tvDat+0gaiq
         A2ppj4Xs5y7Rct5twiPcEc6z6Gzfzoo0xwPkHYgQs9CojOt00Nf2IC0BI+7H7cB2kkQV
         MEkUZGWnK03qeyhBNIqSLAsO4Ds9Sqo9H2spDQvOYW5Dxr4ZFwjwXr3V0Ws7QQpux6El
         i+7X22b4npLByzD0plkdSdolstoVrDDaC8HfNA9B7ivZbr6nqQmGJVbk6SC7RuK4IJ5J
         1GDw==
X-Forwarded-Encrypted: i=1; AKwUvByo85R9nGGDVxUYM03f6cbAoen/+Ca4Cu4WXZrv0qmju27ozyTOllV3FuPJRnlxDBXPTgFJeFx0+USm0PA=@vger.kernel.org
X-Gm-Message-State: AFuF++mcdsQyn4wkzgnZzufD51g8AsykuGSRQoA3/O5FhA46tZNpuxZ6
	TdWpsDbB2zzZ9dy0/Kdc4OFo0w1sKFLhVtGK8s/ZFrrRdQ2fjXKQc30eDvpzMsVW7woiAdIbwf7
	I7Gl43aUsyQlT9RNTUPoZ2KlyiRvSQ6PsAT45sgeGUg==
X-Gm-Gg: AYBFou1tJ4D8XZEfqfeTwgocZV9cq/mN/dPXg9YlBoBpDJMF1Nb8yNNgTOthFLRvYYO
	KZI2tNvBM5CsiNZrdoBXp0vRHms15L8VrJWJFXpgqvPewyKLjO0IgPkCMq1aLIoZA6vG8OaGL3l
	ZQht4cJ4m4CTBV9pikn9uvJT4BysudlOZVkZHVRDhxuZNvpQnET6boTYaJNW+1IdxHbcrCa9VmM
	P6K1Uu9mtBrnMXJ3XP9qL0nnjN6jkCLa0oNJ8Ye28D8bd2NvhcWH0WGOr0FlpwKlToxgsCT2Guw
	KYoAxM+1k7d1QIA3J8Ks7ee1MDA3miahN8tgvKhIr/x+DHEDvgxy3mgcjYQwnVPzm+XEwsbioLG
	NJQ==
X-Received: by 2002:a05:6402:2483:b0:6a3:8652:a373 with SMTP id
 4fb4d7f45d1cf-6a663a61f85mr1302653a12.3.1788188995367; Mon, 31 Aug 2026
 08:09:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825103855.721013-1-sshegde@linux.ibm.com>
 <20260825103855.721013-6-sshegde@linux.ibm.com> <8262d2f9-9f2f-4821-8497-991d7c8448a3@arm.com>
 <apMziCV_8y0xeIBT@yury> <53035ba4-53ec-4907-93b8-c8b957d1fa61@linux.ibm.com>
In-Reply-To: <53035ba4-53ec-4907-93b8-c8b957d1fa61@linux.ibm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 31 Aug 2026 17:09:41 +0200
X-Gm-Features: AcwNN1WuQPzuapLI2-JLpyWulustWf-m7h6Qeoz6g2HFHQKGD7paBioDMOOd3wc
Message-ID: <CAKfTPtA5Bdw89hezn1wi_p0m0dJgJJ1GYg8H93PsvsMC4bVJxA@mail.gmail.com>
Subject: Re: [PATCH v11 05/12] sched/core: Try to use a preferred CPU in is_cpu_allowed
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Yury Norov <ynorov@nvidia.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org, 
	juri.lelli@redhat.com, yury.norov@gmail.com, kprateek.nayak@amd.com, 
	iii@linux.ibm.com, corbet@lwn.net, meted@linux.ibm.com, tglx@kernel.org, 
	gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com, 
	vschneid@redhat.com, huschle@linux.ibm.com, rostedt@goodmis.org, 
	maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com, 
	chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org, 
	arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org, 
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org, 
	rdunlap@infradead.org, kernellwp@gmail.com, linux-doc@vger.kernel.org, 
	jgross@suse.com, virtualization@lists.linux.dev, sunlightlinux@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 04:19, Shrikanth Hegde <sshegde@linux.ibm.com> wrote:
>
> Hi Yury,
> Thanks for going through and your suggestions!.
>
> On 8/30/26 1:01 AM, Yury Norov wrote:
> > On Fri, Aug 28, 2026 at 09:51:47AM +0200, Dietmar Eggemann wrote:
> >> On 25.08.26 12:38, Shrikanth Hegde wrote:
> >>> When possible, try to choose a preferred CPU.
> >>>
> >>> This is essential to maintain user affinities when preferred
> >>> CPUs change. A task pinned on a non-preferred CPU should continue
> >>> to run there, since this is a non-user triggered event.
> >>>
> >>> If a CPU is non-preferred and the task can run on other CPUs which are
> >>> currently preferred, then choose a preferred CPU instead.
> >>> This is decided by checking if cpus_ptr and cpu_preferred_mask
> >>> intersect or not. If yes, then the task has other preferred CPUs.
> >>>
> >>> The push task mechanism uses a stopper thread which calls
> >>> select_fallback_rq() and uses this mechanism to pick a preferred CPU.
> >>>
> >>> This takes care of the wakeup path for FAIR tasks too.
> >>> is_cpu_allowed() is called to ensure wakeups happen on preferred CPUs.
> >>> With that, additional checks in available_idle_cpu() are not necessary.
> >>>
> >>> Ignore the preferred CPU state if a task's affinity is changing and
> >>> its new mask no longer includes the CPU it is currently running on.
> >>> This ensures migration_cpu_stop() does not abort, preventing the task
> >>> from being stranded outside its allowed affinity.
> >>>
> >>> Account for tasks with architecture-specific CPU masks
> >>> (e.g., 32-bit tasks on arm64). For such tasks, explicitly check against
> >>> the arch-allowed CPUs to determine if any of the preferred CPUs are
> >>> actually valid.
> >>>
> >>> For the majority of cases, this would still keep select_fallback_rq()
> >>> as O(N). cpumask_intersects(), which is O(N), is called only if
> >>> !cpu_preferred. The task running there is expected to move out.
> >>> Subsequently, it should run on a preferred CPU. This becomes O(N**2)
> >>> only for tasks pinned solely to non-preferred CPUs. That is a rare case.
> >>>
> >>> Overhead is minimal when the CPU is preferred.
> >>>
> >>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> >>> ---
> >>>   kernel/sched/core.c | 41 +++++++++++++++++++++++++++++++++++++++--
> >>>   1 file changed, 39 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> >>> index a45f7c308329..f71317fe281d 100644
> >>> --- a/kernel/sched/core.c
> >>> +++ b/kernel/sched/core.c
> >>> @@ -2494,6 +2494,35 @@ static inline bool rq_has_pinned_tasks(struct rq *rq)
> >>>     return rq->nr_pinned;
> >>>   }
> >>>
> >>> +static inline bool task_can_sched_on_preferred(int cpu, struct task_struct *p)
> >>> +{
> >>> +   const struct cpumask *valid_mask;
> >>> +   int i;
> >>> +
> >>> +   if (cpu_preferred(cpu))
> >>> +           return false;
> >>> +
> >>> +   /* Only FAIR tasks honor preferred CPU state */
> >>> +   if (unlikely(p->sched_class != &fair_sched_class))
> >>> +           return false;
> >>> +
> >>> +   /* Ignore preferred state if task affinity is changing */
> >>> +   if (unlikely(!cpumask_test_cpu(task_cpu(p), p->cpus_ptr)))
> >>> +           return false;
> >>> +
> >>> +   valid_mask = task_cpu_possible_mask(p);
> >>> +   if (likely(valid_mask == cpu_possible_mask))
> >>> +           return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
> >>> +
> >>> +   /* Tasks with arch-specific CPU masks. e.g. 32-bit tasks on arm64. */
> >>> +   for_each_cpu_and(i, p->cpus_ptr, cpu_preferred_mask) {
> >>> +           if (cpumask_test_cpu(i, valid_mask))
> >>> +                   return true;
> >>> +   }
> >>
> >> Looking more into this, there might be a window in 64-32-bit execve()
> >> for 32bit EL0 tasks on Arm64 (w/ allow_mismatched_32bit_el0 command line
> >> option).
> >>
> >> The time before arch_setup_new_exec() calls
> >> force_compatible_cpus_allowed_ptr() to restrict CPU affinity for those
> >> tasks.
> >>
> >> Let me run more test on this ...
> >>
> >> Why not simply:
> >>
> >> - return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
> >> + return cpumask_first_and_and(p->cpus_ptr, cpu_preferred_mask,
> >> +                              task_cpu_possible_mask(p)) < nr_cpu_ids;
> >>
> >> IMHO, you want to know whether there is at least one CPU that belongs to
> >> all three CPU masks?
> >
> > Yeah, the cpumask_first_and_and() would replace the for-loop more
> > effectively, but I'd suggest introducing the new helper:
> >
> >
> >          return cpumask_intersects_and(p->cpus_ptr, cpu_preferred_mask,
> >                                        task_cpu_possible_mask(p));
> >
>
>
> Ack. However, we will only need this change if ARM64 wants to enable
> this driver right now. If not, we can go back to the earlier
> cpumask_intersects(), and the 3-way intersection can be added
> later when the ARM ecosystem enables the feature.
>
>
> Dietmar/Vincent,
> Do you think it makes sense to enable the driver on ARM64 now?
> Or you think it is better to delay it and once the feature is stable
> ARM ecosystem can enable it?

It's always better to support all arch by default, unless something is
missing which is not the case here.

>
> > This would also highlight the intention better - we're looking for
> > intersection, and call the 'intersects' function.
> >
> > I don't like how this patch plays with likely() macro.
> > Possible == task_possible condition is surely likely for x86, but is
> > always unlikely for aarch64/el0-32 tasks. This would lead to suboptimal
> > code generation on aarch64.
> >
> > The approach I've suggested also worsen performance because of a
> > possibly unnecessary traversing of the cpu_possible_mask.
> >
> > If task_can_sched_on_preferred() is really a performance critical piece
> > of code, we can invent arch_task_can_sched_on_preferred() to avoid it.
> >
>
> It is called only on non-preferred CPU and unless pinned, tasks would have moved
> out of it. So we are okay here I guess. If it really pops up, then we can do the
> above idea.
>
> > --
> >
> > On general side, the governor is really tested in 2 configurations:
> > PPC+powervm and x86+kvm; and there's clearly an interest from XEN and
> > ARM engineers.
> >
> > Maybe, to stay on safe side, we'd enable the feature where it's actually
> > tested? I suggested it when DOM0 case was revealed, and now we've got
> > the 2nd corner case from arm64 compat tasks.
>
> Indeed. It would safer and that way it would get more testing before arch/hypervisor
> enables it.
>
> The design is intended to work on architectures that provide steal-time
> accounting, but each architecture and hypervisor combination should be validated
> before enabling it.
>
> >
> > The advantages of this approach are:
> >
> >   - faster adoption of the existing code for the tested architectures;
> >   - delegate arch/vm support to the domain professionals;
> >   - delay arch/vm support decisions to the later phase of adoption, when
> >     the API is better stabilized.
> >
> > Thanks,
> > Yury
>
> So far, I have PPC_SPLPAR, S390, X86_64 in the Kconfig list.
> I will wait to hear from Dietmar/Vincent about ARM.
