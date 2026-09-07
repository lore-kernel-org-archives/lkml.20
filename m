Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB06384CD6;
	Mon,  7 Sep 2026 17:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801005; cv=none; b=tlAkTZbv50u0c7X1npo6mB+LmMCQUgPEeL3Sl9b30eQD5G2UihpRIvMzExRhHDmKCVq1ZFqIdyjEV58kZjrhQHVe1HiERsCBvfn31/S7yhjmbsDYMJUfsq46AfZKZWdx43eMRLfk8ZKglVOj5xrSPonJBuY9yfh9k/tWE78JEoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801005; c=relaxed/simple;
	bh=QLLigvKNbAoCOKilh/bGZmAJfE7iEWK36qTCCItYVNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFPb8N4gjZ/4NdoYIdeW9Q5PlZ8nzPVJWmuggRxM70syt96il49qZ9rCJnMIJ1tI3optArOGvzm8Bh6BU7ZHfzR+2y6rT5ICZ9KWcABj+sCOKzJleXhdlmUIFHRPG2TCnAgwlAXgz7/qzYjsR+1imdRk0dhI/ZqifluZaXfLkWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owj98OfP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owj98OfP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2291F00A3A;
	Mon,  7 Sep 2026 17:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788801003;
	bh=XBD8pjkl49jXk6ajkWsBSrezfGMEnjWuGImmb1IVsS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=owj98OfPzHpf7poumZtjkOmlT4VMIBx+NqoC4mrrBTFwypnF6Xne+OwdM8BYfg5C5
	 //Yhj5AMTa4PmENVlWFNitqn080py7h/LhDXG9Ix5sC4lm4q6wbpu6FX3wfQeKv9EP
	 bZnFpvaTadNy2Erh0ykHYcNvD//gRyrVTRJ4NcOOzt3kV3mtMG3Lo/QOWnSjmFx5OO
	 knuUzNO/BAkr/5fSIJA37+bf0TXI2nevsEqHUONhF9iaLL6lAcvJfztsbz8BgGSYpr
	 cWGHZVRbl2JIcDoYx/2DkW04tZJBtjwl+aSt132tA1TN/jJfK2cv4L5yPX6qxoDay5
	 59Av3EQvk3IEw==
Date: Mon, 7 Sep 2026 18:09:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	venkata.valluru@oss.qualcomm.com,
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 2/2] regulator: rpi-panel-v2: Add required vcc-supply
 support
Message-ID: <27fb1c11-c1eb-4494-ac38-d794baf80814@sirena.org.uk>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com>
 <20260907-ensnare-wanted-e86eeaf770b0@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BHQstFVZMG9uADix"
Content-Disposition: inline
In-Reply-To: <20260907-ensnare-wanted-e86eeaf770b0@spud>
X-Cookie: Who's on first?


--BHQstFVZMG9uADix
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2026 at 06:06:24PM +0100, Conor Dooley wrote:
> On Mon, Sep 07, 2026 at 11:16:08AM +0530, Shashank Maurya wrote:

> > +	vcc = devm_regulator_get(&i2c->dev, "vcc");
> > +	if (IS_ERR(vcc))
> > +		return dev_err_probe(&i2c->dev, PTR_ERR(vcc),
> > +				     "Failed to get vcc supply\n");

> This needs to be optional, because without it you'll break existing
> devicetrees. Unless you can explain how all existing users are
> nonfunctional (e.g. nothing ever enabled the supply, which seems
> doubtful given this surely worked when it was added) this must remain
> optional.

The core will stub in a dummy regulator for mandatory supplies that
don't have anything mapped by firmware, otherwise essentially all
regualtors would be optional and our error handling would be a disaster
zone.

--BHQstFVZMG9uADix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqe7+UACgkQJNaLcl1U
h9C9ZAf/f9QhYY7ZUT17BbKqAxAxlo1ULd1F9rHjyXoc7HkBdFzsnvVOtI+9RPlw
KIkpIqJG2M/d30SnvXknr6HRcsg//ZdCcQddsJU6P92L+meFoLXELI0u/eepBDfM
pGzm6sTtle3Cs5Zv0azKtUny0jDw5GFVehvW4V11+Orwmz5dkVma4VyLfycICYOE
l/Fv38h86NoBBQnjErrgj7936F0uoyHelys4eaRadRqIAtcUTe5wRQxmKr4tSYn/
6tR3fr5DKHM5vx6+chL2WTPWw6eUWcp3ZzOiSimKamoUIU9HYiaNsyOXQEgi/Lfj
qeSGacc3WgWD0ZXr0oi2TsiujZaVTw==
=P4QE
-----END PGP SIGNATURE-----

--BHQstFVZMG9uADix--
