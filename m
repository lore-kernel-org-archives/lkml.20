Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495375;
	b=rYcuJgcn2yu6OA762s7bRCXINDo5m51OGfmRGu7f+TmGf9z8TcCAyHovycjXCB3pn++J
	 H+WGLKYEiMb2PeVOzRJG84yZNd5yuAyCqmhXw7bQTK91Rs+xWPGUCCx2ueMXJEnxQj8RJ
	 UL+egHARmYZ3HNWe20bgx0irNSvEWCkRicDY7p5UH86Sy73vLQIWY04OcfckFWFkNbcYO
	 pnOZKs3pL4w6NR7U9D5MpJT/ESU9WHPjOwHpiDvQUhC7xjUk0OyLjBN1b9GeE6tsstCkU
	 Z1LS4n8hXE5eB5JVzxBkh7u5rN2W3dxOhdf65PNkUPObgXV+oHM+gPyo/VWzWtbSwww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZhRLvzJzPI5U781F/KKbvaLNO/DRwhdbN5Luxo3sgyY=;
	b=tdxV1sK3UtZm/gNcNGxnepJg6GMwoCJpIrArusQ65ittJkZPNC8glTo+i0A42vPMBJrM
	 WeH+28kzDZ3L8gGWCr+MK2JLuUTKmBuRUwu58B/MUA2Kk9LoMpHhN1NJLBiKVPlWMH/yc
	 2idkEPpJ8gPNH5VdxGwbukimgYta995kwzvcIcq32DiAo22tfmiu1Le20vedd2dum9lRR
	 LVWwYYt77PXI+FcYS3SYwEl9aku12nWMyKsheBJFo3Uz2bHuTXZ+tx+QTdJlPKDn5jWxa
	 cPihnSJWJr4Ncu2RmvaPxpwBj/+zkJSBd51X031xkqSa5Dy9TSwGYeQZPPiNd4aZ/Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sKPsmVLV;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CCB606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97CCB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sKPsmVLV
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1d2ec9aadso41415e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792495373; x=1793100173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZhRLvzJzPI5U781F/KKbvaLNO/DRwhdbN5Luxo3sgyY=;
        b=sKPsmVLVIN2r3Na3N86n4QfTZOVMbBn0pnmaFC215UsDjoBhnnFoZjIzuYYHIBJ+2j
         jf0uUAIg7dhU/gJbZ9tb9kAMhHIxp0CLyTEjNWPY0PTkt/CcpkON5rlrV+yC5Qe6QMnY
         rARJkhZCCVTODWDpgyRXtQUKu7hc04DUyF5Mea5g2/oG7YBVEi2nD/MTMQd/YEYof2fW
         yDG3v9ntVC/aJux2NgJbiBbE16fMCNuhGNvxXMfapjMuW/Cbxo8+ERzJr35+foERq23l
         8hRVtecglofX9CtiMeawsbz4uLNwUmMQw7TgvYWypxNAsPGAVp11FQjoConQ6mbYQkbn
         lsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792495373; x=1793100173;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhRLvzJzPI5U781F/KKbvaLNO/DRwhdbN5Luxo3sgyY=;
        b=kJyqmozXIIEtTpB+yCE8g3gZkKktSQpfP32hJwhAnWhdWAlVsM/GAvW3yPe4KatYfb
         3rN+F8dd78B5Biz7DJR2hnIzBS5lbvgRl/Y30DaF90LXiET/eshyED5BRqFsPR2Pwwv5
         rEXCkjmoRg0pa8XvwmjTrcvNBbB1WalA4F03PJBkvLlhoWpEW5z6NCHfmFGuCqpSc/hm
         l90VSRYX9qHwfETLDTvAhdiaQkM62bdQZXwXAYahTzQ3CJX7AOIj1TK5KDMfxdAM47zn
         nVLu6QwR93W9uyR3zkS6u2Rc0ROBEj75TswzGoGdyfoB/Vm4pytw1AGriUvPajEIGBC0
         IXOQ==
X-Forwarded-Encrypted: i=1; AKwUvBy70dM8xHhp311JOKK4Jv+iEjIihcdye+2X9UerrG/p/ey/Alm9/Gz1MgJ/rENu6Kk/ow58Pl3e77orY4k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsZaqzoWzHvs9ztBQGCfK8PFIIWPWz3dVoG4wA9G6XAb4atDtl
	du2BSVzSzIdLNS/sRs8v9oCC900naGKkZh49WAZXMltwa4nhnSP48rHNzLv+UyDXjeVAXidUMg4
	GmaUunw==
X-Gm-Gg: AYBFou3A1bV7rLMkrBAWWeSr0oVZvSqhFnMQtqKrwdvc6Om2iGOJqGGx5meTNEKU4XP
	zCd0SMfsfIfnB7nUbDoC1fTfQpPdtpYl3EG0sldWoR3QF1zMWix37bj9k3K+MKPYt0L7sUFAdni
	SuxjdMaZ0vu3pPsUKmpx1GCC+BgrmgEmv5xxi6XxrInHA7gfymmMWLJoZ+ovzD4AazFYrWYcR6F
	e45Lk1BMwUxjLUhryF4SgaQYujqzQoydAyE1LP/V6F6z3BRAesWBZh+HNtswnGpwinEv/uJII0H
	EOY8f0mY/WVTw3zrUpDlXltSn2g2TP7S0Yf6/YhnAnnIua+h1z19T25PH4SD5TuVoQhvR/9UA0k
	IBTwtqdi+Yr29+5k2TPPrZJ55v9lGWrNAR7mjmKu6KispfvylxdFR84GCfJBKSOJ5UVBfhf/sVg
	cD37WcSK89jsUF86TWSkWnvBFKLDwm0jfWLnW11tn57OE7wJatOwYD5DQgz8R+7+0UqIpbGVKrj
	yHxZ8HRXCOChcb7RG/EJEFjEYA/qkKonjtcYR3G
X-Received: by 2002:a05:600d:640e:10b0:4a1:98b1:1de9 with SMTP id 5b1f17b1804b1-4a1f59c151cmr652475e9.13.1792495372639;
        Tue, 20 Oct 2026 04:22:52 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208b1sm5787276f8f.33.2026.10.20.04.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:22:50 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:22:46 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@nvidia.com,
	praan@google.com, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org,
	Cristian Prundeanu <cpru@amazon.com>,
	Breno Leitao <leitao@kernel.org>
Subject: Re: [PATCH v11 05/11] iommu/arm-smmu-v3: Disable the EVTQ and the
 PRIQ in a kdump kernel
Message-ID: <atdPBqd1-xLNZ1hs@google.com>
References: <cover.1791226953.git.nicolinc@nvidia.com>
 <fdebf9f372ebabd7a44581a2068d6fcbff058783.1791226953.git.nicolinc@nvidia.com>
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
In-Reply-To: <fdebf9f372ebabd7a44581a2068d6fcbff058783.1791226953.git.nicolinc@nvidia.com>

On Mon, Oct 05, 2026 at 12:30:48PM -0700, Nicolin Chen wrote:
> A kdump kernel cannot use either queue. The crashed kernel's CDs and page
> tables might be corrupted, so events would spam the EVTQ, and there is no
> way to serve the page requests that would arrive at the PRIQ.
> 
> The reset routine still enables both of the queues and then masks the two
> enable bits back out, having already programmed the queue bases and taken
> the interrupts of both.
> 
> Clear ARM_SMMU_FEAT_EVTQ and ARM_SMMU_FEAT_PRI in the probe instead, so as
> to entirely skip the queue initialization and handling in a kdump kernel.
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Link: https://lore.kernel.org/all/amiBagGKn-Aym1DK@willie-the-truck/
> Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Breno Leitao <leitao@kernel.org>
> Tested-by: Cristian Prundeanu <cpru@amazon.com>
> Assisted-by: LLM
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 756825e004774..42cd30c79211e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -5247,9 +5247,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  		return ret;
>  	}
>  
> -	if (is_kdump_kernel())
> -		enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
> -
>  	/* Enable the SMMU interface */
>  	enables |= CR0_SMMUEN;
>  	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> @@ -5576,6 +5573,15 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	if (arm_smmu_sva_supported(smmu))
>  		smmu->features |= ARM_SMMU_FEAT_SVA;
>  
> +	/*
> +	 * A kdump kernel wants neither queue: the crashed kernel's CDs and page
> +	 * tables might be corrupted, spamming events, and page requests cannot
> +	 * be served. A disabled queue discards new records without raising any
> +	 * global error.
> +	 */

I find this a bit confusing. If the CD or page table of the crashed kernel are
corrupted how is it safe to adopt them later in this series?

Thanks,
Mostafa

> +	if (is_kdump_kernel())
> +		smmu->features &= ~(ARM_SMMU_FEAT_EVTQ | ARM_SMMU_FEAT_PRI);
> +
>  	dev_info(smmu->dev, "oas %lu-bit (features 0x%08x)\n",
>  		 smmu->oas, smmu->features);
>  	return 0;
> -- 
> 2.43.0
> 
