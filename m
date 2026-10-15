Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463154A6CC2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065581; cv=none; b=h3igFAixvK0nf+/rlgZyz+0EoLMiV+UjbXqjIgiPePcWWii/DagZmiEm6R7ZX6ht+EgS4by1/14esAiggM2MTGx08qeDTi+t4uXMM2m7mQinvy1SQzn9JHcA7eVSpCrjcvv5RckokaZb+3qKynldzdDR8bVSxBzU2eeqyNVdgrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065581; c=relaxed/simple;
	bh=KsRqpNKyvdGxdAlQ+dQiJscOwjRsmt9DrPpTB9AQPgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2zMpPEzZ28eWyUSS5lg8Bm7rsTNU0/zPAOgEyCNrS2iIJmReTNagP2mi5Ssi/Se38g2euA3OQn21OH1+LEvDCqXSGHg3bQkzRrIwGO3ZLKrD65zLsy2DGkytluFGiTjK8mawlkFBjD/W61YSnw88IVDac5biaZyW7DJus18ktc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceTGjTNy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HILrSOm7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceTGjTNy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HILrSOm7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jnqI3408833
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hz3e3KoQEXOCa1kQuXBEWFHTKLBA2FOGUwTwnrDmVDA=; b=ceTGjTNyUV7B1Alu
	zoT2RM+AO1LOtYqjAyUZtXi6e7Hq0Ft8fXgDB3CiIhxSZk1HySKfH+ZB+svgKsD4
	yCskWG28DM2gumDogbXnJ7lGftiErgEV4QAiyf0BDVuRXB6fm6/i9eb5nqhooNgC
	KLX5bPFRvmUS9cKg+AFQK+p75zavi/Ko3isV/K2hq5RBe6IVRXxOX/RP5xkzdKev
	px46ov4UnFYKcAdS8BA5FsSoliY2awyoj9UMCaJeLETzbFV+OWTwc2woAON0/cI4
	Q6sTyEYD+CcNmdh5CkqGh//QIfauojwR8nD3N5dqZz/9WiME5dgxxQ+OjLgte9Dv
	R2wQrw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn2m80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:59:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5338a4075d3so16525881cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065575; x=1792670375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz3e3KoQEXOCa1kQuXBEWFHTKLBA2FOGUwTwnrDmVDA=;
        b=HILrSOm7HXvGmDnFpB+cWC5yC1EnO+YiFR3tFtro9vrVPyp0r1A2sQrd6gtT0Rp0O5
         sCs2iAzCSgUtaoPE81CD3ve76J6Wgzs6+9yJNcPXcEbSL/eQs8KbLEOxbaJmCIFvS7Q8
         qfb5wytM3oUKWhdjQ5tF7dUAIdfu9lysEiQw+tsgMCOUbGQA9pZ8htBniJKjOLqYhIbi
         /gcefDbsfne/8MSDxNgXfl514BbTtEjIkuqWUGyHaZGZWujOXit6I127CrKUQdyQe8iQ
         RAkzEqZQNao9rbNdU3k2QOh85fKRzG0g76xnUG/fXbk9Xp4ud36eXYpZ9Wb1MPb4cI8b
         tjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065575; x=1792670375;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hz3e3KoQEXOCa1kQuXBEWFHTKLBA2FOGUwTwnrDmVDA=;
        b=D96WgSs+OJ7irfgGcH0QR2VogUiWQrf08lQmTbvI1kVLZPl/DJqLMP5aWa/4RK6T6I
         Y66GOfn3k0JfT6K3QFYUAebzozoLLh1gudfuegcnBwyonaUJO/k74TCM9CKA092KGxBZ
         UtSPWQU0ceD2vBXILxYmRo3GMHCVduhH0VQRWKUEYjyShVmWt/EEGzb4F2b1e5WATafv
         /B+ufYAK5B1pzRZ7MjruUd3k/SsWmbS6WVB6Vv3Ze1/WCr60bU7YSp2vRzneTsLoBrJI
         Q4CT0R30idSUElR1hqLzah0AWwURtFhbe9WarF1WndxyKgU3c0LzRGOwclk5ZS+dM7qK
         mdcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwV7JbsPzWs4lsmwpD8V59hcmTyD+iQebczkNlTt/Cyd5swTTXM+IdbLVNPzCRtXkOgA/l1hMIIALCUqZQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeobY0zxqotJUSrlh1g7TYRS1YE9a33Zspu98oHAcyoC7Tegl4
	YrJ+hT4ezAwaDB95tCqNqioU/n1suWhP5LbztcibEEWRFGcnpdjHqTNUkGPjhJ9vokxSYtHdfjI
	Q0/sc1dtDy4WxBasUilyMBwvLswPoVzQ8AiaKHK3FNpC/SRYzNGSopSF8YSAYT/LhQECBaqHSeJ
	E=
X-Gm-Gg: AYBFou1dJWq7k9kkKIcQU4Eo+QxVmHIAaCqNredZ1LUmswxN43WxVPQXcw9GWC7v6OR
	jK/HLLdfwocf9dM3yW3mJEkaiMGW4kh8zA4Tfr5MMC8ANIUHFRo3T8tQDuZ/7evz+lz3Ioc1qYr
	RV3V/TH0fo70p4ylJHhuAzDFF0Lb0ztwvbRVm8fL77pN4SRMzExPxmEm/SI/lPBvFW55Yr4Xfpq
	Y97WVN9vHDuAc3Nu8MaiJEW/w8vgUJmPeE3uNTn/i2OU8CVED/YZhhyxI7gq0tGJD0I29Lt3/qU
	m7FWi81Xn1lDAzMm/FZTFeBjm+S9iiPyDuavOAgvtKCokum5CiGLGcvFczIJlaGVJAAw9TfedQg
	5F+28HscAymRlOoIH1kjMxQ==
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr358234261cf.3.1792065575207;
        Thu, 15 Oct 2026 04:59:35 -0700 (PDT)
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr358233841cf.3.1792065574606;
        Thu, 15 Oct 2026 04:59:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda3352a7sm117007266b.59.2026.10.15.04.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:59:33 -0700 (PDT)
Message-ID: <bb2f2366-2525-468a-961c-41fb81bf2d15@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:59:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: qcom_smd: release channel OF node on device
 destruction
To: Avi Weiss <thnkslprpt@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013055642.793161-1-thnkslprpt@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013055642.793161-1-thnkslprpt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfX3tM2Chr1J6RI
 lB1bhQxvrp95W7/ioMdeYxSloSbJqlnfQtYF2EXVhVICrr/ty/+sqhik5d2N8pN1/8rNvtp37ZV
 VnylBogq5MK53V1Z5jzSbA14ftYmB5K3TOKXuRWQqM+Tl97vB/UW3FCNJTIq6CnPNydhy6B+RGW
 WvUGFbrFHSj6V0G742zpt/XU9rJ4eOxwXq4ivlIoMEEly/ge3VjRjiDXqQYwnu5p7iSvEz101ME
 yGukwNGL7csJ2GWaz7LXSwre4sfXXJ/X7B////mEmg+kQ7KbZdeGjkYECudR4rXUBt9qPI76dCo
 rnYsVq65u/BnmROd2KUPkIIl49f6p7NVb6nMY1u8KYJ0BEDZLI6j66k9Bv0DJyyWYcQH7cVHiYH
 yRK5bnIQHDIzfSoiE3lkELkR36/WHUmjfrgBPcJIGbz6mYLJ39+1APxNJKZMhe20rK+7nf/MzVK
 S8rnxlItxxOiiKRUXXg==
X-Proofpoint-GUID: xOT7BirbjXhr4pEsgQRPspb6221FOtFq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfX465ckqRFa7SF
 8Vex9dbRew3/RdcOPSPLKksHki1Kf/wRoJPWftlQLSdxlhBGkYMCqGwXe2237Um7EvJzLBlqEw4
 i+6EVGw4vpcqd2ufzcrHJXfkGlYj9sU=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0c028 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xj2EYvY_aspI9gx2kb4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: xOT7BirbjXhr4pEsgQRPspb6221FOtFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150047

On 10/13/26 7:56 AM, Avi Weiss wrote:
> qcom_smd_match_channel() returns a referenced OF child node,
> which is stored in rpdev->dev.of_node. qcom_smd_release_device()
> frees the device without dropping that reference, leaking it
> when the channel device is released.
> 
> Release the OF node reference in the device release callback.
> 
> Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
