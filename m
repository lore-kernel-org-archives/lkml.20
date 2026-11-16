Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821673;
	b=kLKBMSZ4iZ0dLU8ESw2rr10oWnUqX5gLef6E2gz+FhGh3ZMDcfxjjQOTFsIHoijNVfFc
	 ya86gRw9yoyN5tFYB4YHByp35VmAIbXbF2+N4++pqQpibiG2a4XLukBW2Tx86XaTtWonF
	 nhf/OEHe+eikDiH5CqhLxvYUzxe5l+pYz0IHyCmL7kroi5kose/CPjKagMhfmow/B1p4F
	 Fim0t4CtXy2Jw6eDKbpZz+/8V/ZpZZJESVudyrxxvDNDnhKWUAXuhhF0R7YghM/ETsLlH
	 Wp/cOBZGDuHEtA8hAcuZiVFAnLP+0gnWuHdEWcHMrTbC07zGd5C1ELwgNP03hdUPG+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=2ZrA5P0wXUVoRp2VZkO2qiNI9NmJNGtWhDtxHgxWigY=;
	b=mtwIG4E5wjj0nsdPp05FDM5ggkWUZZzcIDbzxJg5DCpgwtn6YHFaDqxfGcosE8Hj4+6X
	 xAh1yExyKtw+KN9yCBC507pAEP0ooI7cwaNH3gWxLbrdAvTW+y9GTxnrU0ewtNvM68sEY
	 qgQLKm+tfbfgK1y++ZOR3VRnMq9mFgsroCALXHBMPLC8E6rgJEEDyYOT1vQ6Aq7xKRjoJ
	 L5cmjbeJ4dyktmFmhz7W+pJmiOds3Kc96aGc1UEGHlULqvmhLx85ifxz4/08fxL4sS7Wn
	 BSigs+6i2UmC5gFym8OCzpjwWlDSjIFOVnFDv2QF1EdCQZlT4xu70hJkDr//wmoa8Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L8h8c4OA;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7422B606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7422B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L8h8c4OA
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490f38e9688so2231298f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794821672; x=1795426472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ZrA5P0wXUVoRp2VZkO2qiNI9NmJNGtWhDtxHgxWigY=;
        b=L8h8c4OAG0iJGoI4SYdCQqNoB2wUCwc11dheL0EaAYY85etpc0W42XdsxcsZ/mlApV
         Bzz30yakezwte3pccClYtBUCGE3AWSUy2w4o2X+7r9EmVSfk094yNuaXOUuITyRVVoAa
         8vJtQmTBMctg2/pDeO2R163YYqEZjP/CjDd9vn28vE/4fZ0xQsWWSSEFqxG4jQOgj/38
         dguwrXdC/5py05kAcSUW0lzbimox3SC57WRpIrThthKgVeGsmyPBCgTIw/bKunHflxLN
         FoysZu2pxmTaMWtAg2fBxBNmkm0J7L2dRJ5AV/rZalDBKIBlfH5q+fzRsF19SMfTvdvQ
         YcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821672; x=1795426472;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ZrA5P0wXUVoRp2VZkO2qiNI9NmJNGtWhDtxHgxWigY=;
        b=TlBgMAbBKe0WBiFGOj3wulZvFZi6CjsV6SMvL0Zvf5VHZwuTcmZR7IWpOWnvlbNWBH
         wn/8O4opZlT4NSOelHvTyoBYNYWO1w/wctE5sfhftIAsje0LjJ8wdYHCAEoCU7ExqZnW
         SzzVuOP0ZjGd8Cihk9S37UIK9ymINQ1suAmA4/XucQ0cFIO8jVfcTMOSJUB7zkXSJgE6
         SdQmsB/hfjD3t272Vv4EepEvWi9N9p68GP8NvDK4+WEK9lGtdRh4IzyhRQp5h182oSSv
         2ODEMusOWkYozkSTBAW6YqHX9wOnelTtj8bYeozM8kl75Sd68wYxoGf/HPr7k3BXOcbq
         CL1Q==
X-Forwarded-Encrypted: i=1; AL+hErFS2s3Kc6ZGCqMeJQddt7HNA+RJe/z21H8FbFd6K3G9oi477H7SG5oB6oJXu/P2oJzVEVtV6RpC6DWM5Fs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IJE61NBggw8Wvyairb1D3ddGbYLmO1rW46HiXKOEXpMThJ98K
	BEH2bNpQpSO54hLS3PXGoTCHGKrD4eF2MqOpED1POpILy3h7U87cBK+gdKXOe3m4dfY=
X-Gm-Gg: AZFdTZfUr9OIL8zUCl43ko7VrDtaKTDSeLLuiQtgsST5eFEk7Z1O0kAxoC8otsHshsT
	lLBJTCd8SX4h+ZXE2Hil5shCjGvP944CkHVMudX2GUA0CKUumMSrQ3PKshOStUK1Zn3AiTDvT0h
	VAsfwFgjTIcUziJYqlkQj90U87KryS1WQd3Ko1vpHJFTvdiv7V/8czAIMlbwVthbXdi/PP/MmXg
	zXlEoZe7Noe806Rs2O+nG3q9yRxSxhx1gb8QfQLT29Am3MeFCNYSe4Xx2oAc6+mnOKxH5rIG+7M
	I9LrZMaRE0wbIbY+N6iANLDPUKvDD98o6mUxj2NL2OJfXpc+t0Tr8yCipLdHt9Gq/akFq2DgMaC
	0xd/KJTK5WRd7QZFXFfJJrGzJqA8cnhlZvRflJct3dKG9sNP8u1SVmHizRO+ggs9vPokcaam17l
	XW6keRR62r9w+snMm8zXSpyt0y8xJMISsKZhq3fBEdA3Hl2RKAgnGT+ztnBnTvpNU90ubYq/lVX
	Idal9YgisuFWKtnBW2fUAmb/HJlGbBGwTp/kmHAB8CBdmO+NwLW6JTkWTDBoYrKp4kwVDlio0Yo
	sO5AHJSw6MF4ojFZBZV2uBmDaGun0HNhZwRsUGdxn2AGDqFHAhDYcuH1CUqRMQ3YP1e6ezY1j6M
	R2JoNZ1Kx
X-Received: by 2002:a5d:6f04:0:b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-49c6f5e8321mr20994211f8f.8.1794821671376;
        Mon, 16 Nov 2026 01:34:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1797sm23358056f8f.11.2026.11.16.01.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:34:31 -0800 (PST)
Message-ID: <6cc41f58-970a-4a18-8a8d-dc6e7b42fe1e@linaro.org>
Date: Mon, 16 Nov 2026 10:34:30 +0100
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
Subject: Re: [PATCH v5 0/3] iio: adc: add support for the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux@analog.com,
 Conor Dooley <conor.dooley@microchip.com>,
 Marius Cristea <marius.cristea@microchip.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org>
 <20261104021700.14e69abb@jic23-hlaptop>
 <01fe2a71-ba6f-470b-b6bf-e536a1013b09@linaro.org>
 <20261107230925.5e66b234@jic23-hlaptop>
 <51eaa37a-9634-42cb-9aac-4c842ab2af07@linaro.org>
 <20261114184622.5d47903f@jic23-hlaptop>
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
In-Reply-To: <20261114184622.5d47903f@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/26 19:46, Jonathan Cameron wrote:
> On Mon, 9 Nov 2026 10:52:22 +0100
> Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> On 11/8/26 00:09, Jonathan Cameron wrote:
>>> On Wed, 4 Nov 2026 09:45:02 +0100
>>> Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> <snip>
>>
>>>> But for the other reports:
>>>> - [Medium] iio: adc: max34417: shared accumulators clobbered on CAM power/energy read
>>>>
>>>> This is a tough one, today if either we read power or energy, we erase the accumulated
>>>> power+count in the context, the context accumulator is only here to make sure we don't
>>>> loose data from other channels, like if we had a single HW channel.
>>>> This simulates this, if we had a single HW channel, at each UPDATE we would get back
>>>> to 0 in hardware anyway if we did read the power or energy.
>>>
>>>
>>> I'm only half understanding this.  Let me see...
>>>
>>> I'd expect userspace to see accumulated values since we enabled the channel
>>> rather than since last read.  I think that's the final suggestion from
>>> sashiko.
>>
>> Oh this changes quite a lot of things.
>> How do we handle overflow in this case ? we disable the channel and enable again to reset the state ?
> 
> Is it possible to accumulate into a sufficiently large type that overflow won't happen in a feasible
> timescale?  Anything else is going to be a but unpredictable for userspace if it
> is expecting an accumulated number.   The other things that accumulate in IIO tend to be
> moderately small so it's never been an issue (things like step counters).

The hardware can store up to 4.55h of data with it's 56bit with the default rate,
we store in 64bit in software, so we can store up to 256 times so up to 48.53 days.

It's possible to lower the SPS to 8, in this mode we can store up to 6211 days of data.
I plan to add this mode afterwards.

I'll switch to this and clear the overflow only if we disable the POWER channel.

Neil

> 
> Jonathan

