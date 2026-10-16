Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735B2372B3C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146443; cv=none; b=rtn//IBG7IlFP103Ks9SplmwuhUYF1I09NlTGF9pKTw1BdHDArQ7EN6ruYobvxKceUj/ZROS8C4C9ku6Nx6QeYmRhzZkONDeil0zDlPZJ4hVrL/lEvPFP+0hnlpv+eP95bX7jBqKYN71mN99jBpMc7pqnsRRmQtAc8mtVR/hgKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146443; c=relaxed/simple;
	bh=pDysPp0g9qhxBahPOzQsK771XFZn8cES8bSjlfQUiF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaExztSPRTiyqfwHpJcY6LkXpb+2rIhfNIErvdg9XLGBrGr2RLPb+p+eTvHWhlq0/7AKDxUsmZ/PFSflcnygPWA2xRL2SJFVGBHJYJKwfpZLaThNs3R8pN7fRhCmw9j3gLY5/Dd2rj8h0XIFHAkoQsRXg9Qk5LNH2hWje0cgV5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kJsWQtHB; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kJsWQtHB"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1008382f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792146439; x=1792751239; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOqTIaF64cJ+3QhFpJzSvUwWgGj0vh0GmH/GomQY2go=;
        b=kJsWQtHBmCFLgCuI38Y7Xfq9wbiwyr9gZub1iosiDmgtfkS3ec7OZMLXKhp+7BtvAA
         qPjC+w1S7S+0JLG3u3hRL9vWXEcdV1TKUMNTJ3Pwg7kbLSz8XbEDEhHoQJB2s1+I5++P
         jemTzN/lPgfy1y1xu5SM5cqjYGUpmMPajle/PTeqfr7A1UnJzO5lIf9/DNzKRBMAX2Ag
         44e+5pqTKnpUVXUp+OE93PXNUx8hwZ398I3T9MAmYegsedQxwHDtifim00tvFTU9l3Jo
         OOmazldoN1vPbZofBtXj7JT52hevgsqtMGqlEOzzg3H+yRJ+QbMPIRUJuCSyJuaNPcGU
         TkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146439; x=1792751239;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wOqTIaF64cJ+3QhFpJzSvUwWgGj0vh0GmH/GomQY2go=;
        b=b4gPwIVsxAe0BIlBG8XbcBG2pNNVjDGsOLSwMQ8BxVF2Wo4HP/eehLFF9NdYWgJxiz
         ODAE8vKCoBZz6AmIWM2Wr51E6t5JZi52n8gCrmmK1yP0k9IDj2wED8PjMuSL60/uMQsw
         PxUq4MuX/hNtodB7A1FEay5N0obk27OM67+8Nc9zHqaovf8N1dhKwqdtlGRI/9pNpjuw
         3VcXtZUf4SiU8US9T//guuSwqeIXgtNS7/S1sOXpbAJ1R6H/1erPeY3XKNmP5gZXN+q5
         R4U9bRhq9NLLBxvi/168oTZH7uVwn6GDTlMLOsjCRR0rdmHphreBiDOVi+oQ0F8R2Om3
         9ikg==
X-Forwarded-Encrypted: i=1; AKwUvBwGwB2dSS0iOeCP+/9hgtUGCUyhQ+blJgOlzslDAN8dApdj0heIehUJXiEM2Kj6LDI8oR72hckJBubXjT4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWrWqjY9VE8Qaszu8145ggVbaUtSMhShTSZoiasUWqla/ve58B
	vji3H+q4SY3vZ+AN2slajN+WGRhFfQiZyaTHpgwJoABnWFqc2rnO/WPxPGz3U33N/34=
X-Gm-Gg: AYBFou10dW9Y360OEb3I8fENMcaIHDrnBJqDCrFACxK4y6Kj6cHg9zJM9i2Gglf7MTu
	c17IkMmFBrB/nz+0CcNh2sQbxMuvcq/Ud0jB748/j0ZZEq8I2gJ1TQULRJOv3oKXGK3dtLY9u6R
	Tx9eAYnQA9Z8u8JbhQocUxqvFe1zwdnSqTWrPTcque+kkYZYN/sCK4j7e7qRzB7rPNU4QU0nMS3
	zmGNdm8YA/p6gibILLGGqVC05ZMNxmXqVoRJhHIVXsekNWNnCuk/eyymY2p7D4nBbQJm8Qw6VYT
	5lqNuGaMS28Q/rZkHRyDDt5je90aHplxGzMXY7J14D6GPX3+MpvWfngDGoBSvAvIjNKV5wMnOZ8
	79BpvZNY/2Z5+wA9AHa69XIcz5mj10jjLa/bgXKWXtw9OlIH0B/EiSyIeSeuFJudsQnb+QaagGF
	EGjMg0yyR9U3blqIq1P/9MNvpD7Cdg6CfxAARyV2vym1dAVSOl7uFuLrdwpae6Vko7kC7a384+P
	fyaFZTrXw==
X-Received: by 2002:a05:600c:1c07:b0:4a1:b044:9ccd with SMTP id 5b1f17b1804b1-4a1b0449d00mr252581975e9.28.1792146438573;
        Fri, 16 Oct 2026 03:27:18 -0700 (PDT)
Received: from vingu-cube ([2a01:e0a:11f4:3020:a228:b900:fec6:8370])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf04ffe9sm24655015e9.0.2026.10.16.03.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:27:17 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:27:16 +0200
From: Vincent Guittot <vincent.guittot@linaro.org>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: peterz@infradead.org, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>, christian.loehle@arm.com,
	elif.topuz@arm.com, linux-kernel@vger.kernel.org, mingo@kernel.org,
	sh@gentwo.org
Subject: Re: [PATCH v3] sched/eevdf: Fix vprot across reweighting
Message-ID: <atH8BI9jCf2gqjTb@vingu-cube>
References: <20261016084604.17999-1-kayracizmeci@gmail.com>
 <CAKfTPtBYSdrLe09hp3R0V1AgV_FY65mGaLxHUdLVhpZqU6KpKw@mail.gmail.com>
 <atHwIzHeWaw1kXXm@scheduler.schedules>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atHwIzHeWaw1kXXm@scheduler.schedules>

Le vendredi 16 oct. 2026 à 12:45:45 (+0300), Kayra Cizmeci a écrit :
> On Fri, Oct 16, 2026 at 11:15:31AM +0200, Vincent Guittot wrote:
> > On Fri, 16 Oct 2026 at 10:46, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
> > >
> > > Currently in reweighting, while a tasks vruntime changes dead protection
> > > could go alive, or alive protection could decrease, increase and go dead.
> > > Fix it.
> > >
> > > Fixes: 80390ead2080 ("sched/fair: Separate se->vlag from se->vprot")
> > > Fixes: bcd74b2ffdd0 ("sched/fair: Only set slice protection at pick time")
> > > Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> > > ---
> > >
> > > Changes v2->v3:
> > > * Rebase and move the enqueue_task_fair() block to if (!curr) block.
> > >
> > >
> > > Not tested at all :-(. But I think
> > > This should'a cover the shced_change_begin() path same,
> > > since curr == NULL, so we always enter if (!curr) block.
> > >
> > >  kernel/sched/fair.c | 28 ++++++++++++++++++++++++----
> > >  1 file changed, 24 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > index 0feec172fd37..4593d0122d66 100644
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -4892,12 +4892,15 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
> > >         update_load_set(&se->h_load, weight);
> > >
> > >         if (on_rq) {
> > > -               if (rel_vprot)
> > > -                       se->vprot += avruntime;
> > >                 se->deadline += avruntime;
> > >                 se->rel_deadline = 0;
> > >                 se->vruntime = avruntime - se->vlag;
> > >
> > > +               if (rel_vprot)
> > > +                       se->vprot += avruntime;
> > > +               else if (curr)
> > > +                       se->vprot = se->vruntime;
> > > +
> > 
> > This part looks good
> 
> :-)
> > 
> > >                 if (!curr)
> > >                         __enqueue_entity(cfs_rq, se);
> > >                 cfs_rq->h_nr_queued++;
> > > @@ -8155,8 +8158,9 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
> > >         int task_new = !(flags & ENQUEUE_WAKEUP);
> > >         struct sched_entity *se = &p->se;
> > >         struct cfs_rq *cfs_rq = &rq->cfs;
> > > -       unsigned long weight;
> > > -       bool curr;
> > > +       unsigned long weight, old_weight;
> > > +       bool curr, live, running;
> > > +       s64 dist;
> > >
> > >         if (task_is_throttled(p) && enqueue_throttled_task(p))
> > >                 return;
> > > @@ -8200,8 +8204,24 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
> > >         weight = enqueue_hierarchy(p, flags);
> > >
> > >         if (!curr) {
> > > +               running = task_current_donor(rq, p);
> > > +               live = running && protect_slice(se);
> > 
> > IMO, "protected" is a better name than "live".
> 
> OK. Will rename it.
> 
> > 
> >  se != curr so why is this needed?
> 
> sched_change_begin() sets .running as task_current_donor(), then if
> .running is true calls put_prev_task(). put_prev_task_fair() sets
> cfs_rq->curr to NULL. While the task still is the donor. Then we enter
> sched_change_end(), we call enqueue_task() with cfs_rq->curr == NULL but
> the donor is still p. There is set_next_task() call afterwards, but it
> does not sets protection since its called with SNT_NORMAL.

okay, but we don't want to spread this all over the code.
reweight_eevdf/scale_entity is  doing this already.

The below should do the stuff while keeping the computation in reweight_eevdf:

---
 kernel/sched/fair.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0feec172fd37..c212c6aa9691 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4863,10 +4863,11 @@ rescale_entity(struct sched_entity *se, unsigned long weight, bool rel_vprot)
 }
 
 static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
-			   unsigned long weight, bool on_rq)
+			   unsigned long weight, bool update_vprot)
 {
 	bool curr = cfs_rq->curr == se;
 	bool rel_vprot = false;
+	bool on_rq = se->on_rq;
 	u64 avruntime = 0;
 
 	if (se->h_load.weight == weight)
@@ -4878,22 +4879,25 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
 		se->deadline -= avruntime;
 		se->rel_deadline = 1;
 		if (curr && protect_slice(se)) {
-			se->vprot -= avruntime;
 			rel_vprot = true;
 		}
 
 		cfs_rq->h_nr_queued--;
 		if (!curr)
 			__dequeue_entity(cfs_rq, se);
+	} else if (update_vprot) {
+		avruntime = se->vruntime;
+		rel_vprot = true;
 	}
 
+	if (rel_vprot)
+		se->vprot -= avruntime;
+
 	rescale_entity(se, weight, rel_vprot);
 
 	update_load_set(&se->h_load, weight);
 
 	if (on_rq) {
-		if (rel_vprot)
-			se->vprot += avruntime;
 		se->deadline += avruntime;
 		se->rel_deadline = 0;
 		se->vruntime = avruntime - se->vlag;
@@ -4902,6 +4906,12 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
 			__enqueue_entity(cfs_rq, se);
 		cfs_rq->h_nr_queued++;
 	}
+
+	if (rel_vprot)
+		se->vprot += avruntime;
+	else if (curr || update_vprot)
+		se->vprot = se->vruntime;
+
 }
 
 static void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
@@ -4965,7 +4975,7 @@ static void reweight_task_fair(struct rq *rq, struct task_struct *p,
 	for_each_sched_entity(se)
 		weight = __calc_prop_weight(cfs_rq_of(se), se, weight);
 
-	reweight_eevdf(&rq->cfs, &p->se, weight, p->se.on_rq);
+	reweight_eevdf(&rq->cfs, &p->se, weight, false);
 }
 
 static inline int throttled_hierarchy(struct cfs_rq *cfs_rq);
@@ -8200,7 +8210,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	weight = enqueue_hierarchy(p, flags);
 
 	if (!curr) {
-		reweight_eevdf(cfs_rq, se, weight, false);
+		reweight_eevdf(cfs_rq, se, weight, task_current_donor(rq, p));
 		place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
 		__enqueue_entity(cfs_rq, se);
 	}
@@ -15335,7 +15345,7 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
 		}
 
 		se = &curr->se;
-		reweight_eevdf(cfs_rq, se, weight, se->on_rq);
+		reweight_eevdf(cfs_rq, se, weight, false);
 	}
 
 	if (queued)
@@ -15542,7 +15552,7 @@ static void set_next_task_fair(struct rq *rq, struct task_struct *p, enum snt_e
 	cfs_rq->curr = se;
 
 	if (on_rq) {
-		reweight_eevdf(cfs_rq, se, weight, se->on_rq);
+		reweight_eevdf(cfs_rq, se, weight, false);
 		if (first)
 			set_protect_slice(cfs_rq, se);
 	}
-- 
2.53.0


> 
> > 
> > > +
> > > +               if (live) {
> > > +                       old_weight = se->h_load.weight;
> > > +                       dist = se->vprot - se->vruntime;
> > > +               }
> > >                 reweight_eevdf(cfs_rq, se, weight, false);
> > >                 place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
> > > +
> > > +               if (live) {
> > > +                       if (weight != old_weight)
> > > +                               dist = div64_long(dist * old_weight, weight);
> > > +                       se->vprot = se->vruntime + dist;
> > > +               } else if (running) {
> > > +                       cancel_protect_slice(se);
> > > +               }
> > > +
> > >                 __enqueue_entity(cfs_rq, se);
> > >         }
> > >
> > > --
> > > 2.53.0
> > >
> 
> Thanks for the review!
