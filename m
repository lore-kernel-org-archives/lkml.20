Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931531;
	b=5GR0T85+A+yDPfB7vv2qLt60rZNBaGUJ/lEwsQc49v6HMMX6M/Rbp5VuHv1d5JRptTcr
	 LykmoMbDwwkqrDEYoM6+Eoxq/OuIltkVSRw/y4/BANOjLneWDFK1zYs20TEQezKh5JTLw
	 5rcTRWAwrwYS2ZCD7ms6RDfawbeFaa1dIb0ucEt510HhJVgpLZmvVqIxBAgxU/gIKJFaL
	 GLh7UoK3w1F9rxI2i76wa0jP6BlptSFwTapPi+hy4OWaJzQXExFh4njyA0N0Tgw7rW+nu
	 6kYlljf0xhliSyFAfnHlzhwvzahWR+8IlrIHgMa2dhBErSkD/u0fNsqtRXVeNyOlWHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931531;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ztX3Y++niBeoIfPiqcn/SQXihFxqlNwWVh/51OnKdYI=;
	b=SkNEo2O6Rkp902I4Lf8rH4jupwDINfL34ju0xxnMthzRsxlAbnDPxlokamKqLo9lGlJI
	 pa6TPH/VGwATZ97cKR1U1T/XI39HmHP3mjrbIIT/FjkFI1xlfRbnY9+WsaNYvl3UMZsbP
	 YI1H5ISMb4HGGF0fBtwifi/NYNku4Hc9GW622qqj0EnjtCDFj7XmwOSVBuUQsdZWOIiP8
	 wNS1kdO15WvsyjKqqUTU1XDRdv5Q3Wpg1JLJyviZxXK75pALFt3sHhaZru76I9YRUQq6h
	 YBvXBUhot1BeTKqxb8qZcAyuEnm4OS3a7dLBj1v9B74loFlbwkL5oo3mMy30/2K9ZAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ZCSb+3Tp;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB1C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBB1C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ZCSb+3Tp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ztX3Y++niBeoIfPiqcn/SQXihFxqlNwWVh/51OnKdYI=; b=ZCSb+3Tp7grxkeOEo5d4xdble4
	vkKVc6Y8+/0E75JeUIatiFa8OSTYbkrZHSNTQvYxAZk/1TTxwicuzfxdE3glBCW+ekRj/TxgHyz8g
	r5WI+jt9aQq4Nmkxkw6TfARRBpkXFJQb63EnMwuG3qqRYtmkYSQ7hT/CJl8Uxjwknpyrw0NgIJio8
	7TJmdRAA5iyvrD5CGx2DN3N9yyaZlJdr1UMAwkhosuQNDQ1cduSrK5EpwNd0XBTvkc9c4tMgGZyXD
	VmTNWHh0eBla/mMzznm9iS+fUcc9F6xoIsVOrO7/2Qeb+TRtKOBcoN9DRvaqPEc1O8fPurJeJl6MC
	Pe9re4yg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLgR-000000021Jp-1rvo;
	Tue, 17 Nov 2026 16:05:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0427E300400; Tue, 17 Nov 2026 17:05:23 +0100 (CET)
Date: Tue, 17 Nov 2026 17:05:22 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Chris Wiseman <chriswiseman@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Qais Yousef <qyousef@google.com>, John Stultz <jstultz@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/pelt: Skip redundant decay and divisions when
 sched_avg is zero
Message-ID: <20261117160522.GH1922751@noisy.programming.kicks-ass.net>
References: <18e8d60c92652608.3137322e32332e3235332e313736.371783.0000sendgmr@google.com>
 <20261117154656.GJ1813469@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261117154656.GJ1813469@noisy.programming.kicks-ass.net>

On Tue, Nov 17, 2026 at 04:46:56PM +0100, Peter Zijlstra wrote:
> On Tue, Nov 17, 2026 at 12:50:01PM +0000, Chris Wiseman wrote:
> 
> > +	sa->load_avg = sa->load_sum ? div_u64(load * sa->load_sum, divider) : 0;
> > +	sa->runnable_avg = sa->runnable_sum ?
> > +				div_u64(sa->runnable_sum, divider) : 0;
> > +	WRITE_ONCE(sa->util_avg,
> > +		   sa->util_sum ? sa->util_sum / divider : 0);
> 
> This is micro-architectural.
> 
> Gemini is trying to sell me:
> 
> 				IDIV latency (32/64)	Branch mispredict
> 
> Apple P-core (M4 tested):	7 			13-15
> AMD Zen[45]:			10-13 / 15-20		15-20
> Intel Golven Cove+:		12-16			17-22
> 
> So on these architectures it is more expensive to mispredict than to
> just do the division.

That same Gemini thing is also telling me most modern uarch should have
an early out when dividing 0 (making it cheaper still). OTOH it also
noted that if the prediction rate is near 100% the conditional might
win out because of reduced port contention.

As per obvious, if your uarch sucks at divisions its most always going
to be a win.
