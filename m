Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792704748;
	b=aCXLQUdUEPLyvLJ1ohHNKBnBlWYNC8ZXChgu6VPZLUL+lXYlEtSTAtleqzYMnNxZbZ16
	 zkRtsmw6VNibNCr6gUF2NRxaAJuWeuV2iY4j5sUfRY1ta8LvTZyjAVQjnuhB+se4/ZZ9t
	 /8+vpHMqQitZXwxwyh3/ARkEDgEEa61HtKuTmagmZy62p97CAolrQSCEIII/zlS/Tk1kW
	 P3YZeSbwyu94U0ma0F0JZU9EqzZ8n0eHt8HiOj8PeHIhsdKcUPYMR6AwXV+M3FIjESNgn
	 o7DzbhZAzmnBiDcU2qwa8t25vhaNoLD8FX6RCe5zvV3iaRA+J3G6KB7WYLTFW3Wf4Zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792704748;
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
	bh=2OjDSp0+jFFFhlvnLvNIBbFm+t0Q+yFcC11j7CCf+0c=;
	b=hMj274N5D1J1uy7t7odrnopi3Nqk1BoYFDlPCJz2WYAVBenXUXPf/wPdttf6BdMc9iwr
	 OgKzmXXIQMl1q9afc03lLEooTZJbEZPkaMdBDuXCBwrzHnnkxuoHxrAlBH+tK0yj3Hu4g
	 Zb57fXnJQlAXuAL0zVpCPTx8iLHtLcqdhSmq1KVaE9/TyTWE/Dqz4gE55L5KfRUNDqBJO
	 C6bHMHNotS6zn+Ny3ZIuhioP8ffCpR/NlqhtFvzZJBzGDXZ4xj4NfKmVHwEOa4zy3BvQQ
	 wJ5paKHRbmcto/rAwVm1kdKTl2gYb4L6m8yFtiR82GKt/xxaxbg0oXuxaQ1sItAYRdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=v1Zsmryu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.51
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9764E606A319;
	Thu, 22 Oct 2026 21:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9764E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=v1Zsmryu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phFsGIORmmtAQ+mxSI4rwkGR9N6xgU8+Y6SGBLG05tRHQYhFqQ5C9QkR4z0zm1VELoQowJ76zc9zvhfa4cEtx1RJ6dsCNf/iVEYViYq8EZZMPzwlWayEsQlmGxkoxrtZD1FYkE9oSHvY6FpAbRvJK6UwINUQoH6wozNsU/Dy16qT54Jum80vnZwRZWdWfbpkgGSHL8LuYrw7CMKdUZ3JC8LU0z6BJyJnBOL4sYn8GHXUct0dyal3v9JBRDYA4FRo9G7O3cH4s3BBe8yfKEbGXbQvnGYGGA8AYbuKfcK7mtGeb/wdy2W1WDJyUcqcgqlS/jG54Y4TJYgyUZRgclHuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OjDSp0+jFFFhlvnLvNIBbFm+t0Q+yFcC11j7CCf+0c=;
 b=vCDPmKab2KII6pfRKtD/YMr8QiUJRQATseYJZzcUrsJ3IpGp1ycGdgRWgqnUWi9DPCiPmzAa0BwtSi5Pp0N7VeJZECBucrP6HMeaxDE2LrVP8q4I2JHFdIaH0JKPK4QtT/RIn560tidVA78NP4N0AR0y+jn6Z2xT66RxrrNOsGz2oj7slB7PkFKnnrg20UcugJCbruXgHUaDxPd7evZmAwhN47mapRj0q7oU4o0TyecopwoZG7bwEEtAyASSQFl+TTXj2YMZVWMDQyuucYCqhf/j9XIr5Ds/o5Ugu44KvLXn6rF5Fo/i7LCBzscO5bv8W9Wpki8VliL3u9uOeA//og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OjDSp0+jFFFhlvnLvNIBbFm+t0Q+yFcC11j7CCf+0c=;
 b=v1ZsmryujWLSNSq+MUFjPsZDaJM3l1s7VkcTcnKEEWaluI27xHvB+DzVyUkpwugjNyUPkinJxl0di4695c5Uy8AqW6okJSyNJ6/54hXQqM2h/QStfeatwW9IBPib2TCF37LXBu0KTsGnzOb6As08BPj4oyk2svmYI+bYDBA/mLYz3xHYdnM7YcylYN6Tu/7BzPwEWPsgY3Z4MpO5YQuOLQauY9kqXB7sRXkp1egp+PEn93xSfB3MBRtLg3Ku2tkpHmncXWNZ0YdNQusJMsW3t+SySZHsm65EUY7Z4KmcPISD59WwQ/BZpmhyaANZ8ao3sGRpp7BCbvH3mV88EAx5tA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM8PR04MB7329.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Thu, 22 Oct
 2026 21:32:24 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 21:32:24 +0000
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
Subject: Re: [PATCH v1] arm64: dts: colibri-imx8x-aster: Enable I2C bus
Date: Thu, 22 Oct 2026 17:32:17 -0400
Message-ID: <179270471307.1376912.8643007825204379432.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022161708.690702-1-francesco@dolcini.it>
References: <20261022161708.690702-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS0PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:8:191::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM8PR04MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: 94af48bf-da70-4884-b6fb-08df3083f697
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|23010399003|366016|22082099003|10067099003|18002099003|11063799006|261009223027099003|261022105027099003|261022075727099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	FHU2qNaPFVlXjaRq23Igm73v8j6nCUi4CI5dlXx2AYrxvuMcRtako6DTc4+qA8K+CbbJNgjG2mMEzANE9724F74jZXOdMKMvtTauEYyUfKo6lYHAoqn+ooXBNBrMQ6fWxs0MUDxbxOfXyKbTE4SisVXHM8IiPIE5/4t36lkesFWiusYJF+xGeeAnh3ythPFWrPMhnhChY8Uxil1RzOIClruCrt4fjpDrPyNEuhmG+qK9b/pOTLEPloBTSJQCjrCMSvHYiDwtvSBMSJ6ZYPlv6sSITb4OVt+3I1lGojsJU50LbuGrI0C20MhIC1Ug/aQLj8VDm4waPxo2E8h87OAhiYgll3CSRjbNuuXBCrIgI33hEthhT6OoiRp/MhQ1XDWcnAmgP3XMJn2VLOM5xr+LfGXzo+e3kgKI8F9RXpnyWgOi0dxai0jjDybAIFwwiMeb3XPYEYaWUrJV9osNfBqkOv0o+27UFbDbJTp5pw6N9phoup38uywjYQafyUvsKrhHVqBtxFjvqnywNabkR57qcw+iJkvFMmMKOAG6CjzuG3yAzKjZZuTUoaCrQXuGQvyY81228SDmiUwdBMds9q8NARkUmRv7zNF8mWgpYCSnrgfy261wyq+xta33iek9smxZjNvJqo5n4DuoMFs8Q5ppOoc9q5/WV4/bzN57xcRr1Jk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(23010399003)(366016)(22082099003)(10067099003)(18002099003)(11063799006)(261009223027099003)(261022105027099003)(261022075727099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWMwcDhndmd0c0NSWENQb3FoVG9IU3R5OTlnTzQwWjdnQmZyOC8rZ0c1MFVH?=
 =?utf-8?B?bjVEWnR4NnVnSStDV2VBWHpMZGVaaCtjeXQ2dGVEWEJURW5PS2hrbXhIemI3?=
 =?utf-8?B?Q25COFQrVEN6NG5zRG1DbDR3NDVMQzM2T1hOV2JmMUJJN3VYSUJVeC9RdVRN?=
 =?utf-8?B?QW92OUJIdGsxS3dlWEpuU3dDZ290UzhDWm1tUzdzbzRVaDcvcHZFTnJWdWVj?=
 =?utf-8?B?aXl0ZzBVbXdVc3h3SUJGaXVwUzdJVXZVdjdrVm53K0J5YVpWcUZySXF4M2kv?=
 =?utf-8?B?bzJ5RDlKTEYvTEZyeStNS2dmWFpjZWZSTVBvdVFHQmtJbEwxTVF2TlFNSjgx?=
 =?utf-8?B?SFRObXpsQ2xWZGtPTmFyY1pnUWJIWWhKbllNc1JDZGVucTE5dGhQZU83MHMz?=
 =?utf-8?B?SHlnSXdNcVpjUlA4aHZ5blRsSE85azdpWlRFNDgzYW1HZHY3VTgxcDhybmJj?=
 =?utf-8?B?d0hzdS81Qk1OQ0daTE9QL3JYTGp4YUdwa0ZSRmRWWnpuM0NOWTNqQ3ZCRUx6?=
 =?utf-8?B?dThhZklDbHdYS3BVU2l0RWg1RCs1cXl1a1kwOEwzTUdXMEN0TTRGRVE2NzhP?=
 =?utf-8?B?aU5naVpBaGtMbUZNdVg5N0x6MDJ0VVhSNXh0cEd3enRsSVdhOCsrZlgzcDZB?=
 =?utf-8?B?L3h0bHdjbSt5RldCUVdIRGxjeXR0SDF4RmxVakJudkFCZU1HM3ZGZHBoUW9a?=
 =?utf-8?B?V0dzdklrUnNGeHdaaFhweFZMYmFOK3NTajFZQTdrK1pUMlhLZTk3UlBLbmZn?=
 =?utf-8?B?eXFBV0FIb0VibW9wVkFKOTROT0EyWEFRdWVuamd6TDVkUVd0MXZRc2xHWUlk?=
 =?utf-8?B?Um5OaVg2MC9MV0phYytVYlhEYkRQR09pck00cUg0TlhScDRBbUpqdVcrNVFX?=
 =?utf-8?B?VmZFeWRRbUg1WThpRFA1Tm5qd2pKVmtzVko3WDhTVXRGVjJsMGZrMHFqbll2?=
 =?utf-8?B?V3RNQjFQQWg4VEc4TWJlQmNCVWhWSFJ3WXljVlhZVWNHbGtCajhXWS9VYUow?=
 =?utf-8?B?N3lpeFVLL2FUL3FZb2prTzJqb2diaTVLV3Fqci9aemJnRHZDYjVuMHBZOTNV?=
 =?utf-8?B?cVIyTElxNEhXeWp0cnYzNmRucHBtT28yL0t2MGJGMUE0eHM2Rk1keGgrcWpt?=
 =?utf-8?B?bUJNb0I5ZUVValRMOFFEUmVxWFFMTTVpb24vWVdsM0NUdWg5bjNISzlNU2dG?=
 =?utf-8?B?YUlGb1VtdGY2WHhaUWdkSWtYSVFkVjdGbFp2cmVqTnROTFF1UlNUWEprWW5i?=
 =?utf-8?B?TnhWQStZME5xTmVybmdpOGtGNkdkWEF5WGNSWlNtNVB1WUd0YTFpRGV1ZUJZ?=
 =?utf-8?B?cnM3MXdhU0JmaXBON3hGMmt2RW9XeFcrNDQreE5kNStweCtqbUVpamNNRmw4?=
 =?utf-8?B?SlRmNTA4RjJkQnZlSTV2QVZTM25BOVgzMURmRWM4bWJNY2ZXVDRGUFZ4L0Rv?=
 =?utf-8?B?WS9HM2NaM0E2QW9rck5WQmJrazBML2dkbTFpUDJCWGY3b21Ga3BsZWlJUUhx?=
 =?utf-8?B?RUZ2THhZTGw2MmhsVTk5NDRhd2sxT1VJYmUrdUNkVnpPZTZSdnBWMTNUd1lY?=
 =?utf-8?B?WXN0UzNhN2FUQ2RkTnhTMGlNOXFXaVU5d0hwd0JVOW9qQmRmZEVBbExrODNF?=
 =?utf-8?B?Y3puUS9uM3JHSzhNb3kxUld1ZEhNMjNnaVhKVzRpak83MEVQMlNvRmxqeG5n?=
 =?utf-8?B?UVBWMklCUXljbU5QS1FJcDFKM2x3dlpwUlU1bmRaOHNxRThrZEgzaGFEbnhO?=
 =?utf-8?B?ZUx0aUlsbVQwbHd3VFAwdlJiQnBOb0V6S3pXM1c5dkZxRXBwWFBoTUxvNklI?=
 =?utf-8?B?RjczQWd4UjRUd3hzemRocU1uMExGMWt4a0psU0RGdjIzazVsNTBiYUdxb0JV?=
 =?utf-8?B?anlKL3ZSUkZSL0ltV29RaTU1NU03NGhjbW1QaEk0QUorNXFhZnVReUxkdnFy?=
 =?utf-8?B?T0ZGZFlsOXRvelhjOGNuSFhocVlyTkY1UG53bGtZOFVrRndzT3lnSlc3Q0ln?=
 =?utf-8?B?SVdWRk1JaFlSak13UHNxY2Rhd0J3cUt1WnMvYmJVNUdtTGNSVlJpZUQwck9l?=
 =?utf-8?B?S2k3bzFFclRrN3RxTTNValZpSG1GSmtTK2w1Qlk2bzZCWkY5WTJhMHQ0Lzc4?=
 =?utf-8?B?YW05WnVaUHVvVUE4Q2d5UHAwSFZDMHFpeWVrZTRFVzZqTDlvZXR4ZXpydndr?=
 =?utf-8?B?VldnYWdHTEI4N3JMcU11cklyZDhYbnd6cHRYem5GS08xeUVtVHYwd25HcHBp?=
 =?utf-8?B?NTJHNmdhUE85d1h1RmNYbXpRSUxBTkpaeEZYQU1jRXpES2FzTGgxU2VLQjZC?=
 =?utf-8?B?YlhxN0FteFVHbUtEZzRKdlBaZnhUK3pONDhiT3ZvMkxVRnRmZ1Y4ZGR6Wm9H?=
 =?utf-8?Q?QrImdC4U/TecPNPrMCW2cGe/J/vuZNSbMh2FL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94af48bf-da70-4884-b6fb-08df3083f697
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 21:32:24.6704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmZsvxR30X2PE+qEj7i4uvbgH/gUJMf/U7+3QTKrAdU8b/n9iSjpqsp8ZPbyJkWbPwq2Uz1FFQValrb9oYO1g0GiaHyKnSpY3r88RRq8FDWFPK4eLDrj1FarKp3rLVoa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7329

From: Frank Li <Frank.Li@nxp.com>


On Thu, 22 Oct 2026 18:17:06 +0200, Francesco Dolcini wrote:
> The Colibri standard I2C bus (SODIMM 194/196) is available on the Aster
> carrier board on the 40-pin extension header X20, the Arduino UNO header
> X18 and the capacitive touch connector X3, with pull-ups on the carrier.
>
> Enable the bus to allow userspace access to I2C devices connected
> through this interface.
>
> [...]

Applied to imx/dt64-intend, will see in linux-next after v7.4-rc1,
thanks!

[1/1] arm64: dts: colibri-imx8x-aster: Enable I2C bus
      commit: ae05b3817c0c5216b829ee4a096adc3833bc33b1

Best regards,
--
Frank Li <Frank.Li@nxp.com>
