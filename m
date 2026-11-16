Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794799453;
	b=mNvNEQJQQ7wrMaSj/JLbfN1VWN657ejc0yNdK78Y2qHIzp72p4eZ9QUGbHcHxypeVjRz
	 SoWUtkI1yIeGcslnPxztmFeh8QLvD4Kt3ULXRg3HcmAhLllXFGE5kH2pzOC2rzUUgzP/g
	 n2bO6+K1ivhCgoHh6bCoit9fJIMoXWBxmPMLUBOZdesPtKCro13t1Vy/2SD6EgLz7UhBe
	 WRv19k/bI5+c04YVJBI4efeN9m7XWknSrTK5wIIaehqrr29s1AIinBm9Vs1E+r0bvzncN
	 CBnzCLTk24AgqjCwyUbSqZ4II8lX5Uc5889ug05Z1rNq6x6DN83D34hGArVuIDYtgPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799453;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=4oeyltPOAwUK19A521tLWDn4dQJLYRrlrHw3RP2SX2k=;
	b=AafCBG2Nq3svadEQH/yCZTDdLSGWwpt5XyDto1EVh6VWQaYPga3c7hoW1A2JgBmKyYuN
	 6xIy8/QTNt9PSw0e7+U6HpjKC6/YOs4Qq9jOVWOfblPzCZ55kZz1x0OckDK3CzVy9BsTK
	 oH7Qnaty7h6fuUsCuguPToIVNhiowfCC+03m3eIdKg4h4khJL5u/d8Pf8+k0ryGY6fp9C
	 /0BP45IF/aAPCR0Q/bVZgwK2997keag2c2cxGv7SUFZIdH90NBYUhOT/sIpm9/VRBj4rK
	 q0kY6kSaR/ty64/5dRWs/lNB8wKiP5FCN2DUKakm7DZtaEf6I+nNl+XC9O4EadOP0OQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jnQvB44r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.29
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013029.outbound.protection.outlook.com [40.107.159.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFBD606A893;
	Mon, 16 Nov 2026 03:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCFBD606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jnQvB44r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0weJtcy6q3tNKXg1WXu3q+c077q8sKijZPqwIafHzP6epApuzf/ZtgYhxXD87yX91Cl+s7SPxBaSLUPiZ5wWq9x/1QJDieX9B0OvlQ6epz4nbVAfUVXrdX1rrPpntFpnBFS4ztjWGPeEPWD/bMGEzk0coammsCshgCmH74IZPSm3XYAcmwzyS4V+9wx/FGs3ysW8WROLZWfg9HnuNwRIG8LMrelSz/Vol0irtfJrfrPrFv4j//XlzK9M9c4K0iyEv3PR2YkDJTb2cR1MDdThPOoVExkZD7m9w4p/R3p/pZka4D60Bfg7yZolbo2vlOysbdt9z/2xhLP/QyVuNUgTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oeyltPOAwUK19A521tLWDn4dQJLYRrlrHw3RP2SX2k=;
 b=kaFc5Uw0v95uUCaUkiQHTHZjsH+jcFa5xRWCdj9qUWVPB8dK24MGn7Fm0CFAlo3f78kBtaMznjphOqTBj7gTvjnyoIUXZ52+Gw9PJxAlmqlxf0gx3zTMWJSbb+6yg6fATmL/Rh98x9/Ssbt0OsPtjY78p3ZUKGJA6g0PDhY6Zu4/6wmGQXtBCaGSVhM2lGhgrXE0BVdoOdkX57LQLg6iGkzxyNWCre+N4oeN6s88MjxbWdycvr68891hqO4rLFS3iQSQvIqk69+bZdFD7pejJfa3Bgdp8TkABuogOarVzYlwz4fhu5UUaNTSCsWA2/vqbOz7vpbQ/LWZeglJeOffrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4oeyltPOAwUK19A521tLWDn4dQJLYRrlrHw3RP2SX2k=;
 b=jnQvB44rLSvsOuzv1Nwq14K8LIgS59s+ryNC4IFDPflPxymx2GPRm2b9MOAAxURt+WRWdpI77QSRbffaTuNJDcBs5qtbbAtnmTC8lXfNghmB0tV5dUbVPr0vXIYnFNDdj676WTiYZcrFvIDeLnMN7S+TN4OEmPkEUYv9ESkkj6ABgOgwnENDUjQXX8YlCq1w9fREjW4KyMGI8Rvmxa+L3WzSQxyCStt/dvpd9cehN4SRuWT818SslEEwcBIqXvzOToQ+JEiFjL4AEhMNqDLvoaehlxoW7dNoGhXL0e4/W50URQn+xPhVxth+SiaANj8tmOS7+2uVll5sLKpilYXBtQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by BR0PR04MB591767.eurprd04.prod.outlook.com (2603:10a6:2c8:33::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 03:24:09 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 03:24:09 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 16 Nov 2026 11:28:25 +0800
Subject: [PATCH v5 07/11] media: imx8-isi: Select MSB-aligned RAW input
 from pixel link on i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-isi_imx952-v5-7-46de1d24efd4@oss.nxp.com>
References: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
In-Reply-To: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794799700; l=3074;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=8SFhofZWJ4jN8PWnhi/quLseYVMmU5E7RdJI0Voojr8=;
 b=58qf/RNE5VZ0h9AYi2a7YS2A2pmIqh7KryAsi9whhIrwR+FOYZ7jqYxkjj2YpRl7Iq4WVPcZK
 7cOXMXl4ES2A12egDBxsZl8tw4L6elCXmiz2Ez0I70c1h/UfGexXPEh
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
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
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|BR0PR04MB591767:EE_
X-MS-Office365-Filtering-Correlation-Id: 9667f10a-68f7-4839-a511-08df439113f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|7416014|921020|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261021135927099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4V9yX2xXu5fsyBhZbgpvwjJf+5YE4/aLYCdn+c9r8wssO58EpMaYhb1adqo6IUTDqmuxTRrmiZFY4OKerEa5z9CdEh2Rxr/6M7cNCZdhDVMT4reePGoNP6SEYJTmWmOv03Ttri8WoAff6ZqpJCiCX7V/4nzH8yExC2p+mP9aQfMezIQW8XtdUdmMN5qzXksh+Ki8E0j/FKMnTxZYhq2+fVwvtaVfQ0dEq1Z5JpSc06YTN4UOyw4VN0WEUKKfe9L1ZBRJHgZYl3uiJotKMbPKvmSexj7TAxNPqgX87BFeCWhUrvl3Eo27pdfYDGTE2Q0CRwK74L8uj+g4BnnDMSVhMKcm+lX+kLYvuER5pKEi0s2UXn/i/E5sDfQoWHNG5lb0G/+SBtjCSDhuJFlmvaEcoqCXhkPmhtBlO4YqUDEd3xJ27TMqcEk6K8HPzX01/tqNd32PSO/R2CXsBUmfaX/SyRw2CPKHXcrtYLJJh96oUPnyM2NAywk6u5Tb0VrkDKm6GlhJSUbTAiaRVYN7/XRgw+u7bVH0i51XpmdbJOUU2b6fP+m6tO9C+SWXt8zMScyGtiA+K7qrWpnAody/vy8TrZ/l5p4lVkvDyM/Zlz30uowJApjmOOfXA3saldiV0Af9IRJ4udyKHUJ6IHLULMgv1OP3uQCpPwCHwffndIobGhg6Gh2lnah5Yt8bwvJER1j3ul/WnXMk1QIO51S42pt8gQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(7416014)(921020)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021135927099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzBnS0JlampQMi9qTWFBRllLK3luZWpCTWxPeWk3V3B4RjgxN3NvMGVDWEp2?=
 =?utf-8?B?WlBEMnkxdkd1WFRScWlVcXlIN0RRcE5mMDVLTG5SenlycXVvM2QwRTVjaUc2?=
 =?utf-8?B?QkZ2NTc4WU1jVWd3bEd5M1dDdytBMVJXbStsVUloOUdoWEFoL29meXNlb1dZ?=
 =?utf-8?B?M0VNcW04T2s5MDBLUUtwdnpQaG5CcUVjZGRXaFpTYkNOSFFOZlJrelZRLzhk?=
 =?utf-8?B?TXU0UDcvanE3SEdCRjYxTjR0bVBNSEJ1c3ZINitlWGtRcDJibVlxMHRLeVhj?=
 =?utf-8?B?bGxkK3VIeVRpdDd1bWF4UnA5UWJNTWlmSWpJOTh1TEVCL2twaW5lV25PUlRV?=
 =?utf-8?B?Z3h0Y1V6S1hEeGtlTEVXRURVeHA1L2ZDZXV1NzBjbTcwSjRaamJkTkgrY3dP?=
 =?utf-8?B?US9TSkVEblMwTGFXdWw4V3lVcHQzSzArTlpXLytTQ0sxZEpEbVk0SEY4VjFt?=
 =?utf-8?B?OEhDankxa3ZGTkhYTWsxV2RNQmoyNGplQVJieWpZejQvYjJFbk1Ya0RXd3Nt?=
 =?utf-8?B?ZkJLM3JLY2JFa2t6cG1sWTBmWFI0QXQ5TlNjM0wxejlOaG5tK1B0WEFXa09k?=
 =?utf-8?B?V2Vtd24ydE5ocmdRNndSQXJSNE5BbkQzQ0huT1BwRmc1TCtZZ2VPQjB1bisw?=
 =?utf-8?B?cmx5bVp1Z2ZOR0ROY0kzbk5UZ3phS3AxenJlK1pvZmd1V0NWaVFIY08vVXJC?=
 =?utf-8?B?REZISnltQnZmdWNzSVVLbktlNnR2OVNnQkQzOTJHd1J6M2RrMEdWN1pjUmhl?=
 =?utf-8?B?RHdKaFhCYU5kVHQvaFNnaG9UdVJRdzRKdUtyTFlsZjlZN090WEJDMTNyaFAy?=
 =?utf-8?B?V3krUS9MR1MzMTV2NDhZK2syZXNCby84Z2ZRQkYrR0dka1dRcUxaQ04yZjBu?=
 =?utf-8?B?N3IvaU9YUUZveEk3UU5XckNkQ0FCV1hpb3NMcWhjL0k4RE9NbDI3eDMwV0Jt?=
 =?utf-8?B?U1VTN3ZBU2tjd3J3dXNFR3FFUHoyWFVrVEFkZFhHOVpwTXRUQXE0eUZpRkg3?=
 =?utf-8?B?UWNmWTZhN3RxSjdNM1JvOEpFWmRVT0pTRmVIQjBSR29MakphRWJPN0FmOUhs?=
 =?utf-8?B?OG8rUWYxOXNWMVdHYzNaSkQrcDhrZ0Y0aDEraWtxdHBETGNIYnRjLzNvT1I3?=
 =?utf-8?B?SW9CUW1sSFdQNmFRWng2YTRRYWt0YlJtdHZ1YVdEc0VuaFozdFRRaVUzaFRn?=
 =?utf-8?B?ZHhOUCt4cHQwcnRIbnhZdmdBY3V0Yms3UDlGZHN0ckNUSWMvY2k1WVZNNnZp?=
 =?utf-8?B?bmxYcDZjbVZ6L2RnZlpoelRiNGk1TFhJQlpqS0p6b25hdGxjNHp2T29UWnNz?=
 =?utf-8?B?TTRWLzc1OElpOGJmV3JvalJkaXMrdHZyeEU2citLemNDcG4xK3dvaEhvMGd2?=
 =?utf-8?B?MStZT0pPNkQwemFCYXplZmt4VnB6WEZlWlk5UWs2ZFNLd2orOThtazNxck5Y?=
 =?utf-8?B?TURtcUEzdWhsSkg0akV4RWplL0MwVEtTQkhmUENtMVNoTFJhbDdibCtvQU9H?=
 =?utf-8?B?aU9xQWlNeGliak1DeFBkNnFTRnpyRjIvYjlMbENCQ243NjlrRDVHM0JqS09V?=
 =?utf-8?B?M0h1T3NZQklNaFU2N2pid1c4NWd3WElKdWo0U3VhNk9GZGd4RFhoWEdQZlJY?=
 =?utf-8?B?VnZ1czJlY1BRZW1nR1ZhNHozUDNZd1p4VzQ0dkRmQlNHZmRaZVhGbGlLR0hw?=
 =?utf-8?B?Yzd3Q0VveVdDdWYxd0NyUExJaUR0L0pYeFZHYW9aSHBqS1hkd0FPTnc3SVJ1?=
 =?utf-8?B?SnQ5RzVuTzNUODdJQkFxWVNmcTY1djFITDA4Nkh0M0wrWHZBT0lZNEhlU05o?=
 =?utf-8?B?MW1lcTZXc1U5b2hLeityUWxXelNRZm5iQkloZFhSN3pBektRM3NTT25lMFVE?=
 =?utf-8?B?a1U3U3J2b2Q3dmtoTHRHY3Z4eExyMnV5aVY3eFg0ZUNLL1BuMUxnczZWTWZC?=
 =?utf-8?B?RkU1amxwM3dzZEFvRE4wUnhCSTMzNjhxTWdLR0V6MllGK1F0T2Z0QW9OOHlS?=
 =?utf-8?B?ZWlNMlR1ejZHVXd6ZW1oV0tza3NHVXBrMGM0SGRmYlNQclh1ekNxZWNLbkV3?=
 =?utf-8?B?OHArK1ExdWtia3dhYWpkalAxSUtXTHA5Mi9pUG56bjVRMmNDUjdpRWNYRDFC?=
 =?utf-8?B?MHJlSDdTcEFTU1B1WlZuenRDc2xYZTRyMVNZV1E5VHpDdnlWRmVQbDVEckY2?=
 =?utf-8?B?TG9TR2ZubC96ZWUyOWUvenpLcGllaCtiRC9RV3BWZHlobEZnVVpXTENLU3JW?=
 =?utf-8?B?QjZ0Z0RBeHg5UGJoZ2RoZEJzWXgwUVQwbHpyeG9wL2tZc0tuVjN4U1VSeTJ5?=
 =?utf-8?B?UGwySU1vaENsSEJCZWFxdExVRy9JMmdmNFlWMTBnamt4TmgrMUJtbjdwaVM0?=
 =?utf-8?Q?5FN2qJbk7O8RnAxAm/hlTuy3UozhLJuUM76eT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9667f10a-68f7-4839-a511-08df439113f3
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 03:24:09.4808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: De0fDkeIaePYIl1yR7Hfl82C2ox55LvDXd+1eVMLNNIXL42TX4mnYm63A8LgxEGx2d1Y0jmL16Ron7ljXdpGR2Ud12M8PXATprNbuksQuoiSC61x+X9mfpllXHwN2dIf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB591767

The ISI receives RAW data from the Pixel Link, whose alignment is
determined by the SoC integration. Before i.MX93, the Pixel Link
provides LSB-aligned RAW data to the ISI. Starting with i.MX93, both
LSB and MSB alignment are supported and can be selected via
CHNL_CTRL_RAW_IN_MSB_ALIGN, with the default keeping LSB alignment
for backward compatibility. From i.MX95 onwards, the CSI formatter
replaces the gasket and only provides MSB-aligned RAW data.

Set CHNL_CTRL_RAW_IN_MSB_ALIGN on i.MX95 so the ISI selects RAW
samples from the high bits of the Pixel Link bus.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v4:
- New patch
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   | 20 ++++++++++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index cc52a90c2477..b3f32b9796d5 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -303,6 +303,22 @@ static void mxc_isi_channel_set_panic_threshold(struct mxc_isi_pipe *pipe)
 	mxc_isi_write(pipe, CHNL_OUT_BUF_CTRL, val);
 }
 
+/*
+ * The ISI receives RAW data from the Pixel Link, whose alignment is
+ * determined by the SoC integration. It originally selected RAW samples
+ * from the low bits of the Pixel Link bus. Starting with i.MX93,
+ * CHNL_CTRL_RAW_IN_MSB_ALIGN was introduced to allow the ISI to select
+ * RAW samples from either the high or low bits, as both LSB and MSB
+ * alignment can be selected in the gasket.
+ *
+ * On i.MX95, the CSI formatter provides MSB-aligned RAW data, so the ISI
+ * must select RAW samples from the high bits of the Pixel Link bus.
+ */
+static bool isi_raw_in_msb(const struct mxc_isi_plat_data *pdata)
+{
+	return pdata->model == MXC_ISI_IMX95;
+}
+
 static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 					enum mxc_isi_input_id input,
 					unsigned int vc,
@@ -357,6 +373,10 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 			val |= CHNL_CTRL_VC_ID_1(vc >> 2);
 	}
 
+	/* Select MSB-aligned RAW data from the Pixel Link when needed. */
+	if (isi_raw_in_msb(pipe->isi->pdata))
+		val |= CHNL_CTRL_RAW_IN_MSB_ALIGN;
+
 	mxc_isi_write(pipe, CHNL_CTRL, val);
 
 	mutex_unlock(&pipe->lock);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index 5f66b7c9cd1c..35438abf3172 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -20,6 +20,7 @@
 #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
 #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
 #define CHNL_CTRL_SW_RST					BIT(24)
+#define CHNL_CTRL_RAW_IN_MSB_ALIGN				BIT(22)	/* i.MX{91,93,95} */
 /*
  * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
  * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX95 only

-- 
2.34.1

