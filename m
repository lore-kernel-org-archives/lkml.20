Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1853DD86F;
	Fri, 16 Oct 2026 20:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181499; cv=fail; b=nmlnSx2TH/gFPHaxoedaQER4QRpUGTpU2k3A8LqRH/2ByCQoRIQueIP7OOStlizEoDbMEkPY18gr/DFuagye5sV/lBy6sZYv9G/MP8ZPRSFWjsr21d5t3wBhVGhlBs0LxhOY6O4/cFFgD0lbASS0ZAqDwMM/ZLmPRmqtrGpdDek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181499; c=relaxed/simple;
	bh=tUgGHngCP4opA/Fwf9x7S85YOo2fY39JcfmkGjTQUFk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=S9JnL/yGffqMr1yH2RntMK42fCduokJwDKVu2bn2pnq0ulALDSUqRhLC5PJpN5byZV5CojWRSdbGGApsxv/VtSnz44BJ621HEILkin9dfVGItrb63Xr6dVv4zWpWgTn/3koXaazVqi8oEvBJgipd5AEeS2vmRDnwgCrLEJ4mUvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hy4E0A+5; arc=fail smtp.client-ip=52.101.72.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hy4E0A+5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0EOP5OdvBWKO61yPTHWam1hFuRhKelKFGvXx9jJVsFvmIrL+WgjRFnLTWCnR5q671CJjlGZ0Ifsf9/YkqNqL3uzBcXWiVg81nDwwztxIyj4rtPgx8dhMsdRMR+bIcND33zgy3+wE30serMwE910asJwSHv2GAE6UTnJ18H5EHSAtj6en+0FRW8uH1EJFV6JahLwsLZST2yXhpX1iqbySM3HwQ200YhxwniX50ipzpi3aSI2h4gTC2xFoE639ib+JTb8vIr/UbvHBRbOn0NxzyNVag4TGOdDouBI31+Mux99aNb/HEo1PggeNH5kSo49INEfLxc/Edah7L1HYftKSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKJZm6l1Dl+4FczBOaToXFKmX1nLaB6tX+FDeAhZ9E4=;
 b=XUJnlsa2YQABEueZqwAX9qtj4Bvc8FDPBvjP8p31w0BruxKVAcRC2KbvDDKGiQz9+34MW7FZ4nyeb/luZkgo+Dp/nHcZYO3SSx+g4PmvEzrQ3MbbthZLLEscu0hSbiE2IVvHXCOvKChhz80L92Cmw726vSmjdTvlrxCDW4vfmyojncoPjRSlgkHg14p0YSf+hKL5RpBOw5FB+BWf8hkBkOHleTmoemntf+Nxfyh8H448TnFBTgpwRyAVwkjg++/FOG3SToEdT0Vm902NYqHC6Ek+oT8WzHSsC/euba6nXotYx/275opem/TJa1veUbT9sf8KKDnXewyTvUpbn877xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKJZm6l1Dl+4FczBOaToXFKmX1nLaB6tX+FDeAhZ9E4=;
 b=hy4E0A+5CbVSgTYeBJ3JHZEfoKlq8mGVz+bBwx2MJqClYTzCALbJBZddvz1CvqbtQzE7vksqQSsKGE+9sEB2DCvydBGEgZNiO89NFpOP4Ox0yZnMlzD8jxw2Sb26w4pUgwxUePZU5IdrWkfcvnVwJGIrpSVYoRPKkECkXonZnx+gkIV8ysZgaEDoWuV9InPp/v1D/eMTM5e5TvC1dyKVkeOj88M44i7ia9byzufUt1g7znB8TCNDP76mGc5g0mvXPkrnVvS4lU0SDuJnVDy+pXk/OExpFzzG+JHeRfhy9o2tSRGaYAq2TJX5PnOdjjNYDrRew4YTdE3pj62HkB6zXw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 20:11:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:11:22 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 16 Oct 2026 16:10:48 -0400
Subject: [PATCH 05/14] ARM: dts: imx6dl-prtmvt: remove redundant panel
 compatible fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-arm_dts_cleanup2-v1-5-3a0cab9fd784@nxp.com>
References: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
In-Reply-To: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181452; l=1011;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=z+blePyaflTzhKBkmlGQpnlni1nm7PW4kfJohFG0pBM=;
 b=1TcJGtDOZKEhj2vQhxnS0yWq8a0WrpM1mKShXDTpNMCi1j+ADF2LHrQvJcbLc42cs136kbQkk
 7wfGOXQu7YUDlITBP8rXeyjMv5ofHiQiY2GcnabI5iihJ/7EF0BUovG
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS0PR17CA0012.namprd17.prod.outlook.com
 (2603:10b6:8:191::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: ec95fd5d-b35c-43cc-22cb-08df2bc1a5d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|23010399003|10067099003|18002099003|3023799007|22082099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	RsOvA9kgiJsiMmD1x0iJFkphMvJ8EP1AmaHvopKja9kJP1J0dlx3D79UvlKBMCBe1LQ4F8dWpqG8vrRwcUGckv4NtPLvbZQS2zt8LUCGmzcLJGaO5xl1auLTmD79NSsa3lGB3KPXQ2xwygefIpeUmbsUVbSPLvf+r7QoQSzkhJNG0ww5UQrmAlxXhcyQMcBiJZYNPwLhHYtmZoegJOkvM/EtHzn/NMXV8E0VaHo7OJzoS+xCMdqZkzUkmT7mjnXFFERIR4YUKnNswUyPwPHyUiC5fjQPf1G0+loRS0NSPmlL+w3cQlYEak83xuk+R9vx9zNOpr1XpRb/b4uKAMvNHRhpaKPZPaWHyXFXLrv7PXhdXAE6i3izXytJd03qP6DBtF3EvVuyVynZrJDrIq5qlDKYjaOAmv2bXK34DbgYFwEIgTYdfMpSFvlaLer2bKqdFjqRpVZconczvCwKZyDgpI8x6J/RSW8LaogKyMNtVwSZngXQZt8HIOw+pbCg/CUDEV5pXRW8c5adZWAYoJOe+lRZh5F5KuRSSiJIvSy0+AWQGzZq59MjJKHjV1BpWH6xX2ZsxI+U148AftcAmMhMatXvEpKRLar3LQfyhDdTK+jBxDozwNBJ3W2Ri5tRCWE1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(18002099003)(3023799007)(22082099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnJGVjBKRk1NMmhWMnNtS0dRYnJqdEtoWi95Tzh1cnVJUnQrbm1MRkdMTncx?=
 =?utf-8?B?ekc1YWVrbUpick1rVStxcVd2ajhRTHorMS9zZmhha0lIb2NJTlQ4OVBFTWZq?=
 =?utf-8?B?WjVYUXFGUnZPVFYzN3YydnBYVys3K1FSdVlVNWJBS3B4SlVFcU8zbUZqa2sx?=
 =?utf-8?B?RENrbUdyUkkzdXRjOUNBcndlL0UvREljMEZpU1poeEtkdlhjdGJVMUFGdVR5?=
 =?utf-8?B?VjJxMUkyQUhkcVc5c0N3V0dtZjVGYmNvM0dCaE1UTTl5VkZRR2F1Tk94a1Qz?=
 =?utf-8?B?Y0NkS1NobnA1dmZsUHNmV1kxYmxMVE1Pc2x4VXNxempEY2w5dFF1Q0tpblFM?=
 =?utf-8?B?NHJFWlVFN1lQTklnV09CdExXV1JHdWFNUDZJenJkOVdYd2h2MTNUYUw2UVJ0?=
 =?utf-8?B?NkxMOFlpMkRycGJnbWhSN0dBdEwwZnVydFhvK3dKbEVNckt2WVM0cGlUaDNz?=
 =?utf-8?B?RlZ6SnBpQWxZd01VeU9icmJibVZScEhKUzF5Um9rM3JiM0xTQ2JEeGVUYVNW?=
 =?utf-8?B?anU5SzN1STdRdW1hUEJpNGQyNjE2M0R3bGx0TVhSYit6RXkweHN6QzFTZHJv?=
 =?utf-8?B?YURuMlJLdkZaL1l3cHB2YnBBWmpqdHY4QjJJMlJXQnNOeDlNbkg4WWRFUjNx?=
 =?utf-8?B?NldFUm5FTmtZWDZVNkVUdllHWFNzWDFrVUt3MUd3eTdZMks0ZmxJQnpQdHBo?=
 =?utf-8?B?a0s0cnh0WXhjU0NBQ3g5VjdJbVpFdzVmM0tDWTBHZllHaGMzRmk0bkN6Yk03?=
 =?utf-8?B?QzV6YUFnUWcrR1FucmhpdHM1d3JsdDBMUDErUWtjYWRGUmdzdzVDMWJkVE1a?=
 =?utf-8?B?a3Z5SjRIaUY1M0dKQ3o5LzlmRys0NUJCRWtwd1N6Vm5wNTdVVEpWSmIvOHRn?=
 =?utf-8?B?YSt2eGVlRTYveDlWVlR4RFhxRlpxZDJVR2R1M2k0V3QwYStMSnYvV3EyQUdX?=
 =?utf-8?B?Skd2NzYwTlduM1IzUHBFVzMrMjhsWGk5QzNWeEh5TEdaNTZNc0FMejBDc3U5?=
 =?utf-8?B?cVNkWklaL3hPZjY1dWxtNkVFN1k0YTJ0eVByekJiUDZpVlFkZTR0MHVwalgz?=
 =?utf-8?B?SFV4M0c0L2VlVHhhdHBJaDY2b0ZFN1R4TG5wYlYveFNERDJnSkowbkVOZ0Ny?=
 =?utf-8?B?TDdBSlVZbkxka0swL3FURmdNTEJ6YW5EZXpkK0xaM3JGZDh2MjlZa3RSS2dW?=
 =?utf-8?B?clEvMzlSYmoyM0Y3SEdEZWlmZStXdlJid3BFYTAzVnJKQ1huWDdtcE1UcWVi?=
 =?utf-8?B?ZCtjLzFDdWFRaC8xUm9VNFp3Wkh3ckxQZFg5ZE1tdXMzckZlNm5xUHh6MXpi?=
 =?utf-8?B?cXIraVpkTmFvZitQQkYzdy9oMnk2eWJRUy9JaldGL1NYMnVqQVhFQjdTQTBC?=
 =?utf-8?B?QlZtbm12dE1FWGwzMDU4UUpmVUxPVnAvczV0c1FyYmNleFUwQVhRTld5M1Bh?=
 =?utf-8?B?bjY4Z2g3REs0dFBlODg4MGsyT21aM3JMQ1F1VStveGs0ZWpjYUFCd3h4UFp2?=
 =?utf-8?B?WWRqQjFYbWNUaE02Ni9xMUhYaFMwMWkxeHR3STZzL1JnS3p1OG5aSDFlaDdJ?=
 =?utf-8?B?VUN1V0J3SkprUE1uR2pMeko1VHZTWm95V0VpczZoMHFka0VCaFhKcjNKOU8x?=
 =?utf-8?B?SlAzZ1doTHprSDlVeUlhMEFkcnRCbThSOGZnbG04RC9EbG1KVnhwd2d0Q3lu?=
 =?utf-8?B?Q1BsUmRuR2p2QlFheUx3WGRiTTlOODhlaWRNSkFCNHQvSE9jOTJITnNtaGlv?=
 =?utf-8?B?akx0SnRRczRKRWREbVNUVW9veU5HOWR4ekY4ZjA5eTZmNWcxWVNqRGFOMWlS?=
 =?utf-8?B?VHZZMWVOL0xnU0t1aU9NbXFMdmh0UjlzY0pXT004Z1ZFRHlWb1Q2dDJ5cWVs?=
 =?utf-8?B?NGR6Zkd5YmUvZEVUcThhazZJTXNPbGNTa0dpd1NkVGV1eXIyWUpsdHVQKzlp?=
 =?utf-8?B?aTVlbSsvMHlqblZHcDJNRk9KVHRKSjQxbnB1Q2ZmMmdrMUg3dHdBYWxkbjNC?=
 =?utf-8?B?aE5sYW5uaGxqU2Zkb2U2emRndGhRZ2Z4NG95d2FiSGcyZi8xNEJ6b1Zoa0Vy?=
 =?utf-8?B?VmdPN1dTOFVXcDNTRVYxeU5BSS9UbzBLeHdpcS9WdTRCOFh6MVJMN012SkdV?=
 =?utf-8?B?WHVnUUt3c2FZOXlxa296UmVnZUxPQlV5UGF2Snk4QzloN3A3NWhYdjJwc0ZQ?=
 =?utf-8?B?V0Z6K1ZnUlhZZ28xOVh6R0dESWJ5cHJRbkRuY1dlNTNQRVlSQ3pqWkh4T25F?=
 =?utf-8?B?NHFEcUtVb1g3UEoxNUR4WnhYUXpTRm00S2kyZG1vVkozdEZVM0NUczBtc2JQ?=
 =?utf-8?B?cGR4Mk9UNkI4NTNVamYvNlU4UWw2L2FTOVFIMEFiNUlUOS83NS9XbDgxaGhI?=
 =?utf-8?Q?pRxagQApdnEVDWt4F34NhfVv4ABXVwCpsYJHl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec95fd5d-b35c-43cc-22cb-08df2bc1a5d7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:11:22.2146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGC0e4FFmCCX3/6e35G9YpWGQkgAd3X8kpByUBOAEsdl7lPtQ0rImM7NnSo4OgO86t1XnPOiF954O73LChB75VAAQS5DRHpExhQR1bnYQiX7RCliRwQUzcSRQ58ZrBYg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738

From: Frank Li <Frank.Li@nxp.com>

The panel-simple schema allows only a single compatible string. Drop the
spurious 'lg,lb070wv8' fallback from the kyo,tcg070wvlq panel node.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dtb: panel (kyo,tcg070wvlq): compatible: ['kyo,tcg070wvlq', 'lg,lb070wv8'] is too long
        from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
index dcd5a4099c602..4896cd3deaa98 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
@@ -178,7 +178,7 @@ led-2 {
 	};
 
 	panel {
-		compatible = "kyo,tcg070wvlq", "lg,lb070wv8";
+		compatible = "kyo,tcg070wvlq";
 		backlight = <&backlight>;
 		power-supply = <&reg_3v3>;
 

-- 
2.43.0

