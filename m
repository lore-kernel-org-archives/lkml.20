Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793908390;
	b=3PbzhfSver65veFQilza+pve4eLbhTuzk+7t/UxVhkAWiwSuzWFkR/G/b3lgIhaHixAb
	 aKI/bRimB04oGE51Vn67roiwvGEyQwmYbgYQRL5BiiWYYrSoVgzbyp7k23UcrREG6uRP7
	 o98z8h2dcDEop2XOB9E6nFWML+8M71AIDhHZrY6iz88mo4DTkeAvCDgJ0iHwAcIkigf4v
	 m34IYw8o0dIuoJqJmfyDavGMGD7HqV1dL6teaCqQ8rUTncj1e49e7a/tUsQINI5zhv9X5
	 9FDEDdRWWpgxZ5mI/sgFaks40U/ujWSC2TQ7/5qZNgT0kR/V3OAOSBKImfI8O/PGoQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908390;
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
	bh=+x/mepePPF2MrqTVLqRo4ZUvfYti5CeyvZn8wNeKnaY=;
	b=s5nONE2hnfsKvj+jhq5wXsiWJt4cz8I2nXvZTSMGJ57Rrjz2Tg/WY/JrXa5r9LAYFmkP
	 DbDYPgMZgIdQ+SJu3wC+SFxUvs85XaEKMZfu2ittRewND/CcoKOLDR12o4/hiqAAZlPuI
	 MQXlmqdvE3SQZZHkK9+sl4rVg3fALVu/zJ/INV5j6Hi9yIIge5PsoAauZbIZZPKYml2wo
	 VjUUYKFCRbsXpKywG0PTNZwmalzFwpUtuea3KIeiy+pIExWM2PI4gMA5VZrHEuCME4pOj
	 yQyT81KXMHRJ04R45HzHPGyocJUjNSN0spk4chppbdKMNHaOCgBpswFybtfXnPcqWkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tPo1XaVL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.42
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011042.outbound.protection.outlook.com [40.107.130.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317F8606A329;
	Thu,  5 Nov 2026 19:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 317F8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tPo1XaVL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgSIDegPcWQlk+doR0WGdRecYu8cTJcLboKfLKsJjZBlolK68aExS25bUpR4UlIoPrHpdM8lx1DrN7a/ycXIi7GW5xem9mqRd3DuD2BG6fRhtGzAr2McCXRHZFmuXKDTvIXkfmlpjfui5c3xl+9WuF6cV44FAfKBWvybr3XcrxzWBybATYeukmh3JN9OQlSHBy1RZnHziZi4mvZnQF4hPBN+T16fium+713JAbrOlBDz6rLWOEh6NyzXq3U1Y3Eh+0SdVdrGdYbxetYZaBa2UGEAkgB4wHzA7MsziSF38rJehvi4rGcwGmy+eG6D7JUtRjAF0+equ5qh8g0jEYoRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+x/mepePPF2MrqTVLqRo4ZUvfYti5CeyvZn8wNeKnaY=;
 b=aAVilq0hSVARglyAP4V8d9/+3uTqhc4VkaGtBo3TFvEbrB9C/B8Sf5OnL85zVvLVm+DR3AhHuvGzseNtSoBRzT0I1TIReipeHIIx+qOQJ3Qg+qh31sZG8IliWa4j9sz2MUrj82KaQXWl0E3FaIfwz8biRcvcuICZvoOepJJckOGKBpynoHigGsaauN7vt+i6duUQRHgigS7qi1opmXp+iPS9Z2HczrNXTvy9dN15bgaynVVFMYf24CWriPwqc4I2efpuv7UQwTqWkVWergXmf8YIlWSGZxLwmGl6uGgbD0TBDlTsSCzb2kIephSsnZ4y6Q29IvzEMLmiNu3sqJq5Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+x/mepePPF2MrqTVLqRo4ZUvfYti5CeyvZn8wNeKnaY=;
 b=tPo1XaVLexNPQ8ua7k6YQhYr8v07MwUc+r85nRYT9ZsLsrRVv3aiyEvJ2tmgpkwgy3v0+dnSsPIvISGCDxtTTrxhNqksHO4b2ma82YZFiyJViODg0jqvguqyPJ12xIQ8eXCySoRm+QRBdTJBrY4nJzu8U4Xjk0Pmymx4gf2leiVxXvLTU+m+oizlIq+lWp3qG2wlg3GjF5mhaCXYNVLz7nMW9SRomvdNHmZ/XZFd4csB0u/9SyGC8EBl7UOE3F8ON3muizvxirX3LE1D41LgqNNHdLVNr5WGDakNkc4Im9ry6+CG7y+JiFnXe0LdsgdiVNsVecDRY9pO6ygu6DX2wA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by FRWPR04MB11199.eurprd04.prod.outlook.com
 (2603:10a6:d10:172::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 19:53:07 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 19:53:07 +0000
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
Subject: Re: [PATCH] arm64: dts: freescale: imx952: Add GPIO5 lines 18 to 20
Date: Thu,  5 Nov 2026 14:53:00 -0500
Message-ID: <179390837687.1654031.13234650905983591985.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005172622.135725-1-francesco@dolcini.it>
References: <20261005172622.135725-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0066.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::21) To AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21)
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|FRWPR04MB11199:EE_
X-MS-Office365-Filtering-Correlation-Id: 816a0cd9-f515-4040-a626-08df3b766993
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|7416014|376014|22082099003|18002099003|10067099003|56012099006|11063799006|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	frmJGWnTC8+ffeKMsxAxPbDv66EFi9QRN8D9oNFCYAbfz8PejTSwfxks5Zjo32OY0oeNrDmYnvGAvOILumc0iExlMgaX3TVsfgv5BRAXnHGF6j6GClizBO8uMhQyFx979jV1I5c6Q7hY98rMI29XHcsA5c6ALNDHzokJuexWdnqAzm92FvztocJ4nyKRP19lKC7d/sM4UzDrhXwzk/YMJuu6CCz9LvxWD/SJuTnRqUi8X/G6pNqIkHblM1OPH6WNY05GQRJjE0WzBegWVQPlMej/sYxnFONM9GN66/UJE15u7kYIKElZiDOzS1g4t6nSP6JEj4E/hOy72bAh6uL0jr/MgtfWpyrWvw46puC0cK4gkuwdAyRp7vIQxv19My1U7YsvLBuHq29Cxtei10ftWXUoAIx3sOMcmSwMiaus4R4vsYKyMbk36HxQ9lw8Jt9hPf5ESMAfGBChT1sCYHvPxtTdX4UOA8I/fWLB+vAfRekYeF1YsXzkZ8wMOOMpZH/Xd+gEjAW59y9fQmm0O6FUSQ39TIOkpUgqBZiolhRN1uo/b0DSamQ1iEDv2JTz3XUJozj15bbQ8a9bu+8S6j24YZSG/RokS99oC2+R/6KmygyNhH9VOl2iJiHvMYMcTq2pVkaV+pKzAf2N9GsetYJldljID2DVwF6PWBEObS1jZOo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(7416014)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHd2ZVBpcWdpUmFJMEN3Q1l1MWNHdkRsUHFQdndPNGp3c0xRVG9hckV0TVFE?=
 =?utf-8?B?Lys0bDA0cDA2MFhHSmRyMVI4eENNTkgvOW5QY3phZnB5dm1OQ1ltVjZHZG41?=
 =?utf-8?B?WmgzQzFkUXZqZTMxZVRTbjhuK0M3ZXNTNjIwRkVKWnkwV3NkOEZHeXBkM0Rl?=
 =?utf-8?B?aDY2ekhVeEtNamVMdm53MjhjYS9VWS9uemVMVDBnQVE2c00vZUdUaG9wdkhT?=
 =?utf-8?B?c2c4RWlIVHlBc2NTVVBwcGhHQlNIVHhUK0JCNlZqNVp3Zi9yUDM1Z2NJVk52?=
 =?utf-8?B?akRkcUlCcy8rdU1SN1g0ZldLWmJmRm84OEJmM2JtNm5TcHpDb05HU1RqWWZV?=
 =?utf-8?B?RlFKVHZ0TjNCbUg0NGMzQ2pEeTZHQkg4VjlQYnI5N0MvSXlFaVFORTN6RnhT?=
 =?utf-8?B?eGJMRjVjRVhRU3ArdEpxc05Sa3VJVHZ5Y1NOUnZXT3IyZG4rNHFXVU1venJK?=
 =?utf-8?B?KytiQ2kxMEljeHNnWVE4c2V2VmpyQnNIaHZXaFhXZWJ3U042YWIzTjF6M3pN?=
 =?utf-8?B?d0NGeklDRmtwcEhLa3hyRVRjajAyR0xkalhFYnVGK01RbkhOTFJCMzhoZnhP?=
 =?utf-8?B?dktaZEhWYmtVTVdrbHVYcWM1OUhjVnY5YzAwLzkwRCtUM1hLa0NQemNOK0NH?=
 =?utf-8?B?U1FWbUZLN3FQeE5LR2xUWDJHV1hVTk5SZGhYcEVRNTJjbXIydzlFRmRHV00r?=
 =?utf-8?B?TjhObTlDdEVqQ2k0T3JYQjBFaGQxRnBvVXk0NzIvUnpra1UwM1JHc2ZNdHBp?=
 =?utf-8?B?UitkYTRHOVVhczFJQ243YlFIQ1VPZThpaElVQWRnK3lBMU90T2xyRHB5MUpm?=
 =?utf-8?B?OVFHUEtXSThWN0taY3NadGpIZy83VFp4UHZoRFR6RFZyQWZsR0F6OHVaRS8x?=
 =?utf-8?B?T1ZKMHg3eEZZNDRTQ3FQVTN0NSs4UDA0ZzJpWVVtRzhIbTFVeVdJRllHVjZX?=
 =?utf-8?B?OFBVR0l6cmUwSDNNbGYrazN5M1JxMnVndGZLTVg4bi9pUTlDaGFiT2JnVEQr?=
 =?utf-8?B?SEdqQ2gyaFNqVzloSEJSSENla2dTUlNrck1WbG1yVzU3T3RZY2FRMlRpb0pu?=
 =?utf-8?B?b21EL05wYk12UVJVaEdIMUdPQi93cGtjc3dtdEVySk4xbWNJWVN1S1ZBQWJT?=
 =?utf-8?B?aVE2a0wrQStqMVFiclI5WXIyaDRtWnE2Ui9aMy9FMDRzaTk2Y1JJMVNHT1Zw?=
 =?utf-8?B?bVBPK0o3SkEwZ2tTRUpCZmVnMkNFMU1rMTJsVVVwbTBLNU14S1dhb2FTSXFJ?=
 =?utf-8?B?MkdXUE85OE8yZ21IWExxQ0JuNGFHVUlhZXJBa0JPUmUrcDZxbGRLWEd1S1ZO?=
 =?utf-8?B?Qmt4T1Z2OG9HdG5pYzJCTjRJcVdjZW9wNGpRZEx2MnBndXUrcGhPQ2I3aVhs?=
 =?utf-8?B?YWFqTDJEZWh5VU81WG9zR3g5ZnVvNDM5R0MwV1BaMGJpdTlINWhNTyt3VXBJ?=
 =?utf-8?B?bEJQZXozWjNxYkc0cTNrUEN4ZWgzb09YNzFQWEdjdklMNllhc0kyK1RJY05m?=
 =?utf-8?B?OUxycldZc25ZdWJ2YmViZFZQQzgzcEcrQ0xRUnQyMUc1QXRjZHozZnRGYktH?=
 =?utf-8?B?YmU2MUFMNmJmbmExcytCS1lOV3ViV0ExQ1V2N1JHN1JPVGpmVDhZOTBoQ2tt?=
 =?utf-8?B?Sm9iRzVVU1lQVTVEbm0yQlF2WllMQ3BaRkhQZzZvR3p0YytCK2c2RW5RZmts?=
 =?utf-8?B?RWlHV2doYVJtZ0x3VFd4ZXRLVnV3L3ZZRmgwNzIyR0ZjM0Jvd2xQQzAxRHYz?=
 =?utf-8?B?N3NlRUplUHRVUXpVODhJR3pkQVQ2M0RGN0QwSUpXRm51dmdkOWhWMkVWM3Ba?=
 =?utf-8?B?aVF4c1Mzd1dyL1lIODI1dHJld2krN3B0U2pLWDBWdVJLTUd4Vy90VkREdG4x?=
 =?utf-8?B?bDVtK0VHU3BFc1lQZWx1ZXlxMkRZNkhvSGYybFh3bHA5dVNnL1l2UE9IYWdU?=
 =?utf-8?B?M0M3YzhvdUM2SjgxM3RYa2h5bG5VTUpINFBRN0hYbWVJQUZob21McHFFLy81?=
 =?utf-8?B?clVua3FNQ2h6SnhUVDFLN3RpMlBXYVhHTmFSMkpxL3laVlF1TCtaeFRDYUxr?=
 =?utf-8?B?cWlpNVZTRVBGRVMxcDhvYkY3QVFuVGhGYUVoWVpyY25nRnZkM3h4dExJYVFt?=
 =?utf-8?B?ZEhLN1JzQ0lsQWVJQ29WdTRiRFJ0c1oyRWM4d1hYWGp3UnRyVWd5cmhIdHlP?=
 =?utf-8?B?dUk4aXZCUGtxMCthM3QwTVdxdStXOGMrUmRBR3ZqSG1UMXNGd28wNlE2d1FI?=
 =?utf-8?B?RXB5SEtXYlJudUkzWUEreHdrL1BUOEdYMUk0LzM1VVMxNGZiV1JIcHJUZGdK?=
 =?utf-8?B?VkR2dlQ0bTZVUkZJN2h0Uy9Wcnd5VVJMaUxwMUhTRUgyYVdqWllFdDF6RXdl?=
 =?utf-8?Q?eqRtk8u9DeKHovLOr3S6+u1HxcBHPyR0cU+ch?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816a0cd9-f515-4040-a626-08df3b766993
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 19:53:07.4242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ha8RPP+4lZMo6UP/zpoQPCyLA4hxwTErR+CEXxV1rUiTAwZuw285N0+pUat6KilISjpitxgS8ZZiZVZAqeiWoe7Gox9SjX0LtF8Yd7/c6zyS4CiwspeZL5CIszjdqHN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11199

From: Frank Li <Frank.Li@nxp.com>


On Mon, 05 Oct 2026 19:26:21 +0200, Francesco Dolcini wrote:
> Add missing GPIO5 lines, GPIO_IO38, GPIO_IO39 and GPIO_IO40 are
> GPIO-only pads fixed to GPIO5[18:20], their SW_MUX_CTL registers have no
> MUX_MODE field (IMX952RM Rev.1, 2026-07-08, sections 33.3.2.44-46 and
> 33.3.2.184-186).

Applied, thanks!

[1/1] arm64: dts: freescale: imx952: Add GPIO5 lines 18 to 20
      commit: 62c2671594cec8ef17d70d876753dff4f78e5ce6

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
