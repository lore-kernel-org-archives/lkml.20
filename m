Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8352F49E15D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066716; cv=none; b=kXQmsvQDJmdLJ3YqHx+M/nrumFuRtaHoZFhii8aDcVJxpUnjOCQovxTXQd6F3lSZ56E5oy2nHZmK7BiB7w8++DqjsHtw2lQCL7OUwOi29SmU7YXylRCoco+0Su1M0F09LAuYSeTHUBw+IUTxE1VyT5IwEN+9hOYwef+gv+99+pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066716; c=relaxed/simple;
	bh=gR9SYK+WDeFVXkNt1T4kLywYpY8XWbUCAO2xgtd4jk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ArYpf7kCO1IfhxGJgZ216bZCohxOKS62NGHPce3rChJcn1pALi0Y5+/5Oazp1H92pFEGeSRmjmP2ksVF22fRGLirKuFttTv5FyZMp/RH8Fmx4bWDOgCyPQeokY/hiwGYoL2mQ39SzK7Q0aVv2sXKpY/npirV2gtQNEaw/zecT50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AgD3qVXl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgXrsTWK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AgD3qVXl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgXrsTWK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jWI54078195
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2UPlVBw0/Iv7mA+sI8M/ckiI+nWsMDG2rOrmzA6h9hA=; b=AgD3qVXlmKSINkXf
	UaSid7FWWDw1EPV1R1FhJyc6uiWKFmNvIEpfFD5irCsvtpCewyv6EcxkQZwAA6RK
	P+N0z47odSGTLDU8P1gu4b1mpz4W5lwropmLlevmXXgAEz3OwK4eaD5mdx8mR3Xx
	S4doljcLdrHMzQiP+2uPtVr5/5davDDzoCXEOnw3KADcTPl9vgjdKNpCAkFemH+6
	9+q3FV5vGYXkfV2a5r+Lj/j2e9yobxxqwOFsgAglC9Gov6EMg3luwLfUGW81HEJi
	avpgUJyIgBwR+7U3JNT1CS7G4RfYwEkZAidNG0XNAUdfikXdvBwOIMaaD4icBq9h
	iiHTqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc0mxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:18:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f12bb489aso6631485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792066714; x=1792671514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2UPlVBw0/Iv7mA+sI8M/ckiI+nWsMDG2rOrmzA6h9hA=;
        b=XgXrsTWKQJX+ybRM3WC8YoonOCbuz3w/8+rb22THyn2nBAcU+u00gvl66QSv5zvuFU
         gJNZ3EH1QkEwf0GPjS6Ih6E0/rdPBBBC4SWSvRppq1Jtpz44X3kAaRa77l4TLyzNF4bW
         8S79Saspi/Xp1GmSbdSqR/mxk3dopuibhvMs5Qa8Ye2eF1poiVEWCxbx4wCe/WQlzhLY
         pNjhLTe+ry79TXF8xC1MHX6fn0bwbtMvP/FBtR1BjcKuUMTkQnO+jgi8eKPmrm4rZsbU
         ilejQ9KZFp2bsZth74z6k/aCtinaR4QrrOsnD6fnjTJGzTZXhBaUHYL3dAeRgU71RJ2g
         JQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066714; x=1792671514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UPlVBw0/Iv7mA+sI8M/ckiI+nWsMDG2rOrmzA6h9hA=;
        b=xcoaHLr1K+ts1qgVM2y0n4c79xgjTn7EoCQSYS96vBzKTxzUitIEQB70qHhUDeS1Pl
         KY5/P8I4BtwmqmAB0oSPjqY6V2NTgRqknPXqHZoJYTyiSC+Yek9FfV/Cq6ikunsaN2TZ
         uXkn3uImjmJSHCKrdxWKERwOKAgChcTa8D8Yfam6N/+bcxc9EBN+qumr2o9Z2zTTvQt5
         qbM+O0maNlvPjbmzq+ySQAWjrSTNpSYsN1RRm6lo85sKrDYYQ/Um0tlxvWkCT2eYLg3p
         NUd2TyTNVgcDh9qc8rEhHee1j2Nb9uwizhQO4fmZqf0Hnr/J9BMesWD2zEUSl/uzKAnl
         Kk9g==
X-Forwarded-Encrypted: i=1; AKwUvBzTnRrcMxV5nj8mORY7u80dtUdyoUDCrdWt4iuPjXUDN0g9qB48ScU6jB0qPAzz9UuJgbAKn7s39CcWBNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB4/bKj2583gji6Xcs1cfLTgzWoSfx1d2wFr7NlZiG44hqJ+7+
	hsoGcazViI7v48GCb2AQckY0xHg8m7PX++pyI78yF82e6kKuJR1QkaLDyI/RO712/1oUg9Lu1EG
	BcKl7k7naPwZllxyXUZJh2e0/85Yj2vMIFrI+V8Gxq6QmJv6XNuiqLr0O/aWnAXW8GqM=
X-Gm-Gg: AYBFou2OhqAuRjoRXoM4RZYGymjeHOMOr127f10R6WsHI5JEZJx/Q3jZhOCJ647Qfng
	pzNufJnkbtItDgNdBP2etNI6efdPuKqVTLswXfLtTUkHS3Rqj/H6/x624INWaI9Sh9PmAWddjXS
	PUtY4U2x1slsUBctWVmiMmD8ZKAhTFJBjNfIEartf0AGN6tEyI5y6j9M1vM+pF9hjr/cqiXlboE
	tiQckyvyHGXJmhCZikRsvyJNn02EkW9ruKyIAbJVMvTuxuJl9m2MMgA4fbL1ym6VqsamV6asZL7
	KzL6YexF1+FHXOBq3UWGxHaNcJTxcI+TLoRMmcr9u/NA06zM6cV51LGL/3G0PRMatizs16yBBVl
	7xILFazwinHCdo9pUywnJCQ==
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr3658960685a.6.1792066713397;
        Thu, 15 Oct 2026 05:18:33 -0700 (PDT)
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr3658953585a.6.1792066712824;
        Thu, 15 Oct 2026 05:18:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda042e95sm116846666b.52.2026.10.15.05.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:18:30 -0700 (PDT)
Message-ID: <3d00c7d2-026e-4ce8-bda6-bb2d0f3c3123@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:18:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: add missing QUP pinctrl
 states
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260831-sc8280xp-qup-pinctrl-v2-1-a69bbbdb37e8@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831-sc8280xp-qup-pinctrl-v2-1-a69bbbdb37e8@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0c49a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=0e7TjCIZWrtQGaCp0SkA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfXymumlaS/TZE+
 4a2yBgFBerzqjci/Jp6pfxeUxj8Z6khsdP9ZHdS3IZgk+bc1TzOzpOH0bh06pucHu/DYUWic/wu
 rkByH1iHZFakYzCEbw7u/fgG59f4Y4g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX4a1nweKa7qCQ
 JJBbxXXKB+y8V5sYFSUNICLS85CIi4g/j46v67M66jtezDHFPI1B9KZiTMurFU+53pbMVCzbV2W
 6ZLApxVsFXH2kEbk/wtmAqU1/BAesoFOcrtaJtU/qjhZ+AMlS8ZJBM0+0/1qHL15tyvmjBdKL0a
 ZYW01dlaYJq6tO+kouh1ealPyGytHgAjmnk6plC/hzQdLXxwbJr0+LGxBPlroQxEyKp3oczp/WQ
 HxFySGbXjjZgTqDdqOwPbou6uJIfHsKSwGZGpZRdw/FkBGLVXDM0KClbT/fPWh7dhgDVSB6G9cF
 XdaLBiMAA9CMmSBdamJQg5VTFtErNmNaeAW0u24Dt7xnSHw4f+Lr1ji40OQ5LTddBlODsvDWe9w
 icMEmjyEdYLQrGorVKDed7kZ9gCJ1DhuHhzH81rM+6ZP4bxiMk+iaCcgf24rPKJD0zUa+fAH8Hh
 bazHlDQ0WEpNJG1EwCA==
X-Proofpoint-ORIG-GUID: wjeX-c7AsBIqcgMt0Worljo3qK18T87t
X-Proofpoint-GUID: wjeX-c7AsBIqcgMt0Worljo3qK18T87t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150048

On 8/31/26 11:55 AM, Xilin Wu wrote:
> Add the missing tlmm pinctrl states for the SC8280XP QUP engines so common
> I2C, SPI and UART pinmux definitions are available from the SoC dtsi.
> Populate all 24 engines using the SC8280XP lane-to-GPIO mapping, including
> the non-linear QUP instances, and keep the mux function names aligned with
> the driver-supported qup0..qup23 names.

[...]

> +			qup_uart0_default: qup-uart0-default-state {
> +				cts-pins {
> +					pins = "gpio135";
> +					function = "qup0";
> +					bias-bus-hold;
> +				};
> +				rts-pins {

Please keep a \n between each subnode, there's a new tool in town
that will be very grumpy if you don't:

https://lore.kernel.org/linux-arm-msm/cover.1790892852.git.waqar.hameed@axis.com/

https://lore.kernel.org/linux-arm-msm/e869c2bb5005830c9ac1d4bf998696ffc4eed335.1790892852.git.waqar.hameed@axis.com/

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
