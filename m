Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FA34A3F08;
	Thu, 15 Oct 2026 08:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052708; cv=none; b=BYZVYnWzo6RiNy3UDSWsPC8TqDwFFCWS1aFcCzsb7kDhJl9qj2S+OktUBsYGkyQz5pHViDiw8NoRcqhgjvdg62yTiJJRUk9rZHRFAJokQFloa184NDaeBMwx45KIIDOLyCN/OAmesmvYnqlHTIT4Itsnms1qpOZNrmwhSgCop0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052708; c=relaxed/simple;
	bh=xDtLZHyfp+AIKd7OVWBh7n32PD+EWS9ETfRWqwxtIqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZxvOmUKazP6mz4hEa52RqNUY8AdhowF7lEBhlrw4A1WOCPsWT1hjzz4IOs3cDpW9Abq+tc7Xdqppn8wvqykc80qzvnyonAjYnSE6B7frQCCyN/h8p2RJq1qQdCrgdQFazB1haIIVRW/2OQSgdx9TP3sGOJXo4UU8sprtx0ayNpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=MZ3+x7VP; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="MZ3+x7VP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ZRE9TYKLF/tjZX5aLFVe0iHhVl7KukoN/rYEWXfPZ7Y=; b=MZ3+x7VP1t2K7cPkbBmet9IWgX
	XXbss1UeBss3IrZXh6UXVrJoJXBDTGUloSVuJ70WfmoFm5LMxxuKbRNIAEZ24TRfAOm5wGTw3Hp3a
	V88fQKZazCehrIOlN+N3LDOl+HHP2t45BWnP4yuf0j9anSs3DiM63obW6E6vOOh2AH69O33RY6ByH
	0vo8T+PB+mX+dupqpFdUDUq7vT7UC9l3vwxEpE7IhZH0ewvt7SnmoPzHIAyMw35hpgnFKy2YnvMME
	FkmTyUyot1Qrz6Qbo9Wr8gvsPYqiFWhhOtzsm4Hv3XyDwQ41R2UXFqiZXFPmm3FjNax6momT3lC0o
	1HMB07bg==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xHGlr-000Ici-2T;
	Thu, 15 Oct 2026 10:25:03 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xHGlr-000NCR-0T;
	Thu, 15 Oct 2026 10:25:03 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@oss.nxp.com>, Liu Ying <victor.liu@nxp.com>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject:
 Re: [PATCH v2 2/5] arm64: dts: imx8qxp: Add display controller subsystem
Date: Thu, 15 Oct 2026 10:25:01 +0200
Message-ID: <5661700.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20261015063105.GA5720@francesco-nb>
References:
 <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <as-JyQG5vgaPYLeH@SMW015318> <20261015063105.GA5720@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28154/Thu Oct 15 08:24:22 2026)

Hi,

Am Donnerstag, 15. Oktober 2026, 08:31:05 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Francesco Dolcini:
> Hello Liu,
>=20
> On Wed, Oct 14, 2026 at 08:55:21AM -0500, Frank Li wrote:
> > On Wed, Oct 14, 2026 at 09:16:46AM +0200, Alexander Stein wrote:
>=20
> [...]
>=20
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi b/arch/ar=
m64/boot/dts/freescale/imx8-ss-dc0.dtsi
> > > new file mode 100644
> > > index 0000000000000..e94fbc6eae07d
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
> > ...
> > > +
> > > +	dc0_pc: pixel-combiner@56020000 {
> > > +		#address-cells =3D <1>;
> > > +		#size-cells =3D <0>;
> > > +		reg =3D <0x56020000 0x10000>;
> >=20
> > reg should be first property, check others, you can use

You are right. I'll fix.

> >=20
> > https://github.com/lznuaa/dt-format/
>=20
> We have a tool in the Linux tree, ./scripts/dtc/dt-check-style,
> I would advise to use it and improve it if needed.
>=20
> Documentation/devicetree/bindings/dts-coding-style.rst is the reference
> document.

Oh nice, I wasn't aware of that. Thanks for the hint.

Best regards,
Alexander

=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


