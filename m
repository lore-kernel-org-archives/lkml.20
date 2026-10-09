Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD1A324B33
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552924; cv=pass; b=bQL+itM/bVPUH4/Pr+J4rODR61XpakN8+rEdT+gE0YNJLzlIHyd36uNM8f7G/aYAWvi7P7fILSR5kZV0pTnTOLL7FfKhvcyD37E1uSKkiwqHi1yGlNoIIbt+t3WLTu2lMW5Dedkp+hnBrlucnkJYnwTqtonJOpNRBzBLMtrjAu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552924; c=relaxed/simple;
	bh=NSL1230ZzJQ74Jx1KNkVBnc3qpUs25gQVJx30zAtXRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OPnVDjY3gqrmCXhbHBBPD5yzDTmCp/Ucux4QjmyCtUEWW9JX46PXsRmo4kkPpCjYcrj5Iuc/jF8Pvy8WUOFfrJO/ptZ2bpp2k1aFhyAJibhmw5E8ftrJj2fjZmtzFTMnwCKEDvWnaxyXHiAgzX3zl/6v39Go106X2tXjYPn55J0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c3OnDduA; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c3OnDduA"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c31a34de844so166199566b.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:35:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791552921; cv=none;
        d=google.com; s=arc-20260327;
        b=Kfj+mdwP+EZqdZWBkinvuRtg00v8uKBxBm7GEVUZntOWXc/qWgBt1S25efPNNF43JE
         NY+4VeXIPCxwu6InPL+eUUj2RQ5jMQgpbsdo3i3v/8XXV1pggwERWj1IrcizJ1s+UBus
         9zJ/HrFsZgezOdRuDYIgp46R/JnjpW3wWP4hYKsWUesDWu2Vyq8U1raFhjxEHZgHHOWj
         Azmwfn8HVWVPfmaQ58ASC+df+QwkZRuSOJK38lpwIwq8n8tkImmyB0woq/JmazbnGLKK
         jXVqPN71XsPrMXiiyusrCTy239Q/xFGx7lMmwSF1GCS00wPirY46WRRHM16RGkf9eGfg
         F2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5gh61X4RiGipDxIUahocXKIUNnUE9ZBer048Hrx3Sr0=;
        fh=w86eu0PtHods8X5Fp2NYdBjVOT7Mke+XGraiurLkGxk=;
        b=rJpNt/qgdUV5WxEDmixw9XaI6DoATiCKRAiLViFqKkqgXTGk9P6v5p1Q8GOwrEBSDY
         zEYY0CjF5S5c2fmcGxcrizbhA2+b8acJfWNYY8bUZp9v9byXMifHRezi2PfUySI+QuYK
         qSlY6/vZQDQ5sE04oENM4sMUGd0rXUn6EUgFS2R8l6tWGBe4U/3oL4YZGS6wrRuKMTVU
         7j0/15Vk13ETO5sFOMYqCeN/yktsZ2Ss8JQ4G/2lLWqx5aOkhPRaFamxWcSajfTNfSZI
         LmUQvbD806tTiIFaTzn2sae8mxKF5p4mEebuhhkQNNMUCLOERQhzPD3fPGnzJguVB75m
         XphA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791552921; x=1792157721; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5gh61X4RiGipDxIUahocXKIUNnUE9ZBer048Hrx3Sr0=;
        b=c3OnDduA0hC4gTNN4clQUYbakcAkxvUoNwKY8Hd78jmH9NcU11wSEBwKyDOZc8q8Mp
         gXE3qoqzWiEOytEhRSgejuLYAVUZYuEvWJlBZu3glue23DzRCHm/fzQS0G57SCEoHkxN
         LyZsMimjpwee/P8Yp0rbrcjDPAgviJNeYqSzCPf2BnanxSsc9sy/ziDJBvIhO1pyZWin
         WK/QjSTE8Enanl7FCBJb/F4rAP9q4j7uJL6ASM1M9jgnL2T/wR3fP1LEDtwgsnw4jxGj
         wcoTtqto9GPG3hKTpAwnokDrjX7iAcqDRzXkBga3oeI6ELKhpvlXRSemPR1yg+Nm1LxC
         gfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552921; x=1792157721;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5gh61X4RiGipDxIUahocXKIUNnUE9ZBer048Hrx3Sr0=;
        b=DKGJNSPUUA+qECtgYdMzR87Sn5IUTkQzjA2un2TDsUHoxmR92zhPqyhh6+/v4xPbEm
         PbmBhuoXLUrI32CwYS2oPmb6bjYxVDRiBfU6gBQfGwsfvuFatAuZmcBwKuc21bVibMOM
         T9K6Zfcbppef7zskGFWvZDL0rJmUWFHl5SzvIig24xBsYrwrcoY2vlKKYLeeAJkmSRXf
         FuuPsoPIUU+rhkp3wsq7NlgDmA+xqU+qAa/DDGUAE1CeN+GsXfBJ063mC8g/lCPwUU5i
         lLfjAkuNc6oYw20OKf093H2fuI3qrlDVYXfwZiFXR6xXqOox2VnbSsQMJ8rHyVNqPApf
         +xwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmeURx/FTcZIuqE1kb2Hxk+FJ6+aHePLHNBMfLkgPLnz9T78cnU2uvxBRnQUdonbF/Ub81fwdWutHVWbc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsyrrjcaP9MhPanOXuPXnQn6wlqy7ZiWu+D/zv2zxJYEbi7u2N
	hCM58bIDqqzGwZZY66EkbfcN3EWl82zQl063aNnYuadJePpZAdOBtx2MjQElCTW6WTDBMlHJELR
	uILqB4/+Kvr78Ada4lFzOfM9PHAb7xb0PuSlnW9JcFw==
X-Gm-Gg: AYBFou1cpmg96lr8+lFQqb47mFS/ctszPXdeOwxfQdv15xXf4tAYHySEZB/abH9ckgU
	K961qRmwElEabJGmFhHY3chNT7F67pysVAOh8RbXOyqIIovjjaOS69Y/q4qjGjgsfvb47g0YmBT
	yjKn5lNWaAmMKAuH6eu5Ybr0z6oFBqsVHVJCzFDPuDA2mTj5QN+JE44pD2uSmwzWxJiTGH5Zpun
	BOD4Mlqm4jCSx/X7zGQCVSaHUgTfHrdRaOUrnrRzkK71Q+ebsL39aTqbzkebs1Mt40GHZTxjW+U
	fiQEvKZ+h4RGRRy7EW8GcIl66MCJSNzLKiOGDOeNdreOEgpz0cquFo1f2LJRVZqiFbKvo1YhbxH
	W9AkMJdlGyv0=
X-Received: by 2002:a17:906:f592:b0:c26:19de:912c with SMTP id
 a640c23a62f3a-c31aa07ba07mr238720566b.31.1791552921162; Fri, 09 Oct 2026
 06:35:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002154415.2270586-3-vincent.guittot@linaro.org> <20261004173032.18867-1-kayracizmeci@gmail.com>
In-Reply-To: <20261004173032.18867-1-kayracizmeci@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 9 Oct 2026 15:35:08 +0200
X-Gm-Features: AclHuK8U9thImNFByGGzg7OkoOg8Hahf03eIGKYMWN7wt2qam3WUMqyVYhsj5oM
Message-ID: <CAKfTPtCWNmVcQ_R+dN0MdZoFnXAGkJL3XmnqSN64vuz_doQzSg@mail.gmail.com>
Subject: Re: [PATCH 02/18] sched/eevdf: Reset lag when waking up on idle cpu
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: arighi@nvidia.com, bsegall@google.com, changwoo@igalia.com, 
	christian.loehle@arm.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, lukasz.luba@arm.com, mgorman@suse.de, 
	mingo@redhat.com, peterz@infradead.org, pierre.gondois@arm.com, 
	qyousef@layalina.io, rafael@kernel.org, rostedt@goodmis.org, 
	sched-ext@lists.linux.dev, sshegde@linux.ibm.com, tj@kernel.org, 
	void@manifault.com, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 Oct 2026 at 19:30, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> > When several tasks wake up simultaneously on an idle CPU, their final vlag
> > will depend of the ordering as the first one will lose its lag but not
> > the next ones.
> > Reset the lag when the enqueue happens while no fair task has already been
> > picked et set as the running task.
>
> There is a typo. ('et', also 'depend' and 'loose' Not sure that's all :>)

will fix the typo

>
> > As a typical example:
> > CPU0 is idle
> > TA with vlag 0ms and TB with vlag 5ms wake up on CPU0 simultaneously.
> > Depending which grab the lock 1st the behavior will be different:
> > If TA is enqueued 1st, TB will be enqueued with a positive lag and will
> > be picked 1st.
> > But if TB is enqueued 1st, it will loose its positive vlag and both TA and
> > TB will have 0 vlag when fair will pick a task.
>
> > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > index d7cc77181ef9..32d7077ef148 100644
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -592,6 +592,7 @@ struct sched_entity {
> >       u64                             vruntime;
> >       /* Approximated virtual lag: */
> >       s64                             vlag;
> > +     u32                             vlag_seq;
> >       /* 'Protected' deadline, to give out minimum quantums: */
> >       u64                             vprot;
> >       u64                             slice;
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 8cda1d39b037..4c8f12fc8869 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -893,6 +893,7 @@ bool update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
> >                       vlag = min(vlag, 0);
> >       }
> >       se->vlag = vlag;
> > +     se->vlag_seq = cfs_rq->idle_seq;
> >
> >       return avruntime - vlag != se->vruntime;
> >  }
> > @@ -914,9 +915,22 @@ void decay_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
> >
> >       rq = rq_of(cfs_rq);
> >
> > +     /* You can't claim any lag when waking on idle CPU */
> > +     if (rq->curr == rq->idle) {
> > +             se->vlag = 0;
> > +             return;
> > +     }
> > +
> > +     /* Accessing remote rq task clock is a cost */
> >       if (flags & ENQUEUE_MIGRATED)
> >               return;
> >
> > +     /* CPU has been idle in between so the lag has been removed */
> > +     if (se->vlag_seq != cfs_rq->idle_seq) {
> > +             se->vlag = 0;
> > +             return;
> > +     }
> > +
> >       /* Compute sleep time */
> >       delta_exec = rq_clock_task(rq) - se->exec_start;
> >       if (unlikely(delta_exec <= 0))
> > @@ -8190,6 +8204,9 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
> >
> >       dequeue_hierarchy(p, flags);
> >
> > +     if (!cfs_rq->h_nr_queued)
> > +             cfs_rq->idle_seq++;
>
> Shouldn't this skip DEQUEUE_SAVE?

Yes


>
> > +
> >       if (sched_feat(PLACE_REL_DEADLINE) && !task_sleep) {
> >               se->deadline -= se->vruntime;
> >               se->rel_deadline = 1;
> > diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> > index b98084e1f5b0..69a2a749e188 100644
> > --- a/kernel/sched/sched.h
> > +++ b/kernel/sched/sched.h
> > @@ -689,6 +689,7 @@ struct cfs_rq {
> >       u64                     sum_weight;
> >       u64                     zero_vruntime;
> >       unsigned int            sum_shift;
> > +     u32                     idle_seq;
> >
> >  #ifdef CONFIG_SCHED_CORE
> >       unsigned int            forceidle_seq;
>
> Yeah, well AFAICT other things seems OK.
>
> Also, while trying to get this patch series on my tip
> branch I had a hard time. I was at the caves
> of git and b4 figthing with... Everything.
> Like there were no v2 tags on some of the patches
> so b4 didn't tracked them. I had to do some
> things by hand and finally it worked. (Not too greatly tho.)
>
> But who cares? :>.
>
>
> Thanks,
> Kayra
