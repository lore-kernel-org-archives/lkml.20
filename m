Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794436432;
	b=dLCvNqQjQxPe7pJoj9Q3gm9bys0nrG2CVk0h2zIJy1zSGsP1E6uifGYsrp/2zE0kWmWB
	 vka5MeSQKP7kXii8IG+Y7pgIAC2CSdiQV/O6aEf6+g42cziVJ9Bo1Gax3OoqAok2U6fKR
	 S2KmLS59VO6v5lRlVyHCST31LwINSL9aZpVSdaAYWe5ocIsABzcoc5UQ0rYqlJbigJ5wa
	 w1UqK1pr9Qvd/mgaGTEa08A5jryNaVks6KLfEE5+Ul6LUatWdpya6+9osB4wZ966NlAjA
	 eVmO0PiQWWPJ83KfJiIjkjWKHkg8rFtzUFe8kfXw35Ez6u9HvjuVAsJUFJmSgGBy+xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436432;
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
	bh=AhY3Mc3XoAU7ztJW7ZdItLvR3ECWZBVRFUBbYD6gzmg=;
	b=D1HjIZnZ+wFi/j0Pucz9I89soLx3V6QBOl2bz02KRg8eb+2KvPcFQEyLmUTdWFA7Mk30
	 xkPE9Y+rE6u5dKaLqrRNfP+SNgraKa1maUbKe8MXbH185oDmDLjnvZ5CU3I3ExCMW77uf
	 AwOivhqrNrLIF/sxYd7RoIgSGnWbZ5w84KL9hoAjvuMaX4Yj2HAZHu2d9PCfcPjr3Uhwt
	 ZAR+qJ3iSEFlmI62rhwFX4VyDHo1gQv4hktOJOzpXQp2hZ717Alll4f0Gl9/YVS2HlHDO
	 CS2RWGbOUdHIfnIUWtes1xSuoP+K/WZslKTQQbIgA8m0BCRkQNlFImqk8gE67sWhEZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=PJE0xklg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.13
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011013.outbound.protection.outlook.com [40.107.130.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF9A606A321;
	Wed, 11 Nov 2026 22:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EF9A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=PJE0xklg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLupBL3YbRGt1WkEn2SyJGWHR70LbSNba0OuoLjJVGllVk16QVLZU3ch9jfwZBPsCf3pEPau0XUMBOCqbsbgNRQB8Ehttx41M0T1MereOAv3oVlLw/FRhy4o4OGoMLyi/okI/zUK259aMJbHsjomz/sRuC6jngMoraiDSPn8+VpmjablyBh3m+TwBofv9C4bezjGqnD+l5AXo4uwLWcKg8b1b26eO+Z81zEDUFEJGL4Ap8pSDkddHhXxB7eF3CxYK4F0oGk6kzxvGY8J2R0VEaCjezE4tKEgIShgP4qD7isw8BV2thcDDvADkzn+M69eKuboHwnX2HuZEiqmTcZp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhY3Mc3XoAU7ztJW7ZdItLvR3ECWZBVRFUBbYD6gzmg=;
 b=oYeSZxs80RRlhdoIkdV2lVqRLoSqmmII1u+SmD2wF5+KwNWFR155b0ViwHIdhoZfgTk6xSFH96alvX1uLEoIWbKo+7HCxgENHj6zGPD4YBhN2JFVjT4vZQ3FV3Y95dmjz7cQgwN9BaAx9bBpTAS8n30w8qsuUKOHQuUt/CftjSi/qF1xIonBhNX0vg8px3r9L8XZDjgk7Z/xOke49n1e3evrtfr1qBWhj7FIkYWA92GJCmFYQ9mPA7V3lUyhI4leZoqIpL0VNAXqxUDGs+SDrvQszjxcSL9U7mfw3qmXYnFFUI/Bf9rDHhTPqy2I32PFj1DnH+j+EsK0oOWwv1pWFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhY3Mc3XoAU7ztJW7ZdItLvR3ECWZBVRFUBbYD6gzmg=;
 b=PJE0xklg8WSKaoeXNhRYbGK61EshouHvVD68kq2FULNd+VwxaJ/fwWSdsMWU/cbo/hLCBQzqvjYPBIJYza9qvOVy26gBUT5gMvMd5p+jPM/PbqUmohGfcLVCHVnZRdSOhjwajFHSKH5fuE8hUJgK3PBYu0UjjyAnjCPAb0PjtV/llq9MVyEFVN2HTsPE2mPrOrm9nl7FoYr0mGNx1hfVVGnhAUDhMambYHix7pAnh349QBV/25Rqy6NA8y6tRcpO7nAUkRywhVtONRBB6UiEWx1vvNnhvBdr55NSCx+/58DeadxhIIyzDZVf0HaUMtRg+1jEcqFvBvsKCMm/dw8Xig==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MI9PR04MB515090.eurprd04.prod.outlook.com (2603:10a6:290:86::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 22:33:48 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 22:33:48 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Leonardo Costa <leoreis.costa@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-bsp@toradex.com,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 0/7] ARM: dts: Add Apalis iMX6 overlays
Date: Wed, 11 Nov 2026 17:33:41 -0500
Message-ID: <179443602619.4111980.16180606401056546272.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7P221CA0033.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:25e::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MI9PR04MB515090:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d13360c-c9f5-43b4-8df8-08df4043daac
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|6133799003|261009223027099003|11063799006|56012099006|261102123227099003|261022075727099003|261021121427099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	w3knJG0y3M8sASziZLIWuhOxNwYPWIWDliJHOZ6ktbjI91ZXW1a/btugYrPKrlBwCsyy1S8MhvK7a6M3w67awGaxtkMwccWEdeJwtGn5zt0W2CYX60ch4vhJfSTWv8SZKSL+UStfPCqVbUyk5oPt8kqCzYMugGIFqaExjnNOcWD8Z7P0yOkTRATFgpynAEcizPTboBJSt1qwZLklb9gJOy+9+TOfuoj1heTGG4KHxM5U00zVWdLNBZaVlSWlZG2OhRWOPrbDIjuEYAak7k93tphxWiTI9UOGnx+NruQ7iqykLUgqyZ6uDzm+QQBaRTkzviGqk0emfQZqHuiwV3xwyvXUUukWXdha2xRr3vSUlPf6j6wZX6yYUwvCLPSJ5ROmLTVreml6a77dagB9/pkOSBy3x1/qtiPCToBAITT6I3uLTboasc0sDaPFkybmnzPEL9Y66sD6sHeEWw+PzxVkCsKiaNRrD2p4YPHG1H6+SUOTcHRkDxNNTJL9Pm5GMdF4EilD/iDaHBloqCKj6EsiNWZHA3AR0VEQ9gMzTqT3paQx5E5TUqQ9siWaoQa9f3Hvam62RvQQXGHOMxednIzEIpE88p9ZG+Qu4V2DUY1f3rFDiBbt3ueyzvdtioVM1bQaKMFBarvznyhiP+E67UQYa+whzOg7xcihd6ellal4r3I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261022075727099003)(261021121427099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWtjME9xcnk2U3dUTXpHNEJnOENtcEh2YW44aVFLQ1plRG52UmJTelpIc2sv?=
 =?utf-8?B?a1hxclRVdThDZXduYjFRUGxLSVcrUDc5M0dtR2tmYmsxSUYrODN1OXpBaUJU?=
 =?utf-8?B?Y3ZrQU1MdHZFb2Q4M0Z1YXpBRVo0eFkrVGpyQXU5Y1pHTSswNDhENXJrV2hp?=
 =?utf-8?B?dTJ6R0E4NExXaUZxTlNJRFByQnp2L21LS09rMkdYaGhjTWFWS2dBVnZia21l?=
 =?utf-8?B?SldIY3lMVGorKzdoWkF1NGRkdlBpTTdGTkhoYThUZ1ZrdDdDS1lEbUpFTDJS?=
 =?utf-8?B?ajIySURLQm8yQ1pOam1iaFF6WEJtZG1rL3pRaU5wUnZKNzlhUUZGbFZPMXIr?=
 =?utf-8?B?dzM1VWgwRVU1T1JZWDZjb2VWTnJRbm12WW1wR3ZxOTNISWdjVFBoU1dOQzF5?=
 =?utf-8?B?Z0M4aFFvU29LKzQwbnAvQlliQnMyTFNqNVBlOW9mbGFUTnZrTUVCUmZuYkFN?=
 =?utf-8?B?U3h0N2FJMlgxdWNUVlkzUUcyNmNPTXplZGxtV2c0ZlRMTGFWSUJoRnlnK3lG?=
 =?utf-8?B?RjFrSGlOZEo0VFRZd1JXN1NZOFo0TzdGQXhCQ0IxOCthWHFySTRaWFpocTJp?=
 =?utf-8?B?RmJ5RElhbHNEZUpoTnpoNWJHZStEQUdEYnNjS242a1NYbHY4cC9YV0JTTllU?=
 =?utf-8?B?YVdlOWhQa3VzbXBITFJvdHhNazVOZVdYZlNBS1A5aDdrQzdvOWZQMjhWU3l1?=
 =?utf-8?B?RGpjL3hIL3VZNGlLTmVkeG1RQ3FFSXFSUmRYdSt4M05OYnVJU3ExcXhkMlQ0?=
 =?utf-8?B?UVUvdGkvM0Rpb3BzWVNCTmtFbkpPRVpXYndiMi9RdlQ0cVA2VDhKU3NsNE9L?=
 =?utf-8?B?NXNmYXU0d29YVTJIbXg0V1pSL2x1QjBsdkp2Zks5TFl2TURZOFFPSUl3OW1S?=
 =?utf-8?B?MEhTcmxaOTBybmFZWjVqQmxZck4rWTJkNmc0SDRpc3VtSjFDZnBxRC9iZHp0?=
 =?utf-8?B?b0ZaU2pXZ2R0Vk1kSnFPNCt3MEFrWVlCZkR4aU1sTTlOYklXQy9HRGYva2tY?=
 =?utf-8?B?djhnMCtRY3BuWm9TWlgwV2VIbkxoZElHbjA5U0k4dEc0c2IrSWlGUkl3Q2xL?=
 =?utf-8?B?RlBNVGRuMGRhbFFEUzNWQVV3cVAxcWtUa0cxQW5ubzM5UWp4SzNSMFNZL0ND?=
 =?utf-8?B?Nmt5cGd1Ykhoa09hWGd2MXVkQWhZUmgwQUhQQVExR1d4NkFZUkp2MnRtSHBr?=
 =?utf-8?B?OWFsNDlaR1JtQmJTbUR4dVBYSkNDbVptYnNWTlovNlA2QTlGcVJPM0c0d29P?=
 =?utf-8?B?UjNXQXdwNHloWGIvVWZ0YWhjQUhBQTB0SXg2VXRBbFBJTlRTNzJlZlVpNnV6?=
 =?utf-8?B?U096Z1ptbnNKLzdmenJLQUpkTHR0VlNhZmQ4cDlVQkdGL3d1NGVsdCtvdkg5?=
 =?utf-8?B?S0tNQkI1MnJKdDBLNndaWE5MemRYWDFERVpYd0NFSlJiYjBiRXkybWRqT1RY?=
 =?utf-8?B?QzV0SkRKV2dFZW9yeGlYYTd4dk1FOEZsenkrU0d1Y2NQd0MxcVorSFZhbXVR?=
 =?utf-8?B?REkrRkJQWnllUkEzbE15VG5aTnVzalZKRHFtQnpsVDE4Uk1uMkE3R0xOYnNQ?=
 =?utf-8?B?c29KL20rNEhtVmoxRFhBcGIzeTRzTGtWdThlam9DclBIbldjcGU3aXMvZ0dw?=
 =?utf-8?B?S0xibDl2WTZ0TytlaE5pbnhZRXMxYmhPL01BaG84ZmFKeS9CUEgyZHAveVkw?=
 =?utf-8?B?dUIzMDJlTklHRnpMWGlSdXhLbVZoOGJvb1EvWmxMUm5PUG1wTDkydUxzSFVW?=
 =?utf-8?B?Y3VWTStGNnhydVlzRitlTVZlTWF3L1Jzc2xYYy9tZzhXb0JPY2tjL3F4YmZI?=
 =?utf-8?B?VzV5N1pvREZyQUlLQ1I1S3FEUkM3b29RSVlMQTRZM0FPWDBNeXF5MmlkUFBy?=
 =?utf-8?B?VTlJT0R2WHdGNGo2REs5d0E2dDl4Qm5QSzE5V01XamR1cXMxKy9NSHZNdHJF?=
 =?utf-8?B?UndYK0pYQUl6TnpZQTZYa1gyZ09aalhLSHZ5RlAybzM5b0EwMGY3UkljWTE4?=
 =?utf-8?B?Tjg2cU9mVXNqZ1hEN2pHQnhkMW0xN2N1cmZRV0FzYkhna3RXQmxRcVQ0TXhR?=
 =?utf-8?B?Tm1qNXpHeHFUVlR3MEZZTG5TcVJqTXlpTUM3aksyM3pWcEdKVm52WnNiZEZs?=
 =?utf-8?B?SVJPMFhVTEYxZ05acFdtVldTNWRtNXZpeFRDOTc2MkEwOU1vNHgxb2JtbUtt?=
 =?utf-8?B?SjZITmVSdE9WdGd0SUx3c3JXdm9idjZsSzhQRXBibWdCUmcxUThFbExxNXA0?=
 =?utf-8?B?VEJnUS9rZUVFaFNwTktZRmJEUG56bXNKWGd3TkJqMm1rUVpRczFBclJGd0VH?=
 =?utf-8?B?QVF2OWhyRWVFcHRZMGdjeHZvQXhKZ2VReTJkUXRYQ2tCNkNzbHRHQmdjQVhm?=
 =?utf-8?Q?4MjaAIIhBLPTs8nEc81vlSE2Vpru3ReYq/QmN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d13360c-c9f5-43b4-8df8-08df4043daac
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 22:33:48.6218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iagAIGbd2YwkR1GVvnNnRLiWLxGBO8keh2R2l8rTazfXn/jth0UHdhOb0K+E81W59FaDVgtrKPUuOkrX0truXo3z3pRKBxQY/PQS9XK3tbjB/PeLplE9iDremcRvQ9iG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB515090

From: Frank Li <Frank.Li@nxp.com>


On Wed, 11 Nov 2026 16:03:56 -0300, Leonardo Costa wrote:
> This series adds device tree overlays for the Apalis iMX6 SoM. The
> overlays cover parallel and LVDS displays, audio configuration and
> OV5640 CSI camera modules.
>
> The series adds support for:
>
> - Toradex Capacitive Touch Display 10.1" LVDS
> - Toradex Capacitive and Resistive Touch 7" Parallel Displays
> - NAU8822 Bridge Tied Load configuration on the Apalis Evaluation Board V1.2
> - Toradex OV5640 CSI camera variants with 27 MHz and 24 MHz oscillators
>
> [...]

Applied, thanks!

[1/7] ARM: dts: imx6q-apalis: Add ready-to-use DTBs with HDMI enabled
      commit: f3243d50970bd4b852643b34ccd5d9fe415e2029
[2/7] ARM: dts: imx6q-apalis-ixora: Add 3.3V_SW power regulator
      commit: e8bb0c6e78edfb37eb2f3a5559029df9c0688d92
[3/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 10.1" LVDS
      commit: 0e3e300a74919dd685152e140e7db449e09e8a7f
[4/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 7" Parallel
      commit: 87d906d5a40021d190ddf49bf48b9ae20eece4b5
[5/7] ARM: dts: imx6q-apalis: Add Toradex Resistive Touch Display 7" Parallel
      commit: 3a6889c4fc0280d3a99076fdd3888c5d15e4532d
[6/7] ARM: dts: imx6q-apalis: Add NAU8822 Bridge Tied Load
      commit: 6242041ffd01fc0e8ca550d4f077138518d1a031
[7/7] ARM: dts: imx6q-apalis: Add Toradex OV5640 CSI Cameras
      commit: 9b31fc1d3bd3b4a53a6fd7faae1be5a7f8950f69


After apply these, patch, imx/dt CHECK_DTBS warning reduce below 90 lines.
Thanks everyone.

arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtso
arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtso

Above two files is the same context and also quite simialar with

arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso,
which just have
ad7879_ts {
	status = "okay";
}

I suppose it also can work with above 6q[dl]'s dtso file. Can you try to
use one for these with additional patches.

Best regards,
--
Frank Li <Frank.Li@nxp.com>
