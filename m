Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BF7489FD6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256424; cv=none; b=nf/N2p8nxv5qz7dEBxnA7L9lstIoSc4wkPbLNKUGz3F7fu1QD9Z5teltjtah0P31xj/OuRnzdAmExxSbh5nbZphRbIMl1xD2rCiLsyXst8loheprSI1Y9zoIyMVI8p2Ffa8Mpl6tsAuzk4iqtwTG3cUkXSKp8snedhdhzUj4yBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256424; c=relaxed/simple;
	bh=NrTUc2Ujr6zR78Ms94ZBr3uoJ6uW4y4swNxgYb4M0ls=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BYdq0xQ2xNB2UfLb4z7v/hh6n4Jd45l3zZCJjUGmcHXo2C7kKQGgD2arOKggwx+zPlmQnc2L8MfhqEmjYRkn+lJgPYHk2F4g8G+LmFDNLa26HOSj8PMT0tUBoFjAtLt6BC36JouwuP11T8f4F1iTpskb4RIyeubzZ0UzpLmsLOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SOvdmxi1; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SOvdmxi1"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso26097525e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790256419; x=1790861219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bR8KLVmfkqlUwLeA5NPAg5mdoYKwiz6mqVtLy5sMUQI=;
        b=SOvdmxi1Lb4DkYXczUnYSs/mmUhqZ/VhRHbx73u1InDj+mPdU8aICfTlA/zA/EaW6K
         FtGOB9Frn5DBOfGs2tfb+S1px9GKCP7sD1OJaEahg+QCkJ6ElXCMIBMY1YROb/uhvqq/
         QBlrM1Hx373urPNhl2NdbcrDiBzd8zsZ403ziZT+gv3ACDoTeexcnmNdgn26cOEbe7aj
         dQbwsqW7MPf5B4RomRkFvrvd86PulIuGIcw41OlOVjJbNoNmgIbLzX8agCjD3BNmXm7F
         Ls3etXcVBVXeFRPqbGiSEZrKoZH+9F8mni5bvfejO4bS1/J0Co0Ez4kfObPZBVbsLzh4
         hvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256419; x=1790861219;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bR8KLVmfkqlUwLeA5NPAg5mdoYKwiz6mqVtLy5sMUQI=;
        b=VAV8sli09GZH1F8gLZrvVwQdqj+K40g/AFQrXeTSesrAi+eiPaQdjBLmPx2yzWuBPD
         y8aw3LF5ppno5G9HpimZiqLhG2z2/gZ8Vgv5Mt+fGTwI1ueAXpyxbRJoTS8s7Z8U7rt/
         rkoQvsd/Xw15FjB3W1EIIWrvwI1CS8iYbOAWSZ4hKEnkumMGT25i6yYifxBroztDniOU
         AEvOHswVg7GjCRA6YwVnlX54xAkTdaPmgs7VaCk0KRYCn0iLQcojiUQaNfLPn3Jnkjr+
         hVv+Xpj35UYfdJ3Yu+Q7p6DXLqZJ448JpBC2DZTeu6mdf4q7mxF/ofezizsqf1h6l1Eu
         5HNw==
X-Forwarded-Encrypted: i=1; AKwUvBykeupo+i78G38YjrO7Nhiw13uKxUvFhJ8S6L+MY8Kcu1ynw/Cc58gYykH+XcHg4ymrRUvd/RH+OXJx//8=@vger.kernel.org
X-Gm-Message-State: AFuF++nxrerVgVCjuJQHZfyyVqcvDtxcO+I2ugxxWLENwC2AE3bqQdMC
	7BLjJ4I+y3FvrQet7S+2IuB7O/RuoBdM2sP0cmnY+YDjMVQXyABIAiNKuY1tah+mJUo=
X-Gm-Gg: AYBFou0vOvahUkfQDlfsOdEWm3ggkUlRG+oYxGTlNiIg/13X6w6ZMf0k8MSa2wOL0Sn
	h/OeMdCCi8rSTwYojki3mq4IT3l6O4uMl30j8SvNpQRKgpvlGKV5mfqqoJ9KkZ5hA2alI1mdTOQ
	llmFXTpzwF6SoR607PTdulG6Zl5LHDZz9VtGIQmFTL8Yvy4aeF/141LOh3Na9EaeGYH9URz0wiZ
	bUVyoPCMfEWPGEGblctVoYhQPexPlmgAOvtjfQnqNXfOw0WtAI0PJwZHr4vaFwqq3wbvzLAxzk4
	iVSj0LxueJeztgsl7zSZ09bSzYVsA51Qx3Gn12BcfSzgeh7eF8AO9/0Kusf5zYYVbkJM2JYP/G7
	JSR3OkhK7UgfbiW3QAOGyTOSwYfN5SACF/JPQVFIKiffoPP4Cl9sE7cbkOkyo4nSet+gD7Euh2d
	4cdHxm1qkUd6PIxjTRYm53XA7UzB8x2DYuVYMB2la13Cob2bNHt+EXcfan1h8YIOYihbolZqDy7
	JVysXHXpr8ZZU9i/jgUrDNrNe+042N6ZmDpjf8yvZubauocRp0XTQ==
X-Received: by 2002:a05:600c:1c08:b0:49f:e0f4:1aac with SMTP id 5b1f17b1804b1-49fe66fd431mr48391305e9.25.1790256418908;
        Thu, 24 Sep 2026 06:26:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf99df60sm108015625e9.1.2026.09.24.06.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:26:58 -0700 (PDT)
Message-ID: <aac7a74b-e1e8-4956-b1e9-4c4e1e04a6ec@linaro.org>
Date: Thu, 24 Sep 2026 15:26:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 06/11] drm/panel: s6e3ha8: Correct the polarity logic
 within
To: david@ixit.cz, Dzmitry Sankouski <dsankouski@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260920-crosshatch-panel-v1-0-de6e9512da96@ixit.cz>
 <20260920-crosshatch-panel-v1-6-de6e9512da96@ixit.cz>
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
In-Reply-To: <20260920-crosshatch-panel-v1-6-de6e9512da96@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 13:05, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The reset was introduced with wrong polarity. Correct for the future
> compatibles and keep current with reverted logic.
> 
> Old DTs keep GPIO_ACTIVE_HIGH and are fixed up via
> gpiod_toggle_active_low() on the deprecated compatible.
> 
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 23 +++++++++++++++++++----
>   1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> index 5e1e997b83b36..99290913de69a 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
> @@ -20,16 +20,17 @@
>   #include "panel-samsung-dsi.h"
>   
>   struct s6e3ha8_desc {
>   	const struct drm_panel_funcs *funcs;
>   	const struct drm_display_mode *mode;
>   	unsigned long mode_flags;
>   	const struct regulator_bulk_data *supplies;
>   	unsigned int num_supplies;
> +	bool broken_reset_polarity;
>   };
>   
>   struct s6e3ha8 {
>   	struct drm_panel panel;
>   	struct mipi_dsi_device *dsi;
>   	const struct s6e3ha8_desc *desc;
>   	struct drm_dsc_config dsc;
>   	struct gpio_desc *reset_gpio;
> @@ -62,22 +63,22 @@ static int s6e3ha8_unprepare(struct drm_panel *panel)
>   {
>   	struct s6e3ha8 *priv = to_s6e3ha8(panel);
>   
>   	return regulator_bulk_disable(priv->desc->num_supplies, priv->supplies);
>   }
>   
>   static void s6e3ha8_amb577px01_wqhd_reset(struct s6e3ha8 *priv)
>   {
> -	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> -	usleep_range(5000, 6000);
>   	gpiod_set_value_cansleep(priv->reset_gpio, 0);
>   	usleep_range(5000, 6000);
>   	gpiod_set_value_cansleep(priv->reset_gpio, 1);
>   	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(priv->reset_gpio, 0);
> +	usleep_range(5000, 6000);
>   }
>   
>   static int s6e3ha8_amb577px01_wqhd_on(struct s6e3ha8 *priv)
>   {
>   	struct mipi_dsi_device *dsi = priv->dsi;
>   	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
>   
>   	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> @@ -203,17 +204,17 @@ static int s6e3ha8_amb577px01_wqhd_prepare(struct drm_panel *panel)
>   	ret = regulator_bulk_enable(priv->desc->num_supplies, priv->supplies);
>   	if (ret < 0)
>   		return ret;
>   	mipi_dsi_msleep(&ctx, 120);
>   	s6e3ha8_amb577px01_wqhd_reset(priv);
>   
>   	ret = s6e3ha8_amb577px01_wqhd_on(priv);
>   	if (ret < 0) {
> -		gpiod_set_value_cansleep(priv->reset_gpio, 0);
> +		gpiod_set_value_cansleep(priv->reset_gpio, 1);
>   		goto err;
>   	}
>   
>   	drm_dsc_pps_payload_pack(&pps, &priv->dsc);
>   
>   	samsung_dsi_test_key_on_lvl1(&ctx);
>   	mipi_dsi_picture_parameter_set_multi(&ctx, &pps);
>   	samsung_dsi_test_key_off_lvl1(&ctx);
> @@ -243,16 +244,27 @@ static const struct drm_display_mode s6e3ha8_amb577px01_wqhd_mode = {
>   static const struct drm_panel_funcs s6e3ha8_amb577px01_wqhd_panel_funcs = {
>   	.prepare = s6e3ha8_amb577px01_wqhd_prepare,
>   	.unprepare = s6e3ha8_unprepare,
>   	.get_modes = s6e3ha8_get_modes,
>   	.enable = s6e3ha8_amb577px01_wqhd_enable,
>   	.disable = s6e3ha8_amb577px01_wqhd_disable,
>   };
>   
> +static const struct s6e3ha8_desc s6e3ha8_amb577px01_wqhd_desc_legacy = {
> +	.funcs = &s6e3ha8_amb577px01_wqhd_panel_funcs,
> +	.mode = &s6e3ha8_amb577px01_wqhd_mode,
> +	.mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
> +		MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
> +		MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET,
> +	.supplies = s6e3ha8_vddr_supplies,
> +	.num_supplies = ARRAY_SIZE(s6e3ha8_vddr_supplies),
> +	.broken_reset_polarity = true,
> +};
> +
>   static const struct s6e3ha8_desc s6e3ha8_amb577px01_wqhd_desc = {
>   	.funcs = &s6e3ha8_amb577px01_wqhd_panel_funcs,
>   	.mode = &s6e3ha8_amb577px01_wqhd_mode,
>   	.mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
>   		MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
>   		MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET,
>   	.supplies = s6e3ha8_vddr_supplies,
>   	.num_supplies = ARRAY_SIZE(s6e3ha8_vddr_supplies),
> @@ -283,16 +295,19 @@ static int s6e3ha8_probe(struct mipi_dsi_device *dsi)
>   		return ret;
>   	}
>   
>   	priv->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>   	if (IS_ERR(priv->reset_gpio))
>   		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
>   				     "Failed to get reset-gpios\n");
>   
> +	if (priv->desc->broken_reset_polarity)
> +		gpiod_toggle_active_low(priv->reset_gpio);
> +
>   	priv->dsi = dsi;
>   	mipi_dsi_set_drvdata(dsi, priv);
>   
>   	dsi->lanes = 4;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
>   	dsi->mode_flags = priv->desc->mode_flags;
>   
>   	priv->panel.prepare_prev_first = true;
> @@ -323,17 +338,17 @@ static int s6e3ha8_probe(struct mipi_dsi_device *dsi)
>   
>   	return 0;
>   }
>   
>   static const struct of_device_id s6e3ha8_of_match[] = {
>   	{
>   		/* deprecated */
>   		.compatible = "samsung,s6e3ha8",
> -		.data = &s6e3ha8_amb577px01_wqhd_desc,
> +		.data = &s6e3ha8_amb577px01_wqhd_desc_legacy,
>   	}, {
>   		.compatible = "samsung,s6e3ha8-amb577px01",
>   		.data = &s6e3ha8_amb577px01_wqhd_desc,
>   	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, s6e3ha8_of_match);
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
