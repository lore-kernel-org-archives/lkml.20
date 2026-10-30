Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354201;
	b=WxumnVjAF9xX5qt4iJtmOc0DKL4QWAnMurVq6n6M3m225JOb6CiBnPGGq35/leOi5jP1
	 RMWiUPn3IEj9E5Frpkakg8z1KI7F5lw1T8UFU6BMX8EPFrZUqfER9vspIWFps5lJHGGno
	 XtpJLk2wH++OKFs8YwYcFJbNTxjfnYcrVGsFmcjNVJrkrIpQHdOEiEhT80JfnyhoHko+7
	 lOTKiLCz6SaXtnPBATs9MzMA4v4qxHi2sSkRJZm3pV9k5TBVi7wWVgzCbEE1ialNvwMtr
	 JMMKMB8QOx7EO/EevgDsDWQFWqaAOl+ONJ6/gaSJHJjSnrCeRnA+oupNat2/nTFNiHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354201;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5xiejaFvgYu1bZJnBCs0ytrTR8vL1a3ZrRscchf483o=;
	b=lpT8iaEkQwTDBAcKgFs3Z6GCesrnykzNQWTf/umQWY2h0lSxjirx7cYuxchgw9zms2Ol
	 kZmiMPpz873VQszIkGzeSnRqDS3NmMB4kYeerT038Emebg8Ji7rTyQ9yZgqOLAyF2lKdw
	 Zfdnn6Htzrxm/+HMctyEY7+SBPVyMNKbusyXhFEbQW8p3VgYA/lO1I6rub0AF03pGiTZq
	 +CwfzMos+NkLiwEkb3DAhQgAsATQIRBsdyWLXMk5mKLDuD2k2svMlSd3qrB91HLfZxW7G
	 Pc2LN0AswcHwD+3DmBMPj2WDP9xSZ2vTm1qCSK/a/UJBnZ2Jaby+znInp1n3gGadEng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b="Ywe4/hep";
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE581606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE581606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Ywe4/hep
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5xiejaFvgYu1bZJnBCs0ytrTR8vL1a3ZrRscchf483o=; b=Ywe4/hepCn13MWag7VEpyxVe9S
	RqxxW31FBFOdjP/8Eu2Tg50YiAPYoJcg0s8JjmsDF7x2OrVcVYKjmTwfZILGw2gsEZPIijr5LYT9H
	FO2HzY/l3NMlc+y5ZpMHUDreYQ//VrdSUe7LYsvZ4goxgUCiqubAzxDoic09em32Xx4+EMoQvRQ8+
	qp+Xo7Ofi1FWyJpLz3qoWIowc5GSfMCPXGNi27u5zg8FwbIXDwU50HAdsi/k/RErtpZ/pyWvq2RD6
	kIK8pljsGNxJvSPOqi0iXz5o48Jme4nWQ2ZxyDa3zqwwueZ/C4luYaPhtGYUU12HTuXl+l3JLpj9O
	3nVuYqcA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjLb-00000004pKS-1YHe;
	Fri, 30 Oct 2026 09:56:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 61736300329; Fri, 30 Oct 2026 10:56:30 +0100 (CET)
Date: Fri, 30 Oct 2026 10:56:30 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Qing Wang <wangqing7171@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Davi Chaves Azevedo <davichazbh@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] sched/fair: Replace random newidle_balance with
 Bresenham accumulator
Message-ID: <20261030095630.GJ2668200@noisy.programming.kicks-ass.net>
References: <20261030091946.2498870-1-wangqing7171@gmail.com>
 <a0dc959a-a05f-4725-86c9-1b7299d9b2a3@amd.com>
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
In-Reply-To: <a0dc959a-a05f-4725-86c9-1b7299d9b2a3@amd.com>

On Fri, Oct 30, 2026 at 03:16:13PM +0530, K Prateek Nayak wrote:
> Hello Qing,
> 
> On 10/30/2026 2:49 PM, Qing Wang wrote:
> > diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> > index 919d0fb00bd9..79c477b47510 100644
> > --- a/kernel/sched/topology.c
> > +++ b/kernel/sched/topology.c
> > @@ -2002,6 +2002,7 @@ sd_init(struct sched_domain_topology_level *tl,
> >  		.newidle_call		= 512,
> >  		.newidle_success	= 256,
> >  		.newidle_ratio		= 512,
> > +		.newidle_window_pos	= 0,
> 
> nit.
> 
> I think this value should start in a way that allows newidle balance to run at
> first attempt and then stabilize. Maybe '512; is a good number if not higher?

Funnily enough, treating this as an independent variable and using a
random number works and 'fixes' the slope change problems.
