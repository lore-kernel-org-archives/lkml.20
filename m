Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792704061;
	b=OGfKSqotT7YpoqN/GhfYaXH22lhtezhU4YQ++JnyM+RFgoed+IL8wzChXbQVrim89TrN
	 4dJBBSAQ67nBdDJmOY/kiAv6hrcIaz5ATJZKxU0JepX9NWXEzNgpc6ZsVhy0TmtOI/b6/
	 ZL2KOgo+SqXEXhAWL1fm51of8ccNdNpwtPi3fox6vI+zJkYPDk8KKQjCg1+d/nQSjjtwT
	 cNnywLlSd+kHIJPfpslPsw48XPNclW64chNGDIywUofZf62pRkllWup/rzLTrw/T+CPo+
	 uwYEX1OJ00rJeyyS4OlVqquKVPmVxDUVc2XuJPKyGgbTQyHPPZ0GOEC63AsbV691CfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792704061;
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
	bh=pbb4u5LzAFqJfQ9WJCkTwClJejRmQMtZ8ldA61QjRyE=;
	b=l4/F+5BnZaWeGz7k8V80hg1ZwDr2OYh8hqywNWg6aSfHxRJ7X1eQ//8m4Etx+owxXfcc
	 /3efXbvyojUb9O5o08qtO5h7ev9IC4XTFTFmxfrtwu0gnwhvquY5hnHoWcUsF30dHNCV7
	 HCHvjZBtCsJ/QKLzvdvluU/mtd0vDP7SpJdPT4PVy3s6nfRCas34O41d5F6R6xWeZclAp
	 f+cmBIWSBSafwplwazj4UQkFY0eup9lQuZuzOJkKlighDSPN7sfXe5lpu03J05TjKNVKJ
	 /JCmxUEIkdTYLTKsnRqpLRXm8RODyU0O40Hi1yUrKGWLaSQStg8jh0JG8kidf12KZeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UxlOZglv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.56
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013056.outbound.protection.outlook.com [52.101.83.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71A0606A325;
	Thu, 22 Oct 2026 21:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D71A0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UxlOZglv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BaOcqcFbUjLlbuhXdYU1gRN92rlQWucEBRIJte0BfzDvimDR7hXnIJjaOj2C5PlYQBr02KXZ0qvkIgfbyeW7bBCqzPgJYrBsiPI8T0cJO2wbMeGiJCfCO9gZ+Z/S58fJf0VVk5CDr4lFDd9qxYKdVJsNhnKTCPZecWwwPIaY5+9SiMHlMeKxroGzfegQokbosq4haxV5U1K7BSfMFBprLrB6WiDdSEFEz4ZS2sedSNicINBI/gueJ45gmqT75EVTw27G0BxVfYBmyFa8uSdqYbttSF9MbE9548oPAdVO19k13EdSKn1W8CfR2Q247Z86r9KnYp6yJohonzuRMkOzUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbb4u5LzAFqJfQ9WJCkTwClJejRmQMtZ8ldA61QjRyE=;
 b=M1Jp/ayZ0Dmpad9LfZH5dZEfuLvaxqhclh2bNyifoQ6O9iQEw22q1zsTAIvUnmeO0YooKrI9qhSWlvEuwHxZ0VnbV5yW0AYHq4TgLkC7uTqtAy9nj3Olbj9lFc/z6q4gKsZ++tEV9Ba4Dij0v5jAZRLjhBJ/3EknGYK8I6Dj+zga0t68/wkGK/cfZoyIVtqbXmEhf6wV2plSjUnIPWyePv+ttdFZ9t4v/QX7q47XU98aH/gvIWXjyCO9gN7LdhooCT+zAK4X4Ao5nghnQ7Z5fwrchHytCb/NRRCMv3t0Re4Qn3vPI3/Q7jS9/fh9vhbd72g7n3Q1RkilWO9zKSbxwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbb4u5LzAFqJfQ9WJCkTwClJejRmQMtZ8ldA61QjRyE=;
 b=UxlOZglvDtZRHWwEp+TBw2gO91g4DbU7RlCHILoxqoKTyfRACjTi9g2Gfg5MPGUKWCEkL1BEzTOF7MjNrX8ngfqP2ziDM9c8tC0H5tjiiopPPAIoeK8sseWuuXSZ5+Z5TfPFLOIcQYnIP85sZ+Pgp2Np5RDIoHdumBe84/oThuoaRO3jLp+G7+cG2mhIU7jjfTH8VwYDfmHlbQsq7XW88ioFFrZkXyXZiRd7dheKFzZ/m166oxCIWQ/YC77Ac9aCNvKnbYUcE1T95xLwcJ7B/MOfd/ivCik+NJ/zy01rjW6ja7qaDXU+tTauw5juywq6pdDUnhZ2ftuRI4MHMZ+aYw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA4PR04MB7709.eurprd04.prod.outlook.com (2603:10a6:102:e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 21:20:56 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 21:20:56 +0000
Date: Thu, 22 Oct 2026 17:20:48 -0400
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
Message-ID: <atp-MEqHMT7F75qn@lizhi-Precision-Tower-5810>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-4-90a30b0b0d55@toradex.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-verdin-imx8mp-hmp-camera-ready-v3-4-90a30b0b0d55@toradex.com>
X-ClientProxiedBy: PH7P220CA0075.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA4PR04MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: e2b0edba-90e7-4001-5756-08df30825c3b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|7416014|376014|1800799024|6133799003|18002099003|22082099003|11063799006|4143699003|261009223027099003|261021121427099003|10067099003|261022105027099003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	QsZZ6NKa8O3v6FSO/BDb78Qp+JS1fqMReAV/EdlM9w1XyrPOsadlirLRwpYtmEoR4PkZaUSRhFnzFHzPqI0IEnyfrokGLDGhZ2YdCytyVHqa+gq9imMwKuTktSsTKZ9dFCc2heZxbaDNipJzsHP1YroANcY7Xjim79aneCK22lBEcA2fCAq2dr8Gzijjv8p51NIGoLxhZocEQaEZsHFrry61eP8/MsHw+8eXTNfXzN5XDw52l3PlWO8Pa9jf+n29V//g3mnluqDaq2jP3q58EdscSJCMXDf/7+fzCND5izwIDDNhr8AUERkagZkZ/9iHLN3qCAZXHGP2vK1ksN1tfIdVq40JZEOD96+LFSFIeHD8q8OvnI29N3XRAVI2v3KloV6JPD4vO/9ViyzsFCXBIv2hCXRj+CSDuxdyhBD08Ovx3fUM1I4YqhEB6H/MeDoYCGsfxPUp2XfX5ybKMFGm9B42Pjyt/mJbQprAVUAVp5TDDDre4OfJ7bgWemFRGw4wDBg8H6S1Qmvl7tRLKPpUIySOI5jXfr+juUrowgV3wflncWgdrNcYc9eZZ1dwTRbA32KNIP4y5tkGb4sB3mu1WodrnuguJfX5pT6YnNtrNXbyjU/Yohul2+S4lrHfoQWy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(7416014)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(261009223027099003)(261021121427099003)(10067099003)(261022105027099003)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8cmHRLo0mnMWApLHdI7FOl8MCkSUDXbWx/TksbhSkA5wjnOUHrbJvO9y7ZVC?=
 =?us-ascii?Q?TNzMbRoXnLdsDeCTEzl3hM45TpS2IdXoJPkSerO2sVft5+2ipzETa97eqEGn?=
 =?us-ascii?Q?+uA7BiE+ELDkYswWzyszxrFZB+xuHYC1wBChLFUdqGENNkMeWADIfyEL7wZc?=
 =?us-ascii?Q?lAEfof3ctkeKmbBoD7K/WCTiPhmDhUwbWyeEMlQdQCJuTN5pr3n7USRfUZh0?=
 =?us-ascii?Q?A9mKxIr8DE9CntB3VHYn7L0dLMf0+jMUz8Ce2f7iimmFR5St4IQQCtkOuUn7?=
 =?us-ascii?Q?cbylJJEW6lNM3byQETiw4GwyHxFGJf5jTDsUo7LdsD5+p4HqIC2D66D5hiqy?=
 =?us-ascii?Q?j0ErAoZ93sgCWLd7JhB2MX5V+otXbhA4wHLpV8oo+dhVRQvqK1aG13E9rGex?=
 =?us-ascii?Q?rH23Qs+BbJNTQkYnHKyG34DPG8ebITAA3r4Pxyj5C06VkvIIGlTZeCNnDWjn?=
 =?us-ascii?Q?XRHUBUNgOtjrhHA/TZHyJf5eyX2l4RQaG0XNk7MWHWlk2zhr3ZWRNPnDwXOn?=
 =?us-ascii?Q?gbjwAw7i7fcjfiI6zTPf8BfhvLdw+OqIV+jP93llaZAMue+e+7XT9q2NknBJ?=
 =?us-ascii?Q?aCGDPiZ2jXqnOPcNgxFlyTarSRGkhChVcwUGoqyaIqnycRTNFWBmdyneUTOB?=
 =?us-ascii?Q?VsrwR8ApzMJLqDOmkEeuw3scaSJXnI549WK4EsU2YF+F4IUSbb6klQtCUtjA?=
 =?us-ascii?Q?HuyD+hBdTkLOZzCEm+uK0+FHzHGBnX3UJPSdVvIndbgyEHXIDCQm1qmqwKVs?=
 =?us-ascii?Q?6UeeIwkZ8kNvlphoaepnh++A59Z3VllTHPBq4furRQRvYhGgo5CM2HZYpQUO?=
 =?us-ascii?Q?dkh97QF6HjR4kkHxfx1bDo0EfAc3nsaBrolLOSDM3wS0OzrZIL+k7dKvrPwO?=
 =?us-ascii?Q?MkBjJc84+Pmto4OfRgZfrvOt7w+dajMvhR4a67517dAI2ZqDZzJ5GFbQcFiy?=
 =?us-ascii?Q?ns7//HhJQlVr2T5eUr/2li6BXlN8HRrpvAl55yQe4lHuLl7wEe4eOiSuThHO?=
 =?us-ascii?Q?XgThpZ2yLufK7CkkVH2vqZifNOEvorfVHnXX9YrM1m3QTufHRSipS+BGXRSz?=
 =?us-ascii?Q?Yd+gcZ/Yk8qiOeWpdQwTBuZdlz3bo9CmJjG7WwPlRg8T+c6vmWhgWh5aFA8W?=
 =?us-ascii?Q?IhC+HUwERXj6SmtWLG4F5IR5L3cMKXxhK28EhtCbymdtQLxaHq0W2c/9N/L+?=
 =?us-ascii?Q?BpLrVIixBXJs9vPa6v3b1V0sNFD6+jO99Sb7UZvnWFaCBjVLhCitucZVi6wC?=
 =?us-ascii?Q?QdQ26VXkpwLlkFchESF4zPgt9xuNDI48LdTZu8LT60SuwAiBO1DTZmRZwvye?=
 =?us-ascii?Q?ijFi2LTEmDyk4PhfH6r2QDmQvumvfc0N98OFvm4eKP+6k47g79iQP5RrVJjs?=
 =?us-ascii?Q?o6D31Qq4Zfyy8ME1deL1WQ0wViPG+MqDLFftLQIxJli9N/Nbs/cxxYmPoKRm?=
 =?us-ascii?Q?n8dKABKbAG+G5dfxc/Itgm7OaPQuWHrUr2fUYj5rbwk4DmH9W8TchIRVyI8I?=
 =?us-ascii?Q?CJUO621iIcVHbR8Rx9rSPVSlqapPyVTY5IPv/87wfuqzzMN1tFREyGF7utpc?=
 =?us-ascii?Q?/rqzqSHgiwSXm10/Yq0VKQAaOrXm5WMZ28X6XhbpN2UnkdTWKDSYdRnGdHDf?=
 =?us-ascii?Q?X47ATp9H1G9EWUAg2hWOSptW72on2XyR57Zly+7ktj7wv70zr6RGUmCv1IKR?=
 =?us-ascii?Q?BR31g2nEzLrySBsGnZTXT8LmdnopzuRbhQigV5hqSYz9PRoZy1ggHdT4viaC?=
 =?us-ascii?Q?o4BnRd5rACivw5M3XjDWfCkKL2yX+f36FIvh6DFMivCNYVzLbkGd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b0edba-90e7-4001-5756-08df30825c3b
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 21:20:56.1948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HgRsotWqjnxjq+7IKuIRoEXibBZfdiOOR6efRmr/+aj8Cg9pGC7MNl+aAZwJF8CfR10j7p+IAvCUZaluAbddZ2XrlO05/o86eTHVn90hCyQGIdlxkvAgMTeNi2465Ufm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7709

On Thu, Oct 22, 2026 at 04:31:28PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> The Verdin iMX8M Plus exposes its second MIPI CSI-2 interface through the
> Verdin iMX8M Plus Mezzanine. Add overlays for using a Toradex OV5640 camera
> on this interface.
>
> The mezzanine can route the camera control signals through two jumper
> configurations. Describe each configuration as a GPIO nexus mapping so the
> camera description remains independent of the physical routing.
>
> The default positions share the native CSI_1 GPIOs and are intended for a
> single camera. The alternate positions permit simultaneous native and
> mezzanine cameras, but conflict with the Atmel MXT touchscreen GPIO.
>
> The current camera set uses a 27 MHz on-board oscillator. The legacy camera
> module uses 24 MHz, so provide variants for both.
>
> Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
> Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             | 19 ++++++
>  ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 ++++++
>  ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
>  ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 +++++++++++
>  ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 ++++++++++++
>  .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++++

why not share with imx8m-verdin-ov5640.dtsi, which is almost the same.

Frank
