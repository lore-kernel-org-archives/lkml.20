Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793238101;
	b=3OauRcaz0i75TASleljPsKCT47Vi9eZVkLPtun9cNwq/OIL9osm9pZDrX4VC1n/0Vm2M
	 A/KQn8ph0kY8SbRA8lTqGWRWtBMMZ2CgiuNUhJ3LNg2QXj7pVvxvbk8xx/DRF8aKmfXeh
	 HWA7YuKbUcLo0XQOFK7ItraWr5fhKG5xLceAFTYOVam+Md5FtZiy09sC5kieiiXCO/fSf
	 1AvaMxLAyK36AtGXB/3JYLF+HG3a7NSva4vD0wydJ3g65lr7Xe4/X8Guti6bJSv7Fha95
	 rHsL2pQ+nM3EZXphJ21hQh2GkdniWa6nFaPtFikhW71s9GAT/KPkAJVK8RP2az0SHWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238101;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C7QU0MynSPZH9XIFESMQueT1x5DIy1wAFQgauvOVdHE=;
	b=xDju7ovR5zC0GJo7p8QEYV8Nw4A//wqWAM5MSbwlNlTtwbeJMthugs6ZlBTHQfZs7ySI
	 MbHaPhKRyiQBK2DGas228Sl0fB5AisSemwDjscNVrlZPKOPrJBfV2xv8LrfffEDgz7tsh
	 kHJE9JS39vv01n3oszxSs2WvolMzaIhHRdQ9c4A862jkb2T+jTn2XYFxC4QP/JWLXY+TO
	 ETr6HgAJ9sIrnl/FqnB4h1ZKtCbZB3zN9L35/IyqIxT88AjXevii76XAWUjDTtXOxSdaT
	 HB3vxTCxD1xtaH84zx2M/1QyKKnrqDuzFabSPNz7gIneQpk0fe3PxFxETI/crgsbSMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=BhkhAeRP;
	arc=none smtp.remote-ip=115.124.30.111
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99482606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99482606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=BhkhAeRP
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793238086; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=C7QU0MynSPZH9XIFESMQueT1x5DIy1wAFQgauvOVdHE=;
	b=BhkhAeRPRdoyNyO8/5DbFQPF/SxZukwXsFkS6vfHineG/AxisisGJoUqUG4f08YsQGqu3P5qUlKEBVPtLiCH8aux4F2TYL6u8vvsdA1vAajye3my25opc9ScApSLcv2Xg2jAWBDSl1S71lmJI29phNeosh7bTnLX2r8lXJnRkic=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XDhzCnt_1793238081;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDhzCnt_1793238081 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 29 Oct 2026 09:41:23 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@nvidia.com
Cc: alex@ghiti.fr,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	gong.shuai@sanechips.com.cn,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	joerg.roedel@amd.com,
	joro@8bytes.org,
	jroedel@suse.de,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tanchi25@mails.ucas.ac.cn,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH v5 07/10] iommu/riscv: Add domain_alloc_paging_flags for second-stage domain  
Date: Thu, 29 Oct 2026 09:41:17 +0800
Message-Id: <20261029014117.80953-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <179320128834.2412245.6365239689333877950.b4-review@b4>
References: <179320128834.2412245.6365239689333877950.b4-review@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>> [ ... 22 lines skipped ... ]
>> -static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
>> +static struct iommu_domain *
>> +riscv_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
>> +				      const struct iommu_user_data *user_data)
>>  {
>>  	struct pt_iommu_riscv_64_cfg cfg = {};
>>  	struct riscv_iommu_domain *domain;
>>  	struct riscv_iommu_device *iommu;
>>  	int ret;
>> +	const u32 supported_flags = IOMMU_HWPT_ALLOC_DIRTY_TRACKING |
>> +				    IOMMU_HWPT_ALLOC_NEST_PARENT;
>>
>> -	iommu = dev_to_iommu(dev);
>> -	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57) {
>> -		cfg.common.hw_max_vasz_lg2 = 57;
>> -	} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48) {
>> -		cfg.common.hw_max_vasz_lg2 = 48;
>> -	} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39) {
>> -		cfg.common.hw_max_vasz_lg2 = 39;
>> -	} else {
>> -		dev_err(dev, "cannot find supported page table mode\n");
>> -		return ERR_PTR(-ENODEV);
>> -	}
>> -	cfg.common.hw_max_oasz_lg2 = 56;
>> +	if (flags & ~supported_flags)
>> +		return ERR_PTR(-EOPNOTSUPP);
>
>This probably isn't needed since the switch checks it?
>

Right, the switch already enumerates all valid combinations, and
the default case returns -EOPNOTSUPP, so this check is
redundant. I'll drop it, along with supported_flags, in v6.

>> [ ... 30 lines skipped ... ]
>> +	switch (flags) {
>> +	case 0:
>> +		cfg.common.features |= BIT(PT_FEAT_SIGN_EXTEND);
>> +		if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57) {
>> +			cfg.common.hw_max_vasz_lg2 = 57;
>> +		} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48) {
>> +			cfg.common.hw_max_vasz_lg2 = 48;
>> +		} else if (iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39) {
>> +			cfg.common.hw_max_vasz_lg2 = 39;
>> +		} else {
>> +			ret = -ENODEV;
>> +			goto err_free;
>> +		}
>> +		domain->pscid = ida_alloc_range(&riscv_iommu_pscids, 1,
>> +						RISCV_IOMMU_MAX_PSCID, GFP_KERNEL);
>> +		if (domain->pscid < 0) {
>> +			ret = -ENOMEM;
>> +			goto err_free;
>> +		}
>> +		break;
>
>I'd prefer you make functions riscv_iommu_init_domain_s1/s2() to put
>this in, it will be clearer
>

Agreed. In v6, I will move the page table mode selection, the
PSCID/GSCID allocation, and the stage-specific feature bits
into riscv_iommu_init_domain_s1/s2().

Thanks,
Fangyu

>It looks ok otherwise
>
>Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>
>--
>Jason
