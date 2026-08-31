Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705113F1047
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788172666; cv=none; b=tOT99rNVK3PXdjGqMkGbfNoaC9A64FilpRkfgnh0KYxGRAFmFFUNIed7q5Alsdvr4BeRmPrWStlptcUGwRwmtHF+Gnna13EheIRf77PeMVTjHlISdXPFUx/7rQPWg7Bhz5VX+cwOoH5B59I8aNlVUL17ltZxUMZbvDXQ4llp48w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788172666; c=relaxed/simple;
	bh=xwoZMqThT3P7niuDaK/hnlvzt1POH4p9gqRpUCGbdy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xk+DbmTqcxX6/AAkG1vufsRkGF0fpdPW0YhMtcUFmDRLWf0t+lbeBXrHf7IiGY3Jbv7uDb1FsUjiO4KY7zUQtlcEon49bgD+204dw35hYID2yGPVEQHzdfbJW+/l5Duzq7MlWf2XtHJdQ9gVPP4Hcyl5Iow0XvVz4+rJoQUDAEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rmJDocnh; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rmJDocnh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YrTFWwErrF+9qCXrPPfWKCi/6vNcm8IYCdEiJO488R8=; b=rmJDocnheSMNZq2xml/BmWPPCx
	VJnzphRdKQCNgB6VZfkCuzOYI5/YKxvakkgCKu1vu260gHkJ3+dxo0jNVOtUQBUJnpBDI25KtTF1w
	su1kQMC61D5fPXbf1Bh5G7kVuNOh17MltNi5wFqK1S5Th8pPGD7gqRer1K8UkWUZ4F1PMJLRLSEwZ
	XXKoftrS6pVNdJiDpB26xIzCLvjcz22dPM+4Sn1mIXpZj+urEoMCI7o4MNmdUV7zYSdNUYrJybsd/
	PnFlKoHZa+Z9HYgq7cZC7RKLdOTgCUJaxQrERHuXhtNcNmtaGF6g3cGx3WRf+55+yA06HVMnaG1kW
	d9S46tLA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0zOS-000000037Hp-1lOv;
	Mon, 31 Aug 2026 10:37:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DDE1E300CC0; Mon, 31 Aug 2026 12:37:35 +0200 (CEST)
Date: Mon, 31 Aug 2026 12:37:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com, tj@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] sched/fair: Rework/fix task_h_load()
Message-ID: <20260831103735.GW687043@noisy.programming.kicks-ass.net>
References: <20260828074059.232353141@infradead.org>
 <20260828075558.660152190@infradead.org>
 <CAKfTPtBuCgKjj_kM8zwihp7o10vBB7c9rmBtsJ5mVt3YxjXV0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtBuCgKjj_kM8zwihp7o10vBB7c9rmBtsJ5mVt3YxjXV0g@mail.gmail.com>

On Mon, Aug 31, 2026 at 12:10:42PM +0200, Vincent Guittot wrote:
> > +static inline void __update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
> > +                                         struct sched_entity *se,
> > +                                         struct cfs_rq *p_cfs_rq)
> > +{
> > +       unsigned long load = cfs_rq->avg.load_avg;
> > +
> > +       if (cfs_rq != &cfs_rq->rq->cfs) {
> 
> A comment explaining that the 2 belows are used for the case where
> for_each_sched_entity has not been called to set backlink would be
> helpful

Fair enough; something like so?

		/*
		 * These last two arguments can be NULL then used outside of
		 * the for_each_sched_entity() hierarchy iteration. Like in
		 * __update_blocked_fair() where leaf_cfs_rq_list is iterated
		 * instead.
		 */

> > +               if (!se)
> > +                       se = &container_of(cfs_rq, struct cfs_tg_state, cfs_rq)->se;
> > +               if (!p_cfs_rq)
> > +                       p_cfs_rq = cfs_rq_of(se);
> > +
> > +               load = p_cfs_rq->h_load;
> > +               load = div64_ul(load * se->avg.load_avg,
> > +                               p_cfs_rq->avg.load_avg + 1);
> > +       }
> > +
> > +       WRITE_ONCE(cfs_rq->h_load, load);
> > +}
> > +
> > +static inline bool update_cfs_rq_h_load(struct cfs_rq *cfs_rq,
> > +                                       struct sched_entity *se,
> > +                                       struct cfs_rq *p_cfs_rq)
> > +{
> > +       /*
> > +        * Mask out the segment bits, if the remaining bits match, then there
> > +        * hasn't been a decay since the last time.
> > +        */
> > +       if ((cfs_rq->last_h_load_update & ~PELT_SEGMENT_MASK) ==
> > +           (cfs_rq->avg.last_update_time & ~PELT_SEGMENT_MASK))
> > +               return false;
> > +
> > +       __update_cfs_rq_h_load(cfs_rq, se, p_cfs_rq);
> > +
> > +       cfs_rq->last_h_load_update = cfs_rq->avg.last_update_time;
> > +       return true;
> > +}
