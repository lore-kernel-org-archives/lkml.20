Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238666;
	b=cGBiOsqPuLEgrXONZLWNa0tdLIleU8YgghIHWFMHsGeLLt0jPGxlWu+XUzLCbkQ4C0VV
	 w0JDwOjw7y4f0VI2OSfswQMLzaMsIiedWKJfWOqGUVPG+Tdt9gfQdQ76SzG645SC3mZD3
	 CNsAtl9Qh928wTQWm+L/W1o6IEpx1NLKnck2HNhn9icpxmAvpCHAu6Ayy1CmkPpq2R1Sa
	 4YLOKIxwrq/OoVc283aNHdk07MVjm+iICvmpTOp3rmHgsTl2rw3HmGU91hx4i/laN5ZgW
	 ggm651S61mwHG8sv2nowyTj9q9jF64+8T3g1qgK4BHduTFmPZoRQHjEfmloHrIayDuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ydw1s0x1RNP+qqUMo8W/mYY50hHq5MXJ/cd70aJJung=;
	b=MurgqeaN1o86Hr3G+yjRf8f2ZuCisqXYmSl19VRjooV7rXKPvw/URpbck7HhgXjNsZ1S
	 QSzY0eTMb8j6UAqghxG1yIsTJX8DbQFnWJCUp26edkP7o4bAgQKp+3R7f79Ms1YQ4n4Wz
	 LZUnQ0khBehvxrtHDBXIs2sD+fk07RC1jHyzPxLrGzV8zpFIWVbrtJ2Kd0SOLKl80BVEt
	 qmgnjBzdmbP31B3LRpktJ/vhCO3mOhIvEHHLdcjPHDb0ScY0SZA/+LhGzUggZDWG9Hgwe
	 7f4XCnOVBtct+Jm9hDlA8FZIAo6tz7cf3RR+E3/E+tVm1OiX00W5AWxVFnJUnbldU8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YHPQDxth;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F76E606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F76E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YHPQDxth
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so10427735e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238665; x=1794843465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ydw1s0x1RNP+qqUMo8W/mYY50hHq5MXJ/cd70aJJung=;
        b=YHPQDxthLio9qZlx+pNRhCp+dyzli9PQSWNVxlSCobZwRcJs2KDBi2hZOZbOS7+uKr
         IBKS67wExr9rulZ+CSFJhK0U9+LlBdvyMgV37JyqRyhlYb4mCDkI3lZY79aI3UTai4W0
         +ulLYRw0kL0ztF5ZBQQiQY3A2/3jx5JbzXXFy8OHR/SqQDGP6bBjreUS/YpehI29x9/O
         MDwUIAZGlm4OLHtxXRtUythH6nVQLiocdzeHZJxpMkThGf4/BNuhsEtW+C4VJ3iJozxl
         qOZREYqGSTjJ2O12wXvUp/u8ETZYXLjuM7xGEszXZPcWAyPggG1QgL9LEgsTXy80fxkL
         OUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238665; x=1794843465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ydw1s0x1RNP+qqUMo8W/mYY50hHq5MXJ/cd70aJJung=;
        b=r9/FKaGXKZ3M1J3FCGUNRQno8MjG/BUY8ps22JFEnsgZbHX39PoxKVOscE1nnIzktM
         3XIAIyiq33ZNk/uCg9TphL2HcBxZjGF3CH7wzsK/qEzkz4DmylIdq900YMjFotibgZLi
         a2HAplUeomJQIjN+llQU3X273gTvN+vozAwYnGD6CrBQhLdbR4wwB//49GK3AQhBr+ZC
         no7ESvHkX29HYiCBmC0KbBU7/Txg5RSmvnxaHWdSKellH90X7yYtARVHrVPOB6bwp//F
         Mt8SwHtESjwOUhtFQMyfqczoFIET7TOJdZmQEDbrXFF+MQ9uUqN9GixJOWae3dUDyAzu
         9cTQ==
X-Forwarded-Encrypted: i=1; AL+hErEFlw+F0d9z4Nv58jJJoxLvMU8Oep5pCTr2FJya/oEhVseRYLCrLCJoscjTiTT/mBC0SXS08k8tD2rs5LQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c79LzOvxG0eZBZRFrmKD2aV4uydMawDs7hXSN84C4Jo7ZOdLd
	E96CaNq+asUYw5KuhxRd4rjrZBlf+UBImbl2uGeqYLy1QUMbOJAJ5/ji
X-Gm-Gg: AYBFou31gn1ti8invsya8D6wCV8hqqvag+mZcYAwvBhLqv+be75S0tBpobNs5cxxSpj
	9CueObWhyw3WAVyyV8zMQzMSwIrqxlyNhmGxqaLs9BZu+XIiE8jiNCvFBB2wvDnjxhsG7UUFKSe
	UIk0lsiz4GGeOu3jMl91OX05S/SCC9+FWaa7SnCuiPs7YTC2o77v/UTQgFzO7Lzlwd8fHnfcuKF
	UY9SaruGsHWxEwcqYEiaMD0isEpYRalO+L5fA/5RDUGhzhwdO7VlRcxLdbHsrhPi+Iqd0yoWGNT
	fx6jeh/uTammefV43DTVOXORE0jymiiD8kxLAzqJB2hvY4BxGntdad0JA5J8eb6QsOEXibZoTh1
	NgJffo+SG+4/S9l0xvOjB1w4dF1jmZWIvfzgGTkdnGquuLFrXycaGjAh0iJnUQ7vaGV8D6W5Vxm
	/5NAEeUdh/CYYACiD/uIrAp7JkeiRjUTl41X56y9bzs2S/Xwy8I5Sdb402/hvzN+N2wiliHRmPs
	BxDYPqlpFmYbp8n/jo5Ri3P/EeZ6uK5N/TAA9HZTSpLmrKWbL8ZO82AAOfkXuHur9fUDhJYbmzi
	zB3dnx6TgIc/lxeTGfmKsCexZQqCMSMRon5g7aO8OkFyR8W5EgIshbyXFeJLwGSZkbyo7SRbbdk
	FGg==
X-Received: by 2002:a05:600c:37c3:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4b963c89ef2mr78509805e9.17.1794238664475;
        Mon, 09 Nov 2026 07:37:44 -0800 (PST)
Received: from ?IPV6:2a02:e98:40:8091:f0f7:91a3:e60:541a? ([2a02:e98:40:8091:f0f7:91a3:e60:541a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90619bbd2sm149230065e9.1.2026.11.09.07.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:37:44 -0800 (PST)
Message-ID: <800f8d42-e35d-47ec-bbe6-e437a86d6e70@gmail.com>
Date: Mon, 9 Nov 2026 16:37:43 +0100
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
Subject: Re: [PATCH 1/2] serial: 8250: Add RX trigger levels for U6_16550A
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-serial <linux-serial@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Miroslav Ondra <ondra@faster.cz>
References: <20261109-8250-select-u6-64bit-v1-0-04bc8332fa34@gmail.com>
 <20261109-8250-select-u6-64bit-v1-1-04bc8332fa34@gmail.com>
 <469362ef-f0c5-45f2-746a-b4a3c51876a4@linux.intel.com>
Content-Language: cs
From: =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
In-Reply-To: <469362ef-f0c5-45f2-746a-b4a3c51876a4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


> On Mon, 9 Nov 2026, Kryštof Černý via B4 Relay wrote:
> 
>> From: Kryštof Černý <cleverline1mc@gmail.com>
>>
>> PORT_U6_16550A has a 64-byte FIFO but no rxtrig_bytes table, so the
>> rx_trig_bytes sysfs attribute is not registered for ports of this type
>> and the RX trigger level cannot be read or changed from userspace.
>>
>> Add a table with 1, 16, 32 and 62 bytes, i.e. 1 character, FIFO 1/4
>> full, FIFO 1/2 full and FIFO 2 less than full. These are the levels the
>> Synopsys DesignWare UART uses for a 64-byte FIFO, and they match the
>> existing PORT_ALTR_16550_F64 table.
>>
>> The default FCR value of the type is unchanged, so the trigger level a
>> port starts with stays at 1/2 full. The only visible change for ports
>> already detected as U6_16550A by autoconfig is the new sysfs attribute.
>>
>> This prepares for 8250_dw selecting PORT_U6_16550A for DesignWare UARTs
>> with a 64-byte FIFO.
>>
>> Co-developed-by: Miroslav Ondra <ondra@faster.cz>
>> Signed-off-by: Miroslav Ondra <ondra@faster.cz>
>> Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
>> ---
>>   drivers/tty/serial/8250/8250_port.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
>> index 36b2b0a2c05c..a7acede62f40 100644
>> --- a/drivers/tty/serial/8250/8250_port.c
>> +++ b/drivers/tty/serial/8250/8250_port.c
>> @@ -163,6 +163,7 @@ static const struct serial8250_config uart_config[] = {
>>   		.fifo_size	= 64,
>>   		.tx_loadsz	= 64,
>>   		.fcr		= UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_10,
>> +		.rxtrig_bytes	= {1, 16, 32, 62},
> 
> Reusing U6 entry for DW UARTs seems misleading.
> 
> We've better mechanism coming up for defining rxtrig in a one pending
> series so this constant friction with the uart config types can be put
> into rest.
> 
> Please build on top of that other series and help in testing and reviewing
> it.

Thanks for the information, I started the work about a month ago
and not sure if the patch existed before. I will test the other series 
on my hardware. I like that approach more.

