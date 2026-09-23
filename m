Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FCB328B4B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168558; cv=none; b=GR0WBFgsLe7pSJB8rYJ3+Vq6zlNsO1TMTHbs12jzw0V1cMYyK0WTF1LIUehe4VSxrYwoqtshGSTUOz07+hpL2GIp3zdEXEsGmP/LA0nfD7ABeE/3Px417lE+7fWTHYSNdm07jnOgfee39iYfSSksX0C18+dh+RZSJfduUpLQQ44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168558; c=relaxed/simple;
	bh=aoukjc8PMMn3p0s9SeEc0oqDisI+Ii+3y99O6Pyf6wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpvZoXBhyGJUydJAA9TYWUKtTZhjYmwEjaYIc9kop5pKmGrjgXhQLki4uy6OKz+YKRTSAKq/gY/JkzSV4mrEqhiYDzXIF1nWOEanodGoGY1bxhb2MQrgyIe/uWWHUlMPXAgdjUSkD/WO9aO4CoG+I2XCuKQky8OPCw/jIVguEZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbLHUTb2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FvRL/zFg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbLHUTb2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FvRL/zFg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbfN22638354
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rdm7/qh6VqpSPExRnuHdeR6FEt70qNeO121xfyLDFm0=; b=bbLHUTb27h3tcQxh
	QY6hr+EnRUkbJT52ZVejQfyYAfBeVJQfaLWOiJaZBpP6CHYNPytADaHI3LnxRVgY
	/vM7daIFwgoK1qtR/fJD3DzOdQfYEralGbJoIfm7HbNR67b1Jfghlxo2UCFnXRDC
	RU76YEu20sgUbAN1TWs0h9qBNdr2I8evB9vIALMBpi1biWNgshbgSDP44+DDenxn
	9lAOQjLI9PaXHRfIbDe0/Sg2d7Q3hW2QePsY97FCiUKGZ6bmCsgz4ZtTYPVUJH7a
	PmwrlQTDAKz+F39TsA7pqs0m71PmKgwbi40AZinrHVTmnTaPw8pTAccROcwiRtEx
	/t2AhQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqhnry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:02:36 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b381f60c4bso217703b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168554; x=1790773354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdm7/qh6VqpSPExRnuHdeR6FEt70qNeO121xfyLDFm0=;
        b=FvRL/zFgTFmMk2Jzi+2xDb6T7N+hexEnrYkrtbOAiL6AgghvuoWWKTrNbm/LeSQbc5
         bsvYGWqWtCV9jNmQZuv5p2i8A62/P5OEShEy4nxdoaPaw+eK6v7tztXEa5vTiMCpfe5t
         ACq29RZdrt1q/bgWKaT5QFgXIaDE3zuCE25ikKb07d/enfbYBF0F7zdH3fApAsXcZNWG
         zoO1bXMfZWniqUTrl8mXFDyXvH4Gk3qcGhx5M+AdsKPSweacdBIOgCu3CG2CzABP++MU
         Obu4hKNXikppAx2avGDgBY08bww0+0jR+jDcsf2tA40R8b41E9uYQraIS/cok8yQ0eCP
         choA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168554; x=1790773354;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdm7/qh6VqpSPExRnuHdeR6FEt70qNeO121xfyLDFm0=;
        b=ycEPklI/3+OuXu0w92s9wyjsVJEFinrkLq3FwC5bEZkQTOapcKhU0RPR7rr/GzweEc
         BCbtR66FjKl26+Mf9JAYNOLBZKXkPD235iTI7x/f4DikeUStmdVNvl7YORkbs72Xevta
         r265XhEdKhoaYsQ1OyVmnHQH2zZenrHZGVmmbgde1FprRcX44mQNgP/U1tQGxPkL6dVv
         mMKXATcpmA5JNF92bQfzi6NlYd5EEWLRxK4y3FwGuIsfHpGD3cgtyJp+Xw0fx5jaoNyb
         TQk/fl+pRKw8iQy5CLga3gQ0RhTRZydSRXeUh5BZ8w5S1GeU6OXLPx7uOzrbRwzpqD9j
         4wsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvdwGITgZZaG3oVc8PJ8oiHoTKSYjk6Cw2jMOuzdEbY+ZCd5tN7KcjZfWVdqc10s9qV1LC+8KebhQEdhk=@vger.kernel.org
X-Gm-Message-State: AFuF++mM3FlmN7C+PQeSDH4vOVUEYhw8aopXKcilgpHrIlDdXUf1s6+E
	tljBv3vtvUFvjZcIyqQadlxg1f5orJqHMircCoPGo2ufGIkssatApNsSpUNxZYt1o/yGGsGkEBn
	Sy3qadMr3EFzyDo8A9g0WZVjHZQNl5ctdsC7em5jVeH0LiBxS/qhOsZvmp1cmNOW8MIU=
X-Gm-Gg: AYBFou3S5pP7GWQgQPmE/G/jlP2+6B2Z3zdAk6Lo/SqNULaJY0936qRHoI8DT6SVoB/
	47svunjauIs5X1686NzPBhqpAethK5sQOlPXkhop+bEIiWOpX89mayOFsOKewqmvWe6Zi/P/51f
	D4yM+KGcLwBT1Dy85YUruVHlm55kV9Pd/08Vwk6A9ufik670Xy9cnXHewbBrpwO33T7hVj0LyoG
	HtVV8F6IVy0fmnWt57QmjCYEZlChFGyKBEjAzgaKaQpRr1Szp25ZPqQeDawviev74YRllu5cpVr
	4IgT9UVkAXusdErtpjs5rv27bL7m55mj95iuxaOSvFDLNlByE/EacdyNRaHAFOxdsUGIcgK8ITG
	uIwQEHhHm+mLsQ8JwE57GCA==
X-Received: by 2002:a05:6808:118a:b0:4b5:7880:14ef with SMTP id 5614622812f47-4d5bb1321c1mr3001244b6e.6.1790168553567;
        Wed, 23 Sep 2026 06:02:33 -0700 (PDT)
X-Received: by 2002:a05:6808:118a:b0:4b5:7880:14ef with SMTP id 5614622812f47-4d5bb1321c1mr3001170b6e.6.1790168553003;
        Wed, 23 Sep 2026 06:02:33 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae33ff75sm120445366b.9.2026.09.23.06.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:02:32 -0700 (PDT)
Message-ID: <162d22c6-3558-48f7-a1c8-5337218e8e20@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:02:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PRELIMINARY 2/5] arm64: dts: qcom: shikra: add ethernet
 nodes
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-2-69c0c5c7c124@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet_dts-v1-2-69c0c5c7c124@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WUsRiped-2Jw3PKYGDnwtQdeeYpMXEUv
X-Proofpoint-ORIG-GUID: WUsRiped-2Jw3PKYGDnwtQdeeYpMXEUv
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3cdec cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=osmAEHCOFALxNhKoBNcA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX2QG/RbDcPr0n
 F8EOHFXQL8BDfS5L08v1o4rnjplFiL2AGNpxowOKLMHeiCoCZU9oO2Cg6Kw0yUhSBIOtY9fV7PQ
 FnU94cy757bpvwVTuB0YQ/Y9iEdFoUw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfXz4KlR5wxhx8c
 7zKeaA2cXNSxRmq26kTPRHqkV9yxvSIfOtFleZwCzBrNtcjumPWgGG/4l8c03CnkxAKAFmqWr/3
 cz0A0mZteyBHPwhpR1foqnt/cKw6I/Fg5ryEdaR1y9BbSBsyAytycw0ohR1i3R8O2sBREw1m7A7
 5xnrZwUw0IMI4Rewwbml+vVILocPCj84914QWfzj6QBD/iAijn5m8G3EtQYn+RsKKfTMlT+drNu
 dClG/Bho1fs8HALrGD/Lq9rI7oy0AQgR4YvhlR00rQfy1c0XZ9zYoC+QrN24sfqXYdDuj3yM3OL
 4JFWAwqII4N4VBy4pjoo6cEQlMde11ZEDw5+J3p7gZFw0OrujW834LmceI+LeBI0QMwHZTrXsGY
 smSBDnI6TsVz/357Fr4jgDY1c8vT0SHGVcdhPArvbcsZbRgxL5R2NUGLWb1AloKdTelnBD1tsDR
 UD/Yf/v/gMjxos3GuOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230051

On 9/8/26 8:23 AM, Mohd Ayaan Anwar wrote:
> Add the two Gigabit Ethernet controllers present on Shikra (ethernet0
> at 0x5d00000, ethernet1 at 0x5d20000).  Both nodes are left disabled;
> board files supply the PHY details.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

[...]

> +		ethernet1: ethernet@5d20000 {
> +			compatible = "qcom,shikra-ethqos";
> +			reg = <0x0 0x05d20000 0x0 0x10000>,
> +			      <0x0 0x05d36000 0x0 0x100>;
> +			reg-names = "stmmaceth", "rgmii";
> +
> +			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names = "macirq";
> +
> +			clocks = <&gcc GCC_EMAC1_AXI_CLK>,
> +				 <&gcc GCC_EMAC1_AHB_CLK>,
> +				 <&gcc GCC_EMAC1_PTP_CLK>,
> +				 <&gcc GCC_EMAC1_RGMII_CLK>,
> +				 <&gcc GCC_EMAC1_AXI_SYS_NOC_CLK>,
> +				 <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>;
> +			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii",
> +				      "axi-noc", "pcie-tile-axi-noc";

Ideally one a line, also for reg-anmes above and icc-names below

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
