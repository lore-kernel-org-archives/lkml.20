Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793046820;
	b=w5wg53nyuGoVC5720L0z11x68oUis/FdbpzoJsEJ06jcwdUfVHUEc1qCUJS4q+nGwkGS
	 7Xl9zqyCVUdHKtFbtvrP3tyHuilJTwYYs2g2JE1T6Q6OMY78x6rn4iCUXHrwJvC5NmxRk
	 DbF7aaIvfxgQoCpYUSVDNjVAVWoNQhU/shU/5Fzb/PymaTo4vqyvf7rm/5nl3VhHHVbe1
	 CEn1YKO2tZj5qGJmhsEjSzCEGGfaDQFGaXAK+oC9amqO73iey3bNJ5a6G2CiTnbUC7FeC
	 sAUpHLot+ZE34Z+FNZY/vaf4Nt2E+cSVwqkpUc5js3WIaLVRuF9QM+33hEiAEQPx0/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046820;
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
	bh=ml0d3v/tXOIgB4U4Uzqmv0eHHsNzZgXxBjkCLEMJKOc=;
	b=huX21D4GKFKNZyp7yoMx4ArrshEiVplGgXPbLSNlP1Qi6M6tnhLxVHI8HEf/ptwVZrLp
	 HvdmjB/W2QaIQoE0hRxwkWlFhaBysJwt1+HW8trco0nGZuu6uFGTMPoBfDcq3VLkMJv40
	 Bl5nMoSUplAtTwcRjNTpWDD6ey2baA9Ten1vdF3Sx8swq/Dsg8ma8wreDVF9K+QJzy7UN
	 ZU8Y6Rjp3aaXPW+/XaRtsU4I3gMIQe2kGRUpGphms6JkDw54VdDpna207IUSrYV5eiCUs
	 mjc8FNwVhMmpWZlfeFAvtWlovLpFGRlfCbbrEOLYs+ASHRpCPnowkL0N2sI072nAQzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vDOgrrdS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.63
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013063.outbound.protection.outlook.com [40.107.162.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0125606A31D;
	Mon, 26 Oct 2026 20:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0125606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vDOgrrdS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIMyeQcDthNw2/+wsfOW7j9wtq/nby2dPnxcck6vr2Wp58NDR6lvhY3WJyKX8TXDgj3jUVGie8Xd2NhNZp3WexwCPGv3la5xb3YaY8IhkeVBaq3d9NOk7s1lMsVsiD5b22seW9TpALnc5NMlaEm/3yra6ZWd20sTcfvCgKtLVfH7O7abctdTZbjMnCdNG7LWyiyoT1ZMKCrniHSNas4y8GtlLT2DwNGJ3t8I31bSBJ2bzrZatkf7wh4oMLcTfs+4BYBYYq+Mkb+owOiuGUBq2IvcX0jjvJBXwXIlXOr0zBKFtX4F7fuoXY3Gl0JgCpOI/cexqWM/6oX6lwnle5A/bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ml0d3v/tXOIgB4U4Uzqmv0eHHsNzZgXxBjkCLEMJKOc=;
 b=jT2zKNevsqLZRDjHvfH75FHYh5SXRPjW1/SEtXs9U1HWJpDoSNd3/X6UE/z3prMrtMkPwxW/rGRMHtwEzwCr7ZhkWvilUefmBc72IBdyUDKY7Yonr30jGITv1XqyAOg8bLthrfWZslF87MIQTkEFeRPcTEQiNC1ymi+5Y6BrYubUCqtlJjx5vqdZfBRgRzerb/Nscuyyl2B8mAxs99mNXBKS+F7DqzbNZ/3dYobgOiVkr4YrV0lMqi6XBo7VSbdu+R9V74mEGpA3/r4DJhfAhXJrqyf+YODBT9R9bspWWj/OQJxoHgQDHW6oGrnIW7EVOokCOQM/Jt73swSjR1fk4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ml0d3v/tXOIgB4U4Uzqmv0eHHsNzZgXxBjkCLEMJKOc=;
 b=vDOgrrdS6uj5CWKaIvdNvegqOXi0BKKbSrZB0qd4cj1vmvtom1rw5NkhtdAKdEmFqVPTrKCSFZ1CnUF/g99mgcb++N8pY4zYnVxcNnSL+A7qsFX2Ou4KRlKXpsiAUdlT44WbmhvnrolAlAQtvrySLeeVfd4CnSVfRlhz4ATtmLWeRA4ttDXJSA+W+hsiT55XDZpXtbD9gyB/tvQSMEByRMNXwSz35CJ4q3TL8detwN3Y17QnUJE4cB5p9uKyCA7lJwDAOwwbEgJ73s1wLDpF75aIYq7uwvREZGDg9lCngTmflGxIUt/2kqQ6cFHaiDEc8q7Ulsg5nr9ApspEqrpKEw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB10966.eurprd04.prod.outlook.com (2603:10a6:150:204::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 20:33:32 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 20:33:32 +0000
Date: Mon, 26 Oct 2026 16:33:23 -0400
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
Message-ID: <at-5E3b_wKcnuJ9Z@lizhi-Precision-Tower-5810>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-b7ad60cde650@renesas.com>
 <ate-aNmqsyXCAIX8@lizhi-Precision-Tower-5810>
 <64f604a7-7e70-4a0d-8164-28c5d7b1e509@renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64f604a7-7e70-4a0d-8164-28c5d7b1e509@renesas.com>
X-ClientProxiedBy: PH7P221CA0022.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::30) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB10966:EE_
X-MS-Office365-Filtering-Correlation-Id: 073901ed-de83-454d-eb63-08df33a066d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|1800799024|7416014|376014|261009223027099003|261022105027099003|261021123027099003|261022075727099003|261021121427099003|10067099003|56012099006|261026121527099003|3023799007|22082099003|20046099003|18002099003|4143699003|261026140227099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	S9skJhb6lNv0wf1htbrlmpBNTBEsu2vSkz9bcPW/m6Sdsq7f0AO2nHhRsSUHAozofBpoGAqVaRXX/dixs/gUGB0Lpda4fVP91MFOGvYoIlZD2tr5ty7FgKmQaMXi6n6A+Li+wj4EfWDV+A/M5BXcwHgpSPdBY2TRi3qXJEepc6b3apQYN6VRHMcwkDxmD0ARO5X1JuLAYZwxWf1UNK1SUP3HSzt1FGG8PPOxQ+gz8rbeDurL0UCRS1wXmeMnR8Xs6JWIFROnF8vXXv8YjUXQpl9+J5xJ2PI5f3MR1olaHspBmpqxb9DmHTWvlYVI3N0Vt94fTOUiOrjljpu7EtoWFY0qWdupvsm89ybCTgsLWkaQ65JuuxIop84zUkco6Qe7y+hICyVI9QmhNqI1aAQiLPRP93LBeMV8hcKQTiXfP1i8FycnQzginmBxWvYwZv4YK2eHSeOZCfGYdN9URTLTzeyxly5CZCbyMLACaokZmlMa6ZfNcOkF76kQexCUC8ZW1PhQ7aYKUg0GiQhSZxpYsnPYjaSqlvT/XMLgjz3G1XeB9yimAcHBRt30NavVdNzZJ9k4YMRMNyMTiJRAnsdej+RGmJKzOtcgLeVvbR+O7TJcrgrDK/U3zWsmJ6N5+NH4pvfNG+0UsVsoKSxjYiMqzQQH8XEmM+xOcss5GhrSlr8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(1800799024)(7416014)(376014)(261009223027099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(10067099003)(56012099006)(261026121527099003)(3023799007)(22082099003)(20046099003)(18002099003)(4143699003)(261026140227099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QYN8fzrrBz1eB+L7knJKtwyudJwsV1ruMfy7CSHBJWpzbIC8ZZDtMX5oz97l?=
 =?us-ascii?Q?vfI5W265sqPMm5CKTsiTw0KBl7z4StP6rpsyoJxiyHdMfuQxQoGTiMk2fpfN?=
 =?us-ascii?Q?nYURENlhnw733zirny01Nk8G4lDAcBxiyxchjhCCzX+/+sql4KcgtJuwirrg?=
 =?us-ascii?Q?FlwIhzpFmYwGIANXJbZAPxC1Revzeq4WAQx3vgHSgsB4CiUaLTI5nwsMDAdf?=
 =?us-ascii?Q?ezsZ4guw3VqDKDb7CWGAQPDL7olVWG6bpYVoCMnro01m2bg8IOctBSXAu16Z?=
 =?us-ascii?Q?nwvV1o0a6WHAriVvBzSGAp65181bSZh9K4ekpD8HZ2BWnQ27WnwlWq5dmUWv?=
 =?us-ascii?Q?lWWIzICZJ+FtN5lI6qax6IyRQjFcKsf1EUFJ+Flx2rbUJ/7ndim1Na+5GCvJ?=
 =?us-ascii?Q?ENUYIX5CSOHXUPs7VWMPlbEMGUTB3t1i57fg19/Q359XkG4VHD0F9gHeUato?=
 =?us-ascii?Q?2V1QHD4EPwRScJ3MgIcZf6aOOtUNBn6tL5wv7N78YwL06CTFNmuxfL6FffQq?=
 =?us-ascii?Q?CrXgRMmn34YNOAK7eboaaAWyhurC9R0cJHW3atRgX/jetfcEAmpICc4FeKN8?=
 =?us-ascii?Q?Xbjk+EanoqQWD322nBSjy1mv23ERrShTw0rb31Q2nWRaQ2agyrq66T7ZPOFh?=
 =?us-ascii?Q?Hs+d4MvbvhOfbf/o9Ejuavi7lnPJfnmoIetfqIqLe0CaKFwk2jkrPb2EDwMx?=
 =?us-ascii?Q?bA1lOkvbG99IDPcTrVMzFOF+I4EzNltMeKq/tm1orxyt88jCCbXbIAMClfp9?=
 =?us-ascii?Q?8Y0/HFx/wLwiAz14yaqNwHXaHCG+JY5k+3FSAG+U0yW+O9aieYj8SUsv+SVB?=
 =?us-ascii?Q?rxmPQif8trLABzlIHCvm7l3Vvrutyx9sxS2BteRan73gva0chyyfDEgFeVfI?=
 =?us-ascii?Q?6ILiSzz6ebMf6nJ0n7vQnQj+ZnGmHqp4c5ApjB1y0lqIX20bueSVup9yJkon?=
 =?us-ascii?Q?qpuQrRAWptgY0Zx1m5p7NIi9GsZqW1KtTMbpkJfHsHmgGjV/B53N0q65p/+h?=
 =?us-ascii?Q?U1egLJGyaRFW+O37CymUUapkdIUbaSks/LoznNQ6aCIND7vj2/K2845tSfSG?=
 =?us-ascii?Q?PT1W65Rc14uxE2pFgnp79fcSzOxoR6klXJmdeFYfGTMRbDQgiUt3sLYIdiUn?=
 =?us-ascii?Q?2tKJi8/k3ZsL+n9L6eMQYoGcgPSbvlqs51QYCBB4CZfk37WDP5wZITt8VQlx?=
 =?us-ascii?Q?yvQib+zUpg1U2h7Bws99fyQr+TyqkPYG4RUAahx7ohMum3ac6XdtGZf6EIm3?=
 =?us-ascii?Q?bV/9q9TML2RLYRMoMKs3gR5GcUWgdQc4oPV14oXEqhEs9nAZnAIlbNdZCY83?=
 =?us-ascii?Q?24zx63gQmolhvBVTTboK5ScCfhbQzVqwvaY4MExgBOHk8HqKZPKoRif0AMcK?=
 =?us-ascii?Q?66Dnbkgi4WdF+hvrWLUdfRlaDyh3rtb7K4Ir7dqDykXVrCOeobxxRtv6PLvg?=
 =?us-ascii?Q?FDmw+LIhwNoYqQHxH1Lb7p1v65a8mcHjH1tZiX9cXARCjMS4y8R8RQFqv9dP?=
 =?us-ascii?Q?1SdOzd+uvF4jlkMr9ljNojXnbR/g72YAh2UKUOFwwf0skONojzZUiBwOzads?=
 =?us-ascii?Q?aLNxj9oc3PQfjW39EMYIWXh1aRLTiEeAQ4yB0VPXrgG/BaL4wc5aOVNOLpKf?=
 =?us-ascii?Q?7PuNGcy9a9dElAj9Qq1YTXX+ncYwMeB0+Pi9i1Ko6nwXzJKhnsZK2nfftmCG?=
 =?us-ascii?Q?Eo6fc2QyF77bi9QvsEf79BlzvvZsyhWepWgMPEIMxWNrzYcl6x5ZKnITq1kB?=
 =?us-ascii?Q?qavwxuZHER4R+vMTKv6sLKpP02HaEqZbJOsnbuSBagWM6yqk3kr0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 073901ed-de83-454d-eb63-08df33a066d4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 20:33:32.3673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+fCe7fMA2lftuf5BuWe3X0FtZxEpe+RvTUye1f68EaekMHUtwkC+kKu6IqAmcPV27WE4giwgox+YZnczQ/7DwhcZ86x/PhnFlvBoqhB+ceqd2RgRjGhmiaqKfNy6OK+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10966

On Mon, Oct 26, 2026 at 04:21:06PM +0000, Diogo Ivo wrote:
> Hi Frank,
>
> On 10/20/2026 8:18 PM, Frank Li wrote:
> > On Tue, Oct 20, 2026 at 10:36:26AM +0100, Diogo Ivo wrote:
> > > The analog noise filter for the input terminals (I3C_SDA, I3C_SCL) of
> > > the Renesas I3C controller is controlled through the SYS_I3C_CFG
> > > register of the system controller. Document the
> > > renesas,analog-noise-filter property, which references the system
> > > controller together with the offset of the SYS_I3C_CFG register and
> > > the state of the filter: 1 enables the filter and 0 bypasses it.
> > >
> > > The property is optional: device trees not providing it keep the
> > > filter at its reset value.
> > >
> > > Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> > > ---
> > >   .../devicetree/bindings/i3c/renesas,i3c.yaml          | 19 +++++++++++++++++++
> > >   1 file changed, 19 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> > > index 08fcea89a015..381807844351 100644
> > > --- a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> > > +++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> > > @@ -96,6 +96,25 @@ properties:
> > >         - const: presetn
> > >         - const: tresetn
> > >
> > > +  renesas,analog-noise-filter:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> >
> > I don't like this syscon property, look like it is one kind pad propterty.
> > Is it possible model as pinctrl?
>
> On the RZ/G3L and RZ/G3S this filter is not controlled on the pin
> controller's address space but in the SYSC address space (hence the
> need for the sysc phandle).
>
> There are a few factors weighing against modeling this as pinctrl.
>
> The first is that the physical pads used by I3C are multiplexed between it
> and for example RIIC3, so we are not filtering the pad but the internal path
> of the I3C IP. The pinctrl does indeed have some controls for the pad's
> digital filters, that apply to whatever block is multiplexed to the pad.
>
> Besides this, even if it were moved to pinctrl we would still need the sysc
> reference, as the pfc driver would need a way to reference the sysc address
> space.

System allows multi pinctrl devices. your syscon can work as pinctrl provider

pinctrl-0 = <&your nomral pinctrl>, <&syscon i3c ... > ;

The key problem is if model is resonable. Syscon is simple, but have not
good abstract.

Frank

>
> With this, I think that having a DT property is the best approach. However,
> the form of the property can be changed if you are against this particular
> one. For example, the register offset can be moved to platform_data in the
> I3C driver:
>
>  - renesas,analog-noise-filter = <&sysc 0/1> at the SoC level
>
> or I can also split it into two properties.
>
> What approach would work better here? Me I'm leaning towards having
> renesas,analog-digital-filter.
>
> Best regards,
> Diogo
>
> >
> > Frank
> >
> > > +    description:
> > > +      Analog noise filter for the I3C input signals (I3C_SDA, I3C_SCL),
> > > +      controlled through the SYS_I3C_CFG register of the system
> > > +      controller (SYSC). Three entries specifying the system controller,
> > > +      the offset of the SYS_I3C_CFG register and the state of the filter.
> > > +      If not present, the filter keeps its reset state.
> > > +    items:
> > > +      - items:
> > > +          - description: phandle to the system controller node
> > > +          - description: offset of the SYS_I3C_CFG register within the SYSC
> > > +          - enum: [0, 1]
> > > +            description: |
> > > +              state of the analog noise filter:
> > > +               - 1: enable the filter, performing noise reduction on the
> > > +                 I3C_SDA and I3C_SCL input signals
> > > +               - 0: bypass the filter
> > > +
> > >   required:
> > >     - compatible
> > >     - reg
> > >
> > > --
> > > 2.56.0
> > >
>
