Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43A7468C29;
	Mon, 31 Aug 2026 17:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196388; cv=none; b=TeV4eRdGTajafqsSQeP2hlyj7UgnZzoSF54ACSdjutpst28oH8e1bkpnh9lcKezORKLAJmdrsCqQenWtR/Hgnj3agG75CQHnZSCkNZ2clH5Hs+E4jyj2GQUNRKgN1qeQBEu2xNIuZ4YGuxQKCEFxH4ipM2LalbDa+qVOXL1SQ7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196388; c=relaxed/simple;
	bh=YjnEkHVaf5Olii24ZMCxUn/VOiymgJjMZdMxFngaIGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3SluRodv3QK5T+HJue8oJDJJbmqQwdjf1f5es1vl0tzmkvtHk9sbHPH/FVQbrsvDspcH7UUSg/WMwxYQ3JmN1B0hqAjsVEoaFYf6V/iqIoWEbKwTPZjYOelRi+HM/jwnCFREhqaK8C7PZbur7PT7TxvqNMza9Ewi1GcCRudFz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOugAfkn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOugAfkn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9C91F000E9;
	Mon, 31 Aug 2026 17:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788196387;
	bh=9NBepZs32jJuyj31qdS12NqahL9gkzrdWlTOwWDa6Zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dOugAfknSWYgpXqCWh5rgXHbGJ32ERGty7oL7RF7QXjEtJoymox+iCZiXcwS64z0J
	 SkDKOlGs6XAJmR326V35Jrou5sKhsBBvWSfCHEt/azJYFuriPC3rrGsl8688Wh7HLl
	 tFAFxtA29z+jaizrYQmqG3o3wTEkFfWkCSeGFO3MfZSKeRTabFuwAI6mkzb5tdCSnr
	 +p895wkSfO5L5zTLhCh2XrZHQxiqFcqz20ty/2eQagWLDcqqK2jUNeKZcAsMBe9UDJ
	 fynXLcSVQSz4HRVqXCUk7GC2LtSf/fA3LUPibMsi0RKzqzzi8vhPUq3nKa6ZWrGUEs
	 DSvDAt1VG5Itg==
Date: Mon, 31 Aug 2026 18:13:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	devicetree@vger.kernel.org, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
Message-ID: <20260831-craftily-operative-ac855bdbe897@spud>
References: <20260828151216.175020-1-marex@nabladev.com>
 <20260828-target-operable-ebc87e0bf30a@spud>
 <0f959651-34d9-4fb2-9e07-238f731c5342@nabladev.com>
 <20260831-clustered-margarine-80bf19005aad@spud>
 <2b09012a-3cae-4589-b42d-f61d33f2f876@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2GKJtW1sIt798CcL"
Content-Disposition: inline
In-Reply-To: <2b09012a-3cae-4589-b42d-f61d33f2f876@nabladev.com>

--2GKJtW1sIt798CcL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 06:27:21PM +0200, Marek Vasut wrote:
> On 8/31/26 5:05 PM, Conor Dooley wrote:
>=20
> Hello Conor,
>=20
> > > > Sashiko comment here I believe is valid, the syntax here only works=
 if
> > > > there's only the listed compatible present. It doesn't work with
> > > > fallbacks.
> > >=20
> > > This syntax is used all over the place ?
> > >=20
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-allOf:
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-  - $ref:
> > > ahci-common.yaml#
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-  - if:
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-      proper=
ties:
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-        comp=
atible:
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml:          co=
ntains:
> >=20
> >                                                                       ^=
^^^^^^^
> > This is the key difference, you need "contains" for partial matches.
>=20
> Uh ... right ... fixed in V5. Thank you.
>=20
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-            =
enum:
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-            =
  -
> > > qcom,apq8064-ahci
> > > Documentation/devicetree/bindings/ata/ahci-platform.yaml-            =
  -
> > > qcom,ipq806x-ahci
> > >=20
> > > > pw-bot: changes-requested
> > > >=20
> > > > >        then:
> > > > >          required:
> > > > >            - "#clock-cells"
> > > > > +        - "#address-cells"
> > > > > +        - "#size-cells"
> > > >=20
> > > > else, false? But I'm also not sure what the benefit is of requiring
> > > > addr/size cells when the child node is not?
> > > The subnodes of this syscfg node have reg property , see [PATCH v4 0/=
4]
> > > arm64: dts: st: Add STM32MP2 USB support .
> >=20
> > Right, but I was questioning why the properties describing the reg
> > property in children is required when the children (and thus the reg
> > property in them) were not made required.
>=20
> Do you mean this patternProperties should be made required in here ?
>=20
> "
> +patternProperties:
> +  "^phy@[0-9a-f]+$":
> "
>=20
> Could you please give me a hint how to do that ? git grep gives me nothin=
g.

I mean, if the phys aren't going to be required I would not make the
cells properties required. I seem to recall a warning that dtbs_check
can emit when there are size/addr cells properties in a node where there
are no children, which is why I questioned this in the first place.

Otherwise, if the phys are to be made required (no idea if they should
be), I can only recall this being done with the non-pattern variant. IOW
required:
  - phy@0
  - phy@1

Cheers,
Conor.

--2GKJtW1sIt798CcL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapW2HgAKCRB4tDGHoIJi
0oDsAQCU71FAQQ1ExxLvSXyXK8BWpq+GTE6dd/z9sFMeJkNg/AD9FOwlnBwTzcbA
Vd/ANfeIW8hrBeqGBGmJLJQit2I7Rw4=
=T0Jt
-----END PGP SIGNATURE-----

--2GKJtW1sIt798CcL--
