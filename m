Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFBD43636A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433634; cv=none; b=u4EK1/ZveOyE6laG27nMZpjm38ewXUiHqSyQpChYPkTfNP4klT+JowiHoz8If+uEeFF3XY/NsGnWyqIO1FB9QR4QA4WQlQkxdJoJWOBlnGM5NvTtbuOfyg2fyQ0mBQ/qGaqQS7n5wsAIpXRuvQEag7YtsrLXGyjxdTlIOVjhOco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433634; c=relaxed/simple;
	bh=NafIAQ81wpuFc5oV6yH6QTWWdlTU+hZVW0S+P7GkiA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbxG7kTL2qN29uxNGgpfkeh7GYiiLheCdRsfODm8OYHO3mIrRljC5yJs+u9/nwcGRQZFgE3gFH1mW3I+wr5rzUx+4Pyk58W/+oKvzwpK703apuDieu96teeF2o5YkMBa7d3SA1ysxjOex6xy9CTlFkmSNHVbbX26e+4lqMV+8HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EidnkHMA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOVRWH3Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EidnkHMA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UOVRWH3Q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHDdr327114
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 11:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIpSBKc7MRCRPHbtt20r1Axt6vCl6+OJnyJy0IXMvxY=; b=EidnkHMAPsdB4QP7
	FkR0lQ64bL/aHq3EYituSzKiEPWAmOhFkgiwYR2MY+6IEx8VYQ1UunvOTFH5IfCn
	Oin+LTAQ3rzTUBqbSWIXgyMLDW0x/zCyCNtntkncfPNy1YFpiJmMcQoudkjz1sNk
	eO21JBxbfgsbgXyKnBYdMz8xcn8xPqmvwOQqkR8S7pO9ygyTRCp6udW+Tq8WaJ7D
	vQd+qwW5sIqaOqsq+YoMWhxrhA1I5X1PasntOLh7zCPxz3eS0HRcE8oFRwk7Xz3Y
	uvaVCLmWKgO2ODYHYz7dUGR3To3qcE3W9UsdvyRfuHDfRhhpeP/e/wsf3sY/Y3qx
	rYi48Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekgwkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:07:10 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-789eb1bdd79so86126137.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433630; x=1789038430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fIpSBKc7MRCRPHbtt20r1Axt6vCl6+OJnyJy0IXMvxY=;
        b=UOVRWH3QXToA0I3msNHOePp9aVE6JSlOL53oBYKrIKCkE4uBJ9buT2W92Vd63ZKFxi
         jbu67OSchRKXOUpXwRM9qc8KyRAgKDthKE3MIhRpQaMz4Z8Fn31mzTh9ZK8dMqwfYZPM
         q/qUuqLMYQfBF/1G3l3lC4I+mIPkG2P0kt9yPpoSENQuBQCnQ/1jWi8GiuwLNB35hxb9
         GAGiRcLR6Pm1sW3KkbZ5nIOpdLnKsiuhTAEVsK4Afhc7bmzZhEU+tG9ujakO+iKgWzsf
         eWyz3JSnOf9RayKlrWzb3kGI8cKM6Kihc3eo3+VxVxcRXdBMgPa1Qr15I1jJo/d4BU95
         i9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433630; x=1789038430;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fIpSBKc7MRCRPHbtt20r1Axt6vCl6+OJnyJy0IXMvxY=;
        b=l0kaFbbalnGbe1Y3us3iueUqezQ1Y/aszAEvW3wIxphyfAogVB6LcEU4sgBqrdSaku
         f8QGBN5H88HTPPFjiXA51knnJwHSd1J/T0qpIAp0j3/oDeGBFe0xLFl/q9ZUws2e041k
         mZdjCqk6Qu9jpKLtvd+gYrZ3UdXtcWOxSOhQ6InUrB//eBpWwlOA2dlMz+Kft0PHSOhU
         vUMEdhoNZqur53orejYcEK9pOIrpjZdr24Yw4WIYj2hjRmxeGhBOqXcml11Y+xXBwtxQ
         X0ZDEVxoX80Y3bKVgsCe/nTbdxsy9baQYB2gOCcr6dGvzGX6h7b2qlC4h7lmH8ICKWGr
         yBtw==
X-Forwarded-Encrypted: i=1; AKwUvBzlATqo+v0/fsavoHbXxyF+twrJ0TkWtRkkno9oGco82Wu7PUI8Z07Z7a5GsDl4lY8DriSdKVOkUReAvtY=@vger.kernel.org
X-Gm-Message-State: AFuF++kA3MrjAyo7QD/hhySS3rWRzzFgPXV4e4XTPRs+bvRa0quJEy1f
	9Y5aM3GBqX+//NRyJrIp7oydhMuKCMQTkG/E2lZrkX78iOOuC6P5gDknys+Eo2FSqmgrIWbR4hl
	MHKMcfo76jr9CtPg2xNno7DBSaVk24rU9hWt8lnDPbA6FWtaWYlG2qIkPeReovJoTIbo=
X-Gm-Gg: AYBFou1xoqQBjSLUXNIMPLph6kLd9Hb74+2r9marmP6lMsW5F/PbUncQ+KHsrt79Rft
	3BA1LkM5PRDYt1nfsT7t9ctxf6/6sr8MjXV9IqLB8upmjxvihvSLuQ7N7HcwI+2YBvaj7vGWYjk
	PSSFCcd+Xh/WnKgYI8cF25KbKy3QrCzTjc9BQ2XOA6l8MmEprPih1FzGadSXAJ1XnzIlAhKI/UZ
	PKdnnYrcNy8Gnm5m4hRrQuunZ3V9TF552hgReX3x1WhQH3+QIBOkGi+sBvxCZ9eD0MBmevjh1PX
	1BDYG9Xc1qH8hl9cWzmZcRPE82ihioHFQ96cPuNnCWc4ge0+e8nX79IWTaK/v7r0P/zVThUgxVb
	zADWF9aGVHZL3Xls5u5UbTw==
X-Received: by 2002:a05:6102:534e:b0:789:3f43:6458 with SMTP id ada2fe7eead31-78a1f255064mr1639236137.0.1788433630343;
        Thu, 03 Sep 2026 04:07:10 -0700 (PDT)
X-Received: by 2002:a05:6102:534e:b0:789:3f43:6458 with SMTP id ada2fe7eead31-78a1f255064mr1639203137.0.1788433629819;
        Thu, 03 Sep 2026 04:07:09 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f419e965sm83877466b.25.2026.09.03.04.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:07:09 -0700 (PDT)
Message-ID: <04faafd4-037d-40d2-a79d-6d128b194692@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:07:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3V3-Q4rHluV5Xo0lgQF02brvvoKEIHHY
X-Proofpoint-GUID: 3V3-Q4rHluV5Xo0lgQF02brvvoKEIHHY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX9nz1aolFUtxm
 952S9jb465pfrNeSkbcgBG9GsERr+qUEr3RyeHM9iX4XcHM8CgvlCoN3pPOypVtVpWHWVNRjXMp
 PE8jHk41wcuIoRm0cOKPzX8cwKmOV1mVpN3C2L4WHENoRbTc8+lFw6N2ZVl9M57UJVbqb0fL0rw
 ZelYi/Zv1TBl8QMnQnkRg99q80gPgHxLm2bdFCg+x2oTuqI1Vm5J3VCELNLWfQ9pn9o/1y5MDfF
 r8sCU14NDbs2WhQNfDhcYTDEVItaJe0LfTv4kycctI3JBMDc0rzgpUmkgxN9XpQXXcdleg9bZx0
 OgprPcfyukKfgAHt+ZDixubkOhqmpm/uNTJGlS5WsricvLXl2plUyA7otpti8mZWq05OdyT/D1J
 o72r3r4+NEVzRYRGArU3TPdGvj4R2Yjhggtq39XTYRhM2X2PU5MP59cIZAY2dkgZnkclxXYJEyi
 MfPoBzBW6gpZ6ZQNvyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX29LjEjHDl1dj
 j+fWEuQsRMf2Y1JWg/T/F4unn5IYbzIDD7EWrwkB250O4oUuzkCWkH5S2Fb1R/LZH2GqWN/xxEJ
 zeLcckvmzqwVrZJPXWs4cc7s8I3JRMg=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a9954de cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=OHs8NuuX1ptjo3lIKY8A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030096

On 8/27/26 7:51 PM, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

[...]

GPT found the following:

> +		tlmm: pinctrl@f000000 {
> +			compatible = "qcom,kuno-tlmm";
> +			reg = <0x0f000000 0x400000>;
> +			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&tlmm 0 0 110>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;

This needs wakeup-parent = <&pdc>;

Konrad
