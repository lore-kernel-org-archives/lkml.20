Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B8A3BBFD4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534877; cv=none; b=n3p0OsIXcfX9fn5BHr1xrHFo9fNRXYoHQ2WxUCwxfFOW6sbVJQhmiOiZJ+FHAyKiOj6znkA00lTPw80ToIM5p9AepD8mXfwc1N/KfeOAcgT/+brh6y+u6UvYlOSQBRPQd71Q03WTs71G7tfq4Xyj1M+exiSXj9ODwcnATt8NiOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534877; c=relaxed/simple;
	bh=pj8AhhdEnsh80eO9w9xsLy7jrkPp1IC8EO9Qmi/Ciow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwC3gLiKN/tAke/n3rXOAwL+p18vDRaDd9tAEj7Q1ig1P2zZuk0h4fE/QUQhcCNFmGk0ODxkMF3hv48rTsX3vJWwfiWG/fjvkXavXGY3zalpS9LpUWHTOEgFFXhRjlocTYPx2gQX+Q/l8k9ba6vYp7p9yOdkGOnmi4aHqzN30mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXdbGvmv; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXdbGvmv"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-395cf2535acso1917267a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534876; x=1790139676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YX/Aaiy2ApxKLbdrXbii2Ini0fQbNuOc4vW+XIt2M8I=;
        b=DXdbGvmvUMzes4EvA1P1O8mlIFHFuUX2oyXv+gTdfBfoZZG/kqcfGC9/zCg/dmt0u/
         4CaHh/xoromes9nW5j4NA7n2741ubbBKYg9uQsIGWVkU3InbPsBkbEqSQR+2D80fMvu5
         VQfMrwkkrrZlCCga43y8XTwM/e1cWnOu0d3NuxpRBXtV6/k5U+AYhvTrODkD9Wp3BL+M
         YmKT6BNj545a9Vqa3e8zB9zqHkE+Zf/ZyqKsGb4O22ulIx9HsLSfB+VNn98Er0VFlqqj
         OvBoEg6IwvFbZRUDJrW3JHNIaXmShH0xBiPda9FoFBCBEcUxpYb7lkSZF/O96TqS69PQ
         JuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534876; x=1790139676;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YX/Aaiy2ApxKLbdrXbii2Ini0fQbNuOc4vW+XIt2M8I=;
        b=rmO+9DKAtpURy75CZ2sX8Q2DPwcpsxdgyn7F2QXE1MGD1uclsuX+/tMyUZsiwk3BtU
         BDMR6FsS7kS7CjgV5S8WZUgu1qeT0opdXeVlOt4RFZtM+NhvcBd/X7lFOsirRjX4qTJS
         A4Q09WdWjtk0AjGPhK+1JuIqA9zkyiST1Ga2QNOxFFFiaCCdLSmmFkQ0eRuuHvCz15IU
         66f6JeWeZEp8d2AnagweY+bP7G791aPJwT/T444uutdWQecMDz33/FH8+6EuLT8zs9fs
         XgWvYJfEJYD9ZJPXwVbfCDfKdFEfsz5ip4wZaaBdf8jJOO8M0TKUTK96g162EkAmcY4n
         +0jw==
X-Forwarded-Encrypted: i=1; AKwUvByYuTCc38IOB1gQ5irQvhSvad6/KuuqsXsdEi5jmrgSt+IIQLNIpSJJHWPoWbsQ7yPmKmx2kQO5/Kihrt8=@vger.kernel.org
X-Gm-Message-State: AFuF++keX6tUFoyPt4wQJSxZirkqhovLeBsZBUsCqxbIrIIC3gSIKpAK
	pw/6C3PqVpQH6yKUJKh1rAXes/x8OpcLmtjZQnuQfMan1mK0dNFmV/7y
X-Gm-Gg: AYBFou3flRR82wZ9beootjcHj0TjGGtFdgYvChCnFhQWA4CgC3q2/ShxiBaeuov8Hk4
	Yl2cUy68I2voRto4jnWTPOT372Txx9H2WLNgrY9XnQIjAt8kigMHFKRergltQZBBKGU3yZ6r6Vp
	WxVD2nS6NbneGe97ioC+HU7j09piz8usZIp8jFcBkPceCcnRGm8zKebur/+lxT/StT8nYBrim0v
	yIcnPTA8stt9fKmXvkBnPqegkOT2k4mVFwJn/eDwQliHUGhiXAG4vphnu2VwRlJET+M+eBlLG7M
	pT3RExryBZHhEVLnhGB7xvwvXli7vrAKHTEAidhTyMSWKAPcXoOuD2LLBGYzH/A3PjBKrtx+j8O
	X3LU+3zUPGX2zZ1oI/U/HLCIU9f1PEvXLSrbeGH7NTr4zRG9tZEGk+kznGf/huf+BTH9bHV1Rw2
	hiB0G8FKknfEj21zB1Y4FnaKfCt4o/1UeJi2mbQA6CtXRuT4VCGChcdD04CWrR/nfeDSqJq8h60
	OXiOihZbF2FpOlY0w==
X-Received: by 2002:a17:90b:2f08:b0:37f:e5b1:ec4b with SMTP id 98e67ed59e1d1-39dfdfd409amr7316774a91.5.1789534875559;
        Tue, 15 Sep 2026 22:01:15 -0700 (PDT)
Received: from kernel ([45.251.35.123])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a1a5sm4300257eec.5.2026.09.15.22.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:14 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:31:09 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: bhelgaas@google.com
Cc: alex@shazbot.org, skhan@linuxfoundation.org, jkoolstra@xs4all.nl,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: quirks: Fix out-of-bounds MMIO read in
 mellanox_check_broken_intx_masking()
Message-ID: <aqoilQgDWM_O5eXq@kernel>
References: <20260905161743.5766-1-raizudeen.kerneldev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905161743.5766-1-raizudeen.kerneldev@gmail.com>

On Sat, Sep 05, 2026 at 09:47:43PM +0530, Mohamad Raizudeen wrote:
> The mellanox_check_broken_intx_masking() function maps 4 bytes of MMIO
> memory using ioremap() with a size of 4 bytes, but then reads two 32 bit
> values using ioread32be(fw_ver) and ioread32be(fw_ver + 1).
> 
> Because fw_ver is a pointer to a 32 bit type, fw_ver + 1 advances the
> address by 4 bytes. Reading 4 bytes at offset 4 goes past the mapped 4
> byte boundary. This violates the API contract.
> 
> Fix this by increasing the mapping size to 8 bytes to safely cover both
> 32 bits.
> 
> Fixes: 1600f62534b7b ("PCI: support INTx masking on ConnectX-4 with firmware x.14.1100+")
> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> ---
> Changes in v2:
> - Fixed a typo in the commit message("ad" -> "and").
> - Updated commit message to use "violates the API contract" instead of
>   "page fault or kernel panic" to avoid overstating the risk, matching
>   the feedback from Alex Williamson on a similar patch.
> 
> Link for v1: https://lore.kernel.org/linux-pci/20260827071940.B7CC01F000E9@smtp.kernel.org/T/
> 
>  drivers/pci/quirks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index de9bbccda21f..b30ca4244f14 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -3714,7 +3714,7 @@ static void mellanox_check_broken_intx_masking(struct pci_dev *pdev)
>  		return;
>  	}
>  
> -	fw_ver = ioremap(pci_resource_start(pdev, 0), 4);
> +	fw_ver = ioremap(pci_resource_start(pdev, 0), 8);
>  	if (!fw_ver) {
>  		pci_warn(pdev, "Can't map ConnectX-4 initialization segment\n");
>  		goto out;
> -- 
> 2.53.0
>
Hi Bjorn, 

Just following up on this patch. Please let me know if you have any
feedback or if further changes are needed.

Thanks,
Mohamad Raizudeen
