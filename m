Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20904921BB;
	Thu,  3 Sep 2026 11:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435935; cv=none; b=R49cGrna4h0grYoSZNFQXIlC29iJDd3v5oJsYBoVNBv36Jc2cDstOwjr1M1cKrqDINKyDsKLO+36biGuUk64ViAEwElkElj7lzI8IoX3CpMwo+pYXBjIRyKSeX6iAUP7O0OFeSu3GOwliFakL7J5vn0DNAl/UI5DBwtgoLOWnJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435935; c=relaxed/simple;
	bh=iDpkHQ4A9aavbAO0VY9TWwzuSMJVrP9fvNQC/zw795I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z0wA04iMz3MeFC1AvF+tD1ArhCwV+8e7WrCHj8jSX8z6m4tjdPtrDaHhUg4xKej79bbFiqPOoE4oCMfLEc2AydMG25PkkGTeuMF+dcgG4dOAzjRCInviJVKbZT4NIvukoADdR9SyJXxoq5rXV9hOcKVzXWn2v9zhzS9OY4rVswY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S8/s608K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8/s608K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1521F000E9;
	Thu,  3 Sep 2026 11:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788435928;
	bh=DT15CpzEOkwydrrc9EXEoGDNjopv/Z22TmDRwFRNU90=;
	h=Date:From:To:Cc:Subject;
	b=S8/s608KBRHpsOZJNSr8mwbpYuox4uNjpaWHIStJm7Eb+TCAlObf2GDRbvYZ3Gk3c
	 ESCf1Jl8BGQBAjCyvzweYjcLmA2lGE/o696tNONhEn3nMQFliHg221MjNZWd2S1BL+
	 LO5nUH44CBVYgmdydH+r+oQ1wNqEWiChl2+2UU/8dn2afnqdlZ3JMuxnkK3txFUWRZ
	 2ZoMLWGh5SGByMgBp4FsR4xikXHE1ZwP4L2uyATYt45paveI4+oXJs5wmop9iZIR8T
	 MHbnL9dpBSXl8D4QgjBkOfkb6FC7L0GRQB/VByWUH0rbOKsIJUbNKbPbO8j8k+yegu
	 3b5YJ6ZLcH6tQ==
Date: Thu, 3 Sep 2026 12:45:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the rdma tree
Message-ID: <apld1ajH9zvMi5-H@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qbQ6wlEmjtO9pb+2"
Content-Disposition: inline


--qbQ6wlEmjtO9pb+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  a9d53db40dba3 ("RDMA/mana_ib: Enable multi-port GSI QP support for mana_ib")

is missing a Signed-off-by from its committer

--qbQ6wlEmjtO9pb+2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqZXdQACgkQJNaLcl1U
h9AU0Qf+LAKoCPgWhCZg3oha1UFYz0Y6MUiJdA/BEszuk7Mb3MVIYkO23uSVRIKN
Na0nBf/XX5e85nf92/66w6Fv6PaQysRssb7P/ZpEuyD8VrJod1UWwFvXsGepJRCn
47kt83vXWweKE4gu0AKbrXVWkBWKFlMtFdwoyLn0MjbvFIQ28pRHIfvZuclh6EQ1
BQsuzSO5oXnA2iE2vKIY+mVOfgSiSTAmzw550+it0b0qmQx1UJVZzp3TTwX3MiXH
uT5oRwPRy/mi5sSVdKihyZFlC6GWVA/4wlnuXOl/6jC92lQWuy7r17i+WryZX40C
N4nxdXcws0O54zCpVbXIfe60Dg2cUg==
=oPDZ
-----END PGP SIGNATURE-----

--qbQ6wlEmjtO9pb+2--
