Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21FE3CF1E7
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373895; cv=none; b=NZ7+z2evwnTW/puAl+dTBWNPJFiiTEBEFGs5mlYHXWdYL4brIQAcd9GT8ZeFYzjI0gVxKQkARD9YvOZqx8+Q88dOh7ACn2YK7dz2VsvX0DcJ6JKO0rEEWYmEHl06YAWeeIrKa8L/hK6SAp8QFazDz7pQfV38X50LWFRrOAg+qfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373895; c=relaxed/simple;
	bh=LpFlYyMb2zB0aUYWDfn++RHM4Z40HNmIneYQrmoAcK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RakXCDl/LiCqZRLd8G2FG7Loyqb+F6rHo/CO2vIcwUJ7CugByRlr/gwif9RqU9GILrRIzT/nAZyT/biVtRLtD0ZQMjiR84eOv8Bngi6QEHjo3S12eIEuZpETw69EJVX2YZRXoIrSJIv2+wke9S+zYu+raa7XejgkxXt4ED+VonY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCpXFkwV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RTH/dIE2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCpXFkwV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RTH/dIE2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV2gg2969302
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 11:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XtdNBtyuMYUvpdnC3AqmffuEoE7lo8mm8sw8bIFZvDA=; b=jCpXFkwVbJv22Gtp
	PfcOpQJynVnz4u4uXnFSYjyjYXDH4dvY8rsSKtmSqpqJbRHlKFclK0AmuRD6ECe7
	tN6Gmb9HUAl5YF3oKIsZZc0Blymr3e30s74AHayPsChoqSO/ezS1V95lI3DhR/j7
	7c9YGqTA0yO2aJ0DrhgOWDG6du7LQSnsap1K5KenZhGsh+81c4RiYnHP1/2TSn5y
	NGJ1l+e7VCkN5Zhg0t7WD+p0b2blnDUj8kVhY6d4O4HMibIkK3mPxXRJKgtPOZ0G
	Z4h7xe5nWDangcEAg62F5ChmHJlewNj6B7dw2G/41n4XTAK1sxCwpu06rx7Wj31l
	cUtI7A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u1wuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:51:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917b76ad48cso87468696d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791373879; x=1791978679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtdNBtyuMYUvpdnC3AqmffuEoE7lo8mm8sw8bIFZvDA=;
        b=RTH/dIE2cfH/+1SXj5Gkx6kL/rb2x8SgiOUMMqaFE3XAe6Zk71fyxX8O9WuWeo9iA6
         Mkz5fIEpnv9pRBNhqJIb7+88phWYjy9X13dtKRkHVJK8rMNtZBpYtE8f4+J5Bo6poty8
         an27anpEXKIJQCPhEMlFSpz0ITJ7k3T1rhX3pP2GZewhP7HWWVHj7YSSofP34qwMi2TL
         PMJOF62i9jaJ4KIZzzvxCtscPEGyQOs2uuvkwmCvWIb0+UmcOnXgg/0Wlzcmc2b3+CXO
         lVDf+5w58k4uysywOCYbhsC2Lhx2Gxiu98FuYtaFGl+o03PDUmrZnJsmbAhdeKD8WEFs
         vWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373879; x=1791978679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtdNBtyuMYUvpdnC3AqmffuEoE7lo8mm8sw8bIFZvDA=;
        b=Z34s3AUcJ2NjAXXBPMPKNEqGYazSe+vgvVpVNFTWoza/WoXux+qS3fwouic8FHSbCd
         aaX7TgKugTaJlnJijrYxe5+BbXRGHOzpyiH/3deK/aOWLr4QuvQ88zmeiRf/4YgI9F3Q
         SXROp8i2CVU8EoskIMYXPC1zOwIph/m0whR8GHVwv/uOhIHpjmCyt6h9+U/MT+Z28+0S
         iWPPgmLDlkuBtcPLe8pfc0biO2/YuNyCR+ArNbiBFzCAOln4biq2XpW6M9iiNA+XMJJh
         Et66+qSFCk9k0qYPktjQ7RvWfzYbLt12gFovQH4e1ZB6beUIUgT5VQIXhVMip2+q7Jja
         pkXg==
X-Forwarded-Encrypted: i=1; AKwUvBwU+1OualURjkOZAdQSHODyDJcMm54EzOXR6UDo/Ur1aRhzAjBmywS2gAhwaqoKosdPF9Dq0b2N6725ia4=@vger.kernel.org
X-Gm-Message-State: AFuF++nOdM/XAesrzEi468bo3afLZsiqsCGTkxGCYAW3GxHtukWF0V8y
	w/iwILijNlNGeHxFBvzpiJ12+HxNe0WLO/CJFTjR4dk2c9zEM5818lVqnijBZEnG1nWPxjr1BQh
	07SUbMyxh9kGBuvguruTWe7GHe6nFrcrJjJtc9uMovZjhuvMwsA2kORGyT+7m4lG5c9w5yUDCGe
	4R9hVP
X-Gm-Gg: AYBFou21Q1LD4/2TaVuiDmOSPz/3GxmycvGofE0Ni5/jjdulLisgSC7in9KhWcaqZ72
	QWA7jiORZ9aDQdsd1rsWldqEcMBh5XOGoxbQRQTp1KM3vDvtFclxUEwgUuYHo+CXmdPXA/V6fiz
	cAxGEXHI9MNPqqPgBAxYWoDC0repYABU/e1X8qmRldijmVu6IVckdnRI6dNKG4ZY794sQwGYcOG
	0JmRas1bSksxEd2GTI3MyKYTqqbZVW5uTXMgB8BtvUeGJJKBAucDesom91hWBJh4cvKLwMqGw9b
	Fqti+yZSxaAbv4RMX5TYLyQDO7fTJdkIoRoy83puw/f3vtvSU06KCsUcif6pn28qmdP+6SrIWpF
	E57WG4wERcbNRuOyzz0BiObDi8WFDuiiQ+ZzkWDk6NA5B
X-Received: by 2002:a05:620a:31a8:b0:93e:634a:99c8 with SMTP id af79cd13be357-93e9b71c00cmr339091085a.25.1791373878652;
        Wed, 07 Oct 2026 04:51:18 -0700 (PDT)
X-Received: by 2002:a05:620a:31a8:b0:93e:634a:99c8 with SMTP id af79cd13be357-93e9b71c00cmr339084385a.25.1791373877989;
        Wed, 07 Oct 2026 04:51:17 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2d563sm4984894f8f.41.2026.10.07.04.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 04:51:17 -0700 (PDT)
Message-ID: <7bb74631-6703-4a30-a7a7-424ce6340a03@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 13:51:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/2] thermal/drivers/mediatek/auxadc: Register per-sensor
 thermal zones
To: =?UTF-8?Q?Nils_B=C3=BCchner?= <nils@buechner.me>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261006025410.506443-1-nils@buechner.me>
 <20261006025410.506443-2-nils@buechner.me>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261006025410.506443-2-nils@buechner.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NyBTYWx0ZWRfX9m7ifqDlL0aK
 aAlc/7MHnaCc6REqM70oysL3f7xVNYoByQ5mAFupqYrkB40/RNhTmGSPgG+yH/C8gbe9gOebD4T
 nHBDcrSDHSAB0FiEDZnM9z4ZGCNE43s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NyBTYWx0ZWRfX0ZPro1Pt1CEk
 r22sH7s3B99ZfYrQX5lfyTAFuLuXCIvIFOVBbCtvlTddjh8OZdUjsvHYhVJS63GDg7ZP6HFZSTU
 BdH/6zl28VuVYo9lEZrhwrKWJxmgTOYMsMeN+Q9Krt8llYmuWcQHttON0ClrhYRVDkVffkbh2IX
 4btUeJztbUr+ruat3FBdnx/V/NN6g6fy80u/1waUgl6d2UqebLbMxVhnac4AV+7u8lQBZv0cuIy
 F3D/aoBW70UX1qMVr5nFMqvLLi+h00WGZpzJW5yMuH/TdyuyT/J6zGRZX3r+SFkxTUT6R6tNiN1
 ezToeZmz463zsnqXatayKxizUm9W7HWuB4yhjc2jLYLs3PbDw7Ru0D8XZXWBEpRu5orxqXkvNpf
 remEH4f0yumYuChKh/thdvGMkSNtKuK7fXVBNL1aTD0n4enm91zW2pM751sh9XwScqgFwPWVTxA
 WVp8T3eLr84/dR/Ys8Q==
X-Proofpoint-ORIG-GUID: CSPJUmnFq40_6wzgWddR-rr8qp6zG5oE
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac63237 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=twVTte8M8PIwAJgjBN8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: CSPJUmnFq40_6wzgWddR-rr8qp6zG5oE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070047

On 10/6/26 04:54, Nils Büchner wrote:
> The driver registers only thermal zone 0, which reports the hottest of
> all sensors. The MT8183 devicetree also describes a zone per sensor
> (soc, gpu, md1, cpu-little, cpu-big, abb as sensor ids 1-6), and
> mtk-svs looks up the "gpu-thermal" zone for its GPU banks. Without it
> SVS fails to probe on MT8183:
> 
>    SVSB_GPU: cannot get "gpu-thermal" thermal zone
>    mtk-svs 1100bc00.svs: error -ENODEV: svs bank resource setup fail
> 
> so the SoC never gets its calibrated, lower voltages.
> 
> Additionally register every sensor that has a devicetree zone, using
> sensor id = sensor number + 1, read from that sensor's own measurement
> register. Sensors without a zone are skipped, so SoCs whose devicetrees
> only describe zone 0 are unaffected.
> 
> Runtime-tested on an Acer Chromebook Spin 311 (MT8183, juniper) with a
> 7.0-based kernel (the hardware is not set up to boot mainline);
> build-tested on mainline with W=1. On the device: all six
> sensor zones register and read plausible values (31-34 C idle, close
> to the board sensors), and mtk-svs finds gpu-thermal.
> 
> The change and this changelog were drafted with an AI coding assistant
> during a debugging session on the hardware; they were reviewed and
> tested by the submitter.
> 
> Assisted-by: Claude Opus 5.5
> Signed-off-by: Nils Büchner <nils@buechner.me>
> ---
>   drivers/thermal/mediatek/auxadc_thermal.c | 80 ++++++++++++++++++++++-
>   1 file changed, 79 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
> index 9ee2e7283..59c8eaf87 100644
> --- a/drivers/thermal/mediatek/auxadc_thermal.c
> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> @@ -308,6 +308,13 @@ struct mtk_thermal_bank {
>   	int id;
>   };
>   
> +/* A single sensor, exposed as its own thermal zone (DT sensor id = sensor + 1) */
> +struct mtk_thermal_sensor {
> +	struct mtk_thermal *mt;
> +	int bank;
> +	int index;
> +};
> +
>   struct mtk_thermal_data {
>   	s32 num_banks;
>   	s32 num_sensors;
> @@ -870,6 +877,77 @@ static const struct thermal_zone_device_ops mtk_thermal_ops = {
>   	.get_temp = mtk_read_temp,
>   };
>   
> +static int mtk_read_sensor_temp(struct thermal_zone_device *tz, int *temperature)
> +{
> +	struct mtk_thermal_sensor *sensor = thermal_zone_device_priv(tz);
> +	struct mtk_thermal *mt = sensor->mt;
> +	const struct mtk_thermal_data *conf = mt->conf;
> +	struct mtk_thermal_bank *bank = &mt->banks[sensor->bank];
> +	int temp;
> +	u32 raw;
> +
> +	mtk_thermal_get_bank(bank);
> +	raw = readl(mt->thermal_base + conf->msr[sensor->index]);
> +	temp = mt->raw_to_mcelsius(mt, conf->bank_data[sensor->bank].sensors[sensor->index],
> +				   raw);
> +	mtk_thermal_put_bank(bank);
> +
> +	if (!mtk_thermal_temp_is_valid(temp))
> +		return -EAGAIN;
> +
> +	*temperature = temp;
> +
> +	return 0;
> +}
> +
> +static const struct thermal_zone_device_ops mtk_thermal_sensor_ops = {
> +	.get_temp = mtk_read_sensor_temp,
> +};
> +
> +/*
> + * Zone 0 reports the hottest sensor. Also register every individual sensor
> + * the devicetree describes (sensor id = sensor number + 1): MT8183 SVS looks
> + * up its GPU bank temperature through the "gpu-thermal" zone and cannot
> + * probe without it. Sensors without a devicetree zone are skipped.
> + */
> +static int mtk_thermal_register_sensors(struct mtk_thermal *mt)
> +{
> +	const struct mtk_thermal_data *conf = mt->conf;
> +	struct thermal_zone_device *tzdev;
> +	struct mtk_thermal_sensor *sensor;
> +	int id, b, i;
> +
> +	for (id = 1; id <= conf->num_sensors; id++) {
> +		sensor = NULL;
> +		for (b = 0; b < conf->num_banks && !sensor; b++) {
> +			for (i = 0; i < conf->bank_data[b].num_sensors; i++) {
> +				if (conf->bank_data[b].sensors[i] != id - 1)
> +					continue;
> +				sensor = devm_kzalloc(mt->dev, sizeof(*sensor), GFP_KERNEL);
> +				if (!sensor)
> +					return -ENOMEM;
> +				sensor->mt = mt;
> +				sensor->bank = b;
> +				sensor->index = i;
> +				break;
> +			}
> +		}
> +		if (!sensor)
> +			continue;

Please move routines into self-explanatory functions and make this 
initialization function simpler to understand

> +
> +		tzdev = devm_thermal_of_zone_register(mt->dev, id, sensor,
> +						      &mtk_thermal_sensor_ops);
> +		if (IS_ERR(tzdev)) {
> +			if (PTR_ERR(tzdev) == -ENODEV)
> +				continue;
> +			return dev_err_probe(mt->dev, PTR_ERR(tzdev),
> +					     "failed to register sensor %d\n", id);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
>   				  u32 apmixed_phys_base, u32 auxadc_phys_base,
>   				  int ctrl_id)
> @@ -1294,7 +1372,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>   	if (ret)
>   		dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
>   
> -	return 0;
> +	return mtk_thermal_register_sensors(mt);
>   }
>   
>   static struct platform_driver mtk_thermal_driver = {

