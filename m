Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473C4253340
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876482; cv=none; b=Zd+9yl+ilM1odmHO9qJOVvV1FgwjGudneReaMJgGKpJJE5tVcIWBB/TrG605+eZGUd/KVV4LzN/w9QmpAR+6OR+DuA2R2ghU9AFKoDQ6UupUh3i55srw6VbNhl9JmCuFL8316vZv+hvIEObnYnGrX4p7jvxbOEMzC1memYnyBm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876482; c=relaxed/simple;
	bh=1bvEIBQRw9p/Jan1rJdJmHDony/sK3GAuFwWmbv5cOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+oSecu9f5Kq4AlLKjca8pzyb9zuRP5CH3EK/lkYz5PWouooPS+9B6TMrk+ixY2njNrFt3+qpt2ydiI/UknjTubPSQ0g8F2fOo4rmQtK7lQE31ZNgnNijRdMl4B0H1YKvqEdqhdct0kUWgb5Kj+oj2qfZA9nUzkkgyLC7XTljvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iK/0uU02; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YitffppP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iK/0uU02";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YitffppP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20mwP302832
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sBp+f/Ur6Ycrj7MIgsCDYKBLKqGLNILm8MYQVnEiwoE=; b=iK/0uU02XeC1OWps
	LZBkoU4LxoC+9/ctBKKKD8EEQ4HRqofo7mF13YYnXgq54APwA7ruFB4H3M+cOSdX
	oUMw3LGCqGk+Y3WBksOxcgBe+Dyl+tEedzaFU1q1lyGB+dsgYJGKi/J3ZWVB/zgF
	xo3peLqWwwNq1DmeClvMfdK4Vt0G0NvGXCUI+ki5clXsuLhv/vylBmmmiG7/r1A0
	sKKiwvSK76nFPX+4fGTBNXdVolAiKOYUuUDUZXGQHuyOI38FvXoGGrOU793YAIwa
	tBh7vIGi4dLgjv7K8iZSWOlilETNwDPGSpNd6nvLt+UmeUM0OMt3QADY8I1Gz8Cy
	sTBnDQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sq9kyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:28:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so2317112a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791876479; x=1792481279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBp+f/Ur6Ycrj7MIgsCDYKBLKqGLNILm8MYQVnEiwoE=;
        b=YitffppPZAHTkvX3vKICiubBlMKVFA12+HrB4Pe8gth2U4t7H7FLTzXT9OOEyeCq9H
         +mhxj8uvkN+UtzoNvvjRknS6vE/Ve6L6sFbEZW3vM/2CY5nVvePXnnJeyohcK3tXvYXo
         IfSnN1XTvN1HRM7NQWQjQ4Om59HGp78MDwFXYvYpm10BvztnXU02pn33d7RTYacs3CNt
         XIpfWTnpZGimT40G1cHbLj4+yOhdekfqLpj9tn1yRr89w7TaekBZbV7crAThGeIxfXlE
         GoOkDjbL+fCdEBuJCZuzFL4Jy2MiidzG1YzzYC+qv6Ikqk3nHTHL6nJWpbOqu12LCpUT
         n3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876479; x=1792481279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBp+f/Ur6Ycrj7MIgsCDYKBLKqGLNILm8MYQVnEiwoE=;
        b=eOfzCorcxdrzncknyqHXjBYAIk0T2xszq53e35wB9nZy0q1UWOCb7QG6hnG+w6f1F/
         yJEyB5ZnjF2DtnuP0l9G1hXzY6l8j7FtULY9IhWMVSvTO40JnF2i0DBH+VEvPzcVXndl
         027z1+E0luP5NvoMoy5eNAIv3nK6QC0B9EM34smOyRhOLQ2m+IqnXnZDGvYUi656j97x
         Bilvxld9+2yCQV0jtzFDD+xV2Zzxw9+BsXPxuEkNfkDkmymSHV1FW0ED6IdIaJxP7EHO
         BIbuiCJuBj3Xj2NbpA4Yn/4OEktUmrJFIhElpZY4h7Dq3FoJYGzzd6DVCrbpYlU57xBO
         mOGg==
X-Forwarded-Encrypted: i=1; AKwUvBxdCTPmkVZ8odPjynC4obal0/tPlnpAQ9SmSvlFsDbdg8kgnvVShXEMG+PHqQnJ7NQ2Hho2W9+ulkSiM54=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8p5l/E+ECwuR6X1MxV++YIaVVaE08nBb6wa9yxv/LKJx7f8CT
	VNudnSWqy5PIJcTX0fbEuvQCgU4xPNOW8zQZrcOcB7ahvr6k5ZnVfvqE6XgqoutLUQvXh7t/Een
	pLH0AXwZpCGcllZPOscEkLpk4XySZ+XNnG/lKxQIMUmavPOqYECtDOOHhYp5x4/AL+OU=
X-Gm-Gg: AYBFou0Pxbe8xRy5k0KYuwtg3NZR8nyHttPVbQieHH7X/mx3wljiiq2ETNxYSXeDhAC
	vRhQj/EV8hUY/4c4tAYLPVI09NSkEjcMoD1p+PRKgUM7eqtQaby+u0v0JZpCMLAA8OUXBA5a0gq
	GXUi9UuJsExo1rZIzfRE9+uJRlAbZpatiE7UZmrFhoM+GioB+h/mamqqv+zkfYzshnIH08BuOGX
	/vxioEpY6htYQDNsnzCgJvkpVbALczSt3MdHpEgy19EWZa5fftBgt6oPKQAX+HjTCJ2t3w/RaUR
	c2T6O03L3cEnQJDdwTIQsNlLMjQ3RUp76XGgBMZxOyjJ93Xese5ZobCVlVcQU7jxQ6WDPWS4zKo
	r8TofHcb65ZhAlrNEZY33BvnAkRihS1RHGCw44PXrPouhQQFEpiEfQ0RqD9znk9v0SUt94QE=
X-Received: by 2002:a17:90b:2687:b0:3a7:e0ab:d923 with SMTP id 98e67ed59e1d1-3ab3acb9ce5mr9405648a91.39.1791876479257;
        Tue, 13 Oct 2026 00:27:59 -0700 (PDT)
X-Received: by 2002:a17:90b:2687:b0:3a7:e0ab:d923 with SMTP id 98e67ed59e1d1-3ab3acb9ce5mr9405610a91.39.1791876478542;
        Tue, 13 Oct 2026 00:27:58 -0700 (PDT)
Received: from [10.133.33.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9638fsm19498578a91.3.2026.10.13.00.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 00:27:58 -0700 (PDT)
Message-ID: <f4d10126-e2a4-41ad-9960-ff129d92f39a@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:27:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add qref and refgen regulator support for QCS8300
 and SA8775p PCIe PHYs
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ziyue.zhang@oss.qualcomm.com
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
In-Reply-To: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfXxv4D0qdfyKkT
 HBW/g7BodDwfbS0A748LZr2D1fzIflFQ0GGdnTiEr7HDA3+EgbnrHVgtITl1e/cebZez17Cdu6t
 7HYLdXeHXXHU5Cvmw+6LrCn11y0cQlS9PxiC2xdcMepSkuFuQjKVQWgb/iuai+Lewrj6bGN/ypT
 sWdl7P/hB0NYpAIto0YMJdadZqGL80lPoN4kYnaiKMhj2qzHmkgFqZp49T1HwbWZZVsmnK9FwYV
 6SZYC8a0HhONJcQ7kenGNoyGoKES+fnWEIDPl+vjbdksJP9sB3+99lHnIh9cn6Yr/m7azBjP6Q1
 bF9bldzOu6K6YAPrpfWMEKefAK3ZPsFWnXJ2w9tCSJX/Pszda4umUZHdsQ7mxDY5A15GBElM5de
 OioedfTb2Do/bk1uJZhzSScChkp4TgUzLFP79xOL8YwkJWeu0ukNtfmjL56H0FidDDcatBHj3bD
 6BeoaIX7bRigo51SHtg==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acddd80 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ka6KI2ZnJyLrzUlNBNoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfX2IDm0gZQkXzj
 awV1e/VdVBjgMRYmpZ5oK2BeJ4kDCgoeAbpSnxxfTiJk7UcbkWxNUFdZgcxWtP5UJrZzUL4XlTx
 LXHagwMaX7v4FrGgZ6DGEezeJ4Tq0dU=
X-Proofpoint-ORIG-GUID: -zSRYTBpZ_D4Panfs1c6lFPhMZOj_zKD
X-Proofpoint-GUID: -zSRYTBpZ_D4Panfs1c6lFPhMZOj_zKD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130029


On 9/16/2026 6:20 PM, Ziyue Zhang wrote:
> This series adds qref and refgen regulator support for the PCIe QMP PHYs
> on QCS8300 and SA8775p platforms.
>
> The PCIe PHYs on these SoCs require dedicated qref and refgen voltage
> supplies for stable operation. Without enabling these supplies, PCIe may
> be unstable and the system can occasionally crash under certain scenarios.
>
> The refgen supply in particular works around a hardware issue where both
> QREF and the PCIe PHY are expected to depend on refgen2, but QREF actually
> depends on refgen3. This series therefore votes for refgen3 manually via
> the refgen supply.
>
> Changes in v2:
> - Expand commit message to explain why these supplies were missing and
>    what issue was observed (Mani)
> - Remove redundant vdda-refgen-supply overrides from qcs9100-ride.dts
>    and qcs9100-ride-r3.dts; the supplies are already defined in
>    lemans-ride-common.dtsi which both files include
> Link to v1: https://lore.kernel.org/all/20260810112735.1326807-1-ziyue.zhang@oss.qualcomm.com/
>
> Ziyue Zhang (4):
>    dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add vdda-refgen and
>      refgen supply properties
>    phy: qcom: qmp-pcie: Add qref and refgen regulator vote for QCS8300
>      and SA8775p PHY
>    arm64: dts: qcom: qcs8300: Add qref and refgen supply for PCIe PHYs
>    arm64: dts: qcom: sa8775p: Add qref and refgen supply for PCIe PHYs
>
>   .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 27 +++++++++++++++++++
>   arch/arm64/boot/dts/qcom/lemans-evk.dts       |  4 +++
>   .../boot/dts/qcom/lemans-ride-common.dtsi     |  4 +++
>   arch/arm64/boot/dts/qcom/monaco-evk.dts       |  4 +++
>   .../arm64/boot/dts/qcom/monaco-monza-som.dtsi |  4 +++
>   arch/arm64/boot/dts/qcom/monaco.dtsi          |  4 +++
>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  4 +++
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 16 ++++++-----
>   8 files changed, 61 insertions(+), 6 deletions(-)
Hi Maintainers,

It seems the patches get reviewed tag for a long time, can you give this

series further comment or help me to merge them ?

Thanks very much.

BR

Ziyue

