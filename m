Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792702234;
	b=Y2B3q5+1YIP3hCsxAYL5oHAxhJkRBSBEf0O5r+/15TUxdwb283PHJBYHET3EmfG9i7Nt
	 BBwERWzTvqVdh6/ODeNlWfSb/iiMjUQlgjoJIFSTRuqFJpZoJPUq/LOFiEJoi6OidWbE3
	 s900zj1KzrkTNHUr5dccxmWunM+tnxfuMgIPaQEJO5gVE04Yt0dLtE1bAi2Db60ScTWYk
	 adOvx+z50WWtzMsTFa7R1NBJWwUFpIPKbIZxWq/ybblPby9bozzsz1O54dUVUvUyv3UZ9
	 R7IOI7vofLk0x356vo5z+yfpWxipPtsV0OaOjVvD7Sh3RsKl0DG+PSeO0DuYDQj+Ajw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702234;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=YLnrg+dOo8WAPtYPo7Bf6oMEPYeiGlhKHP+L4Esj6bc=;
	b=j3Zbm1BDNcUa8+vTptRovSUrCuIr4pgrtYszo5FLyKU1HIHJiPMq9u1hcl14xL2JXb1X
	 lOGPBnEM5JBlsV1XTkKhC2nhTKw4ibuZlZPXShZYOT0QMOZ8LQj+ugxme/vRh9bSPLK6G
	 imqsIhGeXXVE6fikUBQmJ6TxWYEJTNfg4FbFneWoQp3Kp08PUVhKyeEl3kRwyPNHU1pls
	 R0Ns3rMyc55shb/o5fvlkIMhM5A7NAQ/OGWdFYIYEBDu4dREyikETLGfJJZjLQU3c+nvT
	 qWClWMiD2Ytqz2nDltjVhkGL8h98ukJL+KycPpcv0l3NzI+ZHbbg0H311qQC9LP3LFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=IBSxnj6r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.25
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013025.outbound.protection.outlook.com [52.101.83.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B700E60A382F;
	Thu, 22 Oct 2026 20:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B700E60A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=IBSxnj6r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gn2HsF3mUtk3hvl1MF9HQxofQfJatOYevl4pWS9W7z1RFrOQALCbJuWbIoAzeYEL1s7lc2tif4FgbJcUK21aNlKQv5bESe/vOP+NxmItUgCs6IAiT9z1Z0Shk8XAQbALt2MyLBKj4v1hjakKja4ZhR8A6Fvj1+k4EVi/3nU1GR6JxKKF5nd/ZVNh7uoShpS0ksGD8R6xMsF8vi9qzkVVX5JgVEsoG9rS+2TNNupzjXMCCuogvoIRFon/gnTZ95mxj3Fj6hjA7cqiIuvcP7qAPYE2w6+vp92t/PgfQilTHa0wzd6UZbDITXMpSnOLh6cdClBvXKdTeb3q5y/wxslTJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLnrg+dOo8WAPtYPo7Bf6oMEPYeiGlhKHP+L4Esj6bc=;
 b=nHXT9hU3qBoPYtmv/3pNAykllkSIMpQPr6cCyvizCefS+02+r0kWulKuXopb4nPieCgU9weaYJE0PrjIRUHC8nCi9JipBoG2WXEVROoYUA4OGfGA1OzFDVldJkBfRzjat+IHivqd1Dzd/SjIx3CXxUlOcjx/stfuCNQbPUcNSgCWciuMALJP6M8Mqd5N3XKQBKiAsxk/wGuqdPmJQlAuwO0CxTAGyWIIHYSvJz9YUp0TABxx5dGTZhgx6mIEP5E1A1HPXpqfyxKrmUlRXB2TPYBVbfH8CS3t87o5KeMoFWefldFDxAQKo5+G0t8XeqP4XjbcCGJe4vINHddzTh35AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLnrg+dOo8WAPtYPo7Bf6oMEPYeiGlhKHP+L4Esj6bc=;
 b=IBSxnj6rhGWSL3AvQFunJUSdRptk0r0m6WH/2O9KxLXDCG8nr2JbBUTpBc0HHOCwYeUucs99FpB4czsFWBJlS93hudxaL7D/WdDsTPyuY3wzx1THT5YEuxIui3z/OnXV4XkBdmb4y4ijjYYoNkSm9QwQM00vxIEPguY4T3zP+pJCsk7Gz57tBdKSsGQeQA5LrV9SUeQFXZ5MwaEAVWVQqEEok9WgXcyPXZqHZuiUNAMPW+qkIUqdoZOdE/HcbUnKRAuwQa62MeRNJ2fCKwkQ9xAG0SWQXBNap3jhes23tae3J3oIdklbA4ZvQv5X0awkW2GhMFPqE2pf/7/OYePcmg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by BR0PR04MB431110.eurprd04.prod.outlook.com (2603:10a6:2c8:33::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 20:50:31 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 20:50:31 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: freescale: Remove Toradex OSM Development Board ETH_A PHY interrupt
Date: Thu, 22 Oct 2026 16:50:23 -0400
Message-ID: <179270219850.1333520.3248824079975836747.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016184020.46763-1-francesco@dolcini.it>
References: <20261016184020.46763-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:510:174::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|BR0PR04MB431110:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b3c96f-3d56-465c-f826-08df307e1c83
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|7416014|366016|261009221227099003|56012099006|11063799006|261009223027099003|18002099003|10067099003|22082099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	UsNun12H3aQl3i6gP0SizHuhs6bzwE5DMghupCy4dq/UsBxLnuNTiDl5BtuJSQq4VeKjFjOgHWXikakFJzeSlFGv6/YiVECtlXtw9do7SsUpiLoQUokBp9vvqdCiMx5Esa/CRA1kmVLnA19zpspfEJnwiHZlFMgRH6tgxCqjpXhGD7Sn5p4g/T/q18rOTV5sT0+AEM32d2lBayKuIozv2eAs2vl7tVMx4OQ0L9Fgcs7f3H0Pf3LI5TqITYazhcI+cbxaYZPATGdbIuW0UaVGqvkjUz2VKCaGCNK06+nO8z/AQSt+85uOMl0+eNGkYTRVgxNVIfT8+ksQGdkDzDf1T+3dKQX67KY12vvzyMPUfyEbhRBxd19MnqDA40eGrcGdCg+gu+VBbtGQWr1YCzcUz0l480uEX+A9f5wx16d7p7uVRJcRiygIFzH72Xis953qQXKjp9cnxBK8EaNGmf7jnvLPfkMGEu9KS2a4b6BkGwZUjyAszeD8y44gNN0hcNgG7Lg82rlHTkuaHqNUdXBDUXFv+6h/Ni2HGvqrO0KXl3dEgr4q+z+BJIlmpErQ14JRNL6IFm4ME/qrwTd9BK0oURsgQVArES47POj+0NGevzLaLyGEEq/R2hX8yIj2c6lI8VL6M7p87kJPLn3mz4qVV0ajEJ+/y1d/RGrUWvkym/Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(7416014)(366016)(261009221227099003)(56012099006)(11063799006)(261009223027099003)(18002099003)(10067099003)(22082099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnV1bjRYWXhJcmg2dDBQTmgzMnpiV0pHeEhGNWhmRkUwcEVzeGFsV3FoRjF3?=
 =?utf-8?B?OEhybUVtbEYxaHl5cFMvaGFRME9IMncyZkRPQ3lqM3Nsb0NxZVZuK0NWQy9k?=
 =?utf-8?B?MjlJYndwbkwrMERScHY1WWV5Zjk0LzR3cC9wYnlGZENGVFA5emFhZXZDZmpY?=
 =?utf-8?B?RmdWZDlzcG93QWlxc1VVRUJvakFuK2piNldxZmZwdUwrUUlyRUFlWmMyK3dy?=
 =?utf-8?B?akdCOXJCdmtuYnNoN2xHalhSdkw4YnpHZDVSbFdSclhyeExYMHQ3aWFHdk1I?=
 =?utf-8?B?eFBaT0l6L0RHa00wL3AvZENaK3lHUENFaGJLTTJWczNKR3dLQjdsK2JQNmVK?=
 =?utf-8?B?RkNVaG8rakhQa0NXS1RaOHlyTlZGL1BzT3QwNzd0WUNnamJCR3hPeFBvbG9S?=
 =?utf-8?B?clRYV2NyLy9Eai9QS29GRC9NaWRuWWUwczhBWFVmckF5Q0hmQ2dudm1rSHl4?=
 =?utf-8?B?VE8rcHRkT20rMCtiNi9OZk16KzRJRGlLVDdHY3pwajFjYi83WmR0OW5iMDJC?=
 =?utf-8?B?R0ExMkRva3Eranc4R3g4R2VJZ2xRTko0K0d0SGp1ZlowOG9RKzYxc3BUZ0pZ?=
 =?utf-8?B?Z29Fd0UweGtOS1YxZ3p6Qzd1NmROOG8wUnZjaWxDNU1haFpVZFBvNW92TjQv?=
 =?utf-8?B?cU1DZG5PTStaVjVDMzA4akREN1pWeGorUVVUZGVGdG5KcitLNnh4ZXZuZGRo?=
 =?utf-8?B?enRnd201MzZSOVUxNU9NZkZvS2d1eHpZVy9adjJGMzBOOURId0dDUUYrdXVy?=
 =?utf-8?B?MFhDWWNFZFJQUTdGb2ovUFpFMVpmZmZIbzNnTVFLd1RkMG1URzlxenl0NFJ6?=
 =?utf-8?B?bmRydit5Q2FlM0tPOG1razc1V0EvK1kzUjR5MjNoU29VWjIxSS9jNmlNUzNU?=
 =?utf-8?B?L2dEaXF6MEdzK2lKeDFObkdPNVA2b1pBaHlHTVpKaytIL3hkc0FVMEhkM2RO?=
 =?utf-8?B?amJ1TVkrRytPREFGQjVacFVGeUQyeEI1a3hlc2lEQkFFMmpMRzFOdGNtTWgz?=
 =?utf-8?B?TE9OQndFSFQxY1ZpcjdLQ2dheHpzM2Q3UGpLUE85SWtJWWtaWm5aS2FkaDhM?=
 =?utf-8?B?eThwZmJFM2NKM1k4TUk2ZTA0RENUd05XK2MxaGJ1TUxpK3U3TWhWMmRKN1F3?=
 =?utf-8?B?eHZDVTJST0FzLzA4M05RR0l3Nk80VU8vbEZXeGp1ZGxqNStzWmNQNjJRaTJB?=
 =?utf-8?B?UkNNODRKV2s2OThSUmQ2KzNLR3N2OVhNNytNT2tvbURZbU14ZXlXQklsaHB6?=
 =?utf-8?B?RlpEemsyZGJ0eFNGT0lUczVsWlk4NlFqbjFuMHNyOUM3WDJmc1dZelVURTB0?=
 =?utf-8?B?aDEwQVpMRzdBd2d0WVJQbzJYTWlGSmhmVzFiY0FaWENYNUJkcGhQbjJHVHhx?=
 =?utf-8?B?TDI5V0RjbW9PRTVrOWZ3OXI5Njg5elJaU0dNbm5jeTVMdFdtSG51ckt4a2RU?=
 =?utf-8?B?L2xXU2ZxYUcxWXM2ejZoaTF3eS9UeVFZRUhOZi9LeDJ3M2tSY0JLY1J1b09x?=
 =?utf-8?B?RU96NWt6UkNGYzJaRTRvU2hOY0dZU0JzbnJlWWU4K0VXQlN5aWRyUUhTOU80?=
 =?utf-8?B?SHI3SlpWR1RNcE9EWERIUkkzTExIUDh2T2pHc0k1TElwU1hjcFQ1Y2t3Nnlj?=
 =?utf-8?B?MEdWV3p3VXpma0hWbjV1Ny9QZkMzWDE1RU1rSkpRZ3JLMHJGcThVUXNWdnFT?=
 =?utf-8?B?RFZ5MzNuYXVWNDU1SUNJNzlodFlYemRkT3JHdkx1cWwxaTI2d0FoNjJ1eUdo?=
 =?utf-8?B?QnJpU0ZlMUsvWUJFNjBQZGF2TXRMSWdSUUx2VHl2OTliVFBzWURkWlFCdG9j?=
 =?utf-8?B?K0QxM09nQ0lZejczTU5ucUtIQ0RSL0w4QnRVV0dxbnlENTlnWmxEZkhobVpD?=
 =?utf-8?B?NW80UEwyUFJhOWtYeE42dVgwVnFiMXRUbTZsUDA1NGhtK1g2K3U0OXpzdHJB?=
 =?utf-8?B?ai9Sb09ISkUyL0FnWGoxWEFVbVAyd2dxNTVmaHV4aFlJR002ZGJ5UW1KQkNR?=
 =?utf-8?B?Mk00emVxeUNmRi9iYU1iMlUzaG8wZVBNUWVZdFFjM2dBSmxoVDlOdGd5d3Fq?=
 =?utf-8?B?czVTa1BMQkFqR1BZSkdFZncrODAzdW1ob3puQmk0b0puSG5FRDFlWWJBcjJQ?=
 =?utf-8?B?N3JiT0ZCNnBtaTVyNGwxTzZvYnl6N3hkR2hMQmZxRzl1eVYwUTM0OFR2L3h3?=
 =?utf-8?B?cUlrUDRaT0F4STlZbVJNdTNENXA5SGhPVW9hWVc2Y0tIZVU0QU10enVGME5L?=
 =?utf-8?B?SlpIQ21XSXNDM09hSmVGNk5jZmhYUCtrelIremViMFhla2FxS05EVkxBOXhF?=
 =?utf-8?B?UC90QlAzcVhueDgwQkpjOVRpaElvd3huQkFUZS80clpwQWREbkNMbEt1YVhH?=
 =?utf-8?Q?Hp2syPax0YW4Do6Dpl8D/xqkNNe/OGMn9HcOr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b3c96f-3d56-465c-f826-08df307e1c83
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:50:31.3103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dajmGWTeb9qFw6KkjuvHE1Br/XOjVBgo4TbBS3JrIwNXnmBbBEUJk25rfeI94jS4rXfftifGi6dlby5eS93J9pzQX+o4qISokWqbT0sgER7rHYh8Q1rO6ZxlfBPKfllN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB431110

From: Frank Li <Frank.Li@nxp.com>


On Fri, 16 Oct 2026 20:40:17 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> GPIO_A7 is a boot strap on the OSM iMX95 module. The pull-up on the OSM
> Development Board Ethernet PHY interrupt line causes the module to enter USB
> loader mode instead of booting normally when the reset button is held for more
> than 0.5 seconds.
>
> [...]

Applied to imx/dt64-intend (will appear to linux-next after v7.4-rc1),
thanks!

[1/2] arm64: dts: freescale: imx95-toradex-osm-dev: Remove ETH_A PHY interrupt
      commit: ebdae4a40a2a7d70add4152d2ae7bc7ebc28afc7
[2/2] arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Remove ETH_A PHY interrupt
      commit: 0eeecd1d1065719df7862eee7ab46498312cbf63

Best regards,
--
Frank Li <Frank.Li@nxp.com>
