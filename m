Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793125790;
	b=Rh+1/SJ/hy+X27cnB9Ib9ZHfSNGdkFdgNENDCsfdwzoryNpci5NgrJnjsAiJ7yXaBpku
	 vLLMJId/cGKRsrbhQjbk6fDnpdKBkD96Hdz7sXlxqL0WcaRwJJrkrwDe5s9oNMPu3VLHK
	 sWlrZ7l0vnpHq1CM7PHfQlj8E6GktHhv1MtQgSoWjexRto3JaoWvjEej7UMGp9l8CWw01
	 W/lFMvpAX7rcVMeHSUl/ZRSnBJZeXZfQpKNfNZaZlaAlNY4Vf1W5mG0h8A+p8chdoBnj7
	 qyUR79MR0Fii+KVtAYbZyOrm324CNEKP8f+f5UWONF+Wkuo+xyyvoXS37V5GAmpks3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=65AOdH+KgJ7resuIkk0VLKCd0Hg6dbezaVp42JhIP6w=;
	b=Gx8Ot/CHGFQ+Dr0t1phorjR+GXrWvdzl+qCQpYriH8cIsanPTegLT/1ELi09G1R2e3ST
	 El/Y9a52VJkksjihpn6fHh+bnqKDSS44SK7SR6OXchr9upyrWgmqFYSclvoY975/Dfv1j
	 Mf+83xTCqjLhS/X1PxMGJ+u7bF++sv8mgV4Hkr8H/TUbyypEYuXURLDcJHeNytelmQJqj
	 HVNPShYF4RiJJbg1l2whZOiu/P5WOPZ5U/kO05U8jGySW2rll3IcOZgBA45XNhAKiR9WS
	 OX+Nn44KOxJshWD4bv5k5X8Q6iK25ujQ9HY33Y0OYt31Mjm5UO/lhx2Ii6wxarV0Z/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=SDf8V7lB;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41314606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41314606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=SDf8V7lB
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f20b304c0so6051085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793125789; x=1793730589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=65AOdH+KgJ7resuIkk0VLKCd0Hg6dbezaVp42JhIP6w=;
        b=SDf8V7lBjv388ciVxF8uawdikbXUurMY3QTcrM/wcAZ1ed7iS37PQd3b8hqO2kCFRx
         gb01WAvT/GWqjH2M3gvp5nTNPCdjqqbhamh82v5BqHlkHZ5tX4RxpCPwN2S4eUTG5rVF
         nIdZZZGD4xKmj4PuO/zIngGRg22kMAXrxt/v8LL8XDjWsrsGlv79HYheSxhWI3VNKxID
         XDKOc6PzG3HNgjgHvM7g9tfMAy3iHn90923OHajXdDxFRJMsWg+n/gS+difaZDQuJM6Q
         mCREG7y1/geLjkqkzCE3n+m53JskTRCmddX2n4uYmhS8wHPszgiRnJhqvNsRxFtnRK3f
         RK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125789; x=1793730589;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=65AOdH+KgJ7resuIkk0VLKCd0Hg6dbezaVp42JhIP6w=;
        b=s3JHUW5MJMxGPvkBTsCMMehp7pLQw0y4qVHzjQJil3EfkLIGrl8ioa/01dxkjeMjTk
         38/E+rdAQBfRafQOMW/msbBqtLPumPSPINsoBT3URFhE//nBjtXtYWbb67JjES2WnRa9
         3StlD0Egr3um3am5MK1ZUPFAKQRbs0IGBoX5TCwoG6LULXQZp0QyRbEMQ7wZIsBO+wnE
         wrNTshyPsAkTM/U1t/QRFf6rtyOOmq/FBqG2s8CEskZdiILwjkAtAS08AFCRWmRrHgIF
         8mTF7DNo4j1PvQGQjvIED5lR91ZbmoL5zhil7/dxYoBA7wWsFKE4RY+Q84hUHn7HeSsz
         5Yjg==
X-Forwarded-Encrypted: i=1; AKwUvBzjuccMbALLFqcdygTuj1gkFdddR5C8uyNTc32lLCBkBOJcIkb8gL75vdqKCzQ8ehGdpejQYOuh0gDYP98=@vger.kernel.org
X-Gm-Message-State: AFq9FYLR79U1uz4D1C7/Ij6zuAMtvkqdDGzmbPgg8X0mBMyf2GnwY+4I
	IFei+SErJl/KGp1TAYi36Lsj3zb/zoISuhfnJ9ijF3tBJ9XMdXaXWGCNnW9gjI0D21zWrw8KPc4
	Kt6Rk
X-Gm-Gg: AYBFou3d73oUeRWqhzRWuWUYYeQcnUYrJoFZm6KYUp8HUZoz11xm5ZJ0okNtbX9if4/
	F4npKINXKd3++P49CQRx+AiK53+WUoDFmNeto9jAI4AjqfMIBKpo7JuSpXOTbMIV0450sk6jOdz
	WdVR8ziWZZpOdqqjL0Lod5vvn70WXDygfig7VlybE7tLwDO9xJIUmAkG4V+GbjKiaZrDkv9GLkx
	QqViWYTROXQjbPB+6BAQj/Rn+GdvUPAcJACsnKXLNWFaNmT6afgCLqxirAY9B92g1MT8B2c3Bof
	wjQWc7ajtv1rc7ymmHFzeSx0mmO9KwhirCQYidV1shGtNCVfuPqpM1/sh6Kri4ngXTPCcjZ5HBh
	b4yMkXhWWxOfWK5Zc/mGL7jvg+5lu7G+35qieZG1rPVYKxSGz8fPSob6kzPGVhKtsQ0ONZMNJD/
	kt5s0vWFVVyWWZT1LAmxDhu4NnEjOzKykFsiweTZE5YcwKfu64Qx0/4di4GEBCHIBTtch6phYcf
	8N8bG2Zd7/9Ydk6TX2Q1YLMmFqpb3EvuBPegyLl/8YcV/bim1twOfkbWF62Z9xtkF6DikyHlKQN
	5b9ceuEMnOVIRsIRLrJpdslWgtze0JiVQQWu9g==
X-Received: by 2002:a05:620a:2a03:b0:93e:c12c:9dc6 with SMTP id af79cd13be357-940ef9c39f3mr1650841185a.70.1793125789315;
        Tue, 27 Oct 2026 11:29:49 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f06690c0sm1051945485a.11.2026.10.27.11.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:29:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLlvf-0000000AgNQ-0B8b;
	Tue, 27 Oct 2026 15:29:47 -0300
Date: Tue, 27 Oct 2026 15:29:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Cc: alex@shazbot.org, iommu@lists.linux.dev, joro@8bytes.org,
	kevin.tian@intel.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org
Subject: Re: [PATCH v4 1/2] iommu: Add iommu_for_each_pci_mmio_window()
 iterator
Message-ID: <20261027182947.GI1685504@ziepe.ca>
References: <20261022193359.GF3381610@ziepe.ca>
 <20261025133000.205508-1-guanghuifeng@linux.alibaba.com>
 <20261025133000.205508-2-guanghuifeng@linux.alibaba.com>
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
In-Reply-To: <20261025133000.205508-2-guanghuifeng@linux.alibaba.com>

On Sun, Oct 25, 2026 at 09:29:59PM +0800, Guanghui Feng wrote:
> Add a callback-based iterator that walks a PCI device's host bridge
> MMIO windows and invokes a caller-supplied function with each window's
> bus address range.  This consolidates the bridge window enumeration
> logic into a single shared algorithm in the IOMMU core.
> 
> Refactor iova_reserve_pci_windows() to use the new iterator, replacing
> its open-coded resource_list_for_each_entry loop.  The callback approach
> avoids intermediate allocations: the DMA path's callback directly calls
> reserve_iova() with the computed PFN range, maintaining the same
> zero-allocation overhead as the original open-coded loop.
> 
> Using a callback rather than returning a linked list of iommu_resv_region
> entries eliminates size_t truncation risk on 32-bit PAE systems (the
> callback receives phys_addr_t start/end directly) and removes the need
> for allocation failure cleanup paths.
> 
> Note: commit cd2c9fcf5c66 ("iommu/dma: Move PCI window region reservation back into dma specific path.")
> intentionally keeps PCI window reservation out of the IOMMU group-level
> reserved region API.  This iterator respects that boundary: it does not
> inject windows into iommu_get_group_resv_regions().
> 
> Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
> ---
>  drivers/iommu/dma-iommu.c  | 29 ++++++++++++++++------
>  drivers/iommu/iommu-priv.h | 25 +++++++++++++++++++
>  drivers/iommu/iommu.c      | 51 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 97 insertions(+), 8 deletions(-)

Seems OK enough

> @@ -504,6 +505,20 @@ static int iommu_dma_ranges_sort(void *priv, const struct list_head *a,
>  	return res_a->res->start > res_b->res->start;
>  }
>  
> +struct iova_pci_resv_data {
> +	struct iova_domain *iovad;
> +};

We don't need a struct to pass a single pointer

> +struct pci_dev;
> +
> +/**
> + * iommu_pci_mmio_window_fn_t - callback for host bridge MMIO window iteration
> + * @start: First PCI bus address of the window (inclusive)
> + * @end: Last PCI bus address of the window (inclusive)
> + * @data: Opaque pointer from iommu_for_each_pci_mmio_window() caller
> + *
> + * Return: 0 to continue iteration, negative errno to stop and propagate.
> + */
> +typedef int (*iommu_pci_mmio_window_fn_t)(phys_addr_t start, phys_addr_t end,
> +					  void *data);

Don't really need a comment here

> +#ifdef CONFIG_PCI
> +/**
> + * iommu_for_each_pci_mmio_window - iterate over PCI host bridge MMIO windows
> + * @dev: PCI device whose host bridge to scan
> + * @fn: callback invoked with each window's bus address range
> + * @data: opaque pointer passed to @fn
> + *
> + * Walks the MEM windows of @dev's PCI host bridge and invokes
> + * @fn(start, end, data) for each one, where start and end are PCI bus
> + * addresses (inclusive).  Iteration stops early if @fn returns non-zero,
> + * and that value is propagated to the caller.
> + *
> + * This provides a zero-allocation way for both the DMA IOVA layer and
> + * iommufd to enumerate the same host bridge window information using a
> + * shared algorithm.
> + *
> + * Note: commit cd2c9fcf5c66 ("iommu/dma: Move PCI window region reservation back into dma specific path.")
> + * intentionally keeps PCI window reservation out of the IOMMU group-level
> + * reserved region API.  This iterator respects that boundary: it does not
> + * inject windows into iommu_get_group_resv_regions().

The last two pargraphs are not very useful

> + *
> + * Return: 0 on success, negative errno on failure (including from @fn).
> + */
> +int iommu_for_each_pci_mmio_window(struct pci_dev *dev,
> +				   iommu_pci_mmio_window_fn_t fn, void *data)
> +{
> +	struct pci_host_bridge *bridge = pci_find_host_bridge(dev->bus);
> +	struct resource_entry *window;
> +
> +	if (!bridge)
> +		return -ENODEV;

Can it fail? The existing code doesn't check it so I guess not. Stick
a WARN_ON there if you want to keep it.

> +
> +	resource_list_for_each_entry(window, &bridge->windows) {
> +		phys_addr_t start, end;
> +		int ret;
> +
> +		if (resource_type(window->res) != IORESOURCE_MEM)
> +			continue;
> +
> +		start = window->res->start - window->offset;
> +		end = window->res->end - window->offset;
> +
> +		ret = fn(start, end, data);

Don't think we need the start/end variable either

Jason
