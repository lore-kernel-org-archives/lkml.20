Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B3C3F106C;
	Sat, 29 Aug 2026 19:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788033127; cv=none; b=VlPfcmmtMARi7WLaeeNp95FqyqlAS8QrOdqQjZNhjMouuZQrD0j4JCuaebJZvnSkgUTkiKkK5/L7RNHfo2RH70DUzg8IERgxQjyL4xW1kWxoBLpyKMECJgNx8KpTYZMI2sNPbsaiohOwxqsaXoKRF3nK5lFuYqDDm9GILDfNljA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788033127; c=relaxed/simple;
	bh=84mWMwys25NkrVVkkBh8nVcwb7QL3fXfYe780gW3kLc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tzkuPEBct4ARU0igby+vb+bxk6yX+c4Pfj52Ahy5RtG0EzKJvsyPDkBCV1a38duWzuw6dlNUxvG3hvHWaOmUED2suDy/rqngQYNzBAkSnVUihDL1X8WaxGqoeuXqsg4cXsPH4xWHwCnC8KybBf6lyAAUwc+FQ75OA0jhAa2pzAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxs9peEj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxs9peEj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38251F000E9;
	Sat, 29 Aug 2026 19:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788033126;
	bh=zWSqKBOqlO8cRhCLqDfh1YedTS0S8arPrNvGWkzxgCc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=nxs9peEjDR+8oclWiHYOm/pyX94EjKs95fZOWbkCTl25eajlyZfZiib4gDLOJBlo5
	 UmxIiKVKN6qFfiOgV+2Trup6M4Hlwe446R+tapfVhtuUujEn6XYspirwMYtjcpsgPx
	 5OR9imKQG5fLiCbmI1K+7JvyIa9qWbagjUSIct1NoDGhYjrk2TKEO/5ghZ1wNvad+p
	 g7RwcjqlsU/YdSDXKV7IfLgsFjwae9P3pyuLYFsTUMtzDwFnoOtrIXgdr0tpzsXw//
	 hlCvnWH49A9BNR2InfdS4YKmOry6Vt5qSevssYQB/JYwOBSFpoiaOt+Xmid4Jatrgm
	 vXExZuUcMh1hA==
From: Thomas Gleixner <tglx@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
In-Reply-To: <20260829080503.GX776954@noisy.programming.kicks-ass.net>
References: <877bldhkmq.ffs@fw13> <ao4lO7U7L-7Zice1@tardis.local>
 <87v78wezid.ffs@fw13> <apA4M7Asz0mV9uaw@tardis.local>
 <87jypbfu1t.ffs@fw13> <apBrZuxU8bmCgG8h@tardis.local>
 <87bjanfmzz.ffs@fw13> <apCS3T63WUxHd1GH@tardis.local>
 <87wltbdvmd.ffs@fw13> <87mru5et6r.ffs@fw13>
 <20260829080503.GX776954@noisy.programming.kicks-ass.net>
Date: Sat, 29 Aug 2026 21:52:03 +0200
Message-ID: <87jyp8emcc.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Aug 29 2026 at 10:05, Peter Zijlstra wrote:
> On Sat, Aug 29, 2026 at 01:11:56AM +0200, Thomas Gleixner wrote:
>> diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
>> index 57b074e0cfbb..dd55786768d1 100644
>> --- a/include/linux/irqflags.h
>> +++ b/include/linux/irqflags.h
>
>> +static __always_inline void raw_force_local_irq_disable(void)
>> +{
>> +	arch_local_irq_disable();
>> +	__preempt_count_add(HARDIRQ_DISABLE_OFFSET);
>> +}
>
> So this thing is on all sorts of don't care, we're going down paths. It
> needs to ensure IRQs really are off, and preempt_count has at least one
> DISABLE_OFFSET on.
>
> *However* if something like acpi_power_off() were to 'fail' to enter S5
> and continue on with the notifier, things are now unbalanced. Probably
> not a problem, since the next handler will likely do
> raw_force_load_irq_disable() again.
>
> At the least this wants a comment I suppose.

Right. That stuff needs some eyeballs.

>> diff --git a/init/main.c b/init/main.c
>> index 2613d3f9b3ce..fa84ce260b04 100644
>> --- a/init/main.c
>> +++ b/init/main.c
>> @@ -991,7 +991,6 @@ void start_kernel(void)
>>  
>>  	cgroup_init_early();
>>  
>> -	local_irq_disable();
>>  	early_boot_irqs_disabled = true;
>
> If we want to preserve the paranoia of having that statement in the
> first place, it could be replaced with something like:
>
> 	WARN_ON_ONCE(!irqs_disabled());

Right.

> I suppose (lockdep isn't available yet).

Good question.

