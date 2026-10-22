Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792633535;
	b=wIhyhx0aeJ3mgveLs/0b48zngkurZC8TdsOntMp5BNBLS9HB/xOgDfEEaPvAU1hCO+RD
	 pSNimDGCj+zk3oGsiUggDxT+XPZZXKUNqc4USQlVZlbGU+AcQvCB0rQzxYrIUqbsv+QsP
	 xNQoMvX4f6hTih6WJefrNWfYOSzqsLDyyWESWWX1vLgLSmwKfhCyGsyISu0jmENJ0xjXQ
	 3UkEUbXIfwpEA4YSGirjrz12rfe/bQMEE5tlY2imItOgQY5vqIvX8eCyu214+RObet/kF
	 gdiTD4KUV1VHrIwDNKgHizNmyPq+Y47uuGLpt4KI4BPoYa4YZqg/Z1QjPiinNAbx0Cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792633535;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=Fgauz8AFbiWtkLvR66O2gwRLhM1P4Xq9D9qtas5XDSs=;
	b=QXae20UBlNksWoqU7FHJMr1/yv/QHG4JsPYY0PQZVFv519VlXQ5+0tGZxHbalAZsgLrp
	 p1MGc+wWRUW6yB30Ek9rsoyDplsKj+DwWdxew8yY0fjDERLy+8+X2n7oorlx7tI5iOaUl
	 snrxDaiaf2M82EtK251kx+zMMq7eH5/8BPZfHpnLU6CTcCvXp5iSnVdRSH4uIpJh+CitQ
	 XlY6rwQqd0htE2dNYOKVIe5dTfJphZtWVrgOrUmP+JrwLl7gkvYJ9O8Nm5/h8F7gBcMFI
	 YKcf20wnCo47h9j4jOvwCQ6Y/Ymg05GHX0lxkLjod4lPs9slxlCveR0OqDsMK6ZjfSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UwywWkzr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.62
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011062.outbound.protection.outlook.com [52.101.70.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B3B606A320;
	Thu, 22 Oct 2026 01:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09B3B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UwywWkzr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M98hF0cTuQ3C/mmC8NGEVkHIbRUrG8OLSsIBKm5QSKEIbD1oonHi2XPjk2gvhmh+VOWbub0vySwsoeN7n5NJTsIQBdOUWQO1cDH8nDqR2/ko5NP20nImTRVPvgaq4Fx/I1Rxf7b1FA57Y+yn2UTxQYokPd0bKnrF1vamQnSrMAebhmJ4LfLygJ1+mMRQp1k/+8/v7xG7osNIRFQcRrQ+hip+tvN2GYeEW0opAbI6jki+V+/nMuPBTmdU5jjzF+DXPtdWtihEjLkq/N2pK8bjLEk55mhhslkz3nJNiFr/p65OxCY6IFWROrK2a0fwUwXuqcbLWEisfEin47XZUh6qwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fgauz8AFbiWtkLvR66O2gwRLhM1P4Xq9D9qtas5XDSs=;
 b=bAEpzVl+gNDJWrPapwpNBRWDaxajFOFJOT/bPxN9ND+7/tVUgYzgqdnkzSQ25Ha2nFI0MBlwi3aMJ4+kEep7GZN4O46sNM851brTquN05CB83DWYht4myk1OWxKPjK8c5XNW05qwItXh80KJd2ZP2vm4oQdaM6Nw600r5WNtia60VGIFjgcoUnHHN1R5RQqsEgUqfcFGo4lwSxJb1Tymme6O0DhWfjX2nO1gN+dVkJOxw+GkZ2849GKEm3kgNO9Vyn06hxzOmDASARC6XMRq5EcK5Xq+DMtnmYUnxR9Goi+lk8DucxuUEU9xEaOeLoF7m/OVWmuYxs4VHcrw/MBXDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fgauz8AFbiWtkLvR66O2gwRLhM1P4Xq9D9qtas5XDSs=;
 b=UwywWkzrG30vSxNIaELfGIgl+7YVHHlqLAovMZV2NkXOaYyCodG0ahiXBRz6NecsrEHR1DgS2u7Ug8/s2ruALPVANPwb1CmPXFIw7dvLEWGxVhsVMnALZO4qz0dk7gVivSUWKP3NvaC63NrY2tz470UO9rRYzoqYWl1TDEwxVbVBm0IOcUnXaPvaV6qoYuTEa2TBQxGeVx4MEFPX12bS8Y5Sjr10W1js2BRsxCIM1yAlhepWIgqP4tC7Fp/dJQ3U3zOyKc4AFEglTF7H7FgeyfGAcZ2wZQUT2qKo5+K3lgkfgp2GiCqyveQwhLtEx26JB2Mp25nFhQ/VIRQZ7laN3Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MI7PR04MB114164.eurprd04.prod.outlook.com (2603:10a6:290:10f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 01:45:32 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 01:45:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 22 Oct 2026 09:50:02 +0800
Subject: [PATCH 2/2] arm64: dts: imx8qm-tqma8qm: Re-enable A72 cluster
 after ERR050104 workaround
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-8qm-v1-2-2a597cb3debd@nxp.com>
References: <20261022-8qm-v1-0-2a597cb3debd@nxp.com>
In-Reply-To: <20261022-8qm-v1-0-2a597cb3debd@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MI7PR04MB114164:EE_
X-MS-Office365-Filtering-Correlation-Id: 0677b289-85de-4f9a-3c27-08df2fde28ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|23010399003|7416014|10067099003|22082099003|18002099003|261021123027099003|11063799006|261009223027099003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	FQNpW/xvGUKXfAWS9aeKq/YNBxb4nQR+ZLqK3hSKzPVJWGRn/2p3YwhDSl7dECsqtekO118ARg3UJNKXVtCScCQ8sOk8xRrnNlkHEExstDAc+YeG2nqP19VS3TubjTzMHfa5D5sZyPU3h1J3mpcThAptM9Jl9dxLMJmY3u7d5r110L6ltWQHd+JYnA9MQwhi+eTJptPBRM16LrMiSLKlah+YftbLCLLyV+mf/f0eGYh9Upmd5EGg4pEKOuxPv9aburQVlfS+ia9o8iJB4aYLkIF0p1/f+A3kr3bvTPE8XVEA2UATX/5tLrW8wT3mOBEfI+7Pv91omqailU2QSdGFwpQ49YRUSvDNkrupYKYEcjew72EGLoLjoujsPQTdRCatDVVEIJJBOgRW/6kICPMKDxKTrlk/TnAsezjsSMyK8hWiGxPDffk/ATuP1KKUncoJM3z+Toa+Mul/8e4tihj6EwWCtxECd8oQqHkOX3BqBxrEA3u4UgSmidLgoWw5/hqkUNHTaEQMgDdUvbIBN9uUqYWNnWjdbqbymfaDwdj5tzBeNnmMQwh+6NrBhp85M6Bija3lbYkCFfyPHxQOgNf9Npw4rELw8arVZ3xftlJjJAKHBpvVUnC577uYnMbisCnvLbXxicgOpduHbEgwvsW+C1yMmTQQGZ1rPWwlCeWSS78=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(23010399003)(7416014)(10067099003)(22082099003)(18002099003)(261021123027099003)(11063799006)(261009223027099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1YyVmhLbzJrOFF5NldZeUt2djFvaWNyUjUxbVVTYlQ2bXVLOHB2QjdBU3lI?=
 =?utf-8?B?Vm9lQ3hiVUlndjY4U1FoeHQ5c3RpNFR6VUxPQmpMRFVDM2FGZUppaWxNTFYr?=
 =?utf-8?B?NnRhUmY3bDdmSHZMdWluYjU4aDFnOE4vM0dTdFB6WFV1Z1RhZkxIYXlPcG1r?=
 =?utf-8?B?ZTVPcmttbVpxcWFZRitTdk54b09ManVtUHdYWnREdXVzcEtlckNhR1Mwejgv?=
 =?utf-8?B?bktRcjc4UXhURCtVNmhGTXMzcFRLeUtQV0NvZldHZmVwUms2KzN0ZWlPVkFY?=
 =?utf-8?B?K0dKb09GcDR4OEFBOGhsOW5lVEpQSTJjMTBudjAyazl5RGJNeWtOUXdjb0gz?=
 =?utf-8?B?RlVLbGYyczFlV1drdm0rcjhuQjk5bHR1Nm5lcXU4TWRvNlg1eS9OZExBSGFV?=
 =?utf-8?B?YXF1NG42RUFKRlhWT1dVOE9Hd3A2UWhsemtQZGx5Y001bGdFbU1GZytQQTJG?=
 =?utf-8?B?Q3VNTTM0TGF6cVdHbnMvYXJSMjVVM0VLLzBrSCtaTVBNclRMeG1qK2NCSlNF?=
 =?utf-8?B?QzBXbUZxS29Ua2F6c1lpUWZ2YnlFeW9SZ3pwOUZJeUxDNlNGNENvSmJudDRY?=
 =?utf-8?B?dWZhTVBPWTNhaENXSGpTMndqYU1SeVlQcUNrYjVxTFRTV2dSZWFYVlZWWnIx?=
 =?utf-8?B?djF4ekVvOU1zRGhtdXJCMUNaT1F0eTJqUFQybVFHZUJ5MU4yTFA3c2N1Q1g5?=
 =?utf-8?B?WVlxcEE5d2tzalJNZUNZbVhzUlZvYzRvOFp3SWh2QzdCYkFxUnRER1Q1ajJh?=
 =?utf-8?B?YVN4TEVCTU16TzhaVVRzbmUvUHpDdFRZdW1WUHdDZ1hhTkw5YXVZbnRISUpF?=
 =?utf-8?B?ZUgyN2s0Y1NCWDJqMmxTR1Z0UE5naGhrQkFkVnhzSTlYODV3UTZFcGNrUnRa?=
 =?utf-8?B?M083QUdsd3JVUlpVQ3JRVGNoZEZlNUc2V0lMWmVyd0lHWVlodWNTUWFEbjdN?=
 =?utf-8?B?Zzd6dVVLckkzazhkWUdCYnV0MU5tN3pKcEVDUmdqbU9MYXRrZDhmV0pPVXQ0?=
 =?utf-8?B?Y1ZCNXVJeXg5NnJGRGozbVVqcmpmVVZkRWVlT0JKV2RZYUhyTCt6TWhvYjU2?=
 =?utf-8?B?bmg1ZkszVU9waEl4Z3Y5ZXlPRmJKeEdCQVJQMGo4bzdOYndlQWEzS0JZV09U?=
 =?utf-8?B?VkQzTXV3SVdQNEFzdFJkQW0reFBqZUV0a2NVVTVIVFdlMlJyU09CTlUyUlVU?=
 =?utf-8?B?UDN0cnhGcDR5L2lJVE93QXgrUkFWODZnRVYrc3dOUlQyTEdtYXVablZIcHpW?=
 =?utf-8?B?QWtReldjTFlLeHExdUFxOVprTVlFZTNuUG9BRHNHUW9ZbzFXdUV1THhiKzBP?=
 =?utf-8?B?M1hUeVlYL3BPNTN5a3ZoY3BtbFZIcWdaRHpNOUhxSFFsQjdrMnZFYytoYW9I?=
 =?utf-8?B?OEk2anpCV3h6NnV4azE5VUM2ODNhYkVjTjlRNFV2aDI1ODNOL2s0Vm1HbEVt?=
 =?utf-8?B?THVXNzJkTU92Y3cyeE5zQnRTZE51VGVVZFpWTGdRMFcwOVd4Q0VVc3J3N2tk?=
 =?utf-8?B?dStFNDhlRXppSkx4dllDTUpqR2h0b1FrYnlkV25vRTdnc3FZTVd3ZE94KzFr?=
 =?utf-8?B?eEl3bis0RkRNRVRTZUpTdUJRSHFkeHRET2ltZ3ROUFl3c2Y3RU96TXlhb243?=
 =?utf-8?B?VUwrWno4MjBSWDVONExxekpWb3JrU0ZBME1hNGRUM2VtS3JmTTRHeVd0TVor?=
 =?utf-8?B?bnkzTHBFZGRWWlY1NW9JZVE1VmU1UTRMWVBQbEp1ZDZQd2pRUnVtdWNZT1Ax?=
 =?utf-8?B?dWJjdWlEMDIyWWZuZWdobm8rTlpOVFNzZ2FOUGN0Y0Jld09lTzA4RlMxOFZ1?=
 =?utf-8?B?UEhVQ1B1RHFRb09NY0tpeE5NZnNISW9xK21SMUp1SlhUWjdoekttV0xpcW5R?=
 =?utf-8?B?MGJUL3BudmRYSk1WUlpMNXV2UjEvTCtzWWkvRXFXRTdrMTE5VGpRL1ZjbTMx?=
 =?utf-8?B?YnJNejRMSWNQdkkrMlMxaUJpMm9kcmhhTktodlh4NFV3L0IwanhQd0pNRWpi?=
 =?utf-8?B?R3pKWE5FbTNvRmIwOFFvTU9sd3JkY3FyMUdCZThUTGZBU1BIcjUzL3ZtK1dO?=
 =?utf-8?B?RjdmcFVTSVJOZ2tidEF2M2J6MGJXOFVxQUYxeGY4ZHE4Z2dUeTRtSW9BN0ZM?=
 =?utf-8?B?MzZFdmxrWW52RUdKLzBtYURldGZ3bTgzTmMrRHRZcE5vNExGR1NmQ0ErVnhj?=
 =?utf-8?B?QUxoOWZQUGFTYVk4aUlFZ2RMbnppSWRuTXhENTlTeG90bFk3OG1aZ3hRRHFQ?=
 =?utf-8?B?bVdlVG5ZS0N0YjV3UTcwUDN1VWxvOVZrUWdKa2ZUcVhGMTVGcGt0cnFzeUhH?=
 =?utf-8?B?SzhnOTd1TjViU3pGbTU0UjRYSlgwOEkvMzNBVVh2cHZSc0VPbEJTeUt2WEFC?=
 =?utf-8?Q?FSiOsxVjFz9txr5eOJZMCnhLMY5AvW0T+9rXE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0677b289-85de-4f9a-3c27-08df2fde28ee
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 01:45:32.7181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3piy1/H2N+JIGougmgxi795elEe1EaK/bX8E0CDEyCJ7mlfaQxD8BQ9YhGiYgxfOMtTDSse4w7+hJogQh1qir/maUpKTF4R/8bnExzrt8f8cxDJnBGlFjJAqAOwNwwAh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB114164

From: Peng Fan <peng.fan@nxp.com>

The ERR050104 cache coherency workaround for i.MX8QM/8QP has been
merged upstream (d44e08dab27d). The workaround addresses the incorrect
wiring of upper address bits in the A53 subsystem that corrupts TLBI and
IC maintenance operations between A53 and A72 clusters.

Previously the A72 CPUs (cpu@100, cpu@101) and cpu-map were removed
from the TQMa8QM DTSI with an explicit comment "Due to missing
workaround for ERR050104". With the software workaround is in place,
remove the workaround-comment block and restore the full SMP topology.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
index f0e398eb2aad7..8cd6e75eb87a9 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
@@ -15,13 +15,6 @@ / {
 	model = "TQ-Systems i.MX8QM TQMa8QM";
 	compatible = "tq,imx8qm-tqma8qm", "fsl,imx8qm";
 
-	/* Due to missing workaround for ERR050104 */
-	cpus {
-		/delete-node/ cpu-map;
-		/delete-node/ cpu@100;
-		/delete-node/ cpu@101;
-	};
-
 	memory@80000000 {
 		device_type = "memory";
 		/*

-- 
2.34.1

