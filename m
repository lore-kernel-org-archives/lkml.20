Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476D9488D86;
	Thu, 24 Sep 2026 20:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282810; cv=none; b=Fc3JrKqAfzUnkfvqV0vYaW38K6iMjelWDvTGOcQr3eKQC5EwyNe1lAgDTjg72s+Qx1UrLrJ2KSEVoWLXOzw7hus6rPqZgPATu6UxJMWdzXBWwtymPXbn0/0YT2wS/+dvcXMgTDTixMKD7y+nGpVnov7w0exfdvO35PXaSAUvORU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282810; c=relaxed/simple;
	bh=ZxkrPL30PUD8vP5ntlrp+qcubhHME4v9ZvuZDwUuoSE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sR4ZZlzhAQxMRZNhF8hrcML+t6D4j26w0o53CLX/C1wY4BHUWFTntoe1fCCAM52vy6kprNDK2taXmgFnmBbCXoeOPpPk2CiB1cDAg60l7J/59/eTu5Eq4zGKAltOIrUH2jsojC+S5PrUK272FYJMrSSLTPiIAvE+BZRVmoDYrJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GCLkaPvw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GCLkaPvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790282807;
	bh=ZxkrPL30PUD8vP5ntlrp+qcubhHME4v9ZvuZDwUuoSE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GCLkaPvwThqg/tLIC1YahbDhGK2z+k4HSMwRd2ltI+5QxU/yAI0gRUgJLu+DwrPYe
	 IKFD/Zggp6EBBDYZ2vMEe9g/QroSDDSO2CMZvQ1mUazBS+QIA4Pw9zNspISP0I9jJ5
	 n9RhqQEWIJ9aPeYhc4SLCAnTmqzM0JNGrfibrLU5FzpaELewDs1mzGGsPdfjxussD7
	 g43P+fb7LQkWGzrfAwVdpt31cm7XS4PgfAgPON+d/uAtldU3NkeTA/kHdjazBy/f3b
	 m54YznAUNrLqq/4OKayvzkK/v1pC71aiJ3sbwHacNebmNQSqanWxchPcIoC2z7T4SB
	 l/wYliqk171UA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E4D917E01C5;
	Thu, 24 Sep 2026 22:46:45 +0200 (CEST)
Message-ID: <013b1e7ceb7cf046888109631e72ce4c408ab88a.camel@collabora.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and
 VC8000E support
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, devicetree	
 <devicetree@vger.kernel.org>, "open list:FREESCALE IMX / MXC FEC DRIVER"	
 <imx@lists.linux.dev>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  LKML
 <linux-kernel@vger.kernel.org>, linux-media <linux-media@vger.kernel.org>,
 Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer	 <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@kernel.org>, Marco Felsch	 <m.felsch@pengutronix.de>, Michael
 Tretter <m.tretter@pengutronix.de>
Date: Thu, 24 Sep 2026 16:46:43 -0400
In-Reply-To: <arWIcrSFkEA4GMTY@collins>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
	 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
	 <arQxC3DmDyVIGdqq@collins>
	 <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
	 <arVnQmik-CveaAkY@collins>
	 <CAOf5uw=K5tWiodM0SEP_nFn0vBv3=YRFWrY1Bd-1jPmZtM7G4A@mail.gmail.com>
	 <48271d518bb25f552309de12758e9a9995905f0c.camel@collabora.com>
	 <arWIcrSFkEA4GMTY@collins>
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
	protocol="application/pgp-signature"; boundary="=-RZqRkCQcXHsSV3m7pcT/"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-RZqRkCQcXHsSV3m7pcT/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul

[...]
> By the way if you have ideas about specific problems with the stateful
> API that should not be reproduced in the stateless one, feel free to
> mention them.

Few things:

- Drain flow should be as simple as for stateless decoder, there is no
reordering, and so no holding on frames.

- Capability query should mimic the stateless decoders (but up-side down).
Basically, we don't add a pseudo unset state, that was bogus.
V4L2_FMTDESC_FLAG_ENUM_ALL could be made mandatory, this is only partially
implemented decoders today :-S

- Capture/Output S_PARM, maybe review/revisit, but likely still needed,
otherwise the rate controller can't know the rate.

- S_SELECTION, maybe make it mandatory for codec with a conformance window =
?

- Of course, encoding process requires a request

- Anything about keyframe insertion can be dropped, since frame type is exp=
licit
and per codec.

One ambiguity we have in all decoders at least is weather or not the enumer=
ate
sized are coded or display resolution. I believe technically, all stateless
decoder exposes constraints in coded resolutions, and display resolutions a=
re
not easily enumerated. Not a blocker, just a remark.

Hope this is helpful,
Nicolas

>=20
> > A second implementation, not just a variant of the same brand would als=
o be
> > nice.
>=20
> I still have it in mind to add support for the Allwinner encoder based
> on my earlier stateful-ish attempt. Hopefully that work can be funded.
>=20
> All the best,
>=20
> Paul

--=-RZqRkCQcXHsSV3m7pcT/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarWMMwAKCRDZQZRRKWBy
9NqWAP42EmwEZYXkDrrIHimfO2YkL1gxjjiSxbQmMV+aniWsxQEApmExmBL7mmz6
RyLWV0kcepV0pLiYo5RAuCDOTzACyQA=
=26C6
-----END PGP SIGNATURE-----

--=-RZqRkCQcXHsSV3m7pcT/--
