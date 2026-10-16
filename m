Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C8F47F2C6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159624; cv=pass; b=gZLnV1lcgJOUZ1EIVqeTnCFGmjn+wM6EneOTo7GaH6/ksBVJBoCmBwXoVkWJSkPdDsnosp965TioevnjDpH2ciZ3IjqdzWh0ffBP/DvGfD5WUB4F0AQ4lxy7tBrMFIkyKFg9OuRJZAbAuvZTstnnuma5cknMsH34EniREbrb2so=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159624; c=relaxed/simple;
	bh=KDqTV7okpyKmCgwLEaW4a1elSqtMPD3aea+zr+XsSL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o3CkjaJqzQV/gU4y9XkwpXnQP2wo68AQa3/gxPUu+4T4u3JcdZyakG9pX9yJNgXjxNB4vTWm/u/uEcwJGzAkJhRWf8m9+LLe86di+Gr1UC1mDbJOQNuSRCWQWodwUWknZyzJZyyY2GpOg39wWHJi7boVUfKJpqcMyuRVxS+oOtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ri9h1X+3; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ri9h1X+3"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c418e215671so6057866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:07:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792159621; cv=none;
        d=google.com; s=arc-20260327;
        b=lR7wb0Mx8BSTxBmUIkLk17/rHl7pAXkZSEeiiwd+dRhwtGu+EjH75HGclPM4rKUSZM
         ozlYSwKUjUbqwQmmPVbELSpW/G7sRZbfgXyk089UB02V3OBwqQ050Nd/HgF3BPKUjGH+
         HBUjMGBYymkSsdWsYUvzFpRSw8bzXFluWPFAgM/J1D/DqcHqb41q662OdICx5aH4hhe4
         agUXg1kVbHCrhSFDEIGUo3cZG+M34nxYhlcMmRKjbkJ10tQ7y1rEnVzuh66U77XUmnIU
         qzqptUXNALun9ntim06z82Eko83/zRH9U4aR5a8AyVHngh2CxqERj7o0tShdPGy6JCl+
         ow/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cuoHhCa0q6gpEKvDNnB/F/q1ssezxztgWvN20DsWiZQ=;
        fh=smYOUmQIyJ+CJRJGuV9O9k4Rw2m8Yg1x5PW3X3Ay+mw=;
        b=lPngHSDMEp4HUwCo5sihTqSorbguTeFQOKJ4QYjv5r0ZVI64A8R9p+3JE8VzaJmdhF
         ENoQUSaFKpGoluuDK6o8pVUPqwnAANs8CFTvyDBrSgfm1gKgAQxBl7ttrzjZ0kScukDd
         XA5o09IBupFzSsZajJhwHSsnjr+zp84TsxqHj+jeg+6xcot5nAfnKxBozZPX0nMt7Rqe
         YKPRMbkCpScbSDL2D2T9D/wg/4Tt4gopBuceZoBAiHOmDys9SP/PA4rZ1ptH1PsTVnQs
         yU3IKas2LCh+HmySKYZsvmGpV6ktLJXT0j4DlFf/ikDrpvxn2bbb90K8MC2zmTGDoBe4
         UR4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792159621; x=1792764421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cuoHhCa0q6gpEKvDNnB/F/q1ssezxztgWvN20DsWiZQ=;
        b=ri9h1X+3n83RdvzDZQyhtZpWz27yaabIYOcvacX/8rqiuA2E7MVDiQGey+BTHGEd0G
         yT0JJ9LE4Ag0BDARs2KILO2hZPhgFlqUXLNuOZXwcg875MrWhMWCN7TKvsKSbUqRGLOG
         k3RkD95DUWrwT9t5qzSH0+zQUC3rw0NH2167n6iVHjOx3Hgj7We9znRObjm0+5LtvRpH
         zy6u0w6lDecGvcJoIL4n4JifDMYMNhR+GyrnUrevskCQtLnm8YOEWy52bapENNB+XbDI
         SZDwTCHIBkLGvNdgngN7PvHNbX5kSk7bXS6/1Apmq3pkZYtn94qbJ1ZIL50nSP05TV7c
         sR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159621; x=1792764421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cuoHhCa0q6gpEKvDNnB/F/q1ssezxztgWvN20DsWiZQ=;
        b=Yxz2VjNVmD0ZLGo9+VI/fVCRfO/dTGjbrgbTYxHninEj5psQcG76Vx9N5o8Empzfdv
         VqM6oMl1NsO6tvf4xg3tf4Cg7m5ueSr7/Qg5uoU4rr0eCseG1D6o8BvtZ+KaDDmw+793
         viMVFxseZWIPiSkE9NnhUgSTid7MfsVAORu8hOZWBG+OdCu5UX1VL99DZzSRUwpow1rj
         OJSBRgBw+0Vbcv4OnHMxHEVGpPViiGkIsXxDsc+bd617YE+R4bcwEmM55iuBeM4ykfrY
         AxivsnDwz5OCIuBYhJu51FiMeimPgPRvShPQI/R44L3f7bHS1EUjmeYLxdjORZC00Ae1
         PyZw==
X-Forwarded-Encrypted: i=1; AKwUvBwrKDaRjbc0ZGOutC1ihMk125WFuwrQ+mN1o6njPZGgGkpDsJin9r6+Hc7fcAueP2R955TnJnJ9up5jXbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1CT1/cfiWGRbYhEZN3mqay59q8j1IhWHnxtw+CLavlUO5rFP3
	dZN7ogkJYwWf1vq+F5ugHQj4GE8iREB5tXxD6TOErgdjr/g0yyJQ1NBrSt0Qc1b0WIficPwnM2w
	ueS00ZJp/LVkOb/068rKr5Zt9v0bg3hZWQrAPx+Kj5g==
X-Gm-Gg: AYBFou3dSoghNNZLP7/g7RHLZuWT9djnYuadxPFpPYiONmV/5zhk+OWiEkSI5TgQTt0
	2vUmXi844Ij12d4cwzRD8QY5lMbRUFCgldGuPAaiQK11Z4KFO8mOV6jF9f+9uB++nFYr33L9UN+
	CiDskj3CXqx9iw+r8/vY+7BnhaNf019lW/pv6vsIhk4UKnDMs6RweO88XlpWQItXRheki9BU6eF
	WLnKQM+B7tinf+Vgm5soPHqQy44UwXDq43c4sFrorsSAeZ97j6R6JkLkTyka4dibFsTHQAOwyjo
	O/G0ed+gj7vHQNDhlDJZTDI9d3wJ1zI9Q1JxugUOyyGY15wPUMkxXUzUXbvboJhYu8yLL/OU7in
	LErq9fciw1m/5zwDRe9s9Btg=
X-Received: by 2002:a17:907:c10:b0:c26:19e3:e97f with SMTP id
 a640c23a62f3a-c31aa079ebdmr1895384666b.31.1792159620489; Fri, 16 Oct 2026
 07:07:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016084604.17999-1-kayracizmeci@gmail.com>
 <CAKfTPtBYSdrLe09hp3R0V1AgV_FY65mGaLxHUdLVhpZqU6KpKw@mail.gmail.com>
 <atHwIzHeWaw1kXXm@scheduler.schedules> <atH8BI9jCf2gqjTb@vingu-cube> <atH-Rf-yL7ewRTgD@scheduler.schedules>
In-Reply-To: <atH-Rf-yL7ewRTgD@scheduler.schedules>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 16 Oct 2026 16:06:47 +0200
X-Gm-Features: AclHuK9MvRKz_Kp84wc5s0AJjilob0jI-VqsEV3guIkdF2KSGIxS0KAidQxMRBY
Message-ID: <CAKfTPtBW2RymeCLdRr2OraqX=e0RFzM3fuoTP65oG=5x_5opVw@mail.gmail.com>
Subject: Re: [PATCH v3] sched/eevdf: Fix vprot across reweighting
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: peterz@infradead.org, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, christian.loehle@arm.com, 
	elif.topuz@arm.com, linux-kernel@vger.kernel.org, mingo@kernel.org, 
	sh@gentwo.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 16 Oct 2026 at 12:51, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> On Fri, Oct 16, 2026 at 12:27:16PM +0200, Vincent Guittot wrote:
> > Le vendredi 16 oct. 2026 =C3=A0 12:45:45 (+0300), Kayra Cizmeci a =C3=
=A9crit :
>
>
> > > >  se !=3D curr so why is this needed?
> > >
> > > sched_change_begin() sets .running as task_current_donor(), then if
> > > .running is true calls put_prev_task(). put_prev_task_fair() sets
> > > cfs_rq->curr to NULL. While the task still is the donor. Then we ente=
r
> > > sched_change_end(), we call enqueue_task() with cfs_rq->curr =3D=3D N=
ULL but
> > > the donor is still p. There is set_next_task() call afterwards, but i=
t
> > > does not sets protection since its called with SNT_NORMAL.
> >
> > okay, but we don't want to spread this all over the code.
> > reweight_eevdf/scale_entity is  doing this already.
> >
> > The below should do the stuff while keeping the computation in reweight=
_eevdf:
> >
> > ---
> >  kernel/sched/fair.c | 26 ++++++++++++++++++--------
> >  1 file changed, 18 insertions(+), 8 deletions(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 0feec172fd37..c212c6aa9691 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -4863,10 +4863,11 @@ rescale_entity(struct sched_entity *se, unsigne=
d long weight, bool rel_vprot)
> >  }
> >
> >  static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity =
*se,
> > -                        unsigned long weight, bool on_rq)
> > +                        unsigned long weight, bool update_vprot)
> >  {
> >       bool curr =3D cfs_rq->curr =3D=3D se;
> >       bool rel_vprot =3D false;
> > +     bool on_rq =3D se->on_rq;
> >       u64 avruntime =3D 0;
> >
> >       if (se->h_load.weight =3D=3D weight)
> > @@ -4878,22 +4879,25 @@ static void reweight_eevdf(struct cfs_rq *cfs_r=
q, struct sched_entity *se,
> >               se->deadline -=3D avruntime;
> >               se->rel_deadline =3D 1;
> >               if (curr && protect_slice(se)) {
> > -                     se->vprot -=3D avruntime;
> >                       rel_vprot =3D true;
> >               }
> >
> >               cfs_rq->h_nr_queued--;
> >               if (!curr)
> >                       __dequeue_entity(cfs_rq, se);
> > +     } else if (update_vprot) {
> > +             avruntime =3D se->vruntime;
> > +             rel_vprot =3D true;
> >       }
> >
> > +     if (rel_vprot)
> > +             se->vprot -=3D avruntime;
> > +
> >       rescale_entity(se, weight, rel_vprot);
> >
> >       update_load_set(&se->h_load, weight);
> >
> >       if (on_rq) {
> > -             if (rel_vprot)
> > -                     se->vprot +=3D avruntime;
> >               se->deadline +=3D avruntime;
> >               se->rel_deadline =3D 0;
> >               se->vruntime =3D avruntime - se->vlag;
> > @@ -4902,6 +4906,12 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq=
, struct sched_entity *se,
> >                       __enqueue_entity(cfs_rq, se);
> >               cfs_rq->h_nr_queued++;
> >       }
> > +
> > +     if (rel_vprot)
> > +             se->vprot +=3D avruntime;
> > +     else if (curr || update_vprot)
> > +             se->vprot =3D se->vruntime;
> > +
> >  }
> >
> >  static void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity=
 *se,
> > @@ -4965,7 +4975,7 @@ static void reweight_task_fair(struct rq *rq, str=
uct task_struct *p,
> >       for_each_sched_entity(se)
> >               weight =3D __calc_prop_weight(cfs_rq_of(se), se, weight);
> >
> > -     reweight_eevdf(&rq->cfs, &p->se, weight, p->se.on_rq);
> > +     reweight_eevdf(&rq->cfs, &p->se, weight, false);
> >  }
> >
> >  static inline int throttled_hierarchy(struct cfs_rq *cfs_rq);
> > @@ -8200,7 +8210,7 @@ enqueue_task_fair(struct rq *rq, struct task_stru=
ct *p, int flags)
> >       weight =3D enqueue_hierarchy(p, flags);
> >
> >       if (!curr) {
> > -             reweight_eevdf(cfs_rq, se, weight, false);
> > +             reweight_eevdf(cfs_rq, se, weight, task_current_donor(rq,=
 p));
> >               place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
> >               __enqueue_entity(cfs_rq, se);
> >       }
>
> On the old code on_rq was always false. But because enqueue_hierarchy(),
> se->on_rq is always true. So this just goes to the other path in
> reweight_eevdf().

I changed the interface and the last arg is no more on_rq but force
the update of vprot

>
> Also, vruntime can move in place_entity() too.

But still, this is horrible...

Also, after more thinking, I don't think trying to keep vprot correct
in all cases is worth the effort, nor is it achievable without cost.
When one changes the prio and/or the slice of the running task, that
task might no longer be the best one to pick anyway. We should just do
our best effort like other places where we only decrease or cancel
protection to ensure it will not have an extended protection slice.

>
> Thanks!
> Kayra
