Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF6E3BCD3F;
	Mon, 14 Sep 2026 19:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412992; cv=fail; b=Ps5wMKtNC4BZc1/qW+qlHlKUFsQSwpz58MMvf3vhzKPhTZBo2xHE9smVDUsXe4aOpyszXvkfdhF129tXYwTKhvf/gLegcUoSJl+VoVmBUjUIU+xeuoDU8uz3GfkSDoB/0cJv12jATpI4pFOmJNMdoyLmdfbNSokJIkiyE0enhvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412992; c=relaxed/simple;
	bh=gOalKMf/1vqaq9xwqIrHz2LoL/ESMUY+rMjzgRHFIec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=byojQ0MKs9GjDMbVNvzCZsqoSB+Wcna4900L7VsscYXeza4pxk+j17QR72XPlmYv5e0GfU2ghR39hLyDAwmjrIytSiDnoQWk5fEk3Q0SpuBsH1fslD0KNnGpPjrxgL21rCLU8RcXLP2lnCZIHcqI/brFfDXkiquFgd5EFF7m+eM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bpguHcA4; arc=fail smtp.client-ip=52.101.70.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bpguHcA4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPGha+NCDnm6eDxrqRnkykZXOM+vOP4BZ+8fvG9+q93L0G4s39IcnTMT6up83dMk3ad8Tzd2gS59C6QreiAdVhQrB+drVP0t3+OS3gWcpvrQj9lZivIobsCtzxKdKZvALP64lGVEckSFdw5BRcGrzaTeGuGlJZpHPfJZh1T9GEq9zXoyB9KTsgZfRVwizaOmDtjZ5iEfPHlVXWTPLEYF009f+mIFaFKql4aINk3pYh6pAOv77EMAnmu8rX1aylk1pC6t5FGsdzzkYWskz21QRpNVO33lhzRNulvJQ0ZniMBZZeDfgHRj0xy7gKLhkrhZMW9alNuRGNq3cdwEMiz3xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36dVw8qTL/Q1VMqi4PItPdR3kf8JJV9T0ibvzLPdGpM=;
 b=UH5YMe/QhF8LxcLeF1H3U3sIxXpi/C2tcfkEKdQfVqafJ1ODF44QigmtY5waWSFw1ZAxJnsnXR40lZFTMkKpxacby66Wz+6o4trTtCokmzyCJt0q4CZFS+mH0Wafcd12RxhvA25/riMdrYQiYaKOxsjGB2fS/YxdYhAEu34ETP7vvzmzeshE051fsmKa2rahf3pZn4dG3dsa+51VuUWwMLloeRmDqyhUG/Ayjnro4QXS9CeBoKwcYKUiA5yi8fS7MlMHyuQ53OxqmV3ZQp+4OQcLuefTn0c8RCN7DtXEPjxJMiZUAeNhwRm33z+pncauWpGt9tXxuqfL2nPKu9gG9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36dVw8qTL/Q1VMqi4PItPdR3kf8JJV9T0ibvzLPdGpM=;
 b=bpguHcA4IhgAZ9n3vooV5RTJXNNcqBbt/T6KuwUn1ROXw1/MmdSh19ldHlJlWgaUqbxarru/i0/04SNAIIvm5kTel7m0WOLJEfzal9U62nYfYOz4hTmreymAccq0Dfu29EfuzJtqqe9xLV6a1MBgDVFl8/aVbx1lYtkDrDUourUsgR+yueJEouOxOKhGTMel0Uf5s/JJVzvbiEOXkDdqedz+IJvwcffi3zXsJ2G+n/YcRJDh7E9t1M0wF4eIEfsj9wsUeAKNdco5FLtictuyGIvTxnuYs2lkrsE8n5K/HUiB+yalnLaC9NCk7TOSsCpedjy4AAKyvKXU2fYanGWlSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MRWPR04MB11517.eurprd04.prod.outlook.com (2603:10a6:501:77::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 19:09:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 19:09:42 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Franz Schnyder <fra.schnyder@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: freescale: imx95: Add ENETC port 2 in SGMII mode on Toradex boards
Date: Mon, 14 Sep 2026 15:09:35 -0400
Message-ID: <178941296558.1805658.16952269928496778243.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
References: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0098.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MRWPR04MB11517:EE_
X-MS-Office365-Filtering-Correlation-Id: 978042a7-5b28-4e35-5ffb-08df1293bb78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|19092799006|366016|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dHsrTBvdhIFl8EEoBgKiiC1i2yaLmT3TphG2HaUJwS1V+Ec7/Gl60AFp1hUzJSD+7qmFFcUp7OYd4aDmIfsbrwnDs3A6kFtprRbGjdblyRzwWNwJlFbzkUaf6RgCgN4fhsZDkLGEBFdzuLOeUVztW23p/40211QZOhEB50HcvSRNEsJr8cpXqdZRDEkFpeNNg3hJ8JmPQRpc3GF1gGS5I4n4wWaQwAaFSRHJkwTZJvSGHwoAKZ/qM/uEGm9oQp5wiJCByO2pxM86Ol5ctn/Mgzc3cg/JKPr9NqGH4+Q+qEZbNbreAnoKh8GobLRuWssnJfalIbuj+G8DZ+SuJQr1et/uR5OvLDWOzdZKMNuaQx4OeeACqzL0DbVNK9xQ+mXUBGofzJPMJsw4h/xHXgoChAyjRp6ydnUz566/AijSc8X2kO0Jz/CZz1AEycmBd9HLIKjSOYDDeVH2dpMFu79Vqr9P5mmfnO7ZzFatyo8K4GOfNPnWoDLk/S3eiaH2N2tUS+Z9B1dp/3vK1lGqCfWRjdcPw3b+rqXx8I+2+tmTqKHsKCgANupdnNhdN8sBy2AVGAM+mKHxFgbnhx77OlA9d9vZ6VDqGyBCJmLSh1WUEjSmCaGGHVFGnzPgQp9cFH2m97Vq/KgbO0EJieBXmvGdkc0iFLgHnOj0uhM0VuJ5iKI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(19092799006)(366016)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWNLcE1NZTlQSHI2eXZ2bXV4bmFXZWl6U0dhRFJ1azRqN0dWMlRJVEl6QTBU?=
 =?utf-8?B?L1VXNjFpemlOY2tOVFpRZXFseGN5N1NKaXFxVHFkR3ZOZGxzckN3L1FKek5h?=
 =?utf-8?B?b1Y0V0RZdlVMNy8zQjJRTlhPbGpmS1cwcTQyVElaK25BYXpOREptS0FPdXo0?=
 =?utf-8?B?V003N3Z2S0lSem1BeWFteUdJSDNUUEdQMWt0dWJmUXg1YWJCNTJBSVZHNmhN?=
 =?utf-8?B?QUwwN1ZJV2ozVFAvN09GTU1wbUxiQmM5NTJvL0twMndzbVFSMW04MjB0bTZx?=
 =?utf-8?B?VTdRTW0zQjRTU3ptMUZDUTJBY2QwSjNsUkVlTzRIWmpqdHRYbjMrR3c2RkFB?=
 =?utf-8?B?VXRiaXlXMjVNd2ErUFBrbFB0VFhsUGNDangzMEl5ZWFwTlJCa28rbTkzdWF6?=
 =?utf-8?B?cEoyMkh1UGFtbDdaYVdpYndQMStIWlB2MkhlU3RZMVNyVHF4MWF3TlJxZUdm?=
 =?utf-8?B?K25Bdm5uaXdHSWVqRkdBMlNWTmVWeFUwR1dMMlBzWUNDdDF1TUxkZ2MrTGRJ?=
 =?utf-8?B?OG5oaEF3MGVPMEJDRlhrV2hXbHpwK2FhS1BFYUQ0MmtVMzA4VVZwdEZyZ1hx?=
 =?utf-8?B?OHVzek5uYlE3LzVKRHNJZGpqZkdMQkZTTHJUWjFERVc5SXpibVIxK2s0U3gz?=
 =?utf-8?B?aVo5TU0rWWNmMWJjaFBzdFBtT2xJRjhKL1k1OHRVSlBGRkxzMy9oaXlYSHFk?=
 =?utf-8?B?NHlOWm1BMXk1NnRCSmltYUxPS2VxZUJwYjdJeDlVMStXbkM1bTFkaWo5a2xQ?=
 =?utf-8?B?bjkveHBqdjFKVkwwY0ZwNEZGcmpuek1JZ3lWL3I5SDVidjhkTENaMEJiSWh0?=
 =?utf-8?B?WXVORmdUaUFjZmVIakVPelRDUWJlR3hIeTdhakEwemVNb2UzTUp3c0NJemhr?=
 =?utf-8?B?eUF3RFBzMXpzNzIvVzYzSjJkYllXMFZxTGljT1cvM0tZSURXeUlFd0RYY1hX?=
 =?utf-8?B?OW5mRlpuRnFSVGJGN2JmLzZuU2JOa0JBZThJSUN0eG1pM0tkN2xEdGNSL2h1?=
 =?utf-8?B?d2Fna1NJWDEvS2JmTDZ0REl0N0ozWkQvNjlYeDhtMGFkcm5CN0p1ZHBFOHNx?=
 =?utf-8?B?M1dLMm8yRHpzMWYvUUczL2JHQVlYdHRwNjJwMmZmVXR0UzljYjV6Wnh2eEEy?=
 =?utf-8?B?NGJtblhyS05NcnV1eE5RUGlPWW5tbnZlZCtvNnZTeDNpaVRRa1gwTWptVll1?=
 =?utf-8?B?QUlXdWpnUGsxMXNsaFFtTmJ4Q0tUZHE3RFVCSGFxa24vVmdCTkdpbmtUc0Ri?=
 =?utf-8?B?eVJpTUQ0RTRneTRiaU95bGNpR0RxTUpUTUZodU1TeDVLa3FjWEx3U2gwbE9x?=
 =?utf-8?B?L0RKSU9FY0xFT3JmcVJ4ZjFMRlpYa0wrWWZESW9NVTJib0xyVUdnNEVCMHA4?=
 =?utf-8?B?aHRaVGRhY0liMW80a1E0d29Jd05PT3FmbGEvQVdwQlVpWHV5VHZqZi9FVHNu?=
 =?utf-8?B?eEJKbGY3dTJFSC94YnljcmViRUsvSlV4cjZIaDhxNWlTWEdsckdrdm4vUnhX?=
 =?utf-8?B?ZGhmQUp0QTJDTGVKQWxmeWQxb1ZWdnZMdFNQR1c0d2tvQWM0S1JWMlJIekxa?=
 =?utf-8?B?bE1ITlBXa2dIL00vcy9HdVFUY0s4eEs3NVZEOFVxd2RuSW1oTC9QTkxJOSsx?=
 =?utf-8?B?ZEpmTGZoamovN0hEcWsvMGpNOUZCUjFXNlBVcm5MSVZEOU1Rb2xGbi9lVk5i?=
 =?utf-8?B?dEV1UUZ0RlorZitHNC9xTkVMTG55cy9XOVZOa0d1R2xQY0RoTEd0V05XVTQw?=
 =?utf-8?B?V0N6OUdkNUtUWjdETXZTT3hiNGNoVnpYQkpWM0dnQ2tMR1k0VVpGa0h2STZY?=
 =?utf-8?B?dU5SL1hzN0p6NE52S2ZlWlBWVjJWN1owZXI3OFlKYUR3TGpKNUxVSS9MbHVq?=
 =?utf-8?B?akpPa2NsNW05SmUvNktUakcrYzFyaW5acUp2VzJpcVlhS0pYb0ZhNVEvQmdX?=
 =?utf-8?B?NEcxYngvS1NkNFFXVW91SVBnVFBVLzRZMHdSWk0rck81ejBRT3lqcEl2TzVT?=
 =?utf-8?B?elIwMWtMSVlEblZXU1FZakFtM0Jabm5IZzE3WmN4UG92N3EyemdCd003UnU2?=
 =?utf-8?B?V1E5emFidGdKZThDZ1dsbHlqNENvaExueE8wT00xRXRCZlZKMi8rb0N4N09i?=
 =?utf-8?B?TWRVWitnNXhlZEgxcS9Zcyt4dHR0SSswM0NJYStvU28yTHpSaVRaWDRkcjBR?=
 =?utf-8?B?cjUyUTNCbFNPWDFiWVR4YUFERkcxTmJUeGtSMFVhQTd5UmRQejQ3MThHd0Jm?=
 =?utf-8?B?QmVLbzV1ajRiVnk3YTNpOVBlNWpXNklkQU4xb3BPR285QS9PMmE3ME0zVkVK?=
 =?utf-8?B?SU9PNGthdisyNnFzVDVNUDgrNmdaczc5REZOZ3VGNHhVRm95SUwzWHN6NWZ2?=
 =?utf-8?Q?52razJ4TEUp2gmCwgNVMcrD5wbK9KwegewSWV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 978042a7-5b28-4e35-5ffb-08df1293bb78
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 19:09:42.7070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8s9BXCFHKuOQxeS1FxNg3FTf6xV6AZnZi6Ng4SNgxiGzHK6/JYMQHhmDjWDiUWp8iMje6MRDIg/8X7Q9+e+PhwCI8lo/U/ZwbEPPRl2tTvEeW88ricteeNLkWJEUvjc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11517

From: Frank Li <Frank.Li@nxp.com>


On Mon, 07 Sep 2026 08:47:19 +0200, Franz Schnyder wrote:
> Add the ENETC port 2 on Toradex SMARC and Aquila iMX95. The port
> is connected as an SGMII Ethernet interface.
> 
> Enable the reference clock on the modules and enable the PHY connections
> on the supported carrier boards.
> 
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: freescale: imx95-toradex-smarc: Add ENETC port 2 in SGMII mode
      commit: af77a47c0cd2be48b0a76eae1c84a833ebbcef2d
[2/2] arm64: dts: freescale: imx95-aquila: Add ENETC port 2 in SGMII mode
      commit: 8476e5d51e47926983f6c4b774024746a57dad87

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
