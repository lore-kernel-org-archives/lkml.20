Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729196;
	b=gWThxxHcnJfTjMX6vTZ4/6jtH40v/dk7Tpp6UuMYsgUuiom4kFqSo0Dk66bP4zGEsiFP
	 sKViOQJiy1FVdBgexf++B3ha5MGrt2NsFNcKqGGA7unDPhqe21IZ9xzFSRAOOEFuwvl3N
	 2fEftPvlH15maczQyrXw3FpO3sIde/UQKgzyuYAGppWkPzXrdl8RIqwhBKT98jj1G3nQd
	 zSYvq3xTth3SzoeOJfQLaLxV783yIcnjabFqLBGV7p3hB/siVBjdFdrUSGbwyGDTdHmUg
	 3peOdaphoEWv/a4WLMVVcTKnv6TZZQ2/ZhAqjVP6zN/nF+C40Djk9S2m3WOdd2YYiKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729196;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rZbbKsOT3B+Huei3LRC2NCTrPi3bMyak8MOV8Pjh8cQ=;
	b=XoerEWVZOciuOjkX9n7lC4JdOcnAFC7X+5WH56Pi1l0Z/vNynHrZ9SiSEwgga1nEyuFB
	 1KnxL61OL6u34bG86yYG1H/Alc3p815WJmKdB/4wrvmVvpO7o5Q0r8RccvOmQcQAYEc3O
	 vzTXClALkJkq0Md8uV2pLVLHmrzwdlBbkpJkqDcIujxlZHzmSeEFRpmI/qktbZVshzLaF
	 p7sXkcVFsvbDH0anPTvdEoW2eJmXOjFKT1jk6akYiyD0I/9Kk9Cq3rjpND2ymPGAt/Ep1
	 ui/GVE5aoPlO2ASOkrJ4hGX4fxG3keQOQsR8K3VCTScaFxzDWzXmIy8G5qdthKW/d2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UdhusQf1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FB6606A328;
	Tue,  3 Nov 2026 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UdhusQf1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC771F000C1;
	Tue,  3 Nov 2026 18:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793729195;
	bh=rZbbKsOT3B+Huei3LRC2NCTrPi3bMyak8MOV8Pjh8cQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UdhusQf1RygvDB2Py37IDdTYUqiwvNEgqMqthE/7HjcNOy8gE/dDxYQosrerL4KvO
	 vuN0mnClnUIztDcPt+yjfMXUMY4I+gK7Dp8HE5Y+U5W8baLzpceYCNXAr9wfomNPus
	 JuRCgEx0M2fNcQkSQ1uV7sEjhvodJodHBrRWEZjBpeFoKgwYoTvsUdnTA4BfGsJXg9
	 LL0sltRAOtI2hJLnLycLuZHFosRgVYpw2gS2YjDyzMTIJU8w9sBFAyNGvlU8BrCzAp
	 8tdbu2Kr6+cocAaJPfNQbp2xApBOliGQS7m6HO6Ghlsslk0yb7AzhepACtJDDMvD8h
	 mgG9lgBYG2zDQ==
Date: Tue, 3 Nov 2026 18:06:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Minda Chen <minda.chen@starfivetech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: starfive,jhb100-dwc3: Add
 adapter register region
Message-ID: <20261103-reporter-enactment-a125058768e9@spud>
References: <20261103064836.71059-1-minda.chen@starfivetech.com>
 <20261103064836.71059-2-minda.chen@starfivetech.com>
 <20261103-splendid-topaz-raptor-64a6fc@quoll>
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
	protocol="application/pgp-signature"; boundary="4SmICQMVUQuY8epi"
Content-Disposition: inline
In-Reply-To: <20261103-splendid-topaz-raptor-64a6fc@quoll>

--4SmICQMVUQuY8epi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 12:48:24PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 02:48:34PM +0800, Minda Chen wrote:
> > Add dt-binding of JHB100 server host field USB device controller,
>=20
> I do not see where you added this binding.

I feel like there probably should be a unique compatible for this
particular controller since it seems to be fundamentally different to
the other one on the device.

>=20
> > which still using dwc3 usb core and contains an extra PHY adapter
> > register IO register region. Require to add IO register descriptions
> > and regs-name list.
> >=20
> > To compat with normal bmc usb, which contains only 1 dwc3 core IO
>=20
> BMC? USB? DWC3? Please use proper acronyms to make it readable.
>=20
> > register region, add miniItem to 1.
> >=20
> > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>=20
> Best regards,
> Krzysztof
>=20

--4SmICQMVUQuY8epi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauoipAAKCRB4tDGHoIJi
0hNmAP4wIRujeU9EFPuF5VU/ta4FjTPCKsENDPatHyMrY9KMLwEA8aIZx+gnWJt6
ZEr8HHnN4z575jXBbITVw0r/BEKzcA8=
=fWOn
-----END PGP SIGNATURE-----

--4SmICQMVUQuY8epi--
