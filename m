Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705100;
	b=ansVFZI4vn6LcJdF14b1IN0Gxrnz2IQTMecI+pggoEkxSWFTMKg/G0IL8egpfAD7H4Es
	 IQzQw8t0M5/SgqkJIKkar7qEp8Z9Q4RpVVz1928bCYSYl4FoQkNr5joU8XSsx0lkYVw1q
	 ExHINOVkO68MsUSC/XGgQA6aiRVDAeMGibzuNb4uvNU9yJyJ6irC8Nre0fVI7It01/7vq
	 /XFx5Z2bTRWNj9J2tOr2D4exiXp3+731nqt9JWyKhMetm59SjmmDp3vldSOUTzEWY6YlY
	 9OgmRZDffI4/xB8UPUk/i25xP0xa97fWp/1Hv+lEhGGTifOWFEVhThjHwohH4oucRSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iGMyTcAe2JPy7lK5xDkMwrISIdWLdzqB9J4ABUaidFI=;
	b=a9mdya+Ucfel1Vscb2s3s8W7EQIK0YhCY4UlAHT8H27vAioY58hWOtnanDuBZgM/YRAn
	 IVg798TAt7R4hwjGOBeldaKWS3OxLPIaOY0/SkCOMDw9qBpazhtLV7jYE8WW1u8g9Ur5q
	 +R/kYH9ic6wNbkuZFAx1xwNUPNNt+cNB0aqEk11HQ08QAtYGppnCYgr98iGtJNJQ9cALv
	 ll8txjqfDCyO0g/ipuy7O+60vjRmZguV5Ap1PDx71el1peIvgf6Pvuol2aZ7APpeUSUlq
	 ostEi9Rr4WhMmuNBg0bDmAL9AKmOgIRTQl5Ui/LHJt7DwQq0oDH/x0ZPz2QoElwY15w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwUTQ+xG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UuJBFhQC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002B5606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 002B5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwUTQ+xG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UuJBFhQC
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAMfM2554811
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 11:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iGMyTcAe2JPy7lK5xDkMwrISIdWLdzqB9J4ABUaidFI=; b=QwUTQ+xG6Mwg3VW6
	5DKhYqOvR4Rc+lwaP7zzeye13XKtbpzK2TyJJc5x5f4hBi6CFwMSl7bWR1S3UrDj
	aAsjvyiGSLw8qw4DEsByU7eUZT55uyDiN120EsZ1+gdFc8yzQSpDPFu1O91SkwKz
	ILEHpdKjsyCYd8ENqmkYxA0SzvqIpTHrgHR3ZlNyh3UqvDe69A/P02E2x8lYcTQu
	izCxscBLt9cFUzhZCqTNG499POX0bEBoqYipqz9FqNpg/i0WkoijsijjizUZRANC
	vck7FSDSPVGplNzZnhHdroETs39nFOykljvOrBCnKNSZzE1wBuSAEeTy7GaKCs5/
	2l0OsA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acjvy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:24:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c8f9f6b49so9769886d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705098; x=1794309898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGMyTcAe2JPy7lK5xDkMwrISIdWLdzqB9J4ABUaidFI=;
        b=UuJBFhQCpIjXXz/StmHCVqqnT6KEsVdpYw3x6EiLNt5WiPOqP03aPy2V8qbfvpJQAx
         C4sdj14jpy0GxlTmfgVAJbEDK7Ly/aEOhObTQdvsmdVDFoJN10qzFJPdz51GF9d3PLEt
         EkbzXk7YVWl519QFNdRIE0N8HsvBM0DfIUuQTCexqGMPzDtF+TooEB2+bsZT1M+gPbtU
         7RX471BnyBG+D1dxGn5KmK+oY+ny2onUoufRwTpxpqRM7hR5QU4uHiXnKU5nmseyKRmE
         LQrEvRFa/6UB7ii8KwnGBFrsKICu/LU+nH79eD5PzKg7rdY3NfQFOKJv69eqeh2UNJwm
         M3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705098; x=1794309898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGMyTcAe2JPy7lK5xDkMwrISIdWLdzqB9J4ABUaidFI=;
        b=pGcAn7pYG48tbfDaDpIAzArvX67+ZkukBgpErDtxHWWPGI6k7Uy6V/ULzz25Y5iS2S
         R4XvSPtzYmBFKHYNMyGRMBUXyJOBkJEQ0MdHvb6LAYSmXvxK2zu/nEGclSIltNg0IOPd
         zPlZ6RtK74cv4Bj4sGikrfGU6aOJNW6+us7kyQaByKCLV3yZyzfGJFbtRbj8pZZbmZe/
         r257BBkvosgp8Mjbe+vKD0du73vQSAv8De/OSxd6Kl6iV0GJ7b5ec7iLgzXuJMg0n4cH
         QiOranUdTiIFC0S3h+X4taxrwfBokptO05QIWPhVgDwuV3VZWycmPtL6Ac8WIJWTOYVN
         y+6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxEUEc/Sxw/q6PpgnZi+y6tSXMj4jS2KAypPLexbLGgDLSsfPoAcOQz+xdgQEfX/ZrMIbl8KNsWpJ4N0ck=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q8ZCj/3n81m/bFmREMDkXVsrkAFbccVMwaY2efODCHj14NJe7
	1kmD3z6q5yCgANchViRg0bFvNqBPUYq0p94YFArmeBxS1krQUqPHslEXAKPyTJuasZ6kifASv3R
	oMD8gU7M+9sstrybvxyYWhHBtCbAvoL6yeeZhfhzHQKehKwV11yXFPv+GfkpvSe60nHUq3u/z0r
	U=
X-Gm-Gg: AYBFou0u6s1/8Hq7ce1SPUzhhsqzzkuhF+c3YkbTl189A4yqMBn2Pw4O2XBP9KshG/d
	3HGTICB1b0+u1okbkQHTpzLSKIi+IK0/MXCiqmobtfhBe2ipVGA5mGQ4Pn8fKjWIi+fVfcmsiNq
	ET5ZxnpXEeS6DNUehKoXtXaD8M4RFJTdZBBTv4fd8z4RCxtEuf7674f6WfG5ZXDax8ry1VfZ5ow
	o22tGl96bsNXrsO0IyKh8JtA5T9D5zv4ibx2VfDuCuhrSEEKc6ZJMjvQ5cOvINCfDGfVfq5unKL
	P2McpefDYR2TY6AMo1k+g2TGFT2NTevRMSkmP1UkgZQcGGKA3a2MNSIqOvgmOH/DF34lpDr96bX
	P2pgsH3EIK8q7WxaZLPizF7dd2c7uy/imXKBzNm7QVlnmCaIg36ol3EWJs/issCXbjEk6lw==
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr1942471985a.4.1793705098412;
        Tue, 03 Nov 2026 03:24:58 -0800 (PST)
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr1942469185a.4.1793705097997;
        Tue, 03 Nov 2026 03:24:57 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebefde4dsm75525666b.39.2026.11.03.03.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:24:56 -0800 (PST)
Message-ID: <7ace2198-61c0-43f9-806b-e97b32b36c18@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:24:54 +0100
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
Subject: Re: [PATCH v2 2/4] drm/msm: Add cleanup help for disabling IFPC
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-3-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102190010.720443-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9c48a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=cWb5AwZ_sP_0w0E8whcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX9Hc/aOBvlSIN
 uZGCu1vn6DZ8ZpcJFy2aoB3gC5hNa8bir8ApCw3mu8sBiI/iPSC5HknVRps0XmTwTKa0PLtki0D
 ZT5MvFOQQCjyE32UNr7uxQP7AfJDjdcWgnVJylODhfOWAeE721xSDGlGV82PXGA6RDz9HK9XoGB
 pUcPuXFPPHwTsF38ZiT4BLlF7XPFkGFQRUaHFtYcOkV4MHTSKb/P5TLpYXj68Mazw1/bNQ5tJRo
 2dX4S0tf1I6dVZrNg6nx6tdyd7xeqYlBgqQIjzlqHy+RHz2lkOphtqFnhwURkJDNMhu8VR0G/6H
 LKHO+FR68rhT7YwaV2hiMzd3vJINvwzrwLJfjjwp04MQtfFA0e+qtEEL1Qy0ZBny/Xr+/KNZIjg
 ITT9WoT1NZ8rmym7d0eXESBxUEcUxk+cMIF9oj2Y3cHEVXTIKAf+4vPv5o66XmY8ZYV9bFFsXC5
 EvviXBtvzhm8nwUcgLQ==
X-Proofpoint-GUID: xWNGbF-eixv7JnAq1D1oddMysCRxp5hJ
X-Proofpoint-ORIG-GUID: xWNGbF-eixv7JnAq1D1oddMysCRxp5hJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX8sql9uEVEgNs
 UHzvQ+Q9NgQvx+KQEUELAzN7N7S0JBmmTcNMWeQNTCpxgsXsvVKKQk2VJqBC+Ex0LvrW0HMJCfL
 VIb4msJrLcDe/n0yYUFD1ecPtSSQbYI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030045

On 11/2/26 8:00 PM, Rob Clark wrote:
> Simplify error path cleanup for IFPC-disable critical sections.
> 
> Note that this moves where we re-enable IFPC until after the
> wake_up_all(), but that is harmless.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
