Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002664F3936;
	Thu, 17 Sep 2026 15:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660312; cv=fail; b=bnUZnGfYWl8ME6HR5B9KiRjwQEFQXXx6ruM0YqUVqA3cy5pSdHMM/+drE+V2oRzScNwL1EGqvjdftp4HIpjTrCbx/n9Ic7vFgVpza9yISDixGqxbtNJtF7HJL1wKKmtylC/l3MpBRDqujXgqVXZLcCH3FTbt4OF3Fkike94lzqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660312; c=relaxed/simple;
	bh=Krb9dYchZfby+i7YzJ0cYdCsstlSWZ6feO6ZvbKTs0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RtLotlkCngEsbpePONbJJpIzGD2vzQCYmmoJ7DourE0LrkACIGE6XWEmRWkyKWfRc2pgO0TwZlF3UlDnrO+EArm4BG68+PJbtu35QrT59NdEkHLGovJ3ukTEeMFKzCG09wRgpNf9zgFgCv+sIdv9sfU7M4ld19/3xyAzdtPw3LE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wNzU4nAg; arc=fail smtp.client-ip=52.101.70.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wNzU4nAg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIawbRr0jup6994Qu9ui2BnoQl9z7nD35fKzyniS5GiXPP9nOo/EVjhUI/gTpOkvL5v7BA3ajre8isioN7ZPc4JFVKoXUgVvVYmQ5CICaa/yyZ6NWlPyvSmbQIA3k/BsOjs4DpTEj0UuhqEa1H6TJ+4SOj2U+YTZNCU+q3ecUzammqxkum1SxAnlPCLT3xzoh+CQQ+d17I/IbnvAbAwCcS7wRlAKnU7PUlWcXbGJYh2dQqNaYcOMSetYxn4/Ua6Lw82SXoBgwu7oI3w9odaIIs72MR4+aML4gK6pTcQVNK9F4SCVHj05AKcNz6HKEVuXhkCNA97ngc3ILC3Yd/PZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zP0Uoc86YLc3Qp0f/Kfs3qqaNvd5Pdpx+MH/N4jzqPA=;
 b=RKUSisULBaUx2KUnwg7y+UYJ07NVXcIuWZMFffXuWp0UcBksQcjxYiJCC7VIKEr7l7Rr9VdO8TDF8rm5qMeh2CFOOfHcc8E6wzHX6uAkeAIKBuFO28JJh9KLIUWIlncxEYRy0AK4L7q5gsljjJEYBrvtczyN0yl55U5O9aBhL23LVnxZYfH7e1a8ycyf7Ui0LilGANiSAZXAyovbLLbeSO5EYOPeLA25xN6UWe70U7wY7BjDJFLK5PT51MgBU4VZNvaOw+2hNXFWCZ0YxucLCdfAFg35KFpGve3wNC8DP8aMDezdc3c0yGwTSkm/VqyFaBazsek8r61ohGraVFV23Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP0Uoc86YLc3Qp0f/Kfs3qqaNvd5Pdpx+MH/N4jzqPA=;
 b=wNzU4nAgJmLSwhehkg3u9A1fFe+6zESRp50LpjEaI/YJojH78Yr2Jb6KsJgsn2BwJhQcptkLgguKROy0HRqemwfY4TJZS6i714inBAFQM3n2Z/uptEGskSFHoaHy8iWRZnFm0mwW6LPxW4upThd4idEhrg7aFZ/lj5CZa4yC898B5zKf/Jnl3oG54lfH0I8Xgj7ZoKzsSJCHuJI7grgv6l5XCSLcfLWu2szT6P8OwHnEyaXl2UyfTXxOkEwFk98pjLnOQZeK07x1H/32cN+N7lN9L3sqdEymxndOPo4EV2l4FQsLuE4qH8oxvbw8sTQgjKFDgHtvcF+d5HlqJejwZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR0PR04MB649822.eurprd04.prod.outlook.com (2603:10a6:2c8:61::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 15:51:47 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 15:51:47 +0000
Date: Thu, 17 Sep 2026 10:51:37 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <aqwMib54h5ys5HZL@SMW015318>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <aqQQjCW1xaGfPdss@SMW015318>
 <20260914054214.GA19835@francesco-nb>
 <aqgEfRl9INLZ-DWM@SMW015318>
 <aqgGgxzqiIbF66DX@francesco-nb>
 <20260917140836.GA119572@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917140836.GA119572@francesco-nb>
X-ClientProxiedBy: PH0PR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:510:5::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR0PR04MB649822:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3511e8-0b89-41c5-949a-08df14d39427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|23010399003|366016|18002099003|22082099003|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	aWB58aoV7O/n9twg5/UtHbh+oTZQhSj9gUZOnhd2w14dSf5wIwUdgYdH+xi6B3TYuLiGfY3xptj3j/0abSoS1e6viTViSyilLQ7cOgoBev6xJiac1sseaNkhLQazw4yHjIgWE1w3GZt4TbUYucns+KQ1WFHzkpQECcJhKgQ9QGX8VyDkOMzWIL4daBRZfsw2115CbWdSSDxTfLcKcfO6bCeQjdS6E7YqLGkazNwukyYbBhEGoUkHDzJ58+go6HbogOIE2qEa3ZGPUwG/laSnKCP4hVNeJSlyBW6y7wAZ3eq+mAn3jmO5AuLKFFpmb7Nwgbpkpz2x6hgbPfM7EGLRddeRqQPEDUlJAFU3Dz9pSojcLCSzmKEOFsa+EYVTmwYrWHF7Yv5hrC0u3OhzsVMcuN7la2SUsR24KFiftnBkv1WJqjFtxcz2ulD+TPdsO4lZvNNgMtrZoRCSWEkojQ5XJgqnHbDGHCAqyzsYlt3KFC22kJ37W5lCTygZ2Rvw24r8lW6YCWvUk1H25BniPEGNMfDRUZbGL9BwhgA1HRxcTrWeocbpUZUCukL26hSxVwCNrhGaXsObP8/0lilQ2zcRgot75SK7nSxDbRWfGfNmhxjnVRe1PATQ9BZbeSpKonOb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?veQykifrO+COilISc3EB0WrijG/4y3I9BtXHh0H8uHKkFobMCF0e7EYlbQTJ?=
 =?us-ascii?Q?lY/Q5xNWvDwnqAJZFgIDhiMPnzrmO8c9xDjTGHXBoYCd/nTjYReOMmClSb18?=
 =?us-ascii?Q?m/nzCvq2pgH2c6UTYGXg7gCFT9CZ/2fhKNIa2J+iHlsAHfmKIX3G/sNMwIJf?=
 =?us-ascii?Q?OP7jwA4ipzZ4AilefSnNNYO9810srgrXkJrLnOYZsrbA/FCd219k6LihhEWw?=
 =?us-ascii?Q?iMixE+v+wDVbNrNzgALksoSe7Oxp/vbFcJCOIKWl1yf+3qVmmQ7NPw0FMviE?=
 =?us-ascii?Q?e9s4h8Vb/dvu2Vx2Y0n/LWl2pjsYEczeS97MQf5XJPHeUPUedaZi/nCu8qQt?=
 =?us-ascii?Q?wUfyCb+R8bth058A7A/QMsRK95mzb+pKJaO/vaU5OWKTaML9ITHlgn2zL05C?=
 =?us-ascii?Q?KUcItJIF4kr7Rq2+w38HTrGKezNne30iqHRn7U+aCwUq58ACpb5+Ko72UOvp?=
 =?us-ascii?Q?sdRI/EAL6os0DciQfMrhikuIJY+d4LvJD83cWV0vQqvd/Y519j1sN9t5Q48j?=
 =?us-ascii?Q?xqBKsCcbcpii3Z1VMvKddoc/SWlmQSr4mIIaSmxQ4kgKlpOHDbJtVxE0FP0e?=
 =?us-ascii?Q?K1k1fMRnVZ5YrmEC/aA7nlNEI5rvR7mLtZrD1J9yyAK/4JSdSKmamQGwGCIB?=
 =?us-ascii?Q?pmbIe143acidoeoNeLYl8hYTKV6/QPwqi3iebXYeUcaiCB0ZYwpMhPNWySJO?=
 =?us-ascii?Q?GmNJjqZWQPoSteYr/HuzziuFByMjfXGbmGnrlw1AUfRh0OnTlmn6TDEf5JRY?=
 =?us-ascii?Q?Qk4jtj8iX8uGfAMse1m7TEzaPMkfXLtgB7mqEWHDtWvodMzT0awQcjf16sD7?=
 =?us-ascii?Q?BCohIwIADTKu3OA/DrKyske4/zogEwFHivbn2XUlvF0gRbu4KefSSLZzEi51?=
 =?us-ascii?Q?VZ5/219CZZQ2mrcIXsk5mv+0pM2h4M4RV/KF9NG92uy6lZQqfTfFrpykjrQV?=
 =?us-ascii?Q?+hs0u3/1qzK5QP+e9WZ7QFAnKGvPstdsU4y1aUmg14rkvNesfoNXH3rHcIuz?=
 =?us-ascii?Q?UilpdPmNf8eg8Ec9/SLd6hVOwJxDMt7VgIoYGz8WFWtRiwFn0U4Uvcnj4b0r?=
 =?us-ascii?Q?j7AQ9aLrYCFZaor+TBPWkE6sA2jXRDbhYsXLPehN9i46iV2SpqWzCskMKIyL?=
 =?us-ascii?Q?OF5IxxflrztyWMgyQMxJRsPQus0gZW3e5cS53Nbl2eYUVI8DSFLdgMc+chyG?=
 =?us-ascii?Q?MbVk/PY3X8h6BEBvFP2Vl8UEea/d00Mx+mXHPDewYvxYryD8H4tNycrpq/lL?=
 =?us-ascii?Q?MW95q0iPzT01TQkeojm6cO5rmHWwDnwvfF6di/UhGjA3+Ec6Jx+Aj9MSlSJA?=
 =?us-ascii?Q?SwlWLKnF8b2p87zLi/fXh59inHvcv3gp3ZzVomJcC+PGnQBqrPyiOf70tCTG?=
 =?us-ascii?Q?JWW3xgginIKHX1srWA/rnUGwx0Faae0/AGgBV+h4i7neeGsAqyaYsFxNL6yI?=
 =?us-ascii?Q?0VMS8/e43kKbhfFCqvfB66OulMKa0LtOAKiVuOZsx/WhtQZ9dDgrYTGkTs/p?=
 =?us-ascii?Q?EBFE1t5knwssNjgMM6ByXKHP8HYFxkzGdecXiC2An2tt/1l29bJVecuJcBd0?=
 =?us-ascii?Q?jZhwwABBYOWqxvcVfmUPhE7a1pODNtI3yBp2lXRAUPa2Dq3MoA1RKoVWPtKu?=
 =?us-ascii?Q?b2mRGF7d6Ly83lhdGrcTNMAtmcQn/9oI9YZgyS7lHU7aJnY3wwyT5XSKG+8G?=
 =?us-ascii?Q?XOV+R319xi8AxV1njGLAG9Yx+vgAGKLEm9twK03XhKVqGjepKjTeVZh+yGEr?=
 =?us-ascii?Q?OlbIdS5dRMQtVNg1fbFf2fH7YfWLMHDsivkQyvNrsvXYr9ZVGa2X?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3511e8-0b89-41c5-949a-08df14d39427
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 15:51:47.0388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ocFlaaQfMyPWSCJploCfPwgJJiAfNqEsoT2ubevhlAwo0dDVXOX72JGk7v3Y+3XcDlASQuIUFULqN8PWRdUyybRTSWF+yLMR2XFw5XwKlyWMQaTAHeZtiYEHEGDlHUgz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB649822

On Thu, Sep 17, 2026 at 04:08:36PM +0200, Francesco Dolcini wrote:
> Hello Frank,
>
> On Mon, Sep 14, 2026 at 04:36:51PM +0200, Francesco Dolcini wrote:
> > On Mon, Sep 14, 2026 at 09:28:13AM -0500, Frank Li wrote:
> > > On Mon, Sep 14, 2026 at 07:42:14AM +0200, Francesco Dolcini wrote:
> > > > Hello Frank,
> > > >
> > > > On Fri, Sep 11, 2026 at 09:30:36AM -0500, Frank Li wrote:
> > > > > On Fri, Sep 11, 2026 at 11:19:46AM +0200, Francesco Dolcini wrote:
> > > > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > > >
> > > > > > Add support for the Lino iMX93 SoM, its Verdin adapter and development
> > > > > > carrier board.
> > > > > >
> > > > > > The SoM is available in two variants, with i.MX91 or i.MX93 SoC, using
> > > > > > the same PCB (the two chips are pin to pin compatible), to avoid
> > > > > > duplication create a common dtsi to share commonalities.
> > > > > >
> > > > > > Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
> > > > > > Link: https://www.toradex.com/accessories/lino-verdin-adapter
> > > > > > Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> > > > > > Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > > > > > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > > > > > Co-developed-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > Co-developed-by: Franz Schnyder <franz.schnyder@toradex.com>
> > > > > > Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> > > > > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > >
> > > > ...
> > > >
> > > > > > +&gpio1 {
> > > > > > +	gpio-line-names =
> > > > > > +		"LINO_P18",
> > > > > > +		"LINO_P16",
> > > > > > +		"PMIC_I2C_SCL",
> > > > > > +		"PMIC_I2C_SDA",
> > > > > > +		"",
> > > > > > +		"",
> > > > > > +		"",
> > > > > > +		"",
> > > > > > +		"",
> > > > > > +		"",
> > > > > > +		"LINO_P65", /* 10 */
> > > > > > +		"LINO_S18",
> > > > > > +		"LINO_S24",
> > > > > > +		"LINO_S20",
> > > > > > +		"LINO_S22",
> > > > > > +		"";
> > > > >
> > > > > Can you wrap to 4 names pre line
> > > > >
> > > > > 	gpio-line-names = "LINO_P18", "LINO_P16", "PMIC_I2C_SCL", "PMIC_I2C_SDA",
> > > > > 			  "", "", "", "",
> > > > >
> > > > > Reduce LOC, and easy to locate number, such gpio 13,  second of 3rd line
> > > >
> > > > I already replied on the v1 that I disagree on your request.
> > >
> > > Your v2 sent too quick before I read v1.
> > >
> > > > To me it is
> > > > just more readable the way it is now and I do not see minimizing the
> > > > lines of code something that is bringing any kind of benefit on its own.
> > >
> > > The major concern is that it makes code read harder and lost focus by long
> > > lines.
> >
> > Understood, we do disagree on this.
> >
> > > > Is this blocking this from being picked up?
> > > > Is there any other concern on this series?
> >
> > Can you answer these two questions?
>
> Please let me know if it is a requirement to have the gpio line names
> wrapped with 4 elements per row or not. I am waiting on your answer on
> this.

Although it is not "must" requirement, I think it is easy to read by
packed 4 elements.

Frank

>
> Thanks,
> Francesco
>
