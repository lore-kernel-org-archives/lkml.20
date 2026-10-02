Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C124544C66C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933015; cv=none; b=dNZ5ZVfrVeIqMTku4W31/fxGk6TAQnIie8wBZSKiBxBKb58zaswjQ5dieUSKnAaL4RZKOzs32LiSq0vj9dviuu+2oGluokRU6Nk5ZjygXKoN9j8FDnYRJVozv8MczcX3c4Sbz8A8NXP6qYbI0EkOu5ZRd5TsICMrnkyBMLs3CgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933015; c=relaxed/simple;
	bh=zCRd6agWEG/52CFMUjeHuWFXDWmS0N7YyZXGVmbBjuQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jbf9PQgPL9Mn1oDTdTE7EH4jQEem09GCxh1rgW6koo8vU+8AFImTm4MEVHZrPad+Y+/j7MGALComYm8y19IQ6vHILYv1lidPwrhOM7TET99gtPEHo4F7+z5+X0ieHnVu/gWYAw5f6NH6g6E5PWQZu6dqZBnDg7zaSFMcIZkzcyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wYHXuqC8; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wYHXuqC8"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so15636795e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790933012; x=1791537812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KH+uJZ38NeAYqKlocKuGqs/9s/QvL8xhydhkHOyMLZ4=;
        b=wYHXuqC8AOacDM0YJdYRIC/JMKupZGcXhDmtsrQ5A7Da9L7QdlgwLdY9xyWMNqjyfY
         3V77WQmHngvjFeIgW4k/NPTgX2W9rEAa/G7yW2jXOWPu11yfdMewmMVoD9ORyiUzXjf6
         HHpCVQXhhjphZM3IhJ00qgcks6+l4/79K4rZBRthb/QNpgAX19k1FdxvnK6+VcAcTYx3
         1yqbN3qeb4oi1mod7QngxJ12HPZ9lJyVnOuISBvcjYQgDqNVHGaGgLB/LqkUTvXPwrqG
         Zci6DwtdRsJva6JR+Xav2mBFRimtq2maUZ3gwa7u4hAyAPhOuSb/b1TDJW31USrW95iR
         dmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933012; x=1791537812;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KH+uJZ38NeAYqKlocKuGqs/9s/QvL8xhydhkHOyMLZ4=;
        b=WEPRvErqn64jVxL3lqNKFOAem4N9c8JRfBWn3P+rgmq6EaM0NDSqgfr9d7icUGDnHw
         XUQgnGRUjJWcnsE2JOWluwjbSjnvUxka1aNmW6NCQdHYz5JC62A+ltPYVZjL65MnK9Gh
         lSuirmAcKSn0mvBxwaS3KS6QImQXPnstmrMppCtHrT5IAsbYzlXVw1pWOluHaHeMh15i
         lIhf2dpo5e67seoKDq8MBe0PIAp/Zameh1c/3VBZ7A9gS6eXwSN8vIhXEj/4QfoFsIru
         tk0dzMNCyl97zwvfWXdRLJ1rRPibokvJVSnBGus5t3l43nC9fpsyWh4zJ6ATExQRovwu
         HxeQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5GHfh1jNf6UB7cEYnlafEF3NSLToZPfnKmtpJ6Da7eao72EFT9X5gmYKjFUPGr9Jlj8OnaBbWyMWhq1U=@vger.kernel.org
X-Gm-Message-State: AFuF++n9cmqIR6J/eqPTJyru1wROD1dAT8Qpnyni/TeUXnTZETlbIS05
	KsqrrCTDEN0iKDaY7yA0mYRR8Pm6U8J+an4OT4BrrmtAais9G+fzu/aWY7A8s/MoDZY=
X-Gm-Gg: AYBFou17bpZdOwZYlct0R1Libf/xlzCUdn3TdtEFcJmPD0M54U5y3hsqwtkM+6nwkON
	yg2BFvb7/ZTnWCghIiFx1EAgNl3V0AG7F8hZ4ntzofCqNm2gGQjE/kgEX6wi3miM7MMrQSqdMnn
	o4pOixBrv8fFvr4OFJxvE2o2aoW+MAFL+6jtOn7PhaSjky8D1aL3y3R9jB0BWCo1Bj3FG+vTnOq
	ihpHEkXFICpFpv/jTxIvoKx5GRM3PArSxs+oaHUM88eUUHeqSwtQMXEdMLHRuE5jwdvYDMi+e2T
	rYcWD7jVSpJ9isqVhsNNrfsZJNMnaoT4/utPkCSHEcnxA+M/RgmzjypnTf3Ov823yJJbMVyexFf
	/dVKCWHfcAW4FYe61kEYEjzN/iLAKzP+Rf3NFRo5SjYEoRIJ/pXuePapdmdk/JlT5g6oJ0eAgiF
	G7oKJNJuFW2QfplDdHeTGtt+dbrCAf0TspHPmcnd5VYyDSFmdvREdlm6yMRedy/d6+inypoTxdM
	CkMetvwagvK8taOXNWhge2674BC23JaLH8zNQ1h1dMveEbm0/Lc/uOvxClKaw==
X-Received: by 2002:a05:600c:19cd:b0:4a0:22d5:21af with SMTP id 5b1f17b1804b1-4a027564f48mr41402045e9.15.1790933011804;
        Fri, 02 Oct 2026 02:23:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2f62:6d3:721b:8c9e? ([2a01:e0a:106d:1080:2f62:6d3:721b:8c9e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276fa954sm68526245e9.3.2026.10.02.02.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:23:31 -0700 (PDT)
Message-ID: <143f8d6b-7c11-4a63-9c9b-36758b3ef635@linaro.org>
Date: Fri, 2 Oct 2026 11:23:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the
 SPI NOR HOLD# and WP# pins
To: iav@iav.lv, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260930-hc4-spi-nor-v1-0-9a3351e2984e@iav.lv>
 <20260930-hc4-spi-nor-v1-1-9a3351e2984e@iav.lv>
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
In-Reply-To: <20260930-hc4-spi-nor-v1-1-9a3351e2984e@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/26 18:52, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The SPI NOR flash uses six lines, but nor_pins covers only four: data,
> clock and chip select. Nothing claims HOLD# (BOOT_3) and WP# (BOOT_7),
> so they keep the boot ROM setting. After a boot from SPI they are in
> the nor function and the flash works. After a boot from SD with the
> button under the board, they stay eMMC data lines pulled low, and
> spi-nor reports "unrecognized JEDEC id bytes: 00 00 00 00 00 00".
> 
> Mux them in a board-local group. nor_pins is shared with boards that
> use BOOT_0..7 for eMMC, and the HC4 has eMMC disabled.
> 
> Tested on ODROID-HC4: after a boot from SD past the SPI, the flash
> probes as a 16 MiB mtd0 and reads back correctly.
> 
> Fixes: 7178f340e929 ("arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4")
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index 3ece30a0a1ff..5ce76a1bfe02 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -124,9 +124,19 @@ &sd_emmc_c {
>   	status = "disabled";
>   };
>   
> +&periphs_pinctrl {
> +	hc4_nor_hold_wp_pins: nor-hold-wp {
> +		mux {
> +			groups = "nor_hold", "nor_wp";
> +			function = "nor";
> +			bias-disable;
> +		};
> +	};
> +};

Could you move this to meson-g12-common.dtsi instead ?

> +
>   &spifc {
>   	status = "okay";
> -	pinctrl-0 = <&nor_pins>;
> +	pinctrl-0 = <&nor_pins>, <&hc4_nor_hold_wp_pins>;
>   	pinctrl-names = "default";
>   
>   	flash@0 {
> 

Thanks,
Neil
