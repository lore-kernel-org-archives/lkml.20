Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010028.outbound.protection.outlook.com [52.101.84.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BB451AED4;
	Thu,  1 Oct 2026 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867222; cv=fail; b=iF9lB+94QAIJS2CzLEkjxg8+Ac4AI0CaqXPe44E4lIkWr0kun84hIRxbbkMItP4Qc/Cbpry+cW/fkk1NDxp6BDzoaxPnlsyMR1m44C5YD80uUm08tCVLumL5TOk4l/ZyNcrAtZ4cnopZvzWs6Zte8ywsS7hKfqkiUEKjcu7QjZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867222; c=relaxed/simple;
	bh=GUdog7PBm3JV1+yQzatSLPP8bdRkK6EXvdl6yZ7ZuB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B3ldNR1h4A8n6btmCYMTCSsboixIZ2adYkdMHoiffaFO3Pbr839mBJdXmdiXdZ5lKl2OQyM6KTBhcq17awXFBwRVdd3hJLI1j1VsZCNyG4bImlvM2SUwxib4jS4eHVMiKxwSdPFMr+G9CYfmF8iFEduT65VmugqAV0w0SVUdcUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=urO6dX6C; arc=fail smtp.client-ip=52.101.84.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="urO6dX6C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7CE34K7LoLkBslfCmOektv44FaT7L6D6Ad5iTfHk466oYRcjVOuGndwzEqIPnRxNEdi1m9LmavPt+GFkV2iv8hC3jw4GFFSaPXl8oVSuox0MphvBe9z6t2z00oFd8+W5V/sbyv4tWbCfOT2BOh1dejRjYlFKtYKFn9SjSUmTJbABDMlptaUW883ui2lqJQpuX2ABGakyexVqHOA/o7qOMemthlu/VlQPpCzoOdcWOVh4H/ZYThPQQJ/4qlNDxfs1WHb5sLbXQoJZdhXBwTts6tNMEsbqTpceU3dr6P+b5FxBrV86CrDKS5oWS2Maq7ORFruWX/syVCURhcE7xqltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGk+Ci+6dHafZk/qw0DYFJBgdFGNxjFCjO13VuIHmSQ=;
 b=koYnjomO3Re7KyhO08UwT07QctD8Kq4cz6AFLn5F+FksYSXKGm58bbvsJwDVQ9wLvd5a/w1avKTVlFsGA5QcnE+R/QU5+gQX3OeWxJaoeGEu/oJ36qsSPpLEKoXkPbysDhFkOadOyqLb7DqOhNzKmbYU61f18jT+Kj9iwNWC/GbtDyhePyCl8z8xFj9qhmo35NGVFPtnpFI3pjWwJTdA66PqaY11NL0QRMEXBXG0OQITrTg9EUbbhmRAWfYovxBq/zwm+127qaah0UU+aOwVQ2uCKXP9hMcQ4yEzOICbNsW8LCOlcBHtrakveL01yPSA6VxV+40XN/Gst0Mt9zha3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGk+Ci+6dHafZk/qw0DYFJBgdFGNxjFCjO13VuIHmSQ=;
 b=urO6dX6CTNJucD/Fkx2cTmEht3IASt2QCR1n2Gh3q6Cru7pnA93xB8ui6kmO7PWWjXleKISlq0YJUjxaBhpX/hmmOV4rmtnL2vnockhmwiNK3WYPpSRpSSPc0cggQoPxMT+/oF9fokUEH3seVWiUNR7sP1RkT2uRmDKN0QzO7kqSzNT2EOl4GKfuN7MBDyykhMRH+DJs/0+6XVXBAlunK/IJYGsllY0Hm7hIkn/kjbW5K5ZKyMQiXm5TZ5mouOSc5vskwjF7Ig1wm/IKAaTrLsvuRvb9bO2r0vU9fFOMY4AGMQAi045nUodLj2RTnGZA4RxLDnbDiASetZzy8StKUA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB7116.eurprd04.prod.outlook.com (2603:10a6:10:127::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 15:06:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 15:06:56 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH] ARM: dts: imx6dl-phytec-mira: Add phyBOARD-Mira-i.MX6DL with eMMC
Date: Thu,  1 Oct 2026 11:06:49 -0400
Message-ID: <179086720079.2224347.18121437168142320948.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928123612.2250601-1-primoz.fiser@norik.com>
References: <20260928123612.2250601-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P220CA0037.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: a1acd8f5-688f-4088-ffeb-08df1fcda278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|23010399003|1800799024|376014|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VzTZfETD0tkhP6UZajv9snnSF7RSdIA565rrTCUV7wmrSPHmHMbElJ/JsLa8AnavGNj6lwFf6GloyTB8eQ+YlJbAixDHIVePwIoIN+v1T/pwmI2N8ygCpBOhd0GGgjZ42SiBTh3X9+A/Rv0MQ2r6C7D8ohiwQ6j+NiX2ZMsCMRU71LYlHe/LUY51As62skfuH4+wjMRqqM72N96QbzGIU6myMaOIi01uzGBr8bn11uGydPB/6lZnUYuFOpgGHgKvPKfyz91RIeSv4ELXY4fwBzPgj4qWnJpube44fEXunx9+CCOzrfUjPrN6mKbQhbSl12Sx3IHIgliOG5aO4VD5kEDzyO7AusHaxT1Mtge8CkO8ywyDz4qRrzpjTi+Z+CIt1ZLFYK8aBCzYq/XLWoelccZAi29uKeaT1iz+bJC2pO3MQ+iBHXL4jJmVnLjeWZTqb0bt1EWAZCQMnrMDDE7UfHWMd3HPFTw3sw/5/Sy0nDTcuYNQohCdWxjVOEtsRtl13sSdxixDMceL+8IAxKivHTklg1P8g16oMjyRQZK6oJUFT5rLHWu1gJSAEMgw9lnykaYSFzkvkx+MS2GhtcOlU/XT8cYpq8QvjkMh9G+Jv9jXOVAtnrG4MlNGe/B9qr3hO7R6g9vHD4KDXHDuidt52nmsE31zo7W90/MrU1wsS04=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T01SVEtKUUxwV0p5aldzT2s4N1FrMEgxTHpNQmZZUEUyZ0Zkc01PR1FwRHAz?=
 =?utf-8?B?UU5MbEhKODFwb1ZzOXNFdEk5MmlKSVBvQ1Q4SFhrYmQrM05oQjFwZXhNMlVX?=
 =?utf-8?B?S0xFYzQzT2gvNWRMRkRNUzhuay9nWmhmMHFOc3gxWHlyam5rNFM0OEJFTy9H?=
 =?utf-8?B?b3NDMWJSM0Y1cWV6U2hIY3paRG0wcDVHWWJZeStwb2Q3bU5FMTJnRzNVZm5m?=
 =?utf-8?B?TVV4bUtsaGR5YmpSZG1FeldoMHZQSEVXOTlyb0UxWk1URSt5enN3ZHFIUVVG?=
 =?utf-8?B?R284c3JETUFiTHVjd0Y1TTVETmZKMmdXMGNLVG1VKzl6Zms2b0NGclA1RlVq?=
 =?utf-8?B?RXFFbTlRMVdITFdtS0JRLzRtR0dsYkg4Ykt1VVNhdmhiR2Z1K3lTdGlQL3VF?=
 =?utf-8?B?d1lJMTJMaU5QZXpoZmxibXcrR04xYXFWRFF0Tk1pZVdsTGJhRDRROUFOLzgy?=
 =?utf-8?B?VVFwS3FIWVIrQnZaZUFYZGlySHFXM2tRMDJpWWdyYnZneVg1VHRHdTdvVXp1?=
 =?utf-8?B?bG0zRDJXWW90d3A1L3hiL2xBMmFnR2dlZXhKZVpLTVF0SnJ4T3NhczRXb0pW?=
 =?utf-8?B?NFJhQmJZWFhSS0doQ3BrNml2REt0WE5uWWhhbVhwSWdxN01NMzREejhlZjZu?=
 =?utf-8?B?VVZOdk40MDZhVTZONFI1WlQvWEpDWDNnSzBGaS9DZmJjWURNZk16Q1A0SUtP?=
 =?utf-8?B?bytXQWJyWng4M2g2c1pzck5zU0ZYMTZ3UWZIbUZKQjNLeGhlaTdnUE1vNkhF?=
 =?utf-8?B?TDFRQUJBZ3ExZGxmSk9jeUdNK1YxV0dyUlZrbUovL1B5NXRmWEw4aDNnNjZp?=
 =?utf-8?B?Ri9TYlppVzZJbUNFN0lPT3d1ZVpuckNNdjNnM21rZE5xNDUxUWFnQm1zNlMz?=
 =?utf-8?B?Q0dVNHgzRVZSdlJ0akhQenpKZGRpMFg2cjFwcXhQUDZwM3NoOUhrSERoUG1W?=
 =?utf-8?B?UERTekpvaUl6NDNyVEN5ZVFXT1V0VDVSZjdMM3pDRXRHVTBURitCNUc4Wm1h?=
 =?utf-8?B?VGpVd1NrWTFFdm5yZHdGMWZmZGxtSUdDbGovQkYzNW9iU1ZLTndkVCtUOHRB?=
 =?utf-8?B?ZHlGMU9GZld1cWJ5Y0hpdTM5ejhzRCtzTlkvOStkR0N1TzZBbDVMSkFOT0lv?=
 =?utf-8?B?YSs2S0V2TVdhZWk2TXhLN3h5R29ocFV2TmZEQU4zRktiMFNsM2tDV1Z4bmlD?=
 =?utf-8?B?U3Z0SnZxb3dXWVJzR0lyTXFwUjQ4NVFab1NGSFFOdkJaclpEakx1MFBiOWJ4?=
 =?utf-8?B?a3E4eDFKazZpRlROdTlsYVhOaFRhTEpCMU15SU52WXkyL0tWNXRmNzQ4TU1n?=
 =?utf-8?B?Vm5DV3MrYXF5MGJLdmgzVkdFWGpQTTh4Rkw4VXR2MVNlN282eEVoRFcvZ1o5?=
 =?utf-8?B?aEQwbGhUeEszYm5ZMWVWK3piZTRQdmR1TVZPQnV0bEhPK1pPeHlieEpML1pB?=
 =?utf-8?B?ek42NHQvZXZEM3kwa0s1b09FemhOb3BiZDAxaFNyb2ZSM0tibzlML24zL0hS?=
 =?utf-8?B?NERsYldSc2RxZm92QjJCTFFGQ1hrSFRTcCtUS0pVSTFxVmpUMVZ4TWRMa1cy?=
 =?utf-8?B?N2VNQTVSZjR1SDFYNHVpZHBMZUN4MUdySnd2dmM0L09hREtneTRTZ05pbmZQ?=
 =?utf-8?B?K0FrM3VGbGkrQUpyQUVBZEpwT2t1NzNOMVFQUS9JL0VFRkhvSEUyTG5GUnVL?=
 =?utf-8?B?NmpZRVEwdjhwM0M3QUw3OW05a1YxOGRCQldLemRsTis3ODJaYmp1bktqNjF4?=
 =?utf-8?B?Y2pSOWVocW8vOS9LQWJWaWllOUx1bWJKK014WjhnVEZhbEV4Q3o2djdYRVVz?=
 =?utf-8?B?QzdLZXFEdG5UeFVNL256UStXQ1JyWmp3NVl4V3dMaVpLNzd1QkdvTG9VeWl5?=
 =?utf-8?B?TkE3R3ZpMnprcmkzWS9rRkFJZVFXRjZ0SjNkU3VIanJFcEc0R1ZZeDFlSm5C?=
 =?utf-8?B?c3lSQnpmUHcrUWM1RkRYN01rU05YQlhwb3JtcnZpbmtXLzk0NkRvQVFVMGVm?=
 =?utf-8?B?b1FyV3hYaUlDMStFNTVLc2dsRXhlZGp6dGdBSUNuSnBWNEMxY3VIazFQd21i?=
 =?utf-8?B?ZGZlMS9NKzI2MnBHY1NZK0Z2RFNiZ1RCVEVidTcyMmduRTArdmx3MTcxNHpk?=
 =?utf-8?B?TWpqdnB1UzA0cEkySS9XLzZaQ1l3b3NrQysrTmcvVDQwL0dVbG5Nbjh1alMw?=
 =?utf-8?B?a3l0UHk0UVZDWUlQRmkvbEhoWmV0N1krdVBNbnNGSTZiYjRoMEd2aWs2b3FI?=
 =?utf-8?B?Mi9Mc1E1anFINlZINW9nYWFxUGU5R2p2SmZmWkJyS2s1MzlOVmFHS1UvNFdm?=
 =?utf-8?B?YXZ6cWRlZndzL0JVRlB5Yko1RkpLcWJjM1BvNGJBbWI1aXhKRHpNY1A0NDdl?=
 =?utf-8?Q?5nIRezi4WPGACcI/Lcxt+bmPF0CYCwssNpYhy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1acd8f5-688f-4088-ffeb-08df1fcda278
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 15:06:56.6828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HjYrM0HG8vW3cIUlnuygOjxzCArJ4+f+t3Yc71P5vXew25qpNdR1PDYnbVJ1R2XoV4HecEa/IWBUIu6ZbDp2XE3lLb98CYCPDGDfTPOtf57Ao+vN/YZxr9nl//5nBC6p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7116

From: Frank Li <Frank.Li@nxp.com>


On Mon, 28 Sep 2026 14:36:12 +0200, Primoz Fiser wrote:
> Add device-tree for PHYTEC phyBOARD-Mira-i.MX6 DL board with eMMC. The
> variant with NAND storage is already present in-tree. Now let's add the
> eMMC variant for which the compatible string "imx6dl-pbac06-emmc"
> already exists too but was not used until now.

Applied, thanks!

[1/1] ARM: dts: imx6dl-phytec-mira: Add phyBOARD-Mira-i.MX6DL with eMMC
      commit: ec7b37c768d34107d06bd629d05cde0e2218ee9a

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
