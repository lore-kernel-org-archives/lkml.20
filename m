Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398570;
	b=EVpyos60FgZdydfk5fXcSWzqBUW2Zj6pd+FzB4BQEucn/4AadHCxrVA3KRd2/qPSe4Ns
	 qPKFBn0jrcP6iBLBlTl9ASQ44H71UziXfotwmBd20a6xl/82avrhPFXYW+yEBGhYT2web
	 bssOTXepJOiFw2zAVZUIrhWXauU0zIHhEv4GlJIxd1OQQ8/yJtG0Ccduki0t7hgQBKimX
	 DpIN1YQPfPpRF0K7e5I5+nB0fovPanrWUKZBWLDoS2Takhr5VXodW7t/M5wZ5GOiPUpw1
	 M2+P0Wk/fcRf4DLflL2RO8rOeXnPdJOCNbT2jdzO3gcmdG/DxCbAIxS3VB1j899DbQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Mf3ojcAaOl5Wd2bB/OvSpA9q4iDAVUFZx+UCDfwTy74=;
	b=jTOlCJHRE+UENkoQ4gKz4FJIKF0m0tA8I8e7s5BxF23aywqOhAoc4wMySOin+tchbve2
	 GIxHwVrC3PVic0/1df56L/zggAlWEoR3bzb1qA4NZqYw0LI2mH0MNBFMShxEDyNiRr3bn
	 qj/TaRAkrbm7MRfW0wL2IMOKMjbGsiE5KXLYEhk/iTHcTUu3rTxahRpN/Qrfp0jZDX8Am
	 xNM83i4mX+LMlxPNayV4wj4RwAW1lipblY2+nPWZvKHxjHVETzB9sbYRs/EIaIbR0lIKB
	 KYxlV+rZpG/y53JRWi1zAOJJ+5R8PzmqhORN4spGSnai7RYU/wKHnSu0sbyTUs2oS2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Je1CYIjf;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93BF606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C93BF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Je1CYIjf
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1665812f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794398568; x=1795003368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mf3ojcAaOl5Wd2bB/OvSpA9q4iDAVUFZx+UCDfwTy74=;
        b=Je1CYIjfuwflh3C8ZTO7fGiG3VT2JZ4/KZsAnIckMk5yyFTVUjMTyMSMVoowIwUALe
         rIx+YCcQd5d3c/Oo7ywHWhe+3KSTQ7o6rFpU0FKq7oz4uEO2xHVWkEcknh525ow1mgCu
         gWFknAYgozrE3xkB1Hf35d8etynb8NZA5amXxyEuDKuHJdX9BiOMQOk4XO6ih4oDz5ll
         jiNbUTntFWcfE3xAvdYsPO01gTShdzNlx4xruDnGGl89qAWG/eS5QeVSu9Tt1rrguObP
         WWiW9en2E3WuuFqlZwdLZQMuWBF1+OevnHMcH8EoqrsFJwJLse2YUIb6yJUacp0hHv8D
         xyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398568; x=1795003368;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mf3ojcAaOl5Wd2bB/OvSpA9q4iDAVUFZx+UCDfwTy74=;
        b=TX+rvwcd0+JD3K7tkvucMANs48LDSyZG3pcEqM7+flbZPRrQ99BtEOq8HNFVm9H936
         3tK3klEwPl9G6fqzpcBJD1YlpXXWNaSoIyDBVQanKhcW4+C7CHu8zfKdQiNNbErAmo6n
         AK4VGCxotWc+m8LhWJ5TVHaankeq4pGQaSlbQU9SkuPCqFrNb+fmXN4B7sfMXSfDV+FS
         ZEfE47MA4Nfg9bHSE+BVdDli4IvxP60nQxWb8ONVUfLGaimnRfo7+3aKCoHxnM+77F9t
         uBxrTbJ+ijnS2vwbwOnb6f8w/HcIOCT3CUwSG3eBKDmZYNGvr7Y0XERCSvM+srLwjOYQ
         yMKw==
X-Forwarded-Encrypted: i=1; AL+hErFIcYMzbHGwtF13fdnpY+uQVVGk+ReIu8GRplDYFBsYXRcMDlHxyJRFHMQzoJm4hHUR8uMpaSVxkNm/YWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z952E9U2rcSmJhrPMBdOSqSoVaetkCd0OG1wv/hSSHAIH+wNMPs
	BP6bX3KL4D+SveIo1O15ZUab+8NsTeAHse/nI3dGwR21aVhdvRtY1jh90Td1x8Y6AVY=
X-Gm-Gg: AYBFou0NrHht+7p+doz1qnD8ZrkZGWqs9eBqx8CRK1qUs/7meeB38x8uaOEgAsgUnVj
	4+vxMKyYtIfd69Ucy9y/iBtPn3Wl8j352Llv2AanopeCRbnfHnFspvhKsiK8mbD328zB7z3BQAC
	CkxfCMtx64jOOtDAocVCBZr/lQIDOBZ/yJds5eA+g7viHgv0IqHzx7j5+wu4CqcZpxVbEl2BzWI
	xPH//6m2SbKc36GFCnhpUnJuZytOU6/KfbuCiwvmMPSZP3kcOJwrw8l0gC+4BkVLTDDhwssPS2K
	URg4hzQ0ssED1eSV6+liTdVoNYH7yx42a/L/WATEuR4gsBNtOVbL3qaIDbITRAVACjvBmBSWttF
	yfYfzsrguP1TT8c22sgk49Z5S8+D7zB5Xl44+IL+/Qkfa4+D6UKtKRQmqmHixdtfBVGYOdCygzL
	y+1+UaBdePTWydyXzXeEU2poB2KDD0FkkPRUkB7NLkxBVeCk5YQ8g1P/1cVxDUrb2XVJG+idT+d
	euHmV01/6ku2/ZMPe5szmDAhFkawPj5OQXYpDt70KfgNuNFUwf7IROSs3q5SXy2/qPq95IZYvme
	7w6MTKM8M0AUjrldvtWHdvqh180ufsjKd7KDl6nB
X-Received: by 2002:a05:6000:420d:b0:48b:1a0:5630 with SMTP id ffacd0b85a97d-499c86a10f6mr3780756f8f.41.1794398567805;
        Wed, 11 Nov 2026 04:02:47 -0800 (PST)
Received: from [192.168.0.167] ([109.76.11.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c377fdsm8869991f8f.21.2026.11.11.04.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 04:02:47 -0800 (PST)
Message-ID: <3713bf13-cec6-4b02-a29b-8f76070f03b3@linaro.org>
Date: Wed, 11 Nov 2026 12:02:45 +0000
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
Subject: Re: [PATCH v7 4/5] iommu/of: Require reg for iommu-addresses
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Vasant Hegde <vasant.hegde@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>,
 Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
 Eric Auger <eric.auger@redhat.com>, Joerg Roedel <jroedel@suse.de>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Oza Pawandeep <quic_poza@quicinc.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 17:14, Vikash Garodia wrote:
> @@ -257,6 +252,9 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>   				}
>   				type = iommu_resv_region_get_type(dev, &phys, iova, length);
>   
> +				if (type != IOMMU_RESV_DIRECT)
> +					continue;
> +

This change is not about requiring a reg though, which is why it should 
be a standalone patch with its own justifications.

Basically the patch should state why a mismatch is dropped instead of 
being reserved.

---
bod
