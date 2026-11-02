Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624798;
	b=XCQAJ0XWQu+964m/GH6ZrS/qudnc3Iqs34kOa2xfCialmdnwHr3m1DKLkVgjj9T85GYX
	 Bf5vsm4HMEXUBssGcdO4zCgtIk6VROvlbTZVuLK+6GhLHnvpQ5Ld7NEIK0iPtS4mjaJTD
	 rm3AyuJEbAKGDYGY/loqpuDTqPMlFvfap7Y89zjKIkXbKykJ/JnfIxTHK1N38npUf3Hy5
	 Dw6q5WSFy9IxyidAGY1Hzshin56MSt3nXowtAOnVkiLtdaiM/gNZ0gdTPqt4MROPXO0+y
	 OrwqJ8v7xTnagzl1TD3t6RywcJlAfA4gmZhZahG/z1lYav0uyJHrTj/ZxwZkUJhLriw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=yfR/i7hbDTZSQ2eYRf8n8O8zPjvztuU6httsCjBeO3Y=;
	b=fqrtqMt31sf0dtn1xs6DKLfDex3CV5+xbHNNK9/o7H1OYOKHGU9eNca6WrJ3f7h1qYl8
	 T95HFGllhVhdozxl0PBOnZrAscq8K4pPfIVb0HM4gYb0/w7P0Uo9eTzvgytmEKvNDzQsT
	 f7qcI7Sr/u4C5+ejw/vGRO+zQU1CbH2veGPdU3AaJWFWPzIFAAClpFIdymzC+2ZoMqWwi
	 QN9sF6BloL2tItrcnDzP8BCDNlqZp+CYgMZmbca9gYdkm3dmMlRic72z+/GrofD4oGzrj
	 9CTibyepKw37l3FyrGY7fXuhCXxkuPgXAfmGCndp3A/vA6NrlnOAlgcEFnV5LUwAMPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NWazXoJP;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8F5606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C8F5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NWazXoJP
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e10a70540so1659350f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793624797; x=1794229597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yfR/i7hbDTZSQ2eYRf8n8O8zPjvztuU6httsCjBeO3Y=;
        b=NWazXoJPsRbNkg9gG5HNX5c563DygjjMcvpsbZ0klT08nqkGA11g8Q281acxdD0YNZ
         P1FH17CebLSd4u7RZnkrmRIoEEDlMVthf/QCPoAE+u+o6AZXqFe8tNL1R5pEjLPFZyJK
         BtJvehNfXo3Nd4X/9hzNLYIt64n0LVbQvrh4xOsl8vwuePMEno/Axiv/qddmyR9HL7oZ
         XpbT1LhKeeg8H0Zw9uC7M4TWqGvzROXentxSE3gx+hiWNNB1h4oMLjXz7fE++CucsHRP
         pPvr+lM/mZztROI8oLeVjP2AUUfVWxNY/GIGM+Rj7wnRjm0pmV7b/oyvw40mIEnre9R8
         X9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624797; x=1794229597;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yfR/i7hbDTZSQ2eYRf8n8O8zPjvztuU6httsCjBeO3Y=;
        b=hWVOzbw0U7j4rnqdaGJ8i+gEBdry9g/I6SXu+s+hiD2gR2+6SFmPQ3dhiaDGHhiUpf
         awWf4WGno266t8jwRyk2ulNHCcs1IgJ7NGDzsDBszX0k/h8Vc+edMOfVZWlgA0HWBELU
         pH0XfouB/0vhjTXi77PGnqXFDYZgxvd36G/fgEx2FmrYodPKalrstEPh6jIivebJcXm7
         pGGx5FJY6LMmJkcGdVayHxASOIaOs5lG7BP7uh209nh1zDL8t79IPRKWXHvK48JQ/XBK
         ACRx8yvbS7ZoiegDgLQFVT/Z68EJcZuNOfHv2hvv9zvwoEPB9WFrck6IL/2o9yMr28dz
         Z6Cw==
X-Forwarded-Encrypted: i=1; AKwUvBye70Q6VmNmVyPHt+uB7XNLSoDyujzRyOFOOdkMHHube8YJMXCObYnJCncj2fq6zMk4Z+e0o9fFsA/aKqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxlu1CO6tWDcimj1qg5S8I388IPK7x+f8x9bqnyt0f6vTI/a8I
	B8V/vH1+JANbqZsm2P8OyZju68UR8ak1C3xLIBEnL7EKymcRDPcejTVmQJUzT//Zhco=
X-Gm-Gg: AYBFou28/yd5Zl0+A8gkkBexzciL1434Hd/UIDHFvWqzJ9X/dxTbr8XLp2DvG5O6mQr
	3pah8ooedHbeANlcUdJT5U8GFepPbFztPsbfmVwGML3clPW9DgdY4ZioNfxdWGHhcUa6DN6lx6+
	Yk6B4h8zu1qsFBrRJLm6ulKuJmAUyXWd+yusWgr4gJvm+VCpn2IjmX5iHyBlh6iMp07jTdWOmxA
	/yWgZvNdPiLn0Utp8xaE29wrW7S0fSp04IH1JzKDxKF0NLV7T1D9kusgQXraNPeRzJIQqCsf4lU
	f6xOu/fW3T1hjywJTQnXWDlvk3bvJp3KBwcbhAdQW46nRGZnYP9ie6S3JzgHhSkPd2CCEIXF51z
	nJnOGJYCsHkDT9UUMJejXwZmd2za6iL2y62YNuMJ3TbhlAx+0wvcgOeKUjpc+y4ZErrCjYnB/ZN
	gbuZPguEFCSgiM1m/6XYdOCOlo4/jBvhaP2g1uOQJzXU6WiOcSUpFEVWXyU/dVgkqQo41LFiwqF
	4hy98utXM5CoJ5+VFUAyW8Rean8F0qlz+oTILRB7GwKkCtu39Gta/Pfdg8y9D/KIRkIUpyGy6Xy
	EKUJO3+EkkVvKNMSAMUNtZfymDg5xCsGZdNzBZhOC95M5cAUSfsiExv1KS4FRYTZQAYkoPlbpe4
	d3NBf6Q==
X-Received: by 2002:a05:600c:5397:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4ac16acfceamr220111445e9.9.1793624796374;
        Mon, 02 Nov 2026 05:06:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm21696052f8f.55.2026.11.02.05.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:06:35 -0800 (PST)
Message-ID: <c456f163-2309-425e-90c8-66380f8174ed@linaro.org>
Date: Mon, 2 Nov 2026 14:06:35 +0100
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
Subject: Re: [PATCH 4/4] drm/panel: ilitek-ili9881c: do a soft reset in
 unprepare callback
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Icenowy Zheng <uwu@icenowy.me>,
 Han Gao <gaohan@iscas.ac.cn>
References: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
 <20261030-mj070bi30ia2-v1-4-a0f65b65c290@iscas.ac.cn>
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
In-Reply-To: <20261030-mj070bi30ia2-v1-4-a0f65b65c290@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 06:44, Icenowy Zheng wrote:
> In case of neither reset pin nor switchable power supply is available,
> the LCD module could be DC polarized (which is harmful) when the MIPI
> DSI host is shut down.
> 
> It seems that do a soft reset for the LCD controller could stop the LCD
> controller from biasing the liquid crystal, thus preventing the harm.
> 
> Add a soft reset after putting the LCD controller into sleep mode.
> 
> Tested on a Sipeed Lichee Console 4A, which has no LCD reset pin, and
> the LCD supply is an always-on one.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 83148c40e25ca..8b874c6f7d37c 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -2493,6 +2493,10 @@ static int ili9881c_unprepare(struct drm_panel *panel)
>   
>   	mipi_dsi_dcs_set_display_off_multi(&mctx);
>   	mipi_dsi_dcs_enter_sleep_mode_multi(&mctx);
> +	mipi_dsi_msleep(&mctx, 120);
> +	mipi_dsi_dcs_soft_reset_multi(&mctx);
> +	mipi_dsi_msleep(&mctx, 5);
> +
>   	regulator_disable(ctx->power);
>   	if (ctx->iovcc)
>   		regulator_disable(ctx->iovcc);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
