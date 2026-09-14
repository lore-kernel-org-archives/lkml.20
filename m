Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013064.outbound.protection.outlook.com [52.101.72.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72192317164;
	Mon, 14 Sep 2026 03:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355863; cv=fail; b=GxVvdXHoDQM21iBbGoemvGVQZU6WAgDNpjUnUH5Csmvh1fZPFC4AAVDBD2E7smSMbT5fwSl9zidMUwXIABxtZuPtvUDB8G+tERIhfO5JmEhatFL7bt+pX9xi1Kd1xO6EZzvCPYib501bc7++nzxxeu85S4lsbUQuR1rGMdJCxcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355863; c=relaxed/simple;
	bh=Rp6cRFM6JfcgBOMQY/LagwOJqaYZbSbSBVrk6Rp+2js=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=ZocxzTDCPrfkn/7GnKlNVPAIyTB2gVXzGhdUp7KTkwkRw92pf61dQAqgrIPOrOSb6OeiahLJconzOeDkBF3EqAwGRb7rdYlJHNkmhh9Lmpvpc9WZnD2/0V/Aa4LJhogMZLp2uzWpbdQmlfI3PR6bt8WzEpXK3K0dtBLisrP3EHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ppV9gzyx; arc=fail smtp.client-ip=52.101.72.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ppV9gzyx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZSLjLElgyP0y7tT9OgE5sDduD++OVhB4NZ/+njTVIyCd6oaFo1/AFUeqQiWAG1JgzTMNTWBc40393N4pFV+/jWd0mFGLZYxpF/HHrzBnzNYl7XL8HjjFCXMmlMMV58//7EndDuOO0asoKxEkKM53jrwb6Dkd77AlsJWGMIAikL2NcHGUzOfCfTohZ7xdyZHtBdURiG1+twDM0JGDhTxUv36YkbsDXw16uloHAjr61OngNSgJWB9MF6T592YJ/cjn21BmjCm5glVl0cQ9AJvpo/mvWX9PHz3bK4zcuxB6qpCBgxSCAcJ46sNQiIASPabEFzLE8Ommbf7PmUBmxSl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybUDRHML48CM0LX0EoFtODwcuIZKaAmIztedzUd0mU4=;
 b=TR5zyo3w2vAdqDHTVofUF3erUT6rBSVN4Pq5qmkM5J/dKPEzjRzj1pxd+pn2nAvCeYxjg3ymo7OqW2QVC+VsvxTcIM82gqP2S89Lq6Za48ZXfhmQ0r/Wxa6GRS5EV9w/oRbtv+gM1qavgXT6E/LDnIAsQPR2hmPmRRWMj4I6F19jSvIHgaKGTZRgobx0p2cT5ot3OjjhqNwRWsOU1kY1ISu8e2BZutjVxc0LP/33iz3nFxOAxWn9pFTJoEG746Vwe8IAtNnnz/abUEgbiaFo0R5cgutkrihqPE8r/LphPetDYwsjdFURsqyMQBEUMmVz9Bjr0GAURQos7xvCVKAOgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybUDRHML48CM0LX0EoFtODwcuIZKaAmIztedzUd0mU4=;
 b=ppV9gzyx5ToGQkA2u+3pwSwsVFPX4YIL4a5y4PtHXCmhu3VZXCAdLhUIEm5n1VesVoQqKiadP7xHPSIY/FTAvB91sxtNsOH/FQm7OdrVGpvZYywp05nAMIXqtVT/eirh/WB305CaOGqtyIxl+cJpLGMOQf1Fb7whvCflrYHIg5pIKhqDXrMPDOu2QcnXF8BNlGvchaYJM5OCsYSFIAEpuMHZw1b55uMMej5iUa+UzjMDsbpt9c0dK2PiH17sQuLTMx5IFCyyN+hfQ3Xhj0GMPMNcq2i5yV3Ke81p1uuurvPLFF3cnz5mtaKKCFFdWziBpAS9DdT972Z5T+1BwBJ8XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by PAWPR04MB9720.eurprd04.prod.outlook.com (2603:10a6:102:38d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 03:17:23 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 03:17:22 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Subject: [PATCH 0/2] arm64: dts: imx91/imx93: add rtc1 alias for external
 PCF2131 RTC
Date: Mon, 14 Sep 2026 11:21:06 +0800
Message-Id: <20260914-b4_imx91_93_rtc-v1-0-daed1cba0714@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACJop2oC/yXMTQqAIBBA4avErBPUIrGrREjaVBP0g1YE0d2zW
 n6L9y4I6AkDlMkFHg8KtMwRIk3ADc3cI6M2GiSXBdciZzY3NJ1aGJ0ZvznGVSuU67hUjYVYrR4
 7Or9jVf8Oux3Rbe8G7vsBVYsWMXMAAAA=
X-Change-ID: 20260914-b4_imx91_93_rtc-07d17cf027ab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::10) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|PAWPR04MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 933b8a52-23f0-4da9-e697-08df120eb160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|19092799006|921020|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UhD2YVE+NrMcEK3J2w4lbLNBhturXqrrBnkAaubGy4ur84XT+kUQWh3ZXck39neVdWLnevaTQffFkW41ZZhK3PgPjWDQcK/7w70WLhLA04cpr9wBztbXjTLDBNvfr8as80f0Q8X7XNqXcsvH4z1Rxrj3tYAECwL7W7hkrpovKUcr4nC1DZL9aMwgE+Z4mQPI3HiUzOFdFv5dZW+DbMozGLl0g/XyVVZUok4So/VQENeyIbCeM5KhUC/cgMypE8FKTHju55dvjpHRX/o8azP/etADdtooNNBMX8RbD2Va2RvNDacmvjXhLQukWa2a4yA2AP9AGbdqVu4cmx2IGRfoE+UU5BU3WnyqmXb3a2Mler5UZv7jN0LFW4aF3bPkC/CjAg9R/LV2eM94OjLqoiVNrTgCZOjSFCbHwbPr8WCJqmrlH7xR5M8cAig42bIlZhQXkbuVkwYiwgNUbCHy+790/xqVsMsG8vpb/TjvVp3k80fgrRJ9vQwF3uGkflRXQiFIjK8eRTZwgbxGILyHjY9m44lkFOOTeGw47QihNvD6VQuI296YrbfTOCh0Z85jdu4/GpC4nxXk3J+bJltnV2V/6HCdV8JrAZurI9yw63R+tkjXgJUoIR3wAMckmOKJgRBE4gPZ+RhUCmlRd9uxHFy7klRbhRZC+yVrAn+ieUkDG8dRa3IyWlDTTCTJ07HnNFOdEvBi+ig0kMCCHjPOx5mjjg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(19092799006)(921020)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDBDTFprVEZuSFBDWnN1UTNFejMvZWl2KzFwU0h5S1crZTU3bmtSajR2ZHZu?=
 =?utf-8?B?T2VoVTJ6WXlZc2N0TGVNYmlScG92eUxxcndIZzhiRzNObG9UbUpHRUNkYmkz?=
 =?utf-8?B?QTRLSTA3Z3BOQytjbDdNenBLekwyUlEzYjlQRlJhajFxTkM4S3lUTndyaTVq?=
 =?utf-8?B?ZzA1NXdwWkxEVFR1djY0K3dNOXV5b2hGdU9aTnhENHZuRlk1NWtyM2hkSjJL?=
 =?utf-8?B?Y3QrV3FQS3o3a1Mwbzl4cXVYdFB5d3k3L2JlaFM5TE1LU0w4dyt4ekRzTFNp?=
 =?utf-8?B?M29uS0JKWWxOci9TMys0ZTh5bnM1K2MwQkxKRzFlN09pN3pMRlptYy9reTJ4?=
 =?utf-8?B?WXBFRk04MlNBZnJPV0NlVVY0akhNK01FUHoxQmhQMFRVREUweFNrS1Z5WUky?=
 =?utf-8?B?endNVVFYN09ucmt2bFNYWUUybnZNMnIvUEhTWHhWeUZ4ViszWGovRTV2VDV6?=
 =?utf-8?B?c0ZjcmFZeGVHYzd3b1dyQkgveDIxWit5V1JzZW5HcUFwM2pqTytRTExZTDQy?=
 =?utf-8?B?QTBmWkpHaytUdCtTMnY0bC95ZUowbk5XaU5vYndUeTh0eFd4NXdFSXJLNEtl?=
 =?utf-8?B?eEhHUm9nZmlCUy9qblI2SDd4RVhLNTBmTEFGNUFXVnYwM1JUaEh1cVFLbFdh?=
 =?utf-8?B?cVpXRUZVZzdpdmRLUFRZV0FtUzAya200Zk1SQ0x3cXloVFIyWGx1NDgwbUV5?=
 =?utf-8?B?OG9rWHZTYzN4Q2wwaW1FUEV5bmcydlVYeWdHU05PT2Z5S3c4VE5oeXpRNEQx?=
 =?utf-8?B?emR0RURWTEVOYllmdi83Um5ZRTVOdnlSTzRWdEJDMDhCOStLc0lHR3d5NFV4?=
 =?utf-8?B?SkJmZ1RUbFZNQWZQVys5ajJrdDdnQXBQZWhmUWlOWmw1UGNKR0hrekoyTUxO?=
 =?utf-8?B?Vk1tZkpBbjFZT3VPZ3pvaUZEVEY3RFBzdnhOQUhXL0UrN3hOL1Q2d25uY0RS?=
 =?utf-8?B?TUZuSUhiUkk1bVlyZGNReUc0NG1PemtMWE8zTEdVaXRUTk9SV0VxcHJnZU85?=
 =?utf-8?B?MUNjSGc5bzRDSU5ZM25FN3JMRXVaTDBvaGgwR1h0REJ0cTlIYWwydDBUU0ZG?=
 =?utf-8?B?emVvY0dDRG1VelQvZXpYa1JJNlMwTVF1S2dSZ2ZXR3U1L01oK3c4QXVBdTRw?=
 =?utf-8?B?eGJqejdGZm5mZFVBUVBMUjAxMGR2SjNYZzBXOFp2SVEvMWhTeTRZSlE4SmpU?=
 =?utf-8?B?cVVlaWNKTVNlVktNWk5Jd3lsR1JTYVNZSWY3aTdFS3k1RzU5RCtaOUt5bmR5?=
 =?utf-8?B?NE1CTTc1RjJpY25TWVdGVjNLbjNJdHJLZ3U5NE1YSzQ3RGlLd2F2VTF0d21E?=
 =?utf-8?B?UHdDS2RTbjJpekF5YVNLaEJHNjJwajJZVG5wMXJYK0RwSnA1dlBYSXozTnVs?=
 =?utf-8?B?WVc2NUZEbUo0Q1BrUGlMMkw4eGlRNVh4S3YwMkdDeWh2OUFaM0orTkVjRzJP?=
 =?utf-8?B?dDlzVlp6YW5yUkNDcVhWZCtIbEZjLzkycFZXK0FNNVh2b0RnZDdHc2tUeVZ4?=
 =?utf-8?B?b3dMUHJwQ3ZmL1YyQzd5OURTYklOa2lEblloSEdTMVoydS9ZV2thWGNoRUJF?=
 =?utf-8?B?V1h6N3ZvQ0tHdFdRNVVHSVBHckEyV0hWMHgzbUcvTFVkd2VxLzVYN2tyMjVP?=
 =?utf-8?B?S2c5b1pLZkI5aUJaWDF6K3RnUldoWTV2V09nM21qZHBKNk1EaHlESXowK015?=
 =?utf-8?B?UjM0elVWNmg3Z0RlcGdSUlE0MHJnbGl2MWRUTjg3clh6OXFCRkoxem5hc3hT?=
 =?utf-8?B?K1VrUUxRR3h2VFJwNmpyV2tsa2hBaXRqY2wvVytMK05DajVLcW9NR1ZaRnB3?=
 =?utf-8?B?V3llVzV5RXZuUUYvdkM3bUk4dVc1MkhHTDZQd1hSUzA2Qm8wS1VtdjF2MTZr?=
 =?utf-8?B?Z1o4NVRPbUM4bFFscGY4aTIxUXlmN2JKUitwTFcwZE9vc3U3czhHbzNNRVZr?=
 =?utf-8?B?b2RnWWFWN05Tcm9qSFJQVWN5dmcvd2lrcncyODB3ZkIzcXpmcWQ2WFhScTJv?=
 =?utf-8?B?K1BGT05hNDYxbDRZYUtMZ1pLNnVCZUM5dC91N3J0dWZ1MDdlNlJIWmRIRC9m?=
 =?utf-8?B?WjBZZ0tJOVpyUVJzODJhblFLVk9mZE9HOGdQM0pkWXN5RUNZYklmeFZndjdF?=
 =?utf-8?B?VUhXbGx2SGtoQmhMcndHc0xOTDlOeVhJVkVvNkVubkhzWk1mbHcvMHdobjda?=
 =?utf-8?B?Rk96aU12Ym9pclNscXZrRDQybFNPTGZxZHhBOFEvS1JSekhSN05DeG5KM1lq?=
 =?utf-8?B?eUo2ZTd4ZktzWjdSRktZTXVaOW9Oekcrc2QrTkUrQ0k2OS9YcVUyNEo1VW1G?=
 =?utf-8?B?UmZaSmE2Rys4NlZqcjZGUVdyVXlmRHp5WmoxdDJjUFhxeUswMG9KdG9PYlpt?=
 =?utf-8?Q?Q4+zO/QxA7EM6A4XB+24UVIP4y/TjFwzK6jYZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 933b8a52-23f0-4da9-e697-08df120eb160
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 03:17:22.7116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNgWylJ676UA9DMkOGQp1uXbjeyJeAD6UxDwcFdzTZWVHxh/4oHYHG8XILVnn4FzES5eRX+VjKsv85UTuszEG3KtTmU0UUmPkc0ndHYkv7w6Vmb8Ec+dV8O1gn4CcLKD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9720

Only rtc0 was aliased to the internal bbnsm_rtc, while the external
PCF2131 RTC had no fixed index. When both RTC drivers are built as
modules, the pcf2131 may probe first and take rtc0, pushing bbnsm_rtc
to rtc1. Since suspend/resume wakeup relies on the internal bbnsm RTC
being rtc0, this broke wakeup.

Add an rtc1 alias for the PCF2131 on the i.MX91 and i.MX93 EVK/QSB
boards, so the external RTC keeps a fixed index while bbnsm_rtc always
stays rtc0.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
Joy Zou (2):
      arm64: dts: imx91-evk/qsb: add rtc1 alias for external PCF2131 RTC
      arm64: dts: imx93-evk/qsb: add rtc1 alias for external PCF2131 RTC

 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts         | 1 +
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts           | 1 +
 arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi | 1 +
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts           | 3 ++-
 4 files changed, 5 insertions(+), 1 deletion(-)
---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260914-b4_imx91_93_rtc-07d17cf027ab

Best regards,
--  
Joy Zou <joy.zou@oss.nxp.com>

