Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794429954;
	b=ouZsQKSjgwDNIz2YlmMINQIjn75Grc4GMNFJOMy2THYZ5tmVH1fLR8H7isLJ+RXDgCrc
	 +wtykRTAh07skufxG80KdtcwlMy2QE7dkllcIXVjTZxVPgq4ypOrKcWWAhjAVdhA0UTrx
	 oyQlPyDRgRWuj74pGDUAVawSkHuF+73ysWNL2nsbOc+khJBlqfd9lkpNPnUhlXac6rHM4
	 emyVu49JjChpmSII7QjTY9+4QkNvBIMbNNdLxpbRfWedcT/bVY4p3ROxaB3rPTa3DOXKP
	 Yl1Sv8JXqO0OO/3frGImN1SLWYnOElToWGPyGDeHyd81ks4AL2sFB31vtkvHjIoVzfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794429954;
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
	bh=bRVtc8Q4KeeDaHK7SEgnRYHaFxC7mkH7fGW9ESu4wSo=;
	b=m12zGpeS0s6Lfi5rh6qJ7s5lVGnFy+ItEy/JtXMKeg3eP9yziFEToE5XLYdBywBtlZky
	 tDFjcid+miBDop5XdR9WPvfGep5nJ68s/GV/Efkl9x16j3QRRwtv5/l9Vv4v2wUNxX/oY
	 ePSjtsg7pLkyirpCkf55iKJjEv+pdXY6vE4NNnMrnJDoSS62o/2Zf7Z4oCjV3u4/j82YR
	 L24UHIzBA58uixI9LVmsWSNv2a0AOKTBavdPEKSSkcGA0vSI0tBtw4gddGeNlgVGRs8pj
	 cK5Z6q0DG6fE2nkd6Bmy9jbGcRmmBdjSRhV2dpWP8IEhAQ3hkbd/Zay+cTawfu6Ti8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JQz08l8n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.28
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010028.outbound.protection.outlook.com [52.101.69.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2883C606A31C;
	Wed, 11 Nov 2026 20:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2883C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JQz08l8n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h77sYAoqz0Uey0qoJIY5LG5TeMJ2xMBdHc+ii3HtRvcKfDllchzd41CG2Enn5j7973Abir4H3siJvGghUj/++TlKaKtHVmcGZ0Z05lf6FY6TSIVTugMXqgXme3bktRped2i5HE6XapxnEQ9J2uli+igr9LIWYyCoBsqlKj4w+w/THBb50KdHjdZmrTq2b0FRvmRB0eu/M86mNEgMHfCW4rqW+sIMZqfMqs1OlCSemkZnGtoySFJtLc+o30xSzHwopPwQGWXC4vLgYPFqq7/tniugj2WDUHKdKdefJlugQoc+Et6dpuvDfxFIjmn9bGpBEKHl46+a3nJmbcAk9W7Lyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRVtc8Q4KeeDaHK7SEgnRYHaFxC7mkH7fGW9ESu4wSo=;
 b=HGUvYqU6PBOO1IISiWTJwzNnADA0+nkarBrcL3GP+iOmvXSqGZC2wiSQqOApMggmrxzeAmlKBZydL31JOK7J/SAPYRTSBKkEzFaxTzB6AIM8Z8yB4ogQJhoRrgvjZublmxiHgvypZ4ei6G5CYekpwp2tlrx5iHuFb8SjoPDT95nQsa/qjQSQQq+PQ2idmJcOeL59pz4HYsIbvvkn8UZ7S5nlHoj3eAGk9ygNM6MH6gJQkbb4r5bqvhCO0U0nN9VB2zLXTVTU+ePYKc5FzomfA0qPXy5mstPJffpgsM406rvS6HS7Ax70LpNxrOl6q5Qyv/SkUkZmu8dJb2xbv5Q9zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRVtc8Q4KeeDaHK7SEgnRYHaFxC7mkH7fGW9ESu4wSo=;
 b=JQz08l8nCvQ4hejI15M8CtYIfXf18wl5ECWmmiACjGsqIvhVibavm2WFu7/4Au+oy50gwDB+Lff3RTrLXV/RsM2WR4gjZOv0k3MV/71qjytLrmNn2ymq+NR84ZMLd8973E8rIdUEN4h2P9Ahl14XV0UQPUxDQ02s+MNNrU0qg0d53/CnJf5Ike9QpqKY+Cgi7ocJtAUOhuhIN1ng2hYxoZ6X9FPN+nwxVli6CrG4+Tkb/xNbBbUtbLg+tzfH7SUJqbATBU3OG9/QBxAnld50DkPNnKtHalPbo2y8BHdcE0saHhMwj9d4nadkcm6ptYpSYtJwiq9cIOS7Dd//mhGZwg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by CPH1PF4CF7317FF.eurprd04.prod.outlook.com (2603:10a6:388::3c7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 20:45:46 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 20:45:45 +0000
From: Frank.Li@oss.nxp.com
To: Marco Felsch <m.felsch@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ARM: dts: nxp/imx6: Drop unused kontron-samx6i .dtsi
Date: Wed, 11 Nov 2026 15:45:38 -0500
Message-ID: <179442990779.3940192.16826960763818771165.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109161713.3618477-1-robh@kernel.org>
References: <20261109161713.3618477-1-robh@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS1PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:8:243::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|CPH1PF4CF7317FF:EE_
X-MS-Office365-Filtering-Correlation-Id: 18ec79bc-07f2-439e-4d85-08df4034c274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|19092799006|1800799024|366016|376014|18002099003|22082099003|10067099003|11063799006|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	OqT6pCyw7B+PPmIq45jUnzFuKE5VLtRu2VHjWpZeCeCEBtYsBPwFURT3bi+DeAokEDrfNKzP6A3lMBlHKdZ8gHPn6WW4CnZK8xdtoFgFrFDdEi9TQX1LaZSuAhGFxevJrMz+Wm/OFNahxk10CJBDpC/rA3l9MoNGgkwwIJ7EBILl/PPx4mJddgVt4hvvE/qpKff8KHT4S/y9SGZYFahsbrwDh8mCHtRmlqHANoDsqVAFPo1FXC6k7xjucqDeMlof9NdZSiit+EBPIljZRpZwyRYdYzvKoAixmr+DJ/WE0t2GSDPFzeuRQhDCRmOc8HgXaSvxBBq22N8onzOXSqImc/a2OxZu9uJ91HvlmHyyem/9yIXXwoSuqrnB+qxPN0l3hSlhDVZMxP5AaI4gnpLn1eFX1snPC3rHhUKg3M0NX3dHIjH/jtZJoql6MlDZWv65Vg7uKsVqLSd3pebXP5e+7Gr/jQ8zUwlMj1cBfPrwo5sUJTdVcNIWja9wk58eK4jGhqOJfDohCTnntntcYjzfWo18ODJ4o3hDNUTBPYxETWsp9LrR8cavQJ76wNw7W6rP10vH3DneebACNGKfw3tBja0fr9rkiLNMgtvT2DG+LhekKGyhSdqj/9a8cnt0vkArEfwVDUSBGd/iegy51/iL0eu/H+qzUx4jJLYyYct72L8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(19092799006)(1800799024)(366016)(376014)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXlWU3YzOUZJSnFtREx3T3d3TzFXRThjNG5LVUZZa003L1N6a2U3N1FiMlB6?=
 =?utf-8?B?blBEUWUwcDByaFdYMUhzaC85VHJLQnk4QVp3QWpzM0lObmhvcjBORHJPSDJi?=
 =?utf-8?B?Ym5PUjlSUkM0dUtnYWZZelNyY25sQm53VWtodWNVMU51cUIvdzN4SFI1dFhk?=
 =?utf-8?B?cGZab1p5MHBUYmNNM0RrcGZUMGJpRzl6Y3ZWU2NOei9Xdm8zVHZxeDl4a1Jr?=
 =?utf-8?B?Y0NSR2xLUGxic0EwZVAzZ1pXeC8xb1FJZ2VmaTFjQTl2TjRQYURhWWd1T2RD?=
 =?utf-8?B?ak9lYWpzUW9YTnJSU2tQN24zWHVpWnR6NWRWOVVYUllsUnRBNzBHQTM0anNL?=
 =?utf-8?B?Qm5idWg3MnFldU4wL3ZhRlRCSWpIOHVJd015WEJUM2ljSVBQSjIzMm9MRFo1?=
 =?utf-8?B?cEZqeG55YVpOZ2piNTByMFdqaXVRU0VRODNDc0RPb1FqTjJVeENNbzVzVkpC?=
 =?utf-8?B?VWVMNGFuYTRIMzEvVmxqVlQ0U1N6MURUVTA5YnFEWGNMUC8vLzBqT0k0SEll?=
 =?utf-8?B?U3R2cG9rdXRmbnhoUmhmVE5wMGgva1JneHV4UzJGV21YeUNnTy9ER25FZ2t2?=
 =?utf-8?B?ZjZ1dEd5TTRCSWNvZ0ZwSndiVDR4Wm92ejQ4TGFxYjFtVDhvL2ZYZnJkL1V5?=
 =?utf-8?B?b1Z4M21HSnIrendJNzlrMTIrQVRZMDNWeE5INUtGbytLUkZKTmlLZUNKZDM2?=
 =?utf-8?B?UmROUUxVd0I4SVZBV3UzNGdwVTN5aDNxR3RzVE1ycHA3Y1BxWEtiUzB1bXVL?=
 =?utf-8?B?V1Job0NkUXZHbEdBQUVlNWI0cjdKeW56Y25LME42Z1B0MXkzb1I1dDVIZHo3?=
 =?utf-8?B?N1FnQnRCaU5uWmJQclBGVndqREdZSFEraXlQWVE0K1lEdlg0VWJZOVpwTVBa?=
 =?utf-8?B?UGxOZVNSb0MvZ0ZyQmFWUTZsY3dwaTJBR2c0Q0k0emZTYTRiV0t6bDFjaVBu?=
 =?utf-8?B?V1plVmg5TTRCeDl6OG5IOU1HejcybDZJcno5QVVFcFVIUEhrYUNpZUNvMEJq?=
 =?utf-8?B?b1ZLaDFXRURVTFJ0dVRsQURKblduSzh4Rm9NcHB6SkdhMGtYZEN4NzdZckg4?=
 =?utf-8?B?cVZ5L2Z6MGtXbHF5OXFCN2pIUENjSkxtZDV6WE5YRDdnYXY1ZFlteit1MGNx?=
 =?utf-8?B?cTM4YUJDMzNrY0NKWHVQZlJzc1VlQ28yZVV3OWZlUFdKb1M3QUNGQ3Z6NWsw?=
 =?utf-8?B?cTFEVERjaThqY2J0ajdJTmtBR2lQdlN2bW1rRzNHam5QcVNqTlExOW5yRU5G?=
 =?utf-8?B?OHBESGVGbXl1WmxiLy9RS2l2SFlZdXRESlZ1VGVEalIvTUJVS0lYbHR3TW13?=
 =?utf-8?B?Zm9lRkxzeVlsc1I3MG5ZU0FIbTY1c0VaeC9PVFdnVXdFZWI1SEVqNUVkN1Fh?=
 =?utf-8?B?UEU0cWxEdEtZWExxVzlCUDkxSFdsRHk2NUw3QTdSS0JNazNEWTdlbVBsdVhU?=
 =?utf-8?B?WHd2bDRMK3lGQjlUSTVva1A3ejBIKzZZRy9mZk5YODhWRHA0NmNMS2duVklx?=
 =?utf-8?B?a0FCQ0lGZUZ1M2xQa0RIVXVobnZZRzRFNUh1L2JYbThpLzdHWSs4MkdvNjZW?=
 =?utf-8?B?N21DVTFSRFZQVlFNV1MvUkJXUW10N1BLSFhNVlFyM3NLOUtiamxVdzNSVndx?=
 =?utf-8?B?U2ZzK2dTODhDNE9KMjNRc3hOZTNQMDVGOFZHWmozRTVjeVVCeHJubWZjcFhR?=
 =?utf-8?B?bnZWVmVkZmtnNm9MOEhiNStYV3prOW52R1FVM2lYaWhsZjVwcTZXVjBWTGVq?=
 =?utf-8?B?VFFyanlNUHhHL0F4VGVISDBPSWJzNTliOExvcU90VlRWWEQ0TEFZL3hTZjVD?=
 =?utf-8?B?b2hiVFlwQ3lvR3JOc2JXRWNOQlZpaWZOUlBrMXVLK1RQQzZwTDFrSVh2dVJB?=
 =?utf-8?B?Y0Irdnc3YlJHaTlwSmo4UTJGZng0dnJVUmdNakpjMEp6bkluVHl6RjNCb1pu?=
 =?utf-8?B?dCs5Q3BNV0xDZlJiaXNuY3Nmczh4OE51QkZub3FVZVZtN0ZxS2RzNHNnK0lC?=
 =?utf-8?B?U2JYL2pMbmphREZLRVc2cUR2dk5ORkxEaE1YK3Vkb1g2S21GakdOU1ppWTJU?=
 =?utf-8?B?MVREUXBjbzllSEphalZQdVFYdTZXdEZUdFBsbWh3RXUxelV5OGpOVldDNEI4?=
 =?utf-8?B?MW5qbi9tdC9jdHFnTGtXc1VRalQyT2pFZEIrZS9ueUMxSjJ1ZGV4eDIxNGdD?=
 =?utf-8?B?aXlTckZFektWMy9WdkFpaTdvem9Pb1kzbnFiOVk4eXo5bFNWQjhIcGRsSFFa?=
 =?utf-8?B?QU9sc1pHUWg4MXRVOGRQUjFPMDV3SjFZUFZFQkVMZllDREJEeGdRSjMybkRK?=
 =?utf-8?B?MGN5eTl1M0tGd3hlZURuczRvMjFCRVQvcW9qb1hsK0RHNUIzUlRRYmszbTVr?=
 =?utf-8?Q?kGvEy+yM/+vpDO6FX0+sXG9VuXc0LvTE6A9HJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ec79bc-07f2-439e-4d85-08df4034c274
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 20:45:45.5652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWKWrKovy7iUxTxURnd1UiHjwZfE7jh5TvGW5puq6qrUHY1yXZStB34NXz1x/TeUv3NKzEMbfrqmiAL7KdeBxlm/Vy/QzFBewGsdJJcwYrZ/XxgFDTjnXPvAemYtgYOL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPH1PF4CF7317FF

From: Frank Li <Frank.Li@nxp.com>


On Mon, 09 Nov 2026 10:17:12 -0600, Rob Herring (Arm) wrote:
> These 2 kontron-samx6i .dtsi files are not included anywhere in the tree
> and can't be tested. The kontron-samx6i support is already in place in
> the imx6(q|dl)-kontron-samx6i-ads2.dts files which just include all the
> necessary .dtsi files directly.

Applied, thanks!

[1/1] ARM: dts: nxp/imx6: Drop unused kontron-samx6i .dtsi
      commit: a9fcef3b8ea97079c1a7393122fdca796aad3117

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
