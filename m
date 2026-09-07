Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668882FFF89;
	Mon,  7 Sep 2026 18:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804267; cv=none; b=mdpS3Pt8l1PNUYBnfy5/vhpNixzgdu+MznkxZTtM/W+W7Lz19SOKE54vE+FRGYLQ1skaPh6OMamvmuyi+LCWOsN7csSzH+c1KniwGKzmrjdML29LVWlfWG0CIIrHtMN2ErobIPV90Xh17Tl7ASF2Lu7zjYkwk4RIrvabu3an4Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804267; c=relaxed/simple;
	bh=FJ3KlRxpUXOaqZYlnv1OpZKQEVhij59iEgNdlEfcslM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAYU4QgXdyH0y0Od6bFNCRvZCUm57oxciZbPwV0+SRBtUsL6GLUjDO+NUuQiP0s3wQBft4mAAPYhP+phzjOgp1nOCguUEv+YFYUUYWJ06IXa4Pb2x0rIfyXb2wt9xTefh1eW/rwy5IeSvPtlzz+FUXCnFz/TuGVsLYytp+SNx+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5ZH6r7B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5ZH6r7B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C751F00A3A;
	Mon,  7 Sep 2026 18:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788804266;
	bh=uCwW6+gT3njRjgvc+5t1hsycs1+h5TBUJkyDrYO4u7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c5ZH6r7B9rcNWDmwK9ka7TzCln2oQankfFX/ykdQqIr9OL4RsaS1rGTS10rbX5FUV
	 7eBtFIsfa6mn6hgb6QDwA7cxiRV0jDjSftOAswhbMhTzz7T+M3XFCm8lRQQClHJQsV
	 /kLuTFZ/dOk7R6RGjnmBporPHmA+vqcs1RkKQ7OQrMjGIZO+3/p3fvAljfcstiuqVG
	 7jJMoq0nQafjd/0JCqJBtc0RDMACVvz4BBYsC0jib9Fec7EGhevjgcfIHbWh6DAUXQ
	 0exSOg4sVmKLum9eI7Jf1MAd3CP7iI2V8Deu+PJ4klKuNCsDaX4Eld8cd+brsXJ3My
	 6Yt7pRwj6bkTQ==
Date: Mon, 7 Sep 2026 19:04:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
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
Message-ID: <20260907-showroom-elevation-ba1a0792b7f7@spud>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com>
 <20260907-ensnare-wanted-e86eeaf770b0@spud>
 <27fb1c11-c1eb-4494-ac38-d794baf80814@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FBwSaQHk5R1QIosT"
Content-Disposition: inline
In-Reply-To: <27fb1c11-c1eb-4494-ac38-d794baf80814@sirena.org.uk>

--FBwSaQHk5R1QIosT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 06:09:57PM +0100, Mark Brown wrote:
> On Mon, Sep 07, 2026 at 06:06:24PM +0100, Conor Dooley wrote:
> > On Mon, Sep 07, 2026 at 11:16:08AM +0530, Shashank Maurya wrote:
>=20
> > > +	vcc =3D devm_regulator_get(&i2c->dev, "vcc");
> > > +	if (IS_ERR(vcc))
> > > +		return dev_err_probe(&i2c->dev, PTR_ERR(vcc),
> > > +				     "Failed to get vcc supply\n");
>=20
> > This needs to be optional, because without it you'll break existing
> > devicetrees. Unless you can explain how all existing users are
> > nonfunctional (e.g. nothing ever enabled the supply, which seems
> > doubtful given this surely worked when it was added) this must remain
> > optional.
>=20
> The core will stub in a dummy regulator for mandatory supplies that
> don't have anything mapped by firmware, otherwise essentially all
> regualtors would be optional and our error handling would be a disaster
> zone.

I always forget how this works. Thanks for the reminder.



--FBwSaQHk5R1QIosT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap78pQAKCRB4tDGHoIJi
0uTBAP9evMaKmff7rJAlkiT1L5Zx4532B5L6cpV0O5jW49THDQEAx/4ZV4Z/icen
QJ8YGia+cNCbCHFaHC2DFjOWUQ9irgA=
=QAjk
-----END PGP SIGNATURE-----

--FBwSaQHk5R1QIosT--
