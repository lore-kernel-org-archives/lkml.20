Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098174;
	b=Y80RXl18zDFz79gS6cs3oiqEiEkx6uNUBkZLG3yxsuRba7qH+RIEuKCkEhn3swn6oh0G
	 SzY+L3NnTvaDbs1XtKjjtV4ekKm1gwjpxLfGpfV9ep7LbumNML+QzpHlp3taSweRQWa1u
	 DNe1J28w2+dXKKqSouG/mxsS9mnw+KkTMcBaTRuWasZbAk825rihZeDQwm0ZHzGRjlFYm
	 ko5AYKA9rwbT7Vn+a7Oie7UsRQmMkCKDdx3VmOKnCofdTw0QZ28/3rqzXCZ41u/pHU9eW
	 Tw992mid2QWndU3gxLe2B8FxA3/LhXLEuecQTrkOfJXmGgSHMBHZrKY//H8ms0qLSgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098174;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k5tGmvbUJ2op+8nhPcyTDEVrgBH/N8qAtJfXgf1NHn4=;
	b=T6t8Hk1NObZm2j7szCPQ3PnS9pKvzhj/u/KWJ0nI6r6ibwJVWLw8ATPDEubz7A6skTTZ
	 X0DKPBNxTC1W6/rlbA6olg/r2bKjbNxQexw5TmdqshfcL1XcN7m5XoK1tLHgoz6yqav6H
	 7SFAMAb+dmKES2lR2H/r867skU8u1TgyfDvkXVfxCmycjdytOtHvLdue2tmrevkrbPuD2
	 brg3+IQj33XRvUiWEimLwBnI4VAu3ntUG76bdkGOChU7AuJl1k8sfpSpfFGPDnHoEOgOD
	 9SfTKLbU/w21q070hKTlggWHhfcuItxp1gRjTHrEcAoiDR8vwDyVT4/5oR+iTMkVE7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0Y8JYGd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KoB7iIMz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D4D606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D4D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0Y8JYGd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KoB7iIMz
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3G5432382
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k5tGmvbUJ2op+8nhPcyTDEVrgBH/N8qAtJfXgf1NHn4=; b=g0Y8JYGd4Gq3paKq
	f2ixC2P0SWWVpBU9vHSGH9+1X5Z9ogQsqsrQdnW/bCs1YL6b07UaTm4ADDZae4d5
	7VgGadjp6T60ugbFKHAhJzDFoutjzc/WCbjqGL+q8apJlsXcAvF8JeWpyUYU7FVr
	KuIoSevxpeKxOXaaKaJvj5UJonbqhSrKL3XEqJscW3t1rFBvcVLrz2IewgbH7GPD
	JCizz23DjD/MDfAigqfL6pNlCvoTKRn91Z3o8QwMXpAh8bMLLjPDxOqEXJIB9SuC
	aB906McLIHrrgxA7/itSyUPEj53We1mgVeOhzwjJzLfo6C93+I945da+RVH4dt1Z
	/XmkVA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54kcwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:49:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536708d1a3eso15637901cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098172; x=1793702972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5tGmvbUJ2op+8nhPcyTDEVrgBH/N8qAtJfXgf1NHn4=;
        b=KoB7iIMzv+LKYWLN7yRyZS5VOvFdIEwHT5p9o4iZoLk7W+mVAIyogLgQ9A6qhssuQL
         3V+PcitsqMzSjp4iyt37f1wSvl8pwkTxXCUYANAFXSckwfxmCda5gh1HywzhbeZnO9rX
         J2FEyzCeDVTStN4+3568P3IWZZbWaKu0YR8ZQP8CBQj4LeptmEY7TxJAFZIE+yUxIatd
         u09GiE8TxFQOszCWxYRJ+nmtniAuo8XSIx2hvK5340CAN0YAFKDRSF/Fhzds0DL4RQJ4
         RQQ2OQpr2kPodebMbRffIPx0VU6gj5JvOKL8xvtZQ/uygVZX0SFRcUJAVqFruZxMWVM7
         YppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098172; x=1793702972;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5tGmvbUJ2op+8nhPcyTDEVrgBH/N8qAtJfXgf1NHn4=;
        b=vxoz/JRE2kWwfqTIS3SyqS/QAnqjHwTSLDamvc4Dix0PSc98DdyKivY9nXuftlAERi
         fjHfemCvtr3DYCwzXzl7maKOM+cdX8aJhnbdHbme0WMaiuoumn/frDc0Ekvl9dPk6Ywf
         w8w7iB0YqJSwAxVJjZ/a2TKAPtpqoF7dEWId7DViUzHspf9FXCPD04EFNFF7Z/LkDRs9
         vbvKKFGCWj8AuqoIYNhr8zSLNVBXnhqKnENCwMI58k672qn7vIsc1FvpWC9TY2iW0mru
         oCj9opmW8YG++L0W/9qpmgweYHHaPdK26rMHXikzifUwI+ECCSCjbnxOr4Kkkh9YungP
         Dhqg==
X-Forwarded-Encrypted: i=1; AKwUvBxVaskhvqKgGUTcVkb1VJFhRKGBz/J3ecX6X9mvs6oOamQT1VesHAU5NnbDrx6hvI+2boE8g6ZPKYiAbwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXvZ+PqAHWSyWKoxMZt/erisP1hLrV+n5zQdAOxhsSTV/PNYyN
	GM57n30cfaAWAQ/wUyYVhrlMmApzellCcxteVCEa8fBVPQDMA/gNaUZutlOZPyESgBhOMjCrjKr
	JELzjl0pFNmbSphq6/VdXbq8PIOMSXinNktQvv0nEQOPdJHYFEenk6fpYO3zYny0KxHI=
X-Gm-Gg: AYBFou1tIYzshS1RyeDrlCkgmHRhqtdZ5eviOXZb1K+qRx7anoXJ7XNLc3YuthRb/tI
	qlsgFgvH36k2/t2RP+wLFq2lNrGm6lK2WxIdNTDZXYjSs36vs5yxHAtoXW54HrLgU4RdG6rUP8r
	YAm9RggONCT+z3NZuJ49z+9OB3HSJAT5SAoo5isgt176xDAf+Sre8gCcy6A+pH1zP62flEOxyXn
	INBdvA74DlR7rTU2hDH1yFeJnQYx25XKo1UD+JCQ0T2q3mNuyyXTI0ze5wXJKD8GFxwkEVnzpXL
	3YeJRWdSq23AcSiDUG1BNq6BUgrmbZTvI2qlYKj8ey3kZOZP/0L/h46fQfbP5k8gXA/7yXG0XSH
	qtgMXoAFSmydwNvraIMinCQ==
X-Received: by 2002:a05:622a:e309:20b0:536:3519:de44 with SMTP id d75a77b69052e-5383b6426e3mr146321961cf.4.1793098172330;
        Tue, 27 Oct 2026 03:49:32 -0700 (PDT)
X-Received: by 2002:a05:622a:e309:20b0:536:3519:de44 with SMTP id d75a77b69052e-5383b6426e3mr146321851cf.4.1793098171923;
        Tue, 27 Oct 2026 03:49:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd77e1e9sm429781566b.67.2026.10.27.03.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:49:31 -0700 (PDT)
Message-ID: <665b6014-f9df-4582-a682-e825dbb1ca4d@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:49:29 +0100
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
To: Jeff Roach <jeff.roach0@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261026154001.9323-1-jeff.roach0@gmail.com>
 <20261026154001.9323-3-jeff.roach0@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026154001.9323-3-jeff.roach0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MiBTYWx0ZWRfXx6Eok+vtjmzI
 1nz/xo2toPgTLlqNwDrnaKCW4EGza+hvMWx9V1LNUHik+j9mRmvbalfP/m4vKrIlwksJmKSV5yJ
 zh3BBNF2bN9AKa9WYNZoOlu3i0ECZ5U=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae081bd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=qQh0c9Rk1agPjm9wVCwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: i80tBHnPebU2xGSmkBsO9G2WeCr5IKbo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MiBTYWx0ZWRfX30lh/b3Ivq0j
 MA6M6hRx8lCEoW5yyBhcyprx/xJsP4z/yTYc2wBwKC/g2t6rrM4+aqVONILN9P6Niu+4F198Iau
 DuUD1TfLyAqI1ca/Xx3dIBMUl/IYZF5dExT2Ygj5KvuH612ob4xu1INtBo5p0J0/JgQ/mCLo/bo
 jxJTrpKs3giq60n/ulsbt7wl8QS7J/j8/jiIt74pYGmxyenq74OwY0N3Zx4ViVebyUl4i0Xrwm9
 BprkT0vRYc3cNEt+L6q3dNvl4gmGORv2x8n/xOT9fsavoGt45yYJC+n6RN8UPt/NWFEdqQdsoVB
 T2Pi5LjydOK+XMxsVqD8PvmE8HvZdhXWserbtedVCHgXuEJUmnn05/H7aAwZjGBoR6/HwqWeD3D
 3IjnsS6uqTUC8H3AIEtYU2Zbq7v8FO5uCW00o1jcBF5XJUZQIQAQQ23Gm2LCMotZBuDEzMf8H1J
 jW9nqYQCiR2uyVqsm1g==
X-Proofpoint-GUID: i80tBHnPebU2xGSmkBsO9G2WeCr5IKbo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270042

On 10/26/26 4:40 PM, Jeff Roach wrote:
> Add a device tree for the HP OmniBook X 16-cp1 laptop, based on the
> Qualcomm Mahua (Snapdragon X2 Elite, 12 cores) SoC.
> 
> Supported and tested:
> - Keyboard, touchpad and touchscreen over I2C HID
> - Lid switch
> - NVMe SSD (PCIe 5)
> - Qualcomm QCC2072 Wi-Fi (PCIe 4, M.2 key E slot)
> - Two USB-C ports with orientation switching, USB PD and battery
>   reporting through pmic-glink
> - USB-A port (usb_2)
> - Webcam on the internal USB 2.0 host
> - eDP OLED panel with DP AUX backlight
> - DisplayPort alt mode on both USB-C ports
> - ADSP and CDSP remoteprocs
> - Two speakers (WSA8845) and two digital microphones
> 
> The GPU is left disabled until Mahua's Adreno X2-85 is supported.
> 
> This device tree was written with the help of an AI coding assistant
> (Claude), starting from glymur-hp-elitebook-x-g2q.dts and the laptop's
> ACPI tables. I reviewed it and tested every feature listed above on the
> laptop.

I hope you asked the agent to go through the regulator settings!

Konrad
