Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793564388;
	b=A8wITKO9HUeq3hBfVEOkktZCc/YyGyONxJ2YTv3DWQRb2/6nMoDo404RtIuqU/e3hrKp
	 /pkEevZGc/6L0aTA0qrBXU0etl3DiJfZtAQcF0wZGGB90YlT6W+IKt9cff1rDai7L4Njc
	 ADCFo7JpRtuUcv8AnMjiEZ24y3oMtcwGuifQW6nxCPONcxN5Ig7m9vAkCmCYABsKPWAfs
	 Mlp1MMLaLCI8QWeH5vJfEuENs1g/a4TynGsJ5gPSRqXFmo2TOm32U03uJDox9A/22WCCT
	 ChiA4/+1zHVroYxK9mj06uvUjRydZahlZjP6oWufE5n1Qh08MaGG6J4NT0vFW/kwriw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793564388;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=nbWzpEen76KfcL+CtXPbSjVeFwZsdAxBkZAu3PHXVRY=;
	b=ztSLPnvZOPzQWW1ebt7QVO3KSWCE/uhbpsDSGcwrE6milXDcm2XOxfV2/mh5feSZdDra
	 lt2jhqoLpcbd3TA4JhnNmyY75wn/hGarN+malmFehEY0kyOWV4y/lzpGPSb7Hs3sAl7jZ
	 NzsY6sIYFYF3JVrqqanpVE2tbAKXJuw0jrrK3bH36CjbE7C9mhnpUBEd5HWzexddr3au5
	 Azqa3oDIDSmeMK4721tbwZmL7Ah0AwHwxiLwzfuxCvH5hJdYcYjUZdMTT3QFrBUTm1nih
	 u+0Xbs6JSr89IuELJP5ghdya43lPIxXakCkGj7eTkrjYjFAvqJ0IBg8Z5jC42bQ5Ytg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=20rNYJKo;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A334606A324;
	Sun,  1 Nov 2026 20:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A334606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=20rNYJKo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=nbWzpEen76KfcL+CtXPbSjVeFwZsdAxBkZAu3PHXVRY=; b=20rNYJKowS8QgUWQ4jODdI+Rso
	vpy8xoxE5/YhQST3EwqyZxQNmAV03Y5o751usgC31Yc/McSk1TOqOl3zTIEtG/Tj6ZNluFes8ihJp
	+X13l9D3X4pnJOeyY2ekAMmWEDtrZSMUZ8LP3lJzUj7Lu1F6xYTU5pAYBiiJK0jUrI9hRxttmqeV0
	Upd10k0OsFPkI6kQGZjcz3bMChwkDKqtnvkeXN0sYn6goMIBQDkrUfV9dFr7bcLRDR225P4brDNnU
	UZhNWMWPmvq/HDXj1olPKXAI2ZcmO3wnp6wRkxfXQpLJhBxOxhPTB95rlPaSeerNlr2/rBXJMkQDh
	+jFRBS9Q==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v12 1/3] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock
 nodes
Date: Sun, 01 Nov 2026 21:19:33 +0100
Message-ID: <23607754.hxa6pUQ8Du@diego>
In-Reply-To:
 <CALj3r0g5twZNEiO5b1hHpxy3kAVBxLZNt55E2dxSSeZ5GgXisA@mail.gmail.com>
References:
 <20261023053548.1595033-1-coiaprant@gmail.com> <2977688.AiC22s8V5E@phil>
 <CALj3r0g5twZNEiO5b1hHpxy3kAVBxLZNt55E2dxSSeZ5GgXisA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Sonntag, 1. November 2026, 21:11:56 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Coia Prant:
> Heiko Stuebner <heiko@sntech.de> =E4=BA=8E2026=E5=B9=B411=E6=9C=881=E6=97=
=A5=E5=91=A8=E6=97=A5 22:06=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi,
> >
> > Am Freitag, 23. Oktober 2026, 07:35:46 Mitteleurop=C3=A4ische Normalzei=
t schrieb Coia Prant:
> > > The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
> > > the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
> > > interfaces via its four MII ports.  Add the XPCS device node to the
> > > SoC device tree.
> > >
> > > The XPCS device is accessed via the APB3 bus at 0xfda00000 and
> > > requires the CSR clock (PCLK_XPCS) for register access and the EEE
> > > clock (CLK_XPCS_EEE) for Energy Efficient Ethernet operation.  The
> > > PD_PIPE power domain must be enabled before any register access.
> > >
> > > Also add two fixed-clock nodes (clock-xpcs-gmac0 and clock-xpcs-gmac1,
> > > labelled clk_gmac0_xpcs_mii and clk_gmac1_xpcs_mii) providing the
> > > 125 MHz reference clock for the GMACs when operating with XPCS.  Their
> > > clock-output-names match the CRU mux parent names in clk-rk3568.c, so
> > > boards can reparent SCLK_GMAC0_RX_TX / SCLK_GMAC1_RX_TX through
> > > assigned-clock-parents.
> > >
> > > The XPCS node is disabled by default and must be enabled at the board
> > > level when 1000BASE-X/SGMII/QSGMII is in use.  The fixed-clock nodes
> > > are always present and do not have a status property, as they are
> > > static clock sources.
> > >
> > > The XPCS node requires a reference to the appropriate Naneng Combo PHY
> > > via the phys property.  dtbs_check only validates required properties
> > > for enabled nodes, so the SoC dtsi does not provide phys: boards that
> > > enable the XPCS must supply it, since the SerDes link is a board-level
> > > design choice (combphy1 on some boards, combphy2 on others).
> > >
> > > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk3568.dtsi | 23 +++++++++++++++++++++++
> > >  1 file changed, 23 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/bo=
ot/dts/rockchip/rk3568.dtsi
> > > index 3bc653f027f1f..20a72785adbc2 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > > @@ -8,6 +8,20 @@
> > >  / {
> > >       compatible =3D "rockchip,rk3568";
> > >
> > > +     clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
> > > +             compatible =3D "fixed-clock";
> > > +             clock-frequency =3D <125000000>;
> > > +             clock-output-names =3D "clk_gmac0_xpcs_mii";
> > > +             #clock-cells =3D <0>;
> > > +     };
> > > +
> > > +     clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
> > > +             compatible =3D "fixed-clock";
> > > +             clock-frequency =3D <125000000>;
> > > +             clock-output-names =3D "clk_gmac1_xpcs_mii";
> > > +             #clock-cells =3D <0>;
> > > +     };
> > > +
> >
> > these clocks don't belong here.
> >
> > When you place these nodes in the main, they seem to come out of
> > thin air, while that might be true for some boards, that they
> > have dedicated oscillators for that, this will likely not be true
> > for all.
> >
> > So these should be defined in the board dts, to match the actual
> > hardware.
> >
> >
> > Heiko
> >
>=20
> Hi Heiko,
>=20
> Okay, these are board-level clock sources, not something the SoC
> provides. Moving both fixed-clock nodes to the Photonicat DTS and
> leaving only the xpcs node in rk3568.dtsi.
>=20
> I'll respin.

please also at least describe in the commit message, where the
board generates these clocks.

Thanks
Heiko


