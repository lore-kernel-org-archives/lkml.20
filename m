Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4BD2DF138
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256900; cv=none; b=j0XOFopdFklfsdDsy9piZk/r1UQCl7FoCL6jVSYQ+z+4qYoC+2o+7XZSMCf+jn5SQ57ObMn+jBSEUbvpy8eUNc/f6E9Q0WHp3iJRTgd1lGgqfP61M4fbShfc1tFwJQgTBKMoXEJQL8TcElOvU+TMC9MrpH3oEbTpom+vcK6qyZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256900; c=relaxed/simple;
	bh=ffbSbK4j9Zjfrw2PrH/jOjNOFVOpEbu4V5aVJMXprJg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QwHcWH80EtCCZDRGOKrP/Ic1FkJ+WandKD5A/XWTH9TVTQ5dsOudTS4m/NjG2Sn+ov+Dy+kaBaZ6kEtFplDgLHPCCfEPfqHr7iGZLnzW5P85dENpSaOwQytmdDqYVXaIROTmFzXVTl9k6GwEb31xVZnrGm9wpb7/jCuq3c3p3ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f7caBHsX; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f7caBHsX"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so14065495e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790256890; x=1790861690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6AkLGE1oPn+7n3tb70RelMorb35N4qf1Ykw3uaiHDk=;
        b=f7caBHsXdNziJtjfOLO59VP+9TscQ2uHrDYVxwkh8RV93cjNeXpqXsk09POytzprVE
         ha5S7xG3kaUtomoBReQAHO88vXgbCt/Pv3lsL1g0JjQvApbuk/L/1YhbnlDCDrs2kNH/
         a6LkIqXGlQsAFTr4tICl8i8JhTtZFTj591HUxCeDQqWNZBUDSucuKfF+1KFC/Ee/mBtn
         d77Zcf4l1Kw+ZyuuZsKCfoUcEtgTpTLLpn4BbSbqJFjv6gjImvVsYeFX0k3ngmxIri2/
         JDcEt+Usj3Ytic0wgesgu0OJhV0BNbKub8xy9cwFmxnu9DoNLS1eDGVPesE8PDQkgQ72
         ruww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256890; x=1790861690;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6AkLGE1oPn+7n3tb70RelMorb35N4qf1Ykw3uaiHDk=;
        b=peeN3TlBH+e6WmCaDMaMA66PNO/oFBreNkUcoBD9upIlPITfbU8cleYhFVQpqrkHRd
         XDSTFJG7m22R2c7C9hFpDkacap4jKfdFFKKhL+FnVd9rFsGW4rQuItrkxfGPUvPEIhjB
         SIMli54NRVzEz8sYmdbg17t/g3Pf11Oe3Pqj1yMngp/DTWRr7enG9JHQXCP/7EqdxsC2
         SVmqqlGsSYeHwNfBZFlm/1WIuW1rO7BkQNlW3E9spSsvhM9+m6J1hmmAO+h90YetcLXP
         Z1P3s+7Y626S3v8I9wscQUbVWVJHoj6mSJ5Xtz0j7ch4dv6P9KilE+MMF9LgZ0yBLpHp
         cG7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxMq1N3D27/lT99CPHyxFRHexpCSS7eWNctw9fxISQOnFYVOM3VOJs/yFs2QkxFhcASHIT5bQvPz8CcIR4=@vger.kernel.org
X-Gm-Message-State: AFuF++lrGuAwynsZux0FfHfzEMS75NQHJKqHQeuY0u2ohMBDacJQ+9gR
	Cwr69GdF92IZ31duflspAtehZl1//6avl5OC0GJ0C0rEKgpBbjMLv0Iut4tUQzx7Rgs=
X-Gm-Gg: AYBFou166c9+QjzyVn8IhalFW69SxqhcOWn+E+n3lxpmY/EV7Qtb01HZ3uBeebRLTcy
	+NI4ngUOIzElXP962D8LOfazA13jxfHlu6yrz/X+DvNUeE5EFGTSzG/Zk+Fe5gveg4dRoxq49wn
	pFQ5p2s6ikiuc78CViE1+5nADJpmrN64e4yl4m92+Xj9d2QTsKh/SWMegWcZ6kRpL4L+HTErHld
	ML8OF+GCz2fuBsD/KsBc3m5APltq2OAXSbCqaSxoFK2/aiIwWnVVlwF+BhmuJXp6WLXtTS8iL4R
	wcOnbAZd6y6+HE/ZAnJbUc4PXn4ZjgMcYSKXSzKTSPbtZAuriW6tgnNjx8k2az7B7Mh1ch5BxTn
	fOAGkoRdLySU9Gewqz309R6nYGwYgUEI4o9w4bueyvmqUsUpLcYMyHvsfyMt8AC2DgDUZ9fqK/C
	LxPBydm2tjISgf8Pi7lDGaMG2d4IIlcWa5vSgCzuC2MO1rEgeP2BKdsaURxnXTaFYEjYIOjd+Ov
	wOsqjkMO2eVJ/5g1Pt7Trd1lLXy4cGbZnS2WgWplp6KVqEkOm0EDA==
X-Received: by 2002:a05:600c:a010:b0:49e:79c5:ee93 with SMTP id 5b1f17b1804b1-49fe66b422emr43419115e9.8.1790256890140;
        Thu, 24 Sep 2026 06:34:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm112926555e9.3.2026.09.24.06.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:34:49 -0700 (PDT)
Message-ID: <898ff24b-8462-48b0-87ed-ba76f2608dd0@linaro.org>
Date: Thu, 24 Sep 2026 15:34:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/9] drm/panel: novatek-nt36672a: Combine two init
 callbacks into one
To: Alexey Minnekhanov <alexeymin@minlexx.ru>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: David Heidelberg <david@ixit.cz>, Joel Selvaraj <foss@joelselvaraj.com>,
 Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 phone-devel@vger.kernel.org
References: <20260917-nt36672a-panels-v2-0-f8de8be5b86f@minlexx.ru>
 <20260917-nt36672a-panels-v2-5-f8de8be5b86f@minlexx.ru>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260917-nt36672a-panels-v2-5-f8de8be5b86f@minlexx.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 18:43, Alexey Minnekhanov wrote:
> The split between .send_init_cmds_1 and _cmds_2 is completely artificial
> and unnecessary. Two command sets are split in between by the sequence:
>   - exit_sleep_mode
>   - delay
>   - set_display_on
> 
> But not every panel driver follows this "split" in their init sequence.
> Some may have different delay timer, or put exit_sleep_mode/display_on
> commands into other places in the sequence.
> 
> In order to make this driver more extensible, combine two init functions
> into one by puting exit_sleep_mode/delay/display_on in the middle,
> followed by commands from cmds_2. As part of this step, also move the
> tianma-beryllium specific deinit sequence with its delays from
> nt36672a_panel_unprepare() to tianma_fhd_video_send_deinit_cmds(), so
> that each panel model can have its deinit sequence with its own delays.
> 
> No functional change - full init sequence with all the delays for the
> tianma_fhd_video panel is kept the same in the end.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> 
> ---
> v2: move tianma_fhd deinit commands into its own deinit function
>      (set_display_off, msleep, enter_sleep_mode, msleep)
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 61 ++++++++++----------------
>   1 file changed, 23 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> index 73bec4f47ec60..a445c8067aa5f 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> @@ -51,8 +51,7 @@ struct nt36672a_panel_desc {
>   	enum mipi_dsi_pixel_format format;
>   	unsigned int lanes;
>   
> -	void (*send_init_cmds_1)(struct mipi_dsi_multi_context *dsi_ctx);
> -	void (*send_init_cmds_2)(struct mipi_dsi_multi_context *dsi_ctx);
> +	void (*send_init_cmds)(struct mipi_dsi_multi_context *dsi_ctx);
>   	void (*send_deinit_cmds)(struct mipi_dsi_multi_context *dsi_ctx);
>   };
>   
> @@ -92,20 +91,6 @@ static int nt36672a_panel_unprepare(struct drm_panel *panel)
>   	if (pinfo->desc->send_deinit_cmds)
>   		pinfo->desc->send_deinit_cmds(&dsi_ctx);
>   
> -	/* Reset error to continue with display off even if send_cmds failed */
> -	dsi_ctx.accum_err = 0;
> -	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> -	/* Reset error to continue power-down even if display off failed */
> -	dsi_ctx.accum_err = 0;
> -
> -	/* 120ms delay required here as per DCS spec */
> -	msleep(120);
> -
> -	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> -
> -	/* 0x3C = 60ms delay */
> -	msleep(60);
> -
>   	nt36672a_panel_power_off(panel);
>   
>   	return 0;
> @@ -140,22 +125,9 @@ static int nt36672a_panel_prepare(struct drm_panel *panel)
>   
>   	dsi_ctx.accum_err = nt36672a_panel_power_on(pinfo);
>   
> -	/* send first part of init cmds */
> -	if (pinfo->desc->send_init_cmds_1)
> -		pinfo->desc->send_init_cmds_1(&dsi_ctx);
> -
> -	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> -
> -	/* 0x46 = 70 ms delay */
> -	mipi_dsi_msleep(&dsi_ctx, 70);
> -
> -	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> -
> -	/* Send rest of the init cmds */
> -	if (pinfo->desc->send_init_cmds_2)
> -		pinfo->desc->send_init_cmds_2(&dsi_ctx);
> -
> -	mipi_dsi_msleep(&dsi_ctx, 120);
> +	/* send init cmds */
> +	if (pinfo->desc->send_init_cmds)
> +		pinfo->desc->send_init_cmds(&dsi_ctx);
>   
>   	if (dsi_ctx.accum_err < 0)
>   		gpiod_set_value(pinfo->reset_gpio, 0);
> @@ -192,7 +164,7 @@ static const struct drm_panel_funcs panel_funcs = {
>   	.get_modes = nt36672a_panel_get_modes,
>   };
>   
> -static void tianma_fhd_video_send_init_cmds_1(struct mipi_dsi_multi_context *dsi_ctx)
> +static void tianma_fhd_video_send_init_cmds(struct mipi_dsi_multi_context *dsi_ctx)
>   {
>   	u8 reg;
>   
> @@ -352,15 +324,19 @@ static void tianma_fhd_video_send_init_cmds_1(struct mipi_dsi_multi_context *dsi
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x51, 0xff);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x24);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x55, 0x00);
> -}
>   
> -static void tianma_fhd_video_send_init_cmds_2(struct mipi_dsi_multi_context *dsi_ctx)
> -{
> +	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
> +	/* 0x46 = 70 ms delay */
> +	mipi_dsi_msleep(dsi_ctx, 70);
> +	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
> +
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x24);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc3, 0x01);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc4, 0x54);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x10);
> +
> +	mipi_dsi_msleep(dsi_ctx, 120);
>   }
>   
>   static void tianma_fhd_video_send_deinit_cmds(struct mipi_dsi_multi_context *dsi_ctx)
> @@ -369,6 +345,16 @@ static void tianma_fhd_video_send_deinit_cmds(struct mipi_dsi_multi_context *dsi
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc3, 0x01);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x10);
> +
> +	/* Reset error to continue with display off even if send_cmds failed */
> +	dsi_ctx->accum_err = 0;
> +	mipi_dsi_dcs_set_display_off_multi(dsi_ctx);
> +	/* Reset error to continue power-down even if display off failed */
> +	dsi_ctx->accum_err = 0;
> +	/* 120ms delay required here as per DCS spec */
> +	msleep(120);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(dsi_ctx);
> +	msleep(60); /* 0x3C = 60ms delay */
>   }
>   
>   static const struct drm_display_mode tianma_fhd_video_panel_default_mode = {
> @@ -399,8 +385,7 @@ static const struct nt36672a_panel_desc tianma_fhd_video_panel_desc = {
>   			| MIPI_DSI_MODE_VIDEO_BURST,
>   	.format = MIPI_DSI_FMT_RGB888,
>   	.lanes = 4,
> -	.send_init_cmds_1 = tianma_fhd_video_send_init_cmds_1,
> -	.send_init_cmds_2 = tianma_fhd_video_send_init_cmds_2,
> +	.send_init_cmds = tianma_fhd_video_send_init_cmds,
>   	.send_deinit_cmds = tianma_fhd_video_send_deinit_cmds,
>   };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
