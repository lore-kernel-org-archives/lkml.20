Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894764519AD
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794366; cv=none; b=QDEUP5zAK2AZ6Q/sSJGWBtFcysa0XlDw7ojW7lfQt4oqlpFPxCZ04kHkY69bgyVehoz9piS+K60Sr+c/K05ExlQk7ZWYEVOhcypn5j6nv6hqU6hxGsXUMXCaVDGonzJ3QkxgC59wlPHMd4cbLtOtd27U88AunBmtiJzRqKakk5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794366; c=relaxed/simple;
	bh=OGepGGUQ+LWrjxXWY818lwVO7WpOVwGkonVoUmzk+mQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qdacgkSHkHLGW+HTCDf7k9jnCA6NNGsVaYuyv1PzJMJxUONVYtC8Rky5LFnC2ilKxjiHZEUqovjazfxthvfR03I+GrWYarpjLi6FnhqhWq2tmjwqKPjNKqKu5GepvRAmEMIRb9ZkJv1OmZQV2PZSAvU4vPfQTV8IOFkqWyLoe3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOxZY9bV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YytVLbrV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOxZY9bV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YytVLbrV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KbJF2873944
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XVUoLgw50wiXKmSauCJw+oW9dk2W0d36IZAjmGS1EnA=; b=nOxZY9bVEcslPexO
	/+2oxnw9SLhb8czQEzGDJQ+9CwLaSs9zQYATncW8xQJZUGUebUNcmqEt8d2IRFNK
	eWS3saHtrEnx0T1WiT7iy8TBODk7qaLSPXaeHPUKgmANfmxtRNoDOkAiAgrrWDYq
	i1c/IJeXe+BmKdwCXHaAOapuep+6AWnNj+qVPFouV+GsxxOcocIHvQrzqPNMBYJM
	zRfmP3SLZBzmXQGo3azaPK0KuAnaj/iwFPtnh00LZVlnOcVPj15ycmWB7VASI+Ey
	Knu5DfibtyXzNIGBVE9PGAR4SZxggUtlTwqB+YXf/eRAqp2mU9CWyVfNnok8QeRz
	2eJ8Zw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fe0nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:39:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5350d8a2368so3844041cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791794362; x=1792399162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVUoLgw50wiXKmSauCJw+oW9dk2W0d36IZAjmGS1EnA=;
        b=YytVLbrVRM+0eNhyTKqpsFgG17lQKczbDoSvxS5UllDXkAKh91Ap49jhJdxlGJhGK4
         +i49B5L3VALtfo65R0WBuk6mhRQWKNJ7+huxutojNTEddKkyByIasMpsbL+JAkYVqJkv
         sUCKSsVlPzsCpKgag8Cwfzr6zdGLhUcldNiH6Yo3UTys1B1SaDn0l81+z5dANaPlTrg6
         DbVELvkIpSzmfyZt1vy0E/9UhOUqKn2wJlzP0n3Edw7gZbVK8a86UjtTLCpZTdKQvR2c
         2JTjsim22HvELPP4GLPDWeTCywUG0VNO0xUxFQxqRrUhWtb85+YWFrh6fODKVBYIVTwH
         qkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791794362; x=1792399162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVUoLgw50wiXKmSauCJw+oW9dk2W0d36IZAjmGS1EnA=;
        b=X8fcorVKpKvEq/ns4FrgpIbMNM+1DAlipefjWvxtGWFYemjoaaIFo+v5ThY7rUJSTv
         jeaL9ipFq1hRnErLE4RkHjq0WfYIertbhONRq+/5XIbO0u/j+Xf4+Tgi9fHEAi9kZ2ZK
         0otyDrhfj71Ot4JYnjyIk/s5VJoMdXOcBu/cu/8jIVPCkS2dyj46vYjVag70Dlzhg79I
         TOdYJK/JYQSeFBpsSuhcob5lW9HlGVRGNEgrjxIjIzUbufCTRcKs3trlyCeFXiFY6rYv
         25KUeHzvjFuiRxoH8XzivfhbB2+gIOfrMutwErQUkx6knTur55+M6FJYTX45Ul/y4JBr
         ZWuw==
X-Forwarded-Encrypted: i=1; AKwUvBwElD5JutsQP6IC5+hzyoZHaEjThA0Mc5xL8pZ6tDSCUMi+53DF0pdN+TPPXjBeS4/BVS+zkqJGEVXwO5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoFlouFxaJLkfngqQNeSDNcPNeziJXfKHaOz6IZF6hhTezt/52
	Dy1kNt3miv5WLRCIi+DllvN1EXqY0GPg8dGUoRlPfjf8ZCHL87F1SyhFQrzR7+NlxiVJl5vFnGz
	G0YpvZWNTwDKoNbW5A8ssFKg8Qv1chzX4foYCyIu4BrwS7HIKlw0qVquD0UKVG7WedAo=
X-Gm-Gg: AYBFou2+y3+WLbLVvUSpFBSl90ya05SpnQIg9coW99oX4O0XHAquRzQjUIDYmQuSem3
	QDAR8qQQYAIsITyao8wciVt8jA8Q0RImE8m2VNbKX8fIeLySfFCUHVdgBA7SLIZDRTxM741itSp
	dJ9LxNjQmf6qksnqRoBNqxLo2GhCC4s+vlWlG+iHa+f5Rs7XbgGO34D67YcWEVZdcZT4O2qVrY5
	M4s2FUEIi9GGK7mnWkRxQzQmuNTRiBJOgvIrY/kP0JUJlrSTFs1FIb7KvB3K+Qr1lkLtGtLzMPu
	dGGgYTQHVbpi9rXsJ7S1u4chOSc2qYVf5vxbo+Dxy2NZDFGRlDnYQP8fP8wtD/LqgnDSjJCdMIj
	lMwqq5NqvxeoHlnxVmvZQ1A==
X-Received: by 2002:a05:622a:110a:b0:535:1a6:6e93 with SMTP id d75a77b69052e-5359f4e01bfmr173143831cf.2.1791794362635;
        Mon, 12 Oct 2026 01:39:22 -0700 (PDT)
X-Received: by 2002:a05:622a:110a:b0:535:1a6:6e93 with SMTP id d75a77b69052e-5359f4e01bfmr173143561cf.2.1791794362105;
        Mon, 12 Oct 2026 01:39:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa8257sm434128866b.60.2026.10.12.01.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:39:17 -0700 (PDT)
Message-ID: <cb263594-15b7-4d92-97b6-e0d08e3d7c61@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:39:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/a6xx: Split out a7xx/a8xx device tables
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20261010154125.726149-1-robin.clark@oss.qualcomm.com>
 <20261010154125.726149-3-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261010154125.726149-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNCBTYWx0ZWRfX9qbtttRPj93b
 uVigAPiip9acZJ3oaxTAk9KSn5EtkplKtGQExTE4BjRCjVkNewc35KxA0gX+xaYBr/QLOFucZqI
 TC44jsZ2fRcNY+hVvF69LsYWCrRfIwI=
X-Proofpoint-GUID: 3CJZ8mi9dPkVvSJvumjwxE2KdHx_OCV2
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6acc9cbb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ysXiB3iG8gxY7zNvRuQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNCBTYWx0ZWRfXxDTpWEt1mwx7
 K2GeneibFZkjDjQvp+ob/8cmG6WoYyn7SGSPQ/hy4AtLoHHNOWLV03QqILSEc7GnVWlfM0zuDcX
 0zHuwkCKBjFF/bAoE2nZoMRxVLRIIMIu2jKxDHzdiEApZf9FEw/VVF2hOQqvXN0zQ7MWI7d0fif
 AGJFP15MkFTUtrsbNbzDkrl+xFdF2XxzqekkF3cEZSYXPeKlQw4QMddIkINxRW7ssWdKA5nzi6t
 azsGSEhVvCzaD2ZOrnzUzEy9bhU+B6XmKW7S0MEUpbyzEB6IfIXp8xBZePwoD5ZLR/ry8sRySG/
 bRo3AJkWaxg4OtJc73rLqSa8tn841mC/7HTvHZhrTLTErPjZMxy4c3mVE7byJp5aycYAzQykfl1
 PYaDHvaXtS2iKoGPiutO5qP59ZFzLXvgdJV5O65T06yQ6pEb0xSM0RpvKHoqS3w0J4m03Mg+3wf
 q7tDdy+R0Jin9PI1VxA==
X-Proofpoint-ORIG-GUID: 3CJZ8mi9dPkVvSJvumjwxE2KdHx_OCV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120034

On 10/10/26 5:41 PM, Rob Clark wrote:
> This way we can start including generated tables for a8xx GPU snapshot
> in the device table (without having conflicts with earlier gens if we
> eventually try to retrofit this approach, or later gens in the future).
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
