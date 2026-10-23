Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792787006;
	b=oba5rmUdfuwxuUQk5GUoTN8vqgZlCQGgiaSmlToSe1ccdirlhEjq6ttBUVBIW4LgqFSl
	 d66I6aZH2BIdXPstWezGNcfodwlizQEmUkYltxIqLTpkfc4PaQVjIT79+wwaPL5dXxMgd
	 W6QAoRkytL2C9gt68dLzd1athaJzSkOX3CGSjs5gItP56jSNb4G0Qz3PtFQ7eXxyrijxe
	 ZZgkqhH56etHE2PgNNbn7YcSHz5QD9UU8ucz4vRNKh6sKW6omassxqTTyIhk6FFF9j0LH
	 T6LXc/pFzaT1BjdfVse7To7XiJae/G/eiYOuOLmsnMOUCVNW9oX9O/ek0I2bsWuV5Zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787006;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jLIWgfQRXqIhXta1NfslHWfBc295tPLuV452mZ0pJ/8=;
	b=PWBXRC0noFwivrGhJbcIwV7Kf3peNl7tSWwTzolqxIdw/+0MdQRSaa/5SQNTGA4MteFk
	 S7k3oegDM/E/XcPjNcHSVB9lp5us/UEovJmAM8cRx3esungqQkOFNYKoqLyzrfb0bN2wm
	 0NpoetcHOAGv+ayoR/FCh2wxhCQ2AakOk5d1KOkMIwJceIDgzbQbcQVJucpWrUlz8igIZ
	 sJJur34EvOUEYF93FrsB6/JbJa32EYKNQqRp2vBe4s+R+1xTYqxwTSqff+SuyQvLaO4HD
	 XkXyvYFvABBJHJDE5OCXPoRiTeClQpWWrEu2fYKh0U2pl00pzF8gXB8G9H5nApU6eTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SkccTX7Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.27
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D60606A31E;
	Fri, 23 Oct 2026 20:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8D60606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SkccTX7Y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynFT0b+G7kUtFrSzsgS3/QTBIKuZuNv0b4Zwj0Sgy30BbJQVd62iPCyPg0BoXCjAcvosM8bc11dYFVFgAltKMSnyGigtuqpry6UzGsBQ8UWFoiEcCRORCK8UvvL9KiXdwWx8atoSvc0scyC1/9AvrxJATAX6fvXpAO6BI57qbNYeLvsJGMOGZqpVioHbhZQXcdjjke7jCmPMy5EbykbfEbJ7JAnVbfVTX6FI2b8/iZKdMa+muDp3IREgmcSUiaOZ8Yi6EFNayh0jN8SzdVRcDJr76jx41/HImJSx4eHXm/kdcqgugDsvrA98qqsMkw4Yc4DwsbhvmVqAnXik4j4/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLIWgfQRXqIhXta1NfslHWfBc295tPLuV452mZ0pJ/8=;
 b=OE/UJIyggwwEtHpFRsc0GWZRdzmGoSJq+u9b7K/fBPBAODZIe+S28ZEySYBj1dh5N0Z5B6e+1J9Uu5Xjz885w3f7vI+vSAMqflS28wK0nid5JyTa+vjF/VaANmSb/BI/XsUcY8ympDP8x6xQtIvMdnTJ7xitor0R7pF3CQKsecQqKEd43dZiFwzOUng4PdeU00pwGxOGM9yIYzxDpnbm7UpDtG3gD+QHy91E7wdJ7+eiliRgjUcQzShFF2/DVlMb2ZfQrM5dMnB8NUzlnEeCXqp7YkN8QUA0JqgFGikj40dyLkdrADR7aiT/EYVHEalZZ0QPsDnNM68p3gM9u+7K6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLIWgfQRXqIhXta1NfslHWfBc295tPLuV452mZ0pJ/8=;
 b=SkccTX7YqCnnlEj8u3QTZAcTB5VC5cD6e2LHZn4qERNQ2nEYeN9CCaXXTiGALWKiM2PCYyVXOsgYkkufCYqFmQ6FxipVthKZRY7B/nZJ3Ct1tbDlD87PyWpVH3SIp0BGWuJRHNvpWK3ICfoITuqkyBjwff2rG5TEZdFqtp+aBG8Cex5Xqr+LUubw/XGNYyn1CUjzrUSnoM8jN61HyWBcrhK0PF1k3PASgRIRKDqlG8ryLhtdaMG2yKkvvKIhK4XPy4kQkdT2ua1m/zOdy+Gi9A6VQOlNSWdOBGbRDjjFiDyr9cbwgRtD//XPaCRWM1GavsFD96LuIh2O9szlz+bIkg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM6PPF2AB6264CA.eurprd04.prod.outlook.com (2603:10a6:20f:fff1::a87) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.20; Fri, 23 Oct
 2026 20:23:22 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 20:23:22 +0000
Date: Fri, 23 Oct 2026 15:23:12 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: freescale: imx8mp-verdin: Add
 mezzanine OV5640 overlays
Message-ID: <atvCMGUsLXImGhxZ@SMW015318>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-4-90a30b0b0d55@toradex.com>
 <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>
 <zv4gir4qrx62cwyl47cypuk57q7ci4l2piml5cgchhiys2hyli@ubzeh3nw4itu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zv4gir4qrx62cwyl47cypuk57q7ci4l2piml5cgchhiys2hyli@ubzeh3nw4itu>
X-ClientProxiedBy: PH7P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::21) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM6PPF2AB6264CA:EE_
X-MS-Office365-Filtering-Correlation-Id: 2662818a-9a78-4178-1b6b-08df31437c1d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|19092799006|23010399003|56012099006|11063799006|4143699003|261009223027099003|261021121427099003|261022105027099003|261022075727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	+tlK3Jjr+y696Yco7a9rVO3UGQDVJipSEEvCsPJtSaC9tVkf+f8fO1OGnanDxqifDk4KV1iQT1Gy6l06VyR7t3HjGeqkuO646q8uFr2IXFmKSIOs50iOzVqx1ujRFeTmXkhflktcxp2Ev/TLn5J+mxyNddBg8C/wK66dTzyQHE12CsE3snbwMDglUADhM+pWTofpfuhYlskICC2hMegvTGc8mAZKT0WtXS6oj7tTpKsTzqbuEKrU3JFSc1EDVXejVe4iMOMUmPlO1tTcRrc0S891DAcgBIt3Zb4BA4efPxyWEGdoa77pLU5RNGD2ChBE5/CCRKHEKW9ptVxsmULR1lx0NpghHk2d7TN6MlB35QemJ6oSJSD/8MdrhcA+4FCOwHqjHEzl0tG4SMIR5Cb9d+LBpQXn4luTNkTC0RWuAsGvbLUyipJEEJelwOcw2b2l5oSB2Lpo2S9KptxHNrOMgJamz9F6xfsGo82XCrLGDqd4/Gum1BVGZFu2ho1yz2SaPJcC+ucZVveFpSkUAEbYPQcjzeFBDkpk6DGWwarm6c6gtKdXjMTFpLkbzajOQxHYVsWxzdrZWRwK76kIJBUUnAOPfHi7rJamKp/Q0kYidhw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(19092799006)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(261021121427099003)(261022105027099003)(261022075727099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EqtF7EJGf6upf58ZS4loszTV8Uco0oD4tTAQY7fzuEhPA9kqgT1wlhI8qZ73?=
 =?us-ascii?Q?rgn7cbLobx9oRUvuXZ5sOXXMFnrbfJjtZH8L6KuQIc7u2RolA+IOHj+6Tx2+?=
 =?us-ascii?Q?zsxv7WMtT0D/BZ4HfGwMaOld7iXz5w9aYPCd/JCvvSHcIoecVhweuKpBEUU0?=
 =?us-ascii?Q?vonQ58Gd2Tcq4y7lPF7w4yiYAfWwxzfjjxceh/Mb438h1PriMoovbG/68h62?=
 =?us-ascii?Q?OK4iXbkz7UOVdkVyYzB2RwCHCHSkElkMBmfnprDYIV3CnC/ldXVEsZRW+wEE?=
 =?us-ascii?Q?EtcTUTsMjtRxUXu9AOu67TAD9Hhbf0fp9guox/Us/7B6s+LlJJACUtlLzw3p?=
 =?us-ascii?Q?Fru3la59ADHoe59H3jdGr8VSfwWVdLvqMjXKeI0BueEOqeJqb+2Wr26/KaYZ?=
 =?us-ascii?Q?yNM7Dty8eV0Z0Arj6wDsoArqiVF9LosYuh3+kbOUPsWVD/2f9LyULrjqltzT?=
 =?us-ascii?Q?xhwJtGqrJtjUVmuEDFj6kmjVNn6cibCl7HZy/mVRhSmZWolvtZylnx+qWqnh?=
 =?us-ascii?Q?To8MsCkXpp0tzBpzqhPJgRti7ZQtImfOQSkdGi23Xbl8JCCijRwkvYerbAUI?=
 =?us-ascii?Q?G9ST/pkwHFXvvnpiuvAQFRnZHRPzxdifYR54M2KdaGmRaDcL0I5Mtdi6ZPiN?=
 =?us-ascii?Q?uBAyewUFuEJvvwt+dvCzy6uzerPlcfzanREMFROhi6mxMQKTaQMLFb0t1DI9?=
 =?us-ascii?Q?BofDUTEeA/cA8jrgue+uFOM6ypu3PYz8+yZnruGKyN2lkp7OFzRonxadsW4x?=
 =?us-ascii?Q?Uf0i2CYSycgGOw7sZbyHJv85o3OsH4ZYqjV0X81zAFzqaOYDBEG3p0ybVRZu?=
 =?us-ascii?Q?7stdMcsRA1amZfDP09V01FqAvwYhb04Yycki5Yqyi4k42w0phE0PnfR+i4XA?=
 =?us-ascii?Q?p6Ju7Ke/BtTdKzXqiQL3BTLz1jOuN7mj8uOmgiidNLwu5B+f67WZqFxn/XfL?=
 =?us-ascii?Q?1j76bs1ouBN09WsXdbkQNH2BIAUKKMbAvLqwhNLCMkh3VKghfopRDg1Ule/F?=
 =?us-ascii?Q?4fx4pepocovMV91kBcLSyEUvjHBfcLHoOry16bQe3k4PkAcTbrfahf5E8wID?=
 =?us-ascii?Q?X3ur9RzQjFC3vg3lcSMJbUvAgW47BlXvOLEOGLOscYobZT9oJg4Ecg/MdT9N?=
 =?us-ascii?Q?OKk+05ID5CE/3nWbRbZNCcFBGqImDys2U88GCjy1vzEd+pmoKabdJePQavY1?=
 =?us-ascii?Q?ivWTiqCLlGZElUnxngaNcOuAQwS43k2tfWHdnP0WyOoEA8EVFqwVGKv7/4yI?=
 =?us-ascii?Q?TmWetlxROO1Qckf6AcQ+jeGB68Et0u2iwlMTCT1hCWXcR38KS/kJCBbaSrfR?=
 =?us-ascii?Q?FENRtjqrHO02mXqehUUK6u+NFsAuY10CsB8YTnxm6O3APlQQGQT1DbcC1vcc?=
 =?us-ascii?Q?fKk3xyxTHRZ0hSgYvs82bJosr2mEZ0JA+kB8lLm/LeDmOmD4fJWUxJ2s6kwx?=
 =?us-ascii?Q?xXoNlj0AlGEVrAWNYCP88vnKydkTBqkb6+HZkWeP7SGP6Rfx75lFx30Z4/9B?=
 =?us-ascii?Q?K3CBhlX43y0S3fQBeu3Pirn/aDyA8CxXWjDsAsMCS+s2ZjvGCrfHQYw3wncl?=
 =?us-ascii?Q?2va71Jwp21XLXEKwolpNpsk4xuFruSZvXLGVrzj9Jy5NoClVr6RBR/rYz++b?=
 =?us-ascii?Q?mVmidRB7QuHY1JSXRFEYwzp/y9kCS3kp8xDv42WJ7ZuXmEFjKUu623A76q5g?=
 =?us-ascii?Q?2jy+HLJx9ABpSybwLhRh9t9IMB3YnLKRM2jsxL8Kl3TNQs5QmrrYRPl+l51C?=
 =?us-ascii?Q?8UUF+qiT3t8olQvkTe9fFaIX97J+tCGahDLRvLrShB+/3FsjCgvX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2662818a-9a78-4178-1b6b-08df31437c1d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 20:23:22.6990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sakzegnpIEo2L444FNchRt+cWvMWl3XTqH8uUz6Js0G0azY5iGkX8pInuuLx7MM/Q3hYnyA1Hn6iBbmo4t/4vGAbV/+irnFoJze97DlmTtJONTJpW7TCL2KpxZr3uS0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PPF2AB6264CA

On Fri, Oct 23, 2026 at 03:51:17PM +0200, Ernest Van Hoecke wrote:
> On Thu, Oct 22, 2026 at 05:20:48PM -0400, Frank Li wrote:
> > On Thu, Oct 22, 2026 at 04:31:28PM +0200, Ernest Van Hoecke wrote:
> > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > >
> > > The Verdin iMX8M Plus exposes its second MIPI CSI-2 interface through the
> > > Verdin iMX8M Plus Mezzanine. Add overlays for using a Toradex OV5640 camera
> > > on this interface.
> > >
> > > The mezzanine can route the camera control signals through two jumper
> > > configurations. Describe each configuration as a GPIO nexus mapping so the
> > > camera description remains independent of the physical routing.
> > >
> > > The default positions share the native CSI_1 GPIOs and are intended for a
> > > single camera. The alternate positions permit simultaneous native and
> > > mezzanine cameras, but conflict with the Atmel MXT touchscreen GPIO.
> > >
> > > The current camera set uses a 27 MHz on-board oscillator. The legacy camera
> > > module uses 24 MHz, so provide variants for both.
> > >
> > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
> > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/Makefile             | 19 ++++++
> > >  ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 ++++++
> > >  ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
> > >  ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 +++++++++++
> > >  ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 ++++++++++++
> > >  .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++++
> >
> > why not share with imx8m-verdin-ov5640.dtsi, which is almost the same.
> >
> > Frank
>
> Hi Frank,
>
> Both camera modules have their own oscillator, and the native and
> Mezzanine connectors have their own supply, so each overlay describes its
> own clock and regulator nodes. They also use a different I2C bus, CSI
> receiver and connector. Both overlays are applied together for two
> cameras (imx8mp-verdin-wifi-dev-dual-ov5640),

Okay, I see share one imx8m-verdin-ov5640.dtso

> so their node names and
> labels must be unique, and a single .dtsi cannot be included twice.

mezzanine actually connect by another connectors ? so it need new one files
because current nexus node's limitation.

Can you make imx8mp-verdin-mezzanine-ov5640.dtsi also standardize, like
use unified camera_i2c_2, camera_connector2, compre to imx8m-verdin-ov5640.dtso

And avoid dtso include dtso file.  Now perfer only include dtsi file.

Frank

>
> The connector nexus makes the GPIOs independent of the routing, but an
> overlay still has to name the connector, bus and receiver it uses. One
> overlay for either connector would need the target to be chosen when it
> is applied, which is what the DT connector/addon work is about, so sadly
> we have to wait for that to make things more generic.
>
> What is left in common is a few constant sensor properties, so I would
> like to keep the two files.
>
> Thanks for your input and best regards,
> Ernest
>
