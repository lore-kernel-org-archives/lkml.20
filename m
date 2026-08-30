Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72081233722;
	Sun, 30 Aug 2026 20:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788120076; cv=none; b=LodWWr0KElCWU2lxc7VVkuZd7ZoubvM8/1LraZae0dGhNktc3Kmm6iPZh2s51kCacRqMFdDvYkwrl3OT0OMktI0Hj6nDLY+c5xAyvZK/Ks/zOSftB1rosUSmIlhKLE4g/1kWPggDVNdO/Rs9b/bfnnkXNvybb7AIVjXLPidC/Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788120076; c=relaxed/simple;
	bh=m790/+34OSFHJ43MFw4WGmQgLF8QFIab8sMzO7DIkzs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sA/kVymwUAx6XZ6oR7setzmTQSfPszjN/AVFOYcwEDnjM35bhUbgFyWI1yqxk7XzBnLAPb9No8ZTn2cP6maV1ZQ7vjvn8U/5D0ZC9SMFHVTdquEpPBWCoGb1xQpPEMprx2/vK7EhfZZb9zAFN9RSpPr6uhWxSVIm6qYWi16m/nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQTo9AY9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQTo9AY9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610BF1F000E9;
	Sun, 30 Aug 2026 20:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788120075;
	bh=0Eb9cGy1Aq5SEyDjvPAhW64h5ki2JOUuTztQZCGPaB4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WQTo9AY9elAF7Uzw6rtKCD3skGS/TX1myzxN+cr2K9PIMiF5mTVxr+QXGsDVReUhv
	 wNQIhINq4CBkyVaHaIGIAPzsJqk9vCS3l3Qd9lVAUZ8tt9GTtUWmAsStjmz4UgF9yE
	 xcFNT4gGOuaLAdF+PZTC6qtAFzsgKF0LSJ4jEYgC5tnhN9hQxc6jSLngYUBleJQSgw
	 6G/96Xroyi52zNWef/o3ABuRFruqWFzqwFLE8RwmNtX7ad3J1daQzKrldInAbJL0D2
	 kL/Azm0WWDSCA7ylBbECdcdmFiCJNBlecIHhEjwC9gaIHewWjiaSenD5SSVcrEcOHY
	 Y5TKuyynTWbxg==
From: Thomas Gleixner <tglx@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
In-Reply-To: <apNtQWqOgwF5_Ctq@tardis.local>
References: <877bldhkmq.ffs@fw13> <ao4lO7U7L-7Zice1@tardis.local>
 <87v78wezid.ffs@fw13> <apA4M7Asz0mV9uaw@tardis.local>
 <87jypbfu1t.ffs@fw13> <apBrZuxU8bmCgG8h@tardis.local>
 <87bjanfmzz.ffs@fw13> <apCS3T63WUxHd1GH@tardis.local>
 <87wltbdvmd.ffs@fw13> <87mru5et6r.ffs@fw13>
 <apNtQWqOgwF5_Ctq@tardis.local>
Date: Sun, 30 Aug 2026 22:01:12 +0200
Message-ID: <87se3vcr93.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Aug 29 2026 at 16:37, Boqun Feng wrote:
> On Sat, Aug 29, 2026 at 01:11:56AM +0200, Thomas Gleixner wrote:
>> +static __always_inline void __raw_local_irq_restore(unsigned long cnt)
>> +{
>> +	debug_assert((preempt_count() & HARDIRQ_DISABLE_MASK) == (cnt + HARDIRQ_DISABLE_OFFSET));
>> +
>> +	if (!(__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET) & HARDIRQ_DISABLE_MASK))
>> +		arch_local_irq_enable();
>> +}
>
> And while we are at, we can just introduce a
> raw_local_irq_restore_auto() (definitely needs a better name), which
> doesn't need a cnt:
>
> static __always_inline void __raw_local_irq_restore_auto(void)
> {
> 	debug_assert((preempt_count() & HARDIRQ_DISABLE_MASK));
>
> 	if (!(__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET) & HARDIRQ_DISABLE_MASK))
> 		arch_local_irq_enable();
> }

Yes, we can add something like this once we got the design and the debug
infrastructure in place. For now the count is helpful to debug stuff and
we want to have something equivalent at least for lockdep builds.

Thanks,

        tglx

