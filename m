Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451221;
	b=bVUb/vEYR48YtAjp9m2H0Qc2750BCTsm8xlD1EWdXyO8tw5jXXWw16DKl2R3Qto3OL9q
	 MnkovRmGRmCfe9A+ff86rPmkJjoxwNHZlFVssC8B66MkCcq63pyPojlnasUzW+fCdsmC2
	 Pb5t7xd6khr+XSWt3JxFCUpKH/XNPOjzFyGsqpS8TGsUwZSBM2+xoO9S0CrAAnBapyn+I
	 qARGuEs5KHt6QJ5cCqfOAoTzqvLt2QkXz0kYvvMrseiCjFZBnfIn17dCJe+lwiAYGXwgq
	 WXvy2ZFl6XAUeFIZ26rm0v/B3++C7mBvSwLjFTZ69LG960a0sUsWzgFsOiNNKmNz8Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=;
	b=nrOBqWgmZivscEjjt4FJv2CMrKGe876mp+905xmVBWrVU9PxGmVSTb+NE/qTXqmz11M7
	 vjxiy6IrgezsZf71FhfcIG6IGfwMy7ELq/RF58npV7yaLNvHJeMVnYhyVbWOSblMm7Stn
	 Iamim/Zy/VaOHBy29gZFbZkMFkr0EnnWDpmh9FcB53GxiUxQYPF2ZuzoaQ5J0tUmte8nt
	 jKwMxOA6IRkdJmuANq7CQGrPuIQ4LHoMRWEU1b+yiCjkp0we3c3QJQTufoFVkKHxW8NHo
	 JUKae5RTfsTvqFAsE5m8ghzsSj2YazRMTjnRuldKRjwqdD+gK0ewez5/LvhaB1KdZdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KI/qRF06";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PSq0EZqk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20157606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20157606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KI/qRF06;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PSq0EZqk
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZoGu597550
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=; b=KI/qRF060qDr0r2Y
	cJuOgXtsBpuDssWcFJlKOO1nnz751BpTeh9oz1oPGvjmslvWwhtLwO06nYw9Mz4r
	ecj4zy4uuMABNaIYsfdpdtFlcLHOb0GPfLodjZXjXNDK8Vf+XQwfP+fvVcSjA1fG
	8h4TorsRex4rX7DoDD7Xb8uxUGXLLNcE7DByWRDzOUXxuwCBoKiBaRMH9GFL3BUA
	/SVMy9oqTiO0QrtV7oovqEHmjChkcnZA0sdNFtNSTh5HzTW33BNQPX4QbldT90Az
	F5ZYYFXjKa2Gozlp/vRRIx8hfdaKFek54kf3AKzEgLxcExHQcVbuPbqhhr1obTxj
	daAuAw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt152nqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:40:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53395d51187so62269841cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794451219; x=1795056019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=;
        b=PSq0EZqkBLcGccJMP0Me92Gp8iVJUiNrGW1URGYwVQkSEO+8t16etkBmCF1Auc4EwF
         YssLWxP3eKCL8FkcxTSWNTKnKttaxU6KnrEwtxMcI8nnHBWgYnifoE7kzjS1AeSlZR0e
         dOF7gqqesq7OgqDUS1XUsMYJZE54xQZ4l5BgVdJss8DcLcSyCFw+evV3Xh5TFHXrLw7R
         oproPtHZKDjFiwjGtYUmJmFFQaNbj22Sd9GJORn3ftdG6k3+mipnTT83mqiJB9CBNrav
         rxNM+n2AUUwKD5C8j8ssJlHPB9zRbmnyFEc00en73rp8p1yV2S3AcrPqaLiNxvVNXqPb
         5Aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794451219; x=1795056019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=;
        b=XQ5uCUbR93nXF2vKtlNU8gwLrHcsAo/6zdRdDXBtiPvutfpr9WStcVLjkpiYmXlds2
         8R6GnjyT3YWuoe/M2P3aIJv3pcLACdSfHacfxXpa2j9u3rJGn6cEuxXPN5TqgMOXxaTr
         d7l7i2jH86S6yI9K4hRTt8fMFq3c/70pVWOSRszNBwfamxmf4VZUK34SWBwAVRAs5Ykg
         CLiSyIonPSLrspOKfaaWzDxMiSbDTRK8V1AZVCL/8myOIrFQUVqp2h5ilEv8uUsG32OP
         0vSSiZHPmVt2olUvsKMBybwHHgk0iDAOZy9x/v30YLwcVdM/ruqboY7OBkgKFM97Y7EB
         /avw==
X-Forwarded-Encrypted: i=1; AL+hErFpOJfc/kdcuu+ZtJJlc+xLVMnG72bo5Sx/xPPGi4QN3iZWqVECtg1O2Pf8aW6Q/oTxBHnt/Ua9mnUv1qA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bumQ/hy6x+/qkWRRqhyI5Dd4hKClopKT7TUAV2JKSx5rzSdPK
	hD+f4N1Dxsqcje5I71SvpDr2q5itU7P6gcFPQvT4oK0WEKzrSl9UeHF49RKpEQn6qCZcvda9qUs
	1ZJxnKXhr5OdEistUjWiYamFWEiYGE9z1QLcEq/MiGc0+bZT2Z+DOmgnXzBpuAh38iHA=
X-Gm-Gg: AYBFou0JlppRaGL8wbeyR6u3uLYWACrTsO7iRiJOwP7gJ6D3QHNKVC3ZmqFgLGhgxyn
	lQDd7d7cNXBxxA7Ebac7UJ9LKDZqUGmWENk8HEHfbQJkLS2LAQFBYf7k6gd4rDdoAC/oghUY7ML
	jIiSTTxKL46XSs+3fRGrVdiI/Lgkz6fhHeDlo1ZfWsR5f2Xfclt6g/Tby3ZZ8Mqx55Tzd66rz/a
	ENFcuZqR4UkQMYGIaTosNMK3JekyUf59D+btLwIvGuXtxPXa74AehgEqRQSc+cvVtg4WE/YWcNZ
	01lobwQVaA5oyXAke7qEh+hXatTgem4YnlRnZUXtlJAeg25s00oPaGqFi7s55dZATJx0nSdSe3H
	7s+1YOWK2pQkN7HDDKayReN7UkdZ3qEwaLQMxFJWRZ+n3ADeezR0xEtws704+poUrzDVDvoOnHq
	REKimX/UFJY2egkpBfbXPWv9e+GpNUrQvIQsIh1sY=
X-Received: by 2002:a05:622a:4e0a:b0:536:352d:65e9 with SMTP id d75a77b69052e-556c25188e0mr64865991cf.65.1794451219031;
        Wed, 11 Nov 2026 18:40:19 -0800 (PST)
X-Received: by 2002:a05:622a:4e0a:b0:536:352d:65e9 with SMTP id d75a77b69052e-556c25188e0mr64861391cf.65.1794451209677;
        Wed, 11 Nov 2026 18:40:09 -0800 (PST)
Received: from [10.111.167.254] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550bd33340sm64426881cf.21.2026.11.11.18.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 18:40:09 -0800 (PST)
Message-ID: <ffe9dd90-909c-4259-8a57-2ea67307a95b@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:39:56 +0800
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
Subject: Re: [PATCH v8 6/9] drm/msm/dp: don't take extra references on
 multiple plug events
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman
 <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-6-6ee949e7a384@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-6-6ee949e7a384@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxMCBTYWx0ZWRfX+vQpWdRxbR7C
 t3GIEBmsq54cIBb0l0wSgOlNel0ZMqwMwCAbOXhCRBsuiQNtxw/jk59kjfuJF6rKKzbQpsvTmyO
 XM7evFJ+My8UQOgsCvwZSTuIWa0lju8=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af52713 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=UkfVDg3vQ6na--iosyQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: S3YqTcjo4MMaztI8cmX-H6tuEn5oP6Ev
X-Proofpoint-ORIG-GUID: S3YqTcjo4MMaztI8cmX-H6tuEn5oP6Ev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxMCBTYWx0ZWRfX6rqlGEdaYiZj
 Rm4MMEqyOHyvcdqf1QCIlIfVNfszX6AujJvT37T9q0GKIK7/J9QTklV4xKc5DkUJFUIe3gOzJe2
 +6+Omkw07Lb/rPJ/NkvzVI4GmNMhCsHClwPPbqvpVdOoAzECD1X5JQ3x+ipmIqZms3chm4O3Cp7
 URibH6J0bEMGbx+Al2h8Vy6XG6xI3s2j22SMIo/gvDzrROzESlLa+9rcbdoHfgqZ9bKf1M4zF1V
 Oa6l5osZhgooZt4GSOXEXnCcRM+fF1Kp6QRkOdaTbMTkq+0kJsAT8I1x25wBdZqqtV1nVc9PEdz
 Ix1egSXwyTbKS0ew39MrzFUEf3AMfr1Q2dfbhhoVpYR0VqgbRCmAkKFF8PXjlugkL8tBCS8YHzT
 FI6n7spTkpM0mLpxGJprPBZ7eDvhpcYj1VWNTMSuJD5Tdb4mAADYmTmOaZvS0mDDAD+KlTlikbH
 0dsFSPEAgCCpC7DWfuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120010



On 10/24/2026 8:35 AM, Dmitry Baryshkov wrote:
> The upper layers might signal multiple sequential HPD plug events. Don't
> take extra references and skip all further HPD plug events until we
> receive the unplug event.
> 
> Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index fa8942922b53..ce919a26fba2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -412,6 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
>   
>   	guard(mutex)(&dp->plugged_lock);
>   
> +	if (dp->plugged)
> +		return 0;
> +
>   	ret = pm_runtime_resume_and_get(&pdev->dev);
>   	if (ret) {
>   		DRM_ERROR("failed to pm_runtime_resume\n");
> 
Hi, the issue reported by the AI is real. There is a regression in the 
SST case: when .detect() runs first, it sets plugged to true. As a 
result, when msm_dp_hpd_plug_handle() is called, 
msm_dp_display_process_hpd_high() is skipped, which causes the 
subsequent failure.

I tried removing the plugged update from .detect(), and that fixes the 
SST issue. The display works now. However, there is still an 
intermittent issue where the wrong resolution is selected. I suspect 
this is related to the timing of the EDID read: when fbcon comes up, the 
correct EDID may not be available immediately.
