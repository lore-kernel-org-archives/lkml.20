Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793896933;
	b=rL4jT7gzXCiHtP3ujKJ8hdPS/JGsZ5isOJW65Cij/00kKTdlyLg8e+UD6JO/h3N8d6GL
	 5MYeRTUoObiskM+hHR5Jpbp+kabKX2z85zqNNNrJp3miNLtI0/HxOe9hgpvZ2gmoy7G4V
	 /fCl367gWSZChDNb+xPrnQSKKvb4FVSlE4FDPq0KtUHgakyeLKLq8RnZltU4LilVHUc24
	 nYUBaDJ6U+JfUZzunK6FFo9qsFtgdVEho4tVllDmgtrMtSYIeqg+Seu5XdSltnD0Sr8P4
	 bF1Yy/nn+Bq3sDtDJGULa1cB6eSyZkNp4bqYa3mELNQ/5Zvh22JFRAj2ddJtkMuYMNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896933;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=TUEJjS/4xyIBIR2qg5puCqJFivV1WRmuxtyp7SKcCjE=;
	b=vIjKkKfIzSa9WryWNatKO1WGkiAd0XUSJoJNjwfzIJjfJonJ1VkcY9cA3+uSLyupiW9f
	 bu2h53DTc3CF72KutzFUmKSSqs2dsIhHKAaXc1NiQywipQpKQPhOFC6lW9LUXl/OlhV3a
	 wGs8T8VflXuxh1umhCXUL62TkiRNtfM6AdHuh2nwozxphWOBJqTf5qd7RoPSQomnNNNHc
	 Rvr++97rHctkOXwJVKSnGrj/u53QihYevM2jnjZ8BDbl6CMehhk3qYdWfXkW8bCION8BA
	 6llVxze8kabQesiwefCvngevrgc2PdohKyoRY7KHXSrYEr1fofAdNpvj7Vrs1Mlea0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.35
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010035.outbound.protection.outlook.com [52.101.69.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D05C606EE9D;
	Thu,  5 Nov 2026 16:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D05C606EE9D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcOmM2yo40w5ZSmzW2Um6aKTw7m41jHWIIi+SX0dydWDCeRQUuuGKVoQonqlsiFyPBwkwZVHP4RPcew1XT7HV0/4rIJx7wYGspOpLRwy3at7f0QUrEphFO0kbKuHyTnqSuaaSXffn8r9Dn20G6D6Tr+cPtRVn7IIQql+KiPU1Jc45TFu03KQ22eDI6U0iV8EiwLn+dd8dev8hylIRb+LXBYi8FzXcjYk1WGxThV3/2MaQ2Y5eY+qdSRe6WfYW+kKuzgU3/1L9M+rj8t/AjXjoIf2rq3FOJPWVVo2nqwwY+g1Aoyd/KWvzIsk1n9chan8L/QESkTF3sgtAtpBh5TZeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUEJjS/4xyIBIR2qg5puCqJFivV1WRmuxtyp7SKcCjE=;
 b=pZReEnt2/6+K2YvyuD9uAS6fh7mA/k1Wu1s6niYX9q4J7E6ZwhjMWrA9l+hGdwWHzCQ6qlSJkOChEt9DG3HSXOsWqPT8ncgAYU8yADl8BLYLkf9Hhkvisi/3bjvVo+Aly6oUuMSzUlgISdgt+wh+6diFIHSzjC83m2iw2Ea3TJ2+xZ6Fa999E5kUAsLMq4wvocF8sbShU5qJ50KE6bFMdD/087px1YtI8gOudknnC2L8v3V1PJ7amIYIfZ/oSP06c3J7FHiZZ/ETe/Pr5/JJoF+2sDbKjw7+NqWPPkQn2a1DT5WEJykWciK2h09SqU9d3hlIAyob0W9LkfnBw7HB8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUEJjS/4xyIBIR2qg5puCqJFivV1WRmuxtyp7SKcCjE=;
 b=q/FGiNPv7CL+eN8FODeoU+E3YKWZbsVavof4Xvfpljo1InQ+MY008jP2/eOBFY7SZV1p9GoWBdZf662e+m1j/3h5AYjM4qtSzMGj+jHkLF1cFfs7bnBUTjGGqkHhGFcklSSjuzatm2jDd5a/cWBscUWVHGA5F+djnsJ3fY20tdB8iAvQyBUn/Zlonrp+OI7fx0WdxIKOqqi1qXlhXx8RUUYJY7YH/izFnjjZxFTJzUrCrk4oD+CLL6L5195Bc9wx5Mav4Lzx1Ec5ORLYBbaH5gPS7dV6GtDSUpEHNr0BlilFsqjK3aR16Pt+JL9P96d7knX7Ez/AHAumm5OFK14+VQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MA6PR04MB445650.eurprd04.prod.outlook.com (2603:10a6:250:58::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 16:42:10 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 16:42:10 +0000
Date: Thu, 5 Nov 2026 10:41:59 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
Message-ID: <auyx155Caf3kwT4h@SMW015318>
References: <20261105144920.2796623-2-robh@kernel.org>
 <krvg6bwsueypasvt6fqszh7itqr3gu3qsqbji2ernqqy6g3t4c@b7hqenmaugik>
 <CAL_JsqLETyrx7ew0zirS9r6+3=GEFaRE0g96OZHYwqjxMCZKcQ@mail.gmail.com>
 <hvrfbvmyzsa6npzh6wpa6o3xxygslqc7g5ukt7ph7ty4povogh@wge2z4rejnf7>
 <vvsd6rchs6wff2n7zxtcarxcvbnuxd7fx632xogm6hrcxxxqsl@dp5dvof3qa7c>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <vvsd6rchs6wff2n7zxtcarxcvbnuxd7fx632xogm6hrcxxxqsl@dp5dvof3qa7c>
X-ClientProxiedBy: DS7PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:5:3b9::34) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MA6PR04MB445650:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca0eb13-5747-4760-f544-08df3b5bbc58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|19092799006|261022105027099003|56012099006|11063799006|4143699003|261028144727099003|261009223027099003|261026140227099003|261026121527099003|10067099003|18002099003|10063799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	A6025q7+/2C/sq6GaK3z3oa7u67j/GvgmN3TIJTiVDZKv7dUrawTgYAOCQwGLgxpIO14ZYQoU/dCXtQxtPTwiDT7csLhHOwt0zKCrY+lLDRtbYL+T22Ch6tNQlGmvHWGqc8AZxCFmXVyg+J/PtZHlJvagqwjK+g3AX3CYH9u6otryQ/v97fMnWdA5PZNn6iN/QkOiZJZZtxv0UBPGvnetmFI+Yis25tWxVSP1jDwqciI3/EbZ7waabnzLd7Us9caiW04n++qDUlJ/BKUQBaHxLnivlbFtqSbIblFxe58C4tJMZp4r4eMVkKbp/5ahb3RfmRhlfY0kzFV20+3JoxcY5V5iDbQ1bIOPQMQEwttol2Cjja6ViIx3kcDzphIn1rx3I+fM2iENM5l53kKyYsc7SWHHsMgTBpTnJNTueQin7N8LkdwWOw71s/5VoFmk7CRg5m23iDyX7IQ50+PXkrY1saFEB+AcFCOq/C/ZZ1Zk9t9k/0O/y4ImBjzC5rKEhUIQ9/tiGgY7/6osZwbd+QN7LaaBR9ZsYBbfyknIMZT/6KE6gns9ISgpKz3w9Eb8mG9okFTAS6P3HXeMf1L1NU6+qy757FjAkgAe9+r4uNonDQcGI8sVlf6G9ROxgD4g476JGdwgXBoq0R3+LAQuPNVt07/jM45m5Og96VFz4hO+8A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(19092799006)(261022105027099003)(56012099006)(11063799006)(4143699003)(261028144727099003)(261009223027099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(10063799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHNzY1dXRzNoQ0xnUHhGak1tZS9DNS9pNmpEN3JLSVR5bDIxSk5PR2dVNGFE?=
 =?utf-8?B?NnNTY1ZJME5EN09XdmhIbWFQVzZ6Q2FMbE9PdEV0NmZsUVJSck9qT3RrVlEr?=
 =?utf-8?B?bEVPb0ZZQkJzYkV6UkRwYks2NEdzeEQ0TXc4d3JGSGkyZUNnSjZFQ2w1Ly8r?=
 =?utf-8?B?Um1sdUJmbTFEL05nWkJ1eWZXVzhVSCtvL0RZWWtSb2p0YkJsWjlZeFJxVjkw?=
 =?utf-8?B?R2dnbVpNS2d0dExiRmJ1QkROVFkyQnB1L3FBdCtGZGF2WlpWRjQ4YjRsT1ZL?=
 =?utf-8?B?SWRsTVFjaW1YYzdXdllwdGpRdHNQUmFWRms2S0R1SHlJUUZCc01KbGpJQmda?=
 =?utf-8?B?MG1oTEhXVHJ0anhkN0F1NmNyR0gvQzZzZEN4RElJZ1FEdFM0TjVZVXpxckU2?=
 =?utf-8?B?RFcrNnJRVzFseVMvTmFrNURDcU14dVorWmN4NGxCSE5UM0dRcGZkOFhIa2Ry?=
 =?utf-8?B?RGJvazRDUThUR2haYXhSdzhiNWtXZElLTDNjUHpGS3grQm1mVmV3R3oxTXZH?=
 =?utf-8?B?eWE1WVphbldKdStNWFlvQXBKK0tPazl4M004N1RMN3k5aFZvait3Ynk5eUc2?=
 =?utf-8?B?c3J6S2lTRzQvVWIwMUxUSy9NYzE0QnU5TEZSZU83Sk9adWxtTHlwZkpBTFYz?=
 =?utf-8?B?STB5WDB1eEc5VzNGWUtNNWZ1YkpkZFFaNVZ1aFpFbzZKOTNZbjQ1dWR1dUxj?=
 =?utf-8?B?V2F0L1BKSDRhNkwxbWM0Mll0NDdzUkQ0QnNsTjh1R1VicjlDeWsxV3JteWhS?=
 =?utf-8?B?OHFlaC9OdUJtK2t6RG5GczZGOEVPMnlJQXJhYlFRYUh2VEFUaVZ6VWZhZ1Rz?=
 =?utf-8?B?ZjJVb2J1T2xPUmJlK2VMTVdWNDJUWG5jck5SYk02UlM3QTRNVnNQaGM5VDha?=
 =?utf-8?B?cHRDdDlnZWtJU3V2RGNRMmYwcjQ5bHFaMlpnTENpU0pLc2lIbVQrV0F2V0ZJ?=
 =?utf-8?B?Q3RRdkhQOHphMTZ4RFY1TDhsTWRqalZ1aE5SS1RyYVU1bGxGcDFEdEtvL0R0?=
 =?utf-8?B?Tlo3aVgzczl3UWFKb0Z4MEtYQVJ6cWZ3d1dkZEdMQnJsVjlGa0xjZFRPTTJU?=
 =?utf-8?B?R2V0SzhPYUsxQXNNdzFRakN6bGpNS1dLZFN4b1c4bkhYT3pkMGdPbGhkVDdF?=
 =?utf-8?B?bmxRYnJhUmxTbkM4RXJTcFJSMXZUSVhENGxDdUh0M2RQOFc0UkZLMzlReVVT?=
 =?utf-8?B?blUyK1B4TSsvSTFyZjVtUTAxNkFMZ2hXZTFjM0dZcjJXOU81NHVLS3I2Q2dS?=
 =?utf-8?B?ZExpNElPZGRSNVF6WWE1ck9rNjFBeFdkYlUyaEgyN3lQaURBblc3WTlKOVh2?=
 =?utf-8?B?a0dDWGNtaTlBUHVET0JGeVorM2tQM2xpWFlkM0xQazk3dE9GcWZCTkFpZ0ty?=
 =?utf-8?B?eVBzWllxNUJCOWY1Z0hSbjNHRzBQdWFUVnlGd0V4ZUlCQ3hHeXNGT0VHYmxH?=
 =?utf-8?B?Ui9CcGR6NXk4R05iWmQ0N21TNkprNHhxdUF4ZVF6TGwxZFpuL1A0RUhVaGdL?=
 =?utf-8?B?QlE1UUtZUXRQaUNhbktDMnJSck9SNjNRSGR5OTZ0S3ZtT2E3ajBVK1p6OThV?=
 =?utf-8?B?UlJNeEJ1NFNmTFdidE9UQlRyamdTSEx2Nk1ObHFwUjlLZ05aaXZBeHJxbWdX?=
 =?utf-8?B?Tks5SEFoR0VGUVFLc0NaVXpqSTVBLzQ5cEl2WDhrempNczI0Y3lSbktsMjJx?=
 =?utf-8?B?NlE0Wng2ZGhqcmhqbzFrUUVkOXJnMXhVMENwRE5odFNYTk0ySGwrY2JabDRx?=
 =?utf-8?B?aUpmV2NlT0hMWEdydmZjN3dYNDRaQUhHbHgxZi9nRmN5RmpSMjlaSjI1VmJh?=
 =?utf-8?B?SHg4SUtENVZnQTM4TGJNbUZaOS8wRkJDaDh6anFTRjBBTmZaQUtWMHpWT2tU?=
 =?utf-8?B?amZtZDdLVUVsTmdlTkdmclR5akJXUUFrem9BUlZIY3FBeER4WWpwRkhvVm1N?=
 =?utf-8?B?NWhlbkNoU0xWRytvWmZYYmV4RWhBQ3ZpazB5VkVTMXQ2NWlKUExldDlBNEhr?=
 =?utf-8?B?eS9hK1haTmtmNkhoME9PMDkzdytyZ2VlV0pCejVZOSt6RVhPUkUveDlkZFhJ?=
 =?utf-8?B?STZQZ1ZVVlNTeE9wd3pMUXA3WEVnaXcwR0Y1NElMdkxFT2ljT2RVcnQvTEdq?=
 =?utf-8?B?ZEd4UjVhSkwyNitvK3k1Z0o5dk13RXJPa25vZkNDYS9xMHBUOW9oMk40Nkl2?=
 =?utf-8?B?ZW5nenJDakdUREp4YVhuOFNteE85d2ZaQmFHMkZYT0NsNWpLRmRpWTdGN2hU?=
 =?utf-8?B?TlA3dkUzWUc4VEJBd0VQRTVYVXRPRGppUGJUaC9SY202d0dER0l3NzQxeXcx?=
 =?utf-8?B?WU9yS1NqSlJUQVVYVzU5WjNyR01pdGhkaDhKenJKVWFBcjFpcWlIQjlrbHlT?=
 =?utf-8?Q?MI5nnhV8SGs67HVgIxeKQo0TVat+TNG2KgxWy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca0eb13-5747-4760-f544-08df3b5bbc58
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 16:42:10.0175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0+szXKpCJ1Wiq3Q6XYczztqX9MM7Ow9OsbrT4PRdStOnL2a9pgxM4aEHUw4P2i9n/GKGTileP+G/eYdVRnE9KPpxGOyFtZxIUoSyxWiTLlML1+K/HUV3W7tMr/bsgW5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA6PR04MB445650

On Thu, Nov 05, 2026 at 04:35:11PM +0100, Marco Felsch wrote:
> On 26-11-05 16:09, Marco Felsch wrote:
> > On 26-11-05 09:06, Rob Herring wrote:
> > > On Thu, Nov 5, 2026 at 9:00 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > > >
> > > > On 26-11-05 08:49, Rob Herring (Arm) wrote:
> > > > > These .dtsi files are not included anywhere in the tree and can't be
> > > > > tested.
> > > > >
> > > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > ---
> > > > > v2:
> > > > >  - Rebased
> > > > >
> > > > > It's been nearly a year and these are still orphans. There was a promise
> > > > > to upstream something for the kontron ones, but that hasn't happened.
> > > >
> > > > That's unfortunate, but these includes are used at least by the barebox
> > > > bootloader [1,2], dropping these would cause a DT regresssion.
> > > >
> > > > Would it help to upstream [1,2]?
> > >
> > > You said you were going to do that on v1:
> >
> > Unfortunate no Kontron dev was chiming in. Will do it now!
>
> Okay, after checking the current linux source tree I noticed that
> Kontron did upstream the carrier board .dts files but in a different
> manner:
>
>  * arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i-ads2.dts
>  * arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i-ads2.dts
>
> This means that barebox would need to adapt the includes. Can you please
> mention that the .dtsi are not used by linux mainline and instead a
> different approach was used?

So, Is it okay to pick this patch?

Frank

>
> Regards,
>   Marco
>
>
> >
> > Regards,
> >   Marco
> >
> > >
> > > >> I will add the som.dts, please don't remove the kontron dtsi files yet.
> >
> >
>
