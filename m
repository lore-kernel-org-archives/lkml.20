Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDADF3515EA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789967620; cv=fail; b=LlKt01TvebXNgRrbUo4SP70aEIBDLj755Hf638sLeYXip6J7U31Xlxs31iHDRDfKp8SzRggv3anJEwUtrAyJYRK1MkKuyX9q+GAQgfoJw4NafBR9VJr12Qb4pU8NjwE7GDBd5n0fqoK4Z6iTzun/SrFOA7ZWTUlhbfLke+hwgEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789967620; c=relaxed/simple;
	bh=Ca2JzV28J1RVJgrWgmtf6p+8mPjRwTsc9FetRCyu8aY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jfUZix0cC2o2rM7/C3TKnGXqBVG5WmQWhytZ3NDI6WicSx3lHEVeDLP+iS3X20tTUCo2x7ITjdTnaVwntU8GGyzZNDIFoDDFj+aX/ALYHn19i4I0UX9Z48QmxjQ8VxWS9DdcRsIkMAJwDE71WO3bzeIbYy3zL/ZY7LNY2gQd6UY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdALneaA; arc=fail smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdALneaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789967617; x=1821503617;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ca2JzV28J1RVJgrWgmtf6p+8mPjRwTsc9FetRCyu8aY=;
  b=CdALneaAzWertbUmMoks4aFCDQTKPJ6Wah0FejOfUjVDHpNnv/8/xJ/h
   vbhBVCXRARICg0SPbe9ik8zYO/4qiY5g1qzUT+ObvCPyGFrLvU+R5J0XK
   Y4G+KNbDqWAlNTh5Urd2q55+SkOw3SM97MCeU//KcGh7cZXGLql11BTvi
   UvJSn6GP3Jhm3EVlQFfV+GI/LCefjIWdfkjw1Zgc05Ev3Hg8/DfteQ7vU
   ppPBIPTEXUtXFN9WpIADTiLxH/XxuQKUBeRVhlnVN1PcZYa8Q5baC8aDN
   99rdnZCCSXE0jliYwTZLebEbdvQAS8KBhAN9aBB9Qn1hJEJI5gqZYtDQv
   A==;
X-CSE-ConnectionGUID: /yIC/m0zQGGfRSo2E65+Ew==
X-CSE-MsgGUID: mc6bN9B+Q8St6h8TKJO6eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="964718"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="964718"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 22:13:37 -0700
X-CSE-ConnectionGUID: 7aOMlQcJSJeKpx49WXWLaw==
X-CSE-MsgGUID: HmYag+YARGyCE50vp44aJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="300438222"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 22:13:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 20 Sep 2026 22:13:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 20 Sep 2026 22:13:35 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.36)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 20 Sep 2026 22:13:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oatVk1GV8ovGlvmOt7i65/uFqsrULTl+Hwa0SB8chHObLfNm6tIj5zGDnAKuxKzhe6QyqfqVUU0YjolCEa4uOnz7EwosHUq4FQ9HdgHGffDO3QF3mNYtKc/rYiSp9cm0mP9FpQQ3OgdLnByPUKB4oL7jiNbud6eOWTI9HDP08V0mV8Qo63/k0clfZMmwioi9bXL/oU59GjWQA638YG0grD80BLYkVI3rISL0Za025n/bmRbGg5TQ5yNxyFWxqT5Vze64G2IjkDO6SSkllKIq3y0o4YIVJW+hmmL9Vv/SOE4/HqjYQ59u3qE3y/XExDOoM7P6CNtp5h34Q13tMW60cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DslM300/QGiOC4PwW8AJi4aoqegzPDCYBQbS0Nxmc7E=;
 b=ZmdpFFeNHmEL9sMVONwBH3qJmusXnAq0oVJk1kvs54bpuEeLNh5oiDZdoSdNH4mf+sVfxmHOx9+IMKmZ4p7IpuEp+epAW/CS1Nz2E7QvT2+3Y6YGaXBJFDZ85aGsCp5IPGln2A5HdG7ctbD/BwXLh0/qOHXHX2XqCrP6oGIl4NjuTx8fr8Dvi0uT4McjK1YJbnDuR2Vn8fQW1Ma3CbW5Oxq604t3NxGGdVITGQB4OBEP1PRBc8SsJJSsG+4VzLRXNECeR0CQfb9rua7I3FCBbx07rmpSqkodW9VO2Q0d2TbhCpn/L0ZlaKkNJOFPY/jlyJa9G/G93oWwCr5Dkkvjpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 IA0PR11MB7188.namprd11.prod.outlook.com (2603:10b6:208:440::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 05:13:32 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 05:13:32 +0000
Message-ID: <1511a82d-4c1a-42ad-9b2e-7def751d2824@intel.com>
Date: Mon, 21 Sep 2026 13:13:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
To: Reinette Chatre <reinette.chatre@intel.com>
CC: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, "Thomas
 Gleixner" <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Newman <peternewman@google.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dave Martin
	<Dave.Martin@arm.com>, Ben Horgan <ben.horgan@arm.com>, James Morse
	<james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, Drew Fustini
	<fustini@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>, "chen.yu@linux.dev"
	<chen.yu@linux.dev>
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <9e38f138-7872-445d-9a11-105f9d0fa4d0@intel.com>
 <07a79f5f-ad39-447d-b43d-01e44c7870a2@intel.com>
 <e859ba7a-d488-4c35-b0e2-fc88cdb34f29@intel.com>
 <ef14b978-1b58-446f-b07a-691422220cb8@intel.com>
 <aqdguFLXpds-FrEW@chenyu-dev>
 <da618b0e-aced-42b1-8497-61ba4b0bb973@intel.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <da618b0e-aced-42b1-8497-61ba4b0bb973@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:820:c::14) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|IA0PR11MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 886bdfb6-3881-495a-2ebc-08df179f1457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|366016|10067099003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 4D9LoY5ralR6Yw7nT8spE56EB8YYic6ljkLg3j7LspLRnMSI0qNqGJ1teGot/szNTEe/imAQhYDX5ZNYYYzMoDpNA0oDLcBN/T1Df1Vcu8i0MHbQXKMSi/U8ZwaWYtbpJUatnnzzfRW9Wtaw/9w1Ent+Pt3M7CcHhSjLgWFfjvlRFb6SVGNaxpQWEqw2wRfw5vcGQ7pIzjocpG/JFbtkET1eoo+gyT+QHzAYL6yli96Yyv9c0pYwkhAWu+Kq0+WaFsWeU2KAwO4vBSB5B/WXpH8e+9LwpfnM3ep7GQnUgQhhybcc6B2p8zizrsgMshtXjGC3/aV59npI8aLn5CboVS7LKs1amfDwyWwQ5Iw4BsDs89LOEUo6fGv0SimycguKqLg4ZK8mjHXJPxJqiy4CaEEmDWxtrq/ay7JbR7YIXHjnc707+N2mHTjhqqbk6vOaTqTa1mKJ9XH1SUQm7M9YcbDzu2QpHowy3T6kADEGx0oQd6T3cQZJDPx6cXE3X/ElX4yrNQkw1X3o00mClKcGSC5nWhtJ85VL2RpTRBFRtgwiQGcbFA/8O3V7eomlpFHpMVU2APD5owlsNfoAsJB1V6nCHi9zZetrN5BW2KqhCwCqlvVD+slzEDDYEDTYtHjJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(366016)(10067099003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aittZmxmc0o2T3ZxQjUyVUd5WUlVNmc0eG1vYVlzUmFPUHo1U2lxNTFCSkQr?=
 =?utf-8?B?RkpvZlNReG9PSitxRlQwVmtpYXZmRm5LcFZLZDd5UGNRc1BhQTBGRW45UEJD?=
 =?utf-8?B?SlYwMkNtL2xjMGo4dWNYM1FJNW11Wk9SVnhMWFErTkQxcndZR3BRUS8xa2x5?=
 =?utf-8?B?NGxuTVByRGluU05ZTWcrakZiNHZ6SUNmbWJ4T1Flbk9CQTZHcVNNSVFFalRt?=
 =?utf-8?B?THdHcVlKc081dDdpaWZCek5hL25xekJ6N3U4L0dkY2Ira21wNVJnQ2xrc2R0?=
 =?utf-8?B?cU9uMEhFWHZFMG4rRm93aHZkYVo5U3RqYkZtRDg3N3JMMjhEaG9sL2s4K1Y5?=
 =?utf-8?B?cE80aTlBQWhoYUJDbEl2Y2VBSzZzNHJZd1gvbmdnOWpSYWFoL2lSc29GWlYw?=
 =?utf-8?B?M0ZaNHVPVWkwY2toZ3VFOFIzZWZmS0VXR3lVK1oxTmJZdGI4cUxuQzFEcnAv?=
 =?utf-8?B?NnkrdXFWUy80WFI3ZXVkeUNDaTd6cmN2VXV1czU5dzNqNlNOVFNKMHd3WFY0?=
 =?utf-8?B?WWZveklXT3FkbE4yVUxBKzFQcFZIZFU0TnlXSWdJaEk1anZyY1NhWVhkZVBM?=
 =?utf-8?B?cDg5MEE2RnR2VWdFL2FkbU1WeWlRSmdCTzA3N2dBWlFERUhseHU3YWxEb2Fs?=
 =?utf-8?B?Q29VV21YampJcTVVRTUydHB3QU9ZdW5pTzIwdnlkeHhaQ3dNVHB0cXM4aHBC?=
 =?utf-8?B?SG9INVRlQ0t3YjdjQk42THkweG8yK201ZVF2YlBjTFloSXllZERhTk5lSkFN?=
 =?utf-8?B?YjY4c1Iyb2VETjlhYkZjVzA2dkg5SFFsaThzb0gzcnB1cEJEenE2QXk4Z2Fu?=
 =?utf-8?B?S1pTRXlldjQvbGIzWDlta043KzRicngwbFJTSnU5OVBldVJBeUdsa1dXSmNE?=
 =?utf-8?B?WktoUm9WTWN6ZHBCR0RWQ0RwWllYbGViOWYySDl6cUNZRTB1TzQ3bmYxSHlT?=
 =?utf-8?B?OTBZeHJIQ1NXaHovd2FxQmliTmxidVRsU3JGRHQ3d3RiaUdhQVFSYTNuaGdL?=
 =?utf-8?B?b3VHV0tOQ0ZvQ0FidGNIdmN4djBaMnU0bnM0MG1SRml3d1VIbUxvZVh1dlVh?=
 =?utf-8?B?RHZGSWoyS2ExMUdhU0RFVXRseitPd2dHaklScElnN2FYZDVoTlpVQk1iejF3?=
 =?utf-8?B?Z0JFSUZpUmRUaURtQ0dVRVVGb20rTUdwa2ZrM2QxQnlwSDU5ODhjMXAzQzht?=
 =?utf-8?B?cngyZGNyTkhYZFJ3Wm9YaU1oeUFrQU5hbkM3SEJDWFp4Wkd2Vzh5MkQ3RTQ0?=
 =?utf-8?B?b2lPNHM0dEJFUXMwNzVjK0c4RDJqb0thRm0yZ2x1K0paSEtHckZpTnpVY3BV?=
 =?utf-8?B?aENTZndNVjJCLzI0N29GbnVvS1htNU9lTStxNk1DSmRaYWFab1R3Vnc2djFM?=
 =?utf-8?B?ZDVmNW9WS0ZFa21vYUNZTGNQQ2xiOEF2eHFwZWVXNHprT2JMSmpnWkhZZkxm?=
 =?utf-8?B?YWV0Q1laSWNyaHpzVllCamJ4WUhvSWNCZHRwdnc3emJyWjJkWXlycy9KM2oy?=
 =?utf-8?B?Y2UxRC9ZTW83MTdEamFETm41YWM3MGxVbnN2d1I5QnBpblZLbjdod1JFMVYr?=
 =?utf-8?B?KzJOQnVjeDMrQkw4NkhCNUwzejcvaWN0b2Rja0Zlak9LQUc0UzJjaGprYnl1?=
 =?utf-8?B?QUpCemoyOUFHR3I0RnFiSll4R3N3VDU4OHlqeURVRi9mazFnNkxuemxsMkRq?=
 =?utf-8?B?MHNJUzIvM0NNUXNjS1k0MzNoQmEyTm5hYnJSei8wVnEzZlFGeWFCdTN3T0JK?=
 =?utf-8?B?dVc5SW9KOU5wMWI2ZFZ1dmtRSHNEU3lRVHFJdUk5OTR0STg5bmpUUS9VRmt5?=
 =?utf-8?B?YzdGR2VoSVYrOHVpalFuMy9rM3RpNUZLajlFb0JMVFJsNlp0c2g5R0RLODZ0?=
 =?utf-8?B?YlNrdlJtSURVYTdCOEtxclM0VjFvb3dWTlV6QTB3Sk5lbThmekNiTHNjM3Vq?=
 =?utf-8?B?Vm9ia2JTeFpJRVloZU1MWldzZnBtK2Jod2MwSUU4MmQzMmhpaG9GVkJOWHdt?=
 =?utf-8?B?am15aTQvcnc5ejdoUFVnNzFQQi84SUFRSTBnZ3oxWEdVTy9jVmR2U3lrQlIw?=
 =?utf-8?B?V3pRdEpqSk92dmo0MmRxdEJJU3VGQzRoWnppY2EzaUlQRUdOejk4VGtUZ2JK?=
 =?utf-8?B?NERsWXhSeTBGTUt5M2J0TmwzNHkyWnRxR3V6VnA2SmNlSXQ3d3JzQ1lBWHl5?=
 =?utf-8?B?b2RhTW9FM1lMZlkveXFJc1RWeEQxazE5d2s1cG5DZVcvVnI2UlBOVlA5bW5R?=
 =?utf-8?B?TmNHays2WnhaQndUVG9paWJYR3JGODVSK09jU25UcjZEbFJ4N3ZLMmg5UVVi?=
 =?utf-8?B?ZzZ3cmRRZCtVRDhybngxdFc4Q2VoVE13MkxwZkoxdGIwMEZCMEhOZz09?=
X-Exchange-RoutingPolicyChecked: xrr0z7GE11SMCX6+jklAKjhCaoML6KgHWCdnn/iNmBPV8UeEFwcUPlfJSjSzA4rNFda/4nnSlNfuzAVxOgpTbsbWBPMKiMe8Gr00gs6FESKFfNTUoKLxvmYWT/ZdbQ3aSeIDZCKiQ1g//iul5zz6ZHKb76MMU6jHwxX7meXXUVnc8smL5js0lcKISsMeWyqo6M2AXYZmaMN++8T5LfPAu5WPFkXmsKiJtv5nnRPaXwUb1vIvHfuUnXuCr2W+4Q/xKMKd3lkm8MUaqRfJPiKxx3AcgIm5uPgu3vQavGdDF9NqUwU0u1Y6yw7vp5E4kN1gbOPMu7OYgVugPJk+4ce3DQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 886bdfb6-3881-495a-2ebc-08df179f1457
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 05:13:31.9857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0rXsWRB1DUjMJiogwUMCbwSrkQCJ2P7hK5QVKv64oFae1v/I8afp2K1e5pv7Qh4umXP37lH+t1LWuTsMq8Xmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7188
X-OriginatorOrg: intel.com

Hi Reinette,

On 9/19/2026 7:11 AM, Reinette Chatre wrote:
> Hi Chenyu,
> 
>> On Mon, Aug 10, 2026 at 11:09:31AM -0700, Reinette Chatre wrote:
>>>
>>>  From user space view "legacy" is the existing percentage based MB control
>>> that user space has been using until now. The only way to support this "legacy"
>>> user interface with region-aware hardware is to use the MSR interface, no?
>>> User space does not care whether the hardware uses MSR or MMIO, it just uses
>>> the MB interface.
>>> That is, as you also say, until it is possible to map legacy control value to
>>> region-aware control value at which point the MMIO interface can be used and
>>> user space can continue to use the MB control without interruption.
>>>
>>
>> While looking at the context of control_mode under the info directory, it is
>> currently used only for the controller to switch between "legacy" and "native".
>> However, there is also an explicit requirement for the MBM to switch between
>> "legacy" and "native" TOGETHER with the MBA.
>>
>> According to the RDT spec 6.1.3.1 RDT Control Register for CPU Agents,
>> it discourages mixing legacy MSR for MBM with region aware MBA:
>> "It is recommended that software use Region Aware MBM when Region Aware
>> MBA is enabled and vice versa. Mixed mode use (e.g, legacy MSR
>> interfaces for MBM with Region Aware MBA or vice versa) is not
>> supported and may lead to inconsistent behavior"
>>
>> That is to say, I'm trying to add logic in the code so that, if control_mode
>> has switched, the corresponding "mode" for MBM will also be adjusted to the
>> same mode. The code can enable/create both legacy MBM events/sysfs and region-aware
>> MBM events/sysfs during bootup, and make one of them visible according to control_mode,
>> similar to what Babu does in PLZA when hiding a file in
>> https://lore.kernel.org/lkml/f7bcf19ac8113a1e3d9575739c1a6400c455ce6d.1787772750.git.babu.moger@amd.com/
>>
>> May I know whether this approach is doable?
> This sounds reasonable to me. Since so many changes are between current resctrl and those
> changes it is difficult to envision how clean such change would be. We should aim to
> avoid sprinkling "if ("region aware") then" checks all over the place.
> 
> A switch like this will force "region aware" to support the same number of CLOS/RMID
> as the MSR interface. Is this a concern?
> 

It seems that taking the weakest link (minimum) across all sources is a 
pervasive
convention in resctrl, which can be used to avoid out-of-bounds 
CLOS/RMID access.
If a future platform does not support the CPUID/MSR interfaces, we can 
only rely on
the ACPI table to get the max RMID/CLOSID.

thanks,
Chenyu
