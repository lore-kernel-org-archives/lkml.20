Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E493F3C1086;
	Thu, 15 Oct 2026 08:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051762; cv=none; b=pC8ybJo7qwX+O4CWcbUUMUmvHwV0UrDvqc+LWjtRmGGLdfJc2e3G/H+r2pWG/82d03vQs2fg2jfgLpBsqoZ0IjCGWwkAfpqsij68UuW+UoSqVBD2iUBHgGGIfoI2Vv3g6hgoqOZvB3ftA+injoulgUB2aeukuXDFDbyBS4jDpq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051762; c=relaxed/simple;
	bh=CY0z8ZQGnKABVN+rZBZRq7oipzcPxdguuy+q124zH4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XsV43CUX9Djvs+FM522uiNcb/e93hGTpTWJ3IZFedALml04beXHDHN8otLtlugYNu9Xn79ZPAHWjmB4RjoA7CjpWkCfAZ3iKOqgwtgcNMibQZnLNyuxyECOXTgG0wLF7WsfLW/RyklyI0Q/C1S4U4WfW2zEzRo4Xir2eNefFuC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Kfv+WYSW; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Kfv+WYSW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=19Xt6ynQ3lZgWiajCCIQS5nrD0ARL9yYFFtEUFMIEvg=; b=Kfv+WYSWgAK7UQBa3Rgk/qmfht
	kl5FF1Cdj0V7Q2N6miwhKRetMw/4ouZteg1M7tOK4GJBoWx0H0EO9J5odJAbOAeAkwKVOOMVOnbX4
	62tEmSWCZ2mox1mGdfZSlNg+lBGeFsCbyDx2mYyG/AiZ9B1kfls14O6CF7TM0tL+WVF/30L9lbyh/
	GXtN73oLX0Wy1S3u08CS8R+7t1Xb81hT2LhONk8KFnr7ANxys9K89njQw9iNehSgI2cYMNHRD41pA
	+R07nmQD1BsVhuIuuuBdqE/HLgg0tY48OIyRLYMQ53IYDNIYP5uOc5hpDNjz3PqHKCHcSN6Z0n2zW
	S1Uf9iHQ==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xHGWV-000ERc-1d;
	Thu, 15 Oct 2026 10:09:11 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xHGWU-000AW1-2z;
	Thu, 15 Oct 2026 10:09:10 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, Liu Ying <victor.liu@nxp.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com
Subject:
 Re: [PATCH v2 3/5] arm64: dts: imx8qxp: Add MIPI-LVDS combo subsystems
Date: Thu, 15 Oct 2026 10:09:09 +0200
Message-ID: <6836920.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <as-LIGGpmBc1NJYj@SMW015318>
References:
 <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <20261014071657.118378-4-alexander.stein@ew.tq-group.com>
 <as-LIGGpmBc1NJYj@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28154/Thu Oct 15 08:24:22 2026)

Am Mittwoch, 14. Oktober 2026, 16:01:04 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Frank Li:
> On Wed, Oct 14, 2026 at 09:16:47AM +0200, Alexander Stein wrote:
> > From: Liu Ying <victor.liu@nxp.com>
> >
> > The MIPI-LVDS combo subsystems are peripherals of pixel link MSI
> > bus in i.MX8qxp display controller subsystem.  Add the MIPI-LVDS
> > combo subsystems.
> >
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v2:
> > * None
> >
> >  .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     |   4 +
> >  .../dts/freescale/imx8qxp-ss-mipi-lvds.dtsi   | 443 ++++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   3 +
> >  3 files changed, 450 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.=
dtsi
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi b/arch/ar=
m64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
> > index 647ee3348f494..9916a06669c87 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
> > @@ -156,10 +156,12 @@ port@1 {
> >
> >  				dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {
> >  					reg =3D <0>;
> > +					remote-endpoint =3D <&mipi_lvds_0_pxl2dpi_dc0_pixel_link0>;
> >  				};
> >
> >  				dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
> >  					reg =3D <1>;
> > +					remote-endpoint =3D <&mipi_lvds_1_pxl2dpi_dc0_pixel_link0>;
> >  				};
> >  			};
> >
> > @@ -211,10 +213,12 @@ port@1 {
> >
> >  				dc0_pixel_link1_mipi_lvds_1_pxl2dpi: endpoint@0 {
> >  					reg =3D <0>;
> > +					remote-endpoint =3D <&mipi_lvds_1_pxl2dpi_dc0_pixel_link1>;
> >  				};
> >
> >  				dc0_pixel_link1_mipi_lvds_0_pxl2dpi: endpoint@1 {
> >  					reg =3D <1>;
> > +					remote-endpoint =3D <&mipi_lvds_0_pxl2dpi_dc0_pixel_link1>;
> >  				};
> >  			};
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi b/=
arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
> > new file mode 100644
> > index 0000000000000..67f5392cfc803
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
> > @@ -0,0 +1,443 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2024 NXP
> > + */
> > +
> > +#include <dt-bindings/clock/imx8-lpcg.h>
> > +#include <dt-bindings/firmware/imx/rsrc.h>
> > +
> > +/ {
> > +	mipi_lvds_0_ipg_clk: clock-mipi-lvds0-ipg {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +		clock-frequency =3D <120000000>;
> > +		clock-output-names =3D "mipi_lvds_0_ipg_clk";
> > +	};
> > +
> > +	mipi_lvds_1_ipg_clk: clock-mipi-lvds1-ipg {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +		clock-frequency =3D <120000000>;
> > +		clock-output-names =3D "mipi_lvds_1_ipg_clk";
> > +	};
> > +};
> > +
> > +&dc0_pl_msi_bus {
> > +	mipi_lvds_0_irqsteer: interrupt-controller@56220000 {
> > +		compatible =3D "fsl,imx-irqsteer";
> > +		reg =3D <0x56220000 0x1000>;
> > +		interrupts =3D <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
> > +		interrupt-controller;
> > +		interrupt-parent =3D <&gic>;
> > +		#interrupt-cells =3D <1>;
> > +		clocks =3D <&mipi_lvds_0_lis_lpcg IMX_LPCG_CLK_4>;
> > +		clock-names =3D "ipg";
> > +		fsl,channel =3D <0>;
> > +		fsl,num-irqs =3D <32>;
> > +	};
> > +
> > +	mipi_lvds_0_csr: bus@56221000 {
> > +		compatible =3D "simple-pm-bus", "syscon";
> > +		reg =3D <0x56221000 0x1000>;
> > +		clocks =3D <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
> > +		clock-names =3D "ipg";
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
>=20
> Does any children nodes have address?

AFAIK the children only use the parent's syscon and SCU, so no direct addre=
ss.

> > +		ranges;
> > +
> > +		mipi_lvds_0_pxl2dpi: pxl2dpi {
> > +			compatible =3D "fsl,imx8qxp-pxl2dpi";
> > +			fsl,sc-resource =3D <IMX_SC_R_MIPI_0>;
> > +			power-domains =3D <&pd IMX_SC_R_MIPI_0>;
> > +			status =3D "disabled";
> > +
> > +			ports {
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +
> > +				port@0 {
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <0>;
> > +					reg =3D <0>;
> > +
> > +					mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
> > +						reg =3D <0>;
> > +						remote-endpoint =3D <&dc0_pixel_link0_mipi_lvds_0_pxl2dpi>;
> > +						status =3D "disabled";
> > +					};
> > +
> > +					mipi_lvds_0_pxl2dpi_dc0_pixel_link1: endpoint@1 {
> > +						reg =3D <1>;
> > +						remote-endpoint =3D <&dc0_pixel_link1_mipi_lvds_0_pxl2dpi>;
> > +						status =3D "disabled";
> > +					};
> > +				};
> > +
> > +				port@1 {
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <0>;
> > +					reg =3D <1>;
> > +
> > +					mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
> > +						reg =3D <0>;
> > +						remote-endpoint =3D <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
> > +						status =3D "disabled";
> > +					};
> > +
> > +					mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
> > +						reg =3D <1>;
> > +						remote-endpoint =3D <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
> > +						status =3D "disabled";
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> > +		mipi_lvds_0_ldb: ldb {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			compatible =3D "fsl,imx8qxp-ldb";
>=20
> compatible should be first property, check others

Right, thanks. Will change.

> > +			clocks =3D <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
> > +				 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
> > +			clock-names =3D "pixel", "bypass";
> > +			assigned-clocks =3D <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>;
> > +			assigned-clock-parents =3D <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPA=
SS>;
> > +			power-domains =3D <&pd IMX_SC_R_LVDS_0>;
> > +			status =3D "disabled";
> > +
> > +			channel@0 {
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				reg =3D <0>;
>=20
> reg should be first one.

Right, thanks. Will change.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


