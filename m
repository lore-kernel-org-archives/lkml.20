Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3A93D9523;
	Mon, 31 Aug 2026 10:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170575; cv=none; b=YE4vsWDB+qi8V+uc/W0JvbZtvUnQhr1Vdga1CI9ts5CC+PnmJG07agCXyXPPyPfgBBwY6SUSVl08Cir3vwOggNLEKAd9RcORANy5kRUPlDkr4BX3o2+4QjgYdS99oOWlu4TkprMYLEzxqXmWxZLN5zTAqTubJ4Sk4cwmOQtpQ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170575; c=relaxed/simple;
	bh=RaszuV5GnURges63jK0cwrgp5yAvLCc2ZVUAuh2DXAo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dQABKIaKfw5hMUuVbnn8+E1hmBFZmtPOWXbIiv9nRAo+UvSyLKRpjr3oUX2Nb3TVb3M7rqvNHzkWxrvoCKHYreXegTyPi0ZzI962pvTOPd6ZsXqI87j6Pe4DlPXmuWslppogk9SXpiljRT+eBPcsoXtPCLIOw4pTh2oS3rpPRMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lq9n4ZVl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lq9n4ZVl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2491F000E9;
	Mon, 31 Aug 2026 10:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788170574;
	bh=NJPrQXu554PSDHyhy9THdLsoBkuGigHfM9Xf1F93Kk8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=lq9n4ZVlTJBp2ML6Tpa4/oy8j4VA3ahGmzZf3+UsZUDFNQ4OPj7GC0CZBsaf1ciHs
	 1CJ2iDixX97Lgg+Jo0vR/XfE00aNOyK7b1LZ3m2d9Zgt22s+/F6O0F/0mKqs7JzQsf
	 LiRqoCS57MaOynNdcSmdg2xHLKMKItFC+Pk0eGbkPwk6m+jcxpI3QQE1qcUP8TKV8p
	 zj1aSMw+VykIFkHMqC/FiBNd6hiaarf4763U1/v77VbyGAo5+Sp8nuJO96gbob+zA1
	 F0f5aUpuZYWB6bbNHZNbwTmQ8gLh9UK+l65OZ4vkCp6KumJm5uHP1fFcK7M0zvla6o
	 cm0Km2GxKLZvQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] locking: Revert switching guards to
 _irq_{disable,enable}()
In-Reply-To: <apSfObo_6Ji5HA7E@tardis.local>
References: <apA4M7Asz0mV9uaw@tardis.local> <87jypbfu1t.ffs@fw13>
 <apBrZuxU8bmCgG8h@tardis.local> <87bjanfmzz.ffs@fw13>
 <apCS3T63WUxHd1GH@tardis.local> <87wltbdvmd.ffs@fw13>
 <87mru5et6r.ffs@fw13> <apNtQWqOgwF5_Ctq@tardis.local>
 <apRJzVbMl-hj-otX@tardis.local> <87v78rcrf9.ffs@fw13>
 <apSfObo_6Ji5HA7E@tardis.local>
Date: Mon, 31 Aug 2026 12:02:50 +0200
Message-ID: <87jyp6d2ut.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Aug 30 2026 at 14:23, Boqun Feng wrote:
> On Sun, Aug 30, 2026 at 09:57:30PM +0200, Thomas Gleixner wrote:
>> The actual PREEMPT_COUNT_IRQFLAGS thing will be 7.4 material obviously
>> and as this is confined to Rust then it's trivial enough to work around
>> it locally without exposing more stuff. See tiny delta patch below.
>> 
>> So the only side effect of that is that the Rust implementation will not
>> be fully integrated into the preempt count magic, but it should just
>> work, no?
>> 
>
> Right, that works. It's similar to the "alternatively" approach I
> mentioned here [1].

But thinking more about it. It actually just works with the preempt
count bits independent of PREEMPT_COUNT_IRQFLAGS.

For PREEMPT_COUNT_IRQFLAGS=n, Rust is the only one using it.

For PREEMPT_COUNT_IRQFLAGS=y, the Rust part integrates with the core
implementation. And once all Rust supporting architectures are enabling
PREEMPT_COUNT_IRQFLAGS the Rust extra magic goes away.

No?

Thanks,

        tglx


