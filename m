Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF034A1DF6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263443; cv=none; b=a+7riPPHbkRRmpbHcv/NVpwQnSzUUqXF6H0m0IKwceKrY55pPjwUHdcsY/IM9FQNizh3nWv10F7mXHVQ5YuKVqzNbdt0GoA6u6QwFEiM52r7CfLyZQo9o7aaMHhBDUHa5mGAuw1VncE7pAwdpuhhSz/IIJMX0YxLPNVTIPhjCb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263443; c=relaxed/simple;
	bh=IzhOLVKsqwgB42QUPIej0sfnAYJnOXzy1Dnq+Xf7mcY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lcW2izRn3tiOAHCzAtFgGKPvnzRlGaz1HWdRUEhEabR/SUH1mOxz7CYmbD0FLUgTCowBAln7JHBo6VzwwUM0fgM6xqQ3wHEl4ARFclpPIXPSjExVYRNaUECTWPsCeDi0QvulxjtQ3qu0Uvp0/lcpe9XZXnsoZ9hbJIQCgwBr+JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B94/fXOi; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B94/fXOi"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso16573765e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790263434; x=1790868234; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q9PzBhkbr0buW5EMvI92IjryNXR5uhHKomis0hHXcI4=;
        b=B94/fXOiPo6OTzPloYqIkF3vB4MRG+dKGTaLQ+sqTe5PoNYEa+O08bi7wMF7z5kKui
         vW4VoEOhF6r44jLQWLYpkMOHQQBqlyCp4mc5XmfX39Yth4XKy3CYJ/1PZ/WPHs+cA9vt
         586ianz1GYzE9xR4YYuWsiddl0q2Tu1hr6f4fqd6t2yrnMxZeTrwC1RNkVTZSYXnx0qY
         GQTNhe092Wr8Cz/gIuyMvI+G3U4YGnXC+x6y/JP1FQgEDq3AXO/xfRLWx87nnRv+JLaE
         pwiRJxocUecgswQF789l3PUe5hVozzlV3Kxc4vU7+PxBKvfCGxb6IxvlMLSU8CqisYQ7
         jLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263434; x=1790868234;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q9PzBhkbr0buW5EMvI92IjryNXR5uhHKomis0hHXcI4=;
        b=qdazkbhZmr/YKFznTOGLlE4OcuA9tWneY3rKyXI7av+tiLFmtHpDh1rmPxYBbFN2zx
         I4oev+IKnllDeA52ZN0mCSOhobcjezOh3oUfbcJ4B3FxUkEbWvutXPe+slxzFMV3laGZ
         oUwdQ4G0QVRHP+omlYY5BvgyGv4R4d2bHTqPF5GDvCfaiDEq4vEY0NFjplqchZvazlVx
         CvPQqJfmsqmGsJVWKR65zhHlV00rz5jnDuebK8xf2Ga2vvC+0QApwvggeIAZXK8dffIS
         Bw5JmAocJRmoNXZ7U4ZAFuPswj7SmnwW1hMajKeOt3LW46EJDcnRud5dN0TuIOMcxrcW
         XMhg==
X-Forwarded-Encrypted: i=1; AKwUvBxDOkra8ZpqAIJYguxCISYrdhKrPI63yBBR82aYKUvr7+jpVnnOEGotMbSokoqI0dpjxj1vPSIP7Lr2EPQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k8wzU6ozd2WRiA94Ae0fo+oDPJrzBgxGmpEquAbmwOcNuOr8NJ
	35ku9xv0gphGnee2cXcSMJ1MvBrxB6DozP0wor1pwh2ZuaKBTQx+3c7kfPp8xSdlFfg=
X-Gm-Gg: AYBFou0A4klh/FFcV5e2j6uQDS8TACcObOWvqUFd74mqyIZrFm8K1zK45G/alXfrpRq
	gXkUSv9JZc8qN0Tg1FmQPEWxHaiMDCt+1ZluVD/VF7bBhy7cVGQm7cqRwbtoMADXpNU3ZAtHHpq
	STkKkTxTVNRKb9kfJtYf7u03RDTlKJc2l031z8dE1+VoU0M46gZVordRC8z7A/QC12lPXy+mywR
	MuYJMs7OBxryhyj8JrEY2Pkja5TMCzXdu1JcriIRdQQO3+dkOVtrXF1O5VaRftnDFK4vmtoQSil
	asrw9SOe/laxEiqv+9QOYQuSrnODMLnWNJOe/16jG6tQdQ2wHN7gAR7dO2E33HOk3OIlYlmQoXX
	+F9MPqVXApOMR/tRVZZCERGVTcQQQAF+TL/lTZ9HlC6MYIRBsir4g/nx3XeS+8NuQunIzHqE0uo
	AguHnsNlJTvCR69pIFZNnshTA8kVTN7GGiLiktHHUMqwSvdjKFuPCy+aYZBv0PcXZquBD7ZoZAW
	P3VweLDyTklkcjn1yTdpnKj7BSUXgCQ8l/66WLoZv8Ss2rstAkWgQ==
X-Received: by 2002:a05:600c:4e86:b0:49c:dcec:bd27 with SMTP id 5b1f17b1804b1-49fe66cb868mr47177865e9.8.1790263434520;
        Thu, 24 Sep 2026 08:23:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b956:9fee:508c:ebd8? ([2a01:e0a:106d:1080:b956:9fee:508c:ebd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm116649845e9.12.2026.09.24.08.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 08:23:53 -0700 (PDT)
Message-ID: <fa02f447-21db-4448-912a-aa39b26f364a@linaro.org>
Date: Thu, 24 Sep 2026 17:23:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] iio: adc: add driver for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
To: Joshua Crofts <joshua.crofts1@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260923-topic-sm8x50-iio-max34417-adc-v1-0-41d4ba1bfc41@linaro.org>
 <20260923-topic-sm8x50-iio-max34417-adc-v1-2-41d4ba1bfc41@linaro.org>
 <20260924095457.00006ed6@gmail.com> <arUxl7QeiEzFlI7O@ashevche-desk.local>
 <20260924171220.00002cbc@gmail.com>
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
In-Reply-To: <20260924171220.00002cbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 9/24/26 17:12, Joshua Crofts wrote:
> On Thu, 24 Sep 2026 17:20:07 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> 
>> On Thu, Sep 24, 2026 at 09:54:57AM +0200, Joshua Crofts wrote:
>>> On Wed, 23 Sep 2026 21:10:23 +0200
>>> Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> Joshua, below also something to you to pay attention to on top of the good
>> parts you covered already.
> 
> Thanks! Unfortunately a v2 already popped up on the list today...
> 

Just ignore my V2, I'll apply Andy's suggestions in a v3.

Thanks,
Neil
