Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011066.outbound.protection.outlook.com [52.101.65.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D07247B438;
	Wed, 26 Aug 2026 19:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787773535; cv=fail; b=CvVs9H6PLMlLvLhM2lq91JsG92b8PhplSuFJa1a6jee8Ai8R40wjNhfw6laFzIxBJEgWyDf8xYFT0oAocNybmn6dqCXqrTH84E8vs49Jauf7J4gP2ZESmjWsGFMLsJVFgSJHGlzs4T7tNOr+4gskvaYVI9HJs6mhxW5vvU9qm6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787773535; c=relaxed/simple;
	bh=9NSBxgJpLM1jZuDQ+Xy5bSTxw1uZNwWu6AGPDeBQxAE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XWG2tkDR2TE3GAh0GzeDIYv3sTq2Lyc8YLJrFKPNB8RzdK5py8Ur0bF18yGH3kHuHcuA7/xLZnacWh/fg4FwdF47d9pQJzlVxDJT89udAUpmQmI65nLoZ0l3SO/D4FJdzhczpwwL5cUZ8ye81KzYbiJJ455itYlY6b9zgUV4S1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tWBMg2cW; arc=fail smtp.client-ip=52.101.65.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tWBMg2cW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRCDWZdhfb5lPP7VOnVOyHTqxJ10Ci/EskTXUbyuFcR7tcD+6nApxHxsnODTOuhYLm/2gxG318+hcmp2t4ihqFx3kXrWuj027VOIY1CXQXQ59aUtJQT350fAM5g5+efVTwKrNBJLrWWLLG5R6Wd7nGi9sJCIDVlLBZ+X0Hpzs0yIw7/bkJHZ8DqlMY5RVil9muXpY8+ixIxBh6+J6Z1uG6AefmgNAmcfmQHehQ4TwLpGvmCr/7GgOahSrv86AinKpMDRunzbUeIH5+NE9xeE1dz5nXj4gU9PqsRay3n5kl1Fro6xSCE7kZlbHKtnz+Cb0bQdJ/P6ws9sTXLiesS3dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufDSClxPTlsrvhyuQ2pkjQSTA//rNJ34jHKXrrAvfTY=;
 b=G0UZU/TjBnMuddMoc+AZoNCrL8mMcu9JfD1HZ4n8KLsezeo2MS6LDRwJ+WythtoXk1f1dZ8nZFXKCWcP0jCY2+KmHI171NPPOKhugOTWwkYlQ9Bvt5o0DCSAmy2IPs0kwbOKdkGvgM05IANVuVqRJoxaXiGAwSBtkh1x7uwiJLHfRrPNydGsNLDBCy6iy38r1Jx03/noymdbaLqXw5V4jzHQG78vHUBKZ7bnDdDilgewJr71mK9FeXyEzPEZpF6dD/aoOe8mJ15X7N3jBVxUjr+XP+DEXvBdIhwDXgICiLmfMsDX7wyRQKVrsp0Do5BhAyrxLlqUALFIq4kSzs0jSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufDSClxPTlsrvhyuQ2pkjQSTA//rNJ34jHKXrrAvfTY=;
 b=tWBMg2cWOM87QtWhS4SsbK+23lY8nZZO6tRYSms0FO2s4XVIj9tXvk0DqSgapQew6y2ZCZgvAwusPEuzAB8sVRUNclY6rsMyrke4cAEBI0yhoBBWkIMkR9t1Cbq11gHFw2K1t7N2nAuGs0xAPE6cC1iNNH4DuepQ5+pTZerkIVCajLnGVXtdndwnGcsqVB/ncuLIE+1t/1UBd75GscVc2twNhq/uV2PTARBSRmibkJ1ALXVHwqHGNHaBKkbRaVXbAhgIzBTs6XfAxS8xD9FQcKpb3k3GoCRcPFapfl8qQsqCUusXIP0j6u96rc52Ml6B5swaFIFLz4TEIQr3pszAGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11398.eurprd04.prod.outlook.com (2603:10a6:150:2ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 19:45:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 19:45:12 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Frank Li <Frank.Li@nxp.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Colin Huang <u8813345@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Eddie James <eajames@linux.ibm.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: trivial-devices: Add SDMC DM2016
Date: Wed, 26 Aug 2026 15:44:44 -0400
Message-ID: <20260826194447.3230715-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11398:EE_
X-MS-Office365-Filtering-Correlation-Id: 9049245a-3da0-4cfb-956d-08df03aa8b34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|1800799024|366016|921020|10067099003|56012099006|18002099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	yqZb/ejRh2VD5O6dEAYygTmKkixThe0ZnVrnnPUNFGyugSfc3xRZRyR/HOmuxUV9VJi+ZS3ih2HQuTMJqcbuPn/3189I3zKIaG3QxNpQ/aEnhQHqWFHM1jl2jC5rJrAbHLGXGglwUXscfIoKHVQl95gterIth2/Jge7j7y/AWUKU2O+isELMXkJaDT7+OcZYqPA5zxMdd5MMfaK2V+iETsyPSqopgYyX85NSu8fqxqv47E4Xoa6i6yKO+nfUJGRLaI34KZtCQwXEC9wr4Eqfi2RFPo2SsqcnzkWJT9veCjs/UZDzvcuzwJ76gVDRIqAbGoAgY23/SBUL9lQFpY18BWg1TKgyJ2XIADQ5JA2GMinZi1btpUEtkPtsK5/ovwK01F36V7b2Ab/BouLFlIX159kfVrNoxxYUy2RZglI/QCVQH1xFFz41dImf97LCCHC/YnSlbX8x46h48U3hpyoBRBLJYdqHgq6VXaZX4DuA/T+zqnyKiw6mPp+UNnWNpoLDOq/CRbicnyfZrDeu3vuGrPSX2maSnIFX9ppBcEgkIarl5KPlbifqcZjFPJ3TfCMcT3ubtbSEfO5DAjh9kvJxY9aAzGLUZlyZw/x8RqHL2Prchl3E4dsrBlOLyLPkMr40tV1elVcMhysApRECsC8l0jmL2vK/xGD/2/sST/fmElqa4+6tteCQW8Rt9c72rQbzRiaOLXyCRut5lOhEFKHlBA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(1800799024)(366016)(921020)(10067099003)(56012099006)(18002099003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ryUy3wb18XZJgspGIAVy/Oyh2eYhphDI7+rx9MHHwWiIPIy1O+x7Gw9vq6KG?=
 =?us-ascii?Q?WVSiVZSz/76uqVpZOZ5ccpBgxrX6Cw85wxzHTh/ialj9dySyDhVkmiiskVal?=
 =?us-ascii?Q?cbced1NHnyIqk6OqWM8BQSCvP1W8PU6ltIMQJvsJJNPXo/KWR0xG4miT+sXm?=
 =?us-ascii?Q?tiDSRfXWQ5VHltaKMezEtbyaBLJOIp4g1C5wZ+MoTwpSC5b1+MvI4+nm9xvW?=
 =?us-ascii?Q?wgMu5r8i+re+f/2u68qS4BLGuDef3/NcZlLxF7LLHqFODpgzH9ZJuEvIOm1O?=
 =?us-ascii?Q?OrOYZA1+xlptz9xCPhBACd36LWqGyu6lkLdiRGHOH8Oksc5tdiIIVYLxdzlM?=
 =?us-ascii?Q?UtJFlzApDeHGsSaBU/XvExYaYNJNonanqwaDx+2f4oM2bpdjMelhUKA/tZqp?=
 =?us-ascii?Q?7a+6v2JLV9zUTFOvNNlP9homyoXGq+M5ve/KWzx361PtCBfa/PI02uIk7Vq/?=
 =?us-ascii?Q?ZQbZ134MrUmRDxDvYFErtIZEWH9fEnSfG6Ar5ZOkJGZmCHVolCqX9npAwn2v?=
 =?us-ascii?Q?TXpm7bkh73Xv3NkaBEsM6iSC44Lx8J+zQqnnXPs/z9y1SaL838N1t9wHoaYF?=
 =?us-ascii?Q?7FgJUETghnh56QGPI4VP4vcTsx4yh6QkmMYFTi2aaTOagCOlbQTYwCKINhpq?=
 =?us-ascii?Q?q+PZzCL1+Q1ggGVTpgF5o8wMoz1ikX311uJCQUKgGutSpTuzKOtoA6uIHv+8?=
 =?us-ascii?Q?mecR8hZf3ctnyNTtntGlpVsyI5uwfeYW+o3HLoQ32pUpCiV1VWnhYWSxDeJP?=
 =?us-ascii?Q?kXW7MtPHxEyEw5w8PboN+MYl8fm9G7LmbOX7lc8x3SOag9M5FpAxtOMdmHSo?=
 =?us-ascii?Q?TZKPNKDdZ9GS1SMgM0pkYteiXrhdpfQpXnpaKse13WzIli6E3gelYf6PIYu0?=
 =?us-ascii?Q?bNGCGQybvwIW3AWulKY2fTYqtjrtsaz6gTS3q7i2CXNn3my0RvjT1Jhkw5PZ?=
 =?us-ascii?Q?tz4Binox4rd4SbWgkOpP0bx/j7KY2UWQapStC6YO3EayLGtho3w3EWtp6OuJ?=
 =?us-ascii?Q?OqPGIL5PzqScM0EDr0gZ0ufyDR82JVC9fe7H60+tjUVzRCrYhbYeLvwcY6pa?=
 =?us-ascii?Q?HtrqSfiG4PRKkZzCH/nG8yCET/xSdadSn0LKM6/Z/4W3ZEiKwfgbOdt8GD5b?=
 =?us-ascii?Q?fMPuh5gzRCIeltK15U5Tge26uCVPRumCIXZRzRqfqneqFuE4kpaUuxxundqb?=
 =?us-ascii?Q?E6gVNcxejPAnPN25yYkfvIydWtrn/nH8/6JHwgQriBRXdMBmPTn1buB1PWUR?=
 =?us-ascii?Q?jPyPctFDvB3wepIoIb4zFx7CbjepgFSUWkezUVcWKwGmpS+Y/pJn90zvLD3+?=
 =?us-ascii?Q?XdNRXh1UY/kqGj/tue5zO3zRiVrkkSeApQVFSOhGVOmGj6SGkobNJocCx4KS?=
 =?us-ascii?Q?d7DObQCXqo550hoHFXFm7EyECXpRP7hsUwiGUDtOPGKD9xFyadZl6uyTrH5M?=
 =?us-ascii?Q?FxH/S8wMv4wckiIvlJL3NyEQRcgmvSbCoKQkFuKuqmzQedbHIPtOs3E/dHNO?=
 =?us-ascii?Q?5Oo37+CoI45ns+cVEg30EwuxCpAryNlyb+yrFuRZGqF48h4T4aFNq1wvU0Yf?=
 =?us-ascii?Q?XzKlG9Wj4pT9frMCrZlm+6UN88mrxxEBIUEXpLEaJawKFfVB76aK6/c6Bp7N?=
 =?us-ascii?Q?oQF9+gJmv9nqq2GhCfzmKcJdc2b96TvoFZUFEuOQ8Q+ArZvZbGODVR42HZIN?=
 =?us-ascii?Q?4zV6RHEEMVtA7ZADG+UE5dcYhwybijfS3GwxWxi9UPC29b6frNsiSrpLb9sD?=
 =?us-ascii?Q?E983qqmhENBs1mTQhhdqhxnIOyJE/RLxgdPbiYT744I/y9Vn5rtf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9049245a-3da0-4cfb-956d-08df03aa8b34
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:45:12.8359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msvJV9m+KtDPxkHr8QHf9R+EKAYBuYp80tCGy8VYcDVH/vQb3WHDybFlJ1+FvW+wgXnefJDTJ+gOo1FeqqlOD5MDPB1UJuO71p0qo9iOWBx5nRxzWRhm/TufTHMkj9vA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11398

From: Frank Li <Frank.Li@nxp.com>

Add SDMC DM2016 (1024bit EEPROM + 128bit OTP memory for key).

Fix legacy imx6 platform CHECK_DTBS warnings:
  /soc/bus@2100000/i2c@21a4000/dm2016@51: failed to match any schema with compatible: ['sdmc,dm2016']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d1..05f88cf81d6c6 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -414,6 +414,8 @@ properties:
           - samsung,24ad0xd1
             # Samsung Exynos SoC SATA PHY I2C device
           - samsung,exynos-sataphy-i2c
+            # SDMC 1024bit EEPROM + 128bit OTP memory for key
+          - sdmc,dm2016
             # Semtech sx1301 baseband processor
           - semtech,sx1301
             # Sensirion multi-pixel gas sensor with I2C interface
--
2.43.0

