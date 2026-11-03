Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696169;
	b=wUQEjxeWzmH777mfHsgTvmIvkAteX/UVGQtHcKDINixpXX+9D44UB4EoxFjpd1BVUY8a
	 sXWElPlbZKpnJYsAoUVzLhR+MVeEV5L1V19PlWC8ENEgmVXMrIj5361yUZQW3oWdxIJJv
	 aFut7jo9VU6+PrSXDcODFWXqb8K2muZbL49F7BxphgqjXj7+s963ZS7KvqA4M3VWpozjU
	 YNN/Df1HoWaUA2Y+1XGPVjO9MRuIjq8HdeXaekwUeFMbR8jCBBt6pAlBRUC57fhDxfXXH
	 rDv52PiID8KMQuVfT9ARuKkbzU4MtNSt5KrxxMR9N8Po7oy+Rhc2emdLvoa2rqoaR9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=0jyamYHXzSg2ziaLDwiS5/5BeZM4xaO8pbQEHrQdYGE=;
	b=VCC9pHMbJA6lvMeqoVa8fT8W2waqvVOFzDa8VuamfOEKZjeGK19S5lo+neUVNjjwK0PT
	 rvrK0kExKkM/+/ouI73QHhD5+/4pe+Qek4g+hPa+uCZ0PaCDH6WW1IVny3qwiU06nhV8q
	 70P3Nm1MbnvxGxpcG3Pifs7K2CzoE4mE5vGi82irPyPcQ8H6et8IUC0U/GDAmFbbebF/V
	 dphOC5f1OK23x3dVgZrOO1owBfyF2NLL5GmbKbQPfLBB+Hw8NqVj8J61pSZgUHYSFam05
	 RKlnnitwZB3Qwp4/JZ0B6ADNJfAs4jPoVEdUkqhmOWfXsI2yK/Vl9oOVbbMlm6QaN4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f6U6NXOj;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D837606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D837606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f6U6NXOj
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df8fe8513so3351634f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793696167; x=1794300967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jyamYHXzSg2ziaLDwiS5/5BeZM4xaO8pbQEHrQdYGE=;
        b=f6U6NXOj6LpNXK2e4ZHQ7g+8deViShs8eUP1unXvI51aX1NR6sM+uV+0pCqmHDCSJ3
         3mrT04WkCBGPylph3oGhRe/iBc3jI2SSIJLCVp7c85ELserS9+0wQIr7GcEC3cYbs3+8
         jMSwBKRwOIeB5yVNpnR0Rq4s8efkk/tDbPbGjtI5R5/Zx1GAb4yxOvejsKDQWlvewUwl
         qlVu7x1CRStJKSX4IZTbjxlvgtxCNuRcncCngzweSRVWHRarqZIoUpvlq8QfSYSWTjyO
         DNSICeiSUVUlp8lDoEf/siV2mtbcEuly1Od109rCZe6gyOMVXAidKmR8NUiUnam01AhT
         Xy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696167; x=1794300967;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jyamYHXzSg2ziaLDwiS5/5BeZM4xaO8pbQEHrQdYGE=;
        b=qlxT5NArDax85n6Q0h6w5PKmqIg4eC3bATjmWZ1lDgrQZV35Fh7RrXMRhPozunfWn6
         NAss2xucYMoI1krP7m338cepvDYaJMqHhrKykHUpQ4+abMq4NmmLQLfMw1OS61tSiujm
         tjfPva2fs5giSQfu7XZ5Y499ThSJUMrH5vmvN2XxCfti+P/T2ZQ+f1ylh8XpVR+X/ey5
         rWTlhp3gcOQhvBn+rlGBjAU076ndkVV+/07EIMzrMQUaIF6oSEsUYPUbIaZxPK8oxVh7
         peOntq276BGHrYmmZZhxBF2zeW6etGwUITjBWCAkDC9sFq8kYXXh215KLKC7rlZztrGi
         rd1A==
X-Forwarded-Encrypted: i=1; AKwUvBx1SgX4FTrXqi9NZ3LWMtZf1Woegi+udfYeq52zCTPt80W39RBUAuRtzYvDarXfV852bp9/0aOygTtMhpI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6XblCSzFlVk5h4iGwPDrAtiLzfSgzrL+RqwBlYeCHsfdXUbIY
	8hTGPLlK7Q98sC/ujFEZzK02T0TrjgYCLQGVg7Fnrrc/YhMgCwC5itdZm8tQ6Lnz7/4=
X-Gm-Gg: AYBFou1pWJKXV8UL+mj+gzal3SVfY5YjuMeMEU7cVUil7pAx3KiBmfd9+A0bBcE5tI3
	TDdG77p7zyP3Vt2MejUf5E57Fra7ewQ5MucBn4Iohxy8VlnJins9L+1tTHH9zG6hC91Om9gLImC
	PaMlqFihKCCqLOzgmsggKAYCVsnUgQWDWnh6B2cXtuehD4nJwCBWtwLMRkCDX0/1Z2SCkcMk+Ve
	LFhwuB4Epy2teFi96wgIkl0vlixMi05H1WNJfiBzHfm9fQnvp+ao4WI79USdO7q8uB387OWroGg
	w9PthqtDdW4fXZXyn2WRRct91e3Bw/zahHnKvWsvbE/JbvoCm4YvWrTXZrxnIOCyfcWxg4FJ8Ve
	sisqh1COqIeoclf7JnnhY5DP4u+mw/dkfSogJ+kmfZhXJrhWpShkGv514FsNduPp61bIW2fIL0V
	tglZGFUpN0kgYposjXLCY5skOQzu9j4NBLU5BjJZD+PJgX0om6WRH/kO6ky+PSS3za3MVNd+CsV
	tYimh+h1S32fWx0VamOgjBv/Pr126NbPgTJ34WcOFnWcPnZ6PjH5uWXmquke7qLHzF/kN6tbJ3H
	D0Sjeh7YgW8SNUiXRW+rltps1WkIyEai51RoZFgx3/sNxjCv5m2tDuRVQcDusjMc84gWgM92HIl
	t+H0DAs8V
X-Received: by 2002:a05:6000:2504:b0:48e:5df9:1ec9 with SMTP id ffacd0b85a97d-48e6e500979mr30641989f8f.24.1793696167199;
        Tue, 03 Nov 2026 00:56:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:95a2:4869:9f46:45f0? ([2a01:e0a:106d:1080:95a2:4869:9f46:45f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e88876946sm4998576f8f.5.2026.11.03.00.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:56:06 -0800 (PST)
Message-ID: <c1c38ee8-5a7c-4b08-89c1-e1e27a2043d1@linaro.org>
Date: Tue, 3 Nov 2026 09:56:06 +0100
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
Subject: Re: [PATCH 0/2] phy: amlogic: meson-g12a-usb2: add S4 support
To: christian.koever-draxl@student.uibk.ac.at, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, vkoul@kernel.org,
 mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/25/26 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> The S4 USB2 PHY is the A1 design with different analog trims and an
> extra disconnect threshold; without its PMA update bit the host sees no
> root ports. Add a compatible and the S4 settings from the vendor driver.
> 
> Tested: both host ports enumerate keyboards, mice, hubs and storage.
> 
> Tool use (Documentation/process/generated-content.rst):
> This work was done with the help of an AI coding assistant, Claude
> (Anthropic), used through Claude Code over many sessions. It did a large
> part of the hands-on work: it read the vendor kernel and the firmware
> interfaces, probed registers on the board, drafted the code and the
> changelogs, and ran the builds, checkpatch, dt_binding_check and the
> tests on the hardware. I directed the work, reviewed every change and
> the final patches, and take responsibility for them. There is no single
> prompt to quote; the sessions were of the form "find out why X fails on
> this board, fix it, test it on the box".
> 
> Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
> vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.
> 
> Christian Stefan Kövér-Draxl (2):
>    dt-bindings: phy: amlogic,g12a-usb2-phy: add S4 compatible
>    phy: amlogic: meson-g12a-usb2: add S4 support
> 
>   .../bindings/phy/amlogic,g12a-usb2-phy.yaml   |  1 +
>   drivers/phy/amlogic/phy-meson-g12a-usb2.c     | 65 ++++++++++++++-----
>   2 files changed, 49 insertions(+), 17 deletions(-)
> 
> 
> base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
