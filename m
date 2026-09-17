Received: from mta0.migadu.com (out-144.mta0.migadu.com [91.218.175.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6EA547056
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789670605; cv=none; b=KaA5Xs+hUsqT1q82VMKqq2HxJ9zeE8gJVPwD+/fH3CMuMFUTwveFjSIkP7bFTyOpZ4NxIRa9KsLwd7H92/PnaPIHWYKbAtuvzQ9Z0b5FJSqEellcMhjBwSaMmT2gfLW9oSmk6jfGlYyr2NF2HfodpveMPsH4uGZwAsaqQHjYTks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789670605; c=relaxed/simple;
	bh=dddSXRxdIdu49NHzZiLViRMhRwi+PNMj8+As+AEkJag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUpXEK7mj2zNGdWsONF+iK+jHti7vkWqMmAaqHCibJlTPc25aRq9eKpQiE3ixg35ZL+Y5ANP9JYYe3+1I3vyMfwUrxPrzPA1pUgZZ34EgmlbYxAdzmUa/s3xROTTXI+CQSUsiOTL8x2keAx9Xu21cQHu7XWaAh0xKChQCwCL6TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TbclyN/Z; arc=none smtp.client-ip=91.218.175.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TbclyN/Z"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dddSXRxdIdu49NHzZiLViRMhRwi+PNMj8+As+AEkJag=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789670600; v=1; x=1790275400;
 b=TbclyN/ZVuG+rU+4xjm75+piq9TJqCokLY/I9maxgGVgt1b0d02dbe3aecqderwMQxnMCF4e
 BIP9aDx4SxXpWXx+fALzWVvwEI0rAHZLp0T8W7rxGIrX3ePOBGCwzzr1IJsJ+ITRnI0E+6TywSm
 Z+40JyM+wKYISNLCILuPmlHY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id df3bf85f09abc0d3;
	Thu, 17 Sep 2026 18:43:20 +0000
X-Mizu-Trace-ID: df3bf85f09abc0d3
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso1671e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:43:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxoS9f1VwosjVgW39fgBxmT/iwcSgy7r5u8kdFD1OupISvMeyR+bD30e+DyxI/HCMwtaG7i5KdB3s/fb1g=@vger.kernel.org
X-Gm-Message-State: AFuF++nLYQuOI0OkB0q1AEpC7+24nVNN5SYctKImAaTCJO9jtjFHgRyl
	7yH1bX8MBHPi1V2jxy7hYpuCaU1uqPFLtJmS6LMhn8r8BE5UlbAUlzh16vrPtklpK8b9zKCLLUt
	mV6b+P1CU0Ld4LxDcvop21+aVsUH44qw+T7FRH0Mq
X-Received: by 2002:a05:6512:2241:b0:5ae:b918:79d5 with SMTP id
 2adb3069b0e04-5b8c1021042mr20644e87.2.1789670599138; Thu, 17 Sep 2026
 11:43:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-16-fuad.tabba@linux.dev>
 <86a4ph5fb9.wl-maz@kernel.org> <CA+EHjTzCQkeXQQcCDwABLR2w+NTmKTG3V6RSmhzYNayaoYXw3g@mail.gmail.com>
 <865x045mke.wl-maz@kernel.org>
In-Reply-To: <865x045mke.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 17 Sep 2026 19:42:42 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx1rGTZ-8Knj_JJJJtcUhU1o3Qmw8gr=iNkWEgX7Lv6vA@mail.gmail.com>
X-Gm-Features: AcwNN1W2zdyru-EwkMeGvOAl12MsTWv2Fg6M62Lipeq-f3z_dccz0p-vzgpTsTw
Message-ID: <CA+EHjTx1rGTZ-8Knj_JJJJtcUhU1o3Qmw8gr=iNkWEgX7Lv6vA@mail.gmail.com>
Subject: Re: [PATCH v3 15/18] KVM: arm64: Reject host access to protected VM
 private state
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, vdonnefort@google.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Thu, 17 Sept 2026 at 09:06, Marc Zyngier <maz@kernel.org> wrote:
[...]
> News flash, this is not x86, nor s390. I don't feel constrained by
> other architecture, and we deviate *everywhere* already.

Not x86 nor s390: and I'm grateful for that every day :P

[...]
> A protected-aware VMM already knows it cannot obtain the registers.
>
> I don't want to have to revisit the userspace interface once you have
> to relax it, because I know for sure that you will have to.

What the error buys is that a read outside what EL2 copies out fails
rather than returning the copy, which is what a register dump would
otherwise print. But then how would the VMM know, once EL2 starts
copying more out on an exit it already gets, that those registers are
now the guest's? A cap is all I can think of, but I may well be
missing something. With the error, the relaxation is a window on that
exit for the registers EL2 copies out, and a read that succeeds there
returns something EL2 copied out.

> As far as LD64B is concerned, there is no place to copy anything in
> the run structure, and the relaxation would require to cover all the
> GPRs, ESR, and FAR. At this stage, returning whatever is there is the
> correct thing to do IMO.

For a protected VM the operands would go through fixed registers, the
way x0 carries the MMIO data today, so the window on that exit is
those registers rather than all the GPRs.

Hoping this one doesn't return -EPERM :)

Cheers,
/fuad
