Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FE746AEFE;
	Mon, 14 Sep 2026 14:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396110; cv=fail; b=sbMfncpL5ZEQzQ97Ht4sjxUIuawszXlDEsJJFHNGNoDjD78KZi2sEtPZCHBAX3AFbA89smNCPzBl6Kc4IhUOsWklTyEwMDS2/ORThHSjwrSaredqb1hOJyfhi7ZTfaXC9bVVTqE6zFXqor4fYxzfkPxp/19aNA+T83UAKmRbt4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396110; c=relaxed/simple;
	bh=pfMBgYarRXSFnAwdDsjStsCPnk1i18uYFf2QZb9awm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HpR8zlWktGPm4gzP5/ho8BbBaZsBzgHid4e9kbo3//sLokz/ZuPIsH4ToqHvFBgawzfgXPoa55iiU8gctB0v2eon1w/8KIFoh77+Xt/mBejQhZytB7XroUAFfpcEyeQYpHCJKhScQn0QTxrt06WBOBJfINqh+GwbAhrpmdWrMec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gZGfuxYF; arc=fail smtp.client-ip=52.101.83.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gZGfuxYF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdKp/lVr+WW73ZX7I5OFHC0uQJUBoIK7moBqpL/zHMcFD4h1qt46TRC1xT7V3M8R5HhmmTaH3WOQG6AVEHSby4zPqlYvoDxcVAd6vigBQ3ZkpoNzkCp3roSxDzeQEoIWqPg4sIS8wnUGrmQu0VN/vD1LiE0uz/Ulj26z3vfdEO7yJgu25zoOi8ioJU2uvP2Ujwq2T+rLK8XLrs4/qlFCMKmmv08m75PK/X8w0cKd9bE7soYjY0QmTdjRITjxbhd9GkvhmjAqmFeI1qWlmgB6sdzGsX4MW23zXoOFEwMN0EVwXDGpQqWqdjCmGziwT9QYf2j7ZDOGmjddpz8Z29j+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W14GHx3ERAcaxErKIPBTwBGiB9YSAx4HgmQ8rZpPWcg=;
 b=CQqz37p6s1SOTXOLemAs7CMBlGz+qLO+1I6K5JazBLIJ80Gl+bngB+swekGgzueGMn9k2afLjYnYpmdYr0sc1r3cBmsgvZ67fZwl+2HncRhPFgmn5iSr9KtLGSd76WhKWE/6XzvcMwOwlyQojCucosyt3T4wkSFrYgaU295FK2nIaOGkxjPKPfmeNcNKin8qn3OYB5D48v+MUs+thZorjDRItpnStfwg3o+vwHCwTYkbFMUQDpK6rfhHRqAityHStw3KEYmSM9QDNRkNLkuaYXwWadeV7nqhtxw2IAarM1FnT3pNJQn+7KRAKHJJ+NxJ/hl2Dj8E7Dd+MV1j4t+hiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W14GHx3ERAcaxErKIPBTwBGiB9YSAx4HgmQ8rZpPWcg=;
 b=gZGfuxYFoqqPfhMhxjEYlcUQQilDIstfBqhqgfurNNPCCvDBIZaz1U4A1kKjf7NjQd9VNdEtW2MzUINpHoLGJTvnb0Y31de9LBeCyFtS5cid+rabr8KIU1xG//e9xQlT4lDxM6ktoI1Cqv7l8XhEyoJT3B9VzsZvSeHeGqbQH6h3ZeN9cQIraU4XcXEXouW0icHsqrv2Ni87uIlxQrP7yVvzcLdE8cDOMkYlq++ebKyUcBNJ16ejMdJDpm8VY6MsDtKJBIFr74aJflnfueF8ZetmV/tM/vgaY3fzWzg2ZPToZ/CzI6g6yZqNoiz6jJaU6061iU8DuqmxOghkjEQGtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8486.eurprd04.prod.outlook.com (2603:10a6:20b:419::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 14:28:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 14:28:23 +0000
Date: Mon, 14 Sep 2026 09:28:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <aqgEfRl9INLZ-DWM@SMW015318>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <aqQQjCW1xaGfPdss@SMW015318>
 <20260914054214.GA19835@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914054214.GA19835@francesco-nb>
X-ClientProxiedBy: CYZPR12CA0019.namprd12.prod.outlook.com
 (2603:10b6:930:8b::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 958a459b-0fc8-4509-6040-08df126c6ebc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|7416014|376014|10067099003|4143699003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	NbrmU9EIvdhUrNCmjM9VR5Z4mpA2NAiOO4h0h54bZmJmEHhEmmpxT4RXDXuGmctnbULUcFhcUAc/qPejMhbVLm9o+q04sMc73jERw7XlobVFGpSb+3WQV7Bne7xLosnGWFFLCtFpSZjr2uNvF0VBl6Ab/hOxYs5SnBQuSm+E7Yz/QU7Zs+2E9stZJx3Rw7PtIEs5cjJ1Hy3yT/uX1ETKdqdz1Jm6vr8YyY9TcQBJNuHFQq2klPktalGN/Lfa3KNlvuuQ/OGsOjMD564iWfyijvJKngn3p5OLamV9XJko18/N5S9GW2utSqzihkff70e6BN4ZbGIDYZ2uXnsiIde80Xtak2aIcK90DkINd7vvP+7kWtPvxfAQNbPJdfbrSyHb/IP6KONZ6GSaJ4Gtvsi7jrpEkoBGMc1p+P1vLL9gnOC83c33zalVW41mAu5MywABQU+MeeQ52Rv/FHXHSbIZpm0BS30PZzg0RbotXOJezRqIs5KSvHITngz9dMowaIT6H2ppuHg7JyzEUKmU8A8B8OI/972NZduN3FkvvlSykYv+s+AwPJfnHFRTRypuNG7r9pAJg3h2cRim/DtxktWKFkCR3gZNC6s9yHinlrt+gqbOyf8Y1sKbOx/FxvxJX9rl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(7416014)(376014)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V2ADlzErshmkhe2PK7FaSS7OQkk9q/5PfmbClEmBpGe4wFZzP3TIMn6cvc9o?=
 =?us-ascii?Q?VpIpS9a2q2iCMIN95D9rasmXXv+AlbxoRaVdl7ly4CshWy0gtWDhSTwE098z?=
 =?us-ascii?Q?XqzFg9TtnuleWh5Zev8KLA2dA9BN+F2Whf/4jORnrkgjjUCjUjcdvVuXUZzJ?=
 =?us-ascii?Q?vyePVlrbGKEcA7WOKdnPSvc3jCEZY4c4Ve8ZNZLXbWSAoi9U9Oi2XROkS9V2?=
 =?us-ascii?Q?zFKDOASag9cLAec4LBw+Ch3DuV05BoeOOw6m3GuGKfuqO7B5bUeoX0OeJIue?=
 =?us-ascii?Q?7E6+mdUfe7Rk5KoRH2ZRTJP1u+ooiwhn+NrSWp/PdJ4r7GMRGqt9/x2pczzA?=
 =?us-ascii?Q?kxZN1428gQw0oWK6faSNpdgt4ZgdtB+0RteuDyaZiUxlGA+Frlou1NDHV/A7?=
 =?us-ascii?Q?0Etr6og7XsyUp0QAWsf1obcyUhJ6ZN+uKZMHW9T42itrSnqhZ12BBLiKG+5h?=
 =?us-ascii?Q?WZcRt0JdjAXUgzGi/IiBcDLskB9ITn+ZhtHSSKqQcYaFChUURnT+Rt0ogdGo?=
 =?us-ascii?Q?OGXRT5Vd8lwa1/DdE809WOGwKjXJdl3p119UUo6AZXqGRCrWr1iL6rT8I0MQ?=
 =?us-ascii?Q?y1N+xiY+ACqEhWE0Ha/n2axBi5Rs9HRAwjDG0lX/t4F1OAe1V5MNROAsXyXV?=
 =?us-ascii?Q?c76s2yMcLpSHcNntuvl1cZIOQgfokHBTKIiU08QNiO8q6o+xud/LPQpFO5k7?=
 =?us-ascii?Q?SnNVkrq2roo3ZMcwYYXT46oCypJmcNzWSqBCgvU4vxwLcQPv4mUZC4fCo6I6?=
 =?us-ascii?Q?TLRlx6z+4Dm7F3ZJEW+x/kRyepn2TDpcOZ+GUEsGotF4cinHLeC/wl9+MDj7?=
 =?us-ascii?Q?hssvHtF8XD4/KpkXaYnQ8lBbYAQB2DXGVuhAgCzAwOtbifv+BU68r+yq4BDI?=
 =?us-ascii?Q?kjw5gdSF2/IXmOcst3f81T8iMjFXc9pRDW319C5q9YUfaX7CfAZECE1bn2PS?=
 =?us-ascii?Q?+A9HfrR4PlCqovgl3zgMoqyPuuC8uf/Gxb7N2N0+X+D9IngV/ESBwmLxWXMt?=
 =?us-ascii?Q?9s7cJsxNG1Qkx2nyNivZ5HMKodL9Ik11kKRlcCv9xtog9hDOdMNRDhnZJ24u?=
 =?us-ascii?Q?B2vt+SB7P0jiRvnPtTxGTMQ7mSziNGCCMBbK+VVQ6wEdk/mfLTl4oibD3fGy?=
 =?us-ascii?Q?9wMa8pmnb0NljsMTmuJYcUu61+uQlc0aQgCHyT9ts9eFjsbn5s2s+9YPAqst?=
 =?us-ascii?Q?JpACMYgJFCw9ohlbc+kTvuK4v7bQdOuZFWP1sBqkUnYHa52v5qy7pT5fOmfh?=
 =?us-ascii?Q?VFgSk1bJFhWkPjrndhA+YHFIbKl+UnQ5Pp/km/Kr3nnuFZ3RoMun6qxqg9gW?=
 =?us-ascii?Q?/NIOpUw8Y93rPHzHWqAIqdm/j8pBBdZs7xJsFvSmxqCJNBjWIddC5pkt5n6E?=
 =?us-ascii?Q?3iFBjoJTeL7NyJZY3W47o4P5I00XMwQtHPKhziFtgqil9B5c7GveX67xBj8+?=
 =?us-ascii?Q?3H8L3qP9jSpgoK0B5oRzm7DDMamBAE8+cS6PnjcsDwTcHGrNP8TLARarxZ+m?=
 =?us-ascii?Q?W3kTI92I2twVlVvgDr32J1mDSudVnq41u6FmkdrJ44tNqcGnT/1DIBYSN/Sg?=
 =?us-ascii?Q?bCp0GcQb8LJ+Q5Ew2LenItaOvj2C3oc/+gk/lX/tOmreH7IRsxO0pmJoWiVW?=
 =?us-ascii?Q?M/JkgiLeZhd8Q978J6iTI1DhBJq4Um0tGbXp2WZmATQYVkMGgLhTxNBBlNbd?=
 =?us-ascii?Q?QJ5ajPBcrduGxISeY+mYCttIicgflGMCWj983i0qMLB2R3QPXCg5iKeVqyTo?=
 =?us-ascii?Q?s+SB8WGx/oYiBtlPGvsa04IUw6Z1xzo1zY5D/C4Jz+SjNOCEY4xq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 958a459b-0fc8-4509-6040-08df126c6ebc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:28:23.6369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVrjljGwBp1tGBmIcNafuOW9B5WotRR+4jBz59M+xtXmKjXV+DCAjAs3S5A9XGW6QAS8j+FEEOxaQlkO6YdW+6XHzkhHXGvBtsoHwI8rvnkJVCzgPKBwAUzLB613z+2Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8486

On Mon, Sep 14, 2026 at 07:42:14AM +0200, Francesco Dolcini wrote:
> Hello Frank,
>
> On Fri, Sep 11, 2026 at 09:30:36AM -0500, Frank Li wrote:
> > On Fri, Sep 11, 2026 at 11:19:46AM +0200, Francesco Dolcini wrote:
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > >
> > > Add support for the Lino iMX93 SoM, its Verdin adapter and development
> > > carrier board.
> > >
> > > The SoM is available in two variants, with i.MX91 or i.MX93 SoC, using
> > > the same PCB (the two chips are pin to pin compatible), to avoid
> > > duplication create a common dtsi to share commonalities.
> > >
> > > Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
> > > Link: https://www.toradex.com/accessories/lino-verdin-adapter
> > > Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> > > Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > > Co-developed-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > Co-developed-by: Franz Schnyder <franz.schnyder@toradex.com>
> > > Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> ...
>
> > > +&gpio1 {
> > > +	gpio-line-names =
> > > +		"LINO_P18",
> > > +		"LINO_P16",
> > > +		"PMIC_I2C_SCL",
> > > +		"PMIC_I2C_SDA",
> > > +		"",
> > > +		"",
> > > +		"",
> > > +		"",
> > > +		"",
> > > +		"",
> > > +		"LINO_P65", /* 10 */
> > > +		"LINO_S18",
> > > +		"LINO_S24",
> > > +		"LINO_S20",
> > > +		"LINO_S22",
> > > +		"";
> >
> > Can you wrap to 4 names pre line
> >
> > 	gpio-line-names = "LINO_P18", "LINO_P16", "PMIC_I2C_SCL", "PMIC_I2C_SDA",
> > 			  "", "", "", "",
> >
> > Reduce LOC, and easy to locate number, such gpio 13,  second of 3rd line
>
> I already replied on the v1 that I disagree on your request.

Your v2 sent too quick before I read v1.

> To me it is
> just more readable the way it is now and I do not see minimizing the
> lines of code something that is bringing any kind of benefit on its own.

The major concern is that it makes code read harder and lost focus by long
lines.

Frank

>
> Is this blocking this from being picked up?
> Is there any other concern on this series?
>
> Francesco
>
