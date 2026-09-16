Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E1D392C32;
	Wed, 16 Sep 2026 01:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789521669; cv=none; b=VCljW8lZ69pHfDvoKHrucn3oavfsqIAbydKZ4TgDcHuLWf1L9pnMDWRxqQo6NMEA3BH0Bb4R2Lj6hxWkALvdieyE43Awy4qXkL7vPcDy5+cBxk0j8IzTXZNF8idVJLxhHuu9DY/whzfQRkf6c0jjGcIiQoOz9bfy18leBDby27k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789521669; c=relaxed/simple;
	bh=1UBaKzUVsEr0WxpAtruTBKKwn+ntddLNTSmOFB8wQok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3VK9hQ7lJ2+Tz8sVY4KEkgqqxY3PtVVu4q5OkRqc8oixJeRVxzAZEQB6+N4K0p+wM5b2r2uGUtKWpX3vuL0U8wNIk6a9wTItZ6mJfX6MlVXckrmmGUfBzsuKdvjj48KISPwGhrh8+0EMJYzF7gM8P7cKn/RovZ/FIO0o92V6kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=dpvw2WJJ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="dpvw2WJJ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7171740E015B;
	Wed, 16 Sep 2026 01:21:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3m4E6WTpuOPC; Wed, 16 Sep 2026 01:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789521654; bh=bKJQIDsqZ5rL5b37AOsDJQpQ4Es2yzu120kfyXa63a4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dpvw2WJJycynN6u4TTzrudIuXymxBxoTelMOVXiNQF4tgFgRTS+k44dLLG4n0kYnB
	 EMwM7guPWk4vBuoJxWjlgWgGQ/+T1kRu1bruUWB0DFw2AxcgGXCkF1GohDBPR8Lotq
	 zoXrhXYmjTZs5XoRFQrJ+rFDgti+jgJcok7BmbhSu9KA+bBT3GfSze+fUBpsFbdGMs
	 iJnHpiIYMAzNUAthyYLucSRQyCYb87MMRgqvhlWxY3F16+627rk53iySS2XIFTvlTx
	 0nA+4hGY/1O5eOCLumgLW4HmA4vCIF1zzYr4/NI+lF5xwKbo01ZlNJGEui78B9sxfC
	 A53zuwc1VEpylpKOAjHxi1bCMZzMv3Jzs27lTLAt5SEOQwcRfYEPSL1SvRb3uaLPRQ
	 THcC2cUBNPbyF1tQzAoeYJ1IMDS4Rcxy9T4Lm4o+wVQg5NJWiZTreeIKvRfsb3q/Jr
	 JYVTc5lKIvmU8Ed3zIAwqNK8WEdLaMzfE/M7hnl6nXrNmfC7rRLbKxHlhTMJpDEwsW
	 ITIKhp71mJPZNvWvnibBkF4BZ/ry6iFqj/D8pxezztNYwpsB0TzanXFZxiun8hZwMh
	 LaBrSu647FJ5W2UAgQLWB1lPwYh9fJMvuzLbWtbFqmFalrmdTHlkRHJ4dLmR1xhKtB
	 PEywYZVzr2ahZrmhNtMnjZJg=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D2F4840E00B9;
	Wed, 16 Sep 2026 01:20:49 +0000 (UTC)
Date: Tue, 15 Sep 2026 18:20:46 -0700
From: Borislav Petkov <bp@alien8.de>
To: Tony Luck <tony.luck@intel.com>
Cc: Myeonghun Pak <mhun512@gmail.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] EDAC/e752x: Use managed PCI device enablement
Message-ID: <20260916012046.GDaqnu7sIhsWbtLCOG@fat_crate.local>
References: <20260915015519.83833-1-mhun512@gmail.com>
 <20260915015519.83833-2-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915015519.83833-2-mhun512@gmail.com>

This one too?

If no objections, I'd orphan them all and stop taking patches for them.

On Mon, Sep 14, 2026 at 09:55:17PM -0400, Myeonghun Pak wrote:
> e752x_init_one() enables the PCI device without balancing the enable
> reference on probe failure or removal. Use pcim_enable_device() so the
> PCI device is disabled after failed probing and after driver removal.
> 
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
> 
> Fixes: 806c35f5057a ("[PATCH] EDAC: drivers for AMD 76x and Intel E750x, E752x")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  drivers/edac/e752x_edac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/e752x_edac.c b/drivers/edac/e752x_edac.c
> --- a/drivers/edac/e752x_edac.c
> +++ b/drivers/edac/e752x_edac.c
> @@ -1387,7 +1387,7 @@ static int e752x_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	edac_dbg(0, "\n");
>  
>  	/* wake up and enable device */
> -	if (pci_enable_device(pdev) < 0)
> +	if (pcim_enable_device(pdev) < 0)
>  		return -EIO;
>  
>  	return e752x_probe1(pdev, ent->driver_data);

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
