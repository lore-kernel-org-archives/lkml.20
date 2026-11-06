Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793981899;
	b=ZrClgAukt8m9uhgxpXAmz+CH1d8YTg6NY6lwY2X08nTxAG1U9cZe9vVLEigbU+ZUJ7ln
	 BLJjpALzEmz/RlF0vcmf0+l+yIPv5+1t/trYj+MmD+HAYYYsGbg/aLrak83O8YLjgjjp4
	 1D+dFX8zWNoPIID7Dn2rkXE7sJJh63gL6Kgc2ypsKm8M6zMcAQ6QWuRCJcdcstiEGGUK5
	 9srrudXT/9K0cjHDZomIJMxV1Wxm4FQaupX+j+x7P+jBBG7m/rJOEThSnbUiZzg1r/+wu
	 dLu0G2qmKXdEYrG67M1xW/UST4jTf5aO63EJNNr8m917mMMpVW/yMLSyXClx76eAU8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981899;
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
	bh=gWlJEW9/mkyr/1D9xZ583Van3fI+23uA/mnvhKMfnHw=;
	b=yclOZ7evpOIntMD1dkpqIt7181I3kzNQBMXatbLav/Pxkfpd4/13b77wtDH8Fpe/9kzc
	 cJnXlm1h/+6e5BHuguXewxB2QA1oYvKtOOx4aDmsFpr1Cho2On6fL7iXpO8BcWcaPQtlS
	 cpmiJx+zv8ePPbIi3gEn3wqK0euzBcDmjR16mxs+3IYiQJC2kAg+WVVIFyR/R9pd09R6L
	 IBTZBGu2iiOGzZGrRIAE2m5J4UyvJe8HAh/QqGwG6KGVy8rRQrNok4mg9eLTfrm5+GYVf
	 MstzOtv883+z5qM5eXOeaaviXaGqUhq04zdUJ70eD/9om2plCIdGwit9GQSpoxRG7Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Neat9pSQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.31
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011031.outbound.protection.outlook.com [52.101.65.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D815606A32C;
	Fri,  6 Nov 2026 16:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D815606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Neat9pSQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ym/ctl8+kt6QRtt9kteCJTrSD6M+7ht0P/oBKIHnpz60LWgsPXbqb/1OZgW5Ni7RhW1MVSDBZYRNbDDh3MCbLaktPDlp4IyA3Koz1i4Fo+TJte0qM+Vdx8OLWSDKt0aTGX1Asji8KE+mCfBEul0qGHZ8ZsdjuL4nZudhS8ytDDRtZWjR2ejDH5ZSEFkq5F6g4E953O4hLHHYhuMce9lIu9gUbB/5H/0u6muabvqW9NHXhBsMNH3v3aRZ0xwkIMxl1dEK3vM7bEw7aEgQeVPhIGlYKt5foiB4U/PPSEFu83I0E9LfshrPsKFsaO0nzx0hJ0O87EvqxQFW/uS5VSlUqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWlJEW9/mkyr/1D9xZ583Van3fI+23uA/mnvhKMfnHw=;
 b=dV6PAKE7QNMe5lL0j0CAh3zSb+D0Z1DyFgFCKWLe9EY1BJ+TVszxVL+at21YUv9TLoEeMeDzYPGk7dkZzWvZbupHDrkXw8vP5jHMkSehy5bqq9NYfV8Iomz0cUdn3fX6qSSVFyBvcjJ3M2pRR1eOXPh9VqzkZl9ELM7QweqACKlckcsDrGq697qNH56cquxGex9+fa/o0t+0skQxOTSrDtGJs3l8I3lXtzRAQiIS/Cw/NCREQ3QcUpL6V18xjgNPnnADlbz5BbbTI8NjNTCQZ28s/o4Qm8RFl/ODjPE3ADHq9E1araL3p8utGrhP0Hq02rplFP2Pqxwz3KlUk7bXSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWlJEW9/mkyr/1D9xZ583Van3fI+23uA/mnvhKMfnHw=;
 b=Neat9pSQrWnT9liWHcrflzQpUsqRQLuyrH8U8bYI1PX/nxm3U+w+v70wBwmXHZ6CBX0YJ2QyXQdzlSZosgzsSfHXEdrxKVCzbdoAfquGof07ntblyqXgBIyp9BewZy7u5psxgRCEg5Jv/GS5Ame+Jyr4f8Mt47a+qIP/CjzcyTo856Gmsvpsi3xx6mVRQHVTzHYQrZq4n0NnX/71z2Fb9fgwnwyJc3S/kZ6aaHdYTEu947h/o7NyKhdfg/GG8EBoXRw3tX/8bgw0Rnz+X5bXDDHYR1ogY2H91kQBfj1NvmThqEhBxZ9osEHHJlVDQX7Fw8dTbAXYfI4H7ONxvkMYbQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB10543.eurprd04.prod.outlook.com (2603:10a6:800:25a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 16:18:15 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 16:18:15 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Peng Fan <peng.fan@oss.nxp.com>
Subject: [PATCH 1/1] Revert "arm64: dts: imx8qm-ss-conn: add usbotg3 iommu information"
Date: Fri,  6 Nov 2026 11:18:08 -0500
Message-ID: <20261106161809.3512378-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0159.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB10543:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d36e3df-f012-4090-65af-08df3c218f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|7416014|18002099003|10067099003|921020|11063799006|56012099006|261028144727099003|261026121527099003|261026140227099003|261022075727099003|261021123027099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	eFMNuAsCVEJF3GEW6MAZkvv0LON6xI7PN76DL1VGbTN51Bgsy4cHrLndJnKivjA1lpVaVcghLXSmlyTUgT3scCHdZteHSvfM3xnUMl6Fj9Yf0KWtQdjh+avOROgdhjE0Xvfm9nLmunG6TeUJTgUlwQkIUnWwuQRUBiNKSonVdHh6B8LFu8zUtf8zR1X9ekVBW/GBOrKZjllxfiR5xEy6Jh3GFD7jAVcFaQU+q5z2zv8663rJQMkOJrnVlaJOejHSKznQ9n98NJ/qqDNq+lMJH65Xp+6Q1cY7zwn0DUxa/JDoe0jvMU4vbt6PV1+ayqUbLJ6olbq0YZQjauviepDVTBSYVcwm9RSV4pbZMzYNR3rrQpc64i8H4NDG1o1jJ5gPOAg4OzzQ/vHOjxjdGVjZBQlcjK1dh9zV6s3CAuIqYvETj4AWWTwWegIYZX/xwhe6FL3CBR/bRbhIbYwtl+ah0+u6tZvSkD7cfYImH+RUs4C+zenc5Dc0FWbQjeH/54utz8g4kRcGcFNgrmkQhckfiumxIwD6gz0ci6fnvS4eOTFduInpoymztEvEqyptizXKY6UHmiP3TYyC0VkjmV+PF85zV6V1JDyAv0XUpftb36jndePONS2usCEfSiw6Jx0Uloy2SMY+bNwK6pG+Ff616qmGuA/fkc6KrYJC0k3D1N0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(7416014)(18002099003)(10067099003)(921020)(11063799006)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261022075727099003)(261021123027099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gSG+Vc7fAs35I3SC6AeUkS2wc0vuXJ4OzdfKXbQPWJlmIyII7Xq2dGZvWURb?=
 =?us-ascii?Q?n8gxCtDiFuAsorwni9waKUC7d2nX6l/0EwD9T1SVOahhMBIPfgpxMG2jzVJB?=
 =?us-ascii?Q?CXvEjmUOU5VaiRBKdmL0/mUQZ6uzwKWTCu5qwUkDiOYzZ3OWuOrsE3V8tpl3?=
 =?us-ascii?Q?wa9HCuorNWIAkoB6hjRY7xiAUN2mCvLWYJM7vR0ANj7oQtIqmvRGtD20QVXb?=
 =?us-ascii?Q?NbFW6Hhkgt7fDfyFq11xpQiiU9ET/nBr/wIs3RvGBgpjSigt15ekc0ih9aV6?=
 =?us-ascii?Q?PzB791l3X7bevJIZMBA9mpNjIu1o+23flYFQXclxD2CODREowYmfuCp5MYEB?=
 =?us-ascii?Q?Kw3BQMnCJz95Kchn6stnpdgo2VJuUarI/Pj/TFGjfB6P/VWj7+Z3Lt8mTMAV?=
 =?us-ascii?Q?mLvxsQayfcLjqmCsNwdxb/nPO1vIMY4Az2iUAT/2L9RA8KtfiUqg47PDD3zd?=
 =?us-ascii?Q?xJEKRJ5VxvolVWWEceyMA90F7mtEf+qXQl/bBvtxUDgnE89XFbo8sCfw5zQN?=
 =?us-ascii?Q?RTrLZ5RnGGEnlH9w749QX1HVVB5cHejPFc1mzPWs4XUSZ2EXdbmbRylKZdh3?=
 =?us-ascii?Q?y5FIL7mpYb2Gk6RuDgehJpNwUUwuA+YSAQBQwG2/lmi3H+u1XdQdsRTs+MUV?=
 =?us-ascii?Q?0iY3WLqLJ2gcYVYShcHhgkFMwrjkwxNckeYR7d6JnhYTOW9r8jwQtGnHJUSR?=
 =?us-ascii?Q?u17ozi9BWonEkdyodDwc4YIBmYKeZEPTgcTglrv3167CNEBnSfnmks3/1unG?=
 =?us-ascii?Q?giH7KmfvZSqgLqQr3pMzZmU0v7PMW7ZEcRFwHZGTLWwcIpiuRRSPxeeQAq2Y?=
 =?us-ascii?Q?tRBDxPSuzJJPZ8qhca8bMTRKw+DQTjByLEkRlOZNHh9qOePHHljcR472w5uA?=
 =?us-ascii?Q?422TsC7prai5BoeVQlt7g+9S3BMCextjsCpo1CBegYJqFI+6xNSXH99wxx9y?=
 =?us-ascii?Q?ED7rZEPW08hxS01+4awgCQdI5HGGvv4k/Zuo+wACiVtJWRS85wNROlne3Dbl?=
 =?us-ascii?Q?eATKrdy8keIOMGHsSqBIxUIVUonZsVEQPSHkn9I9myrQWWrSZy3Wr3aH7vA8?=
 =?us-ascii?Q?MNDyMSpHxx5dmbHjLHkOabuf8vgZBlVGQ9PA56VjWJnSrvxjplLkafQ675gu?=
 =?us-ascii?Q?3vRNV55OHJacO0tZwj+/0B0F9Eq86mYNmHBa+zQW+vWI85kyoCrfIsgRdlBO?=
 =?us-ascii?Q?y2C9lvSH7leXMa857k1LyRjbLpSYkqZsw1lAJTCk7aSQuqk2zd73uKbTkWIr?=
 =?us-ascii?Q?PtWU4lMgWlERykcHBjXmVvxcnGF02TQGza2L08LGDgch8sIkKhd5soEXboIo?=
 =?us-ascii?Q?kW8HekoISbJby6KSnryESLMfEvGYh8cyuDCLVzNJav2Z4aaZA+OUQ9Rjxk/W?=
 =?us-ascii?Q?54UNOcBhzxQlO5Wz9xhLdrZdIzfMdZjiDLKYljslrOpIwWJAVCV+gC6a1SyC?=
 =?us-ascii?Q?po1LilhGGnPx/BfmouHt5VY/ZsUe/3W6mtfi9bboVkowFKaScy31BgaIlRov?=
 =?us-ascii?Q?F8CS8xQmgduQkb5JjyDOq7xeM1TPTBRKElNEdG/IUySPuiQjqQ49F8auccTJ?=
 =?us-ascii?Q?Zv1nsctlxmVWItJnOiwbWd9goaKfK7hBzbXszBuxfupmWirGOE50EQb/cxhV?=
 =?us-ascii?Q?lOXzA6pQSF3672wE0W36FKpVM6XPx6I1FEK2ROhk3i3nqgho2PmGDKDDCryH?=
 =?us-ascii?Q?wR6OXqd3Dywi0HzNI+3lpTx0DWuQ8DWAVzwr0RDYXmW7BHzWxT1vbkh6CXir?=
 =?us-ascii?Q?d+qOI0MmEiFEK4jJ0jm+jJkdTOCnsN7bEJmDHCK79+7GoKBnl7LH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d36e3df-f012-4090-65af-08df3c218f95
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:18:15.2632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yh2xXpEMlS354bXlZtaCe6eatiLeSVyqVbxgap65c/LJUskXDakPQpjQE1lPO7wscKGHYM7SSXsOXbqSVelIYJNaR7tnmtHdtmARyQXB0ajnmw+9ApKVOoyhAnC7ni6R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10543

From: Frank Li <Frank.Li@nxp.com>

This reverts commit 73c3b40e536d9cb624db90b460bc384147576a57. There is
a hack in U-Boot, which calls sc_rm_set_master_sid() to set the SID for
bus masters that depend on power domain information of the node. But
cdns_usb is a child node of the glue driver, which does not need power
domain information.

More time is needed to find a good method to program sc_rm_set_master_sid()
in the kernel and reduce U-Boot dependence. So revert this patch first to
get USB host working again.

Reported-by: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Link: https://lore.kernel.org/imx/b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com/
Cc: Peng Fan <peng.fan@oss.nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
index f25f62d51f69e..1d1cde2bd879d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
@@ -67,7 +67,3 @@ &usdhc3 {
 	compatible = "fsl,imx8qm-usdhc", "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
 	iommus = <&smmu 0x11 0x7f80>;
 };
-
-&usbotg3_cdns3 {
-	iommus = <&smmu 0x4 0x7f80>;
-};
-- 
2.43.0

