Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE0A3A451F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267907; cv=none; b=OnzFaf/pJzPKFfCEX87IbOQ7sYI5KYB1hq/8MOYdOrMOtQ/D//aqX3hihb86HLg9R0fJ0+VFWtAEIkRWyBtq1ECi3CUNsavaIL8XVhP+29vXr9hYWdKwADLvuSZycHvdHt+ZF+Ih+i4+nL18i2u70P92ska0tenDaNJxyVdahBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267907; c=relaxed/simple;
	bh=smqjNR8VuLd2AbUFg8bxtZgZ1Vdq10zG2Sx0lGb7VFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swIxAIyQMRPvzgTC4N9mhQVLBRw6VLf4cD/3vKuqVkZDexcVZo8F9Q4nTV7FDHa7De+GVn3sQAUqoCiOTI3c2156AATb6ZpnAhi/tOro8tLgiCEFc/LlWNmQ5+PlKMgnAclvRVR2pHtRV/jMVsE7M9j/mXzeSjnIWUULxRIHTMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ay+MKnyd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gm5hUsvx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ay+MKnyd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gm5hUsvx"
Date: Tue, 1 Sep 2026 15:05:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788267903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4W42pFfXTNxJKH/Vw2Y+WhPSrIpKMxVHWvg3M2BMjY=;
	b=ay+MKnyd25vfDaNxuteY92fe39DMF/LAHBm+10mCiR0RXOLKTp4e44ArmTVxq2Ne4Nvzir
	8oNb+3I0UJBYYYdujBXK2xhvPmtXg0Xk9XV+Gfx3bMl7qPMbiTR+oWKoenwEn7mmBh+KDg
	wVIgCy4BC7ygGilCkE1kpWKB1nhFDWLcuRgDeIclHhJkmvdmG4FKl2OmT02jISrV7hIrI6
	VWRo+61NpV7FTXospdYuyrA23c0CuIloJ7bLKyc1/NtBqB6vUjyVZMpw8GvZTPBnxojXcb
	oPI2P35jIxJ0nqfYT0Wkxe0H8Cy0EVvzW8h0f7t1Qlp9ZeKHh4yAUSiELkjAKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788267903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4W42pFfXTNxJKH/Vw2Y+WhPSrIpKMxVHWvg3M2BMjY=;
	b=gm5hUsvxCzU/MnTGhQKuKURmT7j8rkLSKBRqyBFpi7AZLyl45XgE5450x0t97H7mQPmWbE
	UbAKng8jiomRBVDg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: David Laight <david.laight.linux@gmail.com>
Cc: Zhan Xusheng <zhanxusheng1024@gmail.com>, tglx@kernel.org, 
	luto@kernel.org, vincenzo.frascino@arm.com, linux-kernel@vger.kernel.org, 
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH v3 1/3] vdso/math64: Add and use __iter_div64_u64_rem()
Message-ID: <20260901145554-50c8a2b0-70fe-4c16-8a79-b6e1585386eb@linutronix.de>
References: <20260901020636.1821993-1-zhanxusheng@xiaomi.com>
 <20260901020636.1821993-2-zhanxusheng@xiaomi.com>
 <20260901102036-f5a7282d-4d8f-4f4a-89b3-7a75c83582c0@linutronix.de>
 <20260901134820.0c5b820b@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260901134820.0c5b820b@pumpkin>

On Tue, Sep 01, 2026 at 01:48:20PM +0100, David Laight wrote:
> On Tue, 1 Sep 2026 10:35:30 +0200
> Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de> wrote:
> > thanks for the new version. However please slow down a bit with sending new
> > revisions to give people time to respond.
> > 
> > On Tue, Sep 01, 2026 at 10:06:34AM +0800, Zhan Xusheng wrote:
> > > The vDSO basetimes for CLOCK_MONOTONIC and CLOCK_BOOTTIME are kept in the
> > > scaled nanoseconds of tkr_mono, so normalising them means dividing by
> > > NSEC_PER_SEC << shift, which does not fit the u32 divisor of
> > > __iter_div_u64_rem().
> > > 
> > > update_vdso_time_data() therefore open-codes the iterative division twice.
> > > Turning the loops into a plain modulo is not an option either, as the vDSO
> > > has no 64-bit division helpers on 32-bit.  
> > 
> > This is not vDSO userspace code, but on the kernel side.
> > The problem is that divisions are unnecessarily slow.
> 
> Until you get to (on x86) zen3 or cannon lake when they drop to ~15 clocks.
> (I think someone finally allocated a bit of silicon to integer divide.)

This code needs to work more or less everywhere, not only x86.

> > Also a module alone would not be enough, as we need the division result.
> 
> Isn't the divisor constant? (or rather a constant shifted left some).
> In that case you can do a 'multiply by reciprocal'.
> The simple 'multiply an shift right 32' will give slightly low quotient.
> But you need to calculate the remainder - so can fixup the overlarge
> remainder it can generate.

> Of course, even that is only worthwhile if the quotient is more than
> (a guess) 4.

It never is. As per patch 2:

monotonic_to_aux.tv_nsec is a normalised timespec64 fraction, so it stays
below NSEC_PER_SEC even for a negative offset, and the sum stays below
2 * (NSEC_PER_SEC << shift).

The same is true for the users in this patch.


Thomas
