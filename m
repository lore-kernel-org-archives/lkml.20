Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357180;
	b=Vx9caiL1BL1eTILEPvBQvf4mBI8ZD0g5BtThNqUum2Q9vcIFYVp/BCY6b7PrTCjr1+KU
	 /CXfLOVkA2LQ3mWB3JOIZx91Rl7Rh6fR8VHNqPXfT8DjcR3Mv7su7KnpiaIPtotXzjRkv
	 joUWPzB6WtmxPKiwJlAX9/RJu7bkr2oLeu3MeVCyd+OHV6BuO4boSl+rB/4xutjXsBkGL
	 HOC0GjNn0Okc6c3dutcHi2erbhvhJJiHKnigUoszaxj1nIMBL721VQFUHaCb/jHlc5dGw
	 8vydd3Hde5khBcfILYOccecXXqLGF0obr6kQoAnsLyG50wHUIfu76dGGX1H3WmPC4Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357180;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=IeD1te9JsbH+posWGpI0LErcMqbnAyvM7nGUHinnYH0=;
	b=G33rZeQuFytrJPpO1/KVRHzsqxUyGh+d6YbU2qzaU0yAq8p8SkrE3Ij35Sxt5uqmPuJC
	 aX5VjTGBtKaG/z+utxkiVPYwoYLs+GoZApeWQNJGGtR+MhmvN2K7gR8UxRdzJDiagMk0I
	 8LyfhL7Pmw7PtUf1UbDm1mw+dpAc7xOjkLMobGN+zAdmBtDh2TlEsXJ7wP816W9gwniOV
	 D3o0vnZZXpTPOv4rP/pXH2itd2Xv61GS6ioK0fAuy2f2VQsI72F7GLZjU7Yrq2oZX6/kZ
	 QZUWJ+fo+jdbSKu/hIDdCvef3nCyV9oarKQFuS1bSdn3T0V5Mt4pTlijzLSJuswrKUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b="eK/PHqrz";
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAE760A262F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EAE760A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=eK/PHqrz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IeD1te9JsbH+posWGpI0LErcMqbnAyvM7nGUHinnYH0=; b=eK/PHqrzkjQgVhbCMJPf1MeeGP
	X60Lmy8PWAQRAbb17GHHu0O7T30Vq6rwR5XXwd1Hw3H/Ev8Op7HtK8y1ynZ7m3lVm2fmrkVQTIC/9
	91977gFeLDZez9UOidNBfxfTuDrGB70Q85lW4Ge/O3U03TFIDVImJhV5hZQBc3q26OvnDiHawlLvR
	iyNhQXRTl5RpFZDM2oUP3xGrvW0NKkv+XjLnhlEQ2NQb54WKEwyAaPcGaSCFp4Qv3TQbesi8v1Qky
	0M4T4JRXF74eoOgiFWdSSqQ0nkBR/t1815/UkL44k8CQroIqShI+yWe69duoTSa/xnDPoioJXGffw
	WxJeQRFQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMk7b-003lNW-2O;
	Fri, 30 Oct 2026 10:46:07 +0000
Date: Fri, 30 Oct 2026 03:46:03 -0700
From: Breno Leitao <leitao@debian.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kas@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: Kconfig: Don't select CPUMASK_OFFSTACK with 64K
 pages
Message-ID: <auR0kSCYyo31Inxf@gmail.com>
References: <20261007-arm_stack-v1-1-b48dad5fa8b2@debian.org>
 <auCSG2OmNMQKp3dq@gmail.com>
 <auRxNDAe_tv-mCvk@willie-the-truck>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auRxNDAe_tv-mCvk@willie-the-truck>
X-Debian-User: leitao

Hello Will,

On Fri, Oct 30, 2026 at 10:28:04AM +0000, Will Deacon wrote:
> On Tue, Oct 27, 2026 at 04:59:52AM -0700, Breno Leitao wrote:
> > On Wed, Oct 07, 2026 at 12:58:16AM -0700, Breno Leitao wrote:
> > > arm64 selects CPUMASK_OFFSTACK when NR_CPUS is above 256, which keeps
> > > cpumask_var_t off the kernel stack. With 64K pages the kernel stack is
> > > 64K as well, we have enough room to keep cpumask on the stack, avoiding
> > > extra alocation and possible performance penalties.
> > > 
> > > Skip the select when ARM64_64K_PAGES is set. A 64K kernel can then raise
> > > NR_CPUS above 256 and keep cpumask_var_t as an inline array. 4K and 16K
> > > page kernels are unchanged.
> > > 
> > > Signed-off-by: Breno Leitao <leitao@debian.org>
> > > ---
> > > Based on Will presentation at LPC, I've decided to have a look at Meta's
> > > stack usage, and I found that this might be an small optimization!?
> > > ---
> > >  arch/arm64/Kconfig | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > index 5f2db2cecf9772..b73371327d2a47 100644
> > > --- a/arch/arm64/Kconfig
> > > +++ b/arch/arm64/Kconfig
> > > @@ -111,7 +111,7 @@ config ARM64
> > >  	select CLONE_BACKWARDS
> > >  	select COMMON_CLK
> > >  	select CPU_PM if (SUSPEND || CPU_IDLE)
> > > -	select CPUMASK_OFFSTACK if NR_CPUS > 256
> > > +	select CPUMASK_OFFSTACK if NR_CPUS > 256 && !ARM64_64K_PAGES
> > 
> > Does this one sound sane?
> 
> It doesn't make an awful lot of sense to me, to be honest. The page size
> and the number of CPUs are two independent variables, so tying them
> together like this looks a little odd.

Sure, but with 64K pages the kernel stack is _huge_. Why do we still
need to keep the cpumask off the stack frame in that case?
