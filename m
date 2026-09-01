Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012056.outbound.protection.outlook.com [52.101.66.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CB54CCDDF;
	Tue,  1 Sep 2026 22:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301567; cv=fail; b=NRcqF3a8bnmQtU2eirjvo//JEF9yEgyMZJa4RhfX1914+HDwDDwWI5QF3mJhdqSEn8YCHNsKIGWmAPAT1llrrzuZt18ZJQNX1smH1HetvHtA2PKeJBKVogXePMLq8wf9/VunCl2rP//Vto/gDdgm6hAFkNroHc7h81Qz7aSkjRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301567; c=relaxed/simple;
	bh=2r/LOJqoJJXJSUX8qO/FJxslrxAHYWzmUVvs+pZIJjM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sqDUm55NlxS1wBf4M/PgaVAFmbwur55iN2hNWpMBCyK/yIEibe+HdO5mFkX6CompxKjCNlw6H4OIYaRD+ivmxFeMBHo5rscHm6YYZprWXJkPW+T9bVjXeOnNcO5J2A7expSCAfhOI3U3LV/jDwxZaaiC+fleXkaOKquicDVxdGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TzMaOPKj; arc=fail smtp.client-ip=52.101.66.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TzMaOPKj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PODugk6DaDc5/lPnIaXDnWV8yRxExVBypPOWMr06v+0o4T/AVh6+kYAnN3L2vB97IdbaMRW+5Ul7L5UyoX8xiOLNvlYtJt1D8FzqGi89fPliMBeh+OZluPgFwBNbsJ0Asx2FrioVGj/AAVvCtu4X9m8GHAqW9bFvBDcf1OlTwqSHEW9+w7YVj9/dkHLIUCWBLcn5dH0kqsnxianrjEIh5Pzch68/xcO6w3zwcjzD9G6k+FxUH/XFBori/pzyjMYctaSz45aVIpLkNfqS2YNzWT0W15SWYSlPBo0UYCAUW3nI6k5HFenPhtSxi1NteL0tmWuy/IbY//sFIeiboohNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoDs7VFU8f0DU2sgdtM3xYREy04cDECQaS7ppM7pz7s=;
 b=uLB1Inrzn7RkD2GgD0y1mPxP9ECZjCcN2TGO4OiqRHaeqGDM7VSSO6OP4VQxGg1crhxJ5X8jElIqTAP1EKF016/GnvBXjdtK+/yd+zN8ih57r+4nrzTks575pqqqvmkevmIJbkmfrlfQVtrm/oaz12rcjsg9A9rfPTHmZSA8eOjvrJmQL/6iXqUmcnfUANuTVZQoabypHq21qrgQeNdakbJvoubs2XMVtpO4YFIBqPXuz+hI8v9FY/6e17RLPKM9knXg77o7qO0FJfdVd2awoEAXYcXa/DYjgWqUKcP/olnWWQd26v4MvOU7LMnwiJM4OLe0oKtxrCSssGIyio0gtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoDs7VFU8f0DU2sgdtM3xYREy04cDECQaS7ppM7pz7s=;
 b=TzMaOPKjEf1nfvpfamS2TJs5+p5VXbcUUaJ6tCuQUT0PYMhv0gwPjcwhEUoG20ULf0S412Nz6wr3TO4fr0hPbqpU8/fbfXivqsAuB1WoIA7auRHlHp1a3m1InWJ2SfBPlNZoNLO03E0lUweuUOSC8MiDJO+/1wm4dmAoZ9sRxP9iwGyZd9CBXLGMSxKag44LHaxuLbeVGB28Ad+H9DcJEU4VEmhQCSLLbjd4I9WWtWdUtgm8NwvauJOBvUsqnXICO4iAFKS1K2t4hpim0EJtJNYqSTwON0UlGgCn3tNijh/CfV0fO+3x8Db/LuqjvNW645+FSG+iXs/gYLsCD6kHXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MMZPR04MB319484.eurprd04.prod.outlook.com (2603:10a6:190:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 22:26:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 22:26:02 +0000
From: Frank.Li@oss.nxp.com
Date: Tue, 01 Sep 2026 18:25:36 -0400
Subject: [PATCH 2/8] ARM: dts: imx6qdl-emcon: Remove unrecognized
 disable-gpio PCIe property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm_dts_clean1-v1-2-db741f37a1f4@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788301547; l=1035;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=PgG1kMXsl+UIaPIz+A6omc2e8rQzA7m/9gcu7k6i0vU=;
 b=8U3KRpvFTA9xwSczd0yP7OFCDFqUFZvHt+xz2sEXDG2S1rSCzLKXXRqFBRW7smIVdXeHGvLS9
 5J0/gPlX7oMAJNNLenjyiiyzk6GJlk/zDE0jTfvRldRkyz0W4nnSQIJ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR17CA0049.namprd17.prod.outlook.com
 (2603:10b6:510:325::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MMZPR04MB319484:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a206b51-1bbe-45d0-296a-08df0878019f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|7416014|22082099003|18002099003|56012099006|11063799006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	LdEyPL1EzG7niWHzPdQcHnIv6a+DUu+EvNT2do1aTuIgZFZQt5jzl36+X0MNBlOV4C/wAc2FxroK2BlszBA6uki+nWNbcGTjo9K+w+b/o5QTb+6x2fcp8QV5IDAr+4JoQQE1LxYogNcTAAn3pqxdTllsKVi6+kjRaJ6YSwx0FV6HvG4zRgc6kKCRm4rahNCAexxe8gVYfTxoaCFLxm0PEafn7VMqv958mXgQCsI2wHH0aGR+mLueAmRXNBy8INDgquL/09MVQkWQFPWslZn357joYLWqZXVnQAhk7oRJQ+603V28sMRLrI7dTOmzkkVR+rnya0GXrtWxwDQ8nO/5knY69YKKk43i42LHWcUf+eKybIrJEL5DQ8kP2LT34IPknEel6RPP1L/zguN3s0qRXch7CV+kdKtZaZqsSfhVixMghMI3kwF3qW2XhdCR5Gk56iKvORYaF+PNOCtxJrr/X4T8Df1+cXp69mU9Lec9HnCEVUIa1P+H8WGDMBNkBHYjCsCUhehLuBOT9kOWVwYnlScg8hYb2+0XNWe6t+ReNKcLzH/OolKC8rQPB/jYdPgFjNbjH7gCpyNUzsIduM1AwRH0CGlx1N4pqG8rrG1MgSw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm1RcDNpL0pYYno5M2NLd2NpUkZubEdQZXl2YXN6L1ZmUVAzY1l5R3lLcjFI?=
 =?utf-8?B?REdLZVdVMEdQejVWb1o1QmdnVmZSRTVGZVFCbGlBRkpTZUJrTGdYMTBPT01i?=
 =?utf-8?B?UEkrZm4xblNjNU50TmlFTzhNTFNMMUVzZStZM2lnV3dLVzIvKzBYdElGUEh5?=
 =?utf-8?B?amZ5NlBSUUY5UnJock9NVURVaDVxNkQyVEFEV1hibGVURWpRZ3YzUlptYjlh?=
 =?utf-8?B?Q2dlaEtzdms0Ym42YTFlY1g0V2daUnRyQUN2b2hFb2Q1SVBEbWlRdm9VdXpP?=
 =?utf-8?B?RFMxQXV5M0c1THBBWmJzdVhUK2JVaDZzL2lwYldEQ0k0MXQ1MTUrNEJmL1BX?=
 =?utf-8?B?Si9TVm55RldYdWU2ejVhaisxMGFQZ3RTZHJsY1FrdFJGamJpUERJMUtMQTlO?=
 =?utf-8?B?ZWpBWnBvRXg2OVd5bTNhWVRjUmdYYnV2cjZqK3lBMjRlSHZGVjBBd09Dd3Yy?=
 =?utf-8?B?NWFYYVdFUmZmRDk3U1c3N1R3eHdIcll3c1JSZ2I2Y3BuWXdWZUhzaGUrMEpp?=
 =?utf-8?B?K3BwWmF1c0hxREo3QWFYdU1oUlZPOWtCeXhVS1VzdVRzWnREM0ZaZ213enM2?=
 =?utf-8?B?aFZpNFRUS01JbWZZcUtqWnRIU3FRUUFNNC9xUTE5L1lZejI1aGV1WDd4MWVW?=
 =?utf-8?B?T0RCamdCdUxUTmdqNUJic3BKbHJZcENNM0RLTGR5Q0xzK2RTeERjclNRRWF1?=
 =?utf-8?B?Y0FLWDhteE1PYjEwb3dkQUpxMEtPdkpodGkyZCs1dkgzSkdNMW9RY25sVDdp?=
 =?utf-8?B?ZWJpZHNQOWVFcVh6TTNVU0o4aURJb1gvNm1pSktsTFNVc09YRlJLZVhEaWc4?=
 =?utf-8?B?M1VyajJBZ2NSSkMvOGt3LytJMjVXRGUvTEhtaCtFdTh4TE45RFNSMXRHZG5M?=
 =?utf-8?B?UVdFRlAzWlBVQmcyS0Y4azZIbmVPZDl2eFRZN2duVGhkbVlQb0NZSXVNc2pQ?=
 =?utf-8?B?bkQ1cTFXU3hTYVo3MGJuNGlDSFFJS2lybkxmWUlHTFdnYk4zVkk1UCtoWEd1?=
 =?utf-8?B?QkhYL2h1bXhpNmhPaGV5YWNxalJJSUZPSER5NXovVnZOMjlkQlBqelFrcFpr?=
 =?utf-8?B?TE1ra21MejMveC9VVzJDNStOWFpUeHBMOXNncDFJcmFmSE9mdkxvc3ZoSDNP?=
 =?utf-8?B?M1l2NFYxMWF3WXlKdXJIM2ZqS0VVTjRpT0p1azJmcHJRbHdZQ21nYitmdzMv?=
 =?utf-8?B?bVZKanluZFZCK3lBOVQ3R0ZFaWhSR2Z6NC9WSjVPTk9wTjg1SUsyV2RxWDdF?=
 =?utf-8?B?TWVKaC8xS0xQWFpMUVh0N05HT0w2VGRjbXg5TEFIWkZxSUVzanVrUUVhZVZo?=
 =?utf-8?B?N2MzNjkyOVBFQlZ0MFgvbktFQTdxbmlROXI5RFJhQkFwL0Y2dFY5aEFnTGRX?=
 =?utf-8?B?SWY5N2tDei80YWhlM2tqMGwzQzJCQ0QyUjJRRENLV2R2c0FOV0VQR2xNeURn?=
 =?utf-8?B?MFF6ekhnYkp5cFVTOWJVMDR2YXA4M3Qyd1NYZWEzeDB4VW9HUkVyaXlpNFR5?=
 =?utf-8?B?Nk9HUEdSdzVRNFNHWW9aWW5hOUQ2bWtEOG9FVkludDVxckdZQzB4ejVZcmha?=
 =?utf-8?B?RUlRRy9CeFRsZkNqMHBUWkNSR2ZCcU5vanlob2tiOG9Od2pUMlRJcmhUKy8w?=
 =?utf-8?B?MHpqTEJOclU0dGtNdFhSbXAvakdSRkRGc2NIZDhYMmJ4M3N5L2FkM2o3Nk5D?=
 =?utf-8?B?VE9wdHV3THR4SVRON2JBNUtUV2NBc2hPQm1VYmEyS2wvUHAzUXU5U1JhRnR3?=
 =?utf-8?B?UWN0QkRJSGpSNU94cStlQXFZdmo1QlpKM1lqN3I4by83N3FQL1prMFhLbWdv?=
 =?utf-8?B?TVFjSVVhenJmaCtObUV6UTlNZCtUK25nK3lsZmd5WmY2U3I5Y3d6MjloYlRH?=
 =?utf-8?B?TnJzT1JHUHg3M3lQYzdWTFJ1MUM1OHUzSlBoT2h0dnpOQkFUemcva1NDWEVQ?=
 =?utf-8?B?RC9BSFhOUmk0Wms5YTFqVVFtNUVESEIvTEpIUE5uSUxTdVFMQ1Vjdk11Rzll?=
 =?utf-8?B?WktGTmZGTG5Rcml4NGd0Q1R3YUFDMHJZWnh3K29LNDlORUR4N3RJRVVFK3FP?=
 =?utf-8?B?SEt0OXB5dCs0NHlmR0ZVOHN0M0hIdStGT3F2LzNBelc2bTZBUnpwcmtBVHN2?=
 =?utf-8?B?Z05HeXRRZlpEYnZNcGw2WTF0cmVGSWVqZlJjSlBBMWdZZUpnRzg4US9CMjN0?=
 =?utf-8?B?b085REIrT3Q2WXc1OElpc1RIVU9LT0JnNVNtaGc3UDh6NFQvSGVERVJvOXdy?=
 =?utf-8?B?NnRkc3ovcW5GNnIyL3RkV2Nlem4zSzk3SE1sRStESkpsSEhMUHhBQ09wYW5O?=
 =?utf-8?B?b0xnNU9WRC9jeXEwUE1ISFdsTjR4alRML1RoREtRdVRzb3k0TUlJTWhRWFJa?=
 =?utf-8?Q?4HseoExP5H3S/aZB7T4y/WyofgM1vAc69VuCo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a206b51-1bbe-45d0-296a-08df0878019f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 22:26:02.7588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQjcFb4WKs7Sw1x8KPNHN4uzIcwblMeY9Ik9Yq6t+lMzzE29nZTdVkOBpDOwLWPfQC+COMaKNmEyB1vwxQ/ZbgP3ZUkqSHwLyYIxcehbQNf1B93L7I2fx7d+WDZSTD9J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB319484

From: Frank Li <Frank.Li@nxp.com>

The 'disable-gpio' property is not defined in the fsl,imx6q-pcie
binding schema and driver code, which causes the following dtbs_check
warning:

  arch/arm/boot/dts/nxp/imx/imx6dl-emcon-avari.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('disable-gpio' was unexpected)
        from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
index 9f4e746beb2d5..34ad7fc04f6b8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
@@ -733,7 +733,6 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie_ctrl>;
 	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
-	disable-gpio = <&gpio2 22 GPIO_ACTIVE_LOW>;
 };
 
 &pwm1 {

-- 
2.43.0

