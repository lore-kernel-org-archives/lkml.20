Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA86466B13;
	Mon, 31 Aug 2026 15:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188739; cv=none; b=V++nR3j2T5pOcLSPxG4bYw5Z/XorGklLKJD8SD2XShDCh0FR/oZuhmpB21XGw5HMDkJSlutwQv0q2RODW+kwHjDgDFDEEKrCTO9VQWSys4y8JOXbMutCEEGmrVU46nJUM3+X/Uq7SRJNLAobbXnAe48t1bnbml/2qQVxzL8CkG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188739; c=relaxed/simple;
	bh=3vK32XRt2nRlV9Fh/s1dKGQelgeJKmJfgcMSVLshc8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZwp8Z/Jazkut2uBM5M1eRHVvecKHoXAn9nBovB2XhrCRDCP/CEZQ2lpkUv52NczH4ej8pctYQjBGex+AO6ORhAGnc2zFxxPzmB7vcNWnyiR85I6IXcIt1ApEfa7MNeTiu5/+UAysg31HcmgokLKJ/ORr9FLKrjiv+KQ3unBVYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAxREL+J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAxREL+J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E801F000E9;
	Mon, 31 Aug 2026 15:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788188738;
	bh=1VvvoKDC1wr29Uiol9YvJUY/bwvK1+XCnZbX99tZNJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eAxREL+JwxK4CCvUSG59O7BfoSjE/SU+qgLy1b4QKFPq0PLowDQjdaLrtbTXDfIEg
	 lql2dy2fiPYxsfG7/YDI5JlcgnSx/WGsdh3kXqOWGHZgSeM5T9X7lPj55705sKs1s7
	 AGjqrBx/k2g1IZBlj184eZz5ltbna66eab1vX7OdyD+IlsxeYnEpuDNjdo6KdnfR36
	 PPKzyMcsnuC2Iz8vQClQ4T8pZFPCCCbMuHtrK4CLulRkNcnHmnkzHSumkSEOcEhjl9
	 Izl/ZPUEsJF4kZc3eGvIbyJA9fjYmvDAUXIlgdFSbGIIKU5MnAbcfCYDjpH6JmynGD
	 +ArVgANFEd79Q==
Date: Mon, 31 Aug 2026 16:05:33 +0100
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
Message-ID: <20260831-clustered-margarine-80bf19005aad@spud>
References: <20260828151216.175020-1-marex@nabladev.com>
 <20260828-target-operable-ebc87e0bf30a@spud>
 <0f959651-34d9-4fb2-9e07-238f731c5342@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f5lg64idydn6ThKv"
Content-Disposition: inline
In-Reply-To: <0f959651-34d9-4fb2-9e07-238f731c5342@nabladev.com>

--f5lg64idydn6ThKv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 06:05:17PM +0200, Marek Vasut wrote:
> On 8/28/26 5:57 PM, Conor Dooley wrote:
>=20
> [...]
>=20
> > > +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> > > @@ -39,6 +39,17 @@ properties:
> > >     "#clock-cells":
> > >       const: 0
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 1
> > > +
> > > +patternProperties:
> > > +  "^phy@[0-9a-f]+$":
> > > +    type: object
> > > +    $ref: /schemas/phy/st,stm32-usb2phy.yaml
> > > +
> > >   required:
> > >     - compatible
> > >     - reg
> > > @@ -57,10 +68,14 @@ allOf:
> > >     - if:
> > >         properties:
> > >           compatible:
> > > -          const: st,stm32mp25-syscfg
> > > +          enum:
> > > +            - st,stm32mp23-syscfg
> > > +            - st,stm32mp25-syscfg
> >=20
> > Sashiko comment here I believe is valid, the syntax here only works if
> > there's only the listed compatible present. It doesn't work with
> > fallbacks.
>=20
> This syntax is used all over the place ?
>=20
> Documentation/devicetree/bindings/ata/ahci-platform.yaml-allOf:
> Documentation/devicetree/bindings/ata/ahci-platform.yaml-  - $ref:
> ahci-common.yaml#
> Documentation/devicetree/bindings/ata/ahci-platform.yaml-
> Documentation/devicetree/bindings/ata/ahci-platform.yaml-  - if:
> Documentation/devicetree/bindings/ata/ahci-platform.yaml-      properties:
> Documentation/devicetree/bindings/ata/ahci-platform.yaml-        compatib=
le:
> Documentation/devicetree/bindings/ata/ahci-platform.yaml:          contai=
ns:

                                                                     ^^^^^^=
^^
This is the key difference, you need "contains" for partial matches.

> Documentation/devicetree/bindings/ata/ahci-platform.yaml-            enum:
> Documentation/devicetree/bindings/ata/ahci-platform.yaml-              -
> qcom,apq8064-ahci
> Documentation/devicetree/bindings/ata/ahci-platform.yaml-              -
> qcom,ipq806x-ahci
>=20
> > pw-bot: changes-requested
> >=20
> > >       then:
> > >         required:
> > >           - "#clock-cells"
> > > +        - "#address-cells"
> > > +        - "#size-cells"
> >=20
> > else, false? But I'm also not sure what the benefit is of requiring
> > addr/size cells when the child node is not?
> The subnodes of this syscfg node have reg property , see [PATCH v4 0/4]
> arm64: dts: st: Add STM32MP2 USB support .

Right, but I was questioning why the properties describing the reg
property in children is required when the children (and thus the reg
property in them) were not made required.

--f5lg64idydn6ThKv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapWYPQAKCRB4tDGHoIJi
0t7RAQDWb/zrIGYBOSSjIuT+OgUBR3G9/jhekewcsZ/GKvcGQwEA5b/UUOv0HryS
Nn2PuV3DMeWBtPkUe4TGBWprOTj96QY=
=JCq9
-----END PGP SIGNATURE-----

--f5lg64idydn6ThKv--
