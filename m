Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793111289;
	b=WT5x1zimFwhh41QMXh/dFs5FllVDjcMPuTTBJm6866jJq00n4wi1fFhOJfjZDeSnEmcx
	 dX6mg9mBDwFVn66AbYC7tgJOOgaag7Xt/YU9DkeHh+/gjZ7KMDib+d5Pa1682XskKXrc8
	 70u+sU/83MKTjnrAF20u9kHZEMu3lUlO4/lJ3rfZ+qXpzlORaItcYNhoEqKZKCMAKcClp
	 Nn/2OtDvrq9vMds8ifkUlmqViEoNAsG3CQ/1ZOsY1H/rg8aYZZt9863ePxwRb/ar5+GNT
	 4bsCNeSbM4asY/Lj0/kuG1iZnHC7BnR3rUw00LkeXbJzqKcsZRHYBu4cY38ji2GokGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111289;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=m4ny03zCi4eHHuiZ6QF9KU9QJWLmZoCeRkXIeUWyfH0=;
	b=K5v9pfkmBcrA5sUFp9fmgCESMY3+7MuQFZwY6dnPVWas0DHOK80o95Z/r3JAg6K1fq5i
	 jsCO+NOa66EXo5BMUN8VO3wx0B3Ern+vQviOIGp6nRVe3mSDspnoL2LeublCDoAnC3aDW
	 qwy6nZjyA5+C8/md7goko+DoA7aAvcUNr0KUCFsmUqw+VAqrsMGiBdIDjiEg3jkXBB892
	 IDIVx3xnlEZI2mA5Dhr8Z0V2VLGKp4GN+wB3x6GmUSF+/FSYIjaOILBwaYJuYeoIruzqG
	 nTdlVp8tjDz2ZOTEJQGvSTZO1rLvdNquYyK0D6Km6mIa/ksRMK1b8a0cfoGu6rzbJvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NG5TJsrT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.23
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012023.outbound.protection.outlook.com [52.101.66.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE41606A321;
	Tue, 27 Oct 2026 14:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFE41606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NG5TJsrT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pj4WoSXlHfDQhu3AUHgHHWPEBtYsf7qNLIW+KpV0diU1+I8T45XQrOVNHbnnBbytzt/oUB3LNPZ60qxuGmxa4qZNKbg7AGlTFHmGf73f1+K3r98f1NgyFgElusTOFJ0FpeVR9jrHnHCo7zhTu1Go27+sx1NyKMoWl54NAhQMU0t915kJH3GQ9fwg3XZM+bWd1OlgSsEoYa1SCKBbSWIlw6fOD2IZ7QTdbivCt09XFkhF6g21lBzkP2/qqt1FwxpkR3irUIevLRM9A6lIdO1a0VF1KMI9H4CXiBPIPAqHUvotNCRHA55bEzQ4Wj63xeVPgsrbHQKAizj/KrvOGrpThg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4ny03zCi4eHHuiZ6QF9KU9QJWLmZoCeRkXIeUWyfH0=;
 b=VHmWFhX9bbPSG0lic7RPme6hxMT60oXIzk+557fOpURv2x6HUD25+rhef1J3WKGbPFkrAyixrABBoKIJa+14waTT8NNiv4noGrYxhW+lT4StPGnFwZtXzMnKGi9UxcX0dWNPBeGpd9rcgFNJgdupxnmxv8YmvgZahq3j6xm6wNF3WSc90is4/yRQcW78cDHbr7X0UcOtcRGUpuHKwRLGO5alm8fPBq/BhQJnvyfc00AQ/6ly/10jFMGdZJjbktZ0D4HQLzdbOeSAitEL+gAbIn8RQLG66xXvoq3KyWxuILBd7Awj3PgfzZ6wug3BpXj488zTPg2dRz2p0nz5pCXqTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4ny03zCi4eHHuiZ6QF9KU9QJWLmZoCeRkXIeUWyfH0=;
 b=NG5TJsrTeG8jcm5n32KjfwR98MRfvhoYVO76f83kO9huh/2l0ew5UN98TrVeai16k97cQF0IghrlaTdZI87+z5G0zdTIbGyAJq6kArp86XIT838N4NmcyOZdO+/5MUy3Qcp1021Zb27Ir6K0VMIjrcyrLI0F+asQ3fWfNxgBoJmi1jHGBxuK3iUe0Iyn5SWHi0jgUMDE88m3mP6OLgGx1Cb2gaGwP2TE9e2P0U/NbMG5qupE8+gNBU5X2GmT0+vwPcybaRHKWc3tMyeU+tWtojwJNLwpRgiFprbG7Dq+oiwCwM9vs/cO79WgB8o98BNbj/b1xxC4XySvVak8xOOxQg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA1PR04MB11472.eurprd04.prod.outlook.com (2603:10a6:102:4e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:28:05 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 14:28:04 +0000
Date: Tue, 27 Oct 2026 09:27:54 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: renesas,i3c: Document analog noise
 filter control
Message-ID: <auC06gqa5lGtKPjj@SMW015318>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-b7ad60cde650@renesas.com>
 <ate-aNmqsyXCAIX8@lizhi-Precision-Tower-5810>
 <64f604a7-7e70-4a0d-8164-28c5d7b1e509@renesas.com>
 <at-5E3b_wKcnuJ9Z@lizhi-Precision-Tower-5810>
 <f4b8a714-dab8-45d4-b98f-717d010806de@renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4b8a714-dab8-45d4-b98f-717d010806de@renesas.com>
X-ClientProxiedBy: DM6PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:5:333::34) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA1PR04MB11472:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d35601-e07a-40ff-f088-08df34368341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|1800799024|366016|18002099003|6133799003|22082099003|261026140227099003|3023799007|261021121427099003|56012099006|4143699003|11063799006|261021123027099003|10067099003|261009223027099003|261022105027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	fQ9VuM0nCK0QtwnZSTSGPspwpDFRMbHjwK6bY8SPCBXt4d8SryqRaDvASsXzF+6W3ZHbKVs9HDumPg8HvSiOqKz2DgwftI1UMkW3dvcRdT3HVCz8laFsOTzMrnyyH72YAOmFJ9Iid/lU/BH2Mb+bcgnkdO5Fri720qeNeWvE5T/ZqxM0zvse7xQYicMAjyHzzttmvpKpYVKTIy7eZUFmkvFwdKLkQ+4+0jgoKhnebN12IAMSdZAWRA2474Rfy/AinUMLNVO3EgMA8fAs3OqUE6fY9kFeWNciecqCKlls921H731DguXJtcNbAYUvmo1goIcn3d6QXA7X6y32GKIyB/PLPodpdWM2x0YjrUJCiVMxg1DigxXWmzWcToUTMbKZn6lwTbVCFZK9Qoj8J8IAdr9EjyZGkZ/Rc1Ww4cArY+bH27mJOqwQrQ1LA3fvvzF6WMHFSV60pUYAD4y9vXju+8G1JQiRoqyl8ErJ/64KG9OaA55VRe2L/JpChW5XnhQI+OCdPPUchCqsXCh2k0YIyZdYp38nVlaFxfhbg12YmMNPrPZOvoYbv1IRrzAK5ae+PdQUt+OouMiS5YH1uaB/k1B2ShhL/R4u/EilHQTpOAbYdIXk/FRxwOgtlCpQj7080eC9agwt+FOr5QQj33Nfbtm0rUR8ZwJ3Qav7Z/I9V10=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(1800799024)(366016)(18002099003)(6133799003)(22082099003)(261026140227099003)(3023799007)(261021121427099003)(56012099006)(4143699003)(11063799006)(261021123027099003)(10067099003)(261009223027099003)(261022105027099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nD9B/9LX6l1s5eCoZncndy/ixTlS3nTR5aX32XPiaN+sZ6cK7Vtq659YqKIU?=
 =?us-ascii?Q?nzdZfoy6orgIuZXXtILtZro2aHQZGiYG3jBjzPQ1kWZMUnXt7ql2EM29XyyK?=
 =?us-ascii?Q?B9f/Bl14AZBRA+BNTJ0H81Qyp6YQPiAOy9wYlEPD5ic3hh+iFtNDM/FjiOkW?=
 =?us-ascii?Q?Pc+8howsRhtosi+Poel7uLRzCnDjoJw4ZxnrpEYsWwyTE/MUDOP3+alBkBnD?=
 =?us-ascii?Q?DcJQsCqpWq1Y72O8k8IerqEmaRDu3dfBAUeHJA6IGVXYG0zG2ptNXJjtaRjM?=
 =?us-ascii?Q?z3KRzn+84ez/mPjJyDFDed3wjbkaAF4jhYGH9Iili5Jlv+2Yt9eAcBidT05H?=
 =?us-ascii?Q?RzuQ/JVx9+qtB1F/PpzLB0zcVZIAbb+xzT8A7I6ZbT+YBWd6aTYU7JALkZMg?=
 =?us-ascii?Q?rVOKM2DQsS3qWRDnzer3AX5S+pR4Njyi9zjOHAMJOf3S7JgCwn8SPnYMpYo6?=
 =?us-ascii?Q?UE0AlD3UPG39Vnv8ceJepBSGUq4rsAiCEtg3V5X8LIoPKupzdOydpgCOolce?=
 =?us-ascii?Q?WLPBXRAfmYjeLALYLZpTVG4FR749TvAd+SBbrdO536ZrwU8dA1THF+TfhqWC?=
 =?us-ascii?Q?aDhldgBGS0IspiKjJSVuon6hZu1gSU8PZDE4MOqy4MRFWtkqYDRd/BtU80pi?=
 =?us-ascii?Q?qgyf8TG5gP5hZZ/zo76YURNeKR73Azmr44fmEXS0TUwGruEhju56GU1ojYm3?=
 =?us-ascii?Q?mgwKQTKc4jfKAYHVZGin3wmXqSKdfijS7/CVuhxwvTqcy8iOGX9RPPk70vaO?=
 =?us-ascii?Q?UISERTQnaCLp6dRpoDcROAHBKE65UUJ5zXlig1xFXk+ABCmejIxTbgM/KrCY?=
 =?us-ascii?Q?Sf1yMn0DxWR1Q/BBuR2vspomPUGnywHYQm7Y7sWOfk3c0aNbxFAph3ZVOfnJ?=
 =?us-ascii?Q?sFa0e5Bnni/UnAjt0OgYE7F1PWzCdCNDKsjWsKDkVZ4rStTP1cEFDlSxkrUC?=
 =?us-ascii?Q?OUEJZ4zHqH0glhlc9wwhes6hXB/zEZAoaZk8RfPKWaA7cqcVNLIRMqtG++Df?=
 =?us-ascii?Q?oNnrUJnSRnmiN+P3pZEvoby9g9uuvY3cAtBtP3c+tFp6t8cWbfxBJwgLMK/z?=
 =?us-ascii?Q?6hse5HABnzuA1bmtOWMCidnJcyQSF1B7P2I4JGYjZajdI30O9EYm8/+hrOEr?=
 =?us-ascii?Q?iA4tL6+QP9tE7al1UepXYGNObbP68sO6ssEnu8lGGjDDDBbEGQWFIFMkZTjb?=
 =?us-ascii?Q?QtxoXnmTmLC/zbQCrnY74qkt+RaZPIqZOaoaLiBjuz0GUWqAxDCOogc44YDZ?=
 =?us-ascii?Q?hXHlyfVNm7IS+ntauR+Dpb6zGZ04fJhPsuT7NP9AXg/cgPaoJGdYIYWdamga?=
 =?us-ascii?Q?IS5xdRmz7NLTzc9SJ8L0iDmc+3wtdjhmEfsSyViNwBPX4fhQdgtXM58V8dXr?=
 =?us-ascii?Q?HesBYw9IS+iWlSA1+2BUFZ5tfohuInbgKfUs/07h7UkHSxjSMw1pp0dZdT92?=
 =?us-ascii?Q?FXuSVMZ4BnKqD06QMsm4QGU8UCFefiw7LEXRXOoUjHd9qK2u2rCGJNANwh2U?=
 =?us-ascii?Q?vZORRQo1vfoMyoI30tUkC+diylP0BbI77doxSorYFT2V1H4GQBhRWpG5sKgV?=
 =?us-ascii?Q?oKyn7um7HhgpywzozpCfkG0h9vAXQJh33VR/GnQFWlBDCKY+B/iAAtKMyMd2?=
 =?us-ascii?Q?Vh8Zvzm9TCtMJz44wnU2P9yugyAXhHP0/GpQ3YauQ5SEKoCRRVK5kDm4SW+a?=
 =?us-ascii?Q?kv8ubmdwG62BWothQ7QLCxeRQzpvRxaJRSeqbWaMeki0PVE5SzfzyYRponc2?=
 =?us-ascii?Q?Gvd5baZG1oiKaCzO2OyyBcn6hkYXpO7tsMx+bPNLZyUHW6qLIz6T?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d35601-e07a-40ff-f088-08df34368341
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 14:28:04.6824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KLtfra2eJva9GoTqSo1Hz3phyH8oPPIgnYDFfWy0dCyn3faT5l7Z6z3yo4N4xbLdYTc64sKpcp2lGlG6RdvLIkr8sgmlpxusJEAHKuJNvNDbF03udUOOcdOAgapRJs7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11472

On Tue, Oct 27, 2026 at 10:34:54AM +0000, Diogo Ivo wrote:
> On 10/26/2026 8:33 PM, Frank Li wrote:
> > On Mon, Oct 26, 2026 at 04:21:06PM +0000, Diogo Ivo wrote:
> > > Hi Frank,
> > >
> > > On 10/20/2026 8:18 PM, Frank Li wrote:
> > > > On Tue, Oct 20, 2026 at 10:36:26AM +0100, Diogo Ivo wrote:
> > > > > The analog noise filter for the input terminals (I3C_SDA, I3C_SCL) of
> > > > > the Renesas I3C controller is controlled through the SYS_I3C_CFG
> > > > > register of the system controller. Document the
> > > > > renesas,analog-noise-filter property, which references the system
> > > > > controller together with the offset of the SYS_I3C_CFG register and
> > > > > the state of the filter: 1 enables the filter and 0 bypasses it.
> > > > >
> > > > > The property is optional: device trees not providing it keep the
> > > > > filter at its reset value.
> > > > >
> > > > > Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> > > > > ---
> > > > >    .../devicetree/bindings/i3c/renesas,i3c.yaml          | 19 +++++++++++++++++++
> > > > >    1 file changed, 19 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> > > > > index 08fcea89a015..381807844351 100644
> > > > > --- a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> > > > > +++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> > > > > @@ -96,6 +96,25 @@ properties:
> > > > >          - const: presetn
> > > > >          - const: tresetn
> > > > >
> > > > > +  renesas,analog-noise-filter:
> > > > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > >
> > > > I don't like this syscon property, look like it is one kind pad propterty.
> > > > Is it possible model as pinctrl?
> > >
> > > On the RZ/G3L and RZ/G3S this filter is not controlled on the pin
> > > controller's address space but in the SYSC address space (hence the
> > > need for the sysc phandle).
> > >
> > > There are a few factors weighing against modeling this as pinctrl.
> > >
> > > The first is that the physical pads used by I3C are multiplexed between it
> > > and for example RIIC3, so we are not filtering the pad but the internal path
> > > of the I3C IP. The pinctrl does indeed have some controls for the pad's
> > > digital filters, that apply to whatever block is multiplexed to the pad.
> > >
> > > Besides this, even if it were moved to pinctrl we would still need the sysc
> > > reference, as the pfc driver would need a way to reference the sysc address
> > > space.
> >
> > System allows multi pinctrl devices. your syscon can work as pinctrl provider
> >
> > pinctrl-0 = <&your nomral pinctrl>, <&syscon i3c ... > ;
> >
> > The key problem is if model is resonable. Syscon is simple, but have not
> > good abstract.
>
> Doing this in pinctrl is feasible, especially since the pinctrl driver on
> G3L already has a reference to syscon for clone channels. The question
> really is if this is what makes the most sense, as again we are not really
> controlling an external pin but something inside the IP
> block,

I don't think so. Generally, PAD some property, like pull up/down, driver
strength, some include glitch filter (capacitor or schmitter trigger),

'renesas,analog-noise-filter' like adjust some capacitor at PAD, only
controler signal (register) is not in your pinctrl region.

There are not analog-noise in side SOC's digtial part (Or we can't care it).
Analog sigal generally existed in PHY and PAD.

Frank

> so I'm still not fully convinced. Are there more opinions on this?
