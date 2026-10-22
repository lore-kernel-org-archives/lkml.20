Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697730;
	b=CGnz6gqOgStqCaSO11ZqYE+vB3jhwNiGNsKZ810LjIyZtrugD9HrXE6n7CgxcohBc5hy
	 RQwThR7yVBV7pXYP32ZH1Q2D5QLiFNeAZQkKuyuCnOinUPYSnmJcfc4dmj0P3uWDlhuRs
	 gYSPyMowRX9TpEHP1NgFINVD5Qh2XfRd4GiHttZQ0UZhJXR18ACBBgExvdXdOI2O0VHEi
	 vg1gsCYM3nwVqD09rWAF4CxOjA0T6gaBoeP+RBcxyd0a/YekH/N62LU+N9O4+bdwQSHdi
	 vqxLqSrhkRghkatGrycVHV308f1fKsQqKgfdcWDqJXXOuaEyTZWGBs59O16LAMDka5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=56b7HTZvlpKC4tZk577CJ8+w/mtcoo97dNOMSZZwtIA=;
	b=Q39DFyrcqR9E1ASpYC44RO5yP3jw77T/vG1EmECUM7pW+V19pfNAeQk+61yePzeyWzlR
	 nBSKEUKzJat5wMn4Yd15cG05dvf6tRoW4QVtv8d8upRsJSBE1JGiyQCBm5mJz7MlxlqMw
	 NdlwDzgYfrEj67vpvVLYf7SYhzTtg9VtwV6YTUI5+zIgIfdi9WaM9/7OWhXOzzel6weNy
	 g9dwsQBYfWTS3PahAmL5KZvEYK+oumJEkZ1bSc/tlZpUt6WkaKOJmTdnHd72YWhomWeRQ
	 tAp6MLAf4l2CY+IqaWF92L0E+pWqeeq5OnA6TDywwT1YI7QM4RXRYtiLB5h+lDGH5ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="PMdp/ssP";
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BEF606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9BEF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=PMdp/ssP
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93cc1ab5f6cso14440385a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792697728; x=1793302528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=56b7HTZvlpKC4tZk577CJ8+w/mtcoo97dNOMSZZwtIA=;
        b=PMdp/ssPxgZMUrGwNR3Bi1/qfM8gMx+PxIvSc1WnlPJyDTsjgIIkEzrC6lRq6jruVG
         LF8YN3PvUoRYi+pwrW0xef1REaOMVCXkVv52uKDGmTuMWiXRGcOlkvkxhydApZh1H3iJ
         30+lFkiaiUACZsDIJXmowV9Btzkwb/7tEafCfP9QRb/YTWXqP7XEQlJ/glhbRu30OZAZ
         Ibo1AqpENbfBnwrk0BmlzhkDHWGVyvB7pVn4WjtFsWPGXAAOTb/CCmselXNXTJGj6rLv
         HR7zepmdgC9fDWadX4wGSaqHNzCLsFjS8xcgtalMfGJQRg+taGWoC+N1brAzEuWLRdsQ
         HGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697728; x=1793302528;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56b7HTZvlpKC4tZk577CJ8+w/mtcoo97dNOMSZZwtIA=;
        b=ZB98ujMh6pmCS09wOAjqrQgJbLTb7jGzUjGDmK6g4CtcdBf7u6RNgpuQtBfctqVq/F
         fbBYSwUaO2YqsQVP2N8au5Ib8H62nKZI3PGlUdIUbfLVPXytqrGiuOFXLxx2vthvIml9
         YDi/HES72WZC6BQ5DXT/f3BDiq4TCge3lj0WoEGa7E0wSQzCbVKxGEf5KsAoNIIh+vkj
         mH0ZEHdcPyxTW7et5ydZ5/5DNWkEeqIULIcnZ2ClWaArhc0aHJMrHkbB5lNcNZ0lmkd6
         OkpJ1U1bSXn3x5jpQH7XRXZrJUoedYgs6tz9jpFeemAKpTvEiKjHwRHAMzrCnONQgVFg
         SrDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOvM1HeukRLUCMyXDE1e3hVjG1f8To3h1j1+OhJhkSBbmwAkSG/soOgnjfPzpD002qTjr+uxer9QovsLs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwOEwtLBHfwCY7ho+efjUiP3dgwjWxveaEHiP/1BRo+yV2Vsn7
	m4wzKLGoNv7+ZDhqRd0nxDTcszphE88VapsVt1fd33SD9kxlbuydQQgd0dJvjkzL0KukfQiPc7/
	gXJOs
X-Gm-Gg: AYBFou3y/JvXq4Dt4blYy02aSQavxSnR+jqY5L0+Yk3/PLHkIkEya3YjOwgdkaWaRDU
	wkutM1A5MO/5H98b513je5BIf5dUqS8+VcPVIEyqJ+GyL9WjkMgrSD0D+S+HW+CtK5kkhRPMX7w
	c0lgW4FGe8T185+QzfT2ivYVBLDjHCNIU63raxN0ZOeGxGYqjWLeHxkfIuOHQeVWjxCy/5+A65A
	TRoV4VvOPlhFeDws+VTa+7AudXXWCaIcsLx8lt75S23h/ytfsyXqCzuzBoJ3nSuPHzT8aRUyJ1k
	iCIfdB4cR7HGkvT6mMwCFzInfwmi+Za3oERpmjP3QjmphNO3nAGhJH1L447rqVAm+i+iQe9yXkQ
	YJReG/jHy225lIRyX6q0LYR7y+rDlTR2rpZsvR+VquugYNS+mtoOlw8vwaXP9qhuN3/Tej4fUTV
	sluGcGFl5D0zAwrHP5JcrJ/57PvM48VbO6W6n27YCyWusX6A1HL0ofina92R2CgR85oyMwvBk4J
	1iJxuQxCDnX9/zJJob2qo656Aimy/MHKNxizlHCXwZxfsKe6cYdjfQQLtm6I/5gJf0m4SLHfZmh
	igHLEo5ca7RDBd/07VAWME1CtOhcW2MllEhQIw==
X-Received: by 2002:a05:620a:2794:b0:93e:c6fc:7f50 with SMTP id af79cd13be357-93f6f79dc27mr75461785a.5.1792697728579;
        Thu, 22 Oct 2026 12:35:28 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c39766a93sm366276d6.43.2026.10.22.12.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:35:28 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJyZT-0000000FmQW-2RHj;
	Thu, 22 Oct 2026 16:35:27 -0300
Date: Thu, 22 Oct 2026 16:35:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Cc: alex@shazbot.org, iommu@lists.linux.dev, joro@8bytes.org,
	kevin.tian@intel.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org
Subject: Re: [PATCH v3 1/2] iommu: Add iommu_get_pci_resv_windows() helper
Message-ID: <20261022193527.GG3381610@ziepe.ca>
References: <20260921115513.GK11599@ziepe.ca>
 <20261004162213.3787623-1-guanghuifeng@linux.alibaba.com>
 <20261004162213.3787623-2-guanghuifeng@linux.alibaba.com>
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
In-Reply-To: <20261004162213.3787623-2-guanghuifeng@linux.alibaba.com>

On Mon, Oct 05, 2026 at 12:22:12AM +0800, Guanghui Feng wrote:

> +int iommu_get_pci_resv_windows(struct pci_dev *dev, struct list_head *head)
> +{
> +	struct pci_host_bridge *bridge = pci_find_host_bridge(dev->bus);
> +	struct iommu_resv_region *region, *next;
> +	struct resource_entry *window;
> +	LIST_HEAD(resv_windows);
> +	int ret;
> +
> +	if (!bridge)
> +		return -ENODEV;
> +
> +	resource_list_for_each_entry(window, &bridge->windows) {
> +		struct iommu_resv_region tmp = {
> +			.type = IOMMU_RESV_RESERVED,
> +		};

I didn't try to look, but if you are going to add a function to the
iommu core then dma-iommu.c should also use it so we are sharing the
same algorithm.

Maybe a callback function would work better to that end than returning
a linked list?

Jason
