Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA9337105A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145280; cv=none; b=uAracTe9Qw0vQEZ8SA+Zv90f+xRSSYFjBidJNdcwic023NrOliR0hPRS3hv3o0kA1xcJsrUzm98EL/xorHjZcdmjQ5aP1VlBjQGLru8FAWkvMzQr80+efHyUJpuFMpOo6kz6yULkepBczkHdps/vbkHBhHqupwnWjOCVeBbWrAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145280; c=relaxed/simple;
	bh=oeOC+O9trE6ZCicbgaUCo1/XxUpGsO8dMn32zaWU2cE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JTdSi0xy2WkIv65CHrjjxLlK29omIfmAck3744DL5bAkz0YyepcBx07BWUWLlSxYMvGCoFiZx4AYvSjSEjPQwEbUZcb59JjY/cXk2hKMBZCPbj5t9PXjyqf+X6JhcPZCVEtDCt6qYjPu3aWrXpcusLY+KfOnq2YWT6oBlVXMTI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0NvFJP1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0NvFJP1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so36704275e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792145276; x=1792750076; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oeOC+O9trE6ZCicbgaUCo1/XxUpGsO8dMn32zaWU2cE=;
        b=V0NvFJP1iqNZZ1tNrDk7htbclWO50osDIfxCayyqwjZae7EC8xwJfMDwniCOVEO6JN
         w+Jpg5az4oI0935D9GoQf+CgM1yKAj67MWW8d4Fi3qIz0nSsphDX78d6Z+RRbkPqeqk9
         G+JXNZGSeRPKDYfPHzBTeMAbHAuDUMqj9z4ybmTo0M7oeR7U7NN5JY1/pZmpdPLddmTI
         Q9YFLzW2pnX7El4dYEfLjOuZ4qyAPfYFBO8/8IJLHo8XPFJMEXbn0I0lImEZcNWIPQJx
         2fITbVqCUnUtYDBnIWSWbbKXEHGut+HDG+EcjOdd82mppMeNMQ67CF1ZJ99jWrgw7wrQ
         GTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145276; x=1792750076;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oeOC+O9trE6ZCicbgaUCo1/XxUpGsO8dMn32zaWU2cE=;
        b=LS+htdT0/+2dj6Ak2sFNG6B8zLfpKrnblpx1tAQLFcbvPP7qwmi2peHXw6/6J6zLlg
         FZGRJrFb2D0WWoX0PlsH0UG/rRjWcjSVolPjsnYOwO5ql8SkN1enxfYaKXtAQFHcCdzI
         SfMoEoJ0j7CRg6GtR8zYzdpZNwiqQGOnMb2g+8SU7sV3FwN/Mh9dtTFTZQNjcA8kj3mB
         5CeSNegxIjTJP9cc0IrzRkhbie1rpRHbY0UET4H3DHcNRemSxSUSmAUgVbbCYGkkCtc2
         bT6vKHlnH3r9vYfghgkMNhd3a0nw5xwaPjMPxGquYQPZI5Hf1xSWg6BkWFOFpPlvCfHG
         qubQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6Qras+3yMwXWekv41PqmEmC/9qgwltrMIbSI/hef7Z/GMb7fGDQWtt18e27JzFMt7tlKvulLuz773bhk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUAEv8qXRdlt4L/kLKptrqyXB266H8A00dvJZnHK0gAIKrGcGQ
	xn0WfcYOTPPn1vKS/+OkPlHtzpbAucFbCEPuaXwTNh9elXIqZgjzkaqL
X-Gm-Gg: AYBFou3xrYnNqDWkpW5z9jIdqWOnv0qVx7FPM6q5mYy3IRXp4ihWMaVy/bOUVEkPJAJ
	oVETgj8DrJy74qStdKkLVKyNVK9ZJtokkjyXcpEgdSvuPVWPclWR9rXk7L2oRFRzVn+D4ydI+CN
	dFaGmdFyhqy+ul+1w58GtuxQBJbJ5RDzS1zo//jh6MaMCuq9AibaHCsqVq6JTZKTKoD8vtq5UVu
	hcyydYjJbpedZ8Fbpqd/Dy1DUR0xQYpCdd+jijGKy+X66wtAlWBRzdjsumk+FCQN5zD7CPRn+LC
	ILJdsXjpcIjzItHuToDGH09sHLj6kkA5IugdAO7NWMBCSjkDcmbNvpijLQdpqFzyXoW5s00sCe/
	tXronYKVXZXQuy2PcYZJwtR5pBo0Iu8G0YvAXJgt4ZYsJ0+jgjUpTPIXwpzfPmlIqs4h69PLIpT
	ddYM6V8y8jAFWJ/ML6CG8G9ZB+O+dvYxTpITwSHF/jUMnYT0a0ZLXT3oUM+xFs/TnJNWkpJSpoM
	CHCyYJv5KjsN0rUW+5WEdr4znPuBuy9OAnBujzjUNEy2PmZVZ2lBdEo
X-Received: by 2002:a05:600c:4e4a:b0:4a1:ac66:6ac8 with SMTP id 5b1f17b1804b1-4a1c7fa065fmr43366035e9.4.1792145276374;
        Fri, 16 Oct 2026 03:07:56 -0700 (PDT)
Received: from silicon.doe.home (194-118-146-41.hdsl.highway.telekom.at. [194.118.146.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9c001dsm134822975e9.12.2026.10.16.03.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:07:54 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, arnd@arndb.de, linux@armlinux.org.uk,
 robh@kernel.org, krzk@kernel.org
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Fri, 16 Oct 2026 12:07:45 +0200
Message-ID: <S2D2gSguRBGYM2GtGr5CkA@gmail.com>
In-Reply-To:
 <CAD++jL=TeOkPDq+xwGdUHdvJx31VtvGR9X53wJS0r0J9s2yLqw@mail.gmail.com>
References:
 <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <aV_PM_GzRW6aLmK6NF7ttw@gmail.com>
 <CAD++jL=TeOkPDq+xwGdUHdvJx31VtvGR9X53wJS0r0J9s2yLqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartW3qWXJSyTHGnhsggtEkzAg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartW3qWXJSyTHGnhsggtEkzAg
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Fri, 16 Oct 2026 12:07:45 +0200
Message-ID: <S2D2gSguRBGYM2GtGr5CkA@gmail.com>
In-Reply-To:
 <CAD++jL=TeOkPDq+xwGdUHdvJx31VtvGR9X53wJS0r0J9s2yLqw@mail.gmail.com>
MIME-Version: 1.0

Hi Linus,

Am Freitag, 16. Oktober 2026, 11:07:48 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb=20
Linus Walleij:
> I don't believe that the hardware block inside the SoC actually
> has a single inverted direction bit. Prove it =F0=9F=98=80
>=20
> This sounds much more like someone using open drain to drive
> the line high when setting it to input mode and has hacked
> their way around that behaviour instead of just asking the
> GPIOlib core to do the right thing:
>=20
> gpios =3D <&gpio 0 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;

I read up a bit on open drain configurations and I can't rule out your theo=
ry,=20
but I think it is unlikely. The following is from memory of my testing two=
=20
months ago or so:

On all GPIOs of my zx29 board except GPIO 24, direction=3D1 means output,=20
direction=3D0 means input.

=46or GPIO 24, if I set direction=3D1 and use the pull-up or pull-down, I c=
an read=20
back the bias state via the GPIO input register. The GPIO output register i=
s=20
ignored. So it is behaving very input-y. Bias on this gpio defaults to no=20
bias. Both pull-down (reads 0) and pull-up (reads 1) work that way.

With direction=3D0, the gpio output gets read back on the gpio input regard=
less=20
of bias. I.e. the GPIO overpowers the bias as it should for output.

The GPIO in question is used to keep the device enabled when running on=20
battery. ZTE's code calls it "PSHOLD". My best guess is that they wired it =
up=20
in that way so that the default hardware state, direction=3D0, value=3D0, d=
rives=20
it low and shuts off the device unless the software takes action to keep th=
e=20
device powered. The practical outcome is that the user has to hold the powe=
r=20
button for ~1 second until ZTE's U-Boot sets direction=3D0, value=3D1 to ke=
ep the=20
device running.

Do you have any other ideas I could try?

I do need GPIO 27 or so for the SPI display D/C pin, which sits in the same=
=20
byte, so I can't just declare GPIO 24 with a "dirin" reg.

> It does sounds a bit like churn if we remove a driver from the kernel
> and then add it back after some years...
>=20
> However if this is using GENERIC_GPIO (regmap is something else)
> this is a better base.
>=20
> I think it's easy for an LLM to port over the IRQ support from the
> old driver to this new one, given the code is already there and
> this way keep the best of both worlds?

You probably mean GPIO_GENERIC, which afaiu is implemented in gpio-mmio.c.=
=20
That's what I am actually using (I guess I confused this with gpio-regmap i=
n=20
my previous email). But my hardware (unlike Navid's) has no GPIO IRQs.

(The SoC kinda has GPIO IRQs, but those are handled via pinmux. A few lines=
=20
can be connected to the GIC, bypassing GPIO entirely)
--nextPartW3qWXJSyTHGnhsggtEkzAg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrR93EbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiBzAP/1ykkzCJwCbwgPs/FUNX
xmGgnG7GEJ4GJQsMQ4lYE3QGDJx2t8HVRktvHmx+q0ucU06omkIFEXOcOrjkc/S5
Wx/haqVPug7uaaBhzelRIaNTMi1AMxwC8pYTBTmzqaHP7X+daV2CkqZD9JHrL4wf
oZ7Y1D1pXjdYMdnbDj+Wg9GbA639UU14Wz7/D0wuy5RafLiAmwD1UL4Ekf4pe8p8
h3JKNBMBv/IoA1O3djNSrKA0UIjAVYKEezbMEwWAJHx1yPgYziASngIx/8wdnpmA
GBzZzwj7zXblzPs0zuOjZmMLopbZW9DrO/78wfDACPV/roHZeUHCrRyM+IZsbbS8
/w/CTYmRHU0pCM877KxwPzIO7a3TSTQpLdxsrGEIUebxHr2F5z0jBhpFvChsi/YK
brhUFeB09dPYtHbbdXt+nhvoTgssu9wWrtEh0My2AJOylWkfE8kLQhvfVshGgtXv
siCBFKybpbk7qhAzGyMQuMWpT93apin4vcAqqO3KhXcxiX3N3OBXjlUzboef6qgA
coTye5CgUBL/wiz5X84ALIkauXCWKetZwRRl6QWUkDZ1x+VhmaRJQeYgWntmF7sD
uMph3DawUGiqVL3N5TLS7lNoYN2As5Lh3zhVd2lDr+YIZTn/Oukdv/7Lg0RGBd/T
ceGZyF+asXjXP5i+MEMtevc/
=XJIA
-----END PGP SIGNATURE-----

--nextPartW3qWXJSyTHGnhsggtEkzAg--



