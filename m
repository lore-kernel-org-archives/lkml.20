Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013040.outbound.protection.outlook.com [52.101.72.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D5D5187F8;
	Tue, 13 Oct 2026 14:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902065; cv=fail; b=ChhgPfdu/nylDVbXkI4w5fgkLw05jA02ZZ0yovoornxPkQJiEKWfcURzDxquLAvQH2JSmlYczTXCt3lkMlRZ59ZAkREoOFQaLsWfoZvEdMJxJYmAETXGPLv/RgOe3VECYWiOAzdhDGsa1iVZ+zU1+2qCjCzWtlP7iIIW/EDx+NI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902065; c=relaxed/simple;
	bh=0WBMtUnOoD6gW0h6mokJUx+7CpXa+Cn65KX8FKMAb+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eLO0XO/hbqGi7JePcbRPRD83xsL2mLDuDQjx48aAXl7mBeHujiZat1I/NrQ/WVExpY6YemAsWkoFoF/VbLpdoSHNyyRHqxii12OsPEbBXx+uTNePD4D62VzCnCStDMNduMz1wiumE4EKhoGL0zeKnfONRbpexUt+XPPEPYj9W54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IL2OKT7z reason="signature verification failed"; arc=fail smtp.client-ip=52.101.72.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IL2OKT7z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0m9CnA2/GkSnUdvsYFm3L0YSdBNuLv+Ln0sjm71XFMu4S5iVp5tz3t3wvITtnIGdzcBBgELpDHa5fzepWbIr4bKJ7D7ia6aJoFNEUP0jO5VtGHsJhvJ7IXaZA4X/szLArpkvHXAsbzUcGfuG1WrwcX1y8tbiJcDzHiUKKYsebWLv9a0a35ttWjakbNg1v7yGbiiOS/Z68WOVtPmyB93uPFRV1+henC4nT7vTNHDT1aTzLnPR+4ANwtcejnunB5tRzzcoP8Ts0Bx/n46iSqj6PworEfLBrPiRmJvOyEOz6JiGzZUEwNynJkm5PSKfA3gcoRtSRXMA0Onz74HkptwPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zv/6YMR3V87TlB+IHfICERyLlEUcLohIbEarFOwu/KY=;
 b=fZ4N1xEiNhqEHJpxixn2DuArhW083vwNHs9WDWkINs7mwJoGVS+w1FRqNuT1IyL78rZswmwSelDalM5As4zav89oFcHhrU4Ra9BcZKnJI3hIh0WJbmqyTa1vaIPxVrbE50Otcx9Qe6/jH0prkqHXLaU/+lZES31CFnP4r4icVGjwsNrZi0fPSkgOErRnWq5W14KUaDkW3ROVI56rcmP3kbjsn4RuU3446tnPciI8t8BCnZfC0uWJMTRYZN41M0ujkTOraW1PkTsBmYvcwVEKJtU8HX3aSbhVZ4eJuQSvPV7Pe3A3EQ/W/XzhW6tsIwKtWnShQAvpdkStrJ1ZNiVgVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zv/6YMR3V87TlB+IHfICERyLlEUcLohIbEarFOwu/KY=;
 b=IL2OKT7zBJvLCKhIjVP5EXarX2FGuhVyaR682FPkC+kHl407lWEYjw+ef2trcdYSmxmp486MRN4+/btM0XAnyjO+LllxuQgfkr+tzqqJdKG6EL7IX3wvlSIb7h2NAV4mXxjohyC652e7eU0kALjy0OILYI2NJXKpv7VFSbYD0M1u5waC4k7KYveTO6cv5Nyw4l4DerLTFWY5dxMJcvVikkRkPihhY5IHtLG8M1avHo9zrU+C4/JrujF46RqCvUSiDiLsx7vvXowqi6vRL2iz3ppR5klC8Ff/funYiCNEKlZfAJWZCZXnEyZ7HMXud7nHgA0mb73JOPCEDWO03bOpug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7444.eurprd04.prod.outlook.com (2603:10a6:20b:1de::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 14:34:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 14:34:20 +0000
Date: Tue, 13 Oct 2026 09:34:09 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	=?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v11 0/4] arm64: dts: imx8mp-skov: add new 7" variant
Message-ID: <as5BYS-xnFY7WuCH@SMW015318>
References: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-0-b97ad841598b@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-0-b97ad841598b@pengutronix.de>
X-ClientProxiedBy: PH7P220CA0155.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: 760215ae-601a-4c26-33f3-08df29371187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|23010399003|22082099003|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	CZEGaX3ie36z+wBxTQyEXsQ1v0t3r5vz/GkXzkLwH2YOFXJjA8v5wWN6+Hviwlb16EzC7X2iX/a4ZfZnrypOxTRLIVeUyVhiUtkD6VPEC8uPyzAwCmO0EdWGfdgUgutkl6ptwFF80pN10SEVIcJHYNXwlFNq5PvWPcTsJNEN7P723HPLxqaSHopdT1RsLDoCJ//x2qwX6K5pJzVnwsqLNNhHBWdJA6GHRC3NnQ9NGmmvWUCDWELsEqvr5SWNe14XXYGaGeM9mjaHMLCFUniK3S6U7nogv7/uLCsX6seMM+JnoxT8tUmV3fW6h64nGoFU+ame+XCtq5O/ZStfSpErlvlT0nBLqOZyDryoghwZ7hbF3K08eEFyC9bL2mc7URZXrQuJuujnpZzMCEU409OtqYm0UlMhz0ojZI4wMaGEBYmbTzETh7/4L3gFDPeL93805OC0uHBm02m+IOSzZuGGPcb8cyoQLjeR7vdOymBWeo/zfqam6TmeJ7amxlTf7DlFgsgopbDJ3Q7R3x5Vmp9xYetK+SLJtAP5efmGFxl4Se6dGqA4OBJoIqvpnDitwoCDjpcDaOeDdo2s3DzTIb1qWF49YQC2R+32neMtQX55mPcwDq+sUEDM4GGaTQSberKz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?bqs/kiOG4LmRSzphnSfDZb7Q2U2H9bsxm7Do3pBvC47cLYzl+6hY8rlsp8?=
 =?iso-8859-1?Q?doFcieUwli3x/V2JMgXe/Dityg/OdfhAlloukDOOuMt/ZLyjYeNJXoIZRG?=
 =?iso-8859-1?Q?9mRKNClKcDklvD9yrlBdGC7R6Ema8L2YxMkDQoBn9Zbqq1jfY7Iel51P1C?=
 =?iso-8859-1?Q?Sm4CFUeejbN2mtsw0gtTQP9BdOKe5ifcFQyHeGxEiVnqICVVi/4OUOedSJ?=
 =?iso-8859-1?Q?2D3yUjuMCGpLgYn1eOAWsgR3ZxogDPnDd6Py4yyB+zYVteCnHIJFqhH2e0?=
 =?iso-8859-1?Q?9VYdumcseR8/7IreFCxohvQS6HRJwXXawynHk2aB9jBtoY9sna9p3/7ESL?=
 =?iso-8859-1?Q?viZv+qzIIHlyZ8IdEbLrW3ueXPUw/fR9N9yyxsrDemrxRgXjXsovhS3sF7?=
 =?iso-8859-1?Q?W27GZqP3FBtmHoyJFGlOFytRWuG8traRtLWWOH91uRLWFmRShKIyKwVaCz?=
 =?iso-8859-1?Q?1ZLvw/tRMBhDLztCgS/pYwczQw2Nvbs7Urdo3Xo/YKe4jABPcF4s3FzUEw?=
 =?iso-8859-1?Q?M9J2ffGAjtF2Z0xmTdOFKsAWdoL1z6chKGzEEQsKaComhpUzPce6/5wQ1L?=
 =?iso-8859-1?Q?ktIzST4frsPChVLI5IGwiQj4WEGn22U1IKMrDxf5FNCaH9qmBS6zspgeiW?=
 =?iso-8859-1?Q?AbVU7WCaHFv3J2wHE34iSgDQWlIXZy7m6WvBpP+pCFh2A/QFi3/Tzuwb81?=
 =?iso-8859-1?Q?g7wthqcwVis5Fd7TggyHxeOBX0K50e29bOH2YxJULmHciVeVKL6XHpzDem?=
 =?iso-8859-1?Q?e1IHl5k/5v7/YdHb5s4ayzG3RCg4O9hLspJViZix75arXbKVBtk1116Dx7?=
 =?iso-8859-1?Q?94rgb6a91dys9xzI09TAJ+P6KOen8RKWbQX8zAFQ9ir/y6dG1IBnfGTMyx?=
 =?iso-8859-1?Q?R5+UXNys3Ba9fRpzwmbrmIHp2PkYidec1JbJx+VEVa7zwD3dCtZxfHImuA?=
 =?iso-8859-1?Q?b5TOyydSfn1ceN2jddhqWae0PifUBr+4da7STXKkuDu3xogdsov1yJ/4LW?=
 =?iso-8859-1?Q?oe1OoBw6bkHK4AD9hNVja0+PY0QUa/mIxS65Vf1KDA+jj3xRR+epmnHqFs?=
 =?iso-8859-1?Q?r6VOdpqlg5Gdy5gI9hy6e2m3H8u3GHtxLhwZCWOSaS9geWXgqZbek/vzhr?=
 =?iso-8859-1?Q?kb8JdkGqnG89vvd1ZxL2LnFVod3Yx/qbr/JX6o53/VKaNQ7eOrHL8pnZSA?=
 =?iso-8859-1?Q?QnQM1Mk7ZNdMskblhrhuBPVA6S2K69MCj85ZnIxJTV6zQFW03wBw9l9dsH?=
 =?iso-8859-1?Q?0ED1O8D89DKRDYxPc4D9RcpAdnAEsyAdXV52oStrrOlTlGnisV1BvdtSR2?=
 =?iso-8859-1?Q?J+zlYQ9N7Bn/XXhuhd+oDdBmKcpYZoZVzQ6Hja4EuYg14jldNJ0Nf0w0uK?=
 =?iso-8859-1?Q?MaqG+q8ovSewfcoP3o/oDZJV7I5Xd2zGUHCjdeGNCHTLfnDfenwUGxlFsQ?=
 =?iso-8859-1?Q?JM+jne4+wvBHOT/ueUeLKy5jKtGzM8ixQASC+m3hAxpMMefeDpI6ozu6nw?=
 =?iso-8859-1?Q?TLNrznMU0voi2vfDNziSchaPGrm3n2uIzALU1jJQEm6TZVSYngtKtGlZB7?=
 =?iso-8859-1?Q?PC+PSPNRHngdcIlPkn5V0jfN6LhTB76bLfSEkRuH9HWe+KFRo5uQUQ+f32?=
 =?iso-8859-1?Q?q38U3oJdre9gwX5ia4MJIjDFlHrHQ17pos/BFFqfJAXxQRys3hb+5uBvFT?=
 =?iso-8859-1?Q?HjxEn5zKs/tx/guKr0+j8q9MUC6YhsE6q3v6vkrq0KzQeHT52xGQp+bamH?=
 =?iso-8859-1?Q?qZmjxL1KrlJko+BlT9A8fPFwzhnuC2OSzj9Wv/LD3nFhkImnlqto9r91wz?=
 =?iso-8859-1?Q?ETEefaFHjvc5wD5gOoS+IgSDQ9aMZSBOCwLpCQhnYnsBLebLflpF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 760215ae-601a-4c26-33f3-08df29371187
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 14:34:20.7251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/N6PrJvKG743qiAwzKmPFCwPpvKUk1Jw8yDW8H4qi/yYsGA2AhE+wlDS1p10FivTc9f/PGUAQoHERbBidnJTABwPAjwWPmnputQdRtmcUioJKbUIu26Z8jhJQLwU/wV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7444

On Tue, Oct 13, 2026 at 08:21:07AM +0200, Steffen Trumtrar wrote:
> Add a new board variant for the Skov i.MX8MP based family of boards.
>
> This variant uses a different 7" panel than the existing ones.
> As the already upstream boards and this new one are almost identical,
> convert the other device trees to a base devicetree and apply the touch
> controllers and panels via overlays.
>
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
> Changes in v11:

Please slow down. and reply krzy's feedback at v10.

Frank

> - remove code-style fix from overlay-conversion patch
> - change patch subject
> - Link to v10: https://patch.msgid.link/20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de
>
> Changes in v10:
> - rebase onto imx-dt64-7.4
> - rearrange binding and code patches
> - Link to v9: https://patch.msgid.link/20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de
>
> Changes in v9:
> - fix dtbscheck error
> - squash new compatible into 7" devicetree patch
> - Link to v8: https://patch.msgid.link/20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de
>
> Changes in v8:
> - add #address-cells and #size-cells to i2c2
> - fix touchscreen resolution
> - add missing binding includes
> - Link to v7: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-0-ca8a0446166a@pengutronix.de
>
> Changes in v7:
> - address more of sashikos rightful feedback
> - Link to v6: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v6-0-fa8f71dfc56f@pengutronix.de
>
> Changes in v6:
> - address sashikos rightful feedback
> - Link to v5: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de
>
> Changes in v5:
> - convert to overlays
> - Link to v4: https://patch.msgid.link/20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de
>
> Changes in v4:
> - fix Makefile sort order
> - add touchscreen fallback compatible
> - fix lvds_bridge comment
> - Link to v3: https://patch.msgid.link/20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de
>
> Changes in v3:
> - rebase to v7.2-rc1
> - Link to v2: https://patch.msgid.link/20260427-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v2-0-e2b79fc24391@pengutronix.de
>
> Changes in v2:
> - rebase to v7.1-rc1
> - Link to v1: https://patch.msgid.link/20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de
>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Frank Li <Frank.Li@nxp.com>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Shawn Guo <shawnguo@kernel.org>
> Cc: Søren Andersen <san@skov.dk>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
>
> ---
> Steffen Trumtrar (4):
>       arm64: dts: freescale: imx8mp: skov: fix sort order
>       dt-bindings: arm: fsl: add compatibles for Skov i.MX8MP boards
>       arm64: dts: imx8mp-skov-revc: convert jutouch and tian to overlays
>       arm64: dts: imx8mp-skov: support new 7inch panel board
>
>  Documentation/devicetree/bindings/arm/fsl.yaml     |  2 +
>  arch/arm64/boot/dts/freescale/Makefile             | 10 ++-
>  .../imx8mp-skov-revc-jutouch-jt070tm041.dtso       | 38 ++++++++++
>  .../imx8mp-skov-revc-jutouch-jt101tm023.dtso       | 38 ++++++++++
>  .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 ----------------------
>  .../freescale/imx8mp-skov-revc-tian-g07017.dtso    | 40 +++++++++++
>  ...h-jt101tm023.dts => imx8mp-skov-revc-touch.dts} | 24 ++-----
>  7 files changed, 134 insertions(+), 99 deletions(-)
> ---
> base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
> change-id: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c
>
> Best regards,
> --
> Steffen Trumtrar <s.trumtrar@pengutronix.de>
>
>
