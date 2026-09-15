Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459483DCD9B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.104.111.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495051; cv=none; b=VauOyiP4EPmZ0YOcri05KO2UdTawOat+vkLVhcKzwXcUAly/CMDrRUSGYGkkLL4YYrI08prpM1gfsachcXLInm4bbGr0Uu5pZTgK+KJFwIHon7Buqoltzbbpzha3y6og9rkQUqOhBafS1eGklLIO+x/fZxTA2Uttu/r5sGwA6Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495051; c=relaxed/simple;
	bh=WVWhxDBmdVMhYR61ZOuMzHQm6z9b8BPIpNIsuIzQ8fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type:Content-Disposition; b=pdCo9F1MVSFVku6wN+DJ5GB0SOyPGlLO6OhAq/MrjQ2VymWC3znUifDkAdFaGgqwDb8anBPmQ3xmaFzjFdbGOO65UwQtXyDj6QNahqqADc2FDvYloO5HUVxscmphpnjRonwtOfmSF2ajiBZWAqbp3MzUYALPe6WezkwG1DIRMfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com; spf=pass smtp.mailfrom=toradex.com; dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b=eOwvSo2M; arc=none smtp.client-ip=194.104.111.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toradex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com header.b="eOwvSo2M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1789495040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rx71NZ9RTquuvMlBGM4BhygQpphjN/tMpdm0RaFX0Xs=;
	b=eOwvSo2MxduhF49/yABCILojExSd1dPtJVuVJd/s3HLGENIr+aEPLn0IbQ3rxhOaxD1bqL
	87rXIuAbCS9QYxEzO/0Bkf7736fE4+qtjilQfR1v6ah/zpfauqPgjKv/0Ou3YaXAXUNkSQ
	kP3f1+i4DPcRAJcOAZQYgU/AUA5OcRc=
Received: from GVAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandwestazon11020078.outbound.protection.outlook.com
 [52.101.188.78]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-52--kEarTA9PXaAodnX_aO2KQ-2; Tue, 15 Sep 2026 19:57:16 +0200
X-MC-Unique: -kEarTA9PXaAodnX_aO2KQ-2
X-Mimecast-MFC-AGG-ID: -kEarTA9PXaAodnX_aO2KQ_1789495036
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR1P278MB1057.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.12; Tue, 15 Sep 2026 17:57:13 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 17:57:13 +0000
Date: Tue, 15 Sep 2026 19:57:11 +0200
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <aqmG91HwmKe-enfy@francesco-nb>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>
 <20260915132806.GA226756@francesco-nb>
 <100eef7b-e1d6-411b-bac5-98790e8f9ea7@lunn.ch>
In-Reply-To: <100eef7b-e1d6-411b-bac5-98790e8f9ea7@lunn.ch>
X-ClientProxiedBy: ZR2P278CA0030.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::20) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZRAP278MB0495:EE_|ZR1P278MB1057:EE_
X-MS-Office365-Filtering-Correlation-Id: 9741ac5e-b988-4e18-a5ba-08df1352c5cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|22082099003|18002099003|4143699003|10067099003|56012099006
X-Microsoft-Antispam-Message-Info: tVNzzijrHYPd/1LDdLY28UUPGz6JBu1KMvPV6Mo/jBwx0RH3P2/sgpFJOUdw25oQoASUmOrewv0Fvo2QvB7Ygv2I8MPGd3QO4r+3fiRYS/vsXbC2RhYd8zCmdzsHUrl84LCAaDhde9UzQcwKAQqQpECY9Nz3mGjLxrmybOkhvb0PvsQLNY+djli9QnEg2JqaU4x4hjOYns+pKU+86LP4PLirQ6tJ33442MWdRbGcHmWSreu+OnT8M4nf5nQz8s4MctRl589dnrrBVHaoK+M+cQHOju7/o7sqUM0GKtXbAX1R029Uxj7bk3Cg4d8w9CWK33P8iLmIJbxqdWzQfttzxsIdhIfFafDPiXnVFaV8D6Z8UsHeC4v5hclHZkw1iZQAqHsm9Ragb4ZWuezaJy+loJkR8R9lZCp8Y9ynAaB9EoBiwRnbNltLvJdBaoYCNYrVTitiXlCiK6ofV2Q3W1yL8ZXyeo57Y0Eio/fyR5VzWHDCWrTrlERBsAf51m9iTkEz5RwnxJjXGQFg2BZz/7KLt7Oaz8S+Ylt/hU4DVF1d/L58atkwOGcYgfc/vU8U7R19bRD2EHQ7htPtzXW0X15O2NTrQT5t/B1XLkQQZkPFiEeVc1pKBKmtCA1ikL87pVwjpeWg1QwHPzF4c3HA7aUiKA+gBlZlqFA4K0MrNekPbyI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PkiczPe00Ec8DdOSVZ7nV2pmPV3B6FoiHbZVho4ZC9hCDSb5GX7scglnzJTz?=
 =?us-ascii?Q?vWZhVAUPtjrE61alxrBGgDddfGG8RMXKLIdpmo5ZQmeLN1+9OEQW1he3lh7z?=
 =?us-ascii?Q?lNsofEnw8+KW/9KftQkYt6BX5bp0I9zmWaoXdQGbPreDg4WDtdnRxEchYpU3?=
 =?us-ascii?Q?LOZ4a+EYbKDUE290saKKrR7T0aBCIwlJhc38Rjp/AACgLx+7WYEt02Qn6fj+?=
 =?us-ascii?Q?Yizo0FU/07D0Fm5ELDyUbxWPxU/CIkqFLu7oNTlkJVeA6l2FbZe1d5PJD6pz?=
 =?us-ascii?Q?L8V/LoLVxler/B3EwH5fajpaKIyl4TFm5KurlR2EJ2J9vldt7nImi5ImNuMB?=
 =?us-ascii?Q?lhbvdLJ7ovb2tHqsjpONwfjZVNxZhj8UVX+iJe5xkUnQD7qXbRqQnQTxcgcy?=
 =?us-ascii?Q?QzJn5unup0z9X33QDsB/daS8AtZvxAH1DI2NDwVnzLykj8gBziZoHj15uCqU?=
 =?us-ascii?Q?MP2XwxMoBXw4qQqyFxuVv/vp4lbx1Y2rDejDdYc0tQwbG02Z5xPMpYNyVqdC?=
 =?us-ascii?Q?22acKuKlkMl/oqYR9UYHDCaVxEUAmOma+mGQJEYrFU2LCwuBfACQc3nd5KO/?=
 =?us-ascii?Q?5lKkza1G1HevQhFZoH7MpHyc69tKpKHSvmJyzcHxblGGCJl1p41JbXSAlERJ?=
 =?us-ascii?Q?StNOkF/AkBrmFxUn5nuog20a7OWahl+hpj/vYc/idD0DBgfZXwJsi8C6Tdo3?=
 =?us-ascii?Q?GlhMLKtfxiDK0U28PBzR0GLXlDG8AQA8/h8lLuuKZE8IQ/uTtkZMVID4OTZr?=
 =?us-ascii?Q?85VksxotFmGSswFkuI8TfpFd530D8Tzw0KLsqBkyX+H/2pweXKgCG4RbdSXh?=
 =?us-ascii?Q?J0VD4XbTsbBYG2xe62VOn9Pzhjo+CAXngescUE6wbhJN2HLkSWGMAz77Nbl9?=
 =?us-ascii?Q?/qj/hDLpb8zYkP1mnqU2bVTzGkwebtZ8e1ANtfxmjZV5GxoD2P52W2pqX0TF?=
 =?us-ascii?Q?sJTBLYy78T5BDy3VpAkGLH4dD3RhTgHpGbw8+verafNAFn4D2GKFlJKOsIgt?=
 =?us-ascii?Q?6ABGF9/aJkKOyVcPTh6WUgYpJzU9TZ8NfswKjM1Ydxl8ApwYnrvOzI/mnfnc?=
 =?us-ascii?Q?Nbz0qIbgNqvLGeAT9YxvnCQF3S4iOOFaxaK522wJePxYtGciTQn3PjYimuoF?=
 =?us-ascii?Q?Kp+Psx7LQuwZswUgGr/WEhThGHq4k4kJ35UeZo1udUzb2qc5Lt+frk/sT9M0?=
 =?us-ascii?Q?0Q4vZf/SXgiLdM0op8RJKWVkYtVD6fTis2g8gRmLnNJCkQ/JM3CLazmfyWYb?=
 =?us-ascii?Q?MoTbXJntQv2ppwTzXcXVlZuM1m6WNHInPmYCo+HHpij3XBdYAjq0lrzSK6Fh?=
 =?us-ascii?Q?9jlPnRVFoh5u/bW56iIensX9DJhByQBTqwuoO3h+zR99VcAuaPT5cChnemRh?=
 =?us-ascii?Q?2H+LxUPqDsVgUDRkajfND+yIO/pA1fFvvIZZqIASQAcsQ2gIQDFVbAlszocY?=
 =?us-ascii?Q?Hu0R1FmbxEuEsJ85gFbVCN/dSrPP5VXa0bioOXpER6WaD9Rqltlb9nU9ZZXe?=
 =?us-ascii?Q?8gPpBY8B78sgQRMxlcks8Y/zG1ZBWJoJUV2vHYIbDo6t3f6MvY9s6cLOiZap?=
 =?us-ascii?Q?AxJ2VF+NCHxyDxUrgFzAMJhauKgomi1TgF8SBxtugScrjdA8gsKaf7A8JYyF?=
 =?us-ascii?Q?x3IrjIwBlcIImG74pyZWYHwDxvRXgD3SJDbcpVdgvupoQPy+lICIq/WWFOob?=
 =?us-ascii?Q?pcW1eu0E6rUD8BReap9VGcFhG2AlM46khSQfip5lIO0yhLWU/nbmUg5iKBG3?=
 =?us-ascii?Q?Sm4ABrFQPfcLcSOHtsXHuBaSGvNsuv8=3D?=
X-Exchange-RoutingPolicyChecked: WhyVRNuo7NozkKRNPSMNMPNuEhXlxx7RpDSnpDGrw/flE6noPTjJFvdLgCJFaX7//LpAN96FqQ/fFbNkKbD0EVIXxI03CmlcVjXAGkekbeCSCx8e8rm+5x/9+HP0AR99vXWpOXTKUkzN3y7/vkdt7ZGDuuolfK6IyrdBPMnUjWNMvoNkec9l13yQmuK3q2PKxcToNf8cw5F0u52luvVXqYjAlmeO0cJX6kXk/m69dGTS3KbTuh/TZL+uLytoeoab3OwOGyGJHRPjW6+H7dRs11fRfTBfn90FD9IMK+MoP0d/bV9FvN+iMzaKQpuc9jo2Y+0U8N1ZWAYphKLWj3/TZQ==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9741ac5e-b988-4e18-a5ba-08df1352c5cb
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 17:57:13.8353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apqufXXPYgAvcKSynoD6HtFMsGNjRB4bJJdHjEctuwQ3yy/O+Sww4GDWwnQnYc/LJdYHucgsAEsn3h1TqobCQftYupyhJFgdnrsMXUs71JM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1057
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: unZrWx8jxv2BS7jbRkyN9TqItc5oFHx1N1sv0PwJyp4_1789495036
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andrew,

On Tue, Sep 15, 2026 at 06:49:19PM +0200, Andrew Lunn wrote:
> On Tue, Sep 15, 2026 at 03:28:06PM +0200, Francesco Dolcini wrote:
> > On Tue, Sep 15, 2026 at 03:19:45PM +0200, Andrew Lunn wrote:
> > > > +=09ethphy1: ethernet-phy@1 {
> > > > +=09=09reg =3D <1>;
> > > > +=09=09interrupt-parent =3D <&adapter_gpio_expander>;
> > > > +=09=09interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> > >=20
> > > Falling interrupts is probably wrong. They are normally level, active
> > > low.
> >=20
> > It is wanted. The I2C ioexpander component used for the interrupt
> > supports only edge interrupts. We tested it and it works fine like that=
.
>=20
> It works, until it does not work, because you hit a race condition
> with the hardware, two interrupts in quick succession. The second one
> gets lost, and your link remains down forever.

Would you mind to articulate in which situation such race condition can
happen? I tried to think a little bit about it and I cannot think of
anything. I asked google about it and it pointed out to a patch of
myself ... (https://lkml.org/lkml/2022/5/16/1186)

This limitation is something that exist also with the TI SoC, for
example, also there only edge is supported.

> >  - when we tested it, the SW emulation was not really reliable, and we
> >    prefer to play on the safe side
>=20
> If you want to be safe, delete the interrupt properties and let phylib
> poll the PHY. That always works.

Yes, with the 1Hz polling. That might be too slow for some use cases.

Francesco

