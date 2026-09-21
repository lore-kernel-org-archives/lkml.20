Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7051044E67E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977961; cv=none; b=nyEu8mp+hZJv0JeVPcNwsGgnRqpOyVCSKPqNH8D7/Q2SnOhlgOiTLass+Jb04XFGGTpwTuR+3XABPV0sMnCmCoqrnmZcyYehFVs1DH8bJ4nZTXoKrH8feMlAlolx74qNMA+u/nn1OWV2ut5lT8hrFjHTFza0OJNHK29Qd5ON8Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977961; c=relaxed/simple;
	bh=qA+sfwYzHhJ7yBQQa+Jpqy8+4pxE8vXtXtY16x7quWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XEF5/w7TEPNjTn9VTLNLX1Yfyi+LyR0u5g452jOOE759y/4LrI9WQvuHQWd85/ittkU35Y1m/fIM6bkA5CbAHT5CB0o9wWEcyp63nLeTJ3i4F9f8ZSRszuoHQASUAJ6mAYD0BnNbe3VyC7U7+gAep5rYnWrPhVbMaLYplFA1UC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4X2Xqi/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dh/OiPRR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4X2Xqi/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dh/OiPRR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79w6W467228
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z79Try10M8mBO4B/q2nr1hKgnYNAKB8UXw+vU+u74Rc=; b=M4X2Xqi/v44u4tKK
	w+LVJIagX+aNoy10oOp0dN+F3hkp2q7bfNKNs/39oRMTIs9v6dFfkyUT0eoKCDZn
	FHbbWVfL0MelxtauREK5xCAiuZeHogGZzOxl5bOJ/judbOr+paGJ79Z0eYf8GTpE
	YGv8Qj7/qn+rC9I+9HBTGeA60TOm+Ymp8fIM/65EBfFJFQRr+eNFqwFUaBbZgi4o
	n6w2CZ6FD5SRKB7X4M7V9A3gLRO/urFkPT211lBEW7OYPHuavpmTreeRhMqpmNsq
	OBVhXHkc6fz2eOOWZh6LbRlYRfIy3MmFDX2UTYCufyMe1J+TqDAxvYBXT1zbxlIR
	FFzeWw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8b9k1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:05:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939fc317691so107016085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789977959; x=1790582759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z79Try10M8mBO4B/q2nr1hKgnYNAKB8UXw+vU+u74Rc=;
        b=Dh/OiPRRVGxD7IahTGdAdeU7usnQogrtf7tMjcd1for6PeUlHaM9bBc2l8Jn4I8/bP
         Xa/9ydjnS7jkDaUd0FZq04/Yg0EjJSm7xHloBqEmG3doQgqlWNKI++bv/Utc6sQd2cKL
         mlOkN5WMgUUyTayIOBAudiYwHRUikC3elgwafHcJFxRWU3AFkt7/psHvIO0PkBTTHiR+
         4Aat1zqba9dlndukKIi1WEVhwOAiMmATO2UdWVHfP3SiPCHmCt1PG6QoWkwRMFh9ruCB
         hLvlq2LuhQvHK8PXbJPdpxxYwleqKOuxQD0SFRuuiwdiTmvzIELMjKKOJOzJNuRnCbzI
         +YWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789977959; x=1790582759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z79Try10M8mBO4B/q2nr1hKgnYNAKB8UXw+vU+u74Rc=;
        b=MudcbcsVVlD2dIuo1NjUFQEG8rhcPBi4nJ1bMSggbngE5EWNSA36mz44BAYzU0LSLu
         I2ZtRto1SFavO+JVKIuS63jzMvVZT0M61uvtBdeRGmKMErJAlBLxbxfW7sQ1jshn/rsn
         LT5eoGW+hH8FVNciZZiy1bik3T2DIwISZlV97P2iUO7QH0FBQccWzD5hVMVDSnecfZPs
         u4gcCYNzZEBlnZF31WGswc2wM+gJQnNb+haxhZnig4YpFOAvp6BHUrJfKdvIlsdRLVhE
         xh4Ue1sq8wrN2VVUfvBO0oC9KHhPjcA9F5qllfY/82md1hkht+FzzwsB3iIuCQiuhwfD
         yWSQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7+C+cHmBFRt57AQttJuTnn9g9ZpCSIO5m1H+BgIF/rSrmCTavWKw+lhjnUBNXxuenaXx2RBAqnfyGb6g=@vger.kernel.org
X-Gm-Message-State: AFuF++nb9T3k2GaGVeMv/+7+MuJkeNeTjxgyMj1A9OK+PbjCYdFztLeN
	j2TtxLndTyxb/e/JQuvQx8ca1jmhjjG3duWInlOTk6Kayw88zlXBb3XJ/AfJ+1YWPwYha4NrKwD
	qNrxs12RYK4a+djXB6fRpUpJL7WKRZSwtY3655YZuUaCFYJEZ8SNA8C4lmoKgFgVEuDA=
X-Gm-Gg: AYBFou3GMzlLg/m/3dKi+eiQUjVHOG6vqIqRzn8M1wWlV4FTOPMEDgUceKes8VDj1i1
	FGmAAbsXs/Y0xIDPP8bmw2jtlNADhywsyOj8RE5MOlHZbB077+fJ9woC6LrlpImVP3uzySA0Xjm
	+oRGrVYOj7avf12JifkLJO4WEO4ZpfKTHz32wiGW02UAtjkwsgNIkiPpySmBRB+mNU3Q8FPlhYS
	PkYAmKaaOflJkyrjHKgUOqhvV8+qHpSffoH2IpdkoHMZtSmuYRWFBZRFqeKRTx8E5qQ1pHmpYMm
	dPy0e30JXPQS8TKK3xsBKm/rBOCxPCcFff6k0ppUAP5vLeVw8xn2tM9NAigk2DfpGX6SJmS4AYM
	6dDkMyL17viBhsjaggqH9qA==
X-Received: by 2002:a05:620a:2814:b0:93a:1312:ff19 with SMTP id af79cd13be357-93bf580a3dfmr872922885a.5.1789977958619;
        Mon, 21 Sep 2026 01:05:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2814:b0:93a:1312:ff19 with SMTP id af79cd13be357-93bf580a3dfmr872919385a.5.1789977957968;
        Mon, 21 Sep 2026 01:05:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a640f9ef5sm168057366b.25.2026.09.21.01.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:05:57 -0700 (PDT)
Message-ID: <21b8c9c5-db26-45df-87e3-822db9cd11ea@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 10:05:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535
 interrupt pin
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260920-ifc6560-adv-v1-1-89b1435d00c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920-ifc6560-adv-v1-1-89b1435d00c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfX4uE38MIEq68z
 oWOf4G3ss715mYbCZneVS1BvK7u6voYe1Jr50cEVo7jU/uEUevgfrtzIYPwV9Z2qrMRSd3Hr6ZP
 8iHXfmp33xYR352RscJY39Qu3jJ7wI+93pqfJZBxB24SnxCd6SPDd1+KZze37wEoNhmdxuXjLzK
 6xm7Xlb8VlU+WahaIl/kBS5gK40VtV0QGzcU6zweZfXlNPcVWj+lgej+IUaTcQafzvEb3EYdFuZ
 duW/lH/GkuDQYXYjdqcaYndP5Nn3BCNAgj5A+GCGYOcEQPBV64MjmjM1JEad8v9FMuqnITrAH8C
 cytY9cGQLj6RWcxctxJs62ER4vHbmwwNvHvfglHrYsRGYYdCppvKQyycPUx4p7kkddrLPPB1WtW
 GpUDOjPS3rNyTZual1kzSaLFd8ofUzTZIA2HNpDPK8qax7c+Ja0ECSSZx6kKZHyqisY3MaHUffu
 1hcQfKC7GqnIaIFhMhw==
X-Proofpoint-GUID: 98BwWpq-klylxM8icZ2N8c5iidYMQxZO
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab0e567 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RPWKvmICn8r4TwR_xsAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 98BwWpq-klylxM8icZ2N8c5iidYMQxZO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfX91GJ06OBvMm3
 9Xzw7aZMz4e4WLIL7naIi2oonPKXU6z2qyXudkF3BpdXgTX4iARNCwjygmiSWVkNvAt7xQl4hCw
 sby4fSW4+1NIz8Asmpo6Domo93kplB0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210115

On 9/20/26 1:11 PM, Dmitry Baryshkov wrote:
> Probing the ADV7535 HDMI bridge fails on the IFC6560:
> 
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): unable to lock HW IRQ 10 for IRQ
> 
> The bridge's interrupt line is PM660L GPIO11, but the board never
> configures that pad. pmic_gpio_populate() reads back the state left by
> the bootloader, which is PMIC_GPIO_MODE_DIGITAL_OUTPUT, so
> pmic_gpio_get_direction() reports GPIO_LINE_DIRECTION_OUT and
> gpiochip_lock_as_irq() refuses the line. Requesting the interrupt then
> fails and the bridge does not probe.
> 
> Add a default pinctrl state switching the pad to digital input, applied
> by pinctrl_bind_pins() before the driver requests the interrupt. The
> ADV7535 INT pin is open-drain and pulled up on the board, so leave the
> internal bias disabled.
> 
> Fixes: 34279d6e3f32 ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> index 9e14f53b552e..fdedae49d1d0 100644
> --- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> +++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> @@ -170,6 +170,9 @@ adv7533: hdmi@39 {
>  		interrupt-parent = <&pm660l_gpios>;
>  		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
>  
> +		pinctrl-0 = <&adv7533_int_default>;
> +		pinctrl-names = "default";
> +
>  		clocks = <&rpmcc RPM_SMD_BB_CLK2>;
>  		clock-names = "cec";
>  		/*
> @@ -285,6 +288,16 @@ sw_ctrl_default: sw-ctrl-default-state {
>  	};
>  };
>  
> +&pm660l_gpios {
> +	adv7533_int_default: adv7533-int-default-state {
> +		pins = "gpio11";
> +		function = "normal";
> +
> +		input-enable;

strange \n in the middle

> +		bias-disable;

Plus you'd likely want a PU here, unless there's one onboard

Konrad
