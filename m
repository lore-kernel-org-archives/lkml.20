Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012006.outbound.protection.outlook.com [52.101.43.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046CB39FCE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814235; cv=fail; b=r3bmugXnIZMfnkhp3zLNCh01co+4NgUActXnmU9S8pqLWmA4/ZRweC+5f4JbaKQWwBMVvH/AcfLda00q89oG6atVIVBVnPAoTe8P+CkqzARhfWF6DR+Lx0y6/Fg6oBHAwGNSG5RRHMFLk6MPQDJZo7cXNOAgs7Tyl+WacJPsUrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814235; c=relaxed/simple;
	bh=EbPs3HPev4hKerztfNBt0dmAAEu9NCJCovShRVfE0w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H9/5+aJ3fDn2OFUWek2Rh1Vh8owbX7jBV5CG6Y9G/G0lUc0sklPf8V6BTskYr3BpZNluW+BjNWicSIyBZ5LTfiJROL0deJRErwzsrGuGTnIRTPkzF3Q5THSfp8hHGZ0aa6rdzQWNIOte6RkI/asuqnoJKYtPPWnfoXmvP6G30rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fqUqCPzr; arc=fail smtp.client-ip=52.101.43.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fqUqCPzr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGhgnPiHv2rcxBcNA+kZmwL6ggWmQ6U+cKEvs7hNrtxE8bO5rf2BN8Hb5ogr/+vcDSj3CaCnPatCc3T26HvB1w59uc9jxyOlU/l0be9yhkUZrOJ4ya7DQac1VMcp1QK5zJ0jppk4Ta7HPMc5oSfLK8Ai1SHAOIRGZxPvxRHa+ctTJxbVzl2dbY0rSz6FYzEedBCuJM9b4Kwdb8s28SsGR/QpGPtNiICIPvYIO2krpT5NTgrnkIa3Ys9kWPjbNjOicrA6WoWGLMtZSM+PASbfb/15l3+pRlAmt11SmHXU9Yc26lgxY2oO4bvfyCHQxt4qZucFuPiEzmF6GRv86cDV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AScScHJHkUOti4W9RII8TM5iai2TnfKSp5e9OSE7fgM=;
 b=NOVoHDt/vV2qgq6MzNsRRqucTQwpQ+0dYN0W0+Jd7ZKAjtcmcF+fELHzTMBGyKZyH99L2TTHfLj5dyrKDkzbJ5ttVrzGjzHgJNtrV71XhVYHN4xSeWhephpXQywtfNlTMOO1eO9MZsBjYGRNe8OirWx8o+iO8XtW496NQMejHck8ZdQ+xxEuDPjVbBCgsNPcPcxTT30TUgOvpccm86knB11NANb6WGmwXdG2Uv3WjPOlbH1GJDn2ouJuJse5Ht6BYFZnxF+s6Cjnty6xhPFPY7qX3N8zEZ/c8RZ4NhQL9ECx6wPmoYAtUYNZqFadQHaniFCFURBTVmcfbs5E0echyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AScScHJHkUOti4W9RII8TM5iai2TnfKSp5e9OSE7fgM=;
 b=fqUqCPzrT2qL6QEYpkpdxezx1NGawISVtlFziDR7m2UQSWUIjVy03cv1BIWo/3MbtSLxJt7wbMusr27wgoDI4rGfiSH5Vk3FFseETl5SwDfSGJKrbO3fbEI+lg6cUvpwS6AadaSjDtakgD40NS1iQ/Bl6GQY1lQgEQBpXTgnfSw5i/gdPpjpugEWeji+bJHZ8Zo2xuYA4vnJQ00Xl9dZwF4kQma03x9TO7+9yZg/n01gKKyHMSDenMgFG6/QTU48fzC6sXB8XUvFTys0BMqBt9ALddCjr4zhvQYBb42xJ9bFIvQCF1P2EDNS118Ny7VBnFlUT0YzTVHPvptf2XZohw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by CY8PR12MB7362.namprd12.prod.outlook.com (2603:10b6:930:52::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 00:23:48 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 00:23:48 +0000
Date: Wed, 30 Sep 2026 20:23:46 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Andrew Morton <akpm@linux-foundation.org>, shashank <jain.sm@gmail.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Jeff Layton <jlayton@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 0/6] bitmap: fix three parsing bugs in bitmap_parse() and
 bitmap_parselist()
Message-ID: <ar2oEnD8i3qP2Dkq@yury>
References: <20260925102307.49513-1-jain.sm@gmail.com>
 <arapwjg4cp25e3br@yury>
 <20260925133951.a80670af112718d9b9c271fd@linux-foundation.org>
 <arfQcR_iUru_HQYh@yury>
 <1237394198.791420.1790808408141@kpc.webmail.kpnmail.nl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1237394198.791420.1790808408141@kpc.webmail.kpnmail.nl>
X-ClientProxiedBy: BN9P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::35) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|CY8PR12MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd27b83-0992-4fbf-114e-08df1f5242f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|10067099003|4143699003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ePq9afLHCsxOb4wbFnTubHCIFGgEPDYfBUt0R0kkpCFgzTUzLJkkOrsLHCYaS6YdJUXFLcoi9mh86BLEKFleInptu2GosGiHBPBg5W+2c5MtcQrf62WbGzwLeTLFyl0ab9hJuMmw8jSIMJX2OA6WN/7mN/0KQshdB+neDMMz4lZMZbSZyWG14l87zJHxrP0e8z3xrGZxrVqmcd4ghzHzyhmSGIPArkSOiK0LI2SfUCH0e/8l9LQGg/HEDyVD4EuJ8FykRerpTFPha2aGbtzKRMW+bVnLSjefuJVTAYyZAP+5kbrBxA9TypbG7lTqJ10V+o1uHTAGqiCi4Bl7l0knpFUHwOnAk95AMPFXfP4dVaxUYOH93iuMMRGyMqhSwzDqyKEm39XhUH6jndWrEO/kXS6LZqcEKN1V+pfPWC3/eMfc7k7XOjRPSblB+pNxLw9K0zhdOZU3JF28xXAoYs/sU8jkzc8it+9eS/NcOxJ59bOEFk1pq8WOToNGaiP5RgFhn6M6WHl8FVYiR52a5YcduvsYnO51kbdm9ZzmFB/tVpdqTS7i1cxtLXEQxvTRjCj8+CJJrYlruOa+s7/1zNP7542bLF1UBxtheFWvW67a5Pd16BpOmTJqpYqL58N+ptiBZYpdIMraP7Sb65TtlfsPdlBwgFkVOZaRI7KME083mo0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mXjuK5LzvZnrVO58O55bj53ObBb9gTp2UgNRJLivwiD0q8pUvM6q/8Na6mZK?=
 =?us-ascii?Q?cgkdUimzbBCf8dfVamdMgDWl/AygEFpWpknqxHLm1/svIUwWlbG/6/VRtt15?=
 =?us-ascii?Q?tJ2W3KTabJwHwEOPbMIfqE/JGOpE0elG5kcQeBzB9+O7sBBDbqrBqByiR0GA?=
 =?us-ascii?Q?SdAyA0tuM5mv25E90640u00ZDhJY8Yw+vOciTXbXrusiIOsahB/GVmSW4hxG?=
 =?us-ascii?Q?eeTXX3xRgSC07RarHbBLlo7ymEN+c/j+/j0u+b0ekHsfFsttZUjQxSzdQQWG?=
 =?us-ascii?Q?DtXc+maG4bq6iNWV5H9utYcxWmJziyaJK5ZkNazdB23muuxcREoIRJs8TLFS?=
 =?us-ascii?Q?ZPT+s2T4aoCzqror6oG1GQHFkdIbrATsm9rPhfhAexpoB8O5AFrbmedLVMs9?=
 =?us-ascii?Q?BGT29CdMLYCYir5P3QE0+jcu8zNBihHxjNq0N/uar6Rgp7ZQnEhsKWAlg95i?=
 =?us-ascii?Q?5i1FJgAqfYw4THJ2pRA7HdLePFFa2rhaWWMJwV3zCzLke6AXwpy0CIjoXI0m?=
 =?us-ascii?Q?H4j4kbDkkcTKluVWvd0H/5b0RTp5DDNK9j0+CI9SC28JC3TmLMlyhudoe4Q7?=
 =?us-ascii?Q?TUzNKvq/H9RUu9+/A1bh2lmKoAhTFzkJL0tfmsE8tnLTONutExLFpXObB8lL?=
 =?us-ascii?Q?Nhye04NUIc/cjCL80HxZGH6QI8TaUxXXDRw1UIsoddVk0WbPvdZxtd2C58Jq?=
 =?us-ascii?Q?MrC/4B3SMJyRm7iuCjpIHeoGGPi/QlGVEpvEQ3+tW3ytuOMCI0ZQJ+vgwgrZ?=
 =?us-ascii?Q?IGb+CcPlWXG96wYxxOy+QMR/eEiZvrhrpRIBdy4LSGulhFNns3OEfukaGyY3?=
 =?us-ascii?Q?usJkT/++vB86iCXBXd9DgTK/+jafsCrvV4hCqmgB3mCaPl/l76roV1dGM5IY?=
 =?us-ascii?Q?fM8Ex/jtd9zD+NF0s0IuTkAA2O6GP9vnZLB9+V/hwbMqj1hLSsbHgnedHdey?=
 =?us-ascii?Q?x9utgumYTzeTaUHKsk8CW6bMIVloCSqfmlbkXfqrcQzUgPovdubnaok3c5te?=
 =?us-ascii?Q?+INLNVrsKwNaMlNFchCdsSWGvwp35Q1C++TSB+qXSo9tqMRY6KokYUINnpM2?=
 =?us-ascii?Q?OTMlgD7+QaBtaW5b9F3EBIv3G1GQyEjGGiyBIhFABPijCYXky8CvokSlTUX1?=
 =?us-ascii?Q?t0oWfErnEmIDYoIrQJz5dczepUNEQyj0m6I0A1yIangt26CyNoHOfZYSv37W?=
 =?us-ascii?Q?od9JcYUCxJrooBi4QnTJnbUAWj9TBzQpMnc02f01VR6v/Ig7m0TQ9hA7QpTa?=
 =?us-ascii?Q?BNslk5ASe37OOxRIK7iy1AoCwUOG2P75XxrQA8Ulfj03s+SCTdoGUcJcuo8C?=
 =?us-ascii?Q?/8mmkaRrdlMPer6qwSJtUop9bm6y3K2buYuGTgbnU1DTKkIODtckwSXHVAv0?=
 =?us-ascii?Q?GNdavrA0cywKT/u2F2Nk07+30uCPbJ5Cf1dghdWhdR8sX3mC3toeIGPnxJ4t?=
 =?us-ascii?Q?qf6bV3yR9mFOo5gmh4lHbvDs1Ms2EsmDYHvifNx2gUlB8MrFTJBFU33UQ1yr?=
 =?us-ascii?Q?Q97CyFR9vHVee1+s+MLg78xOEvbhmXQz6z8jLvde8UJuogxUcX3A8K8qfiUB?=
 =?us-ascii?Q?QjfsziYMUih+6O7ARp/caxiNutKJKMPQ8zeZuS6kEqViftvJuMAe6XzFfTU7?=
 =?us-ascii?Q?Bm3TzHgq8wUOPfKtV42MwOHN7daQ7LzenJ7GsGLgMJTF0nKEOhsleK9BFjho?=
 =?us-ascii?Q?imtjNSQ3Hv5LYVhFV+BuLi1mOO6068QtNAr56IJvSWFTh1Pa/wbxBn22CVbI?=
 =?us-ascii?Q?gXUKXrer+w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd27b83-0992-4fbf-114e-08df1f5242f8
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 00:23:48.2936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNXb/dKVKMZDJviQQ6gaePw8yOAHAKGRYcVxv84cr5veoFgxqG7RU+VGdj1lrViWJ45p8GymYPqsxESgtnvCLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7362

On Thu, Oct 01, 2026 at 12:46:48AM +0200, Jori Koolstra wrote:
> 
> > Op 26-09-2026 10:02 EDT schreef Yury Norov <ynorov@nvidia.com>:
> > 
> >  
> > + people from 816d9992d9ed
> > 
> > On Fri, Sep 25, 2026 at 01:39:51PM -0700, Andrew Morton wrote:
> > > On Fri, 25 Sep 2026 13:05:06 -0400 Yury Norov <ynorov@nvidia.com> wrote:
> > 
> > ...
> > 
> > > > That looks reasonable, but please resend the series with your full
> > > > real name, and also specify the version of LLM you've used to prepare
> > > > the series. I'm uncomfortable taking anonymous commitments.
> > > 
> > > fyi, this was changed by 816d9992d9ed ("coding-assistants: simplify
> > > attribution") - see latest Documentation/process/coding-assistants.rst.
> > > 
> > > So now everything is supposed to say only "Assisted-by: LLM".  I find
> > > this regrettable - I'm interested in seeing what people are using.  Oh
> > > well.
> > 
> > Huh... The commit says: "provides free advertising to proprietary
> > software companies", and that makes no sense to me. My email does
> > exactly the same thing, together with the emails of the  vast
> > majority of the community.
> > 
> > Can we please somehow revert this "simplification"? If people use
> > some wonder tool, and it helps - I want to know the latest best
> > practices. I want to know MORE rather than LESS.
> > 
> 
> The analogy has no bite. No one is making huge bucks off marketing specific
> email providers to kernel devs.

Alright... My 'email provider' is NVIDIA. It makes huge bucks in many
different ways. Particularly by hiring excellent kernel engineers,
and advertising itself directly in the kernel mailing list to hire
more.

> Also, we can't get rid of mentioning
> email addresses. You need that information. You don't need to know model
> specifics, and it has nothing to do with best practices.

Please stop speculating about what I need. I put it clear: I need
to know which models my contributors use to prepare patches. 

> I think you'll be able to find out about wonderful new LLM models also
> without the tagline. They are after all shoved down our throats at every
> opportunity.

Again, please stop speculating about what I'm able to do and what not.
I show you what I'm definitely able to do:

  $ git log | grep Assisted-by | sort | uniq -c | sort -hr | head
    209     Assisted-by: Claude:claude-opus-4-8
    169     Assisted-by: Claude:claude-opus-4.6
    161     Assisted-by: LLM
    140     Assisted-by: Claude:claude-opus-4-6
    112     Assisted-by: Antigravity:gemini-3.5-flash
     93     Assisted-by: Claude:claude-opus-5
     93     Assisted-by: Claude:claude-opus-4-7
     84     Assisted-by: Claude:claude-sonnet-4-6
     79     Assisted-by: Copilot:Claude-Opus-4.8
     72     Assisted-by: Gemini:gemini-3.1-pro

See that? Your wonderful innovation already made this 'LLM' crap #3 in
the list. Now please explain how should I motivate myself to try a new
rising star model named 'LLM', and how should I convince my manager to
pay for it?
 
> This will I presume be discussed at the maintainer summit, but there
> was quite a bit of consensus (iirc) to bring something akin to the current
> systemd AI policy to that kernel document. So, emphasizing what the LLM was
> put to do, keeping only the short assisted-by tag for quick filtering and as
> an alibi to point people towards this document.

You guys discuss whatever you want and celebrate each other with the
consensus you've reached. Just let me and other sane people to share
important information through the tags, as we normally do.

Thanks,
Yury
