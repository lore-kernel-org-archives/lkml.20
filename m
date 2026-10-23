Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792765295;
	b=lO/DmGb7g4bmLYcstO5AIOGEZn4+Qi8FU/mfvGif1E1k01pa9MwPiuQM/GsyBlbFtmCh
	 aIq/PDNa3fv+nBwEJZmXo0gGASJtJfwtmhEOS7bMV3lvpsFN6YsAcdYby6qF2lK5O58Yn
	 x+Et3Nte5MLryZ+gMKUFBzKETBHvEuWrUgAKrZaPH4qmW9H8qXjonGrOMKsdqSk6V6Vi5
	 hO9KyCTbku24txpnkMnS3f7BJ5XzixIsw7c+lGSy3iFqvW2Lq4kPRoiFkj0Yhe0mIpEMv
	 umwienkXTFHpTh1YCin1e7SG+4m32MoKvVWwRxrnWLyAK5C223UcjSJXSPdooMmfZ4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765295;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=1CVhvj5IbUTw0SYzSbv9o3ZvdCPb8bD9rIcriVhuels=;
	b=IUW9lJqoC5vsPYbQ1kOppKr6JOuJTTh7yx1/nlSKBAozGCPwepn/txsokjesFs5DHXkx
	 NwURXRxsUkSdt4oiredP8ON3Qos6iaDlVYSVcsoD0rOXtPYh4Sk8BIqvg1K2daSyaziIb
	 iz+z7uynpF1H5OID4aMlbc9CZQYNm63Qs+QOOJZphB/bxlSwu0lxXupljVNiM4JnoBi+E
	 BgJ75ijDBNKPIH9Sxdix9HHGrJbDa0bNgWXWcLbRhAPK78nGxSVq9AkvUVEzHF34n5Bxp
	 iSExgtYY5rbBSvr1aQl4WZkoXgBcqbF8vJC6jAwTN9eOMbJOBN9dEMvjFavbTs6fppw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=C734oRTY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.59
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013059.outbound.protection.outlook.com [40.107.162.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A912606A31D;
	Fri, 23 Oct 2026 14:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A912606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=C734oRTY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mk7kqN1oyN7FbL/HOqBjAtMBCg7hLqTwzQD0WQVIGbN4SCNHoglcIAdut34xb84bQ6FgkAGCIESS3LvZYGjFeLBD9JgRfsH7y1dGJAqJfJ/k10xHCRxfL5a76PbwEXtwYDAVXkuYjFUilrzGDx2vucFzinZX1TfNLAOi//IQi/Uq8LlD0oi3sxlvjAl51Ffk24QflfefdJZmE9q5XxQiNRI0xMfjzXOxZkBbNZ1SuSVXt/L1pYjKRnTYbpzXYLNPzCSrU4VLx7eznJsgeYfJXZbi0+Z4Ujf/ukRkqnihFqXfZ6bwKFej1w4XXefLdiaJIAbwacC9RrBFiiH1WsQcxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CVhvj5IbUTw0SYzSbv9o3ZvdCPb8bD9rIcriVhuels=;
 b=tFKxL/nykdbl9QNGg/tcsJmz8xI24i0vJE8MjQbADf8CDgfEqPbhOYsZedSt3P9DSTCjtQtSMvFEPDG9OWNDzjmuFMs0rVOiBwq/hpLe7QDtG2YH5tH6poVkvxkqlrKN9v2CuHLt5iAtfv7aPeg/fMk7t+phYroHAxaabrE3FvDueitl6ETY5JI4dPNZcZ6Q3drIyBMcNhdh49pcok4obJ2U/b7OQQqkmbHw04gg8GWWL2dsf7kFIofLyNPWrAKpyxPEPXRCaNUXK1gReSgHvkQwazF3BpmXb+NwedMXpJEyrmMePcttQEwVkgbdMCHsrAnMnyZkmDopabElNSwFPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CVhvj5IbUTw0SYzSbv9o3ZvdCPb8bD9rIcriVhuels=;
 b=C734oRTYQDA2ItgkGWXWBHFegYHt0cLwTnDo2lmlgvkjzlC7VcgHQGrktO+Z1tOlPPlox8hAzzwcBii08KR5caVa5M9FPwg0dfkPt66FsumSPTcZgvWQWHw1BhVA63NzBCuS+ElYmtm+AisvjFfxMnec9J2h69KWNXrAgInhxlGfFrPxgSdL7tRAyjgzkxmn3zOs/EQ0/zVN8wh3Ajg+kwh6m4z0oWh4dj3jxCwleEFptRWegwoBe3GjgYQN8lu9myuewZHnzcRIZaZa+HLWjZE8TDkY4zbyVFmW5XcNE/++7uICQoJV62QuEhhf3unbMH56hC5GqoNx5LDFnW09rg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DU4PR04MB10861.eurprd04.prod.outlook.com (2603:10a6:10:592::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 14:21:31 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 14:21:31 +0000
Message-ID: <78c875a1-f90e-4ab3-bb31-f059845ba5fa@oss.nxp.com>
Date: Fri, 23 Oct 2026 17:25:15 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: freescale: imx95-aquila: mark +V1.2_DP as
 boot-on
To: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261023102408.119509-1-francesco@dolcini.it>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261023102408.119509-1-francesco@dolcini.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0309.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::6) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DU4PR04MB10861:EE_
X-MS-Office365-Filtering-Correlation-Id: b7bc1af1-a2ae-4148-1cb2-08df3110ef0c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|23010399003|366016|1800799024|10067099003|11063799006|56012099006|22082099003|18002099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	gclQO5zyiLeC/Q3NJx4C6DBVMqKbnUnckoGk2xDUfKdMAJRdsCuTlTb3CJeqO+kL/DETfIII42P5svs0eZqolr6XLIRA8BClUJHE70LRQcWBQVTuDryRrIdbKrC8sZhpJxkPjjTiJAXv+ylWFQOHC+Ayqp5U1FDGG5tmJ18Ri4Fq+HIsi+vDoF8Cz8CL2fvnaHxJC8Z2cELqiZQr4/FZsCGlvDWESikOaONHmwPdRWooO+c4/5mR3XxHI8hDJIN9CG0P2FC9ocy0TKPtJXPqj/ka1pu2KoXSxaN6kbNeRg9cgho/SITRY2KKpWWP7qGbzAAF+zhzmuniZJlLZ3nwbBWhhTbbSZbFNaUU/6bw2vqbcm5+AEoEF7DCYcC8ygA0L/wzTstGgdtnCRp6AIAUEVQ+sn6GfohUdwYfGjyHADhdHSUDP0fuHd+K6Q3bYbdQg2yMl5juZgFkorTt94hbB4jyiYFnLyd2gr+UmDXOHqJULhvkI0nLFYkTYoqXEUCFN2jpP9e/UqNisiTDvCGnRdF0Ve31uv+XJjN3Fh5d3M1/U1rOgKBT6OyFReaGneyU4xXZgWqRQ0t6F6WmxvLHRWfPpdItb/ElX9ovM1d3Ig99x1CCqpZbV2xZrxIVQRlz3VpBILuywyScKixyt8rOLvtbEtWxkEWb7ysj7LXzr48=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REtkelhIR09QWU1RWUE4OEk1SFdCcXljWmJDZEZpbDNkQUpqUlorVzRNYXNC?=
 =?utf-8?B?S0l3eUJtQVc0Vi82cVpCY0x1OURDZktBZDN5ZXV2ckxKZ2NwaFFsbFlvZ3Vp?=
 =?utf-8?B?YXR1RUo1cDFQUzFyMmoySVBSK2piR3MzbVVpaDhGV1IxNmpPV1lGUTV3TFFK?=
 =?utf-8?B?TExaTTgxQTA2S3A0VlZPeDY2a0k2cklZWlNmUUlEQ1FlbFZVb29IUkhQN2lG?=
 =?utf-8?B?VG53ZERSUi9PeldSYU5YZTFKcTBSTldCd0ZuOCtFdVpLQ01hNE5zQXFuL2dJ?=
 =?utf-8?B?R2JSZjhkTFBLb05oTUlrWFpWWXV3S2VjVVQxTkk5M3JqMWl2elNRSzZuYUF1?=
 =?utf-8?B?cTlrRldNaG9zV0gvcytJVDdINmIrc1NKSUJsZ0NLNGZQNmVrTW1NZ1dhbkN2?=
 =?utf-8?B?STZOVnlHKzNtRUl5NEMzNVpIRmJwS0VhRElwMmd2L2hXMGhVazNzbEtYUEE1?=
 =?utf-8?B?WnE5MXNZL2hJMTJPMXBVak9HcWFCd3ZDZFpmcjFEM3lNbnh1WjFBSi92VjBk?=
 =?utf-8?B?UlJ0T3BNT0h4Y25qUlZWbVczTlEzZmlDSTh6d2swRWxNcWhXVE5Mbi8yczI2?=
 =?utf-8?B?RE84UU4yTDR1aVk2Qmhkc0lpVnNpZE1xbXdBMmowcDYwSHc0WWdtbHEzR1lJ?=
 =?utf-8?B?aG1MUDRvSHlEV0NJKzI2ZjlORlptcFV6Q1VNNnlGQ0cyTGFuOXc5aFIxcTBt?=
 =?utf-8?B?anUzN2RjeXRzMXhkRXRUUkE0RnpFZjlsZG5CV2pqVkxuUW5NRVdKMDdWNVlu?=
 =?utf-8?B?QUVjS3Z2OEtnRllXVmV4aWhrb2FnK0drem5QMVJlbVJUeG9NdWFPSGZ6RWZ4?=
 =?utf-8?B?RGpScGlsMjFCaUFhVXVqcUU0cTg2aFBHN2p0OFcyelJObzhRRnpWQVZKTXlo?=
 =?utf-8?B?S0Jpd3JSak5zWlJPb00yWXVyckltNU1pNUtXU0t3Q1dVbHVQTkhPcHI5QnQv?=
 =?utf-8?B?aUZtNE16VXAxTDBtT1ZqTGQ3Q0ViMzZnSWw2elh0L3RaTXdBYWFTcjFrbEFV?=
 =?utf-8?B?d3IzYyswWmVkQ0ErcXRXTGx4WnNvVEJtNFhia3FTZG9XUWtIcEJtMWpYY0hr?=
 =?utf-8?B?c3RuTGdYd0lnNmQwU083cXRYUFFSZmRONkpBeEQvM3NTL1BLd0FpUTM4d0t4?=
 =?utf-8?B?bm5vZDJpTUpmd3hHaUZxWFBiTEViZHNPL3BXUmtpZ1JmTHh5NUJoa3VzcXRh?=
 =?utf-8?B?cGZiZjFWUkRIZlIwbXZCeW00YTltSERqbzNCZWVFTDN3ZU9WOUFIMEJ3ZEQ4?=
 =?utf-8?B?a3o4U2k2UDVaR1gwUzNVYWpjNWpUMmJRVGU2UVRwZUFTNVUxbUNINDJseEIw?=
 =?utf-8?B?bHRsWnBGZE9lMklSQjdNR25LRmQ3SWlHV2pJL0krK2ZDK2lvTHpPSVhLWm1I?=
 =?utf-8?B?aEp1VmJpTWJJR3l1OGhsQW42bk9QRXh2U1M4S0RRVG9nVHRCZjgwZVYvK1Bn?=
 =?utf-8?B?UHRaWW1TWSt1bGZkYkpqbkRLa0dvU1ByNVlZVnpFVVhvVWJacW82K28xMkEv?=
 =?utf-8?B?MGZwZGhHMHF0TDd1SnlEL1B5NHhKUTVNSmtIWFRrcGI5S2I0cm10RHArWFNu?=
 =?utf-8?B?a2lTOG1ncXZSalN1eFNxVnZkVDQ0a2RJSWZFVEJiZkVBYXBMb2JhWUhDVVlm?=
 =?utf-8?B?ZnhKaXpOZU5ieXJ0WWhGcldER0FIQXYxcHU3aXBXNHBraTBNRU1yVnJhSkxK?=
 =?utf-8?B?UjU3QjlCQklqVWpGNFhQOTlNOFk3T3dhdW1IQ0pKTmVGaDlsZjY0Vi85UFE1?=
 =?utf-8?B?TFFBdTJvSThzMHovY2E0S1VBT1p2QU1aa29na2JRYXZUYlZBRWVPQm0wRGta?=
 =?utf-8?B?TXE0QlAvK09sQkppWWdYWFlVZ004OVZ1NE1OeFhRbkc1QzVIenVlS1pZUDdR?=
 =?utf-8?B?cHhlWnkrOFZEQy9odU9UOWtGaEhhZDUxQ1cxU0FvVUhTL3YzSXZNSno1UUNi?=
 =?utf-8?B?T3cvcUZmMlJJdFJVYXdQQ08rT2NoK0Q0Y3lQYlVZNTJydnpRODlmTktienY0?=
 =?utf-8?B?RU4rWlBWblVFNnUvTW1hc25uOWY1a0gyaFhqYlRQOFc3bzNzbG03OFdBOER0?=
 =?utf-8?B?eTBWWENVZUNOOUo0K0JVRnFGSk8xdElLbDhjL1ZJKzNkWmRhcDZ5US9XZExS?=
 =?utf-8?B?NWVBQmxzdjAxa0RvODcrMG9ueGhVd21YQ2V6V214MXBkcmZYWDYzUERseXMx?=
 =?utf-8?B?RjQ4eVlGOUVoM1Y3Vis5QmxOSVppSGNhQ1RjWlBoRU51ZlFOL01tK2Z6dTRD?=
 =?utf-8?B?YWJsNFMyRTRKTDZkOFhMdDBydEJzSDQrWGpoOTk3ak50UlFiZkFaaUJDdU16?=
 =?utf-8?B?ckRXZjA1dFBGV0lFcGRMeWNKaENTclp0YmRrT3IyUDFrekZFS1pjZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7bc1af1-a2ae-4148-1cb2-08df3110ef0c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 14:21:31.1582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IoRV+D6Evv/Ardt9AD9l79zuksC1SwSWrBYWFssO5QtHuFTs4//rMDrVMd3WHWsy/m35k6eA3f7JhB1JKFoQTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10861


On 10/23/26 13:24, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Mark the +V1.2_DP regulator as boot-on, matching the hardware: the
> CTRL_DP_BRIDGE_EN enable line of this supply of the SN65DSI86 DSI-to-DP
> bridge is pulled up on the module, so the supply is on by default,
> before any software runs.
> 
> Without it the regulator is briefly switched off and on again during
> the board start-up, potentially disrupting I2C transactions on the bus
> where the SN65DSI86 is connected.
> 
> Fixes: d5c082ba23db ("arm64: dts: freescale: add Aquila iMX95 support")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

LGTM,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
