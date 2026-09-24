Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73374BE458;
	Thu, 24 Sep 2026 19:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790279094; cv=none; b=Keag6DRGfhEcesJruka/mMwQvaNi8vh5wTr9yeu/rZerNifSdP0UhqcSTFRr+Ee7w0FwuT6bIyVKTVomS37aJ+lBUpnM7vupVdE7Quuy78bBEOEJhno2YZ7Fb5KPuYLDuqEi050+kzyVackkuZyEHW/FP4d9un4AM4EdXY4SRZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790279094; c=relaxed/simple;
	bh=odrTGFsDo9/VOm3I9CYUC31p3sv7iM21LI1z9mPgrow=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jLgZa4oowZS+GowYOodSVJcSpKeCSoiSLt8bDlmz6GBi6W09MKO2llApIUJABY3u5okUcf6UOhLgXbEUMHjgFW3TzchZfR/QIJozgXRu4z3tkBKcfAMGMtilHVRGtEvj1z8btPIQuiqfo4ekkM+CjftHKJNbsuBbU2PyKUJb+TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aATvn3V3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aATvn3V3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790279090;
	bh=odrTGFsDo9/VOm3I9CYUC31p3sv7iM21LI1z9mPgrow=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=aATvn3V3gYX6FXQyrgZVlZUH0yNhVXxUANYpfa74kW5BOYGMlicj6Q0JZEvLqX/Zt
	 ULBWHIMYfIVadIbf+5gt+yM8b0N6T4iAtOpNFMGmBLPhJ6r+spJgRFm369hUrCdE01
	 TuqCpwm76CdolivLQgJKJMNW5KLihdJ2t5hVW7Eif6xRv0uuPZ8a0vecAeGeFilmsj
	 syMqlLQCKdrrj8d5bdXQwfKYFIDdYvgJ9L1kfOCgUkg/bhtVqEaEquMJpFvORqbkNQ
	 lJtfvxMWM6g/i0g23lul8GeT4i8J8YtvyJ36r665j6xhSn/m00l1JqmgEq7RIe6OPS
	 9GY5Bv1Jnt8Sw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B46017E01C5;
	Thu, 24 Sep 2026 21:44:48 +0200 (CEST)
Message-ID: <48271d518bb25f552309de12758e9a9995905f0c.camel@collabora.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and
 VC8000E support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, Paul
 Kocialkowski <paulk@sys-base.io>
Cc: devicetree <devicetree@vger.kernel.org>, "open list:FREESCALE IMX / MXC
 FEC DRIVER" <imx@lists.linux.dev>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, LKML	
 <linux-kernel@vger.kernel.org>, linux-media <linux-media@vger.kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, Michael
 Tretter	 <m.tretter@pengutronix.de>
Date: Thu, 24 Sep 2026 15:44:46 -0400
In-Reply-To: <CAOf5uw=K5tWiodM0SEP_nFn0vBv3=YRFWrY1Bd-1jPmZtM7G4A@mail.gmail.com>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
	 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
	 <arQxC3DmDyVIGdqq@collins>
	 <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
	 <arVnQmik-CveaAkY@collins>
	 <CAOf5uw=K5tWiodM0SEP_nFn0vBv3=YRFWrY1Bd-1jPmZtM7G4A@mail.gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-HPi1wb249tHXCTcm2PII"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-HPi1wb249tHXCTcm2PII
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 24 septembre 2026 =C3=A0 21:38 +0200, Michael Nazzareno Trimarchi =
a =C3=A9crit=C2=A0:
> I would like to ask about the status of the entire proposal and uapi chan=
ge.

=46rom my perspective, the main part missing the the V4L2 m2m stateless encod=
er
spec. We made one for stateful decoder/encoder and stateless decoder, and t=
hat
made a huge different in interoperability.

A second implementation, not just a variant of the same brand would also be
nice.

Nicolas

--=-HPi1wb249tHXCTcm2PII
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarV9rgAKCRDZQZRRKWBy
9AJKAQDAVOKci/P7Qr2Z5IgnO7OXHieb8eGjiKKZ534/8y/l7wEAh6xDOGHKCKdz
yxN04vRWtC/cp79kBk1S7uuDCQofSwY=
=1fmE
-----END PGP SIGNATURE-----

--=-HPi1wb249tHXCTcm2PII--
