Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E2E339361
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957727; cv=none; b=noynyql2t8MArp9e7B67aA7DphkR6t8mWx8AC/dFEWoD6DulOfYDehexb/NrTqlPJ+4p09sLjf7Al6i4tkgdKjo+Nj3/ljFfFXvcdFEYERqaxUc6xyYKvkxYNtMvU07b+8GwF0wjIA//Y2dp5+PBZvRfZmsyy558BJGvoFIQhYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957727; c=relaxed/simple;
	bh=stLCkYxJ6QOmDpgV06/UDcu3jC7cDAcM43Ynr6QCEtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9t6QdBGV+WEUL62Bkl7eT5yrYd8fNdVwJIr5eY4BoiyFVcD2ldRYQ9BnOkGJ8VBsqmvYSjfBhuPgB6UIhUCRgmF1Y//0K14CQQqtFP0SwzGNJpyyZZX5vs0UZN5gFWGPkIPoW6baGGbtTNr+EEx9ZNCGUkUMMer5+DAQpke/bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B865agWi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMEyvYvD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B865agWi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMEyvYvD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGjUn434945
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 16:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4taZxg5NwikgZ8WugpDCZYo+IsY0Yfdh2Zj5teOGtTI=; b=B865agWiG5xspc+w
	WgWYYTqo+iTDyWJshan7tS/0iYYuC8lGR+4kwt/DWsWZKIa795pZF27cbe5MihjV
	HKaFySRImpS6J/rh7LLasYujdDcU8h7L76xmVtGIV+LiEUsfI1vzif/j08NMiGiO
	ckIBOi/xvfPTajGZ9z4IsoXv/RugnUSLiX4rHydwuqwFU3iFLE7+SRQb4d1BYK9/
	gMcyCvakdcmjBUnO0S3tcfq9+xHDde4iH4Xn/R0Id6wfWLUwyBJWeieCyJoxEpSc
	K+VEX7rPjVS2tfVizRj0Qzek4I/lIo4liYJSRTIDAhxPWgAd1j2HLjtRfsodcsWy
	OZAQfg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxebypm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:15:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so69568a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790957724; x=1791562524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4taZxg5NwikgZ8WugpDCZYo+IsY0Yfdh2Zj5teOGtTI=;
        b=IMEyvYvDnWhIiVHrTwxNI2rWPoX30JrPhgVAkAxTj8lNk0T+FhDIMuMKR0FlzhC/LK
         ZiKcTIVqtf5PNCyLSrwmr5izzZpsuw24d9E9tDjxjOziyORkiOvqLqnLJ5okL+2qQRan
         tRLyU7d1rk0unp3pvvDKvrF1ZaR9Z+k3am7ERNRKlledp6tPG+a2A3Q0syGWVDQziO1O
         jsN4v9JzpEfVSugHROYE6YZ3edjXhm/QpMU/0qKN312fWFiN6qOqvaoHo+GSRBLFyM7S
         QFqb+aVln/FTUteFQGIeYxeaO2PPq6zt1W1iGizZ4GZE4/H6e2uk1pCdiP3Wm5/XLfvh
         hJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957724; x=1791562524;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4taZxg5NwikgZ8WugpDCZYo+IsY0Yfdh2Zj5teOGtTI=;
        b=ppRJ8L6Yyo0cPPMoFDh9iKJsnIz2vey6sxLL6Gm2dK4c5hL+5D9LEhXJK8uInQ2BJk
         pDRRTNE7XvrRL0/BtF/AVwBvPd8jXo4Dxx9dmx5YbMuQ9XKPKwQL93vjMU17EJ7RxgxV
         il7tSmF9QIkyzh/dCWEA9aesWXq53FYwCASZkfZPwSc7Eo/DSdInb3qvEB9Vy+8WqilR
         oUKd+NNnm8h8+WWRqxAldF3gVjkQx6RKWFua0pFvnLAMxP/YJOP7bIgGQ9Ii8f1IS/2v
         m3U2gDE8jDbDsHj2Z+3HBSWxy/AZarWMX8riU7YtJ8biJRvBZ/wH0Yr6PaIpMiRl/pHJ
         bfOA==
X-Forwarded-Encrypted: i=1; AKwUvBy92LO3pETppDWQ4vRnMEZGbD4mMqMcvEVueiF9FUqqzw08qdAYs9ZKGMTkCd3l7gg0jpos5jlaYO7WAPw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBPJFRqnxJTeZnK0bUfJyMtlc1XLAZK/jeV68dVEgwhwlPUiIg
	XLNvb1gnR9bRs050olpurHnGLXXQXaAbE1wgMvG0PWdtHqHEcWXZWsJOcGuqzZ5l4WuTBK7FXFw
	bs3LM3mIcSHphKpKIrGFxUQPuVa7LmxxmumsIIdAs5hCgIdnsiz2rfqz8JdP0RzB3RCMGDM0ZCj
	g=
X-Gm-Gg: AYBFou2QG7sOXmMFHgpT3KrhsEOiee682LsCJSyM5kmZyHgKZx0kmAFXHLJnk3C4IxK
	XHhJBGfvn5+dhYQNOtKvKt2bnET1cMA0wWrzWu2klqNgmAK083N77+N3oe8b8cOihvNReA1DJ67
	T+DO7taM5ygVBIKpz/L749vIcsuhZwtJlHI9vlsAIZtSRuO7J8deDrkSyLljkwj5+4sw+bSnSRP
	dEZE7B6EoeGHPDJ9uWm3VZ/RKlvjEZ0YHZrRMT+cqw5VctojCQuk31ALipsb3yle7RlIcw7rUO+
	K7MU5JyJieKNBUvBm8gSxVkBX7786odfH3AysY3RKbb4KP6ASRG9yK5gK6xG2YZYkimCNUkQJ2u
	pUL1Bf0huM1m7Z+ykVIVOF/dffph+NUZgUgl0xNnyqQag18+uvg==
X-Received: by 2002:a17:90b:2804:b0:3a0:50bf:d497 with SMTP id 98e67ed59e1d1-3a6ce5fa39dmr2940506a91.3.1790957724394;
        Fri, 02 Oct 2026 09:15:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2804:b0:3a0:50bf:d497 with SMTP id 98e67ed59e1d1-3a6ce5fa39dmr2940474a91.3.1790957723876;
        Fri, 02 Oct 2026 09:15:23 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7384ca1sm1221797a12.21.2026.10.02.09.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 09:15:23 -0700 (PDT)
Message-ID: <439f1169-5fbf-4d68-97e3-c37f31b2116b@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 10:15:21 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Cancel Sahara read data work on removal
To: Myeonghun Pak <mhun512@gmail.com>, Oded Gabbay <ogabbay@kernel.org>
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Ijae Kim <ae878000@gmail.com>
References: <20260917192512.56205-1-mhun512@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260917192512.56205-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abfd89d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=oeivAFFXM94eOaBaf2QA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: I3REpbJR4R-t-PfqgxXavfk1BnbKTzWV
X-Proofpoint-ORIG-GUID: I3REpbJR4R-t-PfqgxXavfk1BnbKTzWV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2NCBTYWx0ZWRfXyKvhzPrqwxMj
 LT9883gEepvPiPbAfJdSus3Ap2nBIZd//e69S8MBba1H5vtFC56FSSSOU1CYdNsZSU8pDscHIVF
 w/YipSbJ9IqmGbrwal0U4Lu3Mmxy2Tcj4UbDFA7kCK316vEC66FvGoeub5fVqd47gTq4DCjh25q
 BuroL4ap90ETCmM7dakyhJ4baL1kjFfT4ynM0coNlFKxu0ZGUEZ2eHgi+tVrFma2+E1ZQ1EFinT
 5jmC04T51C+H7jY3GYUi6LYZxIjNwDzzKpj+Hvxq4HEXg5ns0UWveB9gDPItlrxyMyx1ZtObszR
 PrSeV8EdRcoZQI1uOd8Fp7z81HKhKqbptvemVoGngfxAwGNJycv2J+A517ESKAYbtgxBycEG6NP
 d4hCab+PV80dQEW5QFvkokZ/WTG/psIQsCTYPV5+l7+qctUztgIE+HgyrbtcPbleaZ2OlR3EWdP
 /hQYQKzxtaqqRHmJ5Tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2NCBTYWx0ZWRfX0btsqqQpSbck
 ALRGbJhZxOY3HTfiTBoxFyFHvz39KqjjDM7I/yKtoOaWMCHu11P0ASsGoj+JMo0ipMhLcbye3++
 +31dhNXPTR+6ObfXqez5xd8SBvVcgSY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020064

On 9/17/2026 1:25 PM, Myeonghun Pak wrote:
> Sahara removal cancels fw_work and dump_work, but leaves read_data_work
> pending or running. The latter accesses the firmware and the device-managed
> context and transfer buffer, which are released during removal.
> 
> Cancel read_data_work after fw_work, which can schedule it, and before
> releasing the firmware. The MHI core suspends and resets the channels
> before invoking the driver's remove callback.
> 
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code. The same omission was also reported by the
> Sashiko bot while reviewing the Sahara relocation series.
> 
> Fixes: 7fb19ea1ec6a ("accel/qaic: Support the new READ_DATA implementation")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/all/20260701105055.8D4371F00A3A@smtp.kernel.org/
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Validated with static source review, apply checks and strict checkpatch.
> No build or runtime testing was performed.
> 
>   drivers/accel/qaic/sahara.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
> index c7c0b3eb4b65fb7776a6c724cb3105046cf6f7eb..6487961bbf14a1c284caf91f500968b90a064ef4 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -879,6 +879,7 @@ static void sahara_mhi_remove(struct mhi_device *mhi_dev)
>   	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
>   
>   	cancel_work_sync(&context->fw_work);
> +	cancel_work_sync(&context->read_data_work);

The typical convention is that ordering of operations in remove() is 
related to the order of operations in probe().  Adding this line here is 
arbitrary where it would fit the convention better if moved one line down.

I'll fix that up when applying this.

>   	cancel_work_sync(&context->dump_work);
>   	vfree(context->mem_dump);
>   	sahara_release_image(context);

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
