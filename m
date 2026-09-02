Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BD749F107
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356139; cv=none; b=d49ZMk40jhe/iBSrBYE+qlJgx6G+OUEM/ZzGU8gEObMxI2ZbWZdc6ccD5lQahBi62g4njQFWV72BmH0ZW62V0aG+nOu8D7owGFGL9PwVQHCxjs9+AhZawihbSvrktAh7cMwpQH0/VEaP/vq8dYaTFhsSM4FjR3xRt4Cdlpe96dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356139; c=relaxed/simple;
	bh=0PFLOfaq+6WWQHWvWbWt6REJWyhMeiHkv+gzlMFNkYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JU7E1pVGRsWUL3LkYW8BnRWbKm7MTmaQRpUsf86pL9JTX2aBlCNAdnbiCAlRbEBBrEDFpQwnuqIIFChBtgrtPEyimVPt/yMd7oj0VzPnHZLkXL65n/IN38OYnhEmw3hWeGWUUANtlabh/Yat1zC6nmEd6tyKuW1W2rDvgTOC/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHOjaqrU; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHOjaqrU"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so963457a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788356136; x=1788960936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=udAsg3MzvsGGwXFF/k2qzXa7u9St7I6Sux5aMHxyI0M=;
        b=VHOjaqrUfVfUYlUOGirjFDu5P5KltBaBJikm4xS+fxzDj5w6GKqfM6YUKMCgNMwGc4
         YRo5iaEiMNlyS1thlyJgFuOxFte3YklIIjDL8EB5SHTHty++VTIHHGHpG7eKx7h8brQC
         J7lg5OnC9q9P5qX3vsAVkNw5oY7iJApCrT2yzAwM+pV36cyLU3AHXQFGphUQuA2zb32j
         5TRAHFwkBO3GpJCg6PHf6H+KMsUWkWgMTqIVkgldran8iRSWFbafrLXUIjVKRAV0rMHm
         hDTKjcuFHTIfUDy10Bt2/1/f34KSs+ExPzPNwXkIXG5T+lH+S8lcm75HUa7+rbhOCm/V
         ofuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788356136; x=1788960936;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=udAsg3MzvsGGwXFF/k2qzXa7u9St7I6Sux5aMHxyI0M=;
        b=ejvyGBR+e8u97hi+JC9Ltu3X+AFdITFi0iUwKSr8yR/uwe2XpA9GR8H7iZE2aIxoaW
         HOAm480KqvIfjKkCHclEOrQBQl5tPyKEpAGc1hnbPXNINcVG+xFqn5BetsOgxV9BbVFB
         6zfY5/pAaQ8wF/1DVidPFzWsyDi9oivooKMW3NcG0L0bxBpHVsU86cVykTs0hUWteYlF
         09M9NxiZOq9PxrCvDCWRSi2wKS3R7payYVn/xPmXDqjSGkIucbHRgLU7qFkjV4VN2SeY
         +7kkvBwUfuXwe95RitRYE2bk3n4evWMPpS60u9XlGvt1RbSOh8/t6ya3DQqJP348ewXf
         QuGg==
X-Forwarded-Encrypted: i=1; AKwUvBwvJX8NJU2FVYsVkuqtcOrLDIQx/9Zxh4ou57tG89byJ8fSMAPBWgojxGYSBZ9Qs2GKmxeC2+P1NjmAktU=@vger.kernel.org
X-Gm-Message-State: AFuF++kwwzoPXVnWUozclIM2aaswUCsTVguD9+ug9VqFStJ7ayMcKcOb
	g6zQj7cL+fgyhpcDc26b5ztI9Yd4M61OHTOZSUinTDRqsj7j8OJ7kHSi
X-Gm-Gg: AYBFou1/axCV9t7KVqXod1k/W9MlRwbCMjr3LKguprQxOLjoEFnSWhak2tYVi19RTIP
	fetG3tu5GUSvvb0wAtCEk970XdxdmsFpVttzUUF+Gidt5XKmuQQOOU8iL4kGFBbzaoXoOaLyIfw
	xL19k6akyOvjnMW0ifZ1MNPtfO6ltZI/R08jbNd/8woeFZgdvwGbvGEaXWi+vYP9eZPmRvlyOs0
	C61VYsA8P3bzkvf14ZFzDOBu28GpkPgkA5MXDzpfSYMCs10ubDfrcJp4tnNEWPP7jY0+Vs90r4s
	XJLIOevu8J3d4VFpfdP3yjNiJB5g4+BtcekiXJt1LhJip8ai5SkEMv2o9+Y7fHBmQYCfyybR0hT
	uC/N81cMBY2eCu3/F3kNS0lHUzJrLqxvONBgvPo7dQ4oOgKhDxJ2YfPyEksRoiVaBjWV0+Lrwge
	yO/DPjnfjTqUgT8JM9nOtRhatoZvtKKzLxI0k6onJOEi1IXcNsZO1aRML4OKkUv9eTZ+sonG1zc
	dLxnXI=
X-Received: by 2002:a17:90b:3c04:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39aedf5571fmr8246529a91.9.1788356136413;
        Wed, 02 Sep 2026 06:35:36 -0700 (PDT)
Received: from kernel ([45.251.35.126])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07be25fesm7214644eec.29.2026.09.02.06.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:35:35 -0700 (PDT)
Date: Wed, 2 Sep 2026 19:05:29 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: bhelgaas@google.com
Cc: robh@kernel.org, gregkh@linuxfoundation.org, skhan@linuxfoundation.org,
	jkoolstra@xs4all.nl, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: Fix unmasked value in pci_generic_config_write32()
Message-ID: <apgmIcFylNj4Fn_6@kernel>
References: <20260727080643.4949-1-raizudeen.kerneldev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727080643.4949-1-raizudeen.kerneldev@gmail.com>

On Mon, Jul 27, 2026 at 01:36:43PM +0530, Mohamad Raizudeen wrote:
> When writing less than 4 bytes, pci_generic_config_write32() uses a
> read-modify-write sequence to protect adjacent bytes. The code comment
> states the goal is to "merge in the <size> bits we intend to write".
> 
> However the code does not mask the incoming 'val' before shifting it.
> Since the function 'pci_generic_config_write32()' accepts a 'u32', a
> caller could pass a value with extra bits set outside the intended write
> size, those extra bits will shift into the adjacent bytes and corrupt them.
> 
> Fix this my masking 'val' before the shift so only the target bytes are
> written. This makes the code do what the comment says and matches the
> read function, pci_generic_config_read32().
> 
> Fixes: 1f94a94f67e10 ("PCI: Add generic config accessors")
> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> ---
>  drivers/pci/access.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/access.c b/drivers/pci/access.c
> index b123da16b63b..47b38d01694c 100644
> --- a/drivers/pci/access.c
> +++ b/drivers/pci/access.c
> @@ -176,7 +176,7 @@ int pci_generic_config_write32(struct pci_bus *bus, unsigned int devfn,
>  
>  	mask = ~(((1 << (size * 8)) - 1) << ((where & 0x3) * 8));
>  	tmp = readl(addr) & mask;
> -	tmp |= val << ((where & 0x3) * 8);
> +	tmp |= (val & ((1 << (size * 8)) - 1)) << ((where & 0x3) * 8);
>  	writel(tmp, addr);
>  
>  	return PCIBIOS_SUCCESSFUL;
> -- 
> 2.53.0
>

Hi Bjorn,
Gentle ping on this patch. Is there any further changes needed?

Thanks
Mohamad Raizudeen
