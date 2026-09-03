Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40B934D4F9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421528; cv=none; b=tKLm2qwRth5znRbLaAIgPusAcs//yOQfmRwXYRQfKKpkW4CbFR0HZeJA9hT95VoPK5LH7ppajgqh/HTJIuWOnszC9amvFzqMu8p+307ElatiCAWsibdtW8lT0BL2Xi86ETIKEoHtyNGBpgN4xjl30/JrYATETyHksCsPG/W8QGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421528; c=relaxed/simple;
	bh=x42waAQUhwJah3Lp5IIgtMQtan+dF1X37v87xnYTJ/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsJBxhyLPoRq9I30AVYEp6lH1Z1oS8ODrMnUIrHIHpqvILaomQZq0hIj29orKjIRSTU4J81074Eocpal8hMB2CAJr4Xj3RG6E+MZ4swQkRC5gFhFCI7KHzg//afqQ3KsVrc2v9v7X5Z/tKMmWFg1Bj59lZyWc2fPLzhBIBEN18Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=KF0mRoJd; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="KF0mRoJd"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788421517; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=EkvUov35IBgMqPajuz4ajCfFWqoVQWw3P8nKWuPfMdk=;
	b=KF0mRoJdlIKape3mGGF7uX7q0shBnsNMquzJO/SDpQK7GsN+/id0GrwXnAc6iLmvPctnpCAZSbXgm1DrYORbzefB54b20o45lTDYyUlRV9oYT0C/f4ve013MUmaiHD5wX8EAx6XvM55kLgRd8ebwXcCqFn721xVtnbKv+4A2+rI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0XAFOpmq_1788421515;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0XAFOpmq_1788421515 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Sep 2026 15:45:16 +0800
Date: Thu, 3 Sep 2026 15:45:15 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org,
	yaoyuan@linux.alibaba.com
Subject: Re: [PATCH] sched_clock: Add option to use absolute time against
 hardware clock reset
Message-ID: <apkli5dC8z3rcXBy@U-2FWC9VHC-2323.local>
References: <20260902082123.95770-1-feng.tang@linux.alibaba.com>
 <87h5k7mzxy.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87h5k7mzxy.wl-maz@kernel.org>

On Wed, Sep 02, 2026 at 04:32:25PM +0100, Marc Zyngier wrote:
> On Wed, 02 Sep 2026 09:21:23 +0100,
> Feng Tang <feng.tang@linux.alibaba.com> wrote:
> > 
> > Currently sched_clock shows the relative time to the boot starting of
> > kernel, while there could be long firmware start time before it and
> > after the hardware reset.
> > 
> > On modern server platforms, there could be several software running in
> > parallel. Like for arm64, it could have  SCP (System Control Processor)
> > firmware running on SCP processor, and ATF (Arm Trusted Firmware) and
> > Linux OS on the main processor.
> > 
> > Debugging some nasty issues on these platform may need to cross-check
> > the logs from these firmwares and Linux kernel for specific events,
> > where a unified reference timeline is critical. All these software can
> > read the hardware timer, which is also the base of sched_clock for
> > Linux kernel. Using the absolute counter since hardware timer reset
> > makes it possible for all kinds of software to have a same time base.
> > 
> > Add 'abs_sched_clock' parameter to provide an option for using absolute
> > counter, and users should make sure their sched_clock (hardware timer)
> > is capable of supporting absolute counter before enabling the option.
> > 
> > Locally, it did help on chasing some RAS issues which needed cooperation
> > between kernel, SCP firmware and ATF, by mapping the actions from each
> > players into one timeline based on the timestamps in their logs.

Hi Marc,

Thanks for the great inputs!

I forgot to emphasized that this is only a debug option, mostly for bug
chasing. 
 
> I really have to ask: why isn't this just a one-off sampling of the
> counter, kept in some user accessible location (debugfs or something
> else), and ultimately post-processed to align your logs? People have
> been doing this... forever, and that has been "good enough" so far.

This option is for chasing nasty bugs (involving SCP/ATF), which could
be panic during boot, so debugfs may not work. But yes, we can achieve
this by printing this out in dmesg.

I agree the post-processing logs works, while this option could be more
convenient, for kernel developers, and firmware developers too :)

> The other thing is that your "absolute" clock isn't absolute at
> all. This doesn't consider SW running at EL2 that could happily offset
> thing by an arbitrary value.

Good point! It may not work for guest environment. And the main purpose
is to debug baremetal issues, which need to cross-check logs from
SCP, ATF and kernel.
 
> I appreciate this is not what your case, but I'm somewhat reluctant to
> burden the kernel with something that is, by definition, unreliable.

You are right! There are all kinds of hardware timers out there, many
of which have various issues, and 'unreliable' for this usage.

The needed features I can think of for a HW timer to use absolute
counter are:
* always running, won't stop on entering cpuidle or system suspend
* won't change frequency on cpufreq change
* the wrap period is big enough

I thought about using CLOCK_SOURCE_SUSPEND_NONSTOP to do a capability
check, but it's not available in sched_clock.c.

So I mentioned in commit log that users enabling this option should
make sure the HW counter is capable.

btw, fwiw, Sashiko also gave some good comments, like I shouldn't use
cyc_to_ns() for calculating the epoch_ns, which should be solved by
using mul_u64_u64_div_u64()

Thanks,
Feng

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Jazz isn't dead. It just smells funny.
