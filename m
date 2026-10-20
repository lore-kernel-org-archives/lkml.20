Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513702;
	b=sbIfgSXpz8t9OtndBNq0CVNnV9B/cbdnUtFR3YkPJPXl0Vy6B6v2il5uJ6/LGJh29Af7
	 w9jXGk70MmIv7vTSFbk/FCgm1lskWpWdCZHHuvn/8HwZTpZBe6B20bbdKM3U1b+KPI35e
	 iDr6/LvnJZq+4CCsXJfxRadp2XFFkTFdC47fhxcwnc1htOq9CtisLbUQ7Zed63n03rYbP
	 lyxnKk5OqId3ZL5Lg7bfxz6HiQvAxJdktTPMEvFW20yw8vsBOoGMx1a3PyQuxl3hjahzY
	 erChv/LO8hXdCRAOH3mCPPysONZcRj9Ev68Q0mhHsEpzmg7QS1Bomp5SIKTjc5R2ymg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513702;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=cFCna6SUD0Wp3UCxIkX+ZlOhx4JI52T+zh+uPphPJ/4=;
	b=UapMgbTnQzMn64hN+wJTHWeG1+lLe0/onI5w+heBRoh11cq0gEFk+GKC4jcTSEsGh93O
	 1wlscLXfXrdY8EIX4xefmmW4zVEc633ufq9FXxXL5bTVPeJEWH3e6cg8E9WZwF0hD2X4T
	 WtojKHAmTQe7Q0Qz23/iCEniPxBmsWu0kuNEAkJ8J408m4wMdDhHd6ETwNN3RgOdwtsAx
	 3bmhoxs08KimfeEeoKdOBjl1uf7UXM+WZFIPjUw2yGHOjw4HI/YKrFdGmAq+cMBylZuR8
	 m0ij4j91bBft32xnEwQ8XtrwEGvlzIr331Hi/9xw3CcRkCpCDJj9nF2m+fomQ+YZPTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uraJsGDJ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C78E606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:28:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C78E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uraJsGDJ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6443D4E4128F;
	Tue, 20 Oct 2026 16:28:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 394E660393;
	Tue, 20 Oct 2026 16:28:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6B20103289A8;
	Tue, 20 Oct 2026 18:28:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792513693; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cFCna6SUD0Wp3UCxIkX+ZlOhx4JI52T+zh+uPphPJ/4=;
	b=uraJsGDJfBDuTtyvTlJGHCB/EkKY5UwwXFAsSloHRoPJE3RW6Sfqa5/WUjXoRFwij9SJyl
	4tUrbvb1PMfHQYNSJy1p59wBH1GKnPi9nDTLewcnBqhj7IHcIey4aZBiLXznJCdgNoDwZG
	KdrPxPaYP6cgbENhlhw2Dk39r9mMtKsqZDJG7A6A2somMYjwJhW3dfAUJWievmPaqSLrFx
	d/OZpCYPjZOUSzQ1um+9Qvte1venYnabYEXUJeuIRBLZeHFSpHxCIp1FS6gCISb3dZ0jnV
	c6h2PjGJPAJUpcHG8uEK/v8h1az5+DcsPQZePcp8ykeCw8YXIu6QRYIJfsIVmg==
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
Date: Tue, 20 Oct 2026 18:28:11 +0200
Message-Id: <DM9T2LJER4QZ.2DRH6N9ED3B4A@bootlin.com>
Cc: "Wim Van Sebroeck" <wim@linux-watchdog.org>, "Guenter Roeck"
 <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 5/5] watchdog: w83627hf_wdt: Add minute mode counting
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Tzung-Bi Shih" <tzungbi@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261020-w83627hf_wdt-improvements-v5-0-90b226684fc7@bootlin.com> <20261020-w83627hf_wdt-improvements-v5-5-90b226684fc7@bootlin.com> <atd1wP1cELjiwjXT@google.com>
In-Reply-To: <atd1wP1cELjiwjXT@google.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Oct 20, 2026 at 4:08 PM CEST, Tzung-Bi Shih wrote:
> On Tue, Oct 20, 2026 at 10:11:58AM +0200, Paul Louvel wrote:
>> All of the chips supported by the driver can be set to minute mode,
>> allowing timeout value up to 255 minutes.
>> Add it to the driver.
>
> I didn't review the patch carefully as I was thinking about a fundamental
> question: isn't 255 seconds already more than enough for a hardware
> watchdog?  Why does it need to support minute mode for timeouts larger th=
an
> that?
>
>> @@ -49,7 +50,8 @@ enum chips { w83627hf, w83627s, w83697hf, w83697ug, w8=
3637hf, w83627thf,
>>  static int timeout;			/* in seconds */
>>  module_param(timeout, int, 0);
>>  MODULE_PARM_DESC(timeout,
>> -		"Watchdog timeout in seconds. 1 <=3D timeout <=3D 255, default=3D"
>> +		"Watchdog timeout in seconds. 1 <=3D timeout <=3D "
>> +				__MODULE_STRING(WATCHDOG_MAX_TIMEOUT) ", default=3D"
>>  				__MODULE_STRING(WATCHDOG_TIMEOUT) ".");
>
> The patch is obviously not based on the watchdog-next branch (see commit
> b152ca999c5f ("watchdog: Replace __MODULE_STRING() with __stringify()")).

Thanks. Indeed, the series was based on v7.3-rc7 tag.

--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

