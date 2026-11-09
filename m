Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794232239;
	b=xSh7y494C6AMHd+PiIwV6HWCfSHwCqeTFyTtC2kOLjBwEWKByyATebDKiUnnfnNSH+IL
	 5ayGJA9Hp4zBHG4XdHaITJP0F7ov+8sBmpdInfbMc2MBDjTfRIP+w9TJIn/b318esY7TA
	 Bu7mD/Xe+AQe635X9KfL6KQlA+o+Oa3JI0xJglvf4aC0EC8t2WMECfSrVrQsjJYf4OLoJ
	 EKwrZVR4HD21JB1hM4bqbE+BPZNG10dXaO09IkqLkTAnJxRphGcn2wVfxexTATGWUF+/n
	 AeSZJpVkYk8DFccG43K2izVNicrmpgrERlGIwMOnkbu3VMa5ugfNXbqL23K24DIyK3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232239;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=1lkhTtlX4HM+KPFntSZWuPl8WoCri/qrB7bnaWQzmRM=;
	b=qnYPkkl4DS8O4dzz8Ow/H9Irp1FmGpL2sag6YXbGD3xFTGG9mplmrc8fzjmUZ3qkZjlp
	 TwSmzDDzxQKceAEn5Yb7Q6DHoANV9YEkNlI8pxr7lu5y6B1elB3Agy5QCMDE/Eop/D4x8
	 t1UDrKRAGeDrzqkfv+ji3uQzMwWiLamc7u5L1jZ7digWKHl+uGpF2KDHs/GW3QBCAE5BA
	 U7Bb/80qbkbl+Yb9bjUBhIwfPm8Qrpcyv62h1guc9ZrZLmgLjVc26JJwKZwTjDabpkRqB
	 WaSZgLaHQQYTsyOtW8Js03Odcel4PhWazEgVegTl8tfbHc2l9Yz2N3n6hwvPzsy6i3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l4P7lale;
	arc=fail smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF88E606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF88E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l4P7lale
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794232237; x=1825768237;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zBiE9iafr6zgmV8nwYKpxMIi2+wB1/0zPBGHxvukGo8=;
  b=l4P7lalewd3doJkztqXf+Zp9ftYQhZTySp/NRwmMnCoJGKNmKWOm5css
   VxqdI6L2pizMPRqWHxbGKNVwwuWVVaElZPRep7N/DTIlFqfxR3pFMOVDH
   tIdIdu7LNqT+4y27g7ixrvJoqms531NINzvzLqP5Xy5E/P1qRzFMWFF6J
   vOZqYnNaOMsILcGzyCxp9PzuJxYNY4FhxHrDjDYf2b+2pbGzdc8yMyf4i
   tSnBn98HAB8bPO1dfW4+VJcCSqJchkM6dvlOxC5yMJZprXKKm4BQIzqat
   7Vsr3yDTOQVgolDAsm7NTejLjmnHoW9c2eKNI5Y0DP1lTLiNC9WAf1aD+
   Q==;
X-CSE-ConnectionGUID: h/Dc+XV+Qt2/nBSmZDud+g==
X-CSE-MsgGUID: VlU0lK0bSNu0VwQGsf0cZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2981196"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2981196"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 05:50:25 -0800
X-CSE-ConnectionGUID: Eg2GWFtuS5aEeJ8Kxbz6Rw==
X-CSE-MsgGUID: ChkjutlZSj2J6Y+iON6ufw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7993943"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 05:50:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 05:50:24 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 05:50:24 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 05:50:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIrm83PR+mroRtRYZCJjdicFnHL232RcMG1YCOQy3dlnzjYRf22ikSpErPuOdQKeZNgKJD21tue2W/fNKUtYsncTmgm6OrG6iya+wv0yEArATOZO3KYMaEyWbkDtwVuYCODSruEpcti0kbwAGFlc2CPgPNYsoGoeeWkQWLN21S8BFILEA4QH5vb4NtRaWaTObcYf2gbWZRAYBcaBMTgvsWccS02VMW+NxDThyPQpkGJSYypOP8eV2smVQRhHafAbrn+UXfOyS60AqL8FEbovQGKuFpOqIwobN1Dqc0+bbEDbJ0TKo6QPhEIpSsXLNxZe9Y+u/GdwvgIzXiXvN5H0/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lkhTtlX4HM+KPFntSZWuPl8WoCri/qrB7bnaWQzmRM=;
 b=SLUkamwiRA7EzF/e05JE14mbdWEhYDS/DheDl/Hc7XsPm3QkhWIU8pxVYEUyzCa2evsyZH8IteyayBVSuMwwpzrmyXlK929t5DQywx6vaA8K6qK9MU3+KH9s2tUZvF2dNsJr/1Eov0jZxApkhZ2gOd5yv548Hr8433bX8+c4jopCfzIe5C5VNqXEjEHXdyk2/yBFqb6hDNBHubyApn+X0VkHvqU/jXudm+bPbFvRzcuMmJda0CIP5QzXy9pTVx1abvXrskKrSXRTq+Ys1Acn4QeGwaL0XLZc5fgvfAvUVjYQMoV+tfpOldz4cNs5zt6CaMhjLM7krLoXaGHhrbixMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 PH7PR11MB7124.namprd11.prod.outlook.com (2603:10b6:510:20f::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.12; Mon, 9 Nov 2026 13:50:17 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 13:50:17 +0000
Message-ID: <5c912bd3-8701-4395-a118-4ee6e09233e2@intel.com>
Date: Mon, 9 Nov 2026 21:50:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] sched/cache: Remove the old cache group footprint on
 exec
To: Jemmy Wong <jemmywong512@gmail.com>
CC: <tim.c.chen@linux.intel.com>, <chen.yu@linux.dev>,
	<juri.lelli@redhat.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <kprateek.nayak@amd.com>,
	<linux-kernel@vger.kernel.org>, <mingo@redhat.com>, <peterz@infradead.org>
References: <20261022031933.46869-1-jemmywong512@gmail.com>
 <35237F63-C205-4AE5-87C2-BE85604055C6@gmail.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <35237F63-C205-4AE5-87C2-BE85604055C6@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|PH7PR11MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: b8699bfd-f982-4c6d-535f-08df3e6862f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|7416014|261022075727099003|261026140227099003|261026121527099003|11063799006|56012099006|261028144727099003|4143699003|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: cQ89Te3Gjvlgqx626X8GGa6DJMTPuow9kCAAnvSctBv3NLhB7naf7yT92cxSP8en2Dp9eXSJUcYulH975sWodhwu1fqrKq6xUO3fEFdCXyVXsNoTa3RDsd4HcLTnB2RUsfwv5CRsAqxYZxIHGR9dKPSPaGoOA4tN+vK6sIGDpsYRYaAJvzDBrfEeRmz4FtKWqAs7ORPpErEzIvIFQO/+oHMK0FsUIcAwLP0ltNX2vspSGUWQE5aslvdZUKRFxYM/BMuXxOSQv3vw1ATboTTET8XntIW7yOn1MXDtS6aJDk9koONPOR49HBoX8ErNtJmNUNiYLX79IyNVJ9PDknsv/NneOdCOEmezDq5QUbvAY2qYsT5w52kFTND1pfkWRWYttTYOueqx3YBxVriL9EylfQhh+MucpvQRhSvmz3vmbjFudWq/puSTrv6Nx+RzHxURcHbaekDu4cU3w8Zlo2TbCjjClb/7aTF8RhSyEjlU9u6rr803iz+OKkPoy5xS2ywNtICDmmEhYqq0pK/O3mM4s73tGjmbYtwhJaidKxpzvZWXVilXFoHc3hOHki5Dj0JoadS/JgTxkd6AKB1vnox7VrCAixYp04+3UB3ac47wvdJdAbUnne5eoN40NREWOotkE13P+/JaLF9xBmgnEUNjIbCCM1LPnECCyXCzixPKOBc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(7416014)(261022075727099003)(261026140227099003)(261026121527099003)(11063799006)(56012099006)(261028144727099003)(4143699003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2QxUVZuclVxZXkyRitNbzQwRnZDeXJWdmxoYjhycmVBUW9NSVB2cW5YdzYr?=
 =?utf-8?B?R29Zd2hRcFNuYzNFQ2QxUGFPcjlidDRkQUJvTGZJL1gyVUh1ZjNkVW4rNlRJ?=
 =?utf-8?B?N3kwcGhnZ2lEd1VBMDJabm4zRkZoUEFLbllKNm5kZklaK1JyRU9oRWQyYUEx?=
 =?utf-8?B?R0dQaysweXY3SWgvd21JUUxXRHd1MTJsVjcxakNPazgwTUZ1UVBRT256N0RQ?=
 =?utf-8?B?NGVVNHY1bDFOV3ZTYk9CZWJ1aUJ2VWNZTkQ3Y3F2NitYQm5yZ2V0RkdhT25n?=
 =?utf-8?B?MEQrRGZ1cCtUeG1adWUwMFhOSVpIc25FcGcyK1JDQXM0Y3ByRjRYTlZjdnVD?=
 =?utf-8?B?RVpmampVZDZNSGVuYlJMbjNZWjUrRE52WU5BaWJzam5XYkM4bnBxYWp0Y3lw?=
 =?utf-8?B?SnpqOUNkQkZoVUkrRURnaXFnVlRYRnFpVVNTbzI3Rlk2KzlUajlnQTFqZ3Fi?=
 =?utf-8?B?V2h2bnEyNlNVOXM2YU0vQ29LU0tCU3hOenNmR0JXaTRrbnNNMTdCY2pLcTl5?=
 =?utf-8?B?TU4zYkNmZkxVY0IzVm04QVdGaTJGRCs5RVlRYUhoVXNIL3pmVEZlcy9ESnFN?=
 =?utf-8?B?bzdXYTZZbUpWeno0YU0zVUVzbzdPcTBibmgwa1Z5SUZZcHF3MmtlUXFzOHJ5?=
 =?utf-8?B?ZWYzOEw4UzliZC9xOEQzNEloTEVxUURmdGl6VzQvckkrZW5EVU1COXNEVWVx?=
 =?utf-8?B?enpWSDN1WU9iWmxid3pMeE9JZmNtelNnMXVUQmxQMVBVRVhpYWwyL08yTldU?=
 =?utf-8?B?T3VpZ0Q3Y3lpVXU2L2d5d1FTNnZ1emRPRTQwNlJFbkNWUnJ2WFBDU0sva2VQ?=
 =?utf-8?B?WWR6cU43aWh1WDY1YlhUOXFKelJLWVJUaXd3TkJRNXJHWEdVeVBwU29HU1Bn?=
 =?utf-8?B?QzlzbUIwb20xT2xaVHhzOFJLYlBiSHdHaGFGTHNVcTZaeGZoSFJaaDk1ek10?=
 =?utf-8?B?cW1nalY2b1g2ejFVSVVLSGMrakttM1dSdWduMHA3eVl3c0xBUnB0TWQzWmxD?=
 =?utf-8?B?R21xY29jRExhd2U1RTdvS0prU1k0aDlOOTJhNjd0cUtXdFZsOWlnY01sTzZP?=
 =?utf-8?B?Nkt6WFZVZ0Q2emx2dkovTGNleEp1bU9jWVRvVVBSZlUzT3RVNkFtdzVmSlZL?=
 =?utf-8?B?b1I5VlZmVkhwNXhpSHAzQW5xdlpiL01tdGJZVHNidk1hcXcwd1VVblg2Tlll?=
 =?utf-8?B?SGYxSE16SE5yRG5VdDh2Mk9HS25zY0lkUE9VNmw4eGtxcFZscDIvYU1nSld3?=
 =?utf-8?B?TjEzdndGaUlEcDRkcTFEV3R2ZDRFV05yY0JIWnR3VEI0NDl2T0t1SVFiU2pR?=
 =?utf-8?B?VitjVGtQcG5NbUQ4YlU2eG1JekdHcE1wUHFUbkJybmhvbXhVUkFtOThxZmsr?=
 =?utf-8?B?eUgzeGE5ZXVCNE5lTVg3WUZEdjBXemRrWXgrTmtCN1hNR0NGcHBia1pEMDEr?=
 =?utf-8?B?RkxVYmI4Q2VsVXkwcDNyTmZCQkxlSmxlRzAyVlhxSytZckVrTWp0M2QvM0VB?=
 =?utf-8?B?QU5sTUdjQ1dFU2gyZHB0OU8rRzlieVdUNVpLZGxxajFYbk90ck9jRHZFM0M2?=
 =?utf-8?B?eUptTitwSGliN2p4d0Z2SFJyMFcvSDFBZzBJQ3pzOCtUUlBJUHRiUHl1OXI0?=
 =?utf-8?B?UFRtUzQzS0lPSVdvcCtkK01abStucGZzWTdZazRUUkdYVE1ZcEdHVVNhS25l?=
 =?utf-8?B?aC9IRTV0UE5TMUg4SUcyYjBES2RLdW15VXZCcUdGMWZYRUhkak1vZXNmRmdN?=
 =?utf-8?B?dVcwMEtrMGVZZTZxZTdmTmFHSmgwWkFEQ1JuVzZMd3Q4VmhGRWRubXVTa3Nt?=
 =?utf-8?B?aThCeHNSMGsweUlDSHVsVFBMNjNJSjRPT2I2OTkvVTNsd1N5OXhwK0dGVGJU?=
 =?utf-8?B?OVU2VnZYa3NUbzZNVTA3cExVeTJGTkJuNjJSTFdlZExyZUtWOVFmMWFLYXAz?=
 =?utf-8?B?SGhzZVNTVTR1UHl2bFltK0JOVmJsQ2dXRjIyb2dRWlYxR1JRUXd3OFVBWjRI?=
 =?utf-8?B?SVd4SFBFcG9uWW1JdmN3VVZpakg2Nkp6SlZ2Qll3aGtMU1dnc1BpbzNEU3hT?=
 =?utf-8?B?a2dnN3BxTElQUm9lNlV1SmNQOFdmVWZObW9wUHBGa0NvNUNCOE1UaHlndTNS?=
 =?utf-8?B?TDV0OVlEVldmbEcwcjhoUithTDZIUnpXcEQ4djRidnNUakZTQW9Qa3o3ZWpy?=
 =?utf-8?B?c2ZPN29EZWhBeER4NFNYb1lsaVM4Mk1TSGJHUHl3alZkOUkreWVUWS85a29z?=
 =?utf-8?B?TVp2OW4xcXJ0d2NORUhuZmJXekdOQ2R1Q21aU0VpSHlUcUIvY0xkNjlsK2dR?=
 =?utf-8?B?N3pGQTgySU53N1hZRkFXZFJQZXBKM3BCVkdRc3NwNDlPcGdIbXhyQT09?=
X-Exchange-RoutingPolicyChecked: k6NUY0j7XuDidvbO1BjYz2MDtveczHDWDMFne7jZq1NnQBEWxWdv5d+P3mpu8nFEIyc0qcEXWq92zuhHH6BjtIElFbCqPicjF+JvH4gLdorq+znfWOZQnD5wUHztmeF4fpcCXbu/Da7STLIGji1qL+uKJKKjnMq7sOp+yt/MixyxAIPifVyuiUMUjMddHIHRUo6IJG6SkqdfQRklgTsgq41/D6UaukOmjVWfvvetHJhrMqLfAb2Lri9Le6fVd1rPtXowbZ2wGbFBsKjoEGKm+ruagfq+bGeLvRm9fp5ukc50ipAZ65SZFU7Sj8bclouXYv6sGFtoIUWg1DI4eo+oGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8699bfd-f982-4c6d-535f-08df3e6862f1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:50:17.0267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7QBwstQRj+aPapjQL0Ex4s+KdOHosX7dvHzrT82fmiJVwCt7oUAeX3pXOWWIWF6e1R/Y4s6X/yy/OJwg5qLKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7124
X-OriginatorOrg: intel.com

Hi Jemmy,

On 11/9/2026 9:36 PM, Jemmy Wong wrote:
> Hi Ingo, Peter,
> 
> A gentle ping on this sched/cache fix.
> 
> v4 carries Chen Yu’s Reviewed-by and Tested-by and only updates the
> comment and commit description relative to v3.
> 
> Are there any remaining concerns or additional tests needed before this
> can be picked up?
> 

Tim and I are working on v2 prctl support for cache-aware scheduling,
and we picked your patch with minor modifications into our internal branch
because, with prctl introduced, the code needs to deal with several race 
conditions
including the footprint one in your patch. Do you mind if we send that 
patch set with yours
embedded(with your authorship)?

thanks,
Chenyu
