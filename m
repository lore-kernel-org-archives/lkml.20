Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BBA3B777F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821389; cv=none; b=ktYKub6wgkKY8WvTKPnybvpNBSGKM4B0MlzRItij/bO5in1oOmLGlnEhLtYG3LwTj65UfqO1z5LJ44nZEWLDf8/mBQrcpamF21pWWPZJ//qZIp5RO1SLGdR1R/2gvfjSTc2py5R3h6mHw0fWw7s+ujZ+B4wWyI0RmHh2DkQLwm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821389; c=relaxed/simple;
	bh=b5f7/0ExVydm2771ouEViOKHKlSnA+TO76zB0WavBGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSLwpL2uu2+njGgWfScJVwwM9tAKgBcJS+bwl24WtvKm1mKMsTlaRC/bCDZlNh7XkFEhYYua5tWJO4CU05zHfDQAlaS60ng3m0UYJq2wcbrgUICZBR2DOdwn4EQBxZoEzX/RQpSv+bpk7sG1KgqbF2FY3fXTlyXb6CBQFizrR1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jIBxN46v; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jIBxN46v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/Fm+S6ZJhSS2B4R7yewYlSX7a+VQFVrrYT4TmSqXVDo=; b=jIBxN46vB3rka+CWBpOEayDf8p
	X0R/3eitlediJ1sNaFtjiyQlomkEOPzkv9GPOlFsgGXt0PuvVfsmUvcAwOcIezp3HXu54iUxqxwgt
	yESoYKMwKEDWqE6k1b0SXTDbJ5MbfQxEYEEcu0OkLwa9xMgize7gnfeKfDhtF8oJALPamDwQLeeEP
	AL40WoJohT0yVFGZP0kCwMTFIXfzHL5ABEqPfkb5wBIJERmaYkNOdyES7VO+HWY84IvoLp1eQMkf7
	6Ys11S3YjoWaIZsPAKWzD3CWncDsOMDdI839IrMJomAj6v5cD7AEfF5pboh3whCTMquVnWgIxfLwT
	IEO7gGrA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wzW0k-00000007Jht-1Jx1;
	Thu, 27 Aug 2026 09:03:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E35E830030F; Thu, 27 Aug 2026 11:03:00 +0200 (CEST)
Date: Thu, 27 Aug 2026 11:03:00 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: jim.cromie@gmail.com
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] lockdep: change 5 graph-db arrays to AofAs, fill
 from memblock pool
Message-ID: <20260827090300.GD4121339@noisy.programming.kicks-ass.net>
References: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
 <20260827064619.GB4121339@noisy.programming.kicks-ass.net>
 <CAJfuBxwOHiWsoQVLahW7c1+2f-=itRBLEi_4rbQGr+vtqLyBWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJfuBxwOHiWsoQVLahW7c1+2f-=itRBLEi_4rbQGr+vtqLyBWg@mail.gmail.com>

On Thu, Aug 27, 2026 at 02:54:12AM -0600, jim.cromie@gmail.com wrote:
> On Thu, Aug 27, 2026 at 12:46 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Wed, Aug 26, 2026 at 09:58:32PM -0600, Jim Cromie wrote:
> > > Lockdep cannot rely upon any other subsystem that uses locks, so since
> > > inception, its graph-db has been stored in static arrays, pinning ~10
> > > MB in .bss. This is a hardcoded compromise between embedded and
> > > enterprise hardware.
> > >
> > > However, if it acts early, lockdep can pre-allocate a pool of slabs
> > > from memblock_alloc(), enough for its lifetime of anticipated workloads.
> > > Then it can allocate them as needed to provide new segments/slabs to
> > > the graph-db.
> > >
> >
> > Why? I really don't understand why. Who cares about this bss stuff.
> 
> I thought embedded folk might value 10mb less bss ?
> Or have they stopped using lockdep already, for size or other reasons.

I've never heard complaints from embedded people that this is a problem.
Very few Linux capable machines can't spare 10mb.

This is about kernel development, if you need to develop a driver (only
case you might be tied to specific hardware) just get your developer a
board that has a spare 10mb of memory? Your developer is probably
served by having the most beefy board available anyway.

There was a case on sparc where the bss was a problem because the kernel
image had definite size constraints, but I don't think any 'modern'
systems suffer that particular problem.

> How about OOM, when kernel needs mem,
> or lockdep debug-off, when the slabs tied up in the graph-db could be returned

If you're running into OOM while doing kernel dev you're doing it wrong?
