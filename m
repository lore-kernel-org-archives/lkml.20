Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893641;
	b=Ir/AWw9pfRdexeUh46e/lpjrZuRVGIZ9KTkK6UyNo/9icVGKS+EzRRKGnosTAkjwj3c1
	 OvQkpBxHgKqZEVcZ8P9ZNoG033MmPCRV3Rc+Sl9i3SNKCF5ccKiysH1YwYIrCtRaCWncc
	 qRlK2KKxzaauGy6gnBFOni2CbnR0xRAxmKYcGQfepzN01D/SiRusY68EQSbPwKkg/o1bq
	 aKR4ovoI/qnM8yESw2VnghGiqRdnkUCBoBnhFhFvVU/BZWQk+sYccTdtSxqpwo9y3cQCn
	 Cg95C5gRlm7GB92fHOChBniPwZNfLLNnLKfkrSf6VtltcNz221eXnnopDlwwrqDEnBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=jEFthDeOw857Vl1Txv+y9bOC3ebCcB7q3/QmLSqJflg=;
	b=eJBpSvVWjbxF7NXkK2o9kA0fqJSvpLZYEE8kY/s31bYA2pY6UET3/QUQwfZxIDkfO1W/
	 NF58SVHwvZNuacuis6chuIdhFx7/Qgn+qBNnMUoIIk1zY5wRVQiShiD0jRcb9JfSNatBz
	 7kDDb65r/dGIlJJe1UHuBTbU58JpTB6mKJzL3P04WPr5p+vAR/lDkkJqMkX1c+rNdJsXl
	 QTyCndR+jAVQmEfCeuH26hw+dUpDd21r8Eg06T/BXsxucjA1F/peg6rFonLtXcPjjUatj
	 uMmizQ8bw0DJsnze7UxePsRGuylI28k7EowUgkd1O10LJB8pzGz4z3e4gKV1w7ig+9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cL+U3pkt;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F79C6082BE5
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F79C6082BE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cL+U3pkt
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1115452f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793893639; x=1794498439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jEFthDeOw857Vl1Txv+y9bOC3ebCcB7q3/QmLSqJflg=;
        b=cL+U3pkthZnkb0v39QQQYejuiT/Dlmbw24zVnSYB6Ydp+9J1wUlpLGTpKUltjBbjUT
         a0MAzKkT2nODy5QedoODzUsXOBpAOLdRB4pVrZZiniQNSNUBYBS2thCDntP/tf1nXF1k
         mjAUJK+XT6qWx8mWv39Ev9Dye78M1n8bUwabr2/KfNgWbam7UKFy8RvKicZw5xEJij4g
         bQ5dy3cP2MXCObKlPr0qX5cbn4u6agbh1DUg2MoiebfRnVVLsEdMN1uhBhzx0spFgwZN
         kHyxaFHSHUvlk2uM8Bwd+ttbkzEPHa94+5Fr87zUKI+eA8GAg6zAJhCm6YtMdi6cd7k0
         THVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893639; x=1794498439;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jEFthDeOw857Vl1Txv+y9bOC3ebCcB7q3/QmLSqJflg=;
        b=HkVtqGn3ZDRfrUfdB2AQi9FIB0+S1d2gzrxj+wdi6GRqTig1fpjDn05SgZVeMRzw2F
         HOxkLfslRb8NQWzd6egoXoo/0qoe3y5KAcF8NPAfL5czn59RASz45syupcMetI6ujuA5
         38RzXQr8TAG7U9eXLHKtUMqXHWm3Hi1To3kdAQw8be2yHQBKv62P1i92Eu8a+TInT2ab
         wCFUMOnIL9EnnY4ZpeHfzh7bjo2j70KGBm5Ih8LNmBAf+0bcDHEVReIxQ8/echCnKCiI
         JY8Bhj+tVmOsXSYD8I7pdr7nOE4wcJaoLifOUrW0dURXBTLaYq7EBOR5Fa84bApCN0kN
         1uHw==
X-Forwarded-Encrypted: i=1; AKwUvBzTTDxA49EKpVr0/je4RlHBvpNC34XduiLNxkP1xp44hZpcPSmx6wSr1PsGL2J8t9odIlcsTjzo87uslk4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9chNr4+JZdx9zXsXGf3lVkUptg2nq05YUBrDNj9mR5o9DwY7Lq
	qtBKd+sOok0FTOM52ivbCAsCNhb57xYqyyaiqYa/me1nsvj8xty72pmB61Q6GvKosXU=
X-Gm-Gg: AYBFou3TtAdZxp6MbpBVSnY4bnS6mbP5EYY9Q6kooKGlyZW0ubC374zkI7STrSqmdtD
	sD4qTcZreo4wEQAtk2BUFpQ18kdn0AspVDLsVIXVOoDIwZe9KaiyXc0N2If0znzpAGUdisVGTJk
	jrn/5Qa0FHGA2vSuFmTO3l43tZWkQ2FF4mDWK4C0WSAt6amAntqh5ckA28mVEevSgUQKsUaHUUo
	Ux7ozzahkfVEJfAD8qk4h5fjnB+BUQgmWIYdAwB/EzeeRht5NfLma1DGjREZfKK4vr+3UZfTgMJ
	+E7xm9HK8K3PZ8glRzg/p/l4Qn+4zb1kQFpd19mJCoDE5MPaqcz4ej/aLhv25lYKIa0NCRSLKil
	V3qYIVTN1tdJEM3ro3sEsmD1IGqBTfMWnsVTIrJ/8Yx8RQpZm5rccrIb6RuttkmhNKjE4iYqTg0
	rydYlAKug4Ebz0RSXgX03q0vdlYgHuL8Rf2fsZ36Dx4nVg39sgzr5NNmLhyGcstbyrRWH06zU2F
	2lI4z5db+UKROzL4fjY+6cW0zah6oqxt+draX/8n6em/o2mWpNP7AJ5q+lQni7wfqM/Ayx5zB7a
	qaDkQfWerFsTXRLFsOMsxr0jhd/30PIfnegC0S1gbp8XpPEKEN1DdWplQeLHxYMy7tgKqBhALAw
	F5I3ZstAN
X-Received: by 2002:a05:6000:41d1:b0:48d:f4ea:49c9 with SMTP id ffacd0b85a97d-48e6e5196ffmr44933021f8f.54.1793893638733;
        Thu, 05 Nov 2026 07:47:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9899:e54b:a2f2:3695? ([2a01:e0a:106d:1080:9899:e54b:a2f2:3695])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea181085sm10757871f8f.1.2026.11.05.07.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:47:18 -0800 (PST)
Message-ID: <62271e1c-7a4d-4fe2-a68e-41066e7849af@linaro.org>
Date: Thu, 5 Nov 2026 16:47:17 +0100
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
Subject: Re: [PATCH] drm/meson: plane: add pixel blend mode property
To: Jose Nieto <jnieto.alaber@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261104155119.284708-1-jnieto.alaber@gmail.com>
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
In-Reply-To: <20261104155119.284708-1-jnieto.alaber@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 16:51, Jose Nieto wrote:
> The primary plane exposes ARGB8888, a format with alpha, but never set up
> the pixel blend mode property. This makes the DRM core warn at boot:
> 
>    [PLANE:...:meson_primary_plane] pixel format with alpha exposed but
>    blend mode not setup. Please fix.
> 
> Advertise PIXEL_NONE and COVERAGE and derive OSD_REPLACE_EN from the
> requested blend mode. Formats without alpha (e.g. XRGB8888) keep the
> previous opaque behaviour.
> 
> Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
> ---
>   drivers/gpu/drm/meson/meson_plane.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index cf8c90158fcf..115849a0b0c8 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -233,18 +233,13 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
>   		}
>   	}
>   
> -	switch (fb->format->format) {
> -	case DRM_FORMAT_XRGB8888:
> -	case DRM_FORMAT_XBGR8888:
> -		/* For XRGB, replace the pixel's alpha by 0xFF */
> +	if (!fb->format->has_alpha ||
> +	    new_state->pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
> +		/* Ignore the pixel's alpha */
>   		priv->viu.osd1_ctrl_stat2 |= OSD_REPLACE_EN;
> -		break;
> -	case DRM_FORMAT_ARGB8888:
> -	case DRM_FORMAT_ABGR8888:
> -		/* For ARGB, use the pixel's alpha */
> +	else
> +		/* Use the pixel's alpha */
>   		priv->viu.osd1_ctrl_stat2 &= ~OSD_REPLACE_EN;
> -		break;
> -	}
>   
>   	/* Default scaler parameters */
>   	vsc_bot_rcv_num = 0;
> @@ -536,6 +531,7 @@ int meson_plane_create(struct meson_drm *priv)
>   	struct drm_plane *plane;
>   	const uint64_t *format_modifiers = format_modifiers_default;
>   	int ret;
> +	unsigned int blend_modes = BIT(DRM_MODE_BLEND_PIXEL_NONE) | BIT(DRM_MODE_BLEND_COVERAGE);
>   
>   	meson_plane = devm_kzalloc(priv->drm->dev, sizeof(*meson_plane),
>   				   GFP_KERNEL);
> @@ -566,6 +562,10 @@ int meson_plane_create(struct meson_drm *priv)
>   	/* For now, OSD Primary plane is always on the front */
>   	drm_plane_create_zpos_immutable_property(plane, 1);
>   
> +	ret = drm_plane_create_blend_mode_property(plane, blend_modes);
> +	if (ret)
> +		return ret;
> +
>   	priv->primary_plane = plane;
>   
>   	return 0;

Sounds good, thanks !


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
