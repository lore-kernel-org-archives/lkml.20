Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794816520;
	b=YvURmQMTDqGhmSxxl1yYxzqGhUUt/cGIoDbZxXVjJe9LSOpddoQ8vTIws0DubVsHKuql
	 VF7lxD+QABt99Xv4lFFjCO4WCUyfyQLgujSZNI/bxm8i0AyEJ4smLNqdcglMFq4Ne/bBd
	 RMx2CbMHXPlmWhWOaourF+BdzUSLOcIb/BkxOe3upmsktHqutDtw0UxwAGFP/fyau514t
	 urfPQDAApl0FXX/HbH/yBKpuPn6uzOEvcah7GF0XlWDZRT7m0xJU+GppZylKNlVZLiA0r
	 m/HRkB3UihLaU0yCa9ca14/dF/VXDulupjHMxnwov83IbfpSGX+HrUid0ZW9ecuQUAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816520;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=oYB3ls/LGbKUnWXMPpAS4ly9XxYMfxaTMclXyHwkonY=;
	b=bF/jqFv1C5CjKLJ48WBbyhJRL9aTC8spU9hKisU4dqEPwtJ6NJczx4D3NZ9SGNIdB+0p
	 yVWygPIHxs6SF6rlRhMDqBrmjmyN2zIY8mPFHYS/XiTaJyAYAw15fes1QGxoBR9FSWlBR
	 G63onpxJT+bqmF8xM/Vd1BfOxwJFH6cXnCkxVmsguA9TGnEV0JBrsXd3fMCep1htfhXnB
	 kFw5ATS9kWa6np4mohNyfnWwx7tkqrKY4bo/OcnlX5RK2tvnEXpIq6NMyWOxFb4zLNjGf
	 8Lz2pPT42i3gvMEPVClyRWvh2ATb3C9G0brPXnD3sR5ISO8DK2TspbNt/cof24LS4OA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=BMXqMPwT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA42606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABA42606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=BMXqMPwT
ARC-Seal: i=1; a=rsa-sha256; t=1794816512; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UAEA/uWfR/YlZc+ObWICNDjJqjZ5o9TJTIifh0FEqJ6z8sXeW//JIzQ0UqnIsG2DS5KioJOBac7vUzqcdCjnhueI3F/RlHzfSm1PC3ak8Yv9J3D/VIWudMH/2jbbZeghQBMM6p4EDdl+qLYRk0YLqd/qh/6FrcFwNXnk2/Wco0o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794816512; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oYB3ls/LGbKUnWXMPpAS4ly9XxYMfxaTMclXyHwkonY=; 
	b=SOsr7lKp5tLCi5758cPjIQe2rsC5GzJ0t+BM+fnEj/UoCQxFhnUr4asRGkEZ4wnnwPU0/5xvHGcVSBuLPszE2zT6dX1/rHUa97mbtDqmDag7+UKdKOdt0SIliBT7aqGj9KqAckXK0022Z7bdlaEAiDW7izXVxoEb04xavr34vjc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: a=rsa-sha256; b=BMXqMPwTMh0OIuru1cl81V4aroDFvi9QkZU+z/L110jfLP3F7dKIb/3lq5RdaTcxkeG4XTHnZwfUlm9bLO8iGKBF277mmXVmkb5nDCuYJPNfWqFYJC6IEkhiWmUzRC1MsK/6aUpuBCi6My+KcobNVLV6XhYVoMRpX7oNBzmybJw=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=oYB3ls/LGbKUnWXMPpAS4ly9XxYMfxaTMclXyHwkonY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794816511485429.97328239678404;
	Mon, 16 Nov 2026 00:08:31 -0800 (PST)
Message-ID: <167b2e3a-3681-4d1e-9b66-c551390be973@collabora.com>
Date: Mon, 16 Nov 2026 09:08:29 +0100
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
Subject: Re: [PATCH 3/3] iommu/vsi: Unprepare the clocks when getting the IRQ
 fails
To: aiyengar1990@gmail.com, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261114-iommu-vsi-fixes-v1-0-1fc7728dfd35@gmail.com>
 <20261114-iommu-vsi-fixes-v1-3-1fc7728dfd35@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20261114-iommu-vsi-fixes-v1-3-1fc7728dfd35@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 14/11/2026 à 01:14, Arun Iyengar via B4 Relay a écrit :
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> vsi_iommu_probe() returns without clk_bulk_unprepare() when
> platform_get_irq() fails.
>
> Fixes: 917ace84b770 ("iommu: Add verisilicon IOMMU driver")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/iommu/vsi-iommu.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/iommu/vsi-iommu.c b/drivers/iommu/vsi-iommu.c
> index 8a0f253f2017..579eb1ab5683 100644
> --- a/drivers/iommu/vsi-iommu.c
> +++ b/drivers/iommu/vsi-iommu.c
> @@ -707,8 +707,10 @@ static int vsi_iommu_probe(struct platform_device *pdev)
>   		return err;
>   
>   	iommu->irq = platform_get_irq(pdev, 0);
> -	if (iommu->irq < 0)
> -		return iommu->irq;
> +	if (iommu->irq < 0) {
> +		err = iommu->irq;
> +		goto err_unprepare_clocks;
> +	}
>   
>   	err = devm_request_irq(iommu->dev, iommu->irq, vsi_iommu_irq,
>   			       IRQF_SHARED, dev_name(dev), iommu);
>
