Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504C02248AF
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789823999; cv=fail; b=if3tkzkJ5Lx044bAIiTScNadIRqvnrEc+UDQMJ6zZ/s00e0sGRZm0OT5l2K+a9G0QI4Gj6pSyXmpXlDyWnAcBYt303eGudtTe9286SsdhMsc0wNvZ57Pyz3FC/tJ46wFRp3Q8D6naG0qCDoixD8TipZ63pAiv5yFQNWbD0pTu7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789823999; c=relaxed/simple;
	bh=2kia8DcNjHTxnoUrYqRNmiSKf/8a+6QQKXHoJlgmC8Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f2c/5J44A7ntY8eOLgOJRvlvhLWEW3PSakqfIm9YRplp+kWlGrp021ytVjzLhIGIRrvWDdZg1hUFZqb9Te++4C7G7olMyhtPgcxUqnW/ebduzqjrs0m71SJh1AD4LLXti78lwvL35EWP6kv+7uWYPMPT05UlLvxMNXVMAymhllE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJjDm/a3; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJjDm/a3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789823996; x=1821359996;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=2kia8DcNjHTxnoUrYqRNmiSKf/8a+6QQKXHoJlgmC8Y=;
  b=JJjDm/a3EO4L/CByQdhJ/770L5PhZSh8ARPiMq/iTdNbsrNKLzi6k2nR
   7WRt3DoMnQyov/rAgy8hrKlrKK3eBRFVtQn/15dizb7EWMK+D/xrw00X9
   vCoaxMybWPuaa3o+AGoqFBTyYMvKvk8KpHnncaj6W7LtP6FBraMIF8rZm
   uoxx6QtC6YoMn5V2iLXBmf8865ackh6pQ97dtJnL5+RdaFscl19WhOyPM
   r/h0N562ZwTIRTLYzqymwGO9PFm7f+qwv54G9RQHPY8bbl58pIl1tDnju
   rhnP+TvYb+kIwvC8DWO/pIcN4XdmHLY3d9Toi/hVfRhEjTIz4h25oasuq
   Q==;
X-CSE-ConnectionGUID: nWeZZm8jSfqaLhDLm9BqaQ==
X-CSE-MsgGUID: GS6Zauy3Q4uyOu3YT2iLZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90217731"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="90217731"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 06:19:56 -0700
X-CSE-ConnectionGUID: jexX7MsWQzybA49yDpVBQQ==
X-CSE-MsgGUID: GqSnrf5mRe2ranSHMC857Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="280014383"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 06:19:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 19 Sep 2026 06:19:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sat, 19 Sep 2026 06:19:55 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 19 Sep 2026 06:19:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNcXLD7jrUeDRlwMpqFW/YpLfj4UAwWmAdS0He9Bs5MfA3euqgEVjWwLFDV2LljtkDf991lgMhIsZ64bWZAcrXv4TgTMnEyinYBgJVMbjcObFRPpmw/m27F0q49asU8KoagkY13Zs9xowjOYz1LcPqBNx1Igz+TonvECfxwU4vc/WeHh250x0Hj2vZKvvlNISSvPebecdmDsdYjoxF4B/xfDMl64OTj0g16Vk6dbZa/SxYuf9mjXTG98790SOYPYIoRKZXDgTQxOupD69CsA1Ko+f3z0rL6u++g0Cwft5l35iOMTce8CZMGnfeCA2NYnvdZjwa/jbZl8OP7xE0GMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWJUKoDlZhNAKGOEG6b8qmAJoH+OPUDjylvk/G5MuPY=;
 b=gflHEFQbSc6gCJ+9TnqJzza3mOBV2uYZXzzWSJbFarbhrHP5EaPDrcvOnjA22lJIEVwat8BPIzw/ijtVyrt5kKCZbiqQb2OAWwRGH8U3RuDSv/F6IQ/djPUTJzadWvFx4T6ITeiJ52HrtIansW0ub/wGmwvBfwqgM9ShyKOQrm0i6b4FEYxB1PFUA1cVecP9WrMPzChJSgzgR1PcVOyqiOeYud4CBstO8tie6PzF0FuzJZZenJ4V5zpNebGtBIcmpLQ1Qkgkuj8dBL4SeBIwBzELL/WhqivBUhlLkacf39as6t/TA+7gkEBFGfm2Xa518HVXtNiVE3BKuXFIMkyKGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by PH0PR11MB5111.namprd11.prod.outlook.com (2603:10b6:510:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Sat, 19 Sep
 2026 13:19:48 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0428.014; Sat, 19 Sep 2026
 13:19:48 +0000
Date: Sat, 19 Sep 2026 21:19:41 +0800
From: Philip Li <philip.li@intel.com>
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Link Mauve <linkmauve@linkmauve.fr>, "Christophe Leroy (CS GROUP)"
	<chleroy@kernel.org>
Subject: Re: warning: unknown and unstable feature specified for
 `-Ctarget-feature`: `mma`
Message-ID: <aq6L7SCSRE2XwB/q@rli9-mobl>
References: <202609171549.xeqQabC6-lkp@intel.com>
 <aqzPCnhvogJ9XEJg@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aqzPCnhvogJ9XEJg@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
X-ClientProxiedBy: PH8P220CA0057.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::17) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|PH0PR11MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c96c33-b9c3-49f0-e6ec-08df1650ade6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: k3LrkWj09cN2cLZrxx6IbjLSYm5ojq4u7awECT2SsXzU7fZCetV2Ilz4AV9D7Y4wI3JAfuH4sh6xPxaNW/kV6Aj06L2tu7nGc7XqGq2GlCTQm3NDJHvm56CY7XKhEU6Iex9V3YGrVU7NBkevHjKJhAfNlxd/HvPhXIqvPoOq1+4CXHRxsSDoOAUriHV5orrId3f9zTMGvKnxRoyk7plKKY5H2o61vBp4ah8g4QsZZ15P7eYjDwC+IiiJvncyQfhpxmNAEj7PoA+7LKzZgqxqRlw6NA7ndn5rqvxBFd5UnxSmQQxDJ+/yDLiCXZlDIrQGptyL7s3ZcuNjf+JuA1KibbVVZFJnmBoH5ctGs9uUHDYS7cnzHrpebZ1P3JEni1bsEVaYDBp2tR0OCwiJRXUv0VV1JeRPdyQLoTIoiuCHmuk7MKPsk+1DrTh/d60dzTBAyTa4cbWKhdy5PzTTQG815w3i7yCo4q4hdS6LAim55L6kKyzaNtwyDp1JhAPHA0SNc1r3hlCV8hIBvuyVhMPV6U38S5pEEVkhgiTHpyBxihwMYIBwKjIpNC+kxMzmVxYIyeo4tlZn+uLmEuCdpAnl1ABiwcelg2A70LV4qI25W5T/5qE+n94uLjUeGxobr+HqDgANEweN49y9I01MAFCEL2RMfceg8qnv6bJJz9Pm2K8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L2ZxNGEJOwKE1i+G8e/GUI3gef8ScBvMWbbGKmWgcBqrGMz+7pK1Re8efFg6?=
 =?us-ascii?Q?7KHpPnbagzsz7SQwK+MWKPmUqwF7RMKUjE1JSWf0dXHYr6UQkoMqq6bLSacC?=
 =?us-ascii?Q?XXik7FMtzqTICI7+ICTfqK9J4j7jUc5idyljAvzGEAJcPKTshp/BevTxkJed?=
 =?us-ascii?Q?RVezzNKpbnop6iALEKIoq7CMb3HmI2ZQCbJ0QNt0O7LnvmJbM3hw4rBTpunA?=
 =?us-ascii?Q?Ja2obDZSmVBLR2CXG3W6cz7uNzPUrHyEFXfhdPDrKN1AbUJVNoO1LYbNPHH8?=
 =?us-ascii?Q?LH5RlK3btYO7Elqt3jEqvWOF6aSihXHlHpc/9LWURsNG6jG7WGaLmQ+v7+qi?=
 =?us-ascii?Q?5tHUjH+nqVLNdmXl8E5AtgWhXDgXX2sDrQnTWeslahzPan2socMfBvtwk7y4?=
 =?us-ascii?Q?X31D3znzYTpmYaAW3EHh7BJUkI6XBWHN6YPc8vojbttlCR29os4lXRzlHhpG?=
 =?us-ascii?Q?YiMn5PY1zE1Dvbg0+K8T/JDavNWnxQSpIFHdcoFlantZtZKzxaqLWiFsowbA?=
 =?us-ascii?Q?OOCBBgw9CewhIHVPQx2PkE9G+HxBCzO2VlMxY6jBqiC299mIAyWGLf0ZlZ6p?=
 =?us-ascii?Q?s2YR/EPkfSds+KPZnS8CU/v6loLIuoUgn8AJUp99tinAis0eGKa/oL9rgBSr?=
 =?us-ascii?Q?nHkzBrZBrbTXxWjCQbk0uECtXHhlW4RTQfp8iult/juVX5LCnVblZcIzijUD?=
 =?us-ascii?Q?HrJvVBPy6sYexQF7AjkLh+FQY0mls3+xz2RRQlkc3hdiyD4DxZZ0chc77voE?=
 =?us-ascii?Q?JNcyIYcaV7VdrQY0kz4MYVw4hXHMMIP1UI3gn63lewu58KJ0Lf/FITbYRVTy?=
 =?us-ascii?Q?q5oJ3ju4+BQgFh6bwI68IMEWog50p8cSkneO3jlWY1jdDpXI4XWs8N3Q/d4E?=
 =?us-ascii?Q?7TERmS6y8MjyhFyZBpkoabMfxtxHR4WGbrEAiZlz8AB0BMwScYJxjMfRfbu3?=
 =?us-ascii?Q?GigdUpgS+c0gQiiAcBgnbo7qwa3+rgwiz4pT1gBESnKDKcopyVt/GUWY3yVH?=
 =?us-ascii?Q?HhlKoOTBMmQmSzUJU8waO3x2FmL0lauV1vYOkveCqQsrQnY8nZ0fJZfBhdIe?=
 =?us-ascii?Q?SIyiKJLXmo6oam1srgNTgzbdCba7ZBMN0o+uR6CqrHpwzHgpiMiPVq7WWUnV?=
 =?us-ascii?Q?8MIrY3/LHRmgbdRFs0pCV0rsThpk/oCM6aKur3T2lKxYCnOf1TriV1Ka4Gb6?=
 =?us-ascii?Q?l62vDW60gy9F9wN/OClhHC4yIdcp2QahfX259KnRqQuTA9BwEXMZ0nkpRz+9?=
 =?us-ascii?Q?NXR6ihzlbYQHiDO+79pVT3nSJOqH3VZEOYGAq13MMiUVw6NLLzAPZnX4kr1W?=
 =?us-ascii?Q?BuOcOslfvLpFW0ZdFpQhlUT0eIwEUAbvyjX9xttsDnDc+fIq3vRehCztUFwH?=
 =?us-ascii?Q?cjVkP7Wz0bcxvJDLXgSsSU5G6vQVfyOqbjPRU/W7TWqh6eZw8o3n+liaZpDT?=
 =?us-ascii?Q?jBjCno7CtXmBAk6zTCsIpw/nB9nOg7EZUKkJBeoN2Qpfz0jXSlpZTnQVuefB?=
 =?us-ascii?Q?+s2zzWepjjkXbh13DPZtHRUzzi9N0GWivNOq1CY6/S5WXiQ3jsym3RVtEvwM?=
 =?us-ascii?Q?X9JJZQ4au3tIlhU3EWb2J/kPdkHNE3QTssCE24AjIbj4lZillIhO6CKIvKdz?=
 =?us-ascii?Q?y5Hx/+41AeRQwGq0BgNPeprUUWfkfg0opyqV6YwYVs6QmXfaTCqO3hN0nI2w?=
 =?us-ascii?Q?n3Resqg+VeSkY/uFraXCrApg3s/7QDyIDJt6hA57GARc1XoDYAsbMnwkGVKa?=
 =?us-ascii?Q?MCMBvAFVRg=3D=3D?=
X-Exchange-RoutingPolicyChecked: fHFf73yaxttSysbEvMuGOhTBC+viu1LgyH8F2rMSYZqFfVPBkm0ocY2PxPB/j9+WTbSqpZQono3uOikqtsn/0EMZiQCiIdCw6VN9H0PINYV0/bGcftpTIDDNWwelJZD/rN8F602gTp77qo0Q0iiWm3N4wIbt2ubWJ5GpB8bFaq6gDunhld9OaXabKlhqKoPSvMl8BOBu5/Csobgt1NEEBnUA2vUoXkwblu+nzRedD0k+9s1oxTtHwI9Tpil3mQwkfEqYMCKEwrfzMvqLUV4OBLnfTQ++HgZHw5dslzvbkluT0U3ljxQgZqsW7IDlVVbSBXY/kJXZE2JnHJMjPL6Mkg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c96c33-b9c3-49f0-e6ec-08df1650ade6
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 13:19:48.1682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RR6vDX18V04Ya4JWo5LW8tYDD98hrAb1aopnnn2nWSuRm8yeCLtqfGAPtB7vAkl10/nAT6xmRJEG6LvyLnRmqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
X-OriginatorOrg: intel.com

On Fri, Sep 18, 2026 at 11:12:13AM +0530, Mukesh Kumar Chaurasiya wrote:
> On Thu, Sep 17, 2026 at 03:38:46PM +0200, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   238650ef6c7c7cca08e032527329424c9fbd70e5
> > commit: bc87cbdb952e9223616b839d64bdb4723aa2ed1d powerpc: Enable Rust for ppc64le
> > date:   7 weeks ago
> > config: powerpc64-randconfig-r2201-20260917 (https://download.01.org/0day-ci/archive/20260917/202609171549.xeqQabC6-lkp@intel.com/config)
> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> > smatch: v0.5.0-9187-g5189e3fb
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609171549.xeqQabC6-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Fixes: bc87cbdb952e ("powerpc: Enable Rust for ppc64le")
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202609171549.xeqQabC6-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> warning: unknown and unstable feature specified for `-Ctarget-feature`: `mma`
> >    |
> >    = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
> >    = help: consider filing a feature request
> > --
> > >> warning: unstable feature specified for `-Ctarget-feature`: `vsx`
> >    |
> >    = note: this feature is not stably supported; its behavior can change in the future
> > --
> > >> warning: unknown and unstable feature specified for `-Ctarget-feature`: `hard-float`
> >    |
> >    = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
> >    = help: consider filing a feature request
> > --
> > >> warning: unstable feature specified for `-Ctarget-feature`: `altivec`
> >    |
> >    = note: this feature is not stably supported; its behavior can change in the future
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> This is expected, the issue for the same is raised to rust-lang.

Thanks for the info, I will configure the bot to avoid reporting this again.

> 
> Regards,
> Mukesh
> 
