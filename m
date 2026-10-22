Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663246;
	b=g3SWPuJblG4g5Rsr6bmvW65SYprZ8LCJGLpO6mqkKWETI7AGjrVr5RJXhhnBfZ/WZ5bb
	 e5MdVDGcKnXByc1f5X6HOB2Lnab2pWPgQzNGYjv0Scro9eCLET/16Wf3KDeALikK9gZo/
	 bbjO8tNbbcLOe2tyC4N6xJbdaKSKkTFCcEQWhxAcavqZzSdSbmH+kKB6rp7uAHnOirxgD
	 iJPyiosAY5XF3ee6o9tgKz7gqZDXuKcn2PvS80yFu26f5wPbwqUuiNXxygWXP2uI5cAIC
	 gqmqM9Oaa37M/VUnPH/LCVamSQF52GYfmd+01MvfQMGfbX/3j98g67r4Q3c+o1QNpQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663246;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=idteAz0iY6oQGnUZPllHA4/u9rOX28sQjb77eJbpZRg=;
	b=YOlA+0ADIG4pykaQH9bm8C2EFURXnVU7NXV6qe8gMmL8O6OHSmT7kLIOZ104yDTpmnBt
	 I29EDCQvLOlm5mFs5grGRo4Zx5O0geZywIaxun52wANtGO3aaU1HryPq16nIRNbBvAptw
	 4rmRJKkS/SMI/ZK8YlphFxnMjh9br75JItI5UXmDMxxjcK8fP74Bk6SUcNc8XCXHJnekm
	 xZXSK4pfDLlY6BivSwXhQfxF5qb3ab1nRb5Cp6FmdzGf5m8ntho583nqcvv+3RbU5K1+X
	 /kLgBpfT0dtWzSdynj0TAYMjePdODuRmdPequJzFGkfI1Ns+OyTdgis3xDxt+dk9WJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Y3cztLW+;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70E3606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E70E3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Y3cztLW+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=idte
	Az0iY6oQGnUZPllHA4/u9rOX28sQjb77eJbpZRg=; b=Y3cztLW+w0Qb5mx7TYBw
	EqXTv70aLz9olEPqhKB9Qyb5BV795IWAOyWh6QJ9K2fByKJBhQJhthsAdSVCl7gu
	Uur5VXMBu945130iIboMsfwWR0yAnvuIaeXUwE9jnfEtmHcMSpyu7OBxIHI5nW4r
	nz1iusqRxlD8cvrwy0pTXMoFTwY+ED9btUiwNP5iCwjE4dBFwZrOIfagR3Bu2slv
	1KDsYTpY9VL7S7gW5EmS79HIEySAIEgUVWpLxMa8fnAG+lhABCMBf1KAwLJl5FPm
	znebT1RNMkWJ9ZRf454V6wfxgYbz+h69I/qrXMubPpD/lkV8S4QwQKhYq7aZmKUQ
	DA==
Received: (qmail 1097692 invoked from network); 22 Oct 2026 12:00:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Oct 2026 12:00:43 +0200
X-UD-Smtp-Session: l3s3148p1@WxDW72peKr4ujns/
Date: Thu, 22 Oct 2026 12:00:43 +0200
From: wsa+renesas <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v24 10/15] mmc: renesas_sdhi: Add write32_hook for
 CTL_SD_CARD_CLK_CTL register writes
Message-ID: <atney9qgx_P1jh66@shikoro>
References: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
 <20260820171657.62815-11-biju.das.jz@bp.renesas.com>
 <aplM1LLFJ4eo4YJ3@shikoro>
 <TY3PR01MB11346DCB87BE26D185FE8017B86B22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n6/6OV4/iym/jbxT"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346DCB87BE26D185FE8017B86B22@TY3PR01MB11346.jpnprd01.prod.outlook.com>

--n6/6OV4/iym/jbxT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> For safer side I will add, considering this code is used by other vendors
> they may call sd_ctrl_write32() in future with no TMIO_MMC_HAS_IDLE_WAIT =
flag.
> Currently all Renesas SoCs have this flag set.
>=20
> if (!(pdata->flags & TMIO_MMC_HAS_IDLE_WAIT)) {
>                 _host->write16_hook =3D NULL;
>                 _host->write32_hook =3D NULL;
> }

Yes, please. The consistency that comes with it is also helpful.


--n6/6OV4/iym/jbxT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmrZ3ssACgkQFA3kzBSg
KbZnzg//XySm0/K7qg5+wtGqRVaQqewoUnFJySVykE+Dh/iOnDi5Yjc0QgYuWSDl
G/IbJVXZrk72yt54MA65gECGEVSyRDN0+hr0glDz5aPkybA9QGyygGYIl+LiVfat
oEsLJMY5/+HkBsJ0HVJ0n3Yl13JiLfYBwjyReEa4+wCSgFx661PGvjaPFx08riKp
TNi32RovkCLS4CHjw2qucB1U2YNkbcaD3NZBeyZscETSPRq8W3+KglNAn95uRvfp
FCB0Q1gPL0k86p7EyFcaQ63S2edObsWYPAkKcjs7aN/yLBla1fRiB0Md8xa+HJ4U
/pBD/eAnUd7Pb62Ilw1S9rd3nxQdpLwXPvEfLnAyThk3K+8n5CElet70n99uGpxa
MJRZtnIYQfxR69iVydftQHyIpgdoVIkYfz+B33wLrcOwlwBEOcCNkQEt+vNYeE0e
hiFzVstT/Kt36Vc5yFgbB6k7O6flX5sHSTQ24TxNQw2FyerjYILIRl7CeWk4sn8P
87JId75IiXktPGGn8KF8MQYADyrBPKzqqoAQ7Bn3WDqjvuYbjEJS/i2zr8ccdAyA
VWR4asFuaQ56S+KVSyqDe9ArGPn8w5SO4boElgchc5NJZ/q7U13QCbvhacXmlHIK
2YoKgHSfobybkWf0WWSb3c5GHEJ5JiA0JQ9IUB9H4xfsCPd1rBQ=
=vL57
-----END PGP SIGNATURE-----

--n6/6OV4/iym/jbxT--
