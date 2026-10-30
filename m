Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364806;
	b=Pk4EmFmg1GogCCWZh8YgINRsTiGI4MjM8En/kxJ/Zv2NxdRXqX1FmzD8WVsWu0nz7Y4l
	 cd1W2Y4kmCtUgTGu4gtsus5Ev+muY0+HIkvQOUxpQxgBbRV6onRFkhTf3hl0NySSe4FzT
	 ICyHussAzMyGkORvjdSnJ9ZiZAj3MzpLhAT593VX2UqyObyN/eJuwBa0G9CadEZrDNI3t
	 z0vPjP/xKZuSoNSo5y4b1vvcmrB7lV6r4d9fSc7OxRlcPa5tISFpnR0tJ6EPtlufylBh+
	 c2wZpXB6qnMRUdAH46IrKjZfUPNWLF59c8ueUPmc3pWZvuA1SnJH99QpYm+a/A2Wg7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g+dtRrOqxcIMInZ6Na2UXxrAIiwdWRlYssjy62GnXog=;
	b=t+zC/1ceXDRggB6sVv1CTHGFOtts8PfZMiLVD4grrFqwcA7YjPyyrvZGiuV2nfcTXrfp
	 rUypCfNrwd0psPTAnWP4jJ9HP0qDmbTZLMVHqTb2SNeuO+sSCJ2fzpCULjwUClWseQesf
	 PmWDRSlr+u2BS9yYq53jov0XzIvOEfmOoKwJGUL88jDoWAfaXZaSC0PsxX3jjE+sNJwp5
	 0xaLWhjVjwSoVturXgVz1uunQrFgJbu3Zbn7QumypOM5DEbrzA4kY+SVSDgq0KF8Ckt/F
	 hELvmXQqseyRux2l5L3X2OV8raWJoq5CR5Fv1Csh/zxZxxlddGUtxrR1y7bP8hvfyAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QHLg8D2R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K3blMq+d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9600606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9600606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QHLg8D2R;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K3blMq+d
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG8bB3719522
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+dtRrOqxcIMInZ6Na2UXxrAIiwdWRlYssjy62GnXog=; b=QHLg8D2RjXAaou0v
	R1IjeLGQW/bJr9wx7PDHnJoz6QxHcuu+OSaPeqhnUuwDgqUJhjj838LUGt+xTG3V
	zXJDARApLPB6FiSZL5aVY8guaoypz00b20wpF7AeyirK+iehxUv+BfZc9npuZlGk
	RXN1rraLVUIUbonQfOPBfJGfbS1cC+kUlg/sqzGsR3lgCtjBHz92iJAX+jHQWghg
	6/6jCnqmvXIPNDoDf6TbIEnwlSOCnxnziEImiqXjODaMw4zIAghEjzXEWDqbyzt+
	LzqT989BVDhaDJ4JIBEBcs2ArQklEBOrZDxkR9z30HiZu/FeKWBlou7zMw3ey+iT
	kNU3EA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qu2f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:53:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944102381acso14981985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364804; x=1793969604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+dtRrOqxcIMInZ6Na2UXxrAIiwdWRlYssjy62GnXog=;
        b=K3blMq+d1BLeWDJN+pm0IaVzxw/NLpSXOhROOsj7YNHsC72hR2NbzRcIimwlsisMbY
         Z2ukZjUDp2GI7qzvMz52d77QPJlzmkNJKLWzhu8QpQYEpO00+qTfHiniZmF/Ofl72LWs
         4Me8AOBGSG5oz88WdAFOPYwYkCdF9USKb/g6wmYGXnu19r7t+eojeI1W+XbxjqTA4j3d
         94++/wixPxqZ1hCqMAk58dFv5XMKxi15bVvqSe4ul5byaDRwxYqJ+ZQh1igO/fqkbPA4
         CB0+XcwqrE+qRERJp1veUJPXzbTCVs42RqP0hiy2I2Re7j9StB9rwX0KlkzL17ko6hP0
         BUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364804; x=1793969604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+dtRrOqxcIMInZ6Na2UXxrAIiwdWRlYssjy62GnXog=;
        b=Ov4h1y2TGOft2ZJA+y+qQU4lKdWQtyVhLgCZLLYloHZMVZ2CgRai+gaqaWAd3p27sb
         wk/N9bdxzUZgxX2o+cRcLe7PGeuSXAIMkzmLEODgZtbpfL26eGtANsEZMk3vS1s1R/5D
         l16zR/ptrrGnDt/9x62ARGT8K/ILBDfcswcxHLhCNkLv6fJhADIYI7AV2Vwz0A5JimXv
         XvgAm3imzbrOIs6XlyqLuge+KWVC8Ld6BpQFOQkz4e8YAiIbUZQCYswWybTp3MRbfGa2
         OS27wjqc0czjfnhk8dtmbpGVqH1KLVUO4wnG2acAaFFTWce9LwraolAaUGXMGUlF+pCH
         le2w==
X-Forwarded-Encrypted: i=1; AKwUvBxICC+M5yUBK1Hz34Coz+YXu9Ub8oiq4xOc72VZMeG55oL/+0Xita0+vPeyWeF7T06aqzQrBZO83UN/xow=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJE5NdO41xZ271RiMlq/rpxhNWYWCIE4y0rfXbsrIjYvbO91Aj
	ZYVIJMYOPTy43yxA3b440yGyq9Fq8KnGCoRL8yhFNwPiRDuOkONKhjJFqq6hxskFJl4PH+9/5zK
	cro/EGbsPMaOShl3SGKyOC7A8ZWWEhnDPEzy8dhB5Aafi5S5hW4/1Ulwfqc9IAglZUsw=
X-Gm-Gg: AYBFou3kqnIayC83jLusXBborGSlLAaoHKpGLYP01sUmhupd4YMVuZz0w4SSqEnHPnw
	o3fu3d08w/7kwIAIWmFEvMzIAMMyS27lw4KvlvEJkKuos4AOKSayer2cluFF7WreY95gu9k1Un9
	pKjg0A2tVO5uMLhR77mOqMKE0zMQdhXELvumBw3n/TOA5v/j9Bq8ICBEDoHC6X3/jkp2/W870nW
	mQuyaoxAhZ10jYtvBRJKaSZ7025ZS1FNllLw5PpZEeilYIeypxF0PlQ4T+b8B/mhy9dj/NXTlE+
	f3tIelyK/pKAHSlH09WgJ1+vulJT9pxiHGMuQmCTFhLLcPgqbGPA4L/g9f4IxlDSvFRU3bJG6XX
	sY9VzwyOBUJcuMRoi9nwTZFHChf3z9d0tWALqeaJ1vU1d9IiZXaQ8myXSC8InitBE/9N8QEQ=
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr372318685a.1.1793364804315;
        Fri, 30 Oct 2026 05:53:24 -0700 (PDT)
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr372314285a.1.1793364803770;
        Fri, 30 Oct 2026 05:53:23 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd249sm63470066b.20.2026.10.30.05.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:53:22 -0700 (PDT)
Message-ID: <cbb0c355-7401-4edb-b67c-00976e1a3763@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:53:20 +0100
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
Subject: Re: [PATCH 2/5] arm64: dts: qcom: milos-nothing-asteroids: Enable
 Bluetooth
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-2-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-2-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gJSBnDbziUOluP5vXjLiNFVV0MB65NUZ
X-Proofpoint-ORIG-GUID: gJSBnDbziUOluP5vXjLiNFVV0MB65NUZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX9AnJ+Fy24MvB
 qQEMa9ivx5jUqGOGXIQ0x02thcOGp6o8864CVKt8Z7fMaeNlba59+uXAvFgaScm1Ke+cKhbTcwW
 sm7sYd7xZ3eGMxBDiBr3rN8XI1WWwvyPhVHeLCWrYE/Z1sNW3S72wqlBDjF/EyNkXXawqd7BJET
 vi5ROQDbFM74baT07OE7DyEtsk2wSKefmFnMn+2vfKLyzv+MJhpN3Di/qKCKurPWhmWD3NI5dJw
 nyonvCvmCEkhLqRDqFcKFLZTCGjihXxvX1W4+vbShAkLB7lSowcLAwOZgrknrEXrr/8KDKiv/cj
 ryzCwQhSGI5U8el7JCamWdQlw6OWVcYy0Ov9DiPFd+zmMZJPUkmM9lDRKLO8ilqAhthmuLc1lWc
 OQX7TA/9AkynxSviKOx6/1Hy8GkCcUkVHCCKYvDI6XG0V3lfgnH5esmcGoT2DctjQkbFcvr/8l/
 mo8Q8FN5TpvkTpiPRzA==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae49344 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Q61tBkWn-twudPVU9zMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX20MVKz50u6HA
 VZARWDg09OLdIPygsQqTc+r1CbFfu1541mnozmDwQtbeIKeViooqjjwLcIr0j6bcbnbJacUbTbl
 vfkVypaFqRCyMxg6vNQ4Ku4FUmAF2x8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/29/26 11:33 PM, Alexander Koskovich wrote:
> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
> parts.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

[...]

> +&pmr735b_gpios {
> +	s1j_enable_default: s1j-enable-default-state {
> +		pins = "gpio1";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		power-source = <0>;
> +		bias-disable;
> +		output-low;

The consuming driver takes care of the output state

[...]

> +	bluetooth_enable_default: bluetooth-enable-default-state {
> +		pins = "gpio53";
> +		function = "gpio";
> +		output-low;
> +		bias-disable;

Similarly here

> +	};
> +
>  	assist_default: assist-default-state {
>  		pins = "gpio71";
>  		function = "gpio";
> @@ -905,6 +1079,32 @@ &uart5 {
>  	status = "okay";
>  };
>  
> +&uart11 {
> +	/delete-property/ interrupts;
> +	interrupts-extended = <&intc GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>,
> +			      <&tlmm 51 IRQ_TYPE_EDGE_FALLING>;
> +
> +	pinctrl-1 = <&qup_uart11_sleep_cts>,
> +		     <&qup_uart11_sleep_rts>,
> +		     <&qup_uart11_sleep_tx>,
> +		     <&qup_uart11_sleep_rx>;

Please align the '<'s

Konrad
