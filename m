Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794265939;
	b=RrHDkYyqGgtg9I0pqXR0qiw/m9lsWtSybMcH1cOgM974gvwhsleOlGgppo/a6JPpxiXo
	 j+LyKuxhxiCA+1KfSyuZ6FS/Pk2jZZQE04B/WUH9Ld8gnKUCk6ocPH2Ug6jxHz6MMSq1c
	 NJtZjgjwYUOoPClohZuZI0IdSglsFKZpcpyH3K5Q8p4DcBE6tF0/XZdjM4h4dikm4Pefw
	 ToyWt5VEsB+2xxylhNQnKHmstjpR+w+tajat4UIrvu4W1vSm9YFUPAg4YsjWFS9SKycEV
	 s2RqLd86ngVo6htk+F6s0PuZbBfmDxSjloihcq+W4dmZZpjd0arXXKlHhOcY4jEn7tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794265939;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=Lh6jKE0jZf6KXSkuM9kQvKbV2Bgjh7LJ8lSHz4kPoDc=;
	b=pfnn6Uv1iQUGtiN+2RXIXFgAQ+zzSulQlr4H5JU7cF1+/z4690i3F/LH4DxCT2aSkwmN
	 vdG2Q/MZx3PkhsqqlwFhQHIwQclRnBWmI+akW+lVzsGlf3WmGqvJkoT4vF3GYkQHIw1Gj
	 8lVlXJAaugDtNuHhdkjhkBYf3xDZQ0+Ian5pWG9vjdNhFCosOpg30t127CDQQucvzn6Cw
	 D9arHk0ISKGIJ2/ikgYRuCG5i+1cz6GaA16LbDYruwYYhx7OJCs8XjbIMxk5IT6r/aAnM
	 4OidFCFRcnB8sJFmdA991AcsyUXE38mXM0UMfpRjuylIDaosn+y/NYkIUTRo//XgG/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4h1h6V+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E50606A31C;
	Mon,  9 Nov 2026 23:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4h1h6V+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB681F0089F;
	Mon,  9 Nov 2026 23:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794265939;
	bh=Lh6jKE0jZf6KXSkuM9kQvKbV2Bgjh7LJ8lSHz4kPoDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l4h1h6V+/fcPnTejkowJu1EfXMoS1Y2B6e1qSlqPKTrXHveygv20bFKOh3Ug6nXR/
	 JC9DQfj+goDo3PDEMQlAN92Fvd1VKvcGEDHy4BXBaAScBT7H3iw55+2o2E5X6Irx6x
	 AOyJDEhVGned2A4P7lew4m/Uu4PJFTTMMRdhggnuoy1g8kqSAROaFaPebiGbrRgfeM
	 igerbIbqumgMUAcrVEZFiCRreft6LX63ZpqT0Tmh5clgf01u2y6qC4kt+cxX9xFOQf
	 WJMTOS8mdwKolg4ObfSaJvgXNbLzWN0QwiO65oXgml52zlidQ8KiWH73yngeACrjmF
	 unV3CpXGDVx6g==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 714B430923D0; Mon, 09 Nov 2026 23:11:59 +0000 (GMT)
Date: Mon, 9 Nov 2026 23:11:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 3/3] regulator: Add TI LM51772 support
Message-ID: <2c13f016-5950-4f93-be66-0f1a378807d8@sirena.org.uk>
References: <20261106-paul-lm51772-v5-0-0e83ac9711d9@bootlin.com>
 <20261106-paul-lm51772-v5-3-0e83ac9711d9@bootlin.com>
 <DMO344BLD9UQ.2X4YL7T3UZOWL@bootlin.com>
 <ba06d540-e971-4e18-99d0-16f8f4530eb7@sirena.org.uk>
 <DMOA2IJB4L56.1AIE3BMYG9QJJ@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="ox1BAC6YvTzDnUty"
Content-Disposition: inline
In-Reply-To: <DMOA2IJB4L56.1AIE3BMYG9QJJ@bootlin.com>
X-Cookie: Whoever dies with the most toys wins.


--ox1BAC6YvTzDnUty
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 06, 2026 at 05:44:42PM +0100, Paul Louvel wrote:
> On Fri Nov 6, 2026 at 1:22 PM CET, Mark Brown wrote:

> > Please delete unneeded context from mails when replying.  Doing this
> > makes it much easier to find your reply in the message, helping ensure
> > it won't be missed by people scrolling through the irrelevant quoted
> > material.

> Sure, thanks for the feedback.

I see this was a direct reply to your own patch...   I literally did not
find any content in the mail, the original patch is 30k.  If there was
something there please let me know.

--ox1BAC6YvTzDnUty
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavJTPwAKCRAv73Ows9A4
iTO+AQD6GuvsAzrF4RgW9CmBBqY/k5CkEdQxGXF29XcaTuSW0QEA2vI41GKf3mSG
sccU+NeB1Lujo7+ANzsj9hXEKrSSgAQ=
=7LEK
-----END PGP SIGNATURE-----

--ox1BAC6YvTzDnUty--
