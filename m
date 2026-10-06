Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C6342466A;
	Tue,  6 Oct 2026 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294618; cv=none; b=Cn/YtRjNwvKqubfhEeuUjEV2rERyR2ZcMJ/0xREAa+AhrckXT+osjbq233SqcL+PEQJBfTZPL3eFbfdTuV8IOfK6I5TngTHe6SQ8qrtP8cHHh4j9/5Pgmhwcm3upRlRWPIyK5Xk+BzHgaCtrsEx4dhqRZ9KWsOem80xfRnVxJ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294618; c=relaxed/simple;
	bh=DT5txDVCV5tJYy6dofM6dMgaFWd8I+eKNa+vcYFGUOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DFLFNrfDx1gvx0xVwvt01Pnvb085NOeWVw6QgF80o1VFxd5tzybr4E5kyRRdg1JGj01wsFMbKVQ4D14dg6fEnVINo5MwjhLpZ1YE7OtFzZuNxk2r+ES+QRoMsdoMnMOdXqf1Hj4kqrue0gnd6mgavBTl1XAL5yTHSzLcURAtlwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=WQmTZ+Zp; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="WQmTZ+Zp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=LtXewEIARdqyNa+0KtGlyoZpihGzkV6HOi575K/RB5Q=; b=WQmTZ+ZpkQpI5Io8Ikjpil6eSn
	LzHhNYn2S/Iu02bFCzbzdd+EImJPzx82KivwCE5hAIIQR5oBJ0XkGgDvH8wzk0lC70rOCbok2w6vy
	Cho8atTDDDc0WWZWkTOa02D99YNVZy7B+MVqKZvjdnPK47sHgWGHmmFMi41uZ85/+AhB0Z1p9ig1t
	x2LpNPU/BdIugERqvDDmu8sezY6Dz5UFC3iZwoS6E8ProWWBsxRIIx3BNPxx1hdc/LzRzdzqvHTbV
	0yXgVYpOhCFwhqFT4zga8K0MEqKVIs//62N9pATU15UnYbUDJbEOtUG0PWCNjGDUQpqalLlcwmG30
	u6Ola9nw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE5Yb-000Fzm-38;
	Tue, 06 Oct 2026 15:50:14 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE5Ya-0008c2-1y;
	Tue, 06 Oct 2026 15:50:13 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/3] arm64: dts: imx8mn-tqma8mqnl: restrict clock for SPI-NOR
 flash
Date: Tue, 06 Oct 2026 15:50:12 +0200
Message-ID: <5021357.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <asT7yvlCeQl1rfrS@SMW015318>
References:
 <20261006132512.2246196-1-alexander.stein@ew.tq-group.com>
 <20261006132512.2246196-2-alexander.stein@ew.tq-group.com>
 <asT7yvlCeQl1rfrS@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28145/Tue Oct  6 08:26:12 2026)

Am Dienstag, 6. Oktober 2026, 15:46:50 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Frank Li:
> On Tue, Oct 06, 2026 at 03:25:10PM +0200, Alexander Stein wrote:
> > From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> >
> > The FlexSPI controller uses quad SPI with internal clock recovery.
> > The clock is therefore restricted to 66.666666 MHz according to
> > data sheet.
>=20
> Which datasheet? I suppose NOR flash datasheet, can you provide link
> here.

The i.MX8M Nano data sheet Rev 5 09/2022 section 3.9.1.1 "SDR mode with
=46lexSPIn_MCR0[RXCLKSRC] =3D 0x0, 0x1, 0x2" Table 55. "FlexSPI input timing
in SDR mode where FlexSPIn_MCR0[RXCLKSRC] =3D 0x0" lists 66 Mhz maximum for
"Frequency of operation".

Best regards
Alexander

> Frank
>=20
> >
> > Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch=
/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
> > index 48a687926aa1b..c88d83243097f 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
> > @@ -63,7 +63,7 @@ &flexspi {
> >  	flash0: flash@0 {
> >  		compatible =3D "jedec,spi-nor";
> >  		reg =3D <0>;
> > -		spi-max-frequency =3D <84000000>;
> > +		spi-max-frequency =3D <66666666>;
> >  		spi-tx-bus-width =3D <1>;
> >  		spi-rx-bus-width =3D <4>;
> >  		vcc-supply =3D <&buck5_reg>;
> > --
> > 2.55.0
> >
> >
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


