Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794228947;
	b=trmicHYM/EHc/WG/zZSfz6zxVbHC1oCmmdZQU7Xp43/rjjQijmZAgmYaJWUxwUcFnnQi
	 7Ygl4q2i70H6FVm5PfwKN/TuE9f2UcrGnBI6JnCRy3cxonDFfPLaM6h5/t7oORkoZ5ztC
	 CY6GpVEKYnl3F7wbRY1pg6tRYF+PwoRLXvv9b15bSTUiEKeqqvkG18L8+WdsEP1POlPhy
	 3vBxZiy54yA5MY07u90W9itDh0/8BkdrGMmEHQQSFPn9EqGMFlyHLGZwgnJLw5W9Jx1/F
	 LtUQ34M8zBvhfcLXXS4FVsq15D+GVqRSOOTGvg/vTf/UrD9J3mvhaj49TQ3TmLPJeqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228947;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:From:Content-Language:In-Reply-To:Content-Type:
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
	bh=jE3gprg0YJ8r9lS0fR3utw+TCouRyE7wwX6Z5CYsHPo=;
	b=Lx7xrlQC21IzL37TIOUmjMa3piPUTM5HC+GxgSTpSttfrXUzrbBc59Aqt7Iwj4vLVnCB
	 /yf+6ozwrohThfFQicA68qNWkIOffBA9kvQo+IngSUiRHVTZOdfYerb1WTcebcOORSzKr
	 FqlZKTTy+4usLgX7Jlb9IvwcNC/YL+K0kUFuPWPoBJEKErcXA072Rj8znUBJTd9nNo2XK
	 dCWCwDPTsgqxuiQbjarl73l67qY2HUQUz2JF2TJkXBg7odD9A4RczndQL/cswgJ6zTIu1
	 u9y/ZI4uBZvjZcAR2pKpu8cQNJwdGrp2G5qJDfOFef5PgyKm6BrvOoDqQ0II22LQENA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Er6nJuzc;
	arc=fail smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E68606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E68606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Er6nJuzc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794228944; x=1825764944;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=w9Rp2w78M58TxRat/mgrp9w5dF0VVM3ljHKGC8Tkivg=;
  b=Er6nJuzcXY3BADSVuX+gsXF1XPR22w2fjGxmr7Lxw7+OscRU1IJAi5DS
   l1owMqiwwi89rqajacw24nTv+23cpaoZcsyNFknb0kaBwvpIqfYBaI2uy
   rrn5+sKZ1mqMuiupwoDrjGXHuAtDvYTUB7C3la65pYZQJIerP2ggLoH9p
   l5mhaQL1e8E75DESBA62i/IZ+wAnR0Hyk+s6EIlD+PiEh35x8ke9I3nuW
   V/1w+tBBCdek3eDtBY9rjAhdEe4625YBEA0tkDNyyCcTQAbgABUAzbeUp
   CeAc9k8G8578bk/qikz4CEwjkchqdd8AjJ6cZTsBb2nto09+wryeDwoVD
   w==;
X-CSE-ConnectionGUID: g759MOLaTgmqBMC5kKmT0g==
X-CSE-MsgGUID: J5i+nShkRTqbVYRLkJPf8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2831750"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2831750"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:55:44 -0800
X-CSE-ConnectionGUID: Y53p+/fqRqW9eJtnHgygjw==
X-CSE-MsgGUID: 1r1WU2L4Q/KW7LHEurn3Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8300389"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:55:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 04:55:43 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 04:55:43 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 04:55:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ao27hhkOnB6ZfoNZlqj5NWjF5E1YMqxFdJ1T33r/Friuga5CRT3BnUuTc6XiycORxW3u1hv5gAY0Z6UxOLyUfZXnWzA7BjwXddXeuahYZQBkXnmySoljPRGvV8/m5iZESGjc0ftxPdtjMaKO+8zOW0xRQXAcf/bT7unHrvvU+JEhOb7onOyXAqwrGzZazHUCl6Jt+CwTwY0iURFh2zDWorexM0rXW9v+iVWfYFCprojpiBZJRbD2h42uox6+HnV4lP/FYZG7zgE8BFTRLSsqAUmhoaA6tiWRyq/EY2V/j7pEUJ1Ai6nrjsNcLy9vp92UTaL46OUd31EZyrckQb4+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jE3gprg0YJ8r9lS0fR3utw+TCouRyE7wwX6Z5CYsHPo=;
 b=Pkkg0tMA+CEyMk39aa1kSw8wrhNwEoU/PvtKD5UdA9ncz91yn93iJzHkA8DRkYvBpFEcz1+Y3nzaZuonzIaDnlfaOAgzh02L2YbRy9se3SRPFWBBc+Y+WVgn+4KCMYeiVqqaWDvW/qfx+gvHQAu6UlE0FM0mJCSNDKJrSTGZlt/2paGDZ5pxzLaAA49zbjdeVN7bgmfr9h8H5xSPrHElniC3LEoSC+nHchMUrxo9WOo0BIvWHuYg5K4FSiUOHiZlYD4yIc2HPQHBpeLs2l5Sw/rDwlkb+HfWUCm3Z0fGCTy7/SgZmUX5Tz6GP/HngJcwmpKICl7EleIqmXkeC+u3Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 by CH3PR11MB7938.namprd11.prod.outlook.com (2603:10b6:610:12f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Mon, 9 Nov
 2026 12:55:41 +0000
Received: from LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51]) by LV3PR11MB8508.namprd11.prod.outlook.com
 ([fe80::a1e8:1786:e5d1:8e51%5]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 12:55:40 +0000
Message-ID: <bb5d63fc-27a0-4f2e-9f2a-11835bb5b982@intel.com>
Date: Mon, 9 Nov 2026 14:02:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ice: clamp package info count to the response buffer
To: Noah Weinberger <NoahWeinberger2003@proton.me>,
	"anthony.l.nguyen@intel.com" <anthony.l.nguyen@intel.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <sjs92jrAG9X58za0SnZA1OOA4Db3R79dv436O7U-AytolZQYhuWSppqWG-OobUCTshYLEhYP6LgQAlvVSGMJhdUj9DSi6of3Q6huctkjXQg=@proton.me>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <sjs92jrAG9X58za0SnZA1OOA4Db3R79dv436O7U-AytolZQYhuWSppqWG-OobUCTshYLEhYP6LgQAlvVSGMJhdUj9DSi6of3Q6huctkjXQg=@proton.me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008A7.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::64c) To LV3PR11MB8508.namprd11.prod.outlook.com
 (2603:10b6:408:1b4::8)
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8508:EE_|CH3PR11MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b6d2dd-6fca-4a97-a1de-08df3e60c23b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|6133799003|10067099003|11063799006|56012099006|261028144727099003|261026121527099003|261102123227099003|261022075727099003|261022105027099003|261021135927099003|261021121427099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: WNlgxy3+7finOAz5hKrHZpWezBGPMYr4/5uC2t3mEEv4o18W/hR4FP+JpqcvXYiA4svoRUBQaT3djzkwcbEbasycBBitM7A1kIG/VUDhF1S1yj8528SRt2N2MOFRLza3QdamAxbkmRzg8NQDUyFMx8dexzDNSPFyvA82BSP32fL2+EMWdA83XYYVG0XMzYvKGJk5DDE0LPYGHztpEOqIdZ9NvAQJ44cwt4kqsRwIZw+wluwSXzbIqphEYKzzg6+9VYq6MWX0LG33zntSyWgLoot4eUgJ2bshBpimUT7kKx4bq41CcJhZiBNOcxhPQEuXGREwvBmIE5Av59h89nXVU4Y02viBAXKIxp9Giq0micO1i+JbRvWMnxHpzhJkCmX2kDDAqHN+kqFRER3w1gm867+rkHfbsO+SfR6ERenMEIeVgxO17xVMcjDXQwkKTgo7Ursl55Lpgmz8Nb9xL6+3G4xWbHKnNTImUU0tb/x0huNWAfxpeWeQRPnqpsX8g1IjBW4cnoaj3sLmARGCN5jHbKcsjL8fDhvcRV8/wJxA+41xHbtFcmXOFj/SJkvQmuh6PHuadQNSlJWHrWDGpoSmTd1HlOZ4l0cIn4XQO8TENo70xsSmFsYAluMAuH6zSEMxRUxkAEarbYYK0vJNMi+wsKZWyM0LwBX+azS69L3kpuQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8508.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(10067099003)(11063799006)(56012099006)(261028144727099003)(261026121527099003)(261102123227099003)(261022075727099003)(261022105027099003)(261021135927099003)(261021121427099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnJjRThOUjNybVhRL0RKWnBEeVNROGp0ckhtb0FNNmw3bk1qWDNVNTJGS3FG?=
 =?utf-8?B?MTlwZkdzSXV5VFoxakl3UWV0VWh4NVNSOFRiOUtUUHVIM24xWk1OaGVjL21p?=
 =?utf-8?B?SjErOVRqYXMwVVVNVTRhMWJVVnNrUlRoeXprM20xeFFmOUkxbWRINEFucCtn?=
 =?utf-8?B?VFlUVytOc2Z3VEl4Qmpadk5CMlFSMDh4RWEvK2hCV0JKQ1pEaitRLzBudHNi?=
 =?utf-8?B?d01GRlZsZE4yaFgrUUNYKzN3N2RmL2FUNWZodzE2UFB2QUhsV0dhTURTcjlB?=
 =?utf-8?B?OExDbDRQTmx0cUV6R0p2QUozVTlFb1l2UDc2YksrSnJsNlRONTBHOEtvN2J3?=
 =?utf-8?B?TjltRVJJamZISk9FNU0xb1N3NnBDMjZXY1d5eHNWOForak8yMGxVekJ4ZFJ5?=
 =?utf-8?B?Ykdwc1dBamRwVHhTMThrMnp4L1cwNi9MS0tuQ01OTGh2c1pJT0htWCtjT2tr?=
 =?utf-8?B?UEFVTGNzNS9iR2orS1VJWlRibGgwOThiOW5FOU5xSFVCanYwRVlYRUJIUmpu?=
 =?utf-8?B?YnVPOVQrUURXT0ZZdGZRdzlKSWpTYW9ZR3g3NDZydzAzYkFYdk1Jd3dsLzdo?=
 =?utf-8?B?MVdrT3VJOG5MRmtDYW15UnFNbkhnZUEyblZNcUsrRWRMcTgrRmkvRytLQTli?=
 =?utf-8?B?eTloRFNhaU80R1M0Z0JTUDJkOC9kU0tjSldwMmJNc0pNK1hJTVQ0WTcxZUVz?=
 =?utf-8?B?aW8xblNPYTFvMStnL3o4WG1XVURLOG8xT2NmRXhJQUpjVGVIeEx4VHJjaGEw?=
 =?utf-8?B?TWZrbjYzYmdqaDFYcnN6Rk5xZFlFeUIyWUYyb2NPdmI3clpGUE1ibWdjZW8w?=
 =?utf-8?B?cXNzN0JoeUlmdHRaOFRJeXkxZnAzMThIQkZiM1lBQk5WVnFwaENhMExHdXZD?=
 =?utf-8?B?VzNKZzJPcER3cFA0eEdiclArMGZxZ1RjMDl3VlJGSWl3Rmd4ai9kVmdPNjVV?=
 =?utf-8?B?SzE1RG9uU0pDTi9BYUVaT3VMQjNROFZiUGtiNWQzMmhpZVhraitBOW9EZGFJ?=
 =?utf-8?B?TkRjanYrUDJCL2xJSVR4S1hCcmJEbTBvS1JCNThxWEdFaHVaRGJESU03N05M?=
 =?utf-8?B?RjF2WEtPdDBZUVI0UTczc1ZlZjRVeWorcHZPV2o5aFVhU2NtZVg4QzR5cmxB?=
 =?utf-8?B?WFlIOVhwQ05ZbTlOejlhY0gxOTAwdC9Sc0M0RzdCeUdqYmtpTkw1aXFPOGlL?=
 =?utf-8?B?RlFQblJQbkFyMWNMcyt0ZnlNamp1MHd2Nm1BZ3d2TitzWGl1Vk1xd1BBVkFV?=
 =?utf-8?B?SG1iU1dqK3MxTXpOc282b2lzTTJUZjZrTTNhRFJZS015VzJ3RitjSXlKRVJX?=
 =?utf-8?B?VlloZkJrTG96aVBLNGNxMHE4bTF6dVZ1WWdXdTROS0NjdWNLRVAwalBuSUhr?=
 =?utf-8?B?NUVGR213L2w3dStENXNqWjJhN2xpbnVBNTFpOVN3VkpDbkRRZTFwS0VzemZ5?=
 =?utf-8?B?WDVvaE1QN1R3MkJUU1BWTDVlVGhGYW5qTEpKanNxaHdBSlVWOGNjOUp2RUxa?=
 =?utf-8?B?UU9YSFFqZEZkZVBPNTV5bllvRjIrOHJOL1AzcllQYmxTR1hpeGlxL3lXNXlw?=
 =?utf-8?B?bkNRRGhSWHhBR1NSNWVxbFdmTGhDUHVxZmI5cXF3eVROOFJHWEltU2VLU3pX?=
 =?utf-8?B?NjJGcHU0c2JrdDBZWHppTkxSK1BaQUxVYkhqamQyRVExYTNQcFJiNlVmL1ZE?=
 =?utf-8?B?d1dmc3FoMFgvcXZBNkM4NHp1ZzlxTkJCSHVaeGN2UENWWkdzc2wxQ1Q1WkIr?=
 =?utf-8?B?TnJ0WGhOazY5ak4zd2FJeXVic05QdGxXOEJOc2V2ckdsWXhhakhWWTc1RnNh?=
 =?utf-8?B?T1BiNldUY3hlMXRPRE9JekZhd3lKR3U4TmRlK0tob0g5YkFITkJQOW5oU3cv?=
 =?utf-8?B?Z0pxS2gyN01KcFZBRXhKbVhGYzlqL2syMWV6dVBXdEpUdHliUkMzeC9iZDUy?=
 =?utf-8?B?d2owUlBTN3ExV0JtWDZZNUNmRkFvZ29ZdmJTV0FCMWRmeE54OEZ2Vm5BNUYv?=
 =?utf-8?B?WWZWM0ZJV1FOcEtCUG5UL1lsOSs1aEU2OG0ybWxLSGduQkNFNWIwMUlRS1lP?=
 =?utf-8?B?aEp0SjFrK0VsTDArNU9tRHVIUEx1VzF4dHRReGZNY05iaGJmYnJpcUtDbVBE?=
 =?utf-8?B?MXFLd2tMY05PS2J1Q1gvSFNUT3BaK2tLaXFEYVg3QzlXb29YamVVK21FTklt?=
 =?utf-8?B?YTA1Snc2SUlKWUZWeXRBZG5PVmptTFZnVnNCS1ovS0JHakpHbW5LODRCTi9E?=
 =?utf-8?B?NXRFS2txcVNBVk1hYkp1TVBkQ1NlU0lsY1NIVFBCTjdESG9WRGlaYmE3eWVy?=
 =?utf-8?B?SWV4NW5uSEhxRkMxUUJTTmdCWXVsQnFnS3Z6ZEJQUUtxcVAwbXVDWTU4Mjh4?=
 =?utf-8?Q?/3KbuXxEQnLoYdHA=3D?=
X-Exchange-RoutingPolicyChecked: b82zT7eTbqgHuoCkP3VHaWiGjaKbhUDAuPyyOpDE/fx3ZUn6yJjlK7sDgbu1i93tc48BIIg0l7xFhMU1bNIP2zVDPHP/N4poDQBI/pATgNJ92CtutxXm5XBcVg04JFlhwvAwhks/fADme7y5/Y3JTonSVKT8APb5FPGYTFnXFnSOCV8bZcqHqITyavcOTDYjvZbt+wg8ol7Et/Z/ZQjtyc4tnw+8j2wn78X1E4+PQKJKtwE+hItTKjrMx4/qBxRweOuuGjRSqaRRLrHxhtqhu+Rhy3hi4821tj/6VI2bQ7E1G60MJylT2c/+qZYunv0+9VyPoRgxR4LWXgny1f6u6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b6d2dd-6fca-4a97-a1de-08df3e60c23b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 12:55:40.8958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTZH5XcizIrXC8N96mF3gxZm8+3RURMQb+0iFPEkfkI9y2ezeGR1Sj1N190KP99gxnaZIrAqiazZE9dv0o5pev6wFhYczGBu44lypAXH7yY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7938
X-OriginatorOrg: intel.com

On 11/9/26 12:55 AM, Noah Weinberger wrote:
> Hello,
> 
> ice_get_pkg_info() and the DDP-load compatibility check iterate
> over the count field of the admin-queue GET_PKG_INFO response, but
> the response buffer is a flexible array sized ICE_PKG_CNT (4):
> 
>      DEFINE_RAW_FLEX(struct ice_aqc_get_pkg_info_resp, pkg_info, pkg_info,
>                      ICE_PKG_CNT);
>      ...
>      for (i = 0; i < le32_to_cpu(pkg_info->count); i++) {
> 
> A device (or compromised firmware) that reports more than four
> entries makes both loops read past the stack buffer, and the
> 'active package' name/version handling then copies out-of-bounds
> stack data into hw->active_pkg_name. The patch clamps both loops to
> the buffer size.
> 
> Affected version/commit: mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 (v7.4-rc2 window, 2026-11-08), drivers/net/ethernet/intel/ice/ice_ddp.c:1993-2015 (ice_get_pkg_info: DEFINE_RAW_FLEX(..., ICE_PKG_CNT = 4) then for (i = 0; i < le32_to_cpu(pkg_info->count); i++)), :2067-2077 (same pattern with pkg->count)
> Longstanding; converted to DEFINE_RAW_FLEX at some point without adding the clamp.
> 
> This was found during an assisted (AI-supported) static source review of
> mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 (v7.4-rc2 window, 2026-11-08). The patch below has NOT been compiled and has
> NOT been runtime tested, and no reproducer was produced - the triggering
> conditions are described above instead. Please treat this as a report for
> verification rather than a battle-tested fix.
> 
> ---
> diff --git a/drivers/net/ethernet/intel/ice/ice_ddp.c b/drivers/net/ethernet/intel/ice/ice_ddp.c
> index 3b2d9c4369..bb037ee96b 100644
> --- a/drivers/net/ethernet/intel/ice/ice_ddp.c
> +++ b/drivers/net/ethernet/intel/ice/ice_ddp.c
> @@ -1998,7 +1998,7 @@ static enum ice_ddp_state ice_get_pkg_info(struct ice_hw *hw)
>   	if (ice_aq_get_pkg_info_list(hw, pkg_info, size, NULL))
>   		return ICE_DDP_PKG_ERR;
>   
> -	for (i = 0; i < le32_to_cpu(pkg_info->count); i++) {
> +	for (i = 0; i < le32_to_cpu(pkg_info->count) && i < ICE_PKG_CNT; i++) {

you basically report a "malicious FW" here
personally I would ignore

(same for the other of your patches)

>   #define ICE_PKG_FLAG_COUNT 4
>   		char flags[ICE_PKG_FLAG_COUNT + 1] = { 0 };
>   		u8 place = 0;
> @@ -2067,7 +2067,7 @@ static enum ice_ddp_state ice_chk_pkg_compat(struct ice_hw *hw,
>   	if (ice_aq_get_pkg_info_list(hw, pkg, size, NULL))
>   		return ICE_DDP_PKG_LOAD_ERROR;
>   
> -	for (i = 0; i < le32_to_cpu(pkg->count); i++) {
> +	for (i = 0; i < le32_to_cpu(pkg->count) && i < ICE_PKG_CNT; i++) {
>   		/* loop till we find the NVM package */
>   		if (!pkg->pkg_info[i].is_in_nvm)
>   			continue;
> 

