Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794816693;
	b=K+QRL8G241CT8nLO6Y6SLhdEarUSKXg2/5/uiZFaIjYduSEu4/uqFnl4F6ROKFY7gJat
	 Fb0fWn7mjzWRQECXbP7k0RYquj6c80wuOCr8wOF3RvgDGfVVaPCU2gu5gHaH1iT/cQBX0
	 sOaj0HAIrV6XpO7yGe9gEpHpW9kVtWLgXHEg8stLxSWFEHi7LLl5XJoNBcKGrmKA8EVBG
	 2/LB+zaOhFmKZu0XHtiTYejcOQMZ/hByg6GI9HEISMIkMoLA4uWskC402ebSg+xbXYuyf
	 V8EuAf53RTot/9EiqNJLLXHj/mGpUW+8Y7Y8z5x+mu0flsQPz6SyHAU787kRyxjWoWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816693;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=aunfSXiGItJTPQMs+dC8WoB8BuenaOLUe+yeHWYzUeM=;
	b=1VGQ7xAa2IQSJEF8oIb6HxzqG8JU2x8coAKHv6fUUJ7X8VbnTvbkRvaa9kpFPhDQ0t8a
	 gyiY4CaOgbWEJvC6xcLapTwA3EqBK2ekDzp46saeA9JoXbNpyPLuoUAp/q5yEM3Axz33E
	 Mr6mA7khofcpSUkormJidulAZ6jHjUZ5m+QGbatoeDDZfyippHyExNVf6O+6FBhiJKWcA
	 0dU30psUs13fRWRfap4MwftLuFLIgcwAwHEgo51GXa0hS3whkuWdY/lpcDOfbv5jacuEN
	 qzYNfGbo5Ub3vHs36Q3RTfyYYfFyWKmmJBWmLsFpg/g+cpfG0XsTdvpBJ8WlQ2Iwv9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=GlBTLkTU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E002606A89C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E002606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=GlBTLkTU
ARC-Seal: i=1; a=rsa-sha256; t=1794816681; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Esy/dZZoIUk3CjzsvAOYZOA3Rar06ilE8H+cJ5CGyHTOKgL0PuWj0h6Awr/hLE92zoUS68qhZLL/nu/4Ts80qkuB+Pbr1U1SOILyzJ2UBwDCLfoH1TqoGv606/CJnhdaxtFSmR5OhAL2+RC2hGMPojPiq3/kimE8mSlHPX9h7PA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794816681; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aunfSXiGItJTPQMs+dC8WoB8BuenaOLUe+yeHWYzUeM=; 
	b=nR2gwGZj7/J4jPIR2VUbFUBEVbNWq2fWBtfEsDoQHwr8AQZF+Hnjh6MGoyTOw+2UWQrW2mdHgzRVV0ttA5kRtdFQdonI59d2CrATAIke3Ft3qEo8G8hLlXzmeD6WRReKs9WidKwG/6myO56NtBcEu3bWA1HuM2f/zrvu4AJBGls=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: a=rsa-sha256; b=GlBTLkTUEwVuxHBVkg+dDTkzZQwxpHkHzn7Xs5olxbqHuYevLuYWmrkdkK8mJCXQMk96Y7QmPK5GvTyAt2/Z3xE1tWrFucj4TemUmyrwONXg30kC7vpXBAsI3wVTZX1Enem1e9yG9v8B9rslnXg6SRQDUP2GHXp4voBIfj9bQfU=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=aunfSXiGItJTPQMs+dC8WoB8BuenaOLUe+yeHWYzUeM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794816680768355.38791078080465;
	Mon, 16 Nov 2026 00:11:20 -0800 (PST)
Message-ID: <ae9d6425-21d0-405b-b0c3-c87e34d47d73@collabora.com>
Date: Mon, 16 Nov 2026 09:11:17 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iommu/vsi: Don't leak a runtime PM reference in the
 TLB flush
To: aiyengar1990@gmail.com, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261113-vsi-iommu-pm-ref-v1-0-fd917eebdf18@gmail.com>
 <20261113-vsi-iommu-pm-ref-v1-1-fd917eebdf18@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20261113-vsi-iommu-pm-ref-v1-1-fd917eebdf18@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 13/11/2026 à 21:04, Arun Iyengar via B4 Relay a écrit :
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> pm_runtime_get() takes a usage reference even when it fails, e.g. with
> -EINPROGRESS while a resume runs, and vsi_iommu_flush_tlb() then skips
> the put. The IOMMU then never suspends again.
>
> Flush only an active IOMMU and flush the TLB when the IOMMU is enabled,
> which covers resume.
>
> Fixes: 917ace84b770 ("iommu: Add verisilicon IOMMU driver")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/iommu/vsi-iommu.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iommu/vsi-iommu.c b/drivers/iommu/vsi-iommu.c
> index 5dac20b143a5..5d581be95333 100644
> --- a/drivers/iommu/vsi-iommu.c
> +++ b/drivers/iommu/vsi-iommu.c
> @@ -369,7 +369,8 @@ static void vsi_iommu_flush_tlb(struct iommu_domain *domain)
>   	struct vsi_iommu *iommu;
>   
>   	list_for_each_entry(iommu, &vsi_domain->iommus, node) {
> -		if (pm_runtime_get(iommu->dev) < 0)
> +		/* A suspended IOMMU is flushed when it resumes */
> +		if (pm_runtime_get_if_active(iommu->dev) <= 0)
>   			continue;
>   
>   		spin_lock(&iommu->lock);
> @@ -545,6 +546,8 @@ static void vsi_iommu_enable(struct vsi_iommu *iommu, struct iommu_domain *domai
>   	writel(VSI_MMU_OUT_OF_BOUND, iommu->regs + VSI_MMU_CONFIG1_BASE);
>   	writel(VSI_MMU_BIT_ENABLE, iommu->regs + VSI_MMU_AHB_EXCEPTION_BASE);
>   	writel(VSI_MMU_BIT_ENABLE, iommu->regs + VSI_MMU_AHB_CONTROL_BASE);
> +	writel(VSI_MMU_BIT_FLUSH, iommu->regs + VSI_MMU_FLUSH_BASE);
> +	writel(0, iommu->regs + VSI_MMU_FLUSH_BASE);
>   	iommu->enable = true;
>   }
>   
> @@ -564,8 +567,6 @@ static int vsi_iommu_attach_device(struct iommu_domain *domain,
>   	spin_lock(&iommu->lock);
>   
>   	vsi_iommu_enable(iommu, domain);
> -	writel(VSI_MMU_BIT_FLUSH, iommu->regs + VSI_MMU_FLUSH_BASE);
> -	writel(0, iommu->regs + VSI_MMU_FLUSH_BASE);
>   
>   	list_del_init(&iommu->node);
>   	list_add_tail(&iommu->node, &vsi_domain->iommus);
>
