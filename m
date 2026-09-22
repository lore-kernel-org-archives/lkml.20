Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B7248FF67;
	Tue, 22 Sep 2026 19:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790105183; cv=fail; b=aZxmr3AkkIFYxzLk9saU3RdKTOX3qn8/fgusRnkG0HRnhgekipQj0qj38kw6fUuaOY4hH4YdCq0AzEYDi6NTWq7tdrrofSaJ5wlFYO5tZqsvv1Jy4kqppEVq7RM9sJXU1ACCyYediF6TisyQ04Xi00kNHkSml9OiNKecW38Eclc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790105183; c=relaxed/simple;
	bh=ja614ymcYOMPz6PRB/SXAAcyyGk521qagFQrU8PGJNo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=caLenec7vv+EIgVlGYAsM0TzuoM+K2fx+tm5Jbf9IHXKwsh3M4szf19/Pe8q9LMoehjqQekn4i/LGA+tOC7PJl9tOsMSJWTNq+6GteaViFulBxfu1JWJkVZ0eUgbXKanW/gxO2MSaLW+wJNU9qFE88ouRzbnQL9KO+vvGj4ny0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljlqK5jO; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljlqK5jO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790105182; x=1821641182;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ja614ymcYOMPz6PRB/SXAAcyyGk521qagFQrU8PGJNo=;
  b=ljlqK5jOnYg9b04sINTsF9xTobKhtldoBsIcPN6yrrao/MN71hE+JKvU
   qpn7HKf0oIO1flQ8kOws8usMntGib4qlpdi6nq/w7kS33MjU1vqESUzpE
   Rb+iXrArO2UYEnOrjIkfjEDONmPyLeKxQY8tTxAsDYwYxodwrNBoYdYE7
   YmhX5FhQqX598IdH40inKX/+zSo0afNBJ7qMchd9O+/qISIAxRGz9AzLR
   yR1RA9fC/tTp+kFp2chTgF0j83RwvoEhj/BMH+/G/o38lAosqagJsHSVJ
   YvjDNcBxMMEqdii5Qe+ZTcJKTbAuxQm9VQWn9GkLpkKYpZ2cPPac9nC+A
   w==;
X-CSE-ConnectionGUID: 9/WGAXv1RYaoFd9V46OFoQ==
X-CSE-MsgGUID: x9UQ1YkNQ3GQqczk5Jo2pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90858423"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="90858423"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 12:25:47 -0700
X-CSE-ConnectionGUID: WqceGlClRbW4H1cOIhT3GQ==
X-CSE-MsgGUID: 8JYF05HjQYCquMUq9xkqWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="278029215"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 12:25:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 12:25:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 12:25:46 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 12:25:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACLKVSg/8vobSlS+lAWxJcmDPLWbOlbbebjwgV/edfOQs+2Qq+UFBcDRllrw8Go9/Jo2usxfF55/f8fkBJLP/tk+JAllWqY4RQuQx7JNwTDT8WMP2M6cpp7nAEg0xVfvDaUmk5fOEciytun5D+TWv2LIMO74Vck7LTJPp1HysVMOOJJV6zKGzwni5f6LrWPRcn+CH/0XTX0baCcds3GoSOLe9Im7dK21a0ndTG18qlyH9qo4O9axkFttqtb0rHRzvG9KT/X9YqJsrihWSr65/CqIutlHMggyCkx+FsWbzuz01CDo/o2L0g+lmaxevIR6knHTxlQLf8BtAnCa+ybVxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVCadMS/KV+2CplxqIV/vNELWqBrma/C3lws5Go5PrQ=;
 b=rLD3Amwuz5j5AeHxZCGsKy7VRDmV7btlOjdkxLbonlN5KALvuJQ55dhZcifZ7wR958L5OVfL0ZQ1tVeLI2z70+BZNwp5jaqxgS/UCE6WZxjnUusdZiLKfji6h+ZShxO+Is0RAoWqQtYfVwDdil0dG7+anwLKr8va64To2UK9BlfcZC54jWiA3HCU2h0wIZLdvnCTir3Tt6/8/NUH1hHi6tHYPeqQD+sXlucoDjFDVS6BgPuhueKAlcGzeZl8w59SiQbXSwT/Zb/274xYYepHPzYVxDukP/7toce+aSZycbguy11njW5UOPD4JvT1xojPeL5In6yXjQfm2y1OLXJhAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by PH3PPFE80710477.namprd11.prod.outlook.com (2603:10b6:518:1::d5a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 19:25:43 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 19:25:43 +0000
Date: Tue, 22 Sep 2026 12:25:42 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: Wentao Liang <vulab@iscas.ac.cn>, <linux-edac@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <qiuxu.zhuo@intel.com>
Subject: Re: [PATCH] EDAC/i10nm: Fix mdev reference leak in
 i10nm_get_ddr_munits()
Message-ID: <arLWNgnyo08aFM-R@agluck-desk3>
References: <20260916091251.1997522-1-vulab@iscas.ac.cn>
 <aqx5UOLpXdDnDsi7@agluck-desk3>
 <20260919053437.GEaq4e7SFEZqRzsjim@fat_crate.local>
 <arFVjp8k-3kvSkhf@agluck-desk3>
 <20260922045057.GGarIJMRAjfqj6mkhE@fat_crate.local>
 <arKX7O905e7yv3Ra@agluck-desk3>
 <20260922185307.GBarLOkzBqoqlD_mNX@fat_crate.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260922185307.GBarLOkzBqoqlD_mNX@fat_crate.local>
X-ClientProxiedBy: SJ0PR03CA0371.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::16) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|PH3PPFE80710477:EE_
X-MS-Office365-Filtering-Correlation-Id: 92155e3e-d6ca-4a13-3c79-08df18df4ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|11063799006|6133799003|56012099006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ydeXbVLDhOsxAT/CaTugsx+3IbPFTjpd9LUIaYfMDU2QvLGot2SIItSPSiDZZX9g1pqmuulyY8wBdGq4rWucIqbaGdm7igQ85Ei5A6ske0zONd3iNf0nHeI8rbg3mKmeCvUhRw09wdID+Rvks+nUDGfatwF4FT4D9A9rJHWIMLJ3/ieVSOuLZYh8yNqh91yXN7IrpLjSIdLP+ch3vcV/dUIGs21RfciNI7/2l3pNZxn7qH6ND6ku4GdHgkozfcW+IVw4CoNV36AMqqL0ccDFoQ3CFM5jyCmFoRusiRd066l4uqGzoAxUcyEk5wMCkbWCUry0c4URQQsLF7nVUva1ijEQi//gw2tA1skmgwUBtf3bu7tM5VsCDqRLQklKwd5bCR33qvCKC9kaeV8Sj33sZFJed8xQbS4IiTyOJGctfMJiFl+H2IbmKJvlb1zglVRzSzOhG/NLWGk/dEm4A4zf0xUfnW+FP+N6BXCPw5DPIZ60vDA/ZN5ZGdexRG1yy15JxyIuFBqy+NtzG06XBiWpKzLCjbeOOZGQ1DJaTuFD3qcgwGs7FOE64YARD7mc39tsWpV5dH8RrX0t4ODTcx5Hzhg0TKaUpGj9MisZagwLXQlZH0VwyrlAyWlcuEoVt+RnRhFaVYqWd3cOLJ5bWAiZjRjWqsNKAidFrA6Vj53/jWA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(11063799006)(6133799003)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RVydRKlR1L0JfJTh9b7E7zGZca3RKll/JCbDcex6iYmtR8VlXByZiUi6Os5j?=
 =?us-ascii?Q?lmK03Sx9fCwepzVLr7bZMvtDCPPqi5PbYJv9rrEIic0S1dzMHYSl45+OfqW8?=
 =?us-ascii?Q?MWScypqaGgpsX3S817edvfsjRQLj9Y/wZU6RDFcjyBXZegQOeVFIvyoSBolS?=
 =?us-ascii?Q?BofJdVVKitzSOPj0fL5SR5a7IxxW7mkN5GtuObO0aj23Hi9hPDU1OkwMcjfF?=
 =?us-ascii?Q?yFARR30SzsNIIagui9K/LkpQGyRgYwDxeZTMuVz7HS+GMnrcMq5torAu4tJO?=
 =?us-ascii?Q?Xbv8THfR+D+TKRWLwFKlO0HAdzr5l6LQtCjUHO6x5hDoVE69h8YZ86iE71Wy?=
 =?us-ascii?Q?zhRitFIvIJsdgKFwzTHVsrv/nKNJEl3L9ENQGmZO3GaZxPcm0ik1uHjSYERe?=
 =?us-ascii?Q?PkJHLPVcWhOKfFDbk9RdcBq+chzcCv4Q4NbBQkeEVWVedz8pbw+kXoBmI90L?=
 =?us-ascii?Q?5kOwmLmMXSAQlfRe4MXhjaAfE+qDBWh5eIErWGX9KAhoaW+Jx0yoFWymELbV?=
 =?us-ascii?Q?t097+GMeCnEc0udHvrscxg4hBBqg9NQz2guEub1iKsgNiH6KpwBIOnWSVu+R?=
 =?us-ascii?Q?lCxd1sGtGjDLqX3S1Fn2Kdm0BsUNMoaEgYS01HtnVFuKrlFHplDN+OWaw9JA?=
 =?us-ascii?Q?BW0t47s5ZeUb6T1FZkTCV4jSaxWsefa4/dUsmvfj0Ai0EvCPKVT2bCdOsbvE?=
 =?us-ascii?Q?vI3RsypbdqJLTZAOyBoY9wGuZXl+LmO3y1xQRGZ5nsoYH+JFEpzOr1Y2ejVU?=
 =?us-ascii?Q?X4T429VwzVzGtFolRxH1sDCK2ZQR0lq/TtX0GIrqroIUTaHgYjhehbbfg5BD?=
 =?us-ascii?Q?ittEQ6rXYzjjKLvaGYG4TG7dSw9n7jfh1p2yVfoUm4G8NsNy6iX4vEcG36aE?=
 =?us-ascii?Q?LAnh9fP+JfrMAE32dyM/MGQ2P/jhc0t1KgAMTrDGYAV+aNj6VJoXEfWDa1lj?=
 =?us-ascii?Q?QGkZz9CtZ+bLalaFNUlH1nmOBwsJ2ZKJc2xLh2IqsWPizGe0m1+bGLZtK1+g?=
 =?us-ascii?Q?yVipIEGTZ8AvSp4Nt/4r1Gs33ePHf5E+aUzVEJUaum57qm5ahsoPlRhFLeEr?=
 =?us-ascii?Q?u1hdNVFXDHrcejlUcv6VLOsRuvS+u2SFmJ6zNVmX5BggVKjhZi2AtK+zhT9H?=
 =?us-ascii?Q?QATf0zL4WUuVPYRkLkYisLgukP/yKu1wyqmBlWyMnsCDsL0drUE3Y7O6FMjm?=
 =?us-ascii?Q?bFdlYRpaCxCRiPkl0QH/Zk9sRtzExZeOPIx3ByG+BB8NmKcXK46Ha/55ffEV?=
 =?us-ascii?Q?wjNZ1VfLs0ojOgOAQoX+sU75/Y9jRELdTiKD+qH3HavBL0iy7H36tkt4Jmos?=
 =?us-ascii?Q?tLCVQG4e6bvosHWUBaDVJnLtxbxCzr2pOhOvIDISxCn6rU/Cyo3AJRn+KkaX?=
 =?us-ascii?Q?o1o7YFt43sBU0YxJy/Gq9YlIxlSi4TgjN2fTyJOGN4eGZFjXo7am+8c/Rbvh?=
 =?us-ascii?Q?AmVg0OmqZF69D7B2ZX0Xbs3RSHx1QwGaHvukDt8bdiazPZvmjExmjdvov4F6?=
 =?us-ascii?Q?4s1vl8RCYEDLnDcSGfb/ubm0rs6yGQzJa+DSdUUAIDHtG1zH+kpWM6ndyH72?=
 =?us-ascii?Q?As4fcSDf1A6mXIm5clx8ORH9saxjL0EwqHHiorFPMq1yYefYDlNW7yob9tps?=
 =?us-ascii?Q?np44HGUH2TuMTN3IgXkC8J5V0nFBChPPqMz/u0xPkHBbH/fX31wwy/Sd5dm3?=
 =?us-ascii?Q?Zr0+3iOL54Fa++vfITKxJKCRTZkLhPqZsVQKRB29SZrRVhciGQCxHuwQUBSV?=
 =?us-ascii?Q?FZYXxjyH0A=3D=3D?=
X-Exchange-RoutingPolicyChecked: lvG+zSFvWHqum710KsCFTUS5cPYZTuYWIephqHge7yL+XdMkEaZfYBgpLjvrh/3egK8Pj4sxnDw2clChTNQ4W6tIez2y7ovofXOrUD2KJev02a/TzUGKwpdeWt/BHzgwS/Ykb7nkSHvvDsvL1AKwGHM6jkwBNPvAoAOwfFZIi/gsQ2A8oms9gXljpsT8Zg0g1qKktRUd/AvcFBfnMqewlLnRd1/pqGcJTnsCDcVNwUSwIFc1qWMdcntOZ5i098XXngxR2Cgs+hO7hmmPDJWUSFKfCxBh6xElAyyIDD/fRzaETpwG6U3Tg56R6rl/Jitqe/GRX6IlGMOXAXbgDvLnVg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 92155e3e-d6ca-4a13-3c79-08df18df4ba5
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 19:25:43.7657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVrOKf2KaN8K3U+pttMAwxSW/u/qWCCsf4DIkoWWBKLyP8KBHpaLdspmVijMWSwKoErFa1LiXqzrhdRQd5Hd+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE80710477
X-OriginatorOrg: intel.com

On Tue, Sep 22, 2026 at 11:53:07AM -0700, Borislav Petkov wrote:
> On Tue, Sep 22, 2026 at 07:59:56AM -0700, Luck, Tony wrote:
> > The "Fixes:" tag is a matter of fact. The "Cc: stable" is just an
> > opinion.
> 
> Are you being serious here?
> 
> "CC: stable" is a matter of opinion?!?!
> 
> Tony, where are you getting this from? Please point me to the docs where we
> state that, please, because I have never read it before.

In Documentation/process/howto.rst

  - After two weeks a -rc1 kernel is released and the focus is on making the
    new kernel as rock solid as possible.  Most of the patches at this point
    should fix a regression.  Bugs that have always existed are not
    regressions, so only push these kinds of fixes if they are important.

and Documentation/process/2.Process.rst

   The merge window lasts for approximately two weeks.  At the end of this
   time, Linus Torvalds will declare that the window is closed and release the
   first of the "rc" kernels.  For the kernel which is destined to be 9.x,
   for example, the release which happens at the end of the merge window will
   be called 9.x-rc1.  The -rc1 release is the signal that the time to
   merge new features has passed, and that the time to stabilize the next
   kernel has begun.

and Documentation/process/stable-kernel-rules.rst says when to add Cc: stable

  - It fixes a problem like an oops, a hang, data corruption, a real security
    issue, a hardware quirk, a build error (but not for things marked
    CONFIG_BROKEN), or some "oh, that's not good" issue.

> 
> Maybe I have missed that memo, who knows?
> 
> All I know is that stable folks appreciate and more or less rely on CC:stable
> from the patch committers so that they can know to pick up the patch quick. So
> CC:stable is actually a statement: this patch should go to stable.
> 
> Fixes: is just a tag that shows which commit it fixes.
>  
> > An extreme example would be a patch that fixes a spelling error in a
> > comment posted on a Friday before Linus is expected to tag a "final"
> > release in a cycle. A "Cc: stable" on that patch shouldn't trigger
> 
> A patch like that should *NEVER* get CC:stable.

The above is a clear example that should not be tagged for stable. I'm
suggesting that this EDAC bug doesn't meet the stable criteria.

I ought to have quizzed the submitter on why they thought it needed the
tag.
> 
> > But if you want to add this patch to edac-urgent, then go ahead.
> 
> I want us to agree on the nomenclature so that there are no misunderstandings.

-Tony
