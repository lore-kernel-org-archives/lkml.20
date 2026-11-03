Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696109;
	b=3DPl4dhPQj/TKw9fSMGGQgdXpZYLWobU/HyAI+PmFLDHH+uGP++fsvEWWYovkSRwXhkb
	 XsvdGdg1Mxm29fdc21GDhxkg8G+x3vNpyjOgdWsaxeEb1XmOJULSgNBNEwFGtm1ahheie
	 cgueDt+O2DYLDkl0Dh8XdDADpYQreAbW2f71wsvt60OEhGAzVQkkthFOnxrVO5/8E+21J
	 LNtgV5Iwuu/pHrEaksIXwrOr0GKd/tpBuEvwNLsSPL2w3sSCshsQLvkfZk5v6S9uLCdFc
	 1LLuJN/Ie14Www1pCUGkFZ0uobICyIu9+ustJqHYYS3GqPXMdQw0lro1UhAsAJJe67A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=agwTDlVTaDDjvub+/sVTXidA5drfVA/Xuq65aoektFk=;
	b=XoiTNiwnMdSo+n1LkAwj7zfBGVImjp1rng3QWvijVQSjBrx70l5qxiRuZOoLaEBb0kiZ
	 hFkeExnaQ0IUN62fPpF2lGEbbn/EG/7btuBRQG5pK4j0+GdAKfATspKFhvCi6LZ707vlv
	 ZjMTT/nGQf/UZfU9eBYRmpLdo8vTI5KowbtBwIbg4VhsXtFWKix4W2f9Vsx3bWpqDMV/W
	 rbyGji+TVWpbxj6eM7YrpsY+kpHF2nnShrbYcfMIMa6pV9T43K5/bnsgMuZRicf6s8fi8
	 odN+RwHyP6piIqxXR1HwtRzo6235AEsRWx0HiL/lw7Qhq8RcoOpK1FPCvIN8uDmtO3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tb4P2c31;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6760606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6760606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tb4P2c31
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so40517615e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793696107; x=1794300907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agwTDlVTaDDjvub+/sVTXidA5drfVA/Xuq65aoektFk=;
        b=tb4P2c31O94KPbtcM+9HGamMUoeSJpm688QqLQHP4hJk4CdmZcauDs+ZG3RhjL3OqP
         83U14EZE2dM08TV1PFO0bayYgxCjJAZwxYrKIi7hshc8+269p2tlnPEdRFkIv76T1oWv
         qQZlfREtbknavweStprVRQFhLexTTf1hN1Pk0B5pNaw5deRFADnUmYrkzSHWshHO/3Oo
         yY2crvWrFXr1MrZimgIRy6KNY6kPOi+hJZsm5mishijBDPEy7iBadj+NmHzk4vVU+CKb
         dabUBw5i9J7b0kVifyOAJ4NSJrBz7Fk83JdvUIcQEODaNRgF0f/7lrMUz5tL5f0LuWFQ
         jR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696107; x=1794300907;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=agwTDlVTaDDjvub+/sVTXidA5drfVA/Xuq65aoektFk=;
        b=VjFRwwSucGeeGxtE/W7Xbih/+VdX3D57FySONDfKZo+oDyPBr7+gE/IiVePp2QR47C
         f1UCohQwCtX5F8crUxUuf+wnnddarc1v+VNUrV6BYt7T4ISDLURVFNZ4p+l3ZD5zL1/w
         IxyvEBnL6q/8VUQqrA0HHCpdiKti6gmHdpNRasf8LwTOpMUq8rgO6FTVa6GFicxZOajA
         bCPVKAg4xzeIBUUFq66itmgr02j4DMxsefIyFd6ENSSrigkPpPM3Ix4WPpB98L+Q4ccc
         UwU8nd4t51vuJ3vWkz/VOXJnb7Uz7qWO+6XIH3HtvYkb7ZA3iaQWys9nXj5pzKrKGbqV
         FbHA==
X-Gm-Message-State: APuU4Z84JReCErMMVamwEY8GyyDjVj8yUzCEI2MIBtaY3HLzm4mUEOyt
	CJfigRlnDxi7cXJrAUcLB+1BSJ94xviPNlVeWOrJ+RKJ4iuMxheGQcZRPIRTChHvyMo=
X-Gm-Gg: AYBFou0+ZTTmdMn4HyfslvyGcs3leDSRcbhX0laa3ISmwNpMtPnS5hp7pRJXz4l54B6
	6PtphdUHsuO9wJ1qvJfSuIg8vCA1g2/4a0Bjtd6b5QTC9G5vJjZDlBjgDcMxgI0ASKCVpZjqMsb
	fAZ8Mmgf49fmduUcNijyuvLn9CYhoNKZ91moLdfeFDP8gVCfFu4nbiN5wDqtO+eZeydzPKlkzc3
	1LbW8yyxlVfFoqgFYO/EfU0bR4reoCCstVcR0Axu7y/nTi26x5+X9e9RH09XoWCuQ8p99GtZWF8
	MqdVCpUIHGM50JGNi5rmdUmnnw1lzXlLF1RGfI1dLjflawW6CKgrdTR4g7XLq+d8XaxCeO6WLI4
	ESGAVHyQEEkZEmXfmMtPkMX+wFV3xu3B8eK3ehIANN+2nmYNDQOALktMBD5e9qAdhtbpL3vzwZR
	hs3XrVuieQR26PmN09tR3OGoxVmMuQtzTDuq6YOXh9yng4a2s3gFWk7xrmHhGCnmK3x0YD/iBm3
	fEz6dNGoDg1exhMZZo/WaJqYiaRPWF08+YEmdWmzqEQORhjWWqfpQrAUjw72mv2Mt0fNaYCfKX4
	V/PKtayaKrZBfV3eoR5nMhchtslgj48j8A0xVbo/7pcxmPu2AFLjowzOslS9JxiLtNUF4dZa9Nz
	LdqlTRIwK
X-Received: by 2002:a05:600c:8119:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4ac17a36a28mr255021625e9.9.1793696106916;
        Tue, 03 Nov 2026 00:55:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:95a2:4869:9f46:45f0? ([2a01:e0a:106d:1080:95a2:4869:9f46:45f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9bd5d9fsm40122525e9.15.2026.11.03.00.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:55:06 -0800 (PST)
Message-ID: <518cba7c-1aba-492f-ac6a-c5c4fe6da847@linaro.org>
Date: Tue, 3 Nov 2026 09:55:06 +0100
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
Subject: Re: [PATCH] arm: dts: meson8m2: add dwmac 3.70a compatible
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 00:20, Martin Blumenstingl wrote:
> The Meson8m2 DWMAC reports User ID 0x10 and Synopsys ID 0x37,
> identifying it as a Synopsys DWMAC 3.70a core.
> 
> Add the "snps,dwmac-3.70a" compatible to match meson8b.dtsi.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   arch/arm/boot/dts/amlogic/meson8m2.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/amlogic/meson8m2.dtsi b/arch/arm/boot/dts/amlogic/meson8m2.dtsi
> index 6725dd9fd825..cdc47ee1a233 100644
> --- a/arch/arm/boot/dts/amlogic/meson8m2.dtsi
> +++ b/arch/arm/boot/dts/amlogic/meson8m2.dtsi
> @@ -25,7 +25,7 @@ canvas: video-lut@48 {
>   };
>   
>   &ethmac {
> -	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac";
> +	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
>   	reg = <0xc9410000 0x10000
>   		0xc1108140 0x8>;
>   	clocks = <&clkc CLKID_ETH>,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
