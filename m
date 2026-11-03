Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696022;
	b=3pEY9JGT445/Z4c+Y46GCt6ZPZ+cKDJrV/3rOSHo9v+7a4bBsvwHeCVjk7WqdBHAb6HJ
	 jC96tZZgD3yzUEQ0RfFIsjIh/pjz695XDl0R256pbnnr6DX7BmsT4+udk1vrYzsaHVnrj
	 8QgHonU6ZZ3Iw0RIXQBUxHI5PGbGalmMTBizAhOSMSiokNiwJpp7+DOqEB7Oxw13KNjQK
	 jNQ73IGez0qt+WGXvdPI2gv9IOFCK5aEt/A/ErX44olCle/W3cHibxwGNd2Silz9q/KEx
	 EoWX0l/30F8MnOZbcediUG0HB4YC3Mjimyclp9H4ss26tSNt47DfmiSHX7XzadFGkrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=cYVEhmFXBYWgKUnLGpmzVsxJ6ulxA2Owk59YswCIlXg=;
	b=iTtIoOTcJ29wE5RdbwFaiD4B9eaaLikcY6zPoZ7xcfmk7aDSQxLE7GRCmeB40x1BewAy
	 ndqIrNwQPy8HsP0f/gsOrxCYlavJ33gh1OzcMX7pig+Q7FwgymkAJJUbrrZXLDXCrwPIw
	 RMU7u2HlgF/wp9FfuKYD2oguMuoOoZyTltaVGLSAaHplofEaS+Finwz+jB+eVomOPUV1e
	 Jqlt6hDzZ2rLgdG3+A56PTiF0IXz2eKvQECFd8rs5MIXhR79hzikDbqm3j1Qtdc4tMwb/
	 l7KQ+twiGdkRJotOakV0nvRvwdwLCCjK2Vb9ZCQvaL/i6q4WqjSEknmmypm4XVhg0GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LmcrwUS9;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF45606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EF45606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LmcrwUS9
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so5370715e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793696020; x=1794300820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYVEhmFXBYWgKUnLGpmzVsxJ6ulxA2Owk59YswCIlXg=;
        b=LmcrwUS9/1cu1tozsQPjqLJp6CthGNXRle53fDkzSFEZWAEAl5surhpdZJFI0/RUV+
         np9Heklw+O8lXZXJQQzRDOTus09Pp293/kB+yQR3AppJrQdrNZy4504Yd7N/7PUCMnrv
         0GWOdJIgqrN5zJOp+3sy+FUTKPRmtZMNOsryYQcTn9AYaAqBJ9y/913OCAKeCEtLy6jR
         1wUcwwhCwHo6TN+K+8NMQf01kxfqZpoI7kVWTbILaePIcnyvAZ7+5GavNKriGWZ5Z/ZG
         HEnMN91m++0UuOwrnuI+ub+f1clB/VFgKu3R2qMabmR7pf9mYduTURaw9r12Fb3JmNWb
         FwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696020; x=1794300820;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYVEhmFXBYWgKUnLGpmzVsxJ6ulxA2Owk59YswCIlXg=;
        b=FEmhq8rQgTLdR+3TQRjHL4kKE1Ty6g8Ih7qKXMvauhevxaDONcQCGuwGE6fh6hpnya
         V55BBRUGCoER5DWECGHZVzg12K+UC1Uq+tsh/B/5eAyifXPgJn5cmFbGp5+JywI8aI4j
         x/UDUwyaV0JgXAulESsFInA2dXlA9GkYVktetIZTKJBGualgSKIM1uMqVSO61lcI/ztH
         xXvEG6IBn7kDpVHHR3SZVGXULvy/qoFjaxYfg66Mpcm96cJwAXY8bnlcyOqqChkGHL4+
         wuhw7gfYmA8vvuz+1iWPtEBz0XOhPsqCTlu4DaeJEmwPqi8k2NK4Uaokl6/VLFhx/cb9
         4+wg==
X-Forwarded-Encrypted: i=1; AKwUvBxcWO5e0rCupTIdmD5DxlJM4TjsQUsMNmdVWSM1ly6nGWYYGlGbmhLx9Lb081MmDHS91+6e3umD6J4E9B8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LeyhIiCeH4nSfvqQ741k44b9UMg/GpaI+am5DXkhJXR0Ti9F5
	JjK+qK2udLK2cLTbMd9lSYVUleg0mDzHS2Uoib/Ezg8plzfDI7zRkFhnBDH2k0bfYWY=
X-Gm-Gg: AYBFou3+z/J2G9I03HNhNqSQQ0zc49YDl/TvbtM8eWG13cACNGtQCbrbmwdVn531xjQ
	pBwd57ilBs4lFwy+u+9Z6/Zfb07LOuGBoHzBFSw0DGCk5iJyD1qU+DZ0d3gnXstN2b/c9TSqw1u
	VzMnkZblUBc+L9hkgsx4+kbAd4LagohYBKPmIFycIoE33aAIhNdCfKlPlQkV7+7JCl0mzSBqZ9F
	X9svf6RYC6hBj+tkt4qRfG97bZhoDiSzfhvKDftGkBdqotNz4lCHT6UJedAGumIggIw9aSXBHq1
	xQxZULIvJNhnszJw7ixy/EcKgdWDvWTyMqruPpxaRZ7aOAJuO7c5cfLs+Yn1LU0HcWCfO8RKXYX
	aJQttwLhrcxtaGZJcOlNGhv8WbXWCRe7wD7afw5vEuLvabvSaIpvuwh6b5Nfub7TUvBR5nLTxTi
	nzgWC078x1XD74qZaSv6id+lmppYuIGRZIuBiL9t2Y7B058awAfKxe8vQ5iSvnwShZ1yBiLNW/h
	U+ve+M3qozTfRz3E7h37SLwaSMXlyHAWaiErDQw8bRLyUh0vsILOgtUp7aAI7YRlLKuM4VXkptH
	p1PDewxpEawXBO3u1sQ/GCyeb3l3u26yivyhuwW820iwg7rmEoeYFMJ0nazIweedEOY74a8jtFN
	2rvz2YHBIAMmV1suvtmx3iPwRS1yU
X-Received: by 2002:a05:600c:2541:b0:4a5:9224:fa10 with SMTP id 5b1f17b1804b1-4aa8b060adcmr301144395e9.18.1793696020400;
        Tue, 03 Nov 2026 00:53:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:95a2:4869:9f46:45f0? ([2a01:e0a:106d:1080:95a2:4869:9f46:45f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728ddsm23606102f8f.9.2026.11.03.00.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:53:40 -0800 (PST)
Message-ID: <2fdcea84-8b95-4ec1-af62-07e1803cb418@linaro.org>
Date: Tue, 3 Nov 2026 09:53:39 +0100
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
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH re-send] drm/meson: add support for higher bandwidth HDMI
 DTDs
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
References: <20261102212843.1213021-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20261102212843.1213021-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 22:28, Martin Blumenstingl wrote:
> There's a report from a user with a DELL U3415W monitor and a Khadas
> VIM3 stating that 3440x1440@50Hz works but 3440x1440@60Hz doesn't.
> edid-decode Detailed Timing Descriptor (DTD) extract of that mode:
>    DTD 1:  3440x1440   59.972616 Hz  43:18    88.819 kHz    319.750000 MHz
>                 Hfront   80 Hsync  32 Hback   48 Hpol P
>                 Vfront   28 Vsync  10 Vback    3 Vpol N
> 
> Those high clock rates are currently not supported by the meson_vclk
> code as it limits the PLL OD (output divider) to a minimum of 2. The
> formula to calculate the clock internally is (ignoring fractional
> dividers):
>    319.750MHz * 10 * od = 24MHz * m
> 
> With od = 2 this results in m = 266, which is outside the supported
> range of the PLL on G12A SoCs (the driver limits m to 106..247).
> Using od = 2 results in m = 133, which is supported.
> 
> Allow the driver to pick OD = 1 to gain support for modes such as
> 3440x1440@60Hz.
> 
> Link: https://forum.khadas.com/t/can-not-set-display-resolution-to-3440x1440-for-dell-monitor/26271/12
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Re-send of [0] which seems to have slipped through.
> 
> 
> [0] https://lore.kernel.org/linux-amlogic/20260109204836.790096-1-martin.blumenstingl@googlemail.com/
> 
> 
>   drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index dfe0c28a0f05..c0be0b7655bf 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -700,8 +700,8 @@ static bool meson_hdmi_pll_find_params(struct meson_drm *priv,
>   				       unsigned int *frac,
>   				       unsigned int *od)
>   {
> -	/* Cycle from /16 to /2 */
> -	for (*od = 16 ; *od > 1 ; *od >>= 1) {
> +	/* Cycle from /16 to /1 */
> +	for (*od = 16 ; *od > 0 ; *od >>= 1) {
>   		*m = meson_hdmi_pll_get_m(priv, freq * *od);
>   		if (!*m)
>   			continue;
> @@ -750,7 +750,7 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
>   		/* OD2 goes to the PHY, and needs to be *10, so keep OD3=1 */
>   		od3 = 1;
>   		if (od < 4) {
> -			od1 = 2;
> +			od1 = od;
>   			od2 = 1;
>   		} else {
>   			od2 = od / 4;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
