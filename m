Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597942;
	b=xwrMSUiybjVMBXdo0lnGncDWgO3iPsFVNDuG5o+nOQEJfZATLyuYHqvRZ1zL2LHs/xvZ
	 8Dz9xTjZcVlSZvUbteDYDNZ0RyEBglhNUzWgrjxuT1kW1bXfnYCn8xtD1Iidr5Ebx+fyE
	 6lnGumw3xnghaTZZvCdRH5qOw8fHRt0fnl6yWhppysvwV5/CAdfOBXKmtud9vFeMX1kb6
	 +z9f4sig994Km58Fcn9zun7nu/tEfRg88LSMEE8k+TEffhY22r8NhTM4HXqKX3Dgsxc6T
	 /dsKZTka9mbbjzHrkqU8N0DM4rOvyCPbFrQZ6mrI3ERl/mB9WwsCPVqvdHk4QHGoepA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597942;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=g4IV65xk2PCFknE+tOMIYI9zTntE9btUqB/65S2h0cI=;
	b=WvvjJjKjWhW28+v8RPNwRtoLmn2pMz4HlHK89bmdyq7N8vkBE6UnPVCgjSTuARbKv6/Z
	 C5h9BvLKuun2FUMITvvlAYoRoOYsgc3pfhudARc6vMjQrl9PWV78gmAwaqT9x+mQxqfQh
	 VosYwXpRs/4eMqcuuJXqbmB3rW4kLEQVs0tt9JFBwm2UJFyoLZIPKAvDmZ1cPiHMJn2VB
	 aWLJftvLmWkAbp+gYAZ7rbxgioHDORV+27KUYvR5ifHZYVF/z79hgm6JHKatvsp+R4IJr
	 iRUv1n5v/LLFnkOMo0dlU9tkWpIkMz6v4ISwp2bH4xmT9DVNZlnEmF6prGgxw9/28fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=foG06i5p;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACED0606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACED0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=foG06i5p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g4IV65xk2PCFknE+tOMIYI9zTntE9btUqB/65S2h0cI=; b=foG06i5pm0wHPbVtiS11WUmtqP
	+zmgUnLHFW7f1LOFIH6mqc/tDHdYk5DHf5NPtwVRCBa89Y/31LEgehe4WsULMC3j3gQYwqoKgGS/0
	PRTv63C+A1/RNgOSnPtzIBKPHVxcHYmBIAd9cwzvN1W7J5Ybxcx67MqufuO3dDKV/RFHoN8fStHHR
	WC5BOiydjnOdE8OXZUV565IcWom0f9FPs7jbPbjMLmGVlq0GVAFc4SWnxz4c8QBxDjzlF1Xrs/5Ol
	Y5BWWKbsGlykV0WnkFdR1KeSnN+9wjOSQ0i94jRRQJnyaKrHSLq9uyxPL14SK7dKugk61lafjo+Q7
	xSQgPcNQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJYbr-0000000AJWb-2fCX;
	Wed, 21 Oct 2026 15:52:11 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2D6383007A4; Wed, 21 Oct 2026 17:52:11 +0200 (CEST)
Date: Wed, 21 Oct 2026 17:52:11 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com, tj@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] sched/fair: Extend for_each_sched_entity() with a
 back-link
Message-ID: <20261021155211.GV88198@noisy.programming.kicks-ass.net>
References: <20260929084923.092062266@infradead.org>
 <20260929085320.209298048@infradead.org>
 <CAKfTPtCgAjDXgRVBPUSKi4gq1pPN6b7dcP2myMhoOQ9Tyj7_nw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtCgAjDXgRVBPUSKi4gq1pPN6b7dcP2myMhoOQ9Tyj7_nw@mail.gmail.com>

On Tue, Oct 13, 2026 at 06:54:39PM +0200, Vincent Guittot wrote:
> On Tue, 29 Sept 2026 at 10:55, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Leave a trail of bread crumbs, such that we can find our way back down the
> > hierarchy. No actual users yet, but split out because its a bit tricky.
> >
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> 
> Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
> 
> > ---
> >  kernel/sched/fair.c  |   14 +++++++++++---
> >  kernel/sched/sched.h |    1 +
> >  2 files changed, 12 insertions(+), 3 deletions(-)
> >
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -318,8 +318,13 @@ const struct sched_class fair_sched_clas
> >  #ifdef CONFIG_FAIR_GROUP_SCHED
> >
> >  /* Walk up scheduling entities hierarchy */
> > -#define for_each_sched_entity(se, cfs_rq)                              \
> > -       for (; (se) && ((cfs_rq) = cfs_rq_of(se)); (se) = (se)->parent)
> > +#define for_each_sched_entity(se, cfs_rq)                                      \
> > +       for (struct sched_entity *_BL = NULL;                                   \
> > +            (se) && ((cfs_rq) = cfs_rq_of(se), (cfs_rq)->backlink = _BL, true);\
> > +            (se) = (se)->parent, _BL = (se))
> > +
> > +#define for_each_sched_entity_bl(se, cfs_rq) \
> > +       for (; ((se) = (cfs_rq)->backlink); (cfs_rq) = group_cfs_rq(se))
> >
> >  static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
> >  {
> > @@ -456,6 +461,9 @@ static int se_is_idle(struct sched_entit
> >  #define for_each_sched_entity(se, cfs_rq) \
> >         for (; (se) && ((cfs_rq) = cfs_rq_of(se)); (se) = NULL)
> >
> > +#define for_each_sched_entity_bl(se, cfs_rq) \
> > +       for (; ((se) = NULL);)
> > +
> >  static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
> >  {
> >         return true;
> > @@ -15233,7 +15241,7 @@ static inline void task_tick_core(struct
> >  /*
> >   * se_fi_update - Update the cfs_rq->zero_vruntime_fi in a CFS hierarchy if needed.
> >   */
> > -static void se_fi_update(const struct sched_entity *se, unsigned int fi_seq,
> > +static void se_fi_update(struct sched_entity *se, unsigned int fi_seq,
> 
> Not sure this should be part of this patch

My build scripts argued it should be. It breaks with the fancy new
for_each_sched_entity().
