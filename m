Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1470E3A6B70;
	Tue, 29 Sep 2026 07:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790667648; cv=none; b=J+ebBKEWwEvTXWEXj3UqoxLeZ8zE9q4YJoBMpgI+30QNSyR9fJW3pFmHKG+3+wGjX617Nhx/vMAeAApkEXalgpVLP/jGskkZ3kKApyiDNsnNsnQ2AaUs+/7AOGRCTSfwZNfnmhMZm5HNfGux3BTm2av8r/NZIL2swZhGIEordR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790667648; c=relaxed/simple;
	bh=YXqx610E00e7fcUhtcu6ud3StVP4tLskTRzZ8Qwhwnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbdg8dulO7MGPYdpSH42Wr/7LvwMhewDeklJATywJIm/dp0c90EBzPHpBF++aRa4OgYP4VHFAbaAqWQI/uCuXrLofR9TjGnGOVdOB1+pxG//IgUv0nxbtZouoXqMRuKE02YvpeJup2/lxeD3JcyZIKETv67vapygwstHb1cAxMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cS/ivYBO; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cS/ivYBO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IvwdLgBs9Hvw14RFZPBYMDJ6o9ITGxttFHp+DWDtiMs=; b=cS/ivYBOV0PqqYPLHlB1tZ+2RU
	e71Ss1jKhKy65OgYr+ewCsIVVLV8Wxq8+2ohxGrv86g9TXEzczd1kwbGhnr/R5LXTSM1aWc2uMfBR
	R22IRwb9yCRjhi96xL9do5wPap/Vj6Tb5sf81xdus4evQfIrfUHLU7XnDp1Q5ScXnaKkjCfLIiSfl
	wsx/WK+sNq6S8AkTUprfCeRwMyN+or4hSFODe7iBFBToT07Zpg7KYTsIH5Bu4B5BjHbe+vokbKgs9
	Jq5h5NVjokQcRzQnfzwRD0Uw6RRd0gOhwlsvWuSOXwaROKc1TRjLL6DMAW9RYQiQGN425kJRp9Yha
	jkNiqsrw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSS7-0000000BWbA-1ivW;
	Tue, 29 Sep 2026 07:40:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 797E7300446; Tue, 29 Sep 2026 09:40:38 +0200 (CEST)
Date: Tue, 29 Sep 2026 09:40:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Yiwei Lin <s921975628@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rbtree: update augmented data on the way down in
 rb_add_augmented_cached()
Message-ID: <20260929074038.GQ2009045@noisy.programming.kicks-ass.net>
References: <20260928213736.GA2947991@noisy.programming.kicks-ass.net>
 <20260929052446.159008-1-s921975628@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929052446.159008-1-s921975628@gmail.com>

On Tue, Sep 29, 2026 at 01:24:46PM +0800, Yiwei Lin wrote:
> On 2026/09/29 05:37, Peter Zijlstra wrote:
> > This builds and boot, so it must be perfect, right ;-)
> >
> > Assisted-by: Brain
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> 
> Right, thanks.
> 
> If you're fine with me carrying it, I can take it into v2 with and
> derive ->merge() from the same RB_AUG() list, so
> rb_add_augmented_cached() folds the new node into its ancestors in
> the one pass down instead of the ->propagate() round trip.
> 
> One thing I am aware here:  RB_AUG()'s cmp only
> expresses "pick one of the two", so min/max style aggregates; a sum or
> a count (subtree size, total weight) can't be written, where the old
> RBCOMPUTE could do anything.  Nobody in-tree needs that today, so it might
> be acceptable as is, but it's a regression in generality for the same
> price:
> 
>         RB_AUG(val, aug, fold)  /* _val = fold(_val, child->aug) */
> 
> keeps the register-local recompute exactly as it is, drops RB_MIN /
> RB_MAX in favour of the existing min()/max(), and a sum is just
> "a + b".  For sched that's min, max and a wrapping-safe min for
> min_vruntime. Do you think this can be accepted as is, or should I try
> to make it more general?

The fold() thing is indeed an excellent suggestion. Make it so ;-)

Thanks!
