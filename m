Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795698;
	b=G4SKJWUpTHTVWtacMqM4FOFylaChKby6bj591Doq5HY6E6bYWbeCATVy2mXCtfIkl0WW
	 laNXgAeveBgP48DeY5TIYGjeGL81cR7c8gnLjt5aKxuvL6Q9+NGRrTng0cqvXCgNywz+E
	 WQ4xRFmQ1Lxv3JV+CWPxKY5aOMoIqSH5APuLGSrBQCesFWjftz1CPhCak8Lhu+yR3MlL+
	 IrSsYg4pt9+1jmaZ/F5/JOQ8at5rdBb5oLO2MWls8Tu+Z5rD8BNQxgjBEMGFAnqddxmmp
	 yMQsaqG0WlCgot1wm/DDqEVSYJ9mm9VVstXZd9ZVhDov/S8bIZnwqiqpsYTNdA0PMKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795698;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=;
	b=TnThdgl61CS6pi1U66/EsnN+2oEfZ9t3uzO90cJq4TcR71j7hqqPFKY05mFBVJdE/E3J
	 ba2rykmx6ZSJVHNAlTy85d0Fqrf5J89XZ+vt47cTB6gw/eJ2o+J0d3qqSaEiyzhXBCaKL
	 f+9zq48ZmuI7HNVPBSfat8pS07W8zjovn2UJ4lKQLjcA2nC0MXksxkiEkMc2WXWrx86k9
	 QxVK2wnFtBTyd+lmqNglfTUcmCiZSFv0eXcsDBsr2CxOO7tn8cvo5Hcn+v6X69Kd1tlnW
	 pEsAphVyQc03Qnb79/ADqu4GUPwvnP84O4qrq/PqhPw6m2Roloo3fz0hJFbkzneXArA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pOfqafgI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dpGhNB/x";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA289606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA289606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pOfqafgI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpGhNB/x
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba1mP739317
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 12:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=; b=pOfqafgIiyQ3bF1F
	wCGdEsEymDm2DhPxE86PtdcXoDmoWAokBuaB+EABu0eo7mt50FqVGPRqsTkHmgxn
	h66k/NByR5wpJeHuR7omk7Gdp+cUFNDikpZc2tmnTdbTH9GggWJO2n+Pd39qRvXf
	sc5te/+SfEZihjhJElibGAhEjxJCz5P8SfKBSc85bG+DnxIHgrMfWbbRZGloG2Hi
	s4bNDBAFsJoQf8qgcuU1CuRq2a/UxdsE2wBFL+cKkIUg/PWzjqE543GAy3BQnrh+
	MwLyEeMDsJcfk07SDFx3sjeyORqaWjK4ni3lxqj5y4CPYWTsJ5yBmLciC6tJtFVK
	zrV7YA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163h0be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:34:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaf3f829b3so6077615ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795696; x=1794400496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=;
        b=dpGhNB/xfvSW4grebQtPj/ZQrkIen78I8JiGV92g/WX/oMcACV1GJ9fl965nHnQTp0
         JyN4/Qd3sNHUKhnboVUUZCQ7rehlIIwRLw9C6h9loCM+zCDRPmyJN2GU0Yl/L3Wxzkim
         EzPQnMw0xDB8OTYSkycL2PDelqiJOK8TJCrQrLWZv+24dYIoZzqaS8qKSWsvDMxSsRsR
         u/l/L2kRszEwQBNPcSJHNX+dtTp0I2ySbMo4Jpou8v2+E9oRJ2XF9xXYZEFFZgS2Fzih
         kUukyKBVwtlAYe7Mqs1BF/0mGCRc2Smw9t9X5c6MgvU2QMTgNn09/NNr3fdQGlI3mrrz
         eMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795696; x=1794400496;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sds1MGBA7G+Tt49HG3Xil58EHIRS9PXgqNLiElDB5ps=;
        b=igJL6LiISG6uQW2bAwDsGR7mkhIBqk6gQSpMsYoaxBKqM7HffqQce91xBlhRf/amMd
         1jW3DmrsKy6RIccBa9T3RV1ThChHMsaAc0V3fV+F1H6VWMzmiE2WpvYBeAJ1uR3ntqeo
         hjNGlrmY8Q2oxvBrKLXkGmtWD+BO/6LzzQS1JdO7dHvxhieuICyl70YfG4vpcFmr4u9X
         ZnW4vFoC5J3u6ehJHv36/sUt2KuWIdZ9TTdAOZrxC3GBaLaF5UjeMR7zRDhc/xY2qvfL
         Jti46VQa9BVvY8/N8kCjtfwO54mCHH2R+AIy/Z8N38MXEcn79HUsJx3+IjcDca4EUx7K
         xOsg==
X-Forwarded-Encrypted: i=1; AKwUvBwR9QUEK9i6R5p+d9exx3BsdI5U8S0MrB2rjRxVEJZZELUbAT19zShSiHwBIFP6+Vli4YBSo3qarBDe2cg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T3c17Xg6umzkv+6rf+iJd1nA6NsO/PJgxE32IrkAEmyX880dn
	Omcv9avKmNQdyiDqScKJhFNLk+splz+rj4uEfOGu78Kn9oOtdoJzAvSrsiRbP2vlShXxCIuEMXW
	graKDXkf1AD/743rPpkFs/XYvAC+KJO9OI/ECtL2+PQx85JGEGq0WJQ2TCY+Vo5wjLqg=
X-Gm-Gg: AYBFou0t0t7NeejAxyewgW+5vV4HQhRBfrj4831ztsWu6cMo2kvTp6MuYowsYGcwGIE
	RUypX0tVqorCRW+oW6XZIsip/A2d21Km5vEgF3Y9o2h0N7D4NqSJb2Jb7cgo1UachCKH19DFQN7
	Sfe5K/ihwXDD3M6ZoYF4COeSZbGnlMcpjDMbt7dvfJP6HfNRFaySEaLmMiknwhO9s90C1aCLODL
	/G2jSlGxH75Abupy2/YgjeAnQGajVv/W4gxb2hJtQVhCPcRwB5y1cPmr9LJfzGfOy/9lb728lhH
	sSA9d42/VQrL1E/IzE9GqApWuHIz65cqo4XvIS8Nbd8WmwLiKkvTtpVpEBwT1ZibZ7NXNtd0pIQ
	SHPHrdwnVaLoo+oeKrrAyQtnLzbZFsiQ51nxXQDvGqsog0NbBm+rIJGph44L5UBDAf1gsrHR/1a
	GaLL4kPQ==
X-Received: by 2002:a17:902:ec8d:b0:2e2:ffcb:87a9 with SMTP id d9443c01a7336-2eb3642fe66mr137002335ad.24.1793795696210;
        Wed, 04 Nov 2026 04:34:56 -0800 (PST)
X-Received: by 2002:a17:902:ec8d:b0:2e2:ffcb:87a9 with SMTP id d9443c01a7336-2eb3642fe66mr137002075ad.24.1793795695582;
        Wed, 04 Nov 2026 04:34:55 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e6asm7038525ad.22.2026.11.04.04.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:34:54 -0800 (PST)
Message-ID: <0face2f0-deaa-4a3b-9e81-de68f206d2d0@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:04:48 +0530
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
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
 <3a5ff85c-0629-493e-baa7-543958764219@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <3a5ff85c-0629-493e-baa7-543958764219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tebUgZIEn3JWd8BY1HaPPUCuqYUbQd0y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfXyflvQOuQaKPY
 mcpGxR9hhi0cIa7l+jyU4F+Om/7JXuxn+z+AGr/sjotB1sPHwMrxakOUccp8NofyhEug4YuOk4x
 1035Lrlyhd9wG891Wes4IMgEk2EXiLs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX9PDdxVWoplxG
 eP7yT7KzNhP8RYnaZAjuMgAOMJ7DrA7X9BaLmwyNFvuezsmVoRKmnze3iCOCN/FPw5uyFpLs0fn
 wOLZs1O2KP4UUxypu3Ku+36k/oPFVt/d5UM/owSlkypCA8iCKW3k0j4/DyY8D4P4rkZ92Ei2qQG
 WGQrwOhomVAT5zMzabTwRRMUTjmhRBXzmJ1pPC69lNBVbmzs5DCJLIikNRRbEpmXZvcyOOtODnO
 algokvfvsYeTP8Y9GZ26fG9A5qVcRWO6OdEKbmJtllc6psBrbKOhgjuZpoH8LYLdQhXd+2GdfkC
 djAgARE5V7q6blU8UnrfB2U1jpGESm2rlxhdxUja8umwxW9GENGQXX2+3oomRGgPNv/A53FyrpP
 9lDLH6OZRgSjFrRl/ZZJq9liLOubLd++vx6ZVojmwqbegDM2WhlcGSkyyjt4M7btANdE3ZUaxa9
 9CJqf4XAZFsxSfvXxlQ==
X-Proofpoint-GUID: tebUgZIEn3JWd8BY1HaPPUCuqYUbQd0y
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb2670 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ex46fzmS382XuAsv_c4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040050

Hi Konrad,

On 10/12/2026 5:01 PM, Konrad Dybcio wrote:
> On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
>> hardware monitor. The driver exposes battery voltage and current
>> monitoring through hwmon interface.
>>
>> The BCL driver provides
>> - Real-time voltage and current readings
>> - Configurable threshold-based alarms
>> - Interrupt-driven notifications when thresholds are exceeded
>> - Automatic threshold management with polling-based recovery
>> - Hardware-specific scaling factors and threshold representations
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +struct bcl_alarm_data {
>> +	int			irq;
>> +	bool			irq_enabled;
>> +	bool			irq_wake_enabled;
>> +	bool			shutting_down;
>> +	enum bcl_limit_alarm	type;
>> +	void			*device;
> 
> Why is this a voidptr?

There is circular dependency for struct bcl_alarm_data and struct 
bcl_device. To avoid forward declaration, used voidptr here

Thanks,
Manaf

> 
> Konrad

