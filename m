Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229723;
	b=0Ogq7BXoL9sXjIcOqilFy7psYyTMKdE7sSUmqX78C5T9IRSDeFCKEFMI2lYBmSZMof/5
	 2OwJsw7dk/8jF3lBFQztyW9K7H9LYOa7Ed0Vy6NQFGkxPFjBft1LCdc252LhTNdyQpkHI
	 eUn0/41d/n2lf59od2CGlW5SB4o8rVzbGJo10KwfOcbQyfcbhCJwRnG12ZqOLmj2lX0hb
	 H5Hsmp81CgcncaOMPY71tJRp3wPYpMuo3SVaKbTYP0tqORefJP6au8WXhjjgG/QdlKxpG
	 ztaDCBKF4BqM3wa+8juiFo4XqsyoUGY1A4XPH844QfHHBQ7UjKZHNFfI33IXHigjASw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229723;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=HeVyPfr/vjE25DybJiBv8Syth1+FEFh3PPc4LRQJ8dE=;
	b=pcd5Dk5EiVUnhYRcHWzasqrS+BW+rKwihF8GVVIl06z8bmnWFGCIEP1FALMdjzZTimEV
	 ILFT9V9kdBM8Drp5ZzuWECZhlh1DFbqlEXYRZYlADDyyhK4Fbiz7COrwtRsmUm9O01pTZ
	 yXktI+GeGhIBI1ORq2MItAlnF3vn/06mlimZDQOtRTQ3L4CPFIvDbnZlKoQ1+Z4J82Ww8
	 X8TcqtOQ+JoDYvWEkfTBIwUMEejrIe/S54BrhNS9zYCofrJvAM+SYIAeSL2Z1gXdrQsVj
	 pcrWGvzztXjOck6J6Tf9tTq6QMom98sQk4Ah+6nGgfFgt1I8ivTYkFgOA6hu5kP66ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="MhAo/UNS";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CB5606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74CB5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MhAo/UNS
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CBED41A15D7
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:08:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A1B960051;
	Mon,  9 Nov 2026 13:08:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F432103293D5;
	Mon,  9 Nov 2026 14:08:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794229713; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HeVyPfr/vjE25DybJiBv8Syth1+FEFh3PPc4LRQJ8dE=;
	b=MhAo/UNSj3XNkOOjcnCeV+/gaS3CQ9M5C49WyjqIl/9AGQpJmUMj+m5O3BzGh5AQzHBKwm
	khHSnDtD+4hpvup/3UnjLjSFrAZLyXwRjb4zp2HU00ZNEZOESbkZtoelJr/Hl4kmCjjx65
	LPYhRpXJXoMgnhcxk+ln4fv62+hySgpopJlpdUoZUG7jkzVMwFuYClTdA4hYnVX0M36bPL
	y9pMg+NV/iZo/T+cfvj9zl5Difl5BXQI6m801HvYnSw0IHfUZxQoXbaf3Mw7N35A0KSP9Y
	mHHGTLLurmP1qKe0PCGL8g1D+LcPiA8KeEvDUITdzsN7HB++rvxA9VDaKV+/Gw==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 14:08:31 +0100
Message-Id: <DMQPCM8MRHES.2CRX1939ANVY3@bootlin.com>
Cc: "Tzung-Bi Shih" <tzungbi@kernel.org>, <linux-watchdog@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 5/5] watchdog: w83627hf_wdt: Add minute mode counting
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Guenter Roeck" <linux@roeck-us.net>, "Paul Louvel"
 <paul.louvel@bootlin.com>, "Wim Van Sebroeck" <wim@linux-watchdog.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261020-w83627hf_wdt-improvements-v5-0-90b226684fc7@bootlin.com> <20261020-w83627hf_wdt-improvements-v5-5-90b226684fc7@bootlin.com> <865349b3-77a5-406e-96e6-f8187ae112ad@roeck-us.net>
In-Reply-To: <865349b3-77a5-406e-96e6-f8187ae112ad@roeck-us.net>
X-Last-TLS-Session-Version: TLSv1.3

Hi Guenter,

On Tue Oct 27, 2026 at 8:35 PM CET, Guenter Roeck wrote:
>> @@ -504,7 +523,7 @@ static int wdt_probe(struct platform_device *pdev)
>>   	wdd->ops =3D &wdt_ops;
>>   	wdd->timeout =3D WATCHDOG_TIMEOUT;
>>   	wdd->min_timeout =3D 1;
>> -	wdd->max_timeout =3D 255;
>> +	wdd->max_timeout =3D WATCHDOG_MAX_TIMEOUT;
>>  =20
>>   	switch (chip) {
>>   	case nct6102:
>> @@ -526,10 +545,27 @@ static int wdt_probe(struct platform_device *pdev)
>>   	watchdog_set_nowayout(wdd, nowayout);
>>   	watchdog_stop_on_reboot(wdd);
>>  =20
>> +	wdt_set_timeout(wdd, wdd->timeout);
>> +
>>   	ret =3D w83627hf_init(wdd, chip);
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "failed to initialize watchdog\n");
>>  =20
>> +	if (data->early_timer_val) {
>> +		if (early_disable) {
>
> The purpose of this flag is specifically to disable the watchdog
> "at module load time or kernel boot time". Moving it into the probe
> function would delay that and is therefore undesirable.
>
> On top of that, the flag is pointless in the probe function since
> the watchdog core takes care of pinging the watchdog until
> userspace kicks in if WDOG_HW_RUNNING is set.
>
> Also, any change made in that regard should be independent of
> introducing minute mode support.
>
> Thanks,
> Guenter
>

So, the w83627hf_init() function should be called inside wdt_init(). Then, =
this
is a problem introduced in patch #2.

Thanks.
Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

