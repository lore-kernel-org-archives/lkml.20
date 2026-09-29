Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C2835F199;
	Tue, 29 Sep 2026 19:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708477; cv=fail; b=H7PRPBjAhQTsYdQjXlxl5KG+u87SWzb80OCvfAB+0SFxpZ05a6/FxaE+R3ptJD6JWUQOswTBFE7v0JNRR15uNa3dKPf7WTuZtarBsQ7UlNmoffc/+BZRf1GbcxUYgjpvGIMy0lk/CYTWbT/fuTo2ojb3CR2GK94fSQtMPFvQIxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708477; c=relaxed/simple;
	bh=zuEDjgMmFmDjfT0AdYc4vhfMp8+jujHEAIrqhqRet9I=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h4l79gnE3/7YmnC0qVKTarq6zS2khv4saj3/H45iveFuw4jAShOrWVd54Yb49Sly9hzOiYK4ibAykpMJkRocDQ/Dqo78S4Z8kW9qkjS6rgWDXzo3SIvOhoplvTtzrkE8uOzdx1LUSUgolLgYusSmNrh7bSkk8mecnU6W9mtW5ic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ThON/CyF; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThON/CyF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790708475; x=1822244475;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=zuEDjgMmFmDjfT0AdYc4vhfMp8+jujHEAIrqhqRet9I=;
  b=ThON/CyFMrOFHreymIX2/6giXSDExxO4MxnxXccQLJ/vsvslkCQoZA3/
   houKVoU5cNvEUSvqQj/3XBwMipZsh03nqbKTEWIAXiLjRQQW1PZjPpm3v
   UqZIzCl55aSt+70Hbi19M9Fz16DCvSlTJaG9pKQIIoQbOBUW15eXpz4na
   fNkF8eXwOfjRjuerVeQmbRJ+oigefM2W2MkTSQhxhHEPpJs5JYpRIMACe
   SuU8+aS32ER8Wbx8oVU9fOFvOuGl3n8hXWtc/cS4AWTuKv3F76tC1clYB
   bwrLWlyLhuNgW6iKdovb+Gek00pqzx/b1+RQ9xUV4mlUkMSaFFKnShkKO
   w==;
X-CSE-ConnectionGUID: Vei82aLTQemc2/OkBqalYw==
X-CSE-MsgGUID: 8HZT3pIWT+iKV75Tp3B7MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90386502"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90386502"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 12:01:14 -0700
X-CSE-ConnectionGUID: jQ/Oa8wrSl6hxmUAvxpOYw==
X-CSE-MsgGUID: QKR+yLEtRlyTRyVy6EdCHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="283543743"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 12:01:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 12:01:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 12:01:13 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 12:01:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZe4nsDXv8GJ/T2loomzJb/tQou2tN83awzvlo63+2Qz348/Y6096JTr3Forq9IKQQpd6koOHZHrvXuDer+Pv12uAjFDi0XJzFHo6KrOem+Rlp45zJ2g8672aIRS9BmK+yZKAS+XSvlfE7RhhKdJg4BxQjQwA36HvV3IMrxmPfDl4t2s/yOBUDkSon9i1IfWpFLD7G/6v96x3dpC4gxVSz5SuCniKxq4lmu6Os1SwTRTJ1ZAM3IU5nBUVjCwJx2nqVVbIauJE9hXZu/ZrwUj9neF79APGyNO0VaWss1a3g5vkTc8mbh1NG59FSWqLP44LmnhtoIlmp5mLe/Q/kTXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xygwLLdKD17Xb3+vDRnS/TSmXKGGIiFC02jg+BGEU1o=;
 b=T1X+jphj6DYmASSqMz59aIKJfTrvDsYqXJMDVGfZjMfI68tRTMa5FKKTuOV6npSKcWzR3PAQo6Scy+bnKrGwEe3mBU89lJJ33H4Ys+dgC45PL+IVqbo0vegNekK1aXJO5M3gfvD2XEy9oiz0hYFcCVb2/y48rGEmwgKm1p2wkvSfFlFCPxc6T6L0H7yvqS4r1S4XxppeXvqiofS/bZXj7RKvKLUPS93FHGby5dO5IWtMLpRdXzobfyYMw17COrelpkUu562vXGfszIl2WAg++IYfgfWPuYQf+sHC3nM5MAaUpQT8NNlJl6QX4u6+OwtBlHAE5IdseXhznM4xFNV+mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DS3PR11MB9671.namprd11.prod.outlook.com (2603:10b6:8:38e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 19:01:10 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 19:01:08 +0000
Date: Tue, 29 Sep 2026 12:01:06 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: Adrian Schlegel <me@adrianschlegel.com>, <linux-edac@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] RAS/CEC: Only count corrected DRAM errors on Intel
Message-ID: <arwK8rkXD4cPXesg@agluck-desk3>
References: <20260927151904.30524-1-me@adrianschlegel.com>
 <20260927181456.GAarldIBZHgSV3Qe5X@fat_crate.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260927181456.GAarldIBZHgSV3Qe5X@fat_crate.local>
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|DS3PR11MB9671:EE_
X-MS-Office365-Filtering-Correlation-Id: 58c5c39f-4133-4fec-82e9-08df1e5c04d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: rxoX17BBeYe2j1I6nX7yrIlb7abtKmpovdzzfn0pDNVmIaHLhGIJgaNh9mJC1iLkdwWTkdx69rPE4E3L0o5mQTBPnQu9kdylgJO91107GR6Fq8JPSq9tcAKKRDdlNYj/MMsoGUkcoRx4Wa8TxfnESXOgTX30EXzNlNs77MsKDMfrQGHkdTs9oqSNk4RABhu8/ZgeJd8T8vWy3jU+BK9bdKjqKEQpRfn2SB9QXXjrnJUEjrgHcevQDp20tGZyuXfSoVElaVuwiP21w5ygXSZ1QSw6nmmANSiDNF1TQsgsaqC2vfUBMIVwqlGftC8ZiTodEKXjcs9ALSy31PhsOVog+m3sD+WD7y4iUBi+bkEaJrFFVwRqpefGvjeFWImu3hSrrLdR8TeoB+S+9OiifKxRzzI5zzzSNX9RkngqFHiIFlEaf1n48siYC0s0KcU2K4hQdnj4bbIE2wXs9aURKW+hVXaH0edywpMWagJK6b8dWqOe0ebrWbJx8P0dMN1gdINOjY5JvtlWuR/USHHOLwBLBROx5oQ+omYrfosG7nG6CUe4qYSby+lbm1E4aSA6qfxB6voJsAw4dMAO1HSwR06jBl1tWEp5toZ0TXCjwUqSD2qXxpndVu24TsGe0V5arYKsESH9qdsfWhmS5lM853gjRVVH0NjjzTAp+ohaRbfWyWQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+d5PICwj6F3sgwahX62oVVx/Ou5wSCYCvOseXv3CIVxdy9hBKw/FErDwxxon?=
 =?us-ascii?Q?/mVjR7tUR/hC5kwy5viWHtobnMvDoIYkUf81KFuR6n2bRPfZYEG7flL3I9in?=
 =?us-ascii?Q?EJIfpt6JGHLUCW5TbaPOhgKC4a2iX8+/asKuAQBYwjue/icLggZaP+aLu40x?=
 =?us-ascii?Q?L27aPJz23fi6Rl6Tf00FCyepsP9SBqHb3Q6zmyzsFUKeCdROl4fpOoYV/TQB?=
 =?us-ascii?Q?oaXtgZqTqwqJqksHygziHWQmfgC8pCjkruQtOxQvEw1Ltk2sy9gPsH+vUR7f?=
 =?us-ascii?Q?2janJz6l0fap3PLcsm0avq1UsAuEmnyrrKhEYymG4A1wYTUPAz37zj+lYbr1?=
 =?us-ascii?Q?mwJvYksKNaDFO3XXoLuI2YWIj7lBWpzMcmsAvd7uI/aJqnAGb7V/bYBAGUI3?=
 =?us-ascii?Q?AdhkOPKB8Fw8xtZL04xoHPxM5KX72sWkoh8EbvT+ulX0PWX53AM5XfIqhvyb?=
 =?us-ascii?Q?R3DJ8znH8j7JSSnbm3+iUY6LtbPC4hMENlxu225spHFOzl2Mt/p5ckcvmkuf?=
 =?us-ascii?Q?yyX8LrEOR3pTFzbjLYbuR6relk9PmDMntI2Q4UDcXoYY0m7e6Bu3Km8MogMu?=
 =?us-ascii?Q?Z+Tw5Kz0K3BMPzd6sDKXNDqvjKWESz+taihNs/MyTO6Ieuv1+FONhgs2QRvQ?=
 =?us-ascii?Q?iYOTgJLrqypXmgHLjJ+DmQR+bfDUj0bgheL6u6rDhKYto5H3N3W7jlIO5/In?=
 =?us-ascii?Q?A5sgD2wK7nbViAxdJS1WMMRJWYGQDDgDp8UCv926Vgbaud5XRI6P8ifwjxP8?=
 =?us-ascii?Q?mncxZ07EqgtXmZ6na0AV5GtpAjvdkiHSyyiD3igSmo4O2pAsCgyrs8LPtUQ+?=
 =?us-ascii?Q?leYAV14zqb6nHitV9UIaI6zy5Di0b5e01Mwr9MJqrK4xlsr79NX4LeQL+/AT?=
 =?us-ascii?Q?JIEERdLObclTky6A+xF2cgv3Ezt+1TEtTGIoVIQmacgSHriYA7yluzuraZY+?=
 =?us-ascii?Q?epa/Z3T+fXX0mSXb/lXJM22xpuSSmSOsQUBrtpPuxkqJ94AoZzuj+2hVwC0c?=
 =?us-ascii?Q?v+GuwanE2eFK+KclGKogjDPlbHMa5TKgm3dgbOIyC4WKE8KJs0Fzfpz+wF6E?=
 =?us-ascii?Q?ow1Qd4uWam1wHso2bys0QYZEpf8WW2k89MFPGWoJtdNoVkbSBPDjTYtr8AuS?=
 =?us-ascii?Q?LemgOe843KinCBZFuvrCHeLfiRRouyYpa9E/fuwBIpfH/o6nvTHlZcMBy4zY?=
 =?us-ascii?Q?lriINJRz2B6k4ePWQvh+2EmHMko1nlf60y4fE2PnDdKnjZIbDnxNFU52XeRS?=
 =?us-ascii?Q?PMEiHFBSNZNPhGvS1lWBQ4BubH51MA+91NajyO5WTKHL2V28qm4dleh5HWMG?=
 =?us-ascii?Q?Gn6YEJ6Qt/9Fx21s3iAPPRsQw/mw1gqRWHpZ35CBXmg0DClULAQ8pijBZUqb?=
 =?us-ascii?Q?IyhhHBvqaddS8cVQV70P3k/hR/oVw2HjnphMSYBp0yfQYWzUnxwwqaQaeRST?=
 =?us-ascii?Q?i8A9zkzfQnukwM5V7cBgolmUgdHgNeE4bHjTpUMfgDJo5uaxs302PJArzFip?=
 =?us-ascii?Q?s+XvkPWoPlXgIhP9F+/1XGbovM1c7/c9Tf8dshp5aguKtK1TAJrRInZXxOSb?=
 =?us-ascii?Q?RoNkvMzi2nh2uNjmvCNSBibmozBXRSSrucsx9jFhnk+8WSUMkCzdv+bmukM0?=
 =?us-ascii?Q?3ra3k8EzndkCVIkUAQDhSJtFmd7pkZQ4WLbsoiPBCHDIqwM4Zq6GevevoFgf?=
 =?us-ascii?Q?bMinrhEJFhYPj3/j7ka9b/NnoILAUdJpbLmz8ifcidb4r8k1hqalsjbnYVOh?=
 =?us-ascii?Q?Be7kWT9xyQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: fjqM9vMdhFO6ZhSymA2S/N0NeX4irTz+WxKhNwWHJnlM6Uw1WTtXD+BuslPbBmZe5aPZJuXrC45f8uwRLqaTiFHsVhKftKiIdB29Wf3tP+r+8DeqTz5MC5OaK0fnyjcudLO7Yiq6jHOKxN5UjrWESsLZgsIafVFFKgZU53B4mNIqnSpSB+7cg0k6Hf24yOtlE8Y9OcD2PITRRl4IYB+kUQsq2z+VlyN82CJssYeMNjPNp96icGNaB+h6e14SYsKvCtOymeKErJusSYyLye0A+7ShVKuTJY7ZsRaVvwBZ1qm/wZ3Z90wughScNYwyra55JltFIErPLurT9aUUHLFyoQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c5c39f-4133-4fec-82e9-08df1e5c04d7
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 19:01:07.9204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbD6/Izm1eqYI7q+FFoFYWgWsRoh0ubJyRPrSFrpWI1RdwPXTJdLF2zcCpzqpc9BUIJMQwPcgJf/b/YKzBicyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9671
X-OriginatorOrg: intel.com

On Sun, Sep 27, 2026 at 11:14:56AM -0700, Borislav Petkov wrote:
> On Sun, Sep 27, 2026 at 05:19:04PM +0200, Adrian Schlegel wrote:
> > cec_notifier() is meant to consume only correctable DRAM errors, as its
> > comment says, but it relies on mce_is_memory_error() for that. On Intel
> > and Zhaoxin, mce_is_memory_error() also accepts cache hierarchy errors
> > (MCACOD 000F 0001 RRRR TTLL) and generic cache hierarchy errors
> > (000F 0000 0000 11LL). That check was added in fa92c5869426 ("x86, mce:
> > Support memory error recovery for both UCNA and Deferred error in
> > machine_check_poll") for uncorrected errors, where a cache error with a
> > valid address can point at poisoned memory.
> 
> Looking at what calls mce_is_memory_error(), it looks to me like it should
> exclude cache hierarchy errors but that's Tony's call.

I did some GIT and mailing list archaeology on the origin of that
code that counts cache errors as memory errors. There was a bunch
of discussion, and four versions of the patch tweaking various bits,
but the inclusion of cache errors was in the patches from v1 and
neither I nor Boris ever questioned that part.

Twelve years later ... I still can't see why we didn't push back.

I agree that looking at all the callers of mce_is_memory_error()
they all expect it to do what its name implies: just return true
for memory errors.

So the right fix would be to nuke the BIT(8) and 0xc clauses and
most of the multi-line comment.

-Tony
