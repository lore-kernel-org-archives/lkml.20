Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6A83B47D9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326122; cv=none; b=mrex/7VZA1xIaju85bnRekON0PDfdtN9RkYNgfLiyAUCVTepQqYjQw+W2Wa2keZN/W8mHBRsW45FOTtGJUofWlKgihEyB5GpHD2/wyVKLzW7BhEIXwdfDt0hw10yD6omXKtzdHbefrUJEtC0L3X0ivQHLUFBH0JJipAEan0JT5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326122; c=relaxed/simple;
	bh=1jVjVl4OBaNK7OquoGn25u87dNNFGs/ExKTEsUeRReg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=j//O1Ytklab7kzpDWmrdZd7d3190VRvLIl/3zSThbI3MoCADGcTCkwbIQ019yhb1T8ojacOqmaV61gNW+uh2QZfUttgOOMDwdLEAufFJk3Pe7pufvdxE/H3KbWM/VqrBm3yO9I5qx1bDbxyzmS03RKRT5qM0m4vSDbcU2I1FPVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iXbG0k4x; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iXbG0k4x"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488811c9ebaso108222f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790326112; x=1790930912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpvSck30Mei4950pB2Qnx5VBLDrG69rUKIF8NRXkiMQ=;
        b=iXbG0k4xk78n5HYinwPrAx1E6h3sqKfPhxR2VDQKnnfs9GAcoYOgGG3QWujTKBg6v3
         W17La63056ZPbsIh4hdUfoD98vBgg3Z/gLDsstdvJHDpCsa3p+eyn3TZVVih9ohJjHQq
         MnM2gTs5QThtaq8Zo9O1O5E0WEq5/0BoBgO+oB1dDjqb49iwY4gDP9TtwH+P+U1dn1Yu
         fLri1Ntpl9ogd+vsZ2lhES6Ja6lhza89E+M+as8CeKPSJo6Zv8UMxVHWRUCWrDBHbc1F
         pp5gzKEILGQekSSPs62YNDle/1KMQc+YKhmy5oMKh8Xz+hmAy6GkIGudAtYrpDf/xz/4
         Ib8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326112; x=1790930912;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpvSck30Mei4950pB2Qnx5VBLDrG69rUKIF8NRXkiMQ=;
        b=haZG00Ojfn5a2CXN0v9qrTuEGss7Phnzg6OUJI7rFZvfrMHtFLmGTizfzXwaHiDL7t
         J1xhd1xLl9/h2WX5NSxRrwVslGqt2QmWE+O7ctD/R4V2R87Xm7IpgV46wgmN3yBOpx4M
         N7uhwr36TLTJp7NyT/DKLdsIvX4KwZSHTRA7+L8mUj2F6s7Z45OinuIy9OioZCktCdbz
         RBtoKU6ufutSicXcser+xpXxqfa2DmQ6ufEeacLmhmxghm+yXHMDrzlwPEc3bzThINIt
         afobGXVEro/NlT77EjJMc1RQWZxNB5lLpXUCmQmsSQHA5POBAksEq4HmI9dmH0fOFBYj
         pNMw==
X-Forwarded-Encrypted: i=1; AKwUvBwMdH7y75bB08M+kxhCcxN4F+EVFMVVY44ahtgnD76K2tEhsvCHgiCftL0NsZkl37H/+Z8nL5q+FXFSyOI=@vger.kernel.org
X-Gm-Message-State: AFuF++lLutX6HZ8lrHlw7udmxsDG/BaQx+Ousm/vOsRS26JAGhAqTEDk
	xt3vCPPrnXvJ+HFG54HbhG79WdFB81WZWgncBaIMQ+hbZuLZtR/nUal3JyjBbLnBkH4=
X-Gm-Gg: AYBFou3v/pOBD+mYYiHgawgULF3B3uPCxMZuKn7rpqprFD59ak980snPdAeivPXsA7C
	NsGydhIjP71uGnSydY963JF2x9XTLKbnwqvZ7zFpQszLnJ315B3x1Q9wWlMZGBzlX7buekTfxIF
	HCK8yWhaCOGOdjhwL3nYF9upi9xRV1kut6PcLVTj8PhbLxmffzfn8tQy4KhdTwK78d2E3fBeFq7
	ryYVJOQeAytEz/lQn/P0B0FAcJaLHYFjatQcleVWY6CgtYA9fU+4MdradzOosyeorKNIgkddO6D
	2YWkF0+M6m3j6iYpHU18CM9BQdGRUzdQrnMNlE4SwzdXd0nzWSO7jRxj9+SPHvBO4GN/8q8LH+1
	gMNJC4J5UeJhgkR6m3gAjI7jbXA/ORNlCIOQEIIoVCTEFE8Q9u0V2MgRlCwqnvvsxcIVfP36YL+
	sy5d1Wgo7DeV7wnONzjXYBIUjOMvpa6HxZcFeqRQQIhc6WS0wDn7/PXC/H/FrP1YKrbDOBHCmqU
	7DIWgVOcrIjeIOyPsCT27c9e6RHkjUDnccd5TfXK0X1isR5nw304A==
X-Received: by 2002:a05:6000:4103:b0:488:7496:15b5 with SMTP id ffacd0b85a97d-48874961605mr6151357f8f.47.1790326112423;
        Fri, 25 Sep 2026 01:48:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3151:fc9b:d41c:770b? ([2a01:e0a:106d:1080:3151:fc9b:d41c:770b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm5142693f8f.9.2026.09.25.01.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:48:31 -0700 (PDT)
Message-ID: <2b551580-8f7c-41fc-b1a7-96046e52c4f6@linaro.org>
Date: Fri, 25 Sep 2026 10:48:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/4] drm/panel: visionox-vtdr6130: Modularize panel
 config
To: webgeek1234@gmail.com, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260925-rp6-panel-v2-0-19c425e523de@gmail.com>
 <20260925-rp6-panel-v2-3-19c425e523de@gmail.com>
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
In-Reply-To: <20260925-rp6-panel-v2-3-19c425e523de@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 09:08, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The vtdr6130 is a DDIC, a common chip that is used by multiple panels.
> Prepare the driver for more panels.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 91 +++++++++++++++++--------
>   1 file changed, 61 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> index b66d6c7128c75..278f5acc2d661 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> @@ -19,11 +19,24 @@
>   
>   struct visionox_vtdr6130 {
>   	struct drm_panel panel;
> -	struct drm_dsc_config dsc;
>   	struct mipi_dsi_device *dsi;
>   	struct gpio_desc *reset_gpio;
>   	struct regulator_bulk_data *supplies;
>   	enum drm_panel_orientation orientation;
> +	struct visionox_vtdr6130_desc *desc;
> +};
> +
> +struct visionox_vtdr6130_desc {
> +	unsigned int bpc;
> +	unsigned int lanes;
> +	unsigned long mode_flags;
> +	enum mipi_dsi_pixel_format format;
> +
> +	const struct drm_display_mode *modes;
> +	unsigned int num_modes;
> +	int (*init_sequence)(struct visionox_vtdr6130 *ctx);
> +
> +	struct drm_dsc_config dsc;
>   };
>   
>   static const struct regulator_bulk_data visionox_vtdr6130_supplies[] = {
> @@ -162,7 +175,7 @@ static int visionox_vtdr6130_prepare(struct drm_panel *panel)
>   
>   	visionox_vtdr6130_reset(ctx);
>   
> -	ret = visionox_vtdr6130_on(ctx);
> +	ret = ctx->desc->init_sequence(ctx);
>   	if (ret < 0) {
>   		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>   		regulator_bulk_disable(ARRAY_SIZE(visionox_vtdr6130_supplies),
> @@ -187,26 +200,50 @@ static int visionox_vtdr6130_unprepare(struct drm_panel *panel)
>   	return 0;
>   }
>   
> -static const struct drm_display_mode visionox_vtdr6130_mode = {
> -	.clock = (1080 + 20 + 2 + 20) * (2400 + 20 + 2 + 18) * 144 / 1000,
> -	.hdisplay = 1080,
> -	.hsync_start = 1080 + 20,
> -	.hsync_end = 1080 + 20 + 2,
> -	.htotal = 1080 + 20 + 2 + 20,
> -	.vdisplay = 2400,
> -	.vsync_start = 2400 + 20,
> -	.vsync_end = 2400 + 20 + 2,
> -	.vtotal = 2400 + 20 + 2 + 18,
> -	.width_mm = 71,
> -	.height_mm = 157,
> +static const struct drm_display_mode visionox_vtdr6130_modes[] = {
> +	{
> +		.clock = (1080 + 20 + 2 + 20) * (2400 + 20 + 2 + 18) * 144 / 1000,
> +		.hdisplay = 1080,
> +		.hsync_start = 1080 + 20,
> +		.hsync_end = 1080 + 20 + 2,
> +		.htotal = 1080 + 20 + 2 + 20,
> +		.vdisplay = 2400,
> +		.vsync_start = 2400 + 20,
> +		.vsync_end = 2400 + 20 + 2,
> +		.vtotal = 2400 + 20 + 2 + 18,
> +		.width_mm = 71,
> +		.height_mm = 157,
> +	},
> +};
> +
> +static struct visionox_vtdr6130_desc visionox_vtdr6130_panel_desc = {
> +	.modes = visionox_vtdr6130_modes,
> +	.num_modes = ARRAY_SIZE(visionox_vtdr6130_modes),
> +	.bpc = 8,
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
> +		      MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.init_sequence = visionox_vtdr6130_on,
> +	.dsc = {
> +		.dsc_version_major = 0x1,
> +		.dsc_version_minor = 0x2,
> +		.slice_height = 40,
> +		.slice_width = 540,
> +		.slice_count = 2,
> +		.bits_per_component = 8,
> +		.bits_per_pixel = 8 << 4,
> +		.block_pred_enable = true,
> +	},
>   };
>   
>   static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
>   				       struct drm_connector *connector)
>   {
> +	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
>   	struct drm_display_mode *mode;
>   
> -	mode = drm_mode_duplicate(connector->dev, &visionox_vtdr6130_mode);
> +	mode = drm_mode_duplicate(connector->dev, ctx->desc->modes);
>   	if (!mode)
>   		return -ENOMEM;
>   
> @@ -284,23 +321,17 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>   		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
>   				     "Failed to get reset-gpios\n");
>   
> +	ctx->desc = (struct visionox_vtdr6130_desc *)of_device_get_match_data(dev);
> +	if (!ctx->desc)
> +		return -ENODEV;
> +
>   	ctx->dsi = dsi;
>   	mipi_dsi_set_drvdata(dsi, ctx);
>   
> -	ctx->dsc.dsc_version_major = 0x1;
> -	ctx->dsc.dsc_version_minor = 0x2;
> -	ctx->dsc.slice_height = 40;
> -	ctx->dsc.slice_width = 540;
> -	ctx->dsc.slice_count = 2;
> -	ctx->dsc.bits_per_component = 8;
> -	ctx->dsc.bits_per_pixel = 8 << 4;
> -	ctx->dsc.block_pred_enable = true;
> -
> -	dsi->dsc = &ctx->dsc;
> -	dsi->lanes = 4;
> -	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
> -			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	dsi->dsc = &ctx->desc->dsc;
> +	dsi->lanes = ctx->desc->lanes;
> +	dsi->format = ctx->desc->format;
> +	dsi->mode_flags = ctx->desc->mode_flags;
>   	ctx->panel.prepare_prev_first = true;
>   
>   	ret = drm_of_get_panel_orientation(dev->of_node, &ctx->orientation);
> @@ -322,7 +353,7 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>   }
>   
>   static const struct of_device_id visionox_vtdr6130_of_match[] = {
> -	{ .compatible = "visionox,vtdr6130" },
> +	{ .compatible = "visionox,vtdr6130", .data = &visionox_vtdr6130_panel_desc },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, visionox_vtdr6130_of_match);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
