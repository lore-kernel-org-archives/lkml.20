Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E10647F2C6;
	Thu,  3 Sep 2026 10:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430309; cv=none; b=pGc+vw48EOuWxf65pri+VhGcc8qiTW97Dk5i4KJXm/X/+o+9yo2bxSbXsILboOkcj17ye4Xpin5s+9WueoE9A8GOOva99jAH9oDYVHvr0zuXQ5cNuw7WgEWoljlwgVQDy0qhpIFtlF8hNuztDtnpQhOu86PFW7OMpijJPByiQX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430309; c=relaxed/simple;
	bh=n7swSSZsXkwQXXf3FTOofI0ze2+k05EVbwqIIR6pqc0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bg+gRYjrVkJVTHvru41HyRPJPs0sGM2K+pNUfkKhDZvNDjFPmIrLBbgG+YO+pxwr6PgoAMHL0vPPmEoSTAEySM1es/PpGtPMnK12hZTs8uZrGaqIhhI3HBI0z8+izbAgbnECZclFnzj08LT8eIdu4R2ki8lkg8S9HxmN7AwR4mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=hI/eXiUN; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="hI/eXiUN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ndHxkiz4Sw6RUcCan70ObV/pml1LJpVQN+b/i+zeJHo=; b=hI/eXiUNRA9aeMQUV6E5oOPM6k
	i51i0cVA+1viGBhLr7CqyHzLtNs7QvkUAvl3ixoRsAPDZB5MO3CljPEUaxb6ssh8d8qS/gUpjGA7y
	zjMmqd809mnD8yU5dkRzVVVC8DeGxj9gL/pSPjl3nwYbbs8tHHLc72O6H1s97j1nFsosgxvsTJH43
	+Qf+osGcVNID88T6fAgeq9VTc5pmkaeyYqzN/auw2SQYk5W5kFB1kNXJsEZp0yEEjjRzU9WycQ3C4
	sDE5dAtRfSPm+9e0+jPas8vgNq8vcZiajErKSe/0mLbtwnq3/NQgG4I8rZdjTzX6aZeBi4QuRoEfi
	NVxDq5kQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x24Py-000NXW-1m;
	Thu, 03 Sep 2026 12:11:38 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x24Py-000NxF-01;
	Thu, 03 Sep 2026 12:11:38 +0200
Message-ID: <090650a9be0df463b3d8ea49932cafa45c72c26c.camel@ew.tq-group.com>
Subject: Re: [PATCH 1/2] ARM: dts: imx7-tqma7: correctly specify PMIC
 voltage constraints
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, linux@ew.tq-group.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 03 Sep 2026 12:11:36 +0200
In-Reply-To: <aphKnnReHQed9ahY@SMW015318>
References: 
	<9a916f24b610cc60e0efd13296f281e00b41391e.1788335665.git.nora.schiffer@ew.tq-group.com>
	 <aphKnnReHQed9ahY@SMW015318>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/28112/Thu Sep  3 08:22:22 2026)

On Wed, 2026-09-02 at 11:11 -0500, Frank Li wrote:
> On Wed, Sep 02, 2026 at 10:05:37AM +0200, Nora Schiffer wrote:
> > regulator-(min|max)-microvolt refer to the supported voltages according
> > to board design, not the possible range of the regulators themselves.
>=20
> I think make sense, but any document or mail list can be refer to?
>=20
> Frank

Hi Frank,

I've occasionally seen this being mentioned in reviews like [1] when the
regulator-min/max was used incorrectly. The binding docs [2] say:

  regulator-min-microvolt:
    description: smallest voltage consumers may set

  regulator-max-microvolt:
    description: largest voltage consumers may set

which is not as clear as I would like... Right now I don't have a source th=
at
feels definitive enough to include it in the commit description.

Best,
Nora


[1] https://lore.kernel.org/all/7b23de30-06e3-4f02-a8a5-90791628ceed@gmail.=
com/
[2]
https://www.kernel.org/doc/Documentation/devicetree/bindings/regulator/regu=
lator.yaml


>=20
> > Update the configuration for the TQMa7x's PMIC and also add a comment
> > regarding the PMIC's VCC_SD switching feature.
> >=20
> > Fixes: a80a1af6ec8a ("ARM: dts: tq imx7 common board support")
> > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi | 40 +++++++++++++----------
> >  1 file changed, 23 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi b/arch/arm/boot/=
dts/nxp/imx/imx7-tqma7.dtsi
> > index e1f740edfb763..7f49c80fef4c6 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
> > @@ -46,8 +46,8 @@ pfuze3000: pmic@8 {
> >=20
> >  		regulators {
> >  			sw1a_reg: sw1a {
> > -				regulator-min-microvolt =3D <700000>;
> > -				regulator-max-microvolt =3D <3300000>;
> > +				regulator-min-microvolt =3D <1000000>;
> > +				regulator-max-microvolt =3D <1225000>;
> >  				regulator-boot-on;
> >  				regulator-always-on;
> >  				regulator-ramp-delay =3D <6250>;
> > @@ -55,34 +55,33 @@ sw1a_reg: sw1a {
> >=20
> >  			/* use sw1c_reg to align with pfuze100/pfuze200 */
> >  			sw1c_reg: sw1b {
> > -				regulator-min-microvolt =3D <700000>;
> > -				regulator-max-microvolt =3D <1475000>;
> > +				regulator-min-microvolt =3D <1000000>;
> > +				regulator-max-microvolt =3D <1000000>;
> >  				regulator-boot-on;
> >  				regulator-always-on;
> >  				regulator-ramp-delay =3D <6250>;
> >  			};
> >=20
> >  			sw2_reg: sw2 {
> > -				regulator-min-microvolt =3D <1500000>;
> > -				regulator-max-microvolt =3D <1850000>;
> > +				regulator-min-microvolt =3D <1800000>;
> > +				regulator-max-microvolt =3D <1800000>;
> >  				regulator-boot-on;
> >  				regulator-always-on;
> >  			};
> >=20
> >  			sw3a_reg: sw3 {
> > -				regulator-min-microvolt =3D <900000>;
> > -				regulator-max-microvolt =3D <1650000>;
> > +				regulator-min-microvolt =3D <1350000>;
> > +				regulator-max-microvolt =3D <1350000>;
> >  				regulator-boot-on;
> >  				regulator-always-on;
> >  			};
> >=20
> >  			swbst_reg: swbst {
> > -				regulator-min-microvolt =3D <5000000>;
> > -				regulator-max-microvolt =3D <5150000>;
> > +				/* Not connected and left unconfigured */
> >  			};
> >=20
> >  			snvs_reg: vsnvs {
> > -				regulator-min-microvolt =3D <1000000>;
> > +				regulator-min-microvolt =3D <3000000>;
> >  				regulator-max-microvolt =3D <3000000>;
> >  				regulator-boot-on;
> >  				regulator-always-on;
> > @@ -95,18 +94,25 @@ vref_reg: vrefddr {
> >=20
> >  			vgen1_reg: vldo1 {
> >  				regulator-min-microvolt =3D <1800000>;
> > -				regulator-max-microvolt =3D <3300000>;
> > +				regulator-max-microvolt =3D <1800000>;
> >  				regulator-always-on;
> >  			};
> >=20
> >  			vgen2_reg: vldo2 {
> > -				regulator-min-microvolt =3D <800000>;
> > -				regulator-max-microvolt =3D <1550000>;
> > +				regulator-min-microvolt =3D <1500000>;
> > +				regulator-max-microvolt =3D <1500000>;
> >  				regulator-always-on;
> >  			};
> >=20
> >  			vgen3_reg: vccsd {
> > -				regulator-min-microvolt =3D <2850000>;
> > +				/*
> > +				 * Specified values refer to 3.3V operation; voltage for 1.8V
> > +				 * operation is derived from this.
> > +				 *
> > +				 * The base board should usually mux GPIO1_IO08 to SD1_VSELECT for
> > +				 * automatic switching of SD card IO voltage.
> > +				 */
> > +				regulator-min-microvolt =3D <3300000>;
> >  				regulator-max-microvolt =3D <3300000>;
> >  				regulator-always-on;
> >  			};
> > @@ -118,13 +124,13 @@ vgen4_reg: v33 {
> >  			};
> >=20
> >  			vgen5_reg: vldo3 {
> > -				regulator-min-microvolt =3D <1800000>;
> > +				regulator-min-microvolt =3D <3300000>;
> >  				regulator-max-microvolt =3D <3300000>;
> >  				regulator-always-on;
> >  			};
> >=20
> >  			vgen6_reg: vldo4 {
> > -				regulator-min-microvolt =3D <1800000>;
> > +				regulator-min-microvolt =3D <3300000>;
> >  				regulator-max-microvolt =3D <3300000>;
> >  				regulator-always-on;
> >  			};
> > --
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > https://www.tq-group.com/
> >=20
> >=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
