Received: from mail-ua2-f41.google.com (mail-ua2-f41.google.com [74.125.226.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB91E3D25B2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790795941; cv=none; b=SQai2l4aHXGbPWcCz9m7vYIXqYQOzmvLh1DbBWusjA5wHkh3I31Jef3rU2OyPiFCXbuC54lXIeOhdRwOHuhLI7MBa+gt//Y7GGbae1B3Zh8+F2fiUvuD3qjkjrjTDqyQ8ZDP/JJRygeRJsKba3nfBkOKHL0Ut6m8tON0B8rVQNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790795941; c=relaxed/simple;
	bh=2PSiMnbjqOI1HWeoxVXaHOVt+8gykEe0sZuMk2HC+yI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gZWjOIrAAS0Gr3kVrPh1+n6fB3s75vo0wJ23w1lFKKALPpYMr6b6GAhJygFlm//Po9OWqEW6NeWSdV2r850LF4z2krUifSH+Hum8Y+HLEjz2jBkyygirYt644DvrCUmLE5jdkxKWq4V9b+IoLNGkckAmo3jrRZ+Ku58JqalUcng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kL4zPvdk; arc=none smtp.client-ip=74.125.226.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kL4zPvdk"
Received: by mail-ua2-f41.google.com with SMTP id a1e0cc1a2514c-98a100315c0so213265241.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790795939; x=1791400739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ewIF0riMHpbsIkdRakHTnfj8HYILpZHHiLSDM7xGPeE=;
        b=kL4zPvdk67AhDPt8LvzxNcstuUOF5gUia7fyoEQQo57HiVy9JGJoakqfvEyUjvjV9i
         DAjwTD7zsSzdWztzqIckN8n2i2sNj5bmnw6Ha4YWUj6TgpiszpS9IXAOhVINLIkHVoiK
         pzfbPBnbL+srlc+g4Igm/f6zaR++oXaVoMm0XhmHE85hzpkeFm17hL5dCpStZZqfz7ml
         /2jQD8OdRCBBZkn1P7dYq0bQGfZvIqLE9raN+7D4tBEC8gLWF11Nx0IOB6epmiemKri8
         2xvfcFvVkk1U8dHs3zHqFzn83CM/YN5Ri3wqEYzWfSGttYjBnYC0wP/cl4nJRtrWkjoz
         VlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790795939; x=1791400739;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ewIF0riMHpbsIkdRakHTnfj8HYILpZHHiLSDM7xGPeE=;
        b=hpDC/S5erJiqIIzJRatJ2HIGGFsM07PO4HxCbtscbZvtU7h8BtrmFoHHmVfzBW15Hg
         1XlSjLSpOWc4DpLhXVnE8VxtA2H00rbrSEoY9RuyIm95rvXflcy8DSi37h5GrflMkryn
         eZEgMUj5JjvaSUSfrS6pX4hDAvABHa3bdLII1i9LFaQ0xFwuPyW56kqsYCavT4RHvuFy
         bPojH/eL8E8XkoVZwBE1+BGbvpykhLAgFY+1Sp5iR51lBuoHCEKdVWEy9aw6wACQJzZm
         pzWNaHwp0qZeASz8+NzeAQ6NjzwbYlI1PbaC1utAR7uarIt//sA7oWMMPig9nadLY3bm
         cLSg==
X-Forwarded-Encrypted: i=1; AKwUvBxlrDZepGlLuS02/AMoURMXgFIKGKycC7sm0XyYxnlZ5CVsuB+c8Qwb3ATag8QzqYSNohMB7Qmtwy4A7tQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIh248bMMO/98xeAABRuNd7p6s6Oos/XRAUKCog853p14cbHcV
	HR3/WFCN5P05unjoDktQlC9oOc5sPXmmEPFvB76lZMmO/L7UFoLyowkoVg0p3rIIIeY=
X-Gm-Gg: AYBFou0h373a0LInMoFonEFR6ITkop8k3OBC+1aHDtso6vQ8YVQ+JAwnvuFMPgkBtom
	S8bUcOtldGNFJzFsNaatIpOqAjmI6abUyN/9Q1PQ7C+KHpQQiek2l5xqTAMoUfe/rg+xY1y7NPm
	aUDMIzbhCtYg+NDfImEiqO7VCnLKfEsHYNk9ll+UqtvP9QyqCsg66abdoJToZSpzYrOBfJ8SgPc
	nPBYenCgmajUpv720XjhR8yJ6vpaq8ylg8l0Xh/OBVFIIwkiibvTbQjqcqXTFG+aQUGEtySlyKj
	RoYVR5GgXChvB9hOp6PR2pzztY+GGIVivbq09o0n4nzKoi9pj3UHbkdSvbHUiJMKFjjYOn78Ah+
	3jnwn2I49gbsAVz+qYY9swr3JBqmZXczB+a/hghDbI8a7RZgD5ZlguOkWgB9WCUZrP+wyrEWZOf
	zkDNk0bmfc3ZmTBuUP/an2CzQICuO/zlWb3LwE2wAOb6jOp7Ye2Jm5JhqM7NsszcBDMiNQDUIcE
	0+jyfFJsWeWgUKDXJ9USRXxdVH4QQaK0C7x2yDblpObOPrseejvHCBTEKrFUFOWip7320iNSuoZ
	WmTURrk=
X-Received: by 2002:a05:6102:9d8:b0:7a8:15ba:c509 with SMTP id ada2fe7eead31-7be622a2858mr567244137.1.1790795938407;
        Wed, 30 Sep 2026 12:18:58 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98a870e08d7sm819586241.9.2026.09.30.12.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 12:18:57 -0700 (PDT)
Message-ID: <4d053234-06d8-4268-b60a-2fccc78da654@linaro.org>
Date: Wed, 30 Sep 2026 21:18:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 5/6] dt-bindings: display: Add Synaptics R63455 panel
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jun Nie <jun.nie@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
 <20260727-spotted-winged-mantis-7aa1ce@quoll>
 <CAD++jLkX0m6_GJd4Pd1Ko4tghta4AXQ5ALZpLe_x-3xxqu1Cvw@mail.gmail.com>
 <668e83d0-a017-4f59-bc76-bf6c9a80b5ba@kernel.org>
 <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
 <bc3e618f-2e7a-4439-9466-8cd9695242e5@linaro.org>
 <2lcpzwh7fxecpffnakpnp5lecrm3e6u64ztat7cd75nuxofxa2@clj27bzgjy3r>
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
In-Reply-To: <2lcpzwh7fxecpffnakpnp5lecrm3e6u64ztat7cd75nuxofxa2@clj27bzgjy3r>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/30/26 21:04, Dmitry Baryshkov wrote:
> On Wed, Sep 30, 2026 at 06:43:47PM +0200, Neil Armstrong wrote:
>> On 9/30/26 09:44, Linus Walleij wrote:
>>> On Tue, Sep 29, 2026 at 3:35 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>>> This entire binding seems like stitching two devices together, which
>>>> might be fine (I don't even remember this stuff... two months old) or
>>>> might be artificial grouping of separate devices.
>>>
>>> I think that's a good point and fair pushback.
>>>
>>> Neil and Jun talk about it yesterday at XDC (1:15 into the stream):
>>> https://www.youtube.com/watch?v=6tNGW8PoSzw
>>>
>>> The current binding does not reflect the physical topology of the
>>> actual device, and the bindings need improvements. I have a feeling
>>> there is one display controller with two physical panels.
>>
>> No there's really 2 controller and 2 separate panels, but they are not
>> classic panel, they are a pair of panels+lens which are in front of
>> the eyes which forms a single "image" for the brain, so they are
>> technically a single display and requires to be hard synchronized.
> 
> Yes. However this approach makes it impossible to share the code between
> the double-panel drivers and single-panel drivers. I think, that the
> panel driver should still reference a single glass+DDIC, while letting
> the DSI host driver to handle the bifurcation.

Yes, and no, it must really be considered as a "single panel driven by 2 identical controllers",
and even this is really purely software implementation issue.

> 
>> The R63455 is designed for this exact use case and are only supposed
>> to be use in XR application in pair.
> 
> yes, but no, but yes, but no. I mean, nothing prevents one from using
> this DDIC in some other usecase.

Seriously, no, it's a likely very very improbable situation and
we need to accept to ignore things that will never happen.

> 
>> See it like a single physical panel with 2 controllers which
>> shouldn't be used separately. While technically a controller could
>> be used to driver single panel, it's likely impossible Synaptics
>> would sell this IC for non XR applications.
> 
> I think, this was causing an issue with the DSC too. A normal
> bonded-DSI-panel-with-DSC and this-double-panel require different widths
> to be programmed. Having a panel report real resolution would drop that
> quirk from the DSI host driver.

This is purely software implementation.

> 
>> We want the both panels to be seen at a single big panel because
>> physically the human eye will see it as a single display.
> 
> That's the CRTC side.

This is purely software implementation.

> 
>> Describing both panels into separate nodes would only be possible
>> if we described a "VR display complex" nodes linked to both panels
>> but this would probably be solved by actually describing the "display"
>> linked to a DDIC controller and is out of subject for this serie,
>> and can be added later when we properly define things.
> 
> I like the VR complex idea. In the end, you have two modes which you
> most likely might want to support:
> - L+R, having double-width CRTC scanning over a double-width framebuffer
> - Mx2, having a single-width CRTC and a single-width framebuffer
>    displaying the same picture to both eyes. I can imaging that knowing
>    about L+R might be an explicit opt-in feature of the DRM interface.
> 

This makes no sense to support both modes, and this will never be used,
and anyway this is purely software implementation.

We're defining bindings here, describing the real reality, not hypothetical
situation that will never happen.

Neil
