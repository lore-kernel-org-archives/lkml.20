Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E670E43713E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387335; cv=none; b=CKfdJE9ZXZjojAVqiIeXQJbfuIB/E6VvrUfVzin2kwEECzPoRqmNFV8P1TuEgwZSUimuvunwYoIackACxPfqCxJaR4KWrmIvshSRoZEKonNOct1mE4JQytinaJMeum5FrBJDFcP9Fobg11xSkfOJrdC6jgUOxF5wN8kFJ2NHgUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387335; c=relaxed/simple;
	bh=HkFAbO8MygqvyTuNPvM8c2JpQVjswNB1aNAD46Eofxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkDte1FfeDwMRvlCm4c/owu0i+g339bdqJMnXCjKfwhLfCebE9gKJq6H0MNj63MH89+DB7q7y1dSL4516Jykvj+pkCd9TsAxskrte980u861TdUZ7NgMZiZmw5hdXmUPIrrQdaixRQfOj71RkdspT5GP24/66CyCrD22CjaJjpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482e4998d28so1250721f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387326; x=1788992126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+vEOyqPDv7rU89jwmnevj+9dxsKc/yKY2uAhwHha8M=;
        b=jUSlefFdLxJbgz6ypV60GQIAP+p4ibG3giRp3ROT54OBQRxFV3fvW9ZVTSw2zmu8m0
         NNBQXdxZlaDADPLYBJO4nw0++2mL/t2UaKOnovaY9+Spo497KD621raSngGEW3b0x3lG
         pHu52aU5eSYZ2DqlwHfz1rJcDISujn3e5XvD4MKMnZXz0Ni1Q8eNwqLoqDdE9c3rHpvk
         s3D79W3O027tJETQ+L81/noq6Detns7aj+qY6kYGLBCChbrXduMOipnrr90qyQoNrm70
         ad6B5lu/wqXty+Nw5QPNEnrsJu0frm2Y1DeCXRh6nJy0hRwRqHrUICktQFcffsmEIOgG
         tJ0w==
X-Forwarded-Encrypted: i=1; AKwUvBw7h2eBMo8bwYgoH8OCh9tz/UhFWB8SYr+BEnYXI/F20Mrz6FYEsI4hezT+snEyia1qmHsq0tNX2zLsS2o=@vger.kernel.org
X-Gm-Message-State: AFuF++mIu4gmuO7ti+gNQf9Tbq/BguGIzTIdOukx5RwN2msyMHamA8qs
	iBEua4/hrYNKNGHpIu0vPiEly3pQupfVIrNaA92tbhEV0wCOo6JF7oKt
X-Gm-Gg: AYBFou1j5Jog2AUb3VggHK3UxgCGYVZuxRtRscxbsZQs3A2CJ3f4VYzYHteKh3Cjp8g
	5xdAa6wZuJWFli4ciu3W2Sre5GebbuHgOLnhc6wZ0L9Exp76KdHBp2IjjAcC/K4dfP3eqyCj+lI
	H3xFUzzWt3d3LWX9cDIyYucGACxj6FTxujuKDEbSAASwURMdR+9DCBRCB80ZZ7Cc1pV0rM6Ljmq
	N8DEQxdb+jQrhlDEuyKN8z9nAIVlCNRntdWxquE9NHPhRMSfrNDjUJx6ERr8AKa/Kl52mL9PqIZ
	mTunvNhQIHde7SAL8DMZgIs1Jlxew6VhMeuEqd23d9y70ZBTD8fwx7VpZuSj4YNWHzp2usWSO1g
	XVtN5IaoiE/xKU+ShmE3Kee+HRs24ILa9OolYAEUSRBrFVhhVa3dwPbZeMIa8dxciLu2v1ZhTGa
	9gasCTc1Szu8aHrvMhUSXvnVulTSQ64LPCUIIvGPDfkUw0Sy5sopArwAosFqHPLTaxeu1lV8TA/
	6DBTKTeMHstApsEqEG1fFewySfDjeOpRVN/1BF4yh1UkRJh7FsDwPhaSvFCfcC4Oy0pHd4IDLI4
	QOQ=
X-Received: by 2002:a05:6000:4208:b0:484:4769:18a4 with SMTP id ffacd0b85a97d-48488f10236mr16624383f8f.14.1788387326455;
        Wed, 02 Sep 2026 15:15:26 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed38cfsm8301961f8f.19.2026.09.02.15.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 15:15:25 -0700 (PDT)
Message-ID: <9bb0ee66-d313-4a07-af4c-ffd002b55dee@reactivated.net>
Date: Wed, 2 Sep 2026 23:15:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com,
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>
References: <20260902-bcm2712-iommu-submit-v4-0-9dbb657578c1@reactivated.net>
 <20260902-bcm2712-iommu-submit-v4-4-9dbb657578c1@reactivated.net>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <20260902-bcm2712-iommu-submit-v4-4-9dbb657578c1@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2026 18:57, Daniel Drake wrote:
> +static int bcm2712_iommu_blocking_attach(struct iommu_domain *blocking_domain,
> +					 struct device *dev,
> +					 struct iommu_domain *old)
> +{
> +	struct bcm2712_iommu *mmu = dev_iommu_priv_get(dev);
> +	int ret = 0;
> +
> +	scoped_guard(spinlock_irqsave, &mmu->hw_lock) {
> +		/*
> +		 * Completely block DMA by disabling both the bypass window
> +		 * and the translation aperture.
> +		 */
> +		bcm2712_iommu_writel(mmu, MMMU_BYPASS_START_OFFSET, 0);
> +		bcm2712_iommu_writel(mmu, MMMU_BYPASS_END_OFFSET, 0);
> +		bcm2712_iommu_writel(mmu, MMMU_ADDR_CAP_OFFSET,
> +				     MMMU_ADDR_CAP_ENABLE);
> +		bcm2712_iommu_writel(mmu, MMMU_ILLEGAL_ADR_OFFSET, 0);
> +		ret = bcm2712_iommu_clear_and_enable(mmu);
> +		mmu->domain = NULL;
> +	}

My understanding is that when the IOMMU is enabled, the address cap 
represents the highest permittable memory address; requests for anything 
higher would abort. So I had hoped to achieve blocking mode by setting 
ENABLE | 0 in ADDR_CAP, thinking that would set a cap of 0, and hence 
memory accesses would fail.

But a Sashiko review pointed out that actually this value would produce 
a translation aperture of 256MB, because of the way the register works. 
And I confirmed this experimentally, Sashiko is right.

I also confirmed experimentally that setting value 0 to ADDR_CAP (i.e. 
dropping the enable bit too), with the IOMMU enabled, results in a full 
unrestricted bypass/identity mode.

So unless someone from RPi/Broadcom can inform otherwise, I'm going to 
conclude that the hardware doesn't support blocking mode and remove the 
blocking domain implementation.

This will cause the iommu layer to fall back to creating an empty paging 
domain when blocking mode is requested, which seems appropriate if the 
hardware doesn't offer a more direct way of blocking all memory access.

Daniel

