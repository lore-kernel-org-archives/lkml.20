Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97A744A411
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929360; cv=none; b=QYgnNS9ZqMntTgQNE/twEaItRIrtw90McsngkQu7g2RNNGlbbiwe1/bq05zBZ5a5HdYhr3T1BHckjawSJjgpyBQXxeGnmxP8EhzWKOtswVhT/sQ3YKwBaG+PowNWJmjCCSEhpk7tQstaidrV4KPCqcmRDzlqyxsdpTHKRE5pojM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929360; c=relaxed/simple;
	bh=uhpArYY+OICqmmGKPczNWZg6Ob6IRiHXPfmlrAbRq5w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PkvJ5l0PN3fNHek5p8GYIw8mST1CIWnSon47cOF9bXm0hVkUYqqZkLwSf5G+0rkWQAuNK07PjEf7ez8YvmcsNbtMyQe0y1DIpLXLYpW+cA4ZBe0o9Yysuj1BCY+YhDaEnQz8qqPYke9erXD5HHUhIZ3raJBN8uCI+Pvl9efTWQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FEzE+j3P; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FEzE+j3P"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso54684155e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790929354; x=1791534154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXhQxjCZPJkDL/0F5UFiLvNFCGp+omiCYVv4WP26NK8=;
        b=FEzE+j3PmddHzuUTsmIbmnkCgoQg7g1V+mHcpXZ1WAVtQeXKZ6NxoZ2MYAH85x6yuE
         XxRuvR30T8x8RBz9foPYXWW/zgakVxqR98gFqbGMfGo8Z9yp4WO2MEH7Zn2ibLhnAPva
         p3xjiPD7PDbcfo0u6Dw4cHthFU46p26ZWbqodmqemcdDiOKYCFTm6nbYnXx7AeLdYS1k
         f2RSu9l9Nir2g0QX2WoX89jYLmsBZRvrwa12anYFTD7a/HR0Nx2yDtx3TzmaOC3Bz40y
         Fop2DyG6EGYuGAflUncLlB7TuOIA/Gw4wCd2I7QM6VKvMcANSy/O8XNZvwu3u1AGTfVH
         8E1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929354; x=1791534154;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oXhQxjCZPJkDL/0F5UFiLvNFCGp+omiCYVv4WP26NK8=;
        b=nZHTXl1d36ZiJLbqT3A46X9dtu8otD7jWo8t6nE4i0AEktPfJcENy5af0QSjzu8fhr
         Y8/sEt4yylhGvbfvYYjKtYmkukmHqgizeZCW6doTGH4rvhQ97rUFBHWlYVawvIFkU4CE
         o+c1k5c8qTveyLMlR9FNns3Ais1CayHjwPoULJTQ1lr7HXv7H49Riu67bcP6DVjcboXb
         9JeLTM0keBdhSiT1+pJVnpu1tHhMpgidquOqTHeX2jxkG8TANWnEukIrpiN5/pjar24I
         6hV633KJfK8m1La7fstQ40pan+dNtcLFbZeeiWmC8QzeonudDc3nyx4mZfIDX41vvG1f
         C9fw==
X-Forwarded-Encrypted: i=1; AKwUvBwgy4tjAfJhCcKkVh07cSgLm66wXxQXjoJfawdsWL/2IAUPTZL3m70I/1+hxoro0UsZ8sCk2niTWPxBDZY=@vger.kernel.org
X-Gm-Message-State: AFuF++nB/SFQVDrqIoHaby1EEf7iGwoX8KsnJGEn96/3a5+2RqL0OZAj
	a9YgWOBUZAFOSMd7A1+AdKERdOxZ/i5qxyGwPHKV4EJoRwY9Jxd4VlcF3Gfq3ijgZkQ=
X-Gm-Gg: AYBFou1L/PkSeJdBiyTV6mUiyDmwZFGJvC1k45X85l9biPFrvuxEtPSisOSJwqZqumr
	thLuY9FLG2vV+xYgrAoDPsxFPU35v1Gaesocp1Pz6YmgeTZjfqlsBmqegpCOKiCj4h9NCgdkJIb
	XbIr6/fwWk8CQJ1NAzJ2AD8RQ6aLX8+p9e9GzLiCtVH08o09UQWhBN3xLzsmexEGXi1sLqyCNBO
	ym5juSAcdM2bFjD0SCanOQ+9T0oKIwuhzIv8SZXygzVxlSKlJIIYNPr/6qnVOTMJVj0vjXkYVP8
	YhHKE7iLHE2Iai1TvSmdUd2LJXv9LYj3cuNvY3+IR6VxQ6VkDP01uL3wFw67bija98aDhm4InQm
	tpyoxbAa15mS9bR1gkDLpuAM9dW0p75NvK7AeVyQFaUqkKpkxiCOJWRkWGaQIkt95gNFKwZzld1
	Nt+h4IL0NhWrBT7tfqzh3njqtzHjVZ2L5m3SLQXZm8tD0fXgI4evgt+7j5C3NTHknMoaaiS8Pi7
	i0HOKMo1J1g0eYizFjJfLAlXK39vStDeH3JObJC79hfPcpiFx6T+w==
X-Received: by 2002:a05:600c:37cd:b0:49d:1840:4fd2 with SMTP id 5b1f17b1804b1-4a0275a1d84mr37767835e9.23.1790929353841;
        Fri, 02 Oct 2026 01:22:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2f62:6d3:721b:8c9e? ([2a01:e0a:106d:1080:2f62:6d3:721b:8c9e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027f2a4c4sm63997895e9.2.2026.10.02.01.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 01:22:33 -0700 (PDT)
Message-ID: <54da53e6-66db-4357-a00d-da27fb936117@linaro.org>
Date: Fri, 2 Oct 2026 10:22:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add optional wled-supply
To: Arpit Saini <arpit.saini@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 devicetree@vger.kernel.org, rajeevny@qti.qualcomm.com
References: <20260929-wled-supply-series-v1-0-75d0a83b4b00@oss.qualcomm.com>
 <20260929-wled-supply-series-v1-1-75d0a83b4b00@oss.qualcomm.com>
 <20261001-private-wooden-chachalaca-51aa57@quoll>
 <997cefa0-384c-466f-b318-077939946768@kernel.org>
 <cebrka4ya7u32ntiya42yx4txa3uryf5k2di234zm4enz3a6vy@xhily6qqmevo>
 <1cd249d8-0a26-45e4-8263-dd4a120fc89e@oss.qualcomm.com>
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
In-Reply-To: <1cd249d8-0a26-45e4-8263-dd4a120fc89e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/26 20:09, Arpit Saini wrote:
> 
> 
> On 10/1/2026 3:25 PM, Dmitry Baryshkov wrote:
>> On Thu, Oct 01, 2026 at 08:57:52AM +0200, Krzysztof Kozlowski wrote:
>>> On 01/10/2026 08:55, Krzysztof Kozlowski wrote:
>>>> On Tue, Sep 29, 2026 at 06:42:20PM +0530, Arpit Saini wrote:
>>>>> Some boards drive the ILI7807S panel's backlight from an external
>>>>> WLED driver whose enable input is wired to a GPIO, typically modeled
>>>>> as a fixed regulator (e.g. vreg_wled).
>>>>
>>>> You describe something else. What's fixed regulator should not matter
>>>> here. Which pin is it in ILI7807S?
>>>>
>>>> It seems you just want to represent GPIO with a regulator. This is just
>>>> confusing and typical downstream workaround.
>>>
>>> What's more, you basically REVERT the review YOU RECEIVED in v1. Really,
>>> just sneak the same stuff 3 months after like the review never happened.
>>>
>>> NAK
>>
>> After discussing this offline with Krzysztof. It's not a supply (my
>> fault), it's an LCD driver. So, the best way to handle your displaycard
>> seems to add a gpio-backlight, reference it from the panel and then in
>> the driver check for the backlight's max_brightness level. If it's 1,
>> then you have to send extra DCS commands to control PWM. If it's
>> higher, use normal backlight class controls.
>>
> 
> Hi Dmitry, Krzysztof
> 
> I have a few clarifying questions regarding the proposed approach. Please let me know if I've misunderstood anything.
>   
>    panel_backlight: backlight {
>        compatible = "gpio-backlight";
>        gpios = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>        default-on;
>    };
> 
> 1) Adding gpio-backlight and check for max_brightness level if its 1,
> 
>     If we model LCD_BKLT_EN using gpio-backlight, the backlight device effectively exposes only on/off control (max_brightness = 1),
>     we can't support the full range of brightness i.e 0 to 16383 (0x3FFF)
> 
> 2) Adding gpio-backlight and based upon max_brightness level of 1 , are you suggesting to register another
>     backlight device that can actually drive DCS brightness. In that case we can actually have the MIPI DCS controlled brightness
> 
>     If so, wouldn't that result in two backlight devices associated with the same panel:
> 
>      gpio-backlight device for enable/disable
>      panel backlight device for DCS brightness control
>   
>     Is that the expected design?

It's a great question because there's a large variety of how backlight is
implemented, and some panels can drive a PWM to an actually backlight controller
which uses external pwm. In this case we should model the backlight IC as
backlight driver with only 1 or 0 capability and use the DCS to program
the PWM.

So it leads exactly to your issue. So perhaps one way would be to either:
- call into the gpio-backlight from the DCS callback, we may need to fix some locking issues
- add way to "link" backlight devices so the backlight value can be propagated


In any case the problem remains that both backlight devices will be exposed
to userspace, which we don't want. So additional changes will be needed.

> 
> 3) I previously tried modeling LCD_BKLT_EN using pinctrl states (panel_bl_en / panel_bl_suspend)
>     for the enable GPIO itself. However, Dmitry suggested modeling it as a regulator instead:
> 
>     Link : https://lore.kernel.org/all/qkhgg5x67sijiialucvzac275zhpjrtt47a4udjpyzmgvilut5@dcrslq3ai7mc/
> 
> 4) Modeled optional regulator wled-supply: a regulator that only gates the external backlight driver chip's power/enable,
>     with DCS remaining the sole brightness path in this current patch , the panel-himax-hx83121a.c does exactly the same.
>     
>     Would this can be the preferred modeling for such panels?
> 
> Please refer to this Hardware diagram I explained earlier ,
> Link : https://lore.kernel.org/all/bade420c-aeb8-4bdd-b0cf-3ade17b21c18@oss.qualcomm.com/
> 
> 
> Please let me know your suggestions.
> 
> Thanks,
> Arpit
> 
> 
>     
> 
>    

