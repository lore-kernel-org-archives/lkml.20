Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D023D6479
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990698; cv=none; b=tyx2GJGVlrI6WfnNqeabbMukp2cwEkTa9SmGJ2iiyQU5s4IJD2jRIU8nn9KnCx0rZqzlg2c3y9vZxkbmN6CjjGLNrHFt1fRSbvjf9aDuOW3J95VrC1BDOLSDFcW9PqxSUTcXNMF1e9SAQBgm5kFcr+F3eqQ6amLNNXsDRifapEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990698; c=relaxed/simple;
	bh=Ndd2XrO22ju/jqARH9zd8coBZawekux8q7hWoL0RXco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kb/ES3CWc0xY5Bh//NTQZ2s6FQyNcHWz3cixsXbJ3t+PzDhj07fvkl1b87mcPid7cbdQKLwTuAvN+MR2dheQtAXy8ZgSPI503KJVVQ9h1ZHHPgzDfMq+3H+WYEylSfQH3W+UahcEYvC2xyxMBjYN7KJK+N7o+cxdI3iL9vqa0Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aWbMEsGX; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aWbMEsGX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DYuwB6DL5qoXxnem2Sh49UaLWIq/5mk6bF4glzH7dyA=; b=aWbMEsGXXdzPU/bx+iCtaVcm8e
	nRg2aqSvGS3f4uve5u3Ke2K4GEO+BE93YcSEFve6tsM7QLcgvDpPg/q4wx8Im5J1Mwy/pLJx9g9pS
	jgROHSedbRoJ6EqqhPXHI1qFLxlIskGJeoGXTY54fo+jKQfS0+MahJzA5uTyrrnLgFBuailVAOylH
	j5lGomeixCyu8vSf0Z7F8fv/bZnKXIKpVjv9gpFYYUPHPZ64RfMdnL6R67s/YIcx5SO50G4DOHDBy
	YJ40ynKuYYisOAFmRlgPyWKvxjM7E02SVl05cWmTFCWWpxZM2RoGW+A5qeplnqiXqgY8EPx2pCEpB
	mqjJlybg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QCM-0000000A1ca-3w9W;
	Wed, 09 Sep 2026 21:51:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 016EE300A9A; Wed, 09 Sep 2026 23:51:17 +0200 (CEST)
Date: Wed, 9 Sep 2026 23:51:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Will Deacon <will@kernel.org>
Cc: Andrea Righi <arighi@nvidia.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] sched: Enable preferred SMT siblings on NVIDIA
 Olympus
Message-ID: <20260909215117.GO776954@noisy.programming.kicks-ass.net>
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909131415.GB4120091@noisy.programming.kicks-ass.net>
 <aqF84So9WUQCDgsz@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqF84So9WUQCDgsz@willie-the-truck>

On Wed, Sep 09, 2026 at 04:36:01PM +0100, Will Deacon wrote:
> On Wed, Sep 09, 2026 at 03:14:15PM +0200, Peter Zijlstra wrote:
> > On Wed, Sep 09, 2026 at 08:26:07AM +0200, Andrea Righi wrote:
> > 
> > > Andrea Righi (2):
> > >       arm64: topology: Prefer PE0 on NVIDIA Olympus SMT cores
> > >       sched/fair: Honor asymmetric SMT priority in idle selection
> > > 
> > >  arch/arm64/include/asm/topology.h |  1 +
> > >  arch/arm64/kernel/smp.c           |  1 +
> > >  arch/arm64/kernel/topology.c      | 51 +++++++++++++++++++++++
> > >  kernel/sched/fair.c               | 85 +++++++++++++++++++++++++++++++--------
> > >  kernel/sched/sched.h              |  6 +++
> > >  kernel/sched/topology.c           | 36 +++++++++++++++++
> > >  6 files changed, 163 insertions(+), 17 deletions(-)
> > 
> > I tentatively picked these up, but I need an arm64 ack before I can
> > merge them, and ideally vingu will bless them too :-)
> 
> We've had five versions of this in five minutes, but the arch code is
> pretty filthy tbh. Detecting topology based on MIDR is a non-starter,
> sorry.

Yeah, Andrea is a wee bit fast with re-posting. I'll drop this, no
worries.
