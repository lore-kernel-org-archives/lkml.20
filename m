Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C993569F25
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096195; cv=none; b=aJqk4za+z6FFT+wO00zIiVRJBOIOA3xP5rz+pJG1wL8eF/Ts8Rpf0gVBtF64fZdwjV13eyEAS0F5hTRt6OyakJyKeawUOOBgbvj4sdRcXe6qQqdxGkwyRfT+kez+11TpBFKZWNefAeo2jqI4Ot75QMmfQdGTZM2N3ZxDRhbdJiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096195; c=relaxed/simple;
	bh=Ng/5uaFZi9LYWsGb2fCTbvjBI8go5dl00sRS5YXJoso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JIWj698kREXwoXFBzIkHlk/pUG+I+PImm0QeZpinXaDetYJEHrtOjK0TqcNeg/5/OuQZ2AIwSXa86wdGeueTKn5k0eL6PTjlGsSIO0UZebXpJRtFUWD5FKB3Qbs4egeCkC95+9Hv5+ffVh1cbfnGqIH6mo2/tsw6J+qWjPTWRug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZA12WAif; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdtEHzMT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZA12WAif";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdtEHzMT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjV061058308
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8wROlQAz+HLKs1Kk2OvPyUzCFdF6E7hi8VD6cVYK6FQ=; b=ZA12WAifBoEcqaU9
	TuoGvjLHsrp5ZGwabJqI/RF8d+pMnmaNZoIivif6kAxLppo/wjKEapCtKUt21u1q
	/507q6WEv9Wa7LwwVnvMZ37ikoBtA+PPH8TXQqFX+xI0zHyA2YWC6wniDuP8TvIX
	lIVVjGU2C6XHE7XFk6Bd+J1J9amTdaH3zL+NTh9uU+H5hj2RfjRuXe36RTsHa8JT
	dNUuO2cH3DDiT6ocK4ErhIPoSuNioA4ZZVuFsDcRcuLyUBKx4t5vth1ebDdFBfxO
	l9l3dw4Tv7iKOfj99UFQecpjxO8j7gcXj7dketjKeGNJpaw8w/nIgVS+ncqVjF6u
	fcMp7g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5uhj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:56:32 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-791265014f7so1127137.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790096191; x=1790700991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wROlQAz+HLKs1Kk2OvPyUzCFdF6E7hi8VD6cVYK6FQ=;
        b=OdtEHzMT18b7Pr/bMMyi+wAEA9hYHE6yU589IwyPJbjkmbLTJTUAfFh7ofbPxZCQZm
         sg2Vx124uT95u8AGDjCgZGQYxo9TbiVzX6tklG6EH3EuW6igRDuJR0h6bwMOLP2sm2iy
         XHZqm+lfBrCvFyjbFABwH9wpC9rbHYS/BEsutpDFHD1g81TZPRGmabbEpQGqaQ02jV9L
         y1DPBHE3yBXPst6evNt4/epaJaJt3Fhj9v19ouvCNsYmP1RmTOE00G3whjeTuQHB+RdD
         mbFKx80GvB9W8DQLoMzOBAbXM4HttRjEJMGZSSBvbOxlbL+2S5sAzvzBd2z3UxWpL9aq
         UVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096191; x=1790700991;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wROlQAz+HLKs1Kk2OvPyUzCFdF6E7hi8VD6cVYK6FQ=;
        b=x0axmzxX16tHtKOlNlzHJvagi8IvlD6T7OLNAd8oE37jWs0bTI2nypGbd0Z6J6JxTE
         8fQl0piTAZcF22F3lZYVs1y4DdzUCPA299941eWPPky72sdyRtWnJFSKGw1D7RbM+lzj
         mJkqs9kGFX8zIe+8IkEKAJwRFEPaUbw7URc63C9u0aVfs98HvplLJ1+hs6KugRtMUScC
         OOcYqZ6MljCjuGkCo01vRzv2zhcVFauOr6YVJ59zakENSK8pIDk4mgfdojnGyVbwLWMt
         WzDoeYZqhQ7QtfGYhH6lj0yS7nkS5r0OiPo9iIZ67JW2/r+N3/5dIPJSzxua3UH5UC3F
         rOgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTn3MWH6vDu4Kl4afBaufuoDZo8krXfL73cItUfFzPo/AySgucaz80jDwnr/KepGI6mRllYtCoslngP/U=@vger.kernel.org
X-Gm-Message-State: AFuF++nDhaQo1PzW4gKrVuK8CrHtskVZXffDOVg5WZp5/IunC6FR+jcr
	vBR4kivfUQmXIFr1Ky+G5c+SNw7utTIoyX/M8H5ZoJuC5i0nY73aGE3M8Bu476q1LCYqT0rlEWe
	gycHvAshZBLJQA3zNYzsBH0v5xci3G9cHjjzPgJjYJw7NyQfMAUJswITBdi4v/z9bdb0=
X-Gm-Gg: AYBFou0QlTSEQcou+f1tSrJ+MAYQ00pRH8dMW1TwpTnXdzFBFy/qdgbQavCwghIftn0
	7nI6Z3PfYtJzIZw+8sXkjFTjIdatUGdEY/G678ohhNQwyQMHM/muAYRIZJ4J4EpqP7uHD1uWUaE
	9ytqJ/kUh4sgqOrrnggtjhCZirw1BXVNmPpkUCypH0O1s6EaBZY6dWnoXsBN1rwrgdzn+NC2WIM
	lXFPhOf9W9nXIptMg7FfhmeSdB876eAf/P9XIMRxqzL3lXi2ZKDlPRWuc+fMZNXmZ2k1Qwjpv1Y
	y8hj8A8AEeCF8NswHOwaR1M0DqTUDEw7y8JuUoCX09g3TwZG5Wy4l3jNrgzjnAdezE9SUwKagsD
	fumd7yw83N8sPfEk18JyjDQ==
X-Received: by 2002:a05:6102:3710:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7a7326b6d93mr6830210137.2.1790096191417;
        Tue, 22 Sep 2026 09:56:31 -0700 (PDT)
X-Received: by 2002:a05:6102:3710:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7a7326b6d93mr6830165137.2.1790096190901;
        Tue, 22 Sep 2026 09:56:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c6241a3sm115662466b.52.2026.09.22.09.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:56:30 -0700 (PDT)
Message-ID: <22b6ac66-a29d-4e9f-a02e-f0d38e0aaee9@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:56:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: shikra-cqm-evk: Enable sound
 card support
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260910231642.1794948-7-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910231642.1794948-7-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HFMLRU9UXArB7oiV9CQJ-7Z8nUzwShzR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NyBTYWx0ZWRfX+04pbz20XwHb
 9sg6yy/CzW3vkJXVZUwbrJZZrmQslOdy1ZUE7qG5MfYwiXUQgm767wDky3zh+ZoxfjJ5RPdshZS
 ZlNUtLQJ1PrIqbUH+6I174fsb+CDn0A=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab2b340 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RMMXu7680as21xinOGwA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: HFMLRU9UXArB7oiV9CQJ-7Z8nUzwShzR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NyBTYWx0ZWRfXy9rCrPvnni6m
 f/OY5oa+IMvULwUzHmoV6SKf1CzqyPTSUoVVOQtUy8H5hIFt9dHEuSCVxwhEEK5q6l8biFH0QZT
 KdZ3a+KxI8ZcZdkHqb+SXWN377Q0yqDcuKnfCh5WdnL17YSG3CDIF1YebGs7wyiAsBp/3kAv6vF
 vcoD/pFnb+re+Ks+abH7+00QIbZncbjIhMgvYdCUpIpw7GBxHJf6pWi2Xc6MLFs8eCuPxqNkhL9
 0XF59x+Ci56DKf3aoWxDhPQXUj8gjaB2fUYl1YcayRYNb2Q7rsIUoAnzwig2ddizZHPxsT1zZNr
 QYDd2FX118gu3+g4+RHbecp8Fup8bY+eJsJFxxDny9qcGOi+c7+A3eN9dTPbrB4u5/oj6FJaxQq
 EODTjyeSFCLcb0F5CPP+EtZbGE42LpdNmlthIg8P3m2mCH/rMBeD8IfmpPUP1IYA1/2ToROMuLN
 EhVonaIyeHY4cp23cgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220247

On 9/11/26 1:16 AM, Mohammad Rafi Shaik wrote:
> Enable the sound card on the shikra-cqm-evk platform, including
> the PM4125 (Rouleur) headset codec, WSA885x external speaker path,
> and QAIF backend links.
> 
> Also enable the required LPASS macro and SoundWire nodes, along with
> the necessary pinctrl configurations for DMIC and I2S interfaces.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

[...]
> +&gpr {
> +	status = "disabled";
> +};

Why?

> +
> +&i2c3 {
> +	status = "okay";
> +
> +	wsa8855: speaker@c {
> +		compatible = "qcom,wsa8855";
> +		reg = <0x0c>;
> +
> +		pinctrl-0 = <&wsa8855_spkr_sd_n>;
> +		pinctrl-names = "default";
> +
> +		powerdown-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
> +		vdd-1p8-supply = <&pm4125_l15>;
> +		vdd-io-supply = <&pm4125_l15>;
> +		qcom,battery-config = "1s";

[...]

> +&vamacro {
> +	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&tx_swr_active>;
> +	pinctrl-names = "default";
> +
> +	qcom,dmic-sample-rate = <4800000>;
> +	status = "okay";
> +};

nit: please keep a \n before 'status' consistently

Konrad
