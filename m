Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004363;
	b=vBh3noPWUO2o3JiNA3vauCXvx0OuAPrdUFoTqJy4ARFMMgHFUc+oNixiOLD5Nw+n9+Qx
	 8oThTVRZp0pKbP+kLtOsGSyzdLOOgjpVacE2OzNfggkTDcKOYvusMzxh2uq4bypyJCvEo
	 v6CGZ42ddVbiDQr7apVce3uCWOrjkVJkowQLa3ZMs2Ke3vSBhQrFtKz2Gi8WqRSen3bJ3
	 XdLlWJ0nGpOc77o3k3KWXkicYSwzds9Uu03Pf9sRn1aGNXVXQFdDalLX3P1ACOAJFzH2L
	 iURo1DcHydRc2o4ENATYSI+RPPov/kKGE5CkxMjYgI6HmL4GlOIoUy/wGJsm8dKTkwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Xx6QZm0MpIiWVJS1fPo0ifp1Q7/9tPC6QD5e4OqszSM=;
	b=q1cKljbxo8t1/Fxwu4E53M3foiOYkGdxplzUWBV3vWrywZqExJbU74dKhq3UmFEWKsaq
	 O4FbW6D5JA9k7nlU44uSrMeDsI59Ebtf821bMSTPPbWnCiQVN5AsCrp0oyvNZqD8dZB+7
	 yH55EjDKULHA8q9QXJT0kRE3c2OycnjXrFmuQ8tTCfRr5BVTW1rMeIMP7fQco3HXRWS9V
	 jGvVH7uhH2T5KbHLIC+OzVNtvGfZ2dqqgMLvMg/4XkmZC6K+1JIOA8hsSzeC6lyefNU9F
	 YHtIE5UYPu/aLKAh3fm8zk8RfnU0GC6hHJtXMeXlYfmDVxm+cW1ztTPPEzcXF4JkW7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kSwkDQQG;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E580606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E580606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kSwkDQQG
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so7000305e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793004361; x=1793609161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xx6QZm0MpIiWVJS1fPo0ifp1Q7/9tPC6QD5e4OqszSM=;
        b=kSwkDQQG6J9m1MVP/wzflb5lrl7K6VKY7a23yEUmCnjWffSoeDpmFKfnQLcEwnEfZK
         XHIidVnJSdDcgPu49J/sawx8TsaGvcb8B/JodXa2r4yW7+9eEXCEOe5ezMFoGR52J3Oe
         i8JpQzguhJvcyUqUBIFlcVV6rrxkRkyRE1/6VkzY0/iwWIFXyTxCPFpgvjaCYZg7niFz
         STLxEn48HRcL0Ovleq57n9uBSjRdorLQQEypAZJ19FrrXtT3KGVkcj2bfm5rf8Z4qUTd
         DbPALoOHwrZHJX+fpA1rnKklQLQbiLlpRua787b2xR046cnmte51Ti94grxiZ6Tx6DjP
         +TTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004361; x=1793609161;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xx6QZm0MpIiWVJS1fPo0ifp1Q7/9tPC6QD5e4OqszSM=;
        b=Z9e8MoaMU9T3/s5v/JcyMB5oc5SLSpEl5CnP6Y1BCE14Tor42N46QufNkD4mHVgi5S
         71z2B7WyDfUSsnl0FayXvfzDhvwv6jmWoCPvjUaBSZq0PuwCtR4q4EAqg7Fhspw/Qia8
         h5CArtvruLy4fDcMoT+WOXbjt+r2Ch5fYr90pj5Hv+kHWGaT/vRrMpmJMp9dUzsaIVQ+
         R8kLtIvNcXs7FwSWQfLImIcc1qEk1wDGsZYD2s+bwhJ2DNDVL+aNlu+4lpaCeRtYClED
         P8tGkoQyQY8Fl5d3DyLW6BMaFuD3wrO3QSdjZqUVM1SMQRX+ddJqdweUQpm5BMPM2zhJ
         1kjA==
X-Forwarded-Encrypted: i=1; AKwUvBzIPDLBRHjCO3hXfoAUsI6D36KR8Xw4lnachhe/L5Dfwc7xI1RhdX9abY/tSlOypmk9rXTbW5lWz0OLQUY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoEToO1J8Wr8w83fYN3Rfooqx+2k0UtblDAgAZXpe8tAD8yulT
	cjxEjL8wlM/kL6q6LdS3qSx+UKwJqtJph27XubsdnA//qpfWcBbVYBv+5EM0dsyHbeY=
X-Gm-Gg: AYBFou11qelw9NujOg8n7CtmOlQlz8LDQHBSddNfAdZJ8nOUrg9xD2gxaVN6K1rWma1
	v/BX0IAXG/tbE5Mpj7dbrApQVzNhMsBBgqn1XmslyD09dVDqakOQR/Hr3sM+s5TtROEM0SjlA04
	nKeURIPmW53pKDgaR3Ozko5LLPKq68IDrfYfMpBHim1egK0ayOck6ulxGRkpm1qpuIJFiFZ1DD5
	lCtP69WGNK2l05HygcTDa3NXm7Dz7WMefJntb9IdaOmTJBbXu5qwQeaIpGz5HlvNAURzTrJA/eW
	ft+IWIAOZUualfPRzo0vf5wNPvi6mZ3N8CGlyJaa8CJN0FwJUbcN17p3rU0s4LV9791JFVkml8R
	K0YXwsHBAZ7GtdY4j5dMdCINg5l+41IWq8IfQlkpo2xzN9kZfd+OJ/RfkMjibxmxdENtLolqtnJ
	8mXIFna4wLRzZNdNk3jjAggjy/N3NsQhaReB/Ns8Jml1BpbcadW8R2Iv449Gx6+2jKAL2IIscTM
	T4iIb0M29yAu2mYCUk13PgboIQp31rq204SouS6ldf7TAudBXUsf2bjCN+tiEDpzPwL1uO59bSA
	U3Agd2rXNtYaP084PwXjXOsIlqTYv/2rQOtKbtc161F24tSB/RR7R5B+tQ==
X-Received: by 2002:a05:600d:8:b0:4a5:ef46:1603 with SMTP id 5b1f17b1804b1-4a5ef461bc1mr39933435e9.30.1793004361333;
        Mon, 26 Oct 2026 01:46:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:d07e:c128:5c21:78f2? ([2a01:e0a:106d:1080:d07e:c128:5c21:78f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm14707652f8f.2.2026.10.26.01.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 01:46:00 -0700 (PDT)
Message-ID: <151f4185-c7d6-4ccc-a320-7b77ff89b859@linaro.org>
Date: Mon, 26 Oct 2026 09:46:03 +0100
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
Subject: Re: [PATCH] dt-bindings: media: amlogic,axg-ge2d: add S4 support
To: christian.koever-draxl@student.uibk.ac.at, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261025192302.209354-1-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261025192302.209354-1-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/25/26 20:23, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> The S4 GE2D is compatible with the AXG one, but sits in a power domain
> of its own. Add an S4 compatible with the AXG one as fallback, and
> allow a power domain.

The AXG GE2D is a special version for AXG which doesn't use the Canvas
to read and write buffers, so it may work on S4 but they are not stricly
compatible.

So please add a separate compatible entry and drop the fallback.

Neil

> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
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
>   .../devicetree/bindings/media/amlogic,axg-ge2d.yaml    | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
> index f23fa6d06ad0..22decb67879d 100644
> --- a/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
> +++ b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
> @@ -12,8 +12,11 @@ maintainers:
>   
>   properties:
>     compatible:
> -    enum:
> -      - amlogic,axg-ge2d
> +    oneOf:
> +      - const: amlogic,axg-ge2d
> +      - items:
> +          - const: amlogic,s4-ge2d
> +          - const: amlogic,axg-ge2d
>   
>     interrupts:
>       minItems: 1
> @@ -27,6 +30,9 @@ properties:
>     clocks:
>       minItems: 1
>   
> +  power-domains:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> 
> base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614

