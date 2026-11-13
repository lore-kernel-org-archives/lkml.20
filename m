Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794566957;
	b=gbwdc/c1sNNo6wwYGrbpa3koSQ2eykMlKq+u2aRarHCbQ7MCzDAZyIdGPe23CrOotNfG
	 Oa33MH46I9kb+1SiJE6hkx440pVjJ4MGC7Lk+uO793Gn0aD4kZkl3fLWXnN5qJtRi+B+5
	 kq0al1vTIGb2VP+UGo4O0aAPBcbGDzWH6yNbVbQb5ojuDAlCwpcb17Ci0Y9zBzAS5HDns
	 vxcwIXsuILpOnnK2njX/kHiUowNqO5m2I0Vq7Eg9q2ICvwCKziBASqBnj6lgvwwIhUOTd
	 76IdbRZgIh7wHqrcDVWGoW0r3Vfqa6gyzJ+UfjUndXb2cp1eCmjG/QklPhvB4tyFl3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JTfJbS10SAhLayZBK7QayKezkLtHPNyapi94XEiP8bo=;
	b=COAi2RW1PncP53v7r0tyB4XhKRfdTVq2LNPjEwKLW2ORPaOICeMNSSpAPJohJAYzBPOk
	 eULdfmtIS8r8pwiuVL3pfYmM2pmz+sbq6LckgY0qN2iiF1CrRlcDhlPKyUAu9+4irQy7j
	 yCQJuWiRzAMalVXRS2NdhU/2ubZUWSXpSPIuwAQd1u6q+IMM9O05hSnzkyTcqsxpn8iWk
	 fe+nRocyXDhacK9PYmCXZJ0kapuVLaH1PCP96VKWmBANXQW49X4oiMKegTPLHzhv7eieH
	 id1CBgx2GejhjYRAIgUqzgf38WSFQIpUdVVMqpPFjVrikTzbhwAgUzaGrFmL8chG47g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sUiJzb5j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60983606A335
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60983606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sUiJzb5j
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so1284485a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794566956; cv=none;
        d=google.com; s=arc-20260327;
        b=RW858StCIGu0ZO4THSwL+5t1+0uytkHlfbDuRqyG41fluJliGKK2v3XEEnbpVpYlM3
         C5p4lZeWNgZRVfwHnG6FW1EX3Q6Qcyy8hZNbOlHW+7DBuK0cASVjZjij2gRVEPQWIzKK
         n5O7pU7X74JcPS7pKOqTw7/I/96A5dLa1z2YxDBXykluOsBV0nTohS7gHtFvRpGSbeTf
         ZUt4MWu0qqNG4E1vkHYhkE2d80Uyz5BBj6hMkaxC7xc0byXLO0cyCw1Bc+AFN9cDEEl3
         eSNYAG5OQg8IlOkJ6bVLne1u1jB1fXxTOnskq9M4TlKegOPnhojgTMajdnTwiwilxlre
         bDdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JTfJbS10SAhLayZBK7QayKezkLtHPNyapi94XEiP8bo=;
        fh=5mWnxMd1w+2H9/2dgjya7queuRTxPR4U5FRiot2tOPM=;
        b=Cpd4MLcQCX8Ri8kSr+lDfrCCns3R+cMQeTESIV2+3Pm29TqcFLVXSCC6Iuc7mWS/Bw
         5+x/cm4QQZLB8WxsHzSDnzg+CTXar3RNyXPOm41TMpAdpu0eDP9Tkrq/7dIO3YuI+cVn
         IIBTm579VbuW/ajDKfGu4ECoe7wv28rCvWl1EarSPC1EyZi+bQW+SvXvoweJhJWY6Sik
         j+3emrIs+/R1GRax4rPDHHd3EpajsAIL3/BMiaNXG545TAwib5Fd7n7wENINPh6p5ZRl
         fzBSbE2fe5I+EKOQYNNszG54ahjCpqG0yR/8hgYg+9aRrIiEXcOCIitl7009d2ak/JaF
         BHKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794566956; x=1795171756; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JTfJbS10SAhLayZBK7QayKezkLtHPNyapi94XEiP8bo=;
        b=sUiJzb5j8kzjG5rFAwt2lYPsOrZC8lwZwqlP31LJtDvdcJ01+c/zeWa/v7zmdHqJ2s
         R7GaIh2zsKQEPhTm79GWV+vFc/ZJkat5LJNZ8TMmqiIVI4XNbcVLuk3p25uKHmEvjLE7
         RDFDL5XFE192cw+TZ9w2LvsiFN/Ubm2ZU+lsyvBWRgZXP1UnaWxZ7JZ5yPkS0T2N/ZEK
         O5VKKIYqtoXLuSZEz9DB/EmmIGGHjTIq128D9+TdUfKxoDUxjUx1BwhNfo18JxpBYnGr
         tFCFcmSiPI+KDAsR0c9B4tNffO01rwil5zH17ca3R4nh/0oKZBXBjKCDYG/EVoMnRkMJ
         oi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566956; x=1795171756;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JTfJbS10SAhLayZBK7QayKezkLtHPNyapi94XEiP8bo=;
        b=qgVqDWCO0YpwWntdcJ3O8YB+8I4yP8eiqMiV0Je5eh3WQDCEMRFWpEoTx23VIdqRMU
         qlginGPkj62/tgrTTR/19+aHlfq9ess1VtwfJYmWO+FeZQs1WH38fP4+p60rzx3ddu3Q
         OIPpCttRWzdYFF+BxRrwJKsVwzhO40qb2nEbRaFj2h36e4tl6+FgluDKdMyr8VMCiGb1
         6mBUkoBiANwUs2/7FXR0vxAOjtmyB1jngUllZ/oEvVbxDGAsmQiYpzNqZ55vhF3MIenC
         WSyaW374H1yXCxUIERt2UJ2phk8Saak6lkqukZSh2KXhVZItuUUl7LERA8SSQt7i3Pon
         WFfA==
X-Forwarded-Encrypted: i=1; AL+hErHr8uu27gH4Vu0MDQXs8YpW2JNwpFtCSfgNYpSX6CYa9LlScasb8YJf8FkyAN2vROKKh715/gEEJq8HGQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YOgne/GOeT3xL8Q4qjtMLs5ENQcl02gsWx8wEI/XadWyxgZsz
	/KUhUceNb1KtBvcAJ3R6jhqa/p/Hf3myZ0+JyUvMZRcPnqLK29up+raJZIxdld9uqG0mrxgUqe4
	Mgo5FatA0uEtPfrVrTT85F7n+AjK4Q1Ll6Ju2VDUrNw==
X-Gm-Gg: AYBFou0oeJSkS1k3sDLoX/rRiW9KRSd/yWmDd4Y3y/jVRu/LjXGNVmmD0t5uEx3bmh2
	40nnLLN2QvletEz9JGKy3e4A3/ezjeOCPF5Gzyi0Ujm85P9Nutebp4fnQoocYRkCoFYUhOoEJdv
	F7T4ezrbDaT7fTdBnBwIOHeQSWsBOamNwzUo6kB0rj0xkuKqiiVRVVzNjjtelJD7scbfwS12Wjo
	BMaxjNB1FFFMKw/9gUE6Ia9ud4T+f9HPZh7e67F+qajIdfpNfwNCwvPcoknNEgr2+e7DOc1TICx
	QXgeacqFgrVs6nomGPo6ZxzLoFaIKsGsaeiqqF+taXrdVh8jXK92eW2wuZpGOJI1YZjjTzeHCRM
	QVvEUv/cQQcNff7tcM+sM7rwthqoR3p0H6CR12LvnyvBrSjZr38rJa2Sw9GtcP4lRYsHsMQ==
X-Received: by 2002:a05:6402:e05:b0:6b4:2fb2:44f8 with SMTP id
 4fb4d7f45d1cf-6b7c0d1cabcmr1977930a12.42.1794566955396; Fri, 13 Nov 2026
 02:49:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
 <20261106151947.3991524-14-vincent.guittot@linaro.org> <fceb72e4-0042-249b-8223-f912f2a50d80@open-hieco.net>
In-Reply-To: <fceb72e4-0042-249b-8223-f912f2a50d80@open-hieco.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 13 Nov 2026 11:49:01 +0100
X-Gm-Features: AclHuK93LzBqjNugOvp7vsT1Zi6WPLqjO3BWR9AFgUHwCjO2r9c6gTAQV4RnDhw
Message-ID: <CAKfTPtBE3pU=71EyEfVRSbOBG+Y9itNEhfwd7svT9+JZhek-vQ@mail.gmail.com>
Subject: Re: [PATCH 13/20] sched/eevdf: Try to push short slice task on a
 better CPU
To: Li kunyu <likunyu@open-hieco.net>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	linux-pm@vger.kernel.org, tj@kernel.org, void@manifault.com, 
	arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev, 
	qyousef@layalina.io, christian.loehle@arm.com, pierre.gondois@arm.com, 
	sshegde@linux.ibm.com, kayracizmeci@gmail.com, tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:25, Li kunyu <likunyu@open-hieco.net> wrote:
>
>
>
> On 2026/11/6 23:19, Vincent Guittot wrote:
> >  static bool fair_check_pushable_task(struct rq *rq, struct task_struct *p, struct task_struct *next)
> >  {
> >       if (!__check_pushable_fair_task(rq, p))
> > @@ -10120,6 +10137,12 @@ static bool fair_check_pushable_task(struct rq *rq, struct task_struct *p, struc
> >       if (next == p)
> >               return false;
> >
> > +     if (next && next->sched_class != p->sched_class)
> > +             return true;
>
> Would it be more appropriate to use sched_class_above(next->sched_class,
> &fair_sched_class) here? I think placing prev on rq->cfs.pushable_tasks is
> justified only when next belongs to a scheduling class strictly higher than fair.

class strictly higher is the most common case but we can have cases
where sched ext dl server preempt fair task

>
> I also wonder whether doing this in the normal CFS hot paths -
> put_prev_task_fair(), set_next_task_fair() is really desirable. PATCH 09/20
> already replaces the unconditional raw_spin_rq_unlock() + task_rq_lock()
> sequence with a raw_spin_trylock(&next_task->pi_lock) that skips the push when
> the task is already locked, which I agree is an improvement.
> But could the push decision itself be moved into the load balancing path
> instead? That would keep the hot paths free of migration-related locking and

LB is not the right place for several reasons:
- the period between LB can be quite long compared to scheduling constraint
- EAS disables load balance
- periodic load balance looks at balancing the CPUs in a scheduling
domain without taking care of indiviual tasks requirements. It looks
at CPUs and then tries to find a task on this CPU that matches the
constraints whereas the push mecansim is done per task so we can take
into account task specific insights like slice, min capacity,
preferred_llc when looking at a CPU.
- We want to use push in a selected number of cases where we want to
act immediately

> select_task_rq_fair() calls. Or is the next-aware context (knowing which task is
> preempting) something the load balancer cannot reconstruct, making the current
> placement necessary?
>
> Is my understanding correct?
>
> https://lore.kernel.org/all/20261020083746.37068-2-likunyu@open-hieco.net/
>
> The SMT push work in this patch is intentionally quite simple; I think
> it could be generalized with only modest changes to perform push at
> larger scheduling-domain scopes, such as the LLC (last-level cache)
> domain.
>
> I realize the push direction is somewhat at odds with the current
> cache-aware scheduling work, which instead tries to make cross-LLC
> migration less attractive. Still, I'd be interested to hear whether you
> see any value in a push-based approach at the LLC level, or if there
> are related plans I should be aware of.

I think that Chen is looking at using the push mechanism proposed here
for cache-aware scheduling
https://lore.kernel.org/all/as2-2b417B8ZaFdO@chenyu-dev/

Thanks

>
> --
> thanks,
> kunyu
