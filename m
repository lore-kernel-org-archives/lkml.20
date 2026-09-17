Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C7E4AA1C0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789641576; cv=none; b=TKAuXKwbA64cTkwRJAy8CMO6YJam0h0nGUqCbgF2uRo1Ci8k9fhJEHnMqCrH7y8YlWNfON+xOtXU/ZTx/7AyyYXlpg2PHYeg7jb6IVmOVHNmswssQXm+niu1fb0zQcPYh9cXvzESH6DjZIhGIYJ2ogdxkhJd3ZVIfFW6tpEUF98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789641576; c=relaxed/simple;
	bh=ofwXWJWBXMr3tmKuOZyLyGNqmZJNvgOJaDeOa13forM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sn2PE6mvgmcRqhONfIc8v53P81ne9WMSo5vcusIhh8HwKdsOo0sqmEquPB38v4og1gbOK6CYiqT+IcLTz67u1Ctnm7tEw048+9jV0k3lp3s1gN3PQ8TYjVhpcWZGH6VIGrQV3ohoF/wCLJ0oLWH+1P1zFVKXpI5CH85/rp5k7vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/z+JypH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RU6nw+yN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/z+JypH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RU6nw+yN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zu9j1390210
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9OY8rG8gt4nvi+fBrJ5jn/PKlAD8DibY7OqcJSVZtU=; b=F/z+JypHZbiBUNH+
	7xM5PWPBSNeUAKSretbcx6AcqbWQfotx//f+rJTQThwcVzOROL7HKJ/Wy+MmRWhO
	VfdnEF0aJKtht5sVY4oaV5DFdM3a7oRNR4xo7QCdmIbR4yK+UvtOlAsl2k5oJWW4
	ZGcQFuvcB+6QxLs+CicYNen3c3ikU9r35hDjCJbEms5BAK49Zlipb30JkUTsUF1K
	57PVbZx7btPTepeoytCqI3Wy+9QmDnyu2EXIrxDfkRrnegA9GruiYh3nnN074Em3
	0TszsOAo5fcAw/MG0mhuBjILWs7L4b3Kqp9kZ3lDHAYk8phdyU8UrpL6F/BUGVex
	3da00Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d3xx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:39:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so985247a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789641564; x=1790246364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9OY8rG8gt4nvi+fBrJ5jn/PKlAD8DibY7OqcJSVZtU=;
        b=RU6nw+yNFNCEYO5H7dBdN0299ZEpy2CymJpp0wV+pOzGAZUNZI9UheJTLLShDL9325
         d/GeNoiWpnysitRELxiKXeNPYSkF2zSfv3gOBBvqdnQJiI45h1jyF/C3TLgT8eMteHOT
         t3R+TqsykHCRjP4x/uyZdYICasUDXJNetYPlOwbz1D0hG0T45oAZEuXgmyRdow9+HLtm
         Pu8AwSFJ6DWMtw8GJQFO3JgsE+vQQDljIvs2JEccx+OnSJNm68Ktl+zAsAm4nJS8URiR
         sLUFHMjn6c00bjPFPHYc+UEHP/nDeWj2QsyqdDHONB9v6ObjM38isrWOnHd1ZPahr8Za
         WefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789641564; x=1790246364;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9OY8rG8gt4nvi+fBrJ5jn/PKlAD8DibY7OqcJSVZtU=;
        b=0thcfeeuIwlBvMgyFGxJ5lRlSbqa19KVXgfZFeKMm9yw3iVTLGKS5yxjEc6H9o3wBf
         wvUx/FlUOXJIG+pI/Dl8wZNz6UL6CkC9lvoL83+Oa7zJ8AufUAJHxV2pm4iQ+dNhM8pz
         19jjjRZbqXa80lpMCrxIAp37QdCMZMEM6IeMy1en6+yuXuKs8vlJszodySZEiDJVq6Kq
         A3N0rgQMPSuWnzYUWyPuBLlizg9r7I6qwm7qBAsbdv4CzONF7f5ZZp0yka1DgqKBNDL3
         axTOaF/DpLaIMUNn9/5W9a5gNnwIR6tBMyar+Yonx7yBZB1NlEYCONHGq4thm6ANkz2n
         T/ww==
X-Forwarded-Encrypted: i=1; AKwUvBxemjU0HFgEvx67N0XKES4u5t6Tvi0mVvPNY4auO6FdIsd7jvZAlwsIFlxr5fjyhEnS9/vT3eGqXcGDTWI=@vger.kernel.org
X-Gm-Message-State: AFuF++munqqG8NIlESaXo3P/sR6uhlMzs+qyRx4fZrqlmisW8xjOmWPl
	XiaZEh7cxjAn7dvYA2smc2Z8YyHW2SYjlIneqSaTB2PfSsklwoA3GEXAyuH0b3YvJKqsIKk7kd0
	JUA2qPFIPmBQGQCdJ8RhL5J56cJRcBWCbJMVV2/Ls0yfyxc/oBsL1cCT4EQarvL5YDHE=
X-Gm-Gg: AYBFou0bH2gXMKwIvZIXPt0sbNJTxzcMmrOu4w554WspTzBqGza7in6+kgVz9LzbTnG
	4omIr/1HFBqvXJwtQs+kBWBNhE8/q6kEdnjX3twzJ4HD/tZKNIlBjMH3u9OnWcLlizdiq/QDsYN
	EWnvMAaDhg/L+se+u0gOh2VEA8gGh+44Ds7Z/4N1ApoWSrpssG4MxEquBDlHFQdWk+SM/TDwJEi
	EBVYY5xtqDvkhHOqPQToLj17XZH+cIizEQPmTXh82S0CIm4Ieqiml0hWJqq/nYSk38yVAUz5i7z
	1yZrfMfhkLQerzlysEqfv6kKaAu28k6bX35dYuEN8Rsdtz43xDiK2AXgqhQLWB7NvJZWtq3XtTs
	N7NbibRhQBr0jHfuFvM5xlk76weDz4IT8hxg=
X-Received: by 2002:a17:90b:4c88:b0:39d:fd82:de0c with SMTP id 98e67ed59e1d1-39e1e278ae9mr13850776a91.2.1789641563781;
        Thu, 17 Sep 2026 03:39:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4c88:b0:39d:fd82:de0c with SMTP id 98e67ed59e1d1-39e1e278ae9mr13850676a91.2.1789641563112;
        Thu, 17 Sep 2026 03:39:23 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.137.165])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm11898175c88.9.2026.09.17.03.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 03:39:22 -0700 (PDT)
Message-ID: <1e68976b-67a0-45f4-a846-0b07964e6434@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 16:09:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] media: qcom: Add support for the iris codec on
 shikra
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uzs-2lsm66WIOnDL4Smy4ktIH6MknhYG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE0NyBTYWx0ZWRfXzxHnaR+3akp/
 RXo1/hL5vvjMta65bcy+YSL/wABEYxpVmTonei/Jo+x81CFelM0hhL6bxm0tiaeG6dfJ7fEE3Fd
 EexIQg8enyej/gFpxCF2GjCNszcg22k=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aabc35c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=/MhRiX8TZM4BB34AAREmLw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Q6wxVgh2rZIxxIaB2AUA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: uzs-2lsm66WIOnDL4Smy4ktIH6MknhYG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE0NyBTYWx0ZWRfXzF3z2XL+2msw
 4zccckbS5XG4Pfspdb9NA76NnLo4B6DNz3IN1tGintW1ukJELefE0/vIOIZY8fAZNnNI8Xvu89v
 JtyGDL7g/pUm1phjhD9ufDPfvsWycDFrq6ij+GOf9J95vzDpLbRF8IzGKx23kWqjFES5BUR1cDS
 UjX7bzGECTGalo1UgViA2lLhx8xtl370DNZkw4ln1i4LtFlQwTGKnkc2lqtaoUdpunKgBVpBV/d
 v+CF8dBylWVvKMWZooKC1m5PiOzTM3vgsovunFIR25BbWmzwJiTmUeWGv3iUG8D1+/2wS5DrxVU
 70opjhzG0PX8kVrtEKyto92sEsWHgovyy34aI7u8FUtGVfr6mi4YvhvOc6q1ABM7KDNCktAMcvV
 o5iDgUfeEO0XxM80HCqMKmQ1+XptaMWPioxhnmnhV3QlVXPp9d32MFI1n88ElWnjzZyPimJOnRz
 oZsL5cZJ0DzpUpwWRXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170147


On 7/22/2026 7:11 PM, Vikash Garodia wrote:
> Vikash Garodia (4):
>        dt-bindings: media: qcom,venus-common: Add IOMMU IOVA reservation region
>        dt-bindings: media: qcom,qcm2290-venus: document shikra venus compatible
>        arm64: dts: qcom: shikra: Add Iris video codec node
>        arm64: dts: qcom: shikra-evk: Enable Iris core
> 
>   .../bindings/media/qcom,qcm2290-venus.yaml         | 26 +++++---
>   .../bindings/media/qcom,venus-common.yaml          |  5 +-
>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi           |  6 ++
>   arch/arm64/boot/dts/qcom/shikra.dtsi               | 71 ++++++++++++++++++++++
>   4 files changed, 100 insertions(+), 8 deletions(-)

Hello Bryan,
Could you please update when we can expect the binding patch to be applied ?

#1 patch in this series can be dropped once you apply the 600MB iova fix 
in iris/venus driver.

Once the #2 binding is applied, i will reach out to DT maintainers to 
apply the DTS.

Regards,
Vikash
