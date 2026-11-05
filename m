Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793878546;
	b=dOFkr5aZA2xX6835bSGjcFP/dYDOlvYp/PSLGZ9Wuz1zzjydTvcYqEsafpU4uL8ZiPTp
	 AkVq7HsMkT+Z2aIX5/nVjrH6q+oN86cX8xPKp3VSDcgXWi/VYkSUhzYUExCd5y3oayixG
	 LGk0tfuwB5VnC0sArJkwfdHyauDa8JqP8z2Du9fVUBP7tDgnWt62keH+/MX9TJ19wnhKI
	 v4X3vNkzJmuOhkBXT1ARcC2nc5ubZl+sMq0WtzLxiyRjMJNpP7QSB3uzuMWSqnokw8Pc6
	 fdp6/QFeCLDg66Q9XCCG43ebcZpol5YULCRjEkrmKtj38mFpPdPRxZTspRqXGuuYxCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878546;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZLzBJcISiP21UfMeXdK1hMsApKpJClH4KU4K/FtdLo8=;
	b=S06RmT9navmbaOJffm38+lsGB4pY33NqORuaV5ngVQbIaYFUQ+DuTFeWk2P7Dc1ZLclC
	 z1lzOLg6k0hGcIoDpAjbeJrEASHcFdpNEhngjqAfuTrmLgHtBXJlwq3KjLommmJLmxCM6
	 /FSp+da/wG0CyfnqBUPjoCKAkPLp1+uUcIvMJxBwxPAFNuellzjovugyTtkXjgzOlw8qV
	 Efz8iXNBWy7W7LYckNveVt9qNM0AHUHuaQNxuppP4JbSk2O9SLdBDmX7PtSs8KkS+Pgll
	 feE3Alx/Bkhb3LAZJKGv7akLJhk9in1RyaoqY/rKxjheje1nyIc0+F2i9cRVSlb5jPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=TV1mYgsC;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=EXe5lgYF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F162606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F162606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=TV1mYgsC;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=EXe5lgYF
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59vko9512748;
	Thu, 5 Nov 2026 06:35:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=ZLzBJcISiP21UfMeXdK1hMsApKpJClH4KU4K/FtdLo8=; b=TV1mYgs
	Cfkj3cdjdiF6PR1xEaIK3OVRgKqBCOfLOz3vSFJq2Vyt5EBGexV5flIBAxEVEV3N
	n+YKXRo8PFvwhNjepqg8eypuIAvR43Lc3/UEnF+QdT/iXOlIU6/yMIGgMC0nkFQL
	yzrDgerA6wewzolfFurDAa9u6sLjxi6s/5maOeTR3s49u0hsIz1czb+7nF/bttWP
	xA5f2B94DwnitXS9V/mIdGyLy2ARll/O50MsCW6vw3F+Y3GpNKPHcRqTF6/hX8kL
	Tvf5kDo/BoRKrba/zMfQEVbdhuDE1a3BNY+M9wHboE22Jogv7jZ3hM46Qe0OdG5L
	JJWukr5oDq8CWdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ZLzBJ
	cISiP21UfMeXdK1hMsApKpJClH4KU4K/FtdLo8=; b=EXe5lgYFCY1YE/3j0s7cL
	gIG14UGpF1nVv3urao1OTb96li3vKkkcy7rwRROWnKJko3CagL1MuNe4LEoVPPXW
	YBP9xqFPjevlQLLxHGobglGWjCAOjKQjt2awSb44vk6ehucjvDMVAi0V+kWu6SPX
	FERiRzUppAz2N4XnicJpOLb5v7imld++N+rpsAdGIv0ZPe9PkJsZU/HEdqv1tilD
	cdbO4o0z7s12ekRSK6fHqhOFgbaa1routgWznyVks5hGfLlr9dDHQ1Gh7RLvWoJO
	YtkLa+XsmJa7sq3RWaoi1ZPwnug3R7pUimEruqvv6xEqN3IODsmr5G9XX4LmSXeO
	w==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010069.outbound.protection.outlook.com [52.101.85.69])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hr9xd53hk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 06:35:26 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KS+kzyxRvlEr/IHKcLZq56avGc6jTwGLnHnqsYEiNDq8jkBrLqoXIQLxEFlrEXtSSkzkQenNXbVRWsy1+qXcBgwu+BtjBkYYYUB2DY0aATobhkZJ4+oJ18EqyzxLQH1UCIurNAPz+SKt/OxWittWBchlLg9gpXttcpXmL/8nyLXFZMQQMO+066QgPM940sXzEha1NVa2xII/LomOKCcoLiqCjfvcOjRT2aPCANJ5h2o7cfUIIM3nmtqB6RCklkRRwPONZ8IBYYgDSeT2QNcYcqOogRqk+nQ3cxqiBeyneE5mCxiMf8y4Ebenvr/MSPuBAiVgXxL8DRMUcfHDGg52bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLzBJcISiP21UfMeXdK1hMsApKpJClH4KU4K/FtdLo8=;
 b=J3GFvZAZ8tmDd5Ph3Dnbok2ZmC+iLlzdrCohj5HeAPw5cpUbwn6x6YVWY93yTCidx1/MRfT0HEX7tA6xLdxh9wr2P+JKQULKe1iKPtQMscz6favgg6lWrKnsjCzuHZkGctXIO+9aAdOISM63EGSQqcD42DYLF3uG6f+1+szz9RbYl5r6So4kenVOeLvAh9hFnOSslaODounSEHfL1WohQkXdq1Gxi0j3Dl59+4uhsjNve1WE/bo+TumRtCs5dsY5HbFFc7AMl9/f7P7fyO2QCDO2fGHDWaqi/yzTFpGeSCfX8cZ/rVlQN4l6Gkp/1jWfPFSBuEwqpkkd6qUQkRzHUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by EAYPR03MB461033.namprd03.prod.outlook.com (2603:10b6:303:2ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 11:35:24 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 11:35:24 +0000
Date: Thu, 5 Nov 2026 11:36:41 +0000
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Takahiro.Kuwano@infineon.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH RESEND v3] mtd: spi-nor: micron-st: Add support for
 is25wx01g
Message-ID: <auxqLCJuZpSNYgRy@nsa>
References: <20261102-mtd-spi-nor-new-issi-chip-v3-1-f5e38e200fc8@analog.com>
 <0cbfb61d062b437b8e860a9c93b13e4d@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0cbfb61d062b437b8e860a9c93b13e4d@infineon.com>
X-ClientProxiedBy: MR1P264CA0161.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::9) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
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
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|EAYPR03MB461033:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f495e8-563a-4377-4e22-08df3b30e191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|22082099003|18002099003|6133799003|11063799006|4143699003|261021121427099003|261102123227099003|261009223027099003|56012099006|261022075727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	otA9EJQaCm/Uyq0njJBqw+2DVDp6quuA/4PYQ5kn8eRfTG5VOxs34ip56gr/G9jC+B+xVJrBUa6jj1AYtSqrCp9eDKaBfEWQCZzLPkZmARSuIPc0hP8QrhcVrs+VdvIRLrIJrT/kQqbVKmmxagAWkJbSMyhS88vG5IZZMqTa4xIKW9B3HLZOtR7zh0Tt28vfWC8EmeZ86k2zyCVgrw+3+pvFVBJgLlkYYhWwdwQnbR+L+r5rzy3bQ3BwHYAisLLmLoJEYeQbMs2njqK42DvaUGqwh6ec7qZizPm0vBoNEzFW/jmVXl2etpvBQBb7QaKpMOkUlvwe/Uy5qRAvoIVDUxHulCJbjyPZsi2PFk3L24lUVTJFIetT0n3DkpnHeTirIiEg4LA0xeyKYYa91+Df7cCyUL0HERL9c22WeWwaoaEx/rP4RVSDr8TIFFW/h2Y4dQJsDI1FaS/vilWpY9d/yEENQRrcB89uV2R0PW2VRBxw9iVFm8KW2ph3ZEuHp5/S3CE1/kaR+GHBkQRS6pLa1aVoNyMVNOcJeeQbPVUz0kb7psBNWLBiLXZSHjlcR/w1fRzTGx4N+BFzkqrs4Pb/Kifww5ihIASThJ2MXPeRBvM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(22082099003)(18002099003)(6133799003)(11063799006)(4143699003)(261021121427099003)(261102123227099003)(261009223027099003)(56012099006)(261022075727099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG9pWFo0d1U1TFZmQkpZbmg2NVg0anc1YVZBNDEwaEQ4SmZZR0wycjg0ajY0?=
 =?utf-8?B?MVk3cHBkL2hNWFRDMTBydkJmbDkrU3hyOFZGeVRQVm1OOFQ5bWh0cDAxeHJP?=
 =?utf-8?B?cHlDYXJXTmF6RlNETFVYc0FqUXB0TGJGS3dJYzk4ZzhpN0Juek1Qd1I4aFN3?=
 =?utf-8?B?aE16V0Jpayt1UjgvSk1VK250Y0lRSnRjZDBWVTh1YjkzWmhQSFdZRUFIVk9h?=
 =?utf-8?B?U2tyTnVRM1lRZzYybVlNZmxCaUlhWWVka213bk5YTnAxYWE0RDI5V3BDdmNL?=
 =?utf-8?B?VEg0WWYwS203ZENMcWdiTlR1amw3RTlnaHRlZWVJUlFFTTZHekxQNHo0U0xm?=
 =?utf-8?B?R1d5eWxBaStkODJ4ekRBYjdUK0xXQUxvMStBYUtOWUVWN3FMTFYyOE9qWkNo?=
 =?utf-8?B?RHlxWHN1M3dhN2YvWTZCUERBc0tFVDg1WmNoK09zSEszemExaG1sMWxjRGhw?=
 =?utf-8?B?L2l1R055SUw0YmYwRjhRRldTYU8yT2ZHcjFDMTAvZkJ0YU5ITGwxb21MMEZO?=
 =?utf-8?B?YTl4MWVJTmUzQWhJUjlDeVczSUNIeHFaQnppOHJFL1pHeUxsR2RpbmVaU0p5?=
 =?utf-8?B?Uks2TTJWeVl1R1NOYnkyVmt4OXZGZUx0aCs3aWRENjlKamNjSmdsemhEM0tw?=
 =?utf-8?B?TjFxakNkbEsrM2Z3UzA5bGs2WUowOXhXbFNuQnlrNHhIck1KcEFHQzQvN2tw?=
 =?utf-8?B?dGVSdHNwb01QMVZnM1FUZlNnWW1JRStyaG9tV3UzY0gzV1B0UklTay9oaWVL?=
 =?utf-8?B?S2NFdldJWmxNczI3TTNkYklZOUk1UndPYzh5OHBYYW44b0N5b0VLWEFFZkNF?=
 =?utf-8?B?d2NiMEpiMHFHV3VPU1pRbnBINE5TR0VyQVhhcERiaHNYY3ZJVGZXU0QwT0hs?=
 =?utf-8?B?T1dkTUlrMWNOcGZ0SW1TQ1c3YXV2Tm1wd1U4S1pHLzZwRVpOMVJRSng3VEli?=
 =?utf-8?B?NjhvWUZYaUhwSVFTdnBMcFNvNGhPUVhVbGZSVk5lVFNSS2ZkQXN4a3Y4aXF1?=
 =?utf-8?B?YzdCTjRvNUZjTXFac3IrU25XZjJlM0Exam9qRVEzWjFUeE9YM0t6T3U5Q0RT?=
 =?utf-8?B?NE42UGlqdVZsM3lGRHAwYThVOVdkbnUzc0VMYlFTSnlicytlRTJQTEt2d09U?=
 =?utf-8?B?Vy9FL1FhRUlnVGEwRzMvMUpjUmExMHUvOURocTlacjJVYmhwSmRoTDR6aFV2?=
 =?utf-8?B?S0c0NlVjeWlIZy9LQ1BUY0lGVWZqaVMrcGxvdEdnK1M1UjlqK0syZXRuazNy?=
 =?utf-8?B?dXRsREZwY0NLbmtKcDZpT1RRMnFVUTkzb1pYSEV3Nk45WjQ4WUZYdlFoWEZu?=
 =?utf-8?B?SUJjWnJRM0NWamtta1F1aTV0clhmWUZUY0NDcEN3eC9ZS2ZwVnZDUWRPdFl1?=
 =?utf-8?B?M2lvWTN3TzU2U1hMZjF2eTJzdkpjQUs5dlZGVEpzRkoxcngxUkJOYy9uVXpC?=
 =?utf-8?B?UjFoa2ZDQmhZTVNZYUpXN3o2TzIyTk8ydlBhdXRYN2VBQytleDU2bU11K1Bi?=
 =?utf-8?B?Mk5ObzFKS0RSMjFIZkJFU0JGWk9SWjBLYm5LMm95alpBb0VpUkkyc2QyUjhw?=
 =?utf-8?B?QTlQQ0VPcFRuWjZZWWloRURkSTdhNG96OW4vKzNiajBiZ0NYeVFoOFFVY0lQ?=
 =?utf-8?B?V05ISVpzOU1iTmpGSG4vYit5ZlBDUTFtSlVWUDNQdi95VHMyM2JVS3ZaKzF3?=
 =?utf-8?B?VER1cGVHZ3YxSnFyZVNJUjR3ZkhyN3dEQ1haKzh4Zi84T28xaTBiZEdsVDY3?=
 =?utf-8?B?YmhGcldwby9lT0hDUzhLT1Z1UzdSZTloeXJtOW1Kb3ZGWC90Rng0bVUyZW5L?=
 =?utf-8?B?UjdhTTFnWVBxUlkrV3RzNzRIUG5hRXF3bVZUVS9CYTlTa2cvNEpCWWFpT2Jm?=
 =?utf-8?B?c243clluWHBEZEo4R0IxZnVEb2xnc241bkE2SGhHV2NtZDRpcXIrcUJqanJN?=
 =?utf-8?B?cG0wN1V6eU9jK2QwKzFqZmJMYndHMlhqVUxwWEIvaFZSNGJTSituTlAzdWJD?=
 =?utf-8?B?MUtpVUg0QUJtMTFzS25FVnp6aG8xMTVtZ2FvSjc1NUpWTVZMRnhjbnFQVGhz?=
 =?utf-8?B?SjdFSCsvaXAraUFWWm9vN2FCcG02UEhzcmpBVHI3YmUzR1NsTVBaV25rOXJr?=
 =?utf-8?B?dHZZcGlyUFpmbEZkSFVKaW9XdmxOQ3JzRXJMUUdGM29qb3JGMmtXbE1iZ2Rx?=
 =?utf-8?B?U0JTUHZicUJNMFhieUFwRVh0WWphWndSYnd4d09sSVU3Y1A2ZHdGQlpQWkFn?=
 =?utf-8?B?MVMvL0RURUtWRXc0c0c0ZCt1SDRMTDgxTHZvUm9aUE1TTlJ4Y2tJYWRzbzZQ?=
 =?utf-8?B?ay9HSDdhc2R3T1NqMHZkOUpPdEw1bzhoUkNZNnZRV3g2WWM3cnFtUT09?=
X-Exchange-RoutingPolicyChecked:
	hQfYhy0XeBmwWUHPAuRiswbcz1o30/xe0Ell2T+V8tYzj+Iyy4VbPKdQMD/FwsOiLyzO7WAj2jBRpMV2E16nC7VFpcOgsQu6aQs970MK57qomwwupI25tzqhB9mEkbdOuvLxP4fkjsnQ79ScUwBXk8ZpqWmoEwlwdSRk3NEE9bNiFZawI4ggKqVuozXZ4+7t6V0BFhLtU6HyNMLMHj/GAp3JkAtgbIg6ZaGF2aMFnRSBQ+vQX9Nus1x8dt0++fp/n2Sy7idIaZpo+IT1O76hXFhRNgFFm0ve1bSWA7a5TisDZVqHQ7e0xjPlcSYmp8yoR9LAvpUITi/Zl8gD5mSZ1w==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f495e8-563a-4377-4e22-08df3b30e191
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:35:24.1047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KqLDbOY5fnnSWVI8z/f/SBF9GKhfqxnqLM8NKUCzVdy10q6UTv9N33RlQU2hkOfmvNrJJPZS0T7NS04nbt9hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR03MB461033
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NSBTYWx0ZWRfX2QxgpHkmWG8P
 kwdBlHMXB34qNK5mRTamx4X7u902LylhvyGWAslD/dGTTcqmiD1g1uUZDmCue17TtbNQtFszmRs
 LcMrpwwt/Z5UI/dJuOIqlgL63a9bfwUkpDddAaYMALwYVAZCzJC6
X-Proofpoint-GUID: TXY2qObVY2CeKmURxvG4tdD-0IQ5Aiuk
X-Proofpoint-ORIG-GUID: TXY2qObVY2CeKmURxvG4tdD-0IQ5Aiuk
X-Authority-Analysis: v=2.4 cv=JrVkP84C c=1 sm=1 tr=0 ts=6aec69fe cx=c_pps
 a=uhkaN0mRh0u8fl/99TXUBg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=VwQbUJbxAAAA:8 a=c92rfblmAAAA:8 a=gAnH3GRIAAAA:8 a=bUQKSiCPAAAA:8
 a=ApklxjPEy8_8nPV2SxgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22 a=-fHZXUhsFbuwFN3fwQAr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NSBTYWx0ZWRfX4+q4Yjf2LZO0
 syBMgmYpJrqRqHO5hQ+6Wnuut7ySqOzXsPhn3sQGnViRRa42E+lVzXCWKrZmUXbm5DaxZGIwmdg
 Wz/ne9KF1GbBJr32/pHr1G/jMcUVhmTrf8+HHj4UDi3++0gc3abXAXmwioO7TSzW5iwdlDuRpJF
 hPpvX5isilS0rQKc0yqNsEzNjafKr0PtKhl/HJRo6A4poQT6VS6qt2N2MyJl5oIYj1QhZcHEVW4
 n264sB3wgnPC3Qnz/zs9e9gI4LwaHs9kbOegyv5ST278qTlz+cJQcpfgiUefqzmYDkOLcI+0p6x
 YOKSRI8d5d4TOSClj9/vDNjoLRW8t8ifPCQr22DZPeKq5ryQcOQ98JfxOME+jyfre1f1OHKGKPM
 lOxafIw3g4oI2cezlnPdJmCacmIW5ry4byrCxuuZociTdta4AwSp7Er4a2etkZqEWqVdxd6oyA1
 X8Oy9S1afooVLjcaocw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050045

On Thu, Nov 05, 2026 at 04:44:01AM +0000, Takahiro.Kuwano@infineon.com wrote:
> Hi,
> 
> > Add support for the ISSI IS25WX01G, a 1 Gbit (128 MiB) octal NOR flash.
> > The part is fully described by SFDP, so only the flash ID and a small
> > post_bfpt fixup are needed.
> > 
> > WRITE STATUS REGISTER (01h) takes a single data byte and only affects
> > status register bits 7:2, so the default 16-bit Write Status assumption
> > does not hold. Clear write_sr1_and_sr2 so that the single byte write_sr1
> > path is taken; write_sr1 is already set to 01h by the BFPT parsing.
> > 
> > The flash also has no Status Register 2. Configuration registers are read
> > with B5h/85h and written with B1h/81h, and the 35h Read Configuration
> > Register command does not exist, so clear read_sr2 as well.
> > 
> > Software write protection is done through the block protect bits in the
> > status register: BP0-BP2 at bits 4:2, BP3 at bit 6 and a Top/Bottom bit at
> > bit 5, which is exactly what SPI_NOR_HAS_LOCK, SPI_NOR_4BIT_BP,
> > SPI_NOR_BP3_SR_BIT6 and SPI_NOR_HAS_TB describe, so set those flags to get
> > the generic locking support.
> > 
> > Note that given that the Flag Status Register (FSR) handling is the same
> > as in some micron devices, were're adding the issi chip directly on the
> > micron-st driver.
> > 
> > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> 
> Please add Link: tag as Michael mentioned in [1].
> 
> [...]
> 
> > @@ -655,6 +680,7 @@ static const struct spi_nor_fixups micron_st_nor_fixups = {
> > 
> >  static const struct spi_nor_fixup micron_fixups[] = {
> >         { .fixups = &micron_st_nor_fixups },
> > +       { .id = SNOR_ID(0x9d, 0x5b, 0x1b), .fixups = &is25wx01g_fixups },
> 
> Sashiko's comment [2] looks valid to me as this chip supports 8D-8D-8D.
> Could you please take a look?

Thanks for taking a look! Will double check, thanks!

- Nuno Sá

> 
> Thanks,
> Takahiro
> 
> [1] https://lore.kernel.org/linux-mtd/DLETRRVRUWEP.1VU1EHARD3MSH@kernel.org/
> [2] https://sashiko.dev/#/patchset/20261102-mtd-spi-nor-new-issi-chip-v3-1-f5e38e200fc8%40analog.com
> 
