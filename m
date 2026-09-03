Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A08483BDA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430820; cv=none; b=V3xM1jY+xdL2GD6QrdWlaAlzDC9+erUE0RUPPc62NH/w11IftvW9TIH5oDaPOF4PNX+VI5BltBr99Gj9RXVl9ahCJcrZeo/AS6TZoHFYPqQYWnTxVyrUVdO5/JfeV0d77YP5oTzBym08piNrVfZY2NNmpCt36en6lNoIID5mfko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430820; c=relaxed/simple;
	bh=v6eZSmaNvbe3VGmaXvRiFD3NZj3q3bsjq9++zOgJU90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqkem/0+cKuTDPBEDq3KdXGAtQCY/w/AfYRsCjGV5AWW2ZisMorvIKPArr0T71am+XFB9TKHp2Xh/nbEWea7cc7turOz4PBvSrH2n5XVzSAOAphuQwxuYKCJSyIv5W0uRQgwA/NlLgVUEo8igZqd6Htghxe9lIlRwo9gWSuRl9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=v3agMAxO; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="v3agMAxO"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788430812; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=RCZzyH8ckqHuXcgusjXpBBBNpd6mRS253Ej7ck7S01Q=;
	b=v3agMAxOVSO0t15aPbz6e2bMUk84oNmsoyvs0e7+fd6nXarbciRXmAWVPBe/zgQrLv+HXiOVR0xmiBSb2shRFObUYXYUS8tlJmj3aGOgMojInYA2Uhit24+bHWV7zw9dUV4txBDePURtuaCk2dGE9J8E6J4dHQhWtpZCz2Inruc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R411e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0XAFgFuv_1788430811;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0XAFgFuv_1788430811 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Sep 2026 18:20:12 +0800
Date: Thu, 3 Sep 2026 18:20:11 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Feng Tang <feng.tang@linux.alibaba.com>, 
	Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_clock: Add option to use absolute time against
 hardware clock reset
Message-ID: <dkgclgp3kcixppyod6gb4jw5f6w6sbkcxxldodsxgd2jtgwgll@7lcho5hoampn>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878q5i6ay6.wl-maz@kernel.org>

On Thu, Sep 03, 2026 at 08:38:57AM +0800, Marc Zyngier wrote:
> On Thu, 03 Sep 2026 07:51:03 +0100,
> Yao Yuan <yaoyuan@linux.alibaba.com> wrote:
> >
> > On Wed, Sep 02, 2026 at 04:32:25PM +0800, Marc Zyngier wrote:
> > > On Wed, 02 Sep 2026 09:21:23 +0100,
> > > Feng Tang <feng.tang@linux.alibaba.com> wrote:
> > > >
> > > > Currently sched_clock shows the relative time to the boot starting of
> > > > kernel, while there could be long firmware start time before it and
> > > > after the hardware reset.
> > > >
> > > > On modern server platforms, there could be several software running in
> > > > parallel. Like for arm64, it could have  SCP (System Control Processor)
> > > > firmware running on SCP processor, and ATF (Arm Trusted Firmware) and
> > > > Linux OS on the main processor.
> > > >
> > > > Debugging some nasty issues on these platform may need to cross-check
> > > > the logs from these firmwares and Linux kernel for specific events,
> > > > where a unified reference timeline is critical. All these software can
> > > > read the hardware timer, which is also the base of sched_clock for
> > > > Linux kernel. Using the absolute counter since hardware timer reset
> > > > makes it possible for all kinds of software to have a same time base.
> > > >
> > > > Add 'abs_sched_clock' parameter to provide an option for using absolute
> > > > counter, and users should make sure their sched_clock (hardware timer)
> > > > is capable of supporting absolute counter before enabling the option.
> > > >
> > > > Locally, it did help on chasing some RAS issues which needed cooperation
> > > > between kernel, SCP firmware and ATF, by mapping the actions from each
> > > > players into one timeline based on the timestamps in their logs.
> > >
> > > I really have to ask: why isn't this just a one-off sampling of the
> > > counter, kept in some user accessible location (debugfs or something
> > > else), and ultimately post-processed to align your logs? People have
> > > been doing this... forever, and that has been "good enough" so far.
> > >
> >
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

Thanks for the details !
I see, this yet like some hypervisor hide its handling time
from guest to me :-)

>
> The other thing is that this change seems to break the sched_clock()
> handover, since the new clock doesn't start where the old one ends.
> This doesn't affect arm64, which can only have one true source of
> time, but other archs would probably suffer from this.

Yes, we can discuss this more in Feng's reply, thanks!

>
> 	M.
>
> --
> Jazz isn't dead. It just smells funny.
