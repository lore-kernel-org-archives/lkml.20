Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781397;
	b=MuVjBg+J4Z24vmtuz1RxHp5p65Lsx099F4rx6Ozexlop5uUgeT7xeEuqAWd9XqasVt3W
	 v+gLJWo6L7DYajbejjy3i5P42+/ArB24SAL95SCwAIgD0hA0YgreplslMwkzSdO26BdLW
	 YjEjK+TOZdCLXsBEyNTo5D+ZM/5nXef51blNiaQWLGHyY/gEN8+taw0ofXLFes7DIlqBn
	 sTqZCy9BlzXGPc5Qr5xOCHMmzgrWqQ6pqxlbyqXPUlzyBcD0xyij/Z5jc+0kWXS/REJzh
	 qktwR2mflNaZiOVUFckKZJdydaL14Mu1M46kmteD9Qca2LuhOcwg2n4UZoZobvBWcCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PQ4LinK6QHDjKioOmPQ+jXCD4vkH5b3yBrfQAIAIVJg=;
	b=0bG+tKXNxmJqqzuWEWWrpzI3fMxQzNVHk+rfJwJ6byJTtUsvpg4BVO+amswrGrcqmKh4
	 Pvez6xojJwpK0OcCtDfEIbolqgUuhpLTIVQuFaPgHWMWzgtiiUpLMHKHgQq2t6kPtNY32
	 27fAQHvyos/38uoWni7vdwXRLN55Dh0q0wKlAvoNwY6RTqXEV52PXATQRyAuEEzYhSyAC
	 E1U9UI+0AWy04OQa4Y5qpNjizDNcn8tfbJPNvflQgxbB+uZp1iguOgt6yIHFvp6qQrgHy
	 j+7Muwn629t6BlRq5Vqz+lSIt5J9gDcjGSMCR84vrF3xhh08IJqTwDPwgYoRo6x+DOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gbhK8BM8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P1yVSKWu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA5A606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAA5A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gbhK8BM8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P1yVSKWu
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48L0D81274964
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 08:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PQ4LinK6QHDjKioOmPQ+jXCD4vkH5b3yBrfQAIAIVJg=; b=gbhK8BM8tMhhuj7k
	+5bSBMqQ3ZjaVWUje2lOUX0TsYEi9w/9QqWznoKL3Xkn3WkmMHiERtpA5mZUTvF1
	d2qksPWt6NNW9wQgQp5W59THeO9ULGUn7pZhP6+2CsX1GmpwMj52S3EhotynXLYp
	u6lDjkHiqcTW8Ha4RdJGaUi2rMQZVSGrEMUwbagcleLdiRwxS4TUuMigzje0cnc2
	ZgZAGt8G/Sg+e8TiDYMwGq3kBpLjW91MUFmi1dMdbeTAXNsCYcp6VztA3Q3icOyp
	6EALMXfDWHbzk/pLTYEtQrk/BILC+3GnlcqKLjFZ65FFeeHJsCqBW6cPmSePVun2
	K2UQhA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypm1ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:36:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53630cded29so1161511cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793781395; x=1794386195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PQ4LinK6QHDjKioOmPQ+jXCD4vkH5b3yBrfQAIAIVJg=;
        b=P1yVSKWuHPn0I9HTe/wdzcKBD8CUwMCUAl57+2hUBxkFfMK6x76WWAh8AcrEmuusDM
         l7ER5iOb56Cb1mWOLllxFuAermXM70+FaCC3D8P06W9hS72yn+pkpqaJB8es+XXUa/kj
         qN1oLxM0zCd3ktcFjGVPZQQJisR04C9GVPaBKd+G/v3xjH36SHsiSScKQAkQMTh+LkWy
         MI5TDnut3RTn/n0lMa0brE0d2sPgKkHeE2AC85v0b2Eg72M0W37rZkTRlpO4UttTZqEy
         koqx7mXgdOXqVylKeipBKchZwCfIp9lDoLUuU17ZYu/Tv7L4CyZmselQ7fDvS2YMdU0+
         up4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781395; x=1794386195;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQ4LinK6QHDjKioOmPQ+jXCD4vkH5b3yBrfQAIAIVJg=;
        b=NRpHP+aqNUCiOPiLm/qpl3OkZ8jWgRC7VUeOgnRB7QZP8lNKSpXMO1V2PU5uZG2KcZ
         e/7Co9To6S6egc4f3e9pu7GSUuk/9cb9pl42/6W5iMi0YO5W+SLookGKKfHKMY5zdnJS
         FvhK7YkwPEv2bn62tlN6QgFdKOHRvVduVdZbayAAoHFXRKVatDXSNe8FKRpzOrzDZdyP
         ySnsbLetZqaPPF2nJ+SWDfd0c6V4st7UGMRTgvst2U7hhJjamBtOrv9d6jbPqYadhhzE
         niEvM85bHgjj6k6nzklx1FyKXERS55eLQWT6timxuxu5DYURY1/vMdr1estYtehJe2nx
         RwIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgGmaSJq49Zwl+0mjbaSOTBlAoN36IUMc862QrbtpcD82x8C3sYAyYffMM3z3FA5jfUwl4+B1Uxzjh5BQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iXSvW/Pn9g+Yn33q9W/UhFKpPvzmlMjCY6Bx0cFDJJwx4zGF1
	nfYpG4VxBuJ9ZXdZwSqgA/xZShEVpoHJtFl4S1TGkqLFW29I2iaD1DtVNzT8Pmi3nLhvkyVJJCq
	ZaeFPB0PKyc3IskSIRoCoW93sUXv5uXq0eo2ZTq9Wu3Ri6oeSHj4GoUy7/u+uP5BTUGE=
X-Gm-Gg: AYBFou3fQpjLuDdRvvpAF6RccBX6N0Vz7pfeTe0vvYcSlf8YuGMbzmg+J2UeY0Z9NYy
	0TwG7CvpNvyWBvGfFkpH+he6n/N29eTP9gZx919AokThN7QwMqEZHTJi9Ru+ZXME48GrpiQVqhY
	V7OuyiRdGmtDoXF1YAvr7E5LE1+rmGudU4QXazcr4xnTWwNsVZxXGSvxTD4nQ2FCX3z5mKBwO2H
	qaMhTEqmDY8+OTOjCpM9DEiqnOCnMMnA/mLbc2TvhQNcSvpB6fd04Zpmpm41iPMfAMABAAh6YeM
	rGoA5pZRPoE0MtHW2XEmj16AssB74GVhBJ7dRt8E1rFUXmn5pFX+htfD2XRM2avOtfs3+to+Gi/
	3Rav2BU5nzCuIMEPp3L06ED1jNkd7Hm+QhCPvPirEGEOOZcjm5HohCvsKNbF3tr1QFN3b
X-Received: by 2002:a05:620a:2319:20b0:945:c5b3:6356 with SMTP id af79cd13be357-945c5b36c93mr785273285a.2.1793781395197;
        Wed, 04 Nov 2026 00:36:35 -0800 (PST)
X-Received: by 2002:a05:620a:2319:20b0:945:c5b3:6356 with SMTP id af79cd13be357-945c5b36c93mr785269385a.2.1793781394523;
        Wed, 04 Nov 2026 00:36:34 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e424c34sm46273066b.13.2026.11.04.00.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:36:33 -0800 (PST)
Message-ID: <ea308aa2-8a2d-468a-ae5d-ec9a8ccdb2d2@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:36:31 +0100
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
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sc8180x: Add Microsoft Surface Pro
 X
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede
 <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20261104070441.74127-1-val@packett.cool>
 <20261104070441.74127-3-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104070441.74127-3-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX2i9OXwt0VbhI
 bAP/LvPQM+57JokPZ8xRe4YiC1ZUygbdGj4MN+V423cjtcKE+y3wFUd81ihH0jNm1xXiiOiL5c1
 h5zHxcU2jR30O3tzsSV5nkTu4BdhxPE=
X-Proofpoint-ORIG-GUID: oyR2n0tC65f9UAeEep_iT4UJH3s-TebD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX7R4i5G2rMkrV
 uVQ0UB0DDNjbRm5prlwjf3jLrpEXkAJM/lwCtFFgqW9b01O8kQwFVLbd/pjsN3c+j5trnuvnkCf
 1A+eeVlYBrHwOxeRpUOVGpgYGKgt1Pn95Tl1oROstZJFg9x0Nh6HIy+Fjd34Z06OVqCyOWpEYeE
 kn6cK7AkK1JROn/4w6o9bS/oLwEvjhh7x0Z/kBq2tSlkYuZ7jaK4pSNXxgwSvryhFx8OGXQbaM6
 w2251k3r/zwwQvCwclZ/ZN6oelyrCJ7fQj3CEgQ1lClBHfdDVeA0eM1pF7i2JsE9KDuXx7CSNFv
 MjNJA1MVHWLb0cnr09KRNuKXGAfOqIoL/MGJFeqKeeDS7dII2t2uhwSYjxMahdlRS3piVVVTrKS
 53SG/J7oGoXmLxELA0hXKto6Vq9IJk1I2CA50GLLM7iz40QJr7iK82+Jrue86qpIXg6B9dv/JGf
 hHUps5FA8ykB4dERRvg==
X-Proofpoint-GUID: oyR2n0tC65f9UAeEep_iT4UJH3s-TebD
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aeaee93 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=S4lLRux2dGMH_Q5bArEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040034

On 11/4/26 8:04 AM, Val Packett wrote:
> From: Maximilian Luz <luzmaximilian@gmail.com>
> 
> Introduce a device tree for the Surface Pro X tablet in all 3 variants
> (SQ1 with cellular, SQ1 Wi-Fi only, SQ2 with cellular).
> 
> Currently working:
> 
> * Display, backlight (eDP panel)
> * USB 2.0
> * Wi-Fi and Bluetooth (WCN3998)
> * NVMe on PCIe2
> * Embedded controller (Surface SAM over UART)
> * All remoteprocs (ADSP, CDSP, MPSS, SLPI)
> * Volume and power buttons

[...]

This needs some sorting etc., but let's tackle the bigger prob first


> +&mdss_edp {
> +	pinctrl-0 = <&edp_hpd_active>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +
> +	aux-bus {
> +		panel {
> +			compatible = "edp-panel";
> +			enable-gpios = <&tlmm 130 GPIO_ACTIVE_HIGH>;
> +			no-hpd;

Is there really no HPD? The pinctrl above suggests otherwise

[...]

> +&pcie2 {
> +	// XXX: pcie1 and pcie2 are multi'd together, for now use just one
> +	num-lanes = <2>;

We should be using the new phy-qcom-qmp-pcie-multiphy.c driver I think,
I'll try chasing down the right magic values

> +
> +	pinctrl-0 = <&pcie1_default_state>;
> +	pinctrl-names = "default";
> +
> +	// HACK: Remove "global" interrupt

Why?

Konrad
