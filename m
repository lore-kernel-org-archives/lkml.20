Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474876;
	b=iR1pnbT+OKs4hMXwqR0r9Pdk//kSB8/PDAaI2pjlFQEtSrU/0YLzag1UIwVoQkOdrucv
	 8ii4AC/oiQcAFCfy8kj/LlpEo+tg4YplWmT3jlIPQdJDeN5hH+UBqFqML2+SrOfqBAKA4
	 UTJG5jdFl9WjavShnFChRMz1/RPzfsdKToFStxnvO02sYz1WZVQJeHqwTMQQsKbP+XHyF
	 B35+CS1ZNKhH4dtrUEpNiaL4mRqLxvZ98cBIxa4a93SYt6ZRB9tXWfIR4TNUIsHd+9H0a
	 yFCCyBPZv+TRccK9ix5jXGnWnws8gOhce58cgVnca5T3A7y3tdbY9R1n8Hld/OJeIeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474876;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=ukdspEzX17qncMGtu1EzFs6Nj+VLyvCmrh0bcRFleqQ=;
	b=VZVIUO67n7t5XpLm1G0vd2ke/7bdfdyBdbhz/L4F+eIXrkTDY7N8a7Iatzhyr5c0b4/K
	 lz9vJNYCbvDOTYRVSHufo2ZBJqK/QgbwzpaJtROw/2/JudXDwmhH4vFcfwIk2XFWahsGm
	 1WR7NVqFUK/SpKDJCIm3TBkdYaUBoI5cQ+otqTBT0HAP9s8PBbY+4q+76SwbRH7/lwyCQ
	 6ylJQZxlo9kM9HVk9t8ddVCvPegK5BeomhQ8lBFsiWP7X1HeGvnaZQkr0PyzwWxpaatpc
	 pZ8RDtymRND9JY5F3lZt4uh6Fxhj0mjB/smO3OmIAyTJOqZOZZWyg6cJ7Nw7gYeS2cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=af0I1MFM;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BB4606A323;
	Thu, 12 Nov 2026 09:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96BB4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=af0I1MFM
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 322DF10A5C7;
	Thu, 12 Nov 2026 10:14:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794474869;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ukdspEzX17qncMGtu1EzFs6Nj+VLyvCmrh0bcRFleqQ=;
	b=af0I1MFMgNA5OLs4ArEeVJmDDLIE2ofIoXUjANvrIbkkHwWZT/Af32hxkFTTGDs9hY8Hik
	gTi146v+/dufj5vAvhTGVsU5nRJLHYXYkeC3nEENlbWxkCNGbnw621BPPbcJFT+uX/eYNU
	ixlqdKisSOVMs6YCLzoJ+HVzm42VdrJ9SbfRLPZBPPUhx6AO/0qOIbgtGjIrTxeltkWpg5
	mOPUxPyXQf+w66HpCAcrmoiy6SMiL6KVpgrJatfZQZ1U82W6cMEoUHyOlpE87XmW7Bvkin
	6Rp3vZsjmt93Ma6R9oyKJY6wl4rubXlmp9gKB6fCTdsHnG6ZZGm7e9G+hfgYHg==
Date: Thu, 12 Nov 2026 10:14:26 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Rob Herring <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
 <Frank.Li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: trivial-devices: Add National lm77
 temperature sensor
Message-ID: <20261112101426.35732e91@wsk>
In-Reply-To: <20261111175348.GA167782-robh@kernel.org>
References: <20261110150243.1531953-1-lukma@nabladev.com>
	<20b8e15f-70fb-4844-abb6-d91d7d7e9849@roeck-us.net>
	<20261111092311.54928fd3@wsk>
	<20261111175348.GA167782-robh@kernel.org>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Rob,

> On Wed, Nov 11, 2026 at 09:23:11AM +0100, =C5=81ukasz Majewski wrote:
> > Hi Guenter,
> >  =20
> > > On 11/10/26 07:02, Lukasz Majewski wrote: =20
> > > > Add "national,lm77" as compatible for the National (now TI) LM77
> > > > digital I2C temperature sensor.
> > > >=20
> > > > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> > > > ---
> > > >   Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> > > >   1 file changed, 2 insertions(+) =20
>=20
> Not really a trivial device as there is a T_CRIT_A signal...
>=20
> Though I guess LM80 and probably others aren't really either.
>=20

Yes...

> > > >=20
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/trivial-devices.yaml
> > > > b/Documentation/devicetree/bindings/trivial-devices.yaml index
> > > > a8b2b9deade4..9413ee0626f5 100644 ---
> > > > a/Documentation/devicetree/bindings/trivial-devices.yaml +++
> > > > b/Documentation/devicetree/bindings/trivial-devices.yaml @@
> > > > -387,6 +387,8 @@ properties:
> > > >             - national,lm85c
> > > >               # I2C =C2=B10.33=C2=B0C Accurate, 12-Bit + Sign Tempe=
rature
> > > > Sensor and Thermal Window Comparator
> > > >             - national,lm92
> > > > +            # Temperature sensor
> > > > +          - national,lm77   =20
> > >=20
> > > I'd suggest to retain alphabetic order.
> > >  =20
> >=20
> > The "alphabetic" order for "national," is already "disturbed" in
> > this file - that is why I've put it in the end.
> >=20
> > Now, the question - shall I "order" properly all of "national,"
> > bindings in a single patch (including the new one)?
> >=20
> > Or prepare two patches:
> > - One to make the alphabetic order for already in-tree properties=20
> >=20
> > and
> >=20
> > - Add the "national,lm77" afterwards ? =20
>=20
> Just don't make things worse.=20

Ok. I will :-)

> Put it after national,lm95245 and
> before national,lm80. Then all but the first 2 are in order.
>=20

+1

> Rob



--=20
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic
