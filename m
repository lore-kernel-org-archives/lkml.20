Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485525;
	b=lXfOvMsNi9nwkrs90/wYX1GSZdhPBQVa9UhRngvt2NdyVl04pD+3a0LDU3CTScPGcomH
	 6IAn/SN+pc/HGlgZA/sIQ+ohDbaIheAB3GE6zz23zWBXNjw69WI8GlhgY/a+fhGMGEzpi
	 jChOmRisjgOOy04IftPNcg2SsXfEnM8WcaXuk2rp1tiwc2bXgOGr2VyDg9GylFWCayvAR
	 KOGuSFnvWubiS3/pfyBtJELWPFlmBY2BaN8q9L1TlXSDj/dmvaEUM/jOuAl3Son2h0jaZ
	 te/jVhfpqCldt4cjXzuRzt4tX3zYth2sIeVu6AxfkQjUUf/Ou9or/QndgNktQQE1JOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=hogL549jM3ExbqUca/Ckmvahf2uy1aT58g4/4SYGND4=;
	b=r64+P7nKU+kEiUMKWK5y4Bjn0ywjBuELfmK2g8t1ULx+oUoVU1KlBPg4iZVyjShW0XAP
	 80jEU+VxQWrEg5P3aMBXG7UaJ7dy9N9779ftm5g8S+2zRVnF5cOxfbYEqG3Cg0MqH75nb
	 XrWarRalvEZyRv7YpjLhl3hCtMLx7S+i0GccJQ7iaBjvo6l/lTHwYIl2THHtfpvL4ppjZ
	 F1TazoK1BhYBXRNBU7QB1R2PzRi1QfkbbT94EVlY3x8zKsPm5iEC9BLD42XtGibTbqP3Y
	 2I6F8/S8mT5LMjN3BfYS5sR+7YQNNNgD/uh3ZmRwJHU0UMZP2vUds/61dFCkgnHjfgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xlBYgdEl;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA9F606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BA9F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xlBYgdEl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so14688295e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792485523; x=1793090323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hogL549jM3ExbqUca/Ckmvahf2uy1aT58g4/4SYGND4=;
        b=xlBYgdElvsfRXrajPPDKw8ho4L4t/qUulBARMacoY202Xep50AIKTQZfnoFA9tFwBn
         qglQrZ0O9veXrheQg4PMZO8S7Xv9paZW5avbg3+y664JSKciEOEe9JveNBY2MtlOhn4I
         qVaF7XSH1BW9WTfkpRyZ59fvlpttc3V0vjoW6ypWEOLEecmXsUXaFl0uiYyw/XhPeDPd
         AiJmvQsFqyBLNxuzrKgBIbaXSn+tPiLDzcOaiye7xKzj4nDYjg0vENDXxfifJ0lsLy/h
         hhEquvdzuvvV94X34Xd3bydCN7+Y8fH/b4rOPW2+NHqA53f9gyLFVFqOuZLrZd4y3CFe
         71pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485523; x=1793090323;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hogL549jM3ExbqUca/Ckmvahf2uy1aT58g4/4SYGND4=;
        b=fO5RafxyUnLC+l04/do5G6c12+j9RTv1xIMLleHvZejqf7ZBiiqSeoXTgvl89/7KS7
         FfdgsBCAxibgngKKCcODD2OXmMD5TE2dSHsrwENI9+F/dgEJLCz/aPY2OE/mx/Ofy4ZY
         A5A0PCz3Lr6H/bJxlm+o00bvcARSQ5mPLoAKkgkXjJ2GfFpZJo3bmSbyIdlwaJBZ9P3l
         qP/TER9ij1Ru0zE4TC2UydthFTAw4XqS8q7WbX2gWTV5C1YzbZE8/2iH0nx6KZwY29Xt
         4XVmDkI3KLW6jF8x+1jk4e59rqVSLL/+rwbnrzTAz+plZD68xIpSoX1Bru4xnTBOAlHc
         LYHA==
X-Forwarded-Encrypted: i=1; AKwUvBwHayD2ZBTD6HttBVHj9XgiVCVAC9vvI2mQwIxLaxu7F95D1+ehU6YsUJi+cFIryVR3OYUKCmeZzA92rbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJm6czC5rzyPbxrAPPpavabX3hD+HnS9B7ymMhRbkJs2IpGdUQg
	ZUpvRM2WSSy8H5CEGoPz2iTRilNGWKy2gfhjy9DtQFWgzTdSRH/Hx2hy5Axu6iGQMKo=
X-Gm-Gg: AYBFou2ksejSAMsn11PStkB8FA/FEvp1AQKZrB9WU/76GXx8eTagsp8LyVBmUrK09rv
	r6UjGVFdhDPyA0Sn2gVA7jzt7HIghpt29Ob0VUtKTS+OzaEvfdtNbBwH0dXOBDkZxaZLzKBh5Cb
	zIgppeTXkaoPBR/xK25+kzZyNaKd7j8z4vzFrl45/7bduez3IQSxVy/nejD+z8BrLr9nLAix8DW
	3N1JBkQziFAHGeTi8SaFdF+YkXynycgKzDBtHdG1T0nOjryTBXJd+b5i8BuGB9B133Y4U8DgXjw
	Euwhi4PP0Fu0BofgkhViP9FedDLpFoXI+OxxhA9vmrxW+5+IXDVv8LuihjohK+RCgoBH18mjNwM
	rMIBEnzl0NZdWp96E9OtekgyYSkq45WSotYA4SVrB7TRcfGngpoL6GfuFtgl7pzR654zqdltsXU
	98QdScLF1jpnrUswBGr0hP0JRdHSQT5OSQPb2KuriTvdTwLx96rELeEuLvf/VZhaXpeaFeAubz4
	nBm6x2FLDvxzIj17WSIvRNi0TQ5bGJ91pcpF02/URz2rhXMNcsf+g==
X-Received: by 2002:a05:600c:46cf:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4a1f8cb7ecemr12546735e9.24.1792485522235;
        Tue, 20 Oct 2026 01:38:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e3a1:1a65:a394:be54? ([2a01:e0a:106d:1080:e3a1:1a65:a394:be54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df370381sm163461605e9.1.2026.10.20.01.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:38:41 -0700 (PDT)
Message-ID: <7ccd519c-9c45-4a3c-a0d4-2a082c4c0306@linaro.org>
Date: Tue, 20 Oct 2026 10:38:41 +0200
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
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid-hc4: wire the RTC
 alarm interrupt
To: iav@iav.lv, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261019-hc4-rtc-alarm-irq-v1-1-078fc79e596f@iav.lv>
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
In-Reply-To: <20261019-hc4-rtc-alarm-irq-v1-1-078fc79e596f@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 23:52, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The PCF8563 on the OLED/RTC add-on board drives its interrupt output
> to GPIOX_5, pin 4 of the P1 header, but the rtc node does not describe
> it. The alarm interrupt is therefore never delivered and cannot wake
> the board.
> 
> Describe the line as a level-low interrupt of the GPIO interrupt
> controller.
> 
> Tested on ODROID-HC4: the alarm interrupt fires and wakes the board
> from s2idle.
> 
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> This needs commit 5831f5fef100 ("rtc: pcf8563: pass the driver data to
> the alarm interrupt handler") in the rtc tree: without it the first
> alarm oopses. Waking from s2idle also needs commit 5b6e2a46b80d
> ("irqchip/meson-gpio: Allow the GPIO interrupts to wake the system")
> in tip irq/drivers.
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index 5f15c2299509..25a8a60e152c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -105,6 +105,8 @@ rtc: rtc@51 {
>   		status = "okay";
>   		compatible = "nxp,pcf8563";
>   		reg = <0x51>;
> +		interrupt-parent = <&gpio_intc>;
> +		interrupts = <IRQID_GPIOX_5 IRQ_TYPE_LEVEL_LOW>;
>   		wakeup-source;
>   	};
>   };
> 
> ---
> base-commit: b44e2be772f866985cafdf90355285069ea68495
> change-id: 20261020-hc4-rtc-alarm-irq-b2b8c68d54f5
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
