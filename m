Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294795;
	b=arlg+QI8dg4FZO14S3t7eCG4dcFNrOupCf9369GX13nyE0oYc9xIblX6lKAWNHtFa7xU
	 xALi8taF263jfBnwH/5JAxhog9D6lXWhajhU+1oopCspmRItXTicnxz43W/VQD0575B45
	 hFDnqo42EJAfe1MsHU3pWERLKcVOuBBHZeHve5Z87+g/r/vN7mxW6/O3mtb1UGU/AmPHa
	 4JqOlYU3e7Gd28cen4ltIpMYBfBALqA/y/m5bLjw0lCDLkcLOo1Zfu91HiaAnksgIAzLU
	 NDLJ+iXPc0RyLOlrf+mHhfiFD3rQMYKGh3o64n7nqc660ZqHLU0+QSD4tmEklESlGFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294795;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O7UXFVgKpvNjfKTFlHSJy5Szag8SKeYr2EcItqqOWiw=;
	b=M6QmXSpa6BVq+RyMDD7ilR1ESRtiFYUkD8vkn8n6kR8rXR2SlPuwUlwXIp4GMKGlSskU
	 j8m2BNLzH15LgVw5gsBqjOdmeFq9kcRrGOexS1nmpxh3BB9zqb32+l8ddpvHp7jrLy/Jo
	 OGIqHeV2l0UAiX6DefBfWwqKp4cxXkugYKm8EBkPFy01Ht+5KJi9vi8xHp9pk4T82Cs2b
	 8k7U+rTVLug6C3q9NaSGNWnYwpAqH6/PASaiUJzuBpmnGnlzPYdaiojQkvp6SKtJbb0L+
	 Kmgma4QsGmdOp+byPjuk0c1sG+dZqm1qQRib6qhRN5TajkyZUAWPSwe3/vgP/Kc9QvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pccZ+g5B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dGi6ML1P;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4E5606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E4E5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pccZ+g5B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dGi6ML1P
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ADcO2295639
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O7UXFVgKpvNjfKTFlHSJy5Szag8SKeYr2EcItqqOWiw=; b=pccZ+g5B8bNi6/gv
	byGX8aXLKOZRv456TpYR+WsMYwZif4FXQvaudpLIWegAEQmWeFKJhOCC6gT4NhWu
	HJgZKatPY/GzU4RNa784o9mMe9LssI6kF47gqz2lsYynCTEQAHydRm+U1rfZ26yO
	HMD5OADYkcwCRRUiBc+mumXP06zuiedmYXsATCtUw5EyBjAw00FMg40it6BkC2ds
	VqokwfaSeCHdyevjt+LoBcFbCLnFoikjy7ZdV8taEhIhV7jpEF8ZvhUm1Vvjdsop
	4O1OvU6PLo/Ko5wEsmyDwbNupgFKbFnKfm7T1Wb5SGKO695TR+3gOynmlqP0f6wO
	PjogAw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5v66s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:13:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso1135053a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794294793; x=1794899593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7UXFVgKpvNjfKTFlHSJy5Szag8SKeYr2EcItqqOWiw=;
        b=dGi6ML1Pr7NiSNCRUs+9Mvh8D8SfdsV5u92HjWIBLwt14JLWAchmT5fuWIBQvP+wJG
         WDCCTsopaleGkVnvTTCltfS3wazm4FCr3VB5Q+ZqXpi7P/0sGG8Mj2JcrDNfaB54F3uK
         W2t+H4o2XI7hLGxCbnYSfjgV/UUtIvCF1qj6fv1JKNlUEZ7FV6FanptXfiSkswteaV+m
         Ldi7C3GMWX+MA/K+duUyn+59XE55eVG7O9M5zoElxSLUxxPRP0yzPMYaDAf0nsn8g8TI
         SELwCaD+NJ9nZq4qBE0wCUwQqwtH3mwnA8cXZvY7zpLyk8qzdFKoeMsijqd9WmaKD7rp
         ZjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294793; x=1794899593;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7UXFVgKpvNjfKTFlHSJy5Szag8SKeYr2EcItqqOWiw=;
        b=TDNO4clEq6KMs3CT608VyfXozxs8acB/Lj/1HYraQIjmflMngIkWjueGrgAeq5VVIb
         /0j8K0Bd+EetJ0UrOMjWi6kK5N6CdumYvtXo6bpDQ0PO0XXEMSIMbZ+C0fyw7IURZR/p
         bC5F/MKUAdrjX+s1O7EpG8Eb4aGUwDMHO/IRBhH+u7bw4cRz6+XUEjyARqqp8ohY7FXJ
         02D1i2XrUVBg2w4ayuRX4EdX5NWlMHoJntsuWNqUzRsKTdDUk759Ve+lPVJKkACIXIBD
         IgnoxNUAYqaNqkFvCAj8xJ39UziABGQmucdYsz8y+K9AduMkIIAApMhE+V2PmrS9GwJg
         R/OA==
X-Forwarded-Encrypted: i=1; AL+hErHAJABBSZEXRg9BJWV1PrL8ZsppvZ75rKCrncL7m/4WGHQFAZW2Pw6YcRQmbhIZ7+bxk0U+rQMCVNTh7gk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KLgltR0iY+Y0VQdEzaUeO0KkMRIiDwxyh+o55rTHUYigOX8gy
	E8BnpnXc3feqH2iwKBjGn3vrlV0ckvkcxmyCmWRTPJIAVIR8blQwC6O0B3MKXMafhfimqHwp8qN
	PNJBlMgQQuj8wcK8yahAxvcgWpI5YOnmsEQPeaBRAASJew6193Ukmh5HMGmr8Sx/e6FU=
X-Gm-Gg: AYBFou0UDeMJMXepAQdh1cJK5nyf0JVMSSuInxlbJVAR/wkHeun5ZlXHxUpJZBvjr3m
	oa+rHzfGR8YqsrlnaKDmdp6O5S2u3GiWf4vWtKBlfVEPiB1FImO3QVnpha1Do29hDwCJcXVzHxw
	46ZX81lmL+DPGHnHLlctXIGvWYjozm696UAeF7FM5E9t0zR1ZBgVEumcmY0efoaIC8wHQRdKBAi
	ThSKMGI4oFCyfRLN19TYfN6EYkZF69L2XTfyMyuScjff5g3U5TyercswHSHBO/wcKCbANXv2UK3
	UxHEjlq/ivKKjVsU/QT/SDXbZJohb4nJapn69xjZouL5/+bRh7EIHKNEDuUbLJidqnODJBtfFGh
	abgDHcgqOOKFBFPXn0VM+R7EHMVbCxZey3Mj4iOfadW6AL9jSMTngULKMmDue8hm48I6+ON6bNQ
	==
X-Received: by 2002:a17:90b:1c8e:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3b166cd3dfamr1883540a91.44.1794294793465;
        Mon, 09 Nov 2026 23:13:13 -0800 (PST)
X-Received: by 2002:a17:90b:1c8e:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3b166cd3dfamr1883528a91.44.1794294792977;
        Mon, 09 Nov 2026 23:13:12 -0800 (PST)
Received: from [10.64.68.239] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678d1f42sm2761077a91.7.2026.11.09.23.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 23:13:12 -0800 (PST)
Message-ID: <b75ff010-305a-492a-bd16-b27fb8a4e064@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:13:07 +0800
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
Subject: Re: [PATCH 1/3] iommu/qcom: Invalidate the TLB in flush_iotlb_all
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
 <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyOCBTYWx0ZWRfX/iqXuK1w0sM4
 QNF2fKtcQd+SB/TmDWorrcUqf4QxAIt6BME8buqt6+5JirVI/isFsUPlXWgCZ4UnY948TxKLJLV
 Zuyiz3zl8BY8L9xJbCL8ijG+IIj85uQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyOCBTYWx0ZWRfXxt35U7IYpnYG
 5hrhPLuo3IzH0+gybe/isKkoyUQQkNAmvDlZERHU+NR34CNLI5sztVfzpkUT2ZXuYUv92W1gelz
 TnkrXPMjlmCLp8/zgQUUOZsS8pTIpm+lOULI+SD5foNZ2+7SYJC3mCAfF7U1OMkd+7KgrvYCczG
 mgE2Agv57KinNO7KCene8a7So/OTh4IdQaofOgBpzLqlcGGIGi1e4csg1455hFTjtd+NQDeWYmL
 aXlhZbvDZSxCzpgH7fg5fhVvW+hizkAi1WPVv9U6AMpjJdw8oYdFXedrXN2r3cDkge4Q5rQmVdJ
 LvMYaReZeBa3WKAo9mBGtlINqOEgbhyo2Wqdhye4iWmdycuLXl1Fa05jdp6U9Tmanm5+ilbu2jk
 ACdIkOjF4q9jSsaaYB/6DCOnTwkdXkMpkPnlDon/p1+NJUvAYyDgB2ftWsCqTf3yv/pdSDF1GYF
 KeaG5knbeG6Jc5OJFTg==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af2c40a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ih06bLOFWD0XbLq0AFAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: wcF-0LeoNjVzxybKw6-1Yaff75PCei9J
X-Proofpoint-GUID: wcF-0LeoNjVzxybKw6-1Yaff75PCei9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100028



On 10/31/2026 6:04 AM, Dmitry Baryshkov wrote:
> qcom_iommu_flush_iotlb_all() only waits for a TLB sync and never
> invalidates anything. iommu_unmap() users do not notice, since
> io-pgtable invalidates each page through the gather, but drm/msm unmaps
> with a NULL gather and relies on flush_iotlb_all. On db410c the GPU then
> hangs on stale TLB entries as soon as another process reuses the IOVAs.
> 
> Invalidate the whole context, as arm-smmu does, and keep iotlb_sync a
> plain sync.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/iommu/arm/arm-smmu/qcom_iommu.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 21d18ce67b98..54130c32056a 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -479,14 +479,22 @@ static void qcom_iommu_flush_iotlb_all(struct iommu_domain *domain)
>   		return;
>   
>   	pm_runtime_get_sync(qcom_domain->iommu->dev);
> -	qcom_iommu_tlb_sync(pgtable->cookie);
> +	qcom_iommu_tlb_inv_context(pgtable->cookie);
>   	pm_runtime_put_sync(qcom_domain->iommu->dev);
>   }
>   
>   static void qcom_iommu_iotlb_sync(struct iommu_domain *domain,
>   				  struct iommu_iotlb_gather *gather)
>   {
> -	qcom_iommu_flush_iotlb_all(domain);
> +	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
> +	struct io_pgtable *pgtable = container_of(qcom_domain->pgtbl_ops,
> +						  struct io_pgtable, ops);
> +	if (!qcom_domain->pgtbl_ops)
> +		return;
> +
> +	pm_runtime_get_sync(qcom_domain->iommu->dev);
> +	qcom_iommu_tlb_sync(pgtable->cookie);
Optional cleanup: pgtable->cookie is already qcom_domain. Could both 
callbacks pass it directly to the TLB helpers and drop the pgtable 
variable and container_of() lookup?

> +	pm_runtime_put_sync(qcom_domain->iommu->dev);
>   }
>   
>   static phys_addr_t qcom_iommu_iova_to_phys(struct iommu_domain *domain,
> 

-- 
Best Regards,
Yijie

