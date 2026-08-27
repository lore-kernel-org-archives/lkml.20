Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5326A3FFFAB
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820819; cv=none; b=gmrJmjDehFIhqC8dJ5ycSA7DZ+3k/MQkXqBnnCXwbe9HxoE7H4a+VB0bFQ/MwsE5u5ZAFelUe0K+Oper6pKzbduXjpuHhiMukFYj3QjlOHh8CioY+kZDBNYnuyK7bOcs7R0bnIp8YAOb2DneE6YehNZL4GE0JB+JlgvuKvLZQeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820819; c=relaxed/simple;
	bh=YADBMXSnCng14KUNiClp3iNmXFAtu/uigmJzZWl3z6Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WGdy4B97k3EiVQls2CpMMAPr1Hb+NBuodd+xk1nFFnHQB0zUaFdIJP8+wgAC525X5Gb4ESzZ0K5CMvUTdqbsN1qU4kVYnk8RO15Ps0Z8JzoQOfZy2FiNI6GfRjYsyefId9xyVrKTGxyYZ6yEHY6XxG4f0j1zW/pIdixylYA+aPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AyEV9n+Y; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AyEV9n+Y"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482dbe4d247so178552f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787820816; x=1788425616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVehDwDn3vUosVzDAVI89hDucj1hjpgV8XEbxurpbsY=;
        b=AyEV9n+YtptU35ft84mZWxovrUoVl36FuhhnX+MawP0KM9vCd1zEmQ65oI1eMXX2I+
         U42/3kOelm+8Y/h4a2EmApr9AUE6Ad54DY5WBKVNLoGBOwEMYDkgDcvgn4FE0MnunxyU
         zSc7pVYxkNpmb0xTNJWeXtpIHpLpkkkr53unlRpmUOMzRXsW2tF25MmRD0yrdPgqJSIw
         gQ9uwV9C0QlVTh2ortescCjWnZVUWT+cT4nTRh1VbGDgNtYIoRWW/v6uYrHwVN3sAzDp
         ZBx1439B83MTZuhxhcf+FynHMy2QpeFeckCiPoXdKEwWDRNA96/9cIZ/nl43Bp4maJmf
         ChGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820816; x=1788425616;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zVehDwDn3vUosVzDAVI89hDucj1hjpgV8XEbxurpbsY=;
        b=p2TYgA//JtQr2v6Zmry1/FSjJgnZ6htBtqk9U97ureSsUsVPpWL1LAc+N50WKnN7tN
         0IMyBPyib2rYJGpUVuhGumoTWKrUygUddaCl8hHD7iW+3Z9PsRTm2P2271mJndvLmA85
         kYXiBVV2jhU4V8sKTg1Dw7VPjQL55BLxsWP/M0Fo4mx/UPSneHPrTEy/0P0nmDP3Mx9x
         scu5diAZHtNSpaLqcZBjbcH7Pntev9CGJ96DrxNj1ulNnvy/PlETj4YFnqL989zffsyX
         BaZKHqNFEn3eCG656tf9X2xgddNfUi1mTx8l+Fnmy8zNIsQClJsqdWGjUTVaVF4/01Lo
         0Sfg==
X-Forwarded-Encrypted: i=1; AHgh+RqmHa3RvyZZa/oGWzkTZLz20uWnbKSUP6U8O7e1v2fh/y3G5p2UrUegAQRRVAwPzT70TZ5ijH/F3WBIAns=@vger.kernel.org
X-Gm-Message-State: AFuF++kAWz0KhYsWGINMRQSGZe13ub7UUjBf2AZ3bHZQDDNGFE4uaJf+
	7cpMu7rfi0NdK6XoN3Qow5M1vKW57P6Mvk0hfd67IaxCRn1w1obXhZRaWcpgmi+vS2o=
X-Gm-Gg: AR+sD10KQgwkD4G0fmGdV+rHvT/0VDjxz5PHg2kxFO9ztHwac3TPzll9D8490NVCBWs
	5AAQKpx3WIQBhAQBQ6AKfuEv/4Hgc+QCzkbI1lMMv2Z8Wd47WhrECHT3LgtDVdrTBSIDlPe6Z8m
	NL0781ggshsXOM7KwBnnZ824MAIdq9+Z+fkQbL+Y6mGw1LVxkgQ72zUP/MieM6O8Swjow1+NqJq
	BaRzpgOlWYoBs8m14AHwcsCSZqYgT4DwY6D3jBclGOmYyUBoKMezh3ZiPoI3Sk0Q1eqT/r1DxzD
	xs5i/S/0cZf6B8Zh25kFWyHxNnMvlefbIZY6nRjaEbvrQDG1S7tj9ZfkkRD6WRCu9lUCrIbkesH
	ndADknN+Vdz0iFdFNBzt8uyD2HZuurpLvCHrrC7wVlSt4B2dHawy4P9uOlHrJICy/bCpPQ8ZkfE
	TqSSHvrUwux77cyg6P0M8n8BlwzhVvByeWtEM9/cAdqaofr0OvC05iUPKz2wfBd7OsNH7s
X-Received: by 2002:a05:6000:310e:b0:482:ebb0:d00f with SMTP id ffacd0b85a97d-482ebb0d2dcmr5858920f8f.5.1787820816409;
        Thu, 27 Aug 2026 01:53:36 -0700 (PDT)
Received: from [172.20.10.4] ([37.165.68.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27a9f0esm8105572f8f.10.2026.08.27.01.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:53:35 -0700 (PDT)
Message-ID: <444d0f8f-e669-4267-b28c-697e205df51f@linaro.org>
Date: Thu, 27 Aug 2026 10:53:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: Fix typo in s4 group name
To: Sean Anderson <sanderson@brivo.com>, Linus Walleij <linusw@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Qianggui Song <qianggui.song@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
References: <20260817162212.1890616-1-sanderson@brivo.com>
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
In-Reply-To: <20260817162212.1890616-1-sanderson@brivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/17/26 18:22, Sean Anderson wrote:
> One of the i2c pin groups has some junk at the end. The name should be
> i2c2_scl_h1, and indeed that's the name used by i2c2_pins3 in
> meson-s4.dtsi.
> 
> Fixes: 775214d389c25 ("pinctrl: meson: add pinctrl driver support for Meson-S4 Soc")
> Signed-off-by: Sean Anderson <sanderson@brivo.com>
> ---
> 
>   drivers/pinctrl/meson/pinctrl-meson-s4.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-s4.c b/drivers/pinctrl/meson/pinctrl-meson-s4.c
> index 872948699e9fe..365dafe457a9f 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-s4.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-s4.c
> @@ -854,7 +854,7 @@ static const char * const i2c1_groups[] = {
>   static const char * const i2c2_groups[] = {
>   	"i2c2_sda_d", "i2c2_scl_d",
>   	"i2c2_sda_h8", "i2c2_scl_h9",
> -	"i2c2_sda_h0", "i2c2_scl_h1l,"
> +	"i2c2_sda_h0", "i2c2_scl_h1",
>   };
>   
>   static const char * const i2c3_groups[] = {
> ---
> base-commit: 3b5f4b83c4abc0c9b0a7b9e2b44e816611b7f2ec
> branch: meson_pinctrl_group
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
