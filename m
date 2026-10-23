Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740212;
	b=Ava+Gehm3TpvRXIHwRED8ms6vcvKM78r8kLui6DmpcUUL8huWce4YH9PZdk/ff+9DP7q
	 RuxLjOnKxxiU3q50UlS/2XDQHCjQyqlK6/yvEtoPfmRBXPhJSx9hIpnF1nFdibruE9QUb
	 22/fHLRVRyMDkZGArULxiJgKgnYkCZWWPRCxDRzHnB75Vk7Yz0n3X6fdPpckuBS46IHxP
	 O7T8yPGTO5IG6vmYkeylnMlbSQibvssjjxBQtElylmvDyT5Ao1xHwxmKrLzVgu/9mKHZy
	 rhj5fgdN4dkjlZnq4i/cciRjEEdXPchJmkI8VYWcLS8qI1gGO99w7tImRte9116k2IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=zEG/GVHCLQPnI88SpC5VPZ3TgR9urVz0hXrc0LNloI0=;
	b=E9IYtQSOw44/hZjMBwOWcgoCKNHWiiuAhm+OHKr1dTGXQpr3kH78mPPjSrNNbIHlkb1U
	 5YtjVRg4O7Zmw1A3ASy9jeTdwjaC4aHJme2T7WBZWf+7ziSqRMt6v7QYpp9ytoxj2a66y
	 aEGi142/SfAQW/VYEBhwYmU10oaqvUa7Lf7ql9cmXQ3345jZXf+jouaOfz3vHZeNYeSv7
	 dEG8ul14WVRdiq7Z+ZSvDHUgjHUitye3GaCQYPOOi+gK9Y7qtFOIRvfMtM2Ola2bvmoAT
	 4AWT+Ho2kbxGh7rk0Dr874Q5QKWCGPyhdvJva2hxcGpLr+DbLwAhrK/h7yic94M6T0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ETT0rPWl;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4BC606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C4BC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ETT0rPWl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c45111bebso262703f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792740210; x=1793345010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEG/GVHCLQPnI88SpC5VPZ3TgR9urVz0hXrc0LNloI0=;
        b=ETT0rPWlyJHUiGfPOgj/71FpiLTcE3uORng3ml1Bl3MB1ZqY6YLvytXfgRE3exKnDZ
         dHKFoMCw+zsFz7IHzYh7iTgwVaFWZjYDH8YnkMBgJQNsFLTfGoaAYruXBgyGso4zznAc
         CJ3nfhCtdFI2iBsDUAZAYgcnAE/2z7Xo7aL6nQqOhIffGdtEJnag26cprTSZFfeQzfAI
         myPzmVaH9YaqCmOQfwrzzaTJa9t5AqTREua7lJ0h86PPtsdqRboVWIt1PclY7wvA8XrX
         hd6gVZFMIwBmJic6JMLncKOSe552Oj1dfjkVUAxblyhDWRV1O/SB+xgVvA7IchL/PWpR
         AZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740210; x=1793345010;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEG/GVHCLQPnI88SpC5VPZ3TgR9urVz0hXrc0LNloI0=;
        b=rN0km418ZrjQWhMnZTg+TtX1twkyxDu9gMVBWQ0MUi7xrp5UPSSmvKqQai/AfakXHY
         3e6r34VkkisMN68tPMjpq4vXuDGj8kjrCehlPEEtrxm8lvfYG4GaFOOcEuFVA+Bgu3Xi
         cX1iMZ/xO8QE7Bj51qr4DOnbmqnHcIOXFdzs0yj1Q+F+mQKtHouNCMViQ0d+hwMaPCcY
         ecScYaJ8nNwEMvD1/k0vx02AOZBbu3/DrZTp771bRLClLDuTHPQBD2ntwzRdUnGx5vUL
         U9AGiUHFO3Cixc7690lFdM8K9v60cdAa/OT6FXSv7dvoMpIDzIfC3DFMh0Wik6wUFXgs
         UNPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqkwSui6OX37el1591l15l7+lo6ykG7LIn6hDxBH4INH2k+6c9sw1njGorcoTin8uuOv82pF8hCXiYg8o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ8vda44OPQBUWmmTfbikDdTMXQdnngZU/gbSSMlBW3Qn/jVDA
	veO/cwzIH4hryUJX7zBL304UPnmL2Euxi/RPO2usP1ThRRHEP8ZcfQ1zJmlPd/8xHMHrEAttKAN
	eZIh9
X-Gm-Gg: AYBFou1Xyol9HXCQy+VbUjVVgHLouir9yYQu28Y3QsJtp+vuOEGFmA7LhY4iW7M56e4
	CNYhvhdmHMXhljngZ5pYBMvIxUFgU4YaXOGXPk/b7O+l7HoSTrDuhCs8XU3dnjpFj/WYnI9SXZA
	oe6KyxeUuFXLKG6PwMiCMkx+dhBevCw65uSrRUA6XwBZEVRJjO3Wy5jEyHIof6O6ZdeEElwGdlK
	JV+wIp6IvITAQxubcUx88GgYrYTbWVaYvkavuG+Pcoi5hTRRpENSj/KIcVvKr9djpK9D0Hb9q4u
	S4GKvsH5/FKfxRlLUWRD+irhdRiRYZlYwa5BTWNDZoeaI+577NeU5zkYmRPip22nWUhE9clIWE4
	ake5f81skbg3ja1TGpDq2Eyv3mVLagc3cxEjbCHGzf7ATmJiEjejQlSr5ouKhxA7ffRy3Kb4esV
	HQi3hQzm30qTpmNsmwm7ZF1oBNrMMVyCW1r4HW76sHAUMC1p03GMVhz+mTDJ7lChUtJnlz3caUn
	p5Jpl1o61pT0Y1XA/CJn2LLDfXQWwQ1Njn0KcSHoOoDgFU5vbk++NADPDeBNZXjAsa6xFZpuGyr
	QEBk5B9tACD8eO5M8DZ8bI5SlXcOD3P0k1w=
X-Received: by 2002:a05:6000:40d9:b0:48d:f470:6b3e with SMTP id ffacd0b85a97d-48e3858b5f3mr1960195f8f.13.1792740210407;
        Fri, 23 Oct 2026 00:23:30 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:1c53:498d:36f3:7085? ([2a01:cb1c:fcf:4600:1c53:498d:36f3:7085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edce4fsm3456370f8f.6.2026.10.23.00.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 00:23:29 -0700 (PDT)
Message-ID: <3bf32179-dd0d-411c-af37-54d50eb7986e@linaro.org>
Date: Fri, 23 Oct 2026 09:23:28 +0200
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
Subject: Re: [PATCH 0/4] Fix and complete the GIC description of Amlogic S7
 and S7D
To: Carlo Caione <ccaione@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
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
In-Reply-To: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 20:30, Carlo Caione wrote:
> The S7 and S7D device trees describe only the first 256 bytes of the
> GIC-400 CPU interface, which spans 8 KiB, and leave out its virtual
> interface control (GICH) and virtual CPU interface (GICV) regions.
> 
> With the short CPU interface, the GIC driver disables the split priority
> drop and deactivation mode and warns at boot (patches 1 and 2). Without
> GICH and GICV, it cannot hand the GIC over to KVM (patches 3 and 4). It
> needs the split mode for that too, so KVM gets its in-kernel vGIC only
> with the whole series.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
> Carlo Caione (4):
>        arm64: dts: amlogic: s7: fix the GIC CPU interface region size
>        arm64: dts: amlogic: s7d: fix the GIC CPU interface region size
>        arm64: dts: amlogic: s7: describe the GIC virtualization regions
>        arm64: dts: amlogic: s7d: describe the GIC virtualization regions
> 
>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi  | 4 +++-
>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 4 +++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
> ---
> base-commit: 8610d31587e139380db9cb8708f4263833b482d0
> change-id: 20261022-upstream-s7-s7d-gicc-size-db94cb656d36
> 
> Best regards,
> --
> Carlo Caione <ccaione@baylibre.com>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
