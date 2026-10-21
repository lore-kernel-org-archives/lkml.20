Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580247;
	b=f4/THTDZQNp9oL8JcoK8wIj6yfglC+zPCM9U1dQ/Et1HUi0HN7PP1uymcwjLS1J5FVf1
	 XqPPtSrCfOB5eoJ0tD37YhPhkPP3Ya1SgKAzrkKvKI6+BjK7y0k01WRKfHrkFo+OPDwYi
	 92pSghCzDstxPySoblbTXHXJ5IwXgPU3vHMP+jVw0QnovA56vVzdqj2nkVTV3Kirj+iyz
	 2UGgdt0ysVekcRuKXoJHSSRmPaYyKYVoqKbmrAzZvQnJ17VzNA/Gngq1H72GsasbgHi7D
	 I60aEB/w0M8MysUC0ItgBgDtimaG6W/rtcLeWPoUXnKrR1ltqgYo08CUYt8fZbagr+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QrPap46ytWVKYSj0iI7Hoj6ISMs6lq3pSRcSmymoflg=;
	b=GsYowdrRzE/b+q1d0mVaAABrX1c2KFbTYFA2RpYAddvdCvfobdhyWyYSV+UVVmC15XuZ
	 0tC4HH5KCFW2e4GHPDCth9wvXh1n/x0LRM+J6L7h0KE/jIgXZHgXUx2BEvwgBJTfKA2rs
	 I0/htKrNBsWW+0ci4PkYHUi997E6KnbYXc42pePev17zqPH7x3RKXUaGwNRI0FU1VsmWY
	 /6NPHE0j4EpX5Khy6Tsw6E0miwVTvwrULpRdiQO6Ey/Q24JihDlOgEfWntnzjE1ibhu0z
	 6mDF9B7uoXL6IJvAIDgHcOFPqM5i+ZkrzMJzlWvGdL8CtBfbKRhA2iXCtPF7DNh6Yxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=K9FHrqLd;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06CE606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B06CE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=K9FHrqLd
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1fef02989so19515e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792580245; x=1793185045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QrPap46ytWVKYSj0iI7Hoj6ISMs6lq3pSRcSmymoflg=;
        b=K9FHrqLdKhEKTusfXH7+g6zbV+wQLcZ++y7rAvQ2nG+6gY68Z9U0wraZDGIHwlZiqg
         CmU++vYIR4Pg78vEHbkfdPvhIh7NMBf0Q/WjP8v7rmWVUDHChPaLm+4FK5thfmMVgwJv
         ngOi0+0nMoy4H1VKj23048LMLW4VKeOaIu4dL4ow39wAsfI6JaesFn0VN9Ra2UtaeZKe
         POdMzzd3ZI2zNEoMLIRN9gbE0Wkq1QlNes6pnFNKRd/SeUFrsx4+ut6Yhw/NEV/JVRj7
         Li5DFR7/usK9MICPN7eK/jigisQnoaTX2kMvy83XYuwLHtfmSWr39nWUFzzKZ8gcxjJt
         jIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580245; x=1793185045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QrPap46ytWVKYSj0iI7Hoj6ISMs6lq3pSRcSmymoflg=;
        b=IiJRp135QjxKXqbrYQQFy9cpNdgc+cK1KljB/I7lOjan4LKDNgHkUscLa1oM6iX3nP
         /i35xe9H27LkCiwLQmWDusrUU4Bxl66R3yuo4ommuLkfE0EwFIU5x4jr4e891LmxNF/y
         PTVDXWMUQVukFJNHa3X0kIZO6tp9ddloGghPFeHo2D4Ov6AIsjb1g//wHAwAtatGUvNV
         pq/FqfUcWzzXlbS++z4gNyaKszbvb+4f7aLMuKSATwXUEfOq3KDzXwAkq0TBrJDBy/IT
         ukZwdCZqWICrJ+5Ry4lJAofc6YNYuvj03x9Rltp3r7axIpg33At+xFpr2Un+4rZhArBC
         WWdQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9GoFmK8RiIEpmQmT4GBpyw6qnmB8bLDV22blkjXg09qQAmkF+t7ooJvac1ciQMCw2/2n3jMb4CLg2+58=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPYwjZt+6UWNruupqIbJuqe9b5z74wzlrvfbIfwkJJpdi/pz34
	1F2Dyih1DKkUM/Hj8PZXvPgZAzb4IeXpJexV+XstAZ3OS0Aw9iotkzAWQtRCYCkf4Q==
X-Gm-Gg: AYBFou0fbN6k6OJC9aW4XAoUmyGaFM0Mxg2JV3cKegrdsMwcTYMhjbFxXyM/n13r2oq
	wOJT7TgSii8Zx0IPt/cOTXzN/EUHTLB31wrPj398IW3Nd5sG1dShidxsYC+oqIixr4IIk7VlO8P
	ChfVOS4ots4xwiWJftT01ORZvjDcwA5itmHXCiWKcUzOfYvZSl6LYIg6lSjj+/OhOdYFDX7Ggdw
	+yGKWUeumRVv1vJtRMieou/XoYM1Y34ixqRfsDi4FHJXLd+P8VbrOUtVhrKDlO/7p8c9kalJGkF
	1ybk6bUC/LGA1a7KpPeb6R/oMI3yH4qmHYZ8LBFbd9r0+zX/9zmhKUL8VG4xMOtqM+dGdcxe6B1
	xU01jLxxADpeXg7sCGIQ5lXwj/asYC/SOOKKAY+eCEt/+SSHRA2iX90x7qMllSxS7ECUZZDCuRK
	+e3TLuoIcbqWap52I6P/MUkJIDqJY6ZLS1vcpmlp0GT0voFMRWceJPOpDqukOXwOork4KxRjBnH
	oTZwcFMuRubD4eTOmfP0QpL57OAnG7hr0zbA4mBuwZ8VJGh+IZv1rBtRvVHzo65aMK8Q6Gzorer
	HLPuxaJ4vhRyS9nT7jxgzs7+q59lNQDHzWIcISp8TUCi
X-Received: by 2002:a05:600c:a3a5:b0:4a1:a48c:17eb with SMTP id 5b1f17b1804b1-4a1f59a5836mr1496985e9.11.1792580244647;
        Wed, 21 Oct 2026 03:57:24 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm104658535e9.5.2026.10.21.03.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:57:23 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:57:20 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: iommu@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Wei Liu <wei.liu@kernel.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
	linux-hyperv@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Mukesh Rathor <mukeshrathor@microsoft.com>,
	John Starks <John.Starks@microsoft.com>,
	Souradeep Chakrabarti <schakrabarti@microsoft.com>,
	Yu Zhang <zhangyu1@linux.microsoft.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Alex Williamson <alex@shazbot.org>
Subject: Re: [PATCH RFC 1/9] iommu: Introduce external attach domain type
Message-ID: <atiakDqtuED2cTM5@google.com>
References: <20260925190742.1575380-1-jacob.pan@linux.microsoft.com>
 <20260925190742.1575380-2-jacob.pan@linux.microsoft.com>
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
In-Reply-To: <20260925190742.1575380-2-jacob.pan@linux.microsoft.com>

On Fri, Sep 25, 2026 at 12:07:34PM -0700, Jacob Pan wrote:
> Add IOMMU_DOMAIN_EXTERNAL for externally managed domains that move or
> attach devices to another VM address space provisioned by an external
> owner, such as a type 1 hypervisor.
> 
> This is not a paging domain and is not sysfs-selectable as a default
> domain type. It requires external owner context, such as a vIOMMU.
> 

Can't we use a IOMMU_DOMAIN_BLOCKED domain for that, AFAIU, the host never
inserts any mapping?

Thanks,
Mostafa

> PV IOMMU drivers are expected to use it when moving a device to a guest
> VM with an already-created S2 IOPT.
> 
> Assisted-by: GPT-5.6 Sol
> Signed-off-by: Jacob Pan <jacob.pan@linux.microsoft.com>
> ---
>  drivers/iommu/iommu.c | 2 ++
>  include/linux/iommu.h | 9 +++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index cd1bca7ede9a..d0bd3ef00379 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -220,6 +220,8 @@ static const char *iommu_domain_type_str(unsigned int t)
>  		return "Translated";
>  	case IOMMU_DOMAIN_PLATFORM:
>  		return "Platform";
> +	case IOMMU_DOMAIN_EXTERNAL:
> +		return "External";
>  	default:
>  		return "Unknown";
>  	}
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index ac43b8b93f14..ede77b90f0fd 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -188,6 +188,7 @@ enum iommu_domain_cookie_type {
>  
>  #define __IOMMU_DOMAIN_NESTED	(1U << 6)  /* User-managed address space nested
>  					      on a stage-2 translation        */
> +#define __IOMMU_DOMAIN_EXTERNAL	(1U << 7)  /* Externally managed translation */
>  
>  #define IOMMU_DOMAIN_ALLOC_FLAGS ~__IOMMU_DOMAIN_DMA_FQ
>  /*
> @@ -207,6 +208,13 @@ enum iommu_domain_cookie_type {
>   *				  represented by mm_struct's.
>   *	IOMMU_DOMAIN_PLATFORM	- Legacy domain for drivers that do their own
>   *				  dma_api stuff. Do not use in new drivers.
> + *	IOMMU_DOMAIN_EXTERNAL	- Externally managed domain for moving/attaching
> + *				  devices to another VM address space
> + *				  provisioned by the external owner, such as
> + *				  a type 1 hypervisor. This is not a
> + *				  sysfs-selectable default domain type; it
> + *				  requires external owner context such as a
> + *				  vIOMMU.
>   */
>  #define IOMMU_DOMAIN_BLOCKED	(0U)
>  #define IOMMU_DOMAIN_IDENTITY	(__IOMMU_DOMAIN_PT)
> @@ -219,6 +227,7 @@ enum iommu_domain_cookie_type {
>  #define IOMMU_DOMAIN_SVA	(__IOMMU_DOMAIN_SVA)
>  #define IOMMU_DOMAIN_PLATFORM	(__IOMMU_DOMAIN_PLATFORM)
>  #define IOMMU_DOMAIN_NESTED	(__IOMMU_DOMAIN_NESTED)
> +#define IOMMU_DOMAIN_EXTERNAL	(__IOMMU_DOMAIN_EXTERNAL)
>  
>  struct iommu_domain {
>  	unsigned type;
> -- 
> 2.43.0
> 
> 
