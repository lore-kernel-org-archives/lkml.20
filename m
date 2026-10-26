Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.120
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792984095;
	b=rR6PsG35V+8m5OfbsMi3re3MbbewwmZhp7vtxXJMoYdomg8R0R3+ghM/+rOZlK61YHdd
	 SWWjvK1hjGm5/iNpK68iUPfyxH+vCrAvk5+kmdg3AtIGipkPPKLgez5fHiLyMxih7pvti
	 lfZF/T/xH9NzLAEiDTqZp6oWsBhRqv6yO/UHphHpc8gz6+9Z/5zNhBb1iN+SjTK8KAbzI
	 RP0w8EReBdZlXcfYevHQx9E8SemEArmZy+cDAQAcAdT5xXKPYj+S4RL/otn0TVTGQsATs
	 tSe8N/MlbIT2FvoWdxNm+tN08cTN/7CJDM+3HDo/g/Axa+cdwBvtWIQbcWpkbRlebDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984095;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=8UXtWCP0hU3qIojEqNVxCetx452rP2tmFdahmQx4a3Y=;
	b=I+B/vLBY1uaW/qBATFqh2mhqXbUX8Le+lnkqUXNqIjR2Kb4zMTu0SWTQiRQVDPQlhqiI
	 3JzCxWiqzEdJKEBxteACSbzIsFKm1kRfDg/lLExGxEPp2180ZpApN5kC9jHG0Tq07fAk5
	 gez+Pz8hk3+Nw1YeaDCedpXf4E3tU5hmz1pH12cOMMIGcVYhG6IIJiVrzPi9AFCg/fSZ5
	 +kwa06qQ12/QVK0yoV7sE+m5I6tziJjvtGkhTJavzyufr9rP6rgD0A0TP/YoWw3w9h7gv
	 dXuCG0WZguuEKc/cluJCaWU6JUfNOzgoD7fbLOrSS8syxuYaUTpUpZlAshGvn8AZFMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valinux.co.jp;
	spf=pass smtp.mailfrom=valinux.co.jp;
	dkim=pass header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=S9trMxcN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.120
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021120.outbound.protection.outlook.com [40.107.74.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EE9606A31A;
	Mon, 26 Oct 2026 03:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92EE9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=S9trMxcN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiUW6zkrU0G62cdiUMlmHbrbjvM1EZvOibR8UTWsUi4NAiZE7DucwGFjhd3POewNzhRLkdvjQQ/BrnbiVCpjy+zU78t3ncJAiv0ojko7Fl4L0LmEG/3IxmgjEt3NAaxIdN3sBoUtsoM1zJyg+b+RYDHsS3j2e8eaXOOEPQV5lfuVbAKk3JeChjNwcClvqNmB+Z91QHA/ya0LHBOi1M433iFCyi93FBzwuKn7Nz0CXTUU6ksAy7oYKpdHkLB965DVrrRUgWFT74Zq6IoWqMtuhHissoY5zrkz2KflXDI9O6zlf+WBITrDWaxTbyekqlAjAvPFdIEAh+rutvD73QaE8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UXtWCP0hU3qIojEqNVxCetx452rP2tmFdahmQx4a3Y=;
 b=tDTNI+57DP1k/k0cCi/s8fYRhap6AWHXiFChlAjsmhQ/TaWokaALET4H8FuaizwWZ6/fF/RvVe249oIoZP201cLO33Y54XDRlphPGbEejkwO+9pO0yIjC6sbg0tkPI5oSQ0XYXRQjUcHqUUI+zHtqlPbmsBlU8vn1zWRdRkdLZ9dvjd/3jzvKEUy1efF18dIdp5m7hBuLVNUtHEiW8w4pR16SvCOWNIrNXCUXiJ8EEv7FiLLI6DUITdCP3OUIELQ6jz3G1coo/2ptwwsM382BK4hV/S3UQWrA7GavyGEL2tLXXqko5idtdHJ5bYvuQCitpESqW5repvNVCGaCwBxyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UXtWCP0hU3qIojEqNVxCetx452rP2tmFdahmQx4a3Y=;
 b=S9trMxcNT76qhRvnRlnCDDv3OxfQ8lNVcR/YZvw2LAPZksJgJZiVEYcEV04FAKAbhRmSQbqYnRNeLIP8iKgZFcYLpH21ILLJMY4SpyJVFN/Qb0wSPNvnwSRPKXlpkQlRQoEDg/Qc+CHzXDSI2ySnbPIoII9mEV/gJpCIYchJd8A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:325::11)
 by TYYP286MB4077.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:155::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 03:08:10 +0000
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9]) by TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 03:08:10 +0000
Date: Mon, 26 Oct 2026 12:08:08 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: spider: Add overlay for PCIe ch0
 endpoint mode
Message-ID: <yxguu4obyspgkq5f2coa6kjrnxjeij3yduhwd4qd4gpamw25fp@quii5c75uxhn>
References: <20261022082113.3163666-1-den@valinux.co.jp>
 <4c0b2b15-7e5f-4dc1-bf49-c762de48853e@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c0b2b15-7e5f-4dc1-bf49-c762de48853e@mailbox.org>
X-ClientProxiedBy: TYCP286CA0278.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::19) To TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:325::11)
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
X-MS-TrafficTypeDiagnostic: TY7P286MB6866:EE_|TYYP286MB4077:EE_
X-MS-Office365-Filtering-Correlation-Id: feb80ec9-f90d-4b39-0349-08df330e5d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|10070799003|7416014|376014|261009223027099003|261021135927099003|261022075727099003|261021121427099003|261022105027099003|10067099003|56012099006|3023799007|6133799003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	1qwNmYz1cSctcqjA+rKd1k/0g5coYqfpeqGC5x8LuQzJy09J444s9jtsbvrBV2hP4GMZcb/U+Vfq9ZpuTNSzAyk/EPe8SeC3gFdw/9JVAz0R7PJvBYLG8ecuLPfzApD0kUkKU9UrvuuUuYGB1hZO52cef0HJiCv9efXoEi9v9fDM86wxfMF3vruQ0wgSeUVbzfrxsw4MmIWPrfA/xRw9nzI5xhZPH4vGCYI17TYLag1VR6pFz8BMK1H6ZZ3LXW7KOIKRTMS6qCQBrjoH15jtiOy7E1N6xuBd9aDSw24GYnZ1CUMl90RxCAGHoR5J7WDH14fku0P0IFLNn1hWQRdY5wRJP7B6N6U/YWHpnr0RQgzAxPtqoBXilOEUlCSVjU792Xf/zeFli+QeR/3gbZ5Mv16n1cjHIguQnIkdxBm7y5WIG+5UYIDeZd6BbcR+hqXaG1EZLMIpRWH+CO8XosKnaPi031hf2JBcH2MJD1cSGiBo1azYXgisnKClNe1EixAgi9Tk7V57gAhiNIY+qbcwFre9Bn//X8KXnY2m/XCrtTXpi3558/C+bCE/dO2M2+rYudppoF/3xofj/4G/4JJy2cU/u+sJQEHzECxMTUQAzgVetZjAT1oJujQU6ksGqEmH7Ts/o35hUTbwQYh6KSU8uVQUUCEseaDAsZOdtZL7vWY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(10070799003)(7416014)(376014)(261009223027099003)(261021135927099003)(261022075727099003)(261021121427099003)(261022105027099003)(10067099003)(56012099006)(3023799007)(6133799003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VrMITPzSEt1e4dfFxqo81Ej+9KeWZyTKcwoy7smzs0lhTKkdG2liHjPP8B8Z?=
 =?us-ascii?Q?cb2SEYCU1uZT6v0kcHopz82wlvfzAtOkKxkWNtY1DQvPfdOxefrdbLS0ypxL?=
 =?us-ascii?Q?Tu//tM8VrgxBibaAqypNyZZvxF/ooW4wQgMlO4YOegE/xSVXAMM7pG+mdBg7?=
 =?us-ascii?Q?8XodQgoEsJzzk0ugCuDMqWLNBF4p9ob0HlZHTloMsR6ZAuvjrdvJE4qThkT5?=
 =?us-ascii?Q?ZLroXhBLbXHz4dNbuyJ+AdLKOfr+lzoAMVtG1FKMrAOXs9JQHIbkxyhb2+XW?=
 =?us-ascii?Q?ICH1UAIMYPcsSG1IhzKZaBAVzEybG/59IOevtAK8oROYikR8WubfITnX5/Uf?=
 =?us-ascii?Q?lzncMFrLOg8H1KFnQztaPyucD3JIk6UXycWPLInsuLeQkF0b9ZyKnUBZ2h2Z?=
 =?us-ascii?Q?RaSJ7x6XilOYSIEnKlhM7Gy70CYTbr9/8BvzSEVa0K7oKHfXn7fUgNe7yK8D?=
 =?us-ascii?Q?4tKvTZnN86SvjkaA+s6v7c0lgFJVHuWwUPvWjjMAIE+uK5htec99GMw0gHWz?=
 =?us-ascii?Q?1P7zI/oNx/ilOwzfhyeUKOQa1p8ZiQHRSjdO2naoAy2GbGB9nXSQxa+67IZa?=
 =?us-ascii?Q?Ry8latErxFOxLt5/+AEEOuVbPpCc92tvnaZvXn8YifiixHi1Rngt0RowWhV/?=
 =?us-ascii?Q?cSHbnD7NMhA892tW1C1VMqKVCxuVUBDEC8xGA+kJVNVkQXj2jDhHZR+K4Ozg?=
 =?us-ascii?Q?i2/MsDMwb8zOlAXVgSnhM8TWD7jn4Sya+SXS/r1nWBtKHc6CI4S+U4F3dopD?=
 =?us-ascii?Q?tWhgTnLCjG3G5h2Le5UwLbvOvBNnMKDHayL1yA3INV/GehYqdNjtF3yG3qeR?=
 =?us-ascii?Q?I+5h2o1djusKEmSS7ox1ulwovMCJ5OA9zYY/5xehZxtj7wfHG8blfQIsVYme?=
 =?us-ascii?Q?rqWcb0ELKbCi92LXpeW21xAn9tMdLKJgMfEjxYWJ8rbIYiTjjSOqt+95q8IJ?=
 =?us-ascii?Q?6yptXaTr/Rr0RfLDnifCNH8JMcUoq9Z1462r7+l4C1pqJQe5bNT5WlfShK3C?=
 =?us-ascii?Q?6Ya/KPwJS1jUnVPwGXEs77WnU4iv9aVoa3v3H1u6pZXg21H+cJmVTbt19ZZ1?=
 =?us-ascii?Q?YDqPRD1Pg8AJJ3QIvsZBkRwoOy0+iGoPQUp4hrAcHvpeBZq+/hAkw0JmbZ5J?=
 =?us-ascii?Q?JhsikMZutEP6jgBTMPENeH0KX1fPFofKg15DV+D4QYHuNt4tO/PzYKjkPiCo?=
 =?us-ascii?Q?9e9gKCUV1Q4DNC3BvhZoHgOFvkwwiSGPGf50KT6k4RFU4kdzWhOC4rSII1wy?=
 =?us-ascii?Q?FLhe7iIzYJ0fwEtvXurESE1jNhffDtcukgvSSYInsllnniKOoH5IGexuO31z?=
 =?us-ascii?Q?R5VBO1FhmzdgxPkXb/2MHHsI1mza+Q33kDGrkjbqKBSUHmxARgsjGpGbHOMy?=
 =?us-ascii?Q?66giPj4KtHn7UgKmWNy5vUc5eZ9dS1TwQIft8S+hZzfM8dzTWp7Ae8XNaKe2?=
 =?us-ascii?Q?VDB2THpX+kJqqvkm9eVpVOe8DXPNLYRivI34lfdIjI9yCbTxQVOxKJTogUip?=
 =?us-ascii?Q?tJHDNxHHuF1bXdGO7Hf+i9gGzB+OZM/ZlB5fbBKUhQGdZxaB+bA/ThuNu0uu?=
 =?us-ascii?Q?ytF+0TB1wsukeujRcgXxPHGF5OSgZXNBOX3OXi0qEn8jYD+avVXdBnTzxvyJ?=
 =?us-ascii?Q?bYG0dK10u6xcwCzvqExhi/Vo3fznPwfUz9oc1Z2bf2DCbWP5HlwPi6RAyCbK?=
 =?us-ascii?Q?/cWUG0Yawsp1+qjDU5mt342uPxOb3bhk96Tl+rqgc1YQL1uGxYi5qRJNLIgE?=
 =?us-ascii?Q?48GiLetn16HKqWG2o6y9N88XmMSihsoM5Zk9rpRO2bSYQSndNxp1?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: feb80ec9-f90d-4b39-0349-08df330e5d73
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 03:08:10.2119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KG/3R0kYYiwLizDBPYk3HEY5WKbwTyYaQUnDJZcr8XeZc7umWyaaZt5FFD/2HbQeYzMLj2+5F8PM3+quwiZyFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4077

On Fri, Oct 23, 2026 at 02:58:38AM +0200, Marek Vasut wrote:
> On 10/22/26 10:21 AM, Koichiro Den wrote:
> 
> Hello Den-san,
> 
> [...]
> 
> > +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-pcie0-ep.dtso
> > @@ -0,0 +1,15 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2026 Renesas Electronics Corp.
> 
> Is this header correct ?

I checked with Renesas just in case, and confirmed it is fine.

> 
> Would it be possible to include a brief "example usage" comment in the
> header ? An example of such a comment is available in e.g.
> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso "Example
> usage:" . If this would be too complicated, then please ignore this request.

I would personally perfer to stay aligned with other in-tree PCIe endpoint
overlays (e.g. freescale/imx*, rockchip/*, ti/k3-*) rather than adding
fan/HAT-style examples here.

The typical (long-standing) usage would just be the standard configfs steps for
pci-epf-test (documented in Documentation/PCI/endpoint/pci-test-howto.rst), so I
suspect duplicating those generic instructions in this file might not add much
value.

That said, keeping the header completely bare might look too terse.
How about something like this:

  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
  /*
   * DT Overlay for enabling PCIe channel 0 in Endpoint Configuration with the
   * R-Car S4-8 Spider board.
   *
   * Copyright (C) 2026 Renesas Electronics Corp.
   */

Thank you for the review!

Best regards,
Koichiro Den

> 
> Thank you for your help !
> 
> -- 
> Best regards,
> Marek Vasut
