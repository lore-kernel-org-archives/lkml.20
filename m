Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206033B42DD
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 15:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791127725; cv=none; b=sWGO/Co7YxKz1cDl0Nhr3aUAwWBAk4hENlIUuU7gJIq6iVJhM1hWgSXRXlqdKunJXZpYE4+EtrI0nN5a58CHuOF0mUdeiKqJAZtskpxKqTL0HLS8ShAirQra76zjXjfZe7BmCdHxlnWBfexDeTgNguxPwLd7o0P0ejyxNMcPBw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791127725; c=relaxed/simple;
	bh=bAbuzrhxzxKziDCqa8JoYkrRD1FsUq1P0pQ8nvCKJ7c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=T2aPUHbV8qxeiagfY9qx9Puwe3U515lLuayhUnPcQLLN8/sG3qzEdDKuDoc9l8+OAriH7TWeAt4nuk9snYBtE8FoedyYmRiuIky09QxG9g9m8XHOeEUG7FaPf3beBticapVhgyrPw3s16uXOY8y4VD/MrUGdsyvxdPARKHAN17E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wHLu3uL0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHLu3uL0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a01ff8c098so6833825e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 08:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791127722; x=1791732522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0MkHQ33bfr4m25EDydRQk1cIUu8p3JZCdXBnxf0p91E=;
        b=wHLu3uL0quXkkD2knVQL5Ih1zMwbNfYU8SNRGgBdyo8KirDom3yXryyIj0GCIyRM0S
         yjbtgzK6BOSumTChwRmHi0ZxmuumzjNAm+p1AsOD5YXHZuWX+IYWjVe2gobbEJnC7yLR
         f8y232ZRDwxc1/4kkrUlcEkZ//wM1lTjnA/+gh2KQpWzr2R0qp/PhWx3xK5ozwh9spy7
         yS3iiEdDyncETVUp5gXDiT7lF708oWuOgOTF4coeMk9CKme+4QD/h8DHi6nS8fu9Z3qN
         EfHrTtXggfXE+rwIKgJeyLF0h/IfVNoaeta1LO8rz0+94E31TBhmXFxp0ysiRkJSozvK
         93EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791127722; x=1791732522;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0MkHQ33bfr4m25EDydRQk1cIUu8p3JZCdXBnxf0p91E=;
        b=H6CN0xZJp9tIf+H85FHDaALEGPJI9IAvxTeBvbedQyvaRlSzweCC1rUZjWNEneymp1
         TkpnF18hB7b0AyU1fQB+45VkWu7pCXTX/if6g2LIKZGSUN7v55AadNnJ3euRBS1LgUaU
         FmlEaafaAiFso+RNp1d/xwu91JriEDrWmRjOFCtnMlW3smnUCtUmyNgNJQbpAOvsJgdo
         RUgp7619/Z6ZuWAObUuYPeBE7WB8jTEN9E9Wz9ZUVB4ZANEl4zEWmytfy48wRQX2zNU8
         R9QW26hYfDYl7b/2q0JczfdToBc4II6gYIwU20L2Qkz7OZ2iO4Ay2ULuK7VH0mVPIxD1
         n0Iw==
X-Forwarded-Encrypted: i=1; AKwUvBwZCzpYr+3UrlHHS0rfR1XOMxqJJ5nT0a2yqSWsDl3GO0mTWPAI4GBzMh2un0BMcsEB8WXNaC1yqUjHB88=@vger.kernel.org
X-Gm-Message-State: AFuF++k7umc0tvkPuTomvANWnJEm0AVQLKVHVU78n4Q6J80CuUaq7toU
	xIzMzdMTBZ790Hr5ThUwhyGPAhGgcEKzl7iUPIbanqk1hHOcSYzKdaysf/Xnz3ZAtqE=
X-Gm-Gg: AYBFou20RY7d0nDUqzuetbtgKwOdGu1Xxxi9ipEZMY0odcEN+qvsPBxeEB/WaLkt5Q2
	NMnEnO1aDxXy/jek0JhL5I23Ph3UWyWWvmf/Kx85wZ+ijKVTFnyAf2ChQ963Ezc7TMamIlvwaze
	daEev6wUEELisvG2+bE3jB1E1PjmCsnH8QD8urLKnRWu1mXyHwoOnS7AsC2dybfdLP/L1pDKZAA
	ygKQNoBDbhU32bemIs+rev2PgjFWbsvCH49bcrgWsgaPCqWbBvd0ryB5O8+uorjbXkqCTZ9H9Us
	RDKIp2eiDpBi3dKU4XsSEVOi3PqViTG78nq3OosjEQlmjUBIQNKaNx00UPXnZLJzgV+2PxyFKb3
	fjlV1nx9bOumerpMFNCTX1f8pJE4wF6P65imjBVtlNM334BtJF4azQgnSkHXbVVZZrfcCBW41CN
	l2FXEJh9fG7Opw2UeG5+NTxqSnyaEEntdbTOyiLZH6tdVpLq0+vjymNN93C8W7OhNuf2Px2ohLC
	tUqdAEL0AuJSBGz63pt
X-Received: by 2002:a05:600c:8b6c:b0:49f:ec98:f030 with SMTP id 5b1f17b1804b1-4a0276b3e15mr140322415e9.33.1791127722245;
        Sun, 04 Oct 2026 08:28:42 -0700 (PDT)
Received: from [172.20.10.3] ([37.169.53.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a039505568sm231387545e9.3.2026.10.04.08.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 08:28:41 -0700 (PDT)
Message-ID: <413e7e67-ccdc-40e3-b360-8e349820de85@linaro.org>
Date: Sun, 4 Oct 2026 17:28:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH 4/6] arm64: dts: amlogic: t7: add the ethernet pinctrl
 nodes
To: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261004144046.391444-1-tanure@linux.com>
 <20261004144046.391444-5-tanure@linux.com>
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
In-Reply-To: <20261004144046.391444-5-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/4/26 16:40, Lucas Tanure wrote:
> The SoC brings its ethernet interface out on bank Z, but no pin groups
> were described, so a board had no way to hand those pins over to the
> MAC.
> 
> Describe them as the two sets a board actually needs: the nine pins the
> interface always uses, and the five extra ones RGMII adds for its wider
> data path.
> 
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 6894c06a836b..7bd53ec16607 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -376,6 +376,36 @@ mux {
>   					};
>   				};
>   
> +				eth_pins: eth {
> +					mux {
> +						groups = "eth_mdio",
> +							 "eth_mdc",
> +							 "eth_rgmii_rx_clk",
> +							 "eth_rx_dv",
> +							 "eth_rxd0",
> +							 "eth_rxd1",
> +							 "eth_txen",
> +							 "eth_txd0",
> +							 "eth_txd1";
> +						function = "eth";
> +						drive-strength-microamp = <4000>;
> +						bias-disable;
> +					};
> +				};
> +
> +				eth_rgmii_pins: eth-rgmii {
> +					mux {
> +						groups = "eth_rxd2_rgmii",
> +							 "eth_rxd3_rgmii",
> +							 "eth_rgmii_tx_clk",
> +							 "eth_txd2_rgmii",
> +							 "eth_txd3_rgmii";
> +						function = "eth";
> +						drive-strength-microamp = <4000>;
> +						bias-disable;
> +					};
> +				};
> +
>   				i2c0_ao_d_pins: i2c0-ao-d {
>   					mux {
>   						groups = "i2c0_ao_sck_d",

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
