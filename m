Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C57A38DC64
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161424; cv=pass; b=KoFWBnGaO2/ZpMyr1bx24voKZjbu8rfB/27Ydrsw6yFFYHcwn3HA/av1nC405R3mZzQSe85+M353ISUaAN236j5lg3fXC1yEJIqLXpzr0ADiVAc4aV5Nq0ap7+wUj0FKVi2CKBqzhDW30xd5/WkQ7GxVJ2yEQomXrrOxrjBgHe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161424; c=relaxed/simple;
	bh=ujUlbqFARVRrU24S9SzrsDHpBHq1dC3J5fiG/A2DQgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nub+A5OviUZMIRV6Pi5JDqjj/FsTUzXJ4ts1qoeCz10JAiYVsGvqFgAR9HH0GLDEK5BzXUj5K0MtATJ+Hs9m3tAsGQT2C0cuheB6+wSpxVbAWToRiUTAjz/e+Q5/+/YdmqPgRhAM137NLJscJ5lQeteHx4pGbv7YpNAVj0xH2Qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lyeWsXrT; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lyeWsXrT"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c20ce3c118aso15089466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792161420; cv=none;
        d=google.com; s=arc-20260327;
        b=G8aETBBk326semdRYLL4LXO5WoEuysbVMDMyL22Gs407gmXBVTzqQQFNNJCahI7uRH
         JzQTD/B+p4Oq0IP2nLLTMkZyaKcfExJqY4NyZ+57djoI4GxCaZh3LW+8KsGdODsZf1MR
         vuRoA1X4VpWQgjBZXmuFhzy2KhBu0G0K9ZG0EAiiUNkT18sglU9VvI3COrBamUAT2vKp
         GRkUkpW2RqoyN5EkMUx6XrWgCvJ4ZteqOHxbfxsKrrjMQpY/5YHBLQyCYJCWc+fKtPXD
         f4V9l74C6Xh1yik24iaTxjSCE9l0rD/Ko6PNujeyxsJdU38u7ICTXNNwp/v6UvV2k+2Y
         OzWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QMeLdmNeSzRqBCMCA6wOfSozo6Kjzdsl/j6ahgF1qGA=;
        fh=RL1GAvUAINYhJ38ds5LmOvkr5GCY+YIPATdkYAqK4ys=;
        b=fo0oxv5qVi5DGW6l6LHogM+Xy2A/i3DWcnAVsZZAl3/0OSUzzpb52Wg+KMMHs6Pczf
         SErQpNfHBzPNiJvEmE7YqJjWmjouMUqhAp28NmriuhiJm0I0r80YJ45CMIiv34AEu/Lc
         lUsxfeE18IsXrK6qA4yWd5bfnidImDqf2O8q24gqbtsHROa1jLfn1hT7XEUZgc20i23N
         cLQTKJVjJCrHAMVXzY1zcXxiGmqnUseLwJXXhSP/9Ww8L/fMvsUPC5sWYXp0Wm49p/H1
         Ggd+RafQhLaPbTU0Vnji9cG6cjeSm7ATpdURnCu4Zf15SUWxnJN/4CpMpxVi/UBGKSpc
         HllA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161420; x=1792766220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QMeLdmNeSzRqBCMCA6wOfSozo6Kjzdsl/j6ahgF1qGA=;
        b=lyeWsXrTfPPAcFbwE1fz7s1C1laC9oY3bWOj/B3v318IfjuKZW1iEn8YvigB3KB1jo
         3H3/QMZy71emFuv7HUOHXk+c58D7DzMRMCurA4sVkzpvSOlKOguCCNRBHO2GCFpzN76J
         A0N/SyAsjGFPfBjAI50HqWJPgVyYbSS6g1IP8NjoR4g6wWAuGtWz600yXYxbw4PNt3+d
         SWC7K1eZrvB1ZTrbWeWvx5TCPZ9R15XiWUZGXVtjqo8C8UfVojFrXETgixKgLLbr1CZD
         42iddg6MbRummAkK2HgFCw02akRcGPm6YF/gxqvZFj5mfFoFB+vUtPJzVihNwz7X8iBU
         wNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161420; x=1792766220;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMeLdmNeSzRqBCMCA6wOfSozo6Kjzdsl/j6ahgF1qGA=;
        b=lvntHWeep1A8gMgZgCknA/BMFkM1hjYKCvAuPg/pgOVaIR7kdSPn+O6dbe5bo4cxXE
         0VNokVBPOuj4QtvZkXaIlYdZN52bp1q18fRviupZaPP+gJwuJMX3zUxlzI14Cqml02uW
         lUWdvgCFRimrfn8kU64naakqphzGFyTjL3VeLUWm2FsRLWaLoChnDm279xsREADNwt9V
         dYCP9abSsh8mGdw8alhXuL7/y8nDEZ3TTHgw+2q4SaP4IaLSfqUwr9FrC7jrtlyNNGIf
         DN9/3jFia8n47ULTv3IssxcCPLxYwko2XgarIWfvH6C+HMJ4qco/xx/5RyyTfEY3xEPI
         T7JQ==
X-Forwarded-Encrypted: i=1; AKwUvByYrtU7+d6RHCpTVOVSnNQR6TO8ho8F5cmDYhVq/bOKZ1KzLdZ1eAcRg68yzeF0IoR5Hmy/dxp5SwBAtQc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgl6yiJy220byDoE+LHnHoR/5FYTM7fAdIuQ65vu2YqITVL4tu
	o+DCHbkxEP6YzBVlYT+ei7fjM63KozQtPIwWvhV8rhfD7rfAdtp8o+We6tmLa2FTnAodkDYTDV8
	1mW9S3yCgUJ/7lPfeC/X7nOkqzaxPebEfhZ4dPsrs1w==
X-Gm-Gg: AYBFou0fh4ZjqbhkjgY+BgYpe/O/dwjiYSmy6vdn9jZaQvFWiw0KjF0JRubeFtYVXbN
	T17fz2rJBGftW6IKyJVO1oMmeIJbHS/AfPqg0rynFCFIMDvyIag+r+I9cDiJjDecncyIIN2nTVl
	FcOhz+fMgWMKWZSdwzbltDiUb9iJagV2MXCC/GqkvPD38f66AP8jdNgzdVoS/9CMA9hq1F12map
	41YYzGkJtCwtzprb+VnmQdNhsWcuxZG9O7pKzNV47ppkGnzTDELjvjEzns9ZVg/0UJJghzhZZbN
	4ZimTdlaPfVQwQVVKULpZevX+rG2DiRmPngy9wS4Fwh3YFh0NOsci2RCyVhA/6d0OjjpBdRBMde
	9NMIeB+EKTbw0
X-Received: by 2002:a17:907:d641:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c41965a9d64mr9703266b.0.1792161420225; Fri, 16 Oct 2026
 07:37:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016084604.17999-1-kayracizmeci@gmail.com>
 <CAKfTPtBYSdrLe09hp3R0V1AgV_FY65mGaLxHUdLVhpZqU6KpKw@mail.gmail.com>
 <atHwIzHeWaw1kXXm@scheduler.schedules> <atH8BI9jCf2gqjTb@vingu-cube>
 <atH-Rf-yL7ewRTgD@scheduler.schedules> <CAKfTPtBW2RymeCLdRr2OraqX=e0RFzM3fuoTP65oG=5x_5opVw@mail.gmail.com>
 <atIxeVCdZufhlnYZ@scheduler.schedules>
In-Reply-To: <atIxeVCdZufhlnYZ@scheduler.schedules>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 16 Oct 2026 16:36:48 +0200
X-Gm-Features: AclHuK9jl0Te1lPaE8F5Y9jVKJtLIw6amT0lTL87qrRQeiW7Vu6jhMMZETC2zUQ
Message-ID: <CAKfTPtCTK9=8-+F-i=6qX2Wc+J04JKm5Maq1XoZ6jwwhBAZRjA@mail.gmail.com>
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

On Fri, 16 Oct 2026 at 16:22, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> On Fri, Oct 16, 2026 at 04:06:47PM +0200, Vincent Guittot wrote:
> > On Fri, 16 Oct 2026 at 12:51, Kayra Cizmeci <kayracizmeci@gmail.com> wr=
ote:
> > >
> > > On Fri, Oct 16, 2026 at 12:27:16PM +0200, Vincent Guittot wrote:
> > > > Le vendredi 16 oct. 2026 =C3=A0 12:45:45 (+0300), Kayra Cizmeci a =
=C3=A9crit :
> > >
> > >
> > > > > >  se !=3D curr so why is this needed?
> > > > >
> > > > > sched_change_begin() sets .running as task_current_donor(), then =
if
> > > > > .running is true calls put_prev_task(). put_prev_task_fair() sets
> > > > > cfs_rq->curr to NULL. While the task still is the donor. Then we =
enter
> > > > > sched_change_end(), we call enqueue_task() with cfs_rq->curr =3D=
=3D NULL but
> > > > > the donor is still p. There is set_next_task() call afterwards, b=
ut it
> > > > > does not sets protection since its called with SNT_NORMAL.
> > > >
> > > > okay, but we don't want to spread this all over the code.
> > > > reweight_eevdf/scale_entity is  doing this already.
> > > >
> > > > The below should do the stuff while keeping the computation in rewe=
ight_eevdf:
> > > >
> > > > ---
> > > >  kernel/sched/fair.c | 26 ++++++++++++++++++--------
> > > >  1 file changed, 18 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > > index 0feec172fd37..c212c6aa9691 100644
> > > > --- a/kernel/sched/fair.c
> > > > +++ b/kernel/sched/fair.c
> > > > @@ -4863,10 +4863,11 @@ rescale_entity(struct sched_entity *se, uns=
igned long weight, bool rel_vprot)
> > > >  }
> > > >
> > > >  static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_ent=
ity *se,
> > > > -                        unsigned long weight, bool on_rq)
> > > > +                        unsigned long weight, bool update_vprot)
> > > >  {
> > > >       bool curr =3D cfs_rq->curr =3D=3D se;
> > > >       bool rel_vprot =3D false;
> > > > +     bool on_rq =3D se->on_rq;
> > > >       u64 avruntime =3D 0;
> > > >
> > > >       if (se->h_load.weight =3D=3D weight)
> > > > @@ -4878,22 +4879,25 @@ static void reweight_eevdf(struct cfs_rq *c=
fs_rq, struct sched_entity *se,
> > > >               se->deadline -=3D avruntime;
> > > >               se->rel_deadline =3D 1;
> > > >               if (curr && protect_slice(se)) {
> > > > -                     se->vprot -=3D avruntime;
> > > >                       rel_vprot =3D true;
> > > >               }
> > > >
> > > >               cfs_rq->h_nr_queued--;
> > > >               if (!curr)
> > > >                       __dequeue_entity(cfs_rq, se);
> > > > +     } else if (update_vprot) {
> > > > +             avruntime =3D se->vruntime;
> > > > +             rel_vprot =3D true;
> > > >       }
> > > >
> > > > +     if (rel_vprot)
> > > > +             se->vprot -=3D avruntime;
> > > > +
> > > >       rescale_entity(se, weight, rel_vprot);
> > > >
> > > >       update_load_set(&se->h_load, weight);
> > > >
> > > >       if (on_rq) {
> > > > -             if (rel_vprot)
> > > > -                     se->vprot +=3D avruntime;
> > > >               se->deadline +=3D avruntime;
> > > >               se->rel_deadline =3D 0;
> > > >               se->vruntime =3D avruntime - se->vlag;
> > > > @@ -4902,6 +4906,12 @@ static void reweight_eevdf(struct cfs_rq *cf=
s_rq, struct sched_entity *se,
> > > >                       __enqueue_entity(cfs_rq, se);
> > > >               cfs_rq->h_nr_queued++;
> > > >       }
> > > > +
> > > > +     if (rel_vprot)
> > > > +             se->vprot +=3D avruntime;
> > > > +     else if (curr || update_vprot)
> > > > +             se->vprot =3D se->vruntime;
> > > > +
> > > >  }
> > > >
> > > >  static void reweight_entity(struct cfs_rq *cfs_rq, struct sched_en=
tity *se,
> > > > @@ -4965,7 +4975,7 @@ static void reweight_task_fair(struct rq *rq,=
 struct task_struct *p,
> > > >       for_each_sched_entity(se)
> > > >               weight =3D __calc_prop_weight(cfs_rq_of(se), se, weig=
ht);
> > > >
> > > > -     reweight_eevdf(&rq->cfs, &p->se, weight, p->se.on_rq);
> > > > +     reweight_eevdf(&rq->cfs, &p->se, weight, false);
> > > >  }
> > > >
> > > >  static inline int throttled_hierarchy(struct cfs_rq *cfs_rq);
> > > > @@ -8200,7 +8210,7 @@ enqueue_task_fair(struct rq *rq, struct task_=
struct *p, int flags)
> > > >       weight =3D enqueue_hierarchy(p, flags);
> > > >
> > > >       if (!curr) {
> > > > -             reweight_eevdf(cfs_rq, se, weight, false);
> > > > +             reweight_eevdf(cfs_rq, se, weight, task_current_donor=
(rq, p));
> > > >               place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
> > > >               __enqueue_entity(cfs_rq, se);
> > > >       }
> > >
> > > On the old code on_rq was always false. But because enqueue_hierarchy=
(),
> > > se->on_rq is always true. So this just goes to the other path in
> > > reweight_eevdf().
> >
> > I changed the interface and the last arg is no more on_rq but force
> > the update of vprot
> >
> > >
> > > Also, vruntime can move in place_entity() too.
> >
> > But still, this is horrible...
>
> Yeah. There is really no clean way of fixing vprot in all the ways.
> Just a cleaner way than the other.
>
> >
> > Also, after more thinking, I don't think trying to keep vprot correct
> > in all cases is worth the effort, nor is it achievable without cost.
> > When one changes the prio and/or the slice of the running task, that
> > task might no longer be the best one to pick anyway. We should just do
> > our best effort like other places where we only decrease or cancel
> > protection to ensure it will not have an extended protection slice.
>
> So something like below for !curr path?
>
>         if (!curr) {
>                 reweight_eevdf(cfs_rq, se, weight, false);
>                 place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
>                 if (task_current_donor(rq, p))
>                         cancel_protect_slice(se);
>                 __enqueue_entity(cfs_rq, se);
>         }
>
> Does this work for you? And keeping the reweight_eevdf() part as is?

yes, looks good for me

> BTW, I didn't typed a comment right now, so if you say 'yes' I'll add a c=
omment
> above how even task_current_donor() can return true on the !curr path.

Thanks
Vincent

>
> Thanks!
>
> Kayra
>
>
> >
> > >
> > > Thanks!
> > > Kayra
