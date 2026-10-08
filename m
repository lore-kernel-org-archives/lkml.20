Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CD33D16FC;
	Thu,  8 Oct 2026 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451144; cv=none; b=hS5t57C1+J54PXftwTXMBFDFhG0mQHYhhbJwJ7aGKeXwYY37kh2EkTTSKKWwye42TWZTATkl9uQqz32YFIs+RBRr8/fL0DcTBhsGdZ5BKmiWLnepBXOmbsaKueUvw5Ts8q92mNzBwyHCcYvxKzhW25I1i9477dQ+4naz7Hj2DmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451144; c=relaxed/simple;
	bh=g4SdGRS4oa4gLIHv7BskeiFEZvqgS8DVGutFRmPrCD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bx4hijrrw1IuG1VXCqvpwmLD0iugYHlj7L0CxfljmoQ2rdEwZORPRWkp177wKDOKNhEMMFEN3mrAq6kikLd+G7G2lqLXi7nyGkirv6N3z65xBT9qx7vmWRmi59nEtP4UCDUqaibZyws1nSrWpcXk8tn1JmBhyxcckaPzqiS+qk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=TpYJ4A0C; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="TpYJ4A0C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=LlTbJYxhoFVYu+0y/mW72tx6Dx36C0bLKSlVa0TrKGc=; b=TpYJ4A0CJ48zzojJwmlKxdxoOp
	uQLFYZ+ghUEndbK4cPr46ox7HvJeSkKzsbai+xVlRmrZwLdIbkTtb9a7Y5ZKWyXke0PEc/DVXgElk
	Of2jJ0WVVtWSVIEtOuJdsu0f3WryHTIdX0sLXUCPqp4Jxb6WQ7yuElpGpJSFNEs7ae6wycBw/avhP
	lpglmhBH47mdx9ThKxogxk8Mg7V3vOxJraqQQkWNfsKn1mntZTUPFH+jtkpuAxNJpbvPk2X+Rgg/i
	3fWlcvUrjxgffFGYJ+1GWGskgBdCUJ5k1vvLLXQOjbnna/pU+R3S0vY30R27Oc6HMeJgvtkCBfT/r
	zD5dYzLA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xEkGz-000FJH-0d;
	Thu, 08 Oct 2026 11:18:45 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xEkGz-000AOW-0I;
	Thu, 08 Oct 2026 11:18:44 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Bough Chen <haibo.chen@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 1/3] arm64: dts: imx8mm-tqma8mqml: restrict clock for SPI-NOR
 flash
Date: Thu, 08 Oct 2026 11:18:43 +0200
Message-ID: <6322266.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20261008083427.33iide6apbktyv6p@shlinux89>
References:
 <20261007072017.2311818-1-alexander.stein@ew.tq-group.com>
 <20261008083427.33iide6apbktyv6p@shlinux89>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28147/Thu Oct  8 08:24:12 2026)

Hi,

Am Donnerstag, 8. Oktober 2026, 10:34:27 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Bough Chen:
> On Wed, Oct 07, 2026 at 09:20:13AM +0200, Alexander Stein wrote:
> > From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> >=20
> > The FlexSPI controller uses quad SPI with internal clock recovery.
> > The i.MX 8M Mini Applications Processor Datasheet for Industrial Produc=
ts,
> > Rev. 2, 11/2022 lists a maximum FlexSPI frequency of 66.666666 MHz for
> > that mode.
> >=20
> > Fixes: dfcd1b6f7620 ("arm64: dts: freescale: add initial device tree fo=
r TQMa8MQML with i.MX8MM")
>=20
> There is already one patch to limit the clock rate based on SoCs, refer t=
o:
> https://patch.msgid.link/20260728-fspi-clock-v2-1-dbe786a4a6eb@nxp.com

Ah, thanks. I wasn't aware of that. Despite that I don't like this just
supports RXCLKSRC 0 and 3 (SDR/DTR), this in deed limits the frequency
already.

> I think the max frequency in the DTS flash node should describe only the
> SPI NOR device limitation, not the host limitation.

True, before there was no limitation like that. But starting with commit
f43579ef35005 ("spi: spi-nxp-fspi: limit the clock rate for different
sample clock source selection") this series is no longer necessary.

Thanks and best regards
Alexander

> Regards
> Haibo Chen
> > Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v2:
> > * Clarify which datasheet is referred to
> > * Add Fixes tag
> >=20
> >  arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi b/arch=
/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
> > index 1b5ba3c47164f..48285bcbe9bbb 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
> > @@ -60,7 +60,7 @@ &flexspi {
> >  	flash0: flash@0 {
> >  		compatible =3D "jedec,spi-nor";
> >  		reg =3D <0>;
> > -		spi-max-frequency =3D <84000000>;
> > +		spi-max-frequency =3D <66666666>;
> >  		spi-tx-bus-width =3D <1>;
> >  		spi-rx-bus-width =3D <4>;
> >  		vcc-supply =3D <&buck5_reg>;
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


