Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307572;
	b=g7Oq/YRnBzBUM+5AIhAdKuXJgE59Rzwy5fOVPhwozklwE3mm1OdpK7oKZ7nVHS7hSjAD
	 GX+V290D6tGo7u18Hft01tOJJSQUtNuqnViur7kHzWaDcfZ1znyAemkY4uPPENA4PA3rT
	 UZacDUYQt2Fl7PSUyKG2w5k2tSNdFOwvou1B4Wf3QAMiFBIyjOMzBBEMZCCjrtNuIVKeO
	 QKsfLBVNxudVx69e1VcgiJBVFTHFCORwzILEMQ/P4z7AdK5kvT9/65HCgoxSmzrcAYOcA
	 udza/Mtboj89HcT/ReHpGOaIfd30PodHvMJQ/JfwqpRdKTDAv2A3saUwa6TwWP2EfXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hpVaakSFJ8J6aOpJxgRujrYu+K0/hJbr4eZQmRroI9c=;
	b=t5RiPi2ozc6tLvSz7lU1LR1wxHqydLOxlL4WisJXiWkqzNmtTgIUZGtHhSmP/E0XAG1H
	 NTxkpWoeCPV3xnzW82Ib+HWFXbB3np1Ric0MF/2+SDSsQdMIDWDvLknRheBRarxS49vXj
	 ICRZFLGCm5srGIjDSFwy4OhaBIlztyIxp3pXwpo+zVZaj3cLw54vklbD/HdL5XVWRwBSA
	 mmN/EtLwGqd55Zjsc94jhTLFp/R+qdll/tthjpi6pFDztSKjL53CuJLbHJ1Z5o5ZaV0uY
	 aKm2Fe0+Vd3tGdGRwYMHwmUzLWf8hXQ1FXoDwRqlkfMW1bqZBhwSGutFVzm4XdLjYqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GoGN0NSu;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83991606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83991606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GoGN0NSu
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso692218f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793307571; x=1793912371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpVaakSFJ8J6aOpJxgRujrYu+K0/hJbr4eZQmRroI9c=;
        b=GoGN0NSuGzvhsqjKjV6E5CoaLk9pA1N/4XXrZ9Cr5cu8nKVZhXSK/n7ffPdoh73w8t
         QkqpgFbbYedLP+PYFJB5dbtvk0YRSoHqThZA2K3YbAoujDMojTOdr2q3V5QeSnwInxhP
         sNgau1sJ31wc4/I/h18T18iLcZvmXGG9wGmy1iefz7jvo4MwrVQEjGIjS+ECxb5+ghWM
         OyRFtwpbD8ocS++S2kWWIzjNj3UnDGGIoQVjvhXGKRjO+Ntmo7YfL8tiklNuhvi/44we
         TcJHFv5lVRzAuqOZBY9/2R7eVNsBudMFy63P9hWHAoUyRiYUznMEydXiwjDHoUgfwM6D
         MLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793307571; x=1793912371;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpVaakSFJ8J6aOpJxgRujrYu+K0/hJbr4eZQmRroI9c=;
        b=zeBi4AxQmOP0plUoCmRlBKtIwcRJgw5DSfEMhVCcCGD6XROEAxqC8lzu5sWeIwjSJB
         ro72lOUvs+7K2j3d+ZwEgjFv86/IpNFY3Lmg/5KcJEmRDk15I5lSKyN5GD92bFAN9po2
         s22KUywLrBxM8bHzrOmdUzNP388DrX8XknRZCw63JS6nkMKi2gpvkBQ3N6kMPQFFJibm
         GdcO010w4yy945erZpHEPxKmMXMZvKgqnqXSj6ZMASuQm0Xca84qpvEDmldt1ryzCFIo
         sWVn3JuUPTSuP7rEer2F0lVHQLtR5ujxS3T2m9ZtHYLl6cXZbyTWrFCmfQ0vFPJQHe0T
         GNVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjmimyTl0uzBnLrmgcK2MmGIf1HFSRFmI8Y3J4krkgO9rBT3ZELu8wwdiqWMCgV45eVmexei678L9vs9k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBuHORp4YTZi2pjaKX3x55VHMBShW4N0vc9ugA9dYpR7MYAoRq
	Ulmolk7Rji8cxB/A4f9+Wer5nG1PCeXTH1kb5LSg0j2+oM5152FzKknV
X-Gm-Gg: AYBFou1ByhE2zrRoLNkq6GxrLYf4yWuI+ssxvQYy6k0EoC0O6VDItHpu0qFws9NS9RW
	zcccI0luw8cy4I3LBxfgPzaXuVo0zbzae7HtmXQKO7D19COX2OZu33Kafw/gTNutJeYXj7sU0Na
	xrxYGIxcgd7JhekVmbzc9BuCgmckI9L4UwkJjOYZY+oGuwUNNyfcXFhVs2O/IAwQm+0Kt9i0zPP
	a6JS58nm4ODBMlyqGRhOId/y1qNANuuu5P3RSMC302S/RD0u7clHg9W79JUCDbHZwKw7fleO9qZ
	L1aGrzV48phAU6+mwW+CXS2Z/U0Jq8HCTBHMy8cmh5S6NLShBP7U3AIv6fo4oKA1nEayJz2OzRw
	3E3hs9zNiYZqlkdylcMICUwEOkWWkmQu1H+CsBliHZIPf0Xv53yFqIgqkn0VMCEMNZcaYTShsIZ
	qsdiSQ3HDp8rj0Dz7iU1pRWfyATBjdaSihjy/LB4HID3Q8y32N8TyknY/SlkNfPd2vw/l8uXcId
	T11tXx1idE+svtF3IQU13So22Cdxf59gZeeKVY8ywdZEeQipRIH6aFkxQ9qiUn/JoYyFZ1/0/nE
	ZHjzvHCWa9rJoZH4roEyOrWuYdsMa35QicAkR1TqtjG8hQ==
X-Received: by 2002:a05:6000:4a19:b0:48e:55c3:efe8 with SMTP id ffacd0b85a97d-48e649ad4cfmr9818193f8f.8.1793307570500;
        Thu, 29 Oct 2026 13:59:30 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6eb9774dsm730998f8f.44.2026.10.29.13.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 13:59:30 -0700 (PDT)
Message-ID: <102aa257-9816-4e56-ab90-f3edc2a725c5@gmail.com>
Date: Thu, 29 Oct 2026 21:59:28 +0100
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
Subject: Re: [PATCH v7 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
To: Chang Yu <marcus.yu.56@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joshua Crofts <joshua.crofts1@gmail.com>,
 Shi Hao <i.shihao.999@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20261029074851.216029-1-marcus.yu.56@gmail.com>
 <20261029074851.216029-3-marcus.yu.56@gmail.com>
 <533bca43-8de5-4295-b226-5ea3742871de@gmail.com>
 <auN2jwQVr-GSnZvF@zephyrus-g14.localdomain>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <auN2jwQVr-GSnZvF@zephyrus-g14.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 5:38 PM, Chang Yu wrote:
> On Thu, Oct 29, 2026 at 12:20:24PM +0100, Jose A. Perez de Azpillaga wrote:
>> On 10/29/26 8:48 AM, Chang Yu wrote:
>>> Add a driver for the AMS AS7343 14-channel multi-spectral sensor.
>>>
>>> The AS7343 is a 14-channel spectral sensor featuring 11 visible
>>> channels, 1 near-infrared channel, 1 clear channel (VIS), and 1
>>> flicker detection channel.
>>>
>>> The driver exposes 12 spectral channels (11 visible light and 1
>>> near-infrared) via sysfs. Runtime PM is implemented to stop
>>> measurements and enter SLEEP state when the device is suspended
>>> or torn down.
>>>
>>> Future patches will add configurable gain and integration time,
>>> interrupt support, buffered reads, VIS channel, and flicker
>>> detection.
>>>
>>> Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
>>> Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
>>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>>> Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
>>
>>
>> [snip]
>>
>>> +		/* Check for digital saturation. */
>>> +		if (status & AS7343_ASTATUS_ASAT_STATUS) {
>>> +			/*
>>> +			 * Per the datasheet, ASTATUS is self-clearing: writing
>>> +			 * the value back clears the entire register.
>>> +			 */
>>> +			ret = regmap_write(map, AS7343_ASTATUS_REG, status);
>>
>>
>> isn't that the STATUS (0x93) text? the datasheet says ASTATUS is read
>> only and ASAT_STATUS clears on access, so the write shouldn't be needed.
>> it also covers analog saturation, not only digital
>>
> Aw man, how did I not notice that?

easy to mix up, STATUS and ASTATUS are one letter apart :)

> 
>>> +			return ret ? ret : -EIO;
>>
>> -EIO reads like a bus error. as73211 returns -EOVERFLOW for this,
>> wouldn't that fit better?
> 
> Sounds good to me. Jonathan, if v7 goes in, can you replace this if
> block with:
> 
> 		/* Check for saturation. */
> 		if (status & AS7343_ASTATUS_ASAT_STATUS)
> 			return -EOVERFLOW;
> 
> I've tested the change on hardware and everything works fine. Or do you
> prefer me sending over a v8 instead?

with that fixup, LGTM so:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
