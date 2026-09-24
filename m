Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90F93BBA01
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255813; cv=none; b=D9MUSgo/5Sz+dU7c0hJZBlSm09eP7BR6t3e3XIRY8B2JfR9b0S4ISPZnQ2y1KW2m04xh2NG7NCDw5XuOcLNbtdBfHDf1nZFSeS6wWDxIdkTsavgOtpUi0dQS3nAYUf9IlkOHrjQDCsdCo21X6tRWpVi3S46uP6l1RS16jJ6Vxs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255813; c=relaxed/simple;
	bh=Phwx1iwjiI8zOVofZaXRUZuIcR2kgwAHsnpoqHl5RLM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sMFW1n8LFBpPSaEKXVEvrVO+QmrBblWElRIhGnkoCaKcstT6IN5BVCEW2Vg1LwovEkSYJwuehtq67mdPYHAueevG30VyVwhTGlk0cxSblZvTo4UyZn9OE92nBF3ZE0Kknk3Pe5kIKT+Gotf6iukcTTc/JmaCndu9lUqOVQK02Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NqVx5oDr; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NqVx5oDr"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351832so1269404f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790255810; x=1790860610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e72LlFud0CCI0EsfmN7tiOkPcKOczfDlT5tJOUrL9HM=;
        b=NqVx5oDrFnGOeAEwlCDLT1ejvU1BiAyvJJT2pm1NoqfEv17/sLap9XFkGZOzu5FIo5
         KbzabJs0fxrO3Qwo4DSeHXqUrfmmXWnA31HIi1OKd54uxnK+8iQmrBtBhWxv4LnfBE2W
         MUdUmsTxV4GCItnJS2rnh9oKw9wjoOjrMIRlfZESJhk6Lv6voC5qJ2Zr4as3stdDIGt5
         kP+EB/DzrhHsfwV55k/yuVrsSsf6XUFh5lDGqmRiHV/sB/v988BBDlX6sTqOEsNiEtqL
         1NbG0GjWy18A3BB7VJVe9tM8YOngcV41IR2xfityoXZ2S3mArkHTT2f0LgpgDE97A34S
         3L4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255810; x=1790860610;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e72LlFud0CCI0EsfmN7tiOkPcKOczfDlT5tJOUrL9HM=;
        b=sMP9GrNPSwxBNvMPnCe+7fxPOnQZrZyJ3jHGYqHy2Fygrs+7A/YoXaLQiYm1AeF7HG
         e4uxjh60VAxA1dHu0fHnY6KasdbddTBGcPYfWX7XAj9jkts/0633D5kvuZ/Si+0xp61C
         ecgr5F/lrpGYtmHQIP/1wFPgzA8sP5Twdv5ecOPp/4XKmgd2ypZJeQV4avdciq2YLRbc
         WzZ3/V0BJ9f0//2l4d8YCU5/Jk/aiy28fXPe5bSYtrdeFgvQcbbFVEYWYETA9eiNTxwZ
         4k82lX6Ja8wan+U7xayf0NZHEt1rfVEHZGXpM5VoTgdGbvx1At6In2fCrE3RgwydUWMY
         YGIQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5p3vN3CmdLSyIsygKMK1dzOlrja2F8virL5hwO/YnJmbGfHMymfvhqZZ1PU6JveXqmlEp/GXTXD0B+7U=@vger.kernel.org
X-Gm-Message-State: AFuF++nmVdzwA9Tk0JWexh+2BcFekVqutlD2IGcPaZhpKI5Dm6NX+GBV
	gTbY+ih533mHJavZov3kPXPDLLsvh4Poqol1v/7XBj085K/+IfDLaHfi23LSy+rg0UI=
X-Gm-Gg: AYBFou0npTTZoA06AGUUR6hsske/O0A4/NFSzjkYcsesT4uS0NZJO0Dsoo2i6npyWuy
	LG0oai7ECsPeBO9BQr6mjqmKL8+mASqBjRykCZbo81MMjZ+SzS/rlwGUecPK1j9V3zyFFQUBOVs
	shAhWJFkmc7GEh+yztdC81sSf3gFW9fPQnbampYmAtl0angK6cNm8u4jYpIjpRrMlU30e2CIHcZ
	MDdtMFD66RgKYo5WXPSix2xmB3zM6Ivf7Eruqw02VbH9//6vwUnudkscVSVPVIGxAqLJ+LKwznB
	+8fgXfxFLpWoq42d7587aLLCphcmWd43O5zy+fcC3FFgRWRFCSpx/ThbWPgAacUwr5DEZghP1VZ
	onm0qouE2dnqWk78p5a9Xc1StimavurpBhFY6/nOb7yqh3PkFjUdd9joW8FZ/QalZGvzJhc2PuP
	tdBx3JO5yUJrOYXOHzWAi0ML+79AL4ZZ/7R2XvhSaHjRdOiGqxHJRmevRcBDs8cyunDONYH05Ox
	LHB2EdZSGOitkFkrDlOX5xySoarN/oy8A5rh/19z7+pz3ROQfASLwlV9O7EDfGU
X-Received: by 2002:a05:6000:1863:b0:487:342:d142 with SMTP id ffacd0b85a97d-4887175ae72mr4705434f8f.44.1790255809815;
        Thu, 24 Sep 2026 06:16:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488684863d9sm14842399f8f.12.2026.09.24.06.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:16:49 -0700 (PDT)
Message-ID: <78aa5e0b-b3ab-4e33-a17e-a353d65d86bc@linaro.org>
Date: Thu, 24 Sep 2026 15:16:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] drm/panel: ebbg-ft8719: Split initialization into
 enable/disable fn
To: david@ixit.cz, Joel Selvaraj <foss@joelselvaraj.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Marco Mattiolo <marco.mattiolo@hotmail.it>,
 Linus Walleij <linusw@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260908-ebbg-ft8719-fixups-v2-0-5454ae1f5581@ixit.cz>
 <20260908-ebbg-ft8719-fixups-v2-3-5454ae1f5581@ixit.cz>
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
In-Reply-To: <20260908-ebbg-ft8719-fixups-v2-3-5454ae1f5581@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/26 14:45, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Move the MIPI commands into enable/disable callbacks since they
> are called between prepare/unprepare callbacks.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-ebbg-ft8719.c | 19 ++++++++-----------
>   1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
> index 14982263a94f1..1652de70900f1 100644
> --- a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
> +++ b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
> @@ -49,74 +49,69 @@ static void ebbg_ft8719_reset(struct ebbg_ft8719 *ctx)
>   	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>   	usleep_range(4000, 5000);
>   	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>   	usleep_range(1000, 2000);
>   	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>   	usleep_range(15000, 16000);
>   }
>   
> -static int ebbg_ft8719_on(struct ebbg_ft8719 *ctx)
> +static int ebbg_ft8719_enable(struct drm_panel *panel)
>   {
> +	struct ebbg_ft8719 *ctx = to_ebbg_ft8719(panel);
>   	struct mipi_dsi_device *dsi = ctx->dsi;
>   	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
>   	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>   
>   	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x00ff);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
>   
>   	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>   	mipi_dsi_msleep(&dsi_ctx, 90);
>   	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>   
>   	return dsi_ctx.accum_err;
>   }
>   
> -static int ebbg_ft8719_off(struct ebbg_ft8719 *ctx)
> +static int ebbg_ft8719_disable(struct drm_panel *panel)
>   {
> +	struct ebbg_ft8719 *ctx = to_ebbg_ft8719(panel);
>   	struct mipi_dsi_device *dsi = ctx->dsi;
>   	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
> -	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>   
>   	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>   	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
>   	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>   	mipi_dsi_msleep(&dsi_ctx, 90);
>   
> -	return dsi_ctx.accum_err;
> +	return 0;
>   }
>   
>   static int ebbg_ft8719_prepare(struct drm_panel *panel)
>   {
>   	struct ebbg_ft8719 *ctx = to_ebbg_ft8719(panel);
>   	int ret;
>   
>   	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>   	if (ret < 0)
>   		return ret;
>   
>   	ebbg_ft8719_reset(ctx);
>   
> -	ret = ebbg_ft8719_on(ctx);
> -	if (ret < 0) {
> -		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> -		return ret;
> -	}
> -
>   	return 0;
>   }
>   
>   static int ebbg_ft8719_unprepare(struct drm_panel *panel)
>   {
>   	struct ebbg_ft8719 *ctx = to_ebbg_ft8719(panel);
>   
> -	ebbg_ft8719_off(ctx);
>   	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>   	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>   
>   	return 0;
>   }
>   
>   static const struct drm_display_mode ebbg_ft8719_mode = {
>   	.clock = (1080 + 28 + 4 + 16) * (2246 + 120 + 4 + 12) * 60 / 1000,
> @@ -148,16 +143,18 @@ static int ebbg_ft8719_get_modes(struct drm_panel *panel,
>   	connector->display_info.height_mm = mode->height_mm;
>   	drm_mode_probed_add(connector, mode);
>   
>   	return 1;
>   }
>   
>   static const struct drm_panel_funcs ebbg_ft8719_panel_funcs = {
>   	.prepare = ebbg_ft8719_prepare,
> +	.enable = ebbg_ft8719_enable,
> +	.disable = ebbg_ft8719_disable,
>   	.unprepare = ebbg_ft8719_unprepare,
>   	.get_modes = ebbg_ft8719_get_modes,
>   };
>   
>   static int ebbg_ft8719_probe(struct mipi_dsi_device *dsi)
>   {
>   	struct device *dev = &dsi->dev;
>   	struct ebbg_ft8719 *ctx;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
