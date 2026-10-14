Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B88374E5A;
	Wed, 14 Oct 2026 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996116; cv=none; b=OWXyFitA574EQaKv6FqqOHNnWJttLUuxg/vIaG/jSTqfmetoXt0qR1wpawvsFK/xAjr3YCAMeHSLk+GmsBZer6UGIc5koV+x0jHoJ8ORKGpLQKCHf0LxPz8Yg+ozbkDdd30Fya5vxqSlyIYvhsMUJx9FKZIm1Wra3VXpx+6bE6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996116; c=relaxed/simple;
	bh=Rcv7D4ejqMo9Y2y5NsaLfEuJDRQXV/WDmG0mYZqP0NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3d8CC8A1/Oj2KZSMkGoWyzL0427o2Zy7V+1RAQjgCDp2ZSZjWAGoe65Ck057dY+I/qxL/oM6SEnbR7epygXmB46B/zUBneO39R1gWDwUpFVzQKYvFgtT3Dwo5iE3YmmVQP2et6WKTL9/18IYKDPm7cR+UIQCx7s+gN1s611OSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=crSTnyMn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="crSTnyMn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2541C1F000C4;
	Wed, 14 Oct 2026 16:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791996114;
	bh=kdPjNtHB8MOdeRNmRE3I7flFBxx1jmv6FUZX5a1VD/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=crSTnyMnUPC+61IqsXi5sZ4AFtBDnoXBS6J9GIf9gvPEKOZuxXkBXD6N7eHVRpBIo
	 SHrQkTbswo6ZdvmdHq+vdHFsRgGlCU+BC9hEfz5AbHhTrDmaP9+CdO2Y3bM+GQ7UrI
	 poGpEZpJN7JBBi8ebTrxG+z3cv8XNCS+gXwWvUDzGfMsUByD0exifBHiTQq20LDINy
	 HjGP0UpZclvpYgfwlRW8L7cIvUKFCj1B8GH7dIW6uTR0flnDwUsUe22lSvFlop2uR9
	 5nX7b62ahuSXEbdZrFeV5QSTYgUUci+r1XjvEAMAl42xbGSQzd5c29rbNHXU5Ht4Yb
	 sqfIRy3ONWwDw==
Date: Wed, 14 Oct 2026 17:41:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, tglx@kernel.org, radu@rendec.net,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel@riscstar.com>
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: introduce
 toshiba,tc9564-msigen.yaml
Message-ID: <20261014-getting-bronze-d8ab7598d9ee@spud>
References: <20261012190245.3988619-1-elder@riscstar.com>
 <20261012190245.3988619-2-elder@riscstar.com>
 <20261013-coexist-sixtyfold-cc6614086d3a@spud>
 <20261014-eminent-normal-lynx-3ebba3@quoll>
 <c5af1a40-e498-4855-8797-2663db83b9e6@kernel.org>
 <b8a8ca4f-c575-448a-baea-4b9f82f15e39@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MVRxSaBuZi6atqgw"
Content-Disposition: inline
In-Reply-To: <b8a8ca4f-c575-448a-baea-4b9f82f15e39@riscstar.com>

--MVRxSaBuZi6atqgw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 09:55:03AM -0500, Alex Elder wrote:
> On 10/14/26 5:22 AM, Krzysztof Kozlowski wrote:
> > > I still do not understand why do we need to describe the inner wirings
> > > of the tc9564 device. So far I found no posting of DTS showing proper
> > > usage of it on the host. Without proper usage, what is the point exac=
tly
> > > to describe the inner specifics of tc9564?
> > And as shown here:
> > https://lore.kernel.org/all/20261012152408.3729237-5-elder@riscstar.com/
> >=20
> > there is no single user of any of this (this=3Dreset, clock, irqchip
> > probably and more) in upstreamed patches.
> >=20
> > I am getting tired to keep discussing it, so next time instead of words,
> > please post CODE which is the argument - who uses any of these devices
> > you keep adding.
>=20
> I'll take a break from my in-order responses to messages, and will
> respond to this first.

Not really replying to any of this, but figured it was worth
mentioning that I am reviewing with the assumption that it's similar
to the microchip lan9xxx devices that can either be a standalone SoC
or connected as PCI endpoint.

You keep calling it an SoC, which I took to mean that this had
linux-capable CPU cores on it. Is that not actually the case?

> Our ultimate goal is to support the two DWMAC interfaces attached
> to PCIe functions within the TC9564.  This is a complex SoC which
> interfaces with the host via an upstream PCIe switch port, and
> incorporates an embedded PCIe endpoint with two functions.
>=20
> Based on your request, I will plan to send *all* of the code that's
> required for DWMAC support for review later today and tomorrow.  I
> have been pacing myself (in part not to inundate the lists with
> patches).
>=20
>=20
> A block diagram representing the TC9564 SoC is included in this
> devicetree binding:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/comm=
it/?h=3Dchar-misc-next&id=3Ded0a1c1eaa376e11cf8c97d898f2811b8ded322f
>=20
> That explains (and attempts to show) that devices (including clock
> and reset functionality) use PCI endpoint BARs for access to their
> registers.  Other IP blocks shown are an address translation unit,
> a block of SRAM, two XGMAC interfaces, and an MSI generator for
> each of the two embedded PCI functions.
>=20
>=20
> To show the final DTS file, I have squashed the working code I have
> and refer you here, starting at line 994:
>=20
> https://github.com/riscstar/linux/blob/18d7146c807a6264388c919391b77a7956=
12e342/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts#L994
>=20
>=20
> Note that this exposes many internal details of the SoC, which
> Krzysztof objected to here:
> https://lore.kernel.org/lkml/fbeac5ba-a28d-4d34-8d23-4946aef515ea@kernel.=
org/
>=20
> I responded, explaining some history on this code and asking
> for clarification on criteria for when it's acceptable to
> describe chip internals in devicetree, but received no answer.
>=20
>=20
> The PCI endpoint bus enables a PCI endpoint to be treated as
> a *bus* that provides access to multiple peripherals, rather
> than as a simple single-peripheral device.  This goes well
> beyond the capability of the PCI enumeration process to
> discover the nature of the hardware, leveraging devicetree as
> a hardware description language to describe the organization
> within a complex chip.
>=20
> I understand the desire to consider the PCI endpoint (function)
> as the boundary for devicetree descriptions.  But I also see
> great benefit from viewing the SoC as a subsystem in itself,
> whose IP blocks and connections between them are described
> using devicetree.

--MVRxSaBuZi6atqgw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas+wzQAKCRB4tDGHoIJi
0pL0AP9lTJ2KVJDnUdCjPzRUbDAZHAutJk3F6RtsbSp2BQfcqgD/RWCvU6ZgRmCn
8w0tIuyF0UQ6OE2Y2KjM09/JdgTPlgU=
=LjXm
-----END PGP SIGNATURE-----

--MVRxSaBuZi6atqgw--
