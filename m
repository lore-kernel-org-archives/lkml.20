Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF9E49BD7C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538236; cv=none; b=ei9T+nhmGoGttIxXE7VpYYzxSb71bZSsjIyMJ1P58U+CQqMCXBZDEVzOzLmR9UXWGwyNUiIfF1klc7zbInRzh/y4wLEkqTGY++LQqECuLv2+O2E6O0dv0a7OGpcL+FZiBvXDs1ou5gdiT/p8N6epsjzkyjAYuUjs08+zSk9hJ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538236; c=relaxed/simple;
	bh=0fZcDdjzml995T9oZE7SVaCVuqTaThJLBP842zH3xww=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IbyIuHd7RQnB+Co56LS7pSOLqRHtrT2lXcPYHC0bJPaMIZPnrCJHHt82bEpZhA3SHLw8faJ9tpv6u9LWIA/JzD6dvaru69StZOBTn9QwMdFbhcyZJgU/KjzK7T5LyKIIcdf8IEXKJfoO3+1locdRUDGmkTcO2QfAROCmBfp/+zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WT5YmW+C; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WT5YmW+C"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956869750eso23196865e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791538233; x=1792143033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySxG2l0k4bpp/Tb+8P52vg4ThV1MvpjerUMZY+o89W4=;
        b=WT5YmW+CZri0kY3T6LyvGNKYhdk4kRw0luCH+HrEDUL3TcZPuM34HBrW6iX0I+Oide
         JRys8xQCqUPdQJwT0w998GuJFLJHAX+WTEG4aNjjVxeFXJwwHb9ozoc5fRvTHpdQ/9Mk
         91EM40r0e3ShZy4FAiV32Ihl9k7aHOTZhOG08vmb4Tx9uU/5esQnBpBBf+2dFxeOGnLd
         gkkbuO7BfBLE0FOUP96+n7IrLT/Q7M7HlJdeHZ+z73M2ExX5ZPXjHSK0KUEnDO4+3TXZ
         A79XEpizubWC3sm0n4EkJcITztUww0ZWNBNIp2ytYLAQLSj4WGk+tVTcc9RAYT8IXiYp
         gIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791538233; x=1792143033;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ySxG2l0k4bpp/Tb+8P52vg4ThV1MvpjerUMZY+o89W4=;
        b=wHD0FRTomQgylUJHCjCUMmrWnbs5lj11XTKBQhS5LaPyVwS505Qej6UtCXsjorqSSs
         IwyUGktmEEuuVrNdAJT+QjJ7bXwbPoGxWatikA5uZxhmUybpUvYFSsevJw1tD+twviVP
         aVd6EztnbiH+fyGzVRpXBx0spYkYC0tuMELl6125bXSkS3YTozjx6RsdWY8HuNIZL0/D
         ldewCJYpD+gSELAqdE/6wrt1M/mEtKxRrv3yiKp+ZDRQ8CL8LCLlTYkzSM/kK7pSCaoY
         WpBAz8ek7Zhkyz+PeorcTomp9YIn1DGRTq+vqZqYy1kZ9OsqlOmMlmBtpkE2geJLx1LW
         wtpQ==
X-Forwarded-Encrypted: i=1; AKwUvBywGNcV3vgTjFnPsDEQb/4S5UTFYYPtJ357G3l7Y7+z6/Y2NLlq6qjdagDBHmMEXMYT4GZiGwBjPaNHIpQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mWwwcTdiDm4xdNl1jLC8TZ8hxnAMLGzdgDC0r6TIIxEujzlUX2
	UYwZGfimNdsCbdry19pAQlHHBdR2Gf4hJuXhXVazj77x2K+3yfH6s++5zKuNDOfPlKE=
X-Gm-Gg: AYBFou2c3BLLPqrkCbPKx3PlY17bNR4POD3IJjZrxwQ1M5pKAFGvwbHmfMkgAHaPy6c
	arm10B55WhhiQ8ptjim0f0n/8fsrVqfL7BDHpITmKl/zVK7pavVpuX7LNpEChvoZzHDj2jEDtpu
	K5fC0FmWS2kh5n0FdWwVTC25XjN89Ayqq796atqTaFXmh2NA6hNf/Yz+p/5eGyrULZ867fugw6A
	GLHv/tyc7AS0Y6/iLo0/dEwb6kb8mpd7Yo6rcUnF5dz0mCLZc+RfEPFlcKYoMDYzQqA4FSOgE0v
	DFL06K5ERJaO55IIRA6ZhW+RVfxNsMw5nxlTgi2t0t9yKLmgzx3Cy6YsSHguYclflFTQnN1G2cq
	donzHPd6sMmYaQ2uZ2jTMDQ0OVPTdqIAaTNz0OZhhpiv3iERQn7cEUrL6yBaOYEbBq1QD12gUHi
	62/PwyBH6xldUSK6oL4fxzjwPgXmONP5UgC2nuImqyGxYcvKt6tuYnHxsPXnk+RvDw0PpNW3GHz
	pgYeAqibHlUutXttZz+lGZrFGKbcWA=
X-Received: by 2002:a05:600c:46cf:b0:4a1:7e1f:21bc with SMTP id 5b1f17b1804b1-4a18e4d6636mr23240285e9.29.1791538233076;
        Fri, 09 Oct 2026 02:30:33 -0700 (PDT)
Received: from [192.168.151.76] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf35930sm43922135e9.13.2026.10.09.02.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 02:30:32 -0700 (PDT)
Message-ID: <6b9cdfd7-9f01-4ed9-a4d7-6b2949452b6c@linaro.org>
Date: Fri, 9 Oct 2026 11:30:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/4] drm/bridge: simple: add Chrontel CH7218A
To: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski
 <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
 dragon@radxa.com, Daniele Briguglio <hello@superkali.me>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-2-eda11e5dea8b@radxa.com>
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
In-Reply-To: <20261009-q8b-dts-v2-2-eda11e5dea8b@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 09:55, Xilin Wu wrote:
> The Chrontel CH7218A automatically boots its embedded firmware and
> operates without host-side configuration.
> 
> Add the CH7218A to the simple bridge driver and expose its output as an
> HDMI Type-A connector.
> 
> Tested-by: Daniele Briguglio <hello@superkali.me>
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>   drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index 3fba7002322e..fab793fb12b5 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -275,6 +275,11 @@ static const struct of_device_id simple_bridge_match[] = {
>   		.data = &(const struct simple_bridge_info) {
>   			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
>   		},
> +	}, {
> +		.compatible = "chrontel,ch7218a",
> +		.data = &(const struct simple_bridge_info) {
> +			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> +		},
>   	}, {
>   		.compatible = "mstar,tsumu88adt3-lf-1",
>   		.data = &(const struct simple_bridge_info) {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
