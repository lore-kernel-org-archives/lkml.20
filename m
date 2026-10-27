Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793114934;
	b=N2iN0o3AJ5kQ5EfvaaB12/1bJqILtp34AGHHrqEc21L0OgEm3J3u1KeBTiaGI/5xepj7
	 Lg5JJ4UPqqWn9+IjRLQKvJQjowyPeeFxcJTovgfr+sX8BJH/0lP5D6DGOlupPfI2pwNh5
	 C90qGIT6ld1QVYGyKwpU99bzOx5NpHJlfGO0E1ZpaeWFdIctpiUfyrhePE9ERyqrSdOTQ
	 XKPW3igKz1MH54lEyQDR7DuQJxs9TS4wgUxngb1REzauTLOmoqckoH5gfa1dsGFYKWX/z
	 KzB7WsvNexLv2ennSs9o972BSnVroilXpKAYJuF/ubL/vL0MfaI48UJo3iJoMTi9ZPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RkY0jR2tNaxmakYz+PwhmAi61g5vTA+2lieqrxAvwZU=;
	b=j3MD222JMPEmLIm8dKBkHUKPQtLhaxvOzoOLzAWC6gCa5AgIjG2+F6TO0HpDtIVJ482/
	 NuzVmG0N3K3Bi0T4uBbKzvAZjt4cjHY0TvkF3vNP6qTk69PHtY10cNy69aL1aroJ+5B7/
	 O1IxKxD0q8OA3W2ue2QH9llTANE0vG/GSR66a8+ET3mNJMk4oHc/F/SYK16Aq3M7hpixI
	 52uoxwdgVdyesjEWgYCniOdXeny4xNON+ciTxizC83hGL7zX5UdfWjiD/AGvvYchzjcGm
	 ufcKzwyUXWMQcjMeXRqmftl0NEXoavl6pf80Ke1/M94Gb7DuHCztCcjLFjt7BO19BnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Dc/tEx0k";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5419606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5419606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dc/tEx0k
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eaf169fe3dso8356e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793114933; cv=none;
        d=google.com; s=arc-20260327;
        b=IuhGxKmXy4DSfdAnduOf8iyTHFFyj2u0LahCpJWLHyBT8N4EFJhkCsNDk73X2hvwYD
         Eg5YJBtckNiFBRtSFacb9ZsppA3qw21u6dvGTKyoYgdMMt3xpXh5lA4/UazCUX+f4c8R
         Cfpgs11VaGYQcqmSAYmFcyqZTRiECh+uJRK1HUc0gv+F3lN41dEZQc2HuJ0psaiF3kFw
         FH+G2cRGzU80GVi1eZBKQCl3U1Z8VKL1cJ6c3YxhYzPjabPl7EnTPsxEaFT341FUdDU0
         rIOfTo4vlsynJAuXP5F72H9RiU0vDnnGpKmqkoGlC31cIiP6uqyiMmEyMlTrXoYkmKCb
         pocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RkY0jR2tNaxmakYz+PwhmAi61g5vTA+2lieqrxAvwZU=;
        fh=9rG9tjiNuB6a6Wel7eGn64NhmOGIc85RkUvAGCAJU3Q=;
        b=JKB8A8lfcT0lGaQmuCg9jgAdgpLCKyNgum4eStIa7c+IJVWn32lmwfrhlzPhkGcDXa
         ZCXTMea4q1XWAOl+25VDJ9qvSX79zyoXrWzlJp4US8BVaXjphUgwojyQvMgBMqbBvNDf
         PlMNDMfbe1PvThhnvnZwaPbhqajSdiBHRyNfEedR42H58jnDz0en3GLZMt98Tnl72lgE
         Xqd5hVJENzW1UIQb9+ajCwatL64JUBCnklVLZRyomfpne2bsFLHxMSHZwMz1zvKK+R/U
         Xfhj+N1I2RbOSNfBI3KlbFz1Qb7XHouucU/mH9N827ToWPeBUKCKX7fyR9Oj63NBp6OE
         +GbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114933; x=1793719733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RkY0jR2tNaxmakYz+PwhmAi61g5vTA+2lieqrxAvwZU=;
        b=Dc/tEx0kaHfZgKsDs5kDOxqSIFa1NJtbxxrFsU7TKkhjR4z8QKJLLcXRiOIFRPsqlI
         2n3v5TbH8HfVzroHa/HHD/HCu2YUPr0ZH4nSjMoYgDA7GKJmSRfQ5DuGT8RRj7mqIAEX
         qK1cRoWqGwGJpo84kTheR0/7ubPXIfFMk+Nhpy8KRiqgMYzY3sfs4TsDLw3O35VO3iVY
         khtxIzeYv+UZ5ewpns1Z/4f21UKcYhdqA7nAXAAiGetGLpWQGxiwxfgXdum8p3DBMFI8
         t8xI8qbutCspC/1H6SPxgiSx6Dr3uoV9unVYFMEz++TJSs9/QywA/in5D9EeCT6YE3TV
         ggoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114933; x=1793719733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RkY0jR2tNaxmakYz+PwhmAi61g5vTA+2lieqrxAvwZU=;
        b=ZuHwYAAfAiRKUVxoO2kK80NRdfqX7As7UXPzmViZPHmEY0yzFk/Xx5j8drfAta+bNp
         WSLp9GOBhMc2dwMzB+ToV1d0ffyut+CPr2auDWTeY0o4X7mqY4W7yKJXyEyy3kDFd7R1
         drXV+h9EGnkgVwH5AV5DjXKnzno3PJQV7PODGcmFS4IfpN1be7Eo/jLCNmFx/ATBsNhz
         fP2mjtj0+Ro/4agAPnKNq6xLnUh+IWo7noGkWE6V/NMgEv9hAXXglVTTpL76b3NFUYWP
         uSXWDn8uLIoM0b3dBwbnG0NxDTanYnqWXTvXdrBKmidBfZDRmIPBff3O5cLYJcjPD1Bb
         r3RQ==
X-Forwarded-Encrypted: i=1; AKwUvBwO8KWoeX0Y6KUUDfeW6V3pZ4NM3kILzrlga6KP2CafI/cJaKmr4eq04+laVl/ogORC3k0rVsiTeBymTc4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKT7iYWPbMhLqtXbpJ+OlLkec1h164tl7pXBrEcwkecNpxTcFTY
	EmOdhr5O2d8imt23eUBM/K5UiJGiYamY/QkCYYSG3VhFVvxvMEv6zJYd8PAwDuTt6aBsyQbebFS
	PlelL3blLM2apWlqisL/xUp09L+yUtUM=
X-Gm-Gg: AYBFou1K+Lk3wyniLP2LAazQHXqMKR2D3wbp91uM86Ci2baPflYKsHSFNLcKXVt2HNY
	8TKm6tnEmbRws411AaDigwOWxzHq+mCbRJQVzKhjr3pQbVdVrtgCNuVDC7rgOlRZN6j3CFStRA0
	2XZRAWzDYMotlBZJAI5dJzSnCPwk40nqPDX2IENxGPdy4/T2J5yzejHv2CAOK6E51LEY7ZQbVXk
	Jaa+AM0+AKXXaPOOXBY5AwonqUpH4xHMye2Jwicb4G8SjKtdqPLB9JFtqyA0rQyw2Jzw9cjqzK9
	22gr4LcDK2cuG6VAVcBbjLpjZbfb/acO1l9JPXU5iH3OTHMqUiOkWadLmfAO3BUKrobzXJmSwV5
	hYzCxF1q0VaAU0mV/86+W1hbPrQdOyay5SXwxeSaK+rrJPvpYBpY+qGbshQCZul9hZQY0RUel8Z
	8HAc9v2ypZ9+L7zTNCKwZoxvKjUF4GH0Y7lZkxa9yzWyZcp6LrFh/t61Pn5nv2U0IzaQEqYzfC2
	R9TaYzgluqjvjmMQdi+9LE+EEf4/jw=
X-Received: by 2002:a05:6122:1d89:b0:5ea:e197:43ee with SMTP id
 71dfb90a1353d-5ec232b6235mr4271556e0c.19.1793114932623; Tue, 27 Oct 2026
 08:28:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-tty-llm-v1-0-99b0202ae546@linuxfoundation.org>
 <20261027-tty-llm-v1-5-99b0202ae546@linuxfoundation.org> <46833c7c-9c49-403e-bdb6-e9cf5fc2d3aa@kernel.org>
In-Reply-To: <46833c7c-9c49-403e-bdb6-e9cf5fc2d3aa@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 09:28:40 -0600
X-Gm-Features: AclHuK_uG6aE632FFwpS4ZtH3m-wmT4lHFFQsOd2wWzTozHVQz9-cTtEPbc7vg4
Message-ID: <CADvTj4rcjgtrPB+-0OtX_ubBkWxn6A+Tjt5Hv-O-0FhW4hEmeA@mail.gmail.com>
Subject: Re: [PATCH 05/24] serial: 8250: clear subdriver state on port unregister
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joshua Rogers <linux@joshua.hu>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Tony Lindgren <tony@atomide.com>, Rafael Gago Castano <rgc@hms.se>, Florian Fainelli <f.fainelli@gmail.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Peter Hurley <peter@hurleysoftware.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Crescent Hsieh <crescentcy.hsieh@moxa.com>, Frank Li <Frank.Li@nxp.com>, 
	Sherry Sun <sherry.sun@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Olof Johansson <olof@lixom.net>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Robert Baldyga <r.baldyga@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, 
	Kukjin Kim <kgene.kim@samsung.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Al Cooper <alcooperx@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	stable <stable@kernel.org>, John Ogness <john.ogness@linutronix.de>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Fushuai Wang <wangfushuai@baidu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:16=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> w=
rote:
>
> On 27. 10. 26, 12:06, Greg Kroah-Hartman wrote:
> > From: Joshua Rogers <linux@joshua.hu>
> >
> > When serial8250_unregister_port() re-adds a port as a fallback ISA port=
,
> > it only partially resets the port state via serial8250_init_port(). All
> > subdriver-owned function pointers and per-driver state copied during
> > registration (such as startup, shutdown, handle_break, get_mctrl,
> > set_mctrl, set_termios, private_data, dma, gpios, and rs485 callbacks)
> > are left intact. After the original driver module is unloaded, these
> > become dangling pointers that can trigger use-after-free on subsequent
> > port operations.
> >
> > Clear all subdriver-copied fields and call serial8250_set_defaults() to
> > restore default I/O accessors before re-adding the fallback port.
> >
> > Cc: stable <stable@kernel.org>
> > Cc: Jiri Slaby <jirislaby@kernel.org>
> > Cc: John Ogness <john.ogness@linutronix.de>
> > Cc: Crescent Hsieh <crescentcy.hsieh@moxa.com>
> > Cc: "Uwe Kleine-K=C3=B6nig (The Capable Hub)" <u.kleine-koenig@baylibre=
.com>
> > Cc: Fushuai Wang <wangfushuai@baidu.com>
> > Signed-off-by: Joshua Rogers <linux@joshua.hu>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >   drivers/tty/serial/8250/8250_core.c | 28 ++++++++++++++++++++++++++++
> >   1 file changed, 28 insertions(+)
> >
> > diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8=
250/8250_core.c
> > index 0951d3e42e1f..673fde55828a 100644
> > --- a/drivers/tty/serial/8250/8250_core.c
> > +++ b/drivers/tty/serial/8250/8250_core.c
> > @@ -956,7 +956,35 @@ void serial8250_unregister_port(struct uart_8250_p=
ort *uart)
> >               uart->port.dev =3D &serial8250_isa_devs->dev;
> >               uart->port.port_id =3D uart->port.line;
> >               uart->capabilities =3D 0;
> > +
> > +             /*
> > +              * Clear subdriver-owned state copied by
> > +              * serial8250_register_8250_port() to prevent dangling
> > +              * pointers after the original driver module is unloaded.
> > +              */
> > +             uart->port.private_data =3D NULL;
> > +             uart->port.set_termios =3D NULL;
> > +             uart->port.set_ldisc =3D NULL;
> > +             uart->port.get_mctrl =3D NULL;
> > +             uart->port.set_mctrl =3D NULL;
> > +             uart->port.get_divisor =3D NULL;
> > +             uart->port.set_divisor =3D NULL;
> > +             uart->port.startup =3D NULL;
> > +             uart->port.shutdown =3D NULL;
> > +             uart->port.throttle =3D NULL;
> > +             uart->port.unthrottle =3D NULL;
> > +             uart->port.handle_break =3D NULL;
> > +             uart->port.rs485_config =3D NULL;
> > +             memset(&uart->port.rs485, 0, sizeof(uart->port.rs485));
> > +             memset(&uart->port.rs485_supported, 0,
> > +                    sizeof(uart->port.rs485_supported));
> > +             uart->gpios =3D NULL;
> > +             uart->dma =3D NULL;
> > +             uart->rs485_start_tx =3D NULL;
> > +             uart->rs485_stop_tx =3D NULL;
> > +
>
> Ha! The above gives an answer to my today's:
> https://lore.kernel.org/all/53624662-e94e-4fcb-9902-7fa4143c7689@kernel.o=
rg/

Yes, this addresses the broader cleanup issue. My RX-trigger fix [0]
complements it by clearing get_rxtrig and set_rxtrig after
uart_remove_one_port(), before registering the fallback port.

It also copies those callbacks unconditionally during registration,
including NULL, so a replacement without custom handlers cannot inherit
the previous owner's callbacks.

[0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v=
1-v1-1-731b78d5003d@gmail.com/

>
> (And obviously this conflicts with that patch.)
>
>
> And with the current state of LLMs, I should perhaps revive my "move ops
> to a separate struct" as the above is a PITA. I have been unable to
> finish the series on my own to date.
>
> >               serial8250_init_port(uart);
> > +             serial8250_set_defaults(uart);
> >               serial8250_apply_quirks(uart);
> >               uart_add_one_port(&serial8250_reg, &uart->port);
> >       } else {
> >
>
> thanks,
> --
> js
> suse labs
>
