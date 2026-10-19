Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7024148489C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394951; cv=none; b=BdQDqK4M+WpRz3XRz4YHI1MHQZxxOn1k3Xex+8zCR7dJp3++TPd8BIlmRoDT7/BYZI1wpSthRy38KeGkIiCdWbdA5ROBh6UjAmo9jY1KG1i7AwvLXaNqlrdBKUsITo6wrrBPF9cwS1pyv9v6cdf1Bsb71IKiDXiU3BZFi44Rbpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394951; c=relaxed/simple;
	bh=sdFPBQUW0+7qu3i2UI/fkNQB/u3ppR1kyFa9mKz79xQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hjuH1eMKWn/K+9xBcC4vJNQKHYZ9PXowncPRJ97UFlFbGyaI7BFIKQCuJWg6yRGW0XfVDmsyMVquXQ8ERHffnvOkdZ1/P0Slp3Be09gCAb1cU+ZYRBaYifYBsMhTNTL0MHvE7ubCnXy7zDA9ItAJB/EsNojSO8cYLNCdcnaqAi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ktsf3uuR; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ktsf3uuR"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso1416355f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792394949; x=1792999749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTmZAXM73d5UutovYrMzHxjVi/hMLxPmTYLuwel/w7Q=;
        b=Ktsf3uuRYJVVd44h2NkBEdEn9j0jIbGaxsGzTB8Gj14wlMusgC/eTdPXLoky4SHBFU
         3Yeq8rAw15DWm0WkjjaXEY32xff5crETMp3LGjPgyDHNSCU3Mur1f6LFg83KUhj6Sj1+
         mZ8BPscfOkcu8ifY6uyXpJzRkCP07NgC5/e02TYK8iG5DLRG0uJXwO96J0s0y0FfaNIB
         ZbnzFSz5lDxfCSciKTcPeJ7ALPyiLD1oMBE/Rf+iIoOwWoOVhKMDC4x8tNTX2ZDW1bxr
         ns9+g9ikqU3beFaEvw1SUErCwogprh1SLSEBZTv3l+k2dwTS5i1qoR5F3AxZDc1x7E8l
         mJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394949; x=1792999749;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CTmZAXM73d5UutovYrMzHxjVi/hMLxPmTYLuwel/w7Q=;
        b=eUbT65AGPQ83Nt/BSA19KTDr4HyZ+GVABdL61oX1FvGkygeEHjKfBaU1whgSiO8CxH
         2GtoCvoESmIIawKqxqF4X4TI8GKhtKk0HQ7KyB9IYOxnCafzuhkcS723JSYrxKh/ARE0
         jvNUhUtMXbcDTdt8isqfWa3KJTBXd7a2GpetXgoHSmc8VnFvRj5tOBHn/56aWOvQkqCi
         pVqfR1cdC26SuL6LoErTuNP+UU0h7B1tANP7M3W9YREjWwxr/J4SxxPPLgY/kghZl/q7
         v5+N5wEvnEVOXU9pRnHx+1aUAwzyvU+D9DBXhVzfd7oglPAvvxHaNlDxzHopsgGXOPdq
         08HA==
X-Forwarded-Encrypted: i=1; AKwUvBwpHxT4fciosOMBBSlTQ95JhrWsJEf1UlGpKTiRZlvmhPd+OCvX+91Zyg1eh0lwJQEcFrC6znSvnl3cQW8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxSpGIi9YcKmVWGZQksGhqAcnqAsG/ESrFLdz5lu/k1fsAAOdO
	WubY6MKsM0TKizfp1EQCKlaeXxqMOaFTHFg3L+W3O5kwmlOqCZPSaM70ArP02BPDI3E=
X-Gm-Gg: AYBFou1SoLGzzC4/MIHcPTEec1BnIKYgzjXrgtvO1q5cdsaCK/fu1+fdg9wqDCFQQsf
	pm8fGJdGniTXKQNT7u0Sh4W0xeMKDxOVSCmzoLo/G73zrfDgzqAnOSHILd1K9ZetBBJBhRAWaG2
	71N2Q6eub1gFeH9IfhimKZyIrMmiObHF14QCGCUjBq5jpuZ2O6Kv215yGGQmApKPtJ86PqFSXfX
	8ZJey6moFOm2clKqK1o6VMAXFxAjyhBYgQQOtOCzWD0k1QEIcXsGe/RKIizKqUfpmQK/HDe6q7e
	zLCTLYjcTdK5cIEUM+GHN49H/z2nib/A5v+pTQKhUAFCjNd/yXTqGNnDoF7eX0ueRnAxveuGsUr
	e483QMRd0E8AMhjNVBqWUlKhzhReUcsZqYjVRBt57dkeYQ9elzjDpH55Fe11/+ZJKtqJRgoGnEC
	cDkMEfx/CwU3wDso6XfFbCyQa4/h3eEpfKarXAxmp054GXnlTGimaVE3oEqAqyVkeLKfKvw3S37
	wAT695jYBFZbu3RkIT0F6Xa4ZXysRBwRkysjlV5XfvicP4PpcDUsw==
X-Received: by 2002:a5d:414d:0:b0:487:219e:5e20 with SMTP id ffacd0b85a97d-48e07fa8ce2mr9406189f8f.51.1792394948485;
        Mon, 19 Oct 2026 00:29:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6674:33bf:38d6:bc10? ([2a01:e0a:106d:1080:6674:33bf:38d6:bc10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm21249024f8f.45.2026.10.19.00.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:29:08 -0700 (PDT)
Message-ID: <0b5c28f0-0a43-42b3-a07e-4ecf39b2380d@linaro.org>
Date: Mon, 19 Oct 2026 09:29:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: odroid-go-ultra: use the RK818 RTC
 as rtc0
To: Shigeaki Asai <y-asai.0816@docomonet.jp>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261017110743.3555391-1-y-asai.0816@docomonet.jp>
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
In-Reply-To: <20261017110743.3555391-1-y-asai.0816@docomonet.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/17/26 13:07, Shigeaki Asai wrote:
> The ODROID-GO Ultra has two PMICs with an RTC each, RK818 and RK817,
> and the SoC has the meson virtual RTC. Only vrtc has an alias, rtc0.
> 
> An RTC without an alias takes the lowest free number, and the RK817
> RTC registers early, so it usually becomes rtc0, the RTC the system
> time is set from at boot. The RK817 RTC seems to run without a 32kHz
> crystal on this board: it ran about 1.5% fast while the board was on
> and 14-17% slow while it was off. The RK818 RTC keeps time well:
> with it as rtc0, the clock was off by less than a second after the
> board was off, with no charger connected, for 12 hours 40 minutes.
> 
> Use the RK818 RTC as rtc0, and give the other two RTCs an alias as
> well, so that the numbering does not depend on probe order.
> 
> Fixes: 62e73f000696 ("arm64: dts: amlogic: add initial Odroid Go Ultra DTS")
> Assisted-by: claude-opus-5-5
> Signed-off-by: Shigeaki Asai <y-asai.0816@docomonet.jp>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> index 348baa4e6d84..86902f68d7d4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> @@ -18,7 +18,9 @@ / {
>   
>   	aliases {
>   		serial0 = &uart_AO;
> -		rtc0 = &vrtc;
> +		rtc0 = &rk818;
> +		rtc1 = &vrtc;
> +		rtc2 = &rk817;

The vrtc was used as rtc0 because it's the defaut wakeup rtc,
can the rk818 and rk817 wakeup the system when in system suspend ?

Neil

>   	};
>   
>   	adc-joystick-left {

