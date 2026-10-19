Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439385;
	b=vGmT3rdKxjB+IcrUN2BAPIazGE44wlFpYOtUtDdqTdJGAE/x3wiDnovW5YNTrcUXrLGw
	 R8I+nWceDNGuWOzZhbMLFjUhpMh/MG5WQjgfaQ/TMryRcdIBK9cDbodfBgTUZw2YLHf/7
	 cLUqNjIZeYek4ZW1F5S5ZFEiNaMSPEDHmPqQzd6VKtgVWj97PVcRZN+ugJyKQGaiDGNKh
	 VJAzDpfeY2VIFShkHyRwDLTjd7AH7R2QaDm1+agsiTXw9Aya8/PKFQW+lbjS+Lf6NgSMF
	 QVJ0Ws5AJyHEXixAKe0V10iqRYXYJtSusvJO9mRiM5T/q5R6H6MvZ7QSpIaODdC8Kng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439385;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=N95/D3QHpPK+quUbfN1Ofqtaod9jW0kiXN8/QAgqyPw=;
	b=cEBYCvLVhCDQ0QoD54GV6O2K6stxM+5+B4wfMiAQNO8w2Hifz7Hd6z4edF8B0xHgekQ5
	 4rZVZ8V7mzwX3Gr+Y0+lQV0RbiCKdIstMEJibAFWdhvkKEfjZHC5Hr0q2H2H/0rJUIdpO
	 EIS/wy+SGWP+8PNuNgwpxHmfYC085CelHoSvWydQwLQQJriCHRYEE6ymH8+emWTp12N00
	 8mMJ1WBMl6xzfN/1CQMgi/TaxBLyLfF3AMWs6cNGJLX2KOdtJfHy08Be1/8EeMzKLjg0u
	 J2DMLKDyzuO1Bcfn/QpftAPldxEk6EgrO/U+RyJMJDpVqeV89SPdAJbe8L0tYmqzPFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RkmDsNdn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788BB606A31A;
	Mon, 19 Oct 2026 19:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RkmDsNdn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8838F1F000C4;
	Mon, 19 Oct 2026 19:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792439385;
	bh=N95/D3QHpPK+quUbfN1Ofqtaod9jW0kiXN8/QAgqyPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RkmDsNdnOCqC0S81a6TIaLmduMl3HhPFj2jdJjTvv3Ur8V+AOXcIt+kLZn4AR5FEF
	 Hfw4AhJfpyBvmNkBGjt1Th4Qvp9aXFM7Lj3+X4Pfad1FKzcAQXSIz2C9Q0VygXkSgL
	 q9n5F/Wv4Y6OxDsgrJf54dr7vWpjw6j3Ku2t+37L0F3SEuHQbZaS1jqDFrJDnNpfmR
	 NFwp5K5iiGrl3J77oAzCRgXa63K7N5ETFjr+eHwFdGwmf+6CMhGi4141tDfxF6Nm2c
	 ZoslUOIs3CrZu/mk2ECmEZwW9jlY20UwSsG2vvSmIP5X+bb/e/rzm6FSKLlItPBG13
	 vLuMUSespaomA==
Date: Mon, 19 Oct 2026 20:49:40 +0100
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
Message-ID: <20261019-darkroom-endowment-43ef047fc24e@spud>
References: <20261012190245.3988619-1-elder@riscstar.com>
 <20261012190245.3988619-2-elder@riscstar.com>
 <20261013-coexist-sixtyfold-cc6614086d3a@spud>
 <20261014-eminent-normal-lynx-3ebba3@quoll>
 <c5af1a40-e498-4855-8797-2663db83b9e6@kernel.org>
 <b8a8ca4f-c575-448a-baea-4b9f82f15e39@riscstar.com>
 <20261014-getting-bronze-d8ab7598d9ee@spud>
 <af5ce6ac-244c-4fc4-bbc1-8875eec8508a@riscstar.com>
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
	protocol="application/pgp-signature"; boundary="ROsNIakkkNc423LV"
Content-Disposition: inline
In-Reply-To: <af5ce6ac-244c-4fc4-bbc1-8875eec8508a@riscstar.com>

--ROsNIakkkNc423LV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:57:08AM -0500, Alex Elder wrote:
> On 10/14/26 11:41 AM, Conor Dooley wrote:
> > On Wed, Oct 14, 2026 at 09:55:03AM -0500, Alex Elder wrote:
> > > On 10/14/26 5:22 AM, Krzysztof Kozlowski wrote:
> > > > > I still do not understand why do we need to describe the inner wi=
rings
> > > > > of the tc9564 device. So far I found no posting of DTS showing pr=
oper
> > > > > usage of it on the host. Without proper usage, what is the point =
exactly
> > > > > to describe the inner specifics of tc9564?
> > > > And as shown here:
> > > > https://lore.kernel.org/all/20261012152408.3729237-5-elder@riscstar=
=2Ecom/
> > > >=20
> > > > there is no single user of any of this (this=3Dreset, clock, irqchip
> > > > probably and more) in upstreamed patches.
> > > >=20
> > > > I am getting tired to keep discussing it, so next time instead of w=
ords,
> > > > please post CODE which is the argument - who uses any of these devi=
ces
> > > > you keep adding.
> > >=20
> > > I'll take a break from my in-order responses to messages, and will
> > > respond to this first.
> >=20
> > Not really replying to any of this, but figured it was worth
> > mentioning that I am reviewing with the assumption that it's similar
> > to the microchip lan9xxx devices that can either be a standalone SoC
> > or connected as PCI endpoint.
>=20
> Yes, that was one of two things that this was modeled upon.
>=20
> The other is the Raspberry Pi RP1, which is probably a more
> similar example.
>=20
> > You keep calling it an SoC, which I took to mean that this had
> > linux-capable CPU cores on it. Is that not actually the case?
>=20
> Well it is an SoC, in that it has numerous interacting
> components that are aggregated into a single chip.

If that's it, I wouldn't really call this an SoC, you're just going to
confuse people (like me!) into thinking that this device can work
standalone...

> It does, in fact, have an embedded CPU that uses SRAM, but
> it's just an Arm Cortex M3 and is not Linux capable.

=2E..but maybe it can, depending on whether the devices being discussed
appear in the address space of the M3 or if the M3 is just some sort of
monitor CPU running firmware and bringing the device out of reset.

>=20
> So no, it is not a Linux-capable SoC the way the LAN966x is.

IIRC the LAN966x didn't expose the various peripherals as different
discoverable PCI functions and was just like "hey, we're a LAN966x".
What made it special was that there was already drivers etc for this
device from being an SoC, so the DT overlay solution neatly made use of
the existing stuff for the device.

If your device only exposes a single function for the whole device, I
feel like aping the LAN966x and describing it in DT via an overlay is
reasonable.

Cheers,
Conor.

> > > Our ultimate goal is to support the two DWMAC interfaces attached
> > > to PCIe functions within the TC9564.  This is a complex SoC which
> > > interfaces with the host via an upstream PCIe switch port, and
> > > incorporates an embedded PCIe endpoint with two functions.
> > >=20
> > > Based on your request, I will plan to send *all* of the code that's
> > > required for DWMAC support for review later today and tomorrow.  I
> > > have been pacing myself (in part not to inundate the lists with
> > > patches).
> > >=20
> > >=20
> > > A block diagram representing the TC9564 SoC is included in this
> > > devicetree binding:
> > >=20
> > > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/=
commit/?h=3Dchar-misc-next&id=3Ded0a1c1eaa376e11cf8c97d898f2811b8ded322f
> > >=20
> > > That explains (and attempts to show) that devices (including clock
> > > and reset functionality) use PCI endpoint BARs for access to their
> > > registers.  Other IP blocks shown are an address translation unit,
> > > a block of SRAM, two XGMAC interfaces, and an MSI generator for
> > > each of the two embedded PCI functions.
> > >=20
> > >=20
> > > To show the final DTS file, I have squashed the working code I have
> > > and refer you here, starting at line 994:
> > >=20
> > > https://github.com/riscstar/linux/blob/18d7146c807a6264388c919391b77a=
795612e342/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts#L994
> > >=20
> > >=20
> > > Note that this exposes many internal details of the SoC, which
> > > Krzysztof objected to here:
> > > https://lore.kernel.org/lkml/fbeac5ba-a28d-4d34-8d23-4946aef515ea@ker=
nel.org/
> > >=20
> > > I responded, explaining some history on this code and asking
> > > for clarification on criteria for when it's acceptable to
> > > describe chip internals in devicetree, but received no answer.
> > >=20
> > >=20
> > > The PCI endpoint bus enables a PCI endpoint to be treated as
> > > a *bus* that provides access to multiple peripherals, rather
> > > than as a simple single-peripheral device.  This goes well
> > > beyond the capability of the PCI enumeration process to
> > > discover the nature of the hardware, leveraging devicetree as
> > > a hardware description language to describe the organization
> > > within a complex chip.
> > >=20
> > > I understand the desire to consider the PCI endpoint (function)
> > > as the boundary for devicetree descriptions.  But I also see
> > > great benefit from viewing the SoC as a subsystem in itself,
> > > whose IP blocks and connections between them are described
> > > using devicetree.
>=20

--ROsNIakkkNc423LV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatZ0VAAKCRB4tDGHoIJi
0sfuAP0UPXgvtVWoiIk/gsnOb5yJJuJsJJwVavPi3oURvneisAD5AUf7CtjkwtqB
bgir2dfjuP1cGAKnYf0PXrXC9FtHxww=
=NMGR
-----END PGP SIGNATURE-----

--ROsNIakkkNc423LV--
