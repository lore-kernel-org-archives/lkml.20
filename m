Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013064.outbound.protection.outlook.com [52.101.83.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA824E2F18;
	Mon, 19 Oct 2026 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407982; cv=fail; b=Eqb03n5y6WCiYvYy9bf0cdoTuGCBL9dkd6Vd8jWmXEanak1TsWHII6U3w2y5+WeEh8ZfYtmCtv9ZAIjmc9BXqaQNcb/d2aZBPg5zSmHDYcPbR2YdwH051sRJvgyZis6qsvxsteJbgIsmi47CaXeLITMMyIMrQdRcJAUgFiE6ZHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407982; c=relaxed/simple;
	bh=RFISl9+e0K8I25QNui5WKuK9FqQV8/T5Sb8n8GTumdk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Kdv087iCuDFb986vmWPWRZdfYfEv4o23n4syXDp10lh9Ichf4DaUu1OT9A3CDcj+fg4gXWU2ydpYozpC2AFQf99DhlmRVYFu1StGrFLpbE5d85ReRB/oRqMA3qiwgQhmw8i30hcsn3KQq3/mK3LUuCDQI7l7L5iylDwnC9nGMg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=keQrigYr; arc=fail smtp.client-ip=52.101.83.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="keQrigYr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a54X47Z3nFC5mg4lfaFb/XduYAOTzfih5qhx6hu8SRr0X5e1lFcbB9xSaFsGc8BJDPnAlI1Y8HVaVLBUjougI7k9UlZgAgHlcf7nTw9VYSv9ERzWiJEMNeajUlfI8gKsukFFc3Pi9kcR/AatS9sPpRV3tj6yLJ4UBUGIo28uVgXUKT0ZEgMmTourkBTz9Rur1OCRqtpygtzdjbf0LYX6bG134rdBMhi4P+yvlB2QcjYMnEv0F1gMit/08jqlwiwY98uGXOVtPOR32rr9IriaTvKvtHuALw0t+lWQx4JtKAyjJr+gDFdskeGR/cmv4W2WHpxrE87VYZZ7JjQHmUmISQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zr2NYP3ZPnCxxjd5RhTVGtUTLdry9rvRhXbuxtmvf3M=;
 b=wrYmW1mNZpCAb1znvCpmS4qsv2Yi6iCZ5ts0UYF6FXN+B1T8w/LROZL57W0nKwtOg5CYj/4PeVrPbwuVVw/iscKaK0Kk5EbqiYcFG3KYE+aM+YneCkQvnv3xqO6yKQtSyE4dFablY6yD7bWngyQqN+KkyJSTvtOooapdGtl4MUI1Jo0m7M9AOy5O5YsQ9ht0RPdhLS5B4Q2D5IARjjBemCgxLM5N7oRfbeBykzPapIMoThnmI9oljrXLd6lWhtu5WTJGHMS7iwovM8EgXAekqMscvwR/3RLMiz7+K6NCFMDrT60mcrI7zHHJjvNd7nQ8zyOjByvOcxNZVuGlqDns4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zr2NYP3ZPnCxxjd5RhTVGtUTLdry9rvRhXbuxtmvf3M=;
 b=keQrigYr+0a97ikTfu7SOLoaTJ1Wz8DwolXHl//IKdLDDQDAfSc5KdO7YLr/qZ3KCKqvSFpVPteq6o0ZN8vrN3/BZlQ7ABOTRm7IkUsPUwhK4ayicjrMNydaxljvASFavJPqdfGxfMWPlNwHDy8oQ2cR62nU3B4BWAVzWX5Yc/CuwL7zX7m+cAeb6P+H3UKzLz4FKl2mD12cMx7WTfTD0TFOLiq7NLFwW0wPXneBf/1K66/adbix44IHRWV9YSGT1V6L3ir97AuuqXabQ2dYgNWPk4a8R8kJTyHm3sEBP1DTas4Y/RshaXj+UaMHeLZtaQFMTFQ809LJQRbooeBl4w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by AS8PR04MB8866.eurprd04.prod.outlook.com (2603:10a6:20b:42d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 11:06:09 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 11:06:09 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Date: Mon, 19 Oct 2026 19:10:32 +0800
Subject: [PATCH 1/2] dt-bindings: arm: fsl: add i.MX937 FRDM board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-imx937-frdm-v1-1-76d949a61954@oss.nxp.com>
References: <20261019-b4-imx937-frdm-v1-0-76d949a61954@oss.nxp.com>
In-Reply-To: <20261019-b4-imx937-frdm-v1-0-76d949a61954@oss.nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:195::19) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|AS8PR04MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe7b341-5817-4517-d3fa-08df2dd0fab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|23010399003|366016|18002099003|22082099003|10067099003|921020|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	KTa9VxPZ7nI/YbXiRTcZj6dCoQc5CaCdRs10bpSxc6xc05/CQiIb8y4C63pCpY4Pk1gpDPN5DLT0ml6ezy7D5A6mSHtKVMEqw1GYa5PfRksLyqM4v14rDcp5AFqUJhOH896yQpdq1VehFoZ9hz8oakkc0YR8xzy842GK+7rpwEA3sa81MD5C+L3phPUUtPQfYMTPZMKcLKvN3eWDwkVC1TxIUJknC/2toh+wP607RgsBJ4xNn/UOJRf/GSWyI+eUyg4Lz39UC89uNnPa/BkVjh2tjsgnxChGX2SKmkG4vJja3GV3GRhI7fF5WeVgQVBQlG0VSEDL7aN/OVHF6Hpv56sPOrjsVymUFznhITsGuPBPheHjPy5bishzb+WuN0Dg46RSPPA/dU0QEoYrn0O+Dpi6u8yw96btCNAvGXqTpn+A6NANd2D3RokErp1JR3/0m/voDXg7yZc6XrSdeN3sznuVu1oI7hySF2hT0yMy3w223Y2OSKEvssk6YH+wmotvBOAUM8GsgYsCECwvSXkHSk6sYSnO5iRBi/hnfZkru1S0L84YihmOyFz9kN0+BiOQpqCTLkwzH5KG6xX+tX3KcdMZVUVDQIpf9qUM2r+/XmWEW3v8iwhXdpHg45AspSppi2hirxHIp/8M1RRD2XP4l1QP+ivXxtLK7pTXgfjQSCbXlOC/qwlRWZajwLhREu6ZZLZgwzmXzG/zXOG/KVp6Og==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(921020)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L082bXpWSDVSeit2UG95d2hWbmgyTE9qOHFSZ241RHptaGg0elk5UzNxclVy?=
 =?utf-8?B?NFZMYTNDRWtSVFZBbUd1NzNuM1E1OHlTT2hFNnQra2lyRWFZSnM1RXFZU3FB?=
 =?utf-8?B?NDhTeWdSTGU1Qmc1YlI4K054d1E0UThMRTZreFZjbDNjUjNNZWxaWVBhcDRS?=
 =?utf-8?B?eWVMT2E2bmw2V0R2MXM1Vm8xdGJRbWhSRmdEb2sxN1BwOVRwQWlpOVdRTzJW?=
 =?utf-8?B?UXNacTE1YlVQWTFEQldHZ3pTdkhoQkJ5L2JuZXFsVkNzZnFIaHRuOFJXL01y?=
 =?utf-8?B?WWRQL3d3VGJROUxpMk9WVTU4cFQzeDV1SDhzazVKbEtSS2VJdmhwK3ZrVkp1?=
 =?utf-8?B?T0NpNVpiVWR4RzVETmRXU1hZWGJ2dGV2S0kxOStkaUxhZjJpM2ZBVWV4Yi9y?=
 =?utf-8?B?cEZrTGVwWUh5c0JTYXM0dXRRemxOd2hZK3A5RGgwM1VUaDVSZXRDOTZGaS9M?=
 =?utf-8?B?MzRhVHFiNHQwd0xIcFkxTjZFTnM3UlgyV2trMEVoRE03RVZ4WlNYeXA2RkNo?=
 =?utf-8?B?WDA0NEw3QWJoZFdqSlJma1JLdGV3by9sbXdEMXdXc1FLTUcxUWhzaGxmR0Er?=
 =?utf-8?B?VEFMdzBjYXg3MisrbEZYbExUblliRXljOE4rTGZsVVFEOUFxYzFRdzNwcVRX?=
 =?utf-8?B?M2Y0endwNlJnNFg1OWFId2pVblRXRG1tbmpHcVp6SWtNdWE1aGZFSXBCMjdB?=
 =?utf-8?B?dnNTaDlqbDRHMnkyN01GSXBaNzhGNUtjYnZJTjdZZFQvUVFYWGpTVjQ1TE5T?=
 =?utf-8?B?bHEvYUhmR3Bjbm4vZnVGc1VEdWVlWnJ2YmxEUWhpTkF2YXdtNkNCSHFvVGxv?=
 =?utf-8?B?a0EyREVYMmVGK3VxYWlaeDFldFVDMHFWMDhnVG1EWVRRTzdLVmhQSy9EQi9p?=
 =?utf-8?B?LzZSMUNnT3NVT24xajhjQy9oRklLcWJGOHZ2ZTM5ZzdNeG41WUdINlM4YlN6?=
 =?utf-8?B?azd1K2phRFVMZ0NURzZHT2pDRkljU1I5R2ZaU25VQmM5K1F2Uy9hdWh0Z0FU?=
 =?utf-8?B?cm5sbDMzM1JiNWlBTmRFcmhyRUNHQVpDOTF3aXZDeTdjUVY1RVB1aEN6L3gv?=
 =?utf-8?B?QnRLM1k4bHRDZm9WSFUyaFhpUUdqNFZpZU1ja0dHY1UvR2swSHYrd2t4QjBi?=
 =?utf-8?B?b0hNL1pyMWpIL1VJUTBaUUdxTUdNazVveW4xdkJhU05vYkVCbWNZT3BqL2Zn?=
 =?utf-8?B?REdnZkc1Y0VJaWxoOGErZnBQQ0ZrUUlpVlVNalRQSmpSODQycXBoUkZuUFZo?=
 =?utf-8?B?akwvUHY4eUZqNk5zRVdscnFTeEhBK2I3dHRHVjZiQTE0WVhkdXBnM2RnZE4y?=
 =?utf-8?B?MzRmRXhXcFFNSlV5ZUlkNytUNVlnZVFMZ3JjYUMwVzFPekg4eERRcWxXSlFj?=
 =?utf-8?B?anZRK0xvZ0ZVdFZ5eTZ1QXpXMzd0QnhNYmYwUkRsN3F5OFV6ME9FdERRVUhL?=
 =?utf-8?B?MHEwUTRCQVBvQlBuNGFEZ3Y4emFhc2ExZDE5V0RzTWlxeWZaVGhQcTFja1gx?=
 =?utf-8?B?c0svTTNYVzNRSFRsZTk4OEZRWU0zOHZJV0RvSXc2QnBpRTFHZTM3YlNZK3Qr?=
 =?utf-8?B?c3Q3T28wT0FoY1FWTk1FdmN5UjUzY3F5U2l3a21NZjdzVi9TWFNDSk4wZGxE?=
 =?utf-8?B?VzIyM05WK1dCSWFwR1R5Z1JVUC9KbFZ2UzZZNjVLTVF3OFZCb2s3Y09XYkNW?=
 =?utf-8?B?eEx0VlF5V09VblNTVEJhTkFLTm4yZVczMmhNZUFDVkpNKzkrcFlXUkVVMlpP?=
 =?utf-8?B?ZGVFb3NxM2NEV1BTY2RKYUZJbzc3bW0wV2c4a3BYa1BwTngwQWR5NmY2cFhK?=
 =?utf-8?B?MzFEdGhKOE94d2ljN3ppUUJtM2VWMi9QN0I4aDlhTzRGaGZGYTgyd1ZqUU4r?=
 =?utf-8?B?SDBpYjFjKzJUeXZ4cGJUSVd6VDNvaDJ3QlVjL29UdlgyaHh2SHB4K2Y4Ujd0?=
 =?utf-8?B?aVdkaTFiVFppZzhmMDRwRG9MTzFHN1NydGgrUlJPTHZGMVRIekpGTjhZcFU3?=
 =?utf-8?B?UjNsRm53VlBjK1dBY0gzS3FXeEtsSkR2N25JOXVnR1JJdzVZamhvNkxmS201?=
 =?utf-8?B?Wmc4V2c1Rk9mRmZIZUMrVlhPWVl3WXcyeXpFYkJ0b0dxK24xWE00MCtVNys5?=
 =?utf-8?B?VldnbU9oK1AyZmlZYUwvMXBmVVZnUGlWNW1DQUpZZzd2a3pSeTZwZTRBcklX?=
 =?utf-8?B?UXUxMVNGZlkyTGo2d3U1NWVaOThlMDVMOHlpbklTT2tvUkx3RXh3SzhzbnNS?=
 =?utf-8?B?YVZsQ3BGejRRVDBsNlFkMUV4U2JlTHB6MlVoZEJFRGIzaGpWU2N0ZWlTbFkr?=
 =?utf-8?B?TWdtOVR0TnIveW8wNWJoVzhNVks0NFEzTFZ1dGlpaGdHc3hkSm54MGVCVEl0?=
 =?utf-8?Q?4BazqFNdemHEuAdjRnvmQtrCnfmbb3Ifm4KcF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe7b341-5817-4517-d3fa-08df2dd0fab0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 11:06:09.5533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXJ18+Deiy0QyAgstT9Iso2DG/1Q+0WIcU0eUJMP+KPKgJL3k1GzWXQSWt4hG+rD68qd6d0q9gWf8xt4clYNvrmFqZHi3SBoccA2opMblb+z5EiLW+X4SLWf0gjdc4hy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8866

Add DT compatible string for NXP i.MX937 FRDM board.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..af10cac62f90 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1570,6 +1570,13 @@ properties:
           - const: toradex,osm-imx93
           - const: fsl,imx93
 
+      - description: i.MX937 based Boards
+        items:
+          - enum:
+              - fsl,imx937-frdm           # i.MX937 FRDM Board
+          - const: fsl,imx937
+          - const: fsl,imx952
+
       - description: i.MX94 based Boards
         items:
           - enum:

-- 
2.34.1

