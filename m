Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D653BFADD
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439423; cv=none; b=YE0UwlG5jWF5A7iGRvdUU9spZLUw02b2YN1c8RVRUCQmlO3nZuGpFMx0i9QFOQVEU8vrT0Xtn6OoztjKkqaUEGZ5JBtmirlErsyUCMmIQMIg9TU1DdOInz+zBHeppjhopXftUPg/hboq5sO8NorWDVhfPrZSbppNgqfISrCCC/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439423; c=relaxed/simple;
	bh=BfxXVYVYYPpqCv3HAvsQt5PI5vltB2Nryb6YiOlFIas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KqFDPpwff7vAJlARPrVbTs/y6qAq8zrX3tt//K4srQYd3h4gavDUhpWGZ39rP3qWYoHoRNo9Q+n2ve04dFq17FmiA8UMzRsSfgDiQgXPNmPDQjy4olDWtTE8covGtYdfy/ZmLRTJJ5zm3mkYmToI0iWu3SsyNQmTvZWXWSpowus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKedmhNF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTSKeg2e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKedmhNF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTSKeg2e"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BRDM2895384
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mSaIxRplK8lz+P1pRwiYiDK6KGDj44xaxOfHDxftF5A=; b=iKedmhNF6wKBd7Yh
	RKacicca1vCR01Ht3TDScm1DS40cMDTqIX6GJpUQ6yhLWP0Jnjw/VVCQd2rcDjpQ
	aoHvLtd6KAeO0RV8aa9jlJ9bU8Q2uuVygZKmfCiA9J+UwLeYTLgY71+eA60zwLzU
	FHkcUar39nWxZP8z1QnYGWeYM+xOXIhO9axjQDa180J/C/M5ASSA56hnZMCxMSZG
	vobqZ+JNuzgGlu3pJwXM3GMxKB01kUOEyPG1+mArStfvZQzVKmMqQ6u3vaZCBHbB
	t3lFd7UdwclQiTOQxnJhM4OPKHS7ufTvYs164tcmKSCQHUhoE8wytmxs941O0uDX
	jGF8Ug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg8xmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:03:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso150559885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439420; x=1792044220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSaIxRplK8lz+P1pRwiYiDK6KGDj44xaxOfHDxftF5A=;
        b=aTSKeg2ebHPXX8co72Te7wet9M2hOuPggWC+eT7iQxaRouh6b3YzRzkYtm9O6NXeuH
         ZpymmsnOCGsLK7/X6CfUqLqmzNDNJH9oRGNI7fpEFiMi0qhE7lWtZyPDQ/EGmFR+21+C
         EkOgG3nBB5kmWfX11ULk5lUFZvjV7EVtIDn9OgZALGNTdAQO8xTPk3sfaegxc/RSIdm8
         J6/oA1RxnqrYPaAMumHCpvycV1P36GWCnzcLXLOfJ9r+zP3Rp+lC+OjLyvigu4pdF5Ys
         N4nCXL0f3yLh9VvEGbSAc+4RXQ4o7nP/qTzj4/RswpJb8U8g2mUepocHCG5Qg31SB/Md
         H+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439420; x=1792044220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSaIxRplK8lz+P1pRwiYiDK6KGDj44xaxOfHDxftF5A=;
        b=PuHhvRTKm6BvYl1b9RQQ2Mkxi9MKqE19xcs3+67BoqZuDDk0ZNlumT+V6BbmBEh8RY
         wLpdgQ7Gc+Y4jVHRrNh+ikidwNg0fKxpx8b5V2I3nVQ08X0DnRFPpEk5qywgRzOiduW4
         8zNS340cAbS0v4Z4PMV9j5HlcTctJeVBeIncOlprE2eyb6F6Gh5BNvfBU1m/EAHoGuuL
         Dw1IycWz18ii4WWxIa/ZFkYbRqL+LbDKFbByCceacjIMDh3GHvr0dek4P8Nx8ddcGdpS
         2sFlTCfjhUsWfaNbZh8Vydcrfe5N7a84ku5WaTvwXFPZtwO0fWVlxoqT4WXkdu4BEO5Q
         MolA==
X-Forwarded-Encrypted: i=1; AKwUvBwCbCm181wKFFJjsamrPhttFjBOkTaocSZvEXLn5IxDflrnvTKynHuV03LLEqdkrT5/R+PxKueoqc+7SlU=@vger.kernel.org
X-Gm-Message-State: AFuF++kyo43jKnhQGyWXR9UTm0ffdR/vGgDDc4EnkeRb/ud9o/PWtVC8
	wvO1zkXAlbudRhHvLUZhJMbbiEcBwwFPhAFnensuio61SE3Ce9ZSpeSnq56YmIVd2vb0k268gCD
	sgtGD0ocfpGT5LDOzXKlVlMbEmoGXQmUzfFxkzAaLCQTOH66Qk2LDQ0n1jqFMkEKjGRw=
X-Gm-Gg: AYBFou0m+mZohvgExEYXC5VbmzvjJOZo/7S9QKgkKDGNeqadeKAcEvwPoYeM47BO8qX
	yZaSZuGAtkx6i77HjspduWxygo+sK77FIWsQ3WqDy18JEfJqvCDSYegx8WnMkaHeRmufhQz2DOt
	6Xob5Ds+BXBEk8qR4Ool0hsGSrEkrbEzk6iTzssOz+3gbTboqzdCnpYPhSmcOE+Aj9ZDrgjb0+P
	KIX6Yon2bpxSE2mAdHvOoMqqjnQEiolGRpcfatrMr/sGtx5iGBjYD6MIqF3OAlHpbsbiqYdGxrD
	cSl16dGK5ELfJSApVRDRlsviR+v8zZAiFeUQUN1TdWX51ZbJqbpaGWJZw9AHRh6o7zh3ryTP8Xy
	uLpdybdBy6SQxQ1oN6XgG9Lhv5SEOOc7/PdeoemI=
X-Received: by 2002:a05:620a:6f04:b0:93c:3863:ff7f with SMTP id af79cd13be357-93eaaab7cb0mr260592585a.0.1791439419763;
        Wed, 07 Oct 2026 23:03:39 -0700 (PDT)
X-Received: by 2002:a05:620a:6f04:b0:93c:3863:ff7f with SMTP id af79cd13be357-93eaaab7cb0mr260588485a.0.1791439419116;
        Wed, 07 Oct 2026 23:03:39 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d10272sm9294896f8f.21.2026.10.07.23.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:03:38 -0700 (PDT)
Message-ID: <f548cc48-9ba4-440e-b673-dc3e6043dae8@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 09:03:35 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/74] media: qcom: camss: vfe: Specify number of pads via
 line->num_pads
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-29-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-29-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eq88Xi2jXggvjL253sXY242FyeGmSaZV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfX/PMaoxBtcROh
 5chNfji+sfzXeOb4BHp3aW6OO9N05fIxcNDc3Oew0kcK4E7SNXZoO43v/WHNmzeH2XSGO7OYLmp
 i9B9MYJsWvCYLxSB0Gb6of9Qh9gfTzs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfX9963syVTjpcL
 KIba1sXLWHTMwkn4P6ceXzTi5dx3JS5u0Bu6BM9bxBlg1dgHR4MyWz4MGFbwCYisK3FxsS2DeZ9
 TzfSNBx2SV6c/RXnKUfAgOBFdQsKL3oTSTN9hNI3YwIpFM8BEDBHHSQfOL41ge9qLCGd/H5Y+IC
 0QTdq8+0tLn5lJkD5YpAwvKRNDEbXqHdlnWvLMo2qRxN915NqrgZvIF9BtZ5luUL7gKYvpF+oR6
 eSylrQLvF9JA1urqRZn4GuC4Q+SvSZXDMfvmZPnwqXb4JRIMtQ4PoAt6UdbKk8DUqRiAeGALmOy
 IZ+y8nxQS1c1PmFJ1qLfPYnFsv8D2FU6+FMtAvif7m4o4Xo/XSX85P11prTQFzGM6WISHaXeS2b
 /MIcI3bjzSDB4HcLG3Cn4xWlMaryhiF80s+s0LgiVZ+D9q9YyUai80IX+6Tj5arcdyXGQjWAPH3
 doQhGQrBsyDVXfbfvDw==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac7323c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=05VxW_4AGZEvXVWIsKkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: eq88Xi2jXggvjL253sXY242FyeGmSaZV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080023

Hi Bryan,

On 10/5/2026 8:13 PM, Bryan O'Donoghue wrote:
> We will need more pads to support the pix path - allow the code to specify
> the number of pads via variable instead of via fixed define.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 4 +++-
>  drivers/media/platform/qcom/camss/camss-vfe.h | 8 +++++---
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 35ab3203d75af..3fe0139f82d16 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -2050,6 +2050,8 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>  		l->output[0].wm_num = 1;
>  		l->output[0].wm[0].bus_client = l->id;
>  
> +		l->num_pads = MSM_VFE_PAD_NUM_RDI;
> +
>  		init_completion(&l->output[0].sof);
>  		init_completion(&l->output[0].reg_update);
>  
> @@ -2231,7 +2233,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
>  
>  		sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>  		sd->entity.ops = &vfe_media_ops;
> -		ret = media_entity_pads_init(&sd->entity, MSM_VFE_PADS_NUM,
> +		ret = media_entity_pads_init(&sd->entity, vfe->line[i].num_pads,
>  					     pads);
>  		if (ret < 0) {
>  			dev_err(dev, "Failed to init media entity: %d\n", ret);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 8bc07fe7798e1..8fee26a0dc2e6 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -21,7 +21,8 @@
>  
>  #define MSM_VFE_PAD_SINK 0
>  #define MSM_VFE_PAD_SRC 1
> -#define MSM_VFE_PADS_NUM 2
> +#define MSM_VFE_PAD_NUM_RDI 2
> +#define MSM_VFE_MAX_PADS MSM_VFE_PAD_NUM_RDI
>  #define MSM_VFE_NUM_OUTPUTS 1
>  

Having not documented structures is ok when everything is readable and simple,
but having same structure used for multiple platforms and different valid fields i think
it deserves documentation and comment. But that can be done in cleanup patch.

>  #define MSM_VFE_IMAGE_MASTERS_NUM 
> @@ -141,8 +142,9 @@ struct vfe_line {
>  	enum vfe_line_id id;
>  	bool is_pix;
>  	struct v4l2_subdev subdev;
> -	struct media_pad pads[MSM_VFE_PADS_NUM];
> -	struct v4l2_mbus_framefmt fmt[MSM_VFE_PADS_NUM];
> +	struct media_pad pads[MSM_VFE_MAX_PADS];

Can we group per pad parameters in separate structure in future crop and maybe some other fields we be required.

> +	struct v4l2_mbus_framefmt fmt[MSM_VFE_MAX_PADS];
> +	u32 num_pads;
>  	struct v4l2_rect compose;
>  	struct v4l2_rect crop;
>  	struct vfe_output output[MSM_VFE_NUM_OUTPUTS];
> 

Regards,
~Gjorgji

