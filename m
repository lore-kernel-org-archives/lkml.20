Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011059.outbound.protection.outlook.com [40.107.130.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F17B38734E;
	Mon, 31 Aug 2026 18:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202238; cv=fail; b=RKg+hrPzQaSpbPnGdK7oqsBOh9i2TmNP857qZdaIO4FKwm1XaPF4PbtyueOk/FJ5egWMBGtJ7h7ky2j6banN02+MDgDyZtt/ECQwqX86IMY7mVNXvHLKXX8uWl5K1DImwALzgnf0s4j27DnamWGsbyqM1624+QNgN9tOqnSO6uU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202238; c=relaxed/simple;
	bh=gMhCWxLJLDuOc/b9t/QLFvwaqBlSDhbmtRvAbsnnuH4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LEfr9IXA1xMVAhUINkvateyPeoG8/Z55XSz4RhCoMxLs3Xpi1hOA8Yag9iMguXUi11yobyxZZiLKxUHZ3GhiXEfLklaYyKJPorMweUHXhoLFsLFRuGPL7o/+PWdGIeAbr3Rc93CV9iHQS6num+GFymcR7mYXyU/zzrrFMNXQImo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=orFHDc/f; arc=fail smtp.client-ip=40.107.130.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="orFHDc/f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUkETK1yUY3yIAqu7mrorTfpFJ3GN/IWAVLdWL0nTmsnBXa6P2sV6V3Z0uSJBiQW7geRlLGXeaTKQAxAYet9ljdhOy/kXhhMiR5rJkUnm9fpo/igz1Id+hhNLsQRNzMO8qffXtWJy4R2nmF0G9DMo8vtg5d1XM8zE6NlUWFDXfJVag1PZmOvoMOulR4jjQ67VaB0fZYi+a8i9grl59L1b6cxnOmkbXn0rxK0yIDPqVgZtWmtHGTG14BtPFOP7k315ROKbFcGi3dWnXbaxdgWBvD2yEko5XhfIGzBkUsEAHZZgfVl0L5B2lUTbdDy40T/9DPGdW/0QDjJ0fTt40tD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmZPaNQUt0fjxQgNYU4dj4nrEoJ2Dn1yW6om4MLE3BU=;
 b=cUUzqjMVQOytVgBGWgsNmW282nALEujzifBdav4k9y/drHxkAdaPTaSbmW0CVfbEee9Ag3VO0i57UzviZQ+5AINnzP0V6HKy5OOpScxXI8hnEXsm+BkZdqzqCsZBzgChxCi0Xps0KN2Jf3nDbaEcUC0hNCjrosDCAG8dchgPpZX6H5mebdjfePmc7fqy+QMd+dogRqTQnFsQTKPofFoaTJ4b76QL55pHjZGqS44PNQfq4vdwNFp9RYDlodg4M+DtczVdY+M4r5Co0iAgJ7piDfNJJkJWaOel1pGEclQVaIZsWbDDPMyHz8HUp4VwmeG+1BziXIVoXFeDY4JamTkF8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmZPaNQUt0fjxQgNYU4dj4nrEoJ2Dn1yW6om4MLE3BU=;
 b=orFHDc/fYjJeWCX+Q/TurHRJoRT9nSP1ZT6Z02N6P+fjb+vxBLd8ZP4TzKuUOrUbbUuR3XniGsNIOZtRzh33vBxgqmOYv2g6GMLuZQqyXR7ktSOb4ibPxbZ3hhxi+mBGI+w2tNHHfRedEltgaXrM5GBsMFYVQ52ujnu7AW9zDWn8FyuBPsq9WJ3EsaoQYr+FJopCWBlJCkuhUWyqME1zlkvJG/HLfZR6mHzOUqCsyP84Pcdke2uoHKCmSdTMi30k66tGPmO6sL54pUKwHObz1KxN7pYIEmUBwXfNKL182EFDGrF13YETgduOAkjJckbNUjPqeLChR6TvsYWOpuFhxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB11994.eurprd04.prod.outlook.com (2603:10a6:20b:6fb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 18:50:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 18:50:31 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 31 Aug 2026 14:50:18 -0400
Subject: [PATCH v2 1/3] dt-bindings: mfd: st,stmpe: add deprecated
 properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-stmpe-v2-1-f93d5f080443@nxp.com>
References: <20260831-dts-stmpe-v2-0-f93d5f080443@nxp.com>
In-Reply-To: <20260831-dts-stmpe-v2-0-f93d5f080443@nxp.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linusw@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788202221; l=2164;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=DED/3aTQL7DoDRJrlTu+lvxup/6zrxTFJEP+LgzriyM=;
 b=X7PXeNZ/bjkPgCDWWXz/k5tyn1+wq7SPDC8n0ICB8WA5l8DSTZlLDcN0ITB3LVuzIN27SEOpj
 N/AgDR7nT9tCKU9Sy2ud8z/rYdFQFWKz4yQ/Zr0GqGbjBLt0JHDgDrP
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: CY8PR11CA0023.namprd11.prod.outlook.com
 (2603:10b6:930:48::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB11994:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8b4deb-eebb-4801-1324-08df0790bb91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|23010399003|7416014|366016|921020|10067099003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	hiXShfPNY25CNgTinOwpfGJTs2f7FVci6ItXi+I0ZOj02DLHsg8FYPQl1DBLfACmjr6ssZ2DQZ63EsmSwN53eeyjebgtYfOKJrwtSfobjZTCJoc1IcpF68Sufs2ztiNLBZ4ny3wvLEbXdDCFgn8i3+Qy7B4wc9DRytFKs5N4cwqlbhsULrqMb87+RzbUd2N3qa043NqeA38zGLHRwdkp3+nr5bXh6sqFYe1ln27x4Lm2ugVVVWLIsVi6HH2t4HkpxFFokQbVtnggVqPaWmYuoDsnSn4DxAKG2+hHBMGq21FMdOwbe9gcN2d/sQT61HeFXknu/8v2dhkF8uteTqUIxlwh8MdAEBLdbxchQZnw+G1+Xid1zMqN+O7WJBPhnEPqK3SNFeGVyplb8JJwIHs3cItgnyckEvUFktr+znXE3SG5e9jZQ4k50Pao05X2I5FXRyQy7k2GQnG18teCg1RY6eSSNVzmW23+GOQo2AeswVPrmsYHBMkkoRYaJnPmq7NK+YhzNh/amz3pAf3t+XiF6DTC0Gzf4tH3WRouPbWttxT+3rw+4zyIXnM3zRqky0oURWYfGym9jFwG6f7szCOrH07QWZRlwjSlsBFhfMPdq7t3Y+03en5m8zuP2iez9KGVHZAfZ5ulP5MweECJrq4XBx5L9Tueyz5uIWKqOxIk0+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(23010399003)(7416014)(366016)(921020)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1dnTWVKcW5jOVF1QWlzMThRL2UyUFMvc1hZVFA1OEN3K3pOTC8rQWtXT2xa?=
 =?utf-8?B?Tk5sWG5hdGFOSWJpeVdMUEZrczd4WXlySGN2MzlKMlZmZ3FFR1ZvblpscEUv?=
 =?utf-8?B?eXNDd0grWTdzWXdraHpidHJ3RXNTYmNGRWM4aW44RmZOcUxNTmJLVjMxckE3?=
 =?utf-8?B?aWZzTDl1Z1lSb0JvME8rdkhXb2JWRlpGV1dGVlMzMkpIL1NzSzNONldlaGE1?=
 =?utf-8?B?NXd5eFUrZk13bEZrcmRrd2pMSU9GUkQ5UUVNb2FzZHBKZkhJQm82S0podHM0?=
 =?utf-8?B?My9QZVRaalgxamdQbmlyYmJ3dHBkdFVXK1RyZ3ZJbm13SVg4RjRkWEU1dElQ?=
 =?utf-8?B?aE94bWpqVGxKTHZrUnJpU21sOGs1cTRvUTlSbWgvaGVxM1Bwd214NjJVTm5j?=
 =?utf-8?B?UlNCdjJHa1ZERXBWeE1oVHdUQW5jSlBDRGRyZTM3VG1wUnVQYktvUFNMOFhk?=
 =?utf-8?B?b2R1U2dGT2dYNG9HczYvRDRzT3A1UVloVkZudFg1MjY5d083SlBtTndEQWd6?=
 =?utf-8?B?T3FtZVo0ai9rbTYya3lWa3NWRzAzOW5wZ09ZRm16QmdOYldST04zTDd0Qzky?=
 =?utf-8?B?VkJOdjNUUHl6OEJPVHVKb0F6YnFWOWhGYWlYd2tYMmR3SWVFank0eTdNZ0Jq?=
 =?utf-8?B?SmlPRVJCVFd1L2REcFNpa1hYWEQrZjJ2TzB0RFpzRHRUUDhHVFYvOUZiaERx?=
 =?utf-8?B?SzhkUkdCRmdJQlkraFkrTFFaNGY5Wm5rUllCbFBlSHZUSTVkTzN0TmczUDdh?=
 =?utf-8?B?cUI3NW45UVNuNTNkNEhJYUFCOVdBSndYcFJpeGdPcmJCYllWOFpwTzJQTGE2?=
 =?utf-8?B?eVhOaFBqTWtUUlVtMXh0aHhiT1BlUmU0Q245ZTVRdEVRaHFtb2ovUlZKQk0r?=
 =?utf-8?B?UDc4alNyNWM3b1NJQmNoVWFDaVROejVCN294Z1FxSWV4WDFBYkd0b3hkNDZW?=
 =?utf-8?B?VVpXb21LbTNzRXF6Z2lURER6Wi9ENXovYWdKc0xsYnZaZDhaelIxTnZLRGpz?=
 =?utf-8?B?SEhnRmsvV2dldGZEYVY0V1RJd0xzMDRRWkNMNFR0R1hJUFp1SjFSZi94SGVF?=
 =?utf-8?B?U1dPVlVBNGQ5RWFzTTZJOGdmNUZkNUluMS9WSUMrOURwZGdjWG1FZHk2L1lv?=
 =?utf-8?B?bXVtRTg2NG5xRXo4ano2ZzlTWm1QYSsrUnJmV2gzQWlzaC9hMVp3dzNsdEhm?=
 =?utf-8?B?WFp6TGEzMkovU1R4Z0ZaRnAzQ1ZUZkdZVFgyZ3hkWnRaQWZzeXRyaXR2bFNM?=
 =?utf-8?B?UEEyUzY0czd2Q1JxWFVOY2pBRllRaHRjV0xBSlBSQ2VIUkN4K3RnMG41cEdQ?=
 =?utf-8?B?T2t2WG82Mi9Ub0x4S0lLWkE4Sm5CSDV0Z0MwdjZ3VnUvOXFLMkdEcktCMytp?=
 =?utf-8?B?ZTR4Y3BwT1IyeUFZbjY3M2FIYTFzK045bEJQR0t5MDBTSmJIbTdncFlRblQz?=
 =?utf-8?B?eEZIRXZ1WUNzN3F1b1ova3hMVFhlUERtb09FLzU0clhaYnhYZDdLSStWd1Rk?=
 =?utf-8?B?NnM2QTRaTmp4L1NNUWRCRGo2Q0Q3ejdPUkV5cFlBOEx0THR6YVNrenFPWm5G?=
 =?utf-8?B?YlRTVW9WRFhsRkF3ZFBMUHdrQXZvanJDN0ZnRkVlRVB4SUkxWWMrYkFWajBi?=
 =?utf-8?B?SmZ5QkdEUzZ1U3JZZzZwQ1h5eFgzU0pxR09Pa24xM3c2NjM2cFlBVXJhVGRM?=
 =?utf-8?B?S1VYeEdSRkZyZm92d2NHb3RRdzM2T1lDSm53NWRJOE5CWnF5NVpZTXlmdElB?=
 =?utf-8?B?aWJLTFFzU1pFQTkxMXpqSUhRekNYSEV4OXZITk05dzFQZDE0ZUFBbWFGNVls?=
 =?utf-8?B?aWIvRlR4R2h4dk1yZERnRktudVYxQlFiRnFNVVFGTFIxdHNxemx0STd2R0s0?=
 =?utf-8?B?Znd5cTMrK1pUb0Q3VTY2cWdQajVmTG1WdzBNNTFndmh3eFpTeE83OE1tMUdh?=
 =?utf-8?B?cVcyZWF6ZXg2dzdRZW9Vcmc0TnBSQ3lzbkQ0TytaRmdHUk9vdUREQlhJK3VO?=
 =?utf-8?B?aFh4TWFBeUlTL1N1eEVkZEJZSGR5c1BPd0JKKzdJcEM1V0dnWGtzeHYvTXpj?=
 =?utf-8?B?SFQvYjhsQTVhRUQ5R2ZJbnhaeEhmMVBHUFN2eklpVDJZV3BScEF5M0RxRXdn?=
 =?utf-8?B?VXlMSFZUS3F1WEtKb01hYjFia29uS3luNXBMaVBsUUpGaTMyemZheWxaYUpH?=
 =?utf-8?B?VGN2Y2JNemRKN2Y5ZHNKSjkzN3g4ZUFwQ0xIN2s0WjhhUk4vYjFrNitoYmJh?=
 =?utf-8?B?WG9seE5mTEJ5OG1HQ0JtL0tzVXZwK0dwZlNvd2JKSW52ZEhGd2kxdXRMVTNk?=
 =?utf-8?B?Y3FHRWtlLzlodm1nWlJlOGVFd2ZaWHEvSkJ4R1IzUDFnbHRWUXJUWHQ5akZo?=
 =?utf-8?Q?jjRR1GG641NLg21ViCuqlq5dOUPlmV3LXZRlB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8b4deb-eebb-4801-1324-08df0790bb91
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:50:31.4675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XeeyHAM0SMh6c39944wQyuM5ubUXzlivsph0rZjH1xrH3tgB+XxdQgpn+OvLN1pof7YFgiOxbVGjCHBHGzdGqcS1UeoPWNX7t8Ridhr0+nO+p3M4ocKM7X43AYm5jR+i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11994

From: Frank Li <Frank.Li@nxp.com>

Add deprecated properties st,sample-time, st,sample-time, st,mod-12b and
st,ref-sel. The both driver drivers/mfd/stmpe.c and
drivers/input/touchscreen/stmpe-ts.c parse these information. Some dts
put these properties under mfd, but some put these under child node
sample_ts.

Allow these properties put under sample_ts and mark as deprecated to fix
below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811): touchscreen: Unevaluated properties are not allowed ('st,adc-freq', 'st,mod-12b', 'st,ref-sel', 'st,sample-time' were unexpected)
        from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/mfd/st,stmpe.yaml          | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
index ddb27ae64ba37..592e8f17659f3 100644
--- a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
@@ -141,6 +141,30 @@ properties:
       compatible:
         const: st,stmpe-ts
 
+      st,sample-time:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [ 0, 1, 2, 3, 4, 5, 6 ]
+        deprecated: true
+        description: See top layer st,sample-time.
+
+      st,mod-12b:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [ 0, 1 ]
+        deprecated: true
+        description: See top layer st,mod-12b
+
+      st,ref-sel:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [ 0, 1 ]
+        deprecated: true
+        description: See top layer st,ref-sel
+
+      st,adc-freq:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [ 0, 1, 2, 3 ]
+        deprecated: true
+        description: See top layer st,adc-freq
+
       st,ave-ctrl:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [ 0, 1, 2, 3 ]

-- 
2.43.0

