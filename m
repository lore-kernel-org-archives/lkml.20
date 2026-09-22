Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD8F542801
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083749; cv=none; b=ZYoXw6luGb/8D/0F86coMp1yKoIioRjva8kZvB/wy5hl3oXIbatOwlkCUVUM4fAJO68EsnZtp/83cDTJ8F+J+F9ME2DhA+wpAqzEO5igph0g/tYF/2pzozs6jDK0cYBoILUMnXWR2PPoe05SEwEcUZSp+fT0vnlqlMdTILYf1MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083749; c=relaxed/simple;
	bh=ooF8E35IVzRJCX6D36AP/IadJ9zZUydxhAU/cHcqFj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRwawyPzHIjr16MQ1XrNVLee4Q4OFQEK/Wl5hnGUIG9A8kyHXYsNQbRb75k5ootmolybHocS3W6DRwDSepKtsiZxmBoyQbwW2AKP3bkSiLggs732W1lz6Rjc0YusDdEDPVfWzZq+aY/Mvcef2iVeq9bF1g5Ye5g61X5qmuYL0N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DJ+V8JTF; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DJ+V8JTF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5UfiAyj1kS5+dWFk2FRnRr7nAHwhDsnRR9DRLYN4Pa8=; b=DJ+V8JTFH04dlC4xoEmuH0yGN9
	rUg1EOG0HFs0s0gnGhnmgh2xNtywpxrVsWVqD2Ew4mH6YqeiGBO40x+xUFnjH/N5o5rqNJJ8I+7CA
	lqhOMj0PpXcQQN8dYOjnFCboQDhqMjlz55abX2jev1nw3vSnCHGDFx3d0eyhMtjFqd/JJX47ucg+a
	yDVFKNeRMBYg7fx/sYW0oSplUJZzoP3equTLKbbs1IKIZbxzgYfy9xx3PzJDGqoOmTL7aYncmrrWW
	wYg/59fTIAkwpnGCKQPOWHinId5jLTlZC/FpZ9EM2iumKVGjOUQWpjgksDbZU3IcE1BF8JJlXFuyN
	YzucWFhA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90YM-00000008rpj-1uMl;
	Tue, 22 Sep 2026 13:28:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5D8A8300708; Tue, 22 Sep 2026 15:28:57 +0200 (CEST)
Date: Tue, 22 Sep 2026 15:28:57 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, qyousef@layalina.io
Subject: Re: [PATCH 4/8] sched/eevdf: Decay positive lag of sleeping entities
Message-ID: <20260922132857.GF2009045@noisy.programming.kicks-ass.net>
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
 <20260921152238.3804392-5-vincent.guittot@linaro.org>
 <20260922100233.GP776954@noisy.programming.kicks-ass.net>
 <CAKfTPtA3332vNLwvxVuM1CwVG+-bMSdBiTmE1Kz8U2Wxg36kkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtA3332vNLwvxVuM1CwVG+-bMSdBiTmE1Kz8U2Wxg36kkw@mail.gmail.com>

On Tue, Sep 22, 2026 at 02:56:56PM +0200, Vincent Guittot wrote:
> On Tue, 22 Sept 2026 at 12:02, Peter Zijlstra <peterz@infradead.org> wrote:
> > On Mon, Sep 21, 2026 at 05:22:34PM +0200, Vincent Guittot wrote:

> > > +
> > > +     vlag -= calc_delta_fair(delta_exec, se);
> >
> > Should this not be 'W+w' at the very least?, ideally it would be the
> > complete sum of all decaying weight rather than just 'w', but that might
> > be a tad tricky.
> 
> I spent some time thinking about this. The right solution should be
> the one you suggested in your next reply: keeping the sleeping tasks
> "enqueued" in another tree and computing a zero decay vruntime.
> However, I was afraid of the overhead of managing this new tree and
> taking the lock of another rq to dequeue the task. 

Yeah :/

> Anything else in
> between will be an approximation because W at enqueue doesn't reflect
> what happened during the sleep period: The CPU could have been idle
> the entire time, 

Ah but if we let idle reset all the lags, by sequence number or anything
else, then that case doesn't matter.

> but several tasks wake up simultaneously so the 1st
> enqueued will not see a W whereas the other one will.

Right. So this approximation is under estimating, it is the absolute
lowest possible decay time, which seems somewhat unfortunate. OTOH I
agree that keeping the whole second tree and all that comes with that,
might be a tad much.

Still it would be good to find a more reasonable approach. Perhaps using
load_avg ? I think over-estimating it might be a little safer than
under-estimating in this case.
