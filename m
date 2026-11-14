Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794664112;
	b=QmnigsuB9zCTdh2cl+cQt6vcnfYpDNmWjrv9pyeIJLio4hCyQFVjkbefOt1/bBsMKmma
	 bYI8Z7eYI414KfLFxwk91F8PETC2/CUP+yFAaXhKy3x9E/FLdDI6g1/W+oMOEsSXM9F/q
	 jiDgY1UuuwK3oYzFvhy112IvIMo57SP7nYvcs0fFJzaWLSThZ1QmJrEamusj6tNdwi+nY
	 i2VfD7iV4+eOCb+hlfj5WiXncHDFdQjCBzSbKNcVYSKHFKfusodxMK7SPxtk2Zg8LDwdh
	 Ih4IVnx7RIx2e1cT+0tsvrTGZsg/KbXjFauvNE8N7VeqQVZ59swvtFAWqOHGlX79oKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794664112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VDgDlOGUe6uT3r1CqvgvQwBiUgaOZZaH4ErtEdDzCpM=;
	b=2CZwo3Rf7SQVQbkR10lByyKcv7b+LesJF9yyRdNuA10tLDB5pRR/aHxhTr8r1KDyKCL/
	 8qPddjIBNZQ9TAfu21X09E8+bEC9FGWYZXgS3RX23LiezaPjsOqwJuA8LJkun4P76aGP7
	 gmc0UhcYTdjkUzZSIank5gR43N4It5Y7pvYp8qhSNENrVOgB4pU5EyhdRvMnToEYvJI9V
	 PhA/CVo1cTjO5FjGSJy3v/DGVV3AHMhTnTdrgb6JFDfsSqXW/e56cGcTK11Y34mn9SjXD
	 jrJGjEMS/U1sxBXnsOQTSeRMKMt9HmxHLOMOy8sfyz15O7Y3hNFCE8xB88YxyWx69xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTclAqN3;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03589606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03589606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTclAqN3
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c14f3dab09so1628120e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794664110; x=1795268910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VDgDlOGUe6uT3r1CqvgvQwBiUgaOZZaH4ErtEdDzCpM=;
        b=CTclAqN3iyKjhwJJ88Y7yPQtewFcTd8p5Cf7k4sh1yvU2+ElFfuLmjhDhTQVwJUZuZ
         d2lExdQZE9BLDo6mMsQ3FGwGXlpifNYYLq5POfnIfjC18m/bzf4hSnpTuxwixhIvzX2w
         uSrgBkE7/OVM0QcoSPGM91YENF8whksU7YaZw3kgTbRBfD+gS+QHNdrC5dDKntFqE8no
         x6VIKgdPgUysloQOHCGWbayiSo33K4nMoHy4qkh/K12+5R2SuNUTDdTVQwtmqs6HCNT3
         B7/xRT+nWg9gSLtgp6uAV7rD/KzCxwLfQD8S9aam41KrMThX0mebHeZRCaw1X3aaS8Fo
         qa8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794664110; x=1795268910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDgDlOGUe6uT3r1CqvgvQwBiUgaOZZaH4ErtEdDzCpM=;
        b=B5EMDeoH38E9ku1A/OLM2g+0nz6vZ0x8UiUv3HOVYoYvMzTldTjbywE62p8Lhe+NhL
         i2vOEr2JUwWF1hd7fEA62VY23sNma8hBm9sT5DbGzlxXQ3XSy1Q6jAtBMAIi3JHQ7nQi
         SwV8IexYtN2vb9j4VJxuIclq1tf1nHmHuvZbpNLVYpj3EWki1VnlzIa1eMQi4SYYa40R
         zVeVQB14CtgUoIs2t6zx3Ow27Y1HRVOHXgBN7p3heDygUSDYPNcawWVM4hLE2JGkyx+t
         ovCGD4JObrH2EcCaSZJgG9W+c9coDetLrFjkODy1khGAkqXwS/8KGs+iOdXlwKkpTMVY
         l4zQ==
X-Forwarded-Encrypted: i=1; AL+hErFxNwNrp6ZHlCnYdyjM9ENlhvcijCrMgNBB7QZGpNNnRDteipr/8zXgMhCH/N8ofiIfCPXAWxeSR+To7C8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QiL42Rk1gPbG+rZNqM6aSp7lwn5SfizsAbDe4HlXSj6Au41du
	VMAdi3rvrTbdGHoDt7nJtZ6BnlrdvHPDdBAUtKkL8wrk8OqrXVBHbe11VadY5eHZ
X-Gm-Gg: AYBFou0vXNKpf+5jSF6KoLrsoSJkyas07DxMWHNk17OOWHO5eP9FvDGrpTWonncdv9L
	iFAsybyzoJne3d81EqsjeHbKQMNomGYSzM267YFzbbmK+GGsQzm5akE4ZFpaT3ail4p13JsSjwu
	SOae3C7A5zMSRyjOOr5L5n6P0eZ+CDXioSmqBXL061o5xP6RQfyCHagT3azRKtNNQvH3VKJsxNB
	M9B96oTtXkffoga+hPAIK4b0hiTCLRHkLUjtu83Z87UQ/ftEVu6HFhJ4J6USDFFkhgk1Otv8asI
	JMCW6K6SBE6zEW8SxUZQ5xx+/8Ih3h6KOSwtt9/XSCBcIHMYCgiAevUInVp/AvqVU9NQS3IIKVS
	mDG9ui9HtgJ2pcm+9+++bwKBx003xG0SeQK3ZokkZy6E5voVZR/E885bbOXPWetE/qBXhhMTQ8N
	4lOSewfa1f7DQPUe7Kv2vhe1xVkdW5XVNbTZN5tibG9eHR6z7EMY5RxwnnwKlt16JWf6Dx7gGlF
	euKLGisSivLnmqyenywQmSIVOrCKcfQ6IlcT/PlUMDNYpYEJChkvz4aEHUo0pK95tSzQlzXRl2w
	oulCGKrkwFx8CVF5c5VQWXJa7AMMAobPGTDfhOhYZVWoHdHFV+LRmFBhdLauNVqagcnozFhmd5H
	nL9KDszHX5A==
X-Received: by 2002:a05:6512:b06:b0:5bf:dc6d:3153 with SMTP id 2adb3069b0e04-5c170b46db9mr2206296e87.67.1794664109863;
        Sat, 14 Nov 2026 05:48:29 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1713337a9sm1690619e87.28.2026.11.14.05.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 05:48:29 -0800 (PST)
Message-ID: <966210d3-9a59-4d16-b003-75892fb29a64@gmail.com>
Date: Sat, 14 Nov 2026 15:48:28 +0200
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
Subject: Re: [PATCH v4 2/2] iio: adc: add driver for Texas Instruments TLA2528
 adc
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Rodolfo Giometti <giometti@enneenne.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Angelo Dureghello <adureghello@baylibre.com>,
 Tobias Sperling <tobias.sperling@softing.com>,
 Eason Yang <j2anfernee@gmail.com>,
 Marilene Andrade Garcia <marilene.agarcia@gmail.com>,
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 duje@dujemihanovic.xyz, Joshua Crofts <crofts@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Victor Chernyakin <chernyakin.victor.j@outlook.com>,
 herve.codina@bootlin.com, thomas.petazzoni@bootlin.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261113151543.2241604-1-maxime.chevallier@bootlin.com>
 <20261113151543.2241604-3-maxime.chevallier@bootlin.com>
 <ef47542e-308c-4211-9b42-ba2de13f5f82@gmail.com>
 <1be528e6-9189-42d5-afe5-298be5af6b39@bootlin.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <1be528e6-9189-42d5-afe5-298be5af6b39@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/11/2026 18:25, Maxime Chevallier wrote:
> Hi Matti,
> 
> On 11/13/26 16:36, Matti Vaittinen wrote:
>> On 13/11/2026 17:15, Maxime Chevallier wrote:
>>> Add a new driver for the TI TLA2528 ADC chip. It has 8 12-bit
>>> channels, that can also be configured as 16-bit averaging channels.
>>>
>>> This is a very simple driver, allowing reading raw values for each
>>> channel. GPIO mode isn't supported for now, as well as buffered mode and
>>> the 16-bit averaging mode.
>>>
>>> Co-developed-by: Rodolfo Giometti <giometti@enneenne.com>
>>> Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
>>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>> This looks very familiar to me. I am pretty sure I've reviewed this. Is there a reason the RB-tag wasn't carried over? (Sorry if I've missed some change(s))!
>>
>> Yours,
>>    -- Matti
> 
> You did add a Rb tag on V2, but I dropped it for V3 as the delta between V2
> and V3 was quite substantial and included changes requested by other people
> than you :)

Ok. Thanks for the explanation.

> I mentionned your tag being dropped on the V3 cover, but I didn't carry that info
> for V4, sorry about that...

Keeping the note in the cover version history can indeed help reviewers.
> Anyways thanks a lot for the help,

No problem. It looks like a clean and nice driver to me. Good job.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
