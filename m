Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625459;
	b=Selug/KK595et7sBzIt/ZplGw69Hg52bUkqzo95bxGdenynpdcCQlpr8mFn60jSrhzF9
	 mLrubOvChrQxVyKduQHHQx9KXco/YbAwRWma6BgQMKIZERrFe3az6YHKvOIqOLTDTEut7
	 Q4RocIjYTiPJzC0evhS9u4rK1EAextw/TvDkt60bFNHdRMEsVH3P9oEmi9tFCN1Yc7t1/
	 i9PWnqKvF4Sz0MYFKLkqxylTO9bY2q6eD3fdz+7tAICp5Wlfx5um3EvSbzeZf4AUDFzIx
	 DN78zDJ4DqDPb62rcItNZniH3d3w0JOuPY80VlVZb7KFKKzJ2bShZA7bmeb1QFTVlgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5+UXT116wgM3lPiMbzxGZ42MZgEREmAm0zBk0E1R92M=;
	b=EasFEEepgYVDlBII5Nb2qDirZBfUoxHT+wmSNairVwXbYsqqRgP62TWDowKOmp8Rb1eY
	 T5Ab/amSP96H6avOJD9NvFogRYgDvk0WWOVWFGTrMRoVCHrAWV2ZDijELbdg3B5VUNsa3
	 bO8/C3yB5WVOeuxrxFEUTpyKdZUhJI1zNTbHHbmvlbJtN3xEuMhn7ATK0aIJBglxvuO/5
	 RS9D8G9bmjLvNbp9FGr+lu9rYVNQVfW9R7PqLOxrmo9dcCwPYJWrJhmzoxpGXj5W+5ule
	 t5dYm7urjcN+Zbd9qAHyau+jdDe9nvXyYShrLbHVPDHlyWq9J3Od3HdzSjxAva0XVEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YiJnFJGx;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45180606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45180606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YiJnFJGx
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1398133f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793625457; x=1794230257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+UXT116wgM3lPiMbzxGZ42MZgEREmAm0zBk0E1R92M=;
        b=YiJnFJGxmbwGLjC1XlwxSVpCU4HMx0+14O7Bp+ew8D3vnHISYp3+/QD7wo+1Vq1VKS
         PJMOLks9M5awNSPYbMfZ3xGLgEqE13ApgyQJ0b1Uo1qaXx2+rhDB1rkrBHlDbjbr5U4f
         xCzPUVUw2vUAWVKdpABcHrF/RMpQV2j/RIK+Oxi9ub9VsPRMcWjRQnuKMROylDspJgkn
         k50mnC2ZTaGHDZi8I1DjNvZrvKinidFw0XWe2VRwZkpqMN4byr2cXxdHYAk15kB2hAQf
         PCI0t/ego2n59kzRB4WSQuK4K+w2y+npYHbaI3ShH5nCr87NgjdbMqsMIEhMH/GUjNJo
         P7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625457; x=1794230257;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5+UXT116wgM3lPiMbzxGZ42MZgEREmAm0zBk0E1R92M=;
        b=o/sJsoVLAvCU68SKkX6PAi5LvtvET5TxFVvl2AdpCmNsiRgfZevKLEF40M0r+4IWew
         1S9D+mmTuJnLBzfb5/v9wQgquiMHXXS+oOGqcSKRsvhHsxujDYlbgNYO7RhYFoOoeJK5
         65KDuGiG2PMO8l7UElO2OugJ8fl3dNCevYGO1GbXtIItrx49hBzyEqw+3mfgWZ8quCli
         ejlDzBgl0E/sbsEt6MfSGyPxwS0cXZ5dBvibWZ4Hp4ca0LnNL3YPdI9wkJq8mdAQkiqH
         E2H++VD7m/48PJPE8DJOUz6xd4AOvvANuxWDJEc4osz+6QlPUr/oS4FqezqxB247Xbyp
         xI6A==
X-Forwarded-Encrypted: i=1; AKwUvByc3qk2PJqlYMS0qiVdB47CW7XyO8B/938jJtKmULF34L2F16o1CYoJxWBsnOMY0G1/7QGy/nw8H3EHYJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vLC0FqhCGvbevigSb3rDZF9UEI4TrZpP1QniTJEMFniiuCxGg
	7E3L0JfyPYyh1bdeNNA0fUQYlVAWiFcNgH7J0Iv8sTU1SB6FZdMdTt1KRpTBMj+CPWc=
X-Gm-Gg: AYBFou3/ZjhxfQC82U3t4Vg+uNZC7liAcQkHre3pWHJCtQ0QMDvwHbGkpRGVExDbANn
	LFPbOFRU4KBzJ8TzzKjPIPdRQaVdcHgVn6Tz8lOKzkB/WuWYm7Ousn4kmmlclimMx+oQ2IgjKyk
	304+XQkZ5MaaLJLu7C1yUi8epEyiwxjwDzAJCtxFFha1EOWhSLZiN49RnKZpM7EIi50KirOXLrH
	3OEP8wciHx0KVa6jeTDdRtl7AVxNiTkdVSxfSCrNQtYkOKhqaO3m6e1X6u5aawYVJRzLcnyxBx2
	8kaXTvfn/Gz04DJ9EnvFxnjomh+wm+2QpSme2Mijyr9j2UauqysJyrBRKa0nFKPUj9g4NSGTDqn
	4qj2paWJrZjUv+G8h0F0Is0+1DiFSiPZQkiJb0AJBobUl7Q47MCqUtlEpXjPnfaD/KXthpoXQX7
	FVR0N7SURnFCvrH4DjFakHrDeQrkruvtBqvK/ErehQOSmYDTXq4qmYebgiZ0fbGKOrgxaV5qzKg
	Ht7aTEvBw0m3ePFo3wYDK7xhR3zJ18Im57np6POV/QRSZus4j8k2sUWW12bKhQ9BRr6Tx/wVHCq
	ZfZgrew888pPBB5p6XywqvbM5omcs/rA4vqjDOsK4W4seaaFNwyFElOkBjJll2A8Y7eNmKk/QWI
	LbcHP
X-Received: by 2002:a05:6000:2885:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-48e6e2f2c14mr21237777f8f.14.1793625457212;
        Mon, 02 Nov 2026 05:17:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7270asm20166279f8f.11.2026.11.02.05.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:17:36 -0800 (PST)
Message-ID: <402ef21d-84dd-42cf-89c3-748216ce2174@linaro.org>
Date: Mon, 2 Nov 2026 14:17:35 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/panel: Add Samsung AMS644VK04 panel driver
To: patches@brar.si, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261026-panel-ams644vk04-v2-0-e88cafb3e577@brar.si>
 <20261026-panel-ams644vk04-v2-2-e88cafb3e577@brar.si>
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
In-Reply-To: <20261026-panel-ams644vk04-v2-2-e88cafb3e577@brar.si>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/26 17:39, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add a driver for the Samsung AMS644VK04, a 1080x2400 DSI command mode
> AMOLED panel with DSC found in the OnePlus Nord (SM7250). It uses four
> lanes and DSC 1.1 at 8 bits per pixel.
> 
> The initialisation sequence comes from the downstream driver. The DSC
> picture parameter set is built with drm_dsc_pps_payload_pack() from the
> same drm_dsc_config the DSI host uses. Only the 90 Hz mode is described
> for now.
> 
> Tested on a OnePlus Nord with the msm DSI host, including suspend and
> resume.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>   MAINTAINERS                                      |   1 +
>   drivers/gpu/drm/panel/Kconfig                    |  17 ++
>   drivers/gpu/drm/panel/Makefile                   |   1 +
>   drivers/gpu/drm/panel/panel-samsung-ams644vk04.c | 356 +++++++++++++++++++++++
>   4 files changed, 375 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 19ec9f8b522f..b409a7f3985f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8466,6 +8466,7 @@ DRM DRIVER FOR SAMSUNG AMS644VK04 PANEL
>   M:	Ishu Brar <patches@brar.si>
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/display/panel/samsung,ams644vk04.yaml
> +F:	drivers/gpu/drm/panel/panel-samsung-ams644vk04.c
>   
>   DRM DRIVER FOR SAMSUNG DB7430 PANELS
>   M:	Linus Walleij <linusw@kernel.org>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 7a520b4d60fe..7cb0ff13c037 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -956,6 +956,23 @@ config DRM_PANEL_SAMSUNG_AMS639RQ08
>   	  Say Y or M here if you want to enable support for the
>   	  Samsung AMS639RQ08 FHD Plus (2340x1080@60Hz) CMD mode panel.
>   
> +config DRM_PANEL_SAMSUNG_AMS644VK04
> +	tristate "Samsung AMS644VK04 panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on GPIOLIB
> +	depends on REGULATOR
> +	select DRM_DISPLAY_DSC_HELPER
> +	select DRM_DISPLAY_HELPER
> +	help
> +	  Say Y or M here if you want to enable support for the
> +	  Samsung AMS644VK04 FHD Plus (1080x2400) DSC command mode AMOLED
> +	  panel, found in the OnePlus Nord.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called panel-samsung-ams644vk04.
> +
>   config DRM_PANEL_SAMSUNG_S6E88A0_AMS427AP24
>   	tristate "Samsung AMS427AP24 panel with S6E88A0 controller"
>   	depends on GPIOLIB && OF && REGULATOR
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index da5175909d54..01c1ca740dac 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -92,6 +92,7 @@ obj-$(CONFIG_DRM_PANEL_RENESAS_R69328) += panel-renesas-r69328.o
>   obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS581VF01) += panel-samsung-ams581vf01.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS639RQ08) += panel-samsung-ams639rq08.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS644VK04) += panel-samsung-ams644vk04.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
> diff --git a/drivers/gpu/drm/panel/panel-samsung-ams644vk04.c b/drivers/gpu/drm/panel/panel-samsung-ams644vk04.c
> new file mode 100644
> index 000000000000..3cbe1fd9aa01
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-ams644vk04.c
> @@ -0,0 +1,356 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Samsung AMS644VK04 AMOLED DSI command mode panel driver (DSC)
> + *
> + * 1080x2400, 4 lanes, DSC 1.1 8 bpc -> 8 bpp, 90 Hz.
> + * Found in the OnePlus Nord (avicii).
> + *
> + * The initialisation sequences were generated from the downstream panel
> + * description ("samsung ams644vk04 fhd cmd mode dsc dsi panel").
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#define AMS644VK04_WIDTH		1080
> +#define AMS644VK04_HEIGHT		2400
> +
> +#define AMS644VK04_MAX_BRIGHTNESS	0x7ff
> +#define AMS644VK04_DEFAULT_BRIGHTNESS	0x140
> +
> +/* Power-on order and expected load as given by the downstream supply entries */
> +static const struct regulator_bulk_data ams644vk04_supplies[] = {
> +	{ .supply = "vddio", .init_load_uA = 62000 },
> +	{ .supply = "vout", .init_load_uA = 857000 },
> +	{ .supply = "vdd", .init_load_uA = 857000 },
> +};
> +
> +struct ams644vk04 {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct drm_dsc_config dsc;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data *supplies;
> +	bool prepared;
> +};
> +
> +static inline struct ams644vk04 *to_ams644vk04(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct ams644vk04, panel);
> +}
> +
> +static void ams644vk04_send_on(struct mipi_dsi_multi_context *dsi_ctx,
> +			       const struct drm_dsc_config *dsc)
> +{
> +	struct drm_dsc_picture_parameter_set pps;
> +
> +	drm_dsc_pps_payload_pack(&pps, dsc);
> +
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x9d, 0x01);
> +	mipi_dsi_picture_parameter_set_multi(dsi_ctx, &pps);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0xa5, 0xa5);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_set_tear_on_multi(dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0xa5, 0xa5);
> +	mipi_dsi_dcs_set_column_address_multi(dsi_ctx, 0, AMS644VK04_WIDTH - 1);
> +	mipi_dsi_dcs_set_page_address_multi(dsi_ctx, 0, AMS644VK04_HEIGHT - 1);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf5, 0x85);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf8, 0xc4);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf8, 0x41, 0x47, 0x11, 0xb8, 0xb8);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf8, 0xcc);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf2, 0x82);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf5, 0x87);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0xa5, 0xa5);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdd, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0xa5, 0xa5);
> +	mipi_dsi_msleep(dsi_ctx, 110);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb7, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb7, 0x13);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb7, 0x01, 0x37);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0xa5, 0xa5);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x60, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0xa5, 0xa5);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x55, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0xa5, 0xa5);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xbd, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0xa5, 0xa5);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe6, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xf0, 0xa5, 0xa5);
> +	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
> +}
> +
> +static void ams644vk04_send_off(struct mipi_dsi_multi_context *dsi_ctx)
> +{
> +	mipi_dsi_dcs_set_display_off_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 10);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 120);
> +}
> +
> +static void ams644vk04_reset(struct ams644vk04 *ctx)
> +{
> +	/* Same timing as downstream: 10 ms steps, the logical value 1 asserts reset */
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 10100);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(10000, 10100);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 10100);
> +}
> +
> +static void ams644vk04_supplies_disable(struct ams644vk04 *ctx, int first)
> +{
> +	int i;
> +
> +	for (i = first; i >= 0; i--)
> +		regulator_disable(ctx->supplies[i].consumer);
> +}
> +
> +static int ams644vk04_supplies_enable(struct ams644vk04 *ctx)
> +{
> +	struct device *dev = &ctx->dsi->dev;
> +	int i, ret;
> +
> +	/* The rails come up one after the other, vddio and vout need time to settle */
> +	for (i = 0; i < ARRAY_SIZE(ams644vk04_supplies); i++) {
> +		ret = regulator_enable(ctx->supplies[i].consumer);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable %s: %d\n",
> +				ams644vk04_supplies[i].supply, ret);
> +			ams644vk04_supplies_disable(ctx, i - 1);
> +			return ret;
> +		}
> +
> +		if (i < ARRAY_SIZE(ams644vk04_supplies) - 1)
> +			msleep(20);
> +	}
> +
> +	return 0;
> +}
> +
> +static int ams644vk04_prepare(struct drm_panel *panel)
> +{
> +	struct ams644vk04 *ctx = to_ams644vk04(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +	int ret;
> +
> +	ret = ams644vk04_supplies_enable(ctx);
> +	if (ret)
> +		return ret;
> +
> +	ams644vk04_reset(ctx);
> +
> +	ams644vk04_send_on(&dsi_ctx, &ctx->dsc);
> +	if (dsi_ctx.accum_err) {
> +		ret = dsi_ctx.accum_err;
> +		dev_err(dev, "Failed to send on sequence: %d\n", ret);
> +		goto err_power_down;
> +	}
> +
> +	ctx->prepared = true;
> +
> +	return 0;
> +
> +err_power_down:
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	ams644vk04_supplies_disable(ctx, ARRAY_SIZE(ams644vk04_supplies) - 1);
> +
> +	return ret;
> +}
> +
> +static int ams644vk04_unprepare(struct drm_panel *panel)
> +{
> +	struct ams644vk04 *ctx = to_ams644vk04(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	ctx->prepared = false;
> +
> +	ams644vk04_send_off(&dsi_ctx);
> +	if (dsi_ctx.accum_err)
> +		dev_err(dev, "Failed to send off sequence: %d\n", dsi_ctx.accum_err);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	ams644vk04_supplies_disable(ctx, ARRAY_SIZE(ams644vk04_supplies) - 1);
> +
> +	return 0;
> +}
> +
> +/*
> + * Timings are the downstream ones.  The clock is htotal * vtotal * refresh:
> + * the msm DSI host scales the pixel clock for DSC by itself, so the mode
> + * describes the uncompressed picture.
> + */
> +static const struct drm_display_mode ams644vk04_mode = {
> +	.clock = (1080 + 52 + 24 + 24) * (2400 + 4 + 4 + 8) * 90 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 52,
> +	.hsync_end = 1080 + 52 + 24,
> +	.htotal = 1080 + 52 + 24 + 24,
> +	.vdisplay = 2400,
> +	.vsync_start = 2400 + 4,
> +	.vsync_end = 2400 + 4 + 4,
> +	.vtotal = 2400 + 4 + 4 + 8,
> +	.width_mm = 67,
> +	.height_mm = 149,
> +	.type = DRM_MODE_TYPE_DRIVER,
> +};
> +
> +static int ams644vk04_get_modes(struct drm_panel *panel,
> +				struct drm_connector *connector)
> +{
> +	return drm_connector_helper_get_modes_fixed(connector, &ams644vk04_mode);
> +}
> +
> +static const struct drm_panel_funcs ams644vk04_panel_funcs = {
> +	.prepare = ams644vk04_prepare,
> +	.unprepare = ams644vk04_unprepare,
> +	.get_modes = ams644vk04_get_modes,
> +};
> +
> +static int ams644vk04_bl_update_status(struct backlight_device *bl)
> +{
> +	struct ams644vk04 *ctx = bl_get_data(bl);
> +
> +	if (!ctx->prepared)
> +		return 0;
> +
> +	/* The panel takes the 11 bit level most significant byte first */
> +	return mipi_dsi_dcs_set_display_brightness_large(ctx->dsi,
> +							 backlight_get_brightness(bl));
> +}
> +
> +static const struct backlight_ops ams644vk04_bl_ops = {
> +	.update_status = ams644vk04_bl_update_status,
> +};
> +
> +static int ams644vk04_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = AMS644VK04_DEFAULT_BRIGHTNESS,
> +		.max_brightness = AMS644VK04_MAX_BRIGHTNESS,
> +	};
> +	struct backlight_device *bl;
> +	struct ams644vk04 *ctx;
> +	int ret;
> +
> +	ctx = devm_drm_panel_alloc(dev, struct ams644vk04, panel,
> +				   &ams644vk04_panel_funcs,
> +				   DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
> +
> +	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(ams644vk04_supplies),
> +					    ams644vk04_supplies, &ctx->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS |
> +			  MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT;
> +
> +	/*
> +	 * DSC 1.1, 8 bpc, 8 bpp (4 fractional bits), block prediction, two
> +	 * 540x48 slices per line, both in the same packet.  The DSI host
> +	 * derives the remaining rate control parameters from this.
> +	 */
> +	ctx->dsc.dsc_version_major = 1;
> +	ctx->dsc.dsc_version_minor = 1;
> +	ctx->dsc.slice_width = 540;
> +	ctx->dsc.slice_height = 48;
> +	ctx->dsc.slice_count = AMS644VK04_WIDTH / ctx->dsc.slice_width;
> +	ctx->dsc.bits_per_component = 8;
> +	ctx->dsc.bits_per_pixel = 8 << 4;
> +	ctx->dsc.block_pred_enable = true;
> +	dsi->dsc = &ctx->dsc;
> +
> +	ctx->panel.prepare_prev_first = true;
> +
> +	bl = devm_backlight_device_register(dev, dev_name(dev), dev, ctx,
> +					    &ams644vk04_bl_ops, &props);
> +	if (IS_ERR(bl))
> +		return dev_err_probe(dev, PTR_ERR(bl), "Failed to register backlight\n");
> +	ctx->panel.backlight = bl;
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		drm_panel_remove(&ctx->panel);
> +		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static void ams644vk04_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct ams644vk04 *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id ams644vk04_of_match[] = {
> +	{ .compatible = "samsung,ams644vk04" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ams644vk04_of_match);
> +
> +static struct mipi_dsi_driver ams644vk04_driver = {
> +	.probe = ams644vk04_probe,
> +	.remove = ams644vk04_remove,
> +	.driver = {
> +		.name = "panel-samsung-ams644vk04",
> +		.of_match_table = ams644vk04_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(ams644vk04_driver);
> +
> +MODULE_DESCRIPTION("Panel driver for the Samsung AMS644VK04 AMOLED DSI panel");
> +MODULE_LICENSE("GPL");
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
