Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111946;
	b=TxMEnlDTKNtJTGAjRDPBTgtFrSVDeQ/3ksOCw1zgZJP+HJlWzFD7EVpXwKoMh74rPn90
	 HVMH3egBkD2Hb7j8Ii07G4Y3UwzdthDf0qPb/uZQcLJHh/gIAHoLHNrBoVGNcdQvaH3OR
	 uvToax7rIqAod0x4SgA+UU/PFfVmpWnkrbZ0mN1GXCo8VOC1gvxaOUrCn10GnCTVQBAu8
	 IO8nJrtEvkADhok3BBPrAVN7+cTJjrLzleMxdR4tM4ezlV/kmSIO7ONTLo2xwfkkZAHge
	 xBWMXFe9SGnc2VUFFUasZNS5KeEx7i3h3zNhFxL06/RdfQY9Q8BOrFjsNmBQBYERJ7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111946;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=oxYYXzuA+KjDDtWBG7XEQK2PA3jUu3Ip09CfAk+HxQw=;
	b=irg7ci3t7gSSmUh0J/KV9ox0dH/R0YnDQAPpZCTr8SkQJPWlYt9yXmJYy5wuaOZ9nvNC
	 1EVNhy9RPqMvO0PRlL7F+eCZBwkgyANzX/8esF0twMQ5DM7nRbHHzyotZNhmubfQcroMx
	 lXVWvHgDkrkGX7sgu7rgpI6PYpXmRQE9CA9aDls+4Z4oPPQ4h+fGoGIEyGnNV0vzWtp/l
	 gfvN1M5Wlon/wQFzAItxgb8etrKvjG4LcEvC33G7j7+sJG9LEgez5opnZ7P2JnOMv2ISl
	 NZPbivE30tzpbt+HCULzdArUq3h6LnDYr73ibnoQuzkkN/dbn038nwTD96tR434BFeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Tuu0f2NG;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD75606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBD75606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Tuu0f2NG
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E33B515A1;
	Tue, 27 Oct 2026 07:39:01 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B347E3F7B4;
	Tue, 27 Oct 2026 07:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793111945; bh=n8NvRega0eGpWWLCqhMnQOQTEFhQaD4mJqw4M2cZC0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tuu0f2NGiSDtPpXzfxeF+d4TpQ+fcWm20gBIEXsO0TrAwfwSpBAajHfZIBBXglDR9
	 sCtiuyFp1Yw2vQ0AHV85TbuVm/Lcg5uEOpJs3qWEwOQjdq4hNf9gJ4qCyyivsfuhmO
	 SZCZG941AeMqFBwQdBA+pZDN7BbJlYuVgXupkXt8=
Date: Tue, 27 Oct 2026 14:39:00 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: idreg-override: Use property length in
 get_bootargs_cmdline()
Message-ID: <auC3hPZEu7zUPXoe@arm.com>
References: <20261015192810.395975-2-blum@kernel.org>
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
In-Reply-To: <20261015192810.395975-2-blum@kernel.org>

On Thu, Oct 15, 2026 at 09:28:08PM +0200, Thorsten Blum wrote:
> fdt_getprop() already provides the length of the bootargs property. Use
> it to reject a zero-length property before dereferencing it, and test
> the first byte directly instead of calling strlen().
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/arm64/kernel/pi/idreg-override.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> index acaf56234973..588c8af2a567 100644
> --- a/arch/arm64/kernel/pi/idreg-override.c
> +++ b/arch/arm64/kernel/pi/idreg-override.c
> @@ -383,15 +383,17 @@ static __init const u8 *get_bootargs_cmdline(const void *fdt, int node)
>  {
>  	static char const bootargs[] __initconst = "bootargs";
>  	const u8 *prop;
> +	int len;
>  
>  	if (node < 0)
>  		return NULL;
>  
> -	prop = fdt_getprop(fdt, node, bootargs, NULL);
> -	if (!prop)
> +	prop = fdt_getprop(fdt, node, bootargs, &len);
> +	/* No bootargs for a missing, zero-length, or empty-string property. */
> +	if (!prop || !len || !*prop)
>  		return NULL;
>  
> -	return strlen(prop) ? prop : NULL;
> +	return prop;

I think the patch makes sense. In theory we may have a value-less
bootargs property and prop points to the next token (or some
FDT_END_NODE) but they would all have 0 as the first byte, so the
strlen() check would catch it. Anyway, the above is clearer, so:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
