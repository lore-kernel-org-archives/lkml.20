Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB290286D4D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789527868; cv=none; b=Yi5Z83G/0TKCMsWL+wkMne4F/ioYJWuM/SKJsmOUOLJIhJMgQnOzGT0cIo+DjWkLCk53BxMCHk92tbQTcE5hpvRQRXPegPm+n/TZkpJ4El7eLSwPeDC5JsDXR0uIczn3dpA2E4nDPeEicOSKWO+q5SZ3Hly6TQb+6VYILs600jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789527868; c=relaxed/simple;
	bh=MU9B/81WOtFQ+cdbcUsWBDcvGH45XkIkKO89K6pXFoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXnJmX+LaCpL0RrCj/R0MtfPHCKR8vaEOvkpcEZPB+531Nah/fnJFfbZvZyR+MeyKqVTIh7Kd45DY6gGfiOn+dJ2LWFB55HF9R6ez7h2VS8Urqhok+HzvQgwiVo8OaUsEpNLIlhcTu0N7IzR/BBvtva7PZGgeOlqXt8py+j7eCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5E96PD8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4vectyS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5E96PD8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4vectyS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYeBZ225019
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Mt4vKOZALY1yI7qCOWowx88+jkqRlUaEI4ns7rSpbY=; b=V5E96PD8JDfAzOlY
	rYURV+EVteT0BEUWkzaCgwi92Zoa9ICO/4OhQ4SX+Cp9yO4o5EvgQ+aW8T2qdGPW
	qDAdw25yuFiJKDcuZSvmJmOfxfjZnVyK1bckD4oyBLrfp02+wKQomCogYy7zKkW0
	W/ZR7pwgJABwUHJqHlfjE75CWtPPYaw5SCdwBv9jgPoeNTJDb8nGghXDZ4iFViOP
	y9HBe2Uxjtveyhje0MC7w1CT+Y8hk2zY+5gzhSnGXMrmFD1U5dcaQdYoNQKZ4Oef
	hja++lJNKhxjSzDdA0DivpOG9Z0m1YxJJ5cPA72PHC44Z+5z+FHZ8dnb3WTNx/hd
	4eAnVQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnhkx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:04:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8679cfe5019so7984301b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789527865; x=1790132665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Mt4vKOZALY1yI7qCOWowx88+jkqRlUaEI4ns7rSpbY=;
        b=h4vectySzAGaI74BYeo92AHJtLBs2SV0+eQyKWpegGwZaGYWYMSXV1q+3K5PPdECTE
         f/izB8ug4wF59CCLTkW28ZaMv6W0IkEHHXn0+cS2iT1anxrts4oTREAHlyW6Sguug202
         TWRmMSY6kLfzMuhvGZIZbR/xM/iMMPDlXGLvp3r+ZR/NwGd5q1+zNPIrnkwBIghy97K5
         xAxvbpJSwlAabRY8tZzUuKV1ezlBpBMdWFEbiN5Y57RnKdJ0CMuUZPJeDV8tgQ49IBWP
         HWogRf0zNCwuedYp30sorgoXFGCWeLr+9lYisteCBifkb1wezRkTOxMk+3/b8VZCQKHa
         RL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789527865; x=1790132665;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Mt4vKOZALY1yI7qCOWowx88+jkqRlUaEI4ns7rSpbY=;
        b=UicuJ4xMtH272TwwIErWEF+/clykkjYJdmPi18r/UEq9TsiUS482P+tiziHwzTy4GL
         1OJSMOXJ/h7dPIT5SXZzVDUPEFOT919M4cTPTG3uYGTRB6fpSfjIAuxrdxazBHMMXAud
         zvz5ySi4yIKaUP/ZMhOMdMSF/ekmr/2d8VovAN1+QIzNb8IuH1nihRpQGVrOH8iumXWa
         /KWylflsO9iJHb1H6GWGGQXlGj8YTUP4QcvL+58WoRAlG5e4kkhFooN1bEoQiFa+ADLD
         L9Cl3TISVvYJroHgth9/qVn9nyee+H6ld+288/8ZWULSv5DDVWDY0y7byPjAX8EOSjnt
         xFmg==
X-Forwarded-Encrypted: i=1; AKwUvBzkuNbgYKwJNFWS8Jd6fAT04nUDArNEUsUgAjtN0tXaAmO1DTWW15XHIsfUr843vkRz38BlOWgpVZswUfI=@vger.kernel.org
X-Gm-Message-State: AFuF++kSq1HfYv8HLYcivnSFP9MX3FuRRzdYh2wiZeF2gVBXdXYHNr4P
	KRoxJYnGK7ta3uWNe13mTFqcw9XFRmzYys/svHO4sGsfOlr5hYJOI+PJDciKnDIGmcYXd2CZFHu
	xVWkjZJGdI8uqByWXEkwRh72Ic19Blw/td0M+ZTOBC7CEzZe/4A2MlMQ1DoEyvoN1PUw=
X-Gm-Gg: AYBFou1hGpqmki0RZ9ZaMo2qjxZ+s1Af7+xFloDnvZMFPF0DHRasjvk+hDgEUm578fh
	OnTfsc9iKZQTRGpb0wYk0V9hfJWyyDrF6u+YPbNTYEvtEaUkVC54T9y6hmYKRoF1SinZV4TvcSU
	A8L/0fsiRUbfJipx3j4Vqa+DQSuLjnv4Cf3Hv3QJINXL5NIqmX28KepS6WNdiIpxBsMFhQGwchI
	dG8BKqWnN44yeXiIpWZjsFd6BPUsgaJ/1ubcNUb45ATJtqjHwWAKcTzujrwatNhXqXEcmuowjs9
	urSs3FafVMnOlpQJCI0Kcb2YEPlP4kLTjJAad2SHAkwaSpF5k8ist1n1zolD/mXRIjtnpvece3x
	ihdeqGHUP5mYKoCxsz598kRB914goFDDc6PjdARsZ/p6eOvvL1X9fTK/gxpmYUUysmQ==
X-Received: by 2002:a05:6a00:17a6:b0:845:e9e8:645c with SMTP id d2e1a72fcca58-8723a7a4fa1mr1400449b3a.6.1789527865178;
        Tue, 15 Sep 2026 20:04:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a6:b0:845:e9e8:645c with SMTP id d2e1a72fcca58-8723a7a4fa1mr1400412b3a.6.1789527864705;
        Tue, 15 Sep 2026 20:04:24 -0700 (PDT)
Received: from [10.133.33.124] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8720124322esm442266b3a.31.2026.09.15.20.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 20:04:24 -0700 (PDT)
Message-ID: <b803b63c-8278-4159-9305-f71ed001bdc7@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 11:04:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] coresight: tmc-etr: Sync the trace buffer for the
 device
To: NoNine <chenmin83@gmail.com>, suzuki.poulose@arm.com
Cc: mike.leach@linaro.org, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Min Chen <min.chen@siengine.com>
References: <20260915130503.645953-1-min.chen@siengine.com>
 <20260915130503.645953-2-min.chen@siengine.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260915130503.645953-2-min.chen@siengine.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa0739 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UdC6xETiAAAA:8 a=HTs3lNVCq07o06pvmvIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=ybX9D8xwk0CjW0O53t9p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAzOSBTYWx0ZWRfX0irGfARscgg1
 gx1LV+FxqI1hdVCBcw0rVn57hwswsOKu6Fq6Wohi4Wcr2D17MrdUop5b62CT/vOwuldJ9L7apUk
 2vCcNK2QjFg5vNl5VA2/8BtcHj5dh3FHMZhFwiHG6Vm55QfOAYPaUW7Fm6YgH4IQ7yt6MfrTrDR
 0I5ZJ8H9hqQPXAKx89UQv+mV+1oyNvNXVJkgiQ+hy3y8842CqL49/dFUniN68CK9VwR2EvwTGlj
 CdDIkX+EzphKu3+xiZfKhALqi7/IhtPEMXZlyZq0r7lHiBnhfZ2j3wH34A17G98KCMmp70x5X0U
 e3O4W2SGeoulL1TKvJTqRav9D4BpxfPgVW33Ga1wHhxYmfoXU1XMXxK5RmDl0xUuVQ8sHji12SQ
 UUvCcmbsBOSP1poG6gjSyFgk4nFZrBSptYACl0WZWptrFpb7B9gI1dADtsF4CCh7L56RVg85Q5i
 4v6UeftvmxDFLwpeQMQ==
X-Proofpoint-GUID: a8XB54NIDsvXSNrj6MHF9Ghu-u4V_qNG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAzOSBTYWx0ZWRfX5kECAUsoPPCI
 UXgC8QjVBrMsESMR5J4e7O4n9exxcUNHEQOeULXEfHKnG7K5dbIWBbz7sGZh0DnMMuS8Y6iikUd
 WYkTILYWzLFQ35v7zhK4r3JFyXIjkIk=
X-Proofpoint-ORIG-GUID: a8XB54NIDsvXSNrj6MHF9Ghu-u4V_qNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160039

Hi,

On 9/15/2026 9:05 PM, NoNine wrote:
> From: Min Chen <min.chen@siengine.com>
> 
> The flat ETR buffer comes from dma_alloc_noncoherent(), which zeroes it
> with CPU stores.  The DMA API requires the caller to sync the buffer for
> the device before the device writes into it, but the TMC driver only
> ever syncs for the CPU afterwards.  On a non-coherent sink the zero fill
> is therefore still dirty in cache when the ETR starts writing, and its
> write-back lands on top of the trace data.
> 

Agree, without the sync, the dirty data may overwrites the trace data.

> Add a sync_for_device() buffer operation and call it from
> __tmc_etr_enable_hw() just before the TMC is enabled.  Only the flat
> buffer implements it.  The ETR_SG and CATU data pages are synced by
> dma_map_page() when they are allocated; their remaining corner case, a
> barrier packet followed by a live-drain re-arm, is left for a separate
> change.
> 
> Tested on an AD1000 EVB: five first windows on freshly allocated
> buffers, including the first capture of a boot, all without the
> previous all-zero-formatter-frame runs.
> 
> Signed-off-by: Min Chen <min.chen@siengine.com>
> ---
>   .../hwtracing/coresight/coresight-tmc-etr.c   | 29 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tmc.h   |  1 +
>   2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index 76a8cb2..bf1d6c6 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -689,10 +689,29 @@ static ssize_t tmc_etr_get_data_flat_buf(struct etr_buf *etr_buf,
>   	return len;
>   }
>   
> +/*
> + * tmc_etr_sync_flat_buf_for_device: Drop any CPU cache lines over the trace
> + * buffer before the ETR is allowed to write into it.  The buffer is allocated
> + * with dma_alloc_noncoherent(), which zeroes it with CPU stores, and the DMA
> + * API requires a sync for the device before the device writes into the
> + * memory.  Without it a non-coherent sink writes into memory while the zero
> + * fill is still dirty in cache, and the write-back lands on top of the trace
> + * data.
> + */
> +static void tmc_etr_sync_flat_buf_for_device(struct etr_buf *etr_buf)
> +{
> +	struct etr_flat_buf *flat_buf = etr_buf->private;
> +	struct device *real_dev = flat_buf->dev->parent;
> +
> +	dma_sync_single_for_device(real_dev, flat_buf->daddr, etr_buf->size,
> +				   DMA_FROM_DEVICE);
> +}
> +
>   static const struct etr_buf_operations etr_flat_buf_ops = {
>   	.alloc = tmc_etr_alloc_flat_buf,
>   	.free = tmc_etr_free_flat_buf,
>   	.sync = tmc_etr_sync_flat_buf,
> +	.sync_for_device = tmc_etr_sync_flat_buf_for_device,
>   	.get_data = tmc_etr_get_data_flat_buf,
>   };
>   
> @@ -1113,6 +1132,16 @@ static int __tmc_etr_enable_hw(struct tmc_drvdata *drvdata)
>   	writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
>   
>   	writel_relaxed(drvdata->trigger_cntr, drvdata->base + TMC_TRG);
> +
> +	/*
> +	 * Hand the buffer over in a state the device can write into: drop
> +	 * any dirty CPU cache lines first, or they get written back over
> +	 * the trace data the ETR produces.  Only the flat buffer needs
> +	 * this; the ETR_SG and CATU data pages are synced by
> +	 * dma_map_page() when they are allocated.
> +	 */
> +	if (etr_buf->ops->sync_for_device)
> +		etr_buf->ops->sync_for_device(etr_buf);

Can we add a condition to perform the synchronization only when flat_buf 
mode is enabled, instead of introducing a new operation that is required 
only for flat_buf mode?

if (etr_buf->mode == ETR_MODE_FLAT)
	tmc_etr_sync_flat_buf_for_device(etr_buf);

Thanks,
Jie

>   	tmc_enable_hw(drvdata);
>   
>   	CS_LOCK(drvdata->base);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 6541a27..3dd17da 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -277,6 +277,7 @@ struct etr_buf_operations {
>   	int (*alloc)(struct tmc_drvdata *drvdata, struct etr_buf *etr_buf,
>   		     int node, void **pages);
>   	void (*sync)(struct etr_buf *etr_buf, u64 rrp, u64 rwp);
> +	void (*sync_for_device)(struct etr_buf *etr_buf);
>   	ssize_t (*get_data)(struct etr_buf *etr_buf, u64 offset, size_t len,
>   			    char **bufpp);
>   	void (*free)(struct etr_buf *etr_buf);

