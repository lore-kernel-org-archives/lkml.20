Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785095;
	b=2pX7YPErFmZalrqvXvuKhGeHVY44Jbxm+PTjxhX1lYcxBBr5jTJSYqtnoUBCUU2dAkHh
	 r1+9u8J0K9rzhfTTLsIlvDDeoClXmqPfowoZLrgjJeKuyyhxxCoiOJkySGb2i7aq9JtlU
	 3FzARuHfmNw/UhH7y8xbzpQtRmo/IxQAjcCXzAAWZ6khfqPFVh84noH5p8TMCfaXBeoln
	 rePyOWERnAuYhxHID3LkacwmTE8WaLW5SqEVseL03tCjBM/huhFOIjkmbcxa82/XxvsXI
	 Pm+KyTHU92c/BW/qPPZyoUCbtzlgqCs0j90MV/NRsg69EGuTjgXumgEjOg/2ljC4DIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SgGmwBv2YCkVrgEaoOotmd+kkUUxKWgTOQh7djT+JIo=;
	b=U0dMdM74U8/3qJBMoPbIqWevjNlH8rYHakmwPPnnZvVgiHJOgO9k5O+BQiq3s8VME5Hb
	 +HwZgbIGcOJfFcRE1MmHjFyGU/yjzLzxuVe7sB9Gs5WPTiLwQxq2ZySGMIxRadcEoAyE1
	 FPPiRof5q9zwkZNv/C8seL3iFAXFVnm5rOMhXDrFFxn9DSkwpcLknhytx/B4xAnpbTZXl
	 AxkuSUHYEYTVZg9m8Pvvy6k/+54OnXbLlk1/dkJWyn5pKEZrXI1H1vMgdmAy5W5e8qpCc
	 C7FBrTQ3eEgGUEB67gMupkN11Uaj1iR83DMGcDzjTo0uQcZH1cbklQ0vnF7PE4ZapQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LsupHlXT;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23490606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23490606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LsupHlXT
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490a0e72588so35502f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793785092; x=1794389892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgGmwBv2YCkVrgEaoOotmd+kkUUxKWgTOQh7djT+JIo=;
        b=LsupHlXTtGcKDNw9zSXJpA+vfbnvd3q6bZoMx7nn6XJC3K1Vfp+0hYDZIqgzbN89wf
         UcKeVwht2tgk+HpNys0OZena6mwqJVR2PJn6q8BPz3ddfJjEuBLzJ9O2ZKw7MYsQ8xA4
         JWeNv/xbjrzvLNS/8t7rXcvjKLf7mYtYaPk+CCyKVDwCTomhlSgyO7i/6CqZfnQR0xSS
         KbAgPvGUHQeYjiaR5vfm/jXhOOIuCi+GLkG3ntMQ4/0eFvtmCOqf881nMAC9KPkvmA9y
         W1vE62+rz3RR+vn8biM7w+7kWnsUO6V4OjAxXh86+flowxxCXRtmeOF/tBP3giMCiMZa
         PbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785092; x=1794389892;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgGmwBv2YCkVrgEaoOotmd+kkUUxKWgTOQh7djT+JIo=;
        b=Wy4vzzIdrgJEm7pTJhVlB8e3gF/78MfPx2ABbo7YEeC+V0/LVfIprdz9dgXivgd8FA
         PaY34R8c9EgcOuOmXuopBHlwHz4d4m7hlrd9BoV/U4AEVNZHs7fswPZM96hzCDCiiOfo
         5bE9O/s21JA9HrRY/C9MoLNGejb5a9EQc5OONxKK7pz1uGKQW22Dq4u4BfuPfkmyPoAc
         H6p892ePljN9ZhmNQgXb+upl7ZMU/FNjuhazyLaUk/Y4B5AmV42G+LI9bCMjuTxZm7U2
         bBGT0/9NuYrxvM+I98mGZdM8v09LP7H7ys6yOFEtKiLInuA28W0wH2yOTiV9SoDjjmJZ
         S/bg==
X-Forwarded-Encrypted: i=1; AKwUvBxQIEvNtBP84lG42QLUmBosCJ4AiGo3BCNlT0ULxr5e5oPwKJoQBiFwGuZpL9hRBVEfAWVsBIv+IG5hlnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FJsRwbweva+IWIOVNN/mfnkMH+rvZVhk5c8o8iC2+oClC0N2A
	B4AuRHx0DdHGAnYKZMicyx1m5VXoZ3OGnasQAIgHmhIYy0mJMvGdkKGjEH+MsGVF8WM=
X-Gm-Gg: AYBFou202YvzuH5UQ1FK3tlzVVUeTs56qhcSFAo3YMPIcU/Nx4HEng3glqJIdon+GgA
	HeZEJYqqbHF/8fY2GyRRyKXnKpMn/XuuyxS7tE4tXbacq3wzM7xyqwRs/aAKa7Wc/ZYsMtAORZS
	/PX+qY/XG85+qdIunSsRgYwZnWC8NlbIBMAuAg8UTumxd5sOZLKsYRLt6o+kyQGVm30+Njs/7YY
	W3w6ODWr3Yg83dSlLvUjjpTryNB22+ahrSEZ7ynUqWGKilmjzd1K4CFfOIDRSSGs0NhdJrrGAJ9
	KCgoOaRmQc4D70nazI3uSdDYlwUioxHTR2Vi+pSR9OdLpFpI3G9MfuBTAekeJnpu5giAKUQz7Xc
	QO4Yz2vLXs+IJmpkPAfknlNZceqgDirmAKbWFVRq02vMX77/S4Mr58psB5vp+TvOiXFmMlqMfL7
	fB0UP2YWjJYDyvn5rSi5MVfu5nu1H5/x6ZxUaJ00MMB9qkRd3Hf+pRoC5nK0pWco73tBxxIg0qb
	irNytilzj1m6WrBLE4rFHX15MTen1rD8J30XwQ/XlZgOw0h25TJRK4zCX0oZtsFvwsdMKuFB/+j
	js3HySb4Ml5fK4r6CRL0IWhREAP9wVV5euyUx0cJJOw5NH1xtM0YINFg
X-Received: by 2002:a05:6000:46c6:b0:487:40d:af33 with SMTP id ffacd0b85a97d-48e6e2fa518mr22336653f8f.13.1793785092319;
        Wed, 04 Nov 2026 01:38:12 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb5196esm2605410f8f.58.2026.11.04.01.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 01:38:11 -0800 (PST)
Message-ID: <73888927-18ec-44b1-bb14-72e72860bfc2@baylibre.com>
Date: Wed, 4 Nov 2026 10:38:11 +0100
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
Subject: Re: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
 <aunIVW4JeM_P2WOa@ashevche-desk.local>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <aunIVW4JeM_P2WOa@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 11/3/26 12:41 PM, Andy Shevchenko wrote:
> On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:
>> On a GPIO request, select the GPIO function of the pin, on the pin for a
>> pin-only function or on its single-pin group. Without a GPIO function the
>> mux is left as it is.
> 
> ...
> 
>> +static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
>> +{
>> +	const unsigned int *elems, *pins;
>> +	unsigned int nr_elems, nr_pins, i;
>> +	bool pin_only, gpio;
>> +	int nr_functions, func, ret;
>> +
>> +	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
> 
> Is nr_functions signed for a purpose? Can it hold an error code?

No indeed, will fix in v2.

> 
>> +	for (func = 0; func < nr_functions; func++) {
> 
> 	for (int func = 0; func < nr_functions; func++) {
> 
>> +		ret = pinctrl_ops->function_flags_get(pmx->ph, func, &pin_only,
>> +						      &gpio);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (!gpio)
>> +			continue;
>> +
>> +		ret = pinctrl_ops->function_groups_get(pmx->ph, func, &nr_elems,
>> +						       &elems);
>> +		if (ret)
>> +			return ret;
> 
>> +		for (i = 0; i < nr_elems; i++) {
> 
> 		for (unsigned int i = 0; i < nr_elems; i++) {

Ack

> 
>> +			if (pin_only) {
>> +				if (elems[i] != pin)
>> +					continue;
>> +
>> +				return pinctrl_ops->pin_mux_set(pmx->ph, func,
>> +								pin);
>> +			}
>> +
>> +			ret = pinctrl_ops->group_pins_get(pmx->ph, elems[i],
>> +							  &pins, &nr_pins);
>> +			if (ret)
>> +				return ret;
>> +
>> +			if (nr_pins == 1 && pins[0] == pin)
>> +				return pinctrl_ops->mux_set(pmx->ph, func,
>> +							    elems[i]);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
> 

Best regards,
Clément
