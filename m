Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87D83B8959;
	Fri, 25 Sep 2026 17:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356837; cv=none; b=WuczmNCfUTilXAcAL2gHoH9d0CXxoUgE69oW3tIYP5tm48yC6U7E3OHz58EZ2ovWgr90Z3aGGo0hrk4QzX98w0HQApWYTp/+qaqiW3f4ssq125ksJhGaNPRZDMfL3q14V7Dnao8257Wsgqo9VpN4maya70EaZqcsNQKGsCMeRi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356837; c=relaxed/simple;
	bh=xuH4rMHgiZCL3Cowf3bOoFm040m2tsbBRg8ZaVQhjiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DI5dqQCEvtkPZAWDgaZz+aQbZM50OTDUnPKp7fkAfqq516hx34WAAu6ERGgGNJFgT1BdMV5q7ykWu0YCaBjWLXBHLxmawZvLnSFp5ScDXpL3+szFKg1VUSVf8wKQFlOmpHqaT2gwQ2UVypgLHXqOU/awGnuBLks3iH2/VIzvXeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/6+HumM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/6+HumM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781BC1F000FF;
	Fri, 25 Sep 2026 17:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790356828;
	bh=9mtMs1F8URTL/dYKicvxLK2zBTs6tbZNKZ1u22zz9SQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b/6+HumMP7kPnpdXsDR8qrKrbab2uwIwHABKXxhkhixQh+tUW4n+nvdkC58doeNeg
	 d19x4o0FJsX4zkZj/h7uCI87IPZEbsSzrQW1rjzd7lgyKB8jOz38fBXKzqR79VVLBj
	 xcs8A9W3tucdTnozTX0wHlQanQ5UTffAPsflZ/TW3J3khdbkm05VZCT6rRmqAp+CDt
	 GL2t5XH1YuCoq//pI1C4C2dXAxQyARbTrTlZNM0vQ+G1mOH+VT4PvBfuLygCzVtz2Z
	 9XaiLsvV8fUbnPttAmLkBKTTvM3zPL48jVTaxomSCtQIWTAGWHwQpdxClJzlncTElr
	 sDA8oCpaEirCw==
Date: Fri, 25 Sep 2026 18:20:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"rahul@summations.net" <rahul@summations.net>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"lftan.linux@gmail.com" <lftan.linux@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Message-ID: <767ad0d8-5886-4c09-b41a-681059b211b4@sirena.org.uk>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
 <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
 <9c0ae39b-d214-40f5-b010-cdea14ccc774@kernel.org>
 <c2c57bf0-e610-4353-93a4-84edfd08e767@sirena.org.uk>
 <SH0PR01MB08411AA7F403A71D2D7470A6F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
 <0db3ed29-8bb8-4dc3-a4cb-cc5b9bf2e893@kernel.org>
 <SH0PR01MB0841C933DE1E00C4012BDF53F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6d2JNYG1b86DxwHU"
Content-Disposition: inline
In-Reply-To: <SH0PR01MB0841C933DE1E00C4012BDF53F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
X-Cookie: Love America -- or give it back.


--6d2JNYG1b86DxwHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2026 at 07:14:14AM +0000, Joshua Yeong wrote:

> rpmi-voltage: rpmi-voltage {
> 	mboxes = <0x0c 0x1004 0x00>;
> 	#voltage-domain-cells = <0x01>;
> 	compatible = "riscv,rpmi-voltage";
> };

> The user does not need to map any other information under
> /rpmi-voltage/regulators/volt1 , since the value are being decided by
> the platform microcontroller.  The fields like 'names', '
> regulator-max-microvolt' and ' regulator-min-microvolt' are being
> discovered during runtime instead.

We still want constraints, partly just as a matter of policy since we
don't touch the hardware without explicit configuration and partly so
that we can have additional constraints outside the firmware represented
(either due to it being hard to fix a misdescription in firmware or due
to needing to accout for some additional restriction that comes from
something like an incomplete DT).

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--6d2JNYG1b86DxwHU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2rVYACgkQJNaLcl1U
h9BgrggAgDyhsfxohSdyqHdW4q/wtZW8puPnBGyIVH8LSsrSt/PaB7PW2iI/psK0
uahbIBFuxTHZ3IYFCT/y8S/a2zALvfLf2oQArhst89RBMHzCA7yFao7Frh07JJ/t
tbMuWK0RbvJCYuMiysEm1Pw6BYTgjRmfhgTOWLefbpZinhIjYDY3Q8G+YPmKKmId
3JD9dmUPLe0MX2TVJRYaaidNS3upNftJhNd3dWVsqVHf6/u/ZoW7f4aRwvi9sFEB
bxJGGCcYdriLS6Xb9ymfl6KABEfMUm8iuiSCZNHOGoP1M7ciSNz0CGbl3wYB2rzg
7pAL74BFEDv2UHrE+MxlOIYYjrsoyw==
=xPca
-----END PGP SIGNATURE-----

--6d2JNYG1b86DxwHU--
