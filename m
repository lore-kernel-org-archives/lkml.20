Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D698492E57
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991718; cv=none; b=Etn0b21Eqaq2PQ0ldxwdLxgo8Oa6I0HcfdyFsZH6/VBBTC8ajtFGPErHE2MlmWIgcA21mjS6Qen6nhghK+xQxm267pBdr84gsj9PkylXfaO+ksSW3PsY5CvMBMm+KAyuoXlw0Z5e6AUnig4go8MCtFr5x5YIxmyXhmedMtrTdMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991718; c=relaxed/simple;
	bh=x4ZR/35KD2CxuvtsQBW7vNL6jE8skBPQeFvOsLTptis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOv0zYqM/5DYFti4SgcdJD98XC2sknOFPqZYA+KbGUU4sf6hOXSr3l90JpwZOER1qTTIJ6UiO1XSHJ8MpvxKCgx53QEYYWwaT1M+D8PcGYjjz358QsKFL461JSyLffrBL92LTlTVDwdgsfMpPlnlvyUOLGlH6b3KXgbespzZ3ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=BwwZBE+0; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BwwZBE+0"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-939109f067fso398277285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789991715; x=1790596515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qZHfowJU9Gcgjx9yDF775AN/BbRSMKh2T0yPRE0+ftE=;
        b=BwwZBE+0VUUSuKlhncHoA99Hh3+jh0/AtSRFx8rexSdZVXOmdfNhJyTUAPRUy63Fcg
         e+VHIynSPJI0LUk7JAlihyJ/DaoqPKDgX1Ap4mrpbrkccmb3fRWDzyx1OxL0lyn6+ksv
         8Q3rTaU3BfEhuj9cIzicGFCVIjPFs8JHg0Gl6zYRqdwi+/o9UKCFlDg3O9mahVlwFNSN
         M0l+TT069dtda7EXKCSUgcheXPI1CPILZBgQddgNRezHzIr3K1GWYE+Ul2HbtV5yh9fc
         9MV6EhvVRImM2evj7bjzYZxH+olDjNAemh7q3QSGkwqzcUfGh8QAQUWn7wo/sOCUyN6M
         lsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991715; x=1790596515;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZHfowJU9Gcgjx9yDF775AN/BbRSMKh2T0yPRE0+ftE=;
        b=om71sW9itaVcZgfK2ThtmD/nedygY3g6jMLjUwWxcT3Tt2ZYdhuBbatRz+75T7G6Sa
         n8aVYeF0Uu+GcsZ/HfiHI1iFuoMMXD0iZ9mev/il3xS8IkwCjieIuwww3CpetvLXQ7LB
         CsnHhkYtsK9WslCsGlDgZK9DuuA0wFYASx2r+fTCn34dkd90Zd0LLb6MAt0082vppawz
         zaJH80RcSGskZhsxTONUNdlNcShbbAyp+E+Tprx18jz+gg9eHuhWc3ZCJFpjv//oDvXL
         WY82Tx6hrj7J1e6Mfl02HT8yZTenXH56jZ4aXQ5J1pKc6nHDKgnyjsGV/TP2bU9DugsA
         8AVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhvqpx8l/IMceVdJ/u/H1DFOISkMK7oGy8z7YYSHggs7EbuS7Li/NJJ3wo1SeXHPtRJbmag+2fSqGIhMg=@vger.kernel.org
X-Gm-Message-State: AFuF++mka5EZF65JhgC7PYrgUv5KhTKDJBVfzIBF8wcOVYk98DivLc4c
	MLFO9VwY1kVqVDc78f6ICwiLVj9WW+QhRW69psXnUOEEsvq5LrnYBNLgmUH+8jGFQQw=
X-Gm-Gg: AYBFou1nw+GFHjtxxGZBW6X0ShdfF7brSrNu04zVCOvKpKXMr+wwRmRd9GM4CQJv1l5
	kD8tO9HiA2RKhrE3Xn6oGZWO8FQ6ClXBBNpV5xsie4XLpe6StVrWwdFSORXWjNmQBHfx1ogBAl/
	ZGjWKxYTnLpwevWx+H7DuOy/zZbMLr+Au4qdKi7bV/uIQzwoIzq+WgHsWhgHq5+madzfN/wQnSh
	zlwlaFsJSsxw0+ovPSMKnl4W7xViZMG+P6HSlwTPtmCyAFf6Kpx7OegYQHCq7XpXKUFwhG2CMSs
	JegJrOD4xhL2ymuW/D7OaTK9tofh265aXAFA9L4NPtpxkfbCQMqXmPusvV6yFM9jKbNa5BZ912T
	TAtd2w7ejWSu9SZeSGEYVdXJr+Uz9lzmfPs5cRaIeTlDWUJIjc11fbRzMZRcOui20ezZVgW1TtP
	/LoBnMu40ZI4dOQFhAGfS8qs0z6DnjCAIRluvFVpoUOQW5Pdx7RJRR5QYQs4pgBOGoq+Q3GS2NL
	HVoqHpaiONRroCCseq2YbA/M/ke3VkQY0HiJII1vac0YTmd8+R8bJNg
X-Received: by 2002:a05:620a:4492:b0:93b:c22a:e98a with SMTP id af79cd13be357-93c15d9e687mr22451485a.2.1789991715373;
        Mon, 21 Sep 2026 04:55:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93beda70a1esm612157385a.11.2026.09.21.04.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:55:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x8cc5-00000006EDj-1rtR;
	Mon, 21 Sep 2026 08:55:13 -0300
Date: Mon, 21 Sep 2026 08:55:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Guanghui Feng <guanghuifeng@linux.alibaba.com>, kevin.tian@intel.com,
	alex@shazbot.org, joro@8bytes.org, will@kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] iommu: Reserve PCI host bridge MMIO windows for
 IOVA
Message-ID: <20260921115513.GK11599@ziepe.ca>
References: <20260921070234.897736-1-guanghuifeng@linux.alibaba.com>
 <20260921103922.1113752-1-guanghuifeng@linux.alibaba.com>
 <a82c3113-cee1-4e27-8c10-b7616f860a93@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a82c3113-cee1-4e27-8c10-b7616f860a93@arm.com>

On Mon, Sep 21, 2026 at 12:24:13PM +0100, Robin Murphy wrote:
> On 21/09/2026 11:39 am, Guanghui Feng wrote:
> > The DMA IOVA layer reserves PCI host bridge MMIO windows via
> > iova_reserve_pci_windows() to keep IOVA allocations from overlapping
> > those address ranges.  As commit fade1ec055dc ("iommu/dma: Avoid PCI
> > host bridge windows") explains, a host bridge may interpret addresses
> > falling within its MMIO windows as peer-to-peer DMA, leading to
> > faults, data corruption, or DMA transactions being misrouted to the
> > wrong PCIe device.  This is especially dangerous when a device sits
> > behind a PCIe switch and ACS Upstream Forwarding is not fully enabled.
> > 
> > Passthrough paths that let userspace pick IOVAs did not honour these
> > windows: VFIO type1 and iommufd only excluded IOMMU driver-level
> > reserved regions (RMRR, unity maps, MSI), not PCI host bridge MMIO
> > windows.
> 
> This was intentional - I forget where the exact discussion happened, but at
> the time we decided that exposing reserved regions for entire windows was
> the wrong thing to do, as being pessimistically inaccurate might be OK for
> the internal DMA API, but restricting userspace is another matter, and I
> think the consensus was that it wasn't really the IOMMU layer's job to get
> deep into PCI details anyway. Such "accidental" P2P can only happen within a
> group that's assigned to VFIO as a whole, so IIRC the conclusion was that
> users should already have enough information at the VFIO level to avoid BAR
> addresses if they need to.

Yes, but we never did a a very good job to make the information
visible to the VFIO userspace level, and I don't think anyone ever
implemented some sysfs parsing to try to get it.

It would be a nice improvement to expose these pessimistic ranges to
userspace through iommufd so it can choose to opt into them if it
wants. Some kind of helper that the dma-iommu.c and iommufd can call
perhaps.

Jason
