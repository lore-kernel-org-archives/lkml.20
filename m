Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315033;
	b=oQz04+ftYWTEDQ2a9u0xjPNurVrwiYHDtoAi0PuWjXjQtNrl8XcTcebHHg+mUP9aTelx
	 FMFrRgO14HFxHGzYfqpp7FAW8nY6/ptHqtirtVKhZ2kM6hQyP9CXxf0a0AC3/tjPpwevP
	 Lq08syyBWO5cH3D5uL74K2W9sZ/xPLlhk+LTu0M5/EZ2rZQ4HhJMzYCAgqaQ415+66V21
	 CClEcOrDkDrB6aG/xG2/TMJDflS/uwCR1ZbcFDG/FIW8DzLgro2S31ZeyAN5Z5C1dYngc
	 MTYEzXkdTkUN8fOl3p/Uy4Sms+Ub0HrWnn7PYEshhFarwcnX52ey18uHpHcAfMriXMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315033;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=eSIyMO4qEqpO7aW8Uu4zxMpreeSiJEJ6/6xBHS948Fk=;
	b=mnqXLccGk3PWtOmvU2uRafu3fq5rjRy4rtNNSy3upgRZl9ET0RfiUohXzMnDeh+TJxuv
	 G32rci5/v8ypFrYh2AWQUfQnUO2HRVzm5HDCmiNCw2MHs0eFAggeWJHY6mrutZD41kdHJ
	 YsXTwsZC1BEBVwZ4wV90BIPyrobd45tB4C+33cqTBDcKT5tGKXSi5+Z8E886Tbitx0JYw
	 awry2FuDP+UTsr9Sv0yToMgwSvkcQPQj4ChUG/eAjT8MOYu9EklhL7C2P+EI5tYwW2/f/
	 2QXbkfU/7xEIKyrTucNy2iz5Wi62w3drXP8f3HXorURgin36wNIDO2NR76KRIKuTdZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUxKmqGw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C85F606A335;
	Tue, 10 Nov 2026 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUxKmqGw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A9D1F0089F;
	Tue, 10 Nov 2026 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794315033;
	bh=eSIyMO4qEqpO7aW8Uu4zxMpreeSiJEJ6/6xBHS948Fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cUxKmqGw9tbGLyw35zdOXdvKprJ6RYJNccwnNwemZfhxfKN3/LaKBXwuGeYUy4QSp
	 E3OPApuouKYGi2J7RQwoilrNbJaINkDQNdq+jvujJH+QKefK+tDEF/HugQsVkkuiT/
	 BVdPgL2vkUpgEfD1P1DaO1yRnOU/e1DZFcPeICIFefQbHtwhIQYhopN5Q/RwGpk5LU
	 UI0aCcrBamJ9UGhvO0/M8l4ynx01GbYkPYuEYmNHrJBFLv2wgQF0MZ/+9fy2xiVUqV
	 Go3wSNsJ4UOha+IyIql6KOHUeLX+afGRWZyY+c7XQ5CHP+WKnyIhU/RyMLvv3MC61W
	 2ZHp5EECvEV+A==
Date: Tue, 10 Nov 2026 12:50:24 +0000
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
Message-ID: <a0dca1ff-f036-4c39-940f-cafa0c58dac6@sirena.org.uk>
References: <20261106-paul-lm51772-v5-0-0e83ac9711d9@bootlin.com>
 <20261106-paul-lm51772-v5-3-0e83ac9711d9@bootlin.com>
 <DMO344BLD9UQ.2X4YL7T3UZOWL@bootlin.com>
 <DMRDYWVZ4LY9.13BL0K8BOX2VC@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="iXfapwVFvBYP/e7D"
Content-Disposition: inline
In-Reply-To: <DMRDYWVZ4LY9.13BL0K8BOX2VC@bootlin.com>
X-Cookie: You can't take damsel here now.


--iXfapwVFvBYP/e7D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 10, 2026 at 09:26:04AM +0100, Paul Louvel wrote:
> On Fri Nov 6, 2026 at 12:17 PM CET, Paul Louvel wrote:

> > Maybe would it be better if the core could also change the active discharge
> > strength:
> >
> >   int (*set_active_discharge)(struct regulator_dev *rdev, bool enable,
> >             int strength_uA);
> >
> > That would remove the need for introducing a vendor-specific property:
> > 'ti,active-discharge-strength-microamp'.

> Let me know what you think.

I'm not sure how general that is, it's very common for configuration to
be done in terms of a resistance rather than some current regulated
thing (which is a lot harder to implement, unless your thing is actually
just a resistor and assuming a voltage or something).

--iXfapwVFvBYP/e7D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrzExAACgkQJNaLcl1U
h9C0rgf+Lsdr9w5/Gpqi4yIWItJdwNPcb2ayISb/4PJAAg647zBhRW2kic2/3su0
1mvk30XmHhoUIzLfiy8BmjhrF3SOydOTkjBoyFwQeCL9ew/x6Xfcmbu7aMRnAjg+
MjimpO9OTeQgaV+e+i9wkvgpeL3mqNClHWQGqesLxpuUsPznutEITvARQogAazcb
pQZTxXCnv0oZV6fSTKRtCUEpARTEsBrvZz15m46C4WBLvQZ7FogzzkL3hOM5Id29
GwPq5M7a/NcHLxEeRyLLpIqf5xPC2In5zNQa7pRUR+ZgDw0fwiEGPf+4tytUSKx0
o6R6huwHB9kPezKhFtO5KfRSRcGfxQ==
=5J3X
-----END PGP SIGNATURE-----

--iXfapwVFvBYP/e7D--
