Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356090;
	b=19yv/eSBXAqgBl0OvIiOxaF4zU9mXppwzm2O5qYTZuNFIGo58ZvQrxNPA2d0rm0Y6STc
	 nOi6aDcBu4wSFk2zw1yEzMupXG0vhf1n1DHjsyH3RBm9yCoXv4IDc4OQaB5ZfVO24u7wL
	 Egsgh5JPBbydfVsbyBrilIFIDEDlTrcQr3uBnF4G5Et0uCEQnGS4Q31LrxXqn93ho2Mo0
	 UE5M9/8iCdhvYpyaKiNIU4wggyDlfa1UEAcpmLZaRqgarvsbuufRivd4lYPxrHlKM3Q/l
	 qxlkPQ6SLnecHM3Mx4dE5p0BYTwH4hzdzG+j+WOcbm6sGKQ1xhDC+EYBuhDNiyE0VlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356090;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wPmH0exl60o0i/rkyexMG4I50dKwLyjpyUdCUkH8L4k=;
	b=YgeoJtzx10YJqqPgV+fEwl6VhNh8Nq5xnB6lUB8RfFXjIsqgEnbF+kaExzCLbUr7GDjC
	 gZGgxOervE9DSIrXmCw2JBjIIvVbEOzFRsfKyzM9NQpQyviQl4DBcKTOqhBlY4AjOyzo9
	 C1XVl+rMD5WufOr1ZZ9f/SbK9sqp8Z3Vk1vp2mvRCC98zLFD5VJxgQOLI5funNVkFKxXe
	 U3pThoxHcIBcNe4qLH5eqPUj0wdGUgWZID8GV6tQYVTy32exUG3Uts+qCZVtGetJDJf2h
	 EBMhd1TnNWYz0wza6JiUl9xy0hignUrh87EZqkNUAUD9NlNRnyM/Q8hT7i9KX+KvMpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h6k7JA0p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A116260A262C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h6k7JA0p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C7C1F00A1E;
	Fri, 30 Oct 2026 10:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356090;
	bh=wPmH0exl60o0i/rkyexMG4I50dKwLyjpyUdCUkH8L4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h6k7JA0pKS6CDdHgjoc3P3z386lmR8880hX/v7FV9uv4B9veUSkWvVTM3/TSWxgF+
	 5hk3NN14Bn9VUvpbHgM22PW++wzmw6biqd5K+lPDB4ZGiXQFodN9a9KVBMc6aG7Jj8
	 M/g5Epxtvzd1cYH9r6ni+Qi/WW7JXfu4sR5huhvQAjrHQO9D6z7tOpIoPzbQd3QMQO
	 w5Zu6ueogKLQFadBsdAeb9QkeXqAGZ8fO8vaXqNug86NJLDtMdAeYPEhspSfHGafoo
	 UHmqN/IJOW9YMXHcP8V9Ck0Tzl4Yta/5C8FJqmTmJd9aikf86txlHskizJteLlb1tN
	 0LeB7F0xSbBrw==
Date: Fri, 30 Oct 2026 10:28:04 +0000
From: Will Deacon <will@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kas@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: Kconfig: Don't select CPUMASK_OFFSTACK with 64K
 pages
Message-ID: <auRxNDAe_tv-mCvk@willie-the-truck>
References: <20261007-arm_stack-v1-1-b48dad5fa8b2@debian.org>
 <auCSG2OmNMQKp3dq@gmail.com>
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
In-Reply-To: <auCSG2OmNMQKp3dq@gmail.com>

On Tue, Oct 27, 2026 at 04:59:52AM -0700, Breno Leitao wrote:
> On Wed, Oct 07, 2026 at 12:58:16AM -0700, Breno Leitao wrote:
> > arm64 selects CPUMASK_OFFSTACK when NR_CPUS is above 256, which keeps
> > cpumask_var_t off the kernel stack. With 64K pages the kernel stack is
> > 64K as well, we have enough room to keep cpumask on the stack, avoiding
> > extra alocation and possible performance penalties.
> > 
> > Skip the select when ARM64_64K_PAGES is set. A 64K kernel can then raise
> > NR_CPUS above 256 and keep cpumask_var_t as an inline array. 4K and 16K
> > page kernels are unchanged.
> > 
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > ---
> > Based on Will presentation at LPC, I've decided to have a look at Meta's
> > stack usage, and I found that this might be an small optimization!?
> > ---
> >  arch/arm64/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 5f2db2cecf9772..b73371327d2a47 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -111,7 +111,7 @@ config ARM64
> >  	select CLONE_BACKWARDS
> >  	select COMMON_CLK
> >  	select CPU_PM if (SUSPEND || CPU_IDLE)
> > -	select CPUMASK_OFFSTACK if NR_CPUS > 256
> > +	select CPUMASK_OFFSTACK if NR_CPUS > 256 && !ARM64_64K_PAGES
> 
> Does this one sound sane?

It doesn't make an awful lot of sense to me, to be honest. The page size
and the number of CPUs are two independent variables, so tying them
together like this looks a little odd.

Will
