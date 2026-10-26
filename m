Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793033169;
	b=F5KOtddHGO/rMwgd70E60BnnSEubnw7z/n6pcLPTiRej62mdd4e7ZuQYmZJx8aZmnxPG
	 UngOXnwf+5zXs2d1ihhGs4tk2hia5tkYqnttmIOVlcEuJayeXj6seSvaaJlbawPrLpU/r
	 zCstXXHAauh0xb3D3bvL8SceGiJXu/400SGuRsGUZ7UIT59cKeuBrYOm4alMX8Bv2FWKO
	 Zyil3iyIZTmuXUmpcGwVJqbF2nV0t9hV9/DfrlNDWOWvazk/EsYzmgyX/Xtp52//XfL6i
	 kGTPpoLyZhCVODb8rMTSAATdjBHfsuTj+Ge3nS4CGkCwH4eXbkO3JYn6DyrpwVdYIxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sbR6KDZ54pfKvX4mBD6E1CqiOyZSCDGH5Y/Tf8ZG/yY=;
	b=if7+wc1q5U+ixIlL+YE97S6GaHV785Ud7rvyEdpXjYYHkmU6FZZYrrpPXCeGO8L+AbuN
	 Ya8+d5dF4gAQZqoRB2HQPO2mhW9WzwueYj1Z8rTN4V+7175Fsmog24QXRIPHLqIfrWvNl
	 BSnS+Z3829YAF2FNJdDfP0gOtEY2mfZtyWwB7yGYx6vEalrQ0iJJW1pc5bQ03qMdOVljk
	 14iXrKs0W2gBkEhutoRz6wfKIJ8b2TUN+KRGCQKZw9Rcdmq+DdJNYEUMPozMZli+e8Eun
	 Ovs09SqfjohXOUj1Bdf+X9O0IizxL21l86WMw7rCk3wolTheUqT0yYNGX5z939r2aig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AX0BSiXa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A23C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AX0BSiXa
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso4569818a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:46:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793033168; cv=none;
        d=google.com; s=arc-20260327;
        b=DppVLHnPBTumGG8hJ6vWAVews7bCkuyHrWH+fAdbHPShXnpEFQincgYrXn8CDpjOCw
         JtW4z220bIxijQm2132YQUh6g7fFAWvw75rzDP6FZ/6NdoUlR5N7fAaaYa2foqCDqLvV
         HuSzyoFT7Zpr68ZtPQuMPhUH8Fwea/jLlzXDP0E15HZm7Cyc0s8i1J9P6MjmQ1EUZIEj
         rfmf9YBrj0ntb6PyUIe8XLj8+cACh/Hd6dvv7i8sXmYOZNnmT4ZDg/uvSi1xP9TOL5B6
         3Wug33LMcfQGMy6GiG5Ve9UVQG1bJRjh3NQKk5GdMkEwPSpmgmujuLmOjghVDwsbCPAC
         fP1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sbR6KDZ54pfKvX4mBD6E1CqiOyZSCDGH5Y/Tf8ZG/yY=;
        fh=YjHkjBOWRoq2lex1mleD4op+dttU8Q9dKuDF3Qs1ecY=;
        b=AAoAULEx8dNfE3mCr5eJ+zl5yFW30IpzTV/4w0Qtn5xu/Pg7uXT/F5RQ8u49Gad3Oy
         g1j0tuY+suf7JpPQjoQPelOIsTekWjha2/XPys9gF3Gpsaq4sIzIZgi54XOi3VwiZYtA
         M+4j1B8jICbSe47OabH86LHuwJYGGGuStd8qQeop1aoWOdW7zVi0QyjIQEosDuc7h8jO
         mYhJcfdLA49dwVxsxPxrefDSH96WAJpFGz2omv6aPl98rZhjwDxR4dBQ5x3ByzdyH2Az
         6LA3HmFtfwwfY3MRDb3M4rRZrXB/Ttwh31rWi1DFk5/Bz0F2/BGBqLHGOfzOluLUjrA1
         kYgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793033168; x=1793637968; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sbR6KDZ54pfKvX4mBD6E1CqiOyZSCDGH5Y/Tf8ZG/yY=;
        b=AX0BSiXa2lBj27xGT3tpruTLaYnPuIGiwcRr1OoikuMPFqLcU/g1BaPP9mqV2J5fRX
         E9epG5PZ29IlPZSnWMT1X7cLDLRBDuEOwaLIzWTzLV7OEDv00QF5qUxVjdvlnACt8ocM
         FHGCKL0vcy5Kn0brK7JX9F3uhYq/vgh6FPhBZ6XqDe19mVIHykSRSz5ECzajboHSAA5o
         qUsLj58ajQ1DsHtbum134asY/tyVmq1IdSDRPIe2dzvU8XZVgR7W1mXnQVUmPDxw28n1
         z5iCsI8t5KO8U6e6paH9wR+VWVkXJB1pq/goWdBs9FlAfc8sN0xzo+H8Z46V+ezYckhN
         GfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033168; x=1793637968;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbR6KDZ54pfKvX4mBD6E1CqiOyZSCDGH5Y/Tf8ZG/yY=;
        b=01vh2hfUFP3HL/3NktQ2Qb/RKqMkcFhe4usxpvH37MTdtA3U4zdX5gftGF+xn55/+C
         cbSuBTS5IITtnqDYHW0XkkW4CrefTaGfRflh96eab1n54u0+biJkRhS0djNf64t6ES2t
         WL/hb5yxAmhQw8wCy9NB0RcHWmtUdgkzRZ1hAcByXOb1PJxOCBV52Nnd4UtGOpZOnnPr
         toLl8viUdj3nys6x++woXwuSQEYY/oDi19QTrgh/3pRnoq1VMIzUouTJGxKBOIQhMIFf
         Vkpi3XaththV7i9ee+4v0+C6blzw05KvxFHC6s4MfIfnbTwvTFnciFTBetZzCzbHew3D
         U06g==
X-Forwarded-Encrypted: i=1; AKwUvByeroJtg8570aRcTek0oAnQUFV5zY3aoQ+nky0DyrMYqbWVJ0HApVGHPTF5QdDk4DZSXepqoTPSp+vThYY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0ZkVAwvPis0Ik34o7dBhUADWKvf7kcQtgqUfCJX33Rgh/ZG7Z
	79PDOkZzI3LxTbIIICvVJNBBKonxvevMUni2EsRsld14LOyjxo3O/48WYaUnyzyhMFFS3LEhhk/
	uG7T7yTnMTHGIKp2/dDPa+jy8pGX9L/A=
X-Gm-Gg: AYBFou3XFg5T2waZXLySpf1N6ENZzStltKK5H7rkEfUrYSveFWPTF+ACCi5PKbNs+wt
	XqU7boitiMP4J9roZOFibGXU4zrz8LlZ89L2bQuHTPi9O8ZnJ7pAHp39x+ThH8eR/BSPPi53AWs
	yMGtoF1edMuQzqtkZIFqhqpJSxJHEdrgSISJXeGPDt7LYQpMZdE/Roz6BQkIXPwLdZ8tXQi8ifa
	s9y+Wz5SuHNCDwSnGg4yCcwTU8QxjOU19nxx5mY99fgfLYRz6lBAqxxH4S1u1eH7YRO0XZxjMQ5
	d7JUIpsHmqBQJBYgLs7mx0EhPtVLbSokTuz6GihH1I41+x0k44MXSL4U/hYQDAk74uX//f1IKff
	fzKaMzZr0dodupmLLRSZcF7sCO23DUAMHhaI1AAybzOC6Oaoniugq47s4t3ewm0qT368pu0B6Wj
	67MbIN/jkAYhlvZbCGg5xPWBr4ehQP7rQolQOmnfhe3SUt8uHTZYQvdn+fFmAxPaCbvS/gclZTt
	wgTP5m60ietx5CX5tlPloY6FuXnOJcj9XUqjuY9DMhFrXeIEmY=
X-Received: by 2002:aa7:ca44:0:b0:6b1:b611:a2af with SMTP id
 4fb4d7f45d1cf-6b442ff2fd3mr6024136a12.20.1793033167557; Mon, 26 Oct 2026
 09:46:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
 <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
 <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk> <at4bw-G8czG-G7Wl@ashevche-desk.local>
 <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
 <at5qKehogAjTa-fA@ashevche-desk.local> <CADvTj4qSgE6Rc--mWuqAcc8HTqN9EFOS_JM8Hp8e_=ka_ZLa6w@mail.gmail.com>
 <at8eDFj2WNaXDaot@ashevche-desk.local>
In-Reply-To: <at8eDFj2WNaXDaot@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 10:45:54 -0600
X-Gm-Features: AclHuK9i3gJhID1qYhY2EyC-ofDyvA_hJVRAckf-dNWT3ME93Ru8v8ikGWkk384
Message-ID: <CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfdCHNPo3pS6w@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 3:33=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Oct 25, 2026 at 04:11:08PM -0600, James Hilliard wrote:
> > On Sun, Oct 25, 2026 at 2:44=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sun, Oct 25, 2026 at 02:25:46PM -0600, James Hilliard wrote:
>
> ...
>
> > > Some people might want to test the stuff. And sending too often you a=
ctually
> > > will get the opposite results, people will be tired to even start rev=
iewing
> > > and/or testing your code as it's changed way too quickly.
> >
> > My thought process was that people wouldn't want to be testing code tha=
t
> > had known bugs flagged in Sashiko reviews.
>
> Sashiko reviews are not visible in my or any other mailbox. To see them I=
 have
> to go to some URL and so on, meaning to waste time to see why on the eart=
h the
> new version has been sent.

Maybe the Sashiko reviews are getting caught in spam filtering or something=
?
They are showing up for me and on the mailing list[0] so I'm a bit confused=
 why
you aren't seeing them. You shouldn't have to go to the web interface[1] to=
 look
up the reviews.

[0] https://lore.kernel.org/all/sashiko-outbox-183574@kernel.org/

[1] https://sashiko.dev/

> It's better before addressing Sashiko comments,
> reply to all people involved and to Sashiko's original email, so it will =
be
> visible in the previous version why you issued (actually about to issue) =
the
> next version.

Hmm, maybe it makes sense to enable recipients in the reply_to config[2]?

[2] https://github.com/sashiko-dev/sashiko/blob/v.0.6.3/projects/linux/mail=
ing_lists.toml#L290

> And before even issuing it, wait for a while, people might
> disagree with Sashiko judgement or your replies on how to address that.

I was assuming everyone was seeing the Sashiko reviews getting posted to
the mailing list already. The are ending up in lore so unless someone isn't
subscribed to the list I'm not sure why they wouldn't be seeing those revie=
ws
already.

>
> TL;DR: this mailing list is *not* a playground with you and Sashiko, the =
whole
> community is behind it.
>
> > > Settle down first
> > > with something, put on the cover letter the answer why not all Sashik=
o's
> > > comments are being addressed (for example, due to amount of patches o=
r the
> > > series being focused on a certain issue).
> >
> > So, in general I've been always attempting to resolve known Sashiko iss=
ues
> > in every subsequent re-spin, so that would be a bit tricky since I woul=
dn't be
> > aware of the Sashiko issues until after the series has already been sen=
t.
> >
> > Usually the subsequent issues that get flagged are new issues only disc=
overed
> > after each new re-spin.
> >
> > I do have a bunch of UART/DMA related patches that don't have flagged S=
ashiko
> > issues so it probably makes sense to try and review those first while t=
he larger
> > series that have Sashiko flagged issues are still stabilizing.
>
> Yes.
>
> > > > [0] https://github.com/sashiko-dev/sashiko/pull/389
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
