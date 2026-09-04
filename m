Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75116486E4D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535527; cv=none; b=KqcwjPqo4gsoZhn01cE5rCj8VMEst+9HmbGVS0meixD5uZ8ydpuGNP4+v0l9JnfDVdyMCQtHehqQzjqiI0ZOcWKlzJCd6/ervAn2fvFcl6qmb/L3RdI+uKi9yBOlqIYTn4X0g/eIP92XWdiUd3xNjavBjFIiOMpAHewwhuEPZtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535527; c=relaxed/simple;
	bh=m+JZjfeC96wnDryWb4de5Da4eDIBI+9ulcqy21vpPBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2Jz9npHVZMKJne84zJEHK5aax5w9KT4xzbTU47SH/6OVVw1De80QAhLEVj/FxihIxxQ50qDhLmySlaPRyGccFlI8GpMbeYqfkpq5kQmkYgsfLhYXRRKBQ9n9zkjfFAyG1MbA+r77FmB2ymJoJxU+A2XpKleKyGO+XZ4jX5ddXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHxVDXsh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHxVDXsh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06FE1F00A3D;
	Fri,  4 Sep 2026 15:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788535526;
	bh=Q8qPFjqDwaEy4R31sf5qLomb3/OPOUOP2t5qWLwlGaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BHxVDXshfgpV+fXZhmxJ3B5JQWLlTrb1kOJIZo9TUrgHRQHvSYer4tFijatn6Cc0Y
	 qg+7mjUt5eAOFvQhU6JZRIgNmgYR78wj2N6w30REMSwYPgJYyZbwHmmbOyDD6A9yXm
	 VcTUElCedGjlmMQ7hJNQ6Uu3p49lF+Ubst+Z3o0QrA78yvD1CEwdBSGBabgZi4x7A/
	 XGswGB6gR340hSnXqaJaacMg1F6fXvdEUgqWPwC1o0XboBMSHiWyo3Jb7PbqA0ATT5
	 BT9UTiXOSEjNnDeVGD3yW/sd9oMVRGNYsbWfEWi3y+nLJEcemsp2PEgzlrh49Njhab
	 hzMfPYY7tocaw==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id D1315F40066;
	Fri,  4 Sep 2026 11:25:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 04 Sep 2026 11:25:24 -0400
X-ME-Sender: <xms:5OKaajD7Ag0rBc3Iy-7WzzEqOW91eDjPWpPWekOs0BZ0TxIj23ml2Q>
    <xme:5OKaaskUp5hVo1Z7TK5C1WfOl36LV62ma7K90G1Ov2x2N0wjh7b1WbZrdgx0gSKLP
    LqB6bMkCIJNZN3afBTBBa168g3JAAg4-b3wseGAYHA3RF2uE_LpeLY>
X-ME-Received: <xmr:5OKaapNHOu-HsfquHcO04StB-xwtLEMCjIvixgo5Yh0PrI-AZnQUqyvI6pQ8m3-7ZECUdLZ0pzgbqpgk09sf89dDm2l01L1z>
X-ME-Proxy-Cause: dmFkZTFouFhlR+9zhw5tuHlFYhdI/TAHJ2z9Z/y4IQfJiW3EY4T/QHFBPiYzIgZeL7Mn/l
    yDDqsu87ZbOYPrM0XrgCNs57KSFqzqFoLo7QM22YsbxkY49f08UO4QexLu3L8mCMd4JmdQ
    awNKGSuBUFCygwO+zP84CHCwD7it97udCsPr/kbiqDWARtG0n3beT3NUWPvT+IvnijnUEy
    nu9vaNKeITzSF9O11IPlsCWYIMLYhmOBqCXpmMudPFFNj0G6RWsvrslJrdH0sZ2Fh/ySuh
    VywBXpJD9pXUPn8mEiFJ8vYSTyX+Gq4mCDyB4yj1E2xnLvGQ+rMDMOWw9osjQuNsffIiDK
    pTkci/iRtMbQin4KEgurIQMXOcb9bfmOwgQsvxyIklaU+fdZtt/TJGZLaen2EWoBI+2lSo
    ZcZ5ut5wY7IpTcCHFDfPTvDNH9az/wpDMKB3Y1pRukXhzaxA1M791cCFM6jQHcvCKAIhso
    ZQ1xuZ3z8jZWI4DyYeqAxd1KoGyh8RmjvzzGXk8nybJ4t1Yzr71089hliSieCGrMNpXbIK
    pwJPHX7snSiaS2iPpEufXS6hCUHtSKr5Blzeqxf1euK257bcCGBABunDRBOxYrgClWSheV
    oUhxDgIUulFRum77O8ix5XH8N4O9CXiN2ZtQ2emIDhlKPSwEXmKLX+exEBIQ
X-ME-Proxy: <xmx:5OKaah8DpYZEZZPH867I3aVuLDINTDnwUnl1NP5DkhY8bbDiBHzptg>
    <xmx:5OKaajGXZOtC2EE9pxUyD-lc3xsmCnKqBYjB8HHjr6S4H8MJelTaxg>
    <xmx:5OKaaoh2SDt_h5VwN5CYEL5i47DM2afeaIPcIkBSOvoOANDZaSQ8sg>
    <xmx:5OKaagtqMxdLwaZSyiI8xdxH-HZJ67hBQtRJh-IPbpm6wJSSfCzlfg>
    <xmx:5OKaaruOxsCo-UjUB_GFjIgkcifSxZSUHrmNjWiqChdqfHS6Te7B7fPG>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Sep 2026 11:25:24 -0400 (EDT)
Date: Fri, 4 Sep 2026 08:25:23 -0700
From: Boqun Feng <boqun@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Gary Guo <gary@garyguo.net>, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] irq: Move local_irq_enable/disable() into Rust
Message-ID: <apri4y6U5RDtf_Rb@tardis.local>
References: <87mru5et6r.ffs@fw13>
 <apNtQWqOgwF5_Ctq@tardis.local>
 <apRJzVbMl-hj-otX@tardis.local>
 <87v78rcrf9.ffs@fw13>
 <apSfObo_6Ji5HA7E@tardis.local>
 <87jyp6d2ut.ffs@fw13>
 <apV2iSFXlc3XY7Wk@tardis.local>
 <87tso9axyk.ffs@fw13>
 <87bjad88gj.ffs@fw13>
 <874ig587vz.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874ig587vz.ffs@fw13>

[Cc Miguel, Lyude, Alice, Gary]

On Fri, Sep 04, 2026 at 03:26:40PM +0200, Thomas Gleixner wrote:
> After reverting the spinlock conversion and a lengthy discussion it's the
> best to confine the reference counted interrupt disable/enable mechanism to
> Rust which is the only user.
> 
> This should become the new norm, but that needs more thoughts and cleaning
> up the confined usage in Rust at some point is way simpler than chasing
> random places which adopt it in the meanwhile.
> 

Thank you for doing this! I think the subject should be:

	irq: Move local_interrupt_{dis,en}able() into Rust

to be accurate about the name of the functions.

> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
> Resend because I fatfingered the Subject line ... Sorry for the noise in
> case you got the original busted one.
> 
> Applies against tip locking/urgent
> ---
>  include/linux/spinlock.h             |   23 -------
>  include/linux/spinlock_api_smp.h     |   41 ------------
>  include/linux/spinlock_api_up.h      |   15 ----
>  include/linux/spinlock_rt.h          |   18 -----

Seems we are missing a deletion of include/linux/interrupt_rc.h here.

>  kernel/irq/refcount_interrupt_test.c |    2 
>  kernel/locking/spinlock.c            |   31 ---------
>  kernel/softirq.c                     |   15 ----
>  rust/helpers/interrupt.c             |   21 ++++++
>  rust/helpers/interrupt_rc.h          |   68 ++++++++++++++++++++
>  rust/helpers/spinlock.c              |   39 +++++++++++
>  rust/helpers/spinlock.h              |  114 +++++++++++++++++++++++++++++++++++
>  11 files changed, 241 insertions(+), 146 deletions(-)
> 
[...]
> --- /dev/null
> +++ b/rust/helpers/spinlock.h
> @@ -0,0 +1,114 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __RUST_HELPERS_SPINLOCK_H
> +#define __RUST_HELPERS_SPINLOCK_H
> +
> +#include <linux/spinlock.h>
> +#include "interrupt_rc.h"
> +
> +#ifdef CONFIG_SMP
> +void __lockfunc _raw_spin_lock_irq_disable(raw_spinlock_t *lock)	__acquires(lock);
> +void __lockfunc _raw_spin_unlock_irq_enable(raw_spinlock_t *lock)	__releases(lock);
> +
> +/* Use the same config as spin_lock_irq() temporarily. */
> +#ifdef CONFIG_INLINE_SPIN_LOCK_IRQ
> +#define _raw_spin_lock_irq_disable(lock) __raw_spin_lock_irq_disable(lock)
> +#endif
> +
> +/* Use the same config as spin_unlock_irq() temporarily. */
> +#ifdef CONFIG_INLINE_SPIN_UNLOCK_IRQ
> +#define _raw_spin_unlock_irq_enable(lock) __raw_spin_unlock_irq_enable(lock)
> +#endif
> +
> +static __always_inline bool _raw_spin_trylock_irq_disable(raw_spinlock_t *lock)
> +	__cond_acquires(true, lock)
> +{
> +	local_interrupt_disable();
> +	if (_raw_spin_trylock(lock))
> +		return true;
> +	local_interrupt_enable();
> +	return false;
> +}
> +
> +static inline void __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
> +	__acquires(lock) __no_context_analysis

I think we need to put the

#if !defined(CONFIG_GENERIC_LOCKBREAK) || defined(CONFIG_DEBUG_LOCK_ALLOC)
#endif

around this. Because in the #else branch of rust/helpers/spinlock.c we
have an out-of-line definition of the same function.

Regards,
Boqun

> +{
> +	local_interrupt_disable();
> +	preempt_disable();
> +	spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
> +	LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
> +}
> +
> +static inline void __raw_spin_unlock_irq_enable(raw_spinlock_t *lock)
> +	__releases(lock)
> +{
> +	spin_release(&lock->dep_map, _RET_IP_);
> +	do_raw_spin_unlock(lock);
> +	local_interrupt_enable();
> +	preempt_enable();
> +}
> +
> +#else  /* CONFIG_SMP */
> +
> +#define __LOCK_IRQ_DISABLE(lock, ...)						\
> +	do { local_interrupt_disable(); __LOCK(lock, ##__VA_ARGS__); } while (0)
> +#define __UNLOCK_IRQ_ENABLE(lock, ...)						\
> +	do { __UNLOCK(lock, ##__VA_ARGS__); local_interrupt_enable(); } while (0)
> +
> +#define _raw_spin_lock_irq_disable(lock)	__LOCK_IRQ_DISABLE(lock)
> +#define _raw_spin_unlock_irq_enable(lock)	__UNLOCK_IRQ_ENABLE(lock)
> +
> +static __always_inline int _raw_spin_trylock_irq_disable(raw_spinlock_t *lock)
> +	__cond_acquires(true, lock)
> +{
> +	__LOCK_IRQ_DISABLE(lock);
> +	return 1;
> +}
> +
[...]
