Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585435;
	b=Gcb+1o0C3UGgx0NqIpFGDoYTd/TcVUafxLtYmu1GAmFrXy/Ap5/EDjB+6/X6MwbVEv2E
	 hzHSwYT3piMk7xQWbyJGO8EXMY+vbT9FMqbB2jPDiVPUwBgtw6BxcIdBB3jM9KUa+9r/t
	 hR4t5qoreNDeAU6D24UUigt38cqBb+EC0aUGX3QxdpowFYl0YlV0cVwiDDxKajTalWSOD
	 34c33Ew9xA9nTPF9FY+hsv66DbCtmm3R8Eu5yh4vFh9YzZO380DpbDqj4b/D39DXkQWTw
	 xqNWzxheD/wPHz8rwSwjjZ3dc25/zS9XLfPr20B2Z8YzXxyo7zAgciiCGOaTowhl7DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585435;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Yuu4QueJRDk0ija3ekrKStL4rHiHPhZxLi2O9vwmeE8=;
	b=zzVjU41A/xz0CuwfwGAu2b+Xkb2xxEE1+S6wQ7bZojEhN2N++yZIny3BFEuUkOAAsKk/
	 Cky1xfiVOugRVcaVtxAxO4Wz9LER6osvmmqL+ICAH14YCemrE3vHp9RE+S3H/k1HTaXaG
	 jMBenLtnAnpdpRVw8X/+xf4IqBVY6ZLakcJS4z8Waucpr6x9fiKq2sWdDhzOTTi64f6/n
	 hTAPiLY4nrdDUoN/cloQwZ7M7IFcx0tlXyoJICP8hvnOEbiwF0F8DeND/qV/U07f6Jp4a
	 WFzv/4Z9pQzRwzvc/GoiJ+6BYi9HLWG1qLWqiW2hABEJQd2y9utAkhgY6Kgqi3zR2GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gEnf9vQx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FB5gCjdN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F655606A324
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F655606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gEnf9vQx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FB5gCjdN
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgBsP3225476
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yuu4QueJRDk0ija3ekrKStL4rHiHPhZxLi2O9vwmeE8=; b=gEnf9vQx12aDBTF5
	yrj37zkFVateVsaNP1nmWrclXd7+e66p2UuN21RwTd65ufnFQGK54TSn1vo+42WV
	89i/AkWcRCKXJF5F3TxQXbtTpNndt6maLm+cbbdt9KryReaubmLSn5SiSHDeMndz
	Va0ZhgurgdhaFWa4oBEOfus6FN07fOR7PXg6sTsjTZkGxNGww1Mbs6VSxjasa3KK
	enqHjewWj2uUfJla3dM4LGGxoFEIdyfTxk4BuN8z2EI0oeX0pV88cNR7/J3u7gBS
	13Z8xLunjEjBXggX90MSQM2f5+w3hoq1wxs/H3d084SDbUcrdsOWw5pNjgjM7oSE
	lrsNiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78ynm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:23:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e629c7b16so16100385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792585434; x=1793190234; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yuu4QueJRDk0ija3ekrKStL4rHiHPhZxLi2O9vwmeE8=;
        b=FB5gCjdNHBGuOfja4VRTD34ADcxdJvb9byN12az4+3wJWTstMebEbuxkU3JX9u5c5j
         4j7z8+YrjzE5fFhnHpLnacZb6/UMI2sXOxRhRSHDRTZCPNWNlfNToUkgPq/B7Y61dQry
         eCAcjaVKfrPktZ5kFE2XZdD/1biHSTfKhYNRzEiVd8C7c1ANjEnet6LjWZhQIYhSHTBr
         6mzWDFnjXEXXfAtrogz9u4qgPDCxKuzDI77OWdUdc37pnijvKKO7acw3kzzzGW3ik5qt
         frbNEoJrJ+IZFAMbr3OTZjU6KECoRYdh6LsVsriSKt4lC/p6/hSSiPrxvLL1U7vqfVL3
         MQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585434; x=1793190234;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yuu4QueJRDk0ija3ekrKStL4rHiHPhZxLi2O9vwmeE8=;
        b=bfsDCLXqRBOtKhwjE/BTjNt2jPQ9CA8HD4CwdBaWE4IvnpbGXk+Nx/fX9A6eGRhl38
         vkWDQWQd4OLHIlk8EfVvAP1RYN8kRyAjKKQZVa7a3x5RbniEFnZd/gcPWrYZ3Jrqzwmh
         N8J9Aqlov3Ih6Txs4c6ZTwUz31Ii7GTiMENjcgX5pD+XQIGS6sbmHdejfRDx6vp6m04k
         DnlAQkjKo1Ind1/6/HboY4d5KMWazM+x7G0PYw2fLeLaNWMDXmk8HTn3z2T1EEHDxn6W
         EqRLjo00ToCAf62RulxQbmt2ymdYgFPD5dkpaTlMT9y2XlefAfdf/ZmdMNYc42SOQXGk
         /hIg==
X-Forwarded-Encrypted: i=1; AKwUvBysBeEcmhPOUsOf6fM3nFFu4OEXKe44mXZ4/jg6GnDsuVcC4n+/V+CLYiOB+JFtCeqp7yuqnI0gu30BKIU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUytwpcRaHSJie7Y+C5RhPQ9DX/Jdmmdl+lZcQcYi5OB4wufQd
	P7LOj5Q/Juxc+iKnwVyQiETMuxZM3etgGWn6u3JVYVBVbRz5L712D99pWWyoZdfYy4Ha9fCOi+B
	OmLsuD3nZE6XpYXNGJ7JkyJIDfxFkR2LwclF9MW+aeWC/UTAFk6vjU0hyTBilJZCA/LI=
X-Gm-Gg: AYBFou2jJd4s3C87dU2XvU5FSkPvwBwRmO+JPl3GfmtZ2w2X42p7Wbt3RaAlGD5V1xT
	mHzd1ZErzD7cnUNJhN+wCKBVSo0H/DbxHcw4lDg0TV9WESeKwHVdXw57bLCeFsroyPgqLylc31w
	5OHcDsb9sDQAddQM35TqLzkbWJT5wo7LlmB/uHJea0ZwHYHok56AX1g7VhHbIkPqUHGB/bSUMZ3
	sa62UsPw9y2mXZ9z7TF+8OIXUcxJppdRvDkIkgvmBsEr5cQYRlFPFAFy1FDx+QCNx62cJOZeKNp
	GwdRHxM7z9HvPeqUr5bcSq7423Oto5AkmOhOCthtLCb0Np3aQeU1jv0O58cYzk1Y1NanEPnv7CH
	96+hF1ejB30XzdezWGWJ+8g==
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr425427285a.5.1792585433602;
        Wed, 21 Oct 2026 05:23:53 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr425416385a.5.1792585432004;
        Wed, 21 Oct 2026 05:23:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b402f2a8ecsm827827a12.4.2026.10.21.05.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:23:50 -0700 (PDT)
Message-ID: <2c748a4d-b416-4f33-a6c7-195ccda6a5ee@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:23:47 +0200
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
Subject: Re: [PATCH v3 1/4] soc: qcom: smem: add IN_PARTITION_RANGE helper
To: Albert Esteve <aesteve@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sarannya S <quic_sarannya@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>,
        Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
References: <20260924-port-smem-v3-0-fbc2ea81a654@redhat.com>
 <20260924-port-smem-v3-1-fbc2ea81a654@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-port-smem-v3-1-fbc2ea81a654@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L6EF_yLSeGbPim0wNRekLnTUmySoGxBS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OSBTYWx0ZWRfXzlqsIuXe64sN
 up3FhKQcWTdJVthN+Y3FJmAxHAopUAV7IaFq2hZz+WGGXRd42b5ydCYuQXbDerVxzDsNReuuSde
 nmKkVF1LUxBQ3iK361Z1/bWHVBC5hKN3vZQjbY8JxvdPxC8eNeYj/38Y1agzp5Lynh0/cutz7p7
 vYMvnlBwrfg9kygPNVsCRKxyIAH1hQlo7bSmtUJz8QM+2TKeglTBCmJz84KGpQauhnHbcOQfmUK
 4X9uRj4KvgVfG3JKkaYUQRUGnBCGz35+hnyPMNo6hLzSs6+G6mOvEDinb6ycN22Z57n9j8YU0p1
 KX69Si+7vli5aIl87PaAyomIYP5RK6xqLidck1ogRurKfyvwL4B6hJD/0mYuD3Gq5Nj3n7cto+0
 m/fsL4uXygOkj5jHFwOrIzAQI7eL8561TVgtfFvVhTPVDIZXd9cOD0qkiMG8F/kXP+GFqj98fpO
 SifsEt2mdh+EzyjF+jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OSBTYWx0ZWRfX3/mj/QGgBN13
 aAIpHn3eJ3CE/LV2In+LALE5EKvFqLrafvuXvaJpvyHXltML2rfnAkz4AW+TGfK+ZyDU+CnqA39
 1QLT47V2/+XApISye62GiwuSVEOnTKA=
X-Proofpoint-ORIG-GUID: L6EF_yLSeGbPim0wNRekLnTUmySoGxBS
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8aeda cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=WmP_9K7zJC54z-20-kMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210049

On 9/24/26 3:10 PM, Albert Esteve wrote:
> From: Sarannya S <quic_sarannya@oss.qualcomm.com>
> 
> Add IN_PARTITION_RANGE() to test that a pointer lies in [start, end]
> and that pointer + size does not wrap.
> 
> Signed-off-by: Sarannya S <quic_sarannya@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/soc/qcom/smem.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index b5e7bd8c1512..6783a3c533f0 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2015, Sony Mobile Communications AB.
>   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
>  #include <linux/debugfs.h>
> @@ -88,6 +89,17 @@
>  /* Processor/host identifier for the global partition */
>  #define SMEM_GLOBAL_HOST	0xfffe
>  
> +/* Entry range check
> + * ptr >= start : Checks if ptr is greater than the start of access region
> + * ptr + size >= ptr: Check for integer overflow (On 32bit system where ptr
> + * and size are 32bits, ptr + size can wrap around to be a small integer)
> + * ptr + size <= end: Checks if ptr+size is less than the end of access region
> + */
> +#define IN_PARTITION_RANGE(ptr, size, start, end)		\
> +	(((void *)(ptr) >= (void *)(start)) &&			\
> +	 (((void *)(ptr) + (size)) >= (void *)(ptr)) &&	\
> +	 (((void *)(ptr) + (size)) <= (void *)(end)))

LLM is unhappy about the 32-bit base and suggests this instead:

#define IN_PARTITION_RANGE(ptr, size, start, end)		\
	((void *)(ptr) >= (void *)(start) &&			\
	 (void *)(ptr) <= (void *)(end) &&			\
	 (size) <= (uintptr_t)(end) - (uintptr_t)(ptr))

Konrad
