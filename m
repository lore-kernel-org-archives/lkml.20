Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5413FA5E9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820818; cv=none; b=qQIpie6AlzKtxlfwS5Sv/yGi7j2KLfVUNCQKhkc0PWDE7+AGGosL3WuCvvWQl+U3md+aJcC6RfyBNGCukPCkjDZ/WnjEF5Wa7SzvDq9lI7zjvnFB0MhsvGc9Nsn1D7THlgGqFdOowhdgXAySy7hWDrCL4FFTCS90/6gcW89ayxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820818; c=relaxed/simple;
	bh=BAcGYvYV/uBiwDPiuVU9hgzFkX8RoGTT8P3hAyNGdUA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bbed0D//FAizwtDGI9vv1XswmcIG/3URTS270BAKHOkWT5ewflT0iPjEG5aPoEenCxflRE3iiiNg7Op9lhDKHp0OgMwGFUNuX/22W6KdXbja74q8iZC23VuQJazMIlMiiu9v8ubrdho4JtMDzCMTPgOYcZ7X6W/S2X8T40dcewA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a+sI/G0j; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a+sI/G0j"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e5733a5aso859497f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787820815; x=1788425615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ksaYL/zucytvEfLPsKZt0AQxFIOQbkrkL74ZbSWk0E=;
        b=a+sI/G0jYsfexsrYyXGZNpC9azommrr8mNn41UVv3/cX9K5MZSAikETgJOoDvfsnx2
         iOFmkduzUKMlrIHtlx/V6j7T2SjeNU8AGC8Zj/n/yJNOQlSIWwS45XFkNuKbSkqmZvAZ
         mec31aCOqTA1GzVU85kWvPFhfbY5RcDw3L8sL3qwxLu4LYySfW/Ckyfus5fnVy36dX9y
         NdzlTwUPbtxfxJKh4gSaFawNpF2X73MTX/5sLb7lArLXnCxHsxjPn02cXwFVdGZIaI/w
         RdGS0J/2rA1XX8xNZ5DCeQ1TucXyJeKo8/Zq9BhMTZ/PNxYndJQe1m8GFqf02H5cgrld
         vePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820815; x=1788425615;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ksaYL/zucytvEfLPsKZt0AQxFIOQbkrkL74ZbSWk0E=;
        b=cWVBJl30rg01iRrjgy6eITSCiE5TNNLQkPa4RYlDs/8AM9FuIMJitX/rNzYw/CY1li
         mi3cIY8BQfyRwULxqhpjcw3C/AJKua4Xswxq48ZuA3sEGAfHcGWk/oEHaZedLETMiG3a
         qp18ht1m3teL0qShWXqeYzKu2x/F7o/aarmmKgWR0lD1Dxxmi56x4RID2vaGOLB4GUoB
         jXi6jgVYwlZH8JoINbY57Nc+435PlyveV2oB3RM1hXFfXGejrRQxvdsePN8cnswtbO00
         NJxB9Fkf/HQU9A2cKOhOehR1otQRtjBDxLAaCp1guZFq8uL7c6cAGbXrIdSe1jN2ej5r
         +4Qw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8GOKVvffVTI9giPQKDP8obzIzTcW3JgTKFL11dFVvjuolB6x5ukkZELoM7QbIb5+HwjVIUtagAS8giG0=@vger.kernel.org
X-Gm-Message-State: AFuF++mzxTXaRwG9UD61kkF+kE3SgzO4Mgkl2OPLOrBmNtYRIxrD5+L7
	TvEMvaElP7HTxNaRI7oRxhlQk+QXsDPZPJFIn5k6qcidGqUIr3E8LZ7k2U7uePhrLtc=
X-Gm-Gg: AR+sD11kg+pIpqF6HdDbxuflW9UF8cGc+c+i4qEd+2r16DpxC/axk0LNVwn/bkwSyNj
	pTyzbjusd8lQ3UzQ6pI5WC4UuULD8cUjQpvMn9jFI5X1Us7ldI5vaNCVNrfNVcScFrkprGBZKt8
	iI3V39nJg5d0hv/Ajueds7MLmJpuc5ebQJXxpRYjP1x7CjrAj9fllPVf+qheVbtsL8C/xtBQr3Z
	JzK18h349DqsSqIP1LYi8JtM4Z9iWAbClHkIdYzCHMqIktdTRPwezF9HPQcexwKbd1rQ6RC3uJi
	tQt0JGHxO+VjzKSaElx9k3Y2vo5YgG19B8tf4KJamB5KHh39Crki8wxACpnEjVsZWMGeE8XY6L4
	8GfMLkvIX9uzUbPmbSw/bw533jU2BkmVA3iPnY+p8Yt7t4GUwsSXB1aS6e7Vo0aws9SASEVUN8O
	LtuAJb64T6SABjMwQ5bIQJ7aylcZ0SK2lomNVM7Bs8T4pD4M4k7gGfP1ceiYB+TwcF2ojP
X-Received: by 2002:a05:6000:29ce:b0:47f:8ac0:282 with SMTP id ffacd0b85a97d-482e26c3ff0mr12975216f8f.17.1787820814796;
        Thu, 27 Aug 2026 01:53:34 -0700 (PDT)
Received: from [172.20.10.4] ([37.165.68.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27a9f0esm8105572f8f.10.2026.08.27.01.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:53:34 -0700 (PDT)
Message-ID: <80dd837c-9dd5-4b7e-9abb-02bb59d45da5@linaro.org>
Date: Thu, 27 Aug 2026 10:51:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: amlogic: t7: khadas-vim4: allow the SD
 card to be power cycled
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260823115335.102219-1-tanure@linux.com>
 <20260823115335.102219-3-tanure@linux.com>
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
In-Reply-To: <20260823115335.102219-3-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/23/26 13:53, Lucas Tanure wrote:
> SD cards start at 3.3V and switch to 1.8V to reach UHS-I speeds. Some
> cards refuse that switch, and the SD specification says the only way
> to recover is to power the card off and start again.
> 
> SD_3V3 is marked regulator-always-on, so the supply never goes off,
> the card stays stuck half way through the switch, and the MMC core
> retries forever:
> 
>    mmc1: error -95 whilst initialising SD card
> 
> Drop regulator-always-on. regulator-boot-on still turns the supply on
> at boot, and a card that refuses the switch now falls back to high
> speed instead of failing to initialise.
> 
> Fixes: 8c45bf9ae4ef ("arm64: dts: amlogic: t7: khadas-vim4: Add power regulators")
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> Assisted-by: Claude:claude-fable-5
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 75d81ad6830d..c94afaaf8826 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -71,7 +71,6 @@ sd_3v3: regulator-sdcard-3v3 {
>   		vin-supply = <&vddao_3v3>;
>   		gpio = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
>   		regulator-boot-on;
> -		regulator-always-on;
>   	};
>   
>   	sdio_pwrseq: sdio-pwrseq {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
