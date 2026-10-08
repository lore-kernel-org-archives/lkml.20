Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7F23A7D63
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443614; cv=fail; b=H57XuxciJj6LzS8iSU2j3cbaUkRHxiQkGUFBB7Ye1C5xOBIW692xHNT9sHFea437f1WauOHIaqQorhOLCyYbEYX8r7wSR7Zoe9XyKNHRzWthwBOgYtEhu+KQJ+xDUyqOWTqaWOeVzEnfweGEZ4uamErp8w1Mz2bGlFvi2heE1to=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443614; c=relaxed/simple;
	bh=A5fjCH61HrQW9xmqhqgvnEFRdEw1/4qmgGjYiyTOmv0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W9FgmT2no7MA6VgVsYq2N4I5/ojNxf/w7bZ622ohv3NWoHAtMuuGT7DSZlb1f0Cx6dRICjj5550ugwGxyKkYGZv1Bx61+B1QcF+YsBJaC/VFhq2NBJfVmVR6rVTZFa1m/eQw2QV9dXhAga+mbJ3jmEbZeREgGrMnuGd7rFDS/cI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTij2BHr; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTij2BHr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791443612; x=1822979612;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=A5fjCH61HrQW9xmqhqgvnEFRdEw1/4qmgGjYiyTOmv0=;
  b=aTij2BHr4tEb0OUws22EfNYDF8N00q53im8UR4dvc74XVx6Itz5wg2NN
   t6K/hsqKjC54MPVC3OjtfytPxcc+c/v6mwW/Qrqfj6q/ksslIwii92eGM
   Dn43OElDgkzORHDV9LqVRySvlmqctnp34RHajDjx5Pq0awOR3KSR/OpDP
   H75gCZC8u3grKD5dWopKhUXsratK66clM7c5HM6E7vhu8ta23DNmGqAk/
   i4QC4wc+uMGEueuDtZhRUzvQp80H+Eq0N4AhJpdt9Tb0/1gVflGjo17Mj
   js5iILNHxRwVelOL6+s39Gw3BbzBgvUVlFfbZE9ftuoAX1pIr9kKqJdO9
   Q==;
X-CSE-ConnectionGUID: TIfv4pwUTTS+azWW7B7biw==
X-CSE-MsgGUID: ncM/J3OSQiWQ9Nh3V7vybA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="222397"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="222397"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 00:13:31 -0700
X-CSE-ConnectionGUID: 1DAzShk3Tly2aAma6c6dpQ==
X-CSE-MsgGUID: DjgcHylKSECOIupo2mCdTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="59165"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 00:13:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 00:13:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 00:13:30 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 00:13:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJSKrcG5BKXYcxXH97dIyWqs8KzCoUWAlo9q6CEGtzSWR1CsE3VTk2PhV0+UbPk5N3FIfqaBRjeTOiL82eVY5mLULWVkCbRHcIufMo/ow2UFFyxa4PXzCgRDIcy+fgEfjenReFHqMVRMPERmsy14NY9uJrzEbK0Xt0fh51TLY35/vuJ3163lIVKCy5zkognyd9B3IQ/mdXMR8DvvKM3p1gQl4/E+x9kEp64EfH9eNQGQrIR9q0zxGbJzYqTqvgJ3qcIvqbBjM9/G/MRGNJGuNEhU3Q+rWhvgXPxpPtzkJCs/jGKdpOGSOJonWrvPoQhb5qhPzpDn3iSLsIhmBY/atw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iayMjNt+5IeSq8u0FIA4RbS6c/74GK4Avfz9Ou6909E=;
 b=AgBZNT9mTZ4g/LP09GTmDfL4EDAvbpCaFAxb2sfx6EdEUNphivw1tAbq5vvx4xDzBBxgA43tL/33sWqN08blHP6AcN16o56uH7Zk44IPferh/tY7Q6jNRdt9zWvy9cfb411XXHLbuKBNNcCarqQv+mTlcWP3WLG8Ph+fg75nzDBl37NLKYYpd3UPwXDiFmaKYFrwrZQ/9smwNrCEqRPCq7yt9J6prUY2IrzlzkmXBKrNrIpR161/WlSjfOzP5dEQNhD9zudoxoXb7ydjubfF/BoVsdzwY9YtpeldGl7KxfR9pNzwpjnjdxqXFS2ZecGUFEQngPieO9Mn22/FvjsQ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 IA3PR11MB9397.namprd11.prod.outlook.com (2603:10b6:208:573::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.15; Thu, 8 Oct 2026 07:13:22 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 07:13:21 +0000
Date: Thu, 8 Oct 2026 15:00:16 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	"Hongyu Ning" <hongyu.ning@linux.intel.com>
Subject: Re: [PATCH v8 9/9] x86/resctrl: Add MMIO-based LLC occupancy
 monitoring support
Message-ID: <asc_gEQv8p9Egi4V@chenyu-dev>
References: <cover.1789705667.git.yu.c.chen@intel.com>
 <bfe91aeeb714f14e2d1a9c3066ceab0e62c3c231.1789705667.git.yu.c.chen@intel.com>
 <6999ac64-054a-4f7f-a62f-36f8efb129bb@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6999ac64-054a-4f7f-a62f-36f8efb129bb@intel.com>
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|IA3PR11MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: c62ea9dd-8eac-474b-670c-08df250ba2b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: liYQuDcPZBVeHEL0SIp8JieaHmE3OT+4KhWkW+7FtGVkiSl9eBrM0RMJl7aWaw/9hUIjQFcC077Qx44w6Q8t/G9t/QPSERuqUWLhu9wxbTUChxPuKi2wwNHDv+bxWWH7WLrbkCQjRYdOKzMcZuRTVVfSpi1MqI5NbF4m1YLEftIhcP1uuQQoIpVCDtaCrlPgRcjXPZjiRqf2Ag7fx/kZ/AHz1DvROmHRZqe1Kx+w4ABK4uQjHiZBBnlKcyap4+Xa3zq2jfm4isHADTifuRVgMDFnONbelRcvpmuJvLcM0X7jGp+lhnNCFBfP7xbqFBRwH2v1C+FUUoETJmUGtS1Tqacg2qsNz83csJpqEt7Hqf6/pIiCI1Og0i7t0HlIvanHAmR2mtet/vXxcENBRkbzDfQXuQ9F9x/QVSATWMTXHDJxDcJlHwpJHgYgW+dcpHXcmq0EhdfMSCu0xWUdFkY3y/UIdbyG4/iKAHhjwmA+OPLHqs1BrxGR11djnstqeH4ekVWlcyIla3SMnb2mWDorwd5wmPyNJkpwwsHKEsu6sQWgogzZi7Gd7nnmzMm1Db4gZgd/yAPlSJjhXFo468KSgK0l54C5OnFnhYKuBt1/AiA6wS0e6vPSPGas5NKyUHDYyKE8X95sOKS019Blk6UgZ12HKTbDhqCsUmcmrFRv8R8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VUlK8II0peBvJx5viWcl9Zo10JU2Ge6KLs55oCCWHGIjHUymJRZQYctx9nH5?=
 =?us-ascii?Q?HuCg5f+fXS2Y/yY6Vx5F68RMHKk/kYN8NBCII1WmU6jEnP/x+GInTQxAUwIj?=
 =?us-ascii?Q?kXqscomXMmk83rX+jYhQbHdPkcD8XQXfRJdobH3thpMeAax4PcRv/dA/c0cG?=
 =?us-ascii?Q?UnFUWS5eewAZn93CN6eCFzuOU3vL75eKipI8OUg2X4qwJtQvNG4lN3kFsLKN?=
 =?us-ascii?Q?ZzKF0+yOkpYuikjwP+beAu992Yib8Qt2+u2BKIECGOuHbBNrsxu/QNBv/kcf?=
 =?us-ascii?Q?s8LmdHOnq1FDUFv9JUTTpRrArLBtNnB3d2H/EwwSMrPyCG5+rZNmfMXscf0n?=
 =?us-ascii?Q?cJkaDwJiCdtw7NTNwS/gxmxaUBwYD4F/qN6tTy5oWBY2TY9RxEdF2NCgP6ka?=
 =?us-ascii?Q?LjyqsIMMMe00wbZoIqkli47Yf9uIBqXHR/I1lMqW8r+Rilvp40+peRjrKeaj?=
 =?us-ascii?Q?lBIUXdgP1xOM9m4eqUGeNM3HobibZ3vqXBGLnM84hpqET7OIdpRVFFsK+2Y+?=
 =?us-ascii?Q?74pbl/QkxglDDQHHXY+NIyXBGh5O9/KJBpWPvOg+whtXj8yUGeM1QNFUg5Jf?=
 =?us-ascii?Q?26GjCiDLkfvFcf9x/GP8jDck+7JpSLW+L/axgoZSnmAkNRiToV3HDh9crkBN?=
 =?us-ascii?Q?mmZ301SHPucHlViQR2igIr1cDEgLVo9jOOAuaXiuOZo2yFp947q1ITFpBN2T?=
 =?us-ascii?Q?XQvBUDqS49gePLMqXkDM4g3jXknaOyQXGPifHmubcxryUNCv+wdsu9cDMW9K?=
 =?us-ascii?Q?nTjYyQcGlZbZLqhgkTY4X42pEDJ/UKGED92weIoYXWA4Ft4b8Q3LFVX3jRMc?=
 =?us-ascii?Q?1yZAqiA3RmA+gXXTPxbcqRcqwYuQtL/ceNtpHGzGy6cwoPbULhB7YJGnE/tw?=
 =?us-ascii?Q?pWR7BA0VHNKAOcGbQxE87l/Ccc38SwIJFNvMdl7XH3Mc7mJ8Oj+QLTZqWioV?=
 =?us-ascii?Q?CKJ2AyJ5IbVDsc8XJRBu7mykUQUnjlRY5H43hDO0yNVuBnRVpC8IRPN/Jcg5?=
 =?us-ascii?Q?JM5xU7tUEeeCDTKufQpG9HyArsgiU0loboTbQ1EBVmYHBSSgjeeblcnbCFLm?=
 =?us-ascii?Q?T9VOksa8hWXKGkzgIQN64Q7FBn3pNPZqTpl/SoHbA/FQeucV+Bw21ypqbd87?=
 =?us-ascii?Q?C6ICvZ2dLT8X8k54Ig2Xvo1qO4vzzwPSnyYW4v/w1AD2zlwQlsl6X1rs0SiN?=
 =?us-ascii?Q?TUn33wTqRiZUOXkg5Prd3/NH/EJDSIf8zPrOsmIu+1AwzXpk9++wPT7sGuKY?=
 =?us-ascii?Q?tXRaxxNzN52JzxCo/FWiJBfWOrQXEBGVSb4rPddNENZ2gH/BVIKTNENo5Vnn?=
 =?us-ascii?Q?StgxP2A6MGVw6JNMrSEdAnxdfdwZARhzSgronMINxFsYSR6PyCqGqVVyhCwi?=
 =?us-ascii?Q?sEjfKSRmFoKbK/+RG2ERqXzXksMDPdLsP3bZmNuJ6ShnzlDvNX26fltvdDVt?=
 =?us-ascii?Q?3VYhd9TEG8ZDgQTMQeElSUyfgFmUEPIqF1PPxDiqjMYnDgOcHROhLM6Usc/K?=
 =?us-ascii?Q?ePiWL+iRFCTMroRdsisr2IZeJadSQ/ms7IQStQkD2jRqmvLRe4lRuRYOuKYV?=
 =?us-ascii?Q?4SSvpVd/xUOWrdETBXX3/RmV7VTB8NXeB0yaf8+gQ0fs+OVXEf3lxC1gZWwb?=
 =?us-ascii?Q?lq45IrhW9oLOOzAVyY/fpU+5rtsmaGymIYzpiOBCstH5+cOjF69rnTx8j0Ya?=
 =?us-ascii?Q?bYcLRU8bOgw4Jrb7KfsW5Dzz93reReuWfh+C+FpGV74zSvzJaiq2zUz5+T+O?=
 =?us-ascii?Q?5dcv5umr0A=3D=3D?=
X-Exchange-RoutingPolicyChecked: uePPj/E/vWpmdYatmi4yRIXSKSz2BzkvG44fhFIKF4SfJWNy5klFXvsDoolV6JUt9kRg6PIuE06wwVAvkxxmzM3PxELYwSHLGsQI16p/kl5YZ0FBAMaP1XFJ3npLaxtveqAzzpaUrBdij6SjexLHweHZfYO2QjqoMiN842OH7mOvuAQRwMWxbweuEvVc9JP+ezZGpUY+8l4VzUHEZgLbCm0dBW84FN39ALZrVQK1dXz/maPeeIlPkmW6LDvHldPZEd/sfKySWqEax2bGwP7KpZlcul+oal/B9Sm0ppztJ/I1gv6ErrdPvRYFvyqaVop4qAesX8+x0uhkJ5D7S2B8Kg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c62ea9dd-8eac-474b-670c-08df250ba2b4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 07:13:21.6907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUaIdKOQBfZAP8YeKXQj5Y1seN8KxlKWH7u2zk1KPT7Lg6LSUt9BB+2l00SBxR/fNVrvJhVcbotV0mxpS6zu0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9397
X-OriginatorOrg: intel.com

Hi Reinette,

On Mon, Sep 28, 2026 at 02:54:48PM -0700, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 9/17/26 9:51 PM, Chen Yu wrote:
> > Add erdt_mon_read() to read LLC occupancy via MMIO and use it when the platform
> > supports ERDT. Register the L3 occupancy event with ERDT enabled when available,
> > falling back to the MSR-based path otherwise.
> > 
> > Use the CMRC (Cache Monitoring Registers for CPU Agents Description) ACPI
> > sub-table to read LLC occupancy counters for each RMID via MMIO when ERDT is
> > enabled. Store the CMRC information in the rdt_hw_l3_mon_domain, which could be
> > accessed directly.
> 
> Regarding "Store the CMRC ..." - wasn't that done in patch #5?
>

Yes, let me remove this duplicated description, to only focus on current
patch.

> > 
> > Although the occupancy counters can now be read from any CPU via MMIO, the
> > per-domain limbo handler is kept. A global handler would still have to iterate
> 
> "per-domain limbo handler is kept" - needs imperative
>

OK, will revise the description.

> > over every domain and would only save one worker thread, which does not justify
> 
> "would only save one worker thread"? this assumes that all systems will have two domains?
>

I intended to say each domain saves one worker, but actually it will save nr_domains - 1
in total. Let me revise the description to make it clearer.

> > maintaining two limbo handler models.
> > 
> > Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> > Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> > Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> > ---
> >  arch/x86/include/asm/resctrl.h         |  8 ++-
> >  arch/x86/kernel/cpu/resctrl/core.c     |  5 +-
> >  arch/x86/kernel/cpu/resctrl/erdt.c     | 74 +++++++++++++++++++++++++-
> >  arch/x86/kernel/cpu/resctrl/internal.h |  9 +++-
> >  arch/x86/kernel/cpu/resctrl/monitor.c  | 14 +++--
> >  5 files changed, 102 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
> > index bcfcc8ac1fe6..31c2f81cd06e 100644
> > --- a/arch/x86/include/asm/resctrl.h
> > +++ b/arch/x86/include/asm/resctrl.h
> > @@ -135,7 +135,13 @@ static inline void __resctrl_sched_in(struct task_struct *tsk)
> >  
> >  static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
> >  {
> > -	unsigned int scale = boot_cpu_data.x86_cache_occ_scale;
> > +	unsigned int scale = boot_cpu_data.x86_cache_occ_scale, escale;
> > +
> > +	if (erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
> > +		escale = erdt_get_scale();
> > +		if (escale)
> > +			scale = escale;
> > +	}
> >  
> >  	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */
> 
> This comment is no longer accurate.
>

OK, will revise this.

> >  	val /= scale;
> > diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> > index ca7e67f976d5..135f2eb2a5a5 100644
> > --- a/arch/x86/kernel/cpu/resctrl/core.c
> > +++ b/arch/x86/kernel/cpu/resctrl/core.c
> > @@ -1007,7 +1007,10 @@ static __init bool get_rdt_mon_resources(void)
> >  	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
> >  	bool ret = false;
> >  
> > -	if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
> > +	if (erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
> > +		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID, true, 0, NULL);
> > +		ret = true;
> > +	} else if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
> >  		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID, false, 0, NULL);
> >  		ret = true;
> >  	}
> 
> Would https://lore.kernel.org/lkml/20260916231320.14502-3-tony.luck@intel.com/
> break this?
>

It would not break this - because the ERDT exists independently of the CPUID
query result, but the CPUID result should be the fundamental check before ERDT
parsing - the ERDT can decide whether to use the MMIO or legacy MSR interface,
but the existence of CMT support should be the first thing to check. I
got the following feedback from the RDT arch:
"Architecturally, CPUID remains the mechanism that enumerates RDT monitoring
capability and the specific monitoring features exposed to software. The ERDT 
CMRC table provides topology/resource description associated with those monitoring
capabilities, but it is not itself a capability enumeration mechanism.
From that perspective, a CMRC table existing without the associated CPUID monitoring
enumeration would create an architectural inconsistency, as software would have topology
information for a monitoring capability that has not been exposed through the
architectural discovery mechanism."

> > diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> > index 400973ebf2b8..f350a516d3d9 100644
> > --- a/arch/x86/kernel/cpu/resctrl/erdt.c
> > +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> > @@ -26,6 +26,10 @@ static bool erdt_enabled;
> >  #define CMRC_SUPPORTED_INDEX_FN		1
> >  #define RMDD_FLAG_CPU_L3_DOMAIN		BIT(0)
> >  
> > +/* Set in a monitoring counter when it holds no valid data to report. */
> > +#define UNAVAILABLE_COUNTER		BIT_ULL(63)
> 
> Can this be CMRC_UNAVAILABLE_COUNTER? (or some other appropriate prefix that makes
> it more specific)
>

Yes, let me rename it to this.

> > +#define CMRC_FLAG_UNAVAILABLE_BIT	BIT(0)
> > +
> >  /* Bitmask of valid sub-tables found in the first RMDD, used to ensure all RMDDs match. */
> >  static u32 valid_subtbl_mask;
> >  
> > @@ -50,7 +54,12 @@ static unsigned int erdt_scale;
> >  
> >  bool erdt_support(int flag)
> >  {
> > -	return false;
> > +	switch (flag) {
> > +	case X86_FEATURE_CQM_OCCUP_LLC:
> > +		return valid_subtbl_mask & BIT(ACPI_ERDT_TYPE_CMRC);
> > +	default:
> > +		return false;
> > +	}
> >  }
> >  
> >  unsigned int erdt_get_max_rmid(void)
> > @@ -60,7 +69,68 @@ unsigned int erdt_get_max_rmid(void)
> >  
> >  unsigned int erdt_get_scale(void)
> >  {
> > -	return erdt_scale;
> > +	/* Divided by snc_nodes_per_l3_cache, see erdt_read_l3_occupancy(). */
> > +	return erdt_scale / snc_nodes_per_l3_cache;
> > +}
> > +
> 
> 
> > +static u32 cmrc_index_function_1(struct acpi_erdt_cmrc *cmrc, u32 rmid)
> Please add a function comment connecting cmrc_index_function_1() to CMRC_SUPPORTED_INDEX_FN
> and also documents where this function comes from (eg. RDT architecture spec).
>

OK, will do.

> > +{
> > +	/*
> > +	 * MMIO_offset_for_RMID# =
> > +	 *   (RMID / ClumpSize) * Stride +
> > +	 *   (RMID % ClumpSize) * 8
> 
> Looks like above can just be on one line? When adding function comment about origin of
> algorithm it may be more fitting to move this comment there.
>

OK, will re-format above comment.

> > +	 */
> > +	return (rmid / cmrc->clump_size) * cmrc->clump_stride +
> > +	       (rmid % cmrc->clump_size) * 8;
> > +}
> > +
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
> > +	/* Overflow of cmt_reg_size * SZ_4K already validated in erdt_ioremap(). */
> > +	if (offset + sizeof(u64) > (u32)cmrc->cmt_reg_size * SZ_4K)
> > +		return -EINVAL;
> > +
> > +	l3_cmt_count = readq(d->base[ERDT_MMIO_CMRC_BASE] + offset);
> > +	if ((cmrc->flags & CMRC_FLAG_UNAVAILABLE_BIT) &&
> > +	    (l3_cmt_count & UNAVAILABLE_COUNTER))
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * In legacy mode, scale is divided by snc_nodes_per_l3_cache to
> > +	 * prevent over-calculation of aggregated monitor data, do it
> > +	 * the same for MMIO based access.
> > +	 * This scaling factor might need to be revisited/tuned for future
> > +	 * platforms that support both SNC and MMIO-based monitoring
> > +	 * simultaneously.
> > +	 */
> > +	*val = l3_cmt_count * cmrc->up_scale / snc_nodes_per_l3_cache;
> 
> Please consider all sashiko's comments about SNC systems - from what I can tell
> the comments are accurate and the SNC support needs a second look.
>

Yes, I saw Sashiko's comments about SNC, but it looks like it's not a practical
issue for now - at least for the current platform, I'm not sure how ERDT and SNC
can co-exist:

The definition of SNC (Sub-NUMA Clustering) is to 'divide' an L3 into smaller L3
slices by mapping addresses to different L3 slices. But the current platform with
ERDT enabled has 4 L3 per socket, and it is unlikely this L3 is further divided.
So my understanding is that, unless the real platform will do the SNC division,
and with ERDT enhanced to support SNC node (currently ERDT is only L3 scope for
the CPU agent, no node-scope domains), we can consider SNC. For now I do not see
the need to consider SNC on an ERDT-enabled platform. Maybe we can print a warning
if snc_nodes_per_l3_cache > 1 that the ERDT parsing should be stopped and should
fall back to the legacy MSR interfaces?

thanks,
Chenyu
