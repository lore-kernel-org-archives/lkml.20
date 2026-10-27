Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793100947;
	b=obCEMT429Xg1RceT5ELrHj5Kq+mcbZyjOCUEVRi7zgencA+teONQKDuEu+SsOmRQmsu8
	 daeACdTYpsdN7KEFvdbE1hm6oBkmLHr1t7xOINsrPCbJ5zdMA3tWxZlz76sC37WXAuO3n
	 /wAsfTdl6Q05aJw7Bc3aQUjWS4vLhCKz9BR5C/ppPRUKGmJnQ2L92oGs9sEcUY3PDPyBH
	 WMDclLzJNyChWt1k7lPb8JvpBv5HoKLcQaAEWWmau+TcLQ+sBXhUI+Q7OoJHWslv5qGsY
	 H0qG3Z372OdAPtNdlXfmLzHRzv5aZEB+lzNfEbpCi2aU4r/JlkoAKohXy0XtUN0R7sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100947;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=moaxS2VWvNddBlgBbNOtTovbW0s4EWUhPF66XunxJSo=;
	b=w1w17ROrMjKTbZIOyeBCbwRVjMGbVu0H5vvydcF3508vG0KMywlrKjJPUdxc+oRC9s6b
	 YucM1z8BzRPTljjcP6XL+IhckwwI4pBHjNyrgHvbtnvie/j9faEJGxFD/PzE6u6xqiF1s
	 +pfkjRlpPgUutYaxeiQDvYoIjuo1z7v98w6mkOBAODPT4D5fDRr8P1koABvxaQSgrm5xI
	 xnlIWYKSMp7md1PHIOcoETN2RuceigVRNaPZ+DfrYknV8Fr78Ujx88nDv2iPfzor6cGIx
	 8bk12jqImlw5UfHMdYW19EXIFYh0L3dNLdTYAll9DUWLGQKouBqO5sdYSeEc/8fQUrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MFq0qe36;
	arc=fail smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A63F606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A63F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MFq0qe36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793100945; x=1824636945;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9ra5Ws9osxqSW0D2CrumQtpsmrmWHJSe8uB/D7zXwVY=;
  b=MFq0qe36QCHN2BDlmTsDn5L7J6x+WJzsjFCUVVumV0/0zCzbVo+m21L7
   xRwxD1ozsyw38huSPI3po+JNb+aTOL4stewVNqFF+z5OwrrfuT/cpk2fr
   xw+zcxNY+rKqMWgFo9dffojZj3/yXY0BHmy6TusIp+xSlkxpY7wIK/lx2
   YcZWwtqGtunRDSMjOvG98lj33ge2LVjZXsFMhk/ZA4VD4qO2BqDA9f4rV
   G/24Qlao6jxENiGISjdXJAt8XwT5nhpP1x4eadM/0nx9/HjL63q29WVo+
   zrf+7UNS8H5jpv/Csc5EmRLmENzSCConBJwnAdKisNHQZp+gPyfLvMmB2
   w==;
X-CSE-ConnectionGUID: 9AWZoLGlSueseUfwHObxow==
X-CSE-MsgGUID: e6NLoKQsTRKf6qPRsgEUxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1806284"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1806284"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 04:35:45 -0700
X-CSE-ConnectionGUID: poGyB0B8Q3uLEyld/w63Fg==
X-CSE-MsgGUID: dIklNVi7TrCLyXP1Cy+oXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5045471"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 04:35:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 04:35:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 04:35:43 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.27)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 04:35:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2upIY9Foc433iLrZxl0a41zhRutRMk3CeCUVeKZIio4japk0EBTXwiVssXZ36P+v6VJTuvPQ7Syn2d8Y3g7NEZqK58o7PLSQrBe20KSegzIFsz/g2s+TKi0USiqYYgriGdr6/k6QUuCUAzhSCNz+z6ZOSz6QCdx8dLSUAxMdVxEGMyNOSY9ypXeQnJEF9bw/8nIvhFlM74VIPN5NpM4OIsODRAbW94YSyU9cXEAOddbqcZPzkFBGCl2Qa0fhuJsYhsys6a+wh+z6UQDSnAxMgx5xkf8kdw/2eS01mw6VVqW0My7iXqsWX5BEui4PLIZwx7/SdjB77XLBKwmElKxZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moaxS2VWvNddBlgBbNOtTovbW0s4EWUhPF66XunxJSo=;
 b=EFH9wCbgzSMeC7ap3w5kt5Q5Bp2x3nZ/pWa2nt1tRz9XfVP4VMSzP/xayVqVqqbGtdc9ppOQAT5BOAeEBIPlYR7UnhWrDoB6DHQgrqx1XlBlLzq2Uebd/CbyITsg0TsMX/fLXUO6xvYijurcK+Nak7m8jmDUzcaH/NYGQPoHEc2B3eZ2z1gKAWt9e4MIMR1nbLT+rpMTKkEcq64fwx2FeLImpCsT7bk+/npBcLEHTIj7ZJi72Dth4eL+xtxVCcDDqbH6i9ZNJVIo/f1ClwMgGtl8Laj9UWTf4a8MAdfoiNlpSrtvGjssGdMLXJanMzn0r87IcbtQDBe4jrccdXotkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 DS0PR11MB8184.namprd11.prod.outlook.com (2603:10b6:8:160::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.19; Tue, 27 Oct 2026 11:35:41 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 11:35:41 +0000
Date: Tue, 27 Oct 2026 19:22:47 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	"Hongyu Ning" <hongyu.ning@linux.intel.com>
Subject: Re: [PATCH v9 12/12] x86/resctrl: Add MMIO-based LLC occupancy
 monitoring support
Message-ID: <auCJh7ZOL8CSbgvv@chenyu-dev>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <afa6d022d767b0debb2aa7814699ac9842825820.1791933001.git.yu.c.chen@intel.com>
 <9e4fc1c8-c40d-45f3-8735-94d218168b8c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9e4fc1c8-c40d-45f3-8735-94d218168b8c@intel.com>
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|DS0PR11MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 5235c27f-608a-427e-5bb7-08df341e6e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|261026140227099003|261021121427099003|261009223027099003|261022105027099003|4143699003|56012099006|11063799006|261021123027099003|261022075727099003|261026121527099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: qUdsJTEgkwvJUFbVW0O4viqDEhyu80lLKfusb9dtminOowMmCYwL29xZYy7665ara4NI2OEUudRJBA5hm/3OjvqO+TQkAt+3LQI3V+kJrVC5OFXfIz1m5TtDezlUiTxrI6Onkeef7TP9Zxa5RbWcfng2nW1fWDQuHAh5vFG0HY02WkGYRuCuYfNRqzi+fpYlaWDu0YhQSiRAuGZBiVTbW6QkUcT21tA+4bCRvxNz+7jp7XiRywyuaE/tKgU/lfjxJkriNIQD0hWimIQfiemss6m+9Gj+7YaHmgVpUXDDajVBR82ASwBIGetk7Ymkj1052xyYACDmhOLUvzW3LKV5gAj6yc3s16x5cIT/ADImoLbKGhxkXskL9Wzl/oWiX1uNEhMCk3cTGesYJ4zi8LzXJF3Q2UlTONvTHgIlRzDzp5jYiDk0aZj+Oh/X8HlS9w+WUWO27USDe1VNAX9yyAKN+xUIiXHJ9I54tqljkS9MuAd+hAub7fvGiTK6JeAwzO1HONLh3RtK1G5AI98o47MN28VSi0r7rbKlVFYLf1aQLpEtA5CeY7/nnmbR9yIko9FfxycXun1gx9qdjPL0vmPSKNXZ65g9guhPVkjeZUNy/G+LYRSo8e3i56rxSQv5icuaXntjxtZZBrESa+yV/5Dij0CSHEDXLoV3NevcVMvOvrI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(261026140227099003)(261021121427099003)(261009223027099003)(261022105027099003)(4143699003)(56012099006)(11063799006)(261021123027099003)(261022075727099003)(261026121527099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?skd6qtXkriEAN+5/moxQVbcmNcgTFD9yWSAFwmLnIKo11XLAxkwC2QNJi8l9?=
 =?us-ascii?Q?VPKN7wbZ7aBqK82mhv4CAgjUDwQeTbZb6ZWhB84FUq2UiQXnfvQoOH8aSYKM?=
 =?us-ascii?Q?tFHZXrRytJZh0x0W+XyOJyo/TTVLicWFslNkL9fo2edhnH6Y4oRniCw/V5te?=
 =?us-ascii?Q?0O1U5wucbIDVnUtEyv6TjMXTHb8U5Ahec/j2pz/wajLk3z6ECzJGEfVTFYGP?=
 =?us-ascii?Q?jf188l+kQAaAHM2zl1MDztC5ZrZnvHFf403eq+1oSG5vLoUlnrkJ4qm+aCD1?=
 =?us-ascii?Q?MuXvltn5ZTkuFXH2dxY7er9lilqgL4xGpindyAjPTuVo32f1GiVbpw9frK0U?=
 =?us-ascii?Q?tn3eSMvYzsworpOaUTIZ/xYUwN91CXRXeB0poD/y3yAROXr+xToqNxLJDvq5?=
 =?us-ascii?Q?08nTDzFFQ/4lw0w+i8aHvLNB4w24I8SXy6KJ+bWRCdPeu/d+BfoZ4AKq1LIR?=
 =?us-ascii?Q?5SocwyxU8dNw/arP98dEIMe1LpYW1NWAvfJLGv5wf4PH8Z/ujS5xuMpQQK2i?=
 =?us-ascii?Q?WMjmiAwbNY995Ylg4EYQSMMkA5wMiPHJDH8xnVUGAsmKp9FL7Kp0CUxAFXre?=
 =?us-ascii?Q?Q/nU1I8k18EdTvF9o0o0dyWgRGDv7RHVxSwLlh5pMFslDNpulL4gCy41phCF?=
 =?us-ascii?Q?2KV6fhpUvqgv6IIcszWzYUZ/eU1uM5fjUDjVTxtp7q2yqZcVdYNFoAGy6M6Y?=
 =?us-ascii?Q?QkD7WJN9t1DgiIm9Cc2MMIsZE3NFQHjTZNedU7enxvC4GDYwSGHz5vvo3i+H?=
 =?us-ascii?Q?j+sTW76VP2OiSHYzdDTAUdhYIWFVJ2TuaQ9m+YCANPc6pq6hLH8QK5asZ6DI?=
 =?us-ascii?Q?MsM/W8iMLP+sB9F5jYO4yOfObXQmF3S6JdvJr6vU5VkspdXldWZWQnXiViKR?=
 =?us-ascii?Q?AejHt/Etn0ppVX4Hz9hgFqNyqsR6rCEOLBI5q504m69lcGtkFdkSr6nZ+w62?=
 =?us-ascii?Q?VuJtuB4e8TbaqEx262BNV4Voc4vFf6iSqEQpr2YjT1WOD13P0yuBiY6MG6dH?=
 =?us-ascii?Q?RxKYhFgTloj4thehX1Z61G6lnjJM2mLY6x2P0D4Fhd1viWlROXtrubuQ2gBp?=
 =?us-ascii?Q?dVwr1Q/X9uGtX/uoLVocfD47mYRSFS3kT/uAZm3cI7mHDeBfnT61RdOBbN4k?=
 =?us-ascii?Q?JBlXnzU/JISOKWeSV9j3TY+Jb9zlJegZKZ8UopofzKWQ65ty7naM803/T/qq?=
 =?us-ascii?Q?xlF+Q8nNh61685ZF/WeUOWpUSpBhG+R0W3CN2u3ssqzA+QRViYIJBKfMKN+K?=
 =?us-ascii?Q?ufGsM8H04q1ct5u0Q6R1xCmdyHT8Y8VCil+vol/6H5eZnaltlv8q6Pyh7kcN?=
 =?us-ascii?Q?ssZk+rE1en6wvvRRbnUad8azG/ssdBFV1A8M2y1g2p8ikO1RF0EZYi7cNJ8g?=
 =?us-ascii?Q?rbrvfIdNQGZfbThcjRgsDk4gvaBl4/y16PEwjb27Eyk4WqRiskq7dbPf8xUq?=
 =?us-ascii?Q?9qJiRMnqiVDJxNKNdCs8ASM7qqyL9CY9lLcTcoGSZQnPZBdYfSQlpbJ6kF3b?=
 =?us-ascii?Q?n3W/T2938+j9gsd54k9Ym2fzmItpGp4XGUg8iB2jPGPdnjEPgSQd5mKpeSLg?=
 =?us-ascii?Q?ux6Gx9phHnvOgAk/6/vT8u3q7ZY9JS254DgWVwf5YCs+KVxYjoC47979Q7lP?=
 =?us-ascii?Q?R0P7h3l96eKB82XIewwiig+hLJX46jk2VvIgubFsUvmZNomWG/b3i1UjRrgF?=
 =?us-ascii?Q?FhBXq117g2ihmv4CJdPBaWTeJ1PzbkWkQo3L/jYsML6Jl7wGDGZMLjZQm+Dv?=
 =?us-ascii?Q?GXqdDN4XDw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 2iBdTIswi4DkYyV7Hy2FPR1309ATsXEh3ht8b4ju7HJE+x2gs32uPMAvpVIY7dsOIvKkiINLNNIjk8CT1VUtr59R2gYKow7YVlfulf4nwJVtMSts1LVi3oJlrpvO16fzCRH1zCzQULfDKTNiuTeZFCoKrThGcRV3ZvtRAV5PBrKocqRMNsy5+m1KDREF5pXaaqo30uwiSasbOajDODeHow5uz72r7b0fx6b1h/poL2B1pReAjuwCOU/7yga7aMubfVPNclFyw9yQ+pAq1gqBRw0jfNL8SLc3teZnCFhbevnjgvFr6nfV7Ptof8Gy0NFs+9ZCI0uZijObEEHGPGcfdQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5235c27f-608a-427e-5bb7-08df341e6e0a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 11:35:41.1611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHPs9LAhR6E0UJp99/h6K0ZUaFhzg7RwresrABH8iVC8J8Ni1Vke06jwbr8hJqADiYmJJTCH7nAzZ5dSyp6bzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8184
X-OriginatorOrg: intel.com

Hi Reinette,

On Fri, Oct 23, 2026 at 05:08:44PM -0700, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 10/13/26 8:01 PM, Chen Yu wrote:
> > Add erdt_mon_read() to read LLC occupancy via MMIO and use it
> > when the platform supports ERDT. Register the L3 occupancy event
> > with ERDT enabled when available, falling back to the MSR-based
> > path otherwise.
> > 
> > Use the CMRC (Cache Monitoring Registers for CPU Agents Description)
> > ACPI sub-table to read LLC occupancy counters for each RMID via MMIO
> > when ERDT is enabled.
> > 
> > Although the occupancy counters can now be read from any CPU via
> > MMIO, keep the per-domain limbo handler. A global handler would
> > still have to iterate over every domain and would save nr_domains - 1
> 
> Please write what "nr_domains - 1" means in English since as it is written
> it is not clear how this "does not justify maintaining two limbo handler
> models."
>

OK, I'll rephrase it to a simpler version, how about this:

Although the occupancy counters can now be read from any CPU via MMIO,
keep the per domain limbo handler. A single global handler would still
have to check the limbo RMIDs of every L3 domain, so it would do the same
amount of work. The only saving would be running one limbo worker instead
of one per L3 domain, which does not justify maintaining two limbo handler
models.

> > worker threads, which does not justify maintaining two limbo handler
> > models.
> > 
> > Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> > Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> > Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> > ---
> 
> > +
> > +unsigned int erdt_get_max_rmid(void)
> > +{
> > +	if (!erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC))
> > +		return 0;
> 
> This does not look right. Why is this restriction needed? At first glance it seems to
> be a quirk used to simplify the get_rdt_mon_resources() changes but not actually
> be the right thing to do?
>

OK, I put the erdt_cpu_has() check here because the only ERDT feature supported in
the kernel is X86_FEATURE_CQM_OCCUP_LLC. But as you mentioned, erdt_max_rmid comes
from the RMDD max_rmid field, so it limits all RMIDs, not just those used for LLC occupancy.
Let me use the erdt_enabled check:

unsigned int erdt_get_max_rmid(void)
{
        if (!erdt_enabled)
                return 0;

        return erdt_max_rmid;
}

> > +
> > +	return erdt_max_rmid;
> >  }
> >  
> >  unsigned int erdt_get_scale(void)
> >  {
> > +	if (!erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC))
> > +		return 0;
> > +
> >  	return erdt_scale;
> 
> Constraining a global value to one feature is confusing, could this
> instead be, for exaple, erdt_get_cmt_scale() that returns erdt_cmt_scale
> that will be more accurate and clear why the erdt_cpu_has() check is there?

Yes, this would be clearer. It now uses erdt_get_cmt_scale() / erdt_cmt_scale.

> This change can be added to the introduction of this function when the patch
> doing so is placed correctly in the series.
>

OK, the scale_* helpers are moved into ("x86/resctrl: Add the ERDT CMT scale").
which comes after "x86/resctrl: Introduce erdt_cpu_has() and erdt_support()".

> > +static int erdt_read_l3_occupancy(const struct erdt_domain_info *d, u32 rmid, u64 *val)
> > +{
> > +	struct acpi_erdt_cmrc *cmrc;
> > +	u64 l3_cmt_count;
> > +	u32 offset;
> > +
> > +	cmrc = d->cmrc;
> > +	if (!cmrc)
> > +		return -EIO;
> > +
> > +	offset = cmrc_index_function_1(cmrc, rmid);
> > +	if (offset + sizeof(u64) > (u32)cmrc->cmt_reg_size * SZ_4K)
> 
> Could you please explain what this is validating here? 
> cmrc->cmt_reg_size is already u32 so the cast is unexpected. These comparisons
> with different types can be tricky, looks like right side is 32 bit and may be
> truncated before the comparison to left 64 bit?
>

My original intent was to force the value into a u32 in case this field is
invalid, but I realize it should be:
if (offset + sizeof(u64) > (u64)cmrc->cmt_reg_size * SZ_4K)

> >  static void __iomem *erdt_ioremap(resource_size_t base, u32 num_pages, const char *desc)
> >  {
> >  	void __iomem *addr;
> > @@ -161,6 +234,8 @@ static __init bool cmrc_init(struct acpi_subtbl_hdr_16 *subtbl,
> >  		return false;
> >  	}
> >  
> > +	erdt_scale = max(erdt_scale, cmrc->up_scale);
> > +
> 
> This change is out of place.
>

OK, moved to ("x86/resctrl: Add the ERDT CMT scale")

> > @@ -438,7 +442,7 @@ unsigned int resctrl_arch_round_mon_val(unsigned int val)
> >  	if (!scale)
> >  		scale = boot_cpu_data.x86_cache_occ_scale;
> >  
> > -	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */
> > +	/* h/w works in units of the occupancy scale  */
> 
> Please move to patch that introduces the "scale" usage to resctrl_arch_round_mon_val().
>

OK, will do.

> >  	val /= scale;
> >  	return val * scale;
> >  }
> > @@ -447,12 +451,21 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
> >  {
> >  	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
> >  	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
> > +	unsigned int erdt_max_rmid;
> 
> Please do not shadow globals.
>

OK, rename it to erdt_rmid_limit.

> >  	unsigned int threshold;
> > +	int max_rmid;
> >  	u32 eax, ebx, ecx, edx;
> 
> reverse fir please
>

OK, will fix it.

thanks,
Chenyu
> >  
> > +	erdt_max_rmid = erdt_get_max_rmid();
> > +	if (erdt_max_rmid)
> > +		max_rmid = min_t(unsigned int, erdt_max_rmid,
> > +				 boot_cpu_data.x86_cache_max_rmid);
> > +	else
> > +		max_rmid = boot_cpu_data.x86_cache_max_rmid;
> > +
> >  	resctrl_rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
> >  	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
> > -	r->mon.num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
> > +	r->mon.num_rmid = (max_rmid + 1) / snc_nodes_per_l3_cache;
> >  	hw_res->mbm_width = MBM_CNTR_WIDTH_BASE;
> >  
> >  	if (mbm_offset > 0 && mbm_offset <= MBM_CNTR_WIDTH_OFFSET_MAX)
> 
> Reinette
