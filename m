Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F1B3F8891
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149873; cv=none; b=jT6FrU3kee+V7ZfuDc5RAoQRxKaTX1eiEqXBdP5O8KyB28a/hPnPcZ7XPZ3oGbhT8Jpu8MDDDkJAI2XJ4Tu1OIEWzYMyEPzhhENeSe2lWkvlQL5wcZYQWyjJOQ1vcXfx8fBynIAgZDK6RwKhYZ+7psFDUUnDgZkWrnsfWUMNDmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149873; c=relaxed/simple;
	bh=hMb1p5SjizJv1Pn2T7WokEnTNRsl/yE6qIfLuxmYL7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lww8oex0tapMAdFDlPq+qdtzZHO7xcVhUhIdvXp00mhc40v8ODWABKfbiDOZfuEh6rUbRE8dLd6eCHyPWo1NvIER1Plpta4BKr8QctWktMH53BKWDxCL1NgdEBbhEyDEYqVc7pfado1czR9eil3YjUhLrMaA41klDGvNhF/vBRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OzORKFvm; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OzORKFvm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/75IMKTmMPk3zWz1E4t1cQdZ4q3jdQ8fR+xotEVzIBo=; b=OzORKFvmvwy2PNFOeiIdfbYiUS
	vEMVnw9b2Gcgx/J1+FhTzFXwO0VjDvvSmwdhWjMco61Ertp0W/LCJbvpATLmxc7kLUDUPBkreC0V8
	Jm2KRsfmQkqiiDGn3ad/XljJ/lgt5y7SEheK47AJ/o1A1LFQn3wZlS3FsiT/+elApyHGMBH+UITaf
	L8A0xuDJnMOs6N/b7KAb3KZx8LRgZrb2gt885+Xr/1QqTGryABs/ADMjegL/TAoWtUD19YabHzxMl
	Lr6wK0hPPB/hr2myKOhTAjDu43B+wUwI6ECUldK7K7kD8b4OynnXnIX3Wox5jkpAtb5LGMqj3LMYj
	HizHxshw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Hkv-0000000CGhA-3HYu;
	Wed, 23 Sep 2026 07:51:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 637A9300478; Wed, 23 Sep 2026 09:51:04 +0200 (CEST)
Date: Wed, 23 Sep 2026 09:51:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] perf/core: Fix a refcount leak in
 attach_perf_ctx_data()
Message-ID: <20260923075104.GA4121339@noisy.programming.kicks-ass.net>
References: <20260920231639.11910-1-namhyung@kernel.org>
 <20260922133835.GZ4121339@noisy.programming.kicks-ass.net>
 <arNZ2YeL7Uuva-YQ@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arNZ2YeL7Uuva-YQ@google.com>

On Tue, Sep 22, 2026 at 09:47:21PM -0700, Namhyung Kim wrote:
> On Tue, Sep 22, 2026 at 03:38:35PM +0200, Peter Zijlstra wrote:
> > On Sun, Sep 20, 2026 at 04:16:39PM -0700, Namhyung Kim wrote:
> > > The attach_perf_ctx_data() can race on global and !global cases.  The
> > > global case is protected by global_ctx_data_rwsem and shares a single
> > > reference count using perf_ctx_data.global field.
> > > 
> > > But when it races with !global case, it may miss to set the global field
> > > and result in a reference count leak.
> > > 
> > >  CPU1                              CPU2
> > >  ----------------------------------------------------------------
> > >  attach_task_ctx_data(global=1)    attach_task_ctx_data(global=0)
> > >    cd1 = alloc_perf_ctx_data()       cd2 = alloc_perf_ctx_data()
> > >                                        try_cmpxchg() // ok
> > >                                        // task->perf_ctx_data = cd2
> > > 
> > >      try_cmpxchg()            // fail; old = cd2; global = 0
> > >      refcount_inc_not_zero()  // cd2->refcount++;
> > >      free_perf_ctx_data()     // cd1
> > 
> > Urgh, took a good while to remember how all that worked. Also, I think
> > it might have been clearer written like so:
> > 
> >   CPU1					CPU2
> > 
> >   attach_task_ctx_data(.global=1)	attach_task_ctx_data(.global=0)
> >     cd1 = alloc_perf_ctx_data();	  cd2 = alloc_perf_ctx_data();
> >     					  //	{ .global = 0, .refcount = 1 };
> > 
> >     					  try_cmpxchg(); // success, 
> > 					  // task->perf_ctx_data = cd2
> >     try_cmpxhg(); // fail; old = cd2
> >     refcount_inc_not_zero(&old->refcount); // success
> >       // old.refcount = 2
> >     free_perf_ctx_data(cd1);
> 
> I see.  I'll do better next time.  Let me know if you want me to resend.

Nah, I'll make a few edits and stuff it in a git tree somewhere.

Thanks!
