Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625853;
	b=NA8Y8pWwPZEkhNV6xOoj3nUdy+adBMrEeCXDfpqs8zBjBcbaA0T+vxbYmfmrvlsiC2K2
	 0AoIs+NOQxP19UqWr9g68WphA4hTDO6YlGyR070jc7958vPbw/YzWYgZQyQTQouiJ8tpP
	 LmQUs9MGCqZXbmBvmggenjWz+rdsjJ6qUjBy53MyyJy1QxTlJSI+ALwBYA+toL1ffTAlW
	 8kh100PTgyd+hlsXEHzPAwvqMwFJjwyY3wpbzKZGTVjtbUdl5hIRqIQLbrIy9kp2Kwfv3
	 VaCXTey2EzkLtHSzUrnqNWwE/QZdrMWxBXrK+SY8CCZ+ncWGU5aWy3Df14tO/qbnjYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wrlc0uPOpWufY4Ha9PM3YaR+47hyRCDT/vlwyZbcxAs=;
	b=DjO7EYLEwR6bc7o7+j9duqrmQJLgFu6y5PlBnlV3t/jyxPENsnq8CTWWhmiuI4W9RdS6
	 KDhVsBw5sOs8oKVhYdVpi4zi3NW6PaDjYvyBzq2XAc1yu7c8U4pLuaBTJo/xMc2TZpin6
	 n6pPw+G2xm8ewKdWbBWCbL1YWOGuaWjrP2zy8oCK0rkjxP6FTWO4Cew/HIdfrneXZN95X
	 RQDbxCQbI7Tp50eACPN6s6LUPpa0P5rI9zbWB9TuV9m/YhDMyFO53wjScASX3xl5C+VDu
	 ik4LLBoXRe62uxhjSy1Q8mK96auwYxl9BhIQ9LtTAUSHWJibfAwVyo44aR1s6xl/g/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ho7ooRX2;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5662606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5662606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ho7ooRX2
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso26595445e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793625851; x=1794230651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrlc0uPOpWufY4Ha9PM3YaR+47hyRCDT/vlwyZbcxAs=;
        b=ho7ooRX2b+ftGMMlHNxcrpTVg9BtdfxBjbgVRteQAi3eHmrF22rXICGR/rpE/i+LT9
         J969Ox0wbROQEo2Z9qcFPgXPI2GJGGG+I+60lJaFKmCnfW+1qZ1XW2Gz2Qc+YZGBgrf3
         E/0t9WbDqlF9jU/qNsnOUfnocCAyQfv3MOObWc5w3OHsMlvz8CuTYewbwUuPZzxW3jzf
         TKWsqNjMdf62cazsY7GRs3P0EnoD1oStfU1HHiNUlRfE9lSYoPMcJZ6uJaODLTMx2BmP
         lgYwc/eRwPO6dNLpMVgP05iCWlZgX6q2RCGEBKimIlS14jnKYjgPTm7dSLN46RASuzTx
         6XoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625851; x=1794230651;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrlc0uPOpWufY4Ha9PM3YaR+47hyRCDT/vlwyZbcxAs=;
        b=F72gUlIxKLkIUJ8s+6h+vwq2DYizFqQ7VxmcmNjdABKrcCGUjDVqerupjCLgMoPdWg
         WZvwBdUbJV0XJp8NNjAMxduG00xhJ2udz0NoxQBfQuLF5il22Dyakzj5sFafAxT7D2em
         VbUqVSdyYA8sKBkamRpOqchEhX8zUsY6nCA+q8MfiWU7S/tI2eD6ni1fMD9z6s0orGlt
         +YKFcSHzPa8aBLemRgC9GoiAPd9SjLhluoxjyHfZNWXQl5PqyL54t7yip886WS/0NPiL
         vO2E1yE7zsYrDiojFxEz68E9zi0C6X+wMi2BVmJbZpt267HTXSPj5ajh9woEYmCUGsER
         NUGw==
X-Forwarded-Encrypted: i=1; AKwUvBzPz+3mYHVwlxw1Qh2lWJ+jkXZOtKdkAhMvP8EcjHOlfdJQmrOMx2KrqmxrofhXwSNEnzYZN+VlWjC+O6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmrZwqeiHZD6o6d0n4k11sIWQe8JTuCN2VJsZeXq/7Ytr6QZMg
	gqf09kdZ7zC37KTdqJLSgxsq/utPW3hyQbeqIKFPk5F5iMbddRXVmM1ec4M6hqHtm7Q=
X-Gm-Gg: AYBFou0hV53K/Awf5Lrzu8/yeXBmLTQhdr0d+DlvjR3EEfbQGudgdPtQIejqgNfRIyC
	JMKozORRjdwbZTsRoeRKbfm/0Or4pQn6CZuC3z/WVmeHIxT/jLBrQoqcG8LQQnj5mF28wUUnwj3
	SG/K34wR/Qek0TCUyztTuLfHdrCG76syebwhIpQ/42JswMy6ba5u58eJCB+8/uM/Xpfd3BJKLjz
	f7StCLr4Gv4cXcdiz7Luww092bJgPzx9zDdB7XmjdINT8vuYsaCbOKS8ZeoCeH8InbX4lLag005
	nLvU+Wx3VJnfE1yDn7bDQF+tbYmcnWw6WekwElH6M6wtaDdXx3HdIOzFl8BRMWl79YMaU8u97aW
	g8tZNA7B12XhYCdwkSvcY4l243aPk2yP2aHEaoHrpgQPuVK62WJfi16r/wL6mTYkxE2E/u7ulBp
	JKjQJs43Ecs86nESzHmyt47Dhy+q2w/ORwsTaZvB4FXVuzdl5A8Us/SEn87s3UYjf2v9MonoyCM
	QMLnqczJpRWi0SSsk/nsj531DxMviAt2fx39e0qKjUrcENdZF4IRaHf8HJRYpMNNdDZoFY6iBWj
	6YVwpvdm6JNgHvM0tzGU/LvYTp2TrBl+yuz17yEO/ooJe94kUlqh8UK1WIxMFJO1kbO9qlzlWm7
	tGd91
X-Received: by 2002:a05:600c:4e88:b0:4a3:59c7:f226 with SMTP id 5b1f17b1804b1-4ac16bc4713mr239062835e9.6.1793625850979;
        Mon, 02 Nov 2026 05:24:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf7146621sm276611165e9.13.2026.11.02.05.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:24:10 -0800 (PST)
Message-ID: <620eb58a-bd8a-4679-84de-0285f10e0262@linaro.org>
Date: Mon, 2 Nov 2026 14:24:09 +0100
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
Subject: Re: [PATCH 2/4] drm/panel: himax-hx8279: add the VDDP supply
To: David Lechner <dlechner@baylibre.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
 <20261006-panel-himax-hx8279-vddp-v1-2-50d884b42aae@baylibre.com>
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
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-2-50d884b42aae@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/26 22:25, David Lechner wrote:
> Get and enable the vddp-supply along with VDD and IOVCC.
> 
> The Startek KD070FHFID078 panel has a VDDP power input, which the
> MediaTek Genio 520 and 720 EVKs switch with a regulator of its own, so
> the driver has to enable it for the panel to be powered on those boards.
> 
> On boards that do not describe vddp-supply, the regulator core provides
> a dummy regulator, so they only see a "using dummy regulator" message.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx8279.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8279.c b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> index 9e443c719843..fe665cd3a3d2 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8279.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> @@ -112,7 +112,7 @@
>   struct hx8279 {
>   	struct drm_panel panel;
>   	struct mipi_dsi_device *dsi[2];
> -	struct regulator_bulk_data vregs[2];
> +	struct regulator_bulk_data vregs[3];
>   	struct gpio_desc *enable_gpio;
>   	struct gpio_desc *reset_gpio;
>   	const struct hx8279_panel_desc *desc;
> @@ -769,6 +769,7 @@ static int hx8279_init_vregs(struct hx8279 *hx, struct device *dev)
>   
>   	hx->vregs[0].supply = "vdd";
>   	hx->vregs[1].supply = "iovcc";
> +	hx->vregs[2].supply = "vddp";
>   	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(hx->vregs),
>   				      hx->vregs);
>   	if (ret < 0)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
