Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624461;
	b=vaEHmt3W13hPs6EXj8lbr4x2dtzm82SCBTOhonzTnNlvM5htF+AzL0HlVo3OmKkHZsIC
	 5ZfV7GYxt3H7xTlN8VUudRdqAGkjXtmZs4hHWl4vNwZDmQEPmbp+AhxN6yvMEOVnc5NWS
	 ESiuI7Y0SRYW1OMzH7pfpiQxybeVqlMK5+ljOw6ArWu8VhHMoUDiNvc6sI3Pn5fzywJef
	 wtDzilv9GLkTbYc9Wgc+fnKVex5ATHFCc9Gn5zYR2qY3grsPyHYD6d4exC2c6JMuRfhu2
	 ecFHL7p1azMiG+KGOrwgtFORU1o0hRm73kYzX3NSTZvuEZDv1JooV3/Owds/HpfFbZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=j29pNpi9lCEApLMieivEV71xbUHKc75TmajW4Oe43v4=;
	b=GFVrMiRtBkvm79xEAUJ4eaFSvX6MHPJqugmqHhaOwPJMTmOk2SIicHrWWrhd0yQClXVB
	 ouF6qzOfBXCTATR/7QQxcYfecxDTNsldefRS3pNmcd+3DWXTgEQ+xaf1s6GNvRpEjxqfS
	 N+OpMTFkbwKcyU34pRwltlrHWsIRc5iBrTS7NQ1QZed/37mmHmanDSf5f+A3vRgpJ0rYL
	 ouPhrBtcHQIWACvoVJlhy9G0zM+jmp0NARJpnOfsL0sZ2CBhgLN1P2ts6DDzkm8haFegq
	 /QS/MeGXgNIHTxSMCl8K+OqdBkwwHyfSIcejjHHEiL6xQX+f6U5h/IGVDiatfHHd3jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iJ2L191G;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6393606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6393606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iJ2L191G
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2056156f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793624459; x=1794229259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j29pNpi9lCEApLMieivEV71xbUHKc75TmajW4Oe43v4=;
        b=iJ2L191GgNIz3HPvPfytQwAGwHKWW0ooHRXWAg3YRWV7wPD28I6FxGMon4cpxXm62A
         phFrB4I2Gn/1B96YI+XuBU7gpeXyQZlnBKzj2Hm55vfCxHyGXK6B2knmRz86NNwer4SE
         gzmSSiQKQA0Bw+X+j571yL+v3mAxXksOZ7VwDm3xCmKe9uhqUqU9AbhOqR433gRCa/Wg
         3CHUSwSTQAe9QGFGGmFCXmbOEk+D+CGcf1cltx1nEidHDpUHZQHxGgue/jL7reqNeK99
         7Q4asGouASvoX+/1qPSW7oA2PbiLQPmPADmgNnRBeTLuXID6SuIHR4nfkYdbZW8qQuku
         c4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624459; x=1794229259;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j29pNpi9lCEApLMieivEV71xbUHKc75TmajW4Oe43v4=;
        b=L50TOSgHSpP4lHT1o1RH42le6cGEjtCu+1XUc7qjeZ/QlYUn4g8OCpys25VWlQVEBo
         zclNxVcgtWWezMfchWvcGMoVj+YaR4LzM+2d3ntxUZ2NyzSduBoK+uAZDw61Acf16a6R
         i/EnY82ryUj6mLMgRLKTOgXEwGPpe3rcSIZ1x4OdBftqWnu44cnE99hJp6A45QQDCFIm
         KfG0+EAdFOAcqbV3qZZ1L2TMRdRc4+cTl7qa/e0UJx8Vx43S5+t3lS7P/3wYfj/cC8fR
         JvHd4QfafBDCzWMrB1Rq8a6/DguWNTTG9IWQ3A4JTFzRVk04/jApD4ok7EDIwYRhdftP
         5xFQ==
X-Forwarded-Encrypted: i=1; AKwUvByEx7Yg/15Cv71mlBUe8mWCFS4Zz8/ajONYjvX7oHD8xUdlKrcTFEeQHBYAeRz98X9yLsd4RmBbMu0qlWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CCGJIZRUDfkHgTmfObOljPOqWPGbyQ6B1wm5kA4m1kJFGgmhI
	OAWFun9oo8g+trvXH+Qj8Lg6SUR+kbde6x2gkKI1DHOGA8UduzL1UpKsjHrHNSXLxx4=
X-Gm-Gg: AYBFou1w1vbcEc76zYib10zR75ZDCQEA52RRQWbGItBBOvT2AhyMkYMni9LJ5qqCmv3
	L9/37hXSs9i+6W7JmlfpF/PI8I2DNKbt47pVFwY8tBHeIDJzm1boRtFN6ovIys0QrZJEJCJalNe
	uvn3X6thLgK8w6JmaRWPvNJFxtfK2I6PxaoBVUmoRe89bhP9g5fwUKdxS1+ui11dT3uHZmndhYt
	QxyNuwf3TV8oahTotThcmK+rS/7zXSZ7AoPonsCOITWF/wr/QnOzbLK1NwqFEm4KEdDPxXjaNrq
	Uez7IQJuRWvV93YG7N+JHF3giVRv5bq4QlZd0sNn07630bkhvJAhyKBtjW27a4S/y05NrMs/rE8
	VxQGqoMctVsbdvjM2OzdFqqFd1zBs9fIaCjUURpUuIsgtRy3/Hwu+bbnRKSlOHqnOyjiVJaRRrj
	A7IP61KfNpe8AXqtbn3ayQuXf38bWnq/OrCpwy2hqih+kl+T2Qq8tHxSPNwhS/U2MKNPPvCVtDP
	iBMiidFniPZHtLKgkrpMqXst6ssG+cEi5ZVk13U9Y0mv1bjEvOPo5HQ5OqsZ18YgLMC0/v4R707
	SQ7Eqa9QOcZiZUqA1fTcxiU/yjQ+kmuPptbe6Io0F+Pqw9YmlHmh+Ee6jaN+L5v0aU+lAP5YJHS
	QWrbuzll6cd67Mb37JkmgEWErgko=
X-Received: by 2002:a05:6000:2610:b0:48e:4561:8a17 with SMTP id ffacd0b85a97d-48e6e303ea6mr20567690f8f.16.1793624458807;
        Mon, 02 Nov 2026 05:00:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm19170893f8f.29.2026.11.02.05.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:00:58 -0800 (PST)
Message-ID: <e0599f9d-c282-4b63-9e17-3a00564766dd@linaro.org>
Date: Mon, 2 Nov 2026 14:00:57 +0100
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
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/5] drm/panel: feiyang-fy07024di26a30d: Fix prepare
 error cleanup
To: Hsieh Hung-En <hungen3108@gmail.com>, dianders@chromium.org,
 jesszhan0024@gmail.com
Cc: jagan@amarulasolutions.com, osama.abdelkader@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
References: <20261102043215.990351-1-hungen3108@gmail.com>
 <20261102043215.990351-2-hungen3108@gmail.com>
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
In-Reply-To: <20261102043215.990351-2-hungen3108@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 05:32, Hsieh Hung-En wrote:
> feiyang_prepare() returns without disabling previously enabled
> regulators if enabling AVDD or writing DCS commands fails. Since
> drm_panel_prepare() does not mark the panel as prepared on failure,
> drm_panel_unprepare() does not call the driver's unprepare() callback,
> leaving regulator enable counts elevated even after subsequent
> successful prepare/unprepare cycles.
> 
> Disable DVDD if enabling AVDD fails. On a DCS write failure, restore
> the reset GPIO to its unprepared state and disable both regulators,
> preserving the existing 10 ms power-off interval between AVDD and DVDD.
> 
> Fixes: 69dc678abc2b ("drm/panel: Add Feiyang FY07024DI26A30-D MIPI-DSI LCD panel")
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Closes: https://lore.kernel.org/r/CAD=FV=Xm48DUT==8HuuGCSFZtLTEk-W2Q6UTfqt-MnM4nULzTw@mail.gmail.com
> Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
> ---
> 
> Notes:
>      Power sequencing note:
>      
>      The error path retains the 10 ms AVDD-to-DVDD shutdown interval
>      used by unprepare().
>      
>      The FY07024DI26A30-D datasheet, Section 7.3 (Power, Signal sequence),
>      specifies T10 > 0 between AVDD/VGL reaching GND and DVDD starting
>      to fall. The delay allows time for AVDD to discharge before disabling
>      DVDD, but compliance with T10 has not been verified on hardware.
>      
>      The existing unprepare() comment associates the delay with T11,
>      which actually specifies the DVDD fall time (0 < T11 <= 10 ms).
>      That comment can be corrected separately.
>      
>      The msleep(10) checkpatch warning is expected. T10 has no specified
>      upper bound, so a longer sleep does not violate that timing constraint.
>      msleep() is retained to match the existing unprepare() sequence.
>      
>      Datasheet:
>      https://files.pine64.org/doc/datasheet/pine64/FY07024DI26A30-D_feiyang_LCD_panel.pdf
> 
>   .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> index c1d8ca5ca6e1..bb4cc1ea2ece 100644
> --- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> +++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> @@ -59,7 +59,7 @@ static int feiyang_prepare(struct drm_panel *panel)
>   
>   	ret = regulator_enable(ctx->avdd);
>   	if (ret)
> -		return ret;
> +		goto disable_dvdd;
>   
>   	/* T3 (dvdd rise + avdd start + avdd rise) T3 >= 20ms */
>   	msleep(20);
> @@ -84,10 +84,21 @@ static int feiyang_prepare(struct drm_panel *panel)
>   		ret = mipi_dsi_dcs_write_buffer(dsi, cmd->data,
>   						FEIYANG_INIT_CMD_LEN);
>   		if (ret < 0)
> -			return ret;
> +			goto assert_reset;
>   	}
>   
>   	return 0;
> +
> +assert_reset:
> +	gpiod_set_value(ctx->reset, 0);
> +	regulator_disable(ctx->avdd);
> +
> +	/* Preserve the AVDD-to-DVDD shutdown delay from unprepare(). */
> +	msleep(10);
> +
> +disable_dvdd:
> +	regulator_disable(ctx->dvdd);
> +	return ret;
>   }
>   
>   static int feiyang_enable(struct drm_panel *panel)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
