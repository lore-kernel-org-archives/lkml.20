Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8237049B211
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162304; cv=none; b=mUzzTBo8vQsauey3ovjQ1Y/A6iG70/9ntL3Ymv1vOWIV99TVOFvV1l4gk2ls8/C2468cjj6QSD707GkUOrb7ogmkOl2dZ1Dq6riLgeKxLchKS2sQxmA6SXMCJNeWAmMGhD69uuCDt0GETEpLtmnBokdL23fANUpZCdWmnfiAeNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162304; c=relaxed/simple;
	bh=maTSaclQ16IhwN9YZzXL2nmAdX43DWT4iQJpYDEEsAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QtxXJYq5Oz025kAR/6McFrzpHRzHaGuSCgb1CMlUVVl0f4lhsNg0X9kUnrfP4M7ayiuI5iir0dgwbzTfOouwB65/2jBHWKFetHGw2PiDAL89wDHNcTMiGFVlDqBKiDNauJr84Bv6rMpLbmPXn2l8YRuGEjZtDrB1jzgA/dbBWcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6t8J6vi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MczGsaWs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6t8J6vi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MczGsaWs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2gLw2429446
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5HvJEnsTYcbFbHF9VSG+7AqvWxgJBjz8BE23CP1doU=; b=n6t8J6viQBHuQx0Z
	pC5UuZ0f2h1zGjtmqozBoFR6EJGtFqrxr3pReq3t6R9bTgqDm8QOUBbEXArJVI8z
	3g9ZjCaLkUdpMLuAzbd4Zl7ugBHCJncyI/aAVZeZ2PfnTvwZU4n8L6Sh58dzcFXS
	nf43IpxmpoMhPFDIC1nrz/q1+iRnsq7VLOLW1cQlThBagT9QvgXs1Pjg0/XCXHeb
	ayz6Jiacpkgs7NlXwhxujVcp/RY9MCSBbqgTTDVZ85CA9NfkWQnmcWfuf7GluAL0
	HjxKQNAMi3jJTca0PKPPYEPaF2dy/c/ejtA1eLtMH+F+5o99aazUgvX4UOTwsxI9
	1B/LKA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqh8h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:18:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9349ba88188so18722685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790162301; x=1790767101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5HvJEnsTYcbFbHF9VSG+7AqvWxgJBjz8BE23CP1doU=;
        b=MczGsaWsZGfiaT+LwZTq4tzjuqLFshW3ftXBwK4W3b60piqGsZP6SIpX3hQVyQGkNz
         aa9GHZwxRlvc49HW+ZKhir+s5PkAfedf5xMXyuG8O9pwJXB8RP6NqDjQryddbekDOcOd
         az+DMHO+vLf3q0IGGjLf9YJGJuD2Y6SqakiC+MtQF/znVmzcQ3BW+Ve2pSiVexssRgTa
         mXjfsbhIbX2gpPFAvq0HIqb2hzYEQ6vQLZj+rtAV0fqCaH6fTo8hSOTxwaRr0Uj7NM0X
         663oHJldQMYurkmLRvlQN10tgy8Zo/JThAqAo4hawnKRthx1ltyoZOTvIeOJANKX8Cme
         TJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162301; x=1790767101;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5HvJEnsTYcbFbHF9VSG+7AqvWxgJBjz8BE23CP1doU=;
        b=b8Zfe3yPWmUTW20Zt6i+i1Dwye00a6VgYow3Cjm0Py3wEs2+8W9EdMccxWXl3RKshZ
         QtcxyiBK5sX1k9e9+E7NeG7zLUzlWIdZdRtuTzRswZ17DUfEns0xTGNA2asQy62HCG+C
         8/z74LXD7EbASJ89u+DGwTiw3J559HiOThCu06s7odwxmkSJUbWlrZKOgGpfZCihn/xj
         e3WVCbGFf1IbN3epe7Jyj0bUuRHI7pQFOVF0y+VW5o049etmOdA+2QHhbxI3YVvH7hEL
         /K4sbNx6PzwJ0agL9j6vLAbWNOuPzmDfBdvOo4AaD91n8dlZFvI5hspl25KnHOLuJJ8D
         FhfA==
X-Forwarded-Encrypted: i=1; AKwUvBzdqY2VWndhCbcqLiz2BD3wTAkX7C35yUTsSpnG7nOsNmMMmwAhvBZyOmrU6OPZbi3vJwfUUTWB8yesmYA=@vger.kernel.org
X-Gm-Message-State: AFuF++mfkQzOKxgRIhokvaB+548FidFuqAkTVGQRT3x1E5GX4Y46iE+/
	DAsDkM6USD5dijjSAxrV/v+VVeg9HE3FOn76WVWVnzlCh1mhAmJXMQYnQsBtPtKstuUCe6iI1E2
	6HeFox68SxP9O29mjpuSO7iXiUKXfhF/3RwhyWuZNfCTG5X8U6XhXbJhHqrKhddOA5yI=
X-Gm-Gg: AYBFou3WCrSEmXsvLExcum1F3XwGtWF/XfWS7MFzX8FjwmT+eBgQUTOjLc15LPp1jaw
	kdKOQ8PLXhe+XdlaIz+hCsYGz1JWETOKq5JMQMhYMj4LLqvH5LcdtGTDWa1vozGf6/6k6DPLIi5
	9tlDpe/Jm6Y8n7M+0PWrxax9Zkwv4ytwygpuWvETnbLwfZPrH2AQR1pGoV/yXp8rWXkU3/byAD3
	kXTJ66VhHiR4Swlb5826xb+KWF0lyo48Q01i8XcHlicvElYDJzxrvc9jiTzqz3DAqzzQrGJMuSU
	M9ZdRoMxN5iwX0ExDLPMvpIa62b/cNL3F2Gizs7Fc2kGIHidouxl2tzx5hNJznjYFUBepmXh6CZ
	aEqPjOl8FTuNmWIu8s93tTRie83VIgEBi
X-Received: by 2002:a05:620a:438c:b0:93a:19cc:107a with SMTP id af79cd13be357-93c250972e1mr336213685a.1.1790162301564;
        Wed, 23 Sep 2026 04:18:21 -0700 (PDT)
X-Received: by 2002:a05:620a:438c:b0:93a:19cc:107a with SMTP id af79cd13be357-93c250972e1mr336210185a.1.1790162301150;
        Wed, 23 Sep 2026 04:18:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6e3677sm100600266b.62.2026.09.23.04.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:18:20 -0700 (PDT)
Message-ID: <75d01a06-b943-4dc8-85e7-0eb578bd0e27@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 13:18:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] drm/msm/a6xx: Honor perfmode_bw threshold on A8x
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <20260923-hawi-gpu-v1-1-0c3c79a1a470@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-1-0c3c79a1a470@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4Qhqs_s0SyOlNrS2TcEszqxH34hhnlC2
X-Proofpoint-ORIG-GUID: 4Qhqs_s0SyOlNrS2TcEszqxH34hhnlC2
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3b57e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YJv5aonfaXPMDC4gfg4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX5qgeCRQUYEDZ
 4DxgzeM3J2SaBAM9P8i3wMwUJ2Qqxj3ByT0iDKiYzCSEHamWds6GVw3rsAOWxB/bqmM2aERgwcq
 tmMAmBv8B6yDlYArSKg3KCnTvA/GawE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfXy3tscCUUq16T
 FW4w1komyQmbijqqByFzH0y6XJbCh4XmMnUy6n6BOMc8U20ikZP/iRCd7UaLqER1aKk7dJichuf
 pz3Od+pfFOl2Pg4IFvQW6EcF+nWxpRYlCvMoxj7fSOK5qBWrHpQQlKPBtlG+v9N73jkOK1faRW5
 mZN8FxfJ63GkK3RINRMtNyZGlo52By4ZhHHic9S+854GCEDWDQbD/KwpzZNL1NzP5ThTtuNDG4j
 pSfCcZs2ppaOaeCrbmC7Iv0XAEzagSnMUomrO0AyCZqtYFMXqIYWMWxVnmox81zHlwb5Ei18EUw
 mGuYFALq35SL5VYKwCk7679AuM8aTnzKJfUcxNLdWPeFH4yo1cAto9s17//An9zLx4NcIekk9W0
 fO4m9dV1Z41HkdMLZofHPka5rbWb7wmPCUVXpdpECmAVLM+T7Mm/fewwhufTJq0/NDaZOlWI0s1
 vIlOkF/WnFfGDfvJvEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

On 9/23/26 12:25 PM, Akhil P Oommen wrote:
> Instead of voting ACV for all bw corners for A8x GPU, restrict it to BW
> votes above the perfmode_bw threshold, similar to the A7x GPUs.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
