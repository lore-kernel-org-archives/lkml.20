Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972713403EF;
	Mon,  7 Sep 2026 17:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788803026; cv=none; b=IqeiZWxQkvm23g9zIdacAuTtmUjjVJCZdVctKGSpjAxZRrnmsiWrbAC1KO1MolBEgh4hwM98X/M/gk4QPnScjdGbsWf9wuIDCJahm4y6uLcxovdcEkdYwPUgpyxrjP2PvJZwlwmo3tT8C/gz+R9mA4FjEtKPMLFGBMjffpUNwC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788803026; c=relaxed/simple;
	bh=JCuP5iwAbN1KVWFm0TUsonZQHuDpasz45FD7jELXQe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=es3tl5USYSCjPkoLBxYuv+Vp4Dx22iK5pB0pC4icbo/7dmMgYtrlNDD5lW9UpLaovTzNBcnpzTqForO3hQklcNl1CXmyUqpR/v7wf1doGMX+3pPpcuhpVQJdM394NrDowJ/s5OS2i15ODJuK7xwZUqSrRah5kbyJMDJYbibfIpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZxswswL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZxswswL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98131F00A3A;
	Mon,  7 Sep 2026 17:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788803025;
	bh=icUnZOhRCh6jXI4eaxDCpDQrM4ohx6YfoZJErlEzabY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SZxswswLdFwzA1ope4PgsXvXqIZSObU2mgTxmKWD/Gmp1P90Lby9+8F6+rcfFJWkj
	 ZFXpC7yUxkjw+NqPU7JUTqqEbnOFnbPvugD8BYk7i3BGdb5hB/XkSfL11p33yiJzF0
	 4rF3okuYzzLFiMpNNdXupIjCOe9SaXm1xQWe2cb6pDOZDdZNWIR7AaCwfiyjpdb0zZ
	 DkCJR/0F+M55i1JSZ5Ng36icOjip6p0a9FHrGvi0FkxhAc7OcwxzijxSzKL0orM3jl
	 q2kk6+VrS4vvas6k6i3qdaSX1cW5MXOt2JlpGK9EeQ+QtFTJcgl3eUluv8suCVgFOr
	 +IbDzPy5cC72w==
Date: Mon, 7 Sep 2026 18:43:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-usb@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car
 Gen5 DWC3 xHCI USB controller
Message-ID: <20260907-tassel-bargraph-836b6f41fc43@spud>
References: <20260903213031.314473-1-marek.vasut+renesas@mailbox.org>
 <20260904-colonial-wimp-b37c27657664@spud>
 <7771adfd-7447-4802-ad75-7c889ad32ee7@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l+BsWOi6/ltuqzg/"
Content-Disposition: inline
In-Reply-To: <7771adfd-7447-4802-ad75-7c889ad32ee7@mailbox.org>

--l+BsWOi6/ltuqzg/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2026 at 06:24:04PM +0200, Marek Vasut wrote:
> On 9/4/26 5:32 PM, Conor Dooley wrote:
>=20
> Hello Conor,
>=20
> [...]
>=20
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - reg-names
> > > +  - clocks
> > > +  - interrupts
> > > +  - phys
> > > +  - phy-names
> > > +  - power-domains
> > > +  - resets
> > > +
> > > +unevaluatedProperties: false
> >=20
> > I said this elsewhere today, but this binding has lots of "distasteful"
> > properties for things that should be determined from the compatible
>=20
> Which properties would those be ? (it seems
> reg/clocks/interrupts/phys/power-domains/resets really need to be there as
> separate properties, but maybe I am missing the point?)

All the quirk properties is what I am talking about here. There's about
50 of them and I don't know if a single one should actually exist.

> > , so I
> > would appreciate it if you could use additionalProperties: false here
> > cite the ones you need to use explicitly.
>=20
> May I ask, what exactly is the rule of thumb for additionalProperties:fal=
se
> and unevaluatedProperties:false ? I seem to struggle with picking the rig=
ht
> one for a while now.

I would say, if all properties being imported apply to you device, use
unevaluated. If only some do, and there are some that will be
problematic or confusing if used, then additionalProperties: false and
citing the good ones explicit is clearer for users and prevents the bad
combos.

>=20
> > Sounds like dr_mode: true and
> > maximum-speed: true are all you'd need?
> Ah, I think this also answers my previous question a bit. And, as for
> limiting the properties that are really needed -- this pulls in the common
> DWC3 USB IP core properties, which all do apply to the DWC3 core. They mi=
ght
> not be used on current hardware, but they are still valid for the DWC3 co=
re
> (IP).

--l+BsWOi6/ltuqzg/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap73zAAKCRB4tDGHoIJi
0pRzAP9n+Hs4lKXTWOlC5IvXgMmAURFKmKMNBSNfQLljYt9DNwD8CZYGxm79twVN
jHExhMMyd2u/59PLFdTLRCT9WDghLgA=
=whhB
-----END PGP SIGNATURE-----

--l+BsWOi6/ltuqzg/--
