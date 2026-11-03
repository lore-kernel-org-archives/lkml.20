Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793673941;
	b=2+Z7ls/A4hNMxcnzRrgg30bnkybsL0MeghWUoh8BF2rUgwjsuKe5YWg3CAyEETc9MrWy
	 Ow84JNMGJZCqb1A1MhW1sRS23ccUJmYuo59HnKBztXiE/NQerSWdn4mWjEakp1eKL79v9
	 VzEPWj7TBdXHqj5y9ZPy056JchHcfJXtPtdU2xpKncwBlUF0XvFOC82S2dyeTj+jYZVbo
	 PhrmYaEw6ZFhG3t+pSOFuo6vpa1lloJcuyrIaMpcoZB0NL5p9yYLK9PKrh1sRBw4L8o3A
	 xnJn619rYvn1oHA0MQIwhulWkXiVKfq/5XrTJZX3mxBN1VZjc/Z9uFbMmKjdcXDQ84w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673941;
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
	bh=3l9iGhkjTNBmHNh86Onjt9iP+3DFJyOMc2x2wkConYw=;
	b=hSyzWOxXW0WIsJaHOPIJW6GqmL08wp4ZDJlwtDUkGKpZZIV/hp7T2+t6u41RdvZVrHtk
	 1j5GIfUOHEO4sm5CkCGxHA7uVYzrG6+Loyd8oyuQ4F2gzxXcFWgEDb3ADa9ubrZBwl6H1
	 G5MylgcH5OkwBxFQw/6CrfnienlyymT1cehTta78VIQGPxHvh9dWkydHVi0uNn5rlOEsl
	 qIZ7ChxDKU/0K+Frj0fn5HDPGHPNMUU2Z1iCh+/zWyHSY5gZdErlR2pjUm3M363baTTAr
	 Ob83Ai9YsdRujaOoe7iFQzoLDrFw4mi0byom+0zn96GZr1kYLrn1keXEeBgYbeqGQNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YlvzQwi6;
	arc=fail smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB09606A33B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB09606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YlvzQwi6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793673935; x=1825209935;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=H2Yy4ISTZNRAKswdMbH/b/2XD9XRhq5H0/TkX/FVvFQ=;
  b=YlvzQwi6AimRcMD5RJi+jDW11MC8ByfaNCSSryv9zJ1GiTLrvzQ0GaTw
   bYvuqD4YtKpc2hfyQ1JRr21JTxE4p+oacFNEHaOVScX/GPAPrNEhOcgaT
   Zwl20CipO0Xobu+yfe4t7kx6wqY5cc9r9D+3tZaGUGHG1YlCGyLYqUSz6
   /RWMUmkR06L+fMc/OcRa++Pw4HoYwkJeqFVoBIFUoRm+M14iBN/pYyDdk
   RPgRrsXvHhVwrNo7OKwrAiX1B6jLvKGF3tz51iq8RCalnIIWJy7KxxBgc
   E91Ma6H1AlFiVEfKu+FfSC/TaD1ONKWpyWvzb7EzrhmhWzroCuoD6qx3L
   g==;
X-CSE-ConnectionGUID: /WM1oO+STGy8zDPApGt3dA==
X-CSE-MsgGUID: waiNluS3TSy6dZyIon4vcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2415377"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2415377"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 18:45:30 -0800
X-CSE-ConnectionGUID: WjKhxrvhSJqa8EeVKUMV4g==
X-CSE-MsgGUID: jaCP6L1ASLK2hMk4uXotdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6384310"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 18:45:29 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 18:45:28 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 18:45:28 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 18:45:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyaZVjquQihaBSYypEQ6tVDsVhASQREn6JPxwdHxQlOs9hNi7LF3iX979U8vQ6oXCv6CXRe0YNC+KJ3hjGtX5jWbh3Wher45nLbirc9hXquydipSuyQD8Az1QCQmpNygLXf+GONVqTRtuBoLuTcIZRqLp0Wfq98xtW7oUqUdswtAQqUyAnxRwMqO+B1bGiYaGKRQIFY+GOpqhpod+Ju8XcLo/eZNznVDLDSLrvFbciMK++jBQMmfNPn/UmIi2lPJuErVABoRrPTVnzQbEnxnZ2Xtiwmdguf49bUs1ltPQbI5nBJYNsO93/l1R11NGm1pkrybuhHwLxBOYQd6O3EQ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3l9iGhkjTNBmHNh86Onjt9iP+3DFJyOMc2x2wkConYw=;
 b=OHJh9tikdgCEknILVtMskh9Jw1v2P5NafXVCfj6hzDGNprM4L7/sB86e2Ol8Upnl0adv50BqvZ7PHVXcizajRUeK/CFwcgfgWMa18ISjhat7JvINxr9qkDyBmm1gHDohGJepCTBdGRhjIfEYW5MaO0LtTRS+bbiNRNT+NvjSEgKHKh+OpVvmWddHzf5qEkn/HFoNEhUK63EPmL8zRWp7irf5CTlNZcz6Xh9viovhW/ghZsJB8JDeOx+k9HuRanVzH2nZW+S0O33RchcnyHDAsc6z2720dbplopiqPSvYCU6kjZpmIUssFwJtQMIK6ma/0fGxnw/OQV/kWLdzVAc25w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 LV0PR11MB9816.namprd11.prod.outlook.com (2603:10b6:408:383::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 02:45:21 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 02:45:21 +0000
Date: Tue, 3 Nov 2026 10:27:46 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
CC: <peterz@infradead.org>, <mingo@kernel.org>, <qyousef@layalina.io>,
	<tim.c.chen@linux.intel.com>, <vincent.guittot@linaro.org>,
	<juri.lelli@redhat.com>, <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>,
	<bsegall@google.com>, <mgorman@suse.de>, <vschneid@redhat.com>,
	<linux-kernel@vger.kernel.org>, <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH] sched/cache: Don't use fits_capacity() to compare thread
 and CPU counts
Message-ID: <aulGoluK0nq6vCjc@chenyu-dev>
References: <20261102021536.1026143-1-zhanxusheng1024@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261102021536.1026143-1-zhanxusheng1024@gmail.com>
X-ClientProxiedBy: SI3PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::16) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|LV0PR11MB9816:EE_
X-MS-Office365-Filtering-Correlation-Id: b118bec6-07c5-4778-a13b-08df395480c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|261102123227099003|56012099006|11063799006|261021123027099003|261009223027099003|261028144727099003|261022105027099003|261026140227099003|261021121427099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: i6aqcxDFe72oq+/3aqAJnIE1CPFI4jW7ypbgYpBczAxK0ZT3Vn/LZZSA8+/GcA3QOzTC2JDom6N840ODrWeD3PsSc2st0Mb+NNVHptQC/WIhOJITSBSBxqLeeBX2fK4sYf8yUIHvpbTNM3lNVhKjEDJVsQxjQhlG6EYe/bbs35phWEcZpvvA64pwT8q7JPY44a6FvPphI1n2tHkAq5Gi2fA16WDaSlnHEipgKVtRHyUokBgz/j8Ujyps6jj8GY/q66qeC75vkFAe+yEczXzJAPBPbpQDyf4RjIkF6rb/hS9zH4CRWZ7TmxTzDTvjE4f/Jq7nQSFU+iOPXdPa2ET16NaV1E0pfnhGlf8aCarFpHWtt62Oju9sVnzb3NW4sqM+rDOU5K9/IDpIWN/trdWnUokBjsMnjlOuw15lqn87eCCMDfbX9O9OSjI/rJXk14S39Wz+lNrxAvvFZ5TVvutAZuR59qFCtcxREZLkZCXs4SbnaDjp8xyfrPeec3kFKBr0zRqvkgH8HwSKtlaIQoyuz3yW7q72qAfxxIsNIXY6hcasj93Rjyb+dBgpwZQlAj1AVF9nz9aphI+Km1I5dyStzklK9XuqbRm8PvMQw1tJheV9jGReB2WtKE3Odxhk8S4M
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(261102123227099003)(56012099006)(11063799006)(261021123027099003)(261009223027099003)(261028144727099003)(261022105027099003)(261026140227099003)(261021121427099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R6nTvcv+Zsrar6LzgEWB+P/Dnz2Ub6BhqEjT7h/RBHz38zy0gbnTgJ9hF/RK?=
 =?us-ascii?Q?4tTmZKhubsfpOBOLMydkZIZOIvwf0eAx6UTP4pJ1ylrm41VNe4/9+Lda8GV+?=
 =?us-ascii?Q?A9A3LJXEgEI//n9HcypPlxDvHBg7JTXZAC7DxHbhzDNJ9G2geGZ+oJnxuKx1?=
 =?us-ascii?Q?l7PAY9Zn215YGsWRUsP3LS9xmX8ygSEU/hyaKCauRuz0ylETrD/yFsmYDrGk?=
 =?us-ascii?Q?eGjTf2uq17ew9+f7Ab6HP3Nf9fdS2JqKvc9AYvn586NmMmlbE3DhGED2o4Jh?=
 =?us-ascii?Q?+22a7JrYRY2wR6krp05cQMjlQZDURZHlWQNTjr9oSCnG5HsYY+/72+ZkxMLL?=
 =?us-ascii?Q?t+MFVivvNsPrMfNchPRupYNB/DaMNsalmSqvtPBZ2EkhrEnpSBbs0BWcE14t?=
 =?us-ascii?Q?13D3c4X5buJnsF2+3NFIOv2z+z0HixdN775QpmI8IoTgPJ7JBwp+CBYU/z04?=
 =?us-ascii?Q?iEyAuwYD6pWfeOpOuCT4T1emPtwOKgmxzxHIM7PiTZyuXIDVstcHhZsC4mf8?=
 =?us-ascii?Q?grfu4/M0723YUPjjZu84O/oR290ataJ+0im3del/2R25qHYq5XgQzvOw8YX6?=
 =?us-ascii?Q?XQnYPtuQIOhiGBaoWbWcsmInWdTAK+citjvW7ZSaD4SoPCw9Tjv2Ts1r9bWY?=
 =?us-ascii?Q?qBK7Cdne6ARBL2Y4B/CSdKiDHeChS+rrIkjl2dlQ+/9wOM5ukeHk9hFbup0g?=
 =?us-ascii?Q?7nQ16oA67Kh/I9W3E9HWFZzo6x6hLTznYcdCn8W7Ik9GoFwNG4W9QnxLF6XL?=
 =?us-ascii?Q?9MIbVfM73vVUGyuEvnBgv42Jhq649mmODR2dIbz0mhjJSDLooBmQ5DsxAVjY?=
 =?us-ascii?Q?m5qytJpwzhu2KTgqBSEJhP+ine73suwjcNEzmtzPSEdzAirvSRoFrO8RE198?=
 =?us-ascii?Q?PKiSH/EVg2ItjsmbO9IP+bJlWO16TYqLjipe7CEFZD7CUYpkmYzjYizWprnR?=
 =?us-ascii?Q?zKTvUvLM90kOAjf9UrLDhdP/Ow48S1qM5outyv7eoh8njAbj7HaJRwRCDDNd?=
 =?us-ascii?Q?Q2m1JV4A1eTVXJZ1aGBom+ZyvWta1zYgl1PcFXVQYDeV1scV8mdDOjbViQUA?=
 =?us-ascii?Q?oV8o3udhWQW1Mj9PuenFFMRbpU9d2kA6JcKb1/GTT/T1rVuO/xX0aISt2lfW?=
 =?us-ascii?Q?XbnZ0T4y4a67GRqAzHi+jF1cpStKqtfZCgZxWo/gTK8EcZSeBcgjNJH2OaLa?=
 =?us-ascii?Q?W7pP13Nt8R0VFtysf5yjo7jNJIkzIdxkqb6BRtC6uEaMa+FYXgV9hgRuIf1o?=
 =?us-ascii?Q?hRHtLpjGHCUbpThwapjWO7ZZc66C4NVk8x5XNDsRMHzbCqTHc58jceU1GwQS?=
 =?us-ascii?Q?v8/V5WV/WU28IYuiivWaaXJJN+C7DwyFLG51QPJOcfqeJ7RHxltHFXssrGsY?=
 =?us-ascii?Q?1HeA5JjsAT2IU/5+nc33QFJhHFZcs8ndHlh0//n5Lqp9R9tbS4fUsr6ip8oU?=
 =?us-ascii?Q?F3QLj1wWRh0EA0WS3Od3b+DKNgu9Haxwa7UnPYdCRKioU3ZAgdeTrr7Fy7RP?=
 =?us-ascii?Q?GBAzwVamCDWBHDCYwQnOCgzM2ZR6k4tGieVpCM0sMzaPJ1EVcRntFb0cIFZ7?=
 =?us-ascii?Q?5bWpVSc1sJig5Mz+YN7GPMWj741stuaXjDL3aVbBpuvYQ1lEp62Pj564jVL6?=
 =?us-ascii?Q?ApaFHqnUhL+Uj0nf3C44BK6XTdeom5/LJrcXronOfhM5LF9b5hclUAfZPOyo?=
 =?us-ascii?Q?g+/v1ShU7Qce4OMv6NOqAH2RNt7TPR8fJ2A6hZr6ne3iDwwk0CYtsNqzpUdE?=
 =?us-ascii?Q?P0iXaEfKLg=3D=3D?=
X-Exchange-RoutingPolicyChecked: wAgo1eJQc0eoGm5c77IbeBYv+flWZcS6s9wPW0zPehIPAuHrHckW5M2QiCLqSNsNriAL2QHmhUW+xupHWP3dU+xAF9TAwhSRuCJVOZlIGTYCdBBrcHU9QjippCRFMiMkh4EQ6nH/JdMupQ+VkaoVsBZGOeCdax0DvmgfQilfIcgidhZZboP94BjWysFBuU9RdvGwRwsex8U/sf3cTvmMmCLOU8+G9ivyL1bLqg0shnvh+Aw6UOcx0mlQC9Yc3tgyYXNO9HcQja+qht8PMzyRzmTOkeAN+RnSJSub/4hJ2hrVoVig4Y4hHc6wNaxRWiZNQrXU7hhB2Yws08yyrpXYqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b118bec6-07c5-4778-a13b-08df395480c2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 02:45:21.1190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/Lm0JTG9Ni8LNOTQx4bSTvGMkbxgbK1j2bfp0aRIUH6/wyck4FM50b8txFEfdU8Y4+tcvluMMglxN2lPkPYVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9816
X-OriginatorOrg: intel.com

Hi Xusheng,

On Mon, Nov 02, 2026 at 10:15:36AM +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> invalid_llc_nr() uses fits_capacity() to compare a thread count with a
> CPU count, only for its 20% margin.  Qais's series changes
> fits_capacity() to take a CPU number as its second argument, and this
> call would then pass the CPU count as a CPU number without a warning.
> 
> Give the check its own helper.  x * 5 < y * 4 is the same comparison as
> x * 1280 < y * 1024, so there is no functional change.
> 
> Link: https://lore.kernel.org/all/20260504020003.71306-5-qyousef@layalina.io/
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
> This keeps the 20% margin.  Qais would rather not add hardcoded
> margins, and llc_aggr_tolerance already scales the LLC size here, so
> the margin could go, but that changes when a process stops being
> aggregated.  Tim, Chen Yu, would you drop it?
> 

As replied to Qais in another thread, I'm not sure llc_aggr_tolerance
can cover the thread number case, as the former is only for LLC size
scaling,

for this patch,

Reviewed-by: Chen Yu <yu.c.chen@intel.com>

thanks,
Chenyu

>  kernel/sched/fair.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index cfc982205b98..dfd6528d18ee 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1469,6 +1469,12 @@ static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
>  	return false;
>  }
>  
> +/* Are the running threads (in SMT siblings) below ~80% of the LLC's CPUs? */
> +static inline bool fits_llc_nr(u64 nr_threads, unsigned int nr_cpus)
> +{
> +	return nr_threads * 5 < (u64)nr_cpus * 4;
> +}
> +
>  static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_struct *p,
>  			   int cpu)
>  {
> @@ -1485,8 +1491,8 @@ static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_struct *p,
>  	if (scale == INT_MAX)
>  		return false;
>  
> -	return !fits_capacity((READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads),
> -			(scale * per_cpu(sd_llc_size, cpu)));
> +	return !fits_llc_nr(READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads,
> +			    scale * per_cpu(sd_llc_size, cpu));
>  }
>  
>  /*
> 
> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
> -- 
> 2.43.0
> 
