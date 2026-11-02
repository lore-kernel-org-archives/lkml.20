Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618224;
	b=lo/CVGNuEWtzkZS8b66js8LQvgMIObcIPsv30+3dkNFlwx9FbyZOW2OO2JmpYecWBGdM
	 N381rnOdEjzoSZ+3GZ12K4c5optpHdDkhzcDBSJZimGhu05XlRF8Oo1dAzifhDfMgm4ie
	 qued2F9+S0Smm/eCbuZjnwSMVXiguTU3Yr4HZ2awv2oolJkcf4pFQCR+5VXDPkLqYTk/y
	 L33BnIU61XKVtieXKfhZeYkPLSnTD9GvB1c0Rvd+ymQDVDpSMRGc3lnaI1JN5ZRsLB71E
	 NJgt9ZLlgbIEBkBjn6aNmDEZBq1P3iK/A/oKuc9Aj9pbV1Xp61rgs9iHy3JFDw4NWCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618224;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3JpSK/PSOs9B6sxPxLv4vXarBNGl/WfakaFeWieUtzM=;
	b=hKIS9a0jXtcfabh/GknlSVy0rhTzQ5NxXAW9x212feif3bGt/GmfbLSKFFzTqe3fdPX/
	 z1Y54A62GWrrnK7GjHSyuK7vgjGLbQXjTTr+vHS9axGh39A2N/BzA+bVCyJAprdRHCuBH
	 dUISWycggrFVU9gHETIpyKIwLldlyxwY1pHjAtXLznlNQGV0EU64D5AzWHcDHF0nRgzzv
	 OosXj11Bczdp/qzddpoRSFxj+FkhQaOLMLBFs1yrcfvafdb7NtSLEpkYBoTCNmxxNevkO
	 mDCU8/Tr4aalWJ2/SZQKcJgEtRlBxpG98FLplVsa7c3zhodD1ey77WJLmAca9my30Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R3Mf98He;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cdbLfl8o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39B7606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E39B7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R3Mf98He;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cdbLfl8o
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ABW64039384
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3JpSK/PSOs9B6sxPxLv4vXarBNGl/WfakaFeWieUtzM=; b=R3Mf98He8uDFPDkp
	mX0LgsDZpt4CIg2VXRslVcqCcaACWLnI/UNZxF2KwCuh63/pJnxjDWBolcvpD5ag
	jJf8OOnllV5aMs6cc6A7DvvDfRxGsHMLOdyvoJW+Lf7opkjK+su5soyayr5Ko3Kj
	FNxl6xS09vWsWBTEYoDGtA6w4JIVdzDeEjkTIbUgT0hqqLN1PCAu9dAV9kzwXS0y
	YHaiSu76+i4F1FYV+0kLr2YfYBll4tjiSc8SpW0GXaDgJzydZ2cCFP+tHRzhDWiE
	FrrVRgblbyiBsqQiDhj2W6QZoaRMwz7Of6lGr7Cb9r6+TV1VS/nXfpMFdE98F/CV
	ezJcBQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18um0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:17:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5350173dc7aso7740511cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618222; x=1794223022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JpSK/PSOs9B6sxPxLv4vXarBNGl/WfakaFeWieUtzM=;
        b=cdbLfl8oV1LZQ4T3hw1k+5zxYFpxPDIOz6grdIYD0tgdKKb9iFNXjQkslrDpxzHJOt
         6hprDcDlvK69X6yk43jdOHe6ZqoO9/rotka6WkwGxwigbDIcvpSA44hmmbotg/q79Vv5
         BRh4jwRKTcBgb+nKLc0u0M4Cm7qvcTilerYPEqtnBBnqMnMRjc4F3EwV9UmJl85nG+nx
         rZ6SCpuR4EdVa3rR91t4L6peUBedWcxlALqraTDLQpw8fwtgGxHk1JkXo+u1XU7oxeI7
         P7e5TNiKqLGg7x2RjoHpXBt02GKF5mia3i/nIVupNhZEml6WRkAruc3N3wzkYDpM+7NF
         1c1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618222; x=1794223022;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JpSK/PSOs9B6sxPxLv4vXarBNGl/WfakaFeWieUtzM=;
        b=Jd9PNzotmKEUFa9faTNtv2Z3NPROJpSWwm/O8m9+HG0ESCj8YYsRLUAjJeR+9bCauP
         8Thy9XNmbmmzm92ziDrnrywvKF4DVO7W4VLyVZPCQ89DrhWZenC2i7LbLKUwmvuQyvwB
         lFSbnbi50klgj8384YRpZZHMx2DhOLqUNGc18pqxs8ug91uuRuKOK+zUroCCYEEgNJA9
         hee7uiWKGsrj7YQqDF8E8WjiPm5uKhmcjkg18bayEixF/kI4F5aO4W/SQHZMCk6RK+d7
         LXHOwAUijG1ZIgmHQh15vM5nOdOed6C+WoJLhWPFp2o5GGbteA4EPd8TIB8vqpP8Kvx5
         PMPQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1cjMVbC5t8Tt6QOWtjF8ygw9g6KjyWjQXIyV2mrhKnxuY3r/8O9St/leNeOBzbrpDHJTqnwKuLx7eOgA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6A52ljGKbElABLS40WMcqmfqtHkLENRViX8oeSxlzVcOn6fWG
	dYJG5MHzhPJz+EQAlbwDxzYKSmierAd+I2pFc3gvCG68Rx4eTACyAcm3POVBaKcmwTSiVb0+DaC
	xnhRmeXdJvpvOfis810tVo64n1TRZrRmyzVCZrCq8vHCXlFrZXpHaFWp/X3fFGwaI9iY=
X-Gm-Gg: AYBFou0UZ5Dm8gSlsaad5mqCQu5hwf4Ek6M2syAxpQhM/ilEvYi0TNc7AdNWIR8Oriz
	ZASdnDB7jvGG+dU97Palv8ICoZpR2Q0RFuPg4/+9GqTO0CzVfXn8tl8YzNZwf+9n7ZSHB/aH1nG
	obzc7i0UFqsdzcNoMisy8Z4ooGPlUN64Lsr4r8O6+6U9vngcMX48pKB58DXW4Zwm7n6q9UtWbns
	npy+fBL9+RPVUX/jAmwboSv570xNJo1rSsBx+EBQA3+AbBu0qvfIyXda0RnuVSbjBcROLclCDoJ
	jdxnvnMu62t2H3f0eKRTrTcwus+uCVA76wnHlcD/6ZHZsUx8lW4d299gWU7YUy+y1VMvmB/qU+4
	/gyIgVgl8E1jY1z+hCG5Pvpc97QsEyXuVaUdl5hHLvkN9r7DGmyc9aeVsCxdZjnKEg9ajhYU=
X-Received: by 2002:a05:620a:1a0f:b0:945:c174:3d3 with SMTP id af79cd13be357-945c1740742mr45448285a.5.1793618221900;
        Mon, 02 Nov 2026 03:17:01 -0800 (PST)
X-Received: by 2002:a05:620a:1a0f:b0:945:c174:3d3 with SMTP id af79cd13be357-945c1740742mr45443685a.5.1793618221402;
        Mon, 02 Nov 2026 03:17:01 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd249sm375857566b.20.2026.11.02.03.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:17:00 -0800 (PST)
Message-ID: <5b0bf1d8-a0b9-4cec-b144-3fccedc77ced@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:16:58 +0100
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
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: milos-nothing-asteroids: Enable
 WiFi
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-4-66a56c537749@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-asteroids-dts-updates-v2-4-66a56c537749@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g9TLbFyKkn93EjE6JisbNUYNaDqf97Cj
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8712e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Ua5qo8SU9V0ZK8mivTUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: g9TLbFyKkn93EjE6JisbNUYNaDqf97Cj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX+8/yGOGGzDtq
 q+YuU9JT1ofZbyWaVloEmnEJWOmZm+w3aKi/2i7Z15W5S9Z/+OsmlJg+Vp8fwd75LuuTnejofP3
 Hq1WlEcG1SyOn3ituYDdaY8t7mHrfocBLvbfxfhlSv38wsGZSZYvHL/tyfbORxbGM+58chV2sgD
 uXA+TjXK1plaeWiGc/DNutQWUN0gEY7p70/OaIOOfHvkinkm+gFri6/3OFXDf9CvCqBYkucqI4N
 g2DqPgDGXjMmeBP8Xq5dHbgmHoIT0F4Q6gL28Qhlz8vgCdIKV5HEgNTNPwBmbW5TR0KZGAC1cLz
 HdszDrEvqQlBiXHWBqC1RoHbzY5Jt7EjRLuteZF1hvLG7uaqalUrBg6YD5Ke8t9s/AwEiCkexY4
 04RIVHxvKjAvKgAjNZRfFQsFc4emV+0eM2bhiZB1qVnqT4YNilh8iqlUNqCm57JDhR2jMYapwOd
 hXf5KxThiOsZ9UtKc5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX+MpPUyRE3XDr
 bXlRrEfmew0WaaqlhNbiTpebGZj5cOjZ35w22HE4PIuPxRG4kZ8CPXGysJlSI7QyVgHY+CMDwIi
 THjF5d9c9z9bV04kTdqNPyi9LLfEuLE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

On 10/30/26 11:41 PM, Alexander Koskovich wrote:
> Configure and enable the WiFi node, and add the required pinctrl to
> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
