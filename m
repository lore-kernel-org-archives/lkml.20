Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A021D3F104C;
	Sat, 29 Aug 2026 20:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788036272; cv=none; b=h9J3okci4G0UX0cNSA/Rb5V8Nde8lNNuqVp9e65lEAOn4a5bIJGZJFwSFTs2wY3norSB7fE839InX3n2kl8f4gJlj2CVmx8/a7czuB1dZN0fu9EXJdgnNNQSYY9wZEpsl8Ft6vbrt17NlNsFR+GAPuAd5De+Xk0L6G66E30ac50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788036272; c=relaxed/simple;
	bh=5Z76jLZRA/GzOJlEmPR1H+CcNWgDCbgqq0j/di8PvoA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Xyn9nvVfy9LSZD4Bu4TSvS5qL73lXMrumHE1+DHhwXP2VLyDx3J4WlRkDY9LdjtFlfU80dGbD2Xm6HrKvIy2U8kV+5J/npYZnesLFkf/vL1SMFbHoyfz3Xb/6f7gsNBWhe/JNjL27wZwWyB3nSvVC5SK4utfvPpXiUX/kwuxW/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXs8Adjt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXs8Adjt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA291F000E9;
	Sat, 29 Aug 2026 20:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788036271;
	bh=rST5gAnKB3Su2Hoy2xfQykH72uqYj5Qf+uaY+Qn8T2A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gXs8Adjtu2k9vScHDUVXHoIrCRf8u9MzgtddZGqXP4M1cqtCxDRnapRNBHLFGqmi5
	 U+o/HRYMq0YJHYR/TRQXad9PqGgBoAO+plwfnRruTDz3phyFtHiL55HU2zZHtStYv7
	 QR9TX3nAHw4qAFhOtzvDJF4ID8Ny2QhpAevDJdbwad/t/sU+3wN8VEED0DKqFlfz33
	 1VTB+sw18xww2fmnqCVZYYpO2AVC4zqcuhMVhK4Dc0eqxf2nHhGSmhQYeuwhbsOqAw
	 VKs3aElKfx1pmR9+JtUjHNc4a6QoBsOXGRf2vclTKmIN1SiYkoYqVqmdb763VeCeRt
	 VizUWsaprRLcg==
From: Thomas Gleixner <tglx@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
In-Reply-To: <apIrwRYJbPpmjrNo@tardis.local>
References: <877bldhkmq.ffs@fw13> <ao4lO7U7L-7Zice1@tardis.local>
 <87v78wezid.ffs@fw13> <apA4M7Asz0mV9uaw@tardis.local>
 <87jypbfu1t.ffs@fw13> <apBrZuxU8bmCgG8h@tardis.local>
 <87bjanfmzz.ffs@fw13> <apCS3T63WUxHd1GH@tardis.local>
 <87wltbdvmd.ffs@fw13> <87mru5et6r.ffs@fw13>
 <apIrwRYJbPpmjrNo@tardis.local>
Date: Sat, 29 Aug 2026 22:44:28 +0200
Message-ID: <87h5kcejwz.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Aug 28 2026 at 17:45, Boqun Feng wrote:
> On Sat, Aug 29, 2026 at 01:11:56AM +0200, Thomas Gleixner wrote:
>> +static __always_inline void __raw_local_irq_restore(unsigned long cnt)
>> +{
>> +	debug_assert((preempt_count() & HARDIRQ_DISABLE_MASK) == (cnt + HARDIRQ_DISABLE_OFFSET));
>> +
>> +	if (!(__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET) & HARDIRQ_DISABLE_MASK))
>> +		arch_local_irq_enable();
>> +}
>> +
>
> So we can change the semantics of local_irq_disable(),
> local_irq_enable(), local_irq_save()  and local_irq_restore()? Nice!
> local_irq_{en,dis}able() are no longer idempotent, and
> local_irq_{save,restore}() have to pair with each other or a
> local_irq_{en,dis}able(). This would make things much easier. And TBH, I
> never think this is an option because there could be so much code not
> obeying this (at least not on day 1). Now I see your point on getting
> the design correct at the first place :D

Compared to the insanities I had to handle almost 20 years ago when I
tried that this has become much easier because lockdep and RT made quite
some of the nastier lock/local_irq games go away.

There are probably a few other places in cpu idle drivers or in dark
half maintained driver implementations which might need some care, but I
expect the overall fallout to be managable. The debug mechanisms should
help to identify them quickly.

