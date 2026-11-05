Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793906928;
	b=MEfu/MzPnja4lmh1ueb950gcD6hO+g9G3fvusP43tpEDmis1qaEPnh2lUOaml47fjpOb
	 o/fvvnEqcluFWom1wUqci7hEUSlHmZoqrhVqHZTAjuZxitB6oVsxJo6ZCTx8Xw95UOM+w
	 h1HDBaPuz1nUWjp+DkZIplmj/Gu54Cs3ftkIOW5zw99A507ENU3QlWJU2ar7f0bpAP6M5
	 fBotz/+icTQpd/6bJHo9guQkqHYYNc+i2wrDbeYk36t0AkzWZqyQUbtnRbY0Ok6bDVDuU
	 ZWOjCKJs1g6FG/UjeGicRlDV1KFlaaaUNDN4XV28ZLuIDzZc3VRljixAQlM+yIBAwzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906928;
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
	bh=Q3Nw/42DapeLuMeZmsx2suTnPTEldEO1qUxS0pCt448=;
	b=IBdpofZfvQuhVuAuYU4L2tc2yZoN61rkhsER89bId1sRd4gOTzUqKaigTHTXiVkQAcO9
	 slUiBjZ7KGB6X1DmdMnQYtDSxm4aVH/wcGQFAUUcskXG6fFhptmSIii2/QumVNeukj80W
	 QWuUZB4n1hIfVR6DdO4QJldkHEpFNsGCTLjOS2DOsGEWDRb7Rz46NT14ldbwmohT+m5vt
	 /UAGf+y+kl9E+6L04HKn63B112h+WCxe28JVUgkJYRYK5hZCoZCrDqab+yQu4gG392PFC
	 ZLx/qRR8z/b9Lsv/1ruj1EkGXBjIrXRFgyzrx0c81AXYWCLs90ZcJtIYVKIzQzv1brQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ix7LoRz+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.6
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE65606A32D;
	Thu,  5 Nov 2026 19:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEE65606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ix7LoRz+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tc5JUMjgj802wfYTkScM0Mseiv1UsC2G5m48vuir8zm1nE3kngxfq19YDAQr0TUE3BWP7vHQ5TM+GlM+HR23zPWfhhkZ66tuj2naPDxh4KHG5uoOSiIskJMu4z5F/+mYyhVtTNPRQ0ywTqn6AeWHBWkeHI0ElosK1S33+XkYQxUFBfwFWsMhKQ59U9TJ/nW0r7TnscIYDh4wFK1b4mCshFcfdthftw6vpMBBi2Z35GDrh2c+cMen3is5t1TMuFxi8Y4iwsBndcTJaUVNBaQZ7afz85VcHKPuuZYSUvu09xqAJFt4bXQtE0Cu3Hn6tYOY6YBIoyYS0nTn6SeL8AYw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3Nw/42DapeLuMeZmsx2suTnPTEldEO1qUxS0pCt448=;
 b=ba7nlNNx6GvBAcYRV3lhMx2xtf6q7gOB7vjjUFWn2p6GwW4pvx4CDKug4+1+lSij0xtsUo+kg8WR0CPxYhE3ntQfIEgejOTAzTJ/Fmo9Dn/sUjXLNOBDuAZI+G9VHUAt99lWfvoyY88YWr2UX5zjq5B5m+yqddSrw8E1GlP7liNL36M8L39uECsB//zo0JH1bCzQCo/Zvu1vCnq8Rgm4TCkeXDVUIR8z+LN54QKXbTYBBS2Bh15qWHSgCNc+w/qza2JEiZ7HnJCsBSAZfwjC9kNHLFvSpjsMSdGVhDpJttD9z5E8WpaxrCkm7S11C5FbIkOuIJ3Xh2Ey4DIxTPJmeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3Nw/42DapeLuMeZmsx2suTnPTEldEO1qUxS0pCt448=;
 b=ix7LoRz+qSRbYKml0Of6BZhmM6H0xGpF1uAh8ks4DYsaIOAeImZRbBtXQ8T2uuQQoz6/VgxwiOvsVEGA8YSg4cJQfhxaPHpgm3CmbNAuyu+KZ163xas3f47IxLV7RgsQTl5a416bSWYrvF8gIHrEmF1uPcHgABmczmSlRf2A4x7DRa3/9WFtoX2S1s6T+qiSrjHRn/yDsMQtLZMLYAiXm7XtYff5Cgaa3gqYlWVr4o4a2CLPkVu1ZPl1mR3yG7Sqpkf53bsaYp5xS3X1VbHvrK51NA+POcawggIXsgAHG9q3LtFyWdrzBMDPj27PjFMA/8WML1H7KhdDBf5C5NFwsQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB8102.eurprd04.prod.outlook.com (2603:10a6:20b:3f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 19:28:44 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 19:28:44 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: imx8mm-var-dart-sonata: Fix TPM reset polarity
Date: Thu,  5 Nov 2026 14:28:32 -0500
Message-ID: <179390690927.1596273.13771780781548673527.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026123505.48909-1-stefano.r@variscite.com>
References: <20261026123505.48909-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS1P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:453::7)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: 852968ff-e3e0-4967-94bf-08df3b730176
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|19092799006|1800799024|56012099006|261009223027099003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 vlBz+MJJlb2CoccbgRCTG71X9VYx65qgWJcRFp6gm9diP/+aV8dFw7F69daUrmgWO8IU++zfGrmMKBjXCtM1sk4poxcvJBVhXfD3g9HvQNJ0Dc1p9q/bFezbK7NPEF6lZQ/0tHumjpbbtdU8wJaKiW9TNhpOUV86ThqSyYVqaFo0hBPYFyPzJvG6rzKAYwDSiD1eWzURaCjeW3+wid39E8JbFyFAos7MWvlaq1wgnto53CeLCLaON7GGymfIZxaj+Lk+++3LpKd0bCaAmbC1JHIcemu7At8DtRJfIeIBi1ryUknKWhINhmPG5xy2jSeanVa2fudg/dTq8TVgPOeLi1KtbRWf4BhtTHeyCPyVF5qQV/LI9A7FcRaRb8oTWRUoHihKy+RjJDRx2lKoIIrK48xIg5AVbERwbsBL8ZoPA6jMcVKMDeBAveVnbzt9PVaIMQhgf09obpCYZfsl/DAY2HlLW/b8lbZGwerylZaljwlXGhzup1jDitpSY0Xv+qeMeWFxcStOF/OSZutUB3q2n9+n/OvKRRnzmlJ/8u6kY/rsffiltPx61Wk7knwK2AVHmnFBVlQjZZnkY8H5LOFvOBlAkHfabPeHePe7823kOUZ3IRL6nycgFEUfaqdRwcLHmS/Yz/Sib4arqQj1qv3HGtPc0QgO57HIJxkIAAODSas=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(19092799006)(1800799024)(56012099006)(261009223027099003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RUlYNjJGYkNKYUcrYURPTDNSdzM3OThlZ3VCdENYSGI3WGt1S09EbUppZ01H?=
 =?utf-8?B?QWNZRlhVL1NwTUs2WGRRbGtkd0FTOE5zR2RheVFsaVMxSzFZZ29TLzBYRkxK?=
 =?utf-8?B?cTNGUFFnYnRwdGpzNlArNVV0dmVhbHBEdk03ZFhUZE9jenVlYW16M1pBUVBW?=
 =?utf-8?B?VkxjbUpEalRuME9PaHJRb0swS3VaK1B3SFlpQVJEUnBBNllKQnZPTEhNUm9T?=
 =?utf-8?B?ZWNHY3p0YnQxdXFvODR1aUFLMlV2c1lUeE5LNE82Z1IwWGl1emJQdXhuUWkr?=
 =?utf-8?B?N1dTQXdOeThpUlZxeWlibUJMYlNDVWE4QUJxbktqSit3dGU1OThwSkxTUzhl?=
 =?utf-8?B?NGo2bHpRd1RPeUxza21wMGpnL25xc3N3VDNWY21BWFBaYnFVOVUvNmFUUUw3?=
 =?utf-8?B?NlJ6dVVDTFpyTzQ0L2hPa0pzRGxTWDZXVTlhMEJxT3E4OHpBcEJFeVVYWW5q?=
 =?utf-8?B?Rm9kbnhoaVdJQkZZdk9vYVNrY3Nxbmd4WFBMa255N1J4eDhoQkRuT2JqVkRx?=
 =?utf-8?B?dkljYTBLT3Jpd0N3d0dXRG12WFIrbnh2M1AyR1EvUXF5a01SZWJnMjNXaU5E?=
 =?utf-8?B?S1FobXRaMVlVVmcwNE9VWmpiUTkyYTV3QnVlTm1UNlAvUVJNVDZycnA0UVI0?=
 =?utf-8?B?T0VJZzg3RVlJdFgwWFNpeno3dXpVY0VSOG5EQkRlSUdSSmV5QXZUZ3FYek1q?=
 =?utf-8?B?b3lrUjlTZEtiQVZLMTV6TFN5RlI1SFowRnRmL1JCaktnOS9PbzJGRTNVNTB1?=
 =?utf-8?B?a2l5NjRlcXdNSTZvSXJkMHlmbGVjQU5oWHh4Y0srOXlxOWMwb1Fna3Z5M3JG?=
 =?utf-8?B?ZGdaMWJER2JjWDlmSDZSSi93dnltNk5NU2htOVc3azhDMUhpNDFzd1liNG1T?=
 =?utf-8?B?T0J0NWNYejR3bVk1ZU80K2RwK2JoUHJnSGVQWHhGZWszTzNhSUdGVzNEUmRW?=
 =?utf-8?B?NjhRL1YvdXcrTGF1cmtUZ01rNGdnVm9tVWNmNWdEanZLdnEvMXo3Y3hJUDVC?=
 =?utf-8?B?aDB2R3hGVndTR0tZM3lWYnpjWTNuejk0V3ZXMHJpQjd4U0xEU1Vsa0JseGt0?=
 =?utf-8?B?K09OVGtEUk1IM0ZubC9rbEhlK3M3SlIrcm5EZnBRK3BUcEhiVVZxRzg0aDhy?=
 =?utf-8?B?WUorSXFjUVdUaEQ2VVpnRmFUZHRjanZaYjdyWFNINDU4SGJzQmlXTzA0cFRF?=
 =?utf-8?B?bzhMZHJqaG94ZDQydnNMTkpFaTB5eFJxKzJCQXpsYmVFMlVDQzdneHlrRFZo?=
 =?utf-8?B?KzVEM3NWdmhCcW1DckhEZDNuVFlRcGEzc0xidjc0cVh1N1RnT3BDbTZJWnFk?=
 =?utf-8?B?RHdDa3R1UVRnVHVxYXVSb3Q3a0dTT0Q2SFo5TUtYQmhYV2UreEZJcDRwY0Zt?=
 =?utf-8?B?Vm14OHlBcTRQNUQ1R3hjQ0dXV0UxNTNTS3ZDVllWR0dncEljMjhYTU9ub1Jw?=
 =?utf-8?B?YnRMK01QdW5ka2tLUFRkT0NxR2pzY1JhYmFPSG1IYTdBWldBM0Rxa2g1dGNG?=
 =?utf-8?B?MngzbUdvcEdjbTBsS0F0cHg0UUpjRHduRHNsT1lEMlNzZTJxeFlWc2xzbDNq?=
 =?utf-8?B?SlJrWUVNeDRzbnFxZVpBZXdWcCthc3BJRy9UcXgydFBONDFCUXhSMUpzMTdO?=
 =?utf-8?B?ejlNbjJBZHh2enIyY0M2cVFwZzRQTnV2Z0RUZ1luL0JpMGxzZ255c2VaZkg0?=
 =?utf-8?B?R21VWjF5d29sTTloOGZEVWtmbFVTL2RiYXdhZ0JhWGZ6aGsyd0QyZFlmL2FC?=
 =?utf-8?B?R0o5UG45L1c4R3BnckMwNU5tUHFZMGNTZTdtM0E0M3hyZUw4eFBldzkxaTdv?=
 =?utf-8?B?YmJiT1NhMmNGK1dydHNJMmh2Y0lHMlZ5dmg0TDFlR3kvQitLNkRES01nRm9B?=
 =?utf-8?B?dGUyLzFEV0o0VTlOQ2p1SFg0SjdEcHh2bldiOFdGYmRVMnhTaUNBbjRBRmdi?=
 =?utf-8?B?OElKQjRsNmlTdjFPNmZ1bUozOWFNZitpMnVoUFdXYjgyeHozYldHbHhySmti?=
 =?utf-8?B?M05wY3hKM2c2Mk5FS3JKSGgyTmtGaGk0VmNvblVXYzZjMWpyNmxrN3JHVnE4?=
 =?utf-8?B?bjhlRHBQM2N5VzVJZXNZay9taWlmeHJndTYrUCs0UXdZWlErM1lqT1hxTWFj?=
 =?utf-8?B?NU93enZ4K01VVFFMYlNGM3FKazV0T0VkN3F6VUpmaGUvdWZNSzFvdlFoQ3Y2?=
 =?utf-8?B?WjluTEMraXc4Ti9JMmx2TzloTGJzM2FvbURYWTJNNXp5WVJqWUdPNW5rWVpk?=
 =?utf-8?B?cmwxRGRyckVnTVVYQ2RDb1J1NVlFZVYwallIL3NMdlgwWk1JOTlFclFIYXJW?=
 =?utf-8?B?ak5TREZxSER4WnBPVmQvZUZraXcxY0lBSXFYUmRiSnM1TnRnMy9zMmtaZ2FO?=
 =?utf-8?Q?DwgMyg80+4fEYScghZbPwllX8+MtwwlmUqZav?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 852968ff-e3e0-4967-94bf-08df3b730176
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 19:28:44.2854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oX4hyRf/xzpzRVYNScjrYp6IQG/4OPzOI5T4SpK9m4pR963RXQFyUbNcpkL7WIHrZp5YjBqI6Ykx2JmTLnptrMr7qGJdV6nl8fUTFeDlTJhq2x4nXiYs40gwtOp6lLDe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8102

From: Frank Li <Frank.Li@nxp.com>


On Mon, 26 Oct 2026 13:35:05 +0100, Stefano Radaelli wrote:
> The reset input of the ST33KTPM on the Sonata carrier is active low,
> but its reset-gpios property is declared GPIO_ACTIVE_HIGH. This
> reverses the asserted and deasserted levels of the reset signal.
> 
> Use GPIO_ACTIVE_LOW to describe the reset polarity correctly. This
> fixes the TPM not responding on I2C and the resulting absence of
> /dev/tpm0.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: freescale: imx8mm-var-dart-sonata: Fix TPM reset polarity
      commit: c3feb96e841c637c5d6354e6528a3780fa40a059

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
