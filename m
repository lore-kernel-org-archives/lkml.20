Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793819910;
	b=IGzy4sqVCiSYqg9AkoSKL76WCXmhU9DB1JAjLTkVNnJivmZ8dATWrF+mx1zg1U6XwmOr
	 W1WHpJZ2AF1XJaZGxZlQtaZxLS58RPNYsQH4Zhq5rMCygzJUybGnhu+8fVSHqyIYrZVcI
	 JmDmFrymb9NP0H4qw/IjSDmkrbNwvdqfWUFKhuaI3djdAmtJpLxc96wobOG71XeTH8hel
	 wWGHsmyjq6+mBAUZiptku1oomjHFJkmvOdig8XMP4gitguVMJmRitap25ytBxpP+QGsAF
	 ruXRTbW+SC5uN+2KmvO2bLv/i6WCLhgrwWvBBFqshEJhQEl4z3ui/CuCIrzA/u5hA7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819910;
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
	bh=54wPDs+dOgokfTgULQlEIxJS2uBg54vQbcMPxlFVtK8=;
	b=eHYPEKqoQ/06U3ompCAixYZ377V+4N1zojmGvGIWkAN2k4dfL0txVUPnIxYPgah4tbZ3
	 G/THFm4wWFNkSGCp90LQAys87nGq0T3KyEy8SwD4LN5ZGw8Da9apKydbrXXh1bC8yewBy
	 EaC7+hufTJhydn2mTaPENOLGWrdlMoJLOWtKKIlGSwPPP/eSG5tgDLXdFxufYH2YiUfM1
	 U0GqyFfHIZ0JSdKDbLmL/W9h1wD0Mx4d78jike/wXREG7QFtYPj6ltoxiBTO0xmEKLjEM
	 xyKn23F1WL8lt9vZauD1gO+4aQ/BavKD23mNOr/tyVPWr088EY+grwejpTaNsVUqbGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RweVNlkJ;
	arc=fail smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52172606A84C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52172606A84C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RweVNlkJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793819908; x=1825355908;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=xR30hOjREvF5aKiATqGWI8SWm7H1B8AAcCPnAMj9wrQ=;
  b=RweVNlkJUdfOlL0MaAfFrG/jUB8OWhTLxgG7tvMSfNmnYe7cw708EV3G
   xMAIYM6vbJh6EytfjdW13tiU+IcbNAoqYo6ssynfZYY/nPuO1Ysrnl2av
   oGs0Eup5JQU5XWmPHWzhAPyo/cxfYEuKwbpVinpo2RD12Rv5+y5X0QMOh
   mSYVmmU+cUAxKJc6Dxvm4c/ji8F2B2iUY2I/dwsqyjjGgPQKI82Dc2Ri9
   vPHoxF1fG0z59u6J9n5ORknodk41YAd342hUYESYDPW4iMujoHRPvgEpX
   fJwxMJsMLEmiM49PouVkXX6l3bqVbSd9ZUh3OjRHnbvcXt+RzeZearLXt
   A==;
X-CSE-ConnectionGUID: C38yKZ9+QAy64/Tf2J2piw==
X-CSE-MsgGUID: 5JukGmaESRyLDA3jifyYcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2622775"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2622775"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 11:18:27 -0800
X-CSE-ConnectionGUID: XpEvYKdDTd+vLGoObO0Www==
X-CSE-MsgGUID: Zbx+Y1SYRru/Ffmh8R93vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7137121"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 11:18:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 11:18:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 11:18:25 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 11:18:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oxo7RTRFT2VUdyylRgoY5eXuRABOXo4FHCJHIg9KrtpdbFCQUQbQOSv/+GHmz8jjS0Hp8FAPN8iflIOatyvmRdHMfPvphpV5Zzvwlu+Yp8+yFWFMZfS310QySAK2GBTsBGcraGsPndSOIbKGYV25K0dzqCvKtzuE+2jpn4c8UdHEwRsWSx0e0jmbyCPkZB2euJINE8VLWbpA8MpfiRh4tGfrZa5Vgi5sy+jAjkKkhIn2ho8aUWtjsc+NcdItDZy4NA1i/nW3vA8BwyCZ5ozEqhCj2xRnts58ixLLHzL7POaRQrf0C5wItFjGDtwl70E75PnojgP2FJvQXjyAfWmekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54wPDs+dOgokfTgULQlEIxJS2uBg54vQbcMPxlFVtK8=;
 b=k1s2/aMVwzL3Y/TPmzMAOXGnl3Qb1cj7ATk/IEUPmpiNWGzL0nmPATBnoo3l9vM/GpDNzRGEIJZpLV9zQSRhi0elnd+7bpKPvFcZTrHOzqnsDkp6FnRzmA9XUUudggNx/+FLKA3JogAn/wGWk1xwIV9l6OSfX0bYqaZkZRzT/TPlx9W65GnnbvRUoU4iSMsrOQfR8sRm1hVoeM55rIi9Xz50ojdr1N5fMJpSYE3At1tGJzNJLX0q6XlLJ4Qo7F0HOgbhUnZTQ5/ogGuOfAb4CWb/pxLxoZgONqbs1cQRJZqWhQiR3A8ssZOcFAOWNqzrbIftLziffh0By9Z95DvCNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by CY8PR11MB7687.namprd11.prod.outlook.com (2603:10b6:930:74::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 19:18:17 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 19:18:16 +0000
Message-ID: <0bece210-cd99-4f4c-83cc-c58b59b7ebec@intel.com>
Date: Wed, 4 Nov 2026 11:18:13 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/resctrl: Report why a schemata write failed
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<tglx@kernel.org>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261104102304.703535-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261104102304.703535-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0252.namprd04.prod.outlook.com
 (2603:10b6:303:88::17) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|CY8PR11MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: cc574f18-94c5-44fa-660f-08df3aa860ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|11063799006|56012099006|261021123027099003|261009223027099003|261021121427099003|261026121527099003|261026140227099003|261102123227099003|261028144727099003|261022105027099003|261022075727099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: i4sjHDIWCQzgtKQ53lOuhjBHJSYB4k7Q8Gp2CsQ6c6v99ebixanm7O61DNLuvuo6nFK0jdlF5pBBupI0eNpbzuE2z5KbfcQ2J8n5X2HI+jxVaR7B7P/4MtCsnFAnDKFKDBIPj3Or3Wsx5dlMFiNL35YQVP2aCGlJxMMHhCG1DY0WNnB8FU5oYCGj0KT+kJehNAGgN7bQhRC7nK4Nr3CgLzRtZjB+0IJ+4kLuEkYtZhtiqSODhBkr0pG85zItF5uBiLgWZOsYZV8JAlW4e66VTrkCfZjD/8YwftROI3dTDD91L5evM+A1ph/Ihbjnldx5ZiVXN7PmEpNUj0jHLV5e9Kr3LhOrJANbky7/dNTbP0QoFs7qfAo5KcjQ+4nDbR0Ts8DbpTKIpuIO7yT83p6QQYgGrghLboU7lvPSclljstwd31Omi8lSu+CC1xPr0bF6xo9qrUbfIxZA7CgQlq2+a+8CltbmYtky3mn8j6LSFYy9GF+g/lWSPGDGWWdfeXcCcqoWUPbpYH5v5Myvz5M/ldcT5hwQ9pGZ7Wb3qGDBRaMnwaFN+2ajkbBiu7n2bSWoh+61DJrs+bawwlVyCOkqiKiWquZJHTPzWy72ZBEL2qvtccn5pB1iaPXzBM0GC9vVmrkfRxdhjFWWQsgald4r50HzMQU56d1GvNAVyij5WTs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(261022105027099003)(261022075727099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmR2K05oQXk2VnBLZ1pQZEJZbEFCUk1TaCthNjNUQ0FBOEJHTldoM0svbWVP?=
 =?utf-8?B?Yi92MU5qbzBZL3JGWXpLQ2FqYUN2Yk1pNTcxYWY0LzdFNktCUXhYSndOWVl5?=
 =?utf-8?B?emw2REVHVU44OEI1TGZpSkkrRksza0tiWEJuVHJNZVZaTDk3WEd0UjhVUTd1?=
 =?utf-8?B?RTVqd3ZFby9hYTZTUU1lZUI3aDRuanhuckhMKzl4clNSbWthTEhuM2tkME0x?=
 =?utf-8?B?dEZlOHVTQkdkd3JoQVEwSkVjV2pDaVIzek05TVYzNWszc0l2NHliZ1QzUGNB?=
 =?utf-8?B?U04rTGJ3QW1NcEdxa3B1RVVnOWhTWnhXNkNvMk5tTENraDMxbkxXN09lWStK?=
 =?utf-8?B?dFZVSW9HaElxWWR4WGhCSFdPTGluM3Y2MksrM3NQZ1RzTUw3andjN1Z4WHkx?=
 =?utf-8?B?S0QyUjJQRzdFMVhFM3laTXV3dWY3RXdFSHVGNEs5bzE4cTBYWW0yTW1MeUp1?=
 =?utf-8?B?RExGVmRMSFc1eXNMTXFTLzdyYzRsZlVJL0RQWktIdngxMXE2ZkJUM1M3RmlF?=
 =?utf-8?B?ZW9qVG16aGJaMnJQVUdQK2FEQ1IrM0JybFUrUzZ1THlpZFNBR2FZMGxRNUNN?=
 =?utf-8?B?eWFZNU9aN2pRd0paTlV6WW1CVEFWcnoxbUhzSW02RUhWODFUdjBreStIUEYv?=
 =?utf-8?B?clh0aEE2UnRFczIxTGtsNXhhYnYxcWFZS0NhdXYxWEtkdW5ZcC9XbnJvUTZi?=
 =?utf-8?B?OHBPaUFBNHdXNDBZcHFveFR5SVVHdEtQblhLZ3Y1TG81V21MSHZsaVFtRUZF?=
 =?utf-8?B?NmtNNWsycWtvY2ZpSnJLNkNrSFFzTEpkT0lqa1Y2OXpDdjV3eGRkeXIvRkp5?=
 =?utf-8?B?RUlCUUk2dUgvTkY1NUJzRmhnbWtuMVhuSXpYQks4b0JKRDRiQzRjRHUwWDZ5?=
 =?utf-8?B?NWJ0U2l3WVRiV01mUzF2OVBRRFNKK1pNNzBST1A1UFdYYytOUzZVTWlBdkVl?=
 =?utf-8?B?ZzN0dGE3SUpSU1BQS01ZMW45T0k1RCt1WlhiRUc2M3JISG1FU3dkYWJHTnla?=
 =?utf-8?B?L3JCaUZYVExUU0Vhd2tzMGVSMC9VMno2WDAvdlRqZmtheXZxSEtSbi92cXMw?=
 =?utf-8?B?STlKbnA2WlFGb1FNbDZUbHZFOXl1dG9CanJoaE01alZSTDMxaks1bzR4bWtl?=
 =?utf-8?B?azE4eUtsNEVoWjlDQkw4djBNOGxhUllyQ1IwQ0JtK3BNcitJcmFxdU5tci92?=
 =?utf-8?B?ZW45WVhlK0h1N2ZUeTZ0eUdyRDdTTWxnVjY2M0xiT2RMa296OENLaXhnMG9v?=
 =?utf-8?B?WkdzREVTTkN5M1llOHZvc0tpaFFqTHBWNjF6QStoYWtCc25WMW5kdS9VUWxC?=
 =?utf-8?B?N1hMSDFoc1BHaGlLTkFYN3FQTVRXSVRqb1RRSzNZMlM5TVlsQ0s3VkZ4WGhH?=
 =?utf-8?B?NHdRUTJnbXhZTEp4RVBMTXFBbmJvdHBEak5IakVKUy9xZG5nUEVTN1lROFpj?=
 =?utf-8?B?ekhGRHJKUWFiTDZOSzBucHp6T2JwS2RZZ1BmYk5yNlR3WHNvT29Vc0VKN1gz?=
 =?utf-8?B?cUZoTlVXb0FjNnphVzlTT0ZLWU5GODcrMmp3ZDlINGhXUm1VWDV2YmwvdTdL?=
 =?utf-8?B?MjFWdHhiajR6WFZWUG1jbTJKNTBmZ1J0QUtSZjhHY3psMkliUWtWVXVwbCtU?=
 =?utf-8?B?S2QwVEgvb2kwMFJoL0Z5VElraUxUM3NnL0ZKUFJNL3pLbXdPd1JaTng3ODEv?=
 =?utf-8?B?TEJnbm9uUHhFdHpIdmM5dzRpTzg2c2FRMHYvODJKN1E1K2lGT21qSElyaFBX?=
 =?utf-8?B?SllyOXNmcVJ1V2RhL3ZBRUFDOURjRVBrS2JhRVVqRlRSejhpbDc1WlhWaUpx?=
 =?utf-8?B?dXBFZkJSZlRJOHp2cTRNZUd3NXQ0NUkxd2tXSnVLU2VTclJYSlBIWUx6N1d4?=
 =?utf-8?B?SHAyK1FwN0VvZDRuSEd4aXVvL21VSW5EVWlkMFlLKzhrcU85NkdzYUwyR3Z6?=
 =?utf-8?B?bnkzeCtXMi9xa28wZzFjVFdMSHdDcGJ1UE1maUw5RXJtaERzWmpWeFp4WGh5?=
 =?utf-8?B?eHNudVptZzVqd1IzSHN5K3hGOWpHWlBQTG8wQ2hQb1J1UEtyZVplemlvbkVp?=
 =?utf-8?B?VnNUdHNyL1hhSzVHTmVDQUNVbkZrbXUwL3hHMDJxR0NLNWQ2T2QyYWJjb2Nl?=
 =?utf-8?B?QjFrdVVQb1JoYlJQcjNWajhpRktDSjNTMkFwKzVyL2FuWTUzUnVwNCs3QnJt?=
 =?utf-8?B?YXg4ZzV6K0piVXFCblZoaXVxN0JzT3FSb1BJZkw0dEtnVkRWcTZDNjFKb2lL?=
 =?utf-8?B?WlN5Vi9SSW5ua3YrOXlOTjJJYjFuOW8vcUE1UmNZT2t4cGlZMWhaQThmRUxC?=
 =?utf-8?B?WDVqbnhWdGlhL0EyOU9BTUJURDlVYktHM3BEdUNFSE5MVDE2cTNSWjRmYWdj?=
 =?utf-8?Q?3wXe4KJn+HSxassU=3D?=
X-Exchange-RoutingPolicyChecked: eKocC1U+k3xBVc5HEWKmLn+TDXldbHJPjWiT99X82UBeZMeYUmJzxwMygKeJ/gURvmHFqZMcwnY39np6a96C49ONg+E6LusKgpkEVIgx9L7VgpoJkGYy8dWnNxm1j7TtrSLmerwok138nK6QpxzNA6x4kfdxOoGbIDKEvVuo5ZnRfOMQjWGrFHnunY2hViPlhwBQdWIRn1ZKM9ltsVJCVGEUqXPt49koDfgwl0W1jEq5ndwCD7zB6ikobLM9yODT5bFio0rgZntvNi1bCrBShGIUhvKaB+vXyq7SWsfNN61zp7Q47dQh2oTQZPRQbmLlk9ZSkeu6mOvQg3zdvq30Hg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc574f18-94c5-44fa-660f-08df3aa860ac
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 19:18:16.4725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sn40bSjv6XJSf1MrCfCIrB7rk3PY5JtHNPV4dfGxL8c5JPwSOihh1bGFu1CYr28TG/uKsGo5Omi9SX5VmAb+kPWKfXrPZGxyX5XhMAB7hRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7687
X-OriginatorOrg: intel.com

Hi Jinjie,

On 11/4/26 2:23 AM, Jinjie Ruan wrote:
> rdtgroup_schemata_write() clears last_cmd_status when it takes the group
> lock, and records a message for the input errors it detects. When
> resctrl_arch_update_domains() fails, the function returns the error to
> userspace without recording anything, so last_cmd_status is empty and
> its show function reports "ok".
> 
> resctrl_arch_update_domains() fails when the architecture code cannot
> reach a domain, which on MPAM is a write to an MSC with no online CPU.

How can this happen? Domain lifetime should be connected to the CPUs
associated with it - if the domain has no online CPU then it should be
invisible to resctrl.

The fix is reasonable, the motivation is just unclear to me.

> The error code is the only description of the failure available to an
> administrator, and it never reaches last_cmd_status.
> 
> Record the resource name and the error where rdtgroup_schemata_write()
> discards the return value, so that last_cmd_status reports the failure
> instead of the previous success.
> 
> Only arm64 MPAM systems are affected today; x86's
> resctrl_arch_update_domains() always returns 0.
> 
> Fixes: c377dcfbee80 ("x86/intel_rdt: Add diagnostics when writing the schemata file")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  fs/resctrl/ctrlmondata.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
> index cafebdff70dc..cfb59cbc4135 100644
> --- a/fs/resctrl/ctrlmondata.c
> +++ b/fs/resctrl/ctrlmondata.c
> @@ -367,8 +367,11 @@ ssize_t rdtgroup_schemata_write(struct kernfs_open_file *of,
>  			continue;
>  
>  		ret = resctrl_arch_update_domains(r, rdtgrp->closid);
> -		if (ret)
> +		if (ret) {
> +			rdt_last_cmd_printf("%s: failed to update the domains: %pe\n",
> +					    r->name, ERR_PTR(ret));

Please instead display the schema name (s->name) to user space as that is the name
that the user use to interact with the schemata file. 
Is it necessary to print error code again? This is the same error returned to
user space, no?

I do not know what resctrl fs can claim here about hardware state - could such
a write then partially succeed on MPAM side? If so, best fs can display may be
something like "failed to update all domains". If so, could user space follow this
with a read of schemata file to see which domains failed? User may want to retry
in such scenario ... but back to earlier question, this sounds like a permanent
failure (until CPUs are back online) when attempting to make domain configuration
changes that does not sound right here.

>  			goto out_clear_staged;
> +		}
>  	}
>  
>  	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {

Reinette
