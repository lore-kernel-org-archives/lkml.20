Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B07F442364
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546141; cv=none; b=EMos6YXA1h0PxlZq8kZvCzcrHolbNVHHk7kcuYT5ZxvAGj5c0/Ua5WywxR/2LVo2GF64o4cRkClKyDwSWc9bqGAXeCNDN/1QD5atIqoA4G9RCcrpNwPio0mHkvJ2OFeSKWF50DNc4qUvPrG4LD9VcyPS2aw9ZMyGrzUNAcmwQ4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546141; c=relaxed/simple;
	bh=mTr6a0yN98WEsJT6OZ/50eyAi1IvWgIFfuzxF6sVRRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=op0E2FmKgItzqiZblDa8Tkij0i/wKkyMYgsqhW2Oe34agwZSvCkH5EANbL4x+V3c02KPT3p8dEzO2g04jHYxudlJxelDXhm4HH/oteoJCulxI+eqhpOgy5z8HWE+AWoZDLt4DMig8T11JU31kXQ8Nl9AOPYyWKNmmDDzJhIokB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=acWir8/Q; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="acWir8/Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LMsFbBV3uC1Fo4VkIJ59CnEr2NddK9fRYoF9xaSBLWE=; b=acWir8/QnRB0HgL3ZP2K0UOTpZ
	QWJUKyqOJZil+2HcgJ2IenOHZ1Om5lVH3KvWCAvY4EZ02iXo3y2NidJ25RvtT3TnQy10cbubb0fCQ
	GTlYzkEhURFMkm+Rh9joKGBktQBrVQ70MtRRhTPALIj9OQ2MpAhToOSPEAw6sgH+V5glMb1ipvW5R
	FTvmCJtvn5sdeI2szMo4kBBydMASGklwDG73Kgk3P7GJZxBt4Ep7Tfae1sOnLZQgq02qb4GZAOkQF
	EVo1pvcPhbfnor2zjfwYwK5tZ+X3yH6e/4Nnd8GZRpDzdTCrXhBzOSk18r+ZEmhz08eSNnR+wEZYh
	4wvgbjXA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6khB-00000003B6b-3JZa;
	Wed, 16 Sep 2026 08:08:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9CA7D3012C6; Wed, 16 Sep 2026 10:08:44 +0200 (CEST)
Date: Wed, 16 Sep 2026 10:08:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 3/9] locking/osq_lock: Set prev_cpu=0 instead of
 locked=1
Message-ID: <20260916080844.GE4121339@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <20260907084133.3696-4-david.laight.linux@gmail.com>
 <20260915131314.GB2009045@noisy.programming.kicks-ass.net>
 <20260915131510.GD4121620@noisy.programming.kicks-ass.net>
 <20260915145513.111c4a23@pumpkin>
 <20260915140152.GC4121339@noisy.programming.kicks-ass.net>
 <20260915184717.4735afbb@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915184717.4735afbb@pumpkin>

On Tue, Sep 15, 2026 at 06:47:17PM +0100, David Laight wrote:
> On Tue, 15 Sep 2026 16:01:52 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > On Tue, Sep 15, 2026 at 02:55:13PM +0100, David Laight wrote:
> > 
> > > > That comment *should* obviously have been here. Also, I would *much*
> > > > rather have this store at the top, next to node->next = NULL; That is
> > > > much saner.  
> > > 
> > > 
> > > Part of the original reason I started these patches was to remove
> > > the writes to the current cpu's 'node' in the fast path acquire.
> > > That completely saves reading the cache line.
> > > It also means the initial xchg need only have acquire semantics.  
> > 
> > That makes no sense... you *have* to write node->prev_cpu, and since you
> > get to have the line dirty for that, a few more stores to the same line
> > are 'free', no?
> 
> But you don't always have to do that write.
> If the lock isn't held then you only have to update osq_lock->tail
> to contain the current cpu number.
> The per-cpu data remains zero - the same as when unlocked (and initialised).

Then do all that in a separate patch.

This series as a whole is a giant trainwreck. The patches do too much
and say too little.
