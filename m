Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E604CCDFF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769761; cv=none; b=o+wjEuby1XK5iYOe8zJRVX5ltjut1ckS4R922ORJ8KjoU/Vy67DSEiisZeN779guVxpOGN2EuSI9w4xt/YX3L4JnJ7cnb/uXHHiyd+qh/CgYI8NsM3FWBlg10zQC/mbLhPyTKiL0LYBkJa3hW2A+wIIXEfvy6DsKFbIY5n7SCF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769761; c=relaxed/simple;
	bh=WbeuGSintsEDrEtjATq9sCPnSgowCN7ABUs20ou/YrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PE4mu0ilNiNn2OcTSbwq1weESBOMr3vrtOdp8JDcdgmKmkQrda4B+mKbufAgla91aQz5e5sptp1YPwF9Ak39J8Lr8HoIRcByMNBSnPF6jexlOkqxjFIvPG7T3GM4ZdJ/JnAq9ctRzJTfEy7uCvF2O5WLvKxDCX091MQrUpg2tDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpRrXG+P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtdvTKLN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpRrXG+P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtdvTKLN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7Zd73547207
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X91DOgHPekg2+dX/FkyABqyHuRohIOR0R97sk1R/5C4=; b=GpRrXG+P8Hm9NOvp
	YYACYhUM/ZuMqav6YSCx6Lq5r7C05voBGz+caLBBNWsYNtD0PV+zE3NVzCl0KOuc
	7qKW87vKy8vEValbeOU+LaYv2sISkzfiBmlpnKFUO/OnUNtvTh+/Hy8b8MwLmoxn
	Tn9GEAuMlfCYrVljn/FE6sEyzuTWPx+JuHh2hh8RqSSNvO3VaUqCleBu3s4EQPFX
	ou1Y/h7BoG08s+hY4QWjBan9wvnrfvmXQkAJFZ0Scwhwe2W0QvMdlPvo+yfAwqAu
	MFbYYiJi/JISbWJmwip7BgfGhBmckUSrwvgFqxdelXqPANOMO+4UnxzpzptH5rzh
	jgRZNw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w141efr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:02:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so7469103a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790769758; x=1791374558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X91DOgHPekg2+dX/FkyABqyHuRohIOR0R97sk1R/5C4=;
        b=NtdvTKLNK6HMAP2+LXQx+5mJgnDGtaLiPFuBKfX6J7zdOzPqO/cLmpkfmD4tLN1//b
         lRHVk2jfDazL0m7ZMWH91wzjXU4u5G1uhdyDCZJ9V8QUfw3ln+oxhXhbpv4+UCOMZRPR
         /VIRzKqnF4Y9cFMNrLVOCZVJeqe6DKwKF8dup63PA3ps00GOA/szmWD7me1rolg98W68
         zYAPmJoxUfXhkgpwCsfR2nnL/t6T6EUdAQzeMPiO3vi/jolod1/JS9tlk4YlLilEoB4f
         GrSHfc9bgxAMfYAzb0MScco6yAueAwgHbuSxujkgDLyWloZphzXTTScjN3e/HGxtXmne
         C7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769758; x=1791374558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X91DOgHPekg2+dX/FkyABqyHuRohIOR0R97sk1R/5C4=;
        b=v+DeX3kwhhQRpjeS4eMGpNvt9MIb7Nw+kkMqW2bQdv629h42xxPho9KGNQfRppYa4z
         SfuImzwIUx4b+JMxsowX2hp+tJi0Jwf4O8fcZClsC2hriF38UKFZgUaCfYSyZw96XnoD
         AVZs9JVImThTJF4nSIhBuIz0MEMTE9dl7GUu5DsketuwPmS9JRi3XMOQ0LXWA7yCKkFj
         qDgIe75NrAfKMck+BDcIgtz6/TKweZKWqinSVSHLmWX2PDmj5UYedBrJNTYRLLBqIy88
         hEhecwH7y2iUjlG+5vLFQiICAbhzlC5fEBbMbPKoT5j6Ar6Uqf01SMvQyVDo/quXz60X
         Ln2Q==
X-Forwarded-Encrypted: i=1; AKwUvBy5lOXD1PA56pyH8XsdwodbjdkWymtCoMRO6uVX2LFM+NeEt/+a9F6SKNt6ojWrOB3My7W62W0bnuo1gks=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlbVYxZLyUVWC0QuDRcGS3n4aeYhqyV/gT/VDrgM+FraTjJVct
	mqqj4xiP+m4NEYX/LmN/AYhCU4zgZPPZrt+k8V0o97nHxhOg235qU7hgzP6iJM5QEQIEFds8ISu
	ZSNDfBfa883l0aCxZF78fyp25PKg3uyb8yHR/yXcHxIH8dZ3Df3GzGmkhvkZLxm94J7o=
X-Gm-Gg: AYBFou3e0/gyD4d6VC2usxREEPqbTQN5jUrVbQtBSuWcfWov4nP8YXX9KbxCI4XLN/z
	JuahVy3kSl1pt0euktDPsI9IgvH9t+p3ogbV9tNcVxYHI5II2xN0wGPVcggJvKiHdVYwiqs701+
	Yc0pLleg+H9lYYx8exEIqxFCtgY/xJrJT5E/8it1WyqFw7PoPaXMm/U4tMV2aF/0+7TAYUG2zpl
	FKdSNA/E+LWeWhMGge45IeP46b98h48NMWSr95PQJ7HuXsML4vXhRfE79SD0pg9kEFgaZSPBxCi
	0nLiRSxkD+Iguqdh0wngnhjnhmC2eGteT8TKDJCnAtePpygxPfAvNQI5sI9dxScQAEpg0jMmL7E
	l5lmjwpE6WLbJz9KREMMEYaveNTYHvObBFmlNxw==
X-Received: by 2002:a17:90b:4b8c:b0:3a0:d5a9:d15 with SMTP id 98e67ed59e1d1-3a4d192a4a4mr1144482a91.57.1790769757994;
        Wed, 30 Sep 2026 05:02:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4b8c:b0:3a0:d5a9:d15 with SMTP id 98e67ed59e1d1-3a4d192a4a4mr1144429a91.57.1790769757265;
        Wed, 30 Sep 2026 05:02:37 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce15ddd6sm3277420a91.7.2026.09.30.05.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 05:02:36 -0700 (PDT)
Message-ID: <bc63e435-859c-4e00-bdbc-131908852a8b@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 17:32:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc
 SMMU mappings
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
References: <20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX1tJRRXTS6qSw
 1tdFNeoFvA2C97tXVrBLAIe8kISanHsMrbhJ4bT8lPkd2m7NrZldTO22J2Z4pqKzCQLRbDCSW16
 ru7OxFbggzWZlW+BenimuEIE71PbQDI=
X-Proofpoint-GUID: V1PEOypnIeTR4dnNe9DqQTyfDTiW56zd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX9YNF8F6flo2e
 tzR0g/fVqYStY0v/PV4cv99H9k9fvo20wpLQblYFN2mzDG+xBe/Y4v+Et5bVGgnpkpO0c5yoV0n
 MaiXm23xnj/MhBd2IAOxNh+q9E5MHIwXTrz2xgEq/xZhrQy0uqa5Z+HXDW/QOxGvWS7GuJ2O3b2
 8MklwZxPpKsJ0FpytQXpuwXWwTxgWj2nf4WRoOIhNs7xSjXLTls+HZ18zm76PGc55vStgy5mUex
 bynR2mGDT4WFwG+wIbdsM1qxxcKwB/CLyY/Jt4rw7GtzUHUj/xddZ7gbKkXKJW7kj+Yu9sUqit3
 biPFBMFAEJcC5SC2YLyczvYnMOycDnz3lgxLOCwG9Pdq89jEkpU/Bi60g5QFuM6iEoUyQNjrrja
 k3Gza+svCA36e3N07FIPNs0tKB4YbF7a+k3Vb+Dk9xqqxLZ4B7f4cOGw4WB55RWIFjfpcUROY8Q
 u1wC+xnqZdjw/UVsy0Q==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abcfa5e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vgmkJc1NjztBKi0f-cAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: V1PEOypnIeTR4dnNe9DqQTyfDTiW56zd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300047

On 9/18/2026 6:04 PM, Komal Bajaj wrote:
> Shikra boards currently boot Linux under a hypervisor, where the
> remote processor firmware IOMMU streams are managed by the hypervisor.
> When booting Linux directly at EL2 without the hypervisor, the IOMMU
> is instead managed by the consumer of this DeviceTree, so the firmware
> streams for each remote processor need to be described explicitly.
>
> Add an EL2-specific DT overlay and apply it to all Shikra EVK variants
> devices to produce an -el2.dtb alongside the "normal" dtb.
>
> Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
> All existing Shikra EVK board variants boot Linux under a hypervisor,
> which means Linux typically runs at EL1. For EL2 boot without the
> hypervisor, remote processor firmware IOMMU streams must be described in
> the DeviceTree consumed by Linux.
>
> Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
> produce -el2.dtb artifacts for the Shikra EVK variants alongside the
> regular dtbs.
>
> Komal Bajaj (1):
>    arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings
>
>   arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++++++
>   arch/arm64/boot/dts/qcom/shikra-el2.dtso | 23 +++++++++++++++++++++++
>   2 files changed, 35 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/shikra-el2.dtso
> ---
>   arch/arm64/boot/dts/qcom/Makefile        | 12 ++++++++++++
>   arch/arm64/boot/dts/qcom/shikra-el2.dtso | 23 +++++++++++++++++++++++
>   2 files changed, 35 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 5c19f945c785..686d37cab02f 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -359,8 +359,20 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
> +
> +shikra-cqm-evk-el2-dtbs	:= shikra-cqm-evk.dtb shikra-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-el2.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
> +
> +shikra-cqs-evk-el2-dtbs	:= shikra-cqs-evk.dtb shikra-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-el2.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
> +
> +shikra-iqs-evk-el2-dtbs	:= shikra-iqs-evk.dtb shikra-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-el2.dtb
> +
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
> new file mode 100644
> index 000000000000..d2f3186bd47d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Shikra specific modifications required to boot in EL2.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&gpu_zap_shader {
> +	status = "disabled";
> +};
> +
> +&remoteproc_cdsp {
> +	iommus = <&apps_smmu 0x0200 0x0>;
> +};
> +
> +&remoteproc_lpaicp {
> +	iommus = <&apps_smmu 0x0360 0x0005>,
> +		 <&apps_smmu 0x0366 0x0000>,
> +		 <&apps_smmu 0x00e7 0x0000>;
> +};

Please ignore this patch. With this change, DT schema validation error 
is being reported:

   from schema $id: 
http://devicetree.org/schemas/remoteproc/qcom,shikra-pas.yaml
   arch/arm64/boot/dts/qcom/shikra-cqs-evk-el2.dtb:
   remoteproc@b800000 (qcom,shikra-lpaicp-pas): iommus: [[41, 864, 5], 
[41, 870, 0], [41, 231, 0]] is too long

I have posted a v2 [1] of the patch series to address DT schema 
validation warning.

[1] 
https://lore.kernel.org/all/20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com/

Thanks
Komal

>
> ---
> base-commit: e657a464aba873f5eaf3ca821b6e4016674492d6
> change-id: 20260918-shikra-el2-ea8969385c3c
>
> Best regards,

