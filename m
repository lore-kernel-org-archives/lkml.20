Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B442475D0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171059; cv=pass; b=rBU0ov46KnX4GHFe5JJR7lOrmrK1vUo+6MPh0MyDViU55CzHgzFbewl1/ZWEUvH4hdniGkVZVlUw3KA9tXMtHX57RDNiibHpIwl9wsd5YpTsLMwK5QVUiKq0PuFmo9WdD6h272CujcReRoIURODgoDeIWNgy4Zrl0A0Orj5e2p0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171059; c=relaxed/simple;
	bh=dTNZAD5IFIGBFE9iku1ePIwLdy7STpXIDpi1wz4mW+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TS6l86RgSH8pAMKvMZC2sARCGsLoQ8jQW0RJ/jX9FTuG7gbg9O6QGQ7TeDpl6Gr3e7MW7w6EuFqXVMwvqr1oNoIeefDDCr4t2aDGtiK80xrBrRhaw3hW1yyP8EEZxSKczjXIaeeHJ0K4nYgjNnvq4B85yUY+j9UljdEvvnIHyrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v3/yyL1c; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v3/yyL1c"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso4214070a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:10:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788171055; cv=none;
        d=google.com; s=arc-20260327;
        b=szcGVfBFiu/uEsMq4QAulbqbGY3HH7loc5L9ySjqTlQtLz+i+QFvOeVl579IwBeSJD
         KBHWUOaACc0cg9Fyx6zAsgiqR64SYHvy9Sc5JDCDk4tT0fbDNtk00qkyAC9uPlOp+qwV
         38Fvf7v//LtiZZyNehgqI5w43/ezOTrlE5nmlk50JffSNKjVDcQ8nKDzD35fdLb0MM25
         crwK48JpyfFJavcCq9xu3UbEZzisH2gMOt8bBw4mOVA1NfPnUh0Dw0fihy/czlghQV1D
         Z4p6L8fwP3Pu9lm2SaKMX8Cx90X6O6Wlxf3D0920sf7OeD5I2v7QTs7fQb4APb6wDe0y
         38/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DVnDRzqtOlUaRSd8tGWD9M2/rJWjd4EpmR9GQ5OEre8=;
        fh=dhtDzyJRI7/Rb2p+Nk3ZDljUPU3jLqX5mwzaTGCl6Nc=;
        b=VjkS7yagkdcN7yIEcAR3WWRWTydLulcusb9AnxBLibxnlO8WdKlT7MaxjsFTmS9LaZ
         jgKqAGFLaW5ZA7XxF1a0HS/0bsWrqmM5cPrv9C8Z5aPzImyY4I749MDE4u+tNDQyG1kZ
         n+K8AErs5DRdKdMoKAtG5y9q2Cy4ocIVu0R5x4TGNWE0/BLXvM5T3uBJ+GBeiBBCjv52
         p7hKNKkNkQfYib/Dq1lbfzbcTXi5mAHvjNOk37D97NxHlXYo/CqgpAsi3u7FjaoFpyhh
         zYYOK3nvtsW2tRkkzWXHN4iug+TAbztUoBt/wWW7etmyxPOe61og8mlSmcV+t8BU5axH
         93BQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788171055; x=1788775855; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVnDRzqtOlUaRSd8tGWD9M2/rJWjd4EpmR9GQ5OEre8=;
        b=v3/yyL1cFVjPWekHSmN0KXM9uOiiNU5c/TxVXXH0LQxRPgwDvOMlTG8p1fzwCp7Hv6
         Vr28wsOZl26W3rlgFtf6nn9A7Eqr7nn8y87peqEl9kH2JOeM8rBRD5IsoWsoerOzuXbB
         ah0DpCEkCER0Qzu2rR/ABbbDBKPFd1zA4NcynNqPyp8KDhLMwLlIhitdgVe4/ZN3J5e9
         x2OvFji8XUup3zHWnBjr4kOUrFhh+m4zlzVBW7samKMpO9DinzbLj8WlyOAyWkxBNQ23
         eMK/mcBTxxi9FafH4BDZ+8QvUP7IqvS4D6YBNAVry5ko3lMmLGpD7jX3vv8GHArpuTj5
         A8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788171055; x=1788775855;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DVnDRzqtOlUaRSd8tGWD9M2/rJWjd4EpmR9GQ5OEre8=;
        b=JIQIY8LJdvkk0GsaG3JMSEQIYeGH5V62HuIKOPPnhQGlwzP7lHHz6zVQU71ogI3F5E
         dgiZTYGLtCOYgBlv61Dpu8T9b1m1lMbmYeqe99IVjnEGFTbPcGKf4Seb77Uf9RUxDmli
         TbPZRqJcd5eYBGetNtznSmw+Dwq45eNMNjV3UNU3rvPT+Dd+bwsbc2FBsSOpgj642TLp
         hL/QLj2jKRGvOWLesmrelAxoVrZwkTRsMzPWahxMlPJp811i9eCuQ3ypT6Gw1xXw438C
         bJjG2hYmJzfY5mAFFX+5c8D3M0MjW7KjStynGFN9dDnxsUhxWiZWcW/V8jvfxRc+dZcz
         fX7g==
X-Forwarded-Encrypted: i=1; AKwUvBysj9ygyCWaEiqik4FF1oUD38fNS7Jx10aq02swQIgpHZYjwrXjGAfnFyqV7vaEVGB//fv8gGlGikImh/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lEC/RatNwDOkO5kbosoQvdutlZg+4ed3FLTRL5w3qjhfcnWOFr
	I61h9w9w6V2izOUbuqWyuLqlPej2O+hoAXhBOp4qAVrF/RP+ZGiOgCYgZ/3GJUPtbT7Gyd1ddkq
	gECRBKbgur9TbqmubXY8QR1EbRMwOaxH3yAARELyYLQ==
X-Gm-Gg: AYBFou3lIqszlUMI8xGyfnU5URk+iKIFfHklQCmQc0PPs5F0EaWuyTJKPKxKxpKJW6R
	fHA6jSKwZ8JrYVLSrA2ChiJ0SURpHCqBwB+gd4jkE86KmbfgesNvl1JfTK9gbVa0Lea/k6QYF8I
	lFmPxK6kvz53dO/fDVuD+MstcFBK33b2VxJZ2hnmCBjYWicfM+ozHenbubTbS0FH1mZP12TaRtc
	eQlN8pbuPRw5S3A9k/wucYiY3wxUjGu/E3nLs5cSLec12tEk40vlXYlKrLl8e92rhJXJATc/cf7
	yBi0E3hnfIsj1Zy6eEKppO8o258tJnRpWNbK1n8ZVpP7Pw5freYfMd9aVYLni7btKt2HmjSEijz
	yKg==
X-Received: by 2002:a05:6402:27d0:b0:6a1:fec6:3307 with SMTP id
 4fb4d7f45d1cf-6a60d3855admr13524771a12.7.1788171054937; Mon, 31 Aug 2026
 03:10:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828074059.232353141@infradead.org> <20260828075558.660152190@infradead.org>
In-Reply-To: <20260828075558.660152190@infradead.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 31 Aug 2026 12:10:42 +0200
X-Gm-Features: AcwNN1XtNzVoHx1tMz-m5t_SWFYeuRCEPQ6owg6xZAbew-Lry0p5FfVFB7J1Xy8
Message-ID: <CAKfTPtBuCgKjj_kM8zwihp7o10vBB7c9rmBtsJ5mVt3YxjXV0g@mail.gmail.com>
Subject: Re: [PATCH 4/4] sched/fair: Rework/fix task_h_load()
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, tj@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 at 09:56, Peter Zijlstra <peterz@infradead.org> wrote:
>
> There are a number of issues with task_h_load():
>
>  - its hierarchy traversal is racy to the point of being broken; where
>    originally it was meant to be used under rq->lock, but lacking an assertion
>    for that fact, its use spread and violated this. The result is that the
>    back-link state is prone to races.
>
>  - it is rate-limited on jiffies, which is HZ, not the underlying PELT decay.
>
>  - since its update is tied to task_h_load() usage, the cfs_rq->h_load numbers are
>    not often 'up-to-date', rendering their output in sched/debug near useless.
>
> Rework the whole thing to keep a more up-to-date and less broken cfs_rq->h_load
> number.
>
> Move the back-link tracking into for_each_sched_entity(), such that any such
> loop sets up a path back. Use this to (optionally) re-compute cfs_rq->h_load on
> enqueue, dequeue, set_next and tick, all sites that hold rq->lock.
>
> This ensures that 'active' cgroups have reasonably up-to-date cfs_rq->h_load.
> Additionally, have __update_blocked_fair() update cfs_rq->h_load for all
> cgroups.
>
> Finally, replace the jiffy rate-limit with one that is tied to the PELT decay.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/sched/fair.c  |  108 ++++++++++++++++++++++++++++++++-------------------
>  kernel/sched/pelt.h  |    7 +++
>  kernel/sched/sched.h |    1
>  3 files changed, 76 insertions(+), 40 deletions(-)
>
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5541,6 +5541,44 @@ static inline bool skip_blocked_update(s
>         return true;
>  }
>
> +static inline void __update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
> +                                         struct sched_entity *se,
> +                                         struct cfs_rq *p_cfs_rq)
> +{
> +       unsigned long load = cfs_rq->avg.load_avg;
> +
> +       if (cfs_rq != &cfs_rq->rq->cfs) {

A comment explaining that the 2 belows are used for the case where
for_each_sched_entity has not been called to set backlink would be
helpful

I haven't run tests yet (I will during the week) but the rework looks good to me




> +               if (!se)
> +                       se = &container_of(cfs_rq, struct cfs_tg_state, cfs_rq)->se;
> +               if (!p_cfs_rq)
> +                       p_cfs_rq = cfs_rq_of(se);
> +
> +               load = p_cfs_rq->h_load;
> +               load = div64_ul(load * se->avg.load_avg,
> +                               p_cfs_rq->avg.load_avg + 1);
> +       }
> +
> +       WRITE_ONCE(cfs_rq->h_load, load);
> +}
> +
> +static inline bool update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
> +                                       struct sched_entity *se,
> +                                       struct cfs_rq *p_cfs_rq)
> +{
> +       /*
> +        * Mask out the segment bits, if the remaining bits match, then there
> +        * hasn't been a decay since the last time.
> +        */
> +       if ((cfs_rq->last_h_load_update & ~PELT_SEGMENT_MASK) ==
> +           (cfs_rq->avg.last_update_time & ~PELT_SEGMENT_MASK))
> +               return false;
> +
> +       __update_cfs_rq_h_load(cfs_rq, se, p_cfs_rq);
> +
> +       cfs_rq->last_h_load_update = cfs_rq->avg.last_update_time;
> +       return true;
> +}
> +
>  #else /* !CONFIG_FAIR_GROUP_SCHED: */
>
>  static inline void update_tg_load_avg(struct cfs_rq *cfs_rq) {}
> @@ -5554,6 +5592,10 @@ static inline int propagate_entity_load_
>
>  static inline void add_tg_cfs_propagate(struct cfs_rq *cfs_rq, long runnable_sum) {}
>
> +static inline bool update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
> +                                       struct sched_entity *se,
> +                                       struct cfs_rq *p_cfs_rq) { return false; }
> +
>  #endif /* !CONFIG_FAIR_GROUP_SCHED */
>
>  #ifdef CONFIG_NO_HZ_COMMON
> @@ -7966,6 +8008,9 @@ static unsigned long enqueue_hierarchy(s
>                 flags = ENQUEUE_WAKEUP;
>         }
>
> +       for_each_sched_entity_bl(se, cfs_rq)
> +               update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> +
>         return weight;
>  }
>
> @@ -8107,6 +8152,9 @@ static void dequeue_hierarchy(struct tas
>                 flags |= DEQUEUE_SLEEP;
>                 flags &= ~(DEQUEUE_DELAYED | DEQUEUE_SPECIAL);
>         }
> +
> +       for_each_sched_entity_bl(se, cfs_rq)
> +               update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
>  }
>
>  /*
> @@ -11288,51 +11336,23 @@ static bool __update_blocked_fair(struct
>                         *done = false;
>         }
>
> -       return decayed;
> -}
> -
> -/*
> - * Compute the hierarchical load factor for cfs_rq and all its ascendants.
> - * This needs to be done in a top-down fashion because the load of a child
> - * group is a fraction of its parents load.
> - */
> -static void update_cfs_rq_h_load(struct cfs_rq *cfs_rq)
> -{
> -       struct sched_entity *se = cfs_rq_se(cfs_rq);
> -       unsigned long now = jiffies;
> -       unsigned long load;
> -
> -       if (cfs_rq->last_h_load_update == now)
> -               return;
> -
> -       WRITE_ONCE(cfs_rq->h_load_next, NULL);
> -       for_each_sched_entity(se, cfs_rq) {
> -               WRITE_ONCE(cfs_rq->h_load_next, se);
> -               if (cfs_rq->last_h_load_update == now)
> -                       break;
> -       }
> -
> -       if (!se) {
> -               cfs_rq->h_load = cfs_rq_load_avg(cfs_rq);
> -               cfs_rq->last_h_load_update = now;
> -       }
> +       /*
> +        * The above (forward) leaf_cfs_rq_list traversal will have done
> +        * update_cfs_rq_load_avg() in a bottom-up fashion. Now iterate the
> +        * list backwards, such that we're ensured to have visited every
> +        * parent of the current group to update h_load in a top-down fashion.
> +        */
> +       list_for_each_entry_reverse(cfs_rq, &rq->leaf_cfs_rq_list, leaf_cfs_rq_list)
> +               update_cfs_rq_h_load(cfs_rq, NULL, NULL);
>
> -       while ((se = READ_ONCE(cfs_rq->h_load_next)) != NULL) {
> -               load = cfs_rq->h_load;
> -               load = div64_ul(load * se->avg.load_avg,
> -                               cfs_rq_load_avg(cfs_rq) + 1);
> -               cfs_rq = group_cfs_rq(se);
> -               cfs_rq->h_load = load;
> -               cfs_rq->last_h_load_update = now;
> -       }
> +       return decayed;
>  }
>
>  static unsigned long task_h_load(struct task_struct *p)
>  {
>         struct cfs_rq *cfs_rq = task_cfs_rq(p);
>
> -       update_cfs_rq_h_load(cfs_rq);
> -       return div64_ul(p->se.avg.load_avg * cfs_rq->h_load,
> +       return div64_ul(p->se.avg.load_avg * READ_ONCE(cfs_rq->h_load),
>                         cfs_rq_load_avg(cfs_rq) + 1);
>  }
>  #else /* !CONFIG_FAIR_GROUP_SCHED: */
> @@ -14949,7 +14969,7 @@ static inline void task_tick_core(struct
>  /*
>   * se_fi_update - Update the cfs_rq->zero_vruntime_fi in a CFS hierarchy if needed.
>   */
> -static void se_fi_update(const struct sched_entity *se, unsigned int fi_seq,
> +static void se_fi_update(struct sched_entity *se, unsigned int fi_seq,
>                          bool forceidle)
>  {
>         struct cfs_rq *cfs_rq;
> @@ -15039,6 +15059,11 @@ static void task_tick_fair(struct rq *rq
>
>                 se = &curr->se;
>                 reweight_eevdf(cfs_rq, se, weight, se->on_rq);
> +
> +               if (!hrtick) {
> +                       for_each_sched_entity_bl(se, cfs_rq)
> +                               update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> +               }
>         }
>
>         if (hrtick)
> @@ -15230,6 +15255,9 @@ static void set_next_task_fair(struct rq
>                         weight = __calc_prop_weight(cfs_rq, se, weight);
>         }
>
> +       for_each_sched_entity_bl(se, cfs_rq)
> +               update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> +
>         if (throttled)
>                 task_throttle_setup_work(p);
>
> @@ -15428,6 +15456,8 @@ static int __sched_group_set_shares(stru
>                         update_load_avg(cfs_rq, se, UPDATE_TG);
>                         update_cfs_group(se);
>                 }
> +               for_each_sched_entity_bl(se, cfs_rq)
> +                       update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
>                 rq_unlock_irqrestore(rq, &rf);
>         }
>
> --- a/kernel/sched/pelt.h
> +++ b/kernel/sched/pelt.h
> @@ -5,6 +5,13 @@
>
>  #include "sched-pelt.h"
>
> +/*
> + * Pelt uses apprixmate 'us' as ns/1024; and then uses time segments of 1024
> + * 'us'. As a result each segment is in fact '1<<20' ns.
> + */
> +#define PELT_SEGMENT_NS                (1<<20)
> +#define PELT_SEGMENT_MASK      (PELT_SEGMENT_NS-1)
> +
>  int __update_load_avg_blocked_se(u64 now, struct sched_entity *se);
>  int __update_load_avg_se(u64 now, struct cfs_rq *cfs_rq, struct sched_entity *se);
>  int __update_load_avg_cfs_rq(u64 now, struct cfs_rq *cfs_rq);
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -736,7 +736,6 @@ struct cfs_rq {
>          */
>         unsigned long           h_load;
>         u64                     last_h_load_update;
> -       struct sched_entity     *h_load_next;
>
>         struct rq               *rq;    /* CPU runqueue to which this cfs_rq is attached */
>
>
>
