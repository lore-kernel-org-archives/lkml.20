Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF3249365A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455265; cv=none; b=dZ5Fc48pSF1FW1U9P/Kv2Gez0WAuh/AsUyFvyngjlDCrXYcc2oxgE7Q6nzWM8z4Q6UvYDRVbMOW8OK/TMzxIKgWO2UX8OGnH8e6FukCTK0wAhCJ+WMsm03+d37kFzZNUBwgWxUv9WHUlhPqPVNX0u75Qhv+TMSwf/D2TgemPOgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455265; c=relaxed/simple;
	bh=o72Dx/lVX6lyOQVKDf9pGztNDLO1CBdrw12EQ9xMD6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Mtg26dKrF2waqfaPYp9Eb9A1L5zQ0B0odPDBo0j0XhmIY+v9vksbgZa4MJ5VSWFZrjBBrj4xPbCRxgRj/lFPaW7a7M3/HFmePcAFmv1SJ039gGl/x5lAMO9We86nPIi5x0wICjFFTstINhjRK+9kReo2+RvVo24aQymqWM69WZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=X9dbs2RP; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="X9dbs2RP"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261008102741euoutp025b157406949247f4d813260054874d61~chxGUKQTI1182911829euoutp02e
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:27:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261008102741euoutp025b157406949247f4d813260054874d61~chxGUKQTI1182911829euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791455261;
	bh=Yh35YzBJA8/xE+TWFxJbbVf29xtGO1I3EQyG9MJAvrY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=X9dbs2RPOrgDoZSwiXoauZzw+TN18VTOKWPg9CkCRkry97RqIHEcHgNsQMNd3AKei
	 XKn+Xkntc/LAO+H6tXwT4UCwHLNxkfGYXqXZAEzalmFZ2YAdAPoKDEc8TEwkTTYcTp
	 HB6hreg8AiszCtHsgpDm653FW5ZHVzZiVDNtRSMw=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261008102740eucas1p2b40077fcb69f9a6b8b7bef76854db577~chxFZ4FNl0241002410eucas1p2j;
	Thu,  8 Oct 2026 10:27:40 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261008102738eusmtip10151624c3fc63f193b8cbfcf6447236e~chxD5esrf0373403734eusmtip1G;
	Thu,  8 Oct 2026 10:27:38 +0000 (GMT)
Message-ID: <e9ffaa7d-26be-4d19-95d6-e2f039119978@samsung.com>
Date: Thu, 8 Oct 2026 12:27:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 RESEND] x86/pci-dma: swiotlb: Fix a regression since
 5.19.0 about iommu=soft kernel parameter
To: Julien ROBIN <julien.robin28@free.fr>, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "Aneesh
 Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <f921c2ca-e083-41ad-90a9-e54816427a50@free.fr>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261008102740eucas1p2b40077fcb69f9a6b8b7bef76854db577
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261004101223eucas1p218a04ee0955798705f0e450ec74678a9
X-EPHeader: CA
X-CMS-RootMailID: 20261004101223eucas1p218a04ee0955798705f0e450ec74678a9
References: <CGME20261004101223eucas1p218a04ee0955798705f0e450ec74678a9@eucas1p2.samsung.com>
	<f921c2ca-e083-41ad-90a9-e54816427a50@free.fr>

On 04.10.2026 12:12, Julien ROBIN wrote:
> The following patch fixes a regression introduced since linux-5.19.0 about
> kernel parameter "iommu=soft" which, according to kernel-parameters.txt,
> is expected to enable the use of software bounce buffering (SWIOTLB) and to
> prevent the usage of an available hardware IOMMU.
>
> Since linux-5.19.0 however, iommu=soft doesn't prevent anymore the usage of
> hardware IOMMU implementations, and at least when an AMD GART IOMMU is
> available, SWIOTLB even gets disabled by "amd_gart_64.c" despite the
> iommu=soft parameter.
>
> The issue is fixed by adding an "x86_soft_iommu_only" variable which is set
> when the iommu=soft parameter is found and processed.
> If the variable is set, hardware IOMMU detection and allocation is skipped,
> as these detection and allocation functions could overwrite both
> x86_init.iommu.iommu_init and x86_platform.iommu_shutdown for later
> initialization and shutdown of these hardware IOMMU implementations.
>
> When the iommu=soft parameter isn't provided however, the behavior of the
> kernel is left untouched by this patch.
>
> Patch applies from 5.19.0 to 6.19.0, based on mainline as of 2026-02-12.
> Successfully tested this fix with iommu=soft parameter on linux-6.1.163 and
> linux-6.19.0 on a Gigabyte 990FXA-UD3 based computer.
>
> Tested the fix and iommu=soft parameter on linux-6.19 on these 4 machines:
>  - Gigabyte 990FXA-UD3 motherboard based computer (AMD FX9590 CPU)
>  - Asus TUF B550-PLUS motherboard based computer (AMD Ryzen 5 3700X CPU)
>  - HP Victus 16-s1034nf / 8C9C laptop (AMD Ryzen 5 8645HS CPU)
>  - Asus X550JK laptop (Intel Core i5-4200H CPU)
>
> On the 1st, this successfully disables AMD GART IOMMU and enables SWIOTLB.
> On the 2nd, this allows disabling AMD-Vi but SWIOTLB was already enabled.
> Same for the 3rd one.
> On the 4th, there was no hardware IOMMU enabled, and SWIOTLB was already
> enabled too: no resulting change for this laptop.
>
> Signed-off-by: Julien ROBIN <julien.robin28@free.fr>
I assume that this needs the following tags:
Fixes: 78013eaadf69 ("x86: remove the IOMMU table infrastructure")
Cc: stable@vger.kernel.org

It would be great if one of the x86 maintainers or developers involved into that
commit could comment on this patch. I would also like to know if it is safe to skip
gart, amd and intel iommu related calls.

> ---
> Changes since v1:
>  - Added static keyword to 'x86_soft_iommu_only' (only used locally).
> ---
>  arch/x86/kernel/pci-dma.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
> index 75cf8f6ae8cd..c3dad499cd27 100644
> --- a/arch/x86/kernel/pci-dma.c
> +++ b/arch/x86/kernel/pci-dma.c
> @@ -34,6 +34,7 @@ int force_iommu __read_mostly = 0;
>  int iommu_merge __read_mostly = 0;
>  
>  int no_iommu __read_mostly;
> +static int x86_soft_iommu_only __read_mostly;
>  /* Set this to 1 if there is a HW IOMMU in the system */
>  int iommu_detected __read_mostly = 0;
>  
> @@ -100,9 +101,15 @@ void __init pci_iommu_alloc(void)
>  		return;
>  	}
>  	pci_swiotlb_detect();
> -	gart_iommu_hole_init();
> -	amd_iommu_detect();
> -	detect_intel_iommu();
> +
> +	if (x86_soft_iommu_only)
> +		pr_info("PCI-DMA: skipping hardware IOMMU detection and allocation\n");
> +	else {
> +		gart_iommu_hole_init();
> +		amd_iommu_detect();
> +		detect_intel_iommu();
> +	}
> +
>  	swiotlb_init(x86_swiotlb_enable, x86_swiotlb_flags);
>  }
>  
> @@ -149,8 +156,10 @@ static __init int iommu_setup(char *p)
>  			return 1;
>  		}
>  #ifdef CONFIG_SWIOTLB
> -		if (!strncmp(p, "soft", 4))
> +		if (!strncmp(p, "soft", 4)) {
>  			x86_swiotlb_enable = true;
> +			x86_soft_iommu_only = 1;
> +		}
>  #endif
>  		if (!strncmp(p, "pt", 2))
>  			iommu_set_default_passthrough(true);
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

