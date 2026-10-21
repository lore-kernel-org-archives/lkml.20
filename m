Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792615833;
	b=m+8G9jLGgoC1smB397WU7U+dxYvc/FA0OK83x1BZVux4O77pge3pNWZ72M+dyC/Q/N4y
	 3GcN8ZvIQ0KCXb18xMwBVXKYqXp6m38uUPqczYraRqz64j3o7OSOnD9sVLCZ2xNys6adj
	 pRGq0j85d3+j5Zng40uz498XOBLhJuWA67oReMiuEWqvLifc2mGRwdiTuvjK1QeK4xAGk
	 Jd014Tmt31wEJFVKompXMyIyPGjkXjiRG+SX0g0kBDrCCKEjyQvZ9jYWICcP7KenJMU5t
	 m+patEn6ct8bX6UXh6ssKZR0kTNNd4M8BR2RjPNk/vQF0UQqcQ/UPTvgbtliyoJIqpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615833;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=vph2fLIMGOI4aHlOlYjSfK0JRT4ZYd8Aro96SXsQiwQ=;
	b=veMWREkBYMi67jdbylecPlelyVViJAIOsgd/Ck1K+ZI2EJonzVDWobHk8SDOxkS0qnW8
	 m/ym7HkSj6pCzSIr8R8A5lOE08QnpaBomC37CeOOhxj2VxIepE8OsJkKCzGDMDanzgHwE
	 1ZJywpmCw0aeo45QoGAiSoPXB0b6qpPZmy4Poml03aIMxeT4xO0nV20lcDlKKrx8ll4DS
	 K0F2ISPTVeeUYxfyCgz7IsKM4Cs2HBXre9abuHdVOrcknKkrkVNhixxNcdydJc6smaabL
	 5h2F2wWI942j5Rooc187mc/mL1z5L5dqlOq52TbjGi7EU3ShCZdJXRYKePOmIuOwH3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=m1ocyKLA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.59
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013059.outbound.protection.outlook.com [52.101.83.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9CD606A31B;
	Wed, 21 Oct 2026 20:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE9CD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=m1ocyKLA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCzxeWwPqfwkAamwfy7MtqC6o3E7m/v/41pNrzei6oll17WTeX9OcE47lJ1Q/uawIR3y9zUmazMdpWhFa/urKHDBQOd5bk+UYZ0hEJ2g/DXE7BmABDawJ02RR8guGxjTpfyEdxAbrdV7GPB3Rs8My6Z+gSQEEjGDIioGkXS70suBkmir4p/dUEmWFaAutzY7StDRI33RJQOx4X8+ZoguFaHklg8OVrR9Z5z82Y3sN++v4krwOaCONYuOsGZ5KRQ9E9pun3r9shlyinyGOkNVYzl+x0SoZGx+exG/YcOPijRifBCUlREr+tvU0TLIrpYfxN9XDDq74pEqZpTHPRd+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vph2fLIMGOI4aHlOlYjSfK0JRT4ZYd8Aro96SXsQiwQ=;
 b=QYwlXykG/CQGV/ZiinDPhEBPV12jfhFMU4iHrWS4I0Bq0WOr3036ddTxfq5YZLKWFfO/F45O6Ah3bvJvFMmqrFAqLyqAwNsyZOcJcij3MinjlCiYdxArojZemf8f/8h4+Sc1ldxwknjaUL2ZJeemhQqr4dcTrBKQLmAvUlCij2KlCn5Y3eYoi2ucpYiMzX+BZpRBv2flAFXpnX2aQd0qxTpJZFolqrA9Vg++fg0Mf+Eyl2quacjb0pdt135uPAxPvEvb9n5mVkkJ9T7oxRqlD0hMm5rYQCzBf9sjg+eXrfw+cWHjtUPm4D3F0tJ8e10xezqnNMiCDn8tRDzxWO07IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vph2fLIMGOI4aHlOlYjSfK0JRT4ZYd8Aro96SXsQiwQ=;
 b=m1ocyKLAYUWI5rGewojTJ+xpm6phRc2gIXqBiSFlywTCFtAiNeDoHzVtAzUbFOlfGNqMix4QgADEsmLuzKpf+JDgVZm9SPlVagQzg2l+Hz7UJ7TFTWtzFFEKh70fJ1fHMGf5VoAU7HkAGhko6m0IPYNbdZ+G7Ljhb5a5P2Q+IjLDjgNhZEGHsSGswWYfrrKKqr2F3AWw5Zh1D9NQ7h94Hvn4iCyc/dl2cJb29uKcN/ijCd+KmFd722hSePlvGdG0sEdGbDj6UnVWa+KsM/Tsl5oBBDXgd/BXFGzMWBnoEvUgyvmNGNRol9CO043HkeyS/j4kZnhZioQS3+seTzinGA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB10273.eurprd04.prod.outlook.com (2603:10a6:150:1a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 20:50:28 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 20:50:28 +0000
From: Frank.Li@oss.nxp.com
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] ARM: dts: ls1021a-twr: disable USB2 by default
Date: Wed, 21 Oct 2026 16:50:15 -0400
Message-ID: <20261021205018.4037171-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR01CA0014.prod.exchangelabs.com (2603:10b6:5:296::19)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB10273:EE_
X-MS-Office365-Filtering-Correlation-Id: da010d21-8f54-4b69-3384-08df2fb4f058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|23010399003|376014|261009223027099003|10067099003|261021121427099003|56012099006|18002099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	hT47UK4yFEYR9MBUdmHJJY54njajrBKVTIPhX6eXJc0tLRwL2szC7oCQZKG36Dg6z5Xn+20SgXw4gSJiD+M+rGnHrUb9/I0zmlQLYZYBARf7P4kmoAkH5RvwS8s4yAmNPQABCOd1UW1RgLJXrZ/1QTzBJx7Ta34NTjsSJkkLZVYbOUcR1J+uwCUJljankkgnQ4FLD4h+J3vsBZHW2CArJHi10NQ1RpdrclKCDE3NKYYGCysoS0Zxr2N/4ZkCjfxs6Y31rSocUfh86Sre+x1S5ydOFqrx9BjZYPciS2Ol1IHQHllnSVmJqwZc4zkxPmMv5eXUkSBDSqooUahR2S3U+gHi8R/507pZGvJ9byh0M4jwt/NTacASFkxmu6OYpQJP6EO2ss0Gk76Zsb2Wl+d4K1wsbly0BpPq2qRh7ILXL1apHlKfassJaEBM6itIipD8XqxxmHjGcIB9jx1INHwABO81gWGSLnTSJhMKDlTsEebx/vPBlDvsfTe4E9hedbJC5x3cZrrWjPDekGo+lASiBD1KuoB0deK2rE88UYwq8vXMrdw0JJx3PKQ3wHnqUwPkLeZ7lhimuF1MZ76jT3UBALt9kXjfj3oMZEPBy9vTnleznuBn8ex9DPSmCrTXJuKdQLWP18ab9FfE3gC1ZcWTHvNUV5hc/f03Uwq0T2ctDrd+sfvFlh/PiQHUh0MyMKhk1GR5N3k6cxjaYeIsgeaFJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(23010399003)(376014)(261009223027099003)(10067099003)(261021121427099003)(56012099006)(18002099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3pmK//9aJwt7R16g+XPyXINppsC2whoo8Cde5uR2rzcVm+Jc5tASEmR83EVU?=
 =?us-ascii?Q?Ou5wAzPeC0KR3RdUSmQVQnZeM8dhtLi/i/RWz0ykXxm5zUckdekOPH7H7LtG?=
 =?us-ascii?Q?QzhxPJP4XkmNXFuSrLmsRRzp34FIsQWJQKisz2wlHKtufNw8cppsDr6UF3sQ?=
 =?us-ascii?Q?9thvlQEWi5Qwrugu1u6WKDtSI1arP5jmxgAilrCp2Tetd6EqdYEshaX/BNTj?=
 =?us-ascii?Q?IK9hfaZuKCItMx6CKeOFJPJKMNeUnC1ayjUwdjw2bHL51ki3x2Q4m07jXOoE?=
 =?us-ascii?Q?PA4QmWptGcdTw+OWiFg/Mvdt5VU6N+7Jb1P26zkWOpUhKJhqBYfOGYmArPDu?=
 =?us-ascii?Q?jgiHe/j4jmTL4cCJsCnr3rxRnw5NWrnKV7yY8ITu/+fhAfFW+EJySW7jUqll?=
 =?us-ascii?Q?a/1odAiU7tNavLWzTM6S+BeHQ8+lKJ89NZXowYkiBb4qvJdPtCKrta7GYY9H?=
 =?us-ascii?Q?z7qP8Z2vmsL0Tc1VVFKR/4eHZE5O2ppAYWrYyybdYBdCE2raT1d0PTgiVLxg?=
 =?us-ascii?Q?CX1Rf94ulUetsJCYSbsGyeJfDb2YICPEUu3uon81IxYg5F58Y+ZYeYzqyGKX?=
 =?us-ascii?Q?u387AAqwYiNLGBd07/AGUrKMlZLfPk2Hrs5BMJ7F3/zbK1HqxOCzC59Mk5bd?=
 =?us-ascii?Q?Yar7UlLACapp6blDD2mADUb8axE/bVXo6ZvSvlnxd6WkC3ORSdR5Z5x+ZPSu?=
 =?us-ascii?Q?wxgkw+9CPOWGlAwcK81wZ8WSf81GhaKd27bsNkBGTYIJVijcuNZQcuQWtfZP?=
 =?us-ascii?Q?2nMvB/TtmvXENiq0bIG1q17eqqngGV3pJssHHb5dZBtTAmodLD+UDbEh86hd?=
 =?us-ascii?Q?Wmt5jr3zHEBuEDEWeB59fZ/4nkFI0Kim6rA72FPWTQhNpsyC0HUx2bc3LEhB?=
 =?us-ascii?Q?3cwwP0AWLFsvxmWLUk8R+gNlJ2uxNLOzx6PpwlrxW5PAkocwpHJW56DAQN19?=
 =?us-ascii?Q?Gx1jMcu/TEaWi+63+1K4QVvVCNBuUvnMd3zOQ4PXUCJBahwgOrTdplLmBFk/?=
 =?us-ascii?Q?QXAecelihi38ndo3gdiZUw/ilJ4aKf9cvFIt+1kH9divOYJ9LAoYFqVp5ft6?=
 =?us-ascii?Q?KL1JftSTaJLQJPFwaKA9ckyKV9+l/rpRq4ckTDl0EUgtlp3JYyTfCEfpKaD4?=
 =?us-ascii?Q?v4hsk9t4wE1RxdHiMb5pM4ufG/g3u0J/E5aEUvBTlqr5NbdQD9HBO5PkJVpW?=
 =?us-ascii?Q?kuMSzjQjvVvs+WGlsoxVm7flsemtGaVzHFzNxZGlHbEqJq+pqnRKAlcaRggi?=
 =?us-ascii?Q?qAQhJTdBfJRvkkdJEpqg5LS2Xrpt+H/BqMmw09EAu03RP+8GDAf+AwnN5U6W?=
 =?us-ascii?Q?B5RwMIAKwAVRg4Wk28cdlVdNKVUZuf1rDpc3C4dQdnOT48dJlFTDzK5CdtzU?=
 =?us-ascii?Q?fmQuiAfIvI4qc9xDz3fpLgwd2SbtYYVktl34cyXu6DMpL0HoBJKCyCq+6PS6?=
 =?us-ascii?Q?/k62zEYJnQ8/Pl8cVBvaNNZWGRbiVOyuww0XjV/v/2y1onk7t7vOIFdPoKra?=
 =?us-ascii?Q?zU1QS6TRipZUdqDapnnrJkVHCiT5dTo0om2MrRNtOA2cdonq9XSF3n8ZSaoC?=
 =?us-ascii?Q?UWIRSYecciMD0AeDutRWGv3jrzLDfcwq2oKIYTuLf85zKcVZlYOdjrtY8Vrv?=
 =?us-ascii?Q?7Gyo/ng5BuzA7ly5rvM8F9aT5UtOeKhLQpW1MyYX0LtlGeN6obkxghCr3m2s?=
 =?us-ascii?Q?M6KaYckaNnHZ2AkLBjoD4Cp0c1YjdEG3asT+LTIUF9QXkwclkCS/y1HJR98R?=
 =?us-ascii?Q?R1rgIHJwRd7p3xUk538N2auu14YoYkE6cVaZ2oKQziRB2ALkh/mF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da010d21-8f54-4b69-3384-08df2fb4f058
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 20:50:28.4747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUbZfgvKA+G3c6lR6sRlYl7yrnB2tEModVRVVwDnSBIHLkGbMjDLK3ZyDrXGlc9zVgRuYWLJic1QU3AFcbGKkb6B4vl0rqVc5T5QyXVMOUcJT/eP0DvqjYSKGU+JsrfU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10273

From: Li Yang <leoyang.li@nxp.com>

The TWR-ls1021a board doesn't have the USB2 port natively.  However the
USB2 pins are routed to the ELEV expansion ports and only available with
TWR-SER2 board connected.  So disable the USB2 by default and users
of TWR-SER2 board should update the dts to enable it or apply an
additional overlay.

Signed-off-by: Li Yang <leoyang.li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts
index ca5c66c066db6..e1daeaa093e0f 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts
@@ -224,6 +224,10 @@ &uart1 {
 	status = "okay";
 };
 
+&usb2 {
+	status = "disabled";
+};
+
 &can0 {
 	status = "okay";
 };
-- 
2.43.0

