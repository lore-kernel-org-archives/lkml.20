Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7676B486B8E;
	Wed,  9 Sep 2026 10:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949985; cv=none; b=biA4pznxZzIMrBJPRqFEiS10yk+8CPEaHtYi0izr+nN/xL3QIQLG/3rvS/afOnM0IL8AZSUtcGQGz8De+cNaAwavev8n2wE80oK8iWcBZ/+jKb3j1XQ0SeshlX8nOYZMyzFcXJHOY2zaqewCd8aTOYQG/11v86fPgCaERK/YS3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949985; c=relaxed/simple;
	bh=Zt1+z4NwZcoeE6r1XYdtawEEVW5QXnCZ4eTu9ViOSVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjIu92qvFy3u0l16FC1qZBKRV+2nEGR45geUMzvG16CTECzv9DaNa5COyAmoKMpGTjeOHrdYR3Ik9VXdpG5u1WC5FceRYAJORCrtpfmMO1noHJ1SrjGWbfQKvY2b9aQz3NFsThya56VqVKOipsusexF32R9KxYtbEMCnLnfRvIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emmPr2Xj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emmPr2Xj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610C51F00AC4;
	Wed,  9 Sep 2026 10:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788949984;
	bh=Zt1+z4NwZcoeE6r1XYdtawEEVW5QXnCZ4eTu9ViOSVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=emmPr2XjnDU+OoWAn16ohhGVokPcM41LhZonjExaPx8f/gsDStcfahLupaN729EIk
	 EfV0lykLpxUv0Wc1K9CYPvHP+5zXFvXkDvTcGVaqHE8cq5ARxogieAx3faNMnak4kk
	 6U78eREi2A5zG9ZK8DL05UOmHlXAXj/8JIkr2Yq6OwVuVUQzpQWxp8lIQIpkQQ5kuB
	 N0HK/SOWlw/hlia4albjymCQF0NBz+XP13mSCgOILT5v0Go/iv67YaA9w5esd9QYeN
	 truH491o0jlANoquXfqdQWWysVGZodYe3sNjOvxRp9xT5rKr9PMfc9dudtl/P6QpSP
	 kfnq/hrfs0LEg==
Date: Wed, 9 Sep 2026 11:32:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-usb@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car
 Gen5 DWC3 xHCI USB controller
Message-ID: <aqE11WTb6EMhn6Tb@squawk>
References: <20260903213031.314473-1-marek.vasut+renesas@mailbox.org>
 <20260904-colonial-wimp-b37c27657664@spud>
 <7771adfd-7447-4802-ad75-7c889ad32ee7@mailbox.org>
 <20260907-tassel-bargraph-836b6f41fc43@spud>
 <04bb7d78-4b0e-49ba-910a-6fa2b0a8c1a7@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qBVmVRqLRzK+3DcX"
Content-Disposition: inline
In-Reply-To: <04bb7d78-4b0e-49ba-910a-6fa2b0a8c1a7@mailbox.org>

--qBVmVRqLRzK+3DcX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 10:58:48PM +0200, Marek Vasut wrote:
> On 9/7/26 7:43 PM, Conor Dooley wrote:
>=20
> Hello Conor,
>=20
> > > > > +unevaluatedProperties: false
> > > >=20
> > > > I said this elsewhere today, but this binding has lots of "distaste=
ful"
> > > > properties for things that should be determined from the compatible
> > >=20
> > > Which properties would those be ? (it seems
> > > reg/clocks/interrupts/phys/power-domains/resets really need to be the=
re as
> > > separate properties, but maybe I am missing the point?)
> >=20
> > All the quirk properties is what I am talking about here. There's about
> > 50 of them and I don't know if a single one should actually exist.
>=20
> I cannot tell whether every one of them will ever be used or useful, but I
> also do not have a good argument to block most of them as they are tunabl=
es
> which apply to the DWC3 core itself.
>=20
> I could make only the ones which are currently used available, but that
> would be confusing the implementers by suggesting that the other quirks a=
re
> not applicable even if they might be ; and this would likely turn into an
> endless stream of schema updates, with random users enabling random quirks
> they just used. I don't think that would be helpful.

My understanding was that these things were effectively errata, so users
should not be enabling them willy nilly - the vast majority of these are
set in soc.dtsi files, and the couple dts users I checked were all SoCs
for which there was only one board. IMO it's far more confusing to suggest
that a user has to figure out which of these may apply on their platform.
But of course, do what you want, they're your users.

>=20
> > > > , so I
> > > > would appreciate it if you could use additionalProperties: false he=
re
> > > > cite the ones you need to use explicitly.
> > >=20
> > > May I ask, what exactly is the rule of thumb for additionalProperties=
:false
> > > and unevaluatedProperties:false ? I seem to struggle with picking the=
 right
> > > one for a while now.
> >=20
> > I would say, if all properties being imported apply to you device, use
> > unevaluated. If only some do, and there are some that will be
> > problematic or confusing if used, then additionalProperties: false and
> > citing the good ones explicit is clearer for users and prevents the bad
> > combos.
>=20
> Thank you for this clarification, I will make a note of it.

--qBVmVRqLRzK+3DcX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqE11QAKCRB4tDGHoIJi
0lUgAP9Pi97ecXQKWV9Ei1bIkP+caXYOH+MgetFqrSucBCaSwAD/UK7YKjo4wXMo
xQF0DaswAN7lo6C2jPDNjP4j7/1MnQU=
=HYWb
-----END PGP SIGNATURE-----

--qBVmVRqLRzK+3DcX--
