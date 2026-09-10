Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F538399361
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025037; cv=none; b=knPKRfSbNGoyHskEm/lymmFs0hKVIY3vsueahUc0nuZ5gizhHhYyT3yc1zZqMvNmZL44YpYOvGVp0IR3ceTDyK120F0NlmTtJFHxTpfrA8IqBYrUZhwX3sZgnSLSNOEUpjnh40vl0W5PBj0oPzIJGwiu4yBqQMTooda1YKCirHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025037; c=relaxed/simple;
	bh=iEhgmopqhaTLtPJ79uEkMj+Yzs2ch1VsCdFcaKmHXXs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MyZK1u4xHkbrrSrS6wj69Y6jGPu2u6jf7/cU/+E7s4jcBZRFvA+PZ59GJbTTaioXLmN6g/69oR7uCc9+D3bO74Lp9qRbVR0GJa34ihXOCkD3Y7SVoNgoZcVv+u0iIozDp2K8ckxjyG/3I4WiqBnvhyTAfEARJnZ5n1VT4ZuvQGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FNFjsszG; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FNFjsszG"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so888710f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789025031; x=1789629831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMpBVc24Sz11F3KFnL8+840MzJ31UofYHjzEvyoJR1s=;
        b=FNFjsszGofU1JSpZLvQSdXQkeJfVzsTbw6KK4Hkb8e80Q/FWyvqPiQWWBdb6UbbZ7Z
         fhoNFhtYHvnU+MQNEEoNwUJbsBe5LXbi62ZayqGAH0Nyj3mp5TAVVgz+pWX+f4KYpq9R
         gl2LvEbkKy0Spy81lNAWAooO1IcWqUbmBT3dzsALx4gy7dTzL0X+SdFxYSnhmaEyu8Sp
         OukpeMSVYDo7vuTWY947LllJVN9pt7pS/cIZYP0XYOdVu3ePqTwWQN+XZ2GrSM9vxPC3
         vXPXrQbwv1c+aJLEyUuknfKRUuhqQppJ17uLqKHzSciUEn2VedK4e/pKBoe/+N5cCVNY
         QgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025031; x=1789629831;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wMpBVc24Sz11F3KFnL8+840MzJ31UofYHjzEvyoJR1s=;
        b=P1nlZw9qchBDXT1NkafAqEFtwJsqtQaJRAAucMiZ01v+U0tHRqavNhfwbJSZh7exYf
         QC2HcxI/E+KjGnOHzTf3vLvFT/G6TaUCWPlBdelOiDpc/0shAiTXCc7ApKC5B0n6NWFN
         q1bu/SfHn2IwoMohADFhuqiW4YVLTCNs82sG+LrJS3Tgik+l0ADr9c9jL4lLGK63+205
         xB1ySG9/JJtuieycpQKIlQXEyL/gN8/uPSRatWBVraNn14Pd42io+8WB8kwyUXp8ekwX
         B22AWVSszedDo6hQputJvxEdHr9OklmGy8e6n4LbaR9NonvAD+XvUvJOQ+017fUFB6pS
         fN+g==
X-Forwarded-Encrypted: i=1; AKwUvBxLqmAQWVYVzoiTIkI8NKSR0CVGrNuHZKs2PMzV1LT+jJhPpnQVKtHea0kDmp0avGrbJ8oaDtrEO4+rkBE=@vger.kernel.org
X-Gm-Message-State: AFuF++mZB8E4dx15ln+BXzgpcfIIGRMpSn3lRD7CaXIEjaCwB1hRkREH
	uv+43xRCtcys86+a25dNZz0lmI51GI6cJvul379R9yFyGi7gfAFbMAZIKxIgKWW1gg4=
X-Gm-Gg: AYBFou22eHEfJg3ymSVLfo29DuProLH/aCPpi1Bk8F0YstlO979ayQ6b8574jr93m1+
	n+8L+xrQUWnIIFGnnpAiEQimYYiFe2buQwCNM64/6DLXGS/LqEFUL4KVXEcIDDVBWnpPmro9Pn9
	Uswym2Riloo3H1skI4FkI9z19BBseNQ8k1sjp80R0IA0xIRaczC2ZaufWfwKUMcNTvS0rfLEVHb
	xlJYMNpdGBhaRlj44ZEDtvQHr6X1H0WmzY6r6RUe0kpQxZFDeDZQ7iZK+odnssJnu5nCqiJBOZR
	5lKcEV1R/NmDM53UKX0Xtz9+KCQF7mrw0QXEV5dwz3wnScKxGMK9LugrxcNfi3SqEjDsnQSADpe
	loMKevh7UGunMYdJEHwDuv7C1y2AQhJRAKD9oNruJY3F7ngWp+2zAPRmHdkeE2iXIsPqtsR9FzU
	WknR6N6d2Hp/pY/1w+vEoqWAvR2M1UBU026ortzG//FhKjPgozhxfPMBbAPLFeFDX3OdFcZxjwt
	WaXX9l7EvqmS04He15BUkyDUXO/k4vFgKqxEkxF3YFBymKPyDoup7UyasWMJcW5
X-Received: by 2002:a05:6000:2dc5:b0:485:afd8:3e42 with SMTP id ffacd0b85a97d-485c23ec07cmr11470084f8f.22.1789025030483;
        Thu, 10 Sep 2026 00:23:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3caf:d840:c911:29a9? ([2a01:e0a:106d:1080:3caf:d840:c911:29a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm51488978f8f.30.2026.09.10.00.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:23:41 -0700 (PDT)
Message-ID: <ca31e73c-09be-43fe-8904-8a813152c3ca@linaro.org>
Date: Thu, 10 Sep 2026 09:23:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: fix device_node leak in
 meson_encoder_dsi_probe()
To: mileskrause5200@gmail.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolas Belin <nbelin@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260906-meson-dsi-of-node-leak-v1-1-9d183560279d@gmail.com>
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
In-Reply-To: <20260906-meson-dsi-of-node-leak-v1-1-9d183560279d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/26 21:43, Miles Krause via B4 Relay wrote:
> From: Miles Krause <mileskrause5200@gmail.com>
> 
> meson_encoder_dsi_probe() looks up the DSI transceiver's device node
> with of_graph_get_remote_node() and hands it to
> of_drm_find_and_get_bridge(), but never drops the reference that the
> lookup returned.
> 
> of_graph_get_remote_node() returns the node with its refcount
> incremented, and of_drm_find_and_get_bridge() takes its own reference
> on the bridge it finds, so 'remote' is leaked on every path once the
> lookup succeeds: on the -EPROBE_DEFER return taken when no bridge is
> found, and on a fully successful probe alike.
> 
> The two sibling encoders in this driver already handle this correctly.
> meson_encoder_cvbs_probe() calls of_node_put(remote) immediately after
> of_drm_find_and_get_bridge(), and meson_encoder_hdmi_probe() releases
> the node both on its error path and after of_find_device_by_node().
> 
> Release the reference in the same place meson_encoder_cvbs_probe()
> does, which covers both the error and the success path.
> 
> Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
> Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
> ---
>   drivers/gpu/drm/meson/meson_encoder_dsi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> index 3e422b612f74..3fe604496294 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> @@ -120,6 +120,7 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
>   	}
>   
>   	meson_encoder_dsi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
> +	of_node_put(remote);
>   	if (!meson_encoder_dsi->bridge.next_bridge)
>   		return dev_err_probe(priv->dev, -EPROBE_DEFER,
>   				     "Failed to find DSI transceiver bridge\n");
> 
> ---
> base-commit: 88405f0ad1d5c680afe3ea0ce9345fa9e1deaac8
> change-id: 20260906-meson-dsi-of-node-leak-744899da5712
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
