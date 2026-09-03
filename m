Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251463FA5CC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422844; cv=none; b=bCRiZ0T/PaGL5jbQ+vQGaoJQjXiBEOfO+3XwYiVgznaQXVIfOhcRKjaBlpvFpzKl+QDfvC1oUmzcgG3T4G3L159+yL6dXPc11Ly+zT2h09blBsGLhEMa/T968UTWnBQ1wLBPgphnlkKofoI8RPJy5Tj7N+sW8AFkq+mKmb0XNRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422844; c=relaxed/simple;
	bh=GOPbgBjn2RKDpN7fmb/4SmMEZKHv/XL/VKGOO6njJCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGGeBSG22Z0w+UMK0+6RWEdY9UJIrZhZOra+xMy7xLzdaQZ91zBPwgCyuYg4xq7TR2Pv2XSb0i2F9N//2rO5Ywo5mjhqFwg9gBqXdQyxo+/wv7W/6UY6c/YD/oE2OyHQbWnjIJZgYGCTHRXTk+kvjrDKfHGwCCW90IStimnqs0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=jMu45nUi; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="jMu45nUi"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788422839; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=di8AGXpqE/d6v+u+eph8bU6vObZkpDKvD9WZToZyCVQ=;
	b=jMu45nUib/oxurMXphg6lfrBiyrCvUuWsvPG3F0So9KCeOOD7l5K3vaIOFpbnypcs9t4aTMdj3FZcjYzf31zaqzABshCV/lvuGsEGFsuGD+hgdPHFgOsi5BBi+8jGDzhC+QMnfOZvK7KvTY2yRcRX18JbNYbIfB0NwQ6FbLgBSE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0XAFOxze_1788422838;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0XAFOxze_1788422838 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Sep 2026 16:07:19 +0800
Date: Thu, 3 Sep 2026 16:07:18 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Yao Yuan <yaoyuan@linux.alibaba.com>, Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_clock: Add option to use absolute time against
 hardware clock reset
Message-ID: <apkqtgN3c3LUTmy-@U-2FWC9VHC-2323.local>
References: <20260902082123.95770-1-feng.tang@linux.alibaba.com>
 <87h5k7mzxy.wl-maz@kernel.org>
 <ayvjcnerxbgffnpv6j2kxs2vxfu54gynu6oxv3j2u44he55o4p@pq42xsh4qkrg>
 <878q5i6ay6.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <878q5i6ay6.wl-maz@kernel.org>

On Thu, Sep 03, 2026 at 08:38:57AM +0100, Marc Zyngier wrote:
[...]
> > Hi Marc,
> > 
> > > The other thing is that your "absolute" clock isn't absolute at
> > > all. This doesn't consider SW running at EL2 that could happily offset
> > > thing by an arbitrary value.
> > 
> > Do you mean the VM case that VM's vcounter can be changed by hypervisor
> > in EL2, Thus it's not that absolute in such scenario ?
> 
> That's indeed one of the possibilities. EL2 controls both virtual and
> physical offsets, and therefore provides the kernel with a different
> view of time.
> 
> This doesn't even have to be a VM. There is a lot of non-hypervisor SW
> out there that just hogs EL2 for more or less nefarious purposes (such
> as "protecting" the kernel), and offsetting the counter values is one
> of thing they could do to hide what they are doing.

Thanks for the info.

Manipulating time counter(sched_clock) runtimely doesn't sound like a
good thing. There used to be similar things happened for TSC on x86
platforms, which Thomas has mentioned several times :)

> 
> The other thing is that this change seems to break the sched_clock()
> handover, since the new clock doesn't start where the old one ends.
> This doesn't affect arm64, which can only have one true source of
> time, but other archs would probably suffer from this.

Yes, I has similar concern. And for sched_clock, it usually should be
done by a very low read cost, high precison, and better per-cpu timer.
I only have some knowledge about x86 and arm64, and don't know whether
there is other architecture that really switches sched_clock .

Thanks,
Feng

