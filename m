Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CA133993
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167045; cv=none; b=pJfpdQVL3owQ13hLOC9leg8Y5NXvngneVYsCylMd7xiN909KmhANRwl70Dp6Bv2x7c8qQ3Yu/XyfeZ30ayHrq8jjVtQIEncp8jTnrBKZGlgNEHyz4zixzWuWfl5GTpBcNJJhMntAiyAgCUnXxs6nSZCqwnL56LsoTrgtuAqX8K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167045; c=relaxed/simple;
	bh=nhMxFkLxRaTJDUd9WMMATj1Amgv+lZgu+O1MHSSEH0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u5EgiVz0vxyKccMiua7SlXlx5/169q1o7uwm+fy36ad56wQxdaqwaxKGUoizl2TAtYTRPhBYQ2Y6SYNq2L4FDnSncIR5O39IlKvLCL2meDcAL1a92LKLyWW+oDq5u94amGZeJAZMnveH3yOCYJLdmDhK0DW9MZUW/jskmiNio9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BihUFoAa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SmLfJkc1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BihUFoAa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SmLfJkc1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbU0v099072
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dN5STOycwDZQsA+VA3qrOiARb08xK8OPiXjHX+iil10=; b=BihUFoAaL40LBXB7
	iteojvCEH183wkeR7tkeGjNeHR2vjLKK/KA+QlsO6fwnFcc9V7E2etRY7gYKMLIS
	JhdScW5oTOboxbF/t2vF/3adSCyG66Gs9NWv1cXiuqEfmMu9M0AKDV3qi1MZYt1E
	U7v+lGqL5uCHc9xjV5v2R8O5zq5v+AugmxZMqFgfDMy3a0K8V82BuPwkjngznI8W
	i2wIC5HY8mW5khnbaYcUf/HTnoH7BmoKIzdGbs2BcOQrJ+jQWfZBGiHDtoOoWid1
	2czvR6vVvUmtMIZv+CaZPCPA+cxyts0f4SDIs607cBEZlUgNwH7hNeRvAuD6HtlK
	TGBRRg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c4c54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:37:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530db5af1dcso2849181cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790167041; x=1790771841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dN5STOycwDZQsA+VA3qrOiARb08xK8OPiXjHX+iil10=;
        b=SmLfJkc1K4b9D+lISACBptH3i+8A8mu3BRf3OK0df2Q3xmwf2bIz7SqMd2exlopw0m
         8ha9jEKgkk/yWt7Ixkj7jwDp2yvsP7ZaCT5vosW9rEZGsmdoYpM0tlc5TY6bV+9PULIi
         JPPnF6d3WTPLZnqI/htMzp6C7sF7fdxaTbJq0CspPWRWvasOfbumDo/NPeOpXYICYTbn
         rXHgah08FDOodI6sL+pNEi0ut5N6PXzztTpL5bFWEiHuVBOFSSdU/lou+Jze8mOq6ace
         HT0eY6wrk6q+5JXap/WjSVL/vY7e3X8Qop1vXyjBQx5xgy1245P4VxXUx0pu249Jmrru
         ZTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167041; x=1790771841;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dN5STOycwDZQsA+VA3qrOiARb08xK8OPiXjHX+iil10=;
        b=ApVTHRGKGdCl/XTJRGIi5yRR6G4JMi8njwl1ZHC5brFhcwPDZVGWIA4IZtLyBB8RzL
         kSjnib8xRAzCGvcTfFNzIiOw/QWReR1x7r8qT2XPtey7WcmRiAyxNzJfFQjfNeATPJM4
         zb6EwYT8byzbhQwjstesugy8eDUgnY/LN1qcGZHx0MPM5TR1qnHtfolli9lmritihSMu
         kGgN5F2iIjsyS3/X7zfOayUVCPSWDcgbyDkywfoj7mnZ9Xf70EL2eCH7p3nr2Ep0XmK4
         gemK3RnpmFzDRJDy+fBiWMhz8EhrTlUo8Fk1Q6fO6e17WidXFs/wyZMGMHBFrL65g/N+
         kt9w==
X-Forwarded-Encrypted: i=1; AKwUvBz8kMsAPmjwDMRxefdZVvbLog4dFSgu6hqVXvAg3jWBGLkwkBEbLVJzUeJsRlt6rxKNTEtMn9EWUc4RmPA=@vger.kernel.org
X-Gm-Message-State: AFuF++lyTahGg+p16HaBgoOyHxkB66A/CI6Rf2NLYWO+qS0vBN1yGiK7
	C91pnB3Cy9P6wShzyByhEjBIigKZZMtaGqtjiOuTB5zw/K3i9cn8EHVdD02LqTk14f8k/TF3bcD
	/Q8ZwBsaFdJFCV4Vd8F8kS+j3vAwzHiBFHr/RVOrKNSHWsLUJllLEufFaD16YVfnVkt0e09YwJU
	0=
X-Gm-Gg: AYBFou0b6CVlb+8W98f6E2YeyhNVi9vOvLI0/j/Jx7zFCTYwGpFTYL60kgUsMMFc5m7
	UUntvkUCv58QyzvfL15IWZzb70WdaxTbeIrYIC57epAOoqYHlj3sBMuRUa/6cPY3FzzXvLYfgww
	amevCZY60NWjBtJ6iWKlpZ0INe6do50x5D0Z6bimBho8W++UkPJCWMt2OkwkTy+gzXnaolitUND
	hB6S1mQM27PI2vq2nJiqHpelvD2PxOnvPLLTsTpOercg0IFSqblZYEWyz7YexgTCaKQorrZfiht
	swt1m6oAZ7WCluZdCVXW485zjm+IhRoR5SbZZPJUJHpxMQYbBglYx32tHAK5ix2zAiiGdhfsk3R
	o5LdoaxKnSbq2yL7bomYk7A==
X-Received: by 2002:a05:6214:226b:b0:90f:1a3b:b20b with SMTP id 6a1803df08f44-9140c43100fmr41177616d6.4.1790167041467;
        Wed, 23 Sep 2026 05:37:21 -0700 (PDT)
X-Received: by 2002:a05:6214:226b:b0:90f:1a3b:b20b with SMTP id 6a1803df08f44-9140c43100fmr41177266d6.4.1790167041091;
        Wed, 23 Sep 2026 05:37:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c6022sm108945066b.14.2026.09.23.05.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:37:20 -0700 (PDT)
Message-ID: <7a3d3902-c557-4058-b806-d24b3888ffa6@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:37:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add adreno SMMU nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260922111354.533902-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922111354.533902-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX1DEFXEwjeYba
 h9lHnFgMeim8F25WHBDl8V5NfSfUX90iJMUWSbzZowC+gzf7GvglPcH2BO4ZCFN4pM/4psmRoSv
 9GblHfB+b6LmMiu6zw/wsNYG0qg8KgYDXcVqgc/1ZHe/jBucDxRGe2XZLKWV5i0sg1LQRBpq62g
 Nwmku7ldHiR+iDCIaI4kmolzai/4Qf8CmsihebiFvE2OW4ZgjL0p5dDt2X/fX3hqk4zHhYc/71D
 /ac0ZzUB4YUTAJyOFgpSGR7EH4JQCDwp1VC01hEko9krblM5v4bpU1qGsO7DOCpLvzCRLrAuI7I
 zoG8XdDfCsdx8NST2sJS1Ehro/ZjtP4w+mciXNccLgaqKiPsA/GaNYv7rvDKLvPJ0bs+ZmSrQJJ
 gGzFKQjNM1uIJQ/uJVEo1rY7U9azoNOPItiuNmqQYQutYiHo4f5oBNy+i7EVcqpSNODIQAr8MDn
 SzpaE1ess12HXbqeRgA==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab3c802 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nfiylu75vt3-78dH0xMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: A9LEG_e2fe9Uf2x5t8_MCN75SuPooTlz
X-Proofpoint-GUID: A9LEG_e2fe9Uf2x5t8_MCN75SuPooTlz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX7PCHNX4xIF/w
 H9no5Cvme8Nsr/OyPWdfL2NJhMWBpYQqF1kwW6RTsxifi53vVZDmrJSH6BuZQtDVnuZeMSy7fkl
 PTjp8aBwfC8B9B76r9Z2RwPqGNw12Nc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230050

On 9/22/26 1:13 PM, Shawn Guo wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add the Adreno GPU SMMMUs (MMU-500) for both GPU instances.
> 
> Wire up the gpucc clock and power domain on both adreno SMMU nodes in
> nord-embedded.dtsi for embedded Nord variants where gpucc is available.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Dependencies:
> - SMMU binding: https://lore.kernel.org/all/20260902013858.130887-1-shengchao.guo@oss.qualcomm.com/
> 
>  arch/arm64/boot/dts/qcom/nord.dtsi | 74 ++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> index e0496fd40c30..6c53246d5ad0 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -1518,6 +1518,80 @@ tcsr: syscon@1f60000 {
>  			reg = <0x0 0x01f60000 0x0 0xa0000>;
>  		};
>  
> +		adreno_smmu_0: iommu@3da0000 {
> +			compatible = "qcom,nord-smmu-500",
> +				     "qcom,adreno-smmu",
> +				     "qcom,smmu-500",
> +				     "arm,mmu-500";
> +			reg = <0x0 0x03da0000 0x0 0x40000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,

674

[...]

> +		adreno_smmu_1: iommu@98a0000 {
> +			compatible = "qcom,nord-smmu-500",
> +				     "qcom,adreno-smmu",
> +				     "qcom,smmu-500",
> +				     "arm,mmu-500";
> +			reg = <0x0 0x098a0000 0x0 0x40000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			interrupts = <GIC_SPI 932 IRQ_TYPE_LEVEL_HIGH>,

this one is correct

with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
