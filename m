Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDE84908DA;
	Tue,  1 Sep 2026 17:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788285541; cv=fail; b=B2lwOR1VzccGpI0DMNatLZns8vUbkiyO0wFzRtygZe4vNwsp4cyx5SVOhGziWeYe9us2zwJEwbcSIo70EjCOZJA6HE4Q7u4KgZaKZ5OTBRMT7QxPaX6smb7w7bGZmO9DGFMifpelHE4Uqiy/MXXU/ZxvHbvYbbXo72KdTNH3BHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788285541; c=relaxed/simple;
	bh=BxnrMtdxZOB+3L7I7MmmJuvhMZEpjLSdvdwfrwdYlmU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hTJLJXRy46TTaOI2C+fCsEQ6TE0+suVfXdOrm3zovcjsCkicPzzpCT4umayc77j2mGrF67QIy56bXDLZwDSMUVRpFWjYS+L3N/dPR7VYWB1Gkqo7KVD9lfSY3IvRGr+xM7dc7g6lNBz+K8e3Joq+LNrXPVlxubPauB3WbuxeMMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddO6neMu; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddO6neMu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788285540; x=1819821540;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=BxnrMtdxZOB+3L7I7MmmJuvhMZEpjLSdvdwfrwdYlmU=;
  b=ddO6neMuwewwNq/HzPYEIrcraujxhnKk/DTc88/qAKRyolzJ7++2ZAvx
   TWJk/4TqOrb1mQrY+Yiv/m7WWvknCN2w3UHg9NoLsPxE1JwhDlZxSVGTJ
   JZVbwo0TIuqju8WDwHGCwh4ZoO37lqhwc9SDFkEV5xVNMjhD2tK8jd9SG
   E6UYPAOjI2IHwTdmmW4O0g4dLsY3vG9t86WQf3aOGdfBTQSpTIwvRzCck
   jfIGKUEOAjfiYieOQUqlu+gvw3VANRylYjGycFtLuXzbWvMeqX2e04Qi+
   1gFsGR8kmPx5nnfU8R2ouSJ22L3jMIYJl+VXr77ic00YRzYcQSXJfuXKl
   w==;
X-CSE-ConnectionGUID: W3jqBUm8SxGfSaIL5vvHSA==
X-CSE-MsgGUID: oViI8fGZQsOVAOirQ/gb2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88851914"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="88851914"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 10:58:59 -0700
X-CSE-ConnectionGUID: TpmICvYITP2FN+m55OJZbg==
X-CSE-MsgGUID: ABzXjfQGQ7eMywgv8SpsvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="266572600"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 10:58:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 10:58:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 10:58:58 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 10:58:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8GMLvpFFyWTlmKG1U3fpsbWibrl2loP8TH2QYi4kjOJUuYqhvujSy7eSNlhqWRbEadg3BgAerqmVobvL2+XRdIa0E2RXDv+JWc/7m1+/EbZO84CE5izWTX/KRDF3Sp1s/OgXp2HRo80FxBNxVMVl+arjhn2s0icpOS4SxCBp5Iygovey2lttQcYm1lxs8XvrRM6pwcog0NZqLV6vwD5/Xj2ypG4GK39sqxM5AQBtTfVMknNpZ5XUcpdtPAPM7SaMzkbdV79KthfWDaAHQa4iR4VQinH+piw3GukLf6F4yGqz4kkBcgjUwREolDz00zWWhRODpnp+xRiVXcGhaIwfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnNLmmrcBy4Tgc1kmerl3QJ31uyWRoj8jWXNSoZjUPM=;
 b=e470igl3dxSi2TOoPrztsW/6RFf3YZYUpD53yQXoF+CpVHOVIk6e9JZZ7fjICB9uEKX1zhehZxBzkI2062LeFV4+dHC1+XeXAd9NMPeGejcKkm4agnVTibdTUy702Pcjrf6yX4XNrx99p2sf9Y7kNG5AsbViSLQyXAzmpvO8mQ+JJZ9bJavrcnFHianxSjFTSlMQGVPloWS2UO1rfs4D2g4okDrJlH82jY6WjzcBqQvDYiI3ABAB5ttp9eyIxoelwRE/hWIkTYjgpBFlpqFDpr87eOTq0Oj1c7NaKkFYqZTugi/63gqXafDoBp/DwUR0zKd5CRuteGxW0MMHjb82Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 17:58:54 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 17:58:54 +0000
Date: Tue, 1 Sep 2026 10:58:52 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>
CC: <bp@alien8.de>, <tglx@kernel.org>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<frederic@kernel.org>, <marco.crivellari@suse.com>, <sean@ashe.io>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] x86/mce: Avoid arming periodic polling timer on
 isolated CPUs
Message-ID: <apcSXFCnuU3QGr_S@agluck-desk3>
References: <20260901151138.132950-1-atomlin@atomlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260901151138.132950-1-atomlin@atomlin.com>
X-ClientProxiedBy: BY5PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::17) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|MN0PR11MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b5dd4cc-4a59-4ef0-e28a-08df0852afc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|6133799003|56012099006|10067099003|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: thckPWZYAuloR6rdVHcUG1aAaXENIKwNyU4yH42pds3JA9gAq3zMomsVL+5h6W4t2/Xv2UCpgsU71QQ1DJXXJYeIdF+AWEmi5J+EHiGCs0xwAGIMnIDayJFa47zuseF/Ol+NXa/+AmE/PLNyU1C68wof1HAGKQj0l7DVpiqVvbiMeLoRX5aoFyECMuM0EIgxinWGye9h1fpOmmDKusYUwGbt0wLgkkjUkAVbqY7l4gAqLsJ4eOIZc96aDEg59iZZe0cXEAIRA2wcL0jdtMlCPVZr99sZhR484V3l09rP8WQC0p4IfUAuLMWPmk/I2m9iQ4rvRep94X9Dh8b6f1mjopBzUwBjTWlgo9SgcN0EJuHEe0enGB90Ql3tR07J9JTe0L8ySmuYsva1znOvDFGj2bYdzPC0Yh69igHC/8F8ArlabWpHoplRbXOiTxc/0yraxVUOotvQ6L8kCrVmQcuhXNdsRecwc+qT+j8FCKLusSF3Wvi12cA0/8xTm2fKsz8QGGn3Rr1o6xeHEqEuP17jm7C9r8XhUx0t6lKW/1R/DSGSEGs7S0yg1Hb/T8C2H+DFYmNNsEqqNTxAPmiM+f0Hxw5ZmA0Mn+cKTouzaD6kevyncCx5xX+6m90vDdPneQJfQXgUOSmIuXMBYSMne5m77cOB5u7A783R2hKilQBj0ZY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(6133799003)(56012099006)(10067099003)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QowqxhIA5wSNeinVXEXeP7gPFcOKOFXrmjq3KsODpIbL8MTILh989CO5odNj?=
 =?us-ascii?Q?hca3hPGMmQX0EAh8pU8ltyXXwm5qd+z88MvsFnDy5FJjUU7Q2V9D2UWOEBs6?=
 =?us-ascii?Q?lXzTK5KCqJXeT3dW6YsPM22eTwvNwvEbpa3AUYWkusF8Rcx8CQA+eN57pXXF?=
 =?us-ascii?Q?zqLnI3rPaNvXWlol3ZNvcFrMYtOh7iZjbCsEvGZmZFoXdl3j8OoGmwaBXQlS?=
 =?us-ascii?Q?wYMHq4lEo4O3Xllskcwtvy+V4mckrI81Cr3D9Q/jT/2gAPwgktOOv8sEBgoA?=
 =?us-ascii?Q?c+YwqjElcMHSDrTt6zU/cJ6Yg/8/4nZPMOoPApjdbyod2f56lHGHjI33bc3H?=
 =?us-ascii?Q?/6Sz8IGZxJxORaZ40WcU0kFImncQclpLuOMac9H1Z0zD6XEsz57iAOdeYYWc?=
 =?us-ascii?Q?EE/hnNQ/8Umwj227F3vec2+b73iamJXGNwFyObRYqyT148OSvaPu2R+byEFU?=
 =?us-ascii?Q?g3mu5Z97lP2k4//t2k3FIMdNS8OkNPTwiSFgVK5YAUb+ZN9htV8zCi+fDoo0?=
 =?us-ascii?Q?dDKM45IBzynzI2gSYIX9i7Kvq+Yz2IeknyrMfyIjziPoHMiwcqvPjPkRBVm/?=
 =?us-ascii?Q?chNtrteJI98LBA5osFS18dSLC/9sJUfFZgr4W8WOaPw73K1lY42SiOjHytaK?=
 =?us-ascii?Q?cOtUF4s9YE2+G/BHLJbf3+8J16LNTWhNG372tVFjC3V6p+zsFBZEJ1OXvjwN?=
 =?us-ascii?Q?uCh1jEFrurwZVwo+UQEUQ0e0tHOrXdUMj4AZyOJWMgWWR+DSgi+na1w38vNb?=
 =?us-ascii?Q?eyjy6ntFjBycSri1HX7BJ8NeI+smUlCOWSfUx0IPwrTpLcFj5aQcjKm6kFvd?=
 =?us-ascii?Q?n5ax5Qp7M4pX0Tf7U7xPWmCh/AtgL3uJpR8EzDeS+xdpGuhkYciL27CxnMvH?=
 =?us-ascii?Q?wfq7+JWGCbTHCP1EVBoL1PL24h35b4g4ONztPKlKZY4lkpBtwLBLX3GUC8bv?=
 =?us-ascii?Q?66wMxKolOLgEsjXEhLQgX+q+e4oLf0hzeovSiRP5pZM041JIqCzCnvziv7nr?=
 =?us-ascii?Q?uaDU5Pj0uB1Q1AmNnViDJMsyUDqsH/W1jLsVKm+LSnDO9khY6e2/MASD/tgX?=
 =?us-ascii?Q?YRev8AOZwsRn8jtztI307WdlejUl1vms6/TkzI7jDWEkwZy2gf7Biw+e/Tc4?=
 =?us-ascii?Q?TOKeVbGfTx6G3yaCYKgA8gn7IpzU8h7SbvfnXZZnHTF6QMSbCmFRagCwrmaJ?=
 =?us-ascii?Q?GiL4T0U7itXtCSzaHvuwNmOBZjHQkSur81linH82jGVMB47KkiBKYQAiklRN?=
 =?us-ascii?Q?5/L9J0kyLAAtREEumnHxtB8YBiBTx2mE91lt2ySs7aP5B+NuIVBuYtmzEpOp?=
 =?us-ascii?Q?YVGDDqVdLbwQbZDbVr8b3lp9HkP80G6sYXW+HSikz0egEB1+JM5Y2TpDM84E?=
 =?us-ascii?Q?AaPbLQ/aXI5KKMIcDuXexEjF7MDVFt2CclaY9g8mT4GtbVR8yzwu3eW/LIJI?=
 =?us-ascii?Q?zBMq4KZHxrhpc0FmiJJPMkfQP2P8H38fg8qAwNPMPX9UPNkl/MX2PyhiXn6l?=
 =?us-ascii?Q?kQ/B3O8XckrnHU1UvNk7FiiCtNtRYZp28RYodDL+Eh2TraIG3lDj5Nch3Qhh?=
 =?us-ascii?Q?pdLxafuVhuabmGBGHxvZYR69gQilwPWR4xeyjV0L2LuQJuMpID59PC4Qj/7S?=
 =?us-ascii?Q?t0H0h80YWKhc+ZyfTEU2ioJW3bWSHm8hUk7djSJlbXEFSyI9p/Q4EgupHe4+?=
 =?us-ascii?Q?lou6eqRt5WHD4gBxf2hv75rQGi9Nri8sT8AkW3rpiL9B5pEc9urUnJjNG7uQ?=
 =?us-ascii?Q?N79xylU/zw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 2q2gl2utZDwjRZ9SmGNcS+jFV+RGta+sAxWi/VyEbPGqQSajLk9NX9BuPHa27GGyD3/2+7itnAl14GGv2xO7nAJhQGmhqcuutpazEltLgBdo0DTO77Nri7ma6xN64Oz0Cdqp3xNFKIbNzHsKrVdoFs/EwNV5Vg7IT5IeuD47+OyZfzSF2sV0/8bpITdLfmfTgHT8lwYAMS2iZyU1puwB1Zzf6+phL5A9n1nCzpvnMQs7lx1jbMaRfKJ5FJirNZb4Mmz765SJiCLbZci8RGrkjiRto2d3WWuHCT+6UBna38ZsAp16uurui0h4PGuQVs+YsdfR1eA3/hk/gumKK8kYUw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5dd4cc-4a59-4ef0-e28a-08df0852afc3
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 17:58:54.1128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SR9VEtVaMFXQ5mxmu2MQhAVoz1NP1QzyCja7kFulwlxmlxe8AawQjo93Bcr+tSeiAtEkdtEHlKeuSoNqcN6zTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6278
X-OriginatorOrg: intel.com

On Tue, Sep 01, 2026 at 11:11:38AM -0400, Aaron Tomlin wrote:
> Latency-sensitive workloads rely on CPU isolation (i.e., configured via
> nohz_full= or isolcpus=nohz) to guarantee deterministic execution
> without interruption from background kernel activity.
> 
> On x86 platforms, the Machine Check Architecture (MCA) subsystem arms a
> per-CPU, pinned standard timer (mce_timer) to periodically poll hardware
> banks for "silent" corrected machine check errors. Because mce_timer is
> pinned to the local CPU via TIMER_PINNED, the timer core cannot migrate
> its expiration to a housekeeping CPU. Consequently, every check_interval
> (defaulting to five minutes, or as frequently as every 10 ms during
> error decay), a timer tick interrupts the isolated CPU to execute
> mce_timer_fn() and machine_check_poll(), introducing unavoidable latency
> jitter.
> 
> Presently, the only mechanisms available to suppress this timer (i.e.,
> the mce=ignore_ce boot parameter or setting check_interval=0 via sysfs)
> are system-wide globals. Setting these attributes disables polling
> across the entire platform, needlessly blinding non-isolated
> housekeeping CPUs from monitoring shared memory controllers and uncore
> error telemetry.
> 
> Amend should_enable_timer() to query housekeeping_cpu() for
> HK_TYPE_TIMER (HK_TYPE_KERNEL_NOISE). When a CPU is designated as
> isolated, the timer is neither armed at CPU online nor re-armed upon
> timer expiration. Housekeeping CPUs continue to run their polling timers
> unaltered, preserving routine monitoring of shared package and memory
> controller banks.
> 
> On isolated CPUs, critical synchronous exceptions (#MC) remain fully
> functional for fatal and recoverable uncorrected errors, and CMCI
> interrupts continue to deliver asynchronous notifications where
> supported. When CPU isolation is not configured, static branch
> optimisations ensure zero runtime overhead.

There's a better approach which hasn't managed to get to the top of my
priority queue.

If you look at the mce_poll_banks bitmask, you'll likely see that the
only bit set in the range of supported banks is for bank 4 or bank 6.
That's the "PCU" (Power Control Unit?) bank. All the other bits are
zeroed because Linux found that CMCI was supported, so no polling is
needed (assuming CMCI hasn't been disabled).

There was a misunderstanding about the full meaning of the CMCI_EN
bit in the IA32_MCi_CTL2 MSR. Older versions of the Intel Software
Developer's Manual left Linux coders with the impression that if
CMCI_EN was not supported for a bank, then software would have to
poll to see any corrected errors.

Newer editions update volume 3B section 18.5 "CORRECTED MACHINE CHECK ERROR INTERRUPT":

  To detect the existence of thresholding for a given bank, software writes only
  bits 14:0 with the threshold value. If the bits persist, then thresholding
  is available (and CMCI is available). If the bits are all 0's, then no
  thresholding exists. To detect that CMCI signaling exists, software writes
  a 1 to bit 30 of the MCi_CTL2 register. Upon subsequent read, if bit 30 =
  0, no CMCI is available for this bank and no corrected or UCNA errors will
  be reported on this bank.  If bit 30 = 1, then CMCI is available and enabled.

The addition being the "and no corrected or UCNA errors will be reported on this bank"

The PCU bank behaves this way. It doesn't support CMCI because:

  *NO CORRECTED ERRORS WILL BE REPORTED IN THE PCU BANK*

so a waste of cycles to poll it.

So Linux needs:

1) Properly handle systems that support CMCI, but have bank(s) that don't.
   The bit for such banks should be cleared in mce_poll_banks.
2) Add a check to see if mce_poll_banks is empty, don't start the timer.

> 
> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> ---
>  arch/x86/kernel/cpu/mce/core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index ab469605fc89..fd047968ad17 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -25,6 +25,7 @@
>  #include <linux/delay.h>
>  #include <linux/ctype.h>
>  #include <linux/sched.h>
> +#include <linux/sched/isolation.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
>  #include <linux/slab.h>
> @@ -1759,6 +1760,9 @@ void (*mc_poll_banks)(void) = mc_poll_banks_default;
>  
>  static bool should_enable_timer(unsigned long iv)
>  {
> +	if (!housekeeping_cpu(smp_processor_id(), HK_TYPE_TIMER))
> +		return false;
> +
>  	return !mca_cfg.ignore_ce && iv;
>  }
>  
> -- 
> 2.55.0
> 

-Tony
