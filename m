Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14CE430CF8;
	Fri,  4 Sep 2026 21:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788556830; cv=none; b=el1QWcSOreYRKJO5nPmPY0Ysk1Zo7I3mKVDlaU78gD2SPUFh61VNh4e7LnpOfmnn2UvbzezGDV8l3q0gp3uCzkTxtF288a/7O3gl2MAETldfO2+OIscZ2BEPGLQv7rQdFIA82MwAp5GTmdjROKbA9UVaORh6+BJsMgYj/0MhuCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788556830; c=relaxed/simple;
	bh=NJ0KzJHtzTPziVfK2KLpQcvfluYoOaUfCX5nqLHhUkY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dCXZvpThzr4GAskfu9sO5CS4LPnAcZrXyKs15Ls3grllgrf20wTZWBpkoa1JH0YkKClV+de1zKsd4syrCCFoAXAQfeqdIzPRO6vKJEYZuj7GoKph4ntziyVkAFkoreUvp2KU6IDT5piQAw2WEbZ8ywdeapGUexsdXJb1re0hV60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G007xjrR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G007xjrR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757651F00A3E;
	Fri,  4 Sep 2026 21:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788556828;
	bh=2THwZI4av6om57HeLLndLqTcQafaCFjNax8OBmseCVI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=G007xjrRj9Dssa5i7bvoOpDd+ZB/cZ9iunPnczHRVPELmb1XpDuCt6d711up61kAH
	 8ITlADf8Y6xG1om1pRAr0EdJaMqn5q8Tgi5csvO4rA9Ft7cvKBXemL+fmMcjMRZe4I
	 xKwyI52be0lbxFBHnTUHUxLAK4n1KrfqbBSLIUfPOeHxGyq26p0d/62WDddxUfjYDg
	 j1qmydaLyz0/TfbpfBjMvHx7OwgPO3CG7Tc2RmF8FDen9r44YSHwTxhBEXPR8dFoWo
	 igP/6YlCDSnLCTozpWK2XFDGRfV13J2RcinwX7uh9+JImCNgO+l2md97qKgfElSsks
	 fybsf3w67pnvQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org, Miguel Ojeda
 <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Gary Guo
 <gary@garyguo.net>, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] irq: Move local_irq_enable/disable() into Rust
In-Reply-To: <apri4y6U5RDtf_Rb@tardis.local>
References: <87mru5et6r.ffs@fw13> <apNtQWqOgwF5_Ctq@tardis.local>
 <apRJzVbMl-hj-otX@tardis.local> <87v78rcrf9.ffs@fw13>
 <apSfObo_6Ji5HA7E@tardis.local> <87jyp6d2ut.ffs@fw13>
 <apV2iSFXlc3XY7Wk@tardis.local> <87tso9axyk.ffs@fw13>
 <87bjad88gj.ffs@fw13> <874ig587vz.ffs@fw13>
 <apri4y6U5RDtf_Rb@tardis.local>
Date: Fri, 04 Sep 2026 23:20:25 +0200
Message-ID: <87bjac7lye.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 04 2026 at 08:25, Boqun Feng wrote:
> [Cc Miguel, Lyude, Alice, Gary]
>
> On Fri, Sep 04, 2026 at 03:26:40PM +0200, Thomas Gleixner wrote:
>> After reverting the spinlock conversion and a lengthy discussion it's the
>> best to confine the reference counted interrupt disable/enable mechanism to
>> Rust which is the only user.
>> 
>> This should become the new norm, but that needs more thoughts and cleaning
>> up the confined usage in Rust at some point is way simpler than chasing
>> random places which adopt it in the meanwhile.
>> 
>
> Thank you for doing this! I think the subject should be:
>
> 	irq: Move local_interrupt_{dis,en}able() into Rust
>
> to be accurate about the name of the functions.

It actually also fails to mention the spinlock part :(

>>  include/linux/spinlock.h             |   23 -------
>>  include/linux/spinlock_api_smp.h     |   41 ------------
>>  include/linux/spinlock_api_up.h      |   15 ----
>>  include/linux/spinlock_rt.h          |   18 -----
>
> Seems we are missing a deletion of include/linux/interrupt_rc.h here.

Weird. I'm sure I deleted it, but ...

>> +static __always_inline bool _raw_spin_trylock_irq_disable(raw_spinlock_t *lock)
>> +	__cond_acquires(true, lock)
>> +{
>> +	local_interrupt_disable();
>> +	if (_raw_spin_trylock(lock))
>> +		return true;
>> +	local_interrupt_enable();
>> +	return false;
>> +}
>> +
>> +static inline void __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
>> +	__acquires(lock) __no_context_analysis
>
> I think we need to put the
>
> #if !defined(CONFIG_GENERIC_LOCKBREAK) || defined(CONFIG_DEBUG_LOCK_ALLOC)
> #endif

Duh yes. Missed that completely.

> around this. Because in the #else branch of rust/helpers/spinlock.c we
> have an out-of-line definition of the same function.

Right.

Thanks,

        tglx
