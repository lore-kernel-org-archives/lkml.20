Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712D64756C1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847218; cv=none; b=ViSSiWIoRL32Q0r8nhwWnLs4canCGGN3nFJi4Ss4syypRF/fwVTp4P4YQ8vw+GzT8F2QsCKqy20cvSGhE1Cf0ywGdGqNaEtiUqqAGDFC6SJNq0LLUZc87aCnLiTJDwg0I4kw25Siai03+wFqaEaoVyoSI9KMCuQ9tpftehOV9O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847218; c=relaxed/simple;
	bh=bx+2naZFdnhjt6S+TMgqnenLDbHBUf/nrxWuetiOMy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlHrCpYwl/Kky2somf3GZZRO5r4OJo7bCj2AMfe715cyhO/hBb0O3sl496KLgOQfz9dnHEiD9y+RUyJuHx+3jezJu14XRXaQT3OgXbymTNC3RqV1m27DiGNRZ+2nvoAcvsChsfCbf6JQHVkcMDfw9i8tKd0xylCGs1d/i6VNV8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uJsuA/s2; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uJsuA/s2"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499b1409a75so50525e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787847215; x=1788452015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OV8Y/HaLC8KyPS9TxMbjvJn1COqqS+9kygpPRaWTQ3s=;
        b=uJsuA/s2/ZXoDcOTpVsLkgfrAcYBkGvXAWxABXPVrbbiqr2c9bl4cGIwI9drScLI0A
         AKDYb6hehXvyC1Ri0jxf6UQpxmPAE4Hgaoaps1++gP80tBJl+jOzxnhgTNoNnsF9vIAJ
         Ac7ULgiksCYJAIE+0BncbQDHeXHA+W2/CsLZS5id6LS6zaqchwH0aGPfiszOVY4p2bFO
         uAELTZ0F4qgIZRQsAByVfv3OpVwo7TJ3nDw5u9rNq3T88kyqYnC7LqGP6qbpyeOjM+Ql
         rdT22NG2kJ0qMRW2R3opOuE+gr0Tgp1K6YBreLDMsLJ++5Ww1DSw+Utg92n6tNInA+GD
         7wqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787847215; x=1788452015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OV8Y/HaLC8KyPS9TxMbjvJn1COqqS+9kygpPRaWTQ3s=;
        b=FH8qOaDeDCxpg3oIT7tVSF0eTpkpifJ45XT5rUR3928A43qfHn8Qntv8bnimVlmvnw
         fijKRNuie1LlO9VawPUeDn/YyUvdF+2ol1SDOx1uzF/5CpIBCsAAN/6ICX7um5g4YF9C
         2hDWSJT3tYKLg6y/TIYvt4EzCBv2YZqO/gg0gA2pR4oaIOwsQb5KqZOztofEU6rx0hoP
         shHVb/p+TorD8pCELwoo2j/QobyAJN2m6H1u3aR3kx0kmoEXuftRx1V69qKMD88rjf1h
         4IwgaMsTyEZEXc4aZTOkepNt2uP9Ybe+3xUoKdNmAaZH8sw0vsTOXgROZIfii6eQId7q
         c53A==
X-Forwarded-Encrypted: i=1; AHgh+Rqr2IrAftSFsfnVI3N4QsLBWmFaQ1FwraA+ylZ5TmaLrt1uyfUqEzEWo3BSAiBnmNlqQTwEB1jD6DL1ID0=@vger.kernel.org
X-Gm-Message-State: AFuF++nUUpKLUXLVUyHMBSRPym8Py29vIO0KNzKBw2YmUGNHfowXhsZt
	MSYiKY3mZJaWC8DslZX7pOMpG5CEgz0H5MAoGjPtu1DN59ohVGIUcqmcz1drCWguYw==
X-Gm-Gg: AR+sD10VmQnW826if35niyk8vnzayek1bnNMZ2xHhd9ARwA8W6r+ya3H6Jktw0PSVI9
	nTlGVpInd5AaUX7BjRxdWiGKD5TgIQVHaD4V/6j+2TiqZ9/ofsOwpN3zzThOUYQSbbEf/kZR0DA
	eGqdyX6wGSDykdmb7yR08WuuklasJwyl2KdynPsCcKOrGEFmgJ7XoqE5LrTMPevmMMRF5500M6D
	mdMEVNQzi2S3BPQJrUFkkRVq0kNLkauBVPXQgJS9k5k2NIsIkLdbghl81AsboC9ZQMXM2irsWJ5
	7hN6Z1DS78gP1NAkcyQ+U3ctN0iNMNDJG9yZsghgvli1bqSudWe0G3e4/iIp6r4oxTKKoZKoWii
	K1rERuePJI0Y5hJ8rb1dm0g/1iSbvqT7exOc2zgEytArnfv4dErzeBfldNfGnkapELa3NZnH2MW
	nlPsCLyJlUozS0yBTccNrihb8ZEloRUoYFaBZQKgHZ++Nzb11/n17c1kBlCCDhc3chXbBBkFHn4
	CIOpUz2l8x8R1UNkaxFnJ30rxgvet8=
X-Received: by 2002:a05:600c:1c10:b0:49b:8f5e:51f6 with SMTP id 5b1f17b1804b1-49b8f5e52bemr713255e9.3.1787847214097;
        Thu, 27 Aug 2026 09:13:34 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4af00fd2sm57749665e9.12.2026.08.27.09.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:13:33 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:13:26 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: joro@8bytes.org, will@kernel.org, jgg@ziepe.ca, robin.murphy@arm.com,
	baolu.lu@linux.intel.com, kevin.tian@intel.com, praan@google.com,
	skhawaja@google.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] iommu: Add __iommu_debug_unmap_phys() to drop refs
 by physical address
Message-ID: <apBiJk_zhaNjW0er@google.com>
References: <20260827145855.1616223-1-xiangzao@linux.alibaba.com>
 <20260827145855.1616223-2-xiangzao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827145855.1616223-2-xiangzao@linux.alibaba.com>

On Thu, Aug 27, 2026 at 10:58:54PM +0800, Yuanhe Shu wrote:
> The IOMMU_DEBUG_PAGEALLOC sanitizer takes a reference on each page at
> iommu_map() time, keyed by physical address, and the only way to drop
> them is the IOVA based iommu_debug_unmap_begin()/end().  A path that
> tears down a page table with mappings still installed has no IOVA to
> unmap with, so add a physical address based counterpart of
> __iommu_debug_map() for those paths, sharing the counting loop through
> __iommu_debug_update_phys().

But the IOVA can be calculated when walking the table from freeing
context or am I missing something?

Thanks,
Mostafa

> 
> Export the iommu_debug_initialized static key, as the generic_pt format
> code using these helpers can be built as a module.
> 
> Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
> ---
> Build tested as built-in and as a module (AMD_IOMMU=n,
> CONFIG_IOMMU_PT_AMDV1=m).
> 
>  drivers/iommu/iommu-debug-pagealloc.c | 30 ++++++++++++++++++++++++---
>  drivers/iommu/iommu-priv.h            | 24 +++++++++++++++++++++
>  2 files changed, 51 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-debug-pagealloc.c
> index 80164df5bab1..a2e55164e6a4 100644
> --- a/drivers/iommu/iommu-debug-pagealloc.c
> +++ b/drivers/iommu/iommu-debug-pagealloc.c
> @@ -15,6 +15,8 @@
>  
>  static bool needed;
>  DEFINE_STATIC_KEY_FALSE(iommu_debug_initialized);
> +/* The generic_pt format code using the key can be built as a module */
> +EXPORT_SYMBOL_GPL(iommu_debug_initialized);
>  
>  struct iommu_debug_metadata {
>  	atomic_t ref;
> @@ -96,7 +98,8 @@ void __iommu_debug_check_unmapped(const struct page *page, int numpages)
>  	}
>  }
>  
> -void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size_t size)
> +static void __iommu_debug_update_phys(struct iommu_domain *domain,
> +				      phys_addr_t phys, size_t size, bool inc)
>  {
>  	size_t off, end;
>  	size_t page_size = iommu_debug_page_size(domain);
> @@ -104,9 +107,30 @@ void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size_t siz
>  	if (WARN_ON(!phys || check_add_overflow(phys, size, &end)))
>  		return;
>  
> -	for (off = 0 ; off < size ; off += page_size)
> -		iommu_debug_inc_page(phys + off);
> +	for (off = 0 ; off < size ; off += page_size) {
> +		if (inc)
> +			iommu_debug_inc_page(phys + off);
> +		else
> +			iommu_debug_dec_page(phys + off);
> +	}
> +}
> +
> +void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size_t size)
> +{
> +	__iommu_debug_update_phys(domain, phys, size, true);
> +}
> +
> +/*
> + * Physical address counterpart of __iommu_debug_map(), for teardown paths
> + * that destroy mapped entries without an IOVA.  The OAs must have been
> + * accounted by a prior iommu_map().
> + */
> +void __iommu_debug_unmap_phys(struct iommu_domain *domain, phys_addr_t phys,
> +			      size_t size)
> +{
> +	__iommu_debug_update_phys(domain, phys, size, false);
>  }
> +EXPORT_SYMBOL_GPL(__iommu_debug_unmap_phys);
>  
>  static void __iommu_debug_update_iova(struct iommu_domain *domain,
>  				      unsigned long iova, size_t size, bool inc)
> diff --git a/drivers/iommu/iommu-priv.h b/drivers/iommu/iommu-priv.h
> index aaffad5854fc..12528a40bcd8 100644
> --- a/drivers/iommu/iommu-priv.h
> +++ b/drivers/iommu/iommu-priv.h
> @@ -71,11 +71,18 @@ int iommu_replace_device_pasid(struct iommu_domain *domain,
>  
>  void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys,
>  		       size_t size);
> +void __iommu_debug_unmap_phys(struct iommu_domain *domain, phys_addr_t phys,
> +			      size_t size);
>  void __iommu_debug_unmap_begin(struct iommu_domain *domain,
>  			       unsigned long iova, size_t size);
>  void __iommu_debug_unmap_end(struct iommu_domain *domain,
>  			     unsigned long iova, size_t size, size_t unmapped);
>  
> +static inline bool iommu_debug_pagealloc_enabled(void)
> +{
> +	return static_branch_unlikely(&iommu_debug_initialized);
> +}
> +
>  static inline void iommu_debug_map(struct iommu_domain *domain,
>  				   phys_addr_t phys, size_t size)
>  {
> @@ -83,6 +90,13 @@ static inline void iommu_debug_map(struct iommu_domain *domain,
>  		__iommu_debug_map(domain, phys, size);
>  }
>  
> +static inline void iommu_debug_unmap_phys(struct iommu_domain *domain,
> +					  phys_addr_t phys, size_t size)
> +{
> +	if (static_branch_unlikely(&iommu_debug_initialized))
> +		__iommu_debug_unmap_phys(domain, phys, size);
> +}
> +
>  static inline void iommu_debug_unmap_begin(struct iommu_domain *domain,
>  					   unsigned long iova, size_t size)
>  {
> @@ -101,11 +115,21 @@ static inline void iommu_debug_unmap_end(struct iommu_domain *domain,
>  void iommu_debug_init(void);
>  
>  #else
> +static inline bool iommu_debug_pagealloc_enabled(void)
> +{
> +	return false;
> +}
> +
>  static inline void iommu_debug_map(struct iommu_domain *domain,
>  				   phys_addr_t phys, size_t size)
>  {
>  }
>  
> +static inline void iommu_debug_unmap_phys(struct iommu_domain *domain,
> +					  phys_addr_t phys, size_t size)
> +{
> +}
> +
>  static inline void iommu_debug_unmap_begin(struct iommu_domain *domain,
>  					   unsigned long iova, size_t size)
>  {
> -- 
> 2.43.5
> 
