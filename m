Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5739448665E;
	Wed, 26 Aug 2026 22:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787784451; cv=none; b=t7+rpWjQH3uUE9a7wv09SjJrHB6KP1qFn3fJwSYRBKFaWzCCg6Oul0wEykygZ08RTYmpNwWNor8zGe684KExPQJBzrrXqdmemJB5qfAcjvKryGifzYj5+IofUmHajfORUeBq4W2WSACYDymV+qm5AZTdQjQSU8S+qAR6XZMb0fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787784451; c=relaxed/simple;
	bh=FRwQPG9DE7JxfoQ3ufmKEg/UDWvmWPSLdquxMxfgp+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXY5o9o0rsRkC8eU3TM3lNq+DIMAI5g2G10iK5HEHbyz2S0H+Z4KO58abcqUu8MweCtpTbrKW3M72z71PUW17T2tmfm9szbAecO4fiFs+qTHqY/XffX/PHGnt9CMskyff/+JtVKSq5iRfgy2JiPa+c9hJfLQrr3i3CM3YeiRbbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cicfke3W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cicfke3W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB87D1F000E9;
	Wed, 26 Aug 2026 22:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787784448;
	bh=FRwQPG9DE7JxfoQ3ufmKEg/UDWvmWPSLdquxMxfgp+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cicfke3WmAqQJ8y+V2HyotTup8sFctk1CxQcgHVnzbNpVUsHsUsqNdFLKOxrByERK
	 5rajg32WABXUJwNv5c+y/RPal+qbjWe+Wq9cBlIL8JGQBBooDxIWOs9DXaG9hotELY
	 qZbYTRoaEDmxEzMeD/9pLmbSzX22hkFaGfRbi7JKNc0Ms+xmWER36xQehRE/jOjZLZ
	 80QTAkln6bAqL8OfmthzqjkroUvbTVLKHgip4alVu2P1ESJPy1nSrvEUdj2m0+ZbkP
	 ly+JAsd5j+FkX97E+Gi2FHOi7FGXKkjkgMZt7+oTtYXRplbGne+fkDDSs9KzbkSS64
	 YZeaEaVj4sF3g==
Date: Wed, 26 Aug 2026 23:47:24 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UsOzYmVydCBCb8W+aWs=?= <robertbozik@gmail.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: Add OmniVision OV32C4
Message-ID: <20260826-prowling-jimmy-61f30fb50d03@spud>
References: <20260826072002.14357-1-robertbozik@gmail.com>
 <20260826072002.14357-2-robertbozik@gmail.com>
 <20260826-copy-arise-bb7e9eb5e908@spud>
 <CALSBEvTvrhniBrM29Y7sery15W-onz7t_8ZQhg1TW8nBDgYKxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="erYPw3LhD8tke5dL"
Content-Disposition: inline
In-Reply-To: <CALSBEvTvrhniBrM29Y7sery15W-onz7t_8ZQhg1TW8nBDgYKxg@mail.gmail.com>

--erYPw3LhD8tke5dL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 08:34:01PM +0200, R=C3=B3bert Bo=C5=BEik wrote:
> Hi Conor,
>=20
> > Where do this name and frequency come from? pin name I presume for the
> > former? Is 19.2 MHz a mandatory frequency?

Please do normal inline replies, instead of this which removes some
context.

> The name is the sensor's input clock pin (XVCLK), as in the other
> OmniVision bindings. 19.2 MHz is not a requirement of the sensor but of
> the driver: it comes from the platform (the ACPI SSDB of the laptop this
> was developed on provides 19.2 MHz) and the register tables in the
> driver are computed for it (the internal 96 MHz clock the timing
> registers count in is 5 x 19.2 MHz). The driver refuses other rates
> because I have no verified PLL settings for them. I'll drop the
> frequency from the description and keep it only in the example and in
> the driver. I've also dropped the sentence about what the driver
> supports from the description, that doesn't describe the hardware.

Great, sounds good to me. Thanks.

--erYPw3LhD8tke5dL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao9s/AAKCRB4tDGHoIJi
0n7/AQCW3Wl/KiqLkWSHU0BIKI58DZpmLW0ujhTry4N3PJy/5wD/clr9823jQ9mN
+/jvrNrd9wwdGl/RlmxnIQorECGmNww=
=9zyL
-----END PGP SIGNATURE-----

--erYPw3LhD8tke5dL--
