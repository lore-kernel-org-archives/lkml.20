Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546D74A2625
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529360; cv=fail; b=a+mob/J4lw94u+T0J7sq4oerGz2Oh9DBLeQqempdUx6KWkFGX1HbxmosJ9PLL2fPtXmlxEc7ZPZpec52xC4+axx3k1A/NSpSEKDWj1n0Fx6NZOK+MUs0XLcaI5ou1+ywZuEG2vLpPEeAlMp06x0KJgZnKqlqmUDa7Yu9bsTYyMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529360; c=relaxed/simple;
	bh=0bTk6orkhsLR8SiIZAKisIvwG7y1MTKRca5yUc7dB4U=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dWoFObvt64Dw2CvOyeQ6GW7I5qhNlfZT47Tp9bQpnRhcQYjUKs5CxWYg+hmBFKJcQWQwKWl9hodzGv81ybgLaurXwfICsRk9OgdZgo+ZEP3O1AlbYKLBNfTvE+PQAgaE23B3YbTBovy2eQibDhOWQj+9W+S0zUZuUOdfiVZuToY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDzXIf6Y; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDzXIf6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788529355; x=1820065355;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=0bTk6orkhsLR8SiIZAKisIvwG7y1MTKRca5yUc7dB4U=;
  b=HDzXIf6YZp3Q4sKW7CgtggwrVF5z4BtIHd3N4y3ofaRKBwSll792sbtT
   qdYFyh6eet7g6Vrc7NNfH7IX43ObARWbUDoyIFq1ON7YrkDhMesKzE9VS
   OzVejNv8D7+bl3teW5ZVpqPZj0glC629JjlNPsAOF69uc8lJ6dWGCyGPB
   QD0eOX0W6D6+vBwuf1GBQc/iK7aKYSVenUtTxTylckiBw09ZwkdYKVrB5
   SfecVklm+T65i7meGKeBNKxmiYEyXKBl9Y3LhY0yoJ77A+Zkmq7LTKGI2
   HGeeJioRL8oL2L1DOJPVkI/ErcdYQ0Jai7bUa7l3xqsOe8H5wpC6WIj4V
   w==;
X-CSE-ConnectionGUID: 5aSCYzZkTcuxaZ4ygOoMHg==
X-CSE-MsgGUID: Is641BYlR1ORtgG5Mlyybw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100549567"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="100549567"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 06:42:34 -0700
X-CSE-ConnectionGUID: lO11C/9sQUyDYVyLvBnH3w==
X-CSE-MsgGUID: irabRaEqRfyn4tZJjnXlLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="270575845"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 06:42:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 06:42:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 06:42:34 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 06:42:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqGHA5oq1E1hESdk+vzKXq5h3Uzp2Pkpo0s4NhD4iNHMFZKR8YEtOTbl9byuS3uFXKFLQygVC9j2gtngJX857jPtsdaBWfq3zY0UbYvQ1dXZLeoPml/wLExPSnpTBc5MzX8mEpfFV/8dt381FLEmEypKxIcsLrpDRrUTx1R762Oi3Ta46fLPHcXrYjzFmNbAizjUtsfB+COuGdBrhVX5S6KzEVtke687OVU5ADZaanULREpPWYetsfVb1u3Hm7uUnl1QJ3kIHEOZIMXqaKtaINw6+++ZAl5Lk5+qhiwXTX/vLGiennyJi+yuEMRuaEKjmfBXLkgIF1d6Zx2OrI4fJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kNM/BbNLAftnognb8OKPQjZxaUw5tSmovuqvsaygv0=;
 b=TOX3wC+w2QmuttySKt4LSF/mhfOYEgkyFpOm7s+PvCHB2W9RyR1GmHlbezUi5PIC/p0HI2WYOE8bC2QtkTHTbTNOy8XNJ0VV2Wpg5Elqxz4PQPYDxbileVxz8fg0kAxRi317l69Kj8l2rXOIVTJoo5cdLsGJptrtcyjoln23Fi5hQ6htXSPuveG3CVvNzQR1qMuT0I7DDi4yjdU+fT2O9W+PVH98XqgdINmHKKp9qodZJrmM6lzD7Zm4Jw6hFG2n7xfunAjHiaGq/22blRfQ7d3CMmyughiAh8sScVeDTpR5dyMSI6Rr5CQcz/CaoGI/JYyErAfqyB9E/I88zjS2fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e) by IA4PR11MB9345.namprd11.prod.outlook.com
 (2603:10b6:208:56c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 13:42:26 +0000
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae]) by PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 13:42:24 +0000
Date: Fri, 4 Sep 2026 21:42:15 +0800
From: Philip Li <philip.li@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: include/linux/irq-entry-common.h:218: undefined reference to
 `syscall_enter_audit'
Message-ID: <aprKt3OlFvdQN5w+@rli9-mobl>
References: <202609031938.ZvZZaRQy-lkp@intel.com>
 <87wlt29k5v.ffs@fw13>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87wlt29k5v.ffs@fw13>
X-ClientProxiedBy: TP0P295CA0007.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::7)
 To PH3PPF4E874A00C.namprd11.prod.outlook.com (2603:10b6:518:1::d1e)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF4E874A00C:EE_|IA4PR11MB9345:EE_
X-MS-Office365-Filtering-Correlation-Id: adbfe248-f448-4b75-b63f-08df0a8a5a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: D1uWmxXmJ090x8sBseS97UKwzblMMUN/S68cJt1/Mzdwh0sw3u9og6jyKNVfUxyrSwOEPRaGiJ1kqfM7N9JowVwcrammpPBtJwCt2uVf9TvTLb9JYYx8X/hjImw/VwP0SWall9BiLieM1WA+2yzZT7xSv1eFG2XpkRCS3kCDD2H+WTjHOhCKPRwit3weSWjYKxAZOkiZi45ojbRBiOjj/N2bqKa2wThejuevkgqNV89tXet6z4441PHBm9DJanTosupCDIu3QhWvGkzdsWvRDpZwSZQm04jQ2Q9YWe3YjB5YBDL34ZelWu3KLXYyO2BLZSKNnKSBogT/I+9OUP98CjIkgKSczaMChayhLuf35+jz5r3v+lavdEwgq0qEbSahh+uudGYcRgtBMDbeEJaNWcmj4e1KkqlUcIwA7nWiWjKM8imm+Kqb9glIIX2wdrb3vzUihG6JivJxgMzXvXnTy2oJLYhrjj6cpPhFR+GUuaeK//idc4k2sLKgS3kUCRVUNF4Rjbd8A95qX59Qb19Nl0PvDKVFm9u/wfU3f9wJgIfNixKZdJF49bGuuM+uIHPyTUglNGj1zzbS+qcfj2EevRvWyZ8n+puBxEchE6sMCRYzT6cmuU2Gm93dYbGuGTsEFSN3EuNAFn/IQLGfh5GzK3r2GUJV0FjSwHqKFNOEFVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF4E874A00C.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FvnQvL3HW03kw44EENGL5WNpVXFoB5dWjeYmj3O9j+6bL1hmT4Z0synWkytX?=
 =?us-ascii?Q?EO/lXY9D2mzpZ420VhJC9GieTA8LS5fxC5Ufd/lfjrmrQcnb+DCVIhZxnM21?=
 =?us-ascii?Q?PCQ2w+vXf+P/Cr9YUHROy0e3w8+YuFAi9YASpEsVSl46wuRjjvgtXbpbx5fw?=
 =?us-ascii?Q?k8sy3s1aFTke2a3aZwSEKM9Zv28p2TkUsEKOU5kl1Lor/887kiMMJgeaopZV?=
 =?us-ascii?Q?7TrjI5jQRqgY4xqNTPcx++XeSyNx+AtXttY+g1GkAEqSl3wmS7VJ2axJgQ6J?=
 =?us-ascii?Q?+kICd3JYgNYTZhSXdE8Th5LXLLqQbCanA9KaH1ApDMwgEnHlgtwZSGoXlhaV?=
 =?us-ascii?Q?WlLE9jphyU9HVYLpu24/OB7ijX8rA85SPT6CQ+uyGBpY/az5AUO9wNEqRasH?=
 =?us-ascii?Q?iTlnWaB6umNarCS9kG38u9TZQmXR2DE7dQeT85OkBshRk6g9v0I9Vjo2tnZ5?=
 =?us-ascii?Q?TYuASE4oQ+rAY50wBhZLPJQrtA1iNUlgoaOPbOctPnsHcHvSPH4hYLurjtaq?=
 =?us-ascii?Q?88ikllZueLgBuqiitvd37zkbEkCB8eKfthxcn7hY0z64erhD5jH60HmWZuGU?=
 =?us-ascii?Q?tjHKlDAPYvtPQ2aTA7ndmHEyQx5BfZdWj8xiUOM4CnAhn9GLHeScntdEWZ+Y?=
 =?us-ascii?Q?jpbiAYZwWLKmNls2okvLAnzP2J1DSp5UQK3zITZQgFk6S6Lc4o752wD8regM?=
 =?us-ascii?Q?qTJ3crY4TW2LwpIohagCdMY/hyjj4c+IBBqSIpNtD7SHkguw60ZqK3uGnQu4?=
 =?us-ascii?Q?gdtcmDOVD45smRM2eFVrp9bO+JK8gC+WBhdLK+h6cyyKXjTkJbi9SmXeYMJL?=
 =?us-ascii?Q?Wq4NeDQ0EKJKo6PBAH1T+rRxXAZLv9Z0y9LZRJcS0zJmtIV8eyGR+6ibIHGd?=
 =?us-ascii?Q?4W8ioOoED2SWiUSv6tXnTqFD7kO606mJ4+QyMRgUn066Rm4nMuC6dHY5Aopy?=
 =?us-ascii?Q?yeigtxvH2IhsMgYP5a1PqbcARqPmqiVqtMtrv3vpOSnbMVotVS983Tbe7RX1?=
 =?us-ascii?Q?jf0BJ9SouFgn4GB0aCovaWQEE657rM8x95MsIcnv0ny2eN7E6CYRpF8Na/CN?=
 =?us-ascii?Q?mDgVNdbUsTlUYc3UIykRAk+Hnv9jgmwN1buFccXysw2ofvekqzpUbNnTDvpu?=
 =?us-ascii?Q?VDkIo9/Yn3/Zo38FL8q4tBF6Jd1aiJcP9Gme0Q7oAoPbgW0vYflCQWTtS0xV?=
 =?us-ascii?Q?DTnH6dWoKcERq0kpWO6Kl146o8RMX/mfdjJXBJ9f5EDoCVssP0STcDHsFbi5?=
 =?us-ascii?Q?yVVi2y711vOx6aHNm4iXMcUrS847l1VFcwfDwdjlHEEuYfQPWfDNp7jVcYte?=
 =?us-ascii?Q?I5qxWlzsatEAhcbwkjW/05iO+y7l/kZzaE0QSy9t3vQFj8LXWSW4XPp6cHXA?=
 =?us-ascii?Q?2ujWNNfqbH3UXHWNtVLyTGG0ZQ55L7LkyND12rc+AjVPLo8SCCGHCV5dLI9k?=
 =?us-ascii?Q?aMG24OqCr1zpzVGwGQABQdbfj5bXdCFJwSXn+Q+EQN1aFQw7/uOwxf+IsxLk?=
 =?us-ascii?Q?QMRU+BSCjcBSGYYcaDVa0vEYmXGhcfBG+y4i8RzB4lh6v5BcGIvEfDVXtalM?=
 =?us-ascii?Q?fDmvGsusokAnbDlu/wbZud8HjsT4YODWF3r5GDj/h2aiti5YaTH/e4skALO+?=
 =?us-ascii?Q?H+naxafaKWrWpaX7MBoYAdOWCwWY3r5HtUQMpAmTgjjur0gxDODIWtmE9jU9?=
 =?us-ascii?Q?4FWW4rl9Uon6t+Pki7RSAqJekusmJT1WF+KVANXSx+F4sr9zTU8Y1vEvGUr7?=
 =?us-ascii?Q?ec9wXYrjgQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: f64mdqrHQC5s74QupE8rvq9zwWFqVNxxNFgikXrZ3nT5n0f7WvZgIPzUG2cd2F/WjeahcyQ/MIPoauN4S8Q2U6i8jZb+J/wdqFi9kEAOSSEBBiCnyDE5LNK4QRG1zEUFAiljq14W+QEF6f9rJNERbxA72zdlmvhds6ZhSz3JJ1e8W66RHYHEVrq5gJoJxtPqr9dlh26bi+qMmA9E5QoyOEMnTaUryzsnG1CFEBd1ENiLwTl0C41ZUhqM1vbrYn+NcuFUT5ds8aWDpYcB8qYyFU5+qpYQ+cUt2VbzKZDg5taq9fUOPqZSylOkzJM82tsHDSlogbCyuNw+ABVkY97UJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: adbfe248-f448-4b75-b63f-08df0a8a5a2c
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF4E874A00C.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 13:42:24.7045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAdgI1Xv7aQLDVTaHbYl4SC8Ev4QmcfMv2C4FU/PCyUubwZi7/y47nXG+JJNvT5HdRa1LxZ3Ft0j2U5a2tFK8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9345
X-OriginatorOrg: intel.com

On Thu, Sep 03, 2026 at 10:03:56PM +0200, Thomas Gleixner wrote:
> On Thu, Sep 03 2026 at 19:35, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   940de590b839f71d6dc846160534bf202401b8b7
> > commit: 6f25517010ddd3f8080d7e06b9b1cb1b64b73772 entry: Rework syscall_audit_enter()
> > date:   6 weeks ago
> > config: riscv-randconfig-r052-20260903 (https://download.01.org/0day-ci/archive/20260903/202609031938.ZvZZaRQy-lkp@intel.com/config)
> > compiler: riscv64-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031938.ZvZZaRQy-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Fixes: 6f25517010dd ("entry: Rework syscall_audit_enter()")
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202609031938.ZvZZaRQy-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    riscv64-linux-ld: arch/riscv/kernel/traps.o: in function `__exit_to_user_mode_validate':
> >>> include/linux/irq-entry-common.h:218: undefined reference to `syscall_enter_audit'
> 
> Seriously?
> 
> >
> > vim +218 include/linux/irq-entry-common.h
> >
> > a70e9f647f501e3 Jinjie Ruan     2025-06-24  212  
> > 70fe25a3bc53a89 Thomas Gleixner 2025-10-27  213  static __always_inline void __exit_to_user_mode_validate(void)
> > 70fe25a3bc53a89 Thomas Gleixner 2025-10-27  214  {
> > a70e9f647f501e3 Jinjie Ruan     2025-06-24  215  	/* Ensure that kernel state is sane for a return to userspace */
> > a70e9f647f501e3 Jinjie Ruan     2025-06-24  216  	kmap_assert_nomap();
> > a70e9f647f501e3 Jinjie Ruan     2025-06-24  217  	lockdep_assert_irqs_disabled();
> > a70e9f647f501e3 Jinjie Ruan     2025-06-24 @218  	lockdep_sys_exit();
> 
> What the heck has line 218 to do with that failure?
> 
> This is getting stupid. It seems there is yet another compiler aside of
> s390 gcc which fails to do dead code elimination but this time it's
> worse it also points to the wrong place ....

Sorry for the confusion, I give a try with riscv gcc 12.5.0 for the same kconfig, the
result is below

	include/asm-generic/preempt.h:54:(.noinstr.text+0x1a20): undefined reference to 'syscall_enter_audit'

This is FYI, I will further think of how to provide better error info, probably favor
newer compiler more during the bot testing.

> 
> Thanks,
> 
>         tglx
> 
