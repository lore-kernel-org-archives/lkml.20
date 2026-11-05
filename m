Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793909445;
	b=Z5OWJk16+f0tNc5vPmuCc5gHRzdYR1Il4yiR1YbbRPJJ+haVpcMVxfi1V3obuxK7agnJ
	 R4H0xNkltdNnFLuYevTlcYbMEwEWNtY1vqE3hhaX68SE4cdLi/erOzREfnimmkYEQ7DmS
	 B0WXCh8Pg1HiV0v4X0yN/DqAtZsuAd+Liv0/qBbdPFTTsAcCnhjhB+P7JQOToOEQwIDPh
	 1R7PUbwdOOiidWZgg0w83cG1bATIeLdGj5Df78zCyB4oIBf2x3pq6pRSrshqVbwjfqFG6
	 0LZRpV5PgFkkKTA4zCiPeaCcbBlxpbRKHYLa4oe7ihlKtDkT9Ux6OMMOGUSHPXXjRaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909445;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=WGA0hw5MEFWlovqQB0+2ufb8dch4lzXQdzsSegL88hM=;
	b=LjNjzOC+SAgVES7U1aEZptW4JN1bJf9eaZw/MBlFFFubLkBYOioIyLW6tx3wnMdpUL9b
	 ejikaHo1Om6Gu475yOhjdFMqrs3AEBl71VbwzanQ2T7PlWRbbz++GQfFwdwkZ3l06EFvq
	 RGMOWahhZzehHsWgePsrO9jcIMGmmV0GUi1qmYCqAO2y11mSH+uzREm6N7/nPT6KMgCHl
	 IA8/iR7jlRqaUKmkJZi9HJ8OIfUOaDxUHZPIEO5WhVxZbfe/dWVEf4Z0wFVLnADRYoRq4
	 ZviU14CVm2oiSaQFXpAQgwIf8JxUR2JWNjC3DO1vTocfG3YSpqiQ4wPoIZlyNaaCe9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fDQYx2CO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.64
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1F7606A334;
	Thu,  5 Nov 2026 20:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE1F7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fDQYx2CO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kkc6BbPObVX9+CZ8T76pNmbbce5VqukjfJVLj6H3fOQ2oGPw1SVRISTk0q1p28DbmM8CaQ0upnDAcGwoV+C5uutSabQHOhVRx8aZWGAugp9KKXqr13C28wZXRNJuQbvgKFtxVYtahUYmcGuzbp31QcCCOe8h+1jMRZOStmdt8ulmFdSOoMgBMy0G0SY5GiBZePndiMfwF/eq7vghlPvnJmcqGfJRTtM8HMM2D6d4zga4VnbYqouc4W6onaVv9AjHcpcZclJk6v3XurE/JXwABGUoYRUPMaQROBkmXzqrHdotKFkuYIuMxHp3hXjLvAzZKuVjKp3kr3tZhjb0/cigOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGA0hw5MEFWlovqQB0+2ufb8dch4lzXQdzsSegL88hM=;
 b=MY+PxzFTFRMAeetMrK4S7FIzJ+c05FqhzQN1f7fWRFpWHD/HVte7oJHpVS7lBXwf9/kY+Ipd9xdNoOSXYQSO5ehxAGtx+VEU2zlJFwWAKLXfUt1am0XLPRKMnph+92NnyCOvDsKidJPr6FgCcn0YKTnfnl/p27NZgKO0eQ1Ies8dM0z6/g5ib1zjem3ssZvC9cmGzPGEGWt3U2/WvK09i/d95rKToccvbOARXwMER5MG13YGr6uTmb2u0LJw6qK8UC7VBDQFobPcRpdhyAME2QrKCWE0bVDG8LBObsP5Jg9nB//dozwX/rdvtQaXxqWhsRnYR1IhweaUliDqmhjodg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGA0hw5MEFWlovqQB0+2ufb8dch4lzXQdzsSegL88hM=;
 b=fDQYx2COt4L3gYxVqSs1XoMpne3tW8Y4W25tA3qWxql5YpoeuZFEF66rhTPPB/xd2VQkwJJQXY+2ReICkO3cMAmeczqHBaRqID6/9arB/H6RQKjvNNG9Yx2Bf/dudPjjNMLNklcJwueb0ERmo/cdWNjRP7WXuHacUAKyzW/n8d/PymBj10czA9iQVka4E+g4qG6uUOxTlMqnNd8ZZbPHHl7sDYfroCRqvoFfG8BCt7OSoy1kOe+Qfc/cVpdwrRejHlhwBh16+n0rd7y/oeSlo7lyh0HaAa0E7H9pBzG6oHFsYG3Jsdx/JVZtbVcW9zJ0Phx/V6dVhgUZ2IVSLnHEvA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by AM9PR04MB8763.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 20:10:42 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 20:10:42 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/13] ARM: dts: imx: cleanup some CHECK_DTBS warnings
Date: Thu,  5 Nov 2026 15:10:33 -0500
Message-ID: <179390941004.1697539.3517538199289414599.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
References: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::29) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|AM9PR04MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: 994b1dc8-6162-4d93-2a15-08df3b78dddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|19092799006|366016|56012099006|11063799006|261009223027099003|261026121527099003|261022075727099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	V92deGp9L42pGgj4QXmqZxWtQcQVTANR5YXMUCqg64rw/qBitxvgfoOCPUcrUSuh/9pfddhzUJdB4tjNVBQXfA69G9bti26RKHRUjPjuaRhAA8Q2wO7OIl/G1vsVVqQlxr6gG28hrhPPEawAnqfsZ+AXKtCA0aT9X7wp0NmiH09izrxw1Ea0iZqlNNH6Ch7oTeTBYDGYocOeG+1dC260piCE8qDPtEzoPVILOKLJYuPawxrNkuEBHZNW0d7f4hvfZH4zhW/Dngy30CH+9PgvlmDo2TvdPHyZwAeilOU5NDfcEJLtaLlrZb8GZZqll9KUPk6Fc9yeYpdbQL1kGVGE8ZcOoRcmFVexGxTPXWYxuuxVnGcIh79xyl4bBEAN3qPwjuCpsVcMPB7iLRvsZGWjdKNjMY7uJq6W83yOZhhpmm6CpVWoa22J30jC7btAkEyKt4OUihLqwq5WAJQm2Q/1wZ48/dfyJ5eYYvPwQsLvEHmiFqj0rJ3ONk1YKUvfVQ3pFBKD6J5Vm9yZf3eiG46HZJ11MRa9Oip7H4SfVT4FUN6mWexnDte2Mpqnqa4n80mDPeGvEY39OuvBezl1GBcfb6Swbx66fDRfKKLcxqfMl5yK61enUUdl8AYXbtoY3BiEYQfIVnY+isRkOeIwzIhomB76boNIWHzPDKMYERsr7gk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(19092799006)(366016)(56012099006)(11063799006)(261009223027099003)(261026121527099003)(261022075727099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkpNU3pNbWFVTHg3cWZLWjBhUlppMGFGSUl1Sm5PTDExNE45ZnVOQkNRYXh5?=
 =?utf-8?B?WG5xWks2UlJRVXVnQU1CajNmSWJRYlRvVEpHS0xYL2RQdmNjVllFam1VYy9Q?=
 =?utf-8?B?ZFptcDBTdnd4VFluS0Z0Y3VPTU1OSGRKZEZxNjlRS0pvR29LTUZmYURKUEZj?=
 =?utf-8?B?U1Ruc1U4a2RLMUxxdnBVdHpzWUhKam9Oc3ZWRlFQdHk3UTZDTTRjZmkwaWhX?=
 =?utf-8?B?MTVvWi9sbzhzek5meWJnVTd6Q0RPdDZOWElmSyt3cjM0N3piNmRNWnEyZlo0?=
 =?utf-8?B?UXBYdXQwRnZOWnQ1aEJzOXlSN2dqakcwSkdqVmVqaWpVVkdlVk5nOHgwcGNa?=
 =?utf-8?B?T3NoODdpQ2lwRGc5a0NaWGsvZG40dWd5by9rMGhpSkRneTQ1bVdkUVFVcGxa?=
 =?utf-8?B?OGtDRG12Y2JGWkxXdi8rTGFsUFBaWllFWDRzY1dHZ0p5OTdZRVI1dEJGTEZM?=
 =?utf-8?B?UVpYM3c0c0ZOclc0MVV5dXdHRzhlMlBaTGlUR2xtdDU2UGNlT21kVXdpNE44?=
 =?utf-8?B?UVM5a3lTdE9RZ3BqeW4xV1BlaDdLUUpNTFF4dXBuY0QwZXZMU1M4N3RuRjk3?=
 =?utf-8?B?TkV4R0VaUHRTUGFOL2QzSkRZWXFLSnJEU1FYNnBTMXE5RUdmZ3VxWnlRZ0xX?=
 =?utf-8?B?UnVUU0hVWkhWbnRKZjdZQWFTZVlFWlR4UDN2emhZejdqNTFtRGtjMTdTYUZE?=
 =?utf-8?B?MnpQVXdJTDl2RDJ0TGl3RkxPWDdPR3lKRlljK3dxY3RoYllkVE94L3R0TTV3?=
 =?utf-8?B?RGZhUVpIUFVhd09WQ1dhQlU2S3hFSGxOUlFQVncxZlB0c05odDRhY3R1NDVH?=
 =?utf-8?B?dUZqZElDWnFOL3E3Q1NEWitqMDFoWGVQM1hDK3Z2QVRiQmI0NEdUYW1qT1hi?=
 =?utf-8?B?SXh6Rm1Zb21nZE9mVHhpeFlUN04wa3JoN2Y2MmI3c1pEcnhaSDFnVjlTR2Rj?=
 =?utf-8?B?blp3TlRQS2I4Z0NaQUVZbDBWRm0zYkJjSEtJc3J1RGpvQUJkZzE2WE50MFZ1?=
 =?utf-8?B?ZS9HWnBueE9SZVovR0NKVEJ0eVZhYzlKdFZzalN1NjNDYld1SVVnK0FUVExC?=
 =?utf-8?B?UGVNZFF1c1hESjRLdHEwd1pHMVM3empUOVhsYTIxMnRQaWlOWkhSV1JveXUv?=
 =?utf-8?B?UUtoTWVqVVpUQVpmTG1nM0RxUWFudmRINW1xYXJiWS8renhMMGk2cjZ6emh2?=
 =?utf-8?B?YmI2WnhrMmVYRUp0TlBZL0h6MVVnSkE2SzY4aVF0YllIVEFicXR3a0ZENDBi?=
 =?utf-8?B?MWJDWHhoMGtDd2JYcTQ4VHB4NXRNblErRURTQk1pSmR1VzdSeGxmQ1pvVUNL?=
 =?utf-8?B?eGVDeXNUb2hqaWpYV1JJeGFWRlB6ZkJVaFVDTEZYSVE1WVpOSDNKNlZ3TDJE?=
 =?utf-8?B?Y1RMU01GSVg4NXZ2Y2xCNVNwR3FNUUN1NmxTNUtEWTNkNFhaSFJ2RzBDWTNN?=
 =?utf-8?B?bzFhVHE2NUUvOUxhM2FOVERWdGt1K24vclJhMVdxUjkweUszMDJrY1ZQVi8y?=
 =?utf-8?B?Z0hOYlhDdC9TWmpiaytuK3FUeStiQmhPMER6TE9JWTZwMEhya1A4enpyYVdx?=
 =?utf-8?B?M1ZTaEZXNTBNUWwxQm43aGQ3SjZWVGo4VlEvOVZIOCsrMnN3RVQ5SlRuRTJZ?=
 =?utf-8?B?VWFNSkxPTnMyVFhad0hGbnJtQ2t6b1F6YmlycWVCQit5TU1zZXkxV3FCcVh2?=
 =?utf-8?B?Y0ZURnphRUhkUnBxQzV1Q2dveWJubVRFWEx2VnZsNnJwS3BFMjUyMldtWTNn?=
 =?utf-8?B?RG1kV1JkZ2I3a3hQek4vWnJNWDArdzUvci9uU0U4dG1ta05UQktMRk10M1h3?=
 =?utf-8?B?OC83Q21Lc2ZmZ2syV1BxVVZ4TWJsN09CWi9GOGxGK2wvVFhnekhDcjMyS3RB?=
 =?utf-8?B?MmJlWVBBQmlUV3preC9TdDhxRFpCZ0l2UDJGTlRUTEdObDNmZm42ME9HM21p?=
 =?utf-8?B?ZWwzc3crbTZkZGR5dnBlR0wwdWwwUDlSYjYvZjBVNFYyK1Z1SzIzL0ZKRTJk?=
 =?utf-8?B?a2xVWVZQYkdtUVBlaDFQVzNNdXo2T0JSaWFlSHY1eTQyNFluR2JLQ2Qrd05F?=
 =?utf-8?B?YU1YYmg1d2N6a0ZoeHlvSnhaZUIrclRSbC9GMWdBcFpESzcyUEFoRHVCeHNW?=
 =?utf-8?B?UkNzQmdsZEVEbWc1bGFLbm8vVlBlU3BHdEtESU9DZXZURWlxSDZQS0JqaWpZ?=
 =?utf-8?B?ZFRlODMwN1lEWm1NSm5FWTlObmt2ekoyaXhma3pPbTZkcmxDUGVtemNlOUw1?=
 =?utf-8?B?Y1ZpUW9UdmJtQjI2Wk5TRU1hOU9QcmhmNGVzV0xIem91Um40YkJLODhQQXJE?=
 =?utf-8?B?bTdRc200dk9MeDRYVTBJT0FRejRsS0lUK1ZKcFBRRkVGUHhIVTk4c2dSakwz?=
 =?utf-8?Q?52rAU2jhSNSvPadY0Wl5mWIdkc35XMt3KBlec?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994b1dc8-6162-4d93-2a15-08df3b78dddd
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 20:10:42.0822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2atFegLc7Q0RXk4DXKcCMvIR6RoJ3/j8fJ6NwTTqP+otJMmlAO1XY6uo8fuWWDhNCXv4AN/fxkrX2iOomt5AedizLqLVJ04QzlFQHVhQ/M+5dfTGJLXRjJbhGYnD1T7+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8763

From: Frank Li <Frank.Li@nxp.com>


On Mon, 19 Oct 2026 14:26:15 -0400, Frank.Li@oss.nxp.com wrote:
> cleanup more CHECK_DTBS warnings.
> less than 90 line warns left, from 267 line.

Applied, thanks!

[01/13] ARM: dts: imx6q-dms-ba16: remove undocumented property fsl,receive-dpll-mode
        commit: 41862ecb7fa5ae640a6fe92ede8af34240b48a2d
[02/13] ARM: dts: imx50-amazon-yoshi: remove undocument property min-frequency
        commit: 25ca9d9319f8015b9b2dd8b29566e59cd0150435
[03/13] ARM: dts: imx6dl-b155v2: add touchscreen size properties
        commit: 837cf5110b272799fe55a282f6281a70621eef16
[04/13] ARM: dts: imx6q-gw5400-a: fix SPI NOR flash vendor prefix
        commit: 2821dabbaa483be4665834d170a4c38bbe881eee
[05/13] ARM: dts: imx6dl-prtmvt: remove redundant panel compatible fallback
        commit: 8e58551804d5ceac9fb8a414b69740529df0fdf9
[06/13] ARM: dts: imx53-smd: change compatible string to dlg,da9053-aa
        commit: 46b3bb4a6b2a6d431e1beac9743d52b42b413cf9
[07/13] ARM: dts: imx6qdl-savageboard: remove undocument avic,tm097tdh02
        commit: 6ff97f0b9625a08b6b522d8625a5a5db0eff11df
[08/13] ARM: dts: imx6ul-tx6ul: remove front compatible string karo,imx6ul-tx6ul-sgtl5000
        commit: 9efa8bbaf817382b29c42c95a2d4c1187bf261f8
[09/13] ARM: dts: imx6qdl-tx6-mb7: remove redundant pixelclk-active for simple panel
        commit: 65da26fbc79b0498ce7bf5ca9fc1fe00fdc53864
[10/13] ARM: dts: imx6q-h100: rename port to port@0 for mipi_csi
        commit: b2b4068cceb31a2a93fc5c1cc5fc24cb4a859e12
[11/13] ARM: dts: imx6qdl-sabrelite: fix typo vync-active
        commit: f14b604536ae82a2a5543765a437313cc7eaf190
[12/13] ARM: dts: imx6q-novena: use interrupts replace irq-gpio
        commit: 27a89535f51ec1b39b4cb65e50b4567fdf0f2249
[13/13] ARM: dts: imx6sx-sdb-mqs: remove pinctrl-0 and pinctrl-names
        commit: eb5579bd8186c9921b570344e704609cf5f40a84

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
