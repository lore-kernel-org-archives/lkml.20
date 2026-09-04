Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010011.outbound.protection.outlook.com [52.101.84.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53EC489866;
	Fri,  4 Sep 2026 15:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535409; cv=fail; b=WC8OjSaGxi1JPIIKr4+x4loYheA8IHVvsU8yTja9J9ftpQXUmZsGDRc3UhAtVVaVJPsbFREds2ZcOs4jGYeIP64Tqg8xT/qnGm+NZZVm2/A94Db39uTTg9RDKkPexSFhGH1i5P1qvAZJibEP7Uu1+lkOUgot9WkXkYsHf/4VoNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535409; c=relaxed/simple;
	bh=e2x/GK9R6j5GXIYmmFHvoetnZ6VbHoInwMqmdFIXtCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iUlvVuZIBm9SxlZjsGXA3Cy6HFrBV/TxWW9KmPRwpYHk0ZT5NC9IPVEIh+vOeT/7bROjR32QWb1Y153vefSo0akI2cuwpLXtQ/cV+2cJfmdLTiiKkXA0VP9qZ+rU74JNn2dDuze5sQObasnJJd5qGNZ70LjTCLRt+3ZhVZ1OEUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dc3eNFft reason="signature verification failed"; arc=fail smtp.client-ip=52.101.84.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dc3eNFft"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WN1sWrbpQPeuda0UCaP6pXY7VrqNRa63OmxJgJQKExeLdEYx7ckK107chPMuYt5ehIUB0XOFVpcrffcmKv8oBci+h3G9ILS/W0jxu8+iezcczMxRpT4pNrCh6v5SlEHEbp6T5W2sOv0Do0stxGLekbmeturtePVkr6axLjlEzJk7INIX6Xt5IjlYLHvHoq0Pc+UYXmZW/jsbCM15BK9ssmx/wCbscKHzZ32T20ZOIMMXKSwJ4a8DTx/ljJLH745WrWhOvDYboAiV+Kaqk7rS2aH64N+eACZyjEbEZyOpYVHpREuoNN1+dHCsK/ZgmZbV3sUDUV1mC7SZs7nUNR24HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eE/ivmwC/mKydYp2GbXEK5c0sWTCmGnKzhxo6OoupPY=;
 b=nMuX4HPZyU//PeYHoxJku99Z/WVdpklgKhk7c+fy1BJMjbM7Sxfgvxo/vAJOaoA2EbZOfBRYKSYb/5h2TCbi9YY/PqPN9pphoDsMB7Xb1Tv2oVE9dQymtKAIJdPgOMDXuyVgojL4EJbJ6eKfR2gM2cNXwYHXHdhuPVgrgKPkfNA/R5jHvFs5pQNbhxIlZ2ViXnlqfOlmPbc1oveG9y6rG6kAd2oYubNeXGlLP32wPSejXHpva0JfwgpczXDk0sVla6vv7AqepIZPZU76mqy2bkQU1IEiikSaYDIRbXwFm4HTnGuxlUaq+rd2CcmbKigOthPXCVZmOl8bxA7ac65LtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eE/ivmwC/mKydYp2GbXEK5c0sWTCmGnKzhxo6OoupPY=;
 b=dc3eNFft7GrXrkiyBZcNAamxUjl7urj+kcbuMKYJhIFAh8YZWuVrQF4RdzsMyQt0x7TX6VJCrGUPF/PFmYA+nKeLLAtvBzMv8cP5TeS+YvUckVgnKegadXs6nO3n4nyvDzTcs3Z9Vw3WpRMFBhQZMwxHDDBDjhxvJzayP0B1hkp0yokdSLhorLCA4Ud7N8of2yC3Pi7FGbzgdP/NwzgIt1/iIvYv1UllOjlfi9+Jt7gblyRef6ShmnuX3/rHYRC3Z7qV/bhBGwGe5ludqOFMpgDapJ+fNsgZcYD3cRtusETDFJWCd0uZjwmwsAQfMhMS6uATczmD1zRNk32GzvMWug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7927.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 15:23:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 15:23:24 +0000
Date: Fri, 4 Sep 2026 10:23:15 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: imx7-tqma7: correctly specify PMIC voltage
 constraints
Message-ID: <apriY-siS9INTsEI@SMW015318>
References: <9a916f24b610cc60e0efd13296f281e00b41391e.1788335665.git.nora.schiffer@ew.tq-group.com>
 <aphKnnReHQed9ahY@SMW015318>
 <090650a9be0df463b3d8ea49932cafa45c72c26c.camel@ew.tq-group.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <090650a9be0df463b3d8ea49932cafa45c72c26c.camel@ew.tq-group.com>
X-ClientProxiedBy: CY5PR15CA0241.namprd15.prod.outlook.com
 (2603:10b6:930:66::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea852ce-be57-4b88-f5d4-08df0a987601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|19092799006|366016|13003099007|6133799003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Dabj6XU/6EcAsVzsiH1k/uNRB8opuxdxu9zqXEnGqEj5tw6ib5dSg0ftdbFvOFlx+o+MoAOsjsCbtBNObZ4egmbXg6ZDRz9RgZZLx3D5n0XwfPe2d9oEFg0dATPgKQhaLUNkFKTcQ/+YZWszkvki7ZtzYGqmEBiIuk6+RTVT0rE9dQJZCUlhWwPQjfCTykL6U7PhVhal2FuhkrSICksVlri3QjqLUXjmQ19CGYt9nxKCzBjaq6Qx/bfU9l8vRc8WnwPAlLQr8ach01IZBvqrVBzqX76cR0FQdqXrjTecoPAlGC+Lose5Z0GkQVDO0aMJfttidVDVY5iXOSU3zvu68badOJ7okRxZ2Nd4wBgQQ1ltZMonhjG3Tk5lqyeAvYSHZYSaUL5X60amJe6h0wZkHej9H9nOqqedDs2KGqdmZY1dbY3MIJEkO4YqUUl445e3T3erEDw280qQ/XLsamNvmKNL8E9u3/h+lhRloZ/PaVdjTGIovxA/T5uWsYf/cXLGOTN+lPrqQDGGum/sSPSg/uQ+iIaiMKJNZ83X7gad7BUGMbjBAY4thBZ6vrAXu7BfudNBUNQ0nWB5t1J6AeoFLDNVqs0CB/p2fYE/8MJMzbc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(19092799006)(366016)(13003099007)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?RHBBb3+4lDzw3vtSRX0Rs3hLcdA356cQE2OGFLXyucJ04BKCRNj9KzT/uU?=
 =?iso-8859-1?Q?xAXMaLtwRTG/sCvde7bC7qvYEs1H9fYMe6oOX8iqNI5rVxYGf/3OhjYv2u?=
 =?iso-8859-1?Q?9Kc/r8NgbEiL7ufFCFMf/vdAcWXBje8RYAyYKydMo0me5hoQsIFt7OihJs?=
 =?iso-8859-1?Q?F6jyO2PV6NBjhZ4/164PCjPIcpG2mPjIlZTGsyXTbwuHcDI22IfX6ioLWo?=
 =?iso-8859-1?Q?seColSkbpdUwk3ct/9IJl6JLIAXMOZKWcB7OpkjXjZv7iCDdUn7BNIYx39?=
 =?iso-8859-1?Q?XbWcqMEDe0ljh4gIiwScZPPeS3x9DxysHh/2pZUkgMU8b+b9/AhLlUtPAf?=
 =?iso-8859-1?Q?swuZqRJA2hsxVYZzB+lUEh3sADamUYpwlm8vGzD3d1wfFxnf/sH+r0WxFX?=
 =?iso-8859-1?Q?AWaDvvcZrpgLS3PXO/0tY8L2XeipnqMIrfmZnQmziHhW3iGH6M/X1IcpQc?=
 =?iso-8859-1?Q?VpWp130mc2OHbpujTA02C1yYyoaJ10EqY97tJiEual+BZgcMtQaGFJhBUK?=
 =?iso-8859-1?Q?8SAgPTF+o3zO+/MPWN2yfLT9N2Eg7R/HJn/W3zBMEdcAB4fzJ3SeLJ11Nj?=
 =?iso-8859-1?Q?it6xCE6cGFOPLzFdcBa0pXVPkUB+SIks4BdsNpGz8S066SFesBBBWwErP1?=
 =?iso-8859-1?Q?Ly9DCsksBo4gJqKh5m5rL3vnChq7XKdXvHXNlSWlcSUgjwAsMy4D03Tovo?=
 =?iso-8859-1?Q?EppFFh2wT12C6MOFo0a+2Neg8E+J5qtwYWyXKZBIyl6oYq0d9sr/j7Sksx?=
 =?iso-8859-1?Q?yUQ99Lm0HK9akOrTGe9xCPsFrpdODrOd+9/+22hBh5npTcszotGGw9Yp+Z?=
 =?iso-8859-1?Q?J2m/f4rd8T6b6ywnXmMBgi9OsJ1pm743dlH4pjyP0bp+Mo/xcdInTcjeGz?=
 =?iso-8859-1?Q?n3L1ADcwF4vWsurR7p01xAOPjrH914t4+c4iQuG1iCNxZG0HBiykTGn1sj?=
 =?iso-8859-1?Q?twDY9aWYK9wx6SaEgq87fr7W45kwJLoDrk3PPRdru0oEOifxYQNFvXij8Q?=
 =?iso-8859-1?Q?2Ia9NU1RVDSHhzGXo2o+Vs+C6NXZhedC+7CCJJyCj9gbG5FouwUH7K6+mT?=
 =?iso-8859-1?Q?ArY/f40cvT4A4D2NMLQFJqvdemP6kZ6AYy5GKDF8hEQ0u/voYzSyw8Bj5l?=
 =?iso-8859-1?Q?zKOxfFdS1DdPqosrL/ft30D/3FbMuicf8uDNwrlRuZkoXwSlES/VA3t6Zc?=
 =?iso-8859-1?Q?gIzJEFYYQyy+B5azA0vozE8JOMUbrHeDhBRu469xQ76PNiyxn2hHksPKIG?=
 =?iso-8859-1?Q?GRzCRwsz31sTSfJu4oCV7xntzw7g8q36yBROLYge3zfjsrykdfsxuEeZpu?=
 =?iso-8859-1?Q?/HhwIzREJ6o0uE66c0h6i6r/C7/pXqPfaN45jUAsK30T1dx8GnILqq0vhl?=
 =?iso-8859-1?Q?gJTDnjfNHpIa9rlMOzA76rFzjkkAlWYdsUBjgVjJ9ZWONrvAmI2ZOjJ1LZ?=
 =?iso-8859-1?Q?Ej6ZTlXBGt5+1EdZy0DJy1haoZ/KG9b3gvU6YbgQWSlbXOVPDp1WZYx6Tc?=
 =?iso-8859-1?Q?GKzF/jY8xA+CMmfPM0t1v1K/ArQkkO5TZmQt/yv6fO1sgrzxAApZNWDGjo?=
 =?iso-8859-1?Q?vbFfrA5WIX36YXl+guE7PtzWmVFVT/Fqx+KMiGiqS1a794LLkVjiPY354D?=
 =?iso-8859-1?Q?UlXDgE9e5vxmQ1ChLhRlr4f6pvsP5sqpbE2Jmzn9rkKEhl3IbKtuo4HxAF?=
 =?iso-8859-1?Q?fyFkXbESLc0KHkAysqcBRR9ePkMGHZFrqB7iVAncOlbZNm/0/PDamwCtrb?=
 =?iso-8859-1?Q?FsoQDWCXt1Go3kKqs5LEgI3r4T2fjoj7eYqgYhvqqIlnk/jkRtDkUIA36o?=
 =?iso-8859-1?Q?Cwh29zD/3KYfL1LY44psjLiPf7SPN039KDsvwt0Z1RSZpMT2Reve?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea852ce-be57-4b88-f5d4-08df0a987601
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 15:23:24.4551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwJ9ZELRzLqMw+V+m6TdbLgo5dscp96BwmC9hCtzfyUxvc89uZeuh56R9c88PbOS8pqtluGMVPJsIwGwEs0U3zcQoCKzzjXHgkdQExvY0UO1/IfTCVwvcUlI63DGzZth
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7927

On Thu, Sep 03, 2026 at 12:11:36PM +0200, Nora Schiffer wrote:
> On Wed, 2026-09-02 at 11:11 -0500, Frank Li wrote:
> > On Wed, Sep 02, 2026 at 10:05:37AM +0200, Nora Schiffer wrote:
> > > regulator-(min|max)-microvolt refer to the supported voltages according
> > > to board design, not the possible range of the regulators themselves.
> >
> > I think make sense, but any document or mail list can be refer to?
> >
> > Frank
>
> Hi Frank,
>
> I've occasionally seen this being mentioned in reviews like [1] when the
> regulator-min/max was used incorrectly. The binding docs [2] say:
>
>   regulator-min-microvolt:
>     description: smallest voltage consumers may set
>
>   regulator-max-microvolt:
>     description: largest voltage consumers may set

I suggest create patch to make it clearer, and check what said by dt team
and Mark.  If they agree your change, we can refer it in future.

Frank

>
> which is not as clear as I would like... Right now I don't have a source that
> feels definitive enough to include it in the commit description.
>
> Best,
> Nora
>
>
> [1] https://lore.kernel.org/all/7b23de30-06e3-4f02-a8a5-90791628ceed@gmail.com/
> [2]
> https://www.kernel.org/doc/Documentation/devicetree/bindings/regulator/regulator.yaml
>
>
> >
> > > Update the configuration for the TQMa7x's PMIC and also add a comment
> > > regarding the PMIC's VCC_SD switching feature.
> > >
> > > Fixes: a80a1af6ec8a ("ARM: dts: tq imx7 common board support")
> > > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > > ---
> > >  arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi | 40 +++++++++++++----------
> > >  1 file changed, 23 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
> > > index e1f740edfb763..7f49c80fef4c6 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
> > > @@ -46,8 +46,8 @@ pfuze3000: pmic@8 {
> > >
> > >  		regulators {
> > >  			sw1a_reg: sw1a {
> > > -				regulator-min-microvolt = <700000>;
> > > -				regulator-max-microvolt = <3300000>;
> > > +				regulator-min-microvolt = <1000000>;
> > > +				regulator-max-microvolt = <1225000>;
> > >  				regulator-boot-on;
> > >  				regulator-always-on;
> > >  				regulator-ramp-delay = <6250>;
> > > @@ -55,34 +55,33 @@ sw1a_reg: sw1a {
> > >
> > >  			/* use sw1c_reg to align with pfuze100/pfuze200 */
> > >  			sw1c_reg: sw1b {
> > > -				regulator-min-microvolt = <700000>;
> > > -				regulator-max-microvolt = <1475000>;
> > > +				regulator-min-microvolt = <1000000>;
> > > +				regulator-max-microvolt = <1000000>;
> > >  				regulator-boot-on;
> > >  				regulator-always-on;
> > >  				regulator-ramp-delay = <6250>;
> > >  			};
> > >
> > >  			sw2_reg: sw2 {
> > > -				regulator-min-microvolt = <1500000>;
> > > -				regulator-max-microvolt = <1850000>;
> > > +				regulator-min-microvolt = <1800000>;
> > > +				regulator-max-microvolt = <1800000>;
> > >  				regulator-boot-on;
> > >  				regulator-always-on;
> > >  			};
> > >
> > >  			sw3a_reg: sw3 {
> > > -				regulator-min-microvolt = <900000>;
> > > -				regulator-max-microvolt = <1650000>;
> > > +				regulator-min-microvolt = <1350000>;
> > > +				regulator-max-microvolt = <1350000>;
> > >  				regulator-boot-on;
> > >  				regulator-always-on;
> > >  			};
> > >
> > >  			swbst_reg: swbst {
> > > -				regulator-min-microvolt = <5000000>;
> > > -				regulator-max-microvolt = <5150000>;
> > > +				/* Not connected and left unconfigured */
> > >  			};
> > >
> > >  			snvs_reg: vsnvs {
> > > -				regulator-min-microvolt = <1000000>;
> > > +				regulator-min-microvolt = <3000000>;
> > >  				regulator-max-microvolt = <3000000>;
> > >  				regulator-boot-on;
> > >  				regulator-always-on;
> > > @@ -95,18 +94,25 @@ vref_reg: vrefddr {
> > >
> > >  			vgen1_reg: vldo1 {
> > >  				regulator-min-microvolt = <1800000>;
> > > -				regulator-max-microvolt = <3300000>;
> > > +				regulator-max-microvolt = <1800000>;
> > >  				regulator-always-on;
> > >  			};
> > >
> > >  			vgen2_reg: vldo2 {
> > > -				regulator-min-microvolt = <800000>;
> > > -				regulator-max-microvolt = <1550000>;
> > > +				regulator-min-microvolt = <1500000>;
> > > +				regulator-max-microvolt = <1500000>;
> > >  				regulator-always-on;
> > >  			};
> > >
> > >  			vgen3_reg: vccsd {
> > > -				regulator-min-microvolt = <2850000>;
> > > +				/*
> > > +				 * Specified values refer to 3.3V operation; voltage for 1.8V
> > > +				 * operation is derived from this.
> > > +				 *
> > > +				 * The base board should usually mux GPIO1_IO08 to SD1_VSELECT for
> > > +				 * automatic switching of SD card IO voltage.
> > > +				 */
> > > +				regulator-min-microvolt = <3300000>;
> > >  				regulator-max-microvolt = <3300000>;
> > >  				regulator-always-on;
> > >  			};
> > > @@ -118,13 +124,13 @@ vgen4_reg: v33 {
> > >  			};
> > >
> > >  			vgen5_reg: vldo3 {
> > > -				regulator-min-microvolt = <1800000>;
> > > +				regulator-min-microvolt = <3300000>;
> > >  				regulator-max-microvolt = <3300000>;
> > >  				regulator-always-on;
> > >  			};
> > >
> > >  			vgen6_reg: vldo4 {
> > > -				regulator-min-microvolt = <1800000>;
> > > +				regulator-min-microvolt = <3300000>;
> > >  				regulator-max-microvolt = <3300000>;
> > >  				regulator-always-on;
> > >  			};
> > > --
> > > TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> > > Amtsgericht München, HRB 105018
> > > Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> > > https://www.tq-group.com/
> > >
> > >
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> https://www.tq-group.com/
