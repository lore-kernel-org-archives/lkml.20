Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792799195;
	b=c3Kqdms9xDNxTQ+liTf/1Gw6rmi8YqGZxASSbtPG1mHzoIXVGb7HlIiyD0o46+yC/tos
	 uD6iZj6UelPQRHgx3SD3Es1HIcfTlvWai5c9409lXcyylftoK+21TLXG9BO2ruXdZdDZ3
	 PPDymrA+JVwHZM2uGv6QKRJLakT7RwffTbJIcSM58kuSWsiJ9vdnj4YvHjHiloTHFCGiA
	 zP1FcN83584s5UuGpqHuf+cuPj0EOSs/BMfiH+xAmTsMTjv6h2UJ0GakR+IH26MhhvP3E
	 GRed0AGu1wCUS9IwpjyfoKt+jX1GYRrb3+R+w7X9ODLplB5Rbe9m9CKmQdWnul9B+jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792799195;
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
	bh=Xrocs3dtLzFMdy1tFI3jq++R502ofeBadw3YcOURk5I=;
	b=j/EKY6xDMDQT0/d/fr5dGZilp4MvCGj5piszWD7Yy00Ug1iYfiPwto6kuahzL+qFNS+t
	 zqtenZ4SXzmQdcJGdnm49jbZHln76GKmX7ZL4rHI7PxYdKSL6qIg5u5uty4r85zZu0ykk
	 vTaZfkos1Yy9rbnsp+xA7IuF18PTUGRVvdj0suchsIQWYFNEvIeLLF/MFPZL6q68Un2Mr
	 yytTFBUnwR8vHrRkLUTU2uxkKPTp+nCiPWqgyvYf1HWtsNhJ6U5p6dtrUbEZ7yWI8nemE
	 Ddh0LIFK3sFlpHya0QGYITfDzwYfkbB3/Tt5kUGx8+SR46rp3lLd/xUSiowvXVN2aBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Re1P87vn;
	arc=fail smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAF9606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AAF9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Re1P87vn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792799194; x=1824335194;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zDPJVoxOiPoLZu1eCDqnLKgDx2hODe0yGFCXR5kuWTQ=;
  b=Re1P87vnFh4bTlsgLZ/rXx/VqeE5EeV3eSYX0dS2YS7DYR/LQy6PTnO4
   7j1QCTHXderMyeZbNUaAOCoU+j97R2sKBiuFyI3MN/Iaq+qEh5zGHoQ3i
   Q8d+CXA6R7GQJkPERCxsnbmsjpfSTJM6+VVXuEYM8bV9ejEtkL90ky9q+
   JIp2ZpUvdKrAxZjwmAEs04ftBYXjQebBBwteCYSfVswE8L+xwcCxZFe97
   ilPDz9zGMHpkcpyFGSOFtbmd7rzBm6ySYMBxncZCZu8uEuKKC7kq4wGTx
   /R10HM4EaR/RSKBDIWm81Dec4VeNIfpTPJLf0YBnnbIAlwR6GLUgHQqis
   A==;
X-CSE-ConnectionGUID: 6Y6qaJ/yQ1u/kaLGUiZhKQ==
X-CSE-MsgGUID: WNSa+26XSa+vKezCGFV5FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1466368"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1466368"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 16:46:33 -0700
X-CSE-ConnectionGUID: qjStXeSgSyu2lMOlIzriKg==
X-CSE-MsgGUID: 11P6IKMnSgqIistAmxPczQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5581924"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 16:46:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:46:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 16:46:31 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:46:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PO4/cTQsiKYtLaDEfUU5rxtjwUbkvN6dAoUchXg5GpdJNu3EdfuQdHzT9EpOoRX50o/E2qOBkmuOOuQkubmTM1RhQAhB8iQjNVu2oA1TvP5h3xNIdj3QFMT23dytQNQpo8UK4vrwreS5ZhGKy1xaQw72JqWh6XpoCnTlR/bCa6kWWEvB6jlnhcVxC4DUeiNqa2TqP2Q/XmOlSxju39GrITPys3HpGn/H5pp11jiL1Vw2wgt8hPanawRgfpS6qhBuu2U8YQvNGXxIn/qxu0RnBXz/utCJULOmcxKztKFQGCiyTsS0QCxScoBAAh2yuoB2wXyY7oiIDFNYIfazXCad6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xrocs3dtLzFMdy1tFI3jq++R502ofeBadw3YcOURk5I=;
 b=QqlnE3FM3rUtmVdBBQGn6jRQF0N+U9buOXvlzWDoI5pElKhgmV5ZhXZn1PqlP4g6U7SE1f3gnTZMN2agAoFl82jhGHynrVpYjfu1nREs6kBlwjEISm9Wvfzg1Md2mhe9Q5sdRkRrYKCOT6JR7n0TGV5NvXjZAcVwSwHIQAnLmByWGhqYpXrZxJcD1e5SUqo0LaoGQ9lebzkE/uW1y0XvYKja8oyNSRB6SlVVNpA5LY7xVhYzAf89L0hVjxvD2oS8vlLtXkW+PnRzoAXHr2FyJUshNdXbRNTVCqwILF3OCLXHAxMHWL2b0eu4Yv5GwnobBmSh3p+7xbM24IJ06XDjMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH7PR11MB5959.namprd11.prod.outlook.com (2603:10b6:510:1e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 23:46:24 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 23:46:24 +0000
Message-ID: <ba18fdf3-0a6b-42ac-befb-3c894965e26c@intel.com>
Date: Fri, 23 Oct 2026 16:46:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/12] x86/resctrl: Require 64-bit x86 for resctrl
 support
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <2d718521cb64f27bb14a377da41121f890f77d43.1791933001.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <2d718521cb64f27bb14a377da41121f890f77d43.1791933001.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:303:b6::22) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH7PR11MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: 9923bf1c-938a-424c-370b-08df315fd906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|10067099003|4143699003|11063799006|56012099006|261021121427099003|261022075727099003|261022105027099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: Ogqfr1Vvr0qauTKDXKDA2axanzG0M2yIXHZ0p82rE3O6rA6Dg4Cutg2tD1YlHNOrd2o9KiwuysHTlv/ZM3eNdegCgiHDSk62KT3xZARwGq/c0y6nXfknbTlNuUDmWGnHPzkvHW0CRyIvNYbIScdw4FFqxpTpNcuxj+egXQmgV3/WjOnIVUpGkEv6ygPnCYW3/4iJPlbZunnRF0mPODENaKmQ3g+s0brDKAw0FYiggCGR4vj0hX+E3GlR7bpfdOA7uXsiwosZxR7yOplBUMq5qlpSZ5NrXOfe53StkMQ//sJbvFgunZTKY7y/aeyJxL3DsTdvqvZTJaGavOPad3MG5LVQzJLhL6RNySm6kVwsxHmj5fakOQ50eq5LeYE7u58ex84uiykypFbbyhJiKOSWzRU3AvmdYVSptKRQHps0pCCofvyABWDVFL4cPv1AhSbKZx0qxUBdsLbUf9MY8T++PIXJ8JU9vEuQHj7EBJTlLQ+dlF/6d8fRAxzdarjwwtLf6+k7uWiBLgj/HZzoLracDgI/WDIsM4QBEau7z4PBShDv/Jzx4lnP0R/JKrDM4E0EPhtDLdbjCQkRtwKdlAT3Cts2XeVZAka9dR5Xpd/0vyZg/y8XjIQ8cMtF1Ilz4W1S
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bi9ockY0d1RCNzNLUS8wQjk3NmkzaEFvQjJFVGJtSVR6dlhRNDA2VDZYcHo1?=
 =?utf-8?B?bkg2dDVyYU9FMjNia0NpcE1SUG1iNUhubXU2YVBQa3Z6aFNnVnhVdEZIWUd1?=
 =?utf-8?B?TlRmelgweWJhd042WjgvZWE5Y2RZYnpweXlnUXdrQUZxLy9seEFyRkFYb01q?=
 =?utf-8?B?bEhwKzB0MmNwcDVKVUk2aVFFc2FaYTg2V3UzOEUrQkF5b044dkZCbFNTZWVH?=
 =?utf-8?B?cmYxVklvWXNBdExkeGUreWVPeVdIdDVvVGFuU1hST2wra2tCdGhqTmo5OTZB?=
 =?utf-8?B?Qk5vVmt0TW1oT3VkY1owV3Z6QjVsTHF3Tml2a1M4OWZ6V1pJNmZuZmVnZVB1?=
 =?utf-8?B?MjJqdkdKZXNLODN6RENKbS9vY3FrSjR0OCtPdmI5RkxGQTlHS0kyQ21DTXlL?=
 =?utf-8?B?UDBnRkt1cDJremsvYnFRR1loeEVaVmdxTitNbjA0N2d6ZjQ1ZWNycEp4ckUw?=
 =?utf-8?B?Qk1TSUVaWldCeThid0tRKzdKdVVSd2dUYisyM0plYzl5NTN5QTF5WFV3UUtI?=
 =?utf-8?B?OGsvOG5yOTBvd0w4NzM3NTRnSkUzbGhtUk92UUVnanFDSHdFVzhJUlpyUk5v?=
 =?utf-8?B?NWFwZDVSVk5ocHVOaXlTTXpPME9HRVFBUldMbG5ERVJmTUZlNXlzOXVYQzZ1?=
 =?utf-8?B?RDNLeXFvVVVRdTUvYytBZHRjWlMzTHhLVHc0RVMvM3labXk4SEhqamVXQUd5?=
 =?utf-8?B?S2ozQitNdW5VZUZYbTBzUnRwN08wS2dqS25pS0dFdVNpaFM2enNaRTN1U2sz?=
 =?utf-8?B?NjFEUG9Zdnlua2R3cjIxaUc1dnJHemwycE1TTFdES0ZoVTFNeXRqeitVZ2dx?=
 =?utf-8?B?aG5WV01ISXdRWXhQd2J3UnJEeGdFeXRPcGlvL0hETno3MXVjZXRscWREL2hl?=
 =?utf-8?B?S1hWMkt4Vyt5clpBeE9NWEpOZ0dTdnhGNG5VYUcxd3IrL2VYcVZYdDVkYXM3?=
 =?utf-8?B?NzYveTZHKzdTRk1TSjcwUEZiNXFaQmxmQXloanBNZ0pPR3F6ZElyL09YaGZW?=
 =?utf-8?B?bVc0MXR5aGZRWUVpSjFtZTlxUU5JNTVHa1RNbFRpTWVPZWZjYkpGU2t0L2Fz?=
 =?utf-8?B?K0J0c2V0Q3RUc00rUURqQTJWbjJuK3ZkQ1BVa0lQV0ZHeEd3QUtYc2tzcGJP?=
 =?utf-8?B?RDJtYkZzVlNTbkUwRGhXT0xsTjgwQlVocnVNVVFwT0x6amJSNDZDMmhmRk9W?=
 =?utf-8?B?K1hjL3luaW1lVUVIRG1xbW5yazV0MUdkK2dSMlFUTndLWUQvdkFmMVhiOTB0?=
 =?utf-8?B?NTB2VkNPZWwwdDA4L0hPWnVYZEJPWDJNV2NjTFQyc29BdmtWaXVlSFp5d0NY?=
 =?utf-8?B?cWIvSXNYdlgrSm9kQjFqZnEyaEZWQ3EzQ2dwZDNzbVVjY09jTFJmNHNCYXBT?=
 =?utf-8?B?amdaNVErcWNjajg3MVFMQjZQYnhZTmFHWjFMaVcrSnpCcHpxdkprU2gwN3pG?=
 =?utf-8?B?SC80UU1GU2loVC9mMFlyZWlBN0dqZ1lwZ0Y0MjQ5MHJyUUZCUjQ3U25Vc3Na?=
 =?utf-8?B?aEc2ekRTTnMxSllOcFRkWk94VkhLbWpCazgzWUdLMUlXaTR3ZDY2eEJYanpT?=
 =?utf-8?B?TTdUMFRsdkY2a1FteTduczJvM25yRUJSeDdranhpczE0TlBubElDcE45K2ZX?=
 =?utf-8?B?WVNkZ0lNN08vVnpYSFZMZ0xETVpiZjBmYUljVmpWa1Bkem1CZDVMZ05Xd0lo?=
 =?utf-8?B?KzQrSkxvTEdvaEY2SmdTMkdQSXF5dFNNOTdQUUY3UGFPd1ZvRnZRWlREb3Q4?=
 =?utf-8?B?T2pFNnJJVmRlcmZiRkFKeXBKUWhDaTV1bDBpelVUZFVJZTBJdFV5K3hRcU11?=
 =?utf-8?B?eHFveGsxRzFJdEhHTWRSb2tJcDllMHdPR0JrRlRrOTBhNDVxWFg4UGs5Y3N2?=
 =?utf-8?B?U1FRNE9pK3FMbzRRWkZuc3VLaWZuSXFSNnVKaXEvREhoWFhzRzYxeWJOQmU0?=
 =?utf-8?B?TUVmVy94dFAzK3VIM1p2bzVDaW0zZXJNejdIdDUzTU03NXVLd2tEV1dGMExu?=
 =?utf-8?B?NkczbUZRay9aS1FaL01NN3EyeXpQeDBnaVhldUlJcndYK2lORk41MWkxYUJt?=
 =?utf-8?B?bVVTdnIrbXQ0RVhaeFRHTnBCOTRHMlB5SGhPY0hVaU1kOC9MQlg4MWRVRW0y?=
 =?utf-8?B?cmR0R1NVNDNicS9tRTNuckFlajk4amplSk41anduSTVvUmZsNjVQbWtHV3dY?=
 =?utf-8?B?MVFnVnJ3S2wxRkZWM1hVQ2JWMmZJZ2ZYakRWNThQT0d4aW4yUldBOHBhaWtt?=
 =?utf-8?B?Wng5T2RMMWJGd3lFY1JNeEthSlZjSGNzdERTQzg2WndPdTVuWlRzNmRwM3Aw?=
 =?utf-8?B?cTBGa0M2ZXVWYUFSRXBRZDhZdmZvK0t4WGlDM2lFc3QwclEzM2JNb3NxdWZz?=
 =?utf-8?Q?KtFcatD9CimnOQPE=3D?=
X-Exchange-RoutingPolicyChecked: PbMsu8cPnTttucmkSo1dIeVXAHTJkrTaOqNS1nFedjxtgS62/jhi/v64xDxun/DBFSrkutFOKvijIwawMNQCGERJY893AnFumgy7uUR/EjJ56wl+dYNef6+9GYvUsQ5ZrQtkrlfR0egTq1I2+Li+kt5R+Wcr1OXYMAY7JRx/atSLY2LBsDRajXgiDw/Ie/B7hdwLyptXcM2kc3v9tVawKptbUwZCye1OEjHP17ncZ3xv3EveGmcGmN7ySuf4QGkPf4NtLzzq9AC7VPgohT0R26pcF9ErmyfKHQflK2CjArKHEtbktU4AtzE/emduBcUmriRiu+iK1IuxiTIoPUUcPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9923bf1c-938a-424c-370b-08df315fd906
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 23:46:24.3735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBgYXJMFIDeLuGqotT32MSzPTxq4GHtiQTUSmW7cWsAsLkMY+EG0kg3ziD+8EAFsF1EKjxjp0RtX93LRV0+AsoVFi+K9jkzuMBE+i+PKH2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5959
X-OriginatorOrg: intel.com

Hi Chenyu,

On 10/13/26 7:58 PM, Chen Yu wrote:
> From: Tony Luck <tony.luck@intel.com>
> 
> Intel Application Energy Telemetry (AET) provides event counts in 64-bit
> registers in MMIO space. For accurate results these should be read with a
> single 64-bit load operation from the CPU.
> 
> In preparation for the removal of the separate CONFIG_X86_CPU_RESCTRL_INTEL_AET
> configuration option, move the X86_64 dependency to X86_CPU_RESCTRL.
> 
> This is in line with Dave Hansen's proposal[1] for an addition to Linux
> documentation that details reduced 32-bit x86 support.
> 
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Link: https://lore.kernel.org/all/c6ab0c24-8931-4f0d-9be6-23498ab4c38b@intel.com/ # [1]
> ---
> Changes since v8:
> - Pick up the latest version of this patch from the AET series so that
>   both series carry identical versions. Changelog wording only, no code

Please do continue to keep a note in patch changelog explaining that this is
picked from the AET work to help explain why the changelog is unrelated to rest of
the series.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
