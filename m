Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793185823;
	b=tXyq3YByCAiSv0SCO5pQeOZ+5MVg+H8+HhQaOISo8Y2hcXkMZDokGWtmBTRJb7H1kri7
	 T6+v8ljXqA92aP6RfZTDf1cUgHYQIo5D5/VG4joWJYzG13vaITgIr+axXTgpicHOCtESN
	 xWBodHUgi25T/nHwY5pb5H2MyMlLcOr3yBASuymj3YcgIvSNFyfcEgxGsZM5g1bwv/5gs
	 IACXE5ltpjuy/c73H2OFubfkbvCAaa/z4T0AkR7xcg5hOy/sTXmOSDaahSwdDVW7LNr8B
	 Kb6q4hjhsSfqq4IOi+hNGWxvM3y12eZ7Vjinppk9ag8xfZw3e0U1clNggmwHpzTze9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185823;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=DbSLbec5FRM7SmfiMbTERWdemHvJUN8Rs0jpkHu1Bf0=;
	b=Tywf8fmjsDtPY4G2rgFdXpCcRCfPjBZVxggHv+u/D8haacGyLetlQ7dR/tGHAbGMCdHB
	 RVYRHDMBiQr/ACD50R4qR/CaWk09iGeRQaljtxy+/N+z1M8FrTslQt7u2dR+zcKi2E6E9
	 R5ITFjgVideLeTiFM70+AJ3vH9xJBYzmc72Xvax4lPykyfYr3vx2welxNWc8ZxsN/3RcN
	 QkbSxGw2W7qJYpkdz1V9oONhPLYSER/hHuCSi0teEej1Kh4BUFkCn7D6aPY8V2mWwinGN
	 aS62h/rWrqnn73Qvb/U5p6PysF2qpuT0+k0JvIlgGLpgPJXkrLq9lO3yNkV4BoCjOTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=UKDwl8Pd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.12
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011012.outbound.protection.outlook.com [40.107.74.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162CF606A31C;
	Wed, 28 Oct 2026 11:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 162CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=UKDwl8Pd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijOEb0vIpYHGDKIaaQHJCEyTkU2ULmij1TNZNIj9imnZ+sjXxx+2o0XfX2ew+EQlDKD7Z+IbMTE3JK5BHWejA6YgMDu8K503fNzlC+7WUuF0MuQdyepRXMOxiXewaCWDzbkC4c5UIPVn/zdQRyGEqIClCOsEcz1K99zySo+Wg8CrNQOhErQzu5uydT8H8jRwPSWczgYD66KakIyF7ZfVo8wA831nQJTfNl7C+3QOpMQDD4yGzr7V/rQmeQ2/p/f7s7DNHiloInoJ6Ll2cClD/LrxeHcUPvDeZK5w3U44HxefFDYeJduJiUBbEeTzrnBunmFnNYaVFH9Y49u7ftgW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbSLbec5FRM7SmfiMbTERWdemHvJUN8Rs0jpkHu1Bf0=;
 b=kBY9xcG+NaP6QL+kYL8NAZepdYDbLz+AKAMFGSiV/KaXQd8UskMwZh/aZmJLAU4JdPFrSj8Xo84EfEJt21jltKntpt5ObwT5fpXYMuxp2/Ynx6CLaHViW5IkLi1jJ5NfVnwBHoc73B9dZxLOIhmrddKyjY1meYC/Vd5C+4MD2yBrnV0RYKwYttuL53Gt1DfHPCF6akdOI8nJdKBacO6CaaWeVps0U5lntfpn+9Vks2qiO+TuZtHCi0k/1BTDOSihDC3qvc1gyOo0auneIfkJoWCXQaPHldVi4/hMx8LAdbShmCwM2DqmcVE+K3J61Zoj4zv5LrNBl9rVQeXA3PysoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbSLbec5FRM7SmfiMbTERWdemHvJUN8Rs0jpkHu1Bf0=;
 b=UKDwl8PdcGmDPVNYwWufiy/eIg5DpRZYszGwtovOSi2JUQZqVLmE1GN8kv/RffGKCou8aZBgEvR+2e81hmn/1vo/6UhBC82HlfeTqMcQmJpkOu2e5rQUPucAkBBbKnUexJSrAKswmx9E6yxIeAC5d+q5bHzgvlo+UbQ79V4zSEk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15118.jpnprd01.prod.outlook.com
 (2603:1096:405:1a1::11) by TYRPR01MB15601.jpnprd01.prod.outlook.com
 (2603:1096:405:29c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 11:10:17 +0000
Received: from TYYPR01MB15118.jpnprd01.prod.outlook.com
 ([fe80::1116:d56:8164:63b4]) by TYYPR01MB15118.jpnprd01.prod.outlook.com
 ([fe80::1116:d56:8164:63b4%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 11:10:17 +0000
Message-ID: <7dea4022-20d8-493b-b560-ee635deb7cbc@renesas.com>
Date: Wed, 28 Oct 2026 11:10:07 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i3c: renesas,i3c: Document analog noise
 filter control
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-b7ad60cde650@renesas.com>
 <ate-aNmqsyXCAIX8@lizhi-Precision-Tower-5810>
 <64f604a7-7e70-4a0d-8164-28c5d7b1e509@renesas.com>
 <at-5E3b_wKcnuJ9Z@lizhi-Precision-Tower-5810>
 <f4b8a714-dab8-45d4-b98f-717d010806de@renesas.com>
 <auC06gqa5lGtKPjj@SMW015318>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
In-Reply-To: <auC06gqa5lGtKPjj@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0147.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::21) To TYYPR01MB15118.jpnprd01.prod.outlook.com
 (2603:1096:405:1a1::11)
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15118:EE_|TYRPR01MB15601:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b8dfcd5-87bc-4d4c-bcc8-08df34e40c24
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|23010399003|11063799006|261026140227099003|4143699003|56012099006|261021123027099003|261009223027099003|261022105027099003|10067099003|261021121427099003|18002099003|22082099003|261026121527099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	oWVIk+SwXju11e1wRuBlYM8fL9U3VzKeQfbJ7OzEK4UuqNvTH2GD6lqdm7hIXYUp8hyuls1nLSCO/lQO1q1OQdmMqXWG24+gbPJRfBoN745AJZJH+s/wcOyWJB8zAgc125xdHMZWFFN9r9bhVxWYtEN99pOUt3LxKWjXvpoCxDMS5BL+OyxoznPvsopEjCAhT3HrmtEMwVNGWTbas3SVx2CS7DbgcGtOJJwyFA0XNTV0JyJx4DUOZPP4EpRLuMthwgFh8SVfdJOVyjZKKXQD0n4bVz0WRVIpfEthRTnH/HLqUHBOy4Z8KFMJrbTDleQjyj/8DLGqX/XZeXHXgNTK0x+oqtygjqNeX95NN0iYPEKoOiT6pkBIp5VEXm5WUu/uJ4Qpbqr6PbxoAoW2KeGjmrpm3knzMOtvN+xonXfX95ZlLkh9PMZ6axxzTOtmSMDK+sWqdxpxFo+3pVsxJCr+jwC9s3zqcOyOm3ZSBNPOAcOHmvSRj3DOFHKQLBrU8e55TX08CUrWehW467ZyHcgdfYWqii4gC9y2X5Q7zmFiJ2vmN1AJSjVC34ucqGgaCJf+/TL7TbrZBmLpMvsb/GGgcFN8nJgjklnPhHyH4e4TMLCzFNNjFc1ON7iHOqQ/P6Y8F8uIvaU9uJrV6TXHoyVYe4ohd102mjgMGs5TzEBHx8Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(23010399003)(11063799006)(261026140227099003)(4143699003)(56012099006)(261021123027099003)(261009223027099003)(261022105027099003)(10067099003)(261021121427099003)(18002099003)(22082099003)(261026121527099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUtZcCtCUDBYU1NpWStURGtveHExOXY5NTRSYzBwUElpYUJ4MFZKV0JRbXNl?=
 =?utf-8?B?RWJITDlMQzlDNWNoL2dHN1ZVZ2xGMEN1bit0VUxYU0ZKWFlwR2NNOEg2bE1K?=
 =?utf-8?B?U1p4djQ1RVordFBaemFTSXZNSjF6eDJ1VFMxUlFteWtxQnZ0cmVjT1pDS081?=
 =?utf-8?B?R1I3dnRVQUNCQzFMRDA1WFQxNXJ4cS9yY3Q2aVVyK1pMVEI4dzR4Wld5RnlE?=
 =?utf-8?B?K29zSkIvb0l0QUxjSHlEQUI3NnRkSE9EYzNQR1JEL2p3RCtKcU9uVWZKd3Vp?=
 =?utf-8?B?dDRXdEhXT29BeG1YNzdjQWQ2aGVKMjE4aWRtci93ZWtVRWZGYU5Jemt6SUdv?=
 =?utf-8?B?WXo3amZxcGdZK1Y3NGZvblp4YlF0Wm9JNjBIT29FTSsrRkE0cWROSXNXeGFP?=
 =?utf-8?B?NG5UNGQ0OCt6eXZTM2ZJSkdObFc2a1hOaHZtRWllWEEwOXgwRjNQRWk5Ynpj?=
 =?utf-8?B?QTZQVEZFcVdzWkhHeWhaQy85cENPYUV1dkZqSlV0c1ZtTlFrMloyRTlHQ3J6?=
 =?utf-8?B?Zkl0VEkxWUdOYmdxMTN1TFNPU0k4TmkwOUNTWmxaNzBVK01XdWpGRkg3eUhC?=
 =?utf-8?B?TDJvMWZpWFdxMjYrbGFtS1VUb0g0MGRYQU50anlsWUZ5enh5K1JjUWVmWG94?=
 =?utf-8?B?c2VwUjEybkZhYzNwek9JNkxtdWQxNys3dEFaZXUyV0hERXdMNzVnZmtVK2JW?=
 =?utf-8?B?c05KZk02dVdBdExoajVOeFdNamhZLythM0NUTlBHOU80K2VqSlJNaGEyejVT?=
 =?utf-8?B?TUNSc1huVHRwWTJCaDByZFljVlhBUFU1b0gzV3VPd25VMUo0VnVKMWkwMXE2?=
 =?utf-8?B?UVppUnpULzRjSFh2Qld4VGNjd3lXL2NrT3dkMCtXWkxzbDQ5eUhDbVI0QldI?=
 =?utf-8?B?VHhhaGltMGlZMy91WjN1WEUxWnZsQzhIay9tcDR3L1JBT014TEwrVlVFR0Zv?=
 =?utf-8?B?MVExZGNrSlF5bG4xbHJ6OHpVN1EzTzN6VlBnT1FMaUVseUk5NHZYeXV5cUNU?=
 =?utf-8?B?d1pZVzN2YTE4cksxMkN3TkFRQTgrM1hBa1JXV2xsOWlRdTgydmFKZ05VRG5n?=
 =?utf-8?B?MHkreXRseUxkWHZrL2g2RDJhMEhhWVRrRXpLS3hWMnV1K2JRcCtTcEZUbVpC?=
 =?utf-8?B?S2tNbXdhVXpvN083ODI1MzIyb2xkR1lDR1QxMkJTejRWaUJuWUtUQS8zdGVJ?=
 =?utf-8?B?NHRPSXpjdFNHa0dTeDNoSlgrVm1XaXA5U3pIdEt2a3VHa1kxTCtDNFRCYzRt?=
 =?utf-8?B?aVJTbzdIL3Z2cE1CSWVXOXAxOU5oM0dBNWhwQlFUSUZQNzVGTXdrKzRiZDgw?=
 =?utf-8?B?czREMmNqSVQwZUVyc0NRY0dCL3FyWGFLeXY2VHNUOGprTWliUTJMc2VPUnQ0?=
 =?utf-8?B?Y3FjR2lTTGwzeEMxaTBqcGpqRGNxSloveG9ncFhQazdMOUpqV1RTUDgxNTU2?=
 =?utf-8?B?aWduU3Jya1RsYkxUWjRWNWNmMVdWb0hpTFdkQXM1TzNKakdPTXBFdDlrdEtB?=
 =?utf-8?B?eHRMaENKSEN5Z3RnN1hjZk54Vk5RT3N4S2FrSXZPbEZ2Ny9ENVFkNndmTXJG?=
 =?utf-8?B?VXMxYzhJcDVwZXdJUkNucWd3S3lPcDNZZGFoalhveFJPNkQ0ODlCdFlQbHhz?=
 =?utf-8?B?RVFFS2s1QldWOFBxOU5wczM0eTUwajNBVFZkMndlU3FmRVZFUk9TdkJ3cXJ3?=
 =?utf-8?B?dWxOVngzVHUwM285ZEduYTZ0YW1oakMzUnRvanNMWkVFQ3BRd1VxT0hVMzBL?=
 =?utf-8?B?WlNIWERSZTRmTWpheDhHcUtYNS9oTWRxYjFZRmFYQm9KczJYdWU1Rm1Ic043?=
 =?utf-8?B?QzZBNEtIeXpMOGFIanlnZzB1cU1jTVlLZWV5WXhMbkVqK2pEZnVEZkJDVHl1?=
 =?utf-8?B?WDZ6bDZLQjVodjVVYk5PMjZnVTNLN2hFRlNjWFczV04weUdlK1NVcStHeldN?=
 =?utf-8?B?WmN4WldFdGJ6MGhtTHhobTg1U296VXQzNnRYSEJKaTJEcjY2VGxsSTVEKzZL?=
 =?utf-8?B?NFNPa3VxM3dQd28xcWlqZU5pcDNSbElWVzlCM3NYUW1LVkpMRGkzM1RxMGdV?=
 =?utf-8?B?RXEwdFpVbUo3Z1docTBDUnRGQWduTG01d1ord3k3aVJaTzRKQ2pqT3FnQVFq?=
 =?utf-8?B?aVNSbmhmM1d5UW5NSWRxcGFwdmc2R0V5YzBzOUQ3NXBQUlhpS0Rxc0dtUXVp?=
 =?utf-8?B?QTZOUGdZTXA2YlFhdlRncnFQbkN6akVLT21QTEJrdWNTcy8xRGIyTUZlRmIy?=
 =?utf-8?B?STNrdVhnOFVSeFFzOWxhOFcyY1N6bmtOSUFkbzJrak5BZWpvUU1qWTNmVkN2?=
 =?utf-8?B?SGMwT1RNNlVXcUU4MGZWYjhqSENBcEswS2NDakxEOElvemVCOVJyUT09?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8dfcd5-87bc-4d4c-bcc8-08df34e40c24
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 11:10:17.2518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7UPAR6cKECcwo1jk/fi67n++FiaCNzsn4lg7LPg45fX7nMc2cb357qfG8La+Rk2LW9xWo/xM9enzos0dTZl0YJucb3hNIpYN2KdpAg72YI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15601

On 10/27/2026 2:27 PM, Frank Li wrote:
> On Tue, Oct 27, 2026 at 10:34:54AM +0000, Diogo Ivo wrote:
>> On 10/26/2026 8:33 PM, Frank Li wrote:
>>> On Mon, Oct 26, 2026 at 04:21:06PM +0000, Diogo Ivo wrote:
>>>> Hi Frank,
>>>>
>>>> On 10/20/2026 8:18 PM, Frank Li wrote:
>>>>> On Tue, Oct 20, 2026 at 10:36:26AM +0100, Diogo Ivo wrote:
>>>>>> The analog noise filter for the input terminals (I3C_SDA, I3C_SCL) of
>>>>>> the Renesas I3C controller is controlled through the SYS_I3C_CFG
>>>>>> register of the system controller. Document the
>>>>>> renesas,analog-noise-filter property, which references the system
>>>>>> controller together with the offset of the SYS_I3C_CFG register and
>>>>>> the state of the filter: 1 enables the filter and 0 bypasses it.
>>>>>>
>>>>>> The property is optional: device trees not providing it keep the
>>>>>> filter at its reset value.
>>>>>>
>>>>>> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
>>>>>> ---
>>>>>>     .../devicetree/bindings/i3c/renesas,i3c.yaml          | 19 +++++++++++++++++++
>>>>>>     1 file changed, 19 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>>>>>> index 08fcea89a015..381807844351 100644
>>>>>> --- a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>>>>>> @@ -96,6 +96,25 @@ properties:
>>>>>>           - const: presetn
>>>>>>           - const: tresetn
>>>>>>
>>>>>> +  renesas,analog-noise-filter:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>>
>>>>> I don't like this syscon property, look like it is one kind pad propterty.
>>>>> Is it possible model as pinctrl?
>>>>
>>>> On the RZ/G3L and RZ/G3S this filter is not controlled on the pin
>>>> controller's address space but in the SYSC address space (hence the
>>>> need for the sysc phandle).
>>>>
>>>> There are a few factors weighing against modeling this as pinctrl.
>>>>
>>>> The first is that the physical pads used by I3C are multiplexed between it
>>>> and for example RIIC3, so we are not filtering the pad but the internal path
>>>> of the I3C IP. The pinctrl does indeed have some controls for the pad's
>>>> digital filters, that apply to whatever block is multiplexed to the pad.
>>>>
>>>> Besides this, even if it were moved to pinctrl we would still need the sysc
>>>> reference, as the pfc driver would need a way to reference the sysc address
>>>> space.
>>>
>>> System allows multi pinctrl devices. your syscon can work as pinctrl provider
>>>
>>> pinctrl-0 = <&your nomral pinctrl>, <&syscon i3c ... > ;
>>>
>>> The key problem is if model is resonable. Syscon is simple, but have not
>>> good abstract.
>>
>> Doing this in pinctrl is feasible, especially since the pinctrl driver on
>> G3L already has a reference to syscon for clone channels. The question
>> really is if this is what makes the most sense, as again we are not really
>> controlling an external pin but something inside the IP
>> block,
> 
> I don't think so. Generally, PAD some property, like pull up/down, driver
> strength, some include glitch filter (capacitor or schmitter trigger),
> 
> 'renesas,analog-noise-filter' like adjust some capacitor at PAD, only
> controler signal (register) is not in your pinctrl region.
> 
> There are not analog-noise in side SOC's digtial part (Or we can't care it).
> Analog sigal generally existed in PHY and PAD.

On the RZ/G3L the analog filter is located after the pinmux, at the 
input of each I2C/I3C block. Each I2C and I3C block in G3L has a single
register bit that controls if the analog filter is enabled for that 
specific block (so we have SYS_I2C0_CFG, SYS_I2C1_CFG, ..., SYS_I3C_CFG)
each with a single bit that controls if the filter is enabled or not.

However, for the I2C blocks they can be multiplexed to dozens of pads, 
and these pads don't each contain an i2c analog filter. Rather, the 
signal passes first by the external pad and pinmux and then it reaches 
the intended I2C or I3C IP block, where the analog filter is then 
located. For example, the P2_0 and P2_1 pads can be multiplexed between 
I3C and RIIC3, and each of these blocks then has its filter at the input 
of the IP block, and a single bit in the SYS register controls the 
filter for SDA and SCL together. Then, there is the problem that if we 
model this with pinctrl with a pad property then pinconf would not know 
which block's SYS register to write without coupling to pinmux. In this 
specific case of P2_0 and P2_1 pads without coupling pinconf and pinmux 
we could not determine whether we should write to SYS_I3C_CFG or 
SYS_I2C3_CFG.

Then there is also the precedent of i2c-analog-filter being a controller 
node property rather than a pad/pinctrl property.

For these reasons I believe that pinctrl is not the best way to model 
the I2C/I3C analog filters but please do let me know your thoughts.

Geert, DT maintainers, do you have any preferences on what the best way 
to model this is?

Best regards,
Diogo


> Frank
> 
>> so I'm still not fully convinced. Are there more opinions on this?

