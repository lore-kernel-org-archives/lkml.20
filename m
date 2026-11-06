Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962545;
	b=gjk9awNCMZebiBTENkPa5ORclDVwYyNJ7GJ5PdsvDXQc1WTA7g2QN3o7Br02z8EXV3Qc
	 1K9aCraW2yOsF2shGg9BBeiwtM7hk6aQ9k8qBWBByqgjx+CpR+L9wUJwnI+ZLoiiW0aSz
	 PhqORHTkSXP6msBjmLiYHZvZb92c12a5mA//3ZyD/+yyEJI/MGI1T5+nQkSea3jnNJogb
	 zat4MAqmdWHBxQ6gaZkw1j7u5Zcqm2TWwXiMrxv5yKWYzwva5ZbnmkT8zJyCcYlE4STeq
	 vwKcFVAK2HJzl4BY57oBbp4yE30p+rQrJAMGlP3WOW5+FlH0g9Ccct2vDpSYx4rNEDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=l/EtuhWrNppGiDVt+KKWYShvtLcO6NX4s7sOY4Stz8U=;
	b=RP6mXUZcPvSlde4WO8y3JV5nEmI9aCrVlDcPXulKJgEaI1aBwyv6QEkEBwO7hZ/caxA3
	 PubEs1DN7KLn2Vr3AKfddxKrCq1icDpUoSlwtS+BM7Xs9r9pGu/pTsGpFucPSQYBf9QGX
	 IYwtnEQbQzNREbG80Kq3o4zcq/LQvFmLIv39Lmg9EIEE+H+BlrHiaQiU2V4n542BTwVOi
	 ONLehW2IeVTOyTpH7ufQIQmw/Hsy5HJU4Eu9/liu+shUbTRZuINF1hbVCOYJzSbA3nOu2
	 HGfcxqx1kjCFWrFOwoMzixqcv/pZIsteT/eB32bmOjJWP9wAjlrdmU7bnFnsXHveoUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TbLlTdxs;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9BD606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B9BD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TbLlTdxs
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso230543f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962543; x=1794567343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/EtuhWrNppGiDVt+KKWYShvtLcO6NX4s7sOY4Stz8U=;
        b=TbLlTdxsEPMevL+7udMCEgwmstd+dy32twU5RDz6uuzIbaPcR0eFmhC4R4lgr4SV0I
         PmH04+hkPGJib4QmQWFg4ZEte3/MJ/twMVKrs9d3KGMYCWe/ds+lM/Hr8eUoq0U1Qx3a
         UDerKkYAhk19DeiL4YcxUbn9K4Rd9ZB4LjMWX7UTh2ie/+LsSxgfUr50xCjdm/RcCJbg
         /lMXQOb+MGgglurHVpj/WFbpYmUOTkrq5Fnun/tAqpCGLCDJ6gZSy51magnsJXAIB4YC
         s3CqGSJhQa7uff7ixh7kyaYDwkfgBKg+IQV6yxjE8OpKJM+zbp+Xn/niuBT68UmK0L1Y
         NfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962543; x=1794567343;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l/EtuhWrNppGiDVt+KKWYShvtLcO6NX4s7sOY4Stz8U=;
        b=wdCZKvth75qEs2pc+aUKYgBD1p/1gDvMdLPGKp0M2rML/LR2cBdW2DA8jgWfMIbmJR
         biH/E3C6TozAb3bzIt0m4WUlqSKqlPf0BStRslXISEhunATtYo4vpsBBMp729i6uY3K/
         6xv7Qp7hJjZq34XJH/rfQRG76jUVcxc3BbaLo/2s2xAM4ooIerjwSKYkXt7OY+bEiZ2+
         AVsvYXUAeS2h4s8sRySVC7OFdkQtPOmIppIpadtAw1nzHNDN4QVe2ubfVoUaPLjXCBU/
         h3H6mIGmMqAwdeadRe4Wm3o1o4ZfoiMHPb7hH4aPBmIwQzVfdCEWoWwIM4W/Rffst352
         pGvA==
X-Forwarded-Encrypted: i=1; AL+hErFtKRytiSbQkQmp8ghro7uZPe9JS2sYs30y5xTKuvG1a+O5QSTRXaku2oXvCgWlsdi+7LfRJH7LduRzX0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LUpUp3tdRJOrYr+LG244IMxdW9A1x7OBYzchGgvTndKN58m4C
	05lxSPrGqsJ0OPZcY8BDl5HztXwe5xK5bHNCC22q0EOfVu97laN9Pu+n/IRB8DVGfnE=
X-Gm-Gg: AYBFou1LcBRgmOGZaMgTc6+mGmj+N0uM5sJxjRqzRTrHjVU19/JZnfnP06Pxr5l3mPt
	AFgxb61SnN6kTcc5qBBTEOEBjS7RnvoOUAGa/x8v86c09AwBf9j/lvA2oRTq0Zf8/jQA64UTslt
	GOA/NivtZCT53XCtD3bCeppkt0DYu6BIyoYRtBVQu8S+nJAtByv8wEqv5OJ/go64Tuye2XSxIYi
	4+KMR+g8Bq4mJ8LtmoibJKgJOE1qeYv63CrCx5Ppka6OFXY9PjjO2qDpHIa5gztEqGr2BNmsjVB
	eq9kn2gHME6GvLNlYL4NeDhJS2WS1wJqntY4cDYmoTxG8FYy4Si8AjK7lWstsG7v3o+TEf4xb/t
	Sm0q8acwWa/mYvyrZ0YaitDN9YPCl9/NpJP1WXZErUtudrBjplo1w4tsYCLBGXGo638SaIXmh0o
	O5BSCQEF6DQ8gShDzL5gqVpaePDzNYbl32OnzP354sjoM8sM0HrKXM00QPAV0KgTJX2dDmaY9VR
	Vn8Jen/D+ZCoto0Rpc/AQw5ClueggflKNkae4kcdwPDnx1eC9GRntC7Tz3s8nLOCUum2XtfKIAT
	TljapPrJ5DvlJ4LIzpptliZBHxdL+GDdVJOoy6kwPmCTPSLy73d0KGz5+8cY7lM0Acv5MMAX88o
	M8m6qy+/Vb2vN3OErURYfP6b8oSjBuA==
X-Received: by 2002:a05:6000:4312:b0:48e:4300:c6d4 with SMTP id ffacd0b85a97d-492784552d7mr4914008f8f.53.1793962542588;
        Fri, 06 Nov 2026 02:55:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9df2:2e39:58f0:72ca? ([2a01:e0a:106d:1080:9df2:2e39:58f0:72ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63b79sm3100072f8f.20.2026.11.06.02.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:55:42 -0800 (PST)
Message-ID: <3018aa97-ba40-498b-8292-122476fbd3a5@linaro.org>
Date: Fri, 6 Nov 2026 11:55:41 +0100
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
Subject: Re: [PATCH 09/10] arm64: dts: amlogic: meson-s4: add the AO CEC
 controller
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-10-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261106104659.54656-10-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/26 11:46, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> Add the AO_CEC_A controller and its pin group.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 24 +++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 155997649dc3..dd51e786d29d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -747,6 +747,14 @@ mux {
>   					};
>   				};
>   
> +				ao_cec_a_pins: ao-cec-a {
> +					mux {
> +						groups = "ao_cec_a";
> +						function = "ao_cec_a";
> +						bias-disable;
> +					};
> +				};
> +
>   			};
>   
>   			gpio_intc: interrupt-controller@4080 {
> @@ -970,6 +978,22 @@ sec_ao: ao-secure@10220 {
>   				amlogic,has-chip-id;
>   			};
>   
> +			cec_a: cec@44000 {
> +				compatible = "amlogic,meson-gx-ao-cec";
> +				reg = <0x0 0x44000 0x0 0x14>;
> +				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&clkc_periphs CLKID_CECA_32K_CLKOUT>;
> +				clock-names = "core";
> +				assigned-clocks = <&clkc_periphs CLKID_CECA_32K_DIV>,
> +						  <&clkc_periphs CLKID_CECA_32K_SEL_PRE>,
> +						  <&clkc_periphs CLKID_CECA_32K_SEL>;
> +				assigned-clock-parents = <0>,
> +							 <&clkc_periphs CLKID_CECA_32K_DIV>,
> +							 <&clkc_periphs CLKID_CECA_32K_SEL_PRE>;
> +				assigned-clock-rates = <32768>, <0>, <0>;
> +				status = "disabled";
> +			};
> +
>   			ir: ir@84040 {
>   				compatible = "amlogic,meson-s4-ir";
>   				reg = <0x0 0x84040 0x0 0x30>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
