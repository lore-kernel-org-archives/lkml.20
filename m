Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2A032B132
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160574; cv=none; b=WeCUB1H39by7yeLX0wE+ORnTdhHY8Rn4ntQsuYkBWhieP4S86wnPklDjtfaK1BxQUBLfZeFx7ZpN88CweaVMBbNDJv7hzVQ1wVXQnwYfDYaTmbcqq/bU8Obb9I0spGfqXNB741HWLwI+N5kP2mUdSSSizgdc1gRXH18Suyh0C1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160574; c=relaxed/simple;
	bh=wDudkpJMf5ejI3cqhPGuNbonZgQ9jSRG+XHkNxnZupg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9GnUlizM6wrjoNOTkSLqEjIafrcn3aiwwDJcit2sx33ayc4hpkjJbijVEXtJRhljq+eDmK1CpyfRnfYg9JkqOAHavS2NVirTzbZjLcEycwlwLlwgtmf4i09Lf7va7u2xj4ueXM+Ow5TEtUTIJvbXyqEZ7WXphw1FlImSOfHkZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZbm3gqJ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZbm3gqJ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df160bb9cso314600f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792160571; x=1792765371; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JbzTovp25uxldUAgBphw0KXTMkfsfyJTioqUchT27Ik=;
        b=mZbm3gqJ+lCj85rXg0tHGRmyfkWpUes8kWYTkn+1BKqkcUlpRKc4OUXJxwtwRVVKn2
         iNFHmZA9+hbJl6GMe1p4Q5LWpXsEjFkkj5+cH7VoZhIEBOJ5Uy4OXINMLOFfHawlJ92D
         HiYUDxcUCiR+KUmjeLYb+pKi9Je/wCQtVaR80D6zual87s6JObsL4lGpTXSJ5Sg/+Z2z
         p4h590vcIKC1dmZyEH71J4ZMY8tVdBfhMSIOFA85GvzzFQeROWv6JQy64b5BrcPxBR6Q
         LhLYelpDDxjZIjPYzign/tpgEDCrqXyL3HylhMOG1kYX+If5Ix4wp1nQPvepynapB3Pt
         ZByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160571; x=1792765371;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JbzTovp25uxldUAgBphw0KXTMkfsfyJTioqUchT27Ik=;
        b=jxM4YtwQFYGRpNOl8w4nKxWr6xfCLHN84SDDidHjSGHs09AP2I8DPGe7RU5boKp+FZ
         rndlUTSyO7T0IC/MPgnLeqFRghtrO9i+bZg4plgBIBT3GSn5U9aEYG9veAveqP+r8mQO
         pUjKNawiNBeTt2VQ1qGt2ByhT8BKt4RVJnmezPXJjQFM7hUAnd3g0IRuP4xXAXIbjIc8
         THYHqEyFcKf0kNlW9D5pAG9dsuElsgsjzBr5IejJft41V2lYJEwSvB9Y4gzHTaS+mQI6
         DU6hg3QbxMI4u8U2gJNG/vTmwg/N2qvp6Ne4rxW0U61+kOC5YO/mY7KsWHTQII2RHWHH
         GgCw==
X-Forwarded-Encrypted: i=1; AKwUvBx4/X0O9BlhO7R6f5JLJEeXO4fYZP1/RHUy6WnqX74d/qIWwoZ7oY6JH3SQ1n10PMVv84CX6ErcxWJR84I=@vger.kernel.org
X-Gm-Message-State: AFq9FYICgBCCRfDHdUFaQkZzIsu09tH2D+2CVR6E18u6gsfqqkClpLXR
	rRoSVsALjxOVcRQT2+eY8NHmEzCD0jnDBelIkHDpeQR6yGMe5mIjcfIE
X-Gm-Gg: AYBFou3ivb0lsO/vI6s8LxLC+4NODbgEMHv94wb+ZnHH++GCh4IC17FiFPAroR2X5+V
	iphz8dD6SJK79su3Auwc5+2x5kesoGdzXTqeaOmsgeqppZPE0LZa76jrQhjCaguv1QOKPW+vrnS
	FctYUB9rGXa1xeAuab4FNdfEXH1dZp69zWpOXGq13RLX3X0D+wYyikcDVOXnsU9pCR3gEkk9eG1
	LExh0u5iddrBDGGGtNDl/DFRnGlYZX/7zUgDSx/afFRsOvQD4P2XW+bZXjKiLUZuRwXZCSD/Xwm
	68imC1GbpM4fK2IIljU4cXTnTlQDRKcfVPkyy1ULQN7EVBHoYeEbReyRYYEDuxGQ051Vf0EGbm3
	AcHOxIZCwfH4pBPwAegd7pgh802F0p17ayvSf0AOnggREfCjvr0UZ5c1J2s/8c/HOL9fdWAundU
	aZR1hYaASwg64stkVYSqjZHqi/a2JUCAAkoxTF9Xm+cZ2shwrLxUiwaXuQ6wVzjYIKphshgLtqb
	yhwGesBdLmURIQql92o9pzvjQ==
X-Received: by 2002:a05:600c:6285:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4a18e4760demr471450795e9.1.1792160571155;
        Fri, 16 Oct 2026 07:22:51 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ad6245sm68981135e9.3.2026.10.16.07.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:22:50 -0700 (PDT)
Date: Fri, 16 Oct 2026 17:22:47 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: peterz@infradead.org, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	christian.loehle@arm.com, elif.topuz@arm.com, linux-kernel@vger.kernel.org, 
	mingo@kernel.org, sh@gentwo.org
Subject: Re: [PATCH v3] sched/eevdf: Fix vprot across reweighting
Message-ID: <atIxeVCdZufhlnYZ@scheduler.schedules>
References: <20261016084604.17999-1-kayracizmeci@gmail.com>
 <CAKfTPtBYSdrLe09hp3R0V1AgV_FY65mGaLxHUdLVhpZqU6KpKw@mail.gmail.com>
 <atHwIzHeWaw1kXXm@scheduler.schedules>
 <atH8BI9jCf2gqjTb@vingu-cube>
 <atH-Rf-yL7ewRTgD@scheduler.schedules>
 <CAKfTPtBW2RymeCLdRr2OraqX=e0RFzM3fuoTP65oG=5x_5opVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKfTPtBW2RymeCLdRr2OraqX=e0RFzM3fuoTP65oG=5x_5opVw@mail.gmail.com>

On Fri, Oct 16, 2026 at 04:06:47PM +0200, Vincent Guittot wrote:
> On Fri, 16 Oct 2026 at 12:51, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
> >
> > On Fri, Oct 16, 2026 at 12:27:16PM +0200, Vincent Guittot wrote:
> > > Le vendredi 16 oct. 2026 à 12:45:45 (+0300), Kayra Cizmeci a écrit :
> >
> >
> > > > >  se != curr so why is this needed?
> > > >
> > > > sched_change_begin() sets .running as task_current_donor(), then if
> > > > .running is true calls put_prev_task(). put_prev_task_fair() sets
> > > > cfs_rq->curr to NULL. While the task still is the donor. Then we enter
> > > > sched_change_end(), we call enqueue_task() with cfs_rq->curr == NULL but
> > > > the donor is still p. There is set_next_task() call afterwards, but it
> > > > does not sets protection since its called with SNT_NORMAL.
> > >
> > > okay, but we don't want to spread this all over the code.
> > > reweight_eevdf/scale_entity is  doing this already.
> > >
> > > The below should do the stuff while keeping the computation in reweight_eevdf:
> > >
> > > ---
> > >  kernel/sched/fair.c | 26 ++++++++++++++++++--------
> > >  1 file changed, 18 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > index 0feec172fd37..c212c6aa9691 100644
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -4863,10 +4863,11 @@ rescale_entity(struct sched_entity *se, unsigned long weight, bool rel_vprot)
> > >  }
> > >
> > >  static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
> > > -                        unsigned long weight, bool on_rq)
> > > +                        unsigned long weight, bool update_vprot)
> > >  {
> > >       bool curr = cfs_rq->curr == se;
> > >       bool rel_vprot = false;
> > > +     bool on_rq = se->on_rq;
> > >       u64 avruntime = 0;
> > >
> > >       if (se->h_load.weight == weight)
> > > @@ -4878,22 +4879,25 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
> > >               se->deadline -= avruntime;
> > >               se->rel_deadline = 1;
> > >               if (curr && protect_slice(se)) {
> > > -                     se->vprot -= avruntime;
> > >                       rel_vprot = true;
> > >               }
> > >
> > >               cfs_rq->h_nr_queued--;
> > >               if (!curr)
> > >                       __dequeue_entity(cfs_rq, se);
> > > +     } else if (update_vprot) {
> > > +             avruntime = se->vruntime;
> > > +             rel_vprot = true;
> > >       }
> > >
> > > +     if (rel_vprot)
> > > +             se->vprot -= avruntime;
> > > +
> > >       rescale_entity(se, weight, rel_vprot);
> > >
> > >       update_load_set(&se->h_load, weight);
> > >
> > >       if (on_rq) {
> > > -             if (rel_vprot)
> > > -                     se->vprot += avruntime;
> > >               se->deadline += avruntime;
> > >               se->rel_deadline = 0;
> > >               se->vruntime = avruntime - se->vlag;
> > > @@ -4902,6 +4906,12 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
> > >                       __enqueue_entity(cfs_rq, se);
> > >               cfs_rq->h_nr_queued++;
> > >       }
> > > +
> > > +     if (rel_vprot)
> > > +             se->vprot += avruntime;
> > > +     else if (curr || update_vprot)
> > > +             se->vprot = se->vruntime;
> > > +
> > >  }
> > >
> > >  static void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
> > > @@ -4965,7 +4975,7 @@ static void reweight_task_fair(struct rq *rq, struct task_struct *p,
> > >       for_each_sched_entity(se)
> > >               weight = __calc_prop_weight(cfs_rq_of(se), se, weight);
> > >
> > > -     reweight_eevdf(&rq->cfs, &p->se, weight, p->se.on_rq);
> > > +     reweight_eevdf(&rq->cfs, &p->se, weight, false);
> > >  }
> > >
> > >  static inline int throttled_hierarchy(struct cfs_rq *cfs_rq);
> > > @@ -8200,7 +8210,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
> > >       weight = enqueue_hierarchy(p, flags);
> > >
> > >       if (!curr) {
> > > -             reweight_eevdf(cfs_rq, se, weight, false);
> > > +             reweight_eevdf(cfs_rq, se, weight, task_current_donor(rq, p));
> > >               place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
> > >               __enqueue_entity(cfs_rq, se);
> > >       }
> >
> > On the old code on_rq was always false. But because enqueue_hierarchy(),
> > se->on_rq is always true. So this just goes to the other path in
> > reweight_eevdf().
> 
> I changed the interface and the last arg is no more on_rq but force
> the update of vprot
> 
> >
> > Also, vruntime can move in place_entity() too.
> 
> But still, this is horrible...

Yeah. There is really no clean way of fixing vprot in all the ways.
Just a cleaner way than the other.

> 
> Also, after more thinking, I don't think trying to keep vprot correct
> in all cases is worth the effort, nor is it achievable without cost.
> When one changes the prio and/or the slice of the running task, that
> task might no longer be the best one to pick anyway. We should just do
> our best effort like other places where we only decrease or cancel
> protection to ensure it will not have an extended protection slice.

So something like below for !curr path?

	if (!curr) {
		reweight_eevdf(cfs_rq, se, weight, false);
		place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
		if (task_current_donor(rq, p))
			cancel_protect_slice(se);
		__enqueue_entity(cfs_rq, se);
	}

Does this work for you? And keeping the reweight_eevdf() part as is?
BTW, I didn't typed a comment right now, so if you say 'yes' I'll add a comment
above how even task_current_donor() can return true on the !curr path.

Thanks!

Kayra


> 
> >
> > Thanks!
> > Kayra
