Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C3C3EB7F1;
	Fri, 16 Oct 2026 20:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181549; cv=fail; b=KMGE3Be2FFJSL7tBll0y7+1prdSCnYWrTOFXvKiKkUdYpPEF1Tq17zr9ymmkOxU1I2EhttbkoAGcKqmrB4rgBeDGQBrJxLO5aZwxEF3HQTQIndE0u7dn9OWJpsJyNbZYCiQdl7Rko9x70sQYrj01v+IFWmICssboJi2Jz4j7A7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181549; c=relaxed/simple;
	bh=ZSHCV0HScUhdb3ZeqfWdP7s7sSbainssKKZg8Gt+RFU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DuQRQb+wr9QiWbbNceGwoIS5jgdOfvHk5y+rDutjIiAtzsKQpJQAhFSe4XRaBih3d37GxGlwxYTuP5/lkhgw1iYRpqbzBEF9WCZQF14UcUGmPDF07klyccSci5Jc7xysM2DF5KFqYX9C11Bu0a5OmLZ6lBaFN2kJvTihOL86MnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tIpXVs6z; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tIpXVs6z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggZkQJRshNnO0rc73qk1GIxjCS5/cm2M6H4FJdcIViSf7qVa/0Opp0tt5242k5llL30ps7Baud/lXg6aYHTNYHjnGmQ/Mk9ql5TzcZWfm0saNe6AO5EjV/qeB9dHt2e1ap0m8akOwx35Kabe7bc5Hsp+9kAKXXuQhorH+gbraQkdzvB56wcq3DTiebRZ5AlfVTff75ai2TDUEGXcxeBp/RUpjZtndm/qlWj2enN/gbXLrDTnEy4giZWW0C8+OH+JierdClD9CcLhEq3dB/26WObB1VhTwi/Q2/9i5l63UcEfnOCCLJQ4yZsz2EfneepnTZGU0c4ty+2g90IFYbiBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hVhEoiSqteEkiSm3cS0ymHw8ozIc/n7XL2vc9JVMyU=;
 b=B6lD3nGkGp72FtF/KmMIYHYAyOoug1xvSX03prl9DAmcEhXcLECR4/N+8f6T4nS93k2JCV7xPYSKMvTgHTDIVm8a8yihDROV0LYN9Mhu5+zT2afNAml7i72a6/xsu+2uLkGyeP77w0pRywnyhwiPk7Svea6CE4WbnKRwnwGkciY6Iicz5yhxVPwpUhvng+yLjG1W+fRxRo9mNXmhIo/jXcUIVtTa+Pnh0j+tJjlsqTDETEZRJ/6c4KVgDeaLmz6flXg9NWU846TCnJtTBK+zq7+TCpzZdNYOM3gPR9yva9xtRdimPkw1POH/GIXo3vPi18gUvUuqwnK70+QZkh9Jig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hVhEoiSqteEkiSm3cS0ymHw8ozIc/n7XL2vc9JVMyU=;
 b=tIpXVs6zR+1XzpJZ2KMPy1BCVofmz6Mp6snsVjfpWR7PpnaPjqHsjauGUmSyXOUjuTd49p6AlMlUhN39/qp6wBVkM3P4TpJ91mYdM89ccdkl4jg27mdJ/9G51dRJ9DQCstOnypVkp6zNc54rHZbQFjin/uycFT4S5izI48uXY81vnOv789X2Ow2NXAYhY7inABYvZlHfU0XyoyyctEFdEt3ISztQ4QgxTXZzzRKnJ83zSGJxH/z0XYEybDFomKldA0snRpuBho2nHUfLuo3tkW1U0zFxPYsxq6kJI0x+IfHBB8bc26V7FHdv+LvaoRWIlK/mVIuGoZv2o9re3F9Nkw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 20:11:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:11:59 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 16 Oct 2026 16:10:56 -0400
Subject: [PATCH 13/14] ARM: dts: imx6q-novena: use interrupts replace
 irq-gpio
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-arm_dts_cleanup2-v1-13-3a0cab9fd784@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181453; l=1087;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=r4pVtKH7blADh45NSSJUFbkWtxK51doD3ejg+xVQmPc=;
 b=HS1MfZdRZkbBf6X3t1Ci7gExan0Ja6qmr8jhoXrREAx/29iGCkEyR0NdQsMNmI2YKtagCS+vV
 FKC6RzqVtcuCgp13e2+idz04jikXZM24q67UWfymunQe2wCSQU357uc
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7PR05CA0072.namprd05.prod.outlook.com (2603:10b6:8:57::7)
 To GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 39abd48b-53c5-4a6c-9718-08df2bc1bc25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|23010399003|10067099003|18002099003|3023799007|22082099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	2xZsSf+168qECV+AfnLgTgnGBeh3QXyDOs5gAjo2L+bfs3/eD5e5ZLQfXVFF9J4RQQRY0SSAwIV5+fZuvRhLhSfgwACKFpu9DFsGNAnO8/Kt6Y24WAsaxoICTkFGAvboG/lqpkMYFo5mB+9+4lJnD2JYh2vaYbxFnHQWcRkvXCiTPNI3DEWYXBahTi8tcLLk9oVXzm+2cx+73R4Z2viuOC0HcoqY/K9A5+eKHf+9+n0XeCf0jHuQFvFTgERSx+2wUkOu1b7PMXbdhwWc4NCmpza3P/71OmBqht5RAVT2CXje/8aGhPorvh3OZRcPh7dJKxC0IixVzpo2NgqopSRSdfjKvYDMuNEmL4Rj+gSmPROOG9+ksbODX+PeJhkaPCdBPzoEnXB752Ta64u9GUNN0jymSD5bI/G6/sPa8PTuwn9Z3ZotdGA008YbXxzrAeMXqhbc5QqGKgP9K4NMfQYFe5xMit1D3HdIyDYBycu39qWAn9ZFkNhY9N5iALBTy0rLlGTVTEl4ZXWN5XptkM6jiuY4rGcAFNMc+jwMzj2Xfgyt1TlGVRyM6hy9NhUB4ApBu+8xC1W6R4WTLh08N2a93/htd51W7yigTNVmsgaDcrCBCvSSU2FTB5QNdT2/HnN1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(18002099003)(3023799007)(22082099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0FVYk1zeWJFSHlZWkZNdUJmRHIvVVdXb0JjdjFvR2Z1Q01lKzNsZmZBOTVv?=
 =?utf-8?B?Rm9TMmk5WjhTbWE0NHF5TGJ6MFhHdHRWSlZwcDlSdHBsdk5aS3l4VzRSR0hD?=
 =?utf-8?B?L3dJNkVmVW9KQ1JVUGJtYlBqSFhET0cweEVGRUZBUUVOdk1wVDNpdjlxUGVv?=
 =?utf-8?B?aWprZ3oxV0VzWVBkb2tKQTZ0M2dCN0gvUk9oWU9aTTBjUVRBc2VhR1Fkc1hG?=
 =?utf-8?B?NVNpZEdra2Z6R29HblhkSHNVN09LOXFrWXl6THFFS3pYN2hBb2U0OVplcUJt?=
 =?utf-8?B?SzE2NlBnRzRWQW9LYlk3S3V0a2JjdWJDTkxhaS9xU0YxL3JuOGdnaHlwZ2Vp?=
 =?utf-8?B?cnVYWlkyV3NtRk9CajlzU0FlenFuL2ZIZnpIVVNoNUs2WGZCa1BQWEJ0VTA2?=
 =?utf-8?B?NWhIMER6cDl6UmNKeDRRbkE1Vk9YRXQvL1ByZEV1K3phSElDM0UrWWlrbi85?=
 =?utf-8?B?S2VhRTdsMTg0QXMwbmlPVzZEaVNSSlJ4NSs0KytPa3UyRSttQnphQVBEVnBS?=
 =?utf-8?B?UENyeHJKcng0ODhyUGsrRFdFSHNaSTFkNk1NT1l5ck9ZS3dxVUcyT3djVDY1?=
 =?utf-8?B?QVdxWUZuSzhKd2RNYS80SHBrbTFPNWwreUVTT1lNS3JXTURrbStPTEFJWE0w?=
 =?utf-8?B?cHpRVmRLeE1RU2RaSDFlTXcwYVdoWDk2R3JaeC9Bb3liSGVYZVVCMFBldEdK?=
 =?utf-8?B?ZnBvYTEwZmYzMVI5eGNtbnVKME9pYUk0OXFwS0w5dFhTbU1KUTRWdSszeWEw?=
 =?utf-8?B?aDg2bFVSdDF5d25XT1RxRUJSN0VpSmEwMGlJOWxJWnVMYUx0eFExRXp3NFds?=
 =?utf-8?B?NDNhL25pRDl4ckRiSXNmL3RJUE1XcEQ1SlZEWnNUNFIxcWpBLzFjUEUrYUtM?=
 =?utf-8?B?SjM0d0dPeXloTVpTVzF1OW5kRisxRUtVcTdycHFkbjdjOFllRTFJTTBnWGhP?=
 =?utf-8?B?aGtJbGxzR1VlZElFRUVkTTJROE50T3QzRXU0YURuSkk3L3RwK0g5S3dWbXRQ?=
 =?utf-8?B?aUoxV2xCWFBYNUV4cEFKMEJRL3VGanVYMlQydVpWQWQwN3hNSGtDVlB3SzZV?=
 =?utf-8?B?bHVmbGltM2hLTW9FK1NVdzdWL1VkTHpLWTB3bjZoWUZRZXFJNUxudk9zYlBW?=
 =?utf-8?B?YmV1bWE4QTJISC9nenJhWDdSTUhhNEJkMXBmTGs3OEM1Y3FVZnFnU0MvQ0NG?=
 =?utf-8?B?ak9EK1hITkk4UDNkenRXTHhseVhka0Irc0U1V0ZpSnowdkJkTmY4SmJiRTZG?=
 =?utf-8?B?NmwyOWl3d0szcHlRWnlxSWxjU0FTWHJER2tKV0c2REwvSWlMaVFMU0V3S3cr?=
 =?utf-8?B?Z0pXVEtMWkFDaHY0bnRuSkJPK0J6SkIxWXpSYTRSMTdOK2lzclY3Z0VsTUs3?=
 =?utf-8?B?cmRMeE1DYWhEUnFjNXl0RTVJRnJhSGQxZ1pLMGw1NkNkcDlYZ2hpZytBMndL?=
 =?utf-8?B?SFNtd3hCUDh0WWtOK0h6cVdZY1RDS3hMaFlJbm5ObFRzbVJTcHAvblJTSWVK?=
 =?utf-8?B?NzJUSDhiTHVWNlNCSHFUdmIzMHhTamFiQ20xeGx1OXc3bjNMSkZldDdCYWhx?=
 =?utf-8?B?OGJTNFJMSVQ0ZDQ3NGxZWndZbnhhNEZtWElFckFsZ3Awb2NPUmgrU3R5YXM5?=
 =?utf-8?B?YlZPQTlpK2N3b1ZUTDV1ZkNpbXdPUkY4UURTVEVudSt6REtObWpmZnhBK1o5?=
 =?utf-8?B?cFAyL2xvS2FJMTNXNkJDTDBoTGRteUQ0M2VseFhRbHMzUytEMU1BMDFlUEh4?=
 =?utf-8?B?emFmbEhQS3NScU1XNGxUU2RJdHhSQm9NSC91aFZvZWtvMFFkbnovWTMvbW9V?=
 =?utf-8?B?WDdyeGkrdFBnZ3I4dERJK3JQOEo4N01WQndRRWJqaVpNT2xNZHU5WkRuNFBZ?=
 =?utf-8?B?UEV3NVJ3RmttQ0tGeStsZDd1MFhyYy9wYlFjK2RINk81MVlvcFpZVWZJUXJ5?=
 =?utf-8?B?YlNyVXh3MFpRN2dVdFdxMDZsbGRMbTVUbmgrdG5ybUF5cytoVndkTGpmeE5i?=
 =?utf-8?B?bXVRZG55UUJiYXFocGpuUDIxM3lRZlpUZVRKOWxpTkppeWltTG5HWU83MXp2?=
 =?utf-8?B?aDlnbHFydHk4emEvVTRwMTZrcmpXSU9TV3U2NjRUeUJ1dVNBdmw3V25mUGRz?=
 =?utf-8?B?SmM3MEl6RFcxN2I2VUE4dHQyR2VFSTJIbEttaXE0clRjNHR6Z2tnbjlaUVVx?=
 =?utf-8?B?cHFUMWl5RGQyRDk3SWFCRVp6ZDgrYzc2b0EvYXQvMXpoOUs4allvSWZqVmR1?=
 =?utf-8?B?MWE3SC9NYW5wTDgrV0xzUXFzcVY5V3ZPY1M4N3d2VWYyWHp6aURvL1p1eCtI?=
 =?utf-8?B?OEllTE01NmwxT0FsUU5NMmQvRlZkOGtJSzRVeUV4bW0yWG9mdGNtVTNLeU5z?=
 =?utf-8?Q?sUolD20Hapirhb8h6XiJ7IeCR1cgWRsU1tJV5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39abd48b-53c5-4a6c-9718-08df2bc1bc25
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:11:59.6403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifTt/3ye4mHNCL+OzHV4OGBhtRy1llBXFdH5XkW5Ljmr5nGfFoQSdngkQ6okne85FDX+rVb3nFSJIw/HhBYCR9Fh953KTYOyvNOvohcqqiPi8hWgt/fVtVPwea7AQU8X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738

From: Frank Li <Frank.Li@nxp.com>

irq-gpio is not existing property, which should use interrupts and
interrupt-parent.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811): 'irq-gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
index 9938a63b5110c..fce04448d932e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
@@ -280,7 +280,8 @@ sbs_battery: bq20z75@b {
 	touch: stmpe811@44 {
 		compatible = "st,stmpe811";
 		reg = <0x44>;
-		irq-gpio = <&gpio5 13 GPIO_ACTIVE_HIGH>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&gpio5>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_stmpe_novena>;
 		vio-supply = <&reg_3p3v>;

-- 
2.43.0

