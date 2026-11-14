Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794617237;
	b=3WikABc8mua6pGSMFQ6P1HSJIx/2VgGiQOsdtHvLJ861STbds3NkJCr+mLiENJf7m6pQ
	 xEnKBs42BWYZEH7+iQ2Vw08IbiKCmrwpXmIob0qufKmBB1uqd6Fj9ReCZkC73T/n38w6z
	 WHSQp2cSwRtt0QCQ4tj6yw7g7T5Z+AqvgZpnjM9BvVd0d3ljTKbza56FwJqh1jV8a1sNK
	 XCezU+3jEfiWwC73o1SqiwUY61+arLGSLpN4FZH48vinGxGSoV4No2P6dyuqHhfPJ/Njr
	 h/liMVHVk2fT8yIeKNcG5Uv0MIw05isbYziBvmMl8+c9lc89F1xrEhb9no1Hc4SGoiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794617237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sFWoksDl/YSxzzEgBxVNVr0WRDbY63H/etkwcboJjXc=;
	b=mu81mXCFmAHjB9EAcc15M6p1f1SiMrF7LlnQqB0bh5xdA2SRNlrfYQToNSlP005W9vnm
	 dLCDzUlNYsyJLeXhbZl+x9vlCTYD0BaN8/Q48DU5kDBp6zWXYqCTyJ2Nd6BuSmyt7WQg5
	 ywpMbibc5sdWaYa1yRC4Ir67TXRG91Cf2WPRjyvvwLZTz28vvzArApuYJ9eN3ofpc1evY
	 Rl1M5dl/aG46qGhuYHtiC0HPGrbu2yWJKzyJIJXC+NR2YS2ago/E61s3P/X8gU9C0PcSD
	 YG3mQld/tIEvCjDgTx2yvLKVC8tJvR3Gd7kTLERvWbSTAcz/s0rIq5KyE5W46lmdzvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="XyVZZ/6K";
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDC9606A336
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EDC9606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=XyVZZ/6K
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-55c38cdd5b7so5963451cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794617236; x=1795222036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sFWoksDl/YSxzzEgBxVNVr0WRDbY63H/etkwcboJjXc=;
        b=XyVZZ/6KHgc0SnAGhE+nOZT3P9/3caLv1SztSB6O2DhyUct31m2H81KeZbaxWc+Zmn
         7k2OwX/Ma+HdJuszhMMdNkJXat+n16COGEcTCx5bNb1ZQrZSWmlWpiBt8f5dVsvt1JMF
         tunVJ1m2XvNvp15U1ckHW6TCWGKpedOGLJdky4LUtYG2x2h+tccel23tRwpLLr5JvhFK
         8laFbFmYY73/CBmJAehfl6Wqj+aqqeeUoi6AFJejktEiRZpmcfF0NBTZgluDudl4AC/E
         KLNkmLxCqYLfhelws3lYkG9uTfja/letfAbABE5f0F4PDFyCxdFWN0IpjTzmeqNHC3v1
         qTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794617236; x=1795222036;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sFWoksDl/YSxzzEgBxVNVr0WRDbY63H/etkwcboJjXc=;
        b=e0t2ZhWaz2MWQbxm9BUwb4Sdjf+CaihR8uLfwmtqctap6CFhsTb0MB5AoSkLzgXU7W
         kAHRjxk6cvtLNOhfLS2DsFzDN95XjO8a4Sih+jeR8giWKs96I6ed/jpsei57C7nBRWy7
         NzxqW4hIWtDsSGtiGLfxpeBioB6LtK1z2iuGs/LhHSmK2ke5hNeoyh/XVOVMIdSQb+VK
         HbKV0QJa7lyJVyUz7E68L8eKxMFjBoUgWcQQGuA+B11EhCvLygstb4ZHZkzFL9iOuiEw
         K8zL7eYBezY3nQjVhlUg02rdyJ9vKgLsfjzkkDgmkXfFCODUV9UHRCSKL8bbzq1pEU3w
         Gk7g==
X-Forwarded-Encrypted: i=1; AL+hErGMiOSbeZ08D1+qFVuDdoo0CPuMgxjuggoInQIzSZKAQXeTAOXu2vUJ9tDDCs2oI+qdmNhKdrAKFpHKc6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tUBPIlr1tsoQcIK7zs/9agupp2qQojXj8mGgNI17Mcn41ZfF6
	RHy0zrb1G8EVV0hJlsVl/qLVkvi6IsTGATiLMY8XjfA9VrnIOKHyhgV7WOW25jxFlXk=
X-Gm-Gg: AYBFou0USXQJRAV/JyTJZxmZxkCHHBF5w/jxSvr+RJ0A5Dn7vJvkZCuJH22VjLKBQ24
	hZJLYZpQmf9yFvJe72vxMNiJwtme62X80ym5CI5JDo0Fo4I8flXos76ws7+JP8qmGnPdFOLX/Us
	AwKAmLD1LsJr9oFr8afnMFc6Nn2TiItC3PkWjbZiloc6ayn1L5YD5rW01Yhnw8d/UaTZHYKnfF2
	pax1vkRBDpaZ0HPepSs47aXxZqM8FPM3HQR1Gz6mA2hMYaZGrs/y5+3f0nkUTh2kFg1b5lyJ9IR
	pRTvtECDMiIB3fk1RoMp74l6WWOO4L1WMMMPxGrT/7FtjFGi9ScOi8DR+fEQemH0Vp6T3v6tEgW
	gXrbaPai1yGjo8pQKb34sKRFFLvs+qug/cP12ayloL7uaBBe4NTiisS2UvzCh9Vh2HheimMX/Tc
	f0mSOgUUmUF+7++LMhFw2VH+ptkdvEkUeIQx/EG2q+KrQxlyIKHDXWDmLq9AHigtpsZVmXOZmUI
	ZturMWjvK1gbWYBQ+kgaVZ7eXVGVZi2CuViwX3Erozgo9oiGTO+Kn5LPLxi0CaTTXEnrzzgtdbj
	wdv+Mg==
X-Received: by 2002:ac8:5c85:0:b0:535:a5f8:a5c1 with SMTP id d75a77b69052e-55aca875ecemr64665691cf.65.1794617236082;
        Fri, 13 Nov 2026 16:47:16 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0a2006csm30002301cf.10.2026.11.13.16.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 16:47:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xS1vG-00000002SDe-0c1E;
	Fri, 13 Nov 2026 20:47:14 -0400
Date: Fri, 13 Nov 2026 20:47:14 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Wei Liu <wei.liu@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>,
	Yu Zhang <zhangyu1@linux.microsoft.com>,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>, iommu@lists.linux.dev,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iommu/hyperv: Keep a new domain's page tables if
 it cannot be deleted
Message-ID: <20261114004714.GF2532299@ziepe.ca>
References: <20261112195710.1417744-4-oss.patchbox@gmail.com>
 <20261112195710.1417744-6-oss.patchbox@gmail.com>
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
In-Reply-To: <20261112195710.1417744-6-oss.patchbox@gmail.com>

On Thu, Nov 12, 2026 at 02:57:00PM -0500, Yuho Choi wrote:
> When hv_iommu_domain_alloc_paging() fails to configure a new device
> domain, hv_create_configure_device_domain() deletes the domain again,
> and the caller then frees the page tables with pt_iommu_deinit(). If
> the delete fails as well, the hypervisor still has the domain, which
> may already point at the page tables, and they are freed anyway.
> 
> Create and configure the domain in hv_iommu_domain_alloc_paging()
> itself, and leak the page tables and the domain when the delete fails,
> as hv_iommu_paging_domain_free() does.
> 
> Fixes: 2690d4156b51 ("iommu/hyperv: Add para-virtualized IOMMU support for Hyper-V guest")
> Reported-by: Jacob Pan <jacob.pan@linux.microsoft.com>
> Closes: https://lore.kernel.org/all/20261105141427.00005946@linux.microsoft.com/
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
> ---
>  drivers/iommu/hyperv/hv-iommu-guest.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
