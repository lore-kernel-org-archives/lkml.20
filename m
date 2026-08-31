Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3AB3E6DCA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177989; cv=pass; b=UvjvDEJ1d0sio6wpQ21G7+hAmOixllPXUOr9UnjfrO4J4dc+yQ9uVxaT+FwfV0OhJab1LPG17OC4fdpKQVMfSZfO8uE9ylMdaYXV3JwORLdbKzfEAPOqG4tmjVLjQUQzoCth4USBMVjS3xFdBQoiopS1+OLdFMq8bmg7QRlCqNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177989; c=relaxed/simple;
	bh=8Ci2TnIe12ClM/HFck+k7rYIEAGDlB4Svju+mcOPC0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UjZG6pjWLOlws7rXVsEX1dfMfCUu9hA1s4/FcmmuHJXl5mrKoJQY0eJ2XyE6G3OXfAVu7ijgfqcorOVrHdL+g/G2Fi2o7UXpr5RmwKlh+6G6TcnDzuFBAc4bkG0XLFb8PTvtMTrHbjj4kwyqNK4Myk1JPinYkwYlFmNh9/eUht0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xtuWLoTF; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xtuWLoTF"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a6143cca69so4998038a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788177986; cv=none;
        d=google.com; s=arc-20260327;
        b=VOdlho5dtl84zX6kZnT/db8NXFmgX3zyt1wPvF9PNBfVhUZ53Q5xxwzC6QLPG/Iebh
         ABcTkg/cCL1Hr4V4lZDew//6rIUSiW11Y6fsTuy9kIrmoxTcMNsEe2N0LcH/1a+95qCH
         aCNhrzKgPu2xRLOHSHJqYB1zvoeVcuXG15WIPaMFn0HUGAjdZFsHWWsRU2BuKwHGk8nL
         /1ymGEaFbAkzfm3mfsKgaAbZmnRjEJSJI6FmmkYBAwT2MkZGOm8y2wQNzr2AMF/FcojJ
         wlP3ydnYzmudhokrqSepMB8F+CctFlIqBU7BZVenGbJ2b9zcEwy42KXXAAVcWZxCZ4K5
         VXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jTQLiX0XX4aIk6JIOlGojWMK8Nu0CdNcxNRaA+qSq90=;
        fh=JQ/dPMyxdiVNY4pZFwCHn+c7Bz8bCBNl6gialOdmdkQ=;
        b=meQwpmLDcUx+XIHo2JRw+MoDzMhoW074uATGg3YmmtHW0+or/wnKd6Ve76ZTB7IWGd
         bNGqe5Q4cX1qsInyaS4OuXtdaEv2X0/brqr7c0l7W7i7qnCWu7RytFjhndEAFPmkAhBc
         EHHg8NpZdQLdtuLehWw3LF9yeixDQukAOypvkolFF6KQBRS0QT0j0aKwe+QsAfRyFf2F
         G05YXzV/+FR7X5/Ub3ECSO0DHpfFZejlmIHeWHia5AMjsjBXLIKZC5KXRmS0huoOQCWH
         O6dvdaxBT7nl/rNhVcyZhuiXH46ybqt8JMxQf7ljFJO8fCNbsF7VPHaL036EDgs36+Me
         gTmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788177986; x=1788782786; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jTQLiX0XX4aIk6JIOlGojWMK8Nu0CdNcxNRaA+qSq90=;
        b=xtuWLoTFw03IBm6baGboY5SWXZ7ytKHZzQVbri8tIKtGDOoiIc4wrxC4wNX3O1tGWc
         NQX8+WejBrTooGT+86H8djkjEbkYCw8kS2LxtYOhfyN5tcp1FhIXq9DbA5S4bJUqrzOv
         ZEw2dknqEL0Q0EFqEDExsmFJ3p+ImLADq2NGwHbdT29MgWfO+TrcSsSiEPK9IPoE1Mdy
         9AJsXx4YdcClGhdpc034m2vpTYLCU/Q+4wA7NxmmyU3Hjr8JJMEZTuMpnhrfsipMt//b
         kDyq1H9E+UkoaMeDMoxcWFibl/23j4BpJch+Z2EtG4yNVka4BlqscuDwJi08brdDENEy
         AoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788177986; x=1788782786;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jTQLiX0XX4aIk6JIOlGojWMK8Nu0CdNcxNRaA+qSq90=;
        b=VmqJMm53bChGiFqONtgsGka5C8sPzp1hNKpidj6i7r67LCfrgjm1xbkG89V+n4mahU
         EiVRKkeTce7aLnGpstqvylhyNFVQxQrgKcd56GovFkGI6y9lmEj5DBBTrEzg9MUli1E9
         3DN7Zg0GXi3dsfmhUwKUCc1Mk2sSKkEEMWzty3jV+bQS4WlJrXi7LrVRwuYd6Vn6dtgp
         YR2GzUOpU2xm2o8JPSJCJ17j+l0bkIBGgDQtNgZzxQdXuTfvckFMmwjLzb9CWQMOo9Sc
         gSaXAEJhgzNZOKZV62Pciu8FtYQroXjTiUykc11JC3zL67oFWdXDJAjiNGxJCH8uKEvd
         Y4Qw==
X-Forwarded-Encrypted: i=1; AKwUvByZwyG3ov6rFzbjU3Qe6VKv7MUd5rm95VipCs0Mlgg1jZ0vZ6qIPT+160r41H/CL/65sr9V7Fcepmrdj7U=@vger.kernel.org
X-Gm-Message-State: AFuF++nJxvm4NO711sY7gL7D+TCyjZafqST4VPppTIiTsiPaxf+wbZkW
	kxgtDuLCMNha3flK2F1tXxoIFnF3RJzDBgKLiUtw6ivPCd9swBVn91wsmomp3PkFm5CekTNIQ3I
	hPCkCUALXLGIwh0xAjgqeVX+Z36sZRabPB3NbhbUFDw==
X-Gm-Gg: AYBFou2FeOvcFlRCv8qZhwdg8n6ePaoRJV8O3Lo4SQ9CQ/qRzvC7jpF+xZoYc1H1m/b
	reOD/1g2wtV+zyDMxpVXu4lZkcRvx6qFoCWXD5F6D9R5vnqAyTERnmbn3CJCLk+pEv/woUufHDN
	utt8dPAsFnCcNz4w8jEW6rqBjF3TsU5dRSr8+sQcoyKAMkW5CbuFcqgGmMEeotiKRcbgfix+Aot
	De/eTqsLh3LXpjel4de4Qw9dWCLwxGFMfsJ3ZC+OO2yLs9r4WO6DxI27NNDGNIfqi3iby8Rgce4
	0d6uKS0a4bbT9MdRdO34PH0f1oWkwAYziBpq9BB9Po23Q8u5Ntbgmy4xo5MWujEkrJ6d1L5Znho
	qnQ==
X-Received: by 2002:a05:6402:24d5:b0:6a5:f814:2278 with SMTP id
 4fb4d7f45d1cf-6a60d306d1emr14077993a12.2.1788177986343; Mon, 31 Aug 2026
 05:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828074059.232353141@infradead.org> <20260828075558.660152190@infradead.org>
 <CAKfTPtBuCgKjj_kM8zwihp7o10vBB7c9rmBtsJ5mVt3YxjXV0g@mail.gmail.com> <20260831103735.GW687043@noisy.programming.kicks-ass.net>
In-Reply-To: <20260831103735.GW687043@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 31 Aug 2026 14:06:14 +0200
X-Gm-Features: AcwNN1U0ID67H2x1KvwtlE6p6Bi9eXWB7Rqfd42m5lGq8aMqvP-F5SaiCfiAjzc
Message-ID: <CAKfTPtB5mpA0yGCwhv0wwdBj9xYWB+k+QL=daAu=qNCcBQexvA@mail.gmail.com>
Subject: Re: [PATCH 4/4] sched/fair: Rework/fix task_h_load()
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, tj@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 12:37, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Aug 31, 2026 at 12:10:42PM +0200, Vincent Guittot wrote:
> > > +static inline void __update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
> > > +                                         struct sched_entity *se,
> > > +                                         struct cfs_rq *p_cfs_rq)
> > > +{
> > > +       unsigned long load = cfs_rq->avg.load_avg;
> > > +
> > > +       if (cfs_rq != &cfs_rq->rq->cfs) {
> >
> > A comment explaining that the 2 belows are used for the case where
> > for_each_sched_entity has not been called to set backlink would be
> > helpful
>
> Fair enough; something like so?

yes, looks good

>
>                 /*
>                  * These last two arguments can be NULL then used outside of
 s/then/when/ ?

>                  * the for_each_sched_entity() hierarchy iteration. Like in
>                  * __update_blocked_fair() where leaf_cfs_rq_list is iterated
>                  * instead.
>                  */
>
> > > +               if (!se)
> > > +                       se = &container_of(cfs_rq, struct cfs_tg_state, cfs_rq)->se;
> > > +               if (!p_cfs_rq)
> > > +                       p_cfs_rq = cfs_rq_of(se);
> > > +
> > > +               load = p_cfs_rq->h_load;
> > > +               load = div64_ul(load * se->avg.load_avg,
> > > +                               p_cfs_rq->avg.load_avg + 1);
> > > +       }
> > > +
> > > +       WRITE_ONCE(cfs_rq->h_load, load);
> > > +}
> > > +
> > > +static inline bool update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
> > > +                                       struct sched_entity *se,
> > > +                                       struct cfs_rq *p_cfs_rq)
> > > +{
> > > +       /*
> > > +        * Mask out the segment bits, if the remaining bits match, then there
> > > +        * hasn't been a decay since the last time.
> > > +        */
> > > +       if ((cfs_rq->last_h_load_update & ~PELT_SEGMENT_MASK) ==
> > > +           (cfs_rq->avg.last_update_time & ~PELT_SEGMENT_MASK))
> > > +               return false;
> > > +
> > > +       __update_cfs_rq_h_load(cfs_rq, se, p_cfs_rq);
> > > +
> > > +       cfs_rq->last_h_load_update = cfs_rq->avg.last_update_time;
> > > +       return true;
> > > +}
