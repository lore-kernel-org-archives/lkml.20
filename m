Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217945;
	b=YR2XHqEP8LZ1ro5SrL8ZhfmUchE+TPtcM1V2dX6IgDjCLWm4xo3niGsHwtmgpP98phtG
	 ADi0S71tvbc/Z9/tIG71ArAScufovCX6I0+y+GCj9ip4O/SaHpERoAOpFAz8Ao6jCDTlj
	 U4thX3Cgi5V7Xp9LfF4qD8KQQ8n9wdVbrav2732KsE2Ko6n/Ts/yUXESQv9jdKJNEZWJw
	 QaHbMKFDsxF6/uauAK943pflGdDyHl39gNl3SNvTDlW2/T9y/hn1ohYs86SO9ojgKKSv+
	 GhnJjyuHpgtq+g8SBnIYjYzafTZ3P9xXOrIRCiDU5uIdBbh1drvnWQkKH+9+yoamZmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wtoCZMcVn2T9YB+j55mhrbVUyFtxMXctjTorVf5q3Y4=;
	b=2hSPZgDxOoqx6ejpU6MZpJHegVdh4LkjtHMUMn1MINlO76G9rgKa3RZO12x4CatoCNTy
	 dGzUsS7W/ngt/KhdBexmM5XvrqQvX62f3DpzGuOLveiTxoqh8poKtSX2MZW42zwt4hQDA
	 bOo/3pzVuTzI/1Qfj94HaRI+LMP7w5ItuvRicF5KmPe2TMaZbRFYQ6SGTYumprPTkzyIx
	 GkfnG9G7HWpLKpijbr8r/7NknHRsClRcEMzKUMFCzluWn5rKBqipi3F19nDQ4Cb0kF13e
	 TSryu9MYz5j/v2clBIU/r0SeHdUQkBUkDtWrQ2HWuVY/M0a516qqgkqgr6EU7w3mJtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nJ5FeZwy;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5C8606D802
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C5C8606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nJ5FeZwy
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e10a70540so377902f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794217944; x=1794822744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtoCZMcVn2T9YB+j55mhrbVUyFtxMXctjTorVf5q3Y4=;
        b=nJ5FeZwyu5udRK6QHO1ZH8265aQKl07zwAD0rqFlT+v7K7Xz6RSKCyxKTd0SmMc5kw
         /2IToIaHSYBJJnrp2VaI3L+0SYoF3eNrwzm7exCOhiKOUXgyze/S23B6DFBi3LN/HhW/
         UoT8P3gl3iGOSTD83jFBhzMufriexVwUB22DlabS/L4RaKSE5EdF6KEthjE9MSw5x8NV
         12PbHjIRCpMFgRayD3nApzQCtil1dHlSyqpnmQcidgsjC5CAGUsDKwMBFz8lYCwiFLvj
         4tHoneMTDio9tdnLDTexY+E0QlUAsgWNIqNADu6s9SfzH3fUh/K/Hghgqntn0rqX+bMP
         QjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217944; x=1794822744;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wtoCZMcVn2T9YB+j55mhrbVUyFtxMXctjTorVf5q3Y4=;
        b=bM1nWkXU+jgkVNU5/oMNotbgjhRuldySC1rppHSGNMGNgkv3SL/gRu7xdJb+38YxVb
         qoWJaZkajwl//JH94CjlgvTCENwWNFnIhrx0ChhsdFly7F9joIWC4SSXp/BnnwlThc1A
         phEEVTW4+2k7fwjkaCHOaD7lzC3wTxI78jCJ0z0z01ZJ+G8xiJ3jL51bjMtFYNEwJTOB
         99RdMe8fD3m1WxSTtBLmGVZ4NiaWwOmQfF6tlslBlBXhBVZH4LOtBf1w5Zu0oGmq8ZXN
         5mCBkV9iXlRzPvPawWvSrbOSkXBRiW45k4+DK2FGUgLZDTKl3pi5J4asMsUa3gPUtKwE
         1PFQ==
X-Forwarded-Encrypted: i=1; AL+hErHaeEB8NJaea+pnWujH4zRnB2hxoHlPWCVCV32oHAa7Y529Ho896bULC/4t7n4aC6r3cVwcrF58wVAaKok=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/5gmfPfGubbnmTc/RdBSVIuE23iKgSWVzvxf/dwP9ZwqVRoyY
	/WY5TD8uAQIh/+E3cpjuJRDDm2cLWj6EcI982rxTlnDBXOnnBr61mWRHeQcraxxJ5tE=
X-Gm-Gg: AYBFou2+XzJbTUEMSW/QOFLkjVosRy4eCKjRq2Vpq310eJDielQpGm8OO2E492w1OAc
	t5RJ4X3o/PtqhZDUyq6cPF/0uJ4+vE37uA4trL0lG+jzb5ItbFiO8IYvI/Dw8OdcE2ytpt+UN9b
	gst+RFbpG6bBbDWrihEx4h6Zw1Nr5It+1XOyJzzST64jhUukb3YaFpUHrY+aQ2EZZMM+BDDIqze
	zzyvTRoVnMZ8oFG2N0rfxxxFW/LCfz1X+yRvaRUAs8GQH/Re1tvlXg8FuCtoKwmrlGiGs54lOqz
	3gKM3ga+BHsIehxZzeTbOp5CoUcqB2JHuQD+/D6RHbBf5sDNM5gu2mxIwIcRS20n2g0v6En8x1T
	6kY7/tyHdKXWzgA4flJklPm2xYGUNhd6Ghs8AmKYrJeEcWQeKekmW040wu5Hfgdde57tEEb7dCq
	IOqtlDHYqzD5HZ+bfTTJn5YURjcdoXVetQxjAHjAtTXLhPy/rPmCKfs6QH0jtbqbCr3z7wm7gzl
	ApszyWDitHseK3UgyzrwGOOnXb4fM3WYQkA38RxecTjAMrI48gc/AqqyMbZOBWKyVRZPK3HDQAp
	RT4pdiGZDqN4CEbWa0bHj4vUWY/1jIvlZHSxeMRfZI0qgOblq+QPxsS1Q5bTQXi9vdGSLseLwdo
	hGipLpoM5
X-Received: by 2002:a05:6000:26c6:b0:48e:66d0:664c with SMTP id ffacd0b85a97d-49582e8e524mr7178441f8f.15.1794217943707;
        Mon, 09 Nov 2026 01:52:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6762:47bb:1e06:ff70? ([2a01:e0a:106d:1080:6762:47bb:1e06:ff70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959011c995sm8903729f8f.0.2026.11.09.01.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:52:23 -0800 (PST)
Message-ID: <51eaa37a-9634-42cb-9aac-4c842ab2af07@linaro.org>
Date: Mon, 9 Nov 2026 10:52:22 +0100
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
In-Reply-To: <20261107230925.5e66b234@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/26 00:09, Jonathan Cameron wrote:
> On Wed, 4 Nov 2026 09:45:02 +0100
> Neil Armstrong <neil.armstrong@linaro.org> wrote:

<snip>

>> But for the other reports:
>> - [Medium] iio: adc: max34417: shared accumulators clobbered on CAM power/energy read
>>
>> This is a tough one, today if either we read power or energy, we erase the accumulated
>> power+count in the context, the context accumulator is only here to make sure we don't
>> loose data from other channels, like if we had a single HW channel.
>> This simulates this, if we had a single HW channel, at each UPDATE we would get back
>> to 0 in hardware anyway if we did read the power or energy.
> 
> 
> I'm only half understanding this.  Let me see...
> 
> I'd expect userspace to see accumulated values since we enabled the channel
> rather than since last read.  I think that's the final suggestion from
> sashiko.

Oh this changes quite a lot of things.
How do we handle overflow in this case ? we disable the channel and enable again to reset the state ?

> 
>>
>> - [Medium] iio: adc: max34417: missing 1 ms delay between UPDATE commands
>>
>> It's unclear if we need to wait 1ms in CAM mode, I think we should but should we block
>> from the read if we are under the 1ms ?
> 
> I'll go with probably?

Ack

> 
>>
>> - [Medium] iio: adc: max34417: scale truncation and mJ unit in max34417_read_raw()
>>
>> Ok this one may be real, should we return Joules or milliJoules ? If so we could
>> fix our precision issue.
> 
> Units in the ABI are joules, so if you want to return in millijoules you will need
> scale to incorporate the extra factor of 1000.  Hmm. The comments suggest
> that today it is using milijoules?  If so that needs fixing.
> 
> Our units are a bit messy as many years ago I started with what hwmon had before
> concluding they were tricky to keep insistent. So what the base units are tends
> to be dependent on when the channel type was added.  More recent ones are the SI
> unit in most cases.

Ack

> 
> 
>>
>> - [Medium] iio: adc: max34417: missing UPDATE before CAM in max34417_setup_cam_mode()
>>
>> It's highly improbable, but I'll fix it.
>>
>> - [Low] iio: adc: max34417: reuse max34417_reset_smm() in max34417_trigger_smm()
>>
>> I'll check if it's worth it
>>
>> Thanks,
>> Neil
> 

Thanks,
Neil
