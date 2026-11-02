Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625412;
	b=BiEZ13Mzj8W3UI50QgDLQfuQZHwtWDTAZi/ati+ZAZtJr0Q2zG0aQOtnx4ssZ3eTeS/J
	 s3h8Ccs0i8UKahwYYEFbK1sfYoImamCsqq7Ub5eJ8yi0HT1MS45qgzS2o+PIEuoQklWv5
	 r06c/Qn4qQc5YyY4Rm001kCqovzDeokP8eds3jAoA7mrTCmgUhfkZlAjbX1nF5APsFJo1
	 TWlFhPd9BxRQ/TXrWyTlc7TpAOBvAWjkDF57eZxiF1po+min111ZqMzHtEeHjtoesZuQI
	 OsBGCHrI32dHGLcpgkZKC41eWVLMShDiTWyBSMAWJ62bTv4uHAk4oa0FZMoi0RMDbqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Nu0UBnRlzBjlTsD7Xnyon69xqlQ0MnOsBtNCGwjj4wU=;
	b=m2Hwtf5+mR2PintGCIRgdnIVehzsiUjQ4OkmU/RfNVUJ9gZDRQAr7YtR5d64T8zhTB0Q
	 n4NdpHpoiHKSkQ36rYLZ0/vDXC6BiabgZWWRkkzy4KZNy13jucZueyISnaNtXyx3tbjE+
	 FMXMUvivXnD/J/BXyCfBcknCVSlC90yWhkiiIbbYYbhzAh4ZXFBXHsyb39slmKxfBquFx
	 nuBjwsDZtWoL+vKf8k4ohfN29C5ZEjPPLfwg/B9snNtQ1Ce8j56CHxAhJ6nHVsa7wQIYV
	 IgLTS+C7ljO8uPjhwtNEf8J6hOYIHYegey8uPok/PxdolbN0lKsjqDgbLBdzWJmTdFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CNjKDcC1;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423D9606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 423D9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CNjKDcC1
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so22875225e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793625411; x=1794230211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nu0UBnRlzBjlTsD7Xnyon69xqlQ0MnOsBtNCGwjj4wU=;
        b=CNjKDcC1vcob1Yw0x51FCYwzXMhIJwqcfHwCboC30T8iIZH6Dh52y6HFV1UY1wRygk
         7tHiPu4mesMgtDfrhzRNXA3a4PpP88fKTjkl4FxPj5YPmCNOkfBiryqv1bjicJfmvLaP
         bChXjd/qCIfmyLJL4DFwf5bRPP+n4p5kPCNOMF2s1ytYnLXdyhNC4iOqrjQQyOBslGW7
         Od0RmsIUb9I+/f3u8/hWWzWfAHLvMwFBSt5X104OmdO9ry5wI8+33oBAAidwztLoPIQM
         w3I4OAIRDs29VvIoxn/SKkiklIOQNWQxK2T41zI31CAXNuljqvTZM1TorOmZjKnngC77
         eddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625411; x=1794230211;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nu0UBnRlzBjlTsD7Xnyon69xqlQ0MnOsBtNCGwjj4wU=;
        b=dVl5a8G9Y7lHykTL9FEoLL6ohFmNBmZobGgCie54dVBiLlLJppz4+GrYap7jW4+NZa
         B2A06cdhL5w6Q9DJWuxEEbqX6k507vojlIY/k+JAP+JpS8EdwvQKiyzNw9vi1Qcbaj8S
         994bFs4BpIz23LcHYh7eXJzlLqjH1x59BMvHAkChFGzVgj4/6MOSgaWOE/i4uKgjgUCE
         Cv7rLk5syy/ar503EjrB5Ucz1losUTfcYy9pnLoC791ofxvSVjVuPdacYrjnFGNdR4E1
         tPN9zC/HqEMR0NvFRvu6p4XlvXH8IYexxEfvJiPqjOI5hylS/qSm/WhcEIXluHxbwJ97
         lcWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzzXrmHyQwhc7qRgjqjsr5IX5jIEBCpyPMhkOF9pP5dp/BlFRNiULcUtJm2KuzDHXJQX2esokALW7CcW0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfnLI9zM0Obexc87tUrGq5B4EoD+a1l2NufTMHiEmClpfNwYPa
	30s9kcN0v/nTWAIpOVI/3xdKIg8F2BMED5cv8mlvHdrASuHVYeezPOTIsfwZ1w2x1FI=
X-Gm-Gg: AYBFou05TLRSYX7A1ojLRahiE3Uj7csTNXSX1lr9cvaF5HRl6GjnGSL9pcb2VZ2gR/2
	bEsKMVf481W27gy4ID8yxjvHihR4b3Mip74GLR7PepdS6O6SHK3Gi2BWE192UYl93oyK7v7+4eo
	gl2Asbvui1Ac3gVWYIIpkYDRDr3m45XtratuytQFlmz1z0aSHQGnNV25HdR7P+fQvobyjLhbclI
	ij7ArZAzwpyVkQyDtCjiUnBWS99whHz7IumXEaALyUExefwW859JAp/pTaBLHwWT5CzArbQHyTV
	a00uCvXPhOtYJCTzrPCU+W9d6RgP4TqpX5rsp/UeBUcRx8I48EZ5ByGVOhaZX4jCTMgSS6rZTUS
	om2vXFeJI4ovllh8aOIgEnKZs7g7MvwWdO297Qtzscu95XDRcPW2D8hIsZl1FcuIlPivrLx5VHD
	vmlpTVVjVwgONRzyOIb8gXua9JKpbMnn0IjQk6VI2sgK0RtNqZ3K5rtz3oTw59aYYNMyHCtzF+Y
	4efMDq28Ewmu7B2c9MyZJh38MC8oW1eg3S44+p7pUtPpCAyhen1ZCEt1BwisoK9j0gHgv2guAP0
	qYHMx9rg463pzvoRg9qgaA2jE3FoGKvbiTrwnRwulMJ60u2qhqzgPC3oLAst5jAEAUlwV39egf4
	6dsL9OQ==
X-Received: by 2002:a05:600c:8b0a:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4ac1709ae4emr246187665e9.14.1793625410523;
        Mon, 02 Nov 2026 05:16:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm331607645e9.2.2026.11.02.05.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:16:50 -0800 (PST)
Message-ID: <fbf54a00-33c6-4b5f-a9d9-3f6c23744ae9@linaro.org>
Date: Mon, 2 Nov 2026 14:16:49 +0100
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
Subject: Re: [PATCH v5 3/7] drm/panel: simple: Add Waiken WKS101WX001-WCT
 panel support
To: Frank.Li@oss.nxp.com, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Robert Chiras <robert.chiras@nxp.com>,
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
References: <20261027-dxl_lcdif-v5-0-3a974e4b94b2@nxp.com>
 <20261027-dxl_lcdif-v5-3-3a974e4b94b2@nxp.com>
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
In-Reply-To: <20261027-dxl_lcdif-v5-3-3a974e4b94b2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/26 16:00, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add support for the Waiken WKS101WX001-WCT, an industrial-grade 10.1-inch
> IPS TFT LCD panel with a capacitive touchscreen.
> 
> Although the module advertises LVDS support, enabling LVDS operation
> requires hardware modification, including the removal of several on-board
> resistors. As there are currently no known users of the LVDS configuration,
> only the default interface mode is supported.
> 
> Acked-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v5
> - drop "If LVDS..." in commit message (Liu ying).
> 
> change in v4
> - s/LDB/DPI
> - variable use 101wx001_wct
> 
> change in v3
> - add wct surfix and change to use MEDIA_BUS_FMT_RGB888_1X24
> - Add information about lvds support plan.
> 
> change in v2
> - update height to 135 from 136 (sashiko)
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index d7dbd7442919b..5ef6a79f0de95 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -5252,6 +5252,34 @@ static const struct panel_desc vl050_8048nt_c01 = {
>   	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
>   };
>   
> +static const struct drm_display_mode waiken_101wx001_wct_mode = {
> +	.clock = 71100,
> +	.hdisplay = 1280,
> +	.hsync_start = 1280 + 70,
> +	.hsync_end = 1280 + 70 + 10,
> +	.htotal = 1280 + 70 + 10 + 80,
> +	.vdisplay = 800,
> +	.vsync_start = 800 + 10,
> +	.vsync_end = 800 + 10 + 3,
> +	.vtotal = 800 + 10 + 3 + 10,
> +	.width_mm = 217,
> +	.height_mm = 135,
> +	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
> +static const struct panel_desc waiken_101wx001_wct_panel = {
> +	.modes = &waiken_101wx001_wct_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 217,
> +		.height = 135,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +};
> +
>   static const struct drm_display_mode waveshare_28_lcd_mode = {
>   	.clock = 50000,
>   	.hdisplay = 480,
> @@ -6248,6 +6276,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "vxt,vl050-8048nt-c01",
>   		.data = &vl050_8048nt_c01,
> +	}, {
> +		.compatible = "waiken,101wx001-wct",
> +		.data = &waiken_101wx001_wct_panel,
>   	}, {
>   		.compatible = "waveshare,2.8inch-panel",
>   		.data = &waveshare_28_lcd_panel
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
