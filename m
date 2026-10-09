Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2E345A2AB
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526508; cv=fail; b=a1lN+O6vs5EJ01unsX5xPAZDc/Bo0p4Ll6KjnMegowXOM2Z1q/Ajx6DjpkxkTA1YGNlM+yet70WLtBWLLb8o+9WkUWXcSZxtVQI8hZnTxQsu11WHWq108U1jn3dNf2oEM534qPTBOsdh7szrD5+2e6DH5wqmLs9Sd8GZDcoVbyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526508; c=relaxed/simple;
	bh=/hqzL7r7l9RS5UMPA5O+O+Kgk965x0rqyJCnCmQ5EdQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oRVSnmSc9EGG8Hc3ITlIV1nVdCe0j1FobxcLbxhFv+q4EGaH3sCG+g6LShT5dQmJcoW/JR7PeoS0gNIMoDihffczqilpg4mUR4pVXHyM90rbGN92NLyuGMLbfdzulJr+yWgFkwWTXtQIjxMVYcPP8m1YB1KvkIpdZyXMCexfibE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WBkGfN9p; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WBkGfN9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791526505; x=1823062505;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/hqzL7r7l9RS5UMPA5O+O+Kgk965x0rqyJCnCmQ5EdQ=;
  b=WBkGfN9pWsQyahJM0iHCIwRym5dD9j9I2HH1Y9Tv2duXtXvXy1MuNNQ9
   YV4sb+dvQ83Y9YQLPZ6v+2uy06WoMQgC3+oZs+jR+/jERbX3xTm6BrBWn
   FI9X5QwVJRgjmEwR/F2UvcJhqxES+qtIhMF+yaEjAmmG2HfMFWJM9q9wr
   L3s/hkbzrQQxO6EbThLCUC9CKGGIFDIUKhCbATBuTCSIH41S4PKiabfIR
   5Yr1pzkL7qZ8GLkhrjByiT5NeNL/9nf3dVlldyflgC06zFks8LkwkC2GU
   QAFtgrR5nHSSHcTViLERbR1kHaPA8SL5g/KZF2ztDzsyy8ETafGGD+Tp8
   g==;
X-CSE-ConnectionGUID: 9VJL1TTnT867gb6mtCv3sQ==
X-CSE-MsgGUID: A24T/083QP61oY+KUrJ5hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="321593"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="321593"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 23:15:04 -0700
X-CSE-ConnectionGUID: g9fO9yCCT5Kna3d8O5rBkA==
X-CSE-MsgGUID: NmYSvbfLS6KuSOKw7Jn8aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="223692"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 23:15:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:15:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 23:15:02 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:15:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D53u+z2UYZuJMQ10uwwkw02qvxKwWBDp40GnwfmkOuc4p8hfsCULIzuIymQ3oR2NKDgYUshKY4LcbDa9RG7lMpDSDedjRHPFnBH0IUqUM2VbseLJ7avMZN+whtYQAlMQBJzzspf/zmKDesaJRP6AKoQ1vJzeCqJNQMhqq7NWjhljSsvufaf/Kp3eHZww6xp8UK4YGj8egU9MPePskWFuGSClh+z1Q80KYvP48PBdvcwGkURdVViMIvr7RQFiuG6vQ5gRqpBPTDKVn1YrgdNzHBUr4m/z22vW1ru6rnwjpOLMCC9zc8RekY6S0FuofzfDV9J0PvvWbpAMkk+lKvTjmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hioLCRdmNS1Q9yrBdA92BQcuM6n3NWcv8FPE8pQjk0A=;
 b=ItTw5P4ib0CUctx+kyLSnp9JVkoVWU4ly06ppBkiTPmyrw8HFL5YTbCMyVcQr9kKdwNZBhLIjDo55WhN2p5j8+OW9rDt+rkViWAPsg3GDMqxKURymSdzJpLntv20bcvu5bPoY57loP4P7QXf1vx46zKFM56XyfdWFkUwVoyvRiNVQ6LrYtddKO4ESf4OPiNYUUiqNFOUVOg4U0Cl+D624zL1slnlCNPKrOTOzFpYdC+0urSPHjtma7rVOGN69+NFQa1R80Vah9ExnE/WU00VnDhwwiH/q9HEOFgPO9AY82ciUGGu75YSTXY6psCzBjRPdbjF1t4Onb6gIZ0N36TZuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.20; Fri, 9 Oct 2026 06:14:54 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 06:14:54 +0000
Date: Fri, 9 Oct 2026 14:01:50 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	"Hongyu Ning" <hongyu.ning@linux.intel.com>
Subject: Re: [PATCH v8 9/9] x86/resctrl: Add MMIO-based LLC occupancy
 monitoring support
Message-ID: <asiDTn1SAR5WTvCH@chenyu-dev>
References: <cover.1789705667.git.yu.c.chen@intel.com>
 <bfe91aeeb714f14e2d1a9c3066ceab0e62c3c231.1789705667.git.yu.c.chen@intel.com>
 <6999ac64-054a-4f7f-a62f-36f8efb129bb@intel.com>
 <asc_gEQv8p9Egi4V@chenyu-dev>
 <b25e24fd-33ea-46b4-a526-d4121aaa3c26@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b25e24fd-33ea-46b4-a526-d4121aaa3c26@intel.com>
X-ClientProxiedBy: TP0P295CA0028.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:5::8)
 To DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|DS0PR11MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c65d53d-fa8a-41b0-0ff7-08df25cca235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|7416014|6133799003|18002099003|22082099003|3023799007|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: dWQhchN8Mlx8/rSOfi3bW/oLfRlKTnxiVPBH1aapu1aCCw3DReRVqqys3+vblOe2SLeysRArBzGB1He+r0gclfh1FGjesFJuGc+aPirlSfLiulB5pwt65DRumBho/V29iDNjAIoE8/vMlGEuPGqSOUfALCxQr6Fbbn++AkD8Hwi8kPrnBNa9kjXbGBR5fpyI5T3Rh6DelsyY/Wj6d57a1i55O6lPuZjcLoJnHE1Ev7yhzw+gi3M52mXTfWGm+4HEHjuVxZoa4hsc9XhT4xbMF4poB3c5nx7p6Ookb10HN+trYucZDgtw9+UuqSGhIL5OPvj733pjeIQtWz8p635fmkvmOOYukCfQnWihdkmTDdtqEdpEHnfxDAG4s/Typve88UE2mLhk2v99IWxwsxIftKACgPQmJFVEVSu/a0QlmMj5xonGH3oHPaDIz3dKts0kI3nUaiPq6UO3Tt+taX/T5RwY2HwWYrwkPmoEjyOlT24YrQadeHH4oBRC2P/kkq2geX642BqO5s+Fci246zar7aVZ2Ry9+oQPue9grC9GhoHNEAzvrZGHcP/WZ/x3/0DUcI3Y7I1HwXjSC5rVY2kBGkwsKtmF5FrpUbwOAKK0un6JAiXK1Fi8FGyYT3f/2vrMFBvPpmk08/vuheystH2Fh1cKvZVHXBgLvGXxLzzrkj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(7416014)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Buket9Br78u3eY4+edfa6DKAtV26Tu7ollkHg+S3CVpqJvqRCYsYU/ShcbT?=
 =?us-ascii?Q?+TVL2VE+Pw/tBXHDiNOoUut/ZCLZDSP82s3Ek4ef/t8TW4c7cqieaka1keEN?=
 =?us-ascii?Q?/SbK7Smo6/+8OUUEJSnyk+ySF4vEQBElnIdkIW4wxip3LdRr50vdND1iVeUU?=
 =?us-ascii?Q?jIcpklEmtFlFq+uUjDVh53XU9LeJazn8VFetsWL6DSS2KkZVZPAIQjRyMYzQ?=
 =?us-ascii?Q?4vRjzWPcsSNumIB72ikP+ZphvYV+tVubagJyfp4S4YqIJbqfrNI3HzoNVXTj?=
 =?us-ascii?Q?n4WOEs3pGevj51fiE+GWcaspCsqqWYw+kYSOZ7hPsRpIwgokw0l4Cc1U5gW3?=
 =?us-ascii?Q?2JeIxMPO61ymx6piY3UioYuB1OOJMDVEO5fjeUwLJU2TRU/VfAqCZ1unr5n9?=
 =?us-ascii?Q?8nkci1uvQvupPZYMYonQUahApZbGSr1KVFhruldYHimB9NyC3kCWrcrllwrx?=
 =?us-ascii?Q?M6LuHVbMKO1jVq/q08g/RWVbs1hWrnSzRgT/6Qepw25sIP5x7jL4DmEIy/sI?=
 =?us-ascii?Q?nz/RnaGelypCl2KhH5GYO7ef1dzZSmN/T4HqG5p0++/B+NLhAk0V28/RsTsW?=
 =?us-ascii?Q?gmcVgsMRFQxEC+SwtV8eGWz8tiZV0FyBontQpJnw9owDkJuEmCCNMxzt11zc?=
 =?us-ascii?Q?CfHjPLJosLsklfoZaBoMrO/Z+rzVM3L4TEy42r/F+elTyNxrDR9J0d9fNtVv?=
 =?us-ascii?Q?egnJP7sF2JpZN9nplytsQMvfMuORjmxf5Th6gAkG68ClG6IDGm8dGuVxdKVt?=
 =?us-ascii?Q?mU1jHNzLRo0mzMgb50FGSWtKTBf1w+Ng/76yCitFyoxpa2C9+rEl7I6bv4Xq?=
 =?us-ascii?Q?boxKPUPS2jlOBkiXwtwxVCb+YJ6CE9p5/wo12DKTwWdzcfm0yGW48SGbcnlC?=
 =?us-ascii?Q?DIJi1QXX+rBSH8HW457LCSB0cVnoElgOn92a0YiuytvikHdAXDS4zlvTamwV?=
 =?us-ascii?Q?X8ED8di1saQG0fL4EeRoA2fXN5vh14QX2CQ1yyEBazU3gtWQdUkb9mUydGdo?=
 =?us-ascii?Q?mw3pa8vJUuqtVyDlsRCphLgMdjF+zH3Sa3DnhatLxFRniw1Jlye5amVaJCoB?=
 =?us-ascii?Q?iJUPBCTReagdfWzuYy8434A4hb0ldTlCdfifljUseCHKtLPatQjicxqqaqa1?=
 =?us-ascii?Q?qXwAexV6dJUgdtp9rubUD1KmV29lz2Eos9UVpDI/IlWnG7lFLUKtT3DZPWIN?=
 =?us-ascii?Q?ysa+tDP0xLS+2RgAOCjbYGWzTq72jiRmruSiqBg9E/AbMwsr23b4b+QYW5Kt?=
 =?us-ascii?Q?yezse0g0edWScTCXSeoqAEajU3HRXd/8ctIPcPH/ez4PYqirDrTxJX7srYUy?=
 =?us-ascii?Q?kh/S8GsxL1DXCkdA6n3bXsqTeoTyfRnm3teSk5TxeC+z6PLKM/D9OElcO4Lv?=
 =?us-ascii?Q?4+bpI68GINTiO+ANSjLicXlZnPPjWgrFDduQCZGEAqSq44Qyj4R70We2SBJA?=
 =?us-ascii?Q?Wb3lh9LjMveNXfazeFtbjPS9QCAI78JzE9iBQSCn4R/LMzu4HIriYO317Sxy?=
 =?us-ascii?Q?FVfuV/wwWca6RFmTMVZeeXDFK9jQIuX06pUM1pflldXjCItPqVptP2R2avX5?=
 =?us-ascii?Q?tfTC2KKVBG+bYz2rPCw0vAplI+FM8eLgL2xL8l9cWcMktokB6UQBGRRGOtOU?=
 =?us-ascii?Q?e7xOLaUepfOl54gRvB+Wj7tfZNqafoxDKSXwiZbNXHDSfpa42AuO1qLOPeQ+?=
 =?us-ascii?Q?cIulQO0qN4+zfjgUQCWd3JY6mQdbHDVwENhxNE87olOEiQi6KkRidvWMp6Mj?=
 =?us-ascii?Q?/A3QgjcwcA=3D=3D?=
X-Exchange-RoutingPolicyChecked: ZtQVJ6KMfXdn1iaDuf4DPZdjqRj7mfG9SE4OmW7/OlklY+bNqSEE4laxTh9g0a8BJizIp3Mo1zd4taK82YEjuQmbGaqUUkayFJMLK+bpoaihF7FrAypJ91pvb6B2y6pfl/BCP0xzLVwLP312YtS7/E1SH/Kd1mZd4gvLhVj8vVFX6amU3aZ84rjqE5KruNM2BfwPAEumO1uKOd9bhVki7AhFo27bE4HMqYZwlG5QhpAsPZH53VH/AYgWf5VncpmrrgFIYJI3a71cB8g9U3yFLZnukCVjNe8aDW7oWbBGRQDjlRorO1S9vsYyqUBUUXgUYYPxj5s38xEXISzW/6/7Qw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c65d53d-fa8a-41b0-0ff7-08df25cca235
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 06:14:54.0595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VmyN8IQt5Q+0npUyVYUSo8OLX6qh/f/MCICbYqt3G3iSy2dUoaPfgzADLRFEoyr+BddUCsUCPbaMgUhPP5A6Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7621
X-OriginatorOrg: intel.com

Hi Reinette,

On Thu, Oct 08, 2026 at 08:52:26AM -0700, Reinette Chatre wrote:
> Hi Chenyu,
> 
>  
> >>> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> >>> index ca7e67f976d5..135f2eb2a5a5 100644
> >>> --- a/arch/x86/kernel/cpu/resctrl/core.c
> >>> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> >>> @@ -1007,7 +1007,10 @@ static __init bool get_rdt_mon_resources(void)
> >>>  	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
> >>>  	bool ret = false;
> >>>  
> >>> -	if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
> >>> +	if (erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
> >>> +		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID, true, 0, NULL);
> >>> +		ret = true;
> >>> +	} else if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
> >>>  		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID, false, 0, NULL);
> >>>  		ret = true;
> >>>  	}
> >>
> >> Would https://lore.kernel.org/lkml/20260916231320.14502-3-tony.luck@intel.com/
> >> break this?
> >>
> > 
> > It would not break this - because the ERDT exists independently of the CPUID
> > query result, but the CPUID result should be the fundamental check before ERDT
> 
> Does this mean this implementation, that parses ERDT _before_ CPUID, needs to be
> flipped? Is this required? This series parses the table before checking CPUID, leaving
> the decision whether to use it or not based on CPUID data checked afterwards. This
> seems ok and looks to support a simpler implementation?
>

Yes, currently the ERDT parsing is done before this CPUID check. We can leave the
ERDT parsing as it is, and then when it comes to the actual CPUID check, only when
CPUID is supported will we further check if the ERDT is supported. If yes, enable
the MMIO interface, something like:

if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
	resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID, erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC), 0, NULL);
	ret = true;
}

> > parsing - the ERDT can decide whether to use the MMIO or legacy MSR interface,
> > but the existence of CMT support should be the first thing to check. I
> > got the following feedback from the RDT arch:
> > "Architecturally, CPUID remains the mechanism that enumerates RDT monitoring
> > capability and the specific monitoring features exposed to software. The ERDT 
> > CMRC table provides topology/resource description associated with those monitoring
> > capabilities, but it is not itself a capability enumeration mechanism.
> 
> If I interpret this correctly a system with a CMRC table still has to indicate
> LLC occupancy support via CPUID.0FH.01H:EDX?

Yes, this is my understanding.

> For the implementation that would mean
> MMIO interface is only used when rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC) *and* 
> erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC) are true?
>

Yes, I think so.

> Apart from that it sounds like Tony's patch will support this work to make the
> enumeration dependency clear.
>

Yes, Tony's patch helps filter the platforms without CPUID support, even if the ERDT
table is present (unlikely).

> > From that perspective, a CMRC table existing without the associated CPUID monitoring
> > enumeration would create an architectural inconsistency, as software would have topology
> > information for a monitoring capability that has not been exposed through the
> > architectural discovery mechanism."
> >>> +	/*
> >>> +	 * In legacy mode, scale is divided by snc_nodes_per_l3_cache to
> >>> +	 * prevent over-calculation of aggregated monitor data, do it
> >>> +	 * the same for MMIO based access.
> >>> +	 * This scaling factor might need to be revisited/tuned for future
> >>> +	 * platforms that support both SNC and MMIO-based monitoring
> >>> +	 * simultaneously.
> >>> +	 */
> >>> +	*val = l3_cmt_count * cmrc->up_scale / snc_nodes_per_l3_cache;
> >>
> >> Please consider all sashiko's comments about SNC systems - from what I can tell
> >> the comments are accurate and the SNC support needs a second look.
> >>
> > 
> > Yes, I saw Sashiko's comments about SNC, but it looks like it's not a practical
> > issue for now - at least for the current platform, I'm not sure how ERDT and SNC
> > can co-exist:
> > 
> > The definition of SNC (Sub-NUMA Clustering) is to 'divide' an L3 into smaller L3
> > slices by mapping addresses to different L3 slices. But the current platform with
> > ERDT enabled has 4 L3 per socket, and it is unlikely this L3 is further divided.
> > So my understanding is that, unless the real platform will do the SNC division,
> > and with ERDT enhanced to support SNC node (currently ERDT is only L3 scope for
> > the CPU agent, no node-scope domains), we can consider SNC. For now I do not see
> > the need to consider SNC on an ERDT-enabled platform. Maybe we can print a warning
> > if snc_nodes_per_l3_cache > 1 that the ERDT parsing should be stopped and should
> > fall back to the legacy MSR interfaces?
> Yes, if SNC need not be supported then please do make that clear. The current implementation,
> for example in the line above, makes it seem as though SNC is supported but for correctness
> then subtly requires it not to.
>

OK, let me revise the code/comment to explicitly say that "SNC and ERDT cannot co-exist".

thanks,
Chenyu
