Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625826;
	b=bZmWlwvZO1Jk5zvnx0/8cSI+YWyrf3TSQd42yHBzLsnnfwvF0Q8QMe+mow2rX/NLJ6Se
	 W9SJU5YPdjr8MdUEv8EK+xsC1+cwacOdzeku39G5O4emhCi8cv4lJDOfovixYHYo2TwXq
	 OxUETbMZmPzbvwCz9W8s9oGFectOJNy/h6XMOJ+xUhYRnZjvWY2thAG4Vb+ItzIzPPMxa
	 yUo7pgvvDQMqoolIxGQ7qwX5tkMiT477GBatsRBPmSD7nf+6hjNZMXYNx9Wjo+XL6zXeu
	 AFHu9eYbJQz9UCDbI3y0iRVn1dKEgEMS1zOpnuODS4DgfX9OuIHclph34o1ZkxLbCZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=cjTkavopvWP8IoUO3Tm2DHF2lem7yW434Hge7kuVhBk=;
	b=uZ/19Viq82OHeYCfTne0khMcePZoXJWRWj4FBOMbNJ94wB0lop7TcUKjkc/1fx18HHwy
	 C/CRWA4Ddyy4/U17yx7tdT4iw5rVymLjQ3EL1eVPMCHcf7eMby3Yq9SJlQGmCcjGu5Qpl
	 s+SQ/0fl94KAb9QKhOIxaNuN6U2qvcjGTs7aVgsl0v6JOTlxaoM6OI/rECz7ZbDkCYwdA
	 ivF0J9ljYiBUzwR8MRkLsSHGAhRDcLTNGviFJMnp6V4fM+1ylgyoAps0po64HKiy4tVyU
	 AOGLxyJJ2YIjw6WuTwIyg4V1u0cQhbgm/Ii6RJ5yz1qElXD28cmvvk7BuTGUpHRKUtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="tL/cX/OO";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AB760A2604
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3AB760A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tL/cX/OO
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1341312f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793625824; x=1794230624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cjTkavopvWP8IoUO3Tm2DHF2lem7yW434Hge7kuVhBk=;
        b=tL/cX/OO9kNjK9gnxW/Q92Iea7dXKSz78zXTwlrVx8nt6IYLDT784ZPogb66t87yrU
         98rweJ3NE7j1/eQbIHs9U+gB8tCtPb66CNJI97X3pmEZhBFABfg2T68n402I6xmIw/d0
         4j+QPjnktyaEI9/CCsfK5axsht3H2+hJyKEHiVN8Aq69a8YD+EqTUs2zrG3uLh6bsF0o
         Lrpwi+QIpR3CdItbXUl2EiBdrk/jtGsvhRDq3Ybni9LWEEA7uF60Dreh51GKQOy1NNFd
         l0qY9eKlWiD9TN7G2eDBKwAReYFTtM1sO3A0i0/Lo3PxpjXEWF5eouQcS/Lqi57SMmKw
         RcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625824; x=1794230624;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cjTkavopvWP8IoUO3Tm2DHF2lem7yW434Hge7kuVhBk=;
        b=X0BSG5mVJBnsUsvUen9OdsOYAW/7Z1gtIOT4JZcWuZ9lLzlJBoj69p9g+wMPM08T/v
         +BaOsQ+1EpAc9bkYb0JnHBwGE76XHnMs+b2To/dDbXjElnKAi0Sipn1OX6VIYgZtP8NI
         LxyhWJjnX52q7rPXZdfeRWabb/3sAB9nG4TjjlgGqjkto8KzJKNlqKPgKWeG2+sD1nnN
         JZeTgjHYiHuP7yNy1vv/JsIiNP83f4qrCLYV4aMoGiKAwUVTyzld8DIwZIB+fzfwCSfG
         rpsyX/SeVnGyecbTlbD29s58FNYYbaTU+XIJrfFSnqSWzTqcFYe9cTR+OZmoQ9/HQBZP
         oR8Q==
X-Forwarded-Encrypted: i=1; AKwUvByg9uikT1uhCxxCmZoJ7gDQh86FNvmnWVKQVVJ11R+14O608ugSd0Ce9t/w52EnykusMmiLmX8ULujTzm8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4XXBf0XDA+9247V4aMOjcbjYvIUDe6g5aM7DRaAERbFutWyuj
	XPKqdv3q2WbyD9lpYgJHKOpd/YE4fzn4G3D3nqUWRd44yCEdDWkpWgukSTn1sVTTgE4=
X-Gm-Gg: AYBFou22nwnY5S43+5aiQiMA6DJrJ96czQNvQ7CXVeogLGE+0+a5AiNtKUGSqPrX7tm
	8KmBE44WEeiMMeEWNO+o9vMv2JEEAJ4h1gxXcwZvSj5HdlLmNqgkAhCP39DyzOnJtCrtYtyo7dM
	pj7KnqXrRFq6ER06dpCKymovk1utOU4sXltcO923TO2X/q+S/xgofAzHDJ+qwxS0zcG/yi5BSmF
	lPMbZXGM/3ts0AukyrE8CC6zCnryf+4iUs2Pvq7KPys1sDX/1ZXxTKbZIrhHJsji/troUnyYK5s
	iPEBwOTSvxNu2//nijFE5HB9c5866IFG+aW286keFZBjEUkwC4NKYIGz42d0qjjwy4tc5k1lRBX
	G73G13ZJn7p7dOfKWdJNJuTTwPkLdmrMo3EOzPMoRi7pmDgYp0CZnnor5HSYzQZsnfXydCnqMDU
	Bi2H6nD890/FVTmo/fe+6c3usBy09QZMHZC1/tQzf8S8v/PPxtoq2rEw34HeHOpur4ViSmmNgGg
	DVGuQUKW6j8UmqYvanXz/vr8nEVO/4nAEKQi93au739HgJMdqHV9a0RiidnBIuUddDAp4TQG8g8
	Txax4ZyrTpBeJOcUggCpknm/3mOEiZBKf+hEa8D77suu/DJaUbZgKdLxtGzq3VQLup3lmUgqL+7
	Pbhy9
X-Received: by 2002:a05:6000:3109:b0:48d:fa9c:7838 with SMTP id ffacd0b85a97d-48e6e2bc07amr25550097f8f.2.1793625824172;
        Mon, 02 Nov 2026 05:23:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b727c6sm21994451f8f.16.2026.11.02.05.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:23:43 -0800 (PST)
Message-ID: <aa8863b1-6fc4-4c2f-88b9-c8f41247bf94@linaro.org>
Date: Mon, 2 Nov 2026 14:23:43 +0100
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
Subject: Re: [PATCH v3 9/9] MAINTAINERS: Add Alexey Minnekhanov as maintainer
 for NT36672A panel
To: Alexey Minnekhanov <alexeymin@minlexx.ru>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: David Heidelberg <david@ixit.cz>, Joel Selvaraj <foss@joelselvaraj.com>,
 Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 phone-devel@vger.kernel.org
References: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
 <20261011-nt36672a-panels-v3-9-9ea238627f8a@minlexx.ru>
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
In-Reply-To: <20261011-nt36672a-panels-v3-9-9ea238627f8a@minlexx.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/26 13:54, Alexey Minnekhanov wrote:
> List myself as maintainer of Novatek NT36672A panels driver
> to keep a close eye on it.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 252b6d7ee1638..e85fbea55ae62 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8464,6 +8464,7 @@ F:	drivers/gpu/drm/panel/panel-novatek-nt36532.c
>   
>   DRM DRIVER FOR NOVATEK NT36672A PANELS
>   M:	Sumit Semwal <sumit.semwal@linaro.org>
> +M:	Alexey Minnekhanov <alexeymin@minlexx.ru>
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
