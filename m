Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0013B411F93;
	Thu,  3 Sep 2026 08:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423449; cv=none; b=eDtQQrM97jyOi/hU+wF22ADpCVljUwlqRsDR73CbCjF3Cg+xG/xUbB9gW0LQdB2sPxzJfoYfzLDFNlqFroRrZ0/+TRR4XearKVCtGM2SbGuU3RbPOFKtXH1H9eZWMRP+x5DYEey2m1isTAN1yHWNB90SzoK5q3o4Ue+m96E8yyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423449; c=relaxed/simple;
	bh=PmSHGP0je+ZTOa30YsEZtEN3k//BDUbtLYYJIXhZWvY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NfUXGG5QeiXgIA+cV7FWtNHL0/rCF6WM7EgUMdO9gwUBTBn6El4zuU3T958dgulC+USkm1OxMYCTzlbofInrBtdYnswtj/+hVaRjYE1+koV0uAmlP8mM6n3wuFDWLoN29Afghvya6BrguFWJ3PcGU5vXweYuk/CHIO2TJPod4uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id CE39A205888;
	Thu, 03 Sep 2026 10:17:23 +0200 (CEST)
Message-ID: <d50816260b8be29948c4cc04172b5c88ea3313a4.camel@pengutronix.de>
Subject: Re: [PATCH v8 1/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G3E SoC
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Geert Uytterhoeven
	 <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, David Airlie
	 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm	 <magnus.damm@gmail.com>, Laurent Pinchart	
 <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 03 Sep 2026 10:17:23 +0200
In-Reply-To: <apg8luaJ3eobK8sm@tom-desktop>
References: <20260828122113.1426778-1-tommaso.merciai.xr@bp.renesas.com>
	 <20260828122113.1426778-2-tommaso.merciai.xr@bp.renesas.com>
	 <20260902-heavenly-ambrosial-trogon-b7ab03@quoll>
	 <apgsOubuGuvw_0rf@tom-desktop>
	 <CAMuHMdU0y5Dg9tW7fAM3QQHKpAw_+vmjj7v-XeZmrushQgQFAA@mail.gmail.com>
	 <apg8luaJ3eobK8sm@tom-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mi, 2026-09-02 at 17:11 +0200, Tommaso Merciai wrote:
> On Wed, Sep 02, 2026 at 04:20:51PM +0200, Geert Uytterhoeven wrote:
> > Hi all,
> >=20
> > On Wed, 2 Sept 2026 at 16:03, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > On Wed, Sep 02, 2026 at 08:37:06AM +0200, Krzysztof Kozlowski wrote:
> > > > On Fri, Aug 28, 2026 at 02:21:04PM +0200, Tommaso Merciai wrote:
> > > > > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compr=
ession
> > > > > Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> > > > > Processor (VSPD), and Display Unit (DU).
> > > > >=20
> > > > >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > > > >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > > > >=20
> > > > > Add new SoC-specific compatible string 'renesas,r9a09g047-du'.
> > > > >=20
> > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com=
>
> >=20
> > > > > --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.=
yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.=
yaml
> > > > > @@ -21,6 +21,7 @@ properties:
> > > > >            - renesas,r9a07g043u-du # RZ/G2UL
> > > > >            - renesas,r9a07g044-du # RZ/G2{L,LC}
> > > > >            - renesas,r9a08g046-du # RZ/G3L
> > > > > +          - renesas,r9a09g047-du # RZ/G3E
> > > > >            - renesas,r9a09g057-du # RZ/V2H(P)
> > > > >            - renesas,r9a09g077-du # RZ/T2H
> > > > >        - items:
> > > > > @@ -35,25 +36,51 @@ properties:
> > > > >            - const: renesas,r9a09g077-du # RZ/T2H fallback
> > > > >=20
> > > > >    reg:
> > > > > -    maxItems: 1
> > > > > +    minItems: 1
> > > > > +    maxItems: 2
> > > > > +
> > > > > +  reg-names:
> > > > > +    items:
> > > > > +      - const: du.0
> > > > > +      - const: du.1
> > > >=20
> > > > du is the name of the device, thus calling items "0" and "1" is pre=
tty
> > > > pointless - indices already define that. Please drop the reg-names.
> > >=20
> > > Will drop this in v8.
> > >=20
> > > > >    interrupts:
> > > > > -    maxItems: 1
> > > > > +    minItems: 1
> > > > > +    maxItems: 2
> > > > > +
> > > > > +  interrupt-names:
> > > > > +    items:
> > > > > +      - const: du.0
> > > > > +      - const: du.1
> > > >=20
> > > > Same here
> > >=20
> > > Same, thanks.
> > >=20
> > > >=20
> > > > >=20
> > > > >    clocks:
> > > > > +    minItems: 3
> > > > >      items:
> > > > >        - description: Main clock
> > > > >        - description: Register access clock
> > > > >        - description: Video clock
> > > > > +      - description: Main clock for DU1
> > > > > +      - description: Register access clock for DU1
> > > > > +      - description: Video clock for DU1
> > > > >=20
> > > > >    clock-names:
> > > > > +    minItems: 3
> > > > >      items:
> > > > >        - const: aclk
> > > > >        - const: pclk
> > > > >        - const: vclk
> > > > > +      - const: aclk1
> > > > > +      - const: pclk1
> > > > > +      - const: vclk1
> > > > >=20
> > > > >    resets:
> > > > > -    maxItems: 1
> > > > > +    minItems: 1
> > > > > +    maxItems: 2
> > > > > +
> > > > > +  reset-names:
> > > > > +    items:
> > > > > +      - const: resetn
> > > > > +      - const: resetn1
> > > >=20
> > > > Drop reset-names
> > >=20
> > > For reset-names, I got the the following comment from Philipp in v7 [=
1].
> > >=20
> > > Dropping reset-names would force the driver back to an index-based
> > > lookup, which is what that comment explicitly asked me to avoid.
> > >=20
> > > [1] https://lore.kernel.org/all/8382e2b9fd07fb1132c26e228b3899336fc1f=
dd4.camel@pengutronix.de/
> > >=20
> > > Philipp, Krzysztof, could you agree on which way you'd prefer?
> > > I'll follow whatever you decide.
> >=20
> > Until we get a variant with a third interrupt (or reset or reg),
> > which is not related to the number of channels...
>=20
> Right, IMHO names keep the driver flexible enough for such a variant,
> indices don't.

I would like to get rid of the reset_control_get_by_index() API
altogether, if possible. Currently there are only users with index =3D=3D
0, so this would be the first and so far only valid user. I'd prefer if
we could keep reset lookup aligned with clock lookup, with via clock-
names as well.

That being said, why are the two DU units represented as a single
device tree node at all? Aren't they two completely separate instances
of the same IP core?

regards
Philipp
