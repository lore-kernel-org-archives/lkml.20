Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486570;
	b=4tByEmeMLFVDZRb1zgiQgZDME8KJKQpIRozksYXJEVJfHg37SlwUMyg4U/q0vyWDqfyS
	 9V7IdaLM7dGiWBD3l4XH6JWuKdFm8ifIzSCtZH6XoRU5TYV9IL1ZS4nJ6K6G97HuZm2Qk
	 Ogw2ND+ZmJK5ycmdZwhdZ/1ubpC9TlVIqFpgzGG1BfgWHpjwKy+JCfn+6XSzN60rGYNKd
	 Vv/uNPuyWbIrcsxQwW9spd/DLt05ePNNU+M/n94j1heKnfC5iT/FE3dl9Mj+MKl/eZvtj
	 XZ664dzcrONXVk4sqYLAU58LWljKzFp1Mn3tFUX5dxD9Uw4d3DAKURWoT5FCf/KpcfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BR1IwiAnPDQuLNombG0qRfBEZEt9D0S3/JVBy9369T0=;
	b=GuwQqlFtrSf9ObsmYq50g0B+xMvV10AwGsHus2bMg/Gt/EX4nAnH062W4uijrN8BIuMr
	 E1bxSFZtnf9b9IPIX5zrTgPJ3L8+cNTWiusjN6LAzwZ0mrm4Edatte/jawrTw9nE5HYYR
	 fX2CFBTawrYGdh72NyHALrLisDTT7H9Iv/OeB/cuy/4LNV35/T6yUeA0/EpET4hU0V8Hq
	 PUG2X7MLn0qyoeAvQTlfhkA3CcUcOhTmIRz79j+oGWmQoHVqMkW7qHOZO8XRZVY3ixQx4
	 +y+gs64jN1/C/oN/XQeiDy/KoEyWmWFn4Ud3wV2AEGG4d7OyViH9dKmG0rJ+GzDWklg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lo5VQHS7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R+PcTHbT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8DE606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E8DE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lo5VQHS7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R+PcTHbT
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8a9eq2877957
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BR1IwiAnPDQuLNombG0qRfBEZEt9D0S3/JVBy9369T0=; b=Lo5VQHS70Mh5HY8s
	Y/wjJAyjJOogyBWSRcFAyz6KvtlqhUbvg+LBH9HXG1blFEMCv8OWoOpQwMbBnQLP
	x7BBD4x8SSucQtiQHkTDnmm849QqM2M72XhOiymGaCzOHnQHyztCFNzUjGprdRMi
	lB9TDDI34c+jdpCsV5vvbqDSnSQe6Gf/aLjbibe5Crn77SqqPvn4i3gyw3QJXqP3
	/iTIsbIUeDOjGA9hZgjU7nI0kHHhtvF5bMicu2CzGn9AlZXAUWw+kdA/orai2QZS
	tgvwDZL/yac0PVSJA99MxQkhSaNzC+B3sBV8wjxNRncGKJryOk768qdy9R4Qsn/f
	TxVX2Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5psr28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:56:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179ef12a03so14148646d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792486568; x=1793091368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BR1IwiAnPDQuLNombG0qRfBEZEt9D0S3/JVBy9369T0=;
        b=R+PcTHbTxTNLUxec47Sld5QsqUInnIjF2D+RmI7IYZDYlSWnXdrt/pTdq8RA9WEYJM
         jSqPidYaipzfsx9eZTNAHHvEU4zcETNmW80fXRAdMp79bibOcblJUGE3ociqKip29+/T
         6UgvbBhFYYqvRvqn9xqw6N8OyrGJxxUBrws3gQ55ZnuuHH7cCbXs5R/X/BdbqnG3/LtZ
         y/Ze45Ed5DQY/KkNz6CMMp4L4vOm9FL2oTaNwNd+pxqRJfWTUFD691FVYhhay0WBHNOH
         n/9e69qBqKn+36U+ec64J5/85k7/4vzQbXKDWlQQA5/mIQMptchD+sCYjG1li5QdDvz+
         4nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486568; x=1793091368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BR1IwiAnPDQuLNombG0qRfBEZEt9D0S3/JVBy9369T0=;
        b=dcZJZ9KDqotrZg1VlIs1bwqTWPCrAOLR2EVHBp8degGgUSfAsdSam1wkU70bvFXoCp
         IwFwRs35lxMl+ohS/srfu5rlAJWs+O2lHVwsKC5c3tiGrxIEgLsxqa5X9JjGwWGz38jc
         ehyVPNVBuawIaBNxU6dozpBQRyqKio5fQTEXgGjd2ae90EfCL/FjcN4fG4z1oLuVQVMl
         h1E+AyS9ZGf2GW5zWBCFPTjfM8WHkPScYGGdd+EJXKw4oNYYI8fJv/Lr/FIoZSY5JB+C
         XKUH1g15OnZ6Jqsb7zUH9GFdEJWBtqYC6MXJCBHbiDFky/yLlcQZ9n0sA+1pQ8+1q0zu
         2ByA==
X-Forwarded-Encrypted: i=1; AKwUvByQbtW77lljzsttrzYg6nc2Cink30O7lCxXkwBA+vabkGg7XuyZ8O6BCOGhap4n+8Ob/d1g3t8nbYhNt3s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvZkF4Y+J/NLqPUywV4nxtJwOseY3ELMvq5FXN5aOZJJVJVCww
	TUrr/QMV4EKUzs8kXxrrCXj7Z8joo0zBFtg/SZY2n8OwCE/iYDUWkJYt0wo5+QE2QlqA9s5CkRc
	xcxDwe+Er7+inEHBktmw3/Ppm7GXKK+vOpiLb5z/gBHZon1X78aDNIyITwmkP1/vIDYM=
X-Gm-Gg: AYBFou1tpv5HyBNjPLbIXSU8+Ir1AcoETnj8z+0upMcKZT01v+2P+vvXognNBo11j85
	Macf7zbvRTT2CD8GFvq05EK79qQ2oRlJXU/ffn1Ilq4BEm66ZAojFsGZAXcmxePoihwLOnu0CmU
	y8NMxervBcX+Wc9gh5U2NDPelj6tKmapkG8MIXZ68+GwAKMUiJcb5f2lHLkEsS5SmeIOs6bY4T4
	DdNUrqiHxUaAeMn/tvaxGLgmRvgxyv2Vc6YKHYntpOkAVO7zi2LsZ1iTEQzwTKduazxDABtSW/y
	HNKflL/HLAZBRgwqRPuC2gZwFzvJTk4QXs0wLhxrjlS7QnDalfTckwsRsWa0BEyEGGJ4HPi8F71
	paIn7J+mgDkqNj1vaexZFSQ==
X-Received: by 2002:ac8:598d:0:b0:536:79aa:de1b with SMTP id d75a77b69052e-53679aae196mr67975851cf.4.1792486567655;
        Tue, 20 Oct 2026 01:56:07 -0700 (PDT)
X-Received: by 2002:ac8:598d:0:b0:536:79aa:de1b with SMTP id d75a77b69052e-53679aae196mr67975511cf.4.1792486567117;
        Tue, 20 Oct 2026 01:56:07 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bd6besm458394566b.56.2026.10.20.01.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:56:06 -0700 (PDT)
Message-ID: <58297c07-c94a-4a02-aecb-e0807c432a51@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:56:04 +0200
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
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sda660-inforce-ifc6560: fix
 ADV7535 interrupt parent
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020-ifc6560-adv-v3-0-5da1a33fdcbd@oss.qualcomm.com>
 <20261020-ifc6560-adv-v3-1-5da1a33fdcbd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-ifc6560-adv-v3-1-5da1a33fdcbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad72ca8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gQ1mbmYKsGZDk89HBR4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX7yeHBJRtM6wN
 tMxBZ+SM2XW8RH937BgnJksCiDHAXCMPTfgA7PlFKj8A0L82DjV2C4IwxGIysCV11hTgyrv9g/5
 N/De99v0pp8MnaaGjnjA4ovyZ9ypBkbRH0moXAQFFPNIa+NJhKkEoIFSQYOLFUIH9X3tpdHaH+5
 5ED4KoqKn1cVAUMSSNL64Gsn4fU4riFTYfXO9uQIM9jIDemjrl6bz/5l1AeU2OhOCSVevparKf+
 JhvRd5lrAwZnXxSDT2voqNsdDVzkt2dWmzea+8AWXu2qXevFpyPgPhhFOxJe3BXSxwFV8FphRd/
 ax/+NAqTO/LWh7wrHnLlLE6VgDTXdf62BshA0So+pZZ/2dZkpe3tzoOp93dsqmuL1m1QmVnA4F8
 iKr+iIY9V6Ydq0W85Bmb2wPyoCJMUuhwS+hYvtWdwt0CJEzjNICyz8L7p5WFya93ixhe8l9tGIP
 ycrFmKZGAbL7t9oqiQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX1aNdJkeBSdWq
 psMJQgQEdV8apjUTbrO2FAluI2pWvN9/CPyfWSIcEAdnfXs9cRsCC3Ob9xlXc4SnGrxTSsn9tMC
 yq9KR0FoIab0XUdql1bm2NrFnkfnhMQ=
X-Proofpoint-GUID: kKWDKwznMZXvxqY-xcmbaw2mtxxCJiCM
X-Proofpoint-ORIG-GUID: kKWDKwznMZXvxqY-xcmbaw2mtxxCJiCM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200035

On 10/20/26 10:44 AM, Dmitry Baryshkov wrote:
> Probing the ADV7535 HDMI bridge fails on the IFC6560:
> 
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): unable to lock HW IRQ 10 for IRQ
> 
> The bridge's interrupt line, HDMI_INT_N, is wired to GPIO11 of the PM660,
> not of the PM660L. PM660L GPIO11 is LPKs_CTRL, an output which the
> bootloader drives high, so gpiochip_lock_as_irq() refuses to turn it
> into an interrupt and requesting the interrupt fails.
> 
> Point the interrupt at the PM660 GPIO.
> 
> Fixes: 34279d6e3f32 ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
