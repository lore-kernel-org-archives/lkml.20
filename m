Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5A543A806
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976442; cv=none; b=vFFHKMkIWj6UW5eTIS4X09Z4WW4kARJA5SzAFyn73s0eQUHxcn8Tn0JgXT7+YVk4ou9xnYkbaj43GyKVgk1vryy9KOpm/wThICwfdSPCFrrPz6OAuRinMhL78L5Qr1llzVCgxGSdhA0CLcWbAxyqAMiWQpU2gL1wh9dgNY3QI3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976442; c=relaxed/simple;
	bh=4eD74MwKhN0aMZI8VG5TG6F2fwsOEEYUrLJzPn3MfwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jhq4V90/TnEMVXodhb649zQ3y4af7qHiAtL2kCxVNChU9CP2hOjzaECo1IA3xE6+0HVDSY0sStgoz9m8NmjG3BKEaxI4BII46MTr/ucNeQMI7hBQJi6zHovPXc5TsAJPc7eENdFIoKva762sw5ewahelN+sPtsza/OGVy0wMncs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1x3Rkxa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PqjeXJWm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1x3Rkxa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PqjeXJWm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79tAx1624378
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXBm8BbIlNlS9kij4DyUUNrfUO/dqmeuJb9GLNDGhLA=; b=p1x3Rkxa/Ri6FZmM
	swaVj3mjJj1KVPn2xk0A9rf15aEH7VumO78sNYkHdG9Jxv5CZDq6k7x7YZngk1YE
	+ItJUGiXVT3z+pIHQXeqRtoYV/YTlnMLbVa2xUzM3UmrVrYqoaWWRII9YE6w1soD
	bEeODR9EJoiRQ3e+QLtCiaiXWGseqodbd3A6p2gsd4ctBk2dvQx7oom+VugiPa9W
	ff2SREqjxxDqeq3BgthSa70YPo37OVTQnTzq1uuxCs5lXfavekiGjabfpaIJOxtc
	QMUYk7VCyI9C7enFvmn4F8jZXDgNKH6xVSL2qmFAP+upuLhzKvHH/BuxeymaiHGq
	JOlAXQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3ws76q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:40:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530cd3dff25so4313871cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789976440; x=1790581240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXBm8BbIlNlS9kij4DyUUNrfUO/dqmeuJb9GLNDGhLA=;
        b=PqjeXJWmfxg+WsufwKmJ8aqdzSBgXmAnshb88DneKQpWb+oTBH3uZwz/odbdW4iOJF
         dqV2V+alJVSnvOYKtKem7qwaM1K8jCKUoAjH6AqXbiZTeqP/DscCqL3LV005UvwQ40JJ
         X4U9sC4jJr3D9yv9dZExXaqlTOv4AIEmSeoui6UZhUbKsSIAMX1/GSXote3YwuPlfGui
         ActWNDmuBzK8flh/8KCO0IX2qarTLTuCBIDiy2xk6k9ZNpP2T8xtDHnu3Gawa2Gf7qDJ
         k5gvTMrywbcfgzNIv8wPDwWNLzv02fLiFOxOLfp1le0Zj0Rds4mqGJ3HoizYs/+waEo9
         jSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976440; x=1790581240;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXBm8BbIlNlS9kij4DyUUNrfUO/dqmeuJb9GLNDGhLA=;
        b=Z5sIWO9cMpHVYYtSEh5obnzNZ9XatHRU8DCztCwtDn1uPE26nYXSEWx5hT7Ng8y4tl
         7YOq38F9B+6YKQh2cu7/aArdExkrGD1LUvrTg7D0Ey+4e9vj8R38tiMr32diPxSArxzM
         6hSt4ICyFfSciM/YZbG78KCAUX3rTDvsomgXyIsPVA2NKNtF1wmifjTtusoTzyDn5Gj2
         Fn3B1ZWWBHRpTMzf5cOXLQFVak1NRg+TNTOIyzyKmccvPhL29nyvH18R6x5kmYBDG4E3
         cd1vMQeSyjVzWBhlSjdYlZ1DfCkmQwsZfxgffLQfbc8M+cwQDmqnSYaBZrxt29KdZ2kv
         823g==
X-Forwarded-Encrypted: i=1; AKwUvBzM3VZGv2vScze9h0+SnWRNlQ4l6YmauRKMlE1aO5C7HhnzdOseoIpZGEYpdC/sHydk4w7Bh2m5tdbaXeA=@vger.kernel.org
X-Gm-Message-State: AFuF++laGXfa1xcQUjGvhWibYCoxs8Q5+7PudbJmdpFD8CXsMTxbN7CV
	OLHKfIK5fN+NmEid6+AVvnKBvdfTfXvDC9zZXq2DcvOxKjYRrnoceJM/FhLyzgkGPwutVzlpO9Q
	iaiGeFBLo8N4aXsjGYVOZOOGNDzbif7ZA53oNssAPQoGrVSWTWkaQy9Gm1QhaKrIQIn4=
X-Gm-Gg: AYBFou0nk7eEDZ1VLWf2sulN/TrteaJUPOKYCG7CafbVOJEEhxgiACPBLPgt5F9HAnQ
	maWztu2UBIa8eD6I+9GWdr0exyncIqby/WraveeLSt01SU4HFBHdKuu6lZopHVhtSry/QZYgdjn
	KOjBSyxZ6mfC4v2hUsl23cFleZPQOTJrPT2rQMh/I9XPTPK06evHmJOQMWTWfi4Rv/Du9jveVku
	WE5UJJkCxWpMax68CfijPQtbNrh6Xv2IXgKGIdtfrJWdNKaO1SjVvp5VAilsLQVSdC9jKVRHYSo
	gLm0oK0xf9K86DfW14btqAGrUc4JnHbWBP5N9YjOyKToZ2sZPlO4z/9jyQyBEkuApu4JiwI8If2
	1qe6Kj6EKpwGrVMMYjKxoMQ==
X-Received: by 2002:a05:620a:4803:b0:939:b8da:1242 with SMTP id af79cd13be357-93bf518f649mr907436685a.0.1789976439787;
        Mon, 21 Sep 2026 00:40:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4803:b0:939:b8da:1242 with SMTP id af79cd13be357-93bf518f649mr907434085a.0.1789976439390;
        Mon, 21 Sep 2026 00:40:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67d821efsm3775171a12.10.2026.09.21.00.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:40:38 -0700 (PDT)
Message-ID: <1eca3b55-fce3-4a39-9e0d-2c6d1fcd6a86@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 09:40:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a5xx: don't read the GPMU registers on GPUs
 without a GPMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260920-a5xx-no-gpmu-v1-1-714200254f76@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920-a5xx-no-gpmu-v1-1-714200254f76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEwOSBTYWx0ZWRfX1SOHVZnlbaRM
 koKKMHvs7cjF/4BRiJnJ8oSMPXBRJXAtPazwWqJTRLYFJ4h+z3FLHXFQll4P5xj68dzvaaB46t3
 naE4n2uADvVKYRiRQ+jWX/Jl44jfM7fWP5ZQuPBo1Jrc6X8VvVBoZYM1snHVoHnBI74hlIlLB8G
 ZBOL9mnfgdYncKRth6QMsCOG6l62MtMaaAGjhT1L7zRjtTvpBs8lbm0E5oXC65ZVIq9HDZ5nd0a
 z6YvLGbbRVQgFRVg6dC05+6fR4lCtgmmc46YnAG4AOfezeXYRdoGL+xeu7dEp3dmSRE+nalOp5X
 AI0byUIDZNG/+3ECfkVyhT2FfB9PQznef+T5CKIc1xeM6TPTn1xNVwHR6Toff2s3vI2La2zVgOv
 6eKV0ISziMEi3x5FHhqOMySH/Y4kXtO6q31X+75NF/MVrBlo34pdCSVL5cMmVbvz6NOd36LEqEr
 RorHOYnA8nxVOwZV8Ag==
X-Proofpoint-ORIG-GUID: _Q6vWqernHggwsA0LQfIzi2rXIQl0XOf
X-Proofpoint-GUID: _Q6vWqernHggwsA0LQfIzi2rXIQl0XOf
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab0df78 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nNp-cgRbjtXmMSB73TMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEwOSBTYWx0ZWRfX+J5xfBhb6FCc
 8GOWgD/TGjf1Qfm6fBdPnlUtVFjunz/chVwGv4qJA9iibag56WnlOJnEeBJfR/6vqWEsplRMGxk
 TUqaU3kdggwgF7BQ2z8GwUVRJ0+iL9o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210109

On 9/20/26 1:08 PM, Dmitry Baryshkov wrote:
> Only a530/a540 have a GPMU.  On the other a5xx parts, reading the
> 0xa800-0xac60 GPMU aperture during a crashdump resets the board -- on
> sda660 (a512) a GPU hang thus reboots the SoC instead of recovering.
> 
> Split the GPMU block into its own array and collect it only when a GPMU
> is present.
> 
> Fixes: e20c9284c8f2 ("drm/msm/adreno: Add support for Adreno 510 GPU")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 49 ++++++++++++++++++++++++++++++++---
>  1 file changed, 46 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 5d96b8f63156..3974aaf6fd33 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1337,9 +1337,14 @@ static const u32 a5xx_registers[] = {
>  	0xE800, 0xE806, 0xE810, 0xE89A, 0xE8A0, 0xE8A4, 0xE8AA, 0xE8EB,
>  	0xE900, 0xE905, 0xEB80, 0xEB8F, 0xEBB0, 0xEBB0, 0xEC00, 0xEC05,
>  	0xEC08, 0xECE9, 0xECF0, 0xECF0, 0xEA80, 0xEA80, 0xEA82, 0xEAA3,
> -	0xEAA5, 0xEAC2, 0xA800, 0xA800, 0xA820, 0xA828, 0xA840, 0xA87D,
> -	0XA880, 0xA88D, 0xA890, 0xA8A3, 0xA8D0, 0xA8D8, 0xA8E0, 0xA8F5,
> -	0xAC60, 0xAC60, ~0,
> +	0xEAA5, 0xEAC2, ~0,
> +};
> +
> +/* GPMU registers, only valid on parts with a GPMU (a530/a540) */
> +static const u32 a5xx_gpmu_registers[] = {
> +	0xA800, 0xA800, 0xA820, 0xA828, 0xA840, 0xA87D, 0xA880, 0xA88D,
> +	0xA890, 0xA8A3, 0xA8D0, 0xA8D8, 0xA8E0, 0xA8F5, 0xAC60, 0xAC60,
> +	~0,
>  };

I'm not sure if there are holes in these ranges in the hw, but msm-3.18
(8998 kernel) simply has:

0xA800-0xA8FF
and
0xAC60-0xAC60

(both ranges inclusive)

Konrad
