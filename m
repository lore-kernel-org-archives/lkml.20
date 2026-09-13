Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303A33939C1
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789295543; cv=none; b=qcVZ4WGweF+KoC+PU2sQdUutvh0+JffWLLlXZ00Peq1w/loKPx5wwUhbL0LvzPqNh6kXjviY/hKc29JmtW7O+UlM6V615DNiNQSVEbhG8Ed3RrTQbv6GV+ZA3T/7JPflcak7O4OiZTRMuSNtrfg5IDJOqDB7wLxckmK8O9rh4JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789295543; c=relaxed/simple;
	bh=tHosPNT4fdBSE5OakR+2naVgGAE2PYaT5qCsKmvw6UQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WfhnoUGX61y3THRihRaDc+cuTbOMwTh/6/Femty66u1jAT/A1jN4EXPBhdXuzpTmrheBs6GeuQFYS4PbIGifkvQxn2b95XAq+90JoCEILqC8JVNc9Gx/S0teURw2J/eyB6df6VJ6wxCPlxClBziLb4ArwAJhA7o6hN72/WAO9L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjlRF3a0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EE6g63V/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DjlRF3a0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EE6g63V/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAU8sn272150
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D5vAKqT6Wkkpii4lrLSYCVCPovwE6ZV45z1ikvs4rFc=; b=DjlRF3a0oH/oZqUd
	sXxPdDvrvayU7rLuv9n8W/fBt75uI7MZorhxobwtNTwZWUAIPTgbNAglaqHNu/gY
	3itqSnnWoT8RFzuVwXzI+hCjHP3RfkapSK0/OMJjKinAwTLfGvQSjOS2Gwi2VJSk
	9CcACRh1f6M8lKy+dZWH/cqFVftH8bn1wemff/+xWwwNkqfVDrMMVS3vl70D9+Cl
	WpH5Bt/crC51uIfpOuza9LoUoNOXzlZS+jandBp025RgHNSMrm+Zbdcl2Qpw451w
	V46vo4N3pJQhwI87KuWX8ZmnlMN9fXEZGoZvmwArpEQVQn5uWYBFBUHNNZ4nB7Cd
	XwL8Ng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh2xnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:32:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0b66ecd9so99284085a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789295535; x=1789900335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5vAKqT6Wkkpii4lrLSYCVCPovwE6ZV45z1ikvs4rFc=;
        b=EE6g63V/oCfdS3fm4BqY/S6LqrszbwJJzqi10bheGoe0dv0o4IX2otmqNX4+e4XG0P
         LHU8FdkNAID70rCHvkgNhPQtlVu/LJ1ym7GrO22p2gfzX0KGiZIj9z7+1SaDG1WScut4
         ievrHQmeC85z30AK7D0PHUdBsSV0xyOIqTH164BkIF1hdqsQCYP4ey5SBZGrTxBIbVUc
         nEIWptZwC6K51R0JQCZK7aZd302a62+t5BnGA5Wc6hXnipfddeAreqxhkDAGMkkH9BgL
         4soHBUovcqjD1b99cr+ozoEPzUEMaodTobMpgeHqi20AgtI8NWmeu/GfVHZGk3rLktm3
         UczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789295535; x=1789900335;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5vAKqT6Wkkpii4lrLSYCVCPovwE6ZV45z1ikvs4rFc=;
        b=K4PeDn/L4Gclu+8QLkTRoUsYS1/0GrImmChVqlqoR3U7xWSNqM4JnA3jSntzaRzpHS
         4om9T0pARQ98uPlpLpCdvusECcqZNX6TTG4BYdrxUpPTS99o5IWiYoUnK3zcEUW8v0g9
         JiRkxp7/l9myWHBTyegP+J7NILZn9OpvzARFo6Ff6H2QVKm5SosBNzKnqgSJ+LqH1pM2
         dTx1/uQPZ2XebQu7HRcLDIXRayMSR8BBVl+QNrvnuLftfAGAnZEdgvHYnpE5qkcJxLRL
         dzYyuj6/NyZ5GEQe9mxzoz95a+wp8AsJtiLPIl08SnRl3L5CojHf3+wubyv8LaTbHt5t
         t9MA==
X-Forwarded-Encrypted: i=1; AKwUvBxeSTxGP+L2O6JE7mki7nKB8V7evqknI1F3eQ/LpeWtDmDAz2HKJBhqrfArLtEbpntrsrsiMIyfcP+2Vjg=@vger.kernel.org
X-Gm-Message-State: AFuF++lOpFNc6RsGryVV16XSiokuw4mPLcJg3QGMBXACgzT0mFDfCsH+
	mTIAYUn3A8DAsFrw37LZiRchEQEnLiqMmFEqEftZRgyrXCqSaYNWlWdkhXNBLweuTaQJVsDhxNg
	QSMyWw0XC+S0o3kg2zxpUpKlOs6UjnvUcqU0aXbM4oC2NQaEvf2U6jvtWiFtdY+qArZE=
X-Gm-Gg: AYBFou1iIsZxY0RKpHEGHY5zGmqkBP2R05z5c0cEnLvKG2C99PHsjKCxXsD3n+4/BSz
	TejVNdaBydM8UwUXoghSoMWN9hVSaOS3XyDuVlCfxvKl/oupGiX4XKMO4A/b4jjXzfWhOb0LW8h
	zpD0MMR3EJTxNNwGFdEVZP88YTT5+aW9Hs6kp2Qey/SgU9KZ01Ed5ARDB3sLfJko+qUREdHWobU
	yte9ZZN0Odja8hnNzhCPaLEbuPxCKozYob9xGtKBUuOEwjjz++t6mXJOFtsEnCM7J0kDEksOndZ
	ZEjFGl/uck1+FQOhX4A3ydyrf4VBerb7VcyyZZs8LPPiWjjQ21+Gl0Z/8aPW3IEUe2cyXpP5eTo
	F3k2tjIosRHOg6tdhwgiUFHxkea7a
X-Received: by 2002:a05:620a:4409:b0:939:5f4d:67b0 with SMTP id af79cd13be357-939ea037da2mr1792431885a.8.1789295535242;
        Sun, 13 Sep 2026 03:32:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:5f4d:67b0 with SMTP id af79cd13be357-939ea037da2mr1792428585a.8.1789295534807;
        Sun, 13 Sep 2026 03:32:14 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2985dsm519682395e9.6.2026.09.13.03.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 03:32:13 -0700 (PDT)
Message-ID: <c478a074-f0b7-4eee-8cea-5f926b6044df@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 12:32:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/hdmi_phy: fix runtime PM cleanup on probe failure
To: Guangshuo Li <lgs201920130244@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260913085814.1509352-1-lgs201920130244@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260913085814.1509352-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b1HFdqMjHcVvXTZrTAadndoXbUX-8knh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE0OCBTYWx0ZWRfX15mGXy/hb2MY
 yjcIgyNn1LJpeYLVaNPsnCOAzTBDsApSQ8MyU1HNHn+lh6oJlvqP458VSL3rykER02MghXXdVUT
 JiaYoRqblMS8d3vzil872rF0EFzGicKFAvM/dh6V++14G4TusC9rnoLbTrb/myZGcRkmQ6iryV5
 o1bj8OJYGD4h/r/ygOd/ekmE/vlS4NSXTdlnIJQ5+2KXbCPwTOqXf5TrFvfXKX8imUodwPHQtle
 e51Ank1HBu6MIVNQFwan6BwhGvuXwN4yOxzmL+rys0nOE51SNaFXe5wrKIXCweTdi7lpwcvWUhx
 en9BE6bTNwBRJK6I+ueR0gEQQRqMA8NKle2z1FKdzZ9jibYcVLpiPPfByYtWlPoE7CDQYNjQQXD
 5FScaxGFp0QEw7Ar0aV/GNQZgmoNXv9Pi9Lu3rgQJX2NbZqqAHROZxiZRhf+Yz++FcxeqguYNT2
 ePAL32bnud/NKAz9xqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE0OCBTYWx0ZWRfXw2IaOQocG4il
 jXM7BWUdeiPW6Wv4eQDjHflTrjUZbCza8JX5mw3DL3XvwPGU9hLM2P6AZ8M6bl7vaMdvAdiURGt
 QXgrd0FqJOaRNFInpTmznTbpfNqPNNM=
X-Proofpoint-ORIG-GUID: b1HFdqMjHcVvXTZrTAadndoXbUX-8knh
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa67bb0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=eqkjudQgZ73XcBGNVqcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130148

On 13/09/2026 10:58, Guangshuo Li wrote:
> msm_hdmi_phy_probe() enables runtime PM before enabling the PHY
> resources and initializing the PLL, but failures from either operation
> return without calling the matching pm_runtime_disable().
> 
> The remove path disables runtime PM, but it is not called when probe
> fails. As a result, runtime PM remains enabled after an unsuccessful
> probe.
> 
> Route failures after pm_runtime_enable() through a common error path
> and disable runtime PM before returning.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 15b4a4523859 ("drm/msm/hdmi: Create a separate HDMI PHY driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof
