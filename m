Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B751031E85B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787866389; cv=none; b=BJ5Pkhn4smKiPaOWRvSnL2Ru/UumyuKac/mV/TiBUF9ZktwtroIJD705eJ1YhaM2syMocM/BNanqlZZO/SByroEIuFQWfi8EcZiejeGzLkRRS34Nri2Ed4nipf+6aTzxDHTUQ7Yj31hCcKZgnm4DsZAXqdadfW0ewqMdADI076o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787866389; c=relaxed/simple;
	bh=nMZJBzb92toHNRH/edtukFBgmlximzDnzvhagjrVIJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EM7GJ+PsN+osPMhcGGOdxxGRCeTz1SOztTYbuBhM9wZxSbGeqAiAj8+YhGdzImkpdefb5MtVg8jWlkY0IzAe0v8ZCpnRBUouGASfq9W66TdGeRMw3HvDyqQjkct+CexNZx3SkceH6QICWrPrg1ZPp/0D3QjPIS/5a2+0ceOLS74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NP/vQZrN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NP/vQZrN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384D21F00A3D;
	Thu, 27 Aug 2026 21:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787866388;
	bh=dReqKR+pI6TEs3tx5rwHJL0mx53KP83srsunFU51vZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NP/vQZrN5mPc8WGRSEhyEr1QawoI5t7c5rdJV+3SDuw5q/YTZgzGy67Kz2mgcunTm
	 HCPCI33PREwp16IgxF77EOyaLC1GPMlIZWONktl5FPQwF2Td5mbaRZH1SUFCyYYD5w
	 SZG/tNIPEzXmcT+PQxGmqIafk6un6O2fxoRD27Bi3RI7df9Y7x8ouzOopgntk9mumF
	 s6J+D8FTQCbToO8LOKfrEyoWWJNOOr8AX2n9Z8cVYCxgikok1aOJT3PSMtvrzYePjO
	 VGT+tnKnTYsbCcdSbhe+AYj5bZTjADvj40BYEdXGuLFUaHharQBJTOaqMJp7QCPJ2q
	 WfHlRQxTOfRQw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 48CDDF40069;
	Thu, 27 Aug 2026 17:33:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 27 Aug 2026 17:33:07 -0400
X-ME-Sender: <xms:E62Qalspzwa2ZNEsAvh3epw_YjicKmZie7GnYgpQ8T-V-uQrWG7X8Q>
    <xme:E62QanzNLfMq_Qr9qDC508ThcuvbOEjbq2kCUhEByovFaelIOt5YvNa_qsqMACaFV
    sryDAbK3uUS06lomZyZcyhKi1sfZYAF8Ypoh7hawhsvvOv2ItJKjRI>
X-ME-Received: <xmr:E62QagC14w18DfcHUP9cNyTRrGX10vjIvq6pWBDRDJtjSDsmf0zDHSVBvhzK8aAqcjOXXiRw9rjpnn40pNJz6kDErIOev22y>
X-ME-Proxy-Cause: dmFkZTGyYpHZiopyqhRhsuTgRsAXTIzzHuJacDaquisJV/fkJA6uz2BPq5pKDCYY6gGIEt
    23HJxC845af3s9juTWmKmVODrRJABNokSDzZ6x6GvKFqUSsttq8D/TClgZH/PxzCeqVxaX
    cTMFXthxc6eOEgIpWJO2c2WwLZ1BG3wMINTLr9nRjw9Hpnefjh73uDqaOyUJeKFVbfHPf3
    ki6v1UX33utSN1jvqqASZnw52wMrO1k3Q8vim9EZ7DV4p8zSibp2Olu7jCOS8JVnKSNPVF
    /OQ2AtGE1j0pfXdbAcXMWV+3bglGhyCsdA3JneD4dKH2ovIXzkfWYpcLRFYQMtNoXUNNoZ
    nVL3IoD6gjn3rMSPTmcPDJyFbMyKIgdUcW6G0HilMvWoUgPRLxV8eYxHm4A5AHg8DZ6G1Z
    UVudsIhX3zSpmj7kHbksnUzefmi6ptTprXLpsL1R7FWJMNCLDWmwImwpE35d0dPVXLrkWy
    XIvIgjT0Gz27CcXL/Ml5fby8UBQo8Dqi5fg3hltE2fzJklRoi95UwQH5MC9CTKz6wgVQDo
    3938McO9X9bz4XCKG4TJmz7kBPndq6E1YU0KnMKlT765kEJT72qQ8PiSQQRMQEEaF5IHOq
    4RWyxpBRjaeFyDEQmwJuC3YzsusYI0Pywk3eTDOHC+tMXERlmvOD3UKai1ng
X-ME-Proxy: <xmx:E62QatcvwunMgh4teH4Bg2ST9s_qevyYiYN_nyrG_UvAnGncEu46FQ>
    <xmx:E62Qain_5ZgqTq5ZSLQ7n9FIfuP_ELIAmSZ8bZ_i5JIwZr76wMN5kg>
    <xmx:E62QasF-xoMM2mt2Ss5n6qWwbU8RdrcgVNawxT7GNSnfGVf7DRUQ_w>
    <xmx:E62Qai46lZSRYLKCqRViniMzljmRJAw_dDOQsJFuyc8XgQM6BTQaDQ>
    <xmx:E62QasmH5moFi67-Xbz15zSa94fyMcwaISzHra1d_XzdLRSlB_7ZP71N>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 17:33:06 -0400 (EDT)
Date: Thu, 27 Aug 2026 14:33:05 -0700
From: Boqun Feng <boqun@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
Message-ID: <apCtEUnPzdCQVpIs@tardis.local>
References: <20260804161447.84806-8-boqun@kernel.org>
 <178635226387.442315.3868294476114711805.tip-bot2@tip-bot2>
 <20260824104704.GA4121339@noisy.programming.kicks-ass.net>
 <20260824105523.GA4121620@noisy.programming.kicks-ass.net>
 <aozw_7Txxaq2qE7c@tardis.local>
 <877bldhkmq.ffs@fw13>
 <ao4lO7U7L-7Zice1@tardis.local>
 <87v78wezid.ffs@fw13>
 <875x0vfgtl.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875x0vfgtl.ffs@fw13>

On Thu, Aug 27, 2026 at 10:29:10PM +0200, Thomas Gleixner wrote:
> On Thu, Aug 27 2026 at 10:30, Thomas Gleixner wrote:
> > On Tue, Aug 25 2026 at 16:28, Boqun Feng wrote:
> > So you can get away with:
> >
> > raw_local_irq_save(flags)
> > {
> > 	flags = count;
> > 	if (!count)
> >         	arch_local_irq_disable();
> >         count++;
> > }
> >
> > raw_local_irq_restore(flags)
> > {
> > 	if (!(count = flags))
> >         	arch_local_irq_enable();
> > }
> >
> > raw_local_irq_disable()
> > {
> >         arch_local_irq_disable();
> >         count = 1;
> > }
> >
> > raw_local_irq_enable()
> > {
> >         count = 0;
> >         arch_local_irq_enable();
> > }
> 
> Actually it can be done way simpler because the nasty case of
> 
>          scoped_guard(lock_irqsave, lock) {
>          	unlock_irq(lock);
>                 lock_irq(lock);
>          }
> 
> is only valid for a single lock guard, because if it's nested then the
> outer lock would lose the interrupt disabled protection. Anything else
> would be a bug on its own and would have long ago blown up in our face.
> 

Right.

> So we can completely ignore flags.
> 
> raw_local_irq_save(flags)
> {
>  	if (!count)
>          	arch_local_irq_disable();
>         count++;
> }
> 
> raw_local_irq_restore(flags)
> {
>  	if (!--count)
>          	arch_local_irq_enable();
> }
> 

These are just local_interrupt_{disable,enable}() (replacing
arch_local_irq_save() with arch_local_irq_disable()) :)

> raw_local_irq_disable()
> {
>          arch_local_irq_disable();
>          count++;
> }
> 
> raw_local_irq_enable()
> {
>          count--;
>          arch_local_irq_enable();
> }
> 
> with a copious amount of debug machinery to catch any oddballs.
> 

Ok, so brainstorm on the oddballs:

# 1: double disable

	local_irq_disable();
	local_irq_disable();
	local_irq_enable();

# 2: double enable

	local_irq_disable();
	local_irq_enable();
	local_irq_enable();

I think these mean we should probably do count = 1 and count = 0 in
irq_{enable,disable}() than count++ and count--?

# 3: only restore once

	local_irq_save(flag1);
	local_irq_save(flag2);
	local_irq_restore(flag1);

# 4: keep restoring

	local_irq_save(flag1);
	local_irq_restore(flag1);
	local_irq_restore(flag1);

these are a bit tricky, I guess we could only fix the users? But we
should not postpone the infrastructure because of these?

> Also note that this never uses irqsave/restore because historically that
> has been way slower than CLI/STI.
> 
> A decade+ ago this used to be up to 30%, but micro architectures
> optimized for it. Still on a SKL it's ~14% and on a Zen3 ~8% slower.
> 

Yes, if we go to the level to unify all irq disabling with counter
tracking then I think using arch_local_irq_disable() is possible and
makes a lot of senses.

Regards,
Boqun

> Thanks,
> 
>         tglx
> 
