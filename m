Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACAE4DAF90
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162728; cv=none; b=m3qeiO2US2Jo4v+RbLM6jjXknqtcJBlnQdChBIbgKgsTlkmIuiI/RYODsE7yxpwJR6QMm4PyaVq4snn9eUK9FYUbtHa1BK+L3VfYkrqWsS8qKzM6oGC5kmaF5N/mfl1YrAhPN7mW55Igf5L3cCe41qApmhrLbEkXUcJ2W/Ph2W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162728; c=relaxed/simple;
	bh=Gs6UDVs85lAeYcbz5natlQddcSkvTtyPzng7JiqW+ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0WKoe4CYzR/ILllsIJGSlizU4zpCzgtPAxsXhmN19ry09pdrFRHxdcMZ1X6jZHZpDzlVgcifoJZ9ZZYsX7v49ISyc3YRrq0wc5fwB9dC14oFUp+u9wJFwZn+lEttkhTrzBcKucQg9Qe329imGr5OLr1n+J63mF4kA6Qfy7gT5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=kr4Iy/B5; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="kr4Iy/B5"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-930c0f9c1b1so4489585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792162725; x=1792767525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q4TOl9JQUahFIQiKudG6oBPl46TqBGSAJ68OWGmu91g=;
        b=kr4Iy/B5tc9MOgeuxrJ3WzD0XUewK3GJl5jbxA3cSu/cFyxm2FwiGsrOeO31JtRBrV
         XR5kLz4ptzN/7j9h+J5noZdbHPSw5ffk+0Lz5P1Y3k9vSbPrlSX8zmkot3DC19Co6QxE
         mu6eP/OnDY3uSLEiTfB/0CwIJt7fLWQ7IF3DhQMwOrY3w2i3DQXUnfkbq2V82ntbNvv9
         92mBBGv161rgCmqQkvkRO+0oR9ABJO5LOfZQcbnfEGNrNWhOxnQUUBDOptOuRf99BKuX
         ZBUSEJq2lFe/oonJaMGYCn7u2hLCgA3DAKKqZvz0tQGTwEx/s8t0ojJzObGgnPPEC1Sn
         5ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162725; x=1792767525;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4TOl9JQUahFIQiKudG6oBPl46TqBGSAJ68OWGmu91g=;
        b=uXaeTi367PM9HFKaFAfbPzIzRWIEUEZlOnYkLUX6YsuMxz/UJagrpnmdzh0Nxmoibw
         kbPruWr3EBweBlKMJA2JUZcccPn3iq80+HZg/sPHdvfr8je15KQOtKTuOyuUmvesmlTR
         1+Z/GfB63z8Z0CUl39ma0c26rXjE2t1faEJc8R3Uec1wCKCEqk3XzQEJzEP5UA024pKI
         jheosnIBwGbTX2wrNk+CURw91v1UmdO3X1DRxbtAEIycV0sV9v61n1Du6M3AQrwJrwuA
         tjCn6PWsp5H4PisGuApNb/IYxmCeC0B4fjBC0RtfUNR3MtjT5MDXTneKtLJgTpNRisKB
         t0Hw==
X-Forwarded-Encrypted: i=1; AKwUvBxwcpU75vYlMGgV+Uo3oHzEabJf4wAuk3lPVomXjafzCh+hIm71nRiZIxhBNC5t/nv28AatvR4+M5wmK/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqRYkit2Z3g+QmBLVFIfbode3JNktgVcBEsQv/G4rdRwICiYBP
	CwQpFC/QDtZd6RVMyi9Viw+vhHy3wPn2jMKYX/r5S5Y3ZlgVlcoNyqbQHVebBmk692g=
X-Gm-Gg: AYBFou2L7AiFASR5oBkd60HyR/f0HqjLupTl7Crup/1K1R/vRWxEWMWOEZN6P8An/34
	JzTzVlOYSuLqAat0ZavViO2KXATe9X3yJC+wP6lAWo6tZfPE6pJNhLC8zaskFzw/rWnsnMF2jiN
	iIb3Hl2N8qMrY15ITXKXfkxKi82lpIGe0RINi/SgRlXHG75ndTEDlFFnPuTt42r2IqEe6ZOVqSh
	4+pJ9eTaoXuWvJxvQOYLDHrJ4hrIzHhffV+f7UGgZmIfMwBsemcHeF5sMVM7byqsNc6tgA+qW6j
	GC1k/KBLpKJhmDrOFl0IXagVvDf26dLoGdXXjgugF4BHpCpmGbTwdHgday5A8Mf/nonp/k1FdFv
	w4kWyAm/sZQ1TgaDCeA/WIj3NtE/vofNcy7tGjfORvJxl5UW3o/1P64hStR3bDy5Un4nDNMWgjC
	2PDU84KgccwRfGSNqCXGgfIPLrdbxeWccibnCzzp3nqzWS7WBHSQ0AkBxlQXmzDGItCYVrVErpr
	r8x53+ZHV9NQvvFTpv0ZV1/+C2/IsY24tt7iIN2O0/ROOmDWNtzOjhA
X-Received: by 2002:a05:620a:7113:b0:93e:96cb:3083 with SMTP id af79cd13be357-93f29d38660mr12133885a.33.1792162725326;
        Fri, 16 Oct 2026 07:58:45 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a197bd2sm231474285a.29.2026.10.16.07.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:58:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHjON-00000001tP5-3WxW;
	Fri, 16 Oct 2026 11:58:43 -0300
Date: Fri, 16 Oct 2026 11:58:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, iommu@lists.linux.dev,
	x86@kernel.org, linux-coco@lists.linux.dev, kvm@vger.kernel.org,
	Kevin Tian <kevin.tian@intel.com>, Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>, xiaoyao.li@intel.com,
	Chao Gao <chao.gao@intel.com>,
	Binbin Wu <binbin.wu@linux.intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] coco/tdx-host: Initialize trusted DMA on all
 capable IOMMUs
Message-ID: <20261016145843.GF14213@ziepe.ca>
References: <20261015010705.1973284-1-baolu.lu@linux.intel.com>
 <20261015010705.1973284-5-baolu.lu@linux.intel.com>
 <atCPY6LzHd4y0Ywh@yilunxu-OptiPlex-7050>
 <20261015173707.GV14213@ziepe.ca>
 <5ca5f1c4-4c3c-47f1-b79c-c1fe06b20ee4@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ca5f1c4-4c3c-47f1-b79c-c1fe06b20ee4@linux.intel.com>

On Fri, Oct 16, 2026 at 03:03:23PM +0800, Baolu Lu wrote:
> On 10/16/2026 1:37 AM, Jason Gunthorpe wrote:
> > On Thu, Oct 15, 2026 at 04:31:31PM +0800, Xu Yilun wrote:
> > 
> > > An alternative could be, bringing up one IOMMU when an associated
> > > device requests link encryption. Then a no-tdx-support iommu fails the
> > > encryption request naturally.
> > That is what ARM is planning to do. I think it is reasonable to
> > trigger creation of the secure iommu when the TSM is connected to TDX.
> > 
> > Fail connect if the iommu could not be created.
> 
> Yes, agreed. The Intel iommu driver could use per-device interfaces,
> just as ARM is planning. There are some differences, though.
> 
> ARM's interaction with the iommu driver in viommu_init() appears to
> consist of two steps:
> 
>  - arm_smmu_get_realm_params(dev, &params): get and validate the
>    physical iommu information from the arm-smmu-v3 driver;
>  - cca_psmmu_get(&params): activate the physical smmu for Realm use.

Okay, I haven't looked, not sure what is in cca_psmmu_get() yet

> So the Intel iommu driver will probably end up with interfaces like:
>
>  - dmar_tdxcs_iommu_init(struct device *dev, ...);
>  - dmar_tdxcs_iommu_release(struct device *dev, ...);
> 
> These would be called from the connect and disconnect callbacks of
> the TDX link ops:

It seems OK

It sounds like you will have a one time init of the secure iommu at
the time the first PCI device wants to use the TSM? It seems like no
problem.

Jason
