Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793983843;
	b=R1kgGfVG0A55GF738lJBTBFPgctITOF3DhyyaUH68PB4pyRT/W9EpmIoimuMFB9DGDsN
	 yfvVgmW858MekAXyBRcmmiwWZylqqo3qfSZ7opk+f4G6O566Vq0zoHrIdXoe85xLsCHu9
	 pXzZ5V/fjtON3PKjkBImuvH0Z16QEFBEXKhRYZ2gvNP/X4efCHBFOWnoe63aB3RfcAe1h
	 UPk2R/lpjSYATVDTqTi1AdrXuY1mCqk2SEqQ5wE3lKS+UOQT7Dm9WjwJUfrdZNT1ZFYKU
	 5PJz5DZTsteQ9DkLuzD1B9/4FdBmMugobcrY2EauTE1Ya+jBlieBA1b+XcJknJ0CyYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983843;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=xLThzTp7Zck+WwO4cEdqE8Vxw+k5hwEvKayjoFahe24=;
	b=Llhe98Y7qAy4G7RpcA0FsG166Vt28+QxNVnchf9DMpBnDS4bBpDbQTZokr74QABesreH
	 6v3muHZpRHwFKDPYglJ0HAryRYV55cec6ymUiYvH3k7yJC/GUQq8aX1k5xSTDkwiwxfAW
	 /bF4gq/bnxIlh0f+vZ6onf7SqDYI269KTM6wv/XPuxOCou9yH62zC2a3vYi9V3zuxx119
	 x2XdFzoq930esxf9IW2sRGEE9cQWgSLphJ7tSdWvGuKF9zlTnqecc5LeGnBf4f14e5twr
	 b8a9tl4aBfLABDZDF0mJIvz3lv67mBphGENjQB1ZFlvInshJ7ksuWdVkFxMPnjepOzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Y48cBHL8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.30
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011030.outbound.protection.outlook.com [52.101.65.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984DC606A329;
	Fri,  6 Nov 2026 16:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 984DC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Y48cBHL8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eX62F4yCViDiiJTsZA9ETbH2FeF+rEx1EOz4b6IfgXsx6YarEof7A03/PD+hgWwx0HXp09iRvvDwDF4VhLkby00dTOhd2uNy0rwKecYerF6X0Ye8jb81kZ/5lTkD4O+g/JSet7Dmr4Oy2j+SASsAtBkBMpnDkuhwzjOyJaYsrQs2LxGLr2AxYaHzb3pw0d3VLLst5lF56qCFmNs96LR52JPovL0YsPev4bbRzb5qrQenWAPbY1u9+idCXaSEOg97WOAYxxEGBDTWhjT1DLFOl39x+lwroWfDVnS908lNi6OrMpfQMezHRN/M6UZ+sLBx9Wo+uxUwrzKmsRiw7KI5pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLThzTp7Zck+WwO4cEdqE8Vxw+k5hwEvKayjoFahe24=;
 b=t65Q4GV0sPPzaShP8Yjb85ebsnzRGRHd7LMb0Uue+g7u0ZZakRez5EjH00P1poNGMtLDTdVStd6p53AVpa8A9/PJWler5GSX59v9ip6IvEP77SqtU2fqVK4DxmcWM83pFElncb/cZCwyXWJA10/v1gss0eA5BDP68UDkP5ynvdXUWCq4Qju75K0eeSc9gNWeTs3aLDyT74FRUIP5rpdSygnds4QUF4t+prO/7iksyDCX4BD+f4zuPwKy102sLRQ+C1fc0TmOKuVGxYvNudkuh8pCyiDIHmRxu6yMek39eJ4+BFqh9ypsNstpSh/nGrn0i5ix3dHg2gNAb4sGCz/0QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLThzTp7Zck+WwO4cEdqE8Vxw+k5hwEvKayjoFahe24=;
 b=Y48cBHL8JQog0fNzlaNHo5ACa3qEPHoUEemrMpySSyMoFSjb1g5WxvmY5mlWcWC89fcirIv900CZAu9SkyJls6BfWQbqTAaaYjxUbNINsBBzEvQs/UovbyztMSYBR/xfjrn00F60G7f1sE6x7qZIWqDreyXFm/oR0OTtaNRzEcW2wdnsEKmHGeSwVe/z1JVe7/FIDYWj89gI0DWi6BqQGWSu7zVhmSymezVizgAgk4ADrdxqQaHyk5RhamUOO/qkVvrtK9XjdlCkErlFAYH7oCgtVJxL5Kzoezb4yYWbOajYLX4svLi83/+ytWBKNs1ANcNjrPNr89RUe/ubFheQuQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MA6PR04MB404727.eurprd04.prod.outlook.com (2603:10a6:250:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 16:50:39 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 16:50:39 +0000
Date: Fri, 6 Nov 2026 10:50:28 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Roman =?utf-8?B?U21yxb4=?= <roman@amarulasolutions.com>
Subject: Re: [PATCH v2 4/8] ARM: dts: imx6ulz: Fix BSH SMM-M2 WLAN host wake
 configuration
Message-ID: <au4FVBb-AR0ohfiP@SMW015318>
References: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
 <20261105-add-bsh-smm-m2-v2-4-fb5ffc7da486@cn.bosch.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261105-add-bsh-smm-m2-v2-4-fb5ffc7da486@cn.bosch.com>
X-ClientProxiedBy: PH8P221CA0058.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::7) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MA6PR04MB404727:EE_
X-MS-Office365-Filtering-Correlation-Id: 000caa55-4e5d-4d11-cf97-08df3c261688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|56012099006|11063799006|4143699003|261022075727099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026121527099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	YgaaQCRmB0ft2OQ55aef/BLwk6sqNz54ntcGAGKkuYOk6Mcgu4s6935sIA2VYO50QHPuN4eCekcYx7N2q7s/tO0uKuYIx7huEUK5eGNDacriVYBDJkWTrDCJOzdq1Mp5/Mf51S5qw7Woe3hd0R6r7nSUftnVdffFp7yFHx8zj1pezlg5vqQktpfPU2NgRCz03GR4If/vPl9UvDUvXHMPq9KllyxpvfviSzyi9b12/F2U3JCR/NtooJuaOV/+8e3/JLSu97zkyj/SNm7IAfd08ieMwDCUgV7AqPU1HcT5g3neVoCM9BsPdlMkANqwvERlq9Zej3vJz95LyzqyrPv8uiXvHiGc0ZcTekAmf8OlG43CZL+qc/Y/qdGoYYATDXr5ltJxJ4HNOMV7NxtGdErmKW5ID2YcoT/cY329nzDQcVn+gT3rxrxZ7FxH+1HcPTX+womuyhVuDnqaZZvppxFC6cX7vsmAS0jtrbGyYEdffzUToCXqNyhCMAdEnKlAnT5ziMbETTNGjqmrlpzPEqFB2HAa+DJ55/WF824unyDUnIEmJX+RC/fcT/eGt11fk+7uTDbxB7al4jZCrh5YcZ9fcXLtvGBdBGQWIqZnE6SGDVoHoCegJ1Qc1u8eNvAL4vkoGgMH00dT41YQ6u0nenoKm7/zHZXM/gZ34hSpJ8y8V88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(56012099006)(11063799006)(4143699003)(261022075727099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjkwSi9GUFJUcm02aHd2dTdXSkpJakpVV2ZLaE44RGNyd0h2djZtYUkzV2s5?=
 =?utf-8?B?NFhhcWJFT3ordktKZEZNYzMyRU94LzZYSldlWW4rMVAxUVc5YW92TWxpczdr?=
 =?utf-8?B?SDgrbFQ1Zjk5Q1cwMG45bUpCSk5DMzB1eXFxK0tSanVGeDZrdUV3Qnpnb3RD?=
 =?utf-8?B?ekZSSU5kSjMrOTl2Q251ekZBNE9peVZ5d3I1ODFJTXVkazFrL3kzbHNDOTJZ?=
 =?utf-8?B?QkgrVGR4OE1YMXIxanRETDlvUUJxeTFRaGsvaXZMaVFFMDBDNW14V2tucHpF?=
 =?utf-8?B?MXJLY2grclNYL3NKY0QrdTcxQzZMT2RpLy9rZExhaThkSGRwc29VRDNKS0FK?=
 =?utf-8?B?a3ZuN0pNR3dOajhPTXU4VTlEdEwzV0dMTmcvaGhQNnRJQTExSVVSM0t0eTgw?=
 =?utf-8?B?Wit3a3V2bkNpUFp5alJzRkMzaStqZzhZcTMwMkY4OFhxTlFUc0hJNjJtWXNC?=
 =?utf-8?B?VmlTYVNBUkZkZWd3anBYWjBwdFVkdGJNQjBnOGVuN0w2TVVUa3lRZWc2bjNz?=
 =?utf-8?B?TjNuK09UeW5ia0tXNTN1c1cra29BT0hEM01tV0p6a1JXR1ZFVEM1UHRkcDVW?=
 =?utf-8?B?MTk1WDdmQm5Qbi9tUzFXSHZCY093NDBFSjJjNE5NdU50ZnRtQ2dxK3VxYTBn?=
 =?utf-8?B?cHZBYU5VbmhsZ3R2eTQzbk11SS8wSGFaNWNvODR2eVRMQks4NmIraTdHNEdh?=
 =?utf-8?B?Nis1Y0pFQlpyNDE5Q0RoUjdvSDZZblc4dUg3dWJoU3RNQmxLYnBQdlh4M2Rz?=
 =?utf-8?B?S3F0WlFWY2FJRGJ3UlAvMzZKemdGaHhiWG1mQkZMWE9RbDZxNUJzRDhFcExF?=
 =?utf-8?B?TGRjUUh0eW85UldLRGRsODNJRzFhcStOS2hPajR3SHNscUptV3pQN2lpMlhP?=
 =?utf-8?B?OVNZc0lzMlFIM25oMWgrekdBcytqUlV3SVFkQTdia0k3ZHFnb2JqT0xtVWlk?=
 =?utf-8?B?ckUyaXpaQnltZElWZ0cvNktub1dwcDhJR2xoQkJ4bkdUTkxuTXozK1l0NUlR?=
 =?utf-8?B?RG5hdEt1SXJXdlFhWXpIMnl6OFJidDRUYWhFR2xQbXRBaHFjWDNjVlk1bDRZ?=
 =?utf-8?B?U2l4eDRpdlZhSGx5alhpSWJNS3VMVk1lamxuT1RpcVVHeGtQSTFNdHZIeFhl?=
 =?utf-8?B?cmx3c0ZEM0pzbGhqVWJBT0lwNTU3amhHUmNwUlhoQklqd1d0Y0c1VFVra0RS?=
 =?utf-8?B?Ly83TFROeUx1WnF3UGt2Q25jK09VaUZZQllSU3FJSUF4QWQ0NUVTVTkrbWd0?=
 =?utf-8?B?YXVlaXVhZ21zWk40MU8yM2JXYzQ2NkhMVmN2NC8rYzJSdWxtbGQyUHV4OUw1?=
 =?utf-8?B?aFozTFp5S0lvZFQ1WjAvM3JOMVp6NzFBRFVmTFJRZzErWXNoZ1NneFlzaHZz?=
 =?utf-8?B?OFJSUDYwZktzQW1IOFluY0JNbGxSMlJURjdWSzNMd0VVRXJOdmtiL2V1UFAv?=
 =?utf-8?B?K0dNdmdOZHZYdnVwN241emNCTVNUQ1N1bG4xeHRhcUYzRXRDVXpYSXluK2NC?=
 =?utf-8?B?Q0dKRytlRVk1TGZwa2NHaG9DTEJDV2RrZmpib25Fc3pSR0VFSWNZOVNiM3VW?=
 =?utf-8?B?WXl4ZFRRQlNSU3YxRXRpeGJZbUw4Q3U3VDVnMnBIUk8vbC9FVktnWmpsWjVR?=
 =?utf-8?B?Tm1OR0FhYWFNbVkrS2d5eVBDWkpnUjV0NHIxd3JaNkxFSno4NFhMbEVJOFA0?=
 =?utf-8?B?UWtHSFZkNU16dGZYTmk2QkdiamQzZFMrekpkbXhwWTJiTWNwbFUvNVNqRXdu?=
 =?utf-8?B?LzMwcUdyV1pNYnRxVDdvUGVlR2c2bXVvZ3pyaE16VU5mOTd0Ly8vVStRWWdG?=
 =?utf-8?B?YUNEWVJOY0NKQW42YzVmVklkTjJTWjlBZFlEVVV1clU0eDdCeFlITUJGSHQx?=
 =?utf-8?B?aUhKOFl0ajlMZ0grSjNEekl0T0QwdFFOL1RyckZYY1hyNmtPbVhuczNIUmMv?=
 =?utf-8?B?QTMxYUhQMmpONDJzdFdpTW94WWFQb1NQUmdmNDJiSnVSWDJvelYwQ3hnNnpu?=
 =?utf-8?B?NTBXSnNiS3NseDZ4eFozY2dnLzc1S1FhZ0JDYWVsbGFXYit3a3JRVGZIMk1C?=
 =?utf-8?B?Z2NPbVZVLysyWXlwR01McHFTdTNFaEJqQnVmTEx2ZzBqNW93UFUray9pTm1j?=
 =?utf-8?B?MFJIREJxUTZHUm9oM1kvMGZoV3MzR0hKbzVWU1dDMy9UU25oVUd0NEs5YjFy?=
 =?utf-8?B?YmU1bFhldmJFVEFYcXc5M1BqS1V5WnVwZHRoVmlTNFFWRklzQ0lkM3ZSdGl0?=
 =?utf-8?B?QThKdnIyOG9ORTlWNDlyK2dyRjEvWjM0ME9JbDBIekFiOTNUTU9FU2ZKWVJl?=
 =?utf-8?B?OGlSTElNTnljUXFTclNRTjRCdU1DQ3lIUW5yeldZcmxFV0NlQ05TSHI3ck1z?=
 =?utf-8?Q?je9clUSaduENGH9U6RUsGl8n4KKaf7tEa2HfR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000caa55-4e5d-4d11-cf97-08df3c261688
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:50:39.6495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNvngsaVPKxq3KDRG8cChIFsOKM+SZtwBxA+coWDaI3HGC/W/7MhhLSN9UjVvx6WEevf6LUERJigQSWdSBIp3aBdszDpbn0uKAljPaqenhtVEHNYhXkorVHi65x015tI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA6PR04MB404727

On Thu, Nov 05, 2026 at 10:41:18AM +0800, Haoning Cheng wrote:
> From: Roman Smrž <roman@amarulasolutions.com>

 ARM: dts: imx6ulz: update SDIO irq gpio to pulldown because it is active HIGHT

>
> The pin is active when high, so pull-up configuration can trigger
> unwanted interrupts during module loading or unloading. Change the
> configuration to pull-down to avoid crashes there.
>
> Disable cap-sdio-irq as it is not used by the driver.

Needn't this paragraph.

Frank

>
> Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
> Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> index dabe17222f13..91c76909c086 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> @@ -81,7 +81,6 @@ &usdhc2 {
>  	non-removable;
>  	cap-power-off-card;
>  	keep-power-in-suspend;
> -	cap-sdio-irq;
>  	mmc-pwrseq = <&usdhc2_pwrseq>;
>  	status = "okay";
>
> @@ -148,7 +147,7 @@ MX6UL_PAD_CSI_DATA02__USDHC2_DATA2	0x17059
>  			MX6UL_PAD_CSI_DATA03__USDHC2_DATA3	0x17059
>  			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x3029		/* WL_REG_ON */
>  			MX6UL_PAD_UART2_CTS_B__GPIO1_IO22	0x100b1		/* WL_DEV_WAKE - WiFi_GPIO_4 - WiFi FW UART */
> -			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x1b0b1		/* WL_HOST_WAKE - WIFI_GPIO_0 - OOB IRQ */
> +			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x130b1		/* WL_HOST_WAKE - WIFI_GPIO_0 - OOB IRQ */
>  			MX6UL_PAD_ENET1_RX_EN__OSC32K_32K_OUT	0x4001b031	/* OSC 32Khz wifi clk in */
>  		>;
>  	};
>
> --
> 2.43.0
>
>
