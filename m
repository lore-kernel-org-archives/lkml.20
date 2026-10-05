Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159D043E06F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791192477; cv=none; b=hZSeX32Oa6uikX45Cy22UV4ocAb8472bhcek+EMiRoT/L2urL/XVzTS6qBG5Ryd/xgK74spSIxuWm8NskopKY+cL0BGmcW2L+zU8k+TfrtfBSnF7qkeb374HXvVcrtf3tXJ+8EfjlazU56DMBFVSiNrezGMYI5X4JL1JwPdChI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791192477; c=relaxed/simple;
	bh=n+MNQ8jx2vDcJDj5wuKH0CEB4xVHHmqfqr4RxTw0l6M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nJ/DAYtTvPtFDgPsJBWf3d6Jj5PrmSUaxPqSaeaNL5DLai569ujEKLAS7pBqzq3nYKWnH45G7+4gADRuhEKMZ2mFBg+dMTfIkCiW8ObiYxF9D0rw23y2wBSV66PlUckf9Gt7NtIdFSAsf/a4Z9YG2VSesGcVM4BoQA970mADVxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vaxFGghk; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vaxFGghk"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so9890705e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791192474; x=1791797274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rLD6lFejoN0T8xG1+fKNKHQcEvhqJXDjenF0dJEnUA=;
        b=vaxFGghkr2D8O4aboLGbC09uHkehC12Q6VAtaiOgaMgc7oExRAf4yf6RAkSKlTMQny
         +SKAbf7Eh9HyB0JiFuX+j6ku5o11RMIHbMst2Yf7kmt5mxdlT69ZPBh7gKo8uzXBnMcY
         B9nRbhimU6Xr71tuaRKl6azJI7vUKZ80rE19NWPgYT6qPxPp+hiZkJuS1ZuvIL41Cyiu
         p5LanmFpEYikRwQItscPpGb+qiI2gLCISmK7nev+D6fv8Q4AWVVy7pv44YyXFvIhe8Bq
         G1cBCv6AydOHDLaVjkySVDW8Xo+4JjHs27R68JdYV9TClzqe4xiyo9ImmgnUMwW8xe0h
         KYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791192474; x=1791797274;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8rLD6lFejoN0T8xG1+fKNKHQcEvhqJXDjenF0dJEnUA=;
        b=Ah+XIA9VVl42Y3tnVdnceBJF52SDhB/G5pxTuKO/nbaLrZZkkx1vlXxUm7drydzgRT
         XAnbIA1Ra+YwuiRdryIknKY8lGfvHj9likMjd6h0XbGpwW9PWCFl+rn0w1KfsjlBNQYR
         3KhFhkACaWGMvHooVsm2MhFK3DdXNOhY0b3NyZ9D/t9s2mTjqnNrLIlfOALZsCtd/l0W
         X526sDD/EXOhRLFAi6H/9bDJ5VxkxP3bJXGS18cAcCHvOv4bNVGz/7oeQvIxyb61QLYH
         WsLn5cRyiVjX4cUeS+0XZFkcj8tdKOrC0YrvQ7rp5wNftyjOVm5VRZ3scrR9Q1YgKydV
         eVBg==
X-Forwarded-Encrypted: i=1; AKwUvByNOr0WOxBHi+UZgfqJgHpKmg9TcKEJ8Ls1J71J5TQtMuIhourXEsY46+B1B5zy+kt7KRuBGzNWyHghayE=@vger.kernel.org
X-Gm-Message-State: AFuF++lPyIiNE9AH7/E6DzTP+VPZbjYPpmCUqXuc8IFgqoIvEuItclDe
	MPY3ac4QgOToX2ir8WVQcG5PLwzAc4/8dvQFF/3Pgay8TjB/JnepMssI/EbDpuAq3Hk=
X-Gm-Gg: AYBFou0RFAjnRiaTA5v+TKED8VqVnil95tcbRiWFm8Vj1nYofdqanXGAnsNrg2a0Vny
	YRmEN/zjt4DMkUaSlCzz/9iOh3bDUA6/GW47w+V9tktY10asPeeOjWO9xvg7ok0GmXyCUsCe4wE
	LMyV3g8ocWiwXZxuIF2NZyEGw61BeinRVVUELrJI3CdzrYZCALFSwHN4PXU099wbI7feEE51qeQ
	m+Wy9HcaROlTWl4aOfj0Yzi35q8S6y1lDIs3nQb7DaYnc5gjmxHQddUGsthbrCwGT6TpRAIs0EG
	3rzsYBoxrk4RpJB+CzNqjmwdxT6dEdOqz8Ij1nczmpNRoSxTI4YG28q7nhSxPV8zE6u4259CQW/
	9VFaELGOtsq3guzjALjwxXtoKa2kJQJ7G1Am6ZxCWOjqJ5Ab34xTbcGI6RSSrP7eXzXesji8zPM
	5ekTa+sVIHCeGJ1VJpDFkfH4OCPapkGeminhjv8fpicChd7mOS0eNxiqsdtfXFBKzIavH6UroRd
	1TDkUmt3WVMwCCZgJhQn+3qHtQi1GA=
X-Received: by 2002:a05:600c:468d:b0:4a1:7093:409a with SMTP id 5b1f17b1804b1-4a1709341bbmr63938175e9.27.1791192474107;
        Mon, 05 Oct 2026 02:27:54 -0700 (PDT)
Received: from [192.168.151.46] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16620dbdfsm221932725e9.0.2026.10.05.02.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:27:53 -0700 (PDT)
Message-ID: <9be89803-974c-4746-8af0-a13e5a19fb33@linaro.org>
Date: Mon, 5 Oct 2026 11:27:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: himax,hx83112a: Tighten
 compatible matching
To: Luca Weiss <luca.weiss@fairphone.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com>
 <20261002-hx83112-compatible-contains-v1-1-d558635ab7fc@fairphone.com>
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
In-Reply-To: <20261002-hx83112-compatible-contains-v1-1-d558635ab7fc@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/2/26 16:49, Luca Weiss wrote:
> The compatible was defined too wide, we just want "djn,9a-3r063-1102b"
> and nothing else.

Can you add Fixes tags ?

Thanks,
Neil

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
> index 2c60d0cd704e..3dd9b25ff13f 100644
> --- a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
> @@ -18,8 +18,7 @@ allOf:
>   
>   properties:
>     compatible:
> -    contains:
> -      const: djn,9a-3r063-1102b
> +    const: djn,9a-3r063-1102b
>   
>     reg:
>       maxItems: 1
> 

