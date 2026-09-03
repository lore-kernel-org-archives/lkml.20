Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273F82E8B64
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418275; cv=none; b=bt1SfxYw3LVFZHUQSwg3UcfWLa2C8MF1R0agqxcO9k0MgsI6QgpDK1SFQFl4rAiyz2RKxBBy42ZM4LWS0lRP+EBksZ/2oVFv/hTZmJIH51E8cfNVMM/0u97yZlE4kAGQ27nvYNaJaXOKWFSfpIxbZnfYCOVu6souSrBPWFqwIcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418275; c=relaxed/simple;
	bh=MGjD+x2n7vkaHCjkWMohMz0eEiK42tRG6XZbIW7L6r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MG4tkIhV0TiX/w96XEx71Uv5GlIrVtr5rmw3tyOMClYuOj9l16VuwGZ5vRxkCdMno3VXT8P2e0iKQngHdqdGQ2bQpCogLnc6TfdCwP3PsbnkmfRypwgubqYKvAuToU4bulW6kD2tnwsgjxuNdEy+B2Ohlpi8pbkNAB9PRogd6Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=K7roXkom; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="K7roXkom"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788418264; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=4f7ctDqtlxtK74vxO+YWWm36myCyJiI6KyYvKMh5kx4=;
	b=K7roXkom6pHWaCQ8bpcy4kev63QrYjVNUodmQ9w1NEKn9rqxD2+MKoHl1yqQBv3xkWSlQf8erD4uJDiKTxlr1lYp6L8QG+J8d15T6MUDhJ4Xu+k3mzggwWfXMNymObi5brMIEuS6Jw6jR/S/H6JPoOL9CKjrjLpp1KMqXLgpKUY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0XAFA2qj_1788418263;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0XAFA2qj_1788418263 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Sep 2026 14:51:04 +0800
Date: Thu, 3 Sep 2026 14:51:03 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Feng Tang <feng.tang@linux.alibaba.com>, 
	Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_clock: Add option to use absolute time against
 hardware clock reset
Message-ID: <ayvjcnerxbgffnpv6j2kxs2vxfu54gynu6oxv3j2u44he55o4p@pq42xsh4qkrg>
References: <20260902082123.95770-1-feng.tang@linux.alibaba.com>
 <87h5k7mzxy.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5k7mzxy.wl-maz@kernel.org>

On Wed, Sep 02, 2026 at 04:32:25PM +0800, Marc Zyngier wrote:
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
>
> I really have to ask: why isn't this just a one-off sampling of the
> counter, kept in some user accessible location (debugfs or something
> else), and ultimately post-processed to align your logs? People have
> been doing this... forever, and that has been "good enough" so far.
>

Hi Marc,

> The other thing is that your "absolute" clock isn't absolute at
> all. This doesn't consider SW running at EL2 that could happily offset
> thing by an arbitrary value.

Do you mean the VM case that VM's vcounter can be changed by hypervisor
in EL2, Thus it's not that absolute in such scenario ?

>
> I appreciate this is not what your case, but I'm somewhat reluctant to
> burden the kernel with something that is, by definition, unreliable.
>
> Thanks,
>
> 	M.
>
> --
> Jazz isn't dead. It just smells funny.
