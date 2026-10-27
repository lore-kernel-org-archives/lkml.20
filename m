Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793099218;
	b=kNtQA0Pm4shIIJqAfGNgt7fnAsalmn1TJbcWXxDya1fSEmYUZ1mVGnbSnjiHVB+lwftS
	 en3+DhMrhc20lDZIrm8EO+vGu43tZEdYdCbNCbAscxLM4lPTdknJaWuS0Vno4DCXY/UPe
	 vzoNacafRdHHSUNU2xiavIwrpB5gk6brrgTkLpxNIMq3/Z1AkpDQ4tjKj8LCs3kGqWJmb
	 rQkYOV6gi0aRocC68F1UYbSRqiteZ3I1t8q3vwwcmrVsgGy3WnOGbJqrFVigV9xOesB50
	 0S2yWyoOS54jnDwNa1AugoUnVyFk80VOxdJjczCpegoqD6l8glLA0qt9dkgjqmd1k8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099218;
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
	bh=EDBSg/aBdsZW8g3nEO/Fs8MztXT1Y7s8voplESk4si4=;
	b=HOjCEUhb4+Vgf3GeCONXd842a1cXieXfpOPg//fwy70leSWwcGrBupJcVsBwJDqpfOEQ
	 Th4hliypdPbk9WMBE38sO0iMyuyfZNsneguvgBffHrAvlpUQYFjjunAhmrz1ACvb1ZEhV
	 a3t/qf2FhWG55MqpkGswNGjEta3toqi4j3o9QN9mEZr8xotnjHdvp47IzrfB5/ZhppzGN
	 I9yNzpiTHUNWhyRgJQ+x4zhMGY3OM3Y3EpKfE3p0jISD9F3FYqu4vRGap8buwOahKcSog
	 bAfN0rwAJC52nCQaPRAZounfUrRzuKk3sMc5xMvyDWNy5IkapiE7lLApzRbdMWtC9LA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CPrLn5UR;
	arc=fail smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241A060A2605
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 241A060A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CPrLn5UR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793099218; x=1824635218;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=BYRE232fku92GoKmDD+NWl9tK5sJ9jOy0cYZORoWZFs=;
  b=CPrLn5URMh3h5UfqW7X2PDMho+mo5GXSiVsG64oPs/1aHEq8zsDy2QOS
   2NQ4bNcU95Rjpf8QJz0mzcvWYpO3Kg6zlEH+0imHCk2YCfxqQ7COFNczD
   frVCQ+NGxB2moLtLUjNaKKY8PY1Y9t4KIwrIzw3t11FZO5K+RQ0WOdbiW
   93RYE1GwN+ejIV5lUNBgA0w93V+kx9ujhfRCsyxEALfXWcFsw55XwYuDH
   keyXrUcPZM9/hMhiIwKu2brlDjQQoLzAcXgSjYr0YX5vkQ3DZV9oQgh5K
   MbaYVuKyNnPoNrPV49D4OHfBN0ud5p+xWYw99BJEaIVCbE7igM5HtlTkp
   g==;
X-CSE-ConnectionGUID: eMe+QOWwSPSmFH1EEe94QA==
X-CSE-MsgGUID: MM7nPPsGS2SyzXjYsca4bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1903469"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1903469"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 04:06:57 -0700
X-CSE-ConnectionGUID: bzQdnO4HSxm32+a0Q8BCQA==
X-CSE-MsgGUID: XlHC+x1PS2WoH3sNcB5J2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4920762"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 04:06:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 04:06:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 04:06:56 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 04:06:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFVfQbRPAON5BgpQBnqXbPP7heOI5/RXGSxlvExZNsmjyjeQRQLyB5NNbVBL8N4sJMLk/E6/pgTcF27hlaXWzyN3P0o+CdwQ89SrEaJBXObRmsLjNO3j1HdsQELXx3dHvRkPad5fl0ps1/uOTE9ubp/T5B103u5hAoRAI7SKZVEaF3u/gxyRSPTq9YITg+sxi1IOswqZZooeYCF1U0xZdVCRj8dvYoGhQU8DsVB/KebGv8RRIm5Wt+0wQ0UfldF4dtFnEyQCGWspPIhi5IkXLlNWnSf4aVmMbNm3DlsqRHBzy32ee2ebxtmg1UVsjC2O60edw5+KoNLz5Dg6nBoOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDBSg/aBdsZW8g3nEO/Fs8MztXT1Y7s8voplESk4si4=;
 b=mnn8HXk4yOY7H5dkEo8IU8A0ivBWDYBtE2XP78PZ91VJP+FBlv4MwL2Rhd1FM0cDWVbKkwPydonKlq7/ghNa74vWurBL0X8Yf2BuEz7NFg/L+zoJN+/UPMDuwFaocUaYj7ToVijdkqwV2EoRPiHv4AeQt7eYNnKuwj9GVfKFON/MDNccN1dVcR3YIMBR05+Nht5gyPSj6Oc/FaVSpjoC1T0UnncfLxvJ914aR6USTYnRiz4CoUjODdSf1H+7owgJLYKEIljtv3OgFd+exXRADoYPgPjYdzS53LVEXD4nuKO7WzJHx5dI/HTvLcob+GVwi5jAvX17jXNwGZ0MDCrZrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Tue, 27 Oct 2026 11:06:43 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 11:06:43 +0000
Date: Tue, 27 Oct 2026 18:53:49 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 07/12] x86/resctrl: Add a global ERDT monitor scale
Message-ID: <auCCvYQpfXj9CTgv@chenyu-dev>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <ec2671aec51023ffacc8bd265a57f7aa09195d23.1791933001.git.yu.c.chen@intel.com>
 <4e594656-b883-47c3-975c-087d10b98c74@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4e594656-b883-47c3-975c-087d10b98c74@intel.com>
X-ClientProxiedBy: SI3PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::19) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|DS0PR11MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a02008-3314-4c91-a0f5-08df341a622f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|261026140227099003|11063799006|4143699003|56012099006|261026121527099003|261021121427099003|261022075727099003|261009223027099003|261022105027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: a16E1st0ApblH+rOpM2GLe5l9giYUfmCtMb7P0X/ndYvw3etco905ZizE5ztaIJIZAVH15qVAGfSDmM1ZO/v4uI/05X+hrXU031WnggJb7e2jqEy3xlyP6D9gXmSGsG1PspnbNhpAgLCCjRvYM2SqdMO4H5gHW2tqA+PH5XJ4gNdlIjGv9K6HjfSZcQ+fU3f5/5Nl9TpJL2Ci5Vc7UIQeALu+PZRsH5NWuRAX5Bm6GY5G4o2E1W/ToHBxN6jO3zhZHzNPfxowPbLXM83VJdHeTDPu5aTgS5KcJBuy13alwiaXVzA78ciNmJOzvipadkQsIihufx/rY5T/rJZCfTGuSm7aLQ7Dihzi+gqbsJ2Y272YIVafaxrBtbzoBUTNVkM13UVUE6B3l1TCkNmzIsHMXVxd7eqlMOL6TnpvV9XypS9KEJe+/64CTMelJiqbo3mF5+u9AcM2q9iYltePOnZP+LsrlZ6uTddxnIcwNdlYrk5hGZv2coIzZeIbsO202Dwa0Z9AM3zE/G1dtumrMBlAvOUmVJKhKyurM2S7UXIcRgWRQ5iIsPe4LeO9TXNzmdHkwNGApWRbI9zJ7JtP+v/cLbMtXl9B4+JZf5unl+afhmxCXIAMx3lzo4vaI49nm5qdzxzV2zu6+BUlFF3Trf/N82rV/f47xxb/Nh+2USLHIs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(261026140227099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261021121427099003)(261022075727099003)(261009223027099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wy6N3rx8eojzTaIBKkKrKi5KECWSWqNnj6PpFH7qA/DuyPblhQekpct/F7AF?=
 =?us-ascii?Q?U5bRwVrxrZ6gJA308Edz5WSwr6Sa8jvDwLRPtvuuFtOkv68kRwj0rwIPaGA5?=
 =?us-ascii?Q?Wz8XPZbWjUaLSjmv+BR5CyUmA4UM6QH1U2hXHaaWz9lkWXMHcJ86wmCBEQ6a?=
 =?us-ascii?Q?ffjbKwRJcCwZixvNluBVDreSaI+kKNAg7NalzJyCHhczonQGWw4Zg4ijMbPB?=
 =?us-ascii?Q?VkNVgvehxUAKxhZVJtuh02NF53Bfo2e35buAJdKmFkt4IeASj2XSJbq4rhlB?=
 =?us-ascii?Q?YnBrP4wqNv6ltxuyjl2LnH9HCx+aFgFhyn1DujvpNQvAfaWLaMbKwfHp47SC?=
 =?us-ascii?Q?EqyYQIaiBu+mQbYDoZiQOK+jyOcEluvOhWhueGiIxxFrBdbjHXKFMMxBr1St?=
 =?us-ascii?Q?eK1SKzekwmTM1VXswoETPbjKUUMu60vGerHGwSEGv81MG9YzVsDjcfZhXJbX?=
 =?us-ascii?Q?DJkPmJrMe5z3f861rofedNZ1Pb56rfeYNLyzZhEv53qW0wYk5HNc1qfb7Otu?=
 =?us-ascii?Q?fkBzPw29RIs0kI5nOxbfBx0z6Gni67HMCCgHpLyOjDiFaScwOhZSi3biFMf8?=
 =?us-ascii?Q?YCWtdktTV+EoWpKxKLVUIsF74WvP2bRQOmp47glf91sODwojgTasOHtTkiJ5?=
 =?us-ascii?Q?b19cZCiQCkVIQqi0odXoe6COnNwKI76KMGrQy8KcnvZgbVCaBzwaNmyoSAOI?=
 =?us-ascii?Q?4QkgSwu+8H4E02Wn/Lro2FogVcNqqLRT6vvpeHv4/9Bg4DYQ0G/zQ+4eZXzF?=
 =?us-ascii?Q?ZvFe5z+TzaWtna6mdVg5W4uC33Fm2hFe7aYkyhaAuqbJsAEnxnr8yxoUDbHc?=
 =?us-ascii?Q?7BoGV/EIzusZbKxT/SrfR/95XfBglcKnNU1tWUvEAZWRUST3adWPbPLPSU3h?=
 =?us-ascii?Q?YKeWUZtnp/btaiLG/HtO/dix7ky3PUfkySjphksyCLRhZri+6CWhsQvhaNEW?=
 =?us-ascii?Q?lvvN7oJl03Y7XtQUv/d8wVJGBDbi4JNzTw2Ht31qn6jOCc+dsecvXoI8hdaC?=
 =?us-ascii?Q?CcJBjAxLqlNSTgs3HKkKL2JXTjLe13Nq7FyCis/fJpJ5vgAfXhgtgCMqi5zq?=
 =?us-ascii?Q?0hx7tJwJAWxPX6pZOmu70iw/o4c0mBKuBiGVE5abpQrBa+5iFBQCDWj+syyN?=
 =?us-ascii?Q?VJ/Vwdpnptld03EgErdGEquQGoCdW3nsPx9zaZ1rHHrGzw+BZJeg3NX/Do+Y?=
 =?us-ascii?Q?LXB01UPmOVAJVWF9aJ4FY+ge7n+nMX6FoKMD1KJlnLCIzsBFDYW5DiVR0HQu?=
 =?us-ascii?Q?GEQGEjW/ewFt9ZiknKQVPnqdA3GKkvCyNQicSVIVp/qoymVI7QHRcuJp9eJB?=
 =?us-ascii?Q?xS+jgFkT8zItY+rV0lP6up2PZsQOMtd9aCpMqgbTBJy3F20n5ZClV1kCrk9J?=
 =?us-ascii?Q?2kavlhmLk1gYQ8wd/Vre0ZecPHFgrAQZfNj/4UZkYzh6KhDLuuYvvvPDs6MX?=
 =?us-ascii?Q?6TBCOQaZnrTdeov6DeJuqOo/HW5HWtcITU4oP3eSoQP1s4LlfdDJgL73pJBc?=
 =?us-ascii?Q?rk4fkehMwkkH5SzqVbfFVpB0xheqs06eFVfOLUp2ivdtpV98kfFK6L0YSpqJ?=
 =?us-ascii?Q?1m9wslyyOLaatjlDmGHJRnva1VQn+PEbu5GwHmNXz+46iqGJ+yp5/tqnB3/4?=
 =?us-ascii?Q?j3NOBAsQQqeZONPCdhwZTAaVnVw5EDeJ7IxNu1zaGqmIK8TDQZhWCiJOoBkD?=
 =?us-ascii?Q?cngZ1TA1m8P2foUZFOInToHsG8JipXae9w/EV2zRUPnDe/r5eY9o1Gy5wsaf?=
 =?us-ascii?Q?5vHfbXBbMg=3D=3D?=
X-Exchange-RoutingPolicyChecked: igkZdcYA2oa8H1cW7BE11aONxEflTHR/iV4K3BjLTkZugfcLcsMtnWP5RfyR//Fg3xDvYVtYlqjzELU50Gttm7uWPyrT1AtTGb9iEbPlEAh5YstorfwF0qE+ChjgEJFY7OJhnphl95+ZZUrtACafioPdNjycU/fYMhI6/4CFrpU7PZL3GmFOtz+Phve8nZAk9IXwfpYgwlSUIYO9vnoFrVoCHqDRzZJFXhWeNiDGA+CHgStjpSxxKtIWHohHf8J5mFXdcMZms504w/YpC9J7aE7D/0PjcK0X7CvsS2JGhFr9YhpJV/uI4XM2de4H7pw/0SRx9a2iyUmJ+jtQuwpzQw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a02008-3314-4c91-a0f5-08df341a622f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 11:06:43.4909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpoVy5vFA9DGnvffLa66dveSqN98HjiZLcJoRGGuXPWJKSgiLsthW9qMt81Nqiv9kq8IHYFdxcqFZlGod5zISQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7901
X-OriginatorOrg: intel.com

On Fri, Oct 23, 2026 at 05:02:05PM -0700, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 10/13/26 7:59 PM, Chen Yu wrote:
> > The limbo handler polls the LLC occupancy of stale RMIDs and frees an RMID
> 
> "stale RMIDs"? This is a new concept unfamiliar to resctrl.
>

OK, changed to "limbo RMIDs".

> > once its occupancy drops below max_threshold_occupancy. User space writes
> 
> Please do not interchangeably use the name of the resctrl file and the variable
> that backs it because the variable that backs the file may not have the value
> that user space wrote to the file.
> 

OK, will use resctrl_rmid_realloc_threshold for the value the limbo handler
compares against, and only mentions "max_threshold_occupancy" as the file
userspace writes to.

> > that threshold in bytes, but the hardware counts occupancy in units of the
> > occupancy scale, so the threshold is rounded down to a multiple of that
> > scale. The scale is the number of bytes one counter unit represents, i.e.
> 
> This does not sound right, the threshold is explicitly noted as:
>  	"This is the threshold cache occupancy in *bytes* ..."
> 

Yes, the threshold is always in bytes, let me rephrase it:
The occupancy counter only has the granularity of its scale, the number of
bytes one counter unit represents, so resctrl_arch_round_mon_val() rounds the
written byte value down to a multiple of that scale before it is stored in
resctrl_rmid_realloc_threshold.

> > the granularity of the occupancy counter.
> > 
> > ERDT may provide per-domain monitoring scale factors, but resctrl rounds
> > max_threshold_occupancy through a single global
> > resctrl_rmid_realloc_threshold value that is visible to user space.
> > 
> > Prepare for that by adding erdt_scale/erdt_get_scale() and teaching
> 
> "Prepare for that" - Prepare for what?
>

Will remove this sentence after rearranging the patch sequence.

> > resctrl_arch_round_mon_val() to consult the ERDT scale when firmware has
> > populated one.
> > 
> > When CMRC parsing provides per-domain up_scale values, erdt_scale will be
> > updated with max(). The reason to use max is because rounding is a floor:
> > a larger scale yields a slightly lower threshold, i.e. an RMID has to
> > drop to a slightly lower occupancy before it is reused.
> > 
> > For now erdt_scale is intentionally left at its default value of 0.
> 
> This is a clear signal that the patch ordering needs to change.
>
> > +/*
> > + * Used only to round the global resctrl_rmid_realloc_threshold for the limbo
> > + * handler. resctrl_rmid_realloc_threshold is exposed to user space as a single
> > + * global value, so ERDT uses one scale derived from the per-domain
> > + * cmrc->up_scale values. max() keeps this single threshold conservative across
> > + * domains because the rounding is a floor: a larger scale yields a slightly
> > + * lower threshold, i.e. an RMID has to drop to a slightly lower occupancy
> > + * before it is reused.
> 
> This documents changes that do not exist at this point in series. Please reorder
> this patch to ensure its dependencies land first.
>

OK, will adjust this patch to include above max() logic and adjust the
patch sequence:
("x86/resctrl: Add the ERDT CMT scale") will be moved after
("x86/resctrl: Introduce erdt_cpu_has() and erdt_support()")
and before
("x86/resctrl: Add MMIO-based LLC occupancy monitoring support")

> > + */
> > +static unsigned int erdt_scale;
> > +
> > +unsigned int erdt_get_scale(void)
> > +{
> > +	return erdt_scale;
> 
> The name and usage implies that this is a global scale. This will become more confusing
> when trying to land the memory bandwidth monitoring changes that have separate scale values.
> 
> Having this change pretend it is a global change and then add a snippet to final
> patch to constrain it with a "if (!erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC))" just makes
> this work difficult to consume. 
> 
> If this is specific to the CMT scale only then let the global variable and its accessor
> make that obvious. Let this change land after the CMRC parsing and erdt_cpu_has()
> introduction so that it can be introduced as one coherent change.
>

OK, adjusted the patch sequence as suggested.

> >  
> >  unsigned int resctrl_arch_round_mon_val(unsigned int val)
> >  {
> > -	unsigned int scale = boot_cpu_data.x86_cache_occ_scale;
> > +	unsigned int scale = erdt_get_scale();
> > +
> > +	if (!scale)
> > +		scale = boot_cpu_data.x86_cache_occ_scale;
> >  
> >  	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */
> 
> The fixup of this comment found in patch #12 needs to be squashed here.
>

OK, will do.

thanks,
Chenyu
