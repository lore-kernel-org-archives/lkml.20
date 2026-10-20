Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481728;
	b=j99ZqCOoIQ5kKFRuoIM65TFzBdm/Ht9k5aSbEYbpFlFwoIbVbefxCD+XMPkjhQvWSUiQ
	 6AssWP9+pJa4ehcvJ3zuT14pYb69c7tCLTA8l0jzGdGeY3VQk4eB5Sm81Fi6TBRXr9Cxj
	 nywMgdCHzjnXDqSDnoLEpRmbqtzuhOC+qypLGVUvqcNCAfCNbCFKaXiEQRT15k+bu+UTX
	 jCoJLmZoD5JVrtxBzlPLXUlhsUCPuBjUBJBj3y8Buc6kwujjx4EeARdpNOIw5VBE92IvQ
	 65bdlhTLhsT2J+OZgdfqd98/esOkNOlUz+gJ7zGUbnctn+qPnXZHnFoTfV7tteB2isg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481728;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DZRPJySHmg1AbHi/1VKM5kCKJJzzQaHn48CduryjPiU=;
	b=CJW8/tBRzNhOiKr7TuAFIvZTv6OyWuBk2Hzfuyo2lRbybZd9XpOBbGXRRT9SnDRUHfXJ
	 LRCBrIXQah7DsmTm8QM6fmvvxaN9TsI0/JJQgDlpQcfO74iQf8IkzA3xentJBx2XDg0jv
	 FkTQ9cjZykjrOeCJB14CrOVD5Q9JeJ73qvJTwgRWvDY4sjOtXa1oRCIIVbQiPj9re6/fg
	 AcnOXSldqiY4AXiiFw0nf3fTSZGtAUAbzEzObG9DbHEes74qKMrgkfzZsNvbQxHD0DzY4
	 iYmdC8G8NwR3703u5y3d+WN9LjKwMbGD2cTfsZhIbHtQyRAOhCiDyZtsnMpli7IDJFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlRDOa8t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d8PUVh0j;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D7E606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90D7E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlRDOa8t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d8PUVh0j
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tBsW2877675
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZRPJySHmg1AbHi/1VKM5kCKJJzzQaHn48CduryjPiU=; b=nlRDOa8t9Hgr9vm8
	Exp0+O4d+Xq/xMzvPrNn5DYCcsjtKzuLCyw20nRs4FePtAY6GbdMW7zyWxPDL6bA
	19+GeiCCMFgoBnkaw3ePKddjvKYbPqPNXbu8ei0HeNVbwvIi1SO+PETvFZQFjxNQ
	90t9Z0t4j496eyQ5YcbChZ2d8i6fEGd5Jz0onMYlMQssopqHIIzOzde02sfCmQlV
	WmvmbtI42ccAuZLXFPFdj/VNRrIWZtmgYr2is7Q4x+lxqCfA2qu/swuxyGatNtmN
	iqXiRQr1EpvjbRrSbglaH8GdJEzxYHGMU4zEbCcEGENoFD62C48b7mC0nNqgBUUW
	PZKQKg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5psdbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:35:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53630cded29so10537121cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481726; x=1793086526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZRPJySHmg1AbHi/1VKM5kCKJJzzQaHn48CduryjPiU=;
        b=d8PUVh0j42yJaq678wqTyaedfbYLrQB0xTfgLmhiaf+rFwqGCg01ADyDpmnZXHXS12
         iEYcCo15GoOeurLn2lR097WoJOg+J4jQHwHE8ikv0GV/KdIe4e+toA2ja6OeVm/3INoJ
         16O0CyPASg0CV6TDUOcvS4WJxxAjPrSx/137jeBjyYd+EXor5mA7RU9C1fIeVAxAKg2j
         af1K4QT7rfVcJljuZSEXinZIkA6n57/Qs+RnG47VhFG6VTYB4v0aPOAsKkeFDDJ5v5h4
         9+dO9C0xaNs70Gg1AznyVVVD/PNLzADRZtE2ANAdObNbXtJleDQFFpetuU5l2JDOZwq1
         vkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481726; x=1793086526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZRPJySHmg1AbHi/1VKM5kCKJJzzQaHn48CduryjPiU=;
        b=MCiX/zIDpPGhTVgm/+8y3uGZh0I2hEp4wUB+ltMXWppPjWr5GFcYjdy3DitYOLuO79
         6/qNalY16CJryCn5oM8e3pu5qeqHdexEqsFSkGKpN2SJYaY5nnKXP7ENa1CTaRersreV
         DANBQy4ii88ZLqrCSQeiTrqszV1pCT+CrS6p0t6V6ZDaTIhqDmwJNfgMROnD0IgXCmyc
         3Xxc56F6dIB3xImhAr7N4oRdEPVfPGpTX8BVYHlqjeVW772fxRrUW473UTYreMbdXOng
         NdDD9PyOLWNy1n15eLbfbbQDy5hmPh1zdEg9zzVxfl5jFzaLgU55XGPa+lBQgeeskdJI
         B0rg==
X-Forwarded-Encrypted: i=1; AKwUvBy73uYLOhMVehivCDBniSXJaV1m0gXAoW1KMmMUEPs9ypaQogxwsYDn5aVX88PcFNzPmxkgVTdHSvcRxr8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUVXS24cwygI4IxQZVem3hNC5zcvGNS5CdIUMwhobb9JzyYT++
	IPDzyR8MLdHQyRLa81G1xyuOXmjhNdLL6q/QUtHCJ89Yr7o+ZnWw7is66c8FKNbTdizdCPK6q3A
	8HdWBlGSInskpOS0joM3uqyzgIqjM3k20W2DLwrCP8vYr6G2Fry8rBmuRRmSvUwKAAXI=
X-Gm-Gg: AYBFou2lQn2KZ6/ivEJkRVYT9qSZGDki6BHkGmQxJKMK4GnGNkkwJaI1RRiKoH4nOib
	bc3eUxsqGMDbJqbcdQzv636QbdT+EsjCJ3u3x1dDKjf+g49ThnmkUwHJsCnCapEf/Yc9AuJF0Ro
	8NKExYdkuUnFYAUmaWbSiX9LoSDRmEeMupr4Ru9UVQ2t4/iWOcFFsjaFCLo3vGnPbLrkg+phnHN
	XJAZkN2SCrJTRLZIv0HHPnQfiMUarfbHm7vN4CiJ1/69QDQbQbrRdz8Ed8scXCoIS9COBrPGMy1
	s2Tpj6PBLp9uKBKf2zytMz3fQ9rCZNdw8MBfEeT5Opq0CTD8N6/TXUlWw0EJixb3Ap6hDpmtUyD
	E3iLRxZZZyS4UzOT22PeIXA==
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr170738851cf.3.1792481725918;
        Tue, 20 Oct 2026 00:35:25 -0700 (PDT)
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr170737751cf.3.1792481724319;
        Tue, 20 Oct 2026 00:35:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm471411166b.76.2026.10.20.00.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:35:23 -0700 (PDT)
Message-ID: <a69738f1-1c6a-4476-9c0c-8443650d1f6a@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:35:19 +0200
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jasper Korten <jja2000@gmail.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Luca Weiss <luca@lucaweiss.eu>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
 <emdm463llmoi6vsv3zmfjddqrfaf2iubdnydsqye2n6ui56oae@frsvj6el3zvq>
 <DM4DIJZOLJC0.2KAZET8VYUDY0@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DM4DIJZOLJC0.2KAZET8VYUDY0@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad719be cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=b7wq30jk4QowdIX3xroA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX67dNjf/CLvVl
 5H1nG2ZPkkMZVxRPkzSJgduXQdkUwl2tHhOIDruf8s0eF+l5UVGbInju+VIx9rRZy+DogktgY4B
 jFsNk9Lgx1dF36FXsUlrmMyXWOXEvI72uFlllMRcDTdbnwD9zFjJOa1LsvJqvubDpOYI+M6GycU
 tamSGqpmbkiADlpploLra3kpwWw5oQjltC46CcJ77NdN6OvgUW4BDj9eEILXMS7Ijm6R8juPuWX
 hVDZyX4hOzAHOOMY82ivANENeQS6fmcXuilJI6G1Jqtxlfy2cUW0ekddPMp080TPMfOlcN+0Pnd
 TbpHdmcjGFCx7NIG3AEDaPy+usj8y/Btg7Ey7lwhRp2AE1MtkFX3mlEmDpVkXaOgB6+VvRluUMg
 uwN19WEw4f4UnbqhjCjQM8niJZAyeKrmZ529x6bgVuKtCkgaC+MoRmkwUYUNHx1ZvD7aLXPpgMN
 7otl3wviV5cmdWlBdpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX3S+lJQNqPKvX
 FLdsiVWDNI1jFLtSUqX47nLOTAtRUKT9umaq4hkQTP0eyLzPvpcDMdNCgeVc3sGHyAuIDe3hgXt
 nPQ3RfrffGJf/UJMontLzCRDCdkfgwM=
X-Proofpoint-GUID: JH3OR6RkNIVjrUqk2KAqv2j4ycdK03XQ
X-Proofpoint-ORIG-GUID: JH3OR6RkNIVjrUqk2KAqv2j4ycdK03XQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

On 10/14/26 9:13 AM, Luca Weiss wrote:
> On Wed Oct 14, 2026 at 3:28 AM CEST, Dmitry Baryshkov wrote:
>> On Tue, Oct 13, 2026 at 12:17:05PM +0200, Luca Weiss wrote:
>>> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
>>>> On 10/12/26 8:11 PM, Luca Weiss wrote:
>>>>> From: Jasper Korten <jja2000@gmail.com>

[...]


>>>> I'm assuming there's no pmic-glink on this device?
>>>
>>> I'm not quite sure yet how the USB stuff works. For sure from
>>> observation, USB-C only works when stuff was plugged-in at boot time
>>> (UEFI?), and charger also only supplies any power (but not actually
>>> charging) when plugged in at boot time.
>>
>> This means that something is not 100% correct, for example, missing EC
>> support.
> 
> For sure some bits are missing. This laptop doesn't have an EC per-se,
> it's got a "EMEC" - Emulated EC, where on Windows there's just a bunch
> of drivers handling EC-like functionality.
> 
> So e.g. already for battery, we just talk with the sbs-battery directly.
> I assume this will be the case for the other components on this laptop
> as well.

I guess sweeping the i2c busses would be a good start. The other day
we got a contribution for a SM8550-based Samsung tablet which also
didn't have pmic-glink, but used a SM5714 IC instead:

https://lore.kernel.org/linux-arm-msm/f7ba4d5a-0e8c-417d-a1fd-5b5e392df71a@dxdmail.cc/

Konrad
