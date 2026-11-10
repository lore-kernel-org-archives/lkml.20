Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321948;
	b=R7KYLv4YF7gNb/ePGc4iOyjb3jCgB2n95wjL5kYzpDo6B0/iLoY3+14Xs3avaCFi3Vsp
	 kaAFRbaL/QL/uoAb3H3aTZS6Mp8rQg+8izXD+2w6JA3GxZXYGdMnHx7VDu60m+QQ5+6Aj
	 ZacmqDeADULejMOX26L1gBT6psWnULFzRGzZBCUmX62EateJ2NyW7/3JVqBcEb0FzmfKG
	 j6RHbDYd0ajirFsckqjWntXEjot+AathKntu/1eLjcHYa4Mn+3xD0EMVQFjugxD27LWzN
	 HpOu4L5DU4t7RwOFp9jRoevb3/Wkf9pEwAEfeNT/Wpf/1NlEbM1PZuIeL3PJjtylKsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L9jyp2wuPUVlelOs6NqY1BezFPyW+K5DLWLSt8XZey4=;
	b=3GFHsg+a//fDdC3Cksyo+85kL8BY2tRKcJH2B6qNFbJB5abB4y2spg6fuA7ek9n+2+2h
	 zlOg8ahlNAd2VJa1HouvrJgUGx+CYgGdSExndULKEV08l8PDun5gCi9jYFruCuc2410Fa
	 pB7UWfpGq1SGBj8M6braZrrn53Q5fsx6Xu/nZpzVV4qVPFDMTlQQ4O984pt9sMukaQPsU
	 VJbXMjlTAY+kzZRZOe81aAXmlkcDaqlPL8EynBhjJOMB1ULxzT9E+dQf7owQ90Gg1f7Sy
	 164eYRitfuyioKSY4OJ79Ii3nyiuzhQGe2vgjt/IJjXnEE1TgEAzmhrg0Ry8YcuWwTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=A4QYkVdj;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151CD60A262A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 151CD60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=A4QYkVdj
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1400673f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794321946; x=1794926746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9jyp2wuPUVlelOs6NqY1BezFPyW+K5DLWLSt8XZey4=;
        b=A4QYkVdj6QsIg6y/7whUfEp3RADSoFj6acoAjkv5/Rv/06V5aFl8cgx+A4lxCYl3zC
         nyQ+EygbyNm5Eke+OqXnuDHC/AebKcULAHM7a29PxkGKhrYyr3y+7FrGAFjrdZUkIwEB
         CbrdWO0TgYxHeLr7cNb7OryBNKlFKV3Mq+vRH2thgFjhI2DdA0CBxEx2JfwNIWVhAPpS
         9dvpAEvJM7IP9rPNQEfQj0YLGr6H9LRSOG2o3dPmfkPWDu7+2GtB0wmmF0nOJmZ6hd4L
         Sn6HbGEKqL6LIa9xhb56o6znkK58IY4F+YYdlUelrlUNY6px5YaKBLTwclLm3h62fV5m
         Grxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321946; x=1794926746;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9jyp2wuPUVlelOs6NqY1BezFPyW+K5DLWLSt8XZey4=;
        b=oQ5/OBJXxNTVzV/x077POWRwLljh0/bSBg++dxivGngKsxU3RkwGHVlg+KnDwYxV/4
         +/z6+Y9OuYvZahOeV92H88LMIJJ4DzuKrecQ8ql4XMi4vKbmGDfeI244aBVMUl1xeVqA
         wxntBaZ8Ssla+2BA/wv26cdI41WclaA4K1y49v3Xa01oCoe8KrAfiA9DaOaxz+nExCui
         76uHFRNl6SIKLW02/kzL+bvxHbqUTallbRjuSSWqxTdICbK4L65kEQopYr0Xekz/wqhF
         HDKnZLnLDcjoWG3kAZjt0kxktUFfjPMlovX20wNviCedZ4IAFxZHnOVGZF+l7O4Lla6e
         KOfA==
X-Forwarded-Encrypted: i=1; AL+hErEePVVRK3EJ4a2KQC3GH2BrxALQgm8T2hVfR+AYtgixfK4W18rSpPaBssycZGIPRFgCdDST6i1CrDMROH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v92VKVWk283z8VM1mRgsbl/uQUwBZsjXZxaTeb3wfMU0RZ10m
	8ueYTqrht+zoLUThMcXhFo1ARtJjuy/IrWXpP7WQTrT34tc/9tTL7oUhPMXFs/d6Dvc=
X-Gm-Gg: AYBFou2WBbErmVXFJYlz+Xowp6McKDTMZleBnOOEJ+iZkqsL04n74YgImD+da/tNBnk
	2ULg49s7l59itVLJawdGfkNwy8dSbddvbsWuYFBVKWsJ6hXSK0uzMHxObxDgQt1CJoNe06rtoL0
	a97u2YenO8T8vvgqMmMsKf3s0WILCWPojbLzVXrKxDyVzOjZZiC98Ryrin9k69Ikh5+PIFajahU
	63r1NV9q8/Wh22pPl6QHkNKU7pH2Z4W0Bnk+hizBoIZBBcB+KhW5QxPDpZSWBCrYLKneyhUQGKh
	2YlENJQl22hgFFzi/wRkh10jC5+g6nP5LucYNKSPUZWOV780XClIYYxJjnlfqs1LuBrmzinyBLX
	aeFCcCPHZsPtH+hqxKeA/4WmEeydv9v1cWv6Uzf2CN42cAP9+UFcKrPo31CZmJWTUFEHrflmnLY
	uhAftIJSQTJwqVaEqD6EELqjSvV+ix+oDdPr8bF3MAgrsbzspYAGK9NNilM8ImJaS2tx9LDtsaA
	PxP0DdJno19rHDdvWp+uc1u6MiuVGHltI0BjpevChL2a6uYe0L7m/9iMwvV4dwUrN9IqEETtdzP
	HLOSeVigOgyQ3pY7I0kjSFWIE3lrG4Ovc7suxDF9R/u5wZnuqSqG0DJ6bWfiwJrqfHvcA+eFS1J
	fL9g=
X-Received: by 2002:a05:6000:46c6:b0:48e:68d5:818d with SMTP id ffacd0b85a97d-4982e82c2d8mr3373380f8f.16.1794321946400;
        Tue, 10 Nov 2026 06:45:46 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988f5b1ce3sm3848234f8f.14.2026.11.10.06.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:45:45 -0800 (PST)
Message-ID: <1300fdd4-b4b3-4a89-a37b-ea0d18e3c055@baylibre.com>
Date: Tue, 10 Nov 2026 15:45:45 +0100
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
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
 <avMg5XmU8uSzPR4s@pluto> <avMlrXeemXOSR3ng@ashevche-desk.local>
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
In-Reply-To: <avMlrXeemXOSR3ng@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 11/10/26 3:09 PM, Andy Shevchenko wrote:
> On Tue, Nov 10, 2026 at 01:49:25PM +0000, Cristian Marussi wrote:
>> On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:
> 
> ...
> 
>>> +static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
>>> +{
>>> +	const unsigned int *elems, *pins;
>>> +	unsigned int nr_elems, nr_pins, i;
>>> +	bool pin_only, gpio;
>>> +	int nr_functions, func, ret;
> 
>> Beside nr_functions, cannot all of these variable definitions be moved
>> inside the scope in which they are exclusively used, i.e. down inside
>> the for-loop ?
> 
> While it can be done, it's not most recommended style. Is it already in use in
> this driver elsewhere? If not, don't do it in a single function. Same if it's
> used in like one or two out of dozens of cases. TL;DR: be consistent in the
> first place.

I'll try to be consistent in the v2

Best regards,
Clément
