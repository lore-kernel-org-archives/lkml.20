Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D9849428F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792173928; cv=none; b=A8nPis6Gby6TfraOz7begI+pNwq0LiZH7YZTp5UcXITQWrL6KomUSoYWc40yFlXLERD91LwnVTD8pLtjQmSw9IgIDQ8bPRbGunPvhftDFrsjd6EdzZACvzSUBepdqv9hG30kOQmmenIuerqaICeQGGoJuoQVMBukbkwIwT78Sw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792173928; c=relaxed/simple;
	bh=9/EH6Nh3IyjidhjX8ImjHAg8jsbvenySYa7Lj4rRnzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RW7VkVZEwBTuL7JxmmU70zA7BTfJ4peMiP9sXAqknZ9/i82eVHDg69nKf8BgMZaH2fCog5oLhrgAhSRhDBJpy1ALFQ3J/dMNiB3YLHKG+kCWnpWHF4jkTWJskxkTAWNUSeuXa3JP+iTrLoHnEgjw+MANSOhas9m9z84Q7Z0nMWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ggNkJimc; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ggNkJimc"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92ed3993c1eso17187885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792173923; x=1792778723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bcPINE8kLYO7ad2h8AzZJW55DUCIX7EGWisyHohuTdg=;
        b=ggNkJimcIMGLl1CfHz0JSLoWerN/vwrK1sQDuojn+lPu84dMPDwGKrbF+9dM43umw7
         L2iqltjuAbxRA1O3lQbfEWjQ3YrhGysLiix0xFno6Q0W42yDVx9dTSQ5mMGYRhKKnOWq
         V4awb5wIzXBtpIO9MultwaOXpM0HmsRFFv+qZpZlwPUuY/t5t6yMBazve+gYcPSylBdV
         9UWk3kskDVj9VAZcVaKbFalUnyucJ0BlQiKbJrd9UYyfpqYr9ifk8yw9TxTkAmCNyjyy
         6UY894q+w7ez1jYt82nZXAFMjq+qnVcDsrztt2OIrezT+iGGnz5yZsDxGuRRGVzyZE/c
         GNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792173923; x=1792778723;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bcPINE8kLYO7ad2h8AzZJW55DUCIX7EGWisyHohuTdg=;
        b=GLFmuAlFCTwF2+6p+hBvPoRlUsGG/7K0xWYFLyaFjt1TsMu/l8A5YID9PYvYqKSWFA
         r07dLxngQIJ+EvpF2t7Ns63/DmDz8nd8Z4GJGwCej2N+a44ZMTiJQAclwjXZlE7pK2/3
         /8TcKGCsMgvu+Umj+tbvasqZxrgLfriG8pF+5ZZi9pJ2Aoab/UwOQyZCdO+GO1ew4zJj
         1t0FQALCn8FvXEhRiJSlQ7tajIKjPSsMgw987RTAOSUNIAsWSebeDG+dgIebnqBOK5wL
         x2IjcKjT1JoZnFByk+mU3LoN1OY2ii0PFQPKeYXWditR0gJWOPNvorMq9B4uzBqcX5FU
         G84Q==
X-Forwarded-Encrypted: i=1; AKwUvBz1HaVjthLlYv3uGLaCi3/qIL42A8kmklx1armsEpYAa2tqBH1GMoALI91LJMqw6CXLPMoN5Ozo6DrYkw4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLn6+/aATIvS8IqqHwK/Igl+V6OCEHSIuRo9mO+Halu2OSWy2/B
	dI7FL+IXDQYcR8PBRmQOSMA6yNf3jJqSkwhKg0w5o+ZKEsKcEN0y1OXS5iextAPKp48=
X-Gm-Gg: AYBFou2tdkalaFN6K0u3t/EgR6gK5vT4zGgtZ83aitd+EJ7BmHTBTL84M327eqhie9q
	9DVNPUpD+UAixaobDMAF5j9Zxdg1P9dkkc/d9woom1qgoi1bcbu7NtsD1MfXJnlT+Y8Cvp2fIZY
	L/hqBqrcBzJ2+OVkTxnp1ip9udUF3oPUePib7xG5vAQSs0PMZAvrCs3wQCu6RrKv+Gl5lFRIamH
	nWgQsgOzuM0KdPH2ip9M13qBWIcnnVHOC3ko+Von2LuI+nGdHwXLKhpnRo7uCyl0qqQa1RAwTQn
	O07y1DBFMxZWKvLi+jcueN8SD1LCmxZ3kouB/34Wigcx4sWG5H+zifmYEcubhOmNYaqK5rotgEe
	efRebUtICePnNa1QO0IifaI4dWSiWs/CDyJjJIt6eQAyx3H4ZxVPjB50ZGO1Xz8WDMMOwc1CulP
	T/8yE1pxzP5XzEtam4wvwh9BYMYdeH/bSUi1RUi2MggV8wh+WfO7TsbE050Umz269tWaKACwm+q
	sCdSfcKvD9cRw0eUvAY4fHgEVnsC+tElGJSjjoeKhjFIsY7zzmRX+z3WUI0oSjgo+s=
X-Received: by 2002:a05:620a:2990:b0:93c:c08f:ecf with SMTP id af79cd13be357-93f29d69e08mr105371785a.53.1792173923072;
        Fri, 16 Oct 2026 11:05:23 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f23eb7ba5sm131256785a.27.2026.10.16.11.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:05:22 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHmIz-00000002FIM-2VOf;
	Fri, 16 Oct 2026 15:05:21 -0300
Date: Fri, 16 Oct 2026 15:05:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Mentz <danielmentz@google.com>
Cc: iommu@lists.linux.dev, will@kernel.org, robin.murphy@arm.com,
	joro@8bytes.org, nicolinc@nvidia.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dawei.li@linux.dev, praan@google.com
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Align memory attributes for
 SMMU-originated accesses
Message-ID: <20261016180521.GJ14213@ziepe.ca>
References: <20261004195027.227748-1-danielmentz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004195027.227748-1-danielmentz@google.com>

On Sun, Oct 04, 2026 at 07:50:27PM +0000, Daniel Mentz wrote:
> The SMMU specification defines several types of SMMU-originated memory
> accesses, including Stage 1 and Stage 2 translation table walks, stream
> table accesses (L1STD and STE fetches), CD table accesses (L1CD and CD
> fetches), and queue accesses (CMDQ fetch, EVENTQ write, PRIQ write).
> 
> While the memory attributes used for Stage 1 and Stage 2 translation
> table walks are configured in io-pgtable-arm based on whether the SMMU
> is coherent (ARM_SMMU_FEAT_COHERENCY), the attributes for stream tables,
> CD tables, and queues are currently hardcoded to Inner Shareable,
> Write-Back.
> 
> On non-coherent systems, however, memory for stream tables, CD tables,
> and queues is allocated via dma_alloc_coherent() /
> dmam_alloc_coherent(), which provides CPU mappings with Normal
> Non-Cacheable attributes. Having a non-coherent SMMU access these
> buffers with Inner Shareable, Write-Back attributes results in
> mismatched memory attributes between the CPU and the SMMU.
> 
> Configure the memory attributes for tables and queues in
> arm_smmu_device_reset() and arm_smmu_make_cdtable_ste() based on
> ARM_SMMU_FEAT_COHERENCY, matching the attributes used for translation
> table walks:
> 
> - In SMMU_CR1, use Outer Shareable, Non-Cacheable for non-coherent
>   SMMUs, while retaining Inner Shareable, Write-Back for coherent SMMUs.
>   This applies to stream table accesses as well as queue accesses (CMDQ
>   fetch, EVENTQ write, PRIQ write).
> - In STE.{S1CIR, S1COR, S1CSH}, use Outer Shareable, Non-Cacheable for
>   non-coherent SMMUs, while retaining Inner Shareable, Write-Back
>   Read-Allocate for coherent SMMUs. This applies to CD table accesses.
> 
> Assisted-by: LLM
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Daniel Mentz <danielmentz@google.com>
> ---
> Changes in v2:
> - Rename local variables 'cache' and 'sh' to 'cr1_cache' and 'cr1_sh' in
>   arm_smmu_device_reset() (Nicolin, Will)
> - Collect Reviewed-by from Nicolin
> - Link to v1: https://lore.kernel.org/linux-iommu/20260929032229.3532247-1-danielmentz@google.com/
> 
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 37 +++++++++++++++------
>  1 file changed, 27 insertions(+), 10 deletions(-)

I think this looks OK

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Did you check the spec that this is every access? I remember there is
a table outlining every access and where the memory attribute lives?

Jason
