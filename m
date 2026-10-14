Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2AC349CF0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791989127; cv=none; b=n8lgdU/s0mLIIl98dMZvDUvU4NezThJP5ikjxqZ3Q5GbGXyM5+KUzxT8uYVTKvwORa0VbOyPX7F6dOseW0gDgNShdTsefAHubfwg7SzUL1OvBghl04WXRva+VYvCaGI5HoYa7UZx+5Lo1AToxkW0gBzgnoxTRW8NcwIUyEbFiNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791989127; c=relaxed/simple;
	bh=Hdcxtxc7oxHmgU/85lcicWB1g727l/a7GBMxe6Grrt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sODlEbZFMnlmUX5bUqEqqn5UG4t40HIM4mqNy6Ms9n6sRzM3YAH3ksgb7FsnJyIEFBBInzvuwxIAhp5bzX2gJ+vmdVg/CezD4m0AeRham8KxJUJbDYghBF3q9DNmMSLHnGk+4azBUYn0rA5M+/MWlCNrgPWf6e6t13/Os8eecQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=GeCQVYxT; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="GeCQVYxT"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53397325663so3991511cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791989124; x=1792593924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pygkzeE34nESSLMFfA+HDZtxOSR6p+nlwLJRKufzmsA=;
        b=GeCQVYxTl7a6fUrUfAP/KoaogtY2DKJPFqi4y9asWZc56tzG0ryrovW++N3xhYFyEo
         qEpQj6koEBfTlyEPzD8Bf+0ZbzyjLNLyH8IQRwROjTmlkNP0alm4M6iUOJAIN2ITKC88
         4SLSb9HrBedRAaZ1RjBt9lN/+xOFS29GqDZVBybF0reN1fglqz+20F/GcdSLgagJwKxI
         IhZhCn67HPh62/ZOChK12sySoBTKmz7RzeQHh+jIRGPuHsJUB5YO2SGpl/IIk4ipxdHi
         yPbcanKjT2IDwnszdMSjKz5aXnbLHR8JgFPH/L43jHmLFfyDwQ1OC7vnLn2lOAW4oT/r
         xTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989124; x=1792593924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pygkzeE34nESSLMFfA+HDZtxOSR6p+nlwLJRKufzmsA=;
        b=J2CTY9FCYoLtsXB7HMo9LRe8ixKdphMB/bMN4xB+KBP0rUetFlv0+cmURB7LQy5cXh
         9IEIoFxnqZ2WXz3EiK21oJ4Daz1XG7jZbQIPa8gqzIRgX6vr20hOchKQsOL/bd5PaFNk
         fsGuvjI3aGHB1+66HQuI1CEC1aHBo0FkTY8zrHilSGkxvgn5nsD8XU9Je0Zs0TYN6UBr
         mFErokqBTyWyfXLLFuUwFuzWS4rQ2/6mERI1Ry2VQBAKS3gHQErepM/aG+XrKDfiCf6S
         0KlFAW4Rw+UhcqbhaLo7kjT+SUbWsbefyRVZI4dkey4uD0zaFHL89/gbL86gnDrklue5
         juxQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4RpDcNvBLM3gRIRtJW/YV0U0uMCdkNoVE/lgF6DKeSCK3/+8JKjOeHUjvnVyK23fsQ+mxBdvx8j6PdDM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7gyiuXPOybWijwIZaf7j+1ypmGkxch/lxjYDEW7sD73lR1LV/
	WeKb5fuoc8krbS8fTGrPH7ZwpqSg0CYfb+9ZmS71dXuQAeZSx2qgk28hryuoAKDDT9iNgEd+5Et
	HEDJPtg==
X-Gm-Gg: AYBFou26Dxv4HPwT6n3AgVtHZCE0JXBaRDwKFdlA4/pvmYUx5JeEKWANAGDnmGKVwxN
	tnxJKQPZEoOrlGp+8ZMVQj09Ied5+W3wAsg38wBZjLSngVqLvyMybLYX+dvhSayE4Lyt1bbMd69
	+jmxymLLAvtBB1E44DhVVpQbiOfEzHP41RXXtdFDNPqdw70KTm4BMBNvoqMUzSCUY6wanZt0YyJ
	jXIt01WA58lz9U8Cg4gEk3LUv1Xrx2gekovPN/nLYbW5Q/lShfLO1bB9o10cygvlkZjdiLyC7Jc
	X7M0TGWk9b58eIH5IIObyCUn3GqJ5LgC1UMTQKH/UAkDb35Fypw06W4rjqdbvSbcs8B5UiBtDt8
	pX6Bl8KYmHvR05PRGBGYOS60YUcZV5WiD3put8Q2G40SupkjptVOu+17h0XE1xECS8hHIvPasHx
	cQtTKee6x9o0kl/B2P9Kzv0pjfrp07Q7mF3FY7Hqg6U8qLORm/a/atCKQTiIk/zUVR/vFa6z3j7
	xUM3R5VxGC6ceBc/7OmJIO0UNo=
X-Received: by 2002:a05:622a:22a4:b0:533:33ed:c39d with SMTP id d75a77b69052e-5359f497f48mr235877821cf.7.1791989124279;
        Wed, 14 Oct 2026 07:45:24 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7e32cesm122425341cf.28.2026.10.14.07.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:45:23 -0700 (PDT)
Date: Wed, 14 Oct 2026 10:45:21 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-atmel: Use dev_dbg() for debug messages
Message-ID: <54704da1-1493-42bf-aedb-231d6d339c32@rowland.harvard.edu>
References: <20261014121656.1634-1-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014121656.1634-1-mihai.sain@microchip.com>

On Wed, Oct 14, 2026 at 03:16:56PM +0300, Mihai Sain wrote:
> Use dev_dbg() instead of pr_debug() in the probe function
> to provide a more specific device message.
> This ensures the log message is properly associated with
> the corresponding platform device instance.
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ehci-atmel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
> index 65747270fd88..b6ba7005be69 100644
> --- a/drivers/usb/host/ehci-atmel.c
> +++ b/drivers/usb/host/ehci-atmel.c
> @@ -99,7 +99,7 @@ static int ehci_atmel_drv_probe(struct platform_device *pdev)
>  	if (usb_disabled())
>  		return -ENODEV;
>  
> -	pr_debug("Initializing Atmel-SoC USB Host Controller\n");
> +	dev_dbg(&pdev->dev, "Initializing Atmel-SoC USB Host Controller\n");
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
> -- 
> 2.56.0
> 
