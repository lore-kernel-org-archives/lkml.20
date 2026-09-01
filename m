Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9A232937A;
	Tue,  1 Sep 2026 22:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301588; cv=fail; b=pRyAaO98f1dGdzScwiRRrGgtetSM8rbC1vRyNVgPZ0y7hLwxw4td6Oq2vfXNQ2VCUcMjcYRHtlnKAEMEl581pnJMy4Sk+6z3z0arxBiX2BSQ583wYIZ5ASXSGwN4kxVu2n5XNcSyFE288AgsvAXY2JzN96WFdjfeJZgRHTYXVM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301588; c=relaxed/simple;
	bh=k4jaTs8Syq/ER2yqMCUL61MXNk5sm9+ChBl5Dj0L0rk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XfFqO/0ubREv01klxpIbYcdv7FMBmbyOjqetq5xNa+jvs/o+1bpA4o66QeXsl/YPuBIiQgaKdtKfL0XWY7ctT20Cj50uQN+/HPqzTY98XkunmdHGXv7K1LOVqXWCa3dQgVVEiHhipHzqQV6uP21g/0UAy/owYtSGX6j5+R2pJm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Cl4u+vn9; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Cl4u+vn9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlvX6o9HSe3l0OIpqFT5RYm59KRtNBWIiyrHV6QwXdsB4OOxqLQ0TRzhBuonwVln/m8wRIQ25tSHukm4pmwFSyUeOhxqYs8l3NYyd1r02uyZIppJgC6HOfhHTXFRh2jc+n3ipNpVPbHoOtfq5V5Q3Bmx6AwteKXUmpu+pIm46do8kWFWLur/9hmKBWfUWJgdTAg/hg8KcpVI9Kb+iZcv3/6QW4ca5NgJuWNgZ/yCeAPeovhLqn75+Z+CVHo97me7cKBSX5Iv8EkpLD+KbCpUSXJXMsHrVomqvAB7aGUwZC84qoCyC/I5qsDGdyStXCxz89qlrIpb63Ff6fROJvKYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5f74jZdFpFW8DT4vyyike/T/vOOcQ9tTia92PhypVUc=;
 b=lOzRruNrBZU6WKl57ysjz6BLmFFfUKzF7FFXhOVuFGYC9n02QLdQ/936BK69b0x8yYd13Tq5jgDtf1gXpcFKv78C87fQ9zTa1+nuUKLAxOFj+aPTWKax2fH26XMK0IiEYJieisv9/JXzI6DuixrERcqY3TfP0qE5ARZOHV+Q7jXunnTRo7yN9vdF7qrmnPqs9vYpIjDvcl1hVmGu4jOGV2c/eH65gtci9Y8qzsZaHleb5lRsFhZ9X+mV3wAdq56R64xSqlqClYnx4OrpRLtB1P4hXdRd9IFOrr5InFCET3pK8uOUT3roCf5EMcC6wyna+yczDcwt7sufUdbFhyb46Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5f74jZdFpFW8DT4vyyike/T/vOOcQ9tTia92PhypVUc=;
 b=Cl4u+vn9jjM0TkGQd4+F0uKxTCc9UClzflJ9Ns9T3KqDWJd0oce0MHWPHd3g9sQNrS1ATqSEcM+NgFO7yykND+4tjHlFm7z/XxPPZ+858M2E/+S6TB9UygAnzqpay89ttKy17q+2e7P5LY750qXw3+sgUDZDUrBmWEd6PB/gfHwFR+va7NntfxtZttqk2pZqqTuUzCnKKoZtIRrpN+8JwC9eCRzmhHm5PYW4N7D38fPoPPJfY7nusOH/U8iGbBgsmB60X/uNPcySb1PDRUtc7Ug1rpcQuDn2Y82Q4C2mk9SqKqrFqs7ugC4uVn4uBtX2ytuK8pOktQYbpLYzjoTWvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MMZPR04MB319484.eurprd04.prod.outlook.com (2603:10a6:190:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 22:26:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 22:26:18 +0000
From: Frank.Li@oss.nxp.com
Date: Tue, 01 Sep 2026 18:25:39 -0400
Subject: [PATCH 5/8] ARM: dts: imx50-kobo-aura: convert sd2_vmmc to
 regulator-fixed
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm_dts_clean1-v1-5-db741f37a1f4@nxp.com>
References: <20260901-arm_dts_clean1-v1-0-db741f37a1f4@nxp.com>
In-Reply-To: <20260901-arm_dts_clean1-v1-0-db741f37a1f4@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788301547; l=1508;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=/rQl60Iu4Wly5V20WJ39lhCwqIdRdzuYfEtuk4RU8WY=;
 b=vNRUoVbpg714VzGyLEjUjrncnVobs3kuWSqNW9BMYzdp4K0wT0qM/A5yMOzdFiDjtvqzpL0xG
 yL3pBd9K/9eDFRNSQt3hQlN1Hr4mDRRHMm2Pk1m+HT8e80GlFIkKsnv
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MMZPR04MB319484:EE_
X-MS-Office365-Filtering-Correlation-Id: ad8059dd-d8fe-4554-f079-08df08780b34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|7416014|22082099003|18002099003|56012099006|11063799006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	TVYLs/bnb33LjJjlQOVCrapH7fNFcWGLLjA3+v4P4Iwbzq8K1qLvFfWClOef5H7IEU33x7OoAI6XRXDdoTkFbFnDS1HgECYsb9XcVjG/jem0KJM2MMBX2QZRZRrjGpLNdijKyrehLtttajCqIeMnPPxUAI7t+yCnho/OV3cQS2yOzC4YNmpryTo4VLW6aSuX7/9P5lXvxkUTjws1DuYACH49S7tgbdn8IKqvzcP2vMquJRYp1retxBxG8k9LX1l3QLrYjVb7kDhZIYQsjVY1at9lIMjyXXB0YUrUKvJpdmgWziirsGiIeE07fmnYxpGt1yUlmr9JqpiKNTRQ41UfpbiJkmGPAALe3LGW6f841TZWOBfX3F+D6BSm2B18GrsYpsrE38QdygqmOsTCtkutLUnUbEw+UCR8fLY7nKdS6W225wjgwBn0Jp4gyeU+BlRRcy+m6F4/0Q1or+hPqj7JlJFxdt569W1slZloUIHUmeeMEAbkD7Qo2lEIHzKAu+ErU5qaac9TJZjQV3LeDgyZXxFxX5mZyUoarQbS3BqfhGmR/jrbnXyyd9FStBZphPh3w5Xs/RIoIlbWb/UO5yqUiKlFcuhwKt36aJaIH/ewypiZIg64fqSbrx3TUKes7Y1ZSZOO8J/5iQCXPQpIWwlzYxqh9Qs1goKNa66ZWG29ns8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU0xcW1vVXAyTnE5UW8zenJBeEloQ0pWUDRLQUwyeVZGLzVIN1NBVjExSFFZ?=
 =?utf-8?B?T1hzTjZEekRCb3huR050cVRONzB4NlJvamdLVU02RE5WUTg4U1BvL2g4QmRV?=
 =?utf-8?B?VFhXOXhJRndjVUNMNkR3OFlEb1hLRTdZalhjNTgwL1B1SnA5NjhXcGdPajZM?=
 =?utf-8?B?aWRVSkw1NG52YmZVMGVvTXFNUUpQSWRSK1ZLbjZmY2VrOHJOYWVsN2o2Tm5S?=
 =?utf-8?B?bGtRbVZqZDVRdHV3a2xYVENsa0dadm5BUFhMTFZlUXRiZmp3UVR4UTlUSlp5?=
 =?utf-8?B?VzQwczhJb3dBVStxbnQrTEhyK3NRUnZMUlpJWmxUaVdQSkRsQXB0MkxRbTFG?=
 =?utf-8?B?cnZIZEV2ZGZuMy9mVWFZNklNM3JnSmo3MWltcitMVENLcXJIVWs2S3RmbTUr?=
 =?utf-8?B?dWlpYms4MkNMR3NFRmt1UTFPVmwxcis2UCswd29vK1pSQXpSdVV1VEtWZmhN?=
 =?utf-8?B?U0RhOW5veXo0WmxYV0hjMnR3UC9PQTVCU1ZubkxhL2RneTlRRlR4ZFM0TmZS?=
 =?utf-8?B?ZndZb2lOeG44RzhhT2V6Tm1NOFJ1MFl0S1JHWENDSWZaU3d3OHJLYzlkdC95?=
 =?utf-8?B?NWpoWktHcVZXcXdSWWdlV2ZKSStVR3Z5a1gvc0Fvemg4UVEzN3R2TkVBYTNK?=
 =?utf-8?B?WDBxUUtIVHBBdG5oVm5Uei9kU2NBVDczSkdsNmJMc1JTVWZLV0dDdTdqUVJx?=
 =?utf-8?B?cHNqZS9BSEprQnBub1BaM0h1SnVmOFdSYUtWaXlWSlc1MXJUcmhXUCtZSnN1?=
 =?utf-8?B?MEtwUnMxK3FPYWg2WG1QVDhBK2FtckxKbTJ2d2tVczc4T1hvZnVpbk0zQzFP?=
 =?utf-8?B?Wm1NN0xhSEQ3NzB1enpiRGVCZkRmVzR3UXJ0aXZYWnpJdjRXNXgyTVJULzd4?=
 =?utf-8?B?U3NXM0JSeGdmaXlGNXJJdlBkbXc2cmd4T3RCcFgzTVB4SkhPZ1QyYnhBZHV6?=
 =?utf-8?B?VjNiR3NpZHhLQ3BsandyMkVYVTZlWEhnRzlnUU9SSWFpcEVHbHNTd2dON3R1?=
 =?utf-8?B?bllDS2JVcFhuS09WYUR4VWcxYyttVnVBRUlCTWhWZmlrZjlLaGVvNHhHR1du?=
 =?utf-8?B?RDhXVTFUR000QTZsVXFsZDRGRzkvU2lUUlc5VXRNQkFOaVVTNVZQRHZYZnE3?=
 =?utf-8?B?NEx6aVZnYnh3OWtqejhFd3hHUWJEMG5xN1RPVyt4L0haUXh2MXZkanRSU3Zq?=
 =?utf-8?B?Yjg4RGNzWDJ1MUw3UFh2M3VibnJrNlVBQzBoTHNXdWtJbzN6K2JVVlA3YThT?=
 =?utf-8?B?OTdTVnJyVTZ3RkxKVU9EWkhzS2o2YkZSVDRmcHBieXJIRmVKZFk4b2xNbmp5?=
 =?utf-8?B?alpNZ2ZBODFxYUlFV05HL2xNZzYrditOSGlKbWtKbTBJbElXbDRhWGlEVm4v?=
 =?utf-8?B?UWtDaWVyS0NwQ21hRlhIeWJ2K1ZZM2MybW1UUDZ0c1RzQ0l1ZlpYQW9SVDRD?=
 =?utf-8?B?c21yR3hDYi8ydlRLVzZXTXhKMGVsREU1ck9Da0pLWVRlK1dsblk5c1RycEFl?=
 =?utf-8?B?aWJ4V0hxRnhUbEZyZWhDc3p2WTRwV3ExOEdyUklFTDBWQXVNSUtCdUFPTElY?=
 =?utf-8?B?dDhNL3RjcmhPb3dIb3BzN2I5TElNMzV0RjZjSjNmckc1ZmRGK1FGTUtDMFFZ?=
 =?utf-8?B?MFRVZEIwY3VnRzlDN09ySGd5Qi9CM2NySGlPSm1TVjBYYWE3aDN3UFNtOWl5?=
 =?utf-8?B?MGlIVjY4RHZ1WnA2emV1bm9nN2hQT1dxcjhQWjI2QVNVa1FOYUNWT1JIUG85?=
 =?utf-8?B?anNPVzNrbkdJNDFvMHduMVJ3MDQvckV1WVRCRkplaVJ2RE02QllNUG55QS94?=
 =?utf-8?B?K1JXdjVWb0ZXdkJPNmE1clc2cWJGK0N6SEFBc1Y1NTNGdzlSTTBlWjR5ZTcy?=
 =?utf-8?B?WlFHcllKYmlQbFF5cU0rMnZUVnViU1VYakRBU1Q5ajByVDZjREtrVWYwR0Nh?=
 =?utf-8?B?VnBCSXJjMDVLNWdyMTg4MFRHMVNNa054MkhCM1paWEkvV3hyaExuQnpWMEdZ?=
 =?utf-8?B?UkRsbmdmdlRGeHNqUkpNTnRWa0tkSUUvSlZQbkNOSjdnNFViNUxVSG4yQUpq?=
 =?utf-8?B?bUhiN3VGbmZzZ1N4ZjRhQk45djRoQVdxK0thUmZ4OG1ZNllnS0V1L3N2Z1Zl?=
 =?utf-8?B?aVJMY1BjNGxYdlcwK3BUZHR2OFEwUnNBVkR2TXVvSVowNUdnNm8wQnY2KzRp?=
 =?utf-8?B?ckZEZGFDQy8veUQzQ3FtRGJoMnFDMnZuYVVQMVM2akkyTzdPUFBOcUZZdjJG?=
 =?utf-8?B?ZW5UT0VOZHNRb3FycXA4MlJhdGpHVi8waUdvdUJ2dWpJT1dZOFExcUo2SHQz?=
 =?utf-8?B?cEZheUlNYW00RlBONmxFYldwSTBMWkJ3MVpTWGZvZ2NxSFhtbGkvRGdhU0VP?=
 =?utf-8?Q?uaclTqLzuO/pc4HfEvmUF7QJrg4BpC4AgWEWK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8059dd-d8fe-4554-f079-08df08780b34
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 22:26:18.8469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f55DYnOGvKSgGGPZtuc0QagIYb6Xb7jHsxZ7RX99YXDaAdU/nO1dyyb+pS+/zTcNXnv/FaaOT4zUNP+xSjLuY7ohApCsYEHJQQhNwLOgn1jHopQjTvOvj2wCCJARc/aJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB319484

From: Frank Li <Frank.Li@nxp.com>

The sd2_vmmc regulator was using compatible = "regulator-gpio" with
only a single state entry (states = <3300000 0>), which violates the
gpio-regulator DT schema that requires at least two state pairs.

Since the regulator operates at a fixed 3.3 V (regulator-min-microvolt
equals regulator-max-microvolt), convert the node to regulator-fixed.

Fix below check_dtbs warnings:
  arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dtb: gpio-regulator (regulator-gpio): states: [[3300000, 0]] is too short

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts b/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
index 4725ee241cb11..4d8672ab1c42b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts
@@ -75,15 +75,14 @@ sd2_pwrseq: pwrseq {
 		reset-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
 	};
 
-	sd2_vmmc: gpio-regulator {
-		compatible = "regulator-gpio";
+	sd2_vmmc: regulator-sd2-vmmc {
+		compatible = "regulator-fixed";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_sd2_vmmc>;
 		regulator-name = "vmmc";
-		states = <3300000 0>;
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		enable-gpios = <&gpio4 12 GPIO_ACTIVE_LOW>;
+		gpio = <&gpio4 12 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <100000>;
 	};
 };

-- 
2.43.0

