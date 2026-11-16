Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822938;
	b=RrsT3tckLRkqpd5lq+oB5TMd5HTbb5bMTBwFOcVvZAlXK6UDOMUwjf+vp0LWzGc8IXcX
	 YrAz3xlyH04YNR+3cj2rfHQ3R8y2MYZpX9b9QAmqKNKaacQM8n6FxM8/G+LHKwCQR63a/
	 TRw3wFL4hpzMT7xGJlQ7+cEHnXVahL8yY1MWvav7f6BGy6rDiOCElvXW+P97P3zrgao2d
	 a4CTecCxKfznngDG0Wg5fPzweThTLG3Rt4BTnHOD9ij3rou1g7Vc1AJKgD4C/quMmTo9b
	 WDNHnaSpwkP3RXwQhM32NvbvOamcry+saXZ4yYdt8cmjl749IGSXz+ME6R9CwNbocGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=4JH33ii/O1IYJlAZS2nMThk6S+BnMzG8A9OXw4THRRo=;
	b=HkDx+j20fKmhBxxxO9+jAohA7MLDjXNGfTMrgGj9pswkmZDEcGFUXQhazLhziX813r+Q
	 6GyLKOgDGPJfGN6NZ1ZhQHzxifrOLkPBeOdgoHWRmNL5SYoHXdZ+EIS7FoJo9x0ec90b7
	 s+Y188S9polGsubPkFmJJY0Lsd3eCoiaxPas+GsdhNi6uJYYiYp8gWNIf351cKm8Gt+oV
	 4S//XJiiFKH76KO35gut1ZEWZLSA2dgPhmdrcMeEE9L9wRMw1qidxQxhikKx7JHxS315b
	 0upaNcTBm7TRSfZhf0YmBIDKFD2hCdRFMFDgn9qIXPLZFGrnqA8i4dOUIiX+9D2HdJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mmnAXTMO;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E36606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28E36606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mmnAXTMO
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1623278f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794822936; x=1795427736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JH33ii/O1IYJlAZS2nMThk6S+BnMzG8A9OXw4THRRo=;
        b=mmnAXTMOBuaV1HOT4mxSu2WXbfTYSvZ47S63y0LCQlV6qnaVPxzK0XtAFgz+7ZT1GC
         4hADawLO0EYqLdy/Z4xSxpGHou7iPli+gS7ietKmZ9CLCfULGkIjhhdkskx4E69sKIgS
         hPAo4SxD3sI9YUm85RiAoHn2ehfJAWo2EOG5FlNbAKzoX72usezzoZ2ZU8lkk/IFvi+y
         lqCsY8yiekgy2amsK/jcW4u+nOfmFthNU4kOTtj6FL+fEs/vjZizjdZdUROF43hpYXli
         AAUwvZjtAlC1jv7aJCynha+gz2nmXuECNlwrcZzDkgxB49Sxa12DsW4artkTeiKCI3fO
         p6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822936; x=1795427736;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4JH33ii/O1IYJlAZS2nMThk6S+BnMzG8A9OXw4THRRo=;
        b=F12+UZ7QKSpWHb7299IvQif7ynNQz+8YTJqfobTv5KhnzuVgXU++dd0ILEHaX29Nd3
         qsNQ2/9K3PWDx7B3X8Tj9f6ow8tJfzph36UtPfHqBorYYM34nsZJ2EmeAoA9jVskC3ez
         olIZY5GyoJqrJChJH9ohG3ylJWqtRQRkCk3uwwKD+wYQOJ4tF0RWCAJHVjho8hkgFdJU
         LkP0VBgaKRjjht7nbLhOm5EnujKAlYmxWWHcUiVLn3ws3PuNU6w2t7YqccfbjkvVZf1X
         d2FXwq7S9mCyOPnF6vlUgdYU4WK3IYqrfGt8V5QTnkQt02Vjhecbn3YscDzmGs4Ytw82
         B/xg==
X-Forwarded-Encrypted: i=1; AL+hErERmmXLZiK3b/U1tTQ68v8D59+iG22IutrCRNUR6fK9LvQ4uRvuzekVVXGT955D+mbo3wA4K/aIL9NtbjY=@vger.kernel.org
X-Gm-Message-State: APuU4Z87P0CK86CrA5ENHoi7kXWGBa9m2Ka81SE+hRYkpwtzv5eO9i0g
	prIpbmc1WmVzVayV5XyfEy/vIIKOzWAoZnBhbCydOYHKftl3r3gYeTlE7w4P/zsAQySgNbLiHqZ
	olhuhcds=
X-Gm-Gg: AZFdTZflPN6K4JGi8TQiMIAfbK7SAME8G1g5imxcW6I4KRbBBwxZayFsMuUzF3zLpMt
	PA7kXeSsYjZHVtgTQRSUwPTFxXPJOYWbLWVnwkKw55aOPEe00BYOiF1Ozp+u/rSBQI1OJ+Z8Nbx
	rMSZox/0VDaU9/0qhV91evfkbd05DWCMZiN993YJTR56zWvmFJEk9vyC1QY/8wiWH7/NgIE+XUT
	9XSPxnL+teGjgxo0GNJeLiaIhNAYtqZ233D8duzvQjKc6VpETv9YAIfyVQ4mY3OUpAZ4p73lVBp
	k2wEpiK4QcFoOYykMLL3coY4/bcMn4qHDKLgP/YPEtUIN24OgHA3QC/3EOf1sEyFRyoKU9m/j00
	OjyKe6V2Oop/EcYO1ES+UfCUDWAiKBnZec+NBVXyKBoBIszzHG6L2F9DKpy52X2q/eQF8Gblcrw
	LAqjZqA4eNd3IX7Jg10dfek8aCtmdRe5baBC8NwYJpjkuMv8leJdE4XkkcMbXm9lWsRaABWLmmC
	zWtRZ/f6F5PjX5k2t/8UJBNl2WufLKKmTSpVaVNHQxbqQzOiA3tCPQqg+mTcge+ti+1lZjg5s3z
	4sLmP6TAJE35+FhTQm/algopg1NZTYmn7dxqmxzTy3O0K4JqyyVui+o3UJk2W2IXa0UMGs9nzWR
	VFr+OKEKC
X-Received: by 2002:a05:6000:26cf:b0:492:f6b7:f488 with SMTP id ffacd0b85a97d-49c6fc9dbf5mr23160002f8f.7.1794822936261;
        Mon, 16 Nov 2026 01:55:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm20884339f8f.12.2026.11.16.01.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:55:35 -0800 (PST)
Message-ID: <19786c13-d3fd-4258-a1d5-2a28a1dccc31@linaro.org>
Date: Mon, 16 Nov 2026 10:55:35 +0100
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
Subject: Re: [PATCH 0/7] arm64: dts: amlogic: Fix dtc warnings with W=1
To: linux-kernel-dev@aliel.fr, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
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
In-Reply-To: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 23:29, Ronald Claveau via B4 Relay wrote:
> Building the Amlogic device trees with W=1 CHECK_DTBS=y currently
> produces several dtc warnings, all related to the same pattern:
> 
>    Warning (unit_address_vs_reg): /soc/bus@.../pinctrl@XXXX: node has a
>    unit name, but no reg or ranges property
>    Warning (simple_bus_reg): /soc/bus@.../pinctrl@XXXX: missing or
>    empty reg/ranges property
> 
> The pinctrl nodes use an empty "ranges;" while having a unit address.
> 
> With this series applied, the Amlogic DTBs build without any warning
> with:
> 
>    make ARCH=arm64 W=1 CHECK_DTBS=y amlogic/
> 
> Boot tested on Khadas VIM1 (GXL) and Khadas VIM4 (T7)
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
> Ronald Claveau (7):
>        arm64: dts: amlogic: t7: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: a1: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: axg: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: g12: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: gxbb: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: gxl: Add ranges to periphs pinctrl node
>        arm64: dts: amlogic: s4: Add ranges to periphs pinctrl node
> 
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi       | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi         | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 5 +++--
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++----
>   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 5 +++--
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 5 +++--
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi         | 2 +-
>   7 files changed, 14 insertions(+), 13 deletions(-)
> ---
> base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
> change-id: 20261115-fix-amlogic-dt-warnings-7cba2a4eb9d4
> 
> Best regards,
> --
> Ronald Claveau <linux-kernel-dev@aliel.fr>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
