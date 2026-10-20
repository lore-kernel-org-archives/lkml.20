Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.104.109.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486609;
	b=3GBH5iy/zOaebkpPfhCwLlupxcZE6TX8yuTf34yk4mowsTcA7oHPrth5UtYoRwYgkxgW
	 /pMvpj5dDOnVUqbC4Q3Bs/VyqyxxGfP8CdhLk++LW5zjzTqUv2ICMNSHBIrfN8FhDtlrM
	 d0ohe7h5IMMNBUjucsc+cKEkt+9MZDKtUx/uKKbLZr/QfHHhliyb1eqCfcuAoMnpvBaCb
	 vuRoL2jVIRvdvfNa6/tbMQAdoBgoVmPbosv0LQN7BGgjHX59bDMtHka2Tkh8BO7kW5b64
	 mpi9yQ/mNHlmrA+l5arpLl9zjmmnsMcBrg6Z9xmFkmzh+G/rfUcIkW1ghFeohHWVjpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486609;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=u/ZKkzTjwfr3n/ITzObs2PSQp6GJy+fC0uLKRCdBMyk=;
	b=bpmuX2Kkvce1Mi/VB8NxuFVe3Q0Xv/OsbUgPv3Sbe5iZ8BnnLxp8NFeDlt17pnt0ZiCo
	 GnpVaCwOUJLNaBSmWYy04OeIN/LLwmCmqsC113TQtZTI3LyIS7sAjuDq+U+vB++6NSPRp
	 yxB524YPEaMVgX2cQjljSWpqaGXGAHkymG3aOCwJl7HNtgzsO48BU3okygg34TgDQ82ik
	 k5GqodHZ313z3HToYtmECthAw/KQUVTYiF5RWiTrHxyC+NAkjBcWfjkWy9evZ2yptq99i
	 19ghTBCiLbZ27YUYg0B9Faikjbn4SQmEz9x6S8jfjHJdfNyPL+Q7fRIQlUJpt8aLDdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toradex.com;
	spf=pass smtp.mailfrom=toradex.com;
	dkim=pass header.d=toradex.com header.i=@toradex.com header.a=rsa-sha256 header.s=toradex-com header.b=IBH0kftp;
	arc=none smtp.remote-ip=194.104.109.113
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F057606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F057606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toradex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=toradex.com header.i=@toradex.com header.a=rsa-sha256 header.s=toradex-com header.b=IBH0kftp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1792486601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u/ZKkzTjwfr3n/ITzObs2PSQp6GJy+fC0uLKRCdBMyk=;
	b=IBH0kftpsxOjAGI1vHPzXhVW27oFg/BzPL5bwz3IwvkpOvE7ReTliudcFRZ5vhmnE5rq28
	/BFmp/WURroLYO9V0stoSwf2F68ACWIjKL0/yjZFoC8SP/qfCL5JyjYx6GVXNHjIMslu3K
	Tqylu3EXbopD9bXAz9apNzuE/GJNE9A=
Received: from ZR1P278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazon11022141.outbound.protection.outlook.com
 [40.107.168.141]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-35-l11lLxbRMfG1mUtqDRJ7hA-1; Tue, 20 Oct 2026 08:56:39 +0000
X-MC-Unique: l11lLxbRMfG1mUtqDRJ7hA-1
X-Mimecast-MFC-AGG-ID: l11lLxbRMfG1mUtqDRJ7hA_1792486598
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR4P278MB010980.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 08:56:36 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2%3]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 08:56:36 +0000
Date: Tue, 20 Oct 2026 10:56:34 +0200
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Antoine Gouby <antoine.gouby@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Antoine Gouby <antoine.gouby@toradex.com>
Subject: Re: [PATCH 2/5] ARM: dts: imx6dl-colibri: Add Toradex Capacitive
 Touch Display 7" Parallel
Message-ID: <atcswu1h7We8bIEw@francesco-nb>
References: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
 <20261019-colibri-imx6-overlays-v1-2-e4d028727382@toradex.com>
 <atZutHmYt1aNWTpP@SMW015318>
In-Reply-To: <atZutHmYt1aNWTpP@SMW015318>
X-ClientProxiedBy: ZR0P278CA0030.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::17) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
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
X-MS-TrafficTypeDiagnostic: ZRAP278MB0495:EE_|ZR4P278MB010980:EE_
X-MS-Office365-Filtering-Correlation-Id: 6412736e-4109-4657-2014-08df2e880c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|18002099003|22082099003|13003099007|4143699003|10067099003|261009223027099003|56012099006
X-Microsoft-Antispam-Message-Info: R4XvKjHI4McU0FtbqOTC7azxsGgsef5awbJkPtjzdk6hBvjaPfWHdtNWhPL2ezC1m0O72bEXTrHI/NXDsTy5WaTA34HOH71YSUmWraZ7yM05cfrKTnXe4Rke/yfbvp8ga3KcgL1pGoP2NSFrZnpU7t5Hp8i8XsAIqlAitWtNUTfaewb+hLEPG9Ym1zsUNG8jcAo+XlaTpgGeGkcQmIVe1Lh7rTBgyJM/dsk85zGCZD7NpRzJjdL7mgqZYMPYmmroUPZMUG9Lg9JXTt3xjOevFC9w5Q8SvsZaTZLhcJMNGY5hmJJtwi1ZjMddsteSCNfkB62BzVzhYj5rZdpziESq3/jiI36JkJeHAz40Dy0xfscCem/HhqDCNnupcj6pytHWp4S56kjydunyrcj5Ny2bH6D7Fy5L3yS15gMX81QDEhPF5fED1YxSlnY/2j4L8rMdP5iNlWb1Lt1Z+mxV2LJA8bGpdnSHeRimWHFVbVFzvoCl3ZXmva4z1Z6vhPkRdwX7VakefX0X624hQDRAet1QiQYRE1FLj60OM4wQxjrb69zgVe7Ozd3OK9P2VXXY25Avcf0rDQgazVZRLLYPQH3YNQGsFH7tglCQuvkAWGEC8AXgsDteDixyQwUiWu5WUeH1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(18002099003)(22082099003)(13003099007)(4143699003)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R3zOYKUov0WFQ4qHlX9n87k+pF2iR9sakGbKYjcckXnJ8hm6Wg6CjkEBwoNN?=
 =?us-ascii?Q?S2Tgnn9ftBF/0Gm9cSsoHNavFH9zfKYjlRqz+DMkfL2t7kHi7uvhCzGu/i5K?=
 =?us-ascii?Q?cK7else5ESs3oDMWtNsGvS2HfhC13uR/FEd/DWbTOZsQ6qi4rMXV/sihB1ih?=
 =?us-ascii?Q?mOFuCAtmrtLOQV/CRn/LsXZeEwILtdri/V8yi9UgTYYi0Yglqf1WEjO0SfE7?=
 =?us-ascii?Q?hFoBoS7pKfkTGWzqSfo4ZHGmD1OJcAw2yk3nhKNj9/rVTN/9TR4RWUYoORD3?=
 =?us-ascii?Q?PXWsRa0x88fCPd2wNaXMyYM9LoDeW1W1eL47PmAQ3PeFenFTXTibszlEskIK?=
 =?us-ascii?Q?9R2tg4f8PGgnLOxBEvFbcII9TzqGBEVGH3KlDRnF8eSI1wBi/R8Kxu/WUjFJ?=
 =?us-ascii?Q?S1WRcMa+gFqQClY9OgCtRuvBj6tCU7l5Nv2aRjlS47vZO2Fhr966zxkxt6ul?=
 =?us-ascii?Q?qmlZ9b0B9GhQ4a+HJMAfBLWScw4hOuKT/uRjwMLrSxxZMzvKgr8nHBb4e0/I?=
 =?us-ascii?Q?Jbmzm2HdJrOQnd/PnlUM934cWm2jKYEDMPc49UsObVdXNC9qk0tZGhpE3Mi/?=
 =?us-ascii?Q?6XphWnIaa6aRp4uScLSLSmGubVwMJzaNqmqp40mWbgZGmu5j6GIo+x3jPWyk?=
 =?us-ascii?Q?kv49H4Kp0ZuP/xbzITCyqBhfgYMXFWet14DhPfnHGSoTAL9YjtcLTWQilV+0?=
 =?us-ascii?Q?YaFUubKMSSxW3qr+LJZPYHVOxx+ByqeyuCm7Zi+IBstba54tcqfgxVWqIqQa?=
 =?us-ascii?Q?bgeO5JUpf3rlaXkTrCFB0B3Xn+6jvXg7IWMKW+2Ep5lUVUTU1Cxox82zfMjD?=
 =?us-ascii?Q?3pu6HfwEK6DuBS4ZuOh6Wdjk3w3P1R/TOWKJPEC4VWP3/tkbUXudqnF2pZvJ?=
 =?us-ascii?Q?RVW7PLS56v7xACKg50LR0fbXhePkuRBquuqqxvELngaUrNAiPL/YtTuiMTFp?=
 =?us-ascii?Q?fz00/c4YW7wo31cNPCNQRsZIhvSgZwCjb93liL8NVLw8PR/XzR9Ih9whjlQJ?=
 =?us-ascii?Q?NJjs/N4XU3UzaAgTpk0QMR4wwJiMGMLYvxMdzVHMjZBavhgKKhHmB3VynYse?=
 =?us-ascii?Q?ySYNyUrVHx7d+LQtrFt+5BSSrSYIH+ujXiUW13I10Lw3VGQGN4e6wLOU5QT8?=
 =?us-ascii?Q?QNmGsNoq9WfD1oSg60dBXWRMkSrVLbym75/ibspdWukaM/HGXvRw8lSr//of?=
 =?us-ascii?Q?End2o9SXGUejNhezoZsjQk06+ZsrixUGZq9sqtdxi/GA4Pa9ouMzE2JubH+7?=
 =?us-ascii?Q?bGx/ckQkIPtMypZAhef8iZGe7CuWzsRUEQv6mWKxMvxSSSKTKbQNdOpenClK?=
 =?us-ascii?Q?fHmXloqDJhbxBBmDV8/ZvzmKTvcovY0pKZ5s7YuB2sww32qSYJEaeOT2xEJG?=
 =?us-ascii?Q?nEb8A0T+HmONOZ2iCoi/opjp1Tm1wPz98wmwqlnTZ9G1zMlKMmgrZL0mZ/kT?=
 =?us-ascii?Q?CscwSGrMJ62aXbc5xCsxcINfE0xPcKpPl81eIdcIdjdkaRcRa/liGuk/ZkLP?=
 =?us-ascii?Q?c5TGLRkaD5xLRj0P9opVtGUOoLSyjJVxDTVRj5pmNUrRCiF8H/EuMiML0TFG?=
 =?us-ascii?Q?m+a2nzGdp1FKcLSiwft8yOUFHJE5QDkTi/HjkuKyIA7S5LNOaLGukVT2cQpH?=
 =?us-ascii?Q?X8bfo5QFZFZVfjuBzuw7LimZai8npYnaYKPMJczVxyLuVPPpT3IAiqWKDR+3?=
 =?us-ascii?Q?DPFVPvlE79rQ9MGxJLD/cE8x4ZH9R8CkLRt3B6iUUX3RivMI8Rj2BEXLg6sh?=
 =?us-ascii?Q?XQtTOp/OzkNuTU0RGvrf63XJbKtyZfg=3D?=
X-Exchange-RoutingPolicyChecked: ABjYSMLcC2xAx8G3RnyEYK0AwQSkw6cvs/X9HsXVeKeGzXZIElYVvxQGZXTVwN7ndbCBJUDYbcbmli45cr2Cxvuaw9tA4zV/bPlse3JNtqMI02gN7NOBfF7R6QGT0fIxSZ2JAWGmAV48eZ2g/gStIaFk6H1Ed1ChzE0TXx+V2Cm/QnfoMyjJ8itwLEugNwridQd/4Mic77d/DeXfvnpy6smXOuA2Rp8Hfp1gz8S2LwFfr9o/T6HsOpK+BH2im9tM84ENH+OTzYnHh8VfqVHJedkWAukihYzHI+8KzQilqslHMmnfK6SYzadE81kHLzIXamx/bW2ockhmMIVk1Wm7+A==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6412736e-4109-4657-2014-08df2e880c13
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:56:36.4497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpVYyFGouNLPYSdtvMsnQ869Cw+9EZKh7N0xdKgLQHAtm4Wu1jpKTnJPy9XxmYiHAL6fykWotaPZR99/0SEhNfJnCnp9FgssmCQIUQZkh6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR4P278MB010980
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vd6jrU1gLi-OzeH1h5TPGcNU1FM58-ElVOEKT1zHpPA_1792486598
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Frank,

On Mon, Oct 19, 2026 at 02:25:40PM -0500, Frank Li wrote:
> On Mon, Oct 19, 2026 at 01:18:31PM +0200, Antoine Gouby wrote:
> > [You don't often get email from antoine.gouby@gmail.com. Learn why this=
 is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > From: Antoine Gouby <antoine.gouby@toradex.com>
> >
> > Add a device tree overlay for the Capacitive Touch Display 7" Parallel
> > on the Colibri iMX6 parallel RGB LCD interface.
> >
> > The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
> > and the touch input is provided by an Atmel MaxTouch capacitive touch
> > controller.
> >
> > The touch controller is connected to the Toradex 10-way Capacitive Touc=
h
> > Interface connector available on Iris v2 and Aster carrier boards.
> >
> > The touch interrupt and reset signals on SODIMM 107 and SODIMM 106 shar=
e
> > their pads with the WEIM nEXT_CS1 and nEXT_CS2 chip selects, disable
> > WEIM to avoid the pin conflict.
> >
> > The overlay is also combined with the Colibri iMX6 V1.2 Iris v2 and
> > Aster carrier board device trees to provide ready-to-use DTBs.
> >
> > Link: https://developer.toradex.com/hardware/accessories/displays/capac=
itive-touch-display-7inch-parallel/
> > Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/Makefile                 | 11 +++++++
> >  ...6dl-colibri-panel-cap-touch-7inch-parallel.dtso | 38 ++++++++++++++=
++++++++
>=20
> File name include key componets, lt161010
>=20
> such as
>=20
> imx6dl-colibri-7inch-lt161010.dtso, like others
>=20
> =09imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso
>=20
> In case you will add more 7" panel in future, panel is quite easily EOL.

Let's try to settle this topic.

What you are proposing is not ok, I have already provided a complete
and detailed explanation on this topic here, please have a look again:

 - https://lore.kernel.org/all/20261005075319.GA7692@francesco-nb/
 - https://lore.kernel.org/all/20261005075319.GA7692@francesco-nb/

In addition to that, I'd like to say that this is exactly the same as
the raspberry pi display, see

 arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtso
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtso
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2.dtsi


If you are concerned about this name being too generic and the risk of
name conflict or potential confusion my proposal is to add a `tdx`
prefix to the name.

The proposed name would be
`imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtso`.=20

With such prefix we would have a clear Toradex "namespace" that would
prevent any kind of conflict and confusion.

Can we find a way forward on this, that allow both to have a correct
name and solve also your concerns?=20

Francesco

