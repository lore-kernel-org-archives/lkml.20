Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263575;
	b=eICADJClKgQXmoPYJZm+wX8fxYCDboTSm7ev2+MaqjHvElkqIKE9HMqMdBJKbaoJi/2U
	 mb+29SeCzzAbPZAbJWioGriqyEtP6Xy9WJJxMOB110BpuMPMJLsCcmV2gk+pttszLsuLv
	 bSDX911Msqvgo3lE2O3TR22NZubfV3taJ3aA0xidVcbwspx8wdCoh5ERgfrJwxvt01Vxk
	 QrBxjfw4k8Db0rWVXLowohRsdRFl1BfGiq3RuQMvigqUmm+XascUKZvf3M8Xgd3M6k0Uy
	 v3bSBNhtmpsOroE/ilMXLwTPpbCmO0odp21LIVVIhiUWHh+b+JvtfIhFZxzMx2kXFfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263575;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=yeENmlSis5s1ibk/anCo/CClNlVS1T/W9d/Xnx0f+E8=;
	b=kGFaerN/Sod7rp+GA1askVvc0n1O51+zQStMo3pc8sEN3ieMXN1dy6mTf37/hfDex7x5
	 7fWRSOIBY3GuTmipl5fVOEVoMSHQVrEifgpaSJ2eueOKIlvu8/B/o2w5LbrB5JnT7GMLV
	 zKrHpyo0VKXtJNoIaHtsWLuepdR8zMg+MNlcB7drLGHtPL5V1A5rcjXSftCwYzfLIa2Mo
	 7Rw/ylZL/UNoSwx/JpNiv5iJMhHdIlJTd4CyhKqNd747nbxofGebpcw+/1bbbJzgMkit8
	 RyCx6HfAR15QXlweUxoPBmfYIjNInRU7XqRtywU6anonB4bsJJLbZ9BJ3f5YR/MDfBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=SjH+XvEe;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9922606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9922606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=SjH+XvEe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yeENmlSis5s1ibk/anCo/CClNlVS1T/W9d/Xnx0f+E8=; b=SjH+XvEeVyGUO3i084bMw9DN+r
	33ut+2R69xfo2nVXUoTrKCP7+oJyeMqDi25NPJawE9BHJbYCtO1UuqCKNrvgP4aJUSEF8A/Abk3zh
	6YovDoHfNQak35aVHis9Haq6QvpeR2dluv3bqB5j5fIZRRa8LeCl0oLV2FTTJv0A4+WWZA2ZEruIu
	sSx4sxD0dyOJBq8ayoXfinV9Eqyf93cg5NYyg+qu8CoWDPiXsNuY86mZTRA0P6djoF4+0ey1ngjav
	GfZjNbO5ExmuJ5rkP8hbKk2eu8IXr2SITCKqQzBd5OZpxMMCX6vGHSyGFX+JWLukq00TiInZPyqak
	yiilSm5Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLlu-0000000DuAZ-48qG;
	Thu, 29 Oct 2026 08:46:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8933A300312; Thu, 29 Oct 2026 09:46:06 +0100 (CET)
Date: Thu, 29 Oct 2026 09:46:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Steve Wahl <steve.wahl@hpe.com>
Cc: Dave Hansen <dave.hansen@intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, justin.ernst@hpe.com,
	kyle.meyer@hpe.com, dimitri.sivanich@hpe.com, russ.anderson@hpe.com,
	linux-kernel@vger.kernel.org, mhiramat@kernel.org,
	Matt Mullins <mmullins@fb.com>
Subject: Re: [PATCH] x86: Drop KGDB support
Message-ID: <20261029084606.GE1779021@noisy.programming.kicks-ass.net>
References: <20261028122124.GJ2668804@noisy.programming.kicks-ass.net>
 <28F95BAB-6D5B-4C70-A9F2-14B752EBF022@zytor.com>
 <20261028142625.GU2668564@noisy.programming.kicks-ass.net>
 <27a7b4b6-23da-4469-9161-2ce44e8ac2a9@intel.com>
 <auJT1Ld3urbqaeA0@swahl-home.5wahls.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auJT1Ld3urbqaeA0@swahl-home.5wahls.com>

On Wed, Oct 28, 2026 at 02:58:12PM -0500, Steve Wahl wrote:
> On Wed, Oct 28, 2026 at 08:10:54AM -0700, Dave Hansen wrote:
> > On 10/28/26 07:26, Peter Zijlstra wrote:
> > ...
> > > Also, when was the last time you used KGDB? I think I've tried it once,
> > > some 20 years ago, and haven't bothered since -- it was *that* good 🙂
> > 
> > I can't remember the last time I used it. I also grepped through all of
> > my stashed-away kernel configs I've been using for the past 15 or so
> > years. The only place I even see it configured in is in distro-derived
> > configs. None of my trimmed down debug configs.
> > 
> > There seems to be approximately one clear commit that shows anyone using
> > the x86 kgdb.c in the last decade:
> > 
> > 	commit 71ab8323cc357c68985a2d6fc6cfc22b1dbbc1c3
> > 	Author: Matt Mullins <mmullins@fb.com>
> > 	Date:   Fri May 31 12:47:54 2019 -0700
> > 
> > 	    x86/kgdb: Return 0 from kgdb_arch_set_breakpoint()
> > 
> > The only question for me at this point would be whether we should just
> > config it out for a couple of releases rather than removing it outright.
> 
> I have never used kgdb, but kdb is a different story.  I originally
> reacted quite poorly to this patch, assuming from what was changed
> in uv_nmi.c that both kgdb and kdb were being removed.
> 
> I would like to see the kdb action remain in uv_nmi.c, even when
> removing kgdb.  Is there a good reason why both were removed?

kdb is just a local wrapper around the kgdb gunk. If we kept that, we'd
still have all of kgdb.

> There have been a number of times over the past few years, on large
> cpu count systems that aren't easy to configure for VM usage, where
> I have a problem that wedges the system or leaves it unresponsive,
> and I enable kdb, reproduce the problem, enter kdb via uv_nmi, just
> to dump the stack of all processors and find out what they are
> doing, and check other things that I can get to with kdb.

So this uv_nmi thing looks a lot like sysrq; you could wire up one of
them things to use lib/nmi_backtrace.c to dump stacks for all CPUs, no?
