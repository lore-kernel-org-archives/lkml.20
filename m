Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792600801;
	b=Wp6Fi2dQv+GuJ2KI8BESCcjWUU9ijyarcO1fS9k9sBzPqDLcm/FeF6cPwVFcTrvAxZpb
	 hTirhjblo6Jffd3dOMGmN4ABdNigfvpzwlKs+Cv2/kuM3aGLm2Lkv9VaTVLJLZKZxiDUU
	 0JGxlBs5Y+OXMxmSRuATsp6qm+mw7piQSBcze80qQx/J6xbhxW/ZnYZYmNHXMGDfwCbW4
	 jn5zwXUp8fhozXL/mhRL5toX/n/LJDAEYb9fUlb/Hok+uiPCCTcy/w++wdQh1DB7K0JwF
	 0aVR2Y0scwFNzQoVRBDAzA+KtjNsgagMVuNPlVFdExJye2SaYBzwR8f/gAFr0z+aN4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792600801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=22DG/2oK1rftCwMMBlQB5fzWQ6NUTEf7sYoZX4JEwXM=;
	b=bV903Xinxbh5+6rIdGHD4uu1+PIA2U3ROVIy04xlLT7j6BlCjFfjiy9HCNPUgAVy4bSA
	 fbLSTImkMaRUHIBsM1Bx1GsxFGGHZutts+f35vn39ZDNoeAgPu0LAUrqKLYzmN7aypDeS
	 DjDPRLf1cSIiT+dBqgCSsQFkBHzATjgkAJ7jJiIvYj+FoKibJy9Flxe0IH7ICUaKHWMEv
	 frakSrwKgqMD6E0kiScvA7lR4cc6eAtpkqM5M1SQ1zK9F1ECyFBd8S0YvYdmfB38AjiMk
	 PLCl37K5dZ9LLu2J9QgsrevIOWndiUfw8iF5T1BiHzgdXuvdIRgFULoBs2GNpb18siQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CsoOubbZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866FF606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 866FF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CsoOubbZ
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso1065240a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792600799; cv=none;
        d=google.com; s=arc-20260327;
        b=CC1bn9wdDHx04moSxqw+vGwpnmQq12oFsBO6OxQEG3ADhRMFvwFHVqo4NpWFv7/0bH
         xLFgJVVysRIr0gvJObp+vvf3ZCUV3pUMpcVwm9KtNKxOq3wNCrmcgruTO1zKhVjWKinF
         v6dFALUOECwe0xrGvhC3PPtrux2Jklzp6FZavr25vWrbqTJF4CQZfBNNbqCJzX09EONg
         HCnr0xJ7kiuA1WlwdMME3IkGRYzp4cA9xuGBo+ujZwSVPuvTEq+hDzw6Wh4weZ3PhDXH
         I2ZvTyp1OXfQ9w1WcGOL+WUY8gaO1GOw2wzDjlIiOscqX+1XCSRnVrS/pEo6INZFUrK7
         SB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=22DG/2oK1rftCwMMBlQB5fzWQ6NUTEf7sYoZX4JEwXM=;
        fh=8SL6fywiKgNzyZtZ68zIlZVSKdtFq+YXfuyBLTyj9Ns=;
        b=cj3H0IQG+BdZw6EJnwYLaSzIWulAMOxIJPF8tiu+fn3JLv2I8fsp68zhXQliLFq1Jc
         psXFHvyUBMYNQloMqeoAGZrzsS6PZOeGlhA0fS4qXz2f+JssZ0fi6IevXyagPl0FkGDj
         b+X3qfTVdtrkg5QdoakWzZKikWGHKKcl7+e1JThpHSyIhGebVwNQOT+pd5xpnfcVfmCc
         eh2m9X2Pp1sBqzHqO90Ei6pMBbPnvHwJe7tyLRCjVoNSKuiCJB4Yfntrhpo8JBXbxm89
         6SxoYfjymsa8yLSiaDcXvk+gM0XApVNrTX5PTmeUksbv9xYzCDzxVW8lk7HcUByyE/ch
         c7Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792600799; x=1793205599; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22DG/2oK1rftCwMMBlQB5fzWQ6NUTEf7sYoZX4JEwXM=;
        b=CsoOubbZiKADNm79AV9fKlVCr5RL+DrC0Mwl3NDr1ma+UCe/sj+3tGr0kr+rABADdW
         zaCYkalZT6s9W0bjFxfhHkMMAV/0DrN+UvWsYA34I9fsH9Ttf2vprRhw8C0Z4vzzpAqu
         BjusoYN6Sa4AVugWQbfxeKUuAsvRlna94B9C8w5Bfsx99/6NPNBWGzn6hbM+3EV5M5Ua
         d0CuGNiE3LjcRnHXWR9Mql0atLbfdZRkU2qhjxe88LZ32Ammh+vBY5M26FyW2NYjq3an
         mXLoz0cD0zuU7WzVzXkClAXmmuZuqPTepoVpplzqXS3RWqEdBMgKLY8ZYtkKAj0zq3wY
         uxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792600799; x=1793205599;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=22DG/2oK1rftCwMMBlQB5fzWQ6NUTEf7sYoZX4JEwXM=;
        b=eyYOoSsaPkdn2kNHGi/8q3aAfJ1VJqpmws4yzRdAyoq3QCA4I9JbgddWLT/rpIpoUS
         4Zbj0QujQ3S7lVrvFNrmbV4O+dwHtfpo7am5+F4tNhKyWC5seyLmUScQlISXEMO0yHf9
         Uf5AS6nBh5O0Q/0pv+bX0gPQVbjF4bPFkAUuZ/2er6lQOSZwGkYT+Ogq5evZsIpm08IP
         NPyvjAaQEPbAi2Rj17uKLSb1FELVPnycP0xuIXeu0+62iuLas9ckCvPklzl7ek4ikXcf
         Vi3SXe8iHrpiQF67qEa4Sy2G+RNp0cPbrL6ENIljzZ8f1sB0UMb3lXFmTkPLhAAY4jIU
         JZew==
X-Forwarded-Encrypted: i=1; AKwUvBwwkeKMnfTy5zkhHkwuE0VQkJU0MeA1LSgb2utyEcjTDohnOv+rLKc2AdljnMMcRakUmEdtzc1YZzmXrVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaG0gmCYdBNvosgwCvkjIRuQUJUqQjBJjGdZXqjpK13UrZREZI
	XMhMIV3CXJpLFX5MOQ1n7y/R/fQvFlvxwj3d3Jv/0bDsTOtWy+XsD2e1HAu0ludDLZz76cCbSxA
	ge265ReEqE3yVul9vcRbd+2p8VXMHSbNgEErFhR/lNQ==
X-Gm-Gg: AYBFou3GOnMMrp/Kn1HCT2aLZXt7pzHZMhl6N2juI/v2zFEsk6z6nuTcVBi7/rObYbQ
	KgJZ0eyE+zXBYeitHGG2gBUX645mMXpbxoc5mi/FT4AIsa71IO4Fzj0tioURmwOH//4NB2Xwt0Z
	tqJ5GuIX0w8QE5NZb4X61gOQwxzgFalwFBa0aGJSk0aPtpABegr0kV178MMrcnNIeiqCGYNdtlF
	STnbXtjsaL3ZSbwf8kT6cxqfXtMeENtQJc+qNbv4QpkNDg2+hRTeGfUehoZJR4kCFf+O3bi8huu
	cmRtQp1+DveZXAyF1v/yy/5crU7+WdmtkM+5OnPWaJBX3jWT3UOYRLXUjywcBxLl8owz4IK6sOJ
	OLuBBdaZccs6gUAwxtBxHZEcFZuf4QHasB/L+4Vx9qIEnjiuB+rkT6cWPA0JPEa5J5c07SA==
X-Received: by 2002:a05:6402:3205:b0:6ac:773b:9c55 with SMTP id
 4fb4d7f45d1cf-6b408ee2e86mr2002587a12.40.1792600798599; Wed, 21 Oct 2026
 09:39:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929084923.092062266@infradead.org> <20260929085320.209298048@infradead.org>
 <CAKfTPtCgAjDXgRVBPUSKi4gq1pPN6b7dcP2myMhoOQ9Tyj7_nw@mail.gmail.com> <20261021155211.GV88198@noisy.programming.kicks-ass.net>
In-Reply-To: <20261021155211.GV88198@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 21 Oct 2026 18:39:47 +0200
X-Gm-Features: AclHuK-mLSAqOpsh23BPiObs1NYxxNn_aMeWBmGmKeltIfBc2Bwfo6mjz61qug8
Message-ID: <CAKfTPtB2qpM3XobFGRKLPoCNsrkOEZUe56zfdc7DC3tZobpftg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] sched/fair: Extend for_each_sched_entity() with a back-link
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, tj@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 at 17:52, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Oct 13, 2026 at 06:54:39PM +0200, Vincent Guittot wrote:
> > On Tue, 29 Sept 2026 at 10:55, Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > Leave a trail of bread crumbs, such that we can find our way back down the
> > > hierarchy. No actual users yet, but split out because its a bit tricky.
> > >
> > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> >
> > Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
> >
> > > ---
> > >  kernel/sched/fair.c  |   14 +++++++++++---
> > >  kernel/sched/sched.h |    1 +
> > >  2 files changed, 12 insertions(+), 3 deletions(-)
> > >
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -318,8 +318,13 @@ const struct sched_class fair_sched_clas
> > >  #ifdef CONFIG_FAIR_GROUP_SCHED
> > >
> > >  /* Walk up scheduling entities hierarchy */
> > > -#define for_each_sched_entity(se, cfs_rq)                              \
> > > -       for (; (se) && ((cfs_rq) = cfs_rq_of(se)); (se) = (se)->parent)
> > > +#define for_each_sched_entity(se, cfs_rq)                                      \
> > > +       for (struct sched_entity *_BL = NULL;                                   \
> > > +            (se) && ((cfs_rq) = cfs_rq_of(se), (cfs_rq)->backlink = _BL, true);\
> > > +            (se) = (se)->parent, _BL = (se))
> > > +
> > > +#define for_each_sched_entity_bl(se, cfs_rq) \
> > > +       for (; ((se) = (cfs_rq)->backlink); (cfs_rq) = group_cfs_rq(se))
> > >
> > >  static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
> > >  {
> > > @@ -456,6 +461,9 @@ static int se_is_idle(struct sched_entit
> > >  #define for_each_sched_entity(se, cfs_rq) \
> > >         for (; (se) && ((cfs_rq) = cfs_rq_of(se)); (se) = NULL)
> > >
> > > +#define for_each_sched_entity_bl(se, cfs_rq) \
> > > +       for (; ((se) = NULL);)
> > > +
> > >  static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
> > >  {
> > >         return true;
> > > @@ -15233,7 +15241,7 @@ static inline void task_tick_core(struct
> > >  /*
> > >   * se_fi_update - Update the cfs_rq->zero_vruntime_fi in a CFS hierarchy if needed.
> > >   */
> > > -static void se_fi_update(const struct sched_entity *se, unsigned int fi_seq,
> > > +static void se_fi_update(struct sched_entity *se, unsigned int fi_seq,
> >
> > Not sure this should be part of this patch
>
> My build scripts argued it should be. It breaks with the fancy new
> for_each_sched_entity().

Ok. That's interesting because nothing really change for se in
for_each_sched_entity()
