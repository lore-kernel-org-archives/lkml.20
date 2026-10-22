Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792633530;
	b=oSQbZAL9PnoL2Qk8r84i79ru6G/J851qzepor19aIFxR8s42ij/YSVEEcg0xgvLZEwQc
	 F40+hhbd1cUSDb7qAcTjNs8zCbIRb9JOu0hHmkRTOZTOb16FCUYqzv5ZNE9pKUjrLqA5k
	 6Z4I4KfVPKvHiztv+oASKWn5Lhcfm4KUPjyksSUyMAYSxvnEYMbciv+6xgV/8XBdM5iTu
	 gYxgmBepdcIbGBuf7atiAdBQvbAjRGSA6B3LkKCD2v25NNOiZ6CUY39epMnobBE+pIUVf
	 +AIZT4muV9jKFmCQChuNf9qr2SReOSOJQSQO5miIyXtR2qs36FEO+EBALWqxYDPm+iQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792633530;
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
	bh=A3WDxRIEC3de2IAAm+BSfBUnB4601QbHAyjwGi+n4LM=;
	b=gwP2k5oHXt40isFXZXgA4z3UYcAZR+hTY1HEcvX5Kutl377OHp1kbh/nWHXhGsSEvcw+
	 4RRQm58tsenSbvAEOxX2BJG1KYjoofeIHGRQda9u/xovcPyOymzuzAVRgw/s93oDZr4JX
	 5ykhlh7deFbABYk3CZ6K3PvX0AVONT1UXwXLqrT+/WLAqhRzUAGXUM41P8oGvEsg2GzXT
	 2IswG+jeANHOY6x5uXVojS0FMTLyXoX8D+jN8i2QEbxCX/yVP/EXOqOX+sMCAK8KQKeji
	 J2/+65j1Hn94B5g5pfxRMbQkwfGMr66jd0NtFbOqe9eLtTC0zl4jxVm8UNDCdL9r/Zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=o9KSIIJT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.56
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013056.outbound.protection.outlook.com [40.107.162.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9B9606A323;
	Thu, 22 Oct 2026 01:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D9B9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=o9KSIIJT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFcLSa5Im6sdmUNinycFwEU0c1XHtFz6baNz7Xm3XI62rWYgl6Dm6Xk5C/i4hHQ50Bo6NGrNg/lpXKXYCme3p3uPDrTRCAiR8q7Ozw6yZFPyli1hku2fUUi2/u4QrF5e71eHzEExl52wdS/Q13Q0yfEI5Msppr/PPk7vEze6j9PYqPirQc+VBY3BVsZcWimHYpUlREv1KKSP5KZ3HST5rkoW92foMNPIZ3B25GlNHv5xkioyFSHORrOxCvY70+Qae6o5nj/G2AtjhA7UmNaCx+CKgTIfHTy0vVFMfclSlJUWeFAVf5KKc5arN/9GD5mScHmYRBwOMKzOE75Tm9HuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3WDxRIEC3de2IAAm+BSfBUnB4601QbHAyjwGi+n4LM=;
 b=atBWHHe2jrRwgAgL3BblkMIa6NQ3/s6ZPzMPv3T5p31OWYyF2Z93dhqhu7FqziVEUOvxheE9rM0soQ8oA5C3mt143DEt4dO+CByCzCNMxEmmt8Ze7hHUErTqhCkFPKwv/KPiNBzIL6sJMQDd2oKa6Y9jmIgiVrRiU2oa7RA/655R7+DhwW2gTeI3+27WZZ6rw608qffq1xfdhycEbDDCuVsEZvySvahPBpKZrw0IdQt6GI4M/Yny4zk5/m02rbWJ0RsqkpeBB9UaCcJoyFqwObPAQEEkz6Pv1suxj348fmdX9hfEklP3rRKdbdAq57iuce9G9XwxrWyefRLKm8Z8KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3WDxRIEC3de2IAAm+BSfBUnB4601QbHAyjwGi+n4LM=;
 b=o9KSIIJTdeZfGGH20HmIDeJDPLQ0QXwDtv+vQ1lvYI0dj4E1b/B20JFQsbrYPOmVeXw+QYpviDdTHiItfH1S41pKZp5NmsWVX9Egy5MFfqkob3cJVLdlJ0pQxnl4EadIw7ItrfpauSzb8x7j6xBt852PM6hyNJ4gQiAKAoZ5lFBgrRt7JHURwth3RFINZFtLjCu+QhOvRPGpyb4lTLpkED/VNc+8Rfmt+WZsG4C368lkdDbbom3eAbjclPHgplK3U8e/uzOCtEbaxsm35dNvs6CYjTgfWuUBSCJoULLn+Plehvm66ETebiLQbLCgy4MZtsshydJdxAPUIcfed4wCLA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MI7PR04MB114164.eurprd04.prod.outlook.com (2603:10a6:290:10f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 01:45:27 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 01:45:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 22 Oct 2026 09:50:01 +0800
Subject: [PATCH 1/2] arm64: dts: imx8qm-mek: Re-enable A72 cluster after
 ERR050104 workaround
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-8qm-v1-1-2a597cb3debd@nxp.com>
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
X-ClientProxiedBy: SI3PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: ac11c254-8d01-4921-5fc5-08df2fde25f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|23010399003|7416014|10067099003|22082099003|18002099003|261021123027099003|11063799006|261009223027099003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	bWbAsFaIC1al8EpLOQ4I7Qrqp6ugXB82O8VRGQuqhgad6DIi+q69tmnkYioAg9s4k8zlDdDkRREBC+dL0CpW37TDlRY1DuRcbs+5dohsJp3orm9DnVOzZtJLn/kqXPli0IkOTG6Cd/YTIZiEgNv/8Lgl32tPLUSaX71CfCgaeWS/q14ilqn3Qf6woR4CfjxFeYEI/ZxpG05+bv6gO9sRG039Pt6Deo7gaNGEVcyi176u7Lx0XI9vJsgkdDuTT/Uc/K5q9WOPdVAUzgDxfQsXUpWHwzT1G/x+vCKwnsg10wlHFhNXDiitae+GsJz6cyevpPQdi9pm8ustnb98nuYi2Yv457IGraWi5c7c4UJXhjkEaejNkIzXJ5657iFL1c/TNAG5ySPQuPeLTW1aiHfNGSIf9j7aAWFMIfBzCdbzveCvUkop7SM8G8ZONjx4pK1GpnEVqkGZRvmpwzJ61jDUYTzmqXM9X4QIL4DfYymNjYUL5Sr4cobSAJFNEZPtQILQUOFo1jRNJBec5kQ5Cl0JD9EZXLQYm8bUcGeF4vC4NQQE/LZiE6Bkj50YdEbiZRCT72fAW2iMgdO/xhqF3Vsi89ew+wKwaC9AShjUz6iEt7tbgT7xIDJyt33UaxpQcc4nJGcegCWGlj918rNmC7u/AEaR+Ua2FIEeUkSJVNaoNMg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(23010399003)(7416014)(10067099003)(22082099003)(18002099003)(261021123027099003)(11063799006)(261009223027099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3VYRDZkYkFxQk9PMXFXcmlwekwyMlppV0VpOWhhYjFHdEdzckdtNlBETFQy?=
 =?utf-8?B?YmJQeTlTckZYcFV1ZlJ2MHp4VU1kT2pFY202REhRNmFpNXVLMmpLa2h1dFh5?=
 =?utf-8?B?bzcvZEs2Y3pSRFpzMEV4WFlxRjcwSnpPYU1reXA1WldUZ0ZCcXc2dm5aSjlk?=
 =?utf-8?B?RC95ZGMwS1VERDMvZ3liU2NsakVmcTlJcFhQcE9KV0Jzd25oa3hpZ1dXTGlS?=
 =?utf-8?B?SDBwK3FKeFZmMStEN1BkcTFpRmpEOEZ5ZFVrbXUyOXVhQVBBd3ZQbEtEaHdi?=
 =?utf-8?B?RHN5c1Y3aHhRdkR0dFZXV3JVNGFIcnJMQWVQZHgrcWpCc2VzOVB4ZmtrNHIr?=
 =?utf-8?B?NFlCMGlQeVNrVEdaL0dtenZtRmM1bUFRc2k3eWVYVURnVEp5WXAyRW5PYmI4?=
 =?utf-8?B?YVhYRmkyZThqdE1YellzWXcvOU1MaS9DMnhXNFpFYzU1bjRyQmZSQ29RMUpz?=
 =?utf-8?B?T2FxT3Bxd0RndUl6TVg5OHBNbkJhMVJjdlI5N2FqaGpmZ0xTVVJFckJEd296?=
 =?utf-8?B?aS9UYUkySlFJSWFDVkhJa0VJVm5LRGprMmpvOUNBUWxpNVZ4UzIxSGtObC9h?=
 =?utf-8?B?ZTI0M2wxb2lkL216ZHk5VVhxR2xrOFE4Yjl0MFF1aDZPUUZObGthNDg5SXJE?=
 =?utf-8?B?em16dy9HTDNtSHIzR3U4WVkxcytCRzBqdjlET3VBM2ZGcFlMWm4yYmJLa1ZR?=
 =?utf-8?B?WENaOVF5ODFHWENCK2NiZHBqbjl4RHdPQTU4dGhXTGJSWjdWcGM3SzQ3NXJG?=
 =?utf-8?B?eFhTOElXUktmbkdKQUN3cEU4SmRsL09sQWNaNzlXdEtjWlpSUVhmc25pdC9J?=
 =?utf-8?B?aG05bU11cVFja2xWejFuc2JPRXdTb2dmRlROc0tqNGpKbHgyNllUOU1XTWNq?=
 =?utf-8?B?QldVcW1hS24yVXdQQnNLY1JXTWJDUVNCZHpHZ1dqU2xJUUlKK3lqSUZnaWpt?=
 =?utf-8?B?WFE4U2REYWFRY3hUOFMzY210THRZOUh6UFUyWVZ1S0JURW5YV2xtU3NoQVBO?=
 =?utf-8?B?Y21wdEVxRzhINkI1ZjRGM1M4TXlKYStHRDBkcVdUNHBqVXBEbmc5SWNTSDF0?=
 =?utf-8?B?d0lMQjQzSmdBRk00QXI5a0tpTXNsUFo3d1hWSXNqUHhJTnNvMjVIZjdWSkJL?=
 =?utf-8?B?RkczVDhyR2NoL1J5WUd3WTROeFRHWTh6ZTJ0YlphbUtTQStIMUpwcjdZcjFp?=
 =?utf-8?B?cHBTL0JGNEtkbTZZbVhOdFdZRUlOOE5oNjFZR1VLSDJmY3M1WHNhTU9SSlJZ?=
 =?utf-8?B?ZVBRcDZhWUd5ZmpEYkZmZEdqTWw1SytBNXo5VmtNUkVWamJya3VQdUZIaXl3?=
 =?utf-8?B?eHAraGp1OThrWmtLVk83aFNFeE5mV2JlVDZCbk8zQ05pTE5PV1kvdHRWbXVH?=
 =?utf-8?B?aXhoeFFBSTYrZ1p1aUVMcXF1ZnFjMkJZazduRUFTdFUrTXMyRVl0V1MwV0xi?=
 =?utf-8?B?bVlvTE9MOVNoRDlqR2xuVGoxT0Y5ZHB2N1dVbWNIeWVwQVl3bHBWNHJDTXRH?=
 =?utf-8?B?bzA4ZjcwSDB6UHNFUU1MVmhUbjQ1MTN4V3F4T21jMTBQYlB4MXRyYTFsMWVu?=
 =?utf-8?B?elBPZDFHRUlRS3F3YXVNSW5rdkxYRmxaYVV3NjhBM3c0OGNYL1lsdzdhS2tm?=
 =?utf-8?B?azRMdUJpV3ZHakw1ZVIrTHZ1TG9mbUFvakdvanMrV3d3TDArQTAzaUxOM2hT?=
 =?utf-8?B?RnVveExLams0NUMrR0VoTDVWNUI2RVY4TWk3d3RORnBHWmlYU0lyT1VrSFJ1?=
 =?utf-8?B?SXp6Y0VnU0lYOVgwb2VmV0NZbW43aEEwdHQwaXdGV2FtZ0kydXpsWVdyU1VC?=
 =?utf-8?B?TVdGNm5xTm1VaUFSdnBMOEE0UG5pNmE2bHI2eVpLbDZibUhOdVRQMGZxaDE1?=
 =?utf-8?B?QjBicmk2R2U0Zlp0L29OK3RaYjRRU1JpeHVQbE1RendyYS9HWUJjRFZ6VCs0?=
 =?utf-8?B?ZzNhbGtGY1Q5TUsxTEtyRDV0YytPR09QUUNUZGdLNDJoT3NTMmp1Q3J3d3FS?=
 =?utf-8?B?ei9xRkdtU3hxam05cUxaK0ZoUW4yYzJkWkJBNUkxT0lwUXpUaEhYNEh3a1g2?=
 =?utf-8?B?SDA4MHRNRERtVURibEE3aElReXhaenB2WHBsUUc5YUdLTkkzSGVGdVhwYU9l?=
 =?utf-8?B?VFNZNG5vQkNNbVNmaXVmSmFrbGtNaXdZOTZJakxQeHhRY3RTazVialpRYytL?=
 =?utf-8?B?NmtCM0xaMW1QRnorWW15ZkF6SlU2dUZGU3BRUHVqaVFQcDdOSlErelVONFJu?=
 =?utf-8?B?T0tBNVh1V0pTVWczR3ZQZnA4TllWdi9TWmh5VWdFWU00aE1jVzdKR0RGeVJF?=
 =?utf-8?B?VGtVbnc0TVZaUUNEa3NoSU1IdE5qMTUra3BIYzk3QzJQaE5XV0RjbmVYT3pj?=
 =?utf-8?Q?RXN/YEaZiXe909wMQRtr1VWieD/0sTv9q76cP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac11c254-8d01-4921-5fc5-08df2fde25f0
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 01:45:27.6941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H17a6syg9yhvxF0vkjMRh0j1Na4Qq3qElLG7mamZmNNL+Yme3Ttezm2oseEsUNPG2ryXBeTcjEnvy5NsTJUuxcjZ0eTkRQJOTVw9CXNDHatclsRDoXsup6cFVEWoj2fL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB114164

From: Peng Fan <peng.fan@nxp.com>

The ERR050104 cache coherency workaround for i.MX8QM/8QP has been
merged upstream (d44e08dab27d). The workaround addresses the incorrect
wiring of upper address bits in the A53 subsystem that corrupts TLBI and
IC maintenance operations between A53 and A72 clusters.

Previously the A72 CPUs (cpu@100, cpu@101), the cpu-map, and the
cpu1-thermal zone were removed from the MEK board DT to avoid incorrect
cross-cluster coherency maintenance. With the software workaround in place,
restore all deleted nodes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 9e49ac377162b..af212fa194cf7 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -17,16 +17,6 @@ chosen {
 		stdout-path = &lpuart0;
 	};
 
-	cpus {
-		/delete-node/ cpu-map;
-		/delete-node/ cpu@100;
-		/delete-node/ cpu@101;
-	};
-
-	thermal-zones {
-		/delete-node/ cpu1-thermal;
-	};
-
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x00000000 0x80000000 0 0x40000000>;

-- 
2.34.1

