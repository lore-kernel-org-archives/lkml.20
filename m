Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011050.outbound.protection.outlook.com [52.101.52.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C282E3C3449
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355926; cv=fail; b=QvzTOQrpW5Wpr0EdvPahhWoCdWrERywPZvxeeem697gJ9kYWvoY2FVYBQgvyF7FahPoY7d0OjHI9Vk7yyx5e84Ao5gYCM3BzlWs6b5ebSz2HVge447Pt2DXPpfMJbIW7RAIFp7kpUco6xbdXMfyq7t6ELrgcTEGTGOLUQ1HzR0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355926; c=relaxed/simple;
	bh=IlGlaElDvGvHSWz5zlmNCTELqGdr2XZJ9N4FdAaWheo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rvY4JLN/B8IdZa4o92SQlwCrSLPjKzGlkHPewLM+DdHV3Fv5svt2rN/12I9hKMEfE4slh4Ov3vrIX3SK/gIlzF/O+NVKjsFQbEq76Ga2y7DI/EJMBcsT+MiBZNrO3qIAuho6am9TD6i0ENDdjugQLE21joP9e4jh+jWb3Z6Nodw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iW8SCxNr; arc=fail smtp.client-ip=52.101.52.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iW8SCxNr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuZ5aKIWeorvl56IISIM1s8pFTzgckLGOSS3VMb2dUlf9Vrfxdr65P1Og3kvJXOWeMXsT1oWBkHK9V0sGXhlkE8dPPaMOaBm1N9zy5XdOSP850YSvjTdnMyH5qP2GxUb1kRtU6Z/+n8BaJwbesHQE2WHnLwv9yFfCmUxqdVVIz+IZTSeddVQhGsHvALNyRP62w0j0z+1z9nRPYccwj2pHYtxNUDrSHFcmaHEo76V9J5rSVuYkGUJ5JNJgMmC+N9F1O3BwsBy/Fjtpd1viljEUuDQwOKLFq7txG4G9j9Kf0lPnV3PLx1eqUI4ng02oldgC2DS6XyXrMnrk2f9LIrknQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/qsrxbgkNVfqPoPzj17M3P9uR4eX1h0t43gncmcOUY=;
 b=yt6dueATYYT4BasxmtGszD7c4cDWD6qflhYhhTg5f7XoRXG/JnLZgUmpDcmrMFLmTn7tWhOKgbUERTcWku2pUes1+/kAQ5mOVu2OJhP213N4Edg9UTW2jRJHOOdA07+Z08e4GFY1M85ohF6i7haO4soQdyHJT6Sd0RAdz9KdptZUGCTVunYKoQnKY+kjDG3bvyJBiZ9kEDSzs601ZkNrXA221E/bjsRT4+rczkbYBSK4Mm0uDcm1xDpg6Jg89cwAZks1eheADTEmDxW0CMzBVPq7IolIkwz50PUnBCG6xi8NELCHz2vo4cwjMdulfXk1Z2D32HrJejxzpd4xt+eJuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/qsrxbgkNVfqPoPzj17M3P9uR4eX1h0t43gncmcOUY=;
 b=iW8SCxNr6E+WBZd3nCxqozEtFSudWNr7ErQNnj/jWJ4ud7d2KyL39QZqL4+mpv71/kI1x3rD5hKmj1+nm6ALSmlgxORooBJNyWonrcgSlrBZMJXDDepwCNWFqMAgOX1jJCuqD01a6qnjkkN5ufSwwaajSlFrBmPcsBvkumVzr3j4W7A9XtnGZ1xfPeSR5JvDWThc4GodS80P/WtoKRC4HlNgzCJiECvF3CnI6aGWpIIXmNH77QvfmW9YfBz11V/6+T0IB0g3qwfzfifkk09rgBQn8B0NxC7My+rf5PFkuXPRco0NH01Ix6f7iByd82sT/E72fhU2X9P/1F/0Vz66Cg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by DM4PR12MB7551.namprd12.prod.outlook.com (2603:10b6:8:10d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 17:05:08 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 17:05:08 +0000
Date: Fri, 25 Sep 2026 13:05:06 -0400
From: Yury Norov <ynorov@nvidia.com>
To: shashank <jain.sm@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] bitmap: fix three parsing bugs in bitmap_parse() and
 bitmap_parselist()
Message-ID: <arapwjg4cp25e3br@yury>
References: <20260925102307.49513-1-jain.sm@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925102307.49513-1-jain.sm@gmail.com>
X-ClientProxiedBy: DS7PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:5:3ba::26) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|DM4PR12MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 4979f506-9b6d-4353-5baf-08df1b272717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	I7Q4E9yCeNYHHnnOGGbgOfOdclLSVOCWx2q31fJpC742qNPVpl3+k5mHs47JgP3W3EiGkL+D7oZdaT2o7kXxs5qp8OLrg7EH3M6Y8UEAMOBFAW3hGFj8xpk/5omBMS3zh5ghZ7604boI9o2oMOQiHTARJFp5vstHVeYRIjJVLOwxrTmHxMgMK4fI4mKkiZbwXosjS1AuH7dQ1JMv3erOrj3wYjtyP4fZjEtXsxT5wZfO+ZT0MUSmyFtqEN/4k3KInYMgd8oVG8aWyuQwrh4j2EQvevA1OpzRKj5lcc/ADae6ZtPXa6t7ApwSVYq9B13jGWo38DQUFFu2jpyYCOBZHlFzzESvOMSNXpYh9slXrpzgGM49cQ4VkPUgu2VciYEWmexFDwC52EO1qL/OlOq03bwghf47sEMRgpbBvd+2rITpcZ55K8xuool25E9g+pJ0P2BL+Qx0Zm2fFHjL+SI2/YOpAJs5JobUqvjy0fRTiF18vxvPHZUpBaIMVMAD6hXQ0NullUV9NzEiFrRfl8w+zhZ87j/OIrSemMETe1tu8cQepG4xsOcqN+u8IXEKGBrrP4WwKWT2d2Xj6A5VO6BCuzqQHQl3H4ztp1pa/ut96xSoQ5LIZKGlwMbKOdhTAw322aaCx/MFo0o2GrY1ecanMVVqcic0P51VLoBHGQJj+es=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3+4BCtTMnc/5MGa4CosR5XkX+etVvlDENWSaUwOcxjCUnG//qZX1UAzBjllC?=
 =?us-ascii?Q?2ehD1HiApXnbPoKDhifwFCgN9BxZ2zJVYNfgYcSMe52zcIGApZTmXB0cSpbr?=
 =?us-ascii?Q?4aHA5/c55uZRr1JIae9QyiJ0H3UTinLssq61DjbEpwVBsQhoLu602sa/wvAX?=
 =?us-ascii?Q?iq2cW9thSk+zWDHwFe+4hMYchNESLENhU4THGtLpUUvZIUm4MT1afmBMQnUw?=
 =?us-ascii?Q?Pusy10QVsCeUkjlKA9AG/kNb2DmQNhoInwFSu5Cd5q+1ooj6gvc+S9zjzzvT?=
 =?us-ascii?Q?FAgfgR9uIfVVSi6z3Y6XIZvpNdlNffKtD4KjxUj4rPTxz7/9KIF1fysLU2rQ?=
 =?us-ascii?Q?+wL8UiDhTIS8XsXT99pT2Pr0PHnIbkBkFetdpNHmrKIeWLOgLnKUP5fVLGu+?=
 =?us-ascii?Q?8KBlUZVD3O13JDbtCCwN8smDAw68J3QqJbGbMjobVJWDEpUh/aDgj+FWVmo5?=
 =?us-ascii?Q?Mi8dC4kQxWeqE6HLffKz6odEwbCaxKBO2L1MP+PayNQTmNtbg6AGf77LhBBt?=
 =?us-ascii?Q?zlBRCIYBEfoNT91d+NWOVFf9Pnl/FJvIg2ejT2oXV8m1q4DyoiOY1f69p6m2?=
 =?us-ascii?Q?2hmNQ3jPknaxW6TdCUDHWQJ6QvDreoKfNGe/XC5tCBz2h6CsYyWpDf78GlHV?=
 =?us-ascii?Q?XwKlvzPAd1yx6jTjR1EYVXeN148oi3SEqo4r0J+7TfHtfIaRoUHKZRpPSNBi?=
 =?us-ascii?Q?TqjbhwYVrMU/X5Nx5byvGzFIpu+LnMurfgiaCfCZkdK21Lw9vwN9Ht4w+vF3?=
 =?us-ascii?Q?HJZHjAUQ7l3118UtnHXQvisxgyU7cHRydPkrjhTU3cOBHKAvDZSxZeM3WOtY?=
 =?us-ascii?Q?Ep90+JGWbUzTP3MDLX2wy10Oeeh5C9dssqQAHtgChLM+MqoWUeURCLry1Hvz?=
 =?us-ascii?Q?zTltj+1Xq9J5gK082GWoJ6BxMAUlSZ0ltBm2QtbrbpMTDhRQLefwvM6Quvna?=
 =?us-ascii?Q?4BTiFpEwuwpBUXDFZ9+JEaYNgpeFKNAs4Vx3yEYxYAm8ARv6sR0UB16s4we6?=
 =?us-ascii?Q?zzBB7c7zMCQUYSzcLpEa3IuyPmeqOrSamQCA+MZU0dNPtME1XCWlZyvUg+lm?=
 =?us-ascii?Q?joK20Bj3+bsrgdWryI/+V2Rd8XAATtwb0YAn0g1ttE1YZyIOuWRSfB1crNdd?=
 =?us-ascii?Q?ZT2nPIEO5yOKE2L3V6DzBnBBC/7Li+FZ9lK1aIRYK34kbF6lZ8u1JE8FAdSR?=
 =?us-ascii?Q?IwRl0onQdI84iOy5NtF6zSlSaYSuF+gH6x8Xh50HF7iTAeh/hH+iG2EKnTzc?=
 =?us-ascii?Q?R2EknbtwizJU0Sg9YAOkd1fAT6P1XK+uB5pU9go7F++qu49fAP3fwljUVoPd?=
 =?us-ascii?Q?p/haGazKHo69pwli0ITsEl3g4hm7TkZvwGbZGNU1NFlHLTau+r0QNEuqOTi5?=
 =?us-ascii?Q?iWFpyqY/AapFt7g8scJHWd73t+rgeOLv2GiqgqyPGgcBk9TLRH1SEHALc1S3?=
 =?us-ascii?Q?SfceJG0GigPmkRNbB54wXYRE2er4QclkulC9xAsUZMfiXUARmMLuXxPuBVsp?=
 =?us-ascii?Q?fSlq0RPfIM0RyHpOGdDVvBfRJV6uG96NtaJAuOejkeC1IoDnsxwLVIOcsIbU?=
 =?us-ascii?Q?BNeBxY+1DIaOp4xyWOYiuhAosvqKCZPD48xoY3HweT9D+MLUAFPKJ2TK/Fna?=
 =?us-ascii?Q?dkWGOYJuE/2UGRSxIwOK4mqPcxJfY2WhoWOVqyMbEluphJ+R7nH5B0pkBMff?=
 =?us-ascii?Q?d1hNS18VWIoPWCfjSU8NnnOhlRHR7HWDlMBfg+yZfR409Mt7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4979f506-9b6d-4353-5baf-08df1b272717
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 17:05:08.6318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCwvx+z95aXKgyS6VSNXiEm684teEe7nQTHmnpdSgvdIinkcofkTHmRtxGQbVVCLclZ+NJ8j8PZwMt95vgJJ+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7551

On Fri, Sep 25, 2026 at 03:53:01PM +0530, shashank wrote:
> This series fixes three cases where the bitmap string parsers accept
> input they are documented to reject, or produce a different mask than
> the one requested.  Each fix is followed by a patch adding the failing
> cases to lib/test_bitmap.c.
> 
>  1-2: bitmap_parse() treats a non-hex character directly before a chunk
>       of exactly eight hex digits as a separator, so "x12345678" and
>       "0x0000000f" are accepted while "0xf" is rejected.  This is a
>       regression from the bitmap_parse() rework; the old __bitmap_parse()
>       rejected all of them.
> 
>  3-4: bitmap_parselist() does not check for the end of the region after
>       the group size of a "range:used/group" region, so since N and
>       all became valid region starts, "0-7:1/2N" or "0-7:1/2all" are
>       silently parsed as two regions.
> 
>  5-6: bitmap_parselist() walks a "range:used/group" region with an
>       unsigned int that wraps around when the group size is close to
>       UINT_MAX, setting bits below the requested range.  This needs an
>       absurd group size and never writes out of bounds.
> 
> With the series applied, test_bitmap reports "all 391544 tests passed"
> (UML, x86_64).  The three fixes are independent and can be applied in
> any order.

That looks reasonable, but please resend the series with your full
real name, and also specify the version of LLM you've used to prepare
the series. I'm uncomfortable taking anonymous commitments.
 
 Thanks,
 Yury
