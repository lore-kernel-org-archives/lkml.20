Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015945;
	b=GHUyupUFNMA3bw15Sk2Y6w5zTlyfCyMtp2wb+1yUfjBhD9tVgN4iPc+7TN0URxOW+7Ky
	 esRkEDqCbSIrfW31kpm7+mSUTMvAXIEJzv6Cotx3BCgADhCl///sUahHPgzWIiPgFdWy+
	 EFBmkVnFY4AzasCrarwRSZLqrx9BEKbyPs7kngkSmOAroaPyGuV04tATGZ1e/3rdjMy6R
	 GuP0kbN8aRGr+st/5GrkAw13znTCC8CfgqRi+ZRhgKwSugSIsSzuWhZj/+iyXRx4CaKel
	 f/nllSbFNvITUKmBsaeLNDAtXlrebM4Ru3TESJ+jELz/HYBmicvo8FGL206oDzWXpew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015945;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=jcmzyVS56plTnolr7BFPITXm6D45vl3POud3R3cFTW0=;
	b=SVy67LEozPn+tEkgMJ3ZelNjkItSgXRKC1l7LuouOZ4kGlXOJPc6Wzing8gAM/D0xc6P
	 aMLwRX65uMGAAUKCqeqbqXiaXqll+WSKlthF7wFTX1PEIgEd8MI3MVethjYEbEBEoRsX0
	 DTTqG4qDQJBI4EhydpztXkZVP/00MFblcU060XngYwTC9PuQSSEHizu/JUNwna/26a7H9
	 oDVG73Fc23x9gtDT5DWup1S2DxUHuVXyRvCB4jy8PUU3o9Cr024dmvsjz+NayS8n0xtXT
	 6EHAz8iBAQVovK4wR02yUbLUUBVxVIyZFdJGuh1QsqcuubbjCiNzj4nvp0Irfodm8Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bDJrbB7s;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D9E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05D9E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bDJrbB7s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jcmzyVS56plTnolr7BFPITXm6D45vl3POud3R3cFTW0=; b=bDJrbB7sW+Gg8KrJbrHe/8XzmC
	sTuTV9d+06lWd6ahyhpjxQZjMiPROe0foMOfh6lTGzWGM8hILV6E1+aH03prF1xP1XVxh2ymZyJg1
	AMgZ2VNzDFUZq+Slw/v6khpKTYoZ8rHjt7HCge6sVe6GsiW/m1g7SnrQWqeIG6p9SDxyrF3xszzdV
	OzZAD54wTl3B9WFSK07q84tFN312so5LzEkglm2pUI1RcYlu7jjxLVLEHLVY5+wGad3qkPq8jPYuK
	A86z2SKw1ShSVIMOLb7Cm/uK0Ut4ir9w+OhdTjxezpbfDpVQ2bbGk0viUEFLvvocsOFee+mdN8cT8
	Rpeu/Mpg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJLx-0000000Dmlo-16hy;
	Mon, 26 Oct 2026 11:59:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 85AE4300DB9; Mon, 26 Oct 2026 12:59:00 +0100 (CET)
Date: Mon, 26 Oct 2026 12:59:00 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Qais Yousef <qyousef@layalina.io>
Cc: Ingo Molnar <mingo@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org,
	Wei Wang <wvw@google.com>
Subject: Re: [PATCH v2] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
Message-ID: <20261026115900.GG2668200@noisy.programming.kicks-ass.net>
References: <20261025162612.360033-1-qyousef@layalina.io>
 <20261026101254.GA2668200@noisy.programming.kicks-ass.net>
 <9054450c-f85f-402a-a2ff-fa5f314f92c5@layalina.io>
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
In-Reply-To: <9054450c-f85f-402a-a2ff-fa5f314f92c5@layalina.io>

On Mon, Oct 26, 2026 at 11:24:31AM +0000, Qais Yousef wrote:
> On 10/26/26 10:12, Peter Zijlstra wrote:
> 
> > > +static inline bool __uclamp_is_imbalanced(struct rq *rq, enum uclamp_id clamp_id)
> > > +{
> > > +	struct uclamp_bucket *bucket = rq->uclamp[clamp_id].bucket;
> > > +	int bucket_id = UCLAMP_BUCKETS - 1;
> > > +
> > > +	/*
> > > +	 * On idle all bucket.tasks must be 0, or we have hit imbalance
> > > +	 * problem.
> > > +	 */
> > > +	for ( ; bucket_id >= 0; bucket_id--)
> > > +		if (bucket[bucket_id].tasks)
> > > +			return true;
> > > +
> > > +	return false;
> > > +}
> > > +
> > > +static inline bool uclamp_is_imbalanced(struct rq *rq)
> > > +{
> > > +	enum uclamp_id clamp_id;
> > > +
> > > +	for_each_clamp_id(clamp_id)
> > > +		if(__uclamp_is_imbalanced(rq, clamp_id))
> > > +			return true;
> > > +
> > > +	return false;
> > > +}
> > 
> > Anyway; I was thinking, since we have a hole in struct uclamp_rq; and
> > also uclamp_flags. Can we fold uclamp_flags into the hold, and also use
> > UCLAMP_FLAG_IDLE to detect if we need this bucket scan at all?
> 
> Actually maybe we can just check if the flag is not set then this means we
> have a corruption without scanning the buckets. I didn't like the scan, but
> seemed safer for a backport. Let me try that and update.
> 
> I can fold the uclamp_flags into buckets, I don't think this will grow and I
> do have a path to help us get rid off uclamp_rq (hopefully) in the future.
> 
> Okay to do this as a separate follow up patch? Since this will go to LTS, I
> think safer keep it minimalist and do the folding bit in a separate patch.

Sure; I just noticed these separate things while trying to re acquaint
myself with uclamp ;-)
