Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551DD37187C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913538; cv=pass; b=E8dlc/JogCremVdG9xWK5FOFW6padedqIveOj0nc71zj37DE/L7m94FI7EmfJGuDAfJd8mEwIwWb2PpPXqpRfS2ZtX0qHEdaE07eaChDUg9DdkWUv5gdEw8AGQALgbok6ANLztny2X6rDjqXyn45N+XB0s0wEz4P/y5UhZM7KxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913538; c=relaxed/simple;
	bh=ZHNPvgcNvjnqAN+85MR7Lyl0b9dDkq4jyaQvoDGUW/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2izxWIQ8FeUmHeuIG9fmXwsYYEw+5uZBCU1J3lkKI4JqJhVBXO8klyT+WLfwXMXFqlyAK/V0bhdZvK7Pf3qvWRgxllch8N/lSLOBUiU56epv77cKaVU3b/iw9iw237gy89+R1O1bi43UIF9bL6rN5JSnRZiVjZhOK/a9ikIIKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kJmOdyEZ; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kJmOdyEZ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so3635709a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787913534; cv=none;
        d=google.com; s=arc-20260327;
        b=rM3UVRJ/0Fhp4W+7U0mgj6lW9fn+d8BP1MVHy0OKrbVp4DjHDAPUo5Gjuzb4Y+78wQ
         /NfcEygs41yZbIDTvMSo+U52oXc5cnmOOP9Fy7SM3dR/pKdlLU/qzleI3HOiD9PyNcwL
         qdM945GBz1PkMhGVBBjqUtiWlcd10cZfDVNxw8Hh3pTn8VC8uIhmiv4J8OiiRnCgzwlB
         yBqXzA//TIrrROxNRdXn0wag/JqgCx/dyGvWosrtuTt/yEfn+64Dt39SalGCMsX5oBuZ
         mryGBXMDAMSAAGZupT4phTCQBRDj/Acb7rueuG98S6qEeku2iofQ+5RHzMzm02PDnXOA
         0B5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aSNPU2ja2u72rxkCHAjApXZObqZ59bvTYvEEgnVj1lM=;
        fh=hoj9zChcox2C/NHFjnMM2P5tmR4Q9a+6QnpWiTcFv+A=;
        b=Adl5fwc1kPEw0wUFYa/lwpsOmHYAMfP3c+CISdfw5lxyapPzOmA+kRWLyxJt0bawGd
         KIWmju5hvKZw6T7LLFyN5bXucradnjbsWXTxz2YzzlCusMtmM97N4Ji/MHbo5VCMPawW
         56sZjvnFx0H5pHqXmEldTkPpTEkFjZIj+ya6lx7DreUL6oEyS64A2bO2smzK+zv+15TW
         9W5uVOFN3S4cCFgtJAgWNHFc3AAPBVDolL9nd7GsGChHwfIYg+SNFNYDduAXRgFjLnkD
         fiHoZThFiRTrc8dHfBHOwFWTDPBMWMX1mz53lNdJcz57f67d/JstNL71Os1vQ2gW2Rev
         1ISw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787913534; x=1788518334; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSNPU2ja2u72rxkCHAjApXZObqZ59bvTYvEEgnVj1lM=;
        b=kJmOdyEZaXA62Lv6mltBiQdUxLfn1lE2wByTh8LgBIJqDG+A8ZIH1FxJN5sg8bjgaM
         kf++mAoAn1i6ds9MrbkC3y1qGvPr8k2pBAYm9la7HiG1H7T10y3VTaQRNFqllJrIiX6/
         Haf3I9ZGnvrEjnawG7tyHnsDNx20eozvFwPJAV4Qqv1obgw+zT3ej6sQ/2x4wpJHhrLQ
         YnflqSEaePz7TSyvlJ+r028VVDmpAJ4ipkMde8BLXTfSBdNLKPMwdqjHPonX3Mbu38B7
         vCjH2jmlyP081XhDGbqvMdG1/EJBnWFw/lOrxfakIYERfqQiyUF22w1gaocndQVmn2Cw
         s3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787913534; x=1788518334;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aSNPU2ja2u72rxkCHAjApXZObqZ59bvTYvEEgnVj1lM=;
        b=T4Rrt7IaW1j4a0dZGtVYWQeRNSdCLfQxcXGLWPajJ4vXKmoAD/yTTPj6l/nttzmb3m
         N49qm5G5v6drRmfscGaUk6pdECUeE8pYW3ljo6fM2kAeYhO1hmfxbvMP7CO9U0CLyKsl
         tK3Maw6zOKHHhHs5wgLLHDRpiXuTAE8rjk+WJdGUlhbV1L29iaFLxjVDqRpw0O6r1c5n
         4wv+dLKfbVcxCNHGV+Osx4bikzz4yfG6FF7tyYTSCSfXhE7B3P3vaMUILOSJA3A5E2k/
         ZdRKXQmuU3omzjBnDuk1WuxUdYG1OVJmoOaBxdsK/WV0X74vh+yGBZZbN3u/S+SHiYkQ
         3FFg==
X-Forwarded-Encrypted: i=1; AHgh+RrTFFjW8Q3R5URP6Vwj4aZg6XAHxrUUQKiPEx4EaMH45sG0Qzx5AGZsdRFO2TqPwaaLgTnvd2UnemCP55Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lsHUwGS8rdI0wUBEDMt08ZLXPCGyFnLzX4Blgxrapaxt1iVgYk
	Q/D98p6PIrtyyS/ZdqJtXgu3EfmdWBt9TBcgiOOz2SpYvE2ZVQ6YkVlsdLuXa1SGdTdc8C3EHjh
	+3SjvATpO0TXUwi8Lxm9sbwEFS7p/wOKKACm4BQxoEA==
X-Gm-Gg: AR+sD12CGUr6y9aicJNiTq5q6ydKFQFsCgj6P4gNSYWUHJ08TcdYdIld+suymmf6296
	h0VGUh1RK1ROVlXdPFJJfq9UCFuBJ+l5yj6Qu+uo3Na5nLKDyH+ivYR9EJCw0mRj+LsjAZ2fjY1
	znXvq2vnIiJRrLrgypL9/vOL5KZN00vKKNn/GgXFUko9BlqZn4x0jfGMmKf1AZWwggzdHsjIxHU
	w8xOA+1KMtUW5SRnsGheIW4PUNzav2p+Ub12KrRUC3P6XyVfq25hAC1kmwh1C+bq+tfZxqlqMgV
	s22pDdmIPcPk09u+RynVHEo4PF9SdzycVQsdozBEmLFmlaosVMJa/v8tX0v/oyiG64CsLYHInMe
	ssw==
X-Received: by 2002:a05:6402:52d0:b0:697:eb97:a4ed with SMTP id
 4fb4d7f45d1cf-6a60c5ab04dmr3838875a12.7.1787913534540; Fri, 28 Aug 2026
 03:38:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825103855.721013-1-sshegde@linux.ibm.com>
 <20260825103855.721013-6-sshegde@linux.ibm.com> <8262d2f9-9f2f-4821-8497-991d7c8448a3@arm.com>
In-Reply-To: <8262d2f9-9f2f-4821-8497-991d7c8448a3@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 28 Aug 2026 12:38:41 +0200
X-Gm-Features: AcwNN1VRBsyVPI-p9UXzNMfWcn7VLGiTkR-yO7pmCmFXXcSrsOwzowtaWwf6M1s
Message-ID: <CAKfTPtB27-eFXGG9GcXdm4=YLZy6-vQMAQqoCbHa5xZxA3YBpw@mail.gmail.com>
Subject: Re: [PATCH v11 05/12] sched/core: Try to use a preferred CPU in is_cpu_allowed
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org, mingo@kernel.org, 
	peterz@infradead.org, juri.lelli@redhat.com, yury.norov@gmail.com, 
	kprateek.nayak@amd.com, iii@linux.ibm.com, corbet@lwn.net, 
	meted@linux.ibm.com, ynorov@nvidia.com, tglx@kernel.org, 
	gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com, 
	vschneid@redhat.com, huschle@linux.ibm.com, rostedt@goodmis.org, 
	maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com, 
	chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org, 
	arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org, 
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org, 
	rdunlap@infradead.org, kernellwp@gmail.com, linux-doc@vger.kernel.org, 
	jgross@suse.com, virtualization@lists.linux.dev, sunlightlinux@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 at 09:51, Dietmar Eggemann <dietmar.eggemann@arm.com> wrote:
>
> On 25.08.26 12:38, Shrikanth Hegde wrote:
> > When possible, try to choose a preferred CPU.
> >
> > This is essential to maintain user affinities when preferred
> > CPUs change. A task pinned on a non-preferred CPU should continue
> > to run there, since this is a non-user triggered event.
> >
> > If a CPU is non-preferred and the task can run on other CPUs which are
> > currently preferred, then choose a preferred CPU instead.
> > This is decided by checking if cpus_ptr and cpu_preferred_mask
> > intersect or not. If yes, then the task has other preferred CPUs.
> >
> > The push task mechanism uses a stopper thread which calls
> > select_fallback_rq() and uses this mechanism to pick a preferred CPU.
> >
> > This takes care of the wakeup path for FAIR tasks too.
> > is_cpu_allowed() is called to ensure wakeups happen on preferred CPUs.
> > With that, additional checks in available_idle_cpu() are not necessary.
> >
> > Ignore the preferred CPU state if a task's affinity is changing and
> > its new mask no longer includes the CPU it is currently running on.
> > This ensures migration_cpu_stop() does not abort, preventing the task
> > from being stranded outside its allowed affinity.
> >
> > Account for tasks with architecture-specific CPU masks
> > (e.g., 32-bit tasks on arm64). For such tasks, explicitly check against
> > the arch-allowed CPUs to determine if any of the preferred CPUs are
> > actually valid.
> >
> > For the majority of cases, this would still keep select_fallback_rq()
> > as O(N). cpumask_intersects(), which is O(N), is called only if
> > !cpu_preferred. The task running there is expected to move out.
> > Subsequently, it should run on a preferred CPU. This becomes O(N**2)
> > only for tasks pinned solely to non-preferred CPUs. That is a rare case.
> >
> > Overhead is minimal when the CPU is preferred.
> >
> > Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> > ---
> >  kernel/sched/core.c | 41 +++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 39 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index a45f7c308329..f71317fe281d 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -2494,6 +2494,35 @@ static inline bool rq_has_pinned_tasks(struct rq *rq)
> >       return rq->nr_pinned;
> >  }
> >
> > +static inline bool task_can_sched_on_preferred(int cpu, struct task_struct *p)
> > +{
> > +     const struct cpumask *valid_mask;
> > +     int i;
> > +
> > +     if (cpu_preferred(cpu))
> > +             return false;
> > +
> > +     /* Only FAIR tasks honor preferred CPU state */
> > +     if (unlikely(p->sched_class != &fair_sched_class))
> > +             return false;
> > +
> > +     /* Ignore preferred state if task affinity is changing */
> > +     if (unlikely(!cpumask_test_cpu(task_cpu(p), p->cpus_ptr)))
> > +             return false;
> > +
> > +     valid_mask = task_cpu_possible_mask(p);
> > +     if (likely(valid_mask == cpu_possible_mask))
> > +             return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
> > +
> > +     /* Tasks with arch-specific CPU masks. e.g. 32-bit tasks on arm64. */
> > +     for_each_cpu_and(i, p->cpus_ptr, cpu_preferred_mask) {
> > +             if (cpumask_test_cpu(i, valid_mask))
> > +                     return true;
> > +     }
>
> Looking more into this, there might be a window in 64-32-bit execve()
> for 32bit EL0 tasks on Arm64 (w/ allow_mismatched_32bit_el0 command line
> option).
>
> The time before arch_setup_new_exec() calls
> force_compatible_cpus_allowed_ptr() to restrict CPU affinity for those
> tasks.
>
> Let me run more test on this ...
>
> Why not simply:
>
> - return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
> + return cpumask_first_and_and(p->cpus_ptr, cpu_preferred_mask,
> +                              task_cpu_possible_mask(p)) < nr_cpu_ids;

+1
This is the best way to check that there is a valid cpu

>
> IMHO, you want to know whether there is at least one CPU that belongs to
> all three CPU masks?
>
> [...]
