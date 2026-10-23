Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792737911;
	b=kswZrSOos8FgnwKOxzU58RUf/NA7FfTYhbWZbyj+kwpH2Hw0dtGkT1iHRLKGGssTAHOu
	 FMyrhA87oCaflZql7BCRHvps13gzGXS29oaroRtY7Q4VXwqjbg9oMGVi8Sb/WX0hUaZxH
	 2/Q2iXjz8RTSxa69YDXe8xWPCa2Q/vfWQjk1bFl8P6613Cpsut7d2zyRslpA4DiWivIgJ
	 1X7NtIMdE8mLOrQabcce0KIFt0yog2zTDgBMwMLYGeNa1Gp976ERW6bBWIrAgeqBe2h02
	 Tufi6ZCEWRnYgYp/ju7BUd8mdWJVtSrLqGjLs0Fsg8cW50dOF2+FxmCUfD/ta469eAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737911;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=EpyxvZAjPVwwXIchrpB0SSg6OAVN7/8U4+TZT86XF8I=;
	b=u5pYUx/XauhW2E5UKKhP+JVY+mj4uq5bsg2ZAoKctKWNrn2/cd8WJoPzmvmW7uhZq5YC
	 iAPQN8/gBcRFAuvYJMrwl0T0Q5fLVXhI/6jX1bqeW04C1meQBYTsAbVHyiNqYVCdj08c7
	 JpaiWasaO24+oK0wvv3oCN61IqCIDZfORjEDJfEPCHqNhrOHWzSTrl3vRXfR80zGGGnZx
	 IoDxVhoPMsON3mUdesQLlzbJOpYVaK016gBbCl5uZ13rSckUDSbhc1D++ZcDF0ilHGvXJ
	 jQWZMxC6Lx1D4sattc8T+ZeAi9xGfF62hlXCnmTyjP7PnwbWwgsptXWvRDTuCzkqWUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=BSRsTyEb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.37
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010037.outbound.protection.outlook.com [52.101.84.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9EC606A321;
	Fri, 23 Oct 2026 06:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD9EC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=BSRsTyEb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdnl2t6s0ipdBrw3Agr0ydbuZM+bjz2zBIOZEwH3C/HcvqWlgXHBOqFQ8/Jg99kD1ueay4Hwp2YB4yDVnVaJlBn45w2Zxp/EEKR6B71NXfLZM3L7e4UdhOi3CUBtdO4A2UWww/WuBfUZsu1Na1BByy0AWfAnEoApuEWRpctyRe2avf/3KJSca0H9uZa+pWFLbFaQ2LW5SkixAZg0fL2FtBOl4ypPEQnW6OBrs3I8WkPfW8CMPzzUZgPieDmY6aH7rYCcHI3cWM95/DW+X4AjsNJmE/a72uDunYYJqP68O8m1sSgcK+3QyriezTZ2HDJiMRKKSwJxsE8LLgL01dGBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpyxvZAjPVwwXIchrpB0SSg6OAVN7/8U4+TZT86XF8I=;
 b=e3Hekrqj9OvnGxuh2L928HWOme1kIwF1rv8VCB/6pVChA8f5sHtOMn18qa9JWur9wjk8c0Q0I6k98cz2c5GdANUSsynwNBHlcCu5cVX1n9fuOSWDAjM2G/nEf94Fw0gXRLotopyrT102xYkizRz0YeFXgVJSd69FVg8r+oLrNxJSHE/fizC37sInBh+C4LnWgZ1dXBjYO6mbUiA10KAx3gfuxifQnDTEEX7YsExTZSewAJaUCbdI/dzXLnTDhDey2hrN6tt5eHC8ciBMFynn/Sz/EX6dDKpITkwJRzSVdQna2aSLd7PsNpHNg+hRgF8uH9HlYlH7yd3zflpHe5Efqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpyxvZAjPVwwXIchrpB0SSg6OAVN7/8U4+TZT86XF8I=;
 b=BSRsTyEbSymbIt7VCSq4FO4cAEAnFbPoKf32rkzpC8GUv1r3LoqZXW4Lad50A3IqQvMwtlxDJci8L9k6gHkZTOrdy2+SHRNeqF5b55pL8bLFB1ZdvcMJDsbOBGBSjFOvTaA4jUWKlvOOBS8OqnMrPpBXE5qUYAr1HBQ81dptHvtj9v65CBfDFnpkm+CT4tWYTOfx8CzcYlCSzmgGOffRFn6ipTk/cDRVufIzADyu3zC6Z5LrbheBhvaBoTtWeDZMHK2DV5EgIVO/JnH5zNBoIMkH2JgjAIXPX0HxnlIaSw1tZjanUw2MQtuHaWWCdM+92pnAdb6PHfLtVaN5LDy2jQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by VE1PR04MB7390.eurprd04.prod.outlook.com (2603:10a6:800:1aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 06:45:06 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 06:45:06 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 23 Oct 2026 14:49:41 +0800
Subject: [PATCH v2] media: synopsys: dw-mipi-csi2rx: Fix DPHY testclr reset
 sequence
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-dw-csi2rx-v2-1-fae30f4c5359@oss.nxp.com>
X-B4-Tracking: v=1; b=H4sIAIQD22oC/23Myw7CIBCF4VdpZi0NjAUvK9/DdNECtbOwNIxBT
 MO7i127/E9Ovg3YR/IM12aD6BMxhaUGHhqw87A8vCBXG1CiURKlcG9hmTBmYRC1uZymTo8j1P8
 a/UR5t+597Zn4FeJnp5P6rf+UpIQSVp8H9Nq67uhugbld8tra8IS+lPIFXCGmxaQAAAA=
To: Michael Riesch <michael.riesch@collabora.com>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792738188; l=2351;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=UBpb85zLyrMaYmBjaPc0DnQHjdSrHf6sJRTTDPhIeHs=;
 b=qPY+KZtEFz/3ewpwlxz1nIC0BOJE8H6gkyhN6+Q4632fvmiPJOzuVyVQBKY4f/YcBcBZlY48v
 fXvDCuBmmPHAnc/e1Q0XW55SP61norb2zk8n2DDcmBegN+HkLC3laCi
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI3PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:295::6) To DB8PR04MB6667.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|VE1PR04MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f597436-1e79-44f3-fabf-08df30d12c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|1800799024|6133799003|18002099003|261022105027099003|261022075727099003|11063799006|261009223027099003|261021123027099003|10067099003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Rr6SBLFyHS4pyqpTzh7hmydE6t+Q16/mSrjh/7LH0i8lG/KeYXLUV8NNaR0VieRg4nFad45NUgq+gfdZsrDAm8ocATuU9TD4e71HMKdTcottOY08cf/BHKzqDanr6tEd7H8/xGUHnkhClJYUjtETqrZ+dvOBSI36Nwz/ryvLxqSLx2DqQtLu1I4eJOSr6h6mh3IIW8KdbX2tx2dcMFBS/9ZejG5a9w2CblgM/dCSJ1J82S/SshGraYt1aadji0XEt8/x3jt1c4DKtAjjf8AtA/Una5polu65umTBGOrXRdJmia6OlxGDCA4T/BJBwjfnQykZ9LTLeOzVclLSnZ3GWoHKp9rF1D0TKaiIFh5seZiZcLklPRiPABwxEDdswY8WisVVpx/8gHANF3XWfBFNyE1xaaHcnnavNn/biRDIyZ9WH0qwcd60oSbhejZAMh6JtCEskNawc1MXz+wUHbT/6l5j/CyGSzpruHAK84gd+MeqhLnkLQjwHqrooUB7GJxkY7WlfZtSL/7CPArG5QytA8RtxP5e1SJa5Zu5cfNofBYh8SnuQZRYFlhh+1cdMg2BaLn9C++ez+UEAUCS6zOWNA5GOrcjU5THDcO0kK82yQv7Ec5B/AusJp1sVaSlFlkH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(1800799024)(6133799003)(18002099003)(261022105027099003)(261022075727099003)(11063799006)(261009223027099003)(261021123027099003)(10067099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzVxTzNlVStUaEVJWnF5QUdxRlRoUFNnTVl0OWhiYWJ4NVhPeGh4RXdCODNF?=
 =?utf-8?B?UTdBckxCdnlaMENDZDZ4RDRJZ21mUlpZQVBaYjFCQVJXVjBQY0ZtSFZzejZt?=
 =?utf-8?B?TUU3OGF2WnpzRmxyWWdXd1BCZmJVNjk4cjVEYTl3YWZxMkN5OVpKbUJ3Ny8z?=
 =?utf-8?B?eUZLa2lJdGlWdEZzNThjc3JmWExmMEk5NFBSa0dNMUloMzVxa3ljZGFzVWtx?=
 =?utf-8?B?V3lSc3hVTnNTeXlJQlhUUHRPMU8vblFab3V1QitvNktGa2RDQzhHWVI0MmJZ?=
 =?utf-8?B?NDlqcGpNdUpueTJPazFZSnVldEtsMGd0L0kwaUhMQ3dBMjROK3pnUzh0a04r?=
 =?utf-8?B?T3llZHlaVDBvQjN1ZE5EWXA1L3poTTBxcEx4NGNoSldtRnFLTDhBZ28wTEdL?=
 =?utf-8?B?SWhvY2VEOEVwN05ubUhHczFZSWNjanpmSVVmVG9MRko2TVU2Tm5jRVVqeTZL?=
 =?utf-8?B?a0tqNFQ4UjdCbnRhdW4wc1J3YVRlK1ZWWkVNaVlJMzJtaDRYMEppSGJHblNu?=
 =?utf-8?B?enY2V28zRXp3Z01xcnpydG1hZ2p3djA4T2dZbkdwTTducHl4OTdiM1BBMXU5?=
 =?utf-8?B?aXZwbkhYdU80OFJING5kelI1UzZxd2RIMUFxVyswaU5zaVhEVGJpeVFjcWYv?=
 =?utf-8?B?MkgraFVCZU0wUEYxY0lSOEtPdDVLeHVjVTJ1bzc2TGxwd1BPMVA5SmxJN25L?=
 =?utf-8?B?bzV4MjVPdm5ZWXNyOHpzWXgzYmZkRDBjUE1VT1I4MjdOUFBZNDd2YzRMT0RX?=
 =?utf-8?B?akZyUHVaNURyZm5ZQk9PNUlBN0s3TVRxSnM1Y04zMHZTd01KUHNuZVNEWVE1?=
 =?utf-8?B?TVpJZXFrd3h1bE4rbXJWeWhmcWtnY1d4c1BRamdEd013c1BoalE3TVYyZ2cv?=
 =?utf-8?B?YUh2T3pza1BWNklwNVJldHU0MFFuT3lhM3cvcE1ZWlJrUWxBejJKbzhkdTFY?=
 =?utf-8?B?c3hqd0QyU2k0ODA0WFRoOW9wNzdFQnJtY0V4ZmJXY2lXRHA3NUprS1gyNHVr?=
 =?utf-8?B?RFpiOEM2K0gwS3hhSU81R3BRbjhBdnEvcUNwSVpkZ1MwQmVmT1RTRkMrYnNC?=
 =?utf-8?B?My9MN0wrWW9wbUdpTUpLU1ZueXVZdy9mVnljYnhqckt5WHZYSzhQUTRJRU1Q?=
 =?utf-8?B?QVQ1dzdnM2x0Ukh0RzhlWERsOEpNTGhRYzUxWTFObFdPMDJHbzhUMC9tV0Jx?=
 =?utf-8?B?cGNEUXB2NXNPbHc4YytHb1ZLNkRtejZaT1hNY3FxWlF1SndRWXhXUmR5VHkz?=
 =?utf-8?B?ZFBERVlpZUdHRm5JVEQzRkVOV050dzZtdExrOHFPeDBJUjBFTUlnaWFScDdR?=
 =?utf-8?B?cEZUa1hTU3FldEhWKzUxa201VVdNSE9SNEt0Wnhud0tjR0dyZDYycUxuRG5U?=
 =?utf-8?B?YldmQ1d2V0JTOUFQMXZsdlN1WnRCTkh1dzcycjVBdHNDR0V4NGVsejF5N1cz?=
 =?utf-8?B?NUtmWEFPNXJuM3huNGZiRXpPRzZIVzZ4TDFyMWpEQnEzcC9NZ0ErSVUvYkdp?=
 =?utf-8?B?YjhxUWd5cnUzK0gxUDZCZVU4bnVrTkVLZENvaEdpWm9qSG1hcVovNjNmajFB?=
 =?utf-8?B?OHo0NGMrNUJVTDFZb1Q1R2dXRmovV00vMURvalg2ODlTZnlOVFg1Wi9oOUEx?=
 =?utf-8?B?aWp3RENzVkFEakw1VXVPME8zL2hidHVyRmFVTWpjRllkem8xRHdHK2ZFM3pL?=
 =?utf-8?B?bTZSQW5VZDlTOTI5YS9ZSnNaN1pUZE1jdS9UUC9vcmRsNzE4emViV3dUMWtx?=
 =?utf-8?B?ZURZY09RSG80UzN3NmJUZERaQUY3Sk5PRDJWVDhHdldkWVpzcHEzVjdTN29r?=
 =?utf-8?B?OEtxcmhhMGVxS2YrdUFDeWRMZ3pvT2FvdXpTMERMOWVNeDRUNkY0bkpmVEJN?=
 =?utf-8?B?TW5YOURzcUdRMjI4QUcwUW54VU9zOVZXUDlhbUxaME9VengvZmR0eStjYkRY?=
 =?utf-8?B?MFVxMmRKSVFGOTV0SHdYWEJFdExPcXFzQWJPa3RZZU5sTGs5Z1AwQ1Z3aVF2?=
 =?utf-8?B?aXNPYUNIWC9vRUVud2R6b0pTajVZZnYxVis3MjVrdlBtV2xHY21sMHNGTUFZ?=
 =?utf-8?B?TTJ1NlVKcmg2LzBnRXZuaEN0cjJmdmdCaExiRFdXWGQ1YnAySGJhZE5xbUNz?=
 =?utf-8?B?TENxejB0V0tpMUhTaWVjRDdVQU9wOGZlNnlhcVMxMjFYWFJZUmpyM3htaW9Y?=
 =?utf-8?B?Wmt2OTlOdHR6dVo4K21Oc05OcmIyeTJETzBremNJOTBJTS84Wi9Ick5BQmkx?=
 =?utf-8?B?dXBlQ0psODFVdkZqN1hQVk8vMjlnS3htKzNmZmhHczdVZGtCcXBUZnpjQVM2?=
 =?utf-8?B?OWZhKyt5cEJjZHN6TkcwZnJiZ1JjcDkySm5XZW5SNDJtb2dYYlEwNnlFSHNC?=
 =?utf-8?Q?XZLH7a2NCp8RStMtEEYd+1djmELjr4VtEunm6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f597436-1e79-44f3-fabf-08df30d12c41
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 06:45:06.0292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7HBEYTp8urPS5TyFPoCDZQkLi5Bi/mYHvDck5ueovjSbLM/v4nLLCtzuJke626Jz8yWcpqxLVgWh2zymQKXviYO0ixMYrTsyTjmCmzyf+mN1QyDPYTCZW2H4fGshIlj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7390

The Synopsys DPHY datasheet recommends applying a testclr pulse at
first power-up to reset the PHY configuration to its default values
before any test control register is programmed.

The existing code deasserts testclr first and then asserts it, which
is the reverse of the sequence recommended by the DPHY documentation.

Generate the required TESTCLR pulse by asserting TESTCLR, waiting
for the required pulse width, and then deasserting it.

Fixes: ec40b431f0ab ("media: synopsys: csi2rx: add i.MX93 support")
Acked-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Keep the readback before ndelay(15) to flush the posted write.
- Collect Acked-by tag.
- Link to v1: https://lore.kernel.org/r/20261020-dw-csi2rx-v1-1-c58a2e5cd43d@oss.nxp.com
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index b7247d597c9c..23fb4188e755 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -830,18 +830,22 @@ static void imx93_csi2rx_dphy_assert_reset(struct dw_mipi_csi2rx_device *csi2)
 {
 	u32 val;
 
-	/* Release Synopsys DPHY test codes from reset */
+	/* Put PHY in shutdown mode for configuration */
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_DPHY_RSTZ, 0);
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ, 0);
 
+	/*
+	 * Apply testclr pulse to load analog programmability defaults
+	 * and release the test interface for configuration.
+	 */
 	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
-	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
+	val |= DPHY_TEST_CTRL0_TEST_CLR;
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
 
 	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
 	/* Wait for at least 15ns */
 	ndelay(15);
-	val |= DPHY_TEST_CTRL0_TEST_CLR;
+	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
 }
 

---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20261020-dw-csi2rx-6225697f45bb

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>

