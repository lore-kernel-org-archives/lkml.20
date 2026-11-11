Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391628;
	b=1HH9S7qVfuk+a0bsqwMF6T7jgfV6R6qhiz8uTCJ4hjVS4rwfDMosRHEtknhyYd6n/LbW
	 x7CLKwSsenVnHC7B8jE+XCGKkJqRc3GIAtJyAzh46XAPJY3OyRmr1hYyVB3qqDOTCynZf
	 5bEYr/JJYBhQoy0ey635xCbc8FWy/pHwilpWGbt2KoBQaqnRwHopc8E0whn4zt9Tc00x5
	 OKochMPeLlLjz7gx+ipxX36uwMdIYvbLwUNtIxUPLoDKOC4BCm1OSHmsuNrJHeK6xXUJi
	 mF5T+yyk+b+umLwkb1h8TSfNb3ACWcLe+bGfgSsqeigKocNQ0+Ne4R8sJfIhzklTiQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391628;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=uxZnvepp6CMTyAQzCft/l3P80dC4U8HDCpbqhXxVogk=;
	b=BKgRH2r8JhLGVTwXDo67YpuVSvQQ1qdfPpCzPo9mN7SxDkNJJJgcqGsOqiMjkSVP08aq
	 AgEyOLdnr0b8ewdfS+kEIIl6uCcVTNYdhMfR29yLW0dYyADUzDsc3NcgvA718SWqoVZKc
	 u8HgW/TnSOjHh6wauLRqczsCmC7QtBj/1vlVNtdJZPnEfXI1Rh6Bh/Gc8OWO4LPM0Pw2D
	 7YMOtGD8sOaWQy15pnq/23MvDjkfc2FYiQJP4MrDKo1E9m2D2dUOEDo0qU1dELkTkODsz
	 b9JQkiq5ue1CFLTma/n7LQBnWTrRDoOL8nkcvRiaTI77UiMFKXRQyVlHczkbYibDWQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=PkayZSoz;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1FC606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA1FC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=PkayZSoz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=uxZn
	vepp6CMTyAQzCft/l3P80dC4U8HDCpbqhXxVogk=; b=PkayZSoz0Yfvrg8A4nVp
	y2sD11cFcE+/jq2e41+na8Uosyr/Oc4uG8mR9M4oXsf2ztA5l4TLDGlUBZsz5kOS
	NLhAQZOcr+JnL8b8XM4pWPYyczh+yorEIUjS+RA8JpBQ/Sr0dvWtE05mafQIOLdG
	fmP/rnoa1g98NMJb1zAfbZnqNv1mdTl5R6D2+jY5s2rwRd/hlgBws9C/lQDn3X6P
	qRH8OuH3Lxh75aBGQDb27642NWK2Ro3ALFxJmAwIn6z5LoYpxC5Tvey3ycUJb8zE
	4aMW8WfuaEWAIkSO7/Sl1X/C2Eej0PzlKXc8wqdsxX31yLJi/sPTm2+2ulnYftB1
	fQ==
Received: (qmail 562499 invoked from network); 11 Nov 2026 11:07:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Nov 2026 11:07:04 +0100
X-UD-Smtp-Session: l3s3148p1@NOlfW/1fctEujnun
Date: Wed, 11 Nov 2026 11:07:04 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.au@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v25 03/11] mmc: renesas_sdhi: Add clk_mask to support
 wider clock dividers
Message-ID: <avQ-SIf0ZEsr51SB@shikoro>
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
 <20261028-rzg3l_sdhi-v25-3-57f16691c2ed@bp.renesas.com>
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
	protocol="application/pgp-signature"; boundary="uChG5fgUX4xJiPFz"
Content-Disposition: inline
In-Reply-To: <20261028-rzg3l_sdhi-v25-3-57f16691c2ed@bp.renesas.com>

--uChG5fgUX4xJiPFz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 12:51:20PM +0000, Biju Das wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The clock divider on the RZ/G3L SoC is 11 bits wide, which needs a
> clock mask of 0x200000200 in renesas_sdhi_set_clock() instead of the
> hardcoded 0x80000080 used so far.
>=20
> Add a u64 clk_mask field to struct renesas_sdhi_of_data and struct
> tmio_mmc_data so SoC-specific match data can supply its own mask, and
> widen the clk and clock variables in renesas_sdhi_set_clock() from
> u32 to u64 to hold it.
>=20
> While at it, clamp the initial clock value to a minimum of 1. If
> actual_clock / 512 evaluates to 0, the loop condition
> "new_clock + clk_margin >=3D (clock << 1)" is always true, and the
> loop never terminates.
>=20
> In probe, copy clk_mask from the OF data and fall back to
> SDHI_CLK_MASK_DEFAULT when none is provided, so existing
> SoCs keep their current behaviour.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--uChG5fgUX4xJiPFz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr0PkgACgkQFA3kzBSg
KbbQ9BAAr/nzYNQcsD9ViDt2WEyB8HC2BkiqBKr+lWZFEoMfXyN1XK1vdG+PajX5
7Zd/EleQZMTitOfetXGFjLfNo/hfo0Nf4GoPmPVkiJmTZSSAMETQi2bQoAJFIoHH
csuGrBpNyFJPolnw3O440kP3B1DdIq8GKboWhrN0QfP1x3UvtrNLUf0gCRsaGxuq
8gd5fSCCx6RL3+5JvdWCbQq62tggRnANfQ8yaQ7lGH9tS6HZJ76qpk/W1a/RhSZW
uymCHgnsA1JcAvFnaAohmKvRVP/XjS354sHn40uNoWGshcheyeGvPUhjHOYjzRrP
0BYt35kJHapOxyEfNAvZS3LphSUouF6NSmRjmZKWx6dKp+6hJG+fONXWSoXWlyHZ
dy2t5X0wmFxlX7CZXTMJgTG2aTn8pFDqHJiyvbW1nClJO73WTxpX3+QX4vq3Z/e1
Mc6xNmSA6xgaO68t5Wp4cEA8Szqt9jA8f0yew8/e0h36ehjThi/u0/tihyo5Fjuz
oIohntq3U3sBDoV/oyB3P1YGHwSjPSt8kNxHqecahSII7rMhFaOm+AxshCM7cfGT
1EnRLrV+5McHsXpc93DUH9bqoFk1Yr8b+2/V3KLcSvEUgJQYc6W0fHCmcJdF/suX
U902TD191MX6r+YFZtJCkxuNmR5LWlTVaCtI/vnq8z9wLqwrgAE=
=1p21
-----END PGP SIGNATURE-----

--uChG5fgUX4xJiPFz--
