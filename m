Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77BF3446B0
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183341; cv=none; b=ewiG5QOcTfnpE0ysX758SkbmKLaRE49KTX2G7Etxo/OqMBCN71BucBlRqXJ9oxbW9DxFByutdB7XDte0eXkwY8rM3yvLstkpbsfIZfotYAap2yJe/CzqIcnuDuGqV9H7RrmOE+rrZhlfExKCp0wd0tr8zvNs+bomFsFoZAqCzME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183341; c=relaxed/simple;
	bh=hyppn6ZS7iKrvhduyzUL5EMtorwbII9bi47RogEviWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIf3JPBLqgMCKNDfkjgca8eo1vGTZPaj+yYH1wduEBDBjUsq6k4OwW2sJ+ufsKEK3wsLmT5fXxhE90tkD0ZCNI1GVWFtz42F4EQAH+cCSYawLvO7G57WiVO6eOf3IwbHfxA5R2EMuMCXO2SrPAyYcKcCCbuoipDPcuHRECaUShQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGpQxz0r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fciFNvPO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGpQxz0r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fciFNvPO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695104S03688193
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 06:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6A1bPSiOGgsHAdpCNaSmQ9ZG
	Nam6PZMqoQGyG8bRKdU=; b=TGpQxz0rp6HR3enX/zk6Qzg7H3YJcUVk7yONfn5i
	9VpXQNRsSLY6ois4sKf3qiTyJgArTDt1bN0c+UXh3bdNjN0sgaW79pSmF0Rh0InY
	okQukS8x6fwOM2PrPkGV83yQJ+jpo0IbAzNiYBWSjnuelP1eHlzzvZq5BlZFz5Sx
	k0Av9lzRIMuV3sUJzZOxhxWOcPYlTIS88n/FGK9lyFJi0SgcVW+XqSsug2Anuvlj
	I5+5UEBf/M8pn5L4NK6NfM9jh5tNgbQMwL+ZNZdESbI9cK1UIut3kmDs2rZeeZ4l
	2um8w60T3SpV+vbFZDXbOu69WnQJOWmEgGiaj4uMPwQ7Qw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfjphc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:55:37 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bfa915da7cso1170328137.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791183337; x=1791788137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6A1bPSiOGgsHAdpCNaSmQ9ZGNam6PZMqoQGyG8bRKdU=;
        b=fciFNvPO+05eVIK6hUscamo160quGpMfP8kCxAZtk8E0uxdubvtOka4R9kYLXor+Bd
         NmqSODiMEQ6CK/GFE3RogmseAnDsjkDaym3v/8tGZhaUNog2PMeP+gL/K7Jn0/OlmjZL
         KVNXoFB9xa38NxKNGE04mbaplrpCSijyAlBpzc0efulueOqRdA7har8gB0yIqpvIZK4f
         AHt7hAd7HynyzHpy0mvhz3wKqX+QLHh2vh0AhFE1StlxhWFwUkMBoBsSDvMCm7JKNrx3
         eMz51uHShjfQzxqbalOL0fMx7RRu0XauPMTNLGcw8gZOytP/1J1Et56wCRzkaA/xUeZD
         JA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183337; x=1791788137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6A1bPSiOGgsHAdpCNaSmQ9ZGNam6PZMqoQGyG8bRKdU=;
        b=kf7jyUM/VX8wEASnS8oYUPtj2h0ap6fIn/p7XkrSYCH3VVbjvuxAcFl6nV1ZdY86be
         Lwqq+shrCvZPN28HEWGcv6xdIq0113aUKabnFpAe16PhiQXHrtS/23ELjmXrtV+bBUuR
         3wkOqN5bo/hs3oduVR4nD5Ce8uxKJo96ngQdFvYB+kjEvGh0rj3n26cWcBe/GxMk1c86
         Btw39bCrOgR9yX9ocPchAQu+dBHY+7Qwc1+rMvXxSxtLYDmDmEDt6cdsvdx9oqkPkeSh
         22qF7tpu8ZhUfMvutyyh7RnVnfkDNKa1oItkyttrDb34jJRFA81CttAVshVAohUpFoQG
         GbGw==
X-Forwarded-Encrypted: i=1; AKwUvByCEO3TXDTge6/7YkrCXsGPPV8fERXRS5No1+PNTpHISwXpic+/+3XsQhh+oQE49fBZgL2eM8zs8hIKeuA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+MbNCy2rIA4maCF7fp/31STKziA/caTwI8EDKiOmrVW8eglFL
	kuUc4qCApyqQSOs1rWSvd8MuOgMJe1tokLuDOI5obPUzXUNf3gHLBIOhT+T5xhX2HsHjFSUsMpF
	d6BRcmhDj2xeLoTazKtBV2zRHDTpRCsWV5/q+1mOneu+cHRQlq+b54uCZw6ymZu/Th6U=
X-Gm-Gg: AYBFou1068wVvy3kFMdHGMC+4hJCMo6npCk6aDMabixG3qjyr8lBSCCYuVSycEUV/uu
	B+B+amIbCcvf9hD3njnc7lR0WaMmwr4jPs3QPc1w8eeE48O3ZNNVLTuVqYqW7dW+rL447RsWjQ0
	pZWpiCwGpBmI6AueI1nO1BPNPz4I97aRG/inX0PrL5afzT2BevNn2InswRsiDPPQ/4KOUCzo4Mm
	jMYb3a8nmM5sgwtwD67rZL9HI2CsxfM0bEPJMvL5FXqfL1lGLo0J4uXVi1Qh+jncSs7+UBnLtZM
	GkpHg3GrrbgE5phEHc0M3UDaS1qC6PIZ91EvaoiQ1IuZ16+YAZV8wkExVFW46fjYfEZAVqvg+xv
	26s7UCZmG6js3lJrsAigxtRErsNz3swHgNT27u2RbSwA7uBwAmJ+JHB3DjF1sqHD+qkn+U0AqVr
	Z6B/2Q0H8aguU6
X-Received: by 2002:a05:6102:5120:b0:79d:a035:b6e6 with SMTP id ada2fe7eead31-7c0f4689e8dmr1883077137.3.1791183337115;
        Sun, 04 Oct 2026 23:55:37 -0700 (PDT)
X-Received: by 2002:a05:6102:5120:b0:79d:a035:b6e6 with SMTP id ada2fe7eead31-7c0f4689e8dmr1883066137.3.1791183336654;
        Sun, 04 Oct 2026 23:55:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e33530bsm38036081fa.42.2026.10.04.23.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:55:35 -0700 (PDT)
Date: Mon, 5 Oct 2026 09:55:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for Novatek NT37705 panel
Message-ID: <xuiobdqd236poxv2lieckjg7da3cpmczdf5owwxx2fl3hynhf5@rl5mmcyzzqk6>
References: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
 <20260918-fp6-panel-v2-2-6695c4008920@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-fp6-panel-v2-2-6695c4008920@fairphone.com>
X-Proofpoint-ORIG-GUID: OzTtxhtY39Y7Sold2UR4Huvb026g0pjv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX1gyh+XrB7+j1
 JOoDNNrgl7oyittXcEHUnQ/XZ1PFaF2GKMoF/vCwNDXYH1rtxPBgx7Ok+L2BBf+aMBHAF7yAkxx
 bbvIK3NEaTuZOlhhvz3WbaMMeJnkwNw=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac349e9 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=6H0WHjuAAAAA:8
 a=o-EclO7zvcZZgozh8CsA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: OzTtxhtY39Y7Sold2UR4Huvb026g0pjv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX7c+ZfkoC60Y2
 0SO1sYRLSDzWX6R5/DgcqjM1sJl5N/0KbuSvttIPDVg6FWmsuVr9KjFnyX67Tn81APv49bPUW5F
 mRuoqhtSJwqQu6DtXVaypsV3dMrW/cUNYqkrLxJduwENeXi222lR081E58b0zvLR6s9yjl7RWf6
 YKAKYOoj4egvhtZNNOh8T1uwkTKx70phczo/7vLWLS0IuXJYa/6hWW4fLfDMTVt74+u8B6dLITg
 E6PxuYrevoE/CJXMLCUN+T6QSu0JzSIiWBjNI085RRvrah/CgZ0A4ZbYHrHrGs7pWlQilDZ28UU
 ucOkIR1WIspCP/1pDL6b5QQN48pe7k1y2qq8iQ5NvOUa4k/Q0EAvZaye5fnlGSgBmSKucaOBFUg
 2oKtM7xYqsKBUV5MhRcn4Hclt/3cdKsel6p8qVcrsIaXme/Cr/2jDE7fD5xk/muWbOeBaUWdUdZ
 N07lx7Q//a+6oaOoA8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050027

On Fri, Sep 18, 2026 at 04:40:05PM +0200, Luca Weiss wrote:
> Add support for the 2484x1116 AMOLED panel from BOE (BJ631JHM-T71-D900)
> bundled with a NT37705 driver IC, as found on the Fairphone (Gen. 6)
> smartphone.
> 
> The panel can also be configured in 10-bit (RGB101010) mode, however
> currently it's configured in 8-bit (RGB888) since there's some issues in
> the Qualcomm DPU driver when driving this panel in 10-bit.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  12 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-novatek-nt37705.c | 413 ++++++++++++++++++++++++++
>  3 files changed, 426 insertions(+)
> 
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x00);

MIPI_DCS_EXIT_SLEEP_MODE

> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x00);

MIPI_DCS_SET_DISPLAY_ON

> +	mipi_dsi_msleep(&dsi_ctx, 22);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int nt37705_off(struct nt37705_panel *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x00);

MIPI_DCS_SET_DISPLAY_OFF

> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x00);

MIPI_DCS_ENTER_SLEEP_MODE

> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	return dsi_ctx.accum_err;
> +}
> +

-- 
With best wishes
Dmitry
