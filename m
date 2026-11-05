Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913664;
	b=RjMi92UZxS6KTdwcOEwKNMAEJ1DUjqLJt5WCXi8bfOY77HpJP0K5Ku30oOJNzy/AEvZ/
	 krdVxeHCN6+JJxLMbYFJF05BD7fFVtYCe3z5oy7OdJV6g/HPkh+hEDWpIclrqmq3Dmka+
	 vdFzTCUebgdjGhu3AN/uRt9fKa6+5tu5f8duzzMNdTTskurAhWB4dncYP0bmQ+q3ubKe0
	 XifSPTKCJR6gipceVPXCHuICLfhDunDpV/1oUnZgf3nsT+je4oViWxH0jmxwYjHbmgUEy
	 1elKkvbfBzfmmvPzgbapwTlaizqDk96T4gFUF4zOwJanVGx1Pk7k5vATGA09vFqC6/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WXzgH95vtdgxkReEE2P1BQ8xVe38URZnAPeqWUQQfAA=;
	b=bExwiAFE//5sak57PpzR7MLHZOEhhcE/HWnWMhI2/ihkaqTzKbAbHT/7+LhN8jqpxhy1
	 FMW4UXpG8uJM9V+RbuXFzNrBL7DGsobu+rcvSN6dZNC55fxXM+AdP3lAWBJwD4SD9l2TT
	 RLTwh3PQJjkjz8pK/uwIsjby6wZEx4NHVpzuh9VShX3S9/Cr01Zsvf7ngBVUTKE+jYCM9
	 ycNBCEIFRLrsdyP0Niq8lvVbiMpQZBIxbMdA5ivD4YDHurgdEwWwuIDqvlOIOUxId7pqC
	 UoVGcv6afrFO8tnmIRMwqbqkDrQuAuBUYckJ0pt9qbLbPrWFehKDhE1XNLo9a7VNc5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=o272kggh;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF962606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF962606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=o272kggh
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53e1d40628eso13213241cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793913663; x=1794518463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WXzgH95vtdgxkReEE2P1BQ8xVe38URZnAPeqWUQQfAA=;
        b=o272kgghSdolH9E4TnUtYJcaF/dZbvGhVgZT4XofbtbHre5LkiJbWpg6xsyNVRrkfj
         WoIQQnjMqpigXggNp+RauuI//H8XFt3dgvxz838PH4WyJREtRh/95o47zpzX31b4Hvsj
         7c0r4eH2hvvJvNrkz3soupfCZ+RGpKmVBiPNTDFO4vofbHZb8QJnuPg/MjHsmJidxNSE
         BGSbILqPpyhrSF7J0itl9ehrDSYQP45apJG1EAmpMJr9fqFMrhYtryh058q20o9gs09F
         vXIi9ZsSOxCSowHzL9aPAvJVJR55aa3GiPNLMfoP7h8uUvNOTLvzZV6PAViTsTLs8sHw
         zphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913663; x=1794518463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WXzgH95vtdgxkReEE2P1BQ8xVe38URZnAPeqWUQQfAA=;
        b=UkpaRY/N2ZumDQBFzogMhH8ky/00120aAmd1kqKsuCgJvDBWFBLbq3zdN6xzzeL9Ut
         s0vDQT9aL2dT8mR4RaTDJ5/paAJnZjPlqdN4mx44Pjj8NGs6QQruGUvavq4+96hT3yj6
         SLt+rhMuKHJn02GUqlFRQ69bPH5gCwW2SukuF6NwGlctuib7M3T1Qo6eppx10ncwlDqi
         NPjy0sZIztXDBBsLhQdYQsVYNJssqPADwyekOJ78lKY2CH54WYS4TI4jgUXrw//ZYiqW
         Zv0W+g9uak0+E2ewhkemHY+w/brT22cYX5AFxj5Mc6kWS34gc9rhbIcOgW4SN7ndEtvM
         tssw==
X-Forwarded-Encrypted: i=1; AKwUvBzP4gDsFl1kgvlPLz/7DXSKW+GMBAGtyV2EQAF5g8YlrYuFBelwwgU1xMpCyOoZ8P6as3JW+x6uZf+b7Is=@vger.kernel.org
X-Gm-Message-State: APuU4Z93UZs0SJlDRhCbWpJu9afthfcAdiV8HTbjrgUXRIG9z5zdOCGB
	vUzflCmRm6VFs8UOYePGfUBhRDNpUrHG41fhFhiUKoGT1ZRA/XVXn+1To2k4XAs3787erp37hOo
	E1Qkqd2H2
X-Gm-Gg: AYBFou23kQF3ntVkNfdBz59eC0AYCj11kBD3Y3r+Ini4dcBGkXew5f2KmqbX8V3qQA6
	B97BwzIRyE6z+hNXbeZze/NeEqE8xNXfigVmsp5as+2Sq9xo+sBisyO9wUyC9fzLCeyvAsyigtU
	hF/qwxD6VmnR0e695RZtnCF95XAfTMRXgQ4KPoCDgr368XMNIb9eGq8FvD7t6UEoNMSeV85Ud1T
	FLdjUJyIb4EGfC8VpdJ3bFOUXPnsd5jJusZuaKBHxH7snit4yTe2YJE1f9daBoY1cyvb5ugWq1p
	WWUkzkr3oaLYDGuPzzSttpiBfEkVmjFb3rIfOdIG/tK/FsrGuZIel7U/ddpgbS2Zmaoavc6eyBl
	FXZs5cZQQW6QYVLf1pHEzT6K0ATWVYmmc7rDfV83o8byQJfZ84QtB59GzocJizzQcXuhu9Tfoy1
	kcdSeAnfEIeJwPTEH6n+/jFsJwO80BrtD9looeTd+dIkrnT6Y9bhskEWC2UyqaJj04p65S5HxAu
	y32shIILyth/oj+kY0uSat6DgGXreGpKu/EEFmS4pO+WWMiOBeYaiU/bk9gvwppf5PVnzQrY2sZ
	afbSOkmLbe6CtCOi0ZOf648RRwYf
X-Received: by 2002:a05:622a:c01:b0:53f:98b5:4317 with SMTP id d75a77b69052e-54e15f61bd1mr8424661cf.34.1793913662646;
        Thu, 05 Nov 2026 13:21:02 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e25d65a79sm3151401cf.12.2026.11.05.13.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:21:01 -0800 (PST)
Date: Thu, 5 Nov 2026 16:20:59 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	Elad Nachman <enachman@marvell.com>, stable <stable@kernel.org>
Subject: Re: [PATCH 10/19] usb: host: ehci-orion: fix the probe without DT
Message-ID: <e8b7570b-7f60-4628-9470-2ef03b4e266a@rowland.harvard.edu>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-10-b9751ddb9c7c@linuxfoundation.org>
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
In-Reply-To: <20261027-llm-usb-v1-10-b9751ddb9c7c@linuxfoundation.org>

On Tue, Oct 27, 2026 at 03:57:50PM +0100, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> The Orion5x, MV78xx0 and Dove board files register the controllers as
> platform devices called "orion-ehci" (arch/arm/plat-orion/common.c),
> which are bound by name. of_device_get_match_data() returns NULL for
> them, and ehci_orion_drv_probe() dereferences it to get the DMA mask.
> 
> Use the 32 bit mask, as before, if there is no match data.
> 
> Fixes: c63fe1cc7093 ("usb: host: Add ac5 to EHCI Orion")
> Cc: Elad Nachman <enachman@marvell.com>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ehci-orion.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
> index eaaa49712a8c..2071c3d6e582 100644
> --- a/drivers/usb/host/ehci-orion.c
> +++ b/drivers/usb/host/ehci-orion.c
> @@ -218,7 +218,7 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
>  	int irq, err;
>  	enum orion_ehci_phy_ver phy_version;
>  	struct orion_ehci_hcd *priv;
> -	u64 *dma_mask_ptr;
> +	const u64 *dma_mask_ptr;
>  
>  	if (usb_disabled())
>  		return -ENODEV;
> @@ -236,7 +236,9 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
>  	 * set. Since shared usb code relies on it, set it here for
>  	 * now. Once we have dma capability bindings this can go away.
>  	 */
> -	dma_mask_ptr = (u64 *)of_device_get_match_data(&pdev->dev);
> +	dma_mask_ptr = of_device_get_match_data(&pdev->dev);
> +	if (!dma_mask_ptr)
> +		dma_mask_ptr = &dma_mask_orion;
>  	err = dma_coerce_mask_and_coherent(&pdev->dev, *dma_mask_ptr);
>  	if (err)
>  		goto err;
> 
> -- 
> 2.56.0
> 
