Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8329F411665
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375233; cv=none; b=WiMLhkGapT4+3dxne3bGaim6CQ6lar2w3z6a4qlOWaYXwqFtpnS+ySijWWcMzWxop69pcPNGsK2Wlyi5kgVRCzr9O/cIQCkRvu9dN9W0tT9usOUQZAEDCyFCKuqewcvdSFJRx5AKqiJ+0YPjEogq/de2AO7stvEXJ0NZOeX/CQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375233; c=relaxed/simple;
	bh=eDhH6FH5oGmxehyCqvjpvgqGLqBfZ3YAWWKST44eo/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtLuGw2UDyuIt25ki/6edaAVU3ElBXxoqrf2+XgXPry8zc1mXslO591WnLuy2eEMzB4ldOvfadHn1gVMWRfHEr3j5Lap+5ff9bbizuQqu4rK6qTSfPj8FK5ZbasMn9a3+gbEpXJr7ny+dHX4zwNR2yFx/km+6WBAlDWr98Zq7cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBlVdxtK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEao6r+d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBlVdxtK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEao6r+d"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7SBVl3351863
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amin/Mdn8cRh5whVLqS3TSf1DFvxn1XCy/uV4GsQz8s=; b=aBlVdxtKQY/PTF4R
	QLfH8yeHIKLREEPaF8JV1CaECu/8zgawg0m3q01c+2Go65U+7RJmjk2qG7eTlPdx
	EEKVUYAmS2E9Alt1hJOTFgT4VnZwq+fbRF9mCgHkQeWZW7G9SdZBN2/vsHRGmEka
	wX3jkDq5cs3nf+iU/rKkBex+IfQNSWsz80ac2kUaiJFMH+Fon0rgAS6oONcNQlfD
	EZDxD0WlTO/ObOYvABCNmoTWv65gz0n88O0OGAU6swUhxNV8lcwdTwMV1seSODA0
	HKrV3K0d9RQ3YSZsI7KCboz6A8Hh4MqZKLdquCqdKmj1ldyH1UBoT8J+GeN6TjSl
	30EBTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg08a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:40:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so82118385a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375227; x=1789980027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amin/Mdn8cRh5whVLqS3TSf1DFvxn1XCy/uV4GsQz8s=;
        b=iEao6r+d30atjYnH8cPfH0stf9KIpvvQKD04llVLm9mNzOcKcQEwt9nKgTNEESmtSm
         tLqsRtH4clJawO6KxTUDS6rjR9KiGRKamWc0LXtM64h/3SO44hXAJiVmPItP1X7qV0SH
         hgrQJrnwVVb7SdQl/519NB6S8YWVPTKT2/u6bU+9Gm2ciLLZYN09eSJhE40qdqMtLDWh
         waI971wsFf/SGNBq4LEHbpHbv5XyAxMBRlx3mEYTbpmTB1uTH7Rw5N0aThmfnPw97L5h
         ZsY3mgt0LonMpBpP6z4yPgsMBKNRcJcq7yWMMwTAsG9FPerPGrqghMz29Xa1wRGjdkfb
         wx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375227; x=1789980027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amin/Mdn8cRh5whVLqS3TSf1DFvxn1XCy/uV4GsQz8s=;
        b=Y3ja4BOPs6U67ObN5r3GDCCGnIxK1lfye0qA/HHRk7dOyyBtEETIXC5kbnKGuoN7Oe
         1UmYJiy2KZ4orgtPDinUFnl7Opa7HZzWWyFmB6IxkJrbDmiRsnDpGroT4C0oNa1aWDBd
         k4qrMhHnRb/XmP/6ArRSHY80ddHQSzS6Vh0un3LtDbOdDAmI3nrCEgMqpyaBL3lC1jQh
         5mJyLt3FI0BjgJ2L7P74iDP16hZ8abAOIgBYkQiVlSL0jgKf/W0nAJztEH2tWtVEZdaA
         7kM3hyyPUggfnxuITVhLUl4fz4WrnvEfkejl+nDYxB05/tkkdVpsO2j+RHyIWDL21S77
         up8Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0V4n37QMLHMWqgvRfjQ5tCOcFpWqcZG7cMYq5z5zVmtVed4+OikN/sxRWFW3T0GQYRdyPNoas0hINuZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++l084eZL7SrDLk7bFKSeumyDTrt+6d9Ic3n7jaHq0YjVHCyCXmh
	i5I00B5pkzKKcrf5N73LPiMoGTBEOGIwcol+YIpIP3tDU545QvSiPaaLAZSPThREaL/KGTHOG20
	8lbEovTLadKyQLX0rcLkRqP9n65XaHGQ7f0NXQcQgsp8QnDEhec94vbNoaBWMfnoR7VE=
X-Gm-Gg: AYBFou1Wi0ckieAyaeq1AY3c7sZaTJ8ymL5vUFfAEHbrCEQoUdUp+gIUBTPepSJHe5y
	ChOtho/P9eBfw8XC560VHXPHXeuJFI8w3iGbxGK2PmU6KJRtXL2fV0oUCw9/jjZFLZT7CeL0ZIU
	1WLJ1R8RLrTI1auK3ZZhlKLlNnhnEwSxd9TKZGTizEuSLv7nWYAXn+sYZJS6ciT8f9OqLc03pER
	LZQZxP27IsYaypUtrZg6bxd6AA6XQDFzgPIuXcbBJZHlgap4Z/TpPDKNou3VcXFnMY8pToghqld
	MwyWhQ7bTVl98f575IW2nGe+zDUkQ8/9t9aPPBfptGBoqvnrpmvpm41B7b9R0wGK0prbFXTrT6x
	7U2fR3xcNo0nTO8JHcEwA0A==
X-Received: by 2002:a05:620a:ac09:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93a2bc868d2mr134061385a.1.1789375226905;
        Mon, 14 Sep 2026 01:40:26 -0700 (PDT)
X-Received: by 2002:a05:620a:ac09:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93a2bc868d2mr134059785a.1.1789375226498;
        Mon, 14 Sep 2026 01:40:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296613ae93sm384411866b.58.2026.09.14.01.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:40:25 -0700 (PDT)
Message-ID: <0f46fed5-57d5-4b54-9740-c7415a03fb78@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:40:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8917-xiaomi-wingtech: enable flash
 LED
To: Martin <hemisputnik@proton.me>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "konradybcio@kernel.org" <konradybcio@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260912134056.3347741-1-hemisputnik@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912134056.3347741-1-hemisputnik@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7b2fb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=4HIykC1xQpmIHoiGnS4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 4c-AcRUWRC9cnP9PyDBbActfiopfV5cA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX5h96l7rdNTyv
 DQeInEyvoRRBStNWzFgTs77zvE8jrH8dxDB26sgtzEv2zeTa2bNTUa+uhgxmM0/OhbOh3nd/x+I
 Dx035GhSEgBVJN7HeKQ6gCUzVppY2NE=
X-Proofpoint-GUID: 4c-AcRUWRC9cnP9PyDBbActfiopfV5cA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX34Hty3+QVFqP
 10CO4Y4gNwDbjmrnOvSKks+rLyzdTb2fMPOlMFxGqA2glM41W4DFP8EpIPEKTD8P3is8sYuwpih
 bioDtrVWIUWMu9aKEe/3H4wcAZ3+z3lOmr+uq66UFJm8svouzJXOFKQvYHRouxZikpDKQyxpUeC
 6njFBsFg6n+ApFXRfgdN0DmB3iWIRmxEvQvDte9o+9q4jEACQTjfY8ZQOLk/r/KZSnl8ccfyVWi
 7+tbCNw3NvfHyTXYVV02g9kpYpWSA8ilZ3H/f28rtTbt8wqJpZp5fbTOvrXlqFQacNtDeU1ZNDv
 lqJEH1XZRzKdS7lVXFyotddo1j+znoMxUDijX2C+Z79l5INGl8zTD0MiHPVdU2CNrQnnEjQDD0L
 enAU0BrhJGPcofbVElbTo+ksKByysQQk2MQz8rJMbdYOkQmOX7s9FsKrNBLq0l25iW05Yh+9zIL
 CV87yVzhLWZlQX3628A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140121

On 9/12/26 3:41 PM, Martin wrote:
> From: hemisputnik <hemisputnik@proton.me>
> 
> Add SGM3780 flash LED controller to msm8917-xiaomi-wingtech device tree.

[...]

> +	flash-led-controller {

Please sort this entry alphabetically vs other nodes in the same scope

> +		compatible = "sgmicro,sgm3780", "sgmicro,sgm3140";
> +		enable-gpios = <&tlmm 93 GPIO_ACTIVE_HIGH>;
> +		flash-gpios = <&tlmm 90 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&flash_led_default>;
> +		pinctrl-names = "default";
> +
> +		led {
> +			function = LED_FUNCTION_FLASH;
> +			color = <LED_COLOR_ID_WHITE>;
> +		};
> +	};
> +
>  	chosen {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -306,6 +321,14 @@ tsp_int_rst_default: tsp-int-rst-default-state {
>  		drive-strength = <8>;
>  		bias-pull-up;
>  	};
> +
> +	flash_led_default: flash-led-default-state {
> +		pins = "gpio90", "gpio93";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;

This essentially says "by default, if the OS doesn't do anything
with these pins via drivers, I want the flash to shine", which I
believe is rather undesirable.. let's drop the `output-high` line

Konrad
