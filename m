Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46F0175A64;
	Mon, 14 Sep 2026 19:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412709; cv=fail; b=of1jnmVRJKL8UEtNfEocHu0IJUK8LMmXYveGQ3CDgXoNLbnfWthyCXrKF7L+Gh+lClwtlFS9m11+elrmRe7QqiAKzvkOiMWf1twDCq5pjR4CI9ehJF1Xt25PUxtXCzzs8V08uRxr0xwIZltvgyyZ0kahFjW03LbuIO9exdSzN00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412709; c=relaxed/simple;
	bh=molWFZQOkQdZb1uYrLrrhx4iqXTL3xM0/J9AuUJGrSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CGVCm9BTSpae1q+vjvdlGgTEb95mMOu0JQXiiF9iNZsmloIHWuA6WFrnafGaxxzBxeiiXiuM3GJ5c5F5Z+GhL18rSow1LuicewcYg04mKwuQscIxoEL7dadJqqxdUMoI7zMoemlm9NZjGkrmwIG21aCATMJQDAtWZvfrkbm8QDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=S7pX2nYD; arc=fail smtp.client-ip=52.101.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="S7pX2nYD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvIA1UMKR4I1K+1Ekltg/rlLC7CuhvdBLVcI/XdGYdXWSOIJYpTwtDncF9muCrgQJSsM3eOLN1bbLny7AnYRavzgUOrs2ZCHG0LdNVWrTAwSIiB0ZfZrrAuCmqxPJa6Hf7qFjDLQ5FiPMwdvu+bML8loNoHBkn5qb5yeW5iFLWbtYhtQHrBo9u0PJqhrArvl+l0+P9FAqKlpOUgrgiAmHFLJ0YHwN6rUBqFlcH1HL8tTulUmp3yjUFTBJNlR1l8M1sOxk+I2Jt6ncL5yGKa+bDU4Ba0ertR1L6nrmNGpipF0ko9qlPwS5mn4g54UKqC1FFZDxaH4MoHCeYuZEugYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AygJfCxqcXkFU6xgOK5RFdn3VR5CywuEGQMZOddh6hs=;
 b=pqj8al1O7smzv1MqT7qXNeshCjDWk/DgzPKFJd3hf+AlYjo2OL4FIpsjD2bCtA1XxfwKetFLhwEh5s/otULMRBSVuHuEDQjuBBFByAbvyVcgDv4jYqouDlVfV8gGRJehPM0LgKtcol27yr3bg7FjGyekULuXk779VN3DSnGKe5KbwgQUz+TXDpNhpDUUJvA6zhATcVtL806L78zznrQwajj27VQqAfAnQxRWEMVk23CJgZwrjT218uD5ypZ6YaK5JGXgDk6OS3maZZA6uCmj+FQMJ1aEuSLikEemqzvR522j4HFZIKlcmZ1/xtvYig0DDpXf8FD7gr6aRCf5cZqbpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AygJfCxqcXkFU6xgOK5RFdn3VR5CywuEGQMZOddh6hs=;
 b=S7pX2nYDPhMGkXTFx4Tpvfl7IqHkA4Sy4Hp21wiUgtrbFnUZBeXsFS5N8nNnCo1/ozAZnOkHDLn+Le0uZmcbRf+FUW7+p3EiI1p3aUoA3Tpnk9PZG0Grfqs0KFOb+wqmz+u1d7w3e41CV76pO0fHyQzI7PlQrJvXcsPq7As5048L63NJdAcbbtpCLe3KqdRRTteTJGXVITnfpXVoNV9ml0bOTx5pvNR7KGQcdt1l0w31wy/AjdHRQFlL2Lqz/cQewHohVqfD7M4fN4+YD9aAx5Q74+DEPor1z7Mz1vyZ9cfegVjHMcophUQ+5SIXLcAok71zbiyfJaiNoDm68/bUJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8426.eurprd04.prod.outlook.com (2603:10a6:102:1ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 19:05:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 19:05:02 +0000
From: Frank.Li@oss.nxp.com
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mm: imx8mp: Update EEPROM with nWP GPIO, label and layout
Date: Mon, 14 Sep 2026 15:04:55 -0400
Message-ID: <178941267526.1802075.4598519730328631464.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908223005.38536-1-marex@nabladev.com>
References: <20260908223005.38536-1-marex@nabladev.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:510:174::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eb14299-9357-4ead-6f72-08df129314ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|19092799006|1800799024|7416014|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	w1RlFZz6oIf3WyR+/+m28L8Cc9lBxn7d4LPtKODcoKlaoN5bv42zTkp0fxCv38ojMTg02Ct6muXNiz3JUAPD/p/1ZSEzliScWOP6xBehEYKe6UCjs4NUIRWrbGabklhBMw5muVvE3UsAKz/SVoyLnoVgtHLmDqwRI+8A8ChrC7qAzL5+4/SUd6txNrgs7j1cBUvVrRqu0ljdscLF3NWmLSX7iYLHn01orkpwkhzCN4mgjxYmjCHTyZcixf6Gnvww8SCsXk4NAL9DxN+OZOKMyKmWxwaDJfgKflAxWjchneJjzdi8R4sBbkOMHWr7D/B9pb9orRBEXDyaLjnviUny3x3V17ZI8ulT3lW7PlZUNnHxVsxmiCh2Xh8j8IkquMazi5+EQBbh232g2YGoXGQfNGQDfbMe7cuWNeZ42E0inBldo3fPkaN00UlCT1vOezBafs2Mct57ULBG0Xly/SqbCeiBoRIWaf3jaECJ7l+POaAAoPhfpNsLtENSVtW9YakbLtGiaBNrJ8A/4eVvEmA4CB5T3m41/l5ld7LFctYr42SpZl4tcnrh+PnRqG9MLcbK2CNpXU4EyPL7qa8VctqvgI0eqrOn8YeeHBSYuMULWIlv7Hp/bGo5xDEGY5BeLAjJa3OermvfsKzh91dkCX0LnwaNpbWJBtqS2CL6EJ315Mo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(19092799006)(1800799024)(7416014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjhBZi9uQlZYb2p5WGRmckVBVUltcndsTUF1bzRVcEpBVENMcG0vTWV2UzZw?=
 =?utf-8?B?WElkay9YOEhPeEUxeU8xZ29oOThmSktCK3ByRlhVNkNmblpSckRXZ1hYcVlH?=
 =?utf-8?B?aWJWQmVnekYvaG0xdW53MTMzdGhaOHpoQWpNVXViR1lyV1pEeTVGZW5TcHg0?=
 =?utf-8?B?eDN4SDZNMTlscWlTL1VSRW5SUXFjNVZtUTRMYllENlkxWEZqT0FWNDFhY1BV?=
 =?utf-8?B?NVNQUnVsM3JWbVRiT3lhQ2FSdjAwTGZpRFhKTDRWOS9rZ0JZcFViYWtBamNK?=
 =?utf-8?B?ejRRNDIrdG5RTnBDSm5XSGZ2S0R6QmsvR1c0RTl6T2NTb2ZoOTRhSUo0WVNm?=
 =?utf-8?B?TFlhTVRkRnJkZkpLUXlTZzU0NWhIRHMveEJwYndMT0x6WWx6SU9mRkhtNFA1?=
 =?utf-8?B?aGhiZFJML1d3eVhLR0Y5MTFuK2d5UkRLU1JDeVB1c2xpK2I0YXVScVFXWWUx?=
 =?utf-8?B?dDZMalJXcExsKzREeVNBbEN3OTZ0Y3gwUS9hQm9iZHJMUUt3K3dLQVVuaE56?=
 =?utf-8?B?Z25WNW5ybGdKcktON3ZJZitPRHR3eUtiNnptSXNPZzc4b1djU01GeDJkclJX?=
 =?utf-8?B?UDlRVVoreVRhQmZzNEdIZU45c0RSZW55bFgydUEyL1ZyNHJ4bWVDRkZhUGZL?=
 =?utf-8?B?NzJkZEFlZlpKTlJGYVZXM3kraHJxRHRUbWRDV2tadFFtTEpTYmVidXhQT2Fz?=
 =?utf-8?B?eGRnM1luckNsK0Z4YmFMekhxcHp0RUdDVXFueVZ6d0tNcHFQbzRhcW5IRzZr?=
 =?utf-8?B?QjFxcjhmWGsrQnBScVYrWUhLZHgrZXdJSlc4Nm9ucm55MnJlekJ4VTh0N2NS?=
 =?utf-8?B?aHRLYjFMYlZ1Mm54TkI3V0hSR0xGN3d0NVJaZXpQckpycm1xNXUzc2tDb1dH?=
 =?utf-8?B?cS9CdkI1TGJVL3pVeUZTeEtEOEwwNzBzWjRUM0lSYzFyRjdkZDFheXpRWFVB?=
 =?utf-8?B?d2pEOTdnWGpYU2twdllUcnNkdnpjeTVpT0dxYTc2U0E5STNvRDFvdmNzRzhP?=
 =?utf-8?B?NmY5RGV2Sjluem8yNGQzN3JUMWdFTzFQRERsN3FsUzd5cE55dElFNFVUTEl2?=
 =?utf-8?B?QmYvYThyMXpYa2R4KzcxeG45dFJjbVdUdW9ISnNvZW5FQTJvTWs5N1Z0a2Nx?=
 =?utf-8?B?dDhiRXhxZ2tNZU9Gbko4ZEtNSG1lalZWZWN1VVVjeGxmWU5WTkhubm1mcytt?=
 =?utf-8?B?YkdmZnVVemJCb3NtUEJzQkEvTWhUVHovSjRyWk5hOWNqcitkUGhUUlpPUklZ?=
 =?utf-8?B?dW5HdlRiVFNsMElYdTEwM3VmM3ppM0crSitQM2ZUUVhTUEZrRGp0amgrNDR3?=
 =?utf-8?B?eUsxTG8rRE9IMTFHcmZPZGdTc0hDYnF0UUV2di83b0JkYUhocWsrSUNzcCs4?=
 =?utf-8?B?MGhidC96cjZBdmxISEk1ZVQ5bUJEQWcyY2FLdkhuZHk5TFRRM3Z4TUtFRjRB?=
 =?utf-8?B?WkJDeTUxY2daVjlad0c0VUk2ZFNiMnVPVVFGZEI5Y0ZqNjBWR29jUzBsYnQ3?=
 =?utf-8?B?cEpnNEtSei9Ebll3c0hDQUFIcmp0eWd4WXdmQk5NOWduaUhBU0REN0YvaG5i?=
 =?utf-8?B?bEM0dXU3dk1OZnNxekxqMHNWeGY1YmhyYk54WW1NbUgzenVMQ0d2KzFJL0RQ?=
 =?utf-8?B?QS9INEE0YmtheXNRWVQ1ZzZZMFI3OEdpK3hwWnRLbG1ROVp4aUN5aVRZNmlF?=
 =?utf-8?B?elREaExPL2U3WVFPK1hoOFNTc0tFVDlMWWt0MDhQWnZVMUh0TXNzRmVuNkFu?=
 =?utf-8?B?N2VGNXpxdWZEcDdRbGJ5VE80bHN0U21FalZEYTJsanR3SlE3R3VmYWNnVEVH?=
 =?utf-8?B?RGNTSEhRc0ZhbVV1azZLM1lOYWZEbkNnREpmR2VVcG9qRS94OWdBa2sxekU1?=
 =?utf-8?B?bjBhM2NZMWt1U2JOSjZ4VCtIRWptaWxnNERXZUJlcGhXOVpsRCtsczFUelFW?=
 =?utf-8?B?YVRSV0N4Ry9yQUY5akhEZyt5Vy9TSnVMK2gyV09WZzZJanE1VnFxQ3ZkMU00?=
 =?utf-8?B?SmpsenRUY1ViRy9xUlBZZW9IaFp3UjVlamN6cEJuYkljMnRDb1BlRm05SFRk?=
 =?utf-8?B?UEUwS1czdGk3NThGWEpQVkcrblVmZXI0dXZkRmoydlNsZ3BOeWpCUzFZVjJj?=
 =?utf-8?B?VWJ2MW0xVzFXTE1QQlk3ZEcrTDFTY21IdHdiWGVvZ0IzZncvRXQrc3QxL2Uy?=
 =?utf-8?B?aDF0LytoVStOY1hXak8zYko1WWZVenh4R0U4cmwzc0hqVDErdXlFSjFYdkxR?=
 =?utf-8?B?OCtjaGkzQUsxclJkMnRHMnVVNkFmdGJKNzYxMDJXN1Y0TVA5OGRoTkZrcU0v?=
 =?utf-8?B?bnRlcFM2aGc0RGFvalBtNmNoVHJQVnZ3Nmt6czR6bmNlS0N0WlVTbWZWQits?=
 =?utf-8?Q?zMAc0M2E3lCuqju2Awlae7yf52PdmEwvHwKI8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb14299-9357-4ead-6f72-08df129314ba
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 19:05:02.8859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iODpe72Pavvs3hHBXE+hUIhg2WC6wJHi9uiqRyjXOei6K7LzJX986cSAI5PB7m4fLSxo/0SByGDgVYOYlIpsPMnpYQJo3cXTbRirowM4gTyQSk11Tin1ePkTyOJKDA3v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8426

From: Frank Li <Frank.Li@nxp.com>


On Wed, 09 Sep 2026 00:29:42 +0200, Marek Vasut wrote:
> Describe ID EEPROM nWP GPIO, label and nvmem layout. The i.MX8MM eDM SBC
> and i.MX8MP eDM SBC nvmem layout is almost identical, except for length
> of product-name@32 field, which is 19 Bytes on the Mini and 24 Bytes on
> the Plus.

Applied, thanks!

[1/1] arm64: dts: imx8mm: imx8mp: Update EEPROM with nWP GPIO, label and layout
      commit: a66939a238f9cd5f023eaa9e7cdb3078eaff640d

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
