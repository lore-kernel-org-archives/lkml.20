Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2581A40B0E6;
	Thu, 24 Sep 2026 20:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281868; cv=none; b=ljWnRpW/ck6SOVWGUtmxiRWoglcGTpVcy9kgGBRIKSuzd93n1GoeXRlR23Q8kQgWCE1+IOkkaLDThVHl0AT+8/y8uZPiymJezMIo8ysIiJ8T96EUI58ohzdXltQJj2oWa1iClg0a9169dgt2I62XYC26qiQjfb9k6rbiBzLTxPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281868; c=relaxed/simple;
	bh=gaE1BmC4n2x2Lh1ImjKqdSqbm/A7A2CKpyIc70AL+BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfY44EmeShjZCkTpzCJCtZzYMOobHZ47GfEJENJwqTwmDAXVREEPxIea8fr4n1lgIldyDfOxhHd3+bOA6Wj9Qodki4qIOq4BGD658+7qhTDDDyGdaM6qhfobtyhCz2bfiwipxX2o6ZQD2DpJkV4/8KXtaPDi5whAWLS60Pvh5jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 003EC3700EDB;
	Thu, 24 Sep 2026 20:30:47 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 5A2C5B64AC3; Thu, 24 Sep 2026 20:30:46 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id C9838B64AC3;
	Thu, 24 Sep 2026 20:30:44 +0000 (UTC)
Date: Thu, 24 Sep 2026 22:30:42 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
	devicetree <devicetree@vger.kernel.org>,
	"open list:FREESCALE IMX / MXC FEC DRIVER" <imx@lists.linux.dev>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-media <linux-media@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E
 support
Message-ID: <arWIcrSFkEA4GMTY@collins>
References: <20260522101653.2565125-1-paulk@sys-base.io>
 <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
 <arQxC3DmDyVIGdqq@collins>
 <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
 <arVnQmik-CveaAkY@collins>
 <CAOf5uw=K5tWiodM0SEP_nFn0vBv3=YRFWrY1Bd-1jPmZtM7G4A@mail.gmail.com>
 <48271d518bb25f552309de12758e9a9995905f0c.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZGRlYrwE/Jnn6ady"
Content-Disposition: inline
In-Reply-To: <48271d518bb25f552309de12758e9a9995905f0c.camel@collabora.com>

--ZGRlYrwE/Jnn6ady
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Thu 24 Sep 26, 15:44, Nicolas Dufresne a =C3=A9crit :
> Le jeudi 24 septembre 2026 =C3=A0 21:38 +0200, Michael Nazzareno Trimarch=
i a =C3=A9crit=C2=A0:
> > I would like to ask about the status of the entire proposal and uapi ch=
ange.

By the way (in case you missed it Michael), this topic was discussed
at the 2026 Linux Media Summit and you can find my slides at:
https://www.paulk.fr/talks#2026-linux-media-summit-v4l2-stateless-video-enc=
oding-uapi-progress-update

The discussion helped clarify a number of points and expectations for
the next iteration of the proposal, which I am currently working on.
It involves some rework of core support and helpers but the technical
side remains rather similar.

> From my perspective, the main part missing the the V4L2 m2m stateless enc=
oder
> spec. We made one for stateful decoder/encoder and stateless decoder, and=
 that
> made a huge different in interoperability.

Yes adding the spec is part of the ongoing work for v2. It will be a mix
of what is already done for stateful encoders with more flexibility and
specific aspects for the stateless aspect.

By the way if you have ideas about specific problems with the stateful
API that should not be reproduced in the stateless one, feel free to
mention them.

> A second implementation, not just a variant of the same brand would also =
be
> nice.

I still have it in mind to add support for the Allwinner encoder based
on my earlier stateful-ish attempt. Hopefully that work can be funded.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--ZGRlYrwE/Jnn6ady
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmq1iHIACgkQhP3B6o/u
lQxMCg//Tj9pel13OVA8fHs5ZlH1ab/S9YFp4smIT5v7toqV1qkvsXw6zEUPUAX2
gy+C+KQnzRTiALU96ISEnvgwbxzqb51+hbuy8wMBu9aqC9lxdqAWA4rlTbDG4mVY
MTzp+swHJoNFQmQZb3JTBsXU+HLi3girzdHR6tG46vfv43Ppd96dsBropo/zYXsv
IrRRWcKKtpt/4WARpUSPi0YBMRwFOn7+g6ePJIFQze1FuDzdEJHktiRFw0BBEAHB
eGZeDS1Sv/3Lj7b/ozF9ilgtyh2gPO0oQNrjQvVScjUF8k8d1NxOpTXYG5m/aykS
0WYcTjrRGyLvtzdtNri1WnnD1wfZKRsYCR1d08/i7kwAFS6TqsKO+HdA9V1nFBbM
6H8L7wN6vMM3PZ9iMjj1/Y5v4ug/P6EnfMPW1FqzEZJBkVsXyLhvfKA7SFGSR9Pr
zV9EdQhdDjZtwh5/oMgPsEuJhJ3DIJKT+TTAhQLD/JioPKoPTKPWALvDOx40QvgN
c2E7LdQAV79+86G5UaFSB2gEmnrcE+H9g3WlyWcXN8hgUEimU8AYc3yu6jMXZ49K
Mv0loazwv/fPjahTvm56qqPl6chc7hxyq3qU8EvnhNseV/Z7Y6N0nnIi7DUqZoYU
t9da7fZJu56RF8xMtZjTMk1MyYjYExZVVQ3QELL1kgJsJWcs99s=
=Mn69
-----END PGP SIGNATURE-----

--ZGRlYrwE/Jnn6ady--
