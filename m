Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F816477992;
	Tue,  1 Sep 2026 22:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301562; cv=fail; b=rNzq/v1Y9pu4NQyMSLI2uBZ/MyhtEzQq9AqUZzSD6LmPxtdP9DiqFELWvThilowIjHHno1DsObi6xz4u7uHEjK1nQ2rwyn5//UlTOplRETEin/9lW7992AotDdvE5jx3a94WkMEC/4jJGd1h6tlevffJId9eP65g3Wg9+sMT9yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301562; c=relaxed/simple;
	bh=LIz1EFjRnPXS7xuIqhrvmPvz+H5cnSbikDQGok86ZHA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=OqDdu1A8lNscdsDmK5gAbK9L+3Ll3uS6kAcA+f58JZtRE+36mAC4Bm70GPMFgtfteIixHlnqiWn1usDwRvgrY1Z23gmG69o87xRUaxJieQ8Lr/4DJwfpaHL4lN9VakfghnAkB+9i0OELrh2vF9HMFfrxO41fTyyrJ0F/5G5shig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mnveArCh; arc=fail smtp.client-ip=40.107.162.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mnveArCh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D41C9WeluTRf7uWkaXnhmXQw/RM3RN/YCgVgIX71BaFJ6A2/M2/JHNS4PoqXf4RGr7zTeOeK+57vwG57TfTCTvjVg5iUS5OMec9ciP1yfamLcRUGrB11wdn6zETbkOiGa/xot2Pg7WqUTbZKDAIAxTK2Sqwcie/qMqhvRijuO3sIgu5wp4RVWeicIDngVBKOvudbvbfxZf97wwtILRTJT8uRedaLYi7C115V71+/7Cg10k1gO86oqoPdS1aK1XI+VBNK1o91jXxn0uQyWJM2tJ8oK9RQfE2SVnwHtM3a+M7s8ArjtlF7ls8LP6macBCG6fjxhFVYbhbaJYRh7h1nKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzDZhcdoqfoBh2/u8DHA8uhufgIlDDwwEAC3F49hydw=;
 b=NamDRUOhebQxSDRlFsysxGpk0rtTyMmVOeso5AhYBGKPNJDb21Co7SBm8+KHNh5neEdbGkvtYA64YuT0IGyXvUbKZZpO+ouYBuyNyndnNwC4rGlQqnDicBbyl2y10mJEMNjuIwDZ7pSW8whwgQJA81JSI26Xw7nJUPYMkrBYBjls3K63q6iNAVDLOLYTFgo0cYmfpgDI3vazxGOTaA0UfUdQFdDpczF0Aj2s6OppA54M90lNmwM4OULwEzFVL5xRrcGAq8QJoh0ikU3hTZ9Apvc6jxPuHN/xMFiPcTkySeXPIu+Hmig5p31EUjhh77aQw/YxB90gHHS0k23OmAmblQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzDZhcdoqfoBh2/u8DHA8uhufgIlDDwwEAC3F49hydw=;
 b=mnveArChpNpaGl2QAXne23dJ/VKYcGWn+HWAOHxICHSJulS5YxNT1V1yIGxOBBg4v1VeB6L0L6Jpc1TWvpR7OdZTQC31cV8pYA/4m5haB8bmjezhN0J1gSuqAUL89lr/6oHqtftOcgUo04yAO5X+1mKq6u7YtvlHrb1mZu/YVacc1pNHAnpBV6xYIRc2dTlaOZwR40vpyHVBJYRZsIpzGiqPL1SqlsEqQ75+CrvjTUYHDyZ37XHhFrCAzQiMQcWQw9jFgJuHl1hP2MQbCeLkWcyQRW2BPIMFJd/LYVerVGf1FydgDqaKyTAB+Trbx/vfstq+biw2m05Qeuu9CFO4LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MMZPR04MB319484.eurprd04.prod.outlook.com (2603:10a6:190:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 22:25:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 22:25:57 +0000
From: Frank.Li@oss.nxp.com
Date: Tue, 01 Sep 2026 18:25:35 -0400
Subject: [PATCH 1/8] ARM: dts: imx51-zii-rdu1: rename node name i2c-gpio to
 i2c-0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm_dts_clean1-v1-1-db741f37a1f4@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788301547; l=1378;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ZEY9sZTc3ajqVNZVD4/I/dH3flyAMTn7xnMGH8BTar4=;
 b=JjEbcOixN2S7+bEwXs023swbtnDNVCKBM7v5IMX+7EZ1f0cQ1CtaK9hNqQuhnB7TzoV91MqBV
 wYIaPj70LVDD5Bz8nLuLkFd3DQy0ipPzzxIiL7j2fVnmjEJJSaUoJ4f
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MMZPR04MB319484:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc4c3a2-b400-421f-4b28-08df0877fe65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|7416014|22082099003|18002099003|56012099006|11063799006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	eG/CiyfmXmT+2i6IGGjibe/gagPdIwBBFmPk7i86Ly+QKY/UjpzSnJqcda34OfuvuvCj8zdrBTQJMfNTyL1XWC0p4JMK5q1hKnV0lc/VcVzJoBawW7tqbFrN1U2YJC7l+kNWuO3iaJt23vGFWAq81/jAdMZ8Tm1PHAtGV+fdSN+pUjaaL3louhvIXpPKSC9KOT0D6q5n5883KCIWq5CzreNzSQa7ITG24yqazwT2hYiLycBM3Oe7wTLcOHoFM182L1pwGzKqoXYZ1TWTgrV94dxnw+1V3mrWY1LqdkGXhwsZ7NhxorajDOn1FNe6+v6FuT+n9SOBUQaRZBTv1kr+Wf/Sdy3z3Ta7WPx3+QZZc2pQJxVEG7Q/rLVKQj8wrT7bLfIHah3EAxXEKHN350WtE4YRAiN0AuyL+ggssay+qHB3lTA48QjVBPmW0vph3tfuyWtAk3Gv/SxbaVLxUUhW2NuinExjHJlXNkWXQYYsl3JU6VCXr9Mp3ykBpwd0jCbbXyjwB7/Ip8aHNE522qZTA2KZ6OJVJwCI7Ahps4VJ403tkQwUfff9FDtH0BiY/CpV07stzv0cmYvk9xhmOdXilJUvt4iTll+n23paz++3x04kElnflV4FHnTpiZgpo6u4R5PbT9R9QZXoGqinXiiClwsG0xi5kQz9GgVCcYKJ8mk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHc5WXZOUDFaVU1tQVR5QU9MMUFJQ28rNCttYXpJVG1VSHNtdTV1V0N4MXBS?=
 =?utf-8?B?elRFMWxIeWg5TUQ3Y2ZsbHZCK2t0UmYrMTh1OVBjU1pzRUdvQXlVUXZIOGQ4?=
 =?utf-8?B?N0VMeXFOYWo2WUxkeUMxQlhPdTlUZngrL3h1cnUyS1lNZGJaaVhTV1FXYmE3?=
 =?utf-8?B?STZQVHN5NXJwU3pZVHlLemJGZkM5TTNiUXV3ajU3OXM4ZUI3ZFZXaHdSc0wy?=
 =?utf-8?B?UWhCbVRISFNFWWVBVXBybHZSSkZaTGJXSGhNdFF4UGpqN0RaS1BuZ1hFcGh2?=
 =?utf-8?B?L2VYQWtTV0c0Rmo0RFp0WjB0RkpSc08zR2pzODRuNitlUUxvdG82eXZZa1Yy?=
 =?utf-8?B?c0ZiNGc3eThtQldoSzVIbG9tcmZWcWJtQy9NMkNGN0tncnlKaU9wUGNNODFV?=
 =?utf-8?B?cWhQWEtuNDlMWHQ5OEJnL3hxaWV1Y1ZwR0ZabUsrTklEUlJGa3RGMVJjN1I0?=
 =?utf-8?B?Q1NJelhYbkVLN2w4MUtsdHZHUWFIQm1INGJEbXlNWUJuUDFFYTlaWkZ0a3dH?=
 =?utf-8?B?NVY2aDRoc244ZTNoZE8yYnc1MnhycWRLSDR2SVJCOXNOZ0dPTVdvYU4wNHJC?=
 =?utf-8?B?SG5sMmxVR1BxMmJwRThxdkV2MnVPWWZVcVJ1N1NrVXJuQ1NMNmV3d0tYWjli?=
 =?utf-8?B?b0NtckN6aWZndzVIbWdZM2NVTm9KcWcraE9PZDl0U1QxNk5CT3lKZldudTAx?=
 =?utf-8?B?aWZGakR6N0ZXN3RHRUlia0NJRU1WSjRiWnNPaWc0ckpjOGk4QXgwMFdtQWZ0?=
 =?utf-8?B?T0F4M2VEaG9lYzdNRVlUQTY5T21aYWxYbjdUUEl1WTl1c0o5SWhnN0FwaXhT?=
 =?utf-8?B?emdCWkhsdEQrdzJaU1ExUThYT3JZUFNuNURVaHZ3V2hzeWYxd3VDbzhKNUc2?=
 =?utf-8?B?SjdpaW9mbEIrUFZhSUwzbVhXOUhHcVA1ZFdaZ3RHelpxMDl4Q3BzRE5qSFlT?=
 =?utf-8?B?YWwyWk5IMTNVRTJyZjFjVVZ0OHIvZUlFVjlKMUJNM3J6dnNKN2VzNzdjK3hi?=
 =?utf-8?B?RXJ0RVRiWGdyR24xakZ0RlFxZEhZRzcxalpNNUI2dVFMZlVSYUJSVVlDTzRo?=
 =?utf-8?B?R00zbUcwbVo1ekt2cHdCNzhIZHhYQ09tcW90c04rUlh5VmFBYXRZZ0doWGFD?=
 =?utf-8?B?VEpJRTJDYnBuNlJvdkhrSm9veGRnWm02KzI5ZUtCWjI1U1VyT0o1UTFRd0FQ?=
 =?utf-8?B?NVZ3K0s5VmlnSXVSTnlBdEpmdzlnZkhhNVlNcURTM1Era2ZQaVorM3VaRFF3?=
 =?utf-8?B?QWVmeGNKRk1lVmFXdnIrOUFRQk5MVFhkd3JaOHFSbjYzaWxhRG1UMlpzVkR5?=
 =?utf-8?B?bDdhalRGdCszNzRjeDA5OG5EQmE2eElZZnQ4WWc4T3lGb21BNWxGYTZZR1hD?=
 =?utf-8?B?YXlJRzltT2x4cHBVaktQTmJKejNxYStDRzBGV2c5MUhnM0FLdDdYV1Zyd1NE?=
 =?utf-8?B?Sk5zVHdlaldlVkFLc1phR1d0VkpnZ1FTeVRudjlsc0x2OGpuMktOK05FNGR5?=
 =?utf-8?B?YVUzUXQ4bnNEQlVNbExRN09YeEFxVU9qRGdobUhyUDM5Z2tONGdvSlBiaUtv?=
 =?utf-8?B?Qm41SkE1M29pdUtjV2Nla1NPWTNOWUpDaXQ4N25IaG1qQUdIV1VJV1R4ZFl2?=
 =?utf-8?B?d0VzbXd2aks1MFQwV1dZckE2alBiUmQwUVZTczZRWTdYdDg4eTVNRVhFRytv?=
 =?utf-8?B?bzZSWFBiNnREK1RSQ0FRdFg3WlpDQlNCMWRPYlYzL2VRdGE5UDg0a0tYZ1NL?=
 =?utf-8?B?OU1BT0F2c2JZcHJHd0x5cHdwd1I5elU5aU1pVWo0M053NEJxMFJwdmE1NFdi?=
 =?utf-8?B?eWN4SmZSVGVENDBmUE5ydUZyYktQaVBhSWNpZ0pEY3J2MGwvQjVKNWZoWDJ0?=
 =?utf-8?B?RnZNNEVkbm9uN0twL1cwNUU2OGFKdUtTbDVUTDhqcTF4MmRjdGwyaXVRY01x?=
 =?utf-8?B?VmVLc2lKZTFNUTByVEtkVG1oa0dtV09FQkwySDZKVXRSbHdYQTIyeExYZzdz?=
 =?utf-8?B?Vm1zMlVCdmR2ZWdqNHRXVXhwTFJueCttTURMYjIvSlRKT1oxeFJ3Qm9KQjBy?=
 =?utf-8?B?aVhjR3J1MHdhc2MwaWZYTE44UHVWakVWMTIwWVNtNm0xUGxrZXJoYS8xa3VJ?=
 =?utf-8?B?Tk9FaU5zdE5kZzdrUG1GNFVERVYrWjg1QWtXS29CUHlnN3FKdTJ2WnAzczN4?=
 =?utf-8?B?blB5amVRVGp4WHlwUjdPblJHbm9uV2NaSEFHcWtWYmlPTzM1R2FwdmdnL0J6?=
 =?utf-8?B?dm5lem1Ja09Uci9zbTZyaDJZaWpKU0d0SElLdGYzRUg1dW82dk12Rk1BQVZS?=
 =?utf-8?B?a1ZoM3VzTk9BcFdISVFmNlF1VnVmSDQrTHUrT3JvTHdSUjh0cHEwck5FOWRE?=
 =?utf-8?Q?PeznKvvnGZPZVeMzMyPzet7ZfM9BsB+uIRpxX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc4c3a2-b400-421f-4b28-08df0877fe65
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 22:25:57.3503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBtChWw2sZYk/xAQnmlU9Sf6ZnPRneI8hUBuq8rduzAghX1GJrJwK2YGdppA5hVmgjerPGKN4fTabZshilNsSBunucpaFHYGmNQUGNi8phKg/MjJdvql4GN0QP42/FBu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB319484

From: Frank Li <Frank.Li@nxp.com>

The binding expects the node name to match the pattern
'^i2c(@.+|-[a-z0-9]+)?$', but the node was named 'i2c-gpio' which conflicts
with schema validation and produces:

arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dtb: / (zii,imx51-rdu1): i2c-gpio: {'compatible': ['i2c-gpio'], 'pinctrl-names': ['default'], 'pinctrl-0': [[47]], 'sda-gpios': [[17, 2, 0]], 'scl-gpios': [[31, 4, 0]], 'i2c-gpio,delay-us': [50], 'status': ['okay'], '#address-cells': 1, '#size-cells': 0, 'codec@a': {'compatible': ['fsl,sgtl5000'], 'reg': [[10]], 'clocks': [[48]], 'VDDA-supply': [[49]], 'VDDIO-supply': [[50]], '#sound-dai-cells': 0, 'phandle': 57}} is not of type 'array'

Rename the node to 'i2c-0' to fix above dtbs_check warning.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
index 91c63d1f26043..c17ab36474cd2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
@@ -115,7 +115,7 @@ panel_in: endpoint {
 		};
 	};
 
-	i2c_gpio: i2c-gpio {
+	i2c_gpio: i2c-0 {
 		compatible = "i2c-gpio";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_swi2c>;

-- 
2.43.0

