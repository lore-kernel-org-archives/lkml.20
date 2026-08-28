Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D574746A8
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787952418; cv=none; b=QKiRBSPGLyHeXIcmUiI4QHb11mh1Csu3aGh7/BTBd8mLoOPEK+MK4/ptSdzlc7ih4JMy9DUrppPKpCzZR3BJ811xVCeycGS/2fq1XAuapQElbthFgfv1vybsDHoBUk8RQzoHn/Lg2lRKSGBDCSJ9ymlXtD/PhO+yd4YObIhs0Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787952418; c=relaxed/simple;
	bh=eJ9M4CousCLajy8EJAxkmJYJgK1dYiblXVDFaXb0AAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKqh5ca2CsEEmaIxtw6HsVWuNGdUuyzqMKYvz3DqGaxOpVISnjXfowk+Hq57oWJowxeVmSTwV2K9uKcGRYaXPHUIgk4ANcZYy+45kQJvJtJYaJl8TgIi0PBPNly/mdlvMOQRJLjh5Pc0GTH8zfU4KZEWUJOlzbEgYWvvRktPEmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLkoPSye; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLkoPSye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE54C1F000E9;
	Fri, 28 Aug 2026 21:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787952417;
	bh=zyCg5UjedcojfQLV5cNozKHQp9gvDnbLzlNuI6EOlno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KLkoPSyeHxdaA+/1TgHR8PcqXOcWepLzvChOE5PVStX6XPuKppVq36WY3ORhMSZfp
	 DkTuZ2wZ3w4iucsWE1b4VTPVXSpdUCWtQl3iZ9Swqj4JBFwDIlzLfuF5A0YgvKivEx
	 Rui1SK7kyET74ym3YngU7sROhHkSktvBFKrQEm6qxBFENq3R6J3kYKFdquz4NCAlAM
	 0Nnm/pZUGpgUTW3veKtJ68PHr+RVB49uuZY9d9gX/3PHxrsjA9/Nijzf7Z1K3f73Rn
	 zUBSGrNhBPNr5bATGL9mNEq7+k0xMqow4P/LpnlHsUVigoERMw0FqsLtK+EXxUnFqj
	 NB8f4LEQzYlnQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id F2BA4F40066;
	Fri, 28 Aug 2026 17:26:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 28 Aug 2026 17:26:55 -0400
X-ME-Sender: <xms:H_2RaqJmHiI5zwSvu9p37_MU6GrMK5km4hr_2kZ1D0mABrcumXIGlA>
    <xme:H_2Rai2tLn-fQKHwWQaOps831D63CYgpWYgoRgbElv7AkumOWTHdvBKoCkxbJ6bPL
    v_0oouNIjqrY_hdhK_N_GEdE5oFgSl9CgcExRolzLX-eTweNL_meA>
X-ME-Received: <xmr:H_2Rao7-pgnHKAA7gcLVM1e4RD0Re60Ywd7oa5AfEbfWjoDb3L3KOEDfla67Wvhm-ZX1I_pUY5kKMhxQcB65Pdj8G4DuMgBF>
X-ME-Proxy-Cause: dmFkZTEZaX6zD5m3ntiYazDgmTsVOaaBjZDPMtKF5OiRmoTsSw8uJlhRe0zgWzL9ir6eAq
    rwjR2yIUeWeWlV/EgbUJAvATqOPURjv1u/3YdH8gRrMgryM9sv+h0McwFjOLPc5bWH0x8q
    TDPQliN/VSl8iyWevWbLvqibWk72m0FdRYBbixul9YwySE5WEAaxW8oYA8DH82aIsuq+9t
    fylFusQTCen2tEvVTfyegvwuBAOXQioO+amB3Ua8Auq3FiGVrDFYBSp9K6pmi5Y5xsdh2w
    m2os5gmz4Xt51DmBThcVf80FYzb6eVpbeat6bagtJITFSgWmgDTgb0JjqeJ8QWsavPN4Rc
    0SKLZ3Htc9wmzgnN7JLCl2OuKpQ5Wx2B3sx8IOzz6YxiKf3sx7w2Awdv8GHWgcUhZMqq8f
    7IUM6+jLvF51XUIzdr+N06sO6zg+iVfEd51GaLwRKopulUB2AQEfz6+7Pu5eV8ZioJJ5sD
    YSTr5UQym4mRC8KwYT6u+HhFiAuqcAQSe8zEKqP4Lbipc8nD4PYkCEeF2p4r6Kxrc5rV13
    ZpN1KU6HvFuc1+NpYIdjUQulgQbbVZboiWr2N7h4Aj98Hmte8qWzuw1PDDrgfRgnDmLnvM
    8dzvcHI/tltYtfel8b5Hl2V2g4twUltK+HYkyyHYl/hO1T1lZ+tjFLa28mNQ
X-ME-Proxy: <xmx:H_2Raj9WA0YEYch5JkentPqoawELvc5npPGH6GuTdpYnV-iqkew5vQ>
    <xmx:H_2RanWu1mbPYAHjx08szAtUwYDj0FwmsDyeJtAMDvI_nfFDg8sYeg>
    <xmx:H_2RaupgaoKXDShhrVMfQ-6t_A7Kt-T0S2wavishp69mtzoeyTk2PA>
    <xmx:H_2Rapk9ovGUdJjtyJKQh4aeTnvWNwnFwPwiVsyUZsC_301Du-VcBw>
    <xmx:H_2Rau3NYJGAKPo3mJYFB0hAcizB6uL6vEODSa5yS39872c3sMpVkJX7>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Aug 2026 17:26:55 -0400 (EDT)
Date: Fri, 28 Aug 2026 14:26:54 -0700
From: Boqun Feng <boqun@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
Message-ID: <apH9HuwGc4Lq-bTx@tardis.local>
References: <178635226387.442315.3868294476114711805.tip-bot2@tip-bot2>
 <20260824104704.GA4121339@noisy.programming.kicks-ass.net>
 <20260824105523.GA4121620@noisy.programming.kicks-ass.net>
 <aozw_7Txxaq2qE7c@tardis.local>
 <877bldhkmq.ffs@fw13>
 <ao4lO7U7L-7Zice1@tardis.local>
 <87v78wezid.ffs@fw13>
 <875x0vfgtl.ffs@fw13>
 <apCtEUnPzdCQVpIs@tardis.local>
 <20260828092205.2e65e299@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828092205.2e65e299@pumpkin>

On Fri, Aug 28, 2026 at 09:22:05AM +0100, David Laight wrote:
> On Thu, 27 Aug 2026 14:33:05 -0700
> Boqun Feng <boqun@kernel.org> wrote:
> 
> ....
> > Yes, if we go to the level to unify all irq disabling with counter
> > tracking then I think using arch_local_irq_disable() is possible and
> > makes a lot of senses.
> 
> Where are you thinking of keeping the counter?
> On non-x86 accessing it may be expensive.
> The best bet is probably in 'current'.
> 

The counter remains in preempt_count() as we already did for
local_interrupt_disable()?

> Doesn't that make this valid?
> 	int c = current->irq_disable_count;
> 	if (c) {
> 		current->irq_disable_count = c + 1;
> 		return c;
> 	}
> 	disable_irq(); // asm("cli")
> 	interrupt_disable_barrier(); // ISTR arm needs this
> 	current->irq_disable_count = 1;
> 	return 0;
> }
> 
> The task can be preempted in the middle - but that doesn't matter.
> 
> If spin_lock_irqsave() returns current->irq_disable_count then
> any existing code that does lock chaining works unaltered.
> 

yes, but someone could be creative and do:

	spin_lock_irqsave(l1, flag1);
	spin_lock_irqsave(l2, flag2);
	spin_unlock(l2);
	spin_unlock_irqrestore(l1, flag1);

basically, perfectly nesting and paired critical sections always work,
it's the unknown oddballs that we need to worry about.

Regards,
Boqun

> David
> 
> > 
> > Regards,
> > Boqun
> > 
> > > Thanks,
> > > 
> > >         tglx
> > >   
> > 
> 
