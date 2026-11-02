Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793660751;
	b=kHYJ/tywKSZV8J9tJLGpAgyQ6vy3lHIWPqKBGrcTyVi/v/ed/99bPUPycZGXKc6kfbHi
	 GYe7UTesofSNbZmQxb69uxqkthGIkBGrNrjgLTDlI+r/giEKaIpnSclvzIZCaZvVfdKs+
	 lhvVgsrd3vFKaR8bBFDLfd7F7F1vqFtvQJxyvlUf3MYd03iWqkY2JGkA9pZ9VAut/EpkL
	 zwhxtcOxPdJtliFSYtSEbA4ll5r2Ke9qAsZwRELC89a2olWchskI083whUxqmvDMnFKgQ
	 Y14evqMioFPl9F/oX25iXx8mVyLyYd4DbF4vBg+NaoLZ1edXaf3hRNcUX4iLqQ2ec9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660751;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
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
	bh=4T5ok0TLsixjT65cO+Cmu/GPRonxjsSdbaaXOQ7GM+0=;
	b=0nf1dCCQ6TM8NOUxhVy7VwCfzvKbqRSJSR2BxwhJt2XXbfxds7khh/0nJmUUuewkgWu9
	 TvmfM+Xm/evQ9P9ypHHZV/uEUB+VlICuc6aGdyv+THV+NMDY2w9npU+ByTbpW7VkLemJ7
	 4DsyAEC5LoLRsnEVAWyAuTdXbrB+pL3ppqp7FbvC7IS6O2vFY7gPqiEvm5pTmKz6H6jwU
	 6qG72gmOO9JqhYxW/avAcSLpPWQjgraZlK4H/mcO96BDa20BXHSufXY2Cqxt6y9lruScx
	 thaLAQPAGI01/CkbYBl97KtwpdLoKg8PPK+slOWURHEFSckIoPNArkstVLk1DDi6VtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C3Utzk3S;
	arc=fail smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3924606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3924606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C3Utzk3S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793660748; x=1825196748;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=vQsZBylJwm+6pAYAxqawC5vTGlTLqhGKfOQtsA6Rvgc=;
  b=C3Utzk3Sc+dWqL2kGNTpmJS5EI0ubRRmyUJQ51Oyuu9x4ikGSJaEOKWq
   HCB7JPq4suiRh9bYtZ6vUzxZfqinpVyRdanO9r+9dptIXfmqy4FoR0WDC
   d+oj0kX35vjL5iA/t7MjAMBvxt2j4/TwR+0sEob935PUehdBvYR7piKqh
   yOTMKkD9pBXAxQXmWp918FvEx2xrLOVmZI1M8q8EQhIKTvXT4Spx2fP1c
   wH7LsqjZZDmUoN21zNnZUC/REsPh2Klb4rzVbK6oOd1C8iWUItguHuGd4
   OTXH3J8nL/iWN7OlQYQV99dHnYxJ1SwYklI8fgmlgES64toBohS6G+ZKP
   A==;
X-CSE-ConnectionGUID: xK3eP+7EQNiHhLmUePPRCg==
X-CSE-MsgGUID: GZgspCHMS/icjdddaN1uJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2388176"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2388176"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 15:05:46 -0800
X-CSE-ConnectionGUID: yOtQgpSqQuilwtBUGhmd9w==
X-CSE-MsgGUID: ixvkggRURf+glPLNL7jXFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6789023"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 15:05:45 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 15:05:44 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 15:05:44 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 15:05:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDnyhcjcBqYIrTbGCti4sOdSGPuPLdAPF9C5YGCToBldXu/VZI0w3rps9T+MdESa7zuMW4PDq7IWaVP+93IAFjVPsRlk6ILPDGjT8z36knvmM5ekjVHbDF7ud6lRJAyvhKe5PUSSY/VpBr3E3OCiQ8z0LmXvXSNa3JZsnLICyoI2SfT9IALantTJAe1gZ6GEAATwyJlhshOMljH1kVxWiPRUQT0IGG5IfNHdNubBMXuLHQ12JhVt2gS0FTIhrwJFUZNsl99kFxARPvFv+P7m6siWD7ZxMSaipu5X3mbZ5Rd4WeKKEjIV05aarjpv1G+NKaxb0x2NuP5mEc2upUHiXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4T5ok0TLsixjT65cO+Cmu/GPRonxjsSdbaaXOQ7GM+0=;
 b=jHCbMmSxQZOJTt42W49WCJzP5wVGjHAGxq4QB3ApJTQi5dhgVk52ZH6yG+GjAE4ouVeu/rG1wgnsyf3QVOhtsgwBhKXYZyUQysD5PGuK0j2GDAhUo3qRgdWk6MsI7kYw8fhKxZANeX+oVyQu7+rzrblvkje9IxRoyFrQ+bGFFmjNCtCPXyy/WLtjTbvXmbsWSyij1kSNbRYsb6R8ZpK+b6fq7MRTOx5h8oLOrqSIk03VYOHQm4Eoap9zMCeILktHSHlAQs8rUAcPvn0cXM8Y7FczNtAKFJybW1iYMq+C2SXVQh28mEzzZteRNub8p+GFO1y8VCjCOhy5gga5poRyoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH9PR11MB904373.namprd11.prod.outlook.com (2603:10b6:510:418::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 23:05:42 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 23:05:42 +0000
Message-ID: <8b407e60-4def-4556-bf9d-2f13f970e676@intel.com>
Date: Mon, 2 Nov 2026 15:05:41 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] fs/resctrl: Do not allocate a monitor context when
 releasing limbo RMIDs
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<bp@alien8.de>, <tan.shaopeng@fujitsu.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261031063634.1678345-1-ruanjinjie@huawei.com>
 <20261031063634.1678345-3-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261031063634.1678345-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0140.namprd03.prod.outlook.com
 (2603:10b6:303:8c::25) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH9PR11MB904373:EE_
X-MS-Office365-Filtering-Correlation-Id: c5799251-4c6a-47f7-6817-08df3935d1dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|22082099003|261102123227099003|18002099003|56012099006|11063799006|5023799004|4143699003|261026121527099003|261021121427099003|261022105027099003|261026140227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: ieJS7vZbZ8FzGSmsC9IERbEGpdLyMIV102C3ULSRfh0Gg6LeFIzJ61YLm8CGXfjQcsTGKu9uDYzza60VRBh59tIz9Z7YbhX2DvozKtStbBh3GTtCYZ+okrSvOS78u/RSQaZOPPatSY8rmDhKqtpwxQZ0Z0wx+QrJxwr63YVnjhxX41N57xetyuCrtwkPW6vRa4U9LuHN2qUFu9cwn9a/scHM16wj0iMj/6iBK/hxvO0IZipPPpJr9bxGsQ33TmJoGofBpJ6ieRoywNHwAbkOeizdiaFL1XqyZxs5Ne0s4UrUvT90dG64fWJPmFDq/Su5LQ97cFDkCxwbPXlUyVgHFJ/pcniuELixb41okh8dQ0TdUYsL9JHWTREieOcHKsSkpW6jM77KIpjf+G4TOIYBc/3rtVMG+3+J/XyYed3v0xJ5TZQiwQASkrFCs9clL7QwkDgkb2i6d9e6ZGn5hIhYzw9DLpNU+j89P1JJe4LWg1qOmNmt/xTpLywIB89SUfAsos5Yn37vLmp3fy7pHDGrTlqGnFpX22RWpnYu2L1WCnhZPC/Wu1yAof4BQr7LrAEpvuXZEXEIzKbtnUO1h1cwmL+Min3ZWTFjsQ/5Ow2i2OBJX6IN14LQA0CbW7LukHRd5drmEGy9TYFfm+5KPi1SVD5SLkn9ZFeqlCAdGe6f7v4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(22082099003)(261102123227099003)(18002099003)(56012099006)(11063799006)(5023799004)(4143699003)(261026121527099003)(261021121427099003)(261022105027099003)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE9vcjRjVmhhWDVjRS9VRk5FSEY3eWh0TUlTM1Bra1dYRWw0eTF3ZVBzU0Nj?=
 =?utf-8?B?LzBjVkFhR2doVU5GSy9SZjVkY0haR25pS245eVF5NHc0M214Z3NkTzU2Vk1z?=
 =?utf-8?B?aXoyRG11MjBSTnFSV1ZqTHhXZktBeEFiU2x0MjJVQ21lUDNxQTlhMEtYSEZW?=
 =?utf-8?B?dndqc1RlbVNCa2xmRjBXVFdPUFVralZhVzVoTTE1TFVzOGU0SGFJYmhPc3Bs?=
 =?utf-8?B?Nk5FRk9PMTRCcjZFM0hiOG42Lys0bHZwQjhTZGtqYU9IbVhZaGlyN3kwYXNo?=
 =?utf-8?B?S2MzZHF1NWQrakdBdVMyV2E0RkcyU0YxOVBwN3lKUmd5dytsaHNwanVLSnFz?=
 =?utf-8?B?OW1pUlY0ZnFpVmVMdTdEb3hheHlsdkRhMTc3UCtocm53REZyZy9xcGdGcStI?=
 =?utf-8?B?UnBkMnY2L3JRUlNsNUZSNHIxTDh1UGIxamxEcUpva0xEM0JoY2hIRytUQndY?=
 =?utf-8?B?bGdUdnVicFlndW5QcDgzRG5SbnJLU1NOSGtNZndFdTlWR3l2RDJZRHNyeTg4?=
 =?utf-8?B?cWpJcVZ1ZG1zWjNQTlJiZWRhbUhQSHlkeW53NE9yNElGWS83SC9oV2hUcU40?=
 =?utf-8?B?V011UUtyT2RTNE1PRjl3TENIL2RMQlRhalNlejArMXI1Ykl6QlBTVDVQTlU0?=
 =?utf-8?B?UkhPTGtsWVZRMjRmRGdhWVZadEVMMkF4QWt4amc0dEl1djJvQy9qNDdPc212?=
 =?utf-8?B?YXZ2dW5ZUlRVR2creVF1U2VDb0RYdW9FNkNLWUpjcURCRHB4SElscVNHTXFm?=
 =?utf-8?B?UVpia2hxU25YeGtHSXU3L3k0UkFoamlRK291WDlFVlRtSjBCWDRPWUg2cnZT?=
 =?utf-8?B?R2xRRmQ3VEE5bk9kV2svTURrZUwwb1ROdmpsczVrZG1DcnkvOTc0TFJnU294?=
 =?utf-8?B?RGFaUU8zRHR2OVU3UW91NFRUZTZRKzIrMmlKbEpVSXV4K05OSTUxVmJQdkJl?=
 =?utf-8?B?d3ZlSWtkU1BBbkVubFZrOXlOek55STlxQUM1SkRLREhNM0liakxTV1FVVlRW?=
 =?utf-8?B?ekpCdGh0QTgva255L012WU0xWjI3S0RVQVJ0U1UzcTgxclB5SHFKdXJwMkhI?=
 =?utf-8?B?RWpkR2dYZ0N5dnhaWFlEZC9RUzdvY2xiWVcwZWUzTmtsbXBLeWFKVll6OWx4?=
 =?utf-8?B?RUc2b3RncTZBd2VKb2YyMXcvd3VJM0lGZnpQSnUzUXRWck5OSy9IOU1pTjgr?=
 =?utf-8?B?dXowRlU5NHBONU96MElzTkI0d054YnNzY2d6ZUl0dUpab3B2TDdXa2FPR1dz?=
 =?utf-8?B?NHBKMnBieHNWemRlVG55aGhlVldMVE5VZlRWU28xYTIwOUFUZzJXTlNqOUQz?=
 =?utf-8?B?T2xRL0FIM0ZLellNeVl6R3BFdzZmWVdiY1hMSEtuSGJLanQ1RkZVN0VLWW1h?=
 =?utf-8?B?blA1SExvK3V2QjZuMXg5ZnU1MXZjMEZZd2NOTm1jWnNHT1hEcnMvbWVFbW1j?=
 =?utf-8?B?NHo1TG9uYTgrN1Z5N3djNjNwVURVanYwRUJxckFVcG5DNWRiNldmM3FyUUpW?=
 =?utf-8?B?VTQ0OTVTYXVIT3B0S2pOczNvOXdyYlRLREhjRmcxTnVXaVpOR0FSa2svWTEv?=
 =?utf-8?B?MFJyU29kOVlRN3pWcm9UR2phUEZvTjRkN2NHUEhaREdYV0ZBZFZkdXVDSDFj?=
 =?utf-8?B?MEtBT2FlZ3RjUUYrN211RFZBS1VhYVBWVEpYdTlPOCtDMmova3o3M2xseTR6?=
 =?utf-8?B?QXd3SWV2ZDhWWG9LSElKMEdKYS81L0dwa2NHM1B6L1U4WHJZMWhDcnQzU1Ix?=
 =?utf-8?B?dk02WWxmZ1ZIUjVSV0krMWFuTUZKRUNXK245K1FCWHpGU1NFMEpzUWI0eGkw?=
 =?utf-8?B?TnIzSTUwYlloUzJpbXRGN1RCVHRhdXJEVElaYmp4aWUzV1RwS1FQTWtacEwy?=
 =?utf-8?B?OEpaUTY5NXpoOHJCSGl3S04xcHM3WWduMTRKUlhrV253WWtsT1pmdWNubXNX?=
 =?utf-8?B?Z0hiZGdlYmUrYzdMWXFkdTRuM1RGbDBHVlp1eDZkUmY4Q2VnN3E2bW5KWlhR?=
 =?utf-8?B?VFBxTTZJRWowb1JKbnNqT0ZSNWIxdmkyT0daVnNhaDFTOTE2M3F5Szk3V3lj?=
 =?utf-8?B?VHdnRGhMZlh3UUJueTA1ZzhhK3lRVGFoRmUxYlNSY0g5ZHBIOFlWNmdIWjZ6?=
 =?utf-8?B?Vk56cUZMTkV5cW9VaFhaSjNXZWd4ekF2cVZWYTJGbCt1YXhLY1ZIb0pMU3Nw?=
 =?utf-8?B?VWJoWVAzeGNzUU9YRzRVekpIZkF0bEtNSjRjR3c3Y093SjJvcUpkYXJUbGdN?=
 =?utf-8?B?aUFoWVZ2S21xc3RCZ1ZJZjdVTFdtc21xQStlWXFaZWpQQzZPUjhqOTVML2Z6?=
 =?utf-8?B?QjF0VncxUlcvSm9LUXhpZXNGZHhISC83TjkvVGRML2ZDOXZBcU1Ia0FnUUkr?=
 =?utf-8?Q?mMj6v10F3fEkpUAo=3D?=
X-Exchange-RoutingPolicyChecked: yhXWymvprFM1wMuRqWD85VpyN1y7SUMyaB0ce5mpPyFM5ud0/9kx+Ndm7yLk36ukBkBXJ2rmbmEOXdldmDHiVpIlw1rlH2anR94NKjhmFaEbN3sCBWHEOY//L1j0PwbAK9SKh7YixyCTgTM81GVl9z9ID1tBNS4s18D8UvA8J7XZsfuslyXmek5A6JOp1fs3IIF4laozr+O118uWnP7Pgd187LHVb/k8e7mMXHt1pg8r5rRP7+4TDDFp49J1e/Tl2TKPMqHrEb0w1v3hNnNV5Dbmi/EyqxlyYwiV6A/TzUJdLLAvk4tcMkenWD59kcH3WtjyYpKTKqfKCAolvKP6nQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c5799251-4c6a-47f7-6817-08df3935d1dd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 23:05:42.8111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swJjD/WJykFWD1cjUNXCpqJ0HPDqTnTBCCW1b+0Uww6wi4LIMfZLtTsKe4qRiCaVVmfUBlf1Ru825VC4UcvkpaQjygh0gKsY/QbxOKl7AhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB904373
X-OriginatorOrg: intel.com

Hi Jinjie,

On 10/30/26 11:36 PM, Jinjie Ruan wrote:
> Busy RMIDs of a monitor domain are normally released by the limbo
> handler once their cache occupancy drops below the threshold. When a
> domain goes offline, its busy RMIDs are released without checking
> occupancy, since the domain is going away and the RMIDs would otherwise
> never return to the free list.
> 
> On the monitor domain offline path, __check_limbo() allocates
> the monitor context that an occupancy check needs before it scans
> the busy RMIDs, but without using it, and returns early when that
> allocation fails. Then the caller destroys the domain's monitoring state,
> including the bitmap that records which RMIDs are busy, so nothing can
> clear those bits afterwards and the busy counts never reach zero. Those
> RMIDs never return to the free list and, where the RMID depends on
> the CLOSID, the dirty count of their CLOSID never decreases. The allocation
> can also wait for a monitor to become free, which stalls the CPU offline
> path on a context that is not going to be used.
> 
> Only MPAM systems are affected. An architecture that can always read an
> RMID allocates nothing for the monitor context, so the allocation can
> neither fail nor wait there.
> 
> Move the release of busy RMIDs into a separate function that does
> not take a monitor context and leave the occupancy check to
> __check_limbo().

Same comment as v2: could you please adjust the line wraps to not jump around
as much? 

> Fixes: e557999f80a5 ("x86/resctrl: Allow arch to allocate memory needed in resctrl_arch_rmid_read()")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: <stable@vger.kernel.org> # 7.1.x
> ---

Thank you.

With changelog line wrap change:
| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

