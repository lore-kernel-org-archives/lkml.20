Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8686D466AE5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778669; cv=none; b=ZqpFDAHXDT9mnrdY9qwq/RjSlujX+tBGBgsl31qNP1XdjYl55uwjy/OdyyTDZpi7udfunH11HBNeN0aTmWI+w1gkBooCpdZ3vd80i8X7yB/GLrkB1+QdkpeODPPF2/9aO/07LGZ4Yckn9t+8x2X1V0MvG57ub2TpDP0tY1EMDcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778669; c=relaxed/simple;
	bh=T4Su+x0Xin9vXFlXnU3ORgwXDfnp/Rd+/tkna2Uol04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPj/5b9iBGd5d+TNNsp+ykDudH+G+XknZgHBPYpSXXmAXfzO+klb1NyZBFJ98JfyHAWKG3QcveRtGsRmUeSyXTUyFQjxYwePjO/0rf1Tb2oBzfxHgDAxkeBSV+0tTgH47/tCvso58h7Y8mL/5MuuIfYTMvfEWMJ8kYEs88vvxKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=aot1oWWm; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="aot1oWWm"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788778663; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=5YYzMa+5uD+O7DVLrCJl6GvtW2cLGdJowwvBh1bGxQ0=;
	b=aot1oWWmhCKWxSgi1NI7SPNxg6VeoJsrsY9uM0hCi4cvEBVtLbshumvNQjX7kLHOnV1BM3y3/QIsJheQFvewt4HnyVIaZH3aNs8/RliOcm6+P20+D2yLeT5K2WwCVblGnrwaCpMA2exY3HGYvJ6gzzlWCOZXE7dPaBDYlfHrUk4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R341e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0XATmRto_1788778662;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0XATmRto_1788778662 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Sep 2026 18:57:42 +0800
Date: Mon, 7 Sep 2026 18:57:41 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_clock: Add option to use absolute time against
 hardware clock reset
Message-ID: <ap6Ypbz4wkftPgBa@U-2FWC9VHC-2323.local>
References: <20260902082123.95770-1-feng.tang@linux.alibaba.com>
 <8733vn5t6p.ffs@fw13>
 <ap5-ZM-2RMih3iQ7@U-2FWC9VHC-2323.local>
 <86h5k14d34.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <86h5k14d34.wl-maz@kernel.org>

On Mon, Sep 07, 2026 at 10:37:03AM +0100, Marc Zyngier wrote:
[...]
> > -	pr_info("sched_clock: %u bits at %lu%cHz, resolution %lluns, wraps every %lluns\n",
> > -		bits, r, r_unit, res, wrap);
> > +	/* Calculate the time since last counter resetting to 0 */
> > +	reset_ns = mul_u64_u64_div_u64(new_epoch, NSEC_PER_SEC, rate);
> > +
> > +	pr_info("sched_clock: %u bits at %lu%cHz, resolution %lluns, wraps every %lluns, has run %lluns since counter reset\n",
> > +		bits, r, r_unit, res, wrap, reset_ns);
> >  
> >  	/* Enable IRQ time accounting if we have a fast enough sched_clock() */
> >  	if (irqtime > 0 || (irqtime == -1 && rate >= 1000000))
> > 
> 
> Which is what people have done locally since the beginning of times.
> And the only time this is actually useful is when bringing up new
> HW/FW that is broken.
> 
> So why the need to put that in an upstream kernel, instead of being as
> part of your debug toolbox? I don't think the kernel shouldn't be the
> recipient of this sort of stuff.

I see your point now, thanks!

- Feng

> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
