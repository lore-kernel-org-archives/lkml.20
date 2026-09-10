Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2146448F03E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047917; cv=pass; b=D4vbfNim2nVUQBt0hUsvA5Lot2JnJEZoj+908Jke7HjOkyNopLTk9OlDB2pq+BoTmT3iZPeO5OM2ODXq5hbM8deikFd/2Odjm0wI1Rgh0ycQLnU5GRX9FMG51qZr28Ce3U59OiEqT6PT30XmEKbAb6sYfjf6LYWfluYmvCgm0x8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047917; c=relaxed/simple;
	bh=c73wcR403txVhvigOlGS47jMC0aR/IuwizfN1bIsVTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q14jm6jCH0r0oEbAyGiVl2QFcYfegoA16iu08SAdk3AvTID0EkcMTtEtbioJXXkYyLatkoCwsUO24llE4Khd1l1012dbSDvVfSnqtR9VpzQgpn8Z41Tmxxx4FEgqQGV/BvQEIM2ACAWM0TbmBA1TPqKnLqfKH/nb1S6GWw+g8vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VjsQJ7DE; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VjsQJ7DE"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b20so396043866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789047914; cv=none;
        d=google.com; s=arc-20260327;
        b=eid7+T/UTUldh2fBSd0q+hy5OFHqYlQd8vOxXklaT3d4q9rZTJSVFAq58zddUWsuEB
         pcdY8jnniRjacmx1cTk1VbLOWAQQwzZVivsD+LbJUFG/wuinzYv10l5+ng3JxO5ImwLf
         zx3Nv1ynA8UaMTL/ZG/3zRfCojOiNVL0+TyBmpAB4688oZF1hzv2Ww/A4LhXndm6xZGf
         EKPC7uaYJuWdrfI1uRV3judj03saIKE4zDPTVC70Kt5nDy7LUuGBUWREibfnN/ZAnueC
         f3VfmwOHkuwAQP+udD8bQwJ2Q/3hIuKNkKsH8LvaTOu3RIRp5oG53lPZmtjf0oGuRbHE
         Xl3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Chj7JLiZLj0Atw0J3RY+BoVMaG+eTGTbMpNN8rQ/ThI=;
        fh=EwMqBn+tJZLsaxrrH7qsOQqdEl6RMpnYgu5A2JmbW0o=;
        b=QxPkJgOu8kWch48sa/Onp3XiJreL8mLPq6QbqX5pDPPFUAlKIkKpKdn4QLg2pWVC6s
         3ZcXg9ITORXZ5iycbEG01WLId8LgEAcScIYF6gsq1Ps9lbmjdgpZfgUWnEF6I0Ehopdx
         CT556fzOlvtN3+1swjNt8oosakRCTJXpoe0QGXNewJtEkIosxlDr+eFvFwgylO9yVR39
         pf8clXEyUPK+ISdCD6sYFMY8bOF5ZbOMaUV1oR5q7jDNbGtR4eDUoJQlF8Cxj6q20sLB
         J8HlYDXx36DwihQIHDVD2jCxxrs6F9PqmsGFklFHq0JCRH5suwXWY7AVNBiKPhwuRwtF
         /OIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789047914; x=1789652714; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Chj7JLiZLj0Atw0J3RY+BoVMaG+eTGTbMpNN8rQ/ThI=;
        b=VjsQJ7DESCCRMdv52jC336slBnR5KzH4AxtNZCt2uUdUyZwhjmkm6uOGCzKzdPbZFV
         l47rdB+Uxh63YWWeEf6NTtT/BjtxgagEcb6D4IVjAB+YfvbrFoJwy4zUIkF0pCX5bB5M
         ZzJcsPtXUIcEU+FzKiHptANtYa4lV6wi6l0fLQForRvLIoxpT6hvlEzJQT0793LW6HCT
         5iBo4Hb9tsxkWqgoXamjD5/u/CTK3o+kr+ojy+V2ulAvrtxoUdhdyPR3vCWF+BhuBWGx
         frIuby1SxjG9GzJQxmVWpZP5BXds6NHiuYdHRS106sxQWzWqeDmpFHOT0LYmP8IDgHA6
         uOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047914; x=1789652714;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Chj7JLiZLj0Atw0J3RY+BoVMaG+eTGTbMpNN8rQ/ThI=;
        b=nVvR5HvGcYaqZbgZ81Z809hxA6IOziTt6eGf/Graqmp6V9HlgKus0jhSX/9awM7EeX
         0+OSGOGhSo8/7nJjsxqbXfAWz5QOFhxGwtTlL7GgLFr1Ptvexa+zz1DvurdqzYXRnGi+
         ezFUXxneKZmhHf5m7PTYt3nhOAcGcO/u0Z+xRG/ZsghvvPjFTiDZIv9RkwX1gbMwnzU7
         deQ59653Wd/pCT9rDw5kKRZk5UdFqzY35IUmoAksORcMh5y1lZADK8skq/RIDZ1xcoVr
         efX5wqqfTjz95feinmlWKSR08nPjcRpZY6XIFz6lCkBud+RvfVE1AVVUrK8mFnqsNAje
         zENA==
X-Forwarded-Encrypted: i=1; AKwUvBzt2KvFiTx9dKRnJF/O24SekPjasA37Yxi8lcLQZ+KqtafD7sumUYAAurmoBOifIanFy707srTRVXdRHZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++kbumrRyQEAoZdePo6B9AXDZ8KgORf/mMfGWc9osRw3EJ6Weidv
	0cgn/nqOEyEn9QJJpFDujksbRMy3QhgdLf8nxARTCg/Fb33DSUUOckPXtHEJgVGNETEW0IfENvS
	0iXdzWBNFAKZyTKSJaEoXOL7vAN15uNL6dd++4UQeKw==
X-Gm-Gg: AYBFou1PIrRoE83WagrZ1OklDonO1hhcBF4BsXLTYVx8ySMYILytIG0/bxe4WAonYOC
	xxxnqbV8DWWzyrJbO381LkmpJG/hPcvZcZkpKnH4Or/Ew5aP+ETDyT2e/0bl0RaLLETSZ8s8e09
	5jQw6r3QqiazEaGU2/Bw40xUGA4h4AweWpWxzNn93gy8/e8iSInd0bxNUa6sPhDMyrfNthLI6zX
	kSSO1Xc5z3Uf7uFwGyt/P74gOV+y5ESarb477WwdMQe9kNFJUk3Rco3v6JKrvD+uhLN1E8mSYct
	ArmCDjUsPwpucctQUJSvJjJyZ/YeFhw+HW3gWMi2jDjd92zgfiE6W3OyhNmSjEnNYa6P3ZDsnFY
	wkU2bWyZQWbOb
X-Received: by 2002:a17:907:3f0e:b0:c29:1133:e16c with SMTP id
 a640c23a62f3a-c292af1d823mr964699166b.9.1789047914053; Thu, 10 Sep 2026
 06:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910042950.1619727-1-jackzxcui1989@163.com>
 <20260910042950.1619727-2-jackzxcui1989@163.com> <7735bbdb-2465-4ed3-9486-be9b82f3f42a@amd.com>
In-Reply-To: <7735bbdb-2465-4ed3-9486-be9b82f3f42a@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 10 Sep 2026 15:45:02 +0200
X-Gm-Features: AcwNN1W4Fmn_THNHZExq2V-4YmYAoIEn8ubH1TkR1JJ2GQUNmz5XPZNvxnkoOFM
Message-ID: <CAKfTPtAB0VpfbZ76zKSQJdm5pdSGSa6pvoEJNgQu5UUJTm95Jw@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 01/10] sched/fair: Do not set_rd_overloaded()
 if rd->online != env->cpus
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Xin Zhao <jackzxcui1989@163.com>, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 10:30, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>
> Hello Xin,
>
> On 9/10/2026 9:59 AM, Xin Zhao wrote:
> > In update_sg_lb_stats(), it only traverses sched_group that belongs to
> > env->cpus, but env->cpus may not necessarily equal rd->online. This can
> > lead to the incorrect clearing of the overloaded flag of rd. For example,
> > if cpuA belongs to the online CPU mask of the rd but does not belong to
> > env->cpus, and cpuA consistently maintains nr_running >= 2, while other
> > CPUs in rd->online keep rq->nr_running <= 1, the overloaded flag of rd
> > will not be set until next update of update_sd_lb_stats() for that rd.
> > During this period, sched_balance_newidle() will prematurely return due to
> > the incorrect assumption that the rd is in a non-overloaded state.
>
> Only two cases manipulate env.cpus:
>
> 1. LBF_DST_PINNED: The CPU doing the load balancing clears itself from
>    env.cpus since pinned tasks cannot be moved to it and goes to
>    "more_balance" but "more_balance" does not recompute stats and never
>    reaches update_sd_lb_stats().
>
> 2. LBF_ALL_PINNED: CPU with no movable task is cleared from env.cpus.
>    How will rd->overload being set for a CPU that cannot be helped make
>    newidle balance any more efficient?
>
>   Since LBF_ALL_PINNED is known with busiest's rq_lock held, maybe you
>   can set a rq->flag and later consume it in add_nr_running() to
>   do set_rd_overloaded() selectively.
>
>
> Now a combination of (1) -> (2) -> redo can actually leave the original
> "dest_cpu" out of the env.cpus which might be problematic.
>
> Vincent, do you know why we clear the original dest_cpu (the CPU doing
> load balancing) from "env.cpus" in LBF_DST_PINNED?

We clear cpu_busiest when all pinned to prevent re-selecting it next
time and as we can't do anything on it, we try to balance without it

For dest_cpu, it's a bit less obvious but IIRC we can have cases where
we ping pong between a few number of dst cpus because the task checked
with can_migrate goes at the end of the list so I suppose that we can
have:
dst_cpu= cpu0 tries to pull task TA  but can't because of cpumask
it sets new_dst_cpu to cpu1,
dst_cpu=cpu1 tries to pull task TB but can't because of cpumask
it sets new_dst_cpu to cpu0,
go back to the beginning

now in case of redo, we mainly want to keep cleared the busiest cpu
but we could probably add back dst_cpu because the busiest_cpu will be
different

>
> We update the destination to env.new_dst_cpu, "busiest" is till the same
> and instead of moving load from A -> B, we are moving it from A -> C.
>
> Later, if we do a "redo", B can still be a valid target for a different
> busiest CPU with movable tasks right?
>
> >
> > In update_sd_lb_stats(), add a check to verify whether rd->online is equal
> > to env->cpus before calling set_rd_overloaded() to avoid such incorrect
> > settings.
> >
> > Signed-off-by: Xin Zhao <jackzxcui1989@163.com>
> > ---
> >  kernel/sched/fair.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index dcf860c59a14..13e873b1ef58 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -12679,8 +12679,12 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
> >               env->fbq_type = fbq_classify_group(&sds->busiest_stat);
> >
> >       if (!env->sd->parent) {
> > -             /* update overload indicator if we are at root domain */
> > -             set_rd_overloaded(env->dst_rq->rd, sg_overloaded);
> > +             /*
> > +              * Update overload indicator if we are at root domain.
> > +              * Note that env->cpus may change during sched_balance_rq().
> > +              */
> > +             if (cpumask_equal(env->dst_rq->rd->online, env->cpus))
> > +                     set_rd_overloaded(env->dst_rq->rd, sg_overloaded);
> >
> >               /* Update over-utilization (tipping point, U >= 0) indicator */
> >               set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
>
> --
> Thanks and Regards,
> Prateek
>
