Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792444612;
	b=cXGrUvwhpCXr9Ie0zCXVXLwdRlIuaTcKaYf1FoDf1TaSrIcUmMHx8TT2BvLbDhOOjOax
	 /SuriYaZ+RfK/CjQRyg4H7315GL1M8dy4RyE/g2ZJY5QeCkRfboebcgwGypkPAGgMkKwK
	 Rt/9uhCbsHVBswjTHSaRUtKjlCUz07IFqO+2s7gylNiRad7WHKDVB3qrdToW2rQ4mNdbc
	 1O1WswwmgUTBzLum+APhS0wkd3zDjwXu4qCCaVC282XemJVax+rn3oCV5OtD82UP32yHK
	 UqK4VkZPnoJBQaOi7f5lEJUuUFFgtM3sOk+5Ftsthqdhyj94XbTHXWM/neMQh8U5TLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444612;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
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
	bh=uKT+pI5SkmJNnPjxvzq8yGKSG+XidkiCglWu8x67nnU=;
	b=hLnGeM2MgBLqdnI+EEe4zFI+wq7j3LlXrO/Qnc0oN8xMNmhcxWQfoRNy8J0GKEa5lnP1
	 l7A6n5kGCHKSQqwp1vwA0itMpIUd9eoBn6XUnKGhjK8j478HY31tNd3945M5KALUBPb1Q
	 Sx4sb47Y4rcW42MxbvRuGyczkmPWs/CkLoCdj9LDGH4CgAThh4gVo+UbzzI7zDtb1nWM9
	 v95zaj1OwJ7+rs8SMzhVz6Qe3KBCPFJSRSavhZwFLo/hM2JvPKA/ip3WoMGsrFY7JUKBV
	 2Wg1UIl/njkA4w2TAyCUaBod1Khs/Z/oYGvxgGtFggLADUyk4TCvT1ylWSF58i0SDnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gOVA9R2q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.2
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985FF606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 985FF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gOVA9R2q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbF/8WCQLrc8s8H0CppcnWAFqUcPzEvbNyNk/wjLNIdLOTrEokjSaYnyrrAXjfRaGk4aYL2JHrQ9axrNu2Uek6OYs4FSdFqRZ2d3JgTFGpOYrfoiYsZ5/4kxv7Uzcqn3Ei1nAMuz8x5ThMqHFXPpfSTOdHaPFFC09yQ9ET9Mn32P5fvJY/L3t3oVJ4/m/u7762Ddp7bpIDnMd901H3S2Zyy4QpEQi1MrXBGSbCua1ZeZwqF2GCvF+fLVBo0RWpvpVEHQciKqgWUsSMuUnuYnyP12pZpVJOhdGl2jTQnc7gpurTnbZvZHDy07YewZiOPUGxz+ZhZpgf+cUuJfrgHnyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKT+pI5SkmJNnPjxvzq8yGKSG+XidkiCglWu8x67nnU=;
 b=yg7o5+osIAENf1JI4OmhO1/OjTW1yr6G/vjCsZo97WoaBeLxBet6+WMaW2IOptj3+ClUr1cl18XRG3FLHHtHb5DRboctoEXosmRL7Hesfms+lfDVqd5dBAqztzR5e837MvS70YQesx1Zpfec70XoT/AHFgW3F+QXxSzT/O9IrDBQK2tahvVWbaO8dg4kwP/JAxiuwfdhKDAxsHnZk6p9MfZxNLmvD/WsqqLASAy6OjNq1cY10Aq8U/1hWoifRNh5T/MBK6Efyf6BMzMl+sGtN3kXl++jA0fhueFgqgpHqBxIxsozc9dsVW/task2nfL8Fd+ihEE0uRoNZgivGosLyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKT+pI5SkmJNnPjxvzq8yGKSG+XidkiCglWu8x67nnU=;
 b=gOVA9R2q71pUkNMZswiWAfVhUlUr95G13CLB2q+HNwtHtulUbHcAQST6VKabm2J8sXTjFNXGSEL3S6dQcA1lYRSzDZT4Bco0iRpEyEcqOeZv4eKjzlwn+xvLphsEBWpo60QkhGjU9lwYOnqEY+hFYW55aq5uQ/aI3dAK4LhPnxG9cnW8QNqhfWKQCAK4odnNRiI6OMlOy6G5SQvrFZDpEscrtdU8poyuAsM/Yr7PagiOBtyIKkaCWC0Csig6pN/4z1ZUk45OXZrtH50B04uBFcqW2zlkUlW6X+dXXWQZ+NLaAcdwq5DPGck8tNa+WuvPZcV4t8Rzp9rbJ0ZgXhjmAw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8779.eurprd04.prod.outlook.com (2603:10a6:20b:40a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 21:16:45 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 21:16:45 +0000
Date: Mon, 19 Oct 2026 16:16:35 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Nishanth Menon <nm@ti.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-kernel@vger.kernel.org, linux-bsp@toradex.com
Subject: Re: [PATCH] MAINTAINERS: Add entry for Toradex boards
Message-ID: <ataIs-d7mYhNu_wa@SMW015318>
References: <20261009064705.10116-1-francesco@dolcini.it>
 <20261019190930.eqev72zc7pkzrc26@mummy>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019190930.eqev72zc7pkzrc26@mummy>
X-ClientProxiedBy: CY5PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:930:1e::9) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: 9baf898b-0054-4607-681c-08df2e264728
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|19092799006|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	TQ6tbyIJQuW07HsJlZODUOCJqGDyIYSXfaOxv33Mf4rQ5JAsnb0UUYiXHYW9YJfjeL64EHkxfHMDCP4LccCC3Q1u6qgg/7tpsGY8/FRiG3yZUfVHkAFzUJKXJiAK4zUzFAqvAsWYDIXllTjH1sUVnfY3W38eL4mXMU08q4fYZuJnD99GVUVIkYYjwqUlxsDyeD4Bew377qIcxyfE1By1ZhP0djXlJwa2RbPf3hBpB6q3+tSWGgCmRpUKP0f5874EhHU3x8fgTqjo441S0xjX6OpHL9/mX4x+Mkx6rISmGkYTg6EOu2KuEspNFIG0aTj1YkqdN79sPqhV3iC/3jO59lLYszFNgVQHNTbIHmk+bi0ZnUDi4tLJoVTK3SsJ7SE1apUa1jj2YltBQwxzKXaDeT6CQJ0kRtK2mJo1gDAQXkeUkhqbTfWzrE0N858EmmNfjO7lTBO2jM8XM28qECK6i5ZlnrKI0SqjDl7ru096fgeiath4LQzYWGJPfLkMfi/6GpGl0oVhbUZuVwxW1GgDWk+4UouP5MhWdeV4ZEiHZzXyduTUabVM4VWRFqHK3wXy9zlYyekGALHEDDgGpwg1PjMoekbO6c2dQkm4PtEdrhzxo7eTCWtbGDkXGqKvzcxX/KlRwm4JjutTxmfDbcd7zbAYYeaEThBXnUFkQmUjWBQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(19092799006)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gti/B08xX4pq57RVrVCqGUpgSeUV2RbX7TlKXzK2JV4pMwF0Uc//FPrgJf6F?=
 =?us-ascii?Q?FqWArn7KaUtPhCKi9nwUc+4lwcA3FKQFfFIJw0DddEr1/u2bCRYskD4bjkUd?=
 =?us-ascii?Q?Uc/l7TjJs+WMb85H7fmjWsx6VDa8Y+Ql9chwQ/lYIIVOh8TTRSmmQ49SbzRa?=
 =?us-ascii?Q?Y07hxw5aG1Dz2BdktvtpeI0jgcGO5obBwGfR+MeLBKL6dzsM1rcCBmYgj4Oc?=
 =?us-ascii?Q?QH8y4Dw0zFYcmUoSXXV19ENc2e1weEXA09kBE1/dC8AzysOsbqlay2cKV6Bt?=
 =?us-ascii?Q?5gGG3QKvr9BIlTKNl9NWGDpy2e9jdZbEp8jtcg3mavUt4N3g/bTJTKkqmsdr?=
 =?us-ascii?Q?jPXKUSXpcd7Ymmu8GxXrNhdVFzhNimP1IJl7MLTYDOgpRHnLzOgH4rKb//Vp?=
 =?us-ascii?Q?q2drd1CEFDNEwf4ZAVnS9YqSzioswTvVWH8XqCatNep/tmoLpXkBZ8UDvIZU?=
 =?us-ascii?Q?ZdlmD9E3YRY5yC97Cx3sO0NI/HWxXoWnfmVYG13QFM5KsAt5RJTwD6uTxbvL?=
 =?us-ascii?Q?ptkJmwDVP2ehQJJpJL8Xia0bi3t8Byxbb2TQQV8QIRWJqvpcL1Yl27yu0E/p?=
 =?us-ascii?Q?9dvjnTZR4rl5hWa3dxUJzQ+rMwQHsFTVsTVKyK3d9sHpLQd1/fpPQKifm87K?=
 =?us-ascii?Q?FcnRXk8pHQPe/fmWvXqUzGoSxgQNxCicmAK89uNxyjhnRwfCreta6kwUp2wG?=
 =?us-ascii?Q?QcyjdWXxzql+DVBaUXgHQKVbnmiCFWI/I51yzgU6eP6DnlBfAzBFUn0hl2Fa?=
 =?us-ascii?Q?c7vkkyynPsSgwK5vTOZGRchZDwItta7PuZ8ftEXWBfKG/yQhqyO1Cm164QRG?=
 =?us-ascii?Q?afdjOH/344xJj5U1OCZ+lkrvRR6JCUwUUKDLa/g2RSOUTtDO+ALeCzsymn7R?=
 =?us-ascii?Q?iKLiRFyX7REN7oJBcpTD07OnrPHeKvNAL5Q+M5O5Xzp28/EjvkqxC+GubWOv?=
 =?us-ascii?Q?/tST1kGghkGOzqnni7fxuw8ESZlyXPpk1m6oWZlaVsQqNiXG3VxRito/njsM?=
 =?us-ascii?Q?BL4NvWJY0CPrmec7zDU59YSdw3Qs2ADh01e/7mMxT1S/vfkKiWcUCCyeI/rj?=
 =?us-ascii?Q?ll6WBHie+s0imagW3tF6uzzUGCv6oN8M+lQBLo40nZQKE86e1iGx80igPvnn?=
 =?us-ascii?Q?fvxcuMdsWlMTinusXTGxy6n4Nj9xx3rftXlW9l/q9DQVSPlNi98TYXjt+WCD?=
 =?us-ascii?Q?p2LtGdubDh4kzGJ48+tJ47DPQAlrZtY5/PETE16GnRx8qnwyDTWWARxz/Kkk?=
 =?us-ascii?Q?5fz88jnxs1gjTx5rgAVDWT4U6XgwbamoU2f9HiKD+gTaRyifG1qbwkLN91hX?=
 =?us-ascii?Q?cg1LrF+EyLw3Adjy7UMRKoh3idsLp1qdZS9VqPY8ak11Btto0H/nAQEU7wHA?=
 =?us-ascii?Q?6cyIpV55AX0Jo1pzHhLqKO8q+tFGer6x15aenzz0OQgjAKoMCwtsMfnFK/7O?=
 =?us-ascii?Q?7ulSPlF0Lajf1X9iqt56YpMw6qLZ9J33RAzo1ar49HPtLJQS2Icc4x7rMinb?=
 =?us-ascii?Q?CwnmPVFSM+4G0Jq4Ugvo5cLC6/J7EDke2BLBUX5fDeMCLLkgY4P2CPQX9WSh?=
 =?us-ascii?Q?QpS0qgr4LtKWYjIJLUfGNcRnKZlyunQPM6mbKd5dzS2D0zumCOH1B1iIOQXn?=
 =?us-ascii?Q?obrxTp9psY9qkWqtXfxBdy7iqIRoKAYaJnpHeNh+VW2fTORxPtOpaXIbZvlx?=
 =?us-ascii?Q?5IuOBcHt24J2+/eUpDLXd4yA+9IWMqB4TEaoDSbQPLWXXA3KE9BmMZGHEiox?=
 =?us-ascii?Q?0ekTSkfoaZEPfynSna1BWIzZJe3yJ8W71QIktreLI5OQN3lWyjAr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9baf898b-0054-4607-681c-08df2e264728
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 21:16:44.9403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwqMy90UaBOZXXiIPG5Uu7gYJXwveGGGNjhplKgf8YNW80oVUuDIBoNzRRFHlOO4Nh7tJsGRMxx3DDr5cSrE0dcKcYpwYTyoBYcDHvuZE1W5Jv58DKiwk3y1A4tJ1qCn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8779

On Mon, Oct 19, 2026 at 02:09:30PM -0500, Nishanth Menon wrote:
> On 08:47-20261009, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > Add a MAINTAINERS entry for Toradex board device trees to ensure
> > that we are included in patch discussions and can provide reviews
> > and feedback on proposed changes.
> >
> > Toradex has been developing and supporting its System on Modules and
> > carrier boards for many years, including their Linux mainline support.
> >
> > As the hardware vendor, Toradex has access to schematics, bills of
> > materials and other internal hardware documentation, allowing to
> > review and validate changes against the actual hardware.
> >
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> > Frank, Nishanth, Vignesh: up to you to decide who is picking up this
>
> Reviewed-by: Nishanth Menon <nm@ti.com>
>
>
> Frank, if you like to take it via your tree, I have no objections.

Most part is imx. So I will take it after 7.4-rc1.

Frank

>
> > ---
> >  MAINTAINERS | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 483415e46217..fcc2e429bcd7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -28088,6 +28088,21 @@ L:	platform-driver-x86@vger.kernel.org
> >  S:	Maintained
> >  F:	drivers/platform/x86/topstar-laptop.c
> >
> > +TORADEX BOARD SUPPORT
> > +M:	Francesco Dolcini <francesco.dolcini@toradex.com>
> > +L:	linux-bsp@toradex.com
> > +S:	Supported
> > +F:	arch/arm/boot/dts/nxp/imx/imx*-apalis*
> > +F:	arch/arm/boot/dts/nxp/imx/imx*-colibri*
> > +F:	arch/arm64/boot/dts/freescale/imx*-apalis*
> > +F:	arch/arm64/boot/dts/freescale/imx*-aquila*
> > +F:	arch/arm64/boot/dts/freescale/imx*-colibri*
> > +F:	arch/arm64/boot/dts/freescale/imx*-lino*
> > +F:	arch/arm64/boot/dts/freescale/imx*-toradex-*
> > +F:	arch/arm64/boot/dts/freescale/imx*-verdin*
> > +F:	arch/arm64/boot/dts/ti/k3-*-aquila*
> > +F:	arch/arm64/boot/dts/ti/k3-*-verdin*
> > +
> >  TORADEX EMBEDDED CONTROLLER DRIVER
> >  M:	Emanuele Ghidoli <ghidoliemanuele@gmail.com>
> >  M:	Francesco Dolcini <francesco@dolcini.it>
> > --
> > 2.47.3
> >
>
> --
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
> https://ti.com/opensource
>
