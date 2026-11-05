Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793848535;
	b=uCMBS7vFXOJKyAMEZrrLhEfSekHDvuWGnc5iE6dMSjz1an9g7h5s4+mBmDqQv9+n25CJ
	 L5vgaMuDp5EPDQj2VLMXVIzDcEJsPNZVU2VsZVKo/ytdveMoGiDSt1BSCXIVccuVwX4jZ
	 R8NVBCtEJiFmkie60PgIFFYv+nOSpjKe0EH+OYqRqbfCbIkVtq2y4EusDryw1YTXjdJaW
	 fMGSE/BakGymB3jwdjHg7yECGsT+bHUX9SxzgORKG7otgTHpK5coyf/vBlCzhD8/rfpdx
	 riixE8G0EO1ii5CZG/0NebnXunuEALiNjer9lHPBN8ZCOAF6lMeEHKdovMn+rwp3bIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848535;
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
	bh=QA/S0Sh/+cA0CyB2UgD9rhwIHPPjeYhPv7KZZUL2kMk=;
	b=FtL7G53nkgXei+MmB2LgDJzPxqC/aDB9XGVrLZAW7yiqftLWp206fThqCByJZ5zY/ogA
	 afI2Wgx2p0+WQ/UcI8ultSyly/vikHBD4SNcEZOPWoyvK1HzULzKsj8WY2yhevfa3MNOT
	 0GQZSm8I8kIMrPsqd7Weae4zPWsIY+ejQytLT47xHqhw9AdHW23+rxCL5HZV/e33s2QW3
	 Vjq82LIP6cUGGbmpLP1RBAWbVJJOYqLZ+Tvs0Fhu7ivDu9rZMSiRHuftc57Usv24sFas8
	 eRGIziLCEDsYxBStDCjtZEsqwAx30zcdb31r3jpfpjgLYPyVrf++DXfgNAsDv7SEm3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QrHOT9Ub;
	arc=fail smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ABE606D81E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64ABE606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QrHOT9Ub
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793848535; x=1825384535;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=X/ys84d0wlL1ojcqQB8x+HE5v6kvpA7g19gRd6NPnco=;
  b=QrHOT9Ubvg2vG7E8jElgASjwoRT5gA/KgtipexBxs9LvcreFkt2H45a5
   HMxCNpqbztoBAfcQbqXvCc0M3B+c17zTXdKemELLl6p2gNMlY6VcqCg9K
   Nx3UT8vLby9LNBzseqtkzSZGY1a17leO9kTlTTs2uhJE9gB4fj2HTbhjU
   NPyFFH0LdIUFjBzT5xncRkOOW4jhsd8j+3IUSOx1H5NqIEjtyiQpJL2Uq
   0kcI8ssv4BFTXKKBtYD3jezI9GRrxe/9r0fjrD07+szFlTjEaEGm1sOXm
   G4TG/lg2cs2gSGzVgoz+TESdIllrurKY78t83MS91X9KnFeSH0EgVbBc1
   A==;
X-CSE-ConnectionGUID: UWEWNbXpQCGpaUpiojA+5A==
X-CSE-MsgGUID: paO9uCQuQ5m7alctdqCnrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2497262"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2497262"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 19:15:34 -0800
X-CSE-ConnectionGUID: jsq+82F4QOmgd9oDzdiP+g==
X-CSE-MsgGUID: coBALCqsQyaFEyILUPkvsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7216576"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 19:15:33 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 19:15:33 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 19:15:33 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 19:15:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KydaNHjgEEBmB+Itw4xVcV/PsbtyGuu6pOL5qtEo6U88u8raGAnWYPFqCUjlcJWV0Str6vTq2vZgHTzHW9eK1Bq4qMFblCimCg/cPBETYxO5P/0hOVJMoVwzzURtweKNo1LS2HIUDjNoeZWdanytdVUIXZzgZW9iJHme2EkIHV/PguScCHHp4Ou20jgUZ8VKbmR1rUTQfNW2YAeFcm9EBfSp3E+HRMRDlYaHDhTPpOOFOGIy49VCKx5c5BN+6rTtE8pjjGbOhzHewMMz4WlfoDdKI7usxQ529k7AHAWGpr6bdeGZ1saqOfDnvvPLj9uEi/zJv6amDRyQfuocZs+XuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QA/S0Sh/+cA0CyB2UgD9rhwIHPPjeYhPv7KZZUL2kMk=;
 b=Bln0h+53h36x8oMuPhkF78pIa4Ox9SCruSIiU5BInvEz8fHR/B9hW84pOWRLM4sy+RTwjsH9ysPU7Wk3MR5+w7bkNNu8jdBsMuh2V6YaaF5OPS/A9UJJplYmaYGoEEX2suuuAJ9bxkKuCgjxrhs5BpKH8QFj6OEni1rjt6v97LTumUFd29dummZ2TA6Skk6QP0D8HRbo6NNtOQ/KIHqyLBfYf6Rkm377p0mhKslbnImQbm1hN4yLSA3Z/sfffV2zDP5sRM0ZWWGcTfdxxC1gHd054Nf64wGx3mISXi8Yo03icUyEqY9Tmo1UXzSFjh7rMhByFfzDAvMMrvjn94mbCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6005.namprd11.prod.outlook.com (2603:10b6:510:1e0::19)
 by DM4PR11MB6192.namprd11.prod.outlook.com (2603:10b6:8:a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 03:15:26 +0000
Received: from PH7PR11MB6005.namprd11.prod.outlook.com
 ([fe80::4f64:b0b5:4ed2:39ae]) by PH7PR11MB6005.namprd11.prod.outlook.com
 ([fe80::4f64:b0b5:4ed2:39ae%4]) with mapi id 15.21.0569.011; Thu, 5 Nov 2026
 03:15:25 +0000
Date: Thu, 5 Nov 2026 11:04:16 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Jianyong Wu <wujianyong@hygon.cn>
CC: <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <tim.c.chen@linux.intel.com>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <kprateek.nayak@amd.com>,
	<linux-kernel@vger.kernel.org>, <jianyong.wu@outlook.com>,
	<liuyibin@hygon.cn>, <zhongyuan@hygon.cn>
Subject: Re: [PATCH] sched/cache: Fix group_llc_balance being unreachable
 above the first NUMA level
Message-ID: <auvyMJU02aAFRB6P@chenyu-dev>
References: <20261104141313.185433-1-wujianyong@hygon.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261104141313.185433-1-wujianyong@hygon.cn>
X-ClientProxiedBy: SI3PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::7) To PH7PR11MB6005.namprd11.prod.outlook.com
 (2603:10b6:510:1e0::19)
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6005:EE_|DM4PR11MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: f48e4e02-fb2a-42f2-acb9-08df3aeb08cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: RYhX7TZ4FFyHkHGE2C9FJrYieAo4gNvrVP74jwNT5QuhLtRxwLLQGsOsN4XYXpgcGZ7eKwMCUvAwU40AJI7ZuHkIPbVcgyRMgaICT24Z87JE5v2cEFRipk32zO3aWw1ag56xioivnSAsIQdrXMAch32Q31gX1TQaLkwtLhFbNmZUgk4BpvznFRRgmD79k0qym4YHRZi8d9GFxtfkaNFAb9rZtp7otrt6drvItV+gjNC7mEx1kehU0Bfh8v25y6JQqpKDtYCMUfaQQcdpt6lKdlbm3nHHWkOB7gk0CbKUYniLm/W5Me8bbos8vFRkNJFNadiotMluIHAZkypaOGArvhoRBpo2Uoh3mHErSLkLpVk/uks5MAC+GcOPTdiMKXGMJpAcr3VGWNCCrN8CV/dI7XCioMp9etEiNaCOD3Yb5SZQnjcpIbcVAygCS/tKAi2RghDGnBUvoN4vHj+vQMfpjvOH4ZKA5FPjMtr4Q05tzaGDv3ojNo+5d/8dHCJeFpGn7+8AyTqV+tPBKIGMPaNvqqfOqqg8sRelEesGSBk/y2fsofbH6w1NNu4he5Qu5H3gAY/a+KOQPylwRcNBLt2ibxm/MnkrPsYjflGUhPXD/XeNN+PrpsEBl+Fdtm1gi0ge2IiWyffF40VJDagVThpeaHRSQfCMYMeasPLMBKtW8Wo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6005.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H7DYIYE3pmyZIe6tdX10I/cUQyokuGanHQgOF++Cs0s8NT+LglYDRmbMG1x0?=
 =?us-ascii?Q?OnYL9nsoGWNRdKGyalM0m15AxI6JbUczxy59DQ+PdmFoIshrtwJX+YGKQqVk?=
 =?us-ascii?Q?cObgEr7EUDtay5VmrFzJkdVADwaWnxTgQKgMjEuKeWgagG7sIQbusVHs15DR?=
 =?us-ascii?Q?29ZCfYsQswkSV7DC/tamPyXFb7dRrcwUIB6jlrhEhgRltDfKGHA2/NJBki+P?=
 =?us-ascii?Q?s9oORxmMHdisP4V3zDg5ALhDcWhW2ul3TpIoBuEIWVDiBlsrdFHyzarXxZ2R?=
 =?us-ascii?Q?bNQ1hnh1W+DJfMW1ThbHSUvmRQGokNoAMAvREMVB6H+ud3Ox4eHXKdNOGYPO?=
 =?us-ascii?Q?mwEs/LrYfELJHw3CeVLD7NPUmauiAmEb7BzJXd+8XUbiHKoGntS2aXuEOxff?=
 =?us-ascii?Q?ctSJUXCx1D9moyzgh+nJ1KuDeM1u8/vtvLb1ZAMU6zjzdBMyvSwWqTgEkthF?=
 =?us-ascii?Q?SVz8w0sXjKzP2g/1a5NCu+6XqkaYiBK8b/pA5vckcXGr5KmA+HHh6kR5V5KI?=
 =?us-ascii?Q?z33JirJ1ZZMy7T99J+a07LdQqkPEN1YwdwWXhCtdM8t90hzTTWKnseRKzSl9?=
 =?us-ascii?Q?wt463qjpOEot9VdQskZa92NaPfRbWKB95TQPElNVy69Y8WDJavZ3dtZkwGgS?=
 =?us-ascii?Q?ftiNXgwMpABGbdYdVd8RTbaKAGxkhGQicL86P3sBb/Pq3P1Z8/iMB75ZHnfe?=
 =?us-ascii?Q?k3z7sN5ODoZU+7SbcOuGECRDf+gqIxhCiA5+9JIGD6AbaeyOAIbwu2U2zR7h?=
 =?us-ascii?Q?2lXFfrf8Z0XJo/XadWXiEhiIgjGCSD3dZkVpKFyxq9qG54c4FG1evgPYqfG1?=
 =?us-ascii?Q?qjPHMwLuY4MxiHpxkopKBvnjHi0NATsbUf3KyGZfVk/yAyvQODz0G3t8IdYv?=
 =?us-ascii?Q?+e+lmDTV3mtwiTRc+szl2JswhlcfZdUIIEKFciaqv619aY1kt4WIEnbRg5m6?=
 =?us-ascii?Q?0BetgppIUlf6xdiqX/YlGoFVsVmos19IQVBrCUv0CVSKUSvgzPQWEVZxHvBv?=
 =?us-ascii?Q?F9ohW/tYsEh3k6rtGxEElkQi9qyaeugRzVRCnDtzHUzpG3vzvmsbeBY1eBnz?=
 =?us-ascii?Q?Y9uepJyK0Xk8zWh66VFqZFX331WDEuDfpDg0HUA3N4+YawOKY0fZYPvXdjCE?=
 =?us-ascii?Q?FiRZaCMCdDV+WDMXjOhOz7msVjw77iHv7+r8ltJkiE3nNUHo10G/AznVsVbA?=
 =?us-ascii?Q?NI3JfugCnO5XuqiPEtMtjlG75Snuy6Qt2DPGWrNSrpoqLo0djieJ2si72ipD?=
 =?us-ascii?Q?RS+6AO45iwx02NUQ0/dtijZ5nXIhkwdSuzoHQhwm6pPC1U6p3bs149oAecrZ?=
 =?us-ascii?Q?VOPiTWpcRTuYnJNF0gnezByG8emkEgX6li4d+yt/2PstE9bC+KSShmanSZ/2?=
 =?us-ascii?Q?WbkNLHe2FfujAfnPepaZVw9xB61oezpHqOEEYmOpXSuSXD8fXZHUV1ShD5HW?=
 =?us-ascii?Q?2383s0o4wYwZiCfsUp5409oofPpErmAsMNVf4dqVHD1HynforVIRSjz1UnVa?=
 =?us-ascii?Q?5fKjqaqg23SM1CIXKLIwls97y3C3WQaX6u1sXm6OqoMzedIcOqA2hGrUyuDG?=
 =?us-ascii?Q?NqQGk4BJ+umkmFASTh2TtIbPTOUn/ivnl++M3aeR8KHrYZq3dTmoATJ5gthw?=
 =?us-ascii?Q?MIHukbEufD6+6TxogZdHq+INh5Z9GsMbvaJn43h2NLTUIuUAuhyII02wq4+4?=
 =?us-ascii?Q?H8i27GGpfekRrHBBDjHGlzL8aZ+mCyGtmLLxLRxVd6DnP8D4XDnNQvhEWpzd?=
 =?us-ascii?Q?ktUR9RCGPg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 2ItZDpm7q2YV8WbHzwt0c71qK8F2wW3QzpxjQDOYw74Pd0GTU6h1WNOGIkVyDeWlhAVGpR0zxtaheUkp7tyfkGaHeadOBw1BdPt4EqhimN42Ew+vOrEdLnOaCmOQGh40wGzevg78E+baReUDXo+PChWeoYUQdUNX6Ixrsc75UwSwT03PKykKQtdhF2zLN9+MQt1SVsXi8JEbWZP+/KU3os/aagKZpi6HEsrXvzdanwxAZ115cOPSOGguGMDxKK8DtoxRgl4v7XEO72MTMaoFUW5jCapI7Zr1r5ILncXTHz1zs2KYGMQqqmi5QMinvMU8XAAv0dzs8kO+/4XS5TVV7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: f48e4e02-fb2a-42f2-acb9-08df3aeb08cf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6005.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 03:15:25.0681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tn6nDplGlmLLtaR2RELs3bwsTnSUb8gxVSXtIvD1usmYZlPAPWQW8veMeAhKohzp7Np0mgKyWpK9wH3Tm9oMRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6192
X-OriginatorOrg: intel.com

Hi Jianyong,

On Wed, Nov 04, 2026 at 10:13:13PM +0800, Jianyong Wu wrote:
> sched_balance_find_src_group() only considers group_llc_balance when
> sds.prefer_sibling is set:
> 
> 	if (sds.prefer_sibling && local->group_type == group_has_spare &&
> 	    (busiest->group_type == group_llc_balance ||
> 	     sibling_imbalance(env, &sds, busiest, local) > 1))
> 		goto force_balance;
> 
> sds.prefer_sibling mirrors SD_PREFER_SIBLING of the busiest group's child
> sched domain, and sd_init() clears that flag on every SD_NUMA domain.
> So on any domain whose child is itself a NUMA domain, i.e. on systems
> with more than one NUMA level such as multiple nodes per socket, groups
> tagged with group_llc_balance by llc_balance() can never take the
> force_balance path, and the group_llc_balance test there is dead code.
> 
> Such a group falls into the !group_overloaded branch below and in the
> common case ends up in out_balanced, so a task that was placed beyond
> the first NUMA level is never pulled into its preferred LLC.
> 
> On a 2-socket Hygon system (8 nodes, 32 LLCs, 4 cores per LLC), with
> "spin 3"/"spin 4" (3/4 busy threads of one process), all threads were
> in one LLC in only 41/140 and 0/142 samples; every failing case had a
> straggler on the other socket. With this patch: 195/196 and 180/196.
> 
> Only require sds.prefer_sibling for the sibling_imbalance() case, which
> is what it was originally introduced for.
> 
> Fixes: f38cc2f0d8a3 ("sched/cache: Prioritize tasks preferring destination LLC during balancing")

This patch looks reasonable. Is this an enhancement rather than a fix? Before this patch,
NUMA node task aggregation is disabled and task aggregation across SNC nodes (Intel) or
level1 Nodes (AMD, Hygon with NPS2/3...) is enabled. After this patch, both the NUMA level and the
SNC level enable task aggregation. Maybe some benchmark results in the next version would
be helpful to indicate that no regression is found while there is benefit on multi-node
domain systems (NUMA balancing enabled/disabled, etc.).

thanks,
Chenyu

> Reported-by: Yibin Liu <liuyibin@hygon.cn>
> Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
> ---
>  kernel/sched/fair.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 57360f5cdde4..205a0891b0a0 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -13294,9 +13294,10 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
>  	 * Try to move all excess tasks to a sibling domain of the busiest
>  	 * group's child domain.
>  	 */
> -	if (sds.prefer_sibling && local->group_type == group_has_spare &&
> +	if (local->group_type == group_has_spare &&
>  	    (busiest->group_type == group_llc_balance ||
> -	    sibling_imbalance(env, &sds, busiest, local) > 1))
> +	     (sds.prefer_sibling &&
> +	      sibling_imbalance(env, &sds, busiest, local) > 1)))
>  		goto force_balance;
>  
>  	if (busiest->group_type != group_overloaded) {
> -- 
> 2.43.0
> 
> 
