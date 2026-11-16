Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823224;
	b=Lk6nhmn52tuqQ8sXOfD1AaajDttqO/j15617BcN4Rd1RlaJ5LyvMJca9QI7uUjY6dc5T
	 MFSaJEFo8k6l9um23p3KhgY6g5VUc7ZgZ4c7ldYttxSJ6WMvo4QioR9eYwU02g4A3g0s9
	 JHrNFgwUHzm9YWlD2ljiTG83SA4iMIgmyhq5tR1ica3a2WCwxoIvP/QUbOfFiMSS9E1fY
	 mA9khNErHmiwpD/SGuIk9iB+S1jCct4/mEibbbLDk3FmDwH/aaJMDWt12jRAoyuia9sg5
	 6YitG8puvMgDTOCgM4tT3AY0jJi4X3F/jBNYX9yLuKiJXKlIymviqhjlVLLmnuXpWSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=CEc6t0VeUS80Ev6G3pIRJFObgJcYoN6XXEJ5BLbIEVo=;
	b=hlf2FqitaTh6ayVwT3UNGLUID3372edXfZvBkDs+/bfP25mq/9x6CM/ttErw38gLMbe7
	 CbDaHDIgR0OsP6+jqxo4pgz/Lkha4SaTAxROm/jcDvhs0WosM6VwTSkUsArniNfht06on
	 ebEkRe49pyhfmoBqVVeR2VMjWQj3q7NSm8S5l2SWPt2QXGsc9taJ3C4cr5VD0ty2DVdDA
	 iPMPPNSBo3H3/CORQOr3km7giWnldaqLbr7kVqfiO8qu4VKaNUkXm/pi0d8NKueLA+s95
	 b0KFB8J0ws92mB+62UYY+zOU1vasM71h/xZ3tgcf0jGq5YG01nfotL7bFPL4JjqrKXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QPTiA5Jt;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D199E606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D199E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QPTiA5Jt
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb61185057so11853945e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794823222; x=1795428022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEc6t0VeUS80Ev6G3pIRJFObgJcYoN6XXEJ5BLbIEVo=;
        b=QPTiA5JtYMrbsMl0z8iJz6Z1kuNtOsLW8HHjgERJXiH0wb+LeyunHKf9R9M2HNk2II
         ikL42CGjtFQ4HGfxK4hv4TxHo9NIb0nOLjwT5EBK3NtTEdDmoyjzSOPFMXbm+/UCMVkT
         QCdxmRISD1pOOzkwFv8CzKsRJJ1Z2wBB+AtfFTu3Jtfr3dLv1RpB4rkc9schgefJ3Xrj
         +dlu9mwwMZUdyrtRogYv6qxhwLFuuCLyzb6kMTiOkdQ1uPH850eMPDut72jt+NXSzWuN
         /ab4+oBXb3+cgDHO3gIZ5eEfZeSJ398PLzQsPYaw9lnFGMCfxT4xxDn/9zx9NncIFGCa
         UwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823222; x=1795428022;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CEc6t0VeUS80Ev6G3pIRJFObgJcYoN6XXEJ5BLbIEVo=;
        b=c8KWtZo7vjzBukguhani9qzlMsOAhGpHqzlaXWFGe7DCBFtBxBXgehsH9S8WQhGm5r
         5kPVp6jDLpqhyjKEj0oa5+GkTwnRPzC686ZxZvYHSks4lK2nBaTe/MRUG6Z7meffXnIl
         Tda08N/5UYCMFpIWN3xTbl2N8xazmRamZVhFfEHMBnlOyNi8oTtwTXEo7Uv27pVRWowq
         m1o3yhLeluW1k4+9HiRrzsX+99dQYut8foSR4JQltHDyAfFI7jqIWEhjr8scOwAC/9VS
         TG+H9iYvRwY+LyY/ZhYXvChgpCAvJ/sIQ/EXg2YA0otoLOMZztnzdoV+nXYQdJ9t8ZAy
         pFTw==
X-Forwarded-Encrypted: i=1; AL+hErFUL7nlXMQNHeai36iv8Nu752HABu7lVjf5l5hhaAz3GfAK/D22tzhEX4oVqgTb68HgMGzcaO0popDjeb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0mxqs4djsmc+0/94U64HuPVJNWJo0DfHy62ZQcwum14W+j2do
	AKapyKuM+CxUVd8Kxy/kfwH2/JFlSu9cIKi6yt1gfJ3FxBpRJEecONYXLpKCdBIPCgM=
X-Gm-Gg: AYBFou03th0yfkROWxaf95o7LIJ0vfdzjWfmNrumMBTH/Q6P++tp4UOPS+X5TKD7diW
	/QAOjxLCc2g0gHULNf+Ii5XKDApb/bY9VoQDCzcm6hft+hZSo/onE/m/6X8btALLYe5psq+LVjh
	XW8p+qi4RaPKcs++39DXXSvXIh9WxAEQAn9HnaDmd5hQbHmWc9tqoU5RCWl8re1ocAUuvOl79vK
	66KdeLUXLT12so5RivtvKUMaCASkx7F0uC5fzm5OZBRxfrQc7UY5M/nIiZwn/iD4VFPNsZVg05L
	usLIXfIHNBAso8HB4N8EiuWomMVqEAxbG4qjGoUB4Fay2fOnFtBnMGXjQR3oDSsXE066xdGp1em
	ZMZv2Ozti9oDBXxe8xRoW636QiHV5pFB/kLFB1ldoyHHXQVJBBbXL3KrG7Bl7vgg7aAyWl8Gx5W
	FapzefQFuESY6yHDvqImz+qF7B4kBYXo5N+1nDls+06hoFfAuuIqWrks6I21ACS23y60z7OaEiN
	UkGBITlIFh8gjSjKoZFQvtAO3z9Ntrr4G0cSzNwzsRhuexW7aNSOFCK6JiLJOtXmUqIbLaFFL6Q
	ONPhq1eeGoI48pQ7bOT6G8jZMuubibUD7ySUKBxqUxdEcG71uMO61YZm5EAaLcUswT27me418jv
	SIob2PKBz
X-Received: by 2002:a05:600c:a012:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4bb55a907cfmr204744635e9.31.1794823221901;
        Mon, 16 Nov 2026 02:00:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae4414sm282702355e9.9.2026.11.16.02.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:00:21 -0800 (PST)
Message-ID: <0498194e-6428-4424-82b6-c6e52ba25adb@linaro.org>
Date: Mon, 16 Nov 2026 11:00:20 +0100
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
Subject: Re: [PATCH v12 2/6] firmware: meson: sm: Add video firmware loading
 SMC call
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
 <20261022-b4-s4-vdec-upstream-v12-2-616240978792@amlogic.com>
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
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-2-616240978792@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 07:27, Zhentao Guo via B4 Relay wrote:
> From: Zhentao Guo <zhentao.guo@amlogic.com>
> 
> Add SM_LOAD_VIDEO_FW at SMC ID 0xb200000f in the command
> table to load video firmware.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>   drivers/firmware/meson/meson_sm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index ab9751a59b55..887caa5c625d 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -48,6 +48,7 @@ static const struct meson_sm_chip gxbb_chip = {
>   		CMD(SM_THERMAL_CALIB_READ,	0x82000047),
>   		CMD(SM_A1_PWRC_SET,		0x82000093),
>   		CMD(SM_A1_PWRC_GET,		0x82000095),
> +		CMD(SM_LOAD_VIDEO_FW,		0xb200000f),
>   		{ /* sentinel */ },
>   	},
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
