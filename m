Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1157F535FC3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174653; cv=none; b=QQZKfJLhLZlby08F6yqN5Hqqg5w5u4VDg+McAl9vL3AN1tBxnt0mh833jadLTgDExXo2sa/+24MnmeUlEE2G+5H0vIw5KT/eQC/cdVcQfqaTFuimrKE3mfconV5q6OGEHxZ9FYewES8T6+EvPV1y3bOWigSySeT7dYGJMIP2/ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174653; c=relaxed/simple;
	bh=T0AABt33CYW34VQbpJtUXdCWr7yi6lEHm/bFAU4TMOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3SNDVqkURPKBnAHhjl+VX58O5NPXfc5O0vH6GsB8bNuu79H7HenmpobSbkgAgJFS8K6OIPg6h1V64S/vdNYbbkXH3zm9dCQpc78iKzusE8gMfR+UBQFDPaA+mTUj+q2v2Sk/3bwIjsyzzlff2K5wEUhPZD639X/EElC5+g73v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igjeEXj0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yd73gZlT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igjeEXj0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yd73gZlT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKs3j2056327
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7oNpOO3lBHD3Lw06XNfDeyesoHD/ioJv1keycQQjI5M=; b=igjeEXj0rpJeR6bO
	Z/+mUdpOYJ2wtX9mdo1x+FasmFa7THP9mj9mHXLrRoXMj8uphYIYu4R22RmW8BdD
	Xdeosr+ppFZe5pfcWd5jo7lowwD5p2RK3w6Nd23FC3QrA2u3TyTgpyi6j8L5qUFd
	TXKQ+ZXAlTJT8jGI0NRqhoggQynOQAH84Eatf3uydRh4pjQtB1G/73Wysx6De5e/
	16SDr7n9Jwk/feBp24WJIF9pJLfziAdUNl419GVV0z4lzNpaN0VqYB18xEF26Q1v
	PF5WBtYjzB/HlpX3p0C0SUjONDkKHf2szp2x+LNp53DJxBHRFSPxx/xAWRJ9JLrV
	Rv6usg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv0cg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:44:09 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78a58df134aso290747137.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790174648; x=1790779448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7oNpOO3lBHD3Lw06XNfDeyesoHD/ioJv1keycQQjI5M=;
        b=Yd73gZlTcH2chtnaTiwJHBSQbanrdekSTUFu+pZI986tgIngQUHVUWqa2ugoGIWpx8
         vUasFxvc6kkbTznWwxkgNQvidHm3VhjXmi+eXHwqnutyXOoL8oJiBtkrxIb+af1Hbjdx
         STIqRSCo9p08HefO+B8+b6CpOXJGUABb+njxnVaDULqW72e9U+c9zT42wxlSxQahL/EZ
         vAfC6UMGeUYp49KkW2fdFaX0bAufAuJ00uz7dR9yShLHPa7rRrI0x8fQjRsKHR2syUrT
         +e/QSpKhd2OcbcRMy9XLafMcHK7sl2GYt78TJCflJ4n65VOColNuF3BB/cFhmS61dczW
         4H/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174648; x=1790779448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7oNpOO3lBHD3Lw06XNfDeyesoHD/ioJv1keycQQjI5M=;
        b=Hcikc1oZ/ncr8TB0UHVavRO3BQflQse2NpezzgEaLd1LL2j1lYMG42rwgADrR6ZXXS
         Z5EHUrVroFB8t7Ejf8tT1vbPgN9XowiPSDm0YG4Zc35S6bHkLLWWSWUHsTpHrEngnlzK
         zmx6+zQdLysVik554vZFO+K9iIbAMAf7TbMWEKQjR17b5EggSnV1y8OfXLTH3XCl9hy0
         lt3pgOyCPcdLCb9pU3VnURHFvSHrg+N3qqJO+PWukvNrlwtZy7YOF1CDO1/VoNA2klUw
         gJqVIzaAZntciao4SvXN6GtPLLrILTR8OI9OAoifH/zvIF+nykKMJLGbdP87yPTC+nTx
         RiBg==
X-Forwarded-Encrypted: i=1; AKwUvBzzHBXXfTadEPHtRvUgF+jqAxa6wh0tOaYVMyLNGpwGZBnHNZm39Wr1n3gg/wXT/gN2pjwOeOGb2wt1KcQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n+nmIuqxZbsDdJMNtC7oiX7F4iMefHTNJ/Fj+1mYc5jQmHXZlQ
	/sGfqklVewfgd2FEsuvK9Wto+zokwk+KJHwVqNENUNheWodS4qCcIonAFUpgPpmF0QulQGFd4ro
	0A7ybD5IH5YpFrFRwLdcS8wXSaffb0Zd2zULGbnxset7VcSKvrx5e8ZBm8oQF9gjJ5T8=
X-Gm-Gg: AYBFou0p1G3NcrOcosxzghDY7qzU+b1szHKkPH1UZk+N4oDBDYdSLh7zL7UnFx8MniV
	HanXTK51JjIiAciE1+CcUmPPNkfB1TqE4N57otEuyNNrky7UOIxQ/w4RxQxHlZS7OaWEcr1GaEQ
	2j4RoQ0xIDRHQ1BmHIk5oODD2XNofSjkYLXCeYAA+zl6NPMrwcs69SdzVwu5p2tbnG5VvtnHHmN
	4CGhJQYYepJoOmDOIxNcuaSUkGhfzydVJCxurnEOK4qA3KgVEAykwvIjDRr1Z0/yjXFtzXPyXOo
	UdnUFn9gJHjjWQumCK8bAL7+WjvaFqbj5/MGKOTM9b0Mr/Khkup3+JMJZhOA2aU4w95pIJt5BJ5
	H1XGZsftOJu1QOxWUswU8bH89jyky6hoSyl+Um/B2gm0urDA4WyY2BtSf/cNUTw==
X-Received: by 2002:a05:6102:50a5:b0:7a1:f7d2:e80f with SMTP id ada2fe7eead31-7ac1ceb5c51mr2175730137.23.1790174648079;
        Wed, 23 Sep 2026 07:44:08 -0700 (PDT)
X-Received: by 2002:a05:6102:50a5:b0:7a1:f7d2:e80f with SMTP id ada2fe7eead31-7ac1ceb5c51mr2175702137.23.1790174647570;
        Wed, 23 Sep 2026 07:44:07 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a913:ba43:96d7:743c? ([2a05:6e02:1041:c10:a913:ba43:96d7:743c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868486461sm7314339f8f.8.2026.09.23.07.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:44:06 -0700 (PDT)
Message-ID: <e39fbe69-e539-4268-b9f2-4f25a2d51ce3@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:44:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Add Qualcomm SPEL powercap driver
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfXxu6M6clqB2n6
 3MHM/Px/XQLQg6Svn1x9jy3fHrUBp/Sk8jRptUKqAG91jML/j9s7v7Z5iVBT62hspyAFWUYx53x
 XHE15k5DRjHfkLx/Z6J+kKGmP2nwxmXpsU2UVVFMxGBFrGga8gfUZYupHSzzn5dLaaE+NT6OUGx
 68c6CDeLUKBTuMTqc6NgKOJtSUR/8ZgTP7A4CabyYXurCFn0WVv+WWvY5R+spHSSqzobsvlbT4o
 Y/bkAQh8HKk7BKJKUeHdUNHPUv35Gq72vCMB4DsEVB0CUDYLE0aiI5CmzGzEKegfy25tabWkIjt
 NvmPr+4ddEYF8Emvn+QPVBmMm/OTbCFX+q/OikVrSiQqqAQd/WTWI0Xvm8ZCzgdrCsSAs/Qy37k
 9P9sGWX8BzRbanrl9Tkxm5rD8KsgisKYhxQPS8lTRqx+lpFTY+Yz/vY2edKUedaZeD1fzPkTLWp
 xi27X0v/KMxsku4Wb4Q==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab3e5b9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6G08FbKcmm3nPJiwURwA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: M0sip3C-XiCRPMsEu_HLGz1dXY9sOBPf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfX2k+YXbH9CnHq
 bpKNvvleXSimWnNJsHPhG6B6OT+5+7yFOabCcEw+gi7J3D/TENAE58Ye64EQ23xwimMvMla0rss
 MOkjdI92dm9eD+nvb4jtP//EJPg4CsU=
X-Proofpoint-ORIG-GUID: M0sip3C-XiCRPMsEu_HLGz1dXY9sOBPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230058


Hi Rafael,

More qcom powercap drivers will come in the future. After discussing 
internally we agreed I can maintain them, if you are ok with that.

I'm wondering if it would make sense to create a qcom directory under 
powercap in order to group those drivers under the same maintainer 
umbrella (and perhaps do the same grouping for other drivers?)


On 7/2/26 19:22, Manaf Meethalavalappu Pallikunhi wrote:
> This patch series introduces support for Qualcomm's SPEL (SoC Power
> and Electrical Limits) hardware, which provides power monitoring and
> limiting capabilities for various power domains in Qualcomm SoCs.
> 
> The SPEL hardware enables:
> - Real-time energy consumption monitoring across multiple power domains
> - Hardware-enforced power limits with configurable time windows
> - Support for up to 4 power limits (PL1-PL4) per domain
> - Hierarchical power domain organization (SYS -> SOC -> subsystems)
> 
> The driver integrates with the Linux powercap framework, exposing SPEL
> capabilities through standard sysfs interfaces. This allows userspace
> applications and thermal management daemons to monitor energy consumption
> and configure power limits for optimal power/performance balance.
> 
> This series introduces a new power/limits directory for power limit
> controller bindings. The power-limit-controller.yaml schema is added to
> MAINTAINERS under "QUALCOMM SPEL POWERCAP DRIVER" in patch 2/X alongside
> the SPEL device specific binding, as this is its primary use case.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
> Changes in v3:
> - Created common power-limit-controller schema under power/limits and described
>    power-limit-controller device common capabilities.(Krzysztof)
> - Created SoC-specific qcom,glymur-spel.yaml file instead of generic one and updated
>    description and commit.(Krzysztof)
> - Used FIELD_MODIFY() macro at different places.(Konrad)
> - Updated glymur specific domain info table.(Konrad)
> - Updated all for-loops iterator declaration to C99 style.(Konrad)
> - Fixed use-after-free bugs.(Sashiko)
> - Corrected time_unit documention to reflect the logic.(Sashiko)
> - Link to v2: https://lore.kernel.org/r/20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com
> 
> Changes in v2:
> - Fixed DT issues: corrected unit-address mismatch and made compatible
>    platform-specific.(Konrad/Krzysztof)
> - Cleaned up bitfield handling: switched to GENMASK, FIELD_* macros.(Konrad)
> - Converted hex values to lowercase and simplified array definitions.(Konrad)
> - used devm_platform_ioremap_resource_byname().(Konrad)
> - Refactored data structures: merged domain data into spel_domain_info
>    and removed hardcoded limits using ARRAY_SIZE().(Daniel)
> - Added bounds checks (TIME_WINDOW_MAX) and fixed time window RMW
>    handling (preserving reserved bits + firmware notify).(Sashiko)
> - Resolved use-after-free, replaced allocation strategy, and
>    added proper cleanup in .release().(Sashiko)
> - Updated time window calculation logic.
> - Removed cyclic dependency, improved validation logic, and aligned
>    naming consistency.(Daniel)
> - Link to v1: https://lore.kernel.org/r/20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com
> 
> ---
> Manaf Meethalavalappu Pallikunhi (4):
>        dt-bindings: power: Add common power limit controller schema
>        dt-bindings: power: limits: Describe Qualcomm SPEL hardware
>        powercap: qcom: Add SPEL powercap driver
>        arm64: dts: qcom: glymur: Enable SPEL powercap driver
> 
>   .../power/limits/power-limit-controller.yaml       |  34 +
>   .../bindings/power/limits/qcom,glymur-spel.yaml    |  61 ++
>   MAINTAINERS                                        |   8 +
>   arch/arm64/boot/dts/qcom/glymur.dtsi               |  10 +
>   drivers/powercap/Kconfig                           |  13 +
>   drivers/powercap/Makefile                          |   1 +
>   drivers/powercap/qcom_spel.c                       | 803 +++++++++++++++++++++
>   7 files changed, 930 insertions(+)
> ---
> base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
> change-id: 20260702-qcom_spel_driver_upstream-909d37c8d8e8
> 
> Best regards,

