Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792723956;
	b=j+Y42I7L57CyEGIZWjp4k1hJkClSY9V1Ks9eajrce4oSt6+uJ/7rFTmR5GyQ57DBDYqT
	 DxxUj5omC5mSh5dVqyWRTxD4sH1Nbe1CpDPajbIOJ1Wjt6xvdYLb/O+tuBO7oYJCFummX
	 Iv9nB+4aq9ABpQHPfl3G1ViBtLJEg7Iuxe7T6N4XZ04GdTezrW/BuKb87IrtifwUPG/SU
	 LzaGVT/K+GNLywXx7PvYsP39M0ohu50LxZvk3L87WLDOjEatbNYupabI9FugHqL6SO4zr
	 6/+OkKnq7AYenkspkMny9aSXwrjm47ug96wHYJaOqbZtmjZcSGjSGnwrLrAqoKKiD7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723956;
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
	bh=k4M9SaJ6va8907S76gCqsEg9iV2BTKmady+b36zuCLc=;
	b=fDNVIdwaXvsOgdf1hcC5eN+nKtNC8wkzQvD6mt7uIRR9P0C1JYtmKep9stR/apJo2O69
	 Tdaqq/GXkOmai+3csqtmOKhAqj8+NmCmUdHoVJrA3tknjnwgd5YM3o+8WEr3qqJDuyPRW
	 QlewZhS99RClARHO0LBFA3sWJ8TqtqnzvlIAY276j+qIguV+devxRx3lRgOY8HXVMm4fs
	 HSUOoKcyvTrNB1M+JLE6pekpFdB2fQu1BUE0IBsCtHbimFvt9VzqzBd/enQV5whENbQIA
	 JcsmESwHXemN98c/fxapOYqz9vHpaS0dTufq3Xte9MVfpv5mwA/tLdLXqmK1njxHtGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=s+HuyudV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.51
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012051.outbound.protection.outlook.com [52.101.66.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3D1606A319;
	Fri, 23 Oct 2026 02:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E3D1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=s+HuyudV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cxr5nnZx4QNZDR5htIUza26oqTMHh3qyt8MCCkZMCQJLp5Ehp+kX4zlkXLoew/e5KgtxdjLz+UO0v3f74++Onx5YSeNpb53/ty/PMmXdhRf8twHR682VRg33exRJvnPqVp8w8clghkc4feA8AxdI7NkL0vHApaMCGzjkxU2W9uV3utu/46ckb0sPcuvQ33aWLkEZKDkPlaxeyar80S1iPrXuhEwNGCCMRrhOdK7APA3AB9Vzqm6M8Knk5LJX/YGdHUMJnp7ejFOFOWqMcQDwNI7uXKoldnNMQjcPlJxBvpH8L6U07ywUtfHJP5+DD7srsK5snHavKCcczHF8pjkcbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4M9SaJ6va8907S76gCqsEg9iV2BTKmady+b36zuCLc=;
 b=xTLbgPsnie7foBBzg88JyLVdUd6uAgp2I9K/bpMCic7GCpxqB/18HkuvbJEvBPDTC4P/LWsuwXiX7KIFdmRn61vU6gwattGbLsRy9yo8q/Iwf/fOfkT+HAGl/PM4DoXcMLMD65EFrhIzofoeQV9OCq5KpmI15osZxwtvinRf7rDiPC3SsoGaurQRAh3I1wtPmAszR5m2fmbORHDvd1ud4HByJedD9LW9Qn0MHdE3aIblaY2SEdEx9+sT4PGRFa+ESUQUVUFAQBHJPULRddMLfUj625ckbVQgdnHVzGeh6qTMgr9CDXbcpUF1wW20mYEEI1ByjFjUrkPkxg8t7IqIGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4M9SaJ6va8907S76gCqsEg9iV2BTKmady+b36zuCLc=;
 b=s+HuyudVlcFztsqp1Zb9Zy9DX7rmO4Ux0SwkW5hdjlG68wDc0DpfqtFBzDfjr9vGvoyijYmAZKuSllvCTdrX3W6PDLGQ830gnLvIt33OIEzLybvYLOMfW3G8khlt/jvoIAdbAm6Vgee3XHaO8NLr+BjX03cGy/0Byvneh/u491rHG7FhaBRKzI21JH4WyJZOWJl3D8j5ryjmeRrCNs8A6NRkOS2aa9Y1FAqX6oruyMh7QSHSYB7UWAxRuiW3ma14sga9qhbjRqLkXJRFp4nUEjlYAnejKdJ/otlkqw8SeTWWbZo5IJi7HWKbxFBTnPThiURh4G5XoMVrgRL2AxHsnQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MI9PR04MB185402.eurprd04.prod.outlook.com (2603:10a6:290:bc::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 02:52:33 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 02:52:33 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 23 Oct 2026 10:57:00 +0800
Subject: [PATCH v2 2/2] Revert "arm64: dts: imx8qm-tqma8qm-mba8x: Disable
 Cortex-A72 cluster"
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-8qm-v2-2-a8812a888e3c@nxp.com>
References: <20261023-8qm-v2-0-a8812a888e3c@nxp.com>
In-Reply-To: <20261023-8qm-v2-0-a8812a888e3c@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Peng Fan <peng.fan@nxp.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA0PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MI9PR04MB185402:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d90afa-47bc-4170-d492-08df30b0af99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|1800799024|7416014|22082099003|18002099003|261022105027099003|261022075727099003|11063799006|261009223027099003|261021123027099003|10067099003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	9uEoWj7wR4C9o7FMGHsBUEEVsrbc+fEbmpB2ihQwwBItzwbW/jDELpcJL0M6VOspqRs9P6ne9dOzrAGeqrWyf8ENa0y5l7fktgMiYoTj8Bpa6jOy1EcdqoZryFOyCwIjbEaA3/uxjIICAbJhi6V0xJqSWmuYtNtBN6KJlJx9reJA5dmwAgCxNsKiO/Or95N2hqpfwuvJoPWb0SiLZmUdbo3f7XOVN/Qi/5EZFmrIFSVQpYPByMoY46EVxXG63jTrkasEyipHLpiFDm67AXL41S5AcKEgWa7ZOlSzScq5iUoTc655sNHTV2uRF54l4P5pgtaSH2ysX4uSEnXwmRx2WyFjB8+VJ5aRSY03aX9Iq9EvcZLB+Mr73uPszTA40gf4AJlxzqWYsS8TIUeLERAgzAPjFEaiPbfZaDeKxnMRWNGgzUVr6b3s+MpGt+NbwDxdDZdWCuOiDmfEW0Bh43I9tDEIH2eEW3qSIs4gK3c5sFdIP2M5HYlOgG+ASMo90I0X9foEZNKJWOkSC2FysIZegpLB7TXUFyd2CoRvY+2nRVZbHz/Bc8QtgnDot9xdLyWNLbX0nSKxXg7RfVyB+6zOEDeB5P9XhFCD9T3CXUIQhKheD3MsdKbbR0fbO6yvXcEolYqxcQyBNRMEbSZhjyvAVuwEWN7OQGEptlxu3q5hvTQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(1800799024)(7416014)(22082099003)(18002099003)(261022105027099003)(261022075727099003)(11063799006)(261009223027099003)(261021123027099003)(10067099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azl1UVo3c2gxK0tpakJPR2VQMmVGaFNPYWpVaXpxVFM3UHB4NmRPYkZYWU5l?=
 =?utf-8?B?NXdUVFFxM25uOVRYVndWSEpCQ0hlQmxucXhOQWwxdnlDemMvcVU0SUN4Nk1D?=
 =?utf-8?B?ZllkMjkyMXlxR0NTcm1zdURxa1V5UWR1b1V3QzUxTGJock95RkFXYkZ3SndJ?=
 =?utf-8?B?VmhSUVhyZmlwTHZmVitMZlB6am9iL0k1c1JLUUorTDdaM3pvay9iUitvRHZO?=
 =?utf-8?B?MjlWOHRVVExzbUxSQzZpcGtzbjVncXdRZXF5T1ZLVVI4TGpxR21mTjJ3aEt2?=
 =?utf-8?B?RmtqWE5vMXhzSlFNalhWaTJIR1dTUHU0TmxiMmF4SSttK1hhNDlUYlh0SjIw?=
 =?utf-8?B?SktMaVNmcWErcWErYVJBY20rQjdsWTA2blNLMms0TkM2MjRiZkJVV1pOSTJP?=
 =?utf-8?B?S3pNRFpHYVpubDRQMlh4YjVRY2lJTjNNU21jdUFlU0JmdTRhQWJZRWJ4Y3Fh?=
 =?utf-8?B?M09USFBNQisweGR4NUJOdi8xZk4ydzd4MkFzY2ZHTkQ2VzVvbklvSjNxK2I4?=
 =?utf-8?B?WWFyWHhURUlkdkpLc0w5djg5QXJwbDNBZkZhWSsrTjB5akJrNk5qajZQbjda?=
 =?utf-8?B?QlEzWDR3aUYzVTNXZml3Q0RKcWVVOE9pZWp2YWFEWXdJcWwyWkM0Vnc0RFI5?=
 =?utf-8?B?M0hpWk0yazExU1QrK0RtbkgwRGN2cGFZYlIrTTE4eUltalEyYlAzc0VBaGpN?=
 =?utf-8?B?UGR0WVcxbnYxRHNrS0xqTTFlaXQ4Q1NOcjVTNzJscG9WWmZRNW9TenpJdms0?=
 =?utf-8?B?aU5vNERkYldhRTZhVkFhZ3pCZC9kN2xsay9HdzVVclM3aXVPQnVOeE5CU0lO?=
 =?utf-8?B?UU5oMzI4b3VLc2V6MFhUUGt3aCszYXRwSzlMZEFaSkRVK0ZTRTZhdlhFNVZw?=
 =?utf-8?B?dFVPV3VUUnpOMG5Ra0xIc1ZvQVg2dzZLY2ZmNFZzZzFuY3hBRnJBanpPQjQr?=
 =?utf-8?B?S0ZJOFI0aU5ucXdjdDhycnFSRitEZlU5bUllNEhpMmxQSjhZcC9BYWhZT0FR?=
 =?utf-8?B?a2I0UlJWL1IxNER5eHRNYkV5bXVKVDRjci9Jb3FhRjN0b3RUaW9nMmpyQzlW?=
 =?utf-8?B?cncyS0x6TkVwcHRGaEZURDF1SzV3ZWM2YUhUWDhuS21PdkxXV1ppZmRaQkdZ?=
 =?utf-8?B?STc5TGlKQ2FJdm9MZTVLQ09Ea1lYV1NkZDBQSVR2Yi9VcmpzOXFHSE5FaXda?=
 =?utf-8?B?bTBXZzZuQUVHeDNpNGlHSEU3SndCS1dmRkNaeGVhN2F5THBvMkl0U2wwcXl6?=
 =?utf-8?B?Ym9DWVY0WDZmQWNQTlRlQ0FqYUYreE1NZXF1VndHakZiWU1VeGlqeUdrZUMv?=
 =?utf-8?B?LzdJcHlPNVcweU82azZPZUQxUVJRc0FtS0l4RlFRdG5NTlY1UmI5dVQ3L3Fa?=
 =?utf-8?B?RENXSUZUQVlwR29LZWYxaFVhZC9nd0loSWRUaVhCM0dKL3ZPWlFPTlFnN1gw?=
 =?utf-8?B?OVZWVitnMm9NeTdQTWYrek9DZGJia3liK1RIWUNxMUxaWEQ4NXY5T2F5L3pB?=
 =?utf-8?B?aUd5dFBsY3lBWXhIaXdnTWxwVWR4MS9ZOEZtb0lMZndlS1B0dXlnc1J4ZW1p?=
 =?utf-8?B?S2R6MnZ4MnBZMUsyR0U2V3RMejl1MGhIemxTQ01neXVKMUUyU0lUREovSUt4?=
 =?utf-8?B?RjdrYldmb2NsQnF6SDNqdzUwZnFTSmFzbllCWHNkdGM4MHNNbjgvQ1dhZW5B?=
 =?utf-8?B?NzZHTWticUliKzZHL1ROOWpJYzdjYjJQRDRQOVVYNm00cWVWaWg2dVRXa1RH?=
 =?utf-8?B?b2VVMEdpcCtIRDlJVGh6NjU2K2Jhejd3Qzc0OVpsVGpiUEFlMUJzVVA1T1V5?=
 =?utf-8?B?dU40RVpiRXhRbWNtZ2hzb3RJSVJNNmtsVUNwelBGMDRzUmFWaEFZRVVyamxV?=
 =?utf-8?B?YlF1aUlTaEZwQ3o1QXRrWGIzT2VHSkVsQWJqTlEzaVFXdDhtUFhUamwyUTN4?=
 =?utf-8?B?WXN0UHB5b1VlZXcxVW5XR1NWS3NnUXdEUWUwdm1nWUFlZm5GT2MvQ1hpdDlM?=
 =?utf-8?B?R3N5YnJwQml5d2x5OUFrT2syTnBIRmhyNnBLSXR2akY5Q1NOT0o1M1M1c0tw?=
 =?utf-8?B?bnJTY2l5WlFoQVl5VUFuZTFJQTNscGRLT0w3VFF1WVVzUWV3S3JxMStnQWg1?=
 =?utf-8?B?TVJxTVNLL3daL01rYUhsOEZFTm5vUnk2VXpqTk9NTDFCUWx0TnZjN3FzTVBE?=
 =?utf-8?B?OE9pa1p4c1VPZXZRTHNieis0c0FuUDI1RHIvb0crTnZsT2N0U05KczdycmZk?=
 =?utf-8?B?WmtXbmE0WTNkWmM1SjFYQ29qTWNWdFIydjVXZTlPOCtLQjhMR09rcUlvaVg4?=
 =?utf-8?B?dWtXOUlxWUVLYmZzNnVaN08wKzBxUy9Ta29KaUhPNFdSWm91dFo0NC9oSldu?=
 =?utf-8?Q?vlPCMyQ1CHWtAheNAxLb5ehhDCNcR+5JUkeJy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d90afa-47bc-4170-d492-08df30b0af99
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 02:52:32.9784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CW3U9s/fEsTC6K2R8dt55gFkHTj/AqVsnlRmx/pKyDkiG27rP1MDxHCZMgK61qnz6GGL9Idsue94crGObifqfmiMAlDPuGrhZRyUOnbtjShkIyMNxe2O+woNvd4PqNd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB185402

From: Peng Fan <peng.fan@nxp.com>

The ERR050104 cache coherency workaround for i.MX8QM/8QP has been
merged upstream (d44e08dab27d). The workaround addresses the incorrect
wiring of upper address bits in the A53 subsystem that corrupts TLBI
and IC maintenance operations between A53 and A72 clusters.

With the software workaround in place, the DT-level workaround applied
by commit 5d20f1ccb339 ("arm64: dts: imx8qm-tqma8qm-mba8x: Disable
Cortex-A72 cluster") is no longer needed.

This reverts commit 5d20f1ccb339.

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 39 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi  | 13 ++------
 2 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
index ab3b244b684fd..bf972010a88e7 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
@@ -298,6 +298,45 @@ map3 {
 				};
 			};
 		};
+
+		cpu1-thermal {
+			trips {
+				soc_active1_0: trip-active0 {
+					temperature = <40000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				soc_active1_1: trip-active1 {
+					temperature = <48000>;
+					hysteresis = <3000>;
+					type = "active";
+				};
+
+				soc_active1_2: trip-active2 {
+					temperature = <60000>;
+					hysteresis = <10000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map1 {
+					trip = <&soc_active1_0>;
+					cooling-device = <&fan0 1 1>;
+				};
+
+				map2 {
+					trip = <&soc_active1_1>;
+					cooling-device = <&fan0 2 2>;
+				};
+
+				map3 {
+					trip = <&soc_active1_2>;
+					cooling-device = <&fan0 3 3>;
+				};
+			};
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
index f0e398eb2aad7..d94605c999915 100644
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
@@ -181,8 +174,6 @@ &mu2_m0 {
 };
 
 &thermal_zones {
-	/delete-node/ cpu1-thermal;
-
 	pmic0-thermal {
 		polling-delay-passive = <250>;
 		polling-delay = <2000>;
@@ -208,7 +199,9 @@ map0 {
 					<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 					<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 					<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A72_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&A72_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 			};
 		};
 	};

-- 
2.34.1

