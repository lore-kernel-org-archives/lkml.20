Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD1F3DA7ED
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269405; cv=none; b=IEWsvD2oVs+DXa0HpsaLnEauDPlNOXU8JvTWV+9G1MXgLWFkJIekWVVjTy6B2STPBCliZCDagg9E3spSIG/SY4a179huUAyQHId0C16r94yHeslhvOt0KjIahsuui+2gUxGZ4D+CnupR0tT+piRos0EL656Th5cMXAz4Lj1u344=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269405; c=relaxed/simple;
	bh=e77wK3Tjm1qlndE52YnpbAootNZ/t81SF51Mi76xBSs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O3EuXz1qkqMQno2pyl2RGBKIKL2HKxibetPXR2B2W78/NN0oZmcynx8M2x2A8zC6GX4/MRLwqijsWU8M2pRjPa3at6Bpfdnrmp2kyjsicXY9xgLJiDS/BO+TVaJ/XP31S/jOqCTPtyr0/Qz9QHAFcnn4Y1DiFodXf4SfSL1fwGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+HnZ1pl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VIBs8P8U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+HnZ1pl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VIBs8P8U"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFeUdu3064792
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32xAgp0iORpg4Acec/AzJvfVNP09X3eJZq2Lg8ig1hM=; b=A+HnZ1plxeuKDVQG
	N15/ZpJVehZ4hzwOaRrr9lHfc1q466qhpy3LxhnXgsF+P5nCduqUZ8Nxw9shRQHE
	X26I3PaNjOMXaQoDKLWk1j6mu9REbH9Z+Jna34491FRdhLqYKqFirVfaClrmVox0
	1CkbwVdeju8Mrxiw53vjPejXVebAzxwIf5L9KgoCHAtpb2rH/xVoW8g5IQHiavPA
	ChyTj9GCdYCeu7hHsbl6MZ0ESyqjqmbcVmAiLVCYQXx2tu6/j6FZnsOrCEdj4UKD
	i0edVhJUmMy2xx2amxOLlA2+nhZtPRsUuTGoCRctQqyAh8O/gRZAT95+zpGOvMiK
	qraX/g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjhpan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:03:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3dad7ab3so90435a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790269401; x=1790874201; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=32xAgp0iORpg4Acec/AzJvfVNP09X3eJZq2Lg8ig1hM=;
        b=VIBs8P8UM47XrJhVn02cfwTPN035BWC980XtSLtqWQ4A0lpeS894t7mOkqaCt7uFdz
         uCZ7TS4Hoe+DXmQRgqsIzSlWi9KGibelTKVygGT9riZl40oVjBuZrddPuojAD109LcJ+
         e+Q/0eC0k9wlDEsqsAHvaKhaarhkq8EDBmKo/B3ZpF249/y5JTPXL+Xh257e2qt5zcQe
         RyUJ76WWz2H54tNtyfO9n4rGzeWtwYIKJt+3V72zAMCXegy+mWGEutEi2XJ+B77IfwOS
         Kzlivdc20jddHoy0U6lOCWwkZCqY8Yf2M9OynPKDA9jAX11IhJdPGQe8VJanfbYW+RsP
         egdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269401; x=1790874201;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32xAgp0iORpg4Acec/AzJvfVNP09X3eJZq2Lg8ig1hM=;
        b=PC1U5l47m5BGa6d78A98GgSYKdFGumIGlaINGu7W616QR1HeMikE6hFcW12JViUe0A
         LcB58bmZt/MjLjlk2osjuhX4bIEngpgLXAYItpYUHtYaG326K+pijbH9JAArw+UVK9aQ
         PzB4t+/nYgOGmI3ymmXNHRFmtF78XdxfMiDjNLOR9cWUTNrUcV1il1a4QK9tMEnxTSOF
         fsTXyTYDEbo5ew0GduO+nnLLQnV8qzeqgRubZDoU/Vtr1OKP6j3guz2NKwRTP7BhN1ZL
         6zLp/pC8DCQisRUEcEKAvHwX+/f+VzJDaGCVP1pu6EckpbLCnK7HuoWHQKNUv+G+4Uao
         x/zA==
X-Forwarded-Encrypted: i=1; AKwUvBziduWylSaKOxa/ifAHzwKSeoh5r9BHbvZxUbEKgV+VrWVFCnrauiD3OGQqWnL01/AHAkKCqPNa3mCRDzg=@vger.kernel.org
X-Gm-Message-State: AFuF++n+V5FG2/SSgSR7X8GbfONj5glXO2517c1AKR+QSkoFZULoJnVk
	SHv0SUvYAdTEsBn+8gx2QmEFrn0vPISWgXCamRN8xBDPzCR9GnSQG5DZ2ChS/wDoHPVqwJh6j/8
	SvPsH8f/xR2Yzw79/l8XTQllUI5K0Rn0lpTAgU3xdQNY9VjQagp5CFNYfyRd2MRFqq7k=
X-Gm-Gg: AYBFou2cvbpeX025iCKE2RYjoSOyhNme0WtDFNEUq5/ERMUlA11D/BqPTdYQuWG8Fy7
	yYVRK0v+Zv1TGczlSNEAU7YkX//ROvgWq0n09xN7Vlhsp5yPIihLyw2vw4qU98h2u9eBIdaDlBl
	mYs65QEV263mg7EzZfgPZtrNtIUkj4SQnJzlmvl4f79NZSAKIrSKEYXN4sh4GLGXChFf5wBnOFK
	Ne6q+mipYGM4ZMHo3USgyum9nJEI8/7DxsJEQtxUNWUGeHJjK6AgqdCEdy4AIeHz86O+UqNj5Us
	dCLlqFtAPiJipE/R6BXowgsJ43TwyW6B9HnOzjhJoPHQ3g+7nRZOEiEFEHKlfhDG4ieXrMh0V64
	EjfOR1O4tJ7nHXuWNbknpzawpKeH6nJdYn2nUsapbmPPMXKNbgV1jsg==
X-Received: by 2002:a17:90b:2752:b0:39e:6c6a:209f with SMTP id 98e67ed59e1d1-3a098ac28demr2636479a91.64.1790269401279;
        Thu, 24 Sep 2026 10:03:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2752:b0:39e:6c6a:209f with SMTP id 98e67ed59e1d1-3a098ac28demr2636404a91.64.1790269400632;
        Thu, 24 Sep 2026 10:03:20 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972efa0bsm5582969a91.8.2026.09.24.10.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:03:19 -0700 (PDT)
Date: Thu, 24 Sep 2026 10:03:13 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
        sudeep.holla@arm.com
Subject: Re: [PATCH v19 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
Message-ID: <20260924100313.00003be7@oss.qualcomm.com>
In-Reply-To: <20260924135201.850038-4-suzuki.poulose@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
	<20260924135201.850038-4-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oKBXd244KSoQoi5QV9VXqzeNzKccUsEt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfXxlEeXFEbPQDB
 TeASD1XiJfmMFfHSBpfUSa/DfxTNw7RFAHv21BTinyjUSeZkgGZ+pWsnJZtFf5BR9ZGvU4EFnRr
 hIunu3MSYimf5ryGtXj0ciOpCaVlPJ9GEavbQhSd8CaZdeh4xRGZONXuEq5iATpVJ7FrLd0KasU
 eXnif2qwpemUbE+2UsCSbS2KQx0XGAmtgXvnPMqZqujpgWFRJNoHfEJq3v+EuXDMN53K2t6rw2s
 Ofk7m33zrjUm6htuZVXH8EMq2m0VvXnLeFXd/WvW7UaYDn9lDqhTduR6bTui1DLJQDLS7l+CGJb
 OgHcpKHQCSiINOzDuT7Ox+UIFKDVXzYirvbISLefsz+rY1J5fB5Vb1O1BTNov2gOXDWLipi/z5I
 APHNhBOt8+2ISEVwaPtsFxDDXRWZ6/6EC9vfL9krVymgqu/AUwlYqwIBmjSFGj6oPzW8fTmXxpv
 0NGnrkX2QmM2y5iOufA==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab557da cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=t3n5nvtZY-KuBPRqFMwA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: oKBXd244KSoQoi5QV9VXqzeNzKccUsEt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2OSBTYWx0ZWRfX1Bqzop4VWrTP
 U+j9LKSJw4Om6WKzjRoWXVVimLtFZ7MgFhSuT1yV1dDNM/SW+vwpGo0V9rk5WL3KSpzMxOcRhs1
 jTxeZLp2g1SJxHJf2hzooZWi8Z2UWVU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240069

On Thu, 24 Sep 2026 14:51:57 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> RMM v2.0 brings the ability to set the RMM's granule size. Check the
> feature registers and configure the RMM so that it matches the host's
> page size. This means that operations can be done with a granularity
> equal to PAGE_SIZE.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Hi Suzuki,

Some trivial stuff inline.  Assuming that is addressed.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/arm_rmm/rmi.c | 70 ++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> index 3baba931f92e4..c9ea964fd9081 100644
> --- a/drivers/firmware/arm_rmm/rmi.c
> +++ b/drivers/firmware/arm_rmm/rmi.c

> +
> +static int rmi_configure(void)
> +{
> +	unsigned long granule_feature;
> +	unsigned long granule_size;
> +	int ret = 0;

Value not used.  Fine if it is future churn reduction, but I didn't spot
where if so. I'm guessing left over from refactoring

> +
> +	switch (PAGE_SIZE) {
> +	case SZ_4K:
> +		granule_size = RMI_GRANULE_SIZE_4KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB;
> +		break;
> +	case SZ_16K:
> +		granule_size = RMI_GRANULE_SIZE_16KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB;
> +		break;
> +	case SZ_64K:
> +		granule_size = RMI_GRANULE_SIZE_64KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB;
> +		break;
> +	default:
> +		BUILD_BUG();
> +	}
> +
> +	if (!(rmi_feat_reg(1) & granule_feature)) {
> +		pr_err("RMM does not support %luKB granules\n",
> +		       PAGE_SIZE >> 10);
> +		return -ENXIO;
> +	}
> +
> +	struct rmm_config *config __free(free_page) =
> +		(struct rmm_config *)get_zeroed_page(GFP_KERNEL);
> +
> +	if (!config) {
> +		pr_err("Unable to allocate memory for RMM config\n");
> +		return -ENOMEM;
> +	}
> +
> +	config->rmi_granule_size = granule_size;
> +
> +	/*
> +	 * For now we set the tracking_region_size to 0 which is the only option
> +	 * for 4KB PAGE_SIZE (1GB for 4KB PAGE_SIZE, 32MB/512MB for 16KB/64KB).
> +	 * TODO: Support other tracking sizes via Kconfig option for other
> +	 * PAGE_SIZES
> +	 */
> +	config->tracking_region_size = 0;
> +
> +	ret = rmi_rmm_config_set(virt_to_phys(config));
> +	if (ret) {
> +		pr_err("RMM config set failed (%d)\n", ret);
> +		ret = -EINVAL;

		return -EINVAL;

> +	}
> +
> +	return ret;
	return 0;

So obvious this is the good path without anyone having to think about it!

I did quick check on whether this was to reduce churn due to later changes
but couldn't immediately spot anything


> +}

