Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793689508;
	b=EPw4mf+4X5+6aAj4kv2mUQXeJ2g5kWrhTx/8JAhGGXneBDDauAUzkiL6uEnVvRHyqjYZ
	 Q2JxYkS7u+sX11iW8YVHkSHOfrakH3mv/JyyC5+CozJQCERoMIbK++8WsC+P/o/08LInV
	 fw6WNt+qZaYydXM+/yxQ4KDMw5utB4avwHrlr4D4yj+LsBzstCBE9Gr2ghd0w0H6gpLYF
	 tM/NeJ9vZT9fnq+bavR9r0nFRY/YPsM3r3u037ZR0uYzCYC8mRl+F6451tik6ItJ5Zc5f
	 7D1GdEQG1x145ClOfVHh6zVfvn90rCEdw2e2qtTh7qVF04uIioXwfN1pUbTOFTs9wsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689508;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
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
	bh=qC8eUd08DbKlw1pRZDVdH3peJxA/n+wXgLpPBAlQN3U=;
	b=OPtE0lgFnAaOUQJKqO7J7TDNA6ZPjeRoltnQo5jjPuDR19Kbiv4xVX5A+Iy6c+YcC1IW
	 IxZzjJGia2LkKO4CqxH04Y43rq8j3HV2jgFvMwSkEPLbcOMh+gFzWSQCDhCKTmZXYbXGp
	 Wo6Tp6vfQ/O0eC6msRgGtGtEU+6nZ8yppYrkJancFtCFPEN13E6xizLf8H3TP2Fcq1YIv
	 ca3hw8sWQaFMmgSaTaFM0zajqk3v7s/1Hx0DjkXqBnd3yfNUVABgAn4E0A/Kw1HZN7r25
	 WZonJ8IQbBetcbAevy7PzL36wb4RVgykgQtftwznzrMZ64u1eJvBBLrgVsBCfTTbuBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WTdmwk3O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.9
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4797606A32E;
	Tue,  3 Nov 2026 07:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4797606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WTdmwk3O
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcQUBlgJj7oC1jz1ut5UTDMSV0RDSRNfThi7pn0B6ajBgQy12kb9/T7jdeyfcPA7Q3DVlTOptIvyI8vUNqKXxUR0npHUlsr0Gg0XDYsA2FjSX9UgOLbSLQGaqlvC39n2WNaGK1mner8wqAys0ufawaLLMNUUqOMwMuRsnsW63sCPtEKWIDgaKMFWMjkF5XfBd7SyxZdKJsU5ACjOzxAwEbJuizMwTzI62WoqaEQnf723I1j8IECDbYddyJQM1Stsv9JR4lozE0ISkb3WvbhuYUVDrb2Zo4fDwxeK0y1iyyq0g1TjjJGLXlhwt2J7+xq75GuWSvnEzrBBbrAo82rGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qC8eUd08DbKlw1pRZDVdH3peJxA/n+wXgLpPBAlQN3U=;
 b=NhS71lOGiuyfAuX3iYPWNur/7oETldueCguMwGym5iuU7wQVNXVF1GCbUcKEYy72mPe4soIO/kVY1qOyWo3SzUH9Q6B/WBRdpiED99wGNwQymKXJh7AQMiu6hVZUPMNUNi3djo55ZQA5zn8zfrWaPGdjP+asliD0thbpEC/t/GPADGFB7hFtCNyqCzMFXlL/E+XM7ST7DV7kU2fklA2bG7l6TzmKFGx2S85xpDKdOpyxSKSEq2CFCI+y6+UgmuR+JCkPNK78vxlNcW2bish4a+y1rk6OAX/2eGg4qRkC0svw5kWFZFeqX8e17ttSAiGdfINFguVrBwqs2HOm/oeo7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qC8eUd08DbKlw1pRZDVdH3peJxA/n+wXgLpPBAlQN3U=;
 b=WTdmwk3OYFgtRJMnvRFQFu7j47qJ43Wwl+nbNPL5EXfBqcxTE6U4teLeWnLMWysgyDSAKrWG8TS6Pv5TMRikszgGKJPmYD0ALX8tCExzCcr9fwmin0dEKvETwoDwp9K0pfDWSDTCxVV90wzH9yFWrjXGDZGGojZ0oOqiySWUQhVL32S+uYHL3i5DZpbqyaJt0BHkWwVBbzSGQcG0mnywZ1+hAFZjQCsmawS4YDmeqcYR5Rt9A8mRkxvNDl6UlTVKJkSSjzuyRhzgcXG9eS3apTikepwdOf/ngvuQtJ0dF+b4viavTTVjl1dF33zysKfOIl68xrBGr+HRmiCjUfqKlA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMBPR04MB468013.eurprd04.prod.outlook.com
 (2603:10a6:20b:7dc::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 07:05:05 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 07:05:05 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/4] arm64: dts: freescale: imx952-evk: Add IMX-AUD-IO board support
Date: Tue,  3 Nov 2026 16:04:32 +0900
Message-ID: <20261103070433.2307145-4-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261103070433.2307145-1-chancel.liu@oss.nxp.com>
References: <20261103070433.2307145-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0130.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
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
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMBPR04MB468013:EE_
X-MS-Office365-Filtering-Correlation-Id: 98de3d29-995f-4bbb-83b3-08df3978c994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|7416014|376014|366016|6133799003|10067099003|22082099003|18002099003|3023799007|261102123227099003|11063799006|261021123027099003|261026140227099003|261022105027099003|56012099006|261021121427099003|261022075727099003|261009223027099003|261028144727099003|260925021311599003|260925021911599003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	ZRCuH4tnESJvgN0GQUV2Jt8+6PIw5j3QU62U0OH6MURgJlgeCe4uQhqiN7ZdyZ5fPW8UlwNWN12oCGuBAPqGY8151IPS9JNpwXT+/n5Z6oYk1cJu+Njvedy7L5EoBC2+31aRkDCSMDUHXul6Lrtu9RoxrPNeCmT4VBKm3/VlrH80HM0YFd4kU52ng2EpGI6iMCBJf+JXuUHTdSZFda/a13xrqXiM+PRbiMQ8qTpihtSoYf9YUwP/IbpDOmc5NCrsGg5l6ID2JdVztIKzgfmjoCkvhrAKxIsmgq7219pvivJdejxnS51rjzXnFtUcg9usrieeJcbK0tOwshwE78pPoj89qms3HRUsRcAfrNMS6OIOwggMetErhTqSd0c2Pp9Q1n6IeQXe3nNx5IwCPSi3AMlSPzdYeCBlhbh/M7Ty6lNeowqTwUU7i1ExEVLbXqTdn+OULP0mj9sUapzA7EKoLX8pYR0rjuvCKClx6hJSz4oPTpLziOv+UiZzRr5iJbxYU1ehJgtt4NW6KD+EkwD6eancwll1OdnXEWHEvathAnDDLgk5tyUnbK/a3WKEGeEpElDkv/YNBfVHnq2cyekkwXRJE6kYdv7ytbUhcP3GMiQCA5Qh9lR30XAyMvQNr7CFIuRkYL/QXwqXmTwEAQVSKkOYsUWbP9Jz6ZV0kWWEWI8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(7416014)(376014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(261102123227099003)(11063799006)(261021123027099003)(261026140227099003)(261022105027099003)(56012099006)(261021121427099003)(261022075727099003)(261009223027099003)(261028144727099003)(260925021311599003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5pzMTsUGY/cvEdDnyLE6xjCz76r/ay7ToPjlg7YRBQOOZDOtNm3Qf410Ij/f?=
 =?us-ascii?Q?c+/n8UfmRZSnE9FRVQCVaASNyp7Ysb0jEVCOSyFMfV+nvn6HPp5l2EvNgnwA?=
 =?us-ascii?Q?iWEpemhluV8205TEHvGnP4JLuytqfV6dexlsxy2l58RHuEEzCRC23XF/3D3a?=
 =?us-ascii?Q?Qklaf2w29610E3QIsfGoNMbpkIXdvoKmh49z5kEOhZhnXTyAnKAuCwuNxDdq?=
 =?us-ascii?Q?Qm22q62gBD5AIFX+Yx7W0ubNlsJ9UJWZjywBHNHwXQ3kvPYdDBY4/z0qHrg2?=
 =?us-ascii?Q?YCEwj5QeaZaI8EZdcuXNg3UqG4+LK8UifOGXupl7vqzLDkesq+SX0EDtyJPN?=
 =?us-ascii?Q?uyBIrz/D71SaFWVZeOoeQWLP3weechjbmF6RZ94WvT4WJVEsRjA8/iiLmshZ?=
 =?us-ascii?Q?6kx2Oii5uPTpaPqc7sCrNRURCAQDSNAFwMblz2Y/XZtrZq9SMqG3lwDxFigi?=
 =?us-ascii?Q?2MU1p+klR+d+lLLj6bLyRq5HRc1HaKWi4gsyBTcoPYZdIyECBv/N1xPDkZ2a?=
 =?us-ascii?Q?JS0E8sa9Zq86CRhJpXNPORXvJ3pBOWw61vLTQEUgmSPkpdWn8DjxjFjTaKUE?=
 =?us-ascii?Q?Cqq3gIQZ/ayO9YWIJ8ergeU2MQTC3jtekWiPIYchQFw5IIQd1Vhb9iywh+JR?=
 =?us-ascii?Q?A+qtMjOIsF8mg7kGRc8EGJEcjcRRhlvAqRq/+bowAbz22l3cye63S+m4b7VW?=
 =?us-ascii?Q?hXvPGF6CdG566QzORuBcUT6sntBLvrWOfT7cN/CeqA9o6+QCdfwefamZlcVr?=
 =?us-ascii?Q?TjOklJyRqS/i9TAU+18r2j3aaB74MVsWw+ZL5HAXcEnPGx53FdvcBeAjZjWA?=
 =?us-ascii?Q?fWLYbiuGADCwT4Y6l3g7u5kJFNbqA/OqB+DpmgQ937KrG/L6c7T8WV92QWGd?=
 =?us-ascii?Q?84E1uq0llIr0QjKsO1fEtRFAYmFfwDsSf3WZGNud6dnZoDNuwcMCH6qMJr9b?=
 =?us-ascii?Q?wdQQ+aJqArs1FQIiZ7wvR/4XuKurNCHmgMoZOSNLW7eMqbACFy6SN00ZviEN?=
 =?us-ascii?Q?cvSYLPVBrAhWwrORRCm5k9sUBwrrOeaPzYJXINE09PpyfQ8XhNdgM7ebIn0n?=
 =?us-ascii?Q?ez6W9r2I/Uwy2CadcD9gpF4nZ8kpbPVL+5tzC0peE/9oxY9uWNcj7RsbGgMc?=
 =?us-ascii?Q?NHUxgGbS7bNE5AJ6OOxX2Mbtc0V+o4h4kNC/wedqrW+iW/9sIVHuQDMyyLll?=
 =?us-ascii?Q?cQasae/dZZnOc4TsiagbnP+doVLlEzN0oKjYWDZXheONr+goay/jOQRcceUo?=
 =?us-ascii?Q?Rxqs/yuqgFSWDMc1GSyXMAMYXUlVNe72iKF92WeeZhORWC5JpP9vc0ru4ZMK?=
 =?us-ascii?Q?f4Et88ElWHrxb5M1SkgNki7mLN0iTnYo1szIhprkNDvBq72EfEVe5JIO5O/I?=
 =?us-ascii?Q?1pb0r+ujNWMY651JPYFEz6u5kEDQgJ5O6d1cXhVCT9u3WahYKfOOAjvPrm7R?=
 =?us-ascii?Q?gxenL7RPAIOpje+Bo9T0YRqTvfqTI03q/0TjSOJ4I9I41OANiibLQuvGqnQH?=
 =?us-ascii?Q?mRrHYN/lqpHNZeZObrB2yctcQVfznm3xKnzWBghPdMtqq6RgaszV/c/rhLQO?=
 =?us-ascii?Q?7a8J82V/zKcODOWVbHjiPVsmNcz20Var8l6sNDxlcko6fj5AbwQTdRA58VM+?=
 =?us-ascii?Q?JKCSyg8Rja+r+jxXkxImKAMyGuUeoHfSvVe4p8POv3mptnzouzyQ84NpnVs/?=
 =?us-ascii?Q?UjjLqwZbDMPiVHTCtG1+pavHF8eXzQIAJPvheIs+8C4AAGEx2LdYvZpDu6tG?=
 =?us-ascii?Q?Bra/ealX5XSbbpnDUlKc//uGytLiFnVWXRjUWKfDBxRJNwav/jqP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98de3d29-995f-4bbb-83b3-08df3978c994
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 07:05:05.2284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LehHjPHczClQiyJnqGQ4d9jxbkW+8YKsTCM0DzjM3OMT8taK08lybkjlISmoikWHceoxbUFh07dDEPYTf5bz9tspBDXfTmlQR6qilSrq7wauOdEF/bE6g5VJf9JFsyqZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB468013

From: Chancel Liu <chancel.liu@nxp.com>

IMX-AUD-IO is an add-on board which can be connected to i.MX952 EVK
through a physical connector. This connector is described as a
fsl,aud-io-slot connector to expose a constrained subset of GPIO and
clock resources to the add-on board using fixed electrical wiring.

Also add required regulator, sound CPU DAI and I2C bus configuration to
support IMX-AUD-IO on this base board.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 69 +++++++++++++++++++-
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 047dfde20718..401e16b7e4a0 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -49,6 +49,18 @@ amp_mqs1: audio-amplifier {
 		VCC-supply = <&reg_3p3v>;
 	};
 
+	aud_io_slot: connector {
+		compatible = "fsl,imx952-evk-aud-io", "fsl,imx95-19x19-evk-aud-io";
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-map = <0 0 &pcal6416 8 1>;
+		gpio-map-mask = <0xf 0x0>;
+		/* Only pass through GPIO polarity flag bit 0. */
+		gpio-map-pass-thru = <0x0 0x1>;
+		#clock-cells = <1>;
+		clock-map = <0 &scmi_clk IMX952_CLK_SAI2>;
+	};
+
 	bt_sco_codec: audio-codec-bt-sco {
 		#sound-dai-cells = <1>;
 		compatible = "linux,bt-sco";
@@ -190,13 +202,29 @@ reg_1p8v: regulator-1p8v {
 		regulator-name = "+V1.8_SW";
 	};
 
-	reg_vref_1v8: regulator-adc-vref {
+	aud_io_reg_1v8: reg_vref_1v8: regulator-adc-vref {
 		compatible = "regulator-fixed";
 		regulator-name = "vref_1v8";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
+	aud_io_reg_3v3: regulator-aud-io-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "aud-io-3v3";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&pcal6416 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	aud_io_reg_5v: regulator-aud-io-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "aud-io-5v";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+	};
+
 	reg_audio_pwr: regulator-audio-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "audio-pwr";
@@ -409,7 +437,7 @@ i2c4_pcal6408: gpio@21 {
 	};
 };
 
-&lpi2c6 {
+aud_io_i2c: &lpi2c6 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c6>;
@@ -556,6 +584,27 @@ &sai1 {
 	status = "okay";
 };
 
+aud_io_cpu: &sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	clocks = <&scmi_clk IMX952_CLK_BUSNETCMIX>, <&clk_dummy>,
+		 <&scmi_clk IMX952_CLK_SAI2>, <&clk_dummy>,
+		 <&clk_dummy>, <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX952_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX952_CLK_SAI2>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>, <12288000>;
+	fsl,sai-mclk-direction-output;
+	fsl,sai-asynchronous;
+};
+
 &sai3 {
 	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
@@ -783,6 +832,22 @@ IMX952_PAD_SAI1_TXD0__AONMIX_TOP_GPIO1_IO_13		0x51e
 		>;
 	};
 
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			IMX952_PAD_ENET2_MDIO__NETCMIX_TOP_SAI2_RX_BCLK		0x31e
+			IMX952_PAD_ENET2_MDC__NETCMIX_TOP_SAI2_RX_SYNC		0x31e
+			IMX952_PAD_ENET2_TD3__NETCMIX_TOP_SAI2_RX_DATA_0	0x31e
+			IMX952_PAD_ENET2_TD2__NETCMIX_TOP_SAI2_RX_DATA_1	0x31e
+			IMX952_PAD_ENET2_TXC__NETCMIX_TOP_SAI2_TX_BCLK		0x31e
+			IMX952_PAD_ENET2_TX_CTL__NETCMIX_TOP_SAI2_TX_SYNC	0x31e
+			IMX952_PAD_ENET2_RX_CTL__NETCMIX_TOP_SAI2_TX_DATA_0	0x31e
+			IMX952_PAD_ENET2_RXC__NETCMIX_TOP_SAI2_TX_DATA_1	0x31e
+			IMX952_PAD_ENET2_RD0__NETCMIX_TOP_SAI2_TX_DATA_2	0x31e
+			IMX952_PAD_ENET2_RD1__NETCMIX_TOP_SAI2_TX_DATA_3	0x31e
+			IMX952_PAD_ENET2_RD2__NETCMIX_TOP_SAI2_MCLK		0x31e
+		>;
+	};
+
 	pinctrl_sai3: sai3grp {
 		fsl,pins = <
 			IMX952_PAD_GPIO_IO17__WAKEUPMIX_TOP_SAI3_MCLK			0x31e
-- 
2.50.1

