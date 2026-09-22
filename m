Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFA34DDB5F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081831; cv=pass; b=m/SwMTfBYeIbG2cYgw7l7L1pau19iJPslNIQCF2S/odaaIu7wBjgYreYFwyo0K0sXT9eca0rFZZ1fZ1FmGG1cbHfpBW+oLXFBObtDSEtPiazE3Tn0hKyDWhgBicft0pX+snty0Yt9Vp79WGxAefdkYhEsH32kZCQUMOMLQ48Bv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081831; c=relaxed/simple;
	bh=Hhd6LueUkgl2nXOIiriUKvsENO7Cda/AObZMpAYom4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYE13BcX06wK2EHRmG+5OSgysdqqI2NeaKIMrWfqCU4t61oVZb+k2kiHMTrJcnRNpBFqc9dsg9OB0AbxFvKDC1HtOSeQ8hUIB9/uDHgQdLIC45l6S6z21rM7sM810H+1i3iJDpoDgPaYFB3fKaKn1KwLhmip9y5WRanJb6YTr90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kXMSFoJL; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kXMSFoJL"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so756852266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790081828; cv=none;
        d=google.com; s=arc-20260327;
        b=YlWmLVoE2x8mXchT+sH0p/Pp1n8pTCHPBWW5EiTmXzfgGBrCh+VI0p3Y9fF3EJ0rds
         CcxvQy7QnNP7RA1jyz4s6EqF7seVwn7SFN/691R7NSjn0Y4FUD0aoxQxPz3u0pbLHHXB
         48LnjCJdNZ1GwWPMXLVa7/+qdPvKMa47GS+5gEPKmLAGt+iYut3QR9QHwRcRzm++9PAc
         PL4PwCKFzeGb9jO3hzj5N4TG+rATtIbhjmrjFfRBB4qBCpwQX3Wp92j1mAb9wT+RP9Ic
         Cewh9mtNLb+PWLfNh5bIL158HjWEXDdioPDMAavGgK4wc8L8NXm590t2+pQVBMSwnKQ1
         ef7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KoSD6wSoEm5LD8SW33yBKEv1Muv/7sX6Gf0U11rs4OY=;
        fh=MLCuuuUjuE28SvjLASXYcirAR/BK7EsxdwaGWwjnKzA=;
        b=gFoJMzVGV+vXPliqOX/q4GbM6u7JD4OpaZd9V4Zs5RDVVJAky6uzUBO6bidVyih/Rl
         QF9bKDf6AaJUNB2ZoC/2MKxu6Rje8kDXbGNIux/zAkYS1xJ79+f46ri8ElvGoNiK30pp
         rbsMa6xnv9TceC229hzr57YtE22OCktkxDrdjvvGes6kbAuWTo1GscUq5IkW/Gi1Mc/Z
         k/VaQdbufUtjc8DjVCCOXVLSbw4FTsHv1EURX1lyGn5HFKaVWITqRmuzRNR7tsLuaRmm
         WSO3WIK00SD8n9wyUaQlxYg3kJtmIK/jvZvsu8C5yf6y5PFMhlcfbhxYwLgLGwNO5KpZ
         w16g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790081828; x=1790686628; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KoSD6wSoEm5LD8SW33yBKEv1Muv/7sX6Gf0U11rs4OY=;
        b=kXMSFoJLyqe7HlAa3LxxgQEiWc3F/FG9MTkAIwyIw/3umuhj8/TLXinK2A9ntkp9h+
         QMKPgKDOoWhEASM1BIcC+hunhG5sONL16MmARizVW4w6TSDB4lyzVvxB5ndx4rI2PBu4
         DNKSRtFjz7w0O1GJ4Fu+4T++SkmZbPopMzeU+cMGpUXn/q+Wggk5yXS5CKoQCz35SI6r
         nJlge2kyj5pFdLp+4bcZP3KsH0aetULlIBTU6tZuHcdLpJK82Pyc1HeselZjtGW0B6oJ
         QyZ/10gC7IB2y/g8xWq9ChlnHerm4p1jclFtIxoWtvxX9PAJJY4eSN0m5lvasvUXD8hj
         d+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081828; x=1790686628;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KoSD6wSoEm5LD8SW33yBKEv1Muv/7sX6Gf0U11rs4OY=;
        b=wV3lqxhZEdFpK/+fd41oNWy42dfIgeg8sWK8uXves8k+Kor9sR847kW9NuN6hR3XeE
         fMQDNnVkK35dfoahPBoM1nRXkJwRZ4F8P6C8XMNJ35SJ5SbNWMPOHEfNkFCjM5qciOcu
         mJ4RncxGuJ9/nuxriKR1TM6Hw2zSo5iNcSB9Wy1xHRM2fWj0tkMbznSXyQ13zLRiIHYb
         ZiXVUNk0uRbqGqE1iJnWZfOL5XSpuF+ZSey9kCHMJJbSADb03VOqriT/BfJ0lqpVz583
         WWfnXIHHmsWv/S0+afOGn6UA6uuPyBSPD/+R7XODyQg4yUEYviRj62vVH/hAW/ztnJbI
         I3Uw==
X-Forwarded-Encrypted: i=1; AKwUvBzWEjbtUaEUvH04e75kr6ghGe7rw2fgOs8E4B24oZS90cyXoR+8f6xnySQmdZrqdJ8RSzCzOO3Q7cpiTN4=@vger.kernel.org
X-Gm-Message-State: AFuF++ntux04qA2DJVsODGl5g137BjTfz/EcP/ZqIPiT8DXk/I0AO2Wj
	RPQePNVsSNbyCz/5f7Egs4ey0k/uLk/tgvUkRMFa6JGcVoBoxZLTqQgcQuDfktVz9B6+Y8INTWH
	CKWfzoOmCQmT3GuQ/+ai3m9QIcQuRP9DtJZyxurNYnA==
X-Gm-Gg: AYBFou1O8p7v7FRegX8tn3HCHf9CqPwbIUo1x1jzstwU++Fi87E66seekGndXCRneGL
	rlAgJ0NhGT2mKMz+5putgByJqmnInxN239p3bei6qKfFjHMu9AUoqZVXfAVxaVCKu5Db9DakPoz
	tQN5bvsyCCxMxR2LksTX9ULym09hmvNONCMkVDn4NWOxF9qtr85b0YDrPfGJNt2uHfSCaX4BiqT
	b3CmZuctvZfu6iqQCHyaWcAlGYxcpEUcBTqDF5+5WVvFWMnluokhETkVmvNY0RNXkwBRt8sSgri
	mi9c1ceUqEJ5hG4hHyoSaiawnNSkNgOB1dEeP7gsfqNLbgrSBzlkwinw577wbBTR4xvkbNdTtFb
	4ZQACIVvrzEc6
X-Received: by 2002:a17:907:7245:b0:c29:6de8:d143 with SMTP id
 a640c23a62f3a-c2a159ae1d7mr1265292866b.19.1790081828137; Tue, 22 Sep 2026
 05:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
 <20260921152238.3804392-5-vincent.guittot@linaro.org> <20260922100233.GP776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260922100233.GP776954@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 22 Sep 2026 14:56:56 +0200
X-Gm-Features: AcwNN1WmWO3imhBTmuffJhecg19-vlEsNaAoP4Y0Gfiax-xm3HEuyDP-er6K-A8
Message-ID: <CAKfTPtA3332vNLwvxVuM1CwVG+-bMSdBiTmE1Kz8U2Wxg36kkw@mail.gmail.com>
Subject: Re: [PATCH 4/8] sched/eevdf: Decay positive lag of sleeping entities
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 12:02, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Sep 21, 2026 at 05:22:34PM +0200, Vincent Guittot wrote:
> > Similarly to delayed dequeue that enables an entity to decay its negative
> > lag while sleeping, a task should not keep a positive lag forever.
> >
> > The sleep duration and the weight of the entity is used to decay the
> > positive lag at wakeup.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  kernel/sched/fair.c | 33 +++++++++++++++++++++++++++++++--
> >  1 file changed, 31 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index e6eb9a4c03be..4230954d10d0 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -896,6 +896,32 @@ bool update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
> >       return avruntime - vlag != se->vruntime;
> >  }
> >
> > +static __always_inline
> > +void decay_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
> > +{
> > +     s64 vlag = se->vlag;
> > +     s64 delta_exec;
> > +
> > +     WARN_ON_ONCE(se->on_rq);
> > +
> > +     /* Negative lag implies delayed dequeue */
> > +     if (vlag <= 0)
> > +             return;
> > +
> > +     if (flags & ENQUEUE_MIGRATED)
> > +             return;
>
> Is not this a rather prevalent case?

Yes, but this means getting the clock from the prev rq with its lock
which is costly so I wanted to start simple

>
> > +
> > +     /* Compute the sleep time */
> > +     delta_exec = rq_clock_task(rq_of(cfs_rq)) - se->exec_start;
> > +     if (unlikely(delta_exec <= 0))
> > +             return;
>
> Urgh, are we going to try and bring back all that sleep time stuff
> again? ;-)
>
> > +
> > +     vlag -= calc_delta_fair(delta_exec, se);
>
> Should this not be 'W+w' at the very least?, ideally it would be the
> complete sum of all decaying weight rather than just 'w', but that might
> be a tad tricky.

I spent some time thinking about this. The right solution should be
the one you suggested in your next reply: keeping the sleeping tasks
"enqueued" in another tree and computing a zero decay vruntime.
However, I was afraid of the overhead of managing this new tree and
taking the lock of another rq to dequeue the task. Anything else in
between will be an approximation because W at enqueue doesn't reflect
what happened during the sleep period: The CPU could have been idle
the entire time, but several tasks wake up simultaneously so the 1st
enqueued will not see a W whereas the other one will.

>
> > +
> > +     /* vlag can't become negative while sleeping */
> > +     se->vlag = max(0, vlag);
> > +}
>
> Anyway, the basic observation is that were this thing runnable, it would
> have only a w/W share of runtime, not a w/w share.
>
> Using the full fraction of sleep time like this will make the decay too
> fast.
>
> And dealing with that MIGRATED case is somewhat important; in which case
> I suppose we can try and approximate by doing something like '(W1+W2)/2
> + w'.
>
>
