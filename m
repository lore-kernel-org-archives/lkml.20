Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9D84C754A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767550; cv=none; b=lGEK0EB8Uc9tJyE+1/EUxfpYf/uKCRtQmGwv4S7Ojz3o50weSb3MvdmyoP230GVnwZEjeExcCMtpxY0h/YwUiaZAKCliM28hG4Dmx5p1+oj/D6yw2lyUoW26M16XA8bcTsH1R8UcHCBqu5O//mIbUR/+4pcKj/Zfo3qzC9NYVLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767550; c=relaxed/simple;
	bh=MrchSg6q2RYnsSbokVzfvVBk2Jp1s3+SWYFsd0tmMxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amPNG437NmzzosY8WL84sTdix5nUdAEnNdllQaKVnEA/CSieLPP2T9l1W0xIv21x/DeqCjteWgCpGDVVQSDU3/FO0uYxrCgBxzcq9mj7BEknSKtWM9VifoqBc4okHTyuQugqi1Gz4R1gGVw7J6/BQPi/vYYadG5QEXZxbawztpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TFd7iAn/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TFd7iAn/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aMTajHRwE49ZG6nFcmEfQpHFqQgaj+HKi6tHsrpDEAo=; b=TFd7iAn/h8yoj/aJnCyUa+V/yH
	D7b0vyjtPUtJ3UXFgJtsuft47D5BJ0QdcwZWMx65+eQ0D14Rwk09plvOnyaKlVIbP+RBH9xkWb7v2
	W0fou2IZI7yR1LDB8mU/3vGhDbNgu+9Rr1XYBfAYQFLahBS+3R1nq9+rBXih7iN2D9bX6MH3t+Y27
	GLGArb9LWRCTTzOrkYr2auvcKJYq5hMhriklbD5iR1KvS3NKpbG26J+UUFKbMaSZleXKZ0c6ypDJa
	D6OpYQb+jI0OKS5+eHMssg54ZSw9CqZTdXN/tHXMaJ5q86wbFNaKphy0qzqDTOIg5+xVQOqsmt1K2
	9GrfthRQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsRQ-0000000CoiL-2mvE;
	Wed, 30 Sep 2026 11:25:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9CBC33006DD; Wed, 30 Sep 2026 13:25:39 +0200 (CEST)
Date: Wed, 30 Sep 2026 13:25:39 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: bsegall@google.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com,
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org,
	mgorman@suse.de, mingo@kernel.org, rostedt@goodmis.org,
	tj@kernel.org, vincent.guittot@linaro.org, vschneid@redhat.com
Subject: Re: [PATCH v2 4/4] sched/fair: Rework/fix task_h_load()
Message-ID: <20260930112539.GM88198@noisy.programming.kicks-ass.net>
References: <20260929085320.337703476@infradead.org>
 <20260930102044.208070-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930102044.208070-1-kayracizmeci@gmail.com>

On Wed, Sep 30, 2026 at 01:20:43PM +0300, Kayra Cizmeci wrote:
> Hi Peter,
> 
> I checked everything *again* to make sure;
> 
> > -	if (!se) {
> > -		cfs_rq->h_load = cfs_rq_load_avg(cfs_rq);
> > -		cfs_rq->last_h_load_update = now;
> > -	}
> > +	/*
> > +	 * The above (forward) leaf_cfs_rq_list traversal will have done
> > +	 * update_cfs_rq_load_avg() in a bottom-up fashion. Now iterate the
> > +	 * list backwards, such that we're ensured to have visited every
> > +	 * parent of the current group to update h_load in a top-down fashion.
> > +	 */
> > +	list_for_each_entry_reverse(cfs_rq, &rq->leaf_cfs_rq_list, leaf_cfs_rq_list)
> > +		update_cfs_rq_h_load(cfs_rq, NULL, NULL);
> 
> 
> >  static unsigned long task_h_load(struct task_struct *p)
> >  {
> >  	struct cfs_rq *cfs_rq = task_cfs_rq(p);
> >  
> > -	update_cfs_rq_h_load(cfs_rq);
> > -	return div64_ul(p->se.avg.load_avg * cfs_rq->h_load,
> > +	return div64_ul(p->se.avg.load_avg * READ_ONCE(cfs_rq->h_load),
> >  			cfs_rq_load_avg(cfs_rq) + 1);
> >  }
> 
> Is updating the root less often intentional? 
> Or am I missing something and we update the root more than the old code?

You're referring to the removal of update_cfs_rq_h_load() here? That was
the whole purpose of the patch. The callers of task_h_load() do not (in
general) hold rq->lock, and thus update_cfs_rq_h_load() is unserialized
and broken.

> Also, there's a typo:
> 
> > + * Pelt uses apprixmate 'us' as ns/1024; and then uses time segments of 1024
> > + * 'us'. As a result each segment is in fact '1<<20' ns.
> 
> 'apprixmate' :-).

Some day I might learn to type :-)
