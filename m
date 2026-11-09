Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242105;
	b=tPjGdGji6hiFAyLg9VeSo71z3toRfOYYdfCK8jRIx+LEow4PYw4Lw3/msJslII7KWQ/h
	 hJgN5VTtleh5TGXriJvxsdALfkeTM1/0uQFM7B1+mqFH0gyZpMCN2M+zbZPcxJGZXjpkf
	 wnPFmWmTcH+vg7ujqCFSv1ZzrZM1Jp/KU8ICVtZzi4z9xajdHf4Gl236RyCr3SX6Ew7Yv
	 qJLr5caT0F8C2+cLqdqtC2uMzBe8CeIWtoevIKejerSO7+QS5ncIEFygrIWt2LMSi6HQK
	 qwilZtqEpVdbxIe0kLeNWUnwEn8NZcPd3v+R7ULqTYS1DTZ6TohxMtDYKXsCOc+vJcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242105;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:
	 X-Last-TLS-Session-Version;
	bh=DBdnRIpEkGXCt848QcHdKdd7ZCOwp35Qcq78QE720ew=;
	b=tNP98PyaR3jkh3mYWqgtcxfRKUzWZV/PyKl97G1RaxvtjvfQmXTB8mNbtEfCsp0Ck6Sh
	 pIqItB+QbmczJP/9dNjfs32UlDbxr48r5ZiB5AcVYXAk2y3X3uaTZ+f0tjhscf7D5yI/3
	 4QYvjFVpghBUWQXheg3sHbxvQGR53O0sMV0mnh/Jx4ftu4drESO7qVi4qe0WPOg7hiPBO
	 THenRnfxlDVTRS9qcRbez9P7kBL4YSSgAfrUd78INhx1lPKwQJhmzC4OavXsDKGic2gpW
	 75RxIN71cXqR6zTd04ZVGABp9DCPNLpGQOo1Cm7IVZrERyC5HPHYjuc9N8Hzthi2BlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qMx724VR;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0AD606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C0AD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qMx724VR
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 279904E4152F;
	Mon,  9 Nov 2026 16:35:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E077060051;
	Mon,  9 Nov 2026 16:35:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73AF2103293CE;
	Mon,  9 Nov 2026 17:34:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794242100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DBdnRIpEkGXCt848QcHdKdd7ZCOwp35Qcq78QE720ew=;
	b=qMx724VRQDEMMpb2flZ+b/gHBd7QWNlvkPM2lmndl4O+CSZB2qK6AKcfAFvUnZ/TB4/AqZ
	y6OYlAbOGMTRkz09eal+AWVAt03QX9SG/M3mtF1wvyEczqy8d2q1gbCB2UQgRJPTOStGVW
	D6LpRoDHVYKE2fXLOzAWP9VmUd5mIZQhH/NrsaA/OSggtyN9htP9JqES6cCRtdvgGtpGlk
	ppbVocgR5nAwg5+6uRfLpfhG8sbxeKft5VRiTmyEm3DZrKOAIJDhxx85dS9DWd0kNigQyd
	nUw+HrokY4vohGfhBVhpp6JzR4/yPLc0HijLIjvdVZr3COEnq0FDO/YMvCG9Kg==
Message-ID: <0260a1943c59cdda431bb216438d49c3955d93b0.camel@bootlin.com>
Subject: Re: [PATCH 5/5] spi: cadence-xspi: Add workaround for old Marvell
 firmwares
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Bharat Bhushan <bbhushan2@marvell.com>,
 Sunil Kovvuri Goutham <sgoutham@marvell.com>, Tanmay Jagdale	
 <tanmay@marvell.com>
Date: Mon, 09 Nov 2026 17:34:55 +0100
In-Reply-To: <au8lyXiMUSvcdPWx@xhacker>
References: <20261104100643.162694-1-paul.cercueil@bootlin.com>
	 <20261104100643.162694-6-paul.cercueil@bootlin.com>
	 <au8lyXiMUSvcdPWx@xhacker>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

Hi Mark,

Le samedi 07 novembre 2026 =C3=A0 21:21 +0800, Jisheng Zhang a =C3=A9crit=
=C2=A0:
> On Wed, Nov 04, 2026 at 11:06:43AM +0100, Paul Cercueil wrote:
> > From: Tanmay Jagdale <tanmay@marvell.com>
> >=20
> > Older firmwares from Marvell used the cdns,xspi-nor compatible string
> > for the Marvell-specific xSPI IP, which is incompatible.
> >=20
> > Add a workaround to support this by assuming that if the "xfer" resourc=
e
> > is found, it means that a Marvell IP is used.
> > S>=20
> > Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
> > Co-developed-by: Paul Cercueil <paul.cercueil@bootlin.com>
> > Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
> > ---
> > =C2=A0drivers/spi/spi-cadence-xspi.c | 18 ++++++++++++++----
> > =C2=A01 file changed, 14 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-x=
spi.c
> > index 48a109f3fcdb..d326589a6ca3 100644
> > --- a/drivers/spi/spi-cadence-xspi.c
> > +++ b/drivers/spi/spi-cadence-xspi.c
> > @@ -1301,11 +1301,21 @@ static int cdns_xspi_probe(struct platform_devi=
ce
> > *pdev)
> > =C2=A0	}
> > =C2=A0
> > =C2=A0#ifdef CONFIG_64BIT
> > -	if (cdns_xspi->driver_data->mrvl_hw_overlay) {
> > -		res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > "xfer");
> > -		if (!res)
> > -			res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> > 3);
> > +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "xfer");
> > +	if (!res)
> > +		res =3D platform_get_resource(pdev, IORESOURCE_MEM, 3);
>=20
> This moves the mrvl specific code to all users, so I believe this
> needs dt-binding update.

I actually disagree here. The binding says that "xfer" is only provided wit=
h
Marvell-specific compatible strings, and that's correct. The fact that some
firmwares don't respect this spec is not a problem of the spec itself.

> From another side, this assumes other users doesn't have 4th resource
> but what about if they have? they will get "Marvell-specific xfer
> resource passed, but ..." warning below, this confuse the users.
> I don't think this workaround can be added to all users.

Yes, I thought about that and I can understand that you don't like it...

I originally thought that it was fine because the dt-binding states that th=
e 4th
resource is only for Marvell compatibles; but the binding can change, so it=
's a
bit wobbly.

I will come up with a better mechanism in the v2.

> Lastly, does the "firmware" mean dtb? But per my grep, I didn't
> find any mrvl dts(i) uses "cdns,xspi-nor" compatible string, so
> this means the dtb is outside upstream, then can the firmware
> be fixed instead?

It is dtb and also ACPI. The firmware can and will be fixed, the idea here =
is to
make sure that the driver still works on older firmwares that haven't been
updated yet, because they are out there.

Cheers,
-Paul
