Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793901253;
	b=Ic621bZg1d0hLIoYD4sTSzSs+6j/hN2cwYnondsVaqMYKTrgy96R6Kq9WIwATFRUhq1F
	 e/UQdpPo+D52CygOI27MCxTKXofvvvuW6vCKJ5bGxoUUieHPOkrNCDoRHzixk74caqwjs
	 bpCntoc5Jge5zKHYatT2KAOjcx4nb201p/lJ05CKVnrOTkgZ7Dbj24yaciLVaLHtKTW1t
	 3PHKcIGI+e1dFCgamwjWSXeqC8IwcYZArA87YVSiSWbG8f/e/lPenrU7h6SWlll00t8D4
	 2hTRxDIgmN7Yip+cGDH082WVK1Ty5K0gFzzdfj31IT0pvsuUHpJ3I4Fme61UoSgF+Zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901253;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=0uD8aL7+RAJ/deYdPr59U2WQVO0lHBNKjIm1LBZm2hI=;
	b=5QGxQB2rqe+YicqVYqO0vlv8LA3ETMRVP8rzjufrs31KbuO5Z2+pv4SlGKoDj4yoc6I4
	 um0GWiMVlfq0J+ODV0S+t73IwTHDl7UxMsbXiFRCmDvbpgtMyQZx72j24K+3Zt9StSyD+
	 CRfPpRuPSBGAC13QapMfNEhsaUrnh0OgkVAaPPriqfSnyoyGKoW3J8sY8tsg68zvKHYPA
	 n0GRQNmXLsfqhtRj1kxDZJZeC9qvJTV9/5DXeZKd8w2F8wwBkFDMc6lgLCsPk3PJYjegK
	 UPNSMJRHnvU5/u1uMVMj65MxYbimj/3lEUC1GGCZ4AaqcPP4TALAmpr/3uQMY+TtPQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="N/DRJ0pw";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.61
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010061.outbound.protection.outlook.com [52.101.84.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5304B606A328;
	Thu,  5 Nov 2026 17:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5304B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=N/DRJ0pw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COnD63nOO5pLUKhUmNVBpmyM0lnAbIKuXRR8vLHKHTOiTtdEnn3ysX+dUzXTo75a04CgmR7mLIrTRQHxO8nRzuR/TJc4KBcL97Aqf3Tuyb2FpDeYxl37HyP/bdumuFOzijbdgSSyxjDAuD0iMWx/a3azJYiKNXODwyhB9LnQzM2aTmMXzDItHS4RcDH8PJR32CJL/YCikHe1drr5Kyqr2uxgRg4wTDJTVSCb8tKOIE5y9yie4PSNyajWiklE5oiX4R8eK6CfDZeaO178Y2EtL7hvpm8a74WOHML6IB9ySRS76RgLoTcnjI8t7fJgceyOIyXYdiw/SVTvFa8p3vsTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uD8aL7+RAJ/deYdPr59U2WQVO0lHBNKjIm1LBZm2hI=;
 b=aGNF6k1qs65KI60lNFg6mBi5AOwV0u91jAEBhwxuWe2670/SsxaV5f92hK6lgT+IG/cnnhzdmcyhiQJJSNduZS8GPNIbkzyAgkMHCbunSBoQhpKMt0urk3P0ETZJF/3ZnIlhQ9DIerMacagZy6gc6ZUg0yUPNR3nGY+xWHFlBmIUgo1bfKJ5LUow/NyvxxkpNe9FQM0EyRa9XAk6jvJyjvx7EnWjvE4Jo2QGlMGqDlPh4E7VqFOessObAjFwyiuaWY2uiW3sL0PksatAExPelnBHCpKw8SxJ5pTbrzI9HRozRHHp1vVv7Rf+Mp71TZi+gtdH79LCbO7pf3LGgz++cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uD8aL7+RAJ/deYdPr59U2WQVO0lHBNKjIm1LBZm2hI=;
 b=N/DRJ0pwUN243xUmKjv3fbiYMSYM1kNgGj6NrDrKwdxpEc59Z6+aU1vsheYXmIubrr4EjklFMZ9hd2pe7mIR3jAeIomRNGJbuLrQkjFLzb1qNjenBLA4HBLsOEAvbG4SO/qp0xHT7/I1T1GYb85I+ya2dzICeGdQTA1++3XGI+MK52mn1bWPs+7mAlzgwUHDVeBWuXUxGqJzPJJuVbOPqYs30y3WZqNEaIveP4qbTMhj9LWYiaC7H2G2ZHIFMoKrM8BKjlV/XaCYOMb/a0fw0FFYiP73MbNvnkypOgLS7JlvJev9i4OJrCJaFDDfKEYzxt/1wUV9AuDxyHd0sA0eRA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB8973.eurprd04.prod.outlook.com (2603:10a6:102:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 17:54:07 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 17:54:07 +0000
Date: Thu, 5 Nov 2026 11:53:55 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Nate.D@variscite.com, Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet
 LEDs to carrier boards
Message-ID: <auzCs1MXC8gWXtu8@SMW015318>
References: <20261105101739.10614-1-stefano.r@variscite.com>
 <auy-OW_td7N8oHK_@SMW015318>
 <auzAh7404GAsY-U0@Lord-Beerus.station>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auzAh7404GAsY-U0@Lord-Beerus.station>
X-ClientProxiedBy: PH7P221CA0019.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB8973:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da64f2b-ea8c-4a6a-bb12-08df3b65c9f1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|23010399003|7416014|1800799024|366016|376014|261021123027099003|261022105027099003|261022075727099003|261021121427099003|261028144727099003|261026140227099003|261026121527099003|4143699003|11063799006|18002099003|22082099003|261102123227099003|6133799003|10067099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
 NmPtf91cQn+YGMw2TLjsqSLPysyNaLohaKj+VYgWrBbWckDdz/FQT4Bwh0mqaGpkR/e6P9QnC2o3V1rs1hAs7RVjLzmNCN40WOj0FKeutT4nwtBlVeoo+Ob8I+IRMtclma9pBrroa0Ts5MjYxHXBfbkt++9AS6yG4INEgUx7AxiwNa/n7nBnapaEYgXWaQpIPxcKfHvRF7hlRK0qUUShXqjeWo57qXHZMc4agrFnO5OS/fPbSYSFcIN7NpTzFVPX0+Ot2c74GCaRbd2vkCjzWGFdHkiFyuyCzvgxwq2PNQYEd/gY+5TrY2Jcg9nyhKhwX2vJxtCbWHYQ6NYNvfSFqVdEb7dM/fbLxFVmhbyKdwt8YY1JS11QVutgqMItKX8OZA94naA4VjjNnjGZXRjgwzL8ioEkhWxQf5mkkwmBx3/gWJiON9uVy8rGDQZT1RJkXHSN7O/jie2xV3jAFLr1JtY13PKvXEduNk0ngUcBK40cDve/GrKWGY+GCeHCnH0ZadvjSirmNYui+yTiFuaZ29lwp2JizkTEkm0dj4b1+Ze4NlxXF76ebtmaysP28cQhJDxPHQJXdmg393aCQoJx9c7ef8FL3qKTiCaeuP1IujZINQJnIV2RoDNfPHqLiXhA6VA8kD0YeF/JGHMHLlO2QNGGWPk/bfI+4X1Um7AqcUY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(1800799024)(366016)(376014)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(261028144727099003)(261026140227099003)(261026121527099003)(4143699003)(11063799006)(18002099003)(22082099003)(261102123227099003)(6133799003)(10067099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dzJjSEY1VXVQT2hXWks2YzlXQTl2V3hDREVtdXZ6Zk5vNTVBNlBxbnE4RWEx?=
 =?utf-8?B?T1lXWkJuM1lzUnRScFJQMmxSOThaTThaM1A1c05UVlpFNHJhMk5RcE1pV1Rq?=
 =?utf-8?B?ekdKMGE4N1lVbkxKaWlCd0pKVjhpbTluNEFSeXF2TEpLMVhoMnMyZWoxZmdi?=
 =?utf-8?B?KzF5aHFoak1UY2l5VFl6V1c4SEpLSWZaQXpvTVE0djlkUENYVzFjbWY3dWpU?=
 =?utf-8?B?S1BONjdkM3QwaUhmejh1SmgxMXlwMUFXMXJBV0VwR1hnMnhKSGpDYmdQK1F5?=
 =?utf-8?B?Um5TV1haQVo1Y0FxVWFTM01FQU14aGxUbkhyRUtSYnJiVy8wK1FHOHZvSFov?=
 =?utf-8?B?dloxZEJzK2RLa2VKeVBCV1EwNm56ZHIvbVhpZFZCamtZWTdkaVBxRUxoZXNs?=
 =?utf-8?B?ZjJkWUdvanZBaDF2bTlNa1hkaGgxVFJVbjZtWnFnYkIvUE9UZXJGZjk5SlZB?=
 =?utf-8?B?OVZMQkhpdDgwQmhlUlM2NWRYcTN1WHFERGUvZ0EvR3JuOW4vZDg4MUdQYVhn?=
 =?utf-8?B?VUVDeHhIbW9yazkyY3NVSmxzcU1Kd2JPUUUxVllzOUMweGUwbERkYVF6aEo0?=
 =?utf-8?B?VTVoWnFNd1dsRVpjL2dnQzJPb05wZWlUTnhVbFVLYm5LK2lhK1p2NGhVbllL?=
 =?utf-8?B?dC9uU0wrMVhjM3FYc2xVejgxZHFONExOV3RUayt3bHREb1MyT2dJbmZBclRX?=
 =?utf-8?B?Mk5EazRmOVo1N2xaYXV0eVpTOG1XS0NsWC9GOWRCUkQ2L0xZcnNlSHJxYWlv?=
 =?utf-8?B?YzdWU0kxaHJlbVNnOGxJb3Aza3MwNVNmVUZnL1ZjSXdhWWFkTUhBdEtsL2VR?=
 =?utf-8?B?UXJ4QlBITUhqbUhVelJtdEpjYmhSd210NXI0cDdvSXpiWVRWbEhqbnR3aUpo?=
 =?utf-8?B?WHMrY2JRMUtTODQ0aGdIVGpwWTdqbVJYaXhQM0pZODVqNy9xU0hqY3V5VDFo?=
 =?utf-8?B?RzNtVGdGUVJPZXJaamRXdFpmaDBmazFBLzFCR1BFS2ozckx0Smh4V0swZHpw?=
 =?utf-8?B?UndwUm5iaFEvMGRKUFgvcHF6RHp2UEFVL2tkL1N2RFBoZHY3SGR2d3lzM1NK?=
 =?utf-8?B?SitoMGtzdXJsVVFIYi9GR3VQaVFzaWNtUVJKM3ZxKzU0bXNvVVJuT3FJbGxN?=
 =?utf-8?B?eE5BZ2l4d1NVbmNQaE9OT1IzOGY3c0xOaHhkTU04WGR2a1UrcjhjU09ycVlL?=
 =?utf-8?B?TGFURWxoYTEvcHJaazRGUmw4VFR6K2dqbjBRQjg1dTlUUHhTWnhSVVJ0Rnl6?=
 =?utf-8?B?bzdtWjZGWUdyRklhWG5WK2J1aC8wYzBUYmtOKy81am5MUHE0WDB2VTlzTGxQ?=
 =?utf-8?B?SitOdjZicEpQUFlkaFRFTm9vSEN4VnRaWnQwZGt5MXM0a1lvdG8yMU93elJY?=
 =?utf-8?B?Z3RKWCsydEIzbzRYYVJhc0I0U3NheVdBNzdvTnNsd0NRRU1VKzk5RTEzdlJK?=
 =?utf-8?B?RjBjcTZVVG1HbkdpTFNNdzd4eTNpVncvTldVbEFHanhtQzd5TDRaSkdmWUtU?=
 =?utf-8?B?VDZPYzROczlkMWUwaldaRlNKRXV3bnBJYmw2aHZkT0F3QWJ6b2dYWmFSQlJm?=
 =?utf-8?B?clNYRkJSTFVmYmRvMmh2QWcwRStlemxjTGVyUHIydE5SZFFkdkpudEVwTk5T?=
 =?utf-8?B?Y054Wkd6SGVGditLL3BJckhuV2ZLV1FOZUwvYVdwU1lDblRMMDN1TTJzWGlD?=
 =?utf-8?B?NU1tOFdtV09rcG9xYW01cVNZT0dIMHVKM01NWGtjaW1sOS9MOE4xZVBNN0hn?=
 =?utf-8?B?L2ZNQTNZaDZnb3RYTzVDNGJyR05wLzdNck14bnh0amwwbk1SL0tMbXZ1a1Nr?=
 =?utf-8?B?UnBIU3JwMWdoQkZ4TEZjK0pvZkxiNFUzMzhwZy95aEZZTnpydjVjQTViL2NM?=
 =?utf-8?B?bXZlWjlWczREVUFuYi9WMytvdm54aGwzSTVMM2o5NEFCc3I4anBwUnFyNXdB?=
 =?utf-8?B?ZUpTZkJ1UnMxc25FYkt3V2JhMzdSVWh5Rm1kK29iamx6eEJoNUUxWlNUdEti?=
 =?utf-8?B?TE9tV0NJczZzSnBCZUpKa1J6YWhmT3JFdE1FZnl1OGREZ2RsOGkwUmNRSUVm?=
 =?utf-8?B?RnlweVRpRVpDQ1BUL2pQaTExYXhsSXlkVlNSTWFWemhhemx4OE1ZNHBaRmRD?=
 =?utf-8?B?K1ZpcHAxMW0vQW9UTVRNUDBZL0dsY29SbHJxM1dwMkRyYjBvd2ptS3E4SC9P?=
 =?utf-8?B?U2wxb3FMcjMrcERxWTcvcHB5Z0lHWkRoY0pCLzIyV3A2TDJ2dzVud2ZWZWpw?=
 =?utf-8?B?dkYyQ2JEdVhRdnpZSGhmTGRuU0FGQUhLaUNVTmRocXE2dGdGU3lyOUZmL1Jx?=
 =?utf-8?B?b0p2RHJJZkpWMWNNYmFRU2FlV2tkS0FiVHVETk5uVjQvR1o3WHd5NmJSZlBo?=
 =?utf-8?Q?/EMmhQVkermqt1m4TQaW9+lg913Zl6d8sAAbY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da64f2b-ea8c-4a6a-bb12-08df3b65c9f1
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:54:07.7701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRQ6PRvzgEY1GYAAD/Y58jpkMmwq8wLZM4k6S0ZzkUpRHkzG/NcU0JECBxD45ByyINncm/Vpjng5Pmz3t2IEi+LLsneszOpx/R/BxYkt9a3vlub7cegh2hMn90CwLbQt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8973

On Thu, Nov 05, 2026 at 06:44:39PM +0100, Stefano Radaelli wrote:
> On Thu, Nov 05, 2026 at 11:34:49AM -0600, Frank Li wrote:
> > On Thu, Nov 05, 2026 at 11:17:39AM +0100, Stefano Radaelli wrote:
> > > From: Stefano Radaelli <stefano.r@variscite.com>
> > >
> > > The Ethernet LEDs are physically on the carrier boards, but the
> > > VAR-SOM-MX8MP, DART-MX91, VAR-SOM-MX93 and DART-MX95 module descriptions
> > > include their LED nodes. Other carriers therefore inherit LED definitions
> > > that may not match their wiring.
> >
> > what's impact?
> >
>
> Hi Frank,
>
> There are two main points:
>
> 1. The SOM dtsi is intended to be reused with different carriers.
>    Defining the LEDs there forces every carrier to inherit the reference
>    board’s LED configuration. Customers then have to override those
>    definitions or explicitly delete the LED nodes if their carrier has no LEDs.
>    Keeping the definitions in the carrier DTS avoids requiring customers
>    to undo configuration for hardware that is not part of the SoM.
>
> 2. The Ethernet connectors, LEDs and their wiring are on the carrier.
>    Their definitions therefore belong in the carrier DTS, while the SOM dtsi
>    should describe the hardware on the module.
>    This change makes that separation consistent across our boards.
>
> There is no functional change for the existing Symphony and Sonata boards:
> their final device trees retain the same LED configuration.

If not impact for current user, needn't fix tags to back port it.

Frank

>
> Thank you Frank,
> Best Regards,
> Stefano
