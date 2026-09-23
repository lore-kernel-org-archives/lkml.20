Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5080957D201;
	Wed, 23 Sep 2026 20:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194513; cv=none; b=WQBowlv38f2JWd0ERRIIucSxFVFzZBTSbHrByQy/hY0fftNAi+8XLoIUVgxOdEsLmFO+mo9DZzx2yeNk2mbOLrDzGsZS2oHjqXyJJGb7/ITx+MCjIsn+tZsujWINBxB6ZMIqyUyKN9QYYPw0uV16hgWU6d3PQ3O7WVe3huoab0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194513; c=relaxed/simple;
	bh=JmYOP4c+ppHWZuCNjkFN4BLZ0XGCSmx7SrEAzuxj6XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QK5pLfhfi8owWvGFubOeDfCnfxnG5SqRC3Njv17bwdCChM4/RwvF85/lckgFBJNmnethyoekZZmqBRyShgOmLeF7BAr9bHB/y1xZaJ32XKKx4JGHbleg1LP1kHbi5jvYECe39Hc6Kv2juKPDfQ3U+034NMJIbZcLc2EjhyKz3H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id F3E453700EDA;
	Wed, 23 Sep 2026 20:05:37 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id CE404B648F1; Wed, 23 Sep 2026 20:05:35 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 821CCB648ED;
	Wed, 23 Sep 2026 20:05:34 +0000 (UTC)
Date: Wed, 23 Sep 2026 22:05:32 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>,
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
Message-ID: <arQxC3DmDyVIGdqq@collins>
References: <20260522101653.2565125-1-paulk@sys-base.io>
 <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YpsFhTt6LiRNuQKC"
Content-Disposition: inline
In-Reply-To: <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>

--YpsFhTt6LiRNuQKC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Le Wed 23 Sep 26, 14:10, Michael Nazzareno Trimarchi a =C3=A9crit :
> I tested on px30 and achieved working H.264 encoding with some small chan=
ges

That is a bit surprising, the Rockchip PX30 should come with a Hantro H1
(using a modified register layout) while this driver is for the
Hantro VC8000E, which is a newer generation with very different registers.

Maybe you ended up using CPU-based decoding when testing?

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--YpsFhTt6LiRNuQKC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmq0MQsACgkQhP3B6o/u
lQzbyw/+JH2RNX4Kk6NdjJGNFdRjLhYBLJnKUnz2uM6eXMwFt15zNIpFBI0ZT4bq
zCuPHz7SWLYYx5ZZw4svtA/I5qKT6rCXL5YkoO68/vdPg6g2lMqi+4ebUh50MtUg
il1jhBcRPKEIm/J3WwdPj0KWgV4TCiOU2jOqzHHADtPsec1nMw2pswsE7Y8F84tK
P0gBcsej7mQ52N/hoKBIFIqA76jgHv8WhdueJAQ+KN2miFQsLFh6BgdZKATAK7uL
131FKYzgkZlFAcgPUxVOCS8jJ34D5S9T+tkcgzDOFM5GcwpDOXyXBwtPe9q/CgEA
KXN+h/fAiQAUrQsIS1s7C1JQYT5c6Ax3dTqMzMkVusd464Az6fyy/JNpEKLjblou
T4u2oLA0dW/kBDUzmMle0IS/d3DJ+IoGkrjy4OaViVXtK3t0FmT3RhNbmbDssrzy
NciorGD2EhSmyrCTS2JKSyXHXGM2Q9jFsSe0LBsmSBHEkMEvA/aTHcl8Jvo3hv29
QzMCH4UeWzDSQKAEgQb+Rv0NnWQjpNJq5w8gRyomdHiPzReaPy3DpA2DVXoNkxq1
g8+QEVaDWo4Ov1D/+TzIsqw8kG5CbgcuhfmACnD9UHt8sOvR6rQD5cTghJcUHKrd
J1WCWIcYp88yfa7ayCxI5jfpRofBO5OsFxsyHOGbi+c9/w9n6I0=
=Plja
-----END PGP SIGNATURE-----

--YpsFhTt6LiRNuQKC--
