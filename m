Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793686913;
	b=xq/iFz9n1vxVtCiM9NERK8wa054MscEkE9znzerY4QFnWjrwbJnsPufPHOn3aZhty8pv
	 8136aA3rcKSZoemwyzunW+t0GR9ri+Ovj6hsYegWGzK73hl8HoZud6pZZyL+z1WZqdrqD
	 OsxnFr5oLUA/EB3jbZSs/EM4RzEMmqTRASlVMHXYqi1eusD0O5Z9A2X0gYtwYva5/J0aS
	 s9WonqXdoJLpboljdM5NP147Gn4eQoGvPd+nFUsP0Q2CCchpXTc/oMKFRpkhB8p+ISZPg
	 ack7ZM4KhPYPVOlCxIGuMCoZHoWMVZM6B3EdWt1BrSG1tJh1LrUuTPnaYwci5zQZhRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686913;
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
	bh=p5alp8l1ST+M1L0jK4OXxl+OfLOTUBTjf4TR19VjdxQ=;
	b=lKYALleLSeYKRdqB+hmEe1ht3FXEUCzr4WulAkkqNXQn1nJNTWnzUUD3odjnMNUDZFOU
	 E9SrHEIZcB19FVY7Eq9H+Q5QP4r5wCv4MJCTBtO5SMNWW45kwBfSWvYWo2N21a5hzc5p9
	 pf4XeZfdfMvk58OofAMNQlmcO1SONvIdapKPr+iZ8XaIe9ZE//hRAVXqJVpqSnHMNJaps
	 tqyJRTzo2+Xo5dGgpxvkm+Gyb/ctqmcKOAVq26nP7kf2KmIEeNpiooihPAHJrdBlw5+f1
	 r2SEo0Jwqza0qLrBLQhiSPAsZrRQ2NMv28C58l5SW2vsxBnPt0OfUvcNb0E/ssRSSfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Vo6N6dNr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.8
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013008.outbound.protection.outlook.com [52.101.72.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432EC606D803;
	Tue,  3 Nov 2026 06:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 432EC606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Vo6N6dNr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLXu+f6dekp3B4uM+EzKyvYXsJ58Pgg7BXn3PM//ZWYsEOg4USLjOWxym5BdfC2hiDF3dTm1YnuGTZbHdvgxIDkjeLWFvrWd1VBElZQypkAY2PVxBk1Z+QS6KevOFdTQViF+T+Bi+2nspnoHkDyecOZQs9Zuz30MYoF7Ru4fRgHNO5uv7F5O1mZ0x2bfO2jzIZDakVgBkkOqjCxSF1RDrn3J76qV2I9KuHqx9ZOv4yGaXJtZBoR1P9PJVS7NXfpwkCvJzuryLMociHF9y/ft1H66xTMvAslgw/O+ofdJW3N4zyYQy/kmtXZ38BMTKLuqdkKPBHRHIH508GBUvQH1Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5alp8l1ST+M1L0jK4OXxl+OfLOTUBTjf4TR19VjdxQ=;
 b=gIMRwFBhK4z+VOdPKebrR/j1VZKtZWaBe/OmQV7P3qsKdnvB92L0gbkzrVlqVJxDHvrlMI0ZXCHTu+ajP4H8WkPq2+qo4t5hi7PIVOEb3jCdMt4LtpfMQEsP76MMBdQCv9Dhkt3i2Lk+jH9cg+Fmz2nftwX7W31Wozbk29LRP1F9cWJE8/BGnIlZVf5F+ovX/v4cIVi/6HlU7jpumiw1rNs7IVYJWU8APd8qyjYmPwBJjicLkOyochNSForz4xYxP6d9gt9qlWvAPZApaGqzBIls53Tf4Z04LIFWOk78xMISgaU65IJRUgaAEyrzoVC4ZB2riTqGQTRSN7zBlpICMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5alp8l1ST+M1L0jK4OXxl+OfLOTUBTjf4TR19VjdxQ=;
 b=Vo6N6dNrTIT0/TMcUC31ImHA1Olc8WboQAQDEWWwMqWf3k16/qKB9ohuOh6niA0zEC9xxRb9SQo062zSwfpGq/nd6UkrS4nMt2xUwsif2NQHWXu1MWpZaS4nKZ/x82Hb78p0nDY0G3Q1CnY3Xc4HgyHYCdZt3pASBm2eC2/wkzMevhigFFwVkdZ0idNpNpRjFc5lH6QuYtsV6bR6XKjDdLAfN+F/fLqSf0+LIgab54tx3fMUXJikAjzGpbTE2lKvv81kFAzZ79TfXbqoIQum8VnV/FN2goQvQcUTsbKkzONXG7XMSE5VJxi6r0PGMj8S4iapShr3Mw8KF5ESnI3vqw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com (2603:10a6:290:c0::7)
 by PR3PR04MB7353.eurprd04.prod.outlook.com (2603:10a6:102:82::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 06:21:50 +0000
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151]) by MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 06:21:50 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 03 Nov 2026 14:22:10 +0800
Subject: [PATCH v9 14/16] drm/imx: dc-lb: Drop initial primary and
 secondary input selections
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-imx8-dc-prefetch-v9-14-3b985e7636e2@nxp.com>
References: <20261103-imx8-dc-prefetch-v9-0-3b985e7636e2@nxp.com>
In-Reply-To: <20261103-imx8-dc-prefetch-v9-0-3b985e7636e2@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@mailbox.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::6) To MI9PR04MB350878.eurprd04.prod.outlook.com
 (2603:10a6:290:c0::7)
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
X-MS-TrafficTypeDiagnostic: MI9PR04MB350878:EE_|PR3PR04MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 41b01183-17dd-43d5-28bb-08df3972bef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|7416014|376014|1800799024|10067099003|22082099003|18002099003|921020|56012099006|11063799006|261021123027099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	30gD+khX5DyWpEZYHiqsiOVX4YUWyorkNOQoiRXZNWza1UrknJ3QSZOBayZcUeS0scDvH49isR+RZwyXHLIfvgFcAWn4oweMGvf9C14YcHPpSRF5J/gj0IhmMaSsK7hwdaMfhEmitq9fYdCmC7eNx2ryJa5Ele6tdVbXR/Ie+510aiExoR987YqNHaRB2Rf1dZGwCPojItpEygC+y9sXvb10vvNEQX59iznvGpmYRQxGrifnp/LCBDIytoqwMxGFpfwIF6loqKa6tTKXqGHEAOUs7YyptuK6JKIeWZcrBQYuC0TjMJjjtUvkZF9GN8zGOqt5w0v+UPO+v0o9GDDksC9VEcGUrSyxjsPtn/W5e+70bDBrIyrEZW8kW7UxYtNe/r2m9s+UdICcwUCK7f17ygzazk8ZxwmL5Y+dxbYMBRg2bLFrON6NPDSgZ+9vvvmMn1kHiuN8QVKAWekGL6hG2aHLhKm1ssfMIX5Mt+p6pKtVW8dtYj4WtcCD2PNGAl0BYEick7gOoZnGFaXBNLXcdt9kX0+A/HSkXSz0AplXjVgEun7IOBWkdgMH5X3p2ytNEcZxUNabHtTMKxAEKHRZCnlDav84r4NQBWUjvpzJWlXLVfkHfDVYlVr2o0DulanQ0xaXRy9MJ+smgZHcufULlAbSaoPe59CE7PTcO1fWUTlSjmnUDjxelhcs30FOAIwZzu2/jvi6SJpz5EbShqpvPg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB350878.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(7416014)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(921020)(56012099006)(11063799006)(261021123027099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VW0wV2RTTjZlK1V4NHphWElzdlBzYWtRR0cvdXhLaHpkcHlNUFRHdEtIOHRw?=
 =?utf-8?B?dENuYlFBdkpRRjExYmxGY0FZWkFTdFdwUTNTU3NKRjhJZExEanFmUkg2dURu?=
 =?utf-8?B?MG9wcC92OEVseGs5MjVySXdlVkxUdk05bFFCZjB1TVp1amVQU041dXJjdlJ5?=
 =?utf-8?B?VmxPeTRwNCtBVU1Vekw5WGc3TUFSZXY0eUxCenBPU0tLWUF3QlRYSk5jU0Jr?=
 =?utf-8?B?WEo2SFRzQllGU1doeDZjVXplait1V08wdllXbmNHNCtJSnhudVhPRFNOdzI3?=
 =?utf-8?B?ZXAweGNDVVJrTDJDbk04aUpvaTIxdDVsMndKOURDTWNyZ2hoYy9KclZmRkxZ?=
 =?utf-8?B?NVY4QVJUcHpQbVA0V2pmcHpWMjZYU0luRG8wSkN3MEZNN2YrUEVxS0MvY25K?=
 =?utf-8?B?NFI1MjE2cU54cWZvVDJId0F6L2t6MUVwTk5UVlcyOVhFZ3Z3Yjk3T0ZvYUxM?=
 =?utf-8?B?Kyt5Y09pdm01bE1OUUVkMkw4THg2djZVd0N4UUxuTWRNeHJHTEU1K29ubkg2?=
 =?utf-8?B?aFpVWGdjRDBIZERxYUdNUXBKVlZRaTRzT3JPMkdwcDlDRk5hQXpDd3d1QXJG?=
 =?utf-8?B?UWh1bXBNbndsOWVEUERGMlJMdUZOQ3pLbjZjakozVi91QW9QNVJ4T05OVUxX?=
 =?utf-8?B?NjBSK1JPKzdzcG16dlFwZDNlMXRqdHBLSk5uaFBhS3huVzNJb09USEQvODJ3?=
 =?utf-8?B?OU9EdDhiNEduU0RZOEErYzlNTzNUUU90NmZwS0xXM01ldjJFSGEydHg5ZDFw?=
 =?utf-8?B?VmtCQVdDRVFuOW1kd3RuajhaQVFzVUc1MjZQc05zTDFPakNiMFZzVWhQZGVj?=
 =?utf-8?B?Q1ZJUkVHdUpTSWFpYXhrMGJENDVBbU1lL0NsdXFaVGRFdzliZlpqOWcwR08v?=
 =?utf-8?B?RkxTQjA0Z3BiUEVWRE94NE9abUEwallhbTVvN0RLSHNsSHRPZzNWY255WXNm?=
 =?utf-8?B?amdXMm02L0pYOE0ybkF1cW5ZOWpXVVE5d1haeXJaZExSTExLY215RFVnUExL?=
 =?utf-8?B?bDlTbkRkN2ZManhndXN5S2k5NDR2ZUtBRjV5QUE3WVZiMkJ6ZFZVNkVUMVRv?=
 =?utf-8?B?amo0NFQxNFJsT2J3dWhoSGRSRmVBbEE3QU1PS3JvTEZHeHJyM2hqeHVUZ3dV?=
 =?utf-8?B?Z3JQYkR2LzdqSEFLSXNGK2k2VHJIUlNwMGdJQzU5SWN2WjVVMTM1eEpTMTNV?=
 =?utf-8?B?cFZ4d1I1QjhycWFMcVk1RE9iazgxSzRrdVFncmFuakI3bTgxcDh1amRXSkFF?=
 =?utf-8?B?RlN5MFVSR3U4RzBuTU1QZ0tKKzNJMXltKzJIdmx6TktTMm9JVW5zRHgzKzZN?=
 =?utf-8?B?aVV1a20vbnNUb3UyWFJTQnBWZVNVeTJuVnlnOS9VQ25nT2J6SmxNaS9xWXJa?=
 =?utf-8?B?Y0JiejloL1FaYUJzYTFPYWhkdldXWU9SaHdvNWVjUU92UTk4d21vY0Z5VWpW?=
 =?utf-8?B?SmdoOE91WWRUUHdqR2d2VzgxUVZtaEJBOGNCaFFNOUhMb3ZGeWhuS1pyQzVR?=
 =?utf-8?B?QStwSS9pcWkvdHpSdmxDUjBLbUphaVE0WUpjN3VaRml5QjRKWkhUTXlBcnQ2?=
 =?utf-8?B?N1RlaytsSVRibUtNVTNMNTA1RHFVbjJoRm05TExJYTFzRE5mbXFXeE1XcWhL?=
 =?utf-8?B?N05JQmtaYTh5Z0xKWWlNcVFhRHcvZkx4L3lmbjJGN3J6RWorSmFSNnBoRDRQ?=
 =?utf-8?B?VkJRNWhNUlgxZUJrYWdaaDVkVVRoT0svUG9KUUlETFJNVVZlczZmcFoza1lQ?=
 =?utf-8?B?NkFrOFp3N1NhUHNYRlRpZTFSVjkyUUpCbVUyR0hpKzdYSTc2TXlyU21heHFX?=
 =?utf-8?B?NHJRcmJBTjFrRjczbjQ3bHJzdjY2ay9aWVRPZVorVFpwa09Wd2JjN0RMZXdt?=
 =?utf-8?B?ZGFPWmI0UnJFZ1Z4Vi94NTVtNzV3eDNnRDlrWCtlRGF1djgyOEVTUCsxeGs5?=
 =?utf-8?B?V0RBTU9pNmh1YTVLYUMwek53ei9YallDSGpQaDN3cStlTU1vSnkrbmMvMVhU?=
 =?utf-8?B?Sjgva2diNzNBY29mWmVXRU9lYUpXTDhrd3Z1TEdjN3Q1YU11TWNJVmFYaUFi?=
 =?utf-8?B?R1hOTi9FQm1vcjljdXh0cDJXTzNwcGVjVXN5akdrSzlCUWZKWkNWSllZNkNZ?=
 =?utf-8?B?QVJQa3kzWnQweEZkZDZVSy9xUVBRRnpJWG9jNXlvRk56d2cxQ09MWklFWlBo?=
 =?utf-8?B?WXpzVmZ6UWxWMk9ZUXZVb3JRSlRhdmN3YzhzUjR1YjQ1c1p1VEh2K2oxb3l3?=
 =?utf-8?B?YTVKL0ZSRXdMamZmZ2s5VnZ0TDFOMzY0UENiaVFtREJrUEYwWGdmNDFiTGQy?=
 =?utf-8?B?bCt0RjUyNEJpY3lVOXFNN0hVVHdiU3BSaVRrOTFjZ3kwZFJlNXFJUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b01183-17dd-43d5-28bb-08df3972bef9
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB350878.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:21:50.3644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Lpt5C5+DZ4WF3JPxbB9RQLC7qKzmiFyHcppZQ/JPrAArxpl3NjanwUOljZVXei0qJ2TQr87Pm738yirq46Xsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7353

It's unnecessary to set initial primary and secondary input selections
because KMS driver would do that when doing atomic commits.  Drop the
selections.  This is needed as a preparation for reading LayerBlend
secondary input selection when trying to disable CRTC at boot in an
upcoming commit.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7:
- Collect Maxime's A-b tag.

v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-lb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index 924a0de4b909..36c6b37002cf 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -257,8 +257,6 @@ int dc_lb_get_id(struct dc_lb *lb)
 
 void dc_lb_init(struct dc_lb *lb)
 {
-	dc_lb_pec_dynamic_prim_sel(lb, LINK_ID_NONE);
-	dc_lb_pec_dynamic_sec_sel(lb, LINK_ID_NONE);
 	dc_lb_pec_clken(lb, CLKEN_DISABLE);
 	dc_lb_shdldsel(lb, BOTH);
 	dc_lb_shdtoksel(lb, BOTH);

-- 
2.43.0

