Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794799445;
	b=5s8DgiuEYJroeHmg731n7unPh6PzmvpxuZwJz0HNzkHXiNP/hBzNRTTNSwq5rOg3bxZ9
	 tNpqvLylolP5DroNKBMo90Q1s7KUpjGVXuPRZAXNcQxHuCY49aZ/n0zpVqWAWHRInibPD
	 zM9JflCh2QmweWahNBnW0/OZbyscO6CvcTWgr7oVk0XMmZL64HyYoDdAK+lH6RbDP8shk
	 zq0T/RU8qjSD/jjYIdpcj/0W3a7DkHiUcotGQ9/kYMOIAgtAd58WVnp+KrLhjon+vBJ0L
	 421uNjcI602jJThZuzhryPgEUhLnm61Ma1HaDRszzoQt3oYADqzTYBruaYeDIt4JC+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799445;
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
	bh=8i2rli75zuapNYSq9ofQ0Y1r3QvOAWHtqJ3HcReukTs=;
	b=KM5TWl+QnPnYuuyJIraYYvUv4Tf/LELvYnq0+NDL0wNqVFxOxqt5DJv9/bjRHCDccV87
	 hxxD2ODub90/+YW1AftjLoQvJdastgFbrv5X/SiG/YpfEbsWUJ1y6g246Hi6K7Gbfnpbp
	 aqjBbY3B/VtSB/pmS3F24QRo86ET97qoW6IO7YB2IoABbLLgctlJwwtY0thuJTDIwu8r3
	 Y4lSnnqYB+Rvvi1VFf+O4TNOrsfoHSaZhTp+cTeql9Px9SzMIxzgf8kRNnsPl0T2BzP3f
	 srlvKaqTWdIPmH+TcX3MjL3uNw5/jgFd/axADiiYpzYnNRtmOuEkVoP2xY0AhQ5Y9bQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=J+dZF0fu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.37
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9B5606A895;
	Mon, 16 Nov 2026 03:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A9B5606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=J+dZF0fu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwgKf7NWVPjuBSP6O97H4q9HssDnp1LK9t14bxJNcPJ32n4NBVrpkbF8zNioO4iW1Yswe33GuS0mp/Y1jdcISuq7UiiEwSKbGOc9cTsdRdXEIQ8Yvv8PabwP1e0rz89Q0IOL1kwqzYpVNhtXPHMCUM6HIc9mo0os9bzyUayOMzzZfVmXJQjDYQ3uhzETL6jxmJXRz0+2PI5SzKJva6v4PsxoixUho6HMHYkivkDFKqYoqqYej4/wFD9E/36CF0+uLt2hfDruWJ2539Xl0CfH+822P3eaIeC0kUWmdVvbbRvAU+nCIh1DKusk3pEut72QVS2G9i2uZYhvdfiH2VhkEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8i2rli75zuapNYSq9ofQ0Y1r3QvOAWHtqJ3HcReukTs=;
 b=AUGotUy+0jE38lU4FmJH5eKloxp4jVXAds8uGTCRhSzf8WPgjl0q5DlVMcsPdCAISe5bM9sA/XhH7o5/RyQcjsWxtx7OdNOCe9oxyP0h7ZV9JCR6G7OKsJEM0bP7fZFrkZF5DRpmKNRsafjhfwqx0/YyzXp2kSXTHytoyIJ3bHKbnLQDc8PvT7fbXarGV2NYP6favp7F7k4pm1q7su8nna+3Yry6j6TGQnp1hA5v0hjBGZcQByJHvTHqkjoWFMeK3LR4xJlMBGnFdeZMZq+7iNo3SlGHzAdwpcURg/Jvf1PFW1xkb8CU4CStVifWAp8b36cYujaHHrSvufw2vxQlTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8i2rli75zuapNYSq9ofQ0Y1r3QvOAWHtqJ3HcReukTs=;
 b=J+dZF0fuhe8+kxmXD2jJuyAY6HLl6RxRLJOf7g28scWH4PutyFkXXReuLBVDKo4dR1upsEmUbi5245UY8ePcS2+VNi14My9S5MnbP9j4jRC4fQWmgNpAriSE1KIEK28xJmENbRtr0ComVd+YPYbf5DZVnRbz1uncC/cE+cli8FisbEYQVp1alio4A7T6Ju/0EQL5Bq+VPHXFlTf4eilTnynISZQW0bnXoZVKuz4EJphorEfa+DkLmN9VZy2qo6sKPoouDZ3n5ku7M+ICWgjWV2w4h6aNMRAfOPEsmFUa911Ung/50R2eUl2xt/qykigKt5X50Sh65ckh4gtl18CZZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by BESPR04MB035703.eurprd04.prod.outlook.com (2603:10a6:b10:118::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 03:24:01 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 03:24:01 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 16 Nov 2026 11:28:24 +0800
Subject: [PATCH v5 06/11] media: imx8-isi: Add RAW14 output format support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-isi_imx952-v5-6-46de1d24efd4@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794799700; l=3725;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=5OtoKZTz/kg9Z1twuN6SQfPLBcJdol2wlDP+VmE5wuI=;
 b=FwR5ebL2o6tAs3vbOUhrXbKcyAX8QEO/9MX3rT926YqQas5pTyGSb8lgCXqNhjwcRObSBPkPF
 9QPKkFTgPtLAR9kuk3M0j+3Sfom4fiUfJuooQB++/4inMM0jKgwr61S
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0138.apcprd02.prod.outlook.com
 (2603:1096:4:188::12) To DB8PR04MB6667.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|BESPR04MB035703:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f7d0ace-e098-47c7-e595-08df43910f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|921020|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	BKPZkyODEehtAIR5vObx8Y1AgoysB2+Svr5/YM3TcGoOTeTeXoZVX4JqcjSOnrKwtPCuecbHd1HU+IlQS2D2lLGC64hryf24w40rwAtAQZR2Jhs5YM1d3VS/py9UnfXEONP3PwBbpM51A25a3hCnuD4j8vyhiZ+9hORW2YdMt1IyiBF86gQblkQlTMk2DzVygPIrwDxXBGZ7idsvxvwnN9bmqGOKYCjIYTwkjQeUSPy9MQMP5bDBE2+YbD0r3VGJcBaMhsEUvEVr9HVxs1WekRwAg8YZhYyJYz2gWQszE0KjzdgR9tRTtBJFLDtU5ONsq+7zp5TCL+U1cpGvjEzq9FCpSy7E61ug/Eir23ty//8Il4cV1wGkigeRbkmpYSKdJGVU73FI8M4bEltyVsrLuC1WQ56xxJ0EFnElJAvYv7FcuhHTGLpZ+ldfgUNh55vZmJO7+wmu72vUCuVmjHPCKlTdIWDpmPgexLGMaqbfxT9gwr8ggT4mxC98QKpyI+wHBPBgmEEr3Envl0Kg9yXdGgJrjN5HZ9frsfVBe5957Ap6KxU3yPIrkFZYitw4zIxr8M/RAqhA63fKsJ5qs4u0HY1SpGcHj69QHLfLfv20fdrIz1GlNQtMbsTSrI696366p36KElfucPmT2TkDPYtJcRrOiRt+DXixNNMZUiUSJk2HifSiz4iB78uPNfT6ZTdN7JhE8rcf2IaO9yXSrrNHjg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(921020)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXFtRTFQcDFOcWNUV2x4WnNqeWpaQmEvb0JDTmxrd2Jjd3AxQXpaV2lGbVB5?=
 =?utf-8?B?OGhJYWpRVnJ6a1ZNTURHYXdITW5SOURpeGlEMTgxTnBDSlMvL3NlOTdBTjhT?=
 =?utf-8?B?VjYrVzJJUU5XMGUxSDZDRzlFOFkrV0xjSGNkWG1EMkh0RG5TYkJkUnBDWUZV?=
 =?utf-8?B?TVBOYlVXN2tDZ2FCMWlNdEh1WXdWUVp6YzYvTGFQOFFTVnNRb3R2YjJBZ3NS?=
 =?utf-8?B?Tmo3QXRGVzZPMzVFQnpXUzZyOW5WVlZvVjdyYXNkV1hXc0xVemc3ZUNrb1A5?=
 =?utf-8?B?MUdMM09kNDltZ0lFMlRwa3crZEN5MXc5aStwTE1hK3pBeWF5WG9WVjBodDh4?=
 =?utf-8?B?RFdSZkswdHRrNEhrTFNTWUtiTEg2S29sMU9zanF0TVhmeGZjalliQnpVUm0y?=
 =?utf-8?B?NU14L1lVODVKSGdab0xEdGJMOEJhcDVZaGxDODVjdjJTRVQ4NlBnN0Z6RnVh?=
 =?utf-8?B?WE9KM29VMjRDK1F0TEIzK3gyZUdMTXZ1U3pCMnFsQmJocytqTVBGNnFvanNa?=
 =?utf-8?B?NGtmN0QxdW5ObkYyUUdFdWM1WEltQTYwWkM4RUxRTFIrSWQrY2QyT3NnK2dy?=
 =?utf-8?B?SUNkZmV0aWdxNTJtU3dnNTNIbW53d3BzeEMyODBORUxoM21TWjltam1SdSsy?=
 =?utf-8?B?Unc3aE03eThrbGd1SlIweXpzL2R3MHBNKzdIUDJRQmU5QlRrcW9FaWQ4TDVU?=
 =?utf-8?B?cWhXbDA3RWlOcWc4R1d4blZ3WkxLUnh6dFh1Vko5L0ZQTG14WkxWbkFBUC9I?=
 =?utf-8?B?bWNZYzd0Rko5aFJ6bCtyMnBqM2xtY2IwcnpJcEsrMGw0RTlzUVl3SVRTOGZs?=
 =?utf-8?B?L3hmc3JacG5kZ2h5elYrZ1JKY0VOc1FBeEk3eTVzRTVUdys3dmFuYmxCZndP?=
 =?utf-8?B?Tm9GTDZ4Um81R0NxdFBOZVVSL2Jnc0VvaCtubHFuVTBoa29XaXZSeGtkZEpi?=
 =?utf-8?B?TlFhZ3VOR3p5Q2lXRHlyUkpHZHRrRHF4YkFKVXkybEdTRXFyN1lOc1BQSFVz?=
 =?utf-8?B?YWl0UlV2TlNrY1FyR3FnbmZCU1E2blhCemxxSEZJVFlJTkVmZlEveWQ4SkZx?=
 =?utf-8?B?RWcyVzVpSkw2dXcrSUIyVDRrVWpDai9tMlYzZkNuVmdYdGwxYU8xWktrVGkz?=
 =?utf-8?B?cVBkd3VxbnFyMHpmOGVLMUVzRkRUd0d4SEcyeHVZZ2lHdWF6SXpwSWdZTkFQ?=
 =?utf-8?B?V3U3UWRKN25BdVUvYU9CZTdheWF6V1B2bGt6VENjak9YSXh6WDlWNnFqTlpQ?=
 =?utf-8?B?ektBOEF6Skt6VTE3Zld1bnRlZXlFcEloQTVQYnY0ZEE5R2kvK2puRGhBajVm?=
 =?utf-8?B?VDQ2VE9PNjIvSzdsVzI3M2xuRFV1bjNXbXBFeXVQWUMvWUFob29OZUhPSHJ3?=
 =?utf-8?B?L3dveW1HNlJoK3NQN05TTWZBYlVERUJyYjVjejI5S0t3T0FJUStZMndURnM2?=
 =?utf-8?B?VW9sbDErVys5cGtjTlFFc2x5OUx1TmdEQkZwRy9xQWMyZFdqM2tEbCtOT05I?=
 =?utf-8?B?QVppTS9FRDUvQWFWd25CTXhmcmIvaEtZR3FLeUdWTC9lSE9SZDJwNVk5VEVK?=
 =?utf-8?B?eDlja1hkRThWdTlPWlY0Uy9kQldUcUJTYWR1Z0JsZ1gwTlR2aE1GZ1BLNXNq?=
 =?utf-8?B?TnRYK2tGcGNsL1Z0dTRLbVZzQlpuMm1KdkxGei9lVUpjMGxVZnJKVTFpMkpv?=
 =?utf-8?B?ejFIcFB6akY1TktOVTFHRFpEZGFtZlFETk10THlSVGV5N2xPTjc5ZE1ZNTB0?=
 =?utf-8?B?cHFwQWhnOEhIbU5KSDBDV0NQcHBscDhCeXF1dWRQcVpXSHNXblRicmFlY0I4?=
 =?utf-8?B?bS81YjZZSmZCa01mQmlwZTFSQWJNRUJSZ2pPQmFjWCtvN0hjZktGNm9aNEpI?=
 =?utf-8?B?KzRFNHpjSURBUHo5U0lhZUF4QVdXQ21Lemw2cVpKbjB1M080L3dFVjdCN1gy?=
 =?utf-8?B?MGYwNjZoNzdubDRnSnpuVjhybFhYSytRRjExanVnR2o3SjFNMTdqcHg4THZq?=
 =?utf-8?B?YWVKdVJOcmdMOG1lcE9yOUpmWnJvRzlFQ3ZpY0tNRUljbmE3YStjYXNHdnFF?=
 =?utf-8?B?WHdQVDRBUkYrVVVPZGtzbDUwSXdGc1NxQlh3SVN0TTNIbXJXalg5ZHdnRnNP?=
 =?utf-8?B?Njd1ZEYrNWovZ0FzSm83MUtyKzlRdWkzVGNqWTlZbjg0Sm8vNW1YMGVyWTdE?=
 =?utf-8?B?T0plR1RhZ1ZmSm84ZGNJVVF6UVpUOWFjRDNDVWpTdEM2T1FoczZrNGgwVC9p?=
 =?utf-8?B?ejZOcjJWVnhFVnFsSFlCU01NWmRzWFJ0RjV6cDlMWjI4U3BybTF6QTBEbEJh?=
 =?utf-8?B?ZWFBMlZHYnU5ZFNXSmNGTDhRV0xUYXlDNU1tOVJYYzhaeGhoVkEwRmdGTFgx?=
 =?utf-8?Q?ERirie0EQ66quAVOemM98SSTiX2k8e/z7fXfr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7d0ace-e098-47c7-e595-08df43910f5c
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 03:24:01.7790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcHdgYH/m1Ev/GHDO1OPoB3S4i9bI8FugRqvD/9i2cTECJsv36GOdEbTMiRA6P0QBCflBhKiAyspmyuuHGfF0WHCMSj8NgTucicY9+cjvM8GvtJB3bUJp5BrTddzgiYB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB035703

From i.MX8ULP onwards, the ISI added RAW14 output format. Add its
register definition and use it for all 14-bit RAW formats in the format
table instead of RAW16.

Include RAW14 in isi_out_raw_shifted() so the RAW16 workaround covers
it on platforms that lack LSB-aligned RAW output.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v4:
- New patch
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h  |  5 ++++-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 10 +++++-----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index 0f3ada30e71e..5f66b7c9cd1c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -89,6 +89,8 @@
 #define CHNL_IMG_CTRL_FORMAT_YUV420_3P10P			0x3a
 #define CHNL_IMG_CTRL_FORMAT_YUV420_2P12			0x3d
 #define CHNL_IMG_CTRL_FORMAT_YUV420_3P12			0x3e
+#define CHNL_IMG_CTRL_FORMAT_RAW14				0x41	/* i.MX{8ULP,91,93,95} */
+
 #define CHNL_IMG_CTRL_GBL_ALPHA_VAL(n)				((n) << 16)
 #define CHNL_IMG_CTRL_GBL_ALPHA_VAL_MASK			GENMASK(23, 16)
 #define CHNL_IMG_CTRL_GBL_ALPHA_EN				BIT(15)
@@ -431,7 +433,8 @@
 static inline bool isi_out_raw_shifted(u32 format)
 {
 	return format == CHNL_IMG_CTRL_FORMAT_RAW10 ||
-	       format == CHNL_IMG_CTRL_FORMAT_RAW12;
+	       format == CHNL_IMG_CTRL_FORMAT_RAW12 ||
+	       format == CHNL_IMG_CTRL_FORMAT_RAW14;
 }
 
 #endif /* __IMX8_ISI_REGS_H__ */
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 978a637f539d..ca8fe8782af8 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -250,7 +250,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_Y14_1X14,
 		.fourcc		= V4L2_PIX_FMT_Y14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -376,7 +376,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SBGGR14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -385,7 +385,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SGBRG14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -394,7 +394,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SGRBG14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -403,7 +403,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SRGGB14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },

-- 
2.34.1

