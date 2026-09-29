Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13174B7A4D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790723087; cv=fail; b=ZQIwPcKEFrMcHVoXgLLHZWD+clLmrou9DclIpVz/34YwwJTouxjmWtRG7zUWI5mE7UUm+PBFaeVO7n25JVxCx06PHp5GsEeoLN56jMvHvOrmp75q1FJbkyyuBKifE4gCJpl0ac8ttAs/HUt2SQc+2Ci7v6h8OVn/Y43Ic4V5ECc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790723087; c=relaxed/simple;
	bh=0IcZ0SiDkbM0OvfmcXOtduj9T8t0Rw9B6++slCO31vc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O5keExb8rMxD7AJ2JvCvBgLD2RuFpeY87/cJe/k+qfXo2X0buqiaBSGTe7I86kAOLdd5Wn/w4l37GWZi2KOtBv9m3qRfieCk68eAZhQfxNSWSR9VXh+aZpCt0JlG3tKtNLoZfImGoa9uU0dylrxA9Aq6BjfWWAcTTGG5li0ZJ0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RooVLzsQ; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RooVLzsQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790723086; x=1822259086;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=0IcZ0SiDkbM0OvfmcXOtduj9T8t0Rw9B6++slCO31vc=;
  b=RooVLzsQj9+tjSbvP1ao1bFz8FQ//B3QULg6vho+dH84YiXIYwHpd0JY
   YekAEGeqO7wgb6l0qDxv7ZPnpXFdynUdwJR4Ts30XDZ4mxJP2DpGjvC9k
   OKRE0DUUub7GQ/HotUyd70MX53H4/R5mljHPBx+eDowXFbMUM4dIETs7z
   FhhzDAZPUU5PzB3/j2oYdUfvXPJylv/Tv1rkBA6Wnc9185wj7+IWVSH9K
   o5Q7fZgwYkcbXztmOPDK2iPbSYXpmiQVTGA4RPKpyHjYBFSnyNfvWVb9r
   xvWlqvhONq6ATenSUP92TUy+Ldvx4esDaIcE373UftAmVo9bIy856TiVY
   Q==;
X-CSE-ConnectionGUID: 1isynXrMR+qfb1524XMgzw==
X-CSE-MsgGUID: 3/X8IO3tTKG01gpmqXAy0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="101616256"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="101616256"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 16:04:45 -0700
X-CSE-ConnectionGUID: O10d/OLgT9W2B7lsghwLiQ==
X-CSE-MsgGUID: UCYiRVgQREW8QixJE+jAbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="303459492"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 16:04:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 16:04:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 16:04:43 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 16:04:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwlSAwhpQIHmvmAm+Esob1jDmYHs1LVM1X1nrsMKcor8WqbKW2N/32sarz2WyctDmoOV1NxoDVL92EgWHk+khep8pJA1aquBs3k76oRjGa/7vh00X2dpy3XTIEFLfLwKJo/q2KuJDh888BGqrG8Jf6t0ir54AvZcQMznn7KXIvXP3fSD2hwDFXNKKwBcz+qx+99z114xN0uxu8+cyoAAbbqCZwxJPEKjWit7KJ60Yv08zm5CeAZNqoOWBhcTjU2LSqNjWj6tzEQ8bBrIbd5/Nzv1d+CTsHz9lURZ8irkTccQ4Yrz41MzeCPvRWIAXf8fXanayawYeB3unMbzLbaPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlvcQ0pfnx4HeDS5+8jf0Th8DfFe09zDnxE5yUH6FKM=;
 b=hm1kUCKGBiB/cAH26Hg+kNi2OFyvJJ+FplkHmysUMZ9+2huubwTrDAT2nIINuNdKarYEmSR52U1tI+0LFij4FIK895g4n2oPiW3E2swKJvXD29I0nA3lwLEsCQ1AlFKL+4QnIR0rO9jrMuyGE/nyXqkH2QOFk/8BZpswLWIK4fAMIiNRSDnG/JHYFBzyMyB4YUXntSA2fJuHwK7aLLtQQ21UlJzKxh50cUcy+srD0IEv/RBnDU6zHfmXqcZ/obhlAS9dotlODyu6BxHyDPXySvH+FT9OfWnSUUyuj4krN58nPvHJaoNCLh79a+XCjpeH4GL6DiU3e1sBKgQCiFXZPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DM3PPFC3F0DB79B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Tue, 29 Sep
 2026 23:04:41 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 23:04:41 +0000
Date: Tue, 29 Sep 2026 16:04:39 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Babu Moger <babu.moger@amd.com>
CC: <bp@alien8.de>, <reinette.chatre@intel.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<dapeng1.mi@linux.intel.com>, <peterz@infradead.org>,
	<thomas.lendacky@amd.com>, <chang.seok.bae@intel.com>, <jmattson@google.com>,
	<kim.phillips@amd.com>, <prathyushi.nangia@amd.com>, <acme@redhat.com>,
	<nik.borisov@suse.com>, <namhyung@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] x86,fs/resctrl: Use a consistent log prefix
Message-ID: <arxEB24S2bO1ALm2@agluck-desk3>
References: <9ef5ec08d79c9c84f36b11251bd3189af1a38d52.1790721445.git.babu.moger@amd.com>
 <bc637e9a1f0c4624a01b8208f0e53582cbf21886.1790721445.git.babu.moger@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bc637e9a1f0c4624a01b8208f0e53582cbf21886.1790721445.git.babu.moger@amd.com>
X-ClientProxiedBy: SJ0PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::35) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|DM3PPFC3F0DB79B:EE_
X-MS-Office365-Filtering-Correlation-Id: dadc3845-41e4-4144-cf09-08df1e7e0b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|260925021311599003|260925022911599003|260925021911599003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: L2gs8/U7qq0PFynTa9yBlpFbBvrCLRQBm+Cvio8t9w76a3TDTE2+ysL1fZKUOL+Junlh3KcNh0ELNgaz1mJ+D1js1D5vP8IQ9H6H8QGEa0zm8HbzsZNjdeeeaRZSLZqE/8vKdF41V2qCa8LMv+vJcmalH0nZgFcGY3VENG1MidjaVU/e5EIEa+RPEu6C1R9JA+aY7n/tZ+1cwsIzJRVHPybKl+lz+H3GyNoOtBGvwEi9Z4QuaGjAJfWVTVQiBqigOHv/MEMcH5rsaQeIQmMkP3qZ9MpGICSWEGqK+FjZGzHMhjxWNO21n/l7ZFjDBjhuvQPPz/BOwjbSTJcTxpsdR0L9hkJ5JnQBZmYF/d9qc6RoeYHRb3I65dbtcjNunbqOXFjfrMkWmVns0FYmpIC4F61HeX8nbfFwYaWK8cU4YFcKMABpVjOLUU4dWnuxKRWXsGFhIUeeSyERPcz1MrrE1kyraM6WkVQzMV76xh7yzgRH/Y96Ce1suVOZ4fvC+TZMdVOjIWxFV/35uahcmpJINZgYchicOoHjYCGoNIxeq2KOo6NRpk9NblnCNXhAG1nIf7mhzFrJg7vfVlTBp14mpDETzASCdHrzOukORYu8+PEDdmL/q5INGQjMvWg76l3f
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SeDYOyiAO3IL1Q11n9oMhCsCjhVXzGghuKBgA4F5A90JdF+8Jhi8m0BImOxK?=
 =?us-ascii?Q?OLXT42uULI3FbpF4W6O2cLn6mH83EQzvbPcs4ewF+qYuMZjHY51JWRAcxsrC?=
 =?us-ascii?Q?65Jr4ApoTcDT9c6ATim3Gy0/Gt4iUrvMKce/5sUx0O6oLGQdQ/p3V0y0fGZo?=
 =?us-ascii?Q?XH0HxmXmjzbMveZXTmjuztA7k3PNAOKCMx6gz9D+X1pgSaU5XSPijCPb3ga5?=
 =?us-ascii?Q?T4kzkJZzHNxLl1dojsZp52wtDlbDioDcvGA3bZLv9e2pch51ZpN9VIqrwy/m?=
 =?us-ascii?Q?HJQn7MnjIq2D+tUCNSKpyg2baChi9aUt98mseFAbCIDUzmInIrffWEUzChOA?=
 =?us-ascii?Q?+NB01M/fIWo3ecVbtPNcE+Z8cI06YvYK6dUM3R46Zt0+K+ViRmRHnwlJe4a4?=
 =?us-ascii?Q?0AdMRxHB8sV60u5Sa7W91EyQNBGQ3C91aHuq7n0gwYz5vOtxFVKhJnNjkOJE?=
 =?us-ascii?Q?nSr+5QDprHIbFg4SEzVWpJKdD7ERfwv1V9M6cl/prrKByBcgAjtFsvJn5vPC?=
 =?us-ascii?Q?vB56uvcHOU0AGBq0EkxSxNv9o1nhoAU/tuQKDjwu/KYZv7VRXmhEqU+QU18/?=
 =?us-ascii?Q?u0ONvmMoAWARZw31bQln6J9dN5WB/AyWFQxH12GvMV6263UHVtdzurB07B5O?=
 =?us-ascii?Q?bJkdZUj7znerYf4x3rP/sp/MdV0KVu/VEAx+gHz+BlRRBFqpM+B7rdJ0uMyU?=
 =?us-ascii?Q?IYc3V2hMeTv8iqT+dNpWGUD2HhvH7j0VxkKhxOsR3Ra0cVAnrsDuHLcpEZkX?=
 =?us-ascii?Q?56cfb2MlAuDiNW7b1LEHn8UquBcCNHZPzabfPHfbzctsOHNWpupyCqSJyCDN?=
 =?us-ascii?Q?7rO4H5QIv+RYT1nOP2hR38hH+vL32mdmxKJ8zhv/Tacm90EYaPZxAlvt0bDv?=
 =?us-ascii?Q?dQ7dEeFZAXGhlbsUiMQQyxxxddI+yo1IR1EeYMViJnqAcR+hEHxqxVKv5EWU?=
 =?us-ascii?Q?itOkdCPBsrwTsgUJqZeEmn0tHCwVgeodhGai5A08tx5/52IPtnRX/MFkf89P?=
 =?us-ascii?Q?AbIU3EYxzZI8HfJ0Sv9YSpYWi7PkKJcw7IV3H2Ydw8qAxTf/+gJnti1uAgVI?=
 =?us-ascii?Q?NrY8CSZwDLINogvTCgkIBKBql9Td6nGYRIvN1QWK/vWbhWaHFU/lIqEh0Oeh?=
 =?us-ascii?Q?TS71Ebtl5WqltMpC+S8CpyoIweWEv8LH79BBh3ALKyYGg043OzPDUCReTxeu?=
 =?us-ascii?Q?e1K/e8J0rOxpxGP490uHV7/PLpXISS7aq88toMzQ+H49FCRTVn93ac1gnhNv?=
 =?us-ascii?Q?jwydFS1bwU/ZUtWSBwqAAjFufc/rlIGHE3+ipLlXph7oGU6LV2Rg6gy451EY?=
 =?us-ascii?Q?y04jVeTkzKhB8wB0hDiU9BOM61g9/dNaq11Hgy+Bk+5uFcCGFk4ug6firpe8?=
 =?us-ascii?Q?b/sg4P+BVZ1rFFEmV3cYKg4RYX+R2aNG33HTo7gMOKuWLhx4ndbwEAfeYoAH?=
 =?us-ascii?Q?iOSeqFulpNXVg3Z+fjtReaaFo9WPnWtIxcXlfz/MEpso1pkg/3sCcCLdTxfr?=
 =?us-ascii?Q?9rBeAqdhClDmMsc2jaZQr5Y/QLA8wr/b/UAPCkGf1KkVTY46q4LEmTUgir3Q?=
 =?us-ascii?Q?hnRQJF32jrbOf3b2wva21d5HgjdStYltcThf6ML5FmserE3EI6/m4WPRzkT4?=
 =?us-ascii?Q?cvJedpYYxUQY9kWp/9zIqIvtTzjIfSMJQa5jtfFIF9spdE2WxOga/2T+yvhO?=
 =?us-ascii?Q?DQgww1/E4/S32/sDJw5L78m4+5LRT6F+8xu72lKbamHXfA3P88qwz8lDcIwm?=
 =?us-ascii?Q?P/NJlzVSbQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Ah1brn2Ied6eeiCCT1GELA2epAOyuyTheg5lXJbmBVuIglQkLVaAQ9b+pNTq9C+1go2ieoltcWpcQScZDomrB0K4NjzuBZOcon1nIcE9oFLqlWN8huyZ1DCkS0mOIIDnGweLmVkcVv4f0qtj8WxiEgLRyeG0oXrEW3fw93U8rKG+loEWBSHndZD0qAB6tK3V4+mFFYh/DGkhlza8PdQk+BFipdaNi/izq1hmYL21YgGs6nltem1amg6lj5580Xng1OjC2NnrG9jbfkL/8W5Ttt7gdOVcmGqxz9tN75qQiatGqatS9lx2gFsVrmckJaQ7EkjMdViffZrYNruh6YOxcA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dadc3845-41e4-4144-cf09-08df1e7e0b23
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 23:04:41.3139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8XVP7uf1X6AI5OXFPsxAwywj5988M0V0bVQVGqid/gEPUMu5BLgZyFFpCUT7emsKbYCdMLSv+akzEWEDYgrAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFC3F0DB79B
X-OriginatorOrg: intel.com

On Tue, Sep 29, 2026 at 05:39:04PM -0500, Babu Moger wrote:
> resctrl code is split between arch and fs/resctrl/. Some files derive the
> printk prefix from KBUILD_MODNAME, while others use "resctrl: ". Since
> KBUILD_MODNAME follows the object name, messages use different prefixes
> such as "rdtgroup:", "ctrlmondata:", and "pseudo_lock:".
> 
> Use "resctrl: " throughout both directories so all resctrl messages have
> the same subsystem prefix.
> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v2: New patch. The issue came up during the discussion of PLZA series.
>     https://lore.kernel.org/lkml/432f0cbfb811aee3c8c51bbc42faf66174375d8b.1787772750.git.babu.moger@amd.com/
> ---
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 2 +-
>  arch/x86/kernel/cpu/resctrl/intel_aet.c   | 2 +-
>  arch/x86/kernel/cpu/resctrl/pseudo_lock.c | 2 +-
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 2 +-
>  fs/resctrl/ctrlmondata.c                  | 2 +-
>  fs/resctrl/pseudo_lock.c                  | 2 +-
>  fs/resctrl/rdtgroup.c                     | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)

These are all good.

Reviewed-by: Tony Luck <tony.luck@intel.com>

Note that ARM have done something different:

$ git grep 'define pr_fmt' -- drivers/resctrl
drivers/resctrl/mpam_devices.c:#define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
drivers/resctrl/mpam_resctrl.c:#define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__

Perhaps up to James & co. whether they want to jump on this alignment or
keep their more specific messages identifying file and function name.

-Tony
