Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.128
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792995418;
	b=kMgS5nlYky6RPAikCeJt4dhiJwQNbl9A9vlvkR0RdUrttbmJwdOGD5UNRQ9/sjOn27Na
	 vlOXKvrCoeoua3+VpvXxYEs2LNco+MEgvK2ixUkay3y0TB0jLnJNSY293nuC3UyvgFH6B
	 6SGObqQO+FeSCCZuYeYvYSbydXFo3O/NPTP2fEpS6wZtsnr9PBYmr8d7XPItwNMlTXYmB
	 DaTHYFBdBWm6xoD0F+IO1IG5wkzZLhHol6dFB1/zbb8yf0ulNADAnSv7RhZhljY9KzjTx
	 5qFQx4jqwmkifjzpl70FRQJG4gNn9LBGEjLhspwGxkP8/1oi/3N5BxivLLoMjJGJHMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995418;
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
	bh=pjgQb2S+aqjZtk2bAEdTY3C6OMhGI7lONqKmsYCHhQY=;
	b=ycEd+tvKGkUKmEucgSdqp1Jwx0rMypRswRkvdOicOBab5sbbSxRQgmMxPO+J6KNJGSlO
	 ZJq01TbIELhuIEdQWaJpLBU/fJxtSRiIKuCJk49fiu+u1N4LqVPZdZ9S+jKFRfqjloMen
	 BDuv+0wsmvdEmT0dZFrac0BgkNZ2HuAzp/TR0oRrLffdvfjpyfDRq2gpNmnwMrPdUJ/uh
	 EVR8X5mnuQ355iqJ2pPS6I1vfocyODvR2/VUXKFJ5mawO61thAMyXsqjngq+c1gNjm0Pv
	 aBvewQjesrM0Qmkn3xyq2mn3C/Cj6171y1kPKMnJnUpZtk70BKHSVTLKLF3RmviAHmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valinux.co.jp;
	spf=pass smtp.mailfrom=valinux.co.jp;
	dkim=pass header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=Go57Wi4U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.128
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020128.outbound.protection.outlook.com [52.101.228.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D06606A329;
	Mon, 26 Oct 2026 06:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88D06606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=Go57Wi4U
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bv3gxvAJIUxW0oMkdb6TQ4/9e9X71B960bUtMOQ85POIDmKnBLlbGJ6pn9VAMRO/wHg0sr50HtzhuLnvVt3/p6pWYzzU+GS4++x0CAD0uu328R5+1KMKLdwTC3VPWBIWZn32836Ukf7UzK+TdU0hurpSQM84P/o9DDx9hi54Jtbdl7e6deG3qzNvfk7SCNl7xabsL2uYQoNAZ+cN/LPpPpJeSFBajG40O3yANFv5IbYUn2rComAYLRRAybFDmEKLuLd4SzowIb0Hj1P5kalVImA6fQRu9qdW74NGoyFt1QrSw0VgwCLMfJhFLwGqN3tId70w1XEroCwInGPgyBjlUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjgQb2S+aqjZtk2bAEdTY3C6OMhGI7lONqKmsYCHhQY=;
 b=pNmLAIBF7UTwcEDXNmPNxvIxkHPTDaJRHmk8kziIFEnw/TL2s3YS04B7hE3vZTaHdLnzJ9gkglevJFdtwUpLSvORb3FIjlPuZ0yP96ZSuizwJW5soObUD/gVpXYl22mBC7irrT7GHA/puNaZ902iXy0yFGEtFoIbsMmjpWumx2OsK1WBia+2PWuVYFRQ851hAE76MNrLio1HH9FdZa4kwWobGt35//+Ttyv4yAatyvOAiyO1e0MKVN5UJ/Mgq+8ZyruMau7p0MvutH8pAAcNbCM/SEddqAXQW8YLn2wCC3RgF5IUUcKQu+Ab2LJ9QXwliJdJYfbHiXakx31+2ehZhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjgQb2S+aqjZtk2bAEdTY3C6OMhGI7lONqKmsYCHhQY=;
 b=Go57Wi4UePTZqYXXX75hpKu9f1HrRyccNVB2VhO82uUYc/Ax/UuS1y9Wa2+kyCH5lTi9M7o51I0d4USWsXnHayacLidlcoOXFxOhk2u9LIAA7ETTgy4jpWEt+vXLxnTHj7zbKK8v5e3sc8wUOHmF6H8gQr8ljrp3TDsRWbiyL04=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:325::11)
 by OSOP286MB7677.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:469::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 06:16:54 +0000
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9]) by TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 06:16:53 +0000
Date: Mon, 26 Oct 2026 15:16:53 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: spider: Add overlay for PCIe ch0
 endpoint mode
Message-ID: <egu73ymzk7spvoto3tooryzvsbn2pg542o6wpylqtlchjcvv7h@w4jsqg5ynydc>
References: <20261022082113.3163666-1-den@valinux.co.jp>
 <4c0b2b15-7e5f-4dc1-bf49-c762de48853e@mailbox.org>
 <yxguu4obyspgkq5f2coa6kjrnxjeij3yduhwd4qd4gpamw25fp@quii5c75uxhn>
 <1d48649e-cf7d-421b-bcd9-3a896064375c@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d48649e-cf7d-421b-bcd9-3a896064375c@mailbox.org>
X-ClientProxiedBy: TYCP301CA0026.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::10) To TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: TY7P286MB6866:EE_|OSOP286MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: 577adb40-7141-4348-5825-08df3328bae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|23010399003|366016|1800799024|4143699003|56012099006|261021121427099003|261022105027099003|261021135927099003|261022075727099003|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	jX+mmBuFEkUKPHttJEySW+hxaKJslBES9TXPsFzP/4ZgEihewa2U/5OiVLoC9FkhTd3t+FrW8lpCDWIkwxWNXMW3zNEx8LzCdjThkVUXLmiVtHAMMaocKnUXNeqKjRKRb/B+tZ96um+ut1EKaBxIDdZf36NaKAvqGA7PXIbLey3jMUHJV9OSxCIs4nG54uiA6Rlh7EepJqtITmnK/4/yYygJBTvlFjTNyic7h4Qs96CgQRiP98rxSL43npEbQHpUseonXVJjoTY2sxt9mP8qE+AoduDe4Okd4nS0QATLZTDSJy7qLk7VLI2eKp7fK3qVabu0oJmRbmgQEc6SRaPIPDX2SlgIdW/N7RsAQf799xU3cbAjGhKaJWEYkkmC18F+UwLSB7Nbp5/bJ9kxafbEyUy+fvb9YWmVk24KnJpw3oTpf6BiE61EuDtgZzeE7DG30LRG7yckWWsI/yW6HjWCNH1yrhf4um9+ErtYaiPMd5iJiOEiIcJepUY4XiWrdGPiWCF8Lo/JgxRFp82U4a7SOzgfPv+awPUbDQL6Ism4POJZBvIJH8HRybskJM89A0gWgOMOm+OVvv2vsqU/zRLDQgde0QQnq7CmRTDXvZL1msIvR6Lgtlk6rUI4xfCu+5pAUygR+WWhD0mHF082U3UPxxrwqmSnVy+3to27T5WJFFg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261021135927099003)(261022075727099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wBNGO5T8n7JQZWfVD1NiTC99seaI5ICFfIlfwHjRSpiD32gKgBoLd+JXmgNE?=
 =?us-ascii?Q?EK1h4H4RX+BRK9pA90H/oTIXHwpmGVGXoZlahRahsZC7O6LMOm5w9JCO/kDE?=
 =?us-ascii?Q?E7Y9JWp44dB4ciJhJ/cVjh4U4bz/e3kvXefzCjNmDqplh6ZS1MkERWr3zZI+?=
 =?us-ascii?Q?BorA6iTGLbmS1pN09Ijpo0AdBEfIaOzBDMUi7E5FgdCH54WDBO8rSn9i1I2k?=
 =?us-ascii?Q?vU6KiKBCDw/h6maXl801qCouZaTUZIMZD8+kVn6pOzNyGRAJkIbLWTzyKG3p?=
 =?us-ascii?Q?2V5DyxvLlsFty0uZRyrZ5bnaK5wp+EwDUMCfXAbmGmcBy2sf4BoeF+CXcu7G?=
 =?us-ascii?Q?wOxjrGbaNd9EXC6S6HqrXhJEqe1/EN2IuTO4zayPCIddEXlCKn0iWdJaGxMs?=
 =?us-ascii?Q?mIRLqBJT4sNYr3lANDOtljgwfAlgvd7JWkTI8m1SYF05RLRKh3Db3PD8UEP6?=
 =?us-ascii?Q?oBx/Hr937yKsz2yo5kGmx72qsCw93My0O+WQsSOWBgh9rSYiplOKo3nxUzdf?=
 =?us-ascii?Q?1Z27PmGmGug+6LAqma7Wvd6oJUnAbPmCC/Nrsr3DV7sESBIszcxE+pMfwmTv?=
 =?us-ascii?Q?QCFtWS86nTnSvuAWwNXx7dMWeHbu+zlKaFA0fFbpIqHpGm69cKsZB9BRclGT?=
 =?us-ascii?Q?CB6/MQwZruvQiRDIF2el87iLIEYOc6oQVjG44QphY4xRiNLHZNjO2CmL5u1f?=
 =?us-ascii?Q?Lzs18qCrJomyIvuIuh6gruA+AUUgLcxiStA0HUQWQ8fTalfZpqXXQa6NOIeh?=
 =?us-ascii?Q?7GlfiCPZprqPppsSXYKOor2NyW2zYyvcqafA8KHZvnw1VS4k5RU8hGo7Wd81?=
 =?us-ascii?Q?ROHwLOugOHuTLB92oQ7xhNHt2itVShna06mwiFay9UGnnSHNpbXjkgh8T7Q1?=
 =?us-ascii?Q?6uQ3crNDk+kdL5KJ1SCSeST7GuSnI7qTq1GSM95RAnago6akB9u9is/zIegg?=
 =?us-ascii?Q?5nG3cN40aS9QtenWBXEBCSO16ZE1xp3qbmj2bfr/3ImEhbejx7E7XSA4As3z?=
 =?us-ascii?Q?EsDT7fYmyRjqgbT0OOUp77gi11npLaLszAomH+/MMtDTm9DAXTFwY3NI0WSD?=
 =?us-ascii?Q?NkDbQkBjQ4T7tK1IVBYsLaAvt8K68hkrNHzDEAaiicyBZ6JAylNQpSsTypah?=
 =?us-ascii?Q?u0K0Tkf80fPbFa3xgVtI60nX3VHJ+esD2Ta9yj3qZs1w8+0D5wqzW8WKND9X?=
 =?us-ascii?Q?D/4F4i0yEvyE+A4O4LW35Fg2SPEkbgah+sVLhRmVy/6zLunG/nFvBBJ8OnyA?=
 =?us-ascii?Q?Fd2RhEHPTGKYcvCdpcX3bYeW9WDZVZCJ9F1Vs8TUMujHubp1Qf6htmJnFZRn?=
 =?us-ascii?Q?Nj3Ap4jWap/x6kjFV2swzgnYsqrGVbIjEsf71o31iIHxGFwtijcLNHMvXoZQ?=
 =?us-ascii?Q?dCz3+goSE9J5c1P6qpF/0ytpA2FDWGbSKdF/zWsynT3sQZl0gPAH038xIh/V?=
 =?us-ascii?Q?oCME5HMxmG8xYDI7vwPHJMophGAqmzTjrAOg9ukTHkxlaSPPwu8dyBkoSh/0?=
 =?us-ascii?Q?aIaVgaO390aTdXhY7GEIPgbRx7BpQr6R40LMpKfRKPn5UnTenVL95QH6kDNn?=
 =?us-ascii?Q?To4Ni90YI+DYDpTHfbNa3/CGE8tT4SlnRRNdz51TOGy6mz/tZrc1J/1vCO5Q?=
 =?us-ascii?Q?AA4hqheXjYV0Bm2ACdwvbxvYu8iFli0bNLCGIOQW5vtjcdQEZIkgmQwW4c1J?=
 =?us-ascii?Q?OW1pLLAXw5BFlhwik1Aj93rPB3kkSzuvZ2GuIfhn1l0ITJ6QsazWrQumeEWs?=
 =?us-ascii?Q?9DB94977iVMRz2SaIOAjd/fr4Aimu9a/v03jBySMWSwxmkdfnE9Z?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 577adb40-7141-4348-5825-08df3328bae2
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 06:16:53.8599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1YS2QIPOCKexlTZP0lsagswMec/hZsk3xRQ97y68snXHKhYrg0UyQC+afDWFwKzqUhxDUPTatrMfnG2osXifw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOP286MB7677

On Mon, Oct 26, 2026 at 06:35:09AM +0100, Marek Vasut wrote:
> On 10/26/26 4:08 AM, Koichiro Den wrote:
> > On Fri, Oct 23, 2026 at 02:58:38AM +0200, Marek Vasut wrote:
> > > On 10/22/26 10:21 AM, Koichiro Den wrote:
> > > 
> > > Hello Den-san,
> > > 
> > > [...]
> > > 
> > > > +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-pcie0-ep.dtso
> > > > @@ -0,0 +1,15 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > > +/*
> > > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > 
> > > Is this header correct ?
> > 
> > I checked with Renesas just in case, and confirmed it is fine.
> 
> Thank you for checking.
> 
> > > Would it be possible to include a brief "example usage" comment in the
> > > header ? An example of such a comment is available in e.g.
> > > arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso "Example
> > > usage:" . If this would be too complicated, then please ignore this request.
> > 
> > I would personally perfer to stay aligned with other in-tree PCIe endpoint
> > overlays (e.g. freescale/imx*, rockchip/*, ti/k3-*) rather than adding
> > fan/HAT-style examples here.
> > 
> > The typical (long-standing) usage would just be the standard configfs steps for
> > pci-epf-test (documented in Documentation/PCI/endpoint/pci-test-howto.rst)
> 
> How about adding modified form of this ^ sentence into the header ?
> (please see below)
> 
> > , so I
> > suspect duplicating those generic instructions in this file might not add much
> > value.
> > 
> > That said, keeping the header completely bare might look too terse.
> > How about something like this:
> > 
> >    // SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >    /*
> >     * DT Overlay for enabling PCIe channel 0 in Endpoint Configuration with the
> >     * R-Car S4-8 Spider board.
> >     *
> >     * Copyright (C) 2026 Renesas Electronics Corp.
> 
> How about adding this here:
> 
> *
> * Please follow the standard configfs steps for pci-epf-test documented in
> * Documentation/PCI/endpoint/pci-test-howto.rst to set the endpoint up.
> 
> This would steer users toward the documentation. What do you think ?

Fair enough. While I'd assume anyone enabling EP mode probably already knows
what they're doing, having a pointer to the doc certainly doesn't hurt any could
be a nice nudge for users. I have no objections at all.

I'll send v2 shortly, thank you!

Best regards,
Koichiro Den

> 
> [...]
> 
> -- 
> Best regards,
> Marek Vasut
