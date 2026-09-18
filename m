Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4D44E3EF8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745807; cv=none; b=HyCgmPHQgiSdXW3crLgGJrYJ9FWV51zhL04h8JSLk+KuHdIg/pDsF5Kk9HhW+kKJGhFlrQpIaknkBVR0YBcivcf84xUXoayxGj+fJ/gceOau5IqwJ+WM57ptPBMcMoVutioUw1y6sqIwWzoJTMjEaK6YxwURwaqgY5Tqnv1IR5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745807; c=relaxed/simple;
	bh=tLlusUVv4qYOaeeWNFcYMsujMDmVr4vyuqgN+4B4l8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZZ/QAxhdnyPLIPia4L4tNcS/QC/Q5txPggcnIX8h3A8DyO2KgEhvtyBJ951Arjo3ZPgOQBYT0vN1BZMK6lNjzv+J2katOwigRj+UrxTUMhJdqDiP5qMn+Z76sGF+UX2b0SwSxmFwv5RnsGoA49hxKkVvMgQPgWTJl1550vVL8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=oeh0BRm2; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="oeh0BRm2"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a0299c787so67671785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789745804; x=1790350604; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cl6MnsVJ2tgqjlk+JWZs6DCC+wi7QAAwiMKBJVJY4Nw=;
        b=oeh0BRm2IzXGnxASWHOt8anQrXDJT3UjOc0nqj9RnqEeWiyhggxbEGU9JZvRpvrUI1
         BAfD98gEvq+XG0bxdDFDjS0nZzp+42IetPnEkl7AZCdTCddlcz5jAgibwQpRmIUX0bzb
         bV7JEKzX8fqm/CMm8xuNHCjjRhGyHlUpbuNioWjnX4cnouLAu99bIo6lSb+vsTasOnDX
         M2CU1/YIecUn5YzqUWT7kUrQVDTVBw6xTVK1yuqRM63DUbgzjA9nXzInHuIRCA/Feu/E
         OFMHEK1/7LA7KAiV9R+VCW3InHRsIQrrP36BLVNo16FB+E7Zdmpb8jCEMNNYkjk2vHIj
         WP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745804; x=1790350604;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cl6MnsVJ2tgqjlk+JWZs6DCC+wi7QAAwiMKBJVJY4Nw=;
        b=Q7NnNqrrF7JTGghw8hwmBRwS7Aj6OuI9oeUSyyA0anrykXCT+Oucz/fOSJq4WMtlrG
         MEnr8KX9azHFnJiEFp7yPfyrtUzxpOtmLapVuHIN0IFIykx5vzfD+Ot+nB2eEWNSvHN9
         sGWfp67jNyDG+WxSoI6bvVtEbDYP6LF8YcHGXlcXSZRLcn7/EbBuUFKjMGCUZ74TFkUh
         65xo9/LkVIcQy9EttZgJu/uAJyVFugJ1QuqPR2vMpfMX3DzgyHTTLDLAC4GFMyB+u/gJ
         d1voYuPr7G+xkGZQEL0c2VgixiqZEFNSYhSHsfTzgptwMlMgHwLayZZR5EAHJzuX3jYJ
         ZWgQ==
X-Forwarded-Encrypted: i=1; AKwUvByr4nF3uT0/2V3V81rRU/4ioTL7tH9+GGCNRZ1nBWQUF41FjXG9+xLJc4ZdPykBLaUMyHU39Ol3nibLYaU=@vger.kernel.org
X-Gm-Message-State: AFuF++nnC1ajRVT6l6DTZw3VB1TPG7fjE8CNaYb1tZvJ6SQdi9sHPkCE
	1Vfu98aJzvDu+vIKXnTXVFVuIXE49RDNY9c0QEBX9G0xCI4kUfyhPm0XRVWIZJ5Lmb4=
X-Gm-Gg: AYBFou1D+MxvDvM0nTaT425zZzG9bCyoVHSiiz2w1gNwwV6XxoXnSxPkqflFlBS1Uef
	ioKqQ4EyWQGbOkXLxqbLTpxDYfjTZtHwcO37yAuZtuDpYe/vM2Or5uY0df2IfN3UHacW2yhohx2
	1HDerwqGxk4n9Zw/cg1kIpQSNAMSiwjJyA0OD0WqvPbluFLJ0XSJm8/ezSz+lJ1fCHMxlMDPMOu
	DjoNCuMdzIvDFQsmoyWGJh+bjDHOV34t6k5DwFG3trE+vWeDljBnOCyDzBDBSfEN+2Y0XUZGXYx
	phTLKJwHlIAWu6ew4B1msbmoe/9Tz7rMTfutTx7oVbirnMyvoHS5HuYy/qXfF99lrt/aBses2TV
	7IQOCGyqcpyYdnmeAcPa+ypEaTtlhcg2pF9dflDkpRtBkQFw0KeauTRUTgGJ42bRyXSycItaOXQ
	HSkxUIl0L0xXBpnh0hu8VWGaF/2hEuZEPtTosiMKC8VfmJ11468jGz+F3HDvdv37mWGrvXlM40A
	OEPcGuEOerukDr82WHmcz9W9zXIeNwA2PYDRuobjWfLkEH4648YB9Qv
X-Received: by 2002:a05:620a:470b:b0:93b:d7a3:45cc with SMTP id af79cd13be357-93bdc77f152mr382061885a.53.1789745804221;
        Fri, 18 Sep 2026 08:36:44 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0ec44fdsm163568285a.28.2026.09.18.08.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:36:43 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x7adm-00000001snW-2UlV;
	Fri, 18 Sep 2026 12:36:42 -0300
Date: Fri, 18 Sep 2026 12:36:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	"T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
Message-ID: <20260918153642.GD11599@ziepe.ca>
References: <aq1V3oeDdvXobt8J@arm.com>
 <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>

On Fri, Sep 18, 2026 at 05:23:32PM +0200, Christian König wrote:
> On 9/18/26 17:16, Catalin Marinas wrote:
> > First, none of the DMA-BUF maintainers have been cc'ed. It might be fine
> > for an RFC but this series got to version 6. We need their feedback.
> 
> Yeah, thanks for doing this.
> > On Fri, Sep 04, 2026 at 04:04:50PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> The system heap can allocate buffers that are decrypted and shared with the
> >> host. For confidential-computing guests, those shared buffers must cover
> >> whole shared-buffer granule; otherwise a userspace mmap of the dma-buf may
> >> expose only part of a host-managed granule and allow unintended access to
> >> adjacent private memory.
> >>
> >> Require cc-shared system-heap allocations to have a size aligned to
> >> mem_cc_shared_granule_size(), and allocate pages at least as large as the
> >> required granule. Keep the allocation bounded by the existing heap orders,
> >> but fall back to an exact minimum-order allocation when the required
> >> granule is not one of the preferred heap orders.
> 
> Uff, I don't think we can do that.
> 
> That is massively platform specific behavior in a non platform
> specific code.

What we really need is an allocator API that does all this for the caller.

It has been pointed out a few times, Aneesh maybe you need to try to
tackle that?

dmabuf heap just wants

'allocate me an array of shared folios totaling XX bytes'

Arch code can figure out how to do it. If some ARM configs only give
order 4 folios or whatever then dmabuf heap doesn't care.

And solve the double/triple zeroing problem.

Jason
