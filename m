Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490649;
	b=wboEDZyYLWC41S4JJwu0IPgwLC2UR8aRMNoidhfC4njMeVeyW8x9whcA/Ade08A8y8SK
	 JFrkSiD2bf30RLOrsINyKnfNl1lLEJuNY5n8FXkDD1WkxhdZvJWrNLRf68KXMlFNup3p3
	 MOoHNua7j8BDpRri8n4rVTlYSLxvExfiZ1uKeL0g/6WuQnvUOCKFHgDmy4QhqaJW3eZdo
	 1AUg4NCHoePQOlFCSEM8C+iA/TJFsfk9abv9x79wxHGFaptV926OrkxNUl/TCgh6Jdikc
	 saYYJuc/8t9uLbZkSBQE6oOIXJp5NCplhJmeRqJ+ST//7BQNitr3ond5rUwtl7biDcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Hq/MU/gK+BSgB5mQh8Y6JTJeHVaolVP6d47tb0fD0P8=;
	b=tzGuaPzOGgRAdiFjVEqM9PxmfdBq6Uk2zT5A1Tn/AdI7L8t69+8Fy8RO5I58QVvJDEa0
	 gYFaKNbJ2AYMAz7LqGH9zF38M0mV2YntiUC7y887XeSWesNRqe3nWvDyBp2pKG7iN8OIi
	 /kK350NZ5pI0qrNhWJ27oo2krAVzTOCRxGrEv9hBLZslrs3J38Oezu5W0FWfwhEkza3fr
	 H1uVzvt2RtvTTtrUzQotXdsSKjOzLK0mwoqWhSa1xQoieLoCjgiLmsWu/eV/nyzTolamw
	 rbrM97Fltkc2aCQSmxBQEbbXkorZ9LPd2PhXsn4DtqWFwh9sdLH/xMeh5K6unwUhY3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GV9EG0b9;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99F4606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B99F4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GV9EG0b9
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso44145e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794490647; x=1795095447; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hq/MU/gK+BSgB5mQh8Y6JTJeHVaolVP6d47tb0fD0P8=;
        b=GV9EG0b9F1OZcJ7rSSqCBBGM15XzP9uyUYDi8GfT/IJQFo2PONhIEsW4ehbTAGmLul
         AfiSQRqok039LZipD3SXVB7bQnmWM1VNWHnNuIYUOg1xcoCpXoDgZk6MKhpKupNozhu1
         I6KasKDrU+5yLyLXdq34h2LC+ImowBeWbtbU1nl+VbL3o0lOkFFnrUjdh9Y1xgwqWgWv
         b9BsHs4/vjo1uDGsLzyu+BQigb78NFuJGx5WuPfy69QJcQW7lJZYQnxGSWp18iPj0zO4
         vNvfy506m8C6yMkOYgzvsomi1q0RJbg4NEqf4g+SfAX/vVd7MqsUy96iYoJjnqx5Fg5M
         fp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490647; x=1795095447;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hq/MU/gK+BSgB5mQh8Y6JTJeHVaolVP6d47tb0fD0P8=;
        b=SjwXryflDT9hViohYfld5bg5RbqIwc3dYmJt/qVb+0O+RnfIBV9WAcWoTQFn2qeer/
         4wgJoWmZ560UJVqWuwQM/9t+qaqXgqeXOj54juxmW7bXvRl8+eryR08ebnvh9lO8Jwlp
         Kt5/p9L8wcmWjz3f2ojVJvIsRMhGIYhew+xYJGtLCAA+R5ynqno9zYanX/XgjwhS+kDv
         lLEesp/7ihyyubEGUONc1S2rVuF1PMrXZYgnZP2J/Fu/GryQWyvJQghJvWls5pMNNWlx
         10rYcDtgJsfFZVcxPfSq4MGgiSRrL6reOWNvxYODNjITdt1ci9fAn7XxBZR+rYGCjGHa
         uu3w==
X-Forwarded-Encrypted: i=1; AL+hErEZISb9b5B0jybKuk4AiB7M3oxbyPl3rwGyjVRp4ZPp26wpI7fYqcaRMoxyuXaN8UM+EXwAp8hvAlrtKKs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xM5OLN6WcZz2uvSnAQtjrBdSMXUjA4nlK3Kg3mhLTpN/MYDr6
	Qkkc4GdDzREME16HjJWxY7BvGJL+S1wdJqm2ISMqHk9oomVL/B8Isar0x+qWDC2tuA==
X-Gm-Gg: AYBFou2YFub5NzUOHKGYdvqEXh2Z7l0OS0ceNdi3Woig2h23mxYn26Kl1MbyqIlt949
	q7rW73psPOBDqsP5l+07VujnZ2VvQyQwWysRmekZi3md7umh+uCLiMmBWTeXzJzfHx4bbzofZqh
	FjgDDUqBWQDAPuC3R2D5BL/EDJOPoZ9TjPEBO82yUwzh3Qq0tNqLTgHN9Lz4Bmj1b3bBDG033Pc
	X/UnEmaBNeImrB/dPi4m86vdzByBKMbkjOf8F4aqJuJPrt/KaBuuqvH0Z9b1rZW/lsW77R6AHc5
	CDlW77OLqIcQ4zoxXfpXxRDavzmVRTsrpEjaHuqUm4vcPbCxC/y3oEI/rxKruqWyTqd98ncu4gm
	PzpPjxF4Q/nJ0JMeBEZZ59pOSKQ+1AJ+wOHp2sfSBcY/I9iwChLNDyjhLYVTksRMsy/pHCKABHK
	XfilvpIFg+um00W/jbdfVxfIHlaaZMggnt4are98SC1UiAlycs1SUebbMv3DZzfS/63VUkdhpka
	jB7Juz5eHvy3IAIFGu8fEB/NTzcPpzmxZWZLcm9vShLca1qc/oPwOVM1GdYzwa3SQd9kFIlvBEX
	E0RqDnswUAMltwYw+tz3OX1f8ILCs9MRlazwvR/0lmGy2GBWwUN7y4W1c2UwkklsSepbGVw=
X-Received: by 2002:a05:600c:a115:b0:4b6:c939:3bfe with SMTP id 5b1f17b1804b1-4bb4ff4ad18mr798825e9.8.1794490646742;
        Thu, 12 Nov 2026 05:37:26 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c30b1sm16911221f8f.46.2026.11.12.05.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:37:25 -0800 (PST)
Date: Thu, 12 Nov 2026 13:37:21 +0000
From: Mostafa Saleh <smostafa@google.com>
To: aiyengar1990@gmail.com
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Ashish Mhetre <amhetre@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	Thierry Reding <thierry.reding@kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Don't leak the CMDQV device on a bad
 #iommu-cells
Message-ID: <avXBEbkBJ1ZMZ00B@google.com>
References: <20261112-smmu-cmdqv-leak-v1-1-7ea8e34277ea@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261112-smmu-cmdqv-leak-v1-1-7ea8e34277ea@gmail.com>

On Thu, Nov 12, 2026 at 08:20:19AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> arm_smmu_device_dt_probe() only logs a missing or invalid #iommu-cells
> and carries on with ret = -EINVAL. For "nvidia,tegra264-smmu" it then
> calls tegra_cmdqv_dt_probe(), which takes a reference on the CMDQV
> platform device in smmu->impl_dev, and returns the error. That reference
> is only dropped by tegra241_cmdqv_probe() via arm_smmu_impl_probe(),
> which is never reached, so every failed probe leaks it.
> 
> Return the error as soon as #iommu-cells is found to be wrong, before

This is one of the things I came across a while ago when I passed
the whole driver to Sashiko [1] and IMHO, it shouldn’t be worth it
to fix as the FW can do many other harmful stuff to the kernel
leading to panics or memory corruption and the binding for the driver
is quite clear.

Thanks,
Mostafa

[1] https://lore.kernel.org/all/20260924085616.300650-1-smostafa@google.com/

> anything takes a reference.
> 
> Fixes: ea69dc4e207b ("iommu/arm-smmu-v3: Add device-tree support for CMDQV driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-206486@kernel.org/
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> The Sashiko AI review found this leak while reviewing my series
> "iommu/arm-smmu-v3: Keep the clock of the RK3588 PCIe SMMU running"
> [1]. It is not related to that series, so it is sent on its own.
> 
> Only compile-tested (arm64 allmodconfig, W=1): I have no Tegra264
> hardware.
> 
> This patch was developed with Claude (Anthropic) as a coding assistant:
> it wrote the code and the commit message, and I reviewed it.
> 
> [1] https://lore.kernel.org/r/20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 6d4520c47308..f685ed0c01b3 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -5661,14 +5661,15 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>  {
>  	struct device *dev = &pdev->dev;
>  	u32 cells;
> -	int ret = -EINVAL;
>  
> -	if (of_property_read_u32(dev->of_node, "#iommu-cells", &cells))
> +	if (of_property_read_u32(dev->of_node, "#iommu-cells", &cells)) {
>  		dev_err(dev, "missing #iommu-cells property\n");
> -	else if (cells != 1)
> +		return -EINVAL;
> +	}
> +	if (cells != 1) {
>  		dev_err(dev, "invalid #iommu-cells value (%d)\n", cells);
> -	else
> -		ret = 0;
> +		return -EINVAL;
> +	}
>  
>  	parse_driver_options(smmu);
>  
> @@ -5680,7 +5681,7 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>  		static_branch_enable(&arm_smmu_erratum_repeat_tlbi_cfgi_key);
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static unsigned long arm_smmu_resource_size(struct arm_smmu_device *smmu)
> 
> ---
> base-commit: 2cf4be57b301ed2d7af82e70cff5dfd96894d8de
> change-id: 20261112-smmu-cmdqv-leak-003f273b5e59
> 
> Best regards,
> --  
> Arun Iyengar <aiyengar1990@gmail.com>
> 
> 
