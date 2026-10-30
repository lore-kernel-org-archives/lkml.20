Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350152;
	b=hflIXAJkS4KHl9uEgJLePIvGIf+7pYfNtkKAV5o9qSmyrGEMi65HMTR8iOFXls0CfdOf
	 RtkY3Ss11Wvq9lq6KtNY4GHFKfmdV3Ta0Cxsj0JfJiZ3v1aqKxzVsBmQHYlFNGIdQmE8R
	 54nQdkx2NqecGKDe49R162ALpOyWaXUw30X8NK0++1OU+Kbj2/Yyoe/zfz2O8RPniUX+a
	 vYNEMzfg0Xq4GtmzcCxFSO0TONR/9R4mCGfAFhhova4+4+NaPu5OT6rjbKWVKJLdOamhV
	 DQYPjuYcPcfFO/1voPd0AA/Yb4NahNR5morFU+F0UZJhBPOtGK/VMtyEDychr8k1Oog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350152;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cbUUbzN0+cCtT/keBcmiPRae6tkWqWYqorJda4XW1pw=;
	b=rdQ+13dv28hewpeiB+Iq1vwPqPgmEFJ2SnPV78clMZWmzgFSiaYGOIb+/byRRwc4oOXq
	 FJXd0ckPY/ySBenLO7su0TOpiWmShx9zWL58UvRMF/8Bs7AWR5ToTAFHW1vZmNdbGk13W
	 LeEVOpZJ9a7uDW03VETOcNdfh1CL5aTtZVs1JFM7ATFdWb1aIwibPH56rO1925VlVBXek
	 /Yv1KLYPSjwVQp5x7P/6yCPtCzwxuCeVLWXRy0W21g9ZEkam4B2Ufr/ZY8XmQYGEb8EjR
	 N3EdO0fIIXWCo0MoRzSCdY6peeV/hWEUE0QmmshVRYxUkHg0p52e3SKGSKiJlQbEPsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLz5zqHz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YKQnPGIg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CB8606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09CB8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLz5zqHz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YKQnPGIg
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8EtDO3737737
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cbUUbzN0+cCtT/keBcmiPRae6tkWqWYqorJda4XW1pw=; b=TLz5zqHzA7ZWNCgv
	0X4ObSt4y9gdflINLP7FvEwwrQvzw+UEEUZmiCqIVLAe2ByuN5lQ3Kq6WmGNRGN6
	QAmaAH4b9etrBGWfFjrc8CW/A1JrjTT0NNUDI+VrOjy9gq5hXIC7kc1fbhpY3E1j
	/Z6AjHMZGHjGcSiuvnuumia0cy8GN5Yiq7NI3tIHzVvFV/lnHvjYe/+z2UvurD6Q
	sexfC9K3jsZuiReCw8LjLGPLPYCerG+I2Z4rKdOlPvB23N7Vvh6XRUo6xGYB67ll
	peb7hOeoJbQxaf0K3rKJU+8WmRR8Oshibt9ZG2zxri9P2aW3BPad98hLUt0U9yNm
	rI1jIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme75211d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:49:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cac495d99so2530385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793350150; x=1793954950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cbUUbzN0+cCtT/keBcmiPRae6tkWqWYqorJda4XW1pw=;
        b=YKQnPGIg3B9XF16OOeO/8TU7SmK+jfEeZAx3vHh1zyH8cEuKScFgZNQ+U6+2O/FN4i
         /L360K9ARlHfZ8foBc1SFWqjDUAvAT5VtEN5DzbZGOpPB99JfmbHDpdCT+17DVQovSv/
         oNWI6rU3NRvqc0JJOt61ONiHEToxliG5mjZRfcqhyEY11AVAIgjNnHZyUg88jOZ4Qb5s
         /HjMBKbA57yGE8rCiTqOc0W9Sa14KF9DqzGCbQSkmY7dcp7wIWZPXGqneFrTBjbijnvj
         iPL7wqta2iPoRo9SfPAoAi5VSJUCheem1ekA24BmKgJ9WW8q+aRyKvemzKjU5yQYH5+c
         SugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793350150; x=1793954950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cbUUbzN0+cCtT/keBcmiPRae6tkWqWYqorJda4XW1pw=;
        b=nIyfAWWey/gbClCSBDG/aBtg3o9MJuZN29vNBGf86ohnhMfBJDabpoFIF7Q6I0kC/X
         431np0OjfA2NHVVeGkNca1kmX/vPSFD7yDW6IS8GOTptItV2Rllx/cfFYBJrnFWtKqv+
         ZmDbpdDtXy6fau0XAXrOI2FrfSPGBn/y6uyvelsHz9A7rYmrtUzHkDGnqQou2Jiupd0X
         lzHm7e7E0p/Tte1uYZMMU82r3R+TgEvClkzwwFBMfGfIGP4ZCBEwMGBpB7CFG7LGf8dA
         HvbLsx8k9WTNwN7q6WuMsPe1QRUqoZBHdkLRiZsPl/6D5pJORHU2Dlt/QxUxCoPp7YuN
         Tggg==
X-Forwarded-Encrypted: i=1; AKwUvBytYL2FLL7+iBxfg5zqZ6K2qh9M95CSwKM+Z51gykPv2uB8coqOZ2JxHh4ePEQYoINEgtDiyH4J971VArk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKi+SSYu6h50nxhzzsgW+3/l8xTNDxR6z4rVQIHhwZV6bCfuus4
	CWuoR3K83oN1LcrJRjxxcOpBxukYz2o6xOre2TZHPa6uem8UFwJFM2kUoHCZ5XWhrTpomayABzy
	RhN+8DFjG7/1oqXXAh8xVV34v4k5y2x4/gZMb9c67eyEK9gY7Z65wJenstPbOZtU5eQM=
X-Gm-Gg: AYBFou0F40CXExsas0j4XrSt22LsmxZ0PK2GF9diWHIS6SSZotvIkyDfGwUoGC7HfyK
	vdfoGlRU4tIZCD1HO8zUZmX7KMBnVwTF64NoUA1H6O7FAXIoQgARl6kBoGB7nnMpuFAaYg3/Q6l
	PfQapH1DVH9DxReKcY2ujPDO9QykyhweF3ws/pwboqWK0v5RCEJwusSRmL2AMnU6Yab7ovtJx8F
	11w8SXChHBsFVErRr49G8Tu8KkJSnpqWPKMEWB06cqAWtF+Y1fQx7HqTkmbHvO3hMpScSrk9hwm
	nCfc1JFobT7uC8y6Al0wIFl8o+Xmu1/2AqgjUXc+WCYmQbV+Xf67GFZNKq4v3++tnwWWImH7OdX
	G1+G8K+OvmWVMomC1fQYT3Y7TRTgWafsShhuLx7ic75Mb5LlOoxJEdooyjY2IRrPiviguf7I=
X-Received: by 2002:a05:622a:e18f:10b0:534:7732:a141 with SMTP id d75a77b69052e-542b443eb72mr25306031cf.2.1793350150277;
        Fri, 30 Oct 2026 01:49:10 -0700 (PDT)
X-Received: by 2002:a05:622a:e18f:10b0:534:7732:a141 with SMTP id d75a77b69052e-542b443eb72mr25305731cf.2.1793350149640;
        Fri, 30 Oct 2026 01:49:09 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7a4eac5sm382210a12.5.2026.10.30.01.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:49:08 -0700 (PDT)
Message-ID: <36a18bbe-7a2c-422e-82ad-b9d1d87900bf@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:49:05 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: msm8996-oneplus-common: Drop LVS2
 voltage constraints
To: webholt@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261029-op3t-lvs2-fix-v1-1-42ca9d992c20@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-op3t-lvs2-fix-v1-1-42ca9d992c20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B-ZpoaIYXG3AY2AsjBbf7sbcFcfHTxsD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX3yo4ABZ3jlYh
 ASByE30k+mUwJR1rvqVolJPV0NvHotb5j8UdX6KG71cxQGDJcjM9uH8Q806/5/72m+/GjCoXfPv
 JmiJQ3D51wfMxcY5ugHHVAjuKx4jsmC6R0vCWw86VHlWJHuX2DGBC7maKCpOgRukuppVds25aoM
 madpXnURyPE1OAr95UJi7of6R8Pf1RIhFhrnc5yFzddiCnd3KhsJg499iO36MQ1qCnULEkvZ8UE
 RxupOHj7DYiXNtzgjqlFCoMowvptPtSvJgCzc/Vz+AuL/mFUhAptUIrjE7dzmPLDQvH9Ptvlda5
 tmlItwyhZvfYLyrArYNTi1oD4HMNdjO7fw68b2wwlvRYEllS3pAfuKTUJFx665z8QLn+B8uzTLT
 vREGQbmtLPBS0MHkQ6aI1o69du70xDarKtE0n2RkEQT7UyC/dfIK3p5nv7jjEkDGIyq11mHRKMY
 /keN7nA5UmrBqZ4rj7w==
X-Proofpoint-ORIG-GUID: B-ZpoaIYXG3AY2AsjBbf7sbcFcfHTxsD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX28oQcsyNsvfG
 PyEj8tpHGu8XOeFoRue42DCE4Co+RlhgiT2QbFcnpIVLpCRFMnBEBr73iCGBbd6TKAy/d0OiDkD
 BdyHGE7D0DEbb/0sXdVXUYA8ejSYSbM=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae45a07 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nlTkBPkjGgE2AyCPopkA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300034

On 10/29/26 7:12 PM, Vladlen Grachev via B4 Relay wrote:
> From: Vladlen Grachev <webholt@gmail.com>
> 
> Since commit 27880745470a ("arm64: dts: qcom: msm8996-oneplus: Add SLPI
> VDD_PX"), OnePlus 3T no longer boots: the PM8994 RPM regulator device
> fails to probe, so UFS, USB and the display never come up and the phone
> hangs on the bootloader splash screen:
> 
>   lvs2: failed to get the current voltage: -EINVAL
>   qcom_rpm_smd_regulator remoteproc:glink-edge:rpm-requests:regulators:
>     lvs2: devm_regulator_register() failed, ret=-22
>   qcom_rpm_smd_regulator remoteproc:glink-edge:rpm-requests:regulators:
>     probe with driver qcom_rpm_smd_regulator failed with error -22
> 
> The switch LVS2 cannot report its voltage, so the regulator core asks
> its input supply, vdd_lvs1_2, which is not described on these
> boards. Checking the 1.8 V constraint then fails with -EINVAL, and the
> RPM regulator driver aborts the probe of all PM8994 regulators.
> 
> Drop the constraints, like apq8096-db820c, which describes LVS1/LVS2
> without them. Keep the node, so that the SLPI still gets its px-supply.
> 
> Describing vdd_lvs1_2-supply as S4, as done on other MSM8996 boards,
> would also work, but it would only serve the constraint, which has
> nothing to enforce on a switch.
> 
> Tested on OnePlus 3T with the msm8996-mainline kernel based on v6.19.5.
> 
> Fixes: 27880745470a ("arm64: dts: qcom: msm8996-oneplus: Add SLPI VDD_PX")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vladlen Grachev <webholt@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
