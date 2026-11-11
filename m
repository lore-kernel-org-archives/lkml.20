Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385400;
	b=QgPmyQ2NoCdyqnfGDU+lW1TbtjMbBWIaaJMgU3d9H11vaNG5tna+jrsnpq1PiTpjiMPy
	 eDY6ed66H10rfncAMuWukfvpanjLB2ZD3wIrsK7U/YRgwcD3JxXfyaoPZYh/ICCDMISJ/
	 SwZ4lsTf8NKsX/VPqdd2iVRSl/yNc0uSAxxUQAbnnECj2ThWBzxvjbdWpZyAEGVYpNO8g
	 8cdcaK7YSCtbkzOZWY6rb8h/S2s3DyCLgFLZPlb/teZmu9qZ/afbpnH50Vbt4DXXJm/oU
	 nUa5yXV+NmABNfE42VfaDEmsqoEslEnKzdVGfygikLl3Uhsg9OrlzEGVgwifwzNrE5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385400;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=ifmwbZ7zmQQpgrEhXpcBXt0uPaTlKXU6d7DPwm1kaGg=;
	b=2btqPRAV29M6jJ5dua6Gyrg0PGIo6BXsFqizxIZ8HE+4jocXwPnP3Wk1QeZl/QSE4CpZ
	 73iNMK4KCwhGCA2Ar/jHJ6OMPB4sbxUJvi4yXo+fR1gVehj0jKa9oryCo0LUY2oVDsChx
	 4b6Y38ber92mg+vBRjUtl3UqFihqgsCpnbBLzzFzIYk3uXJxBVP4SIaZn0gpb53VQTtXP
	 oiocLwV+5wiStw5DABIRFloBSa8ycjBLg4Z5XX+5dOlcTVU6eAxunfjqBgrbJW/lw0mLo
	 KQ3ANPRT2+VuQ+GftFx0r2gBEEWag25zZVx4BPkEYqf93kWHheo4+hRohyvhbu+pN3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=aZqZJZpv;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99449606A31C;
	Wed, 11 Nov 2026 08:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99449606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=aZqZJZpv
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94CCB10DE0B;
	Wed, 11 Nov 2026 09:23:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794385393;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ifmwbZ7zmQQpgrEhXpcBXt0uPaTlKXU6d7DPwm1kaGg=;
	b=aZqZJZpvJZACDEjTMHG+NFcMhBOfrPMfFOAwo6of958wEMSYvnn1pPQKWza5C4EyIIqLr9
	VoA0flARrj5EjZ9nBnu7kNncDyqHcpqhzAsgvvvhaYuGSKzf+HbrwKrvNBwh6xh8LsTthk
	F/SKU0XrIi6kjdpFOy+/9sb0Uk3y0cJWoYPhOazIb0ADSBDOJjTC55vMZaRk+/JnuF2DPQ
	2Jsu0bS3IQ4bDO++lqLPP5LTUEkxH4VUgOpIaK2Zi10fEC1pYyCXw8rc/9Mb6nFpw0h/Em
	7NL97Gb9Fv+6qgfaaKpqMBxYnO7tj4qwqou22lLjbe51aNmnZ+1wxz8Q4NXG+g==
Date: Wed, 11 Nov 2026 09:23:11 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Shawn Guo
 <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: trivial-devices: Add National lm77
 temperature sensor
Message-ID: <20261111092311.54928fd3@wsk>
In-Reply-To: <20b8e15f-70fb-4844-abb6-d91d7d7e9849@roeck-us.net>
References: <20261110150243.1531953-1-lukma@nabladev.com>
	<20b8e15f-70fb-4844-abb6-d91d7d7e9849@roeck-us.net>
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

Hi Guenter,

> On 11/10/26 07:02, Lukasz Majewski wrote:
> > Add "national,lm77" as compatible for the National (now TI) LM77
> > digital I2C temperature sensor.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> > ---
> >   Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> >   1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml
> > b/Documentation/devicetree/bindings/trivial-devices.yaml index
> > a8b2b9deade4..9413ee0626f5 100644 ---
> > a/Documentation/devicetree/bindings/trivial-devices.yaml +++
> > b/Documentation/devicetree/bindings/trivial-devices.yaml @@ -387,6
> > +387,8 @@ properties:
> >             - national,lm85c
> >               # I2C =C2=B10.33=C2=B0C Accurate, 12-Bit + Sign Temperatu=
re
> > Sensor and Thermal Window Comparator
> >             - national,lm92
> > +            # Temperature sensor
> > +          - national,lm77 =20
>=20
> I'd suggest to retain alphabetic order.
>=20

The "alphabetic" order for "national," is already "disturbed" in this
file - that is why I've put it in the end.

Now, the question - shall I "order" properly all of "national,"
bindings in a single patch (including the new one)?

Or prepare two patches:
- One to make the alphabetic order for already in-tree properties=20

and

- Add the "national,lm77" afterwards ?

> Having said that, is there any evidence that this chip is used
> on a system supporting devicetree ?

Yes, it is required for CBASE board (also send to the devicetree mailing
list for review).

>=20
> Thanks,
> Guenter
>=20
> >               # Nuvoton Temperature Sensor
> >             - nuvoton,w83773g
> >               # NXP ISP1301 USB transceiver =20
>=20



--=20
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic
