Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BF949B5D1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 12:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463130; cv=none; b=Dl+467o8KNSuBWYUb7ZbjYNg+lZolcB17H/NpObHxCvZSkec4gsk40lDWM5PfY9e1EYVVgWpcxMJzhbOuoIAIo6BFhowRDPGU/VFzNNuIPGIiqujQLLmriSaZIgOYtYzPwAoIOnI12MMUejSl1eY1ldL0zSKyRCUbiKHLtgTfvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463130; c=relaxed/simple;
	bh=zMqRuzzgdFJ1fm/eDvxR9LsZgHUvQ/RSkYZbPH5r4qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbU/c2BMOjwB6f9olyGqIhtSONP77NNBi4j2fWEOJksi3qyAq6Nhz1t97MwIc3bHiAm8xtha60kMy/8DJapKl/xcTAdhp0EkUYHLPWQcftzsRe5Cga8yr3hCb9tiVLl4QMcr3BGMu4XK6s8U3Q31Jhgb2d8kWoRFOTnPe/KfJ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NTF6loD9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DHr5o6Vf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NTF6loD9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DHr5o6Vf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698CZSYP2892595
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 12:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w39yKARDa1FO8OXgrwzakXgdnRwrZUAfxXED9nTH6Gs=; b=NTF6loD9JAkSxy1R
	zytdg1aU5L1MCUs7qngI973BOMNsmKbzjPWA4w7KqlKD1Fku6AHuuafbsB3v7/5N
	0AnOjjg6ZUs0OQovTwuTeC0BDj3hO5V4CjM+X4EngcwDQLAEx9cFtGekGv5nBfu9
	q5L+/LtWydsq4N8rwBGDzj9GzzabsCzkPt9ZomfDPaxUeStPZKI7pvZpZVWp0tH7
	To30l0CPhCB25eyBBgYn07dWUvQQnnUu4wGKCS0fZVrhVha5fN/1I/L7btDp5aWz
	kMRV8Qi7ccZ27SKAkpYRSw7KoN2NWJ3BhxdYInDSGtlKDLzrGxcjgQoJGVgRxzPg
	JQVqpQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj00bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:38:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179a2035a4so16515156d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 05:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791463126; x=1792067926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w39yKARDa1FO8OXgrwzakXgdnRwrZUAfxXED9nTH6Gs=;
        b=DHr5o6Vfntb5knQDc819EbjRErLTLyseZ0jki+N8YQnIeCskSrOcUydfgm/LiFR+Sv
         rBuAqPJipDxIF3eXi2UnTiT8ERR2My2Tm3pq/Iq6KKz2HYXzh+jFuRXIZmWUKF4rYDbi
         Xv36Vr1vazOO4C+OrBvAgQ8akBEgX+VEGKcc7Fycx8B7b+XfGrVT8TfJJ9qhhvNfAVBZ
         /nqvQMarpMWjC0sRhU3nWXEt+BNURtZ2zDGMg8xYCpuYL7htjRRHEntoVWdRlvNovQtV
         nEljiHJ1brrAaXhUaehwGhFxrOSMnj7U9TEBD27rhUou5rVZsTRI/wUMqTevmNNJFl2o
         EWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791463126; x=1792067926;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w39yKARDa1FO8OXgrwzakXgdnRwrZUAfxXED9nTH6Gs=;
        b=JaLax+06H7e1pioFNq1OgJdvTQJhIMp9t/+Nm5MkAAPONJWYCryQojq8sYvS7aWNfR
         mS8Dkg37FoBxBK3uNJWW1QPwxS/RAZB3sre+oKoc/FuOi4IfkFBom00QK0S6Gi9xrIZ/
         upZ06j3wFf+6YbHl+7jnyn+oCssV+T+0LVLDV4bOEc/USo2RwAjlANHlRJzXFarEkLov
         k/8ALLM7BSr2a3rxWuNXQ7fTvWZ9XoaspKrLO+ylKkyfMzjPu8SUN+i4/9Ei0zwE6yOg
         AQPT8lm7i5x/YN9Ki06RiWFfEnWSjWXcu50tp+gey6BaILWAU5/VioPBDTS1Xykt0U3n
         dcvg==
X-Forwarded-Encrypted: i=1; AKwUvBxQE4PdsMjX7J0A7aphIWdg2hhXAqjbwrYhuLIlcKvk2mrWWNdGmE0ows3VdFgh5XVgukRMAFKkssSLELE=@vger.kernel.org
X-Gm-Message-State: AFuF++kN/Db+JjYHiJEP7COlAuYFYzpmHMokWBy8Uqabka9dr9Vyna/E
	xqP3ij56EwuwtXNkcOkwXZoUE4JLffruViMe+f9iQ53tpgMoWziRCHsY8lhSeCFyz0wz9OR/oKq
	QVvmk7Zm5+Znq+toEJEzfXK+5VmAxEwmqgM8gsOZ1fhsuhddpQ+uwr3jhIIXUYAB+8o0=
X-Gm-Gg: AYBFou2o047mP2qDQE5gCaqmaeo5ysfIVSmextHim8+A+evPxDAmtgEB+gwAzFf7ULY
	VREVqGjT/PkyeN89JQuHQkNt6RMj83jDp4wx9o1nqZyR2ccrlA6NmeUShyaciu4cq0LVqGQDKXZ
	hoLvqvT027yf6vYAaot8Jw5461QWRiY03XETXRMImvSLz4ytecOek/vcHvP8Ga/03ebFL41CnEu
	tHorpCZkMSU34sGn1vqITo6qCK5dfDhZcTSbECOg2RpLZG83ZmXYjGR9Yc1Dgjy9S3wW7qK49t1
	4tgWa9/nc+IHwhQm8anwe1hRiqiCNLmRi+AvTrEUQuy9xXyFOpnMYmw9Qshy0wpkFsYJ4OMfxoB
	pDMeJPrh0vMXXKfzvnY5vdxj4RIAI
X-Received: by 2002:a05:620a:3712:b0:93e:9808:2e17 with SMTP id af79cd13be357-93eab16feedmr408126285a.36.1791463126338;
        Thu, 08 Oct 2026 05:38:46 -0700 (PDT)
X-Received: by 2002:a05:620a:3712:b0:93e:9808:2e17 with SMTP id af79cd13be357-93eab16feedmr408120385a.36.1791463125801;
        Thu, 08 Oct 2026 05:38:45 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e991fe1a1sm466011285a.43.2026.10.08.05.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 05:38:45 -0700 (PDT)
Message-ID: <02307f67-7767-4bc2-a701-f97e7343ee82@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 18:08:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: qcom-spmi-adc5-gen3: Allocate unique ADC_TM aux
 device IDs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Dan Carpenter <error27@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008031154.3440632-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20261008031154.3440632-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MCBTYWx0ZWRfX1bxzaDLkUrc9
 epqPRIW7x/rNfufsUQFPySD5TWaUT4TBt1v2v/99G5YDrsJlul/8YdeBqyZ3yA15beOwnHenM0u
 p/Dxkv3BYnxXknnyey9j4j7CDpUbmdaQzKQ7bnEUyGF92JVTYdAaciZpLSq6Wbmgpy66oe0qYeq
 QDiNJInjvP6GmE4A7MIQ2OcCePFWO3ypEP44hIygfiCpf3Sa6Zw/hL4Zd/6oKllFTLqMI4BX9B9
 R97kT0S9c4seqG4XDQ08He8DaAhJqnqCXU4H30VwAqhKwJdKRggyIhVxYIoAOuk47+3G7stf19c
 /E+rjdojH2rJfGxR91h5W54W84uY4dyLoxUHDo7q1dOSXoNNr13uHOZ9CvlVp07lUR8x8DuJtrM
 XaX9Qx91jdpAiSXX52ts4UuhfxTu12AdiXdXLc8E/PyadcpQxaoWFnnYLsUpSgBGOzaz+V8AQQY
 axnon/8QehccTy6kTuQ==
X-Proofpoint-GUID: MzVRS3d5yYd26WHO7nznbaiEXGV2HN2k
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac78ed7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=P0qyw1g9NGlai0uqiZsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: MzVRS3d5yYd26WHO7nznbaiEXGV2HN2k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MCBTYWx0ZWRfX13INWcNflPDE
 WWT+78EK4a37ZbLDUKXZsxlDIrFnL3lAtp7ziyYjw8tBW4dxdSfUHiWHD7fYm72zTio2izgVob+
 LVeG9yRasGO97pUsHiaVpj55jJsGQd4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080050

On 10/8/2026 8:41 AM, Shawn Guo wrote:
> adc5_gen3_add_aux_tm_device() never sets the auxiliary device id, so
> every ADC5 Gen3 instance with at least one qcom,adc-tm channel tries
> to register the same device name. With ADC_TM channels on more than
> one PMIC, the second instance to probe fails:
> 
>   sysfs: cannot create duplicate filename '/bus/auxiliary/devices/qcom_spmi_adc5_gen3.adc5_tm_gen3.0'
>   ...
>   auxiliary qcom_spmi_adc5_gen3.adc5_tm_gen3.0: adding auxiliary device failed!: -17
>   qcom-spmi-adc5-gen3 c400000.spmi:pmic@8:adc@7200: error -EEXIST: Failed to add auxiliary TM device
> 
> The ADC probe then fails as a whole, so that PMIC loses both its IIO
> channels and its thermal zones. This shows up on Nord, which has
> thermistor channels on two PMAU0102 PMICs.
> 
> Allocate the id from a driver-wide IDA and release it from the
> auxiliary device release callback. The ADC_TM driver matches on the
> device name only, so the instance number does not affect binding.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/iio/adc/qcom-spmi-adc5-gen3.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> index c68c6c5f6aca..f0b2544c1632 100644
> --- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> +++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> @@ -15,6 +15,7 @@
>  #include <linux/dev_printk.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
> +#include <linux/idr.h>
>  #include <linux/iio/adc/qcom-adc5-gen3-common.h>
>  #include <linux/iio/iio.h>
>  #include <linux/interrupt.h>
> @@ -608,7 +609,14 @@ static void adc5_gen3_delete_aux(void *data)
>  	auxiliary_device_delete(data);
>  }
>  
> -static void adc5_gen3_aux_device_release(struct device *dev) {}
> +static DEFINE_IDA(adc5_gen3_aux_ida);
> +
> +static void adc5_gen3_aux_device_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +	ida_free(&adc5_gen3_aux_ida, adev->id);
> +}
>  
>  static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
>  {
> @@ -642,9 +650,16 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
>  
>  	aux_device->n_tm_channels = adc->n_tm_channels;
>  
> -	ret = auxiliary_device_init(&aux_device->aux_dev);
> -	if (ret)
> +	ret = ida_alloc(&adc5_gen3_aux_ida, GFP_KERNEL);
> +	if (ret < 0)
>  		return ret;
> +	aux_device->aux_dev.id = ret;
> +
> +	ret = auxiliary_device_init(&aux_device->aux_dev);
> +	if (ret) {
> +		ida_free(&adc5_gen3_aux_ida, aux_device->aux_dev.id);
> +		return ret;
> +	}

Thanks, this looks right.

Reviewed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

>  
>  	ret = devm_add_action_or_reset(adc->dev, adc5_gen3_uninit_aux,
>  				       &aux_device->aux_dev);

