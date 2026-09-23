Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41067495050
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160515; cv=none; b=FYYAEffYOqblZlgg9XBjqrI60AXGbCMmNTT+kWaMaFvLBPjintxMsW/P6H5s8FjYvaVeXHe633zycnShNQJw8kg6/7TZDfRLuJ0m9XjCfRE9MDyVVhXklCWNwlC3VBsQOo/4MLTCjrKwiqM2qIFw4G3TBBWezz7yFhIsb6gdXtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160515; c=relaxed/simple;
	bh=00LliydZFbWhN9/JMAzKVWb41FNb6WBNeqfGEFRG2kg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ruwI/pAIrdqnja3Wl9UymL/t+yey4BF3IGxtO4nYCRZvGrV9Rz+pqcqd7MTY106EPtlV1ZtTsjtC0IcWsI/tfuOESo9RUT57TTDgYd9NXhfSJ3It7TkBbztSGzkFNhAkuRA15osYoP96tUYw0n166FUsgbkvGLzK1tXGWLdeI7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r0IABQMu; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r0IABQMu"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a99c5de614so1076977a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790160502; x=1790765302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZdJeS2NWmvwKi1c64k6v6zLwI+NJ1nsn1DFESP4VK7w=;
        b=r0IABQMuL0y0pNWY6MK03jt7Yslr3rYLDYj5OJGgmY6DzpjbuBgQ6wRWoY85S7BPcC
         5Yezmzf+nSS/h6ybdVQAox3g74WwFYGtXU39ziG6HD4hjH/RR5ZhdxulJgfgjJt23dpc
         ZMIqUCc1tSNHSY2ikxkVh+BHdUC1hd2Hvt/JDzxC5MkzFfCU8ivV1057FVCrhIUhW4gw
         TngLjSParB4QVbZNuFr3yKIyhQtwyFjCj6GLvyzcy10pZpx55wri9QsrMSuzHHMaFKMk
         x0OdJiU4qQU0Qs6QchTf9u5KW0gZGKBxmncaUsun8xP4nMkNtdCuUgXTjSjqG9hPKlJs
         +3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160502; x=1790765302;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZdJeS2NWmvwKi1c64k6v6zLwI+NJ1nsn1DFESP4VK7w=;
        b=ILNXpnwiVZftCKZjBUpaVZ4+zx0X/30/g7XBvf5oC04uUxHRv+aM7rj8YpisMkWnC9
         kSG1UxgBjLp6QcWAjE2Mek83QNt4K4AStO7no0HmdFnr5KfDCvQsxvqWKwmHgrOexA9r
         ujysBhKPf5l8Af4UhEihsANDrP2XX8Fb+UuW8gvNJL7fPTEjC4waxF8mDeTpOXsECziF
         XIiFlrY2DWmEoBzGiqqAPBvJbPi6vVbaIYmAwezCOf/IPtezxPH+9ojkGIvZDiPZQ36p
         dNboXzEfp+Po3+nuta2WugEwJa12h1oc5lb5OdfvVSeoMa9Acx+FhvGkFXcObMragIfy
         CfeA==
X-Forwarded-Encrypted: i=1; AKwUvBwCKqO9UN6xQohRIUgRIlUHgWdV/mf1tQR5qkryPLgSRWEHSMSPw4A/p+L+7ks8+TZPWGb/a090l6Ov224=@vger.kernel.org
X-Gm-Message-State: AFuF++ld3agEirS1i+WsHUFyJxzKjphyjd4Tm2+XnlD5cD87Gv/QTQau
	F3Kbp+4++WOTrNa0d9uScjkG6w0UML0lTxylkVbCnUKgwoznp/7oVRrlKbE7lxcus3o=
X-Gm-Gg: AYBFou2vcsdsD93gSYaPh1DkCjjVyF0xAZg8VmcpNDW8S1ViEVdLU36S4513lfRFW9T
	RY0ECE8LHmRx/XQ4zgfJMa8YW9scJ2i9juRSjrrtRCtBoRwBAwG23vmpm3/ylIC2hc/710/nSUd
	T/u89w/fW630jvqLJ1xC1wBCA7oTAsPsaWGWqlkCjaD2gEKJCY1sN4/ljF9vs8mcwLzmeGwN+mk
	iVzuCBAXG5hIyfix0WCtGJ8Wrpf4qVJedRsSxiH4ghv0q+cMvKHBJanYuqYtHvGrgDFZAEhee4r
	L6oRiEsIxdXA/XEECkrSs3fkWEvYimCH0+lAcCS9S1Y0seplB5HLVSmpxMGoDvXyYqWQ5zJcXUH
	/F9OstGNDUwkXDneROkM2cCK2ljNFJhdGe8D2LuvZvQd+G77n3Hy7Y3j1OrqDINtxCxuC/upe5y
	zJFA9q+W4joFUyxcUX2/XXmC5rjhMBzc9Rh/C0XB1aLr6eQvkAouWWL6k22E6k+ePMILvTw+lTE
	92iiptoyinDB9MfABWDx6NJT9lNyeI28byNsN/rXKi0kMNl/Ra8Pw==
X-Received: by 2002:a05:6402:52c5:b0:6a9:d0f0:69a0 with SMTP id 4fb4d7f45d1cf-6aab3b0a3e2mr1757911a12.11.1790160502330;
        Wed, 23 Sep 2026 03:48:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4140:d290:ef49:44ba? ([2a01:e0a:106d:1080:4140:d290:ef49:44ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868266822sm6706162f8f.5.2026.09.23.03.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:48:21 -0700 (PDT)
Message-ID: <f77e53d3-fb80-4832-aff7-4ab1244ee4a4@linaro.org>
Date: Wed, 23 Sep 2026 12:48:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [REGRESSION] Resolutions broken after "drm/msm: dsi: fix PLL init
 in bonded mode"
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Mohit Dsor <mohit.dsor@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, vishnu.saini@qualcomm.oss.com,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
 <ae07cef84AmXK43H@hu-mdsor-hyd.qualcomm.com>
 <wrhuksrzlxw2pjlvjm37dwjuztcv7qs5t6mqiav4ujecwqdkwj@ozbfxpbgaimt>
 <CAJfMnmEVwUwt=wMJ-8HKH1yz9+erWLrRGB+6wVYCdSGDK+_T_Q@mail.gmail.com>
 <114b9be8-1fca-4762-822e-1d53838d5de5@leemhuis.info>
 <o64cxeq5f4ffqpdmbai5cvsmxei2cnw3p6acvu55xl3cj5w3z3@6o6kokszvng7>
 <akt6z1irWlXA5UIy@hu-mdsor-hyd.qualcomm.com>
 <493b8d4c-164e-43c9-93c8-40cc251b1c3b@leemhuis.info>
 <d7v4kwmc42k5ymgdt4mn2qc7dkrf5jj2l5afgyjqrm3pxterl4@guulk22xwlzs>
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
In-Reply-To: <d7v4kwmc42k5ymgdt4mn2qc7dkrf5jj2l5afgyjqrm3pxterl4@guulk22xwlzs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 7/8/26 15:31, Dmitry Baryshkov wrote:
> On Wed, Jul 08, 2026 at 09:26:04AM +0200, Thorsten Leemhuis wrote:
>> On 7/6/26 11:52, Mohit Dsor wrote:
>>> On Wed, Jun 03, 2026 at 03:11:34PM +0300, Dmitry Baryshkov wrote:
>>>> On Wed, Jun 03, 2026 at 11:56:15AM +0200, Thorsten Leemhuis wrote:
>>>>> On 5/4/26 22:09, Mohit Dsor wrote:
>>>>>> Sorry for the late reply. I am attaching clk_summary and reg_dump in
>>>>>> working and non working case. Lilliput is just a normal display working
>>>>>> with hdmi and has 720p as preferred mode. Yes, I was talking about RB3
>>>>>> Gen2 only.
>>>>>
>>>>> Neil, Dmitry, and Mohit: what's the status here? From the outside it
>>>>> looks like this regression is still unfixed with nothing happening for
>>>>> weeks now. Or has progress been made and I just missed it?
>>>>
>>>> Thanks as a reminder. Unfortunately, it takes some more time (and I've
>>>> been a bit overloaded lately). Worst case I will send a revert soon.
>>>>
>>> Just wanted to check if you had a chance to look into this issue and whether there's any update on the investigation from your side.
>> Hmm, no reply. Given that we are entering holiday season and are way
>> past what Linus expects in a situation like this[1] I'd say we should go
>> for a revert, unless some fix shows up really soon now.

Sorry I'm very late to the party, and checked again, reverting this breaks all dual-DSI setup
on SM8650, and probably other similar SoCs.

Here's a complete log of the breakage which appears on the Ayaneo PS2 running v7.3-rc3 with mainline panel driver: https://gitlab.postmarketos.org/-/snippets/65

I don't see why my fix did break this use case since it reverted the way the dual DSI PHYs
were initialized to actually allow the dual-DSI setup.

Thanks,
Neil

>>
>> Ciao, Thorsten
> 
> Please send a revert.
> 
>>
>> [1] To quote Linus statements from
>> https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed
>>
>> """
>>  From 2026-01-22:
>>
>>   But a user complaining should basically result in an immediate fix -
>>   possibly a "revert and rethink".
>>
>> With a later clarification on 2026-01-28:
>>
>>   It's also worth noting that "immediate" obviously doesn't mean "right
>>   this *second* when the problem has been reported".
>>
>>   But if it's a regression with a known commit that caused it, I think
>>   the rule of thumb should generally be "within a week", preferably
>>   before the next rc.
>> """
> 

