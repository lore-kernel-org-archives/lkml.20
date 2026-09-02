Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D4B44A3FF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350923; cv=none; b=X5fo1bUPX9qjpykkjo8kkjQ3Xl9bsU8ggCM7rQg/OfHaavEUmlSRp57/1S5bDJ8vEWS824ZLTl6U3EH4slKT7dN13TXhsVny7ZSjoVC7OZB3DV06o8RCq7U/Nlo1vs6P3LKOcpLEYT7mujTNZJIxZMbrEFikxacU4YXhU7L4yn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350923; c=relaxed/simple;
	bh=hEgKcI0xSVAo+OQaZ6TD8YxlJUNtrHvb4B26iG5AXFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8GBav/B/sYnWZfdLcDrXLTOUvI2ElHL5qzUuUU9yKF54MB17zmQQRmBzYq6HdTEK1Gvk/MHbUuAVkX2VBqs8IpW3FxBRR1c90cz8K+sy+F0Tz/m8kTWIZrBfC3+uB+dlO2RQdeYc6lyHmesQzkN1PmAXQGHzqcCkvwFly3K5uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=P3PRkCXN; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="P3PRkCXN"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c08df8513so6256371cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788350914; x=1788955714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=puJ4uTbfv83ic1yzfkUg8CloAoVj8WRg32Yh9dx02hk=;
        b=P3PRkCXNGcr5WbRgqSiwi7FWYnQgwhkSK8l+Nz4c3Ak6A0GJtbObjN7ZGh4Fzy7Yum
         g2c6mnKHpQS7MXhGzBtgo2LCFO9VNtXDHJ1B6uf3mXH8vv2Vd3z71rhMJ3YD+Wl5xTxp
         bxCtq89JVHhq0jhl3b7JdhZkUDspxHJoIhMCQW2yzTkxUl9Cbyx7Zc8CTM8kUstZOwgC
         LH+/UgS5PabchPBRtozJe0aO7NzMGwYEFmgbYWR6CJ2oXigtspnsHpmtIENaxKPfTUQp
         Zgu76ZiRHpm9ITQna5WEztz6HVVxDacrw8ZjBkJWMq4M5CwdYFSFkKIQAABtNYombU8l
         mkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350914; x=1788955714;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=puJ4uTbfv83ic1yzfkUg8CloAoVj8WRg32Yh9dx02hk=;
        b=HwuLHYNfhfJFtLcTCH1BvqXVs12s2U22JYavBRmCb7Yp3h/f/taQSNh+Y0Itlbl8pZ
         /FGeYToF4PYC16gWqhCid96EItoi10LEO+hV56sddihka1XXb6c396JNEqkL2HYL2NSw
         zdyZq+VMQW+csR8gC0IIZRGwn6FEk8x7a3rBfQ39mAcZ1k20u3W5mpomz3hklFmGuwol
         m/ej7ZBhOTushNWvx8g1YRqAsCvENsl7h4hLoipj1A7PHfQjnjP0L4/5nGxnPorbT9ch
         yNKXPFVA6fkli/K8d7Lv3xLYNwdUKEeSwu6T1rjpf75NE/uneiLlzan3Xeg9QL4kE2Aj
         wKZw==
X-Forwarded-Encrypted: i=1; AHgh+RqdlCV0+N+zNAiDkcScM4TChfQ6aG73MmeWIhueXWESIbBaTTOgs2BxTHJzJhq/QXRLmZGqs3YGx7cNuFs=@vger.kernel.org
X-Gm-Message-State: AFuF++nmY0juPd/1MUjrk52M+mYhInYa2TbZL8eS+otg/adGuVsP72Hp
	R7KMXplFVaK+MR9TpnetDCqqvcIKRPC1qnF//cj6ty+9jNqcyrj5F5Ytd1YjnJ1KtLw=
X-Gm-Gg: AR+sD10yhgDIWCO6l6647cVLRd5YgGdLRNuSKMzibX5ulySMMKFpxqiUD5QrDVJgke9
	pJFOjAMylsX+/h/Gav3AmYh2crR78StitB4MHq2gdda0SdUqI7fjRbOBdYaEPnthy+cvn2p8uDG
	lJBqOJnGsvMH7nlxFE4eyn+QUEv3nOoxnO1b/hcv/+DUdipiG68ySBnh/OsrCheURvKBAaWWWfb
	ZAe9C/ONkpoHryWxT5iJCVDfGaf4Q95+c1sioi7XBPqt1BAt+yJyS6rsTOIsvwQH3f8EZ7Pya0g
	8wSo0JzOjcFs4XsOyVwT3fTUAHEH45AcaS/VIxtWn3nCscXAZ0NCbxXUphD5+jVw4hsu3RpGouN
	sKmUZKy28pat9OD5x2xhcPQlKvg71mCKzNoUt3WuPKcUKP0FTi9vJZTYib1O4+1jHyl6OreBmDA
	yEoBsp6jJJKU4KdkW+Wqv2UBS0jEMh/SyGPcZX6Y0/Sc60bCd6t14SGA87MroOv0c07rzWqWgoW
	98EYJdcpbrPd5TtAEefB5p8KCqtPGprR7XS1PUQv0iXSOijsyfkjI1O
X-Received: by 2002:a05:622a:1452:b0:52d:9c11:8937 with SMTP id d75a77b69052e-53036cc0d8amr38235061cf.26.1788350913894;
        Wed, 02 Sep 2026 05:08:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53032ff4e90sm17442101cf.2.2026.09.02.05.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:08:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1jlY-0000000E9vh-1aE2;
	Wed, 02 Sep 2026 09:08:32 -0300
Date: Wed, 2 Sep 2026 09:08:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hu <dhu@x6u.co>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, alex@shazbot.org,
	ankita@nvidia.com, chriscli@google.com,
	david.laight.linux@gmail.com, dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev, jmoroni@google.com, kevin.tian@intel.com,
	kpberry@google.com, leon@kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	nicolinc@nvidia.com, praan@google.com, sashiko-bot@kernel.org,
	stable@vger.kernel.org, viursachi@google.com, xuehaohu@google.com,
	Leon Romanovsky <leonro@nvidia.com>
Subject: Re: [PATCH v8 2/2] dma-buf: Split sgl by largest page-aligned chunk
Message-ID: <20260902120832.GB2890729@ziepe.ca>
References: <20260901170849.4052816-1-dhu@x6u.co>
 <20260901170849.4052816-3-dhu@x6u.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901170849.4052816-3-dhu@x6u.co>

On Tue, Sep 01, 2026 at 05:08:49PM +0000, David Hu wrote:
> From: David Hu <xuehaohu@google.com>
> 
> Currently, `fill_sg_entry()` splits the scatterlist using `UINT_MAX`.
> This creates a non-page-aligned DMA length (`0xFFFFFFFF`) for the
> first entry, resulting in non-page-aligned DMA addresses for all
> subsequent entries.

This patch is fine, but pedenatically a scatterlist's entry limit
should be bounded to dma_get_max_seg_size(), though I don't think it
helps this. Operating scatterlists at the size limits has proven
problematic in a number of places already...

> In addition, a non-page-aligned sgl length will trigger an edge case
> in `ib_umem_find_best_pgsz()`. In case of a discontinuity in later
> buffers, we will have a `va` with lowest bit set to 1. That will lead
> to `ib_umem_find_best_pgsz()` always return 0, and break the promise
> to find best page size for the mapping on the NIC side.

That's an IB side bug, the newer logic that joins adjacent SGLs should
have avoided it?

Jason
