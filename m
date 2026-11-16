Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823216;
	b=R1dxQBgntiymSop9BpPIPVyC8gbLwO9UzFiDUq/s8AJCDIfZNf5j2y86yVfLEGrO7FiI
	 MQ/7YafJ1uVrkBy7ZbzdGer7y7cIhAEDzMAGOAzP0ziN5RcF8k/6VxlMsdQRwMMfhNixS
	 aeRtRSjHzeo1xvBENDlYn6GBUzA0az0L0L0qJtbc4CZG1hLiTKvstk43oWNPXiSzY05qR
	 lTb04TnyYoJUGdrcmV23DLpGgYVu++Rse4Fx9MncOn1pZ7ZO9CO1v6YdD+TkW/kJZgmmo
	 qGYw1NRe7fyhDu5O3X+0Ea1FZVEQ+yochYjbT+EmCLTsElhyQSXbG7GpAnZera6Xw9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=mS0n0VCms4eHAxEd2Xq6Bm0DUZuN+p1NF5Q118cCuJU=;
	b=opqq1E+Glhrez67vxODO1oLSOqOSzJ6jjw5Td5pB/68cAqN3ihXG6HchfitIsboCzOPl
	 vbrpCbcz5vbcgkqH3i13NJ/erKQ4DUlVj+jLzd6r1BwYNcp/UbVqOKIXLIC1xpvrJayWD
	 4hNFz3+kOciZ+0oOXeRGuyLMM8koEdLLioYMhR3HhxLoLjLeZA9CZwsyGS4bl76GvCvQN
	 /P1ODjIwijhuk6QAtD8iG1hJb4mmYxx6Cep1umhtHELS2MEKVEs/mM90jY+vUDLp5TOMf
	 w6F0UJLBD/cyLbQn+gG0F7UkdDUI35JYlaEuTK2AGqs7iZfHVQ2burJEkDO1CGFMppw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vEimE56H;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C23606A335
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12C23606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vEimE56H
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso10186145e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794823214; x=1795428014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mS0n0VCms4eHAxEd2Xq6Bm0DUZuN+p1NF5Q118cCuJU=;
        b=vEimE56H43Jg55t7HgEB/LzIS/rLakfMKe/pp0cuoCTuDwuPtYYUg4Mtvvh6nja5Fy
         TkNa3lt5+UyT643R4VzR2wBPKBUelTxRkfcWMtdAl8SGUujuqWVA6tHq0H39p98mM51x
         FEOtn3lBVqR+0qtSKDsSc8OGeXZE00fbpoGSJ9KD/Dxw7kCipkV3xlPSUNMOWPqEHJId
         ugUxulcTrtVMfugXrNv3CTh8rSqPfOpaCezGWvAur02ITF6g6iNaNPvDfx1y7ca4sTtW
         KgM8D4NdMsSdEhb95kYQ1VJX8VqLDJupoCQxikYEENQNeQ6qyeLb38svOTc9IwAV6IdP
         Rzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823214; x=1795428014;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mS0n0VCms4eHAxEd2Xq6Bm0DUZuN+p1NF5Q118cCuJU=;
        b=XFaKL2i8UnnLdT4faXxcrKdl0PjN3IAjhEbh3xBf5Wgqe+2Tx/YPtSRylnM8HH/mhS
         ky+DegYohJNe/A5bqUWEl2l7gKA+6khi0CcUoI/jmTYkoIfb3ps+2b2WTnU8pJBxkAjI
         EHrQPFfv9vZgbOUn+gHMq+Tcv1CqhbxdocHXglHGfuiIZQVu84/3dcW7l7LgpnvkrB9E
         cmbvFpj72XFlcwuQlgcQ/OuTOdYMGhlMJHp3wgifZwmySasAY+nss6/BYhw0L22x2fHL
         aK3ZqW8C67kre+VecEX60ha3oR9KfSnzE5g+NRQBl9g3KMYgq/J4SzXTFHNHex8ovrOk
         7Q4w==
X-Forwarded-Encrypted: i=1; AL+hErGmqQBuZqxy83y4oNq7v2EITgEYKtXuzD32azPabVeqxevqbaEiNY2Otjx0z9r/5ceakjE8+biOlvHb67g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f06A79y/jFOEIFL7Qia06h6KeHWSr4Xr8jh01vmmg/h+L26Sq
	8DPfBr8jmQqFo4Ux/T+YA1zzx0WIi1tr/AiEZvKY9dwi+1sG1Cu9ZDWFYvZMbXNNIN4=
X-Gm-Gg: AYBFou2QqVsUpeG5u15Gs3XNWrb3E0pFLE9xS2x1ZAVS2Hkx0GOdL0AXQRzhSLL6ZQE
	8JOR8DaXyw3x/u88ohHfqxa7pN3cvJbWMSqPDsKi57Jq283B9x55rZoJq63BUN7gFhyWjAoQ0KJ
	/iP5NhGBG6bIxViXNpiFFnzzoMuOfG215ZYoSxPICsMAan3jqty2NfBu2LXwEh8o0gw8tb8Xur7
	+omoF2rh+fORHhL+Qc0wOjPArByttZ8pImILBNUGLkoHeJU6xD4Pn3iUk8ZZrPLHFS+od8gFKiM
	pp9u/xDNHkJ/FyCsgzhw1j07SaVjZOIOIUsTnxQmnjakhJ7Jq4t0u6jS1fhQPz6kcB76lwATQF9
	ff2VF+/9l0364KnPmieAc84ucHqXMNYKplb+Q3aOWyLDETJvNGL+DB9SI5lrDIm/pzMwpe2ZFPn
	lLTq+kTE1zAfOp0uZKoY8a61TyWCRBYNBN4vAYe1DPiIWQomD3YJAAoDJEiXaSSHjaSjZViR9JU
	B4LoFGXjNutIGGqtWve1UcDEVinaRCzHk+o4LlB22hekQV5SrnSMFt02CGVtJsVJZ+Div9jtUTr
	CuvCjGib0HND3WuvnX+cQ4bAzHKojV9XK0n00wEK0oJcOq71yD69sTOMHW0F5cvkcV2MUSz5rPr
	9tGXsA7ZY
X-Received: by 2002:a05:600c:3b16:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb55a6116bmr218070545e9.4.1794823213643;
        Mon, 16 Nov 2026 02:00:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28c882sm375110715e9.6.2026.11.16.02.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:00:13 -0800 (PST)
Message-ID: <c458eba8-553e-4c5d-a280-918bec25b041@linaro.org>
Date: Mon, 16 Nov 2026 11:00:12 +0100
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
Subject: Re: [PATCH v12 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
To: zhentao.guo@amlogic.com, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
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
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-1-616240978792@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 07:26, Zhentao Guo via B4 Relay wrote:
> From: Zhentao Guo <zhentao.guo@amlogic.com>
> 
> Add SM_LOAD_VIDEO_FW to the secure monitor command enum
> to allow decoder drivers to load firmware through the meson_sm
> interface.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>   include/linux/firmware/meson/meson_sm.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
> index 3ebc2bd9a976..3b90b49d0552 100644
> --- a/include/linux/firmware/meson/meson_sm.h
> +++ b/include/linux/firmware/meson/meson_sm.h
> @@ -15,6 +15,7 @@ enum {
>   	SM_THERMAL_CALIB_READ,
>   	SM_A1_PWRC_SET,
>   	SM_A1_PWRC_GET,
> +	SM_LOAD_VIDEO_FW,
>   };
>   
>   struct meson_sm_firmware;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
