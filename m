Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626993;
	b=OmbF0yYugZtK9QJsbofGmTBoZxBIftG/DEYhQsHmht0C9x61UQaMtaih3Yxpvx2Mpz9g
	 /SoMZksF+8qAjri6o/mjBGgQyXvMxxZ2x1Y6brNnKzVHueXJQj+Ra1Y4nvKIxJxKJuJvO
	 7qotidFyT9f/O/YMzmei5nOdawjiRHk3k+drDuQUcShMHAWuRmZopVHUoLRwHgWx7G65o
	 7cijZxW4d3Z15gKOii7CuG6dEksNDejVGaW0Zw95wzjXrAFny/KD54YQXYrki2HQgCCyl
	 LvwKOOY2dzyniti5N+QpT+sErl9Gcsq8LQnW0i7uGa2QhOsV6Ed1Ph1k//jeNbn2+3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vZtW7lCUy+nRe8aQGLzw6+UgY7GQ7HugFqgCTw6Ar5M=;
	b=u5pt4x4v4MsHyIA+Ao2kT8y697AQX+0ZtYMbSDattTnlvGJcBD4mf0HZRWZRhNDBinqz
	 JesWG8L0SoJBzok9S0fWT2asUYfFO8XYj2FiqCf57Bk0DMfAFshZoJXcVT8rTNckajfur
	 To/aOpFTXRtJ8fmsjM8VA6a3yEZcBV9gkR1bb8DPIIeyMu4uV5qtOehYywuFXMe7lOqt5
	 KCB9nFllxQNZX5r8AnmJzjrzO2sYYDwHxeKM6gvL+/UWz8RgL8pc2P/mCeFKyibBwXU6O
	 epoVMnBjNBMg35ZPQUcCVwr/dFvHPKBzTchIVeuP913amwP1AstLzcY4Pkn5Cf26z5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eCnipccM;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F41606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01F41606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eCnipccM
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so13402385e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626991; x=1794231791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZtW7lCUy+nRe8aQGLzw6+UgY7GQ7HugFqgCTw6Ar5M=;
        b=eCnipccMy8UHLWObF7WwFqtS67owPBdjNZB2HnIwclJeVcvqVAav8eg5oOuUaRJpaV
         9uXuqp749RUHvyISzauT8fPkbJbdaHLULJOnazTTFR4x4kujviHfTfTSHVih5CVhwoLh
         VsIGzkClIi50Fm/PtZ1e8p26mdw3KvJGXB1x9YkXMxQTecEBpJn32DvhgFP+7PUAOA58
         i/LMzLlI7VRA7aPhN44meaBWE8qoVdnaBKAdVa6rY+3sgZUEdjqWauQZ9yEmJ++phQq8
         LtMHzVLoTEKP34FRuxsPmLhtk+BVIWWRvfwS1/pZiltZy4H1WpBm3ZWzUreF4DlIXaT8
         CJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626991; x=1794231791;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZtW7lCUy+nRe8aQGLzw6+UgY7GQ7HugFqgCTw6Ar5M=;
        b=I8rAYDLl9cmkKm9UAsoRcHnO52AJPED4l+DDbAbE9Nm7E5v0KknAi0//iIzdlvo8Yn
         oaqA9uCnQXOFCVGKxyUN6KPBvv6o7tAkP7Phj+OQl/6grmLSmWtlvaTm7OfIrsAcn0D1
         EE8JnyvWfL7rcPjmA440VP0H0eY8efQLkkDiSoQ7yfAxaFz8usX9YErdGnUgkeAXAu76
         QCz0yYE5IwWUqLTG6vfGjcLwYW+RJiHwkwxWAXbqOkxjMKuWU0LIfEdQrS2ArUTCATBH
         dutec5WJfRYLrO4QBHcT+iun91E3RqBYczxSoT6Akj5/rBKu5/jrXS2GzfdyscNOBd5a
         h8SQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNL4RW+l4rC4sTqroZoCRXs33ZORa9K4IrALSTKDV1/Xfmne5xQ+i4w+BMRDIk7omkdtTgbBndX5+kipc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvlPXAHJMb4b4FkI75751Zv45IPGkuSsBEYSmK/mtFTriWqP8v
	+HUXDlytlvZkaygmDHBM00Ny3Pg5scEYXpSTEfsAjMuimP79qoOl47a6clo6QtfB8xI=
X-Gm-Gg: AYBFou2eO5dQAd4kQwdFGct4qOsmaVzyC2DD6O0PSnen5LHimnhY+d1JGzkYDyMRwFO
	/ngHgA+tLa2x+TwxryA56pVWYFYJ2BDLnlrRyiNJc8nFc5v4tELS5CkBf/l7kfxW/STbbV6GgJr
	rTQJbEkoK73B3GR60oljojevblBTUJA08kLK8pJR5ixkhtODUUr9wSbozqsbMxdMvOzsod6kfwp
	e/SevN3XD2IoK6lnjRFTgYgvemxNaEI0JnWolSYwwtE2eK8ccEHnNTnw+OgIfIaJS0YgDJwdhWm
	BLxmfPg/5kXGzl2MYLz4br8mkPolxzWL2fcF9p3oOLu9QAvAx8wQp4tap9v4GHyNQH/AuSInKxy
	SuSbeEn4Ya3ZwtqgHxuXMSL7jMfGN7haQKhBNDZ0OtdZBBf3lPmCfh5ckN+oIpIQSyaGfgOCbRz
	FHOy1xNKsjpPdJ+OrTs1KeqyoAEW2Q/VCjbTNJ4rRlzYa1Y88tmvxEf/VKq1lQggzABGpPd2eBW
	/envkv7stE0ufGCjoETN2i6v/GyqCJGaSUQV+g1hnq9KJ/6xWBeONVInoEvURabU/V+lwQYtGi2
	fMWxjIL6dhsr+RJJGj1JOz5uLTw+CHq3DhWQiMFaHSQ//k/kekz+YzqwcxT6tFuKEX6QHhAMc0J
	BZ2G/
X-Received: by 2002:a05:600c:3510:b0:4a1:dec1:4e1 with SMTP id 5b1f17b1804b1-4ac1765d674mr232355375e9.22.1793626991204;
        Mon, 02 Nov 2026 05:43:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe885d91esm201456445e9.0.2026.11.02.05.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:43:10 -0800 (PST)
Message-ID: <d5dba5be-b386-467c-8cf5-2dee30c5d0cb@linaro.org>
Date: Mon, 2 Nov 2026 14:43:09 +0100
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
Subject: Re: [PATCH v1] drm/bridge: ssd2825: Fix panel enable sequence
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261025133636.253505-1-clamor95@gmail.com>
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
In-Reply-To: <20261025133636.253505-1-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/26 14:36, Svyatoslav Ryhel wrote:
> Currently, in the case of a single bridge and a single panel, the DRM
> framework calls panel prepare() > bridge pre_enable() > bridge enable() >
> panel enable(). While this is fine for most cases, the SSD2825 requires
> the last two steps to be swapped. There is no meaningful way to achieve
> this using standard bridge chain configuration, so the bridge previously
> called panel_enable() directly at the end of its pre_enable() hook to
> gain fine-grained control over the sequence.
> 
> Commit 554d36acf5e0 ("drm/bridge: ssd2825: don't create a panel_bridge")
> removed this call, resulting in a regression where display output is
> missing because the panel enable function is now called after the bridge
> completes its configuration.
> 
> Since panels are now automatically wrapped into the bridge framework,
> invoke the next bridge's atomic enable directly, similar to how panel
> enabling was handled previously.
> 
> This restores panel support on the LG Optimus 4X HD (P880) and
> Optimus Vu (P895).
> 
> Fixes: 554d36acf5e0 ("drm/bridge: ssd2825: don't create a panel_bridge")
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   drivers/gpu/drm/bridge/ssd2825.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ssd2825.c b/drivers/gpu/drm/bridge/ssd2825.c
> index 71877699dfab6..9216cee09115f 100644
> --- a/drivers/gpu/drm/bridge/ssd2825.c
> +++ b/drivers/gpu/drm/bridge/ssd2825.c
> @@ -475,6 +475,7 @@ static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   					     struct drm_atomic_commit *state)
>   {
>   	struct ssd2825_priv *priv = bridge_to_ssd2825(bridge);
> +	struct drm_bridge *next_bridge = priv->output.bridge;
>   	struct mipi_dsi_device *dsi_dev = priv->output.dev;
>   	const struct drm_crtc_state *crtc_state;
>   	const struct drm_display_mode *mode;
> @@ -569,6 +570,14 @@ static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   	/* Initial DSI configuration register set */
>   	ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
>   	ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> +
> +	/*
> +	 * The SSD2825 requires that the next bridge be enabled first;
> +	 * otherwise, the SSD2825 cannot complete its configuration and
> +	 * there will be no output.
> +	 */
> +	if (next_bridge->funcs && next_bridge->funcs->atomic_enable)
> +		next_bridge->funcs->atomic_enable(next_bridge, state);
>   }
>   
>   static void ssd2825_bridge_atomic_enable(struct drm_bridge *bridge,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
