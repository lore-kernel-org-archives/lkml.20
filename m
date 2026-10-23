Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746450;
	b=zwwvMjm7rCEz+OQKAHUUuc3V3tt91nWCuDmbAbx9eZaYpKiqaoIbTnLe53VITsNidmaT
	 Touw26GApv+7IGsPrWd/4QeXUgKqv+ma73jjJVr88Xzs4VhtfoFJeRtA8rRaE16Q79p1O
	 baQZLveicLW90D9FPnd38Wi/fZw6cWhWiQSc5uw3RmlHQy0epzXDSDp/L+sjj43/TTT3y
	 8YrtkNhVYPQ5D6aK7GMo0QeHpvP+8woKq1RHmh1RI9kF4/tWvp2GyQy/EsJfPkvb1XLYy
	 OXAA/gMT1e62RtLmqj9cpdeHwmIjJz+odVrt5RFTvZK7ydWblFTIvEpxA5O4OZdyvGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746450;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dqGyeZV3oX3j3YBuq5s/ny+BKNGQxGrSV/QQaPdBNdA=;
	b=TFngMEFfKg2GMRbUngeeSAh05m+mMfGtvB1iBxHl53eKfkLIfAGkANlXnnh5q2l35Uir
	 wQSDyVIcDbzFgl/+jMGmivT8j/h9pJYKTWcO3qipfum9J6WDczp7P6a6b6AHk4Bp3x7/f
	 ChZ5u9OYiiz5iULI/4xISNHNE6AAlwJ4GkigORU2eKM6c48ili2HoI6upiKVlOCcjlKU0
	 p5Vv4RAOizqwBTHVQ0aIdsOptZ/hd0FpSXizwyhn0e8yxG4ZJzKapU52H9F+V9xMrULXG
	 K3E6qtiSpOSxpEe+Eg66AX6y4tn6O3Jj4CcSklq7N0oB6yjSTp7PDCAQBLtOpxrMY3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KY82gwWr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FkkpH780;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F00606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4F00606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KY82gwWr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FkkpH780
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FLcG3167756
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqGyeZV3oX3j3YBuq5s/ny+BKNGQxGrSV/QQaPdBNdA=; b=KY82gwWrd88cyQoO
	N6VlcU0gEPxvfRxtihd6fFVUqe/HVjFBPuj5QU6HCwf4iUSVGmrmoodDM615Fv/L
	5WF5N8yYHJ3QOop8lFziY7+6bQQP68JTtZSiwhEW1ppn2yQNkLNUeyi7xPEqkF6D
	aJYeZK9W0tXW2vYv4rk7a/kLW0QbGepz1AqaX4JoB7b4OQTDjLxNtOAmeXc7ZWDE
	9Q3sVrH/80ogpAiFWvkTc0Ol08FB3G8RqjkNpCWqj91cqcXnVgX6Bu9ICK/M//aY
	czsMLj0lcdJVA9Ff9gi7aygTYcUW411MmtqbYTOPS6JT5MQprgdcav8W7WoQbqES
	OhHC3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpauud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:07:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1440e081so11093285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746443; x=1793351243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqGyeZV3oX3j3YBuq5s/ny+BKNGQxGrSV/QQaPdBNdA=;
        b=FkkpH780nU05h0VcjynCf85HyrJlLBiuS4jNCYBL8MI/P24dINq2qDkZ6gecnqV6ve
         t/+rzliSahc68/Y/T4fot54qIzfR+23nz6LuIa97BT8/dddB1hdaagA2VBMsVC8NPC3M
         kDVd60FItrX4r2uXcbWdqdGExLL3zOwUW+EQRTYCNvlRUYgcGXm0UtLD9CZGjBrrXrei
         LEFYebCXq57ReTh/LGk4iRNIY1E4c12UJiZ3y1xL4ifqcNOR8nhfnUNM0HHtYdaQv3kT
         CZSf8Ic3dByy7HcgiwVMqtmFvPbZA9ufkN6ENxbCzF69gHaEc8u3PgRY5EPkVATdn1im
         SgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746443; x=1793351243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqGyeZV3oX3j3YBuq5s/ny+BKNGQxGrSV/QQaPdBNdA=;
        b=Z+kevs/Qt3bADP59uZRlXLBTjZUB/wZf8msYUewsj6ApZUsbh8aiD6tUlTpJZH0Q/L
         Il9A0iqI7cQbaYYYm0cv8oxGjBilnZmwSuzHfZDjpyxyO15sfaYwOu7q2qANgZEMZjI1
         EBls+iSeVyIQkdT11FQn8Z/TtNkw8EcXrsf78kpsnGevzo4t6mmrHPtOFNYOgN03idWV
         7IwXiaH5GCHFHF0E05RI2vkY2JxSIgO0I1ZQ3LguxsgTUeSYIQnvzvcgUQQ8P56PiJWt
         OrprKacFTQMjRByYhm8USKpqFNQypINH+395d6VtPEaRs0LQIgQURRQRib5oLjFX1jb/
         SuPg==
X-Forwarded-Encrypted: i=1; AKwUvBwACUGwjYRsgtZCpE/SqlnoAs1ZcoKm86Eid1MXql1LOfCDe1DIbIaVfrQqaDI/Awd9tvfHr2TtpecvBoc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDBzPngp5rqoVHoqw3A0Plqb6rNSYBiljSrvFRrpLukA4Sv2xI
	+VOc/vHVDD+a8czf/0zO2Xb2fFtVZiRn9kBZbL1EVLNlpAKq+D9knNrQMZxqOw/zBxBuLWiuTvB
	ryet2i1ZcJP1VLGybTjKrHlkhlnmGYOJuiItszVhLuUmMGK2RQJ/7vMgnfJ6mbgCRRYs=
X-Gm-Gg: AYBFou2xf4lbZDUPDwsbToFDIvYC+xbaY9cklienZbeym7Ud4PCfKcWBm02SkKsW8bm
	YN+4mevPwRTFGlPRIdT6l/vUo4ChUybo/DNPHBmCs23IaZWJJTRHoaV8WYHQS4qMWuRlOKP8AM+
	yhBTwPzxYsf25Wf+IDQimVT4gAg8LczMSn6S0ZUSqXdIgsAi6Qo2B8oJvVvF3EaOZMernnqSmUN
	PPNWycyD1h85kru+p7lo5m2+STr316uhzYnoe2TI0wL1v6RB5/38wveuwIyZD2rQeeV9jzhdfcE
	Nrjg/PmuktLwHsfkBG23VNmxSn4godF8GfOLz9/yQgKw2GRAKjzHTQujBI89mVu6fc/L7/owNLj
	zH++ZGKCliYa3yo466sP9xw==
X-Received: by 2002:ae9:e507:0:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f6fa10fabmr286066785a.5.1792746443079;
        Fri, 23 Oct 2026 02:07:23 -0700 (PDT)
X-Received: by 2002:ae9:e507:0:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f6fa10fabmr286062885a.5.1792746442626;
        Fri, 23 Oct 2026 02:07:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cf09c7sm80166066b.77.2026.10.23.02.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 02:07:21 -0700 (PDT)
Message-ID: <81d21974-9242-4caf-8792-bcd8d59d9191@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 11:07:19 +0200
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
Subject: Re: [PATCH v2 2/4] drm/msm/a6xx: Add a bandwidth table for the Adreno
 620 GMU
To: patches@brar.si, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261023-adreno-a620-v2-0-1d654c3f52d5@brar.si>
 <20261023-adreno-a620-v2-2-1d654c3f52d5@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-adreno-a620-v2-2-1d654c3f52d5@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNiBTYWx0ZWRfX3uLTVVtKhOO9
 Mz4GS0Ijz9J3wh08tGPzm+8Ri5Q8Wx9RfGu/aTFJeL9W7/6Twjmce2L6MaUACHa0Z2kGNdty2L4
 CuXkDKELPjCYb55xJ5DSSjVJy3ID1ng=
X-Proofpoint-GUID: t5NpAjvrWhk1sgiAHXwqbPhVHE6qIrAH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNiBTYWx0ZWRfX1ibmU2316u3N
 0Wox2MfH+WFBDFIHKhDQpUb7+7IhJ37j6YcIdpLJXXQb/m1rQZ8wx76tUwr8+Y1DlzMbD3L/NQm
 1undn1K5ZddXirqPcqMBRxJ1Mxu8X1auxriD6oDrKOCd/2UQG2UskuYcoxWzoWWBGiVBydjuNP3
 uCSl32DuFZhFG8AQMeS1JOn6vl4MKwgEdxvUHknDvYKBDUE2Vco/IKrmkPZpdktVnBnJwyDyaOl
 2Evk5yWxKRipmZ5KlhF0sjUx6eYAWQ+TIsduHRSOfGXBn4B8jp04lgMfRbs0UW8vMNMpxArnKbU
 uZUUpRgkhVahHUc/KyUE1RHfxFPUrw9oF19Bz81Irf/xwx5S13pO7PfwrDtKVTAD9aIpxr819C3
 gTlH3rEsSorRMepzx2MzK4wke2BUrZUhhxFnuPPIsh2btyHYM+97C8gmFGvKjjll3qJEItu1V3V
 vayP18Olo4nDEfHesrg==
X-Proofpoint-ORIG-GUID: t5NpAjvrWhk1sgiAHXwqbPhVHE6qIrAH
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb23cc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=uaad06dfl4CJDRj71lEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230036

On 10/23/26 10:49 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Without an A620 specific table the GMU falls back to the generic A630
> one, whose BCM addresses do not exist on SM7250, and the first GX
> performance vote times out.
> 
> Like the A650 one, send a single "off" entry just to get things running,
> with the BCM addresses looked up in cmd-db. This is only used while the
> GPU OPP table has no bandwidth levels; with them, the table is generated
> from the BCMs listed in the catalog entry. Add adreno_is_a620() for the
> selection.

Please just add the BCMs for your GPU:

.bcms = (const struct a6xx_bcm[]) {
	{ .name = "SH0", .buswidth = 16 },
	{ .name = "MC0", .buswidth = 4 },
	{
		.name = "ACV",
		.fixed = true,
		.perfmode = BIT(3),
	},
	{ /* sentinel */ }
};

You can factor it out since it's common across many a6xx GPUs
and &refer to it from the entry for a620

Konrad
