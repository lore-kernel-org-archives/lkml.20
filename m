Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758AE3D3D1B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791554795; cv=pass; b=T/3/E3XnzpWLaBAdcgCX7OjS1VPvLEI3j2DhCgMOsigXSwXZmW9u0VEBH8kwOgF/opCnSPt2CxY8jOn/eUAScnZmhngrqnTb5kgGQ62cuvqUJ5eaQolvvx7/TgEOaZ/xTh2X19ZMFwNsc4+pUcSJnDhKNJFdpCxYrfAHHb4pzPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791554795; c=relaxed/simple;
	bh=GyiWe4iERIHzqUToTB83us7UkhnVWZQdkG38gBexcNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAL1eNf+0ac+VTEIWpfXhaerqWUExBs2nBaOeutGHoBA1iTo+TGWEZ8PaytUGtc8pEpGSwwdP5M8XyMzXcvowGfOS7m7IPZdOZbr4QLNbiM1g2lDWFJ6fk5WGR0O+AF6Cy00uw2tJJMUKo3AdxBCqqcmfIOWCxAx4+zaQBQAW+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NkKQnaAu; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NkKQnaAu"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c31988fc977so247589366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791554786; cv=none;
        d=google.com; s=arc-20260327;
        b=dyYgwrxNbvTYAFOstMEX7ORkCeYiA96L2dk7Bq+TkWPBJgej/YCUE2jSjKauaLYwVP
         ZqHbYUzKzt3XJlvX0Yu3Ep3yEqaEDzT3Y9OfbFnG/vAnaO6YdRPzwk0xFgTEDauTX13h
         PgDsp1oUTAcBtn8tRNFsbhRMwAtw47E4q/sSS3bWeh7UOSyg1et72OYGLSu03v0Ls+FB
         ATGbWFZsORCN/rz4hJBex3wtK7Ol9bBO6965dXj59fdOLa3fNg7TaC5xH0j6iH8fF9Cg
         B6IetH4EIIjP5J8LEvMn1Qed8BGUwLXJamnF4soVwD7UHuJEzr0WxvHjAx2wLxBGqSmO
         0KYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3FaEcDATObijynFDqDaL/0W94AAQKaPSJm7mGfTHxe4=;
        fh=KR66HnXIZlI0JdWUF+Ltk8DbTvdYz6qNi/9r/pA6Mms=;
        b=PPE2fV66B15lLmKZeFbYbT1YXGfjmRD3/B0AT6ie+6j9Kx6s5nYTZdYrS+WGvPhChj
         EGwyNDb55otqh+/CMRGrc6GSGdkelbhxhkd4ALo0awIC5OyyTmbdB7oyT7WZ79eef7hD
         bb7Ef3IQYQfEHtShDEM98+WFiCjxgWzbEIrFsm7jo1hdbDC/Xn2QtqbS1lP5erjYFinD
         AuPrAi8hzNoDRUYSX5NY4ATWLltCU5VUP20y772pqevcegCoYPkZmsbp0ikB8tyWnohh
         WGhvrwJisT2v0aTGj5TRCBNeKQLf0kDKPYb+e9uajGZWFT51p/CBcgz1b7gxXni3T/dv
         21Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791554786; x=1792159586; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FaEcDATObijynFDqDaL/0W94AAQKaPSJm7mGfTHxe4=;
        b=NkKQnaAu8P/WzFV0i2B9nHpVmPgcZI9q59RuvN8aGozqMxMsTbteuaAibYt3seX4qF
         QIXYfslWESXklA8PA6hnkxdl2O3ZBGhh56Yc7OzUNgaMgQ1qi6kCndutJ3CIBkirDmfi
         UcK4FdSJAmCtmJ3BLRpDza9iyZBsLu/jemTgDd6VC4GFssmfFOFNjIECTaNhYLpyyWV2
         U6XT750QMwsJpuHOpj4+gmnhj3Kew9jmccPcRoOiNNcaFkEirYMb7lpfmfWE4JwFyXfQ
         1zZvMnBoiyZpX5TdE7XgV8okwb0ubB0475pGEw1nl15nK8HD9ZkkBB7aLUmKKuDplAhL
         b1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791554786; x=1792159586;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3FaEcDATObijynFDqDaL/0W94AAQKaPSJm7mGfTHxe4=;
        b=YF5v9jk57aiSPmJHjf9I0CgkYxAlL9+2z6AKx6aIWYQYCR3M8V9JLN/hw42zLZEYNK
         SlyWXIGC56Als5EWCwuPgpoFII5BIBIYW6JRt5PHwoyHwH7t2orf2jSAKwGDiHGjg7LO
         QaAuTfg7F3fD1j9MjblJo34IqyJO37MyHBkVzzLHTzljkvJwERamP9l2IcPOxq6gbClp
         UMJPVbX6gHcG2eKt/Kkmch+FGgd764lfbWfqCcndyeu4YM/ldkdwP2Zb8OZoAJYzTjsr
         ySnkhBc09O4sMALZ5+5Yg/mkPkvghH49KR+mOE3gv+kA96hxOqsQxBpsiWyUXxkXvdLa
         K7sw==
X-Forwarded-Encrypted: i=1; AKwUvBzTBCuOtSWZqsETwicX1CfNFJOoUcBAin5J5MgSm7O15InqI6/R+sYmfm8k9oO5N7nEnx0FWvwYjAuLdLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkDD3JH19IxKHy08eb1HceEmKjE2nx7SP7pNVJNM0AIxf6qpvt
	NB9+WYTVZ6/eRedHpifpKxRLtXx2zhzjPgCg8gS5GF7DnGHgzqUOdD8pA8HCWSVxShkgaBY353S
	2W4HP7CnvKeV+CUISC21kqMPt5DTXjIZ/3MXjnFKvFQ==
X-Gm-Gg: AYBFou36nDHfDA+s6bS2qucOGXSt2bj6HoGPWWOZ1JMeN67dNk318C1wuz1RsqDubtv
	Qae1f63EFU2GF+tz7QxgWlRFq29E2D8/11zfHZtk2byO7pxtOOo/UhkDSA4khoU9YRtVVSnDUMW
	/WG6oMBWKcZiBXnnAVFVFwephWIQ2+GnDKRPBtel9Xjd3zRs0fGDCfXHO0tWC1v/HwfKNtCfekd
	XjScBUMUABBadmet/lb5Tc5pm8TFJz1Zr2r//gazRFJOyvetF2u2JUtYjRGYpjM4VQW5AH9oYmu
	4Jzb6sNqJgIbn6gEbcf2oOlCu47mO2ImdGtUQF0j3DJyPhnkR/UeJgfq310tCn7vctLN/0r/UdK
	zeYBZMK9nr6c=
X-Received: by 2002:a17:907:2d24:b0:c2d:bcf7:37f9 with SMTP id
 a640c23a62f3a-c31aa07a9d9mr224233766b.26.1791554786570; Fri, 09 Oct 2026
 07:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002154415.2270586-1-vincent.guittot@linaro.org>
 <20261002154415.2270586-12-vincent.guittot@linaro.org> <62547ac28298442a246abe0471647e36518a93cb.camel@linux.intel.com>
In-Reply-To: <62547ac28298442a246abe0471647e36518a93cb.camel@linux.intel.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 9 Oct 2026 16:06:13 +0200
X-Gm-Features: AclHuK8OZXoY2HDF-7oweWSjqlOmblYb-OtXlDEjMe9WKYUdoHkKC6piT5Ymiy8
Message-ID: <CAKfTPtCGK1Rw_gMRjdQ3EJ80RJNe0eu0aK-+arhw6C0_Oe0ofw@mail.gmail.com>
Subject: Re: [PATCH 11/18 v2] sched/fair: Support not wakeup case in select_idle_sibling
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	linux-pm@vger.kernel.org, tj@kernel.org, void@manifault.com, 
	arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev, 
	qyousef@layalina.io, christian.loehle@arm.com, pierre.gondois@arm.com, 
	sshegde@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2026 at 19:55, Tim Chen <tim.c.chen@linux.intel.com> wrote:
>
> On Fri, 2026-10-02 at 17:44 +0200, Vincent Guittot wrote:
> > With push callback mecanism, select_task_rq_fair can be called for a task
> > that is already enqueued. Task into account this case when choosing idle
> > CPU.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  kernel/sched/fair.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 6ed3e5bb7fd6..38eb80dbd1a4 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -7974,10 +7974,13 @@ static int choose_sched_idle_rq(struct rq *rq, struct task_struct *p)
> >       return sched_idle_rq(rq) && !task_has_idle_policy(p);
> >  }
> >
> > +static int idle_cpu_without(int cpu, struct task_struct *p);
> > +
> >  static int choose_idle_cpu(int cpu, struct task_struct *p)
> >  {
> >       return available_idle_cpu(cpu) ||
> > -            choose_sched_idle_rq(cpu_rq(cpu), p);
> > +            choose_sched_idle_rq(cpu_rq(cpu), p) ||
> > +            idle_cpu_without(cpu, p);
> >  }
> >
> >  static void
>
>
> Hi Vincent,
>
> One concern I have is that many CPUs will try to push
> their tasks onto the same idle CPU and causes over stacking.
>
> idle_cpu_without() doesn't check nr_running. Its comment says:
>
>          * rq->nr_running can't be used but an updated version without the
>          * impact of p on cpu must be used instead. The updated nr_running
>          * be computed and tested before calling idle_cpu_without().


Yes, I missed this part and will fix it

I'm going to merge the check of check nr_running in idle_cpu_without()



>
> and update_sg_wakeup_stats() does this:
>
>         if (!nr_running && idle_cpu_without(i, p))
>
> choose_idle_cpu() calls it without that test. So a CPU that runs its
> idle task but already has a queued task is now idle for every caller:
> the target, prev and recent_used_cpu checks, __select_idle_cpu(),
> select_idle_smt() and select_idle_capacity(). This affects wakeups
> too, not only pushes.
>
> For a wakeup to an idle CPU, the wakelist usually sets ttwu_pending,
> which idle_cpu_without() checks. A push enqueues the task directly, so
> after a push the destination stays idle for everyone until it
> schedules. If it wakes up from a deep idle state, this can take a
> while, and other CPUs can push or wake their tasks onto it in the
> meantime.
>
> The fixup below removes p from nr_running when p is queued on the CPU,
> and calls idle_cpu_without() only when nothing else is queued. The
> tick case that this patch is for still works: p is the only task, so
> its CPU is still idle without it.
>
> It is build tested only.
>
> Thanks,
> Tim
>
> ---
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 3eb8a0170902..cb00f24a58fa 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -7978,9 +7978,16 @@ static int idle_cpu_without(int cpu, struct task_struct *p);
>
>  static int choose_idle_cpu(int cpu, struct task_struct *p)
>  {
> +       struct rq *rq = cpu_rq(cpu);
> +       unsigned int nr_running = rq->nr_running;
> +
> +       /* idle_cpu_without() needs nr_running without p */
> +       if (task_cpu(p) == cpu && task_on_rq_queued(p))
> +               nr_running--;
> +
>         return available_idle_cpu(cpu) ||
> -              choose_sched_idle_rq(cpu_rq(cpu), p) ||
> -              idle_cpu_without(cpu, p);
> +              choose_sched_idle_rq(rq, p) ||
> +              (!nr_running && idle_cpu_without(cpu, p));
>  }
>
>  static void
>
>
