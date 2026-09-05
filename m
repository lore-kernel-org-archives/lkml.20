Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953414E80CD
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788635554; cv=none; b=Xs4iY2hpEuAB+jZMqySbGJT1484paXKZYeeLqlYbrT18ntkkyxZ53XCl9mOUHkboFCkcPLKSVyxkROdfJoNZMi+mQux9HFZlYgozQWisrvyCthwWs1CEz8Fwmfj0r1EtzjejVnFHs3hyde/7ILSJEXbpvkyMjTj+sQLrSyh8CHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788635554; c=relaxed/simple;
	bh=z0q5TIu2G3Wp5Ua0hrR//OMcJ9YTy67DSebxwb5HKhY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sTZvpcV8psdwfH2A+ArUD0wYXPfQQne4kRZHG5P+f3Z2+t4KUotjbLEJjEaowwNw2pTZA+JE8njEm9GxuNMAwd1Y3Xd5IlImL85V6U2Bm195noJbdX0d37IXmfGQvuaXuWDvti2Tj6Ic6sfnYyWubtE8enEtkTgjybE3Y3SYB/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrRPbcCh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrRPbcCh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630E71F00A3A;
	Sat,  5 Sep 2026 19:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788635553;
	bh=DgM7t7aU9HoxT1zgrcobYLNr/3Hfp6O28W3X/HOLvq4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=lrRPbcChpZDisearlYxLLpLQy7Vj2LXH32xksA/4PmuDjb6lj0SheNhsIJssq0RAD
	 vvGn2G+IF915hHxTrFceJv3gISpcIf5xC7+yiJ8oNAPQ5nhuWarNiOvrbe7nE1e0Em
	 MZm6zPlREPidoH3bV4ObZWVQ1i6uHl4OatAJjq8xebA1TryNpmil+dD6IY9Kz6GaV1
	 bK+a24dzjwZZs3aQZDNOB067M/AGYnPhFcG3qV5aG0LzpkY/A0jlob2I2rl8VRMlJj
	 VtcXuUxzBvvN248QlXFjSWeDumLh0NW5pBq24FtOMR9VU+kB4VJmmtrTOHJH5tzgk+
	 oB7+0QPzJ4+dw==
From: Thomas Gleixner <tglx@kernel.org>
To: Nam Cao <namcao@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, Anup Patel
 <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>
Subject: Re: Interrupt chip driver maintainence
In-Reply-To: <87ld9g9zrt.fsf@yellow.woof>
References: <871pb9841j.ffs@fw13> <87ld9g9zrt.fsf@yellow.woof>
Date: Sat, 05 Sep 2026 21:12:30 +0200
Message-ID: <87fqzn5x7l.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Nam!

On Sat, Sep 05 2026 at 04:51, Nam Cao wrote:
> Thomas Gleixner <tglx@kernel.org> writes:
>> I'm wading through my inbox full of patches for interrupt chip drivers
>> and I'm thoroughly annoyed. The way how this works today is not
>> sustainable.
>>
>> Patches end up in my and Radu's inbox and all we can do is go through
>> them mostly on a formal basis, but it's out of our scope to look at the
>> correctness vs. a particular hardware. In the past I just picked up
>> patches when I had the gut feeling they are remotely correct, but I'm
>> tired of this.
>
> I have hardware to test the SiFive PLIC. I also spent quite some time
> staring at the specification attempting to cleanse the mess we have for
> plic_irq_eoi() (which sadly yielded nothing).
>
> I can help looking at patches. Would that help moving things forward?

Help is always welcome.

But the point is that the companies who build and sell that stuff have
the responsibility to take care of it and not just dump their crap into
the kernel and then expect that someone else will take care of it for
free.

If SiFive pays you or your employer to provide that service that's fine,
but you doing it on your on [dt]ime to proliferate the carelessness of
those who profit from it is just wrong.

Thanks,

        tglx
