Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164A93655E9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406141; cv=none; b=YdWC3yACURODxaSx7sYycER3NGm1y8rF2LiwLQA35EHlNwDK0a9joFdaUG5gFMhPFcKZxo/lQsRf9+zhJX5xydQJZNpV/7R+gyXR7Ot+4mhCT1L3PF9Rb9cLO44WYLz1XLF3zYNvJd1qn/6s/KR6np5vW/j81PuRJs4rL14PgG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406141; c=relaxed/simple;
	bh=5YSumAJkut+d4m6hA/k/o8Qy2TpDlcjGI64m1JGd32s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gH6R+2rFVAVAtV/nGytslONNvGBkrlsDbZXaND/rCfaC8H9l2Zx1pN7imeQ9prclVgsmIeehnE/ceISMjP2t7+/sbeNp0TjISNgyLlZGNIHrHlhL+Vmxr17Y0eUoYAaiMEUoQR8rSIEnWGyn/vaVHO24ss8Gob4DdMvy0xOMVVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrHOrTuj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ICZjOf3G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrHOrTuj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ICZjOf3G"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68330B7n2752612
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 03:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHg3U6ODch+jJFZP2j5QNR5qAwxcN/LDmywtPANSK1w=; b=BrHOrTujRKHm0IfX
	s1Z6S6DGRO0kb8YCm+dmOL0z8HkpNTrGXrmhr8+begcSpJdRk0qlIRWwXzhEFIHK
	6tW2eXJZQqYKpVkmcbjs6fLsOBIJgklxK1N+5j0djJjVycigEUKlWzVZCq7y8U43
	k4EDE/L1TFtdY29SjCiHuePgY3lHp3b/b9S3KG3s4gfD6y8wP16YiLykSBFYUCCI
	gycy457DujuRifj3hIqbWM4T8GEDWo1X7npsL3zgBeMSevzwQybqMPFvOu3EeUi5
	5VXc/3Cd/Xh8jVsqqeKIyOS5iVLK1MuWq/CPdko/+NiPYgUkY25svShBopkC2r7z
	h/DyqA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjr3mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:28:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfc52ddc55so31516815ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788406138; x=1789010938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHg3U6ODch+jJFZP2j5QNR5qAwxcN/LDmywtPANSK1w=;
        b=ICZjOf3GDc1IRCLlQyRhSMakfGFOE/iT+5eIdIyxr1sxid9iO8zKpqkx2RwdzWDpog
         D7X1lVTCTSXdUUg8yZQZbgvJB4X7N2z3Lh6kI4P3HfENijt9grLnAFYChMY5aqhPCTw3
         W1rl05R8hMFz5N35ozCvQcLm+2OgRnDNMjbnt9wrzXOeg5IVLG1YFj+wImewbzPO9/3t
         uaZnbmkkKr+iGLelUhaXQCbuMCsIJjmm/WjDjm9A1zGxrdawUS/Oba23IFwBw/OMrD3r
         D3Uhw90woEOtgES+WW871lsaaArAdWzayeLBcL6QjtGgAK1jdnuB9dG8rU9XYQew7qPg
         xKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788406138; x=1789010938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHg3U6ODch+jJFZP2j5QNR5qAwxcN/LDmywtPANSK1w=;
        b=KCTZ1ORnNHln7mBU/Li1+P3bIzYNs5JYE4Sbxtyew5q9SYiKQU2zLyrdcwf26SF9mP
         dwGpw9mNik7CEwib9xYOpHJkJM70VYzYYrD6v4pNuJhl8Jq1l4cuJ6Mey9CiS4qK3iix
         qt7vWvwpcy0pGi+hz/CKGJOP/dvxWSV79J9/h9I5qWF0XfrjONL1AQDP0qV3IKSr57HD
         X6Q4ylI6wniNjRp0+zgLHIwKZLZT9y0nmvWaW/2uE1z9MPdy9KDAVM71R+/jjLBItu8e
         GbxkrNn4PuOG50BfV69V08dNZD6aFwPBADDHaBJ8MT/yMYcJ58rAL07ASeOyYCQQvCzj
         Nmwg==
X-Forwarded-Encrypted: i=1; AKwUvBzFh+2vdMdWtVWssviwyXi29yOAr/oQpE7nC7ZXKwpXB6pDzIWGeQEgdBQuA4XjMNOd1NFJlqQcxthtajI=@vger.kernel.org
X-Gm-Message-State: AFuF++kyF/ukSijd4XGBcCyU6gq3AMRoQilrRyxvn9zrIJBLZgiEyVV8
	lWElPiA8XjgkidV3ckPVUfbUYisacCunLUy1u6N/Q3Z+nMht6Xf8phYUvCtPFPRGe26wBwiG7eb
	++6IfFG+nuL99P4anj3dHjnTMsjccwFQns1m7ZVHPVUfv2XbauQj3W1ufDMzIks1KlWQ=
X-Gm-Gg: AYBFou1hWiJPx9rW+dATeDpMa1TciEKH1LSeZJnZ2EkAmWW+OmE5iouxnGSGptJ3oYp
	41rN7HsklgpBNohtmySk3HsBA9c/yGxQwvS6jIW93uUN7WN07Pmpt1OdnRDjTkIYgB9wnB+a4Rs
	B1HIKGGwY9sGDcWmpER3rpfHIeHKiZO0kViUcgNqMtJLDdc2tMYPy8a2zy/Brt9iqlpOq2EJujK
	pdvH4ceXvgk3a9Viq4RJ2TQ5wxUHe22JHx4XG4M6xFWDJzbz/epFHzB+DPMUn/GvDNB8BDad9x6
	zwxb44dbvk5LZdnLKZyPZIrQ4SJVlRo4DzWxV9+qPJ6FrsjdZrpEAIU2pHKVLUO3Vg6ptyH3LGw
	aK8UIktHQNJbucAdZ+QuAc2FZpKg=
X-Received: by 2002:a17:902:cf01:b0:2d0:cc92:f7a9 with SMTP id d9443c01a7336-2daec5abae0mr144681355ad.4.1788406138324;
        Wed, 02 Sep 2026 20:28:58 -0700 (PDT)
X-Received: by 2002:a17:902:cf01:b0:2d0:cc92:f7a9 with SMTP id d9443c01a7336-2daec5abae0mr144680665ad.4.1788406137800;
        Wed, 02 Sep 2026 20:28:57 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafed74401sm2876755ad.81.2026.09.02.20.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 20:28:57 -0700 (PDT)
Message-ID: <1c95f641-1c4d-497e-9ef2-dcfc77a9dd7b@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:28:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: aux-hpd-bridge: replay last HPD status on
 hpd_enable
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAyNyBTYWx0ZWRfXyEZ+NSlNx5W+
 bEGRI1p+BFGnAesxCYJKkz6/IAxJOo9awe5FgPQGqvAUlt1BiXuUSD3/cm/bbsr8PPAOMb8RES1
 mF3NkFaw2yiqLXqR2CleWkGWy0NR3mLZsDLOdXwHo/0gVFAWaZYI9xPeft2L6bHEMRJ9V6UZpiP
 44m26ikMmciFHEDishJr5pAH+103LfUGj484KBQtNeMu5nIZFa1jeo6LMl3pVb17zO0h4JdF4dO
 q88706qTBTSvkdxv70MHA5w5OB5qwB564YoGrv5M7DUKq40F/bAekX+mGqiNM0GlACPh+Nm+WIp
 5mT/U1OKeKBM8VH+jCQuvd3NRqx8lPiTmA0WEOHmpF82WT+MtW0IlkVVvj07Y8T4s7XunYmQvkU
 DSqImukI6pUv63vE9DufGwVFlGn0bOI/PWgdWbFf5UVK/QeLj2XKw8MXYXgbIYPYY39nKhryyeO
 8Dm0FWJ6sVqhAqvHQIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAyNyBTYWx0ZWRfX3EH+Ky3ilQDz
 8WYZeZGUQg5j1WtDfWO4zh29t55+RBBCOgc26SztJmABEIDZD7oOB/EEo0BUxu1FuAujeLiBjpf
 eyxA7+UV/rT+TJf17ms4cIjKcKr4WNo=
X-Proofpoint-GUID: XE7BvBEHbZNgCpEPhsqNE4l8WNi8Jr5R
X-Proofpoint-ORIG-GUID: XE7BvBEHbZNgCpEPhsqNE4l8WNi8Jr5R
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a98e97b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=n7D3WFhhhIv10khZyqsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030027



On 8/3/2026 4:43 PM, Yongxing Mou wrote:
> If a downstream consumer (e.g. drm_bridge_connector attached by the
> msm/dp driver) registers its HPD callback after an upstream driver
> has already reported a HPD event through drm_aux_hpd_bridge_notify(),
> the notification is dropped because bridge->hpd_cb is still NULL.
> This can affect any user of drm_aux_hpd_bridge_notify() whose
> downstream consumer arms HPD only after upstream events have started.
> 
> The race has been observed on Qualcomm X1E-based laptops during boot,
> when pmic_glink_altmode reports the initial USB-C DP connection state
> before the DP driver has finished probing and enabled HPD handling on
> the bridge. The consumer then never observes the initial connected
> state and the external display remains dark.
> 
> Cache the last HPD status reported through drm_aux_hpd_bridge_notify()
> and replay it when HPD is enabled by the downstream consumer.
> 
> The replay is deferred to a work item so that the replayed HPD
> notification is delivered outside drm_bridge_hpd_enable()'s call
> context.
> 
> This follows the same pattern as display-connector, which also defers
> an initial HPD notification from .hpd_enable(), but reuses the cached
> status since aux-hpd-bridge cannot re-detect sink presence on its own.
> 
> Fixes: e560518a6c2e ("drm/bridge: implement generic DP HPD bridge")
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/aux-hpd-bridge.c | 53 ++++++++++++++++++++++++++++++++-
>   1 file changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> index a2e525aa5788..bb81aabf58d4 100644
> --- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> @@ -8,6 +8,7 @@
>   #include <linux/export.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/workqueue.h>
>   
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_bridge.h>
> @@ -18,6 +19,17 @@ static DEFINE_IDA(drm_aux_hpd_bridge_ida);
>   struct drm_aux_hpd_bridge_data {
>   	struct drm_bridge bridge;
>   	struct device *dev;
> +
> +	/*
> +	 * Last HPD status pushed through drm_aux_hpd_bridge_notify().
> +	 * Replayed from .hpd_enable so that consumers registering their
> +	 * callback after the initial notification are caught up.
> +	 *
> +	 * Accessed lockless from the notify path (writer) and hpd_work
> +	 * (reader) - use WRITE_ONCE()/READ_ONCE().
> +	 */
> +	enum drm_connector_status last_status;
> +	struct work_struct hpd_work;
>   };
>   
>   static void drm_aux_hpd_bridge_release(struct device *dev)
> @@ -154,6 +166,8 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
>   	if (!data)
>   		return;
>   
> +	WRITE_ONCE(data->last_status, status);
> +
>   	drm_bridge_hpd_notify(&data->bridge, status);
>   }
>   EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
> @@ -165,11 +179,45 @@ static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
>   	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
>   }
>   
> +static void drm_aux_hpd_bridge_hpd_work(struct work_struct *work)
> +{
> +	struct drm_aux_hpd_bridge_data *data =
> +		container_of(work, struct drm_aux_hpd_bridge_data, hpd_work);
> +	enum drm_connector_status status = READ_ONCE(data->last_status);
> +
> +	if (status == connector_status_unknown)
> +		return;
> +
> +	drm_bridge_hpd_notify(&data->bridge, status);
> +}
> +
> +/*
> + * Deferred to a work item so that the replayed HPD notification is
> + * delivered outside drm_bridge_hpd_enable()'s call context.
> + */
> +static void drm_aux_hpd_bridge_hpd_enable(struct drm_bridge *bridge)
> +{
> +	struct drm_aux_hpd_bridge_data *data =
> +		container_of(bridge, struct drm_aux_hpd_bridge_data, bridge);
> +
> +	schedule_work(&data->hpd_work);
> +}
> +
> +static void drm_aux_hpd_bridge_hpd_disable(struct drm_bridge *bridge)
> +{
> +	struct drm_aux_hpd_bridge_data *data =
> +		container_of(bridge, struct drm_aux_hpd_bridge_data, bridge);
> +
> +	cancel_work_sync(&data->hpd_work);
> +}
> +
>   static const struct drm_bridge_funcs drm_aux_hpd_bridge_funcs = {
>   	.atomic_create_state = drm_atomic_helper_bridge_create_state,
>   	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>   	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> -	.attach	= drm_aux_hpd_bridge_attach,
> +	.attach	     = drm_aux_hpd_bridge_attach,
> +	.hpd_enable  = drm_aux_hpd_bridge_hpd_enable,
> +	.hpd_disable = drm_aux_hpd_bridge_hpd_disable,
>   };
>   
>   static int drm_aux_hpd_bridge_probe(struct auxiliary_device *auxdev,
> @@ -192,6 +240,9 @@ static int drm_aux_hpd_bridge_probe(struct auxiliary_device *auxdev,
>   	data->bridge.interlace_allowed = true;
>   	data->bridge.ycbcr_420_allowed = true;
>   
> +	data->last_status = connector_status_unknown;
> +	INIT_WORK(&data->hpd_work, drm_aux_hpd_bridge_hpd_work);
> +
>   	auxiliary_set_drvdata(auxdev, data);
>   
>   	return devm_drm_bridge_add(data->dev, &data->bridge);
> 
> ---
> base-commit: 415606a7be939835db9b0d6b711887586646346d
> change-id: 20260803-drm-usbdp-preboot-ca19b593211c
> 
> Best regards,

Hi,
Just a friendly reminder on this patch.
Could anyone please take a look when time permits?

Thanks,
Yongxing
