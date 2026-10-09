Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7CE3D3D05
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555147; cv=none; b=XXwniqpMRhrvSx5dlcyLGQMQ6tnSpzpRCK++Z09m34dJll9zsnZfwfTuFHrMTuvcNcDkqFNNB+uEFGkDi8ztCRVh+2knqgatM/9tf+A1+hZSZCBwvU+epNB0fOWNLZawF9B5Xa4n2vkA4XqXJgFzz+G1G2v1qoBRDsGEFXUjAOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555147; c=relaxed/simple;
	bh=X7EdtncpE+VPaY43V15PhX5RMBGJedR5IM96kyTRmPc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=nZWPIJl6lm76/JFNkBSMewEtjsOcwlijW41GqCpoI0vpfUR/gdLS0eEg/y/0ESlKy4e2mIVTeZP8oMbGW9GCmgg4X6f7RiSEOcbPwYGg6F8ZynXkqSK/UQMjye7kAUOAcnOWsTpx7+mrnYRphZWH+BW96Gr1fWEFtTQYHqAZoj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OaV7x4LG; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OaV7x4LG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BA6244E4111D;
	Fri,  9 Oct 2026 14:12:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8356A60754;
	Fri,  9 Oct 2026 14:12:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C92A11D70841;
	Fri,  9 Oct 2026 16:12:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791555130; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cdZYN8ntqvipg3FYRWOYxSDKsm2OOZGI6Qs5B7jTHyg=;
	b=OaV7x4LGSW6b2FnAKVdiks6LA9di0h6IEKNQVLYWnT0py3eLzLeIzaoC7AoA+fTFRaL/Xj
	4wWvkXky+Z5f3v295TFVfUFFM5B/QGXhLcwWFHT8e0sttThRh2jox1FXUrYz+mOUvGMzWQ
	IX9sSHcM08okc7CvmcRSP2LL+XSQsZIKXadnkCyBZZUYC6iglTZv1FT+GBnFhKSdWsr8mN
	Wy/XjjpTmUzHioiFShyML8FQ+hrgMjp2c+E8hkxv06qlu/+kQlpVsFzygTVU32jzs4rnho
	k1o0ohkJw8L3ZnpPckzPPlafRA5hkmeK/MkTpEMlqA8aaP+7lDQHVx9tgGkRiw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 16:12:06 +0200
Message-Id: <DM0DAEXPSUES.3UOY3A0GN18C0@bootlin.com>
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Tzung-Bi Shih" <tzungbi@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
Cc: "Wim Van Sebroeck" <wim@linux-watchdog.org>, "Guenter Roeck"
 <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 4/6] watchdog: w83627hf_wdt: Store Super I/O
 configurations in platform data
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261004-w83627hf_wdt-improvements-v3-0-8e27b518595e@bootlin.com> <20261004-w83627hf_wdt-improvements-v3-4-8e27b518595e@bootlin.com> <asUE3iFZBbl8fVcb@google.com>
In-Reply-To: <asUE3iFZBbl8fVcb@google.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Oct 6, 2026 at 4:25 PM CEST, Tzung-Bi Shih wrote:
> On Sun, Oct 04, 2026 at 02:12:52PM +0200, Paul Louvel wrote:
>>  static int wdt_probe(struct platform_device *pdev)
>>  {
>>  	const struct platform_device_id *id =3D platform_get_device_id(pdev);
>> +	const struct wdt_pdata *pdata =3D pdev->dev.platform_data;
>
> Use dev_get_platdata().
>
>> @@ -522,12 +533,16 @@ static int wdt_probe(struct platform_device *pdev)
>>   */
>>  static int __init wdt_use_alt_key(const struct dmi_system_id *d)
>>  {
>> -	wdt_cfg_enter =3D 0x88;
>> -	wdt_cfg_leave =3D 0xBB;
>> +	struct wdt_pdata *pdata =3D d->driver_data;
>> +
>> +	pdata->siocfg_enter =3D 0x88;
>> +	pdata->siocfg_leave =3D 0xBB;
>> =20
>>  	return 0;
>>  }
>> =20
>> +static struct wdt_pdata pdata;
>> +
>>  static const struct dmi_system_id wdt_dmi_table[] __initconst =3D {
>>  	{
>>  		.matches =3D {
>> @@ -537,6 +552,7 @@ static const struct dmi_system_id wdt_dmi_table[] __=
initconst =3D {
>>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "SHARKBAY"),
>>  		},
>>  		.callback =3D wdt_use_alt_key,
>> +		.driver_data =3D &pdata,
>>  	},
>>  	{}
>>  };
>> @@ -581,27 +597,33 @@ static struct platform_device *wdt_pdev;
>> =20
>>  static int __init wdt_init(void)
>>  {
>> +	int sioaddr;
>>  	int ret;
>>  	int chip;
>> =20
>> +	pdata.siocfg_enter =3D 0x87;
>> +	pdata.siocfg_leave =3D 0xAA;
>> +
>>  	/* Apply system-specific quirks */
>>  	dmi_check_system(wdt_dmi_table);
>> =20
>> -	wdt_io =3D SIO_REG_CONF_ADDR0;
>> -	chip =3D wdt_find(SIO_REG_CONF_ADDR0);
>> +	sioaddr =3D SIO_REG_CONF_ADDR0;
>> +	chip =3D wdt_find(sioaddr, pdata.siocfg_enter, pdata.siocfg_leave);
>>  	if (chip < 0) {
>> -		wdt_io =3D SIO_REG_CONF_ADDR1;
>> -		chip =3D wdt_find(SIO_REG_CONF_ADDR1);
>> +		sioaddr =3D SIO_REG_CONF_ADDR1;
>> +		chip =3D wdt_find(sioaddr, pdata.siocfg_enter, pdata.siocfg_leave);
>>  		if (chip < 0)
>>  			return chip;
>>  	}
>> =20
>> +	pdata.sioaddr =3D sioaddr;
>> +
>
> `pdata` is still global.  Given that there are only a few settings, maybe
> we can use the same method I proposed in [3/6] patch, and use
> `dmi_first_match()` to avoid the global variable.  E.g.:
>
>     struct w83627hf_sio_pdata {
>         u16 sioaddr;
>         u8 siocfg_enter;
>         u8 siocfg_leave;
>     };
>
>     static const struct w83627hf_sio_pdata default_pdata =3D {
>         .siocfg_enter =3D 0x87,
>         .siocfg_leave =3D 0xaa,
>     };
>
>     static const struct w83627hf_sio_pdata alt_pdata =3D {
>         .siocfg_enter =3D 0x88,
>         .siocfg_leave =3D 0xbb,
>     };
>
>     static const struct dmi_system_id wdt_dmi_table[] __initconst =3D {
>         {
>             .matches =3D {
>                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "INVENTEC"),
>                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Symphony"),
>                 DMI_EXACT_MATCH(DMI_BOARD_NAME, "SHARKBAY"),
>             },
>             .driver_data =3D (void *)&alt_pdata,
>         },
>         {}
>     };
>
> Then, in `wdt_init()`, it can define a local `pdata` and initialize it
> based on the DMI match:
>
>     const struct dmi_system_id *match;
>     struct w83627hf_sio_pdata pdata;
>
>     match =3D dmi_first_match(wdt_dmi_table);
>     if (match)
>         pdata =3D *(const struct w83627hf_sio_pdata *)match->driver_data;
>     else
>         pdata =3D default_pdata;
>
>     pdata.sioaddr =3D SIO_REG_CONF_ADDR0;
>     chip =3D wdt_find(pdata.sioaddr, pdata.siocfg_enter, pdata.siocfg_lea=
ve);

Yes, pdata was still global, but the scope is limited to the init function.
Your proposition looks better tho.



--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

