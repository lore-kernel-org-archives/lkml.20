Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5E3489898
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847549; cv=none; b=Pe/KoGF//pIRBv73NWTs2jeIr2BjbrZofc9lSmwnFtto7oeu5uLbL4skzxw3P9amuwmexCbrmjcR2DBSyjAOKOi2EyscAxVtGVsa8wcbfy0oXmjNagedXsI7tK05ezNhi9ZF2scMq+oqoNNeVhAeB+1x4elxEFzaRYRd26wjmfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847549; c=relaxed/simple;
	bh=DiUjG0T0zuWI7L/yvvGgeVYz8NadRp7w7Ygor662/N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Suro/HtlVsfMmsjUCmUnLU/YblKfmdbu1jwMD689xscXNotell37R7xFqoMk2rQPjGJAvQROJBAkGrAUaILQB2xRvps94flYC49RLrG0+G+Z0SdGAX2Wfj1TT7YdCUTOPFOH9mF58f9PkiDiMfKZMGV0Doe0u1KFaCOcjZRmasU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=LYDRm7th; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="LYDRm7th"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ee43b3e5abso808376d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1787847547; x=1788452347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PHNKzqddJq8qH4vR69ILQzFreGWmgpWijEaEyQN0PLk=;
        b=LYDRm7th34enxBDsL7TqbF/MVAVnirCgzdLFdEG9e3Jr9EIWaxU+hjjhCKHrVu4YJL
         wAYiCR2R8gp+c8qd80cgntoknhR8OUjm0UEmUH5GoKlLTQLYchP4WSaZXIsohrD1rH8I
         BJHlUzt/+ak7u8/fNI1jMfac5V4GIZ5vabyo+sWlYrZwH2sP5ELt52xSctSd2MkOxdGe
         pg+p6LL4cj5iWjF/Tb8+F71zksgIKF1Q+hPnaHSM9pYgsxYSQ1Mwv0I3VHKQ9e7ErEig
         B7SRD5uPZSHCjqGuIWsOXQRpX/DGDWZnXKosjl95ife5LBy41jybXnbbHjVmTVb6Xm8m
         waKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787847547; x=1788452347;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PHNKzqddJq8qH4vR69ILQzFreGWmgpWijEaEyQN0PLk=;
        b=jqdw019kIRJvsK/ZyTrXr8HAhOl8JRJCPj5vcmUQykutK/uKul6DILYGbdFiXqC8Lp
         wBSIExSehydkXq/RFYO9nXCwU4ts7TND2MXDSNhQ4DlEXqtKX/BzF5Stn1sCm9jeLJb6
         zg+7lDJ7bmiWKONS/fzZ6MCQk9R9UjAPtIy48Jx/1Y6j8Ipr0aFOIqxq7t2bGP7wbuZe
         p9v4z7m4gjzLm2/Md5IXFbC1jqHXaFuIzk2NfddG7HCjflqJMGEwAbLufZk5qEJgjggK
         ofNSoASaaF0/f3G4xqE37qJkIRdAlL8r5txVl/sh4g2oQmUJqlWmFanuThQB9vcaF+08
         kI9A==
X-Forwarded-Encrypted: i=1; AHgh+RoCVVvc9umRh+f0cPaa6KtNk7RPnczpJlX50pWiE/EPHSV9DmGxe9qkoIhrkZLWojHPCd6luyaUtwuF5r4=@vger.kernel.org
X-Gm-Message-State: AFuF++lZ4VHns4vNIe1BB6ooUbzKaHBuH6pQ5BAZDjrGsDDplQnL+4X0
	d+X92fFIdvcdKV9nexnO0J5qqTsnK15xxJv5KLRs0dVNeUoNlmS+UmJdymCCouO3TQQ=
X-Gm-Gg: AR+sD11wcXDDAErS5siQVEbGw0sO7Gp4hyF9uPfpwMrTRQgiZnuqgz7GfK0JZn6746l
	qz+i5qRshINTeFVhlGq7/jLJSnwaCu33NBIdsiFrxYk9MF0SKe1a1nAObd5Ccpfc2RQSNZCkjbP
	urSZBbonKJ3cVHW8KZHXdGLwAwFa9GucaTrD9/ARVTL5X/694Mp5dcCxE+fRvA6pay48xbCXfbA
	MKWAs5CpaZFbn4/6JM6XsmDYMJX74cJV5X8cLVqMxRQxGySCGcq9MxTDvTM1DHya34NdkAj9ySv
	Ni2K7PmeD+Ji4doXssHdBQoGEZn9u9Ehm1eIVHqIWvgfIQdgv7pNF1W+iFC2TS6brZghGeg7baQ
	KVYnuoeF+753SLcqNCknaMtVX90ACnvC6TLowDDSVjuY3LKZBYmGSYtOLic8PZej2zeMOa108r7
	vR+upfZ4yhqGVYBg6AzIh7b+fGjV05+1nbUQ9xZxgtadmvRtDqg5Xn445rQLB2ED9To03d4RTcd
	nowXYbbyjO4tbPaRHHrPk3solfcuIXJde88r9+KyCyrnw==
X-Received: by 2002:a05:6214:5b0f:b0:90c:5947:7e60 with SMTP id 6a1803df08f44-90ce0c3d7bemr5926226d6.4.1787847510292;
        Thu, 27 Aug 2026 09:18:30 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cd73fc2c9sm19944946d6.35.2026.08.27.09.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:18:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wzco8-0000000G4Wr-2czS;
	Thu, 27 Aug 2026 13:18:28 -0300
Date: Thu, 27 Aug 2026 13:18:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	baolu.lu@linux.intel.com, kevin.tian@intel.com, smostafa@google.com,
	praan@google.com, skhawaja@google.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iommupt: Drop pagealloc references during domain
 deinit
Message-ID: <20260827161828.GA3769797@ziepe.ca>
References: <20260827145855.1616223-1-xiangzao@linux.alibaba.com>
 <20260827145855.1616223-3-xiangzao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827145855.1616223-3-xiangzao@linux.alibaba.com>

On Thu, Aug 27, 2026 at 10:58:55PM +0800, Yuanhe Shu wrote:
> Since commit b948a8722848 ("iommu: Fix up map/unmap debugging for
> iommupt domains") iommu_map() takes an IOMMU_DEBUG_PAGEALLOC reference
> for every page it maps into a generic_pt domain, and those references
> are only dropped by the IOVA based unmap path.  When a domain is freed
> while mappings are still installed, pt_iommu_deinit() releases the page
> table memory without dropping them, so every mapped page stays counted
> as IOMMU-mapped after it returns to the buddy allocator and each later
> allocation or free of it reports:
> 
>     WARNING: drivers/iommu/iommu-debug-pagealloc.c:91 at __iommu_debug_check_unmapped+0x4e/0x70, CPU#0: init/1
>     iommu: Detected page leak!
> 
> Freeing a domain with mappings still installed is not driver misuse:
> the deinit contract in include/linux/generic_pt/iommu.h only requires
> the table to be removed from HW access and caches, with no requirement
> to unmap first, and the kunit suite itself frees domains with live
> mappings in pt_kunit_iommu_exit().

It is not misusing iommupt, but it is definitely misusing any iommu
API built on top of it. How did you trigger this?

> Verified with the generic_pt kunit suite as an in-tree reproducer:
> running the x86_64 format's test_pgsize_boundary() with

If this is the only trigger, then it is different testing things
interacting badly and I don't think it should be fixed like this.

Probably have the kunits directly unmap as they were being lazy

Jason
