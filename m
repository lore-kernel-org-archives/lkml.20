Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9422035C69E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790696593; cv=fail; b=fTIODT7YKzEcv9UhYn4791TVgwxQm0XwPvVF9uLB7mXCwpOFZ6Mrj4vJZqXIkvMuCCovkigvT3bmzegLH4Y/Sxm4CMj3897SvQuiLVXmwl6yFm6l+WQj40Wd+b87fMUFPjOite3tzUhtoUsg3CvKYe6pzARabXbNl125xS1JOf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790696593; c=relaxed/simple;
	bh=kDImvYvlGkdg7/hDgetRhaAbWqEx61BCTEW7Q/+wg64=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c+FlzcE4wzRP5iQ2Q0zT4sxvKipUlcqyCB7ML3w5hdMt/XUd5dkpY5vATM4PpuuUwrokg1n4xkaP+cuB8bxTQcfD9CmVivoXtOLPKjJRi4Juel+3Us0soemsHNffXHr7NXJH+k2xVk19M8Esc2lq34H4mL/q1vFXUXBN5BkCnCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ouwothsb; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ouwothsb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790696591; x=1822232591;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kDImvYvlGkdg7/hDgetRhaAbWqEx61BCTEW7Q/+wg64=;
  b=Ouwothsb08L48IbhC81j7h+zChWOTHqrzKpp6Q4mbWaYN1Mb1XfTJzP7
   EE/JQmMC8d8nNpCLT9FGquUhv/PH5wqBFhD4+s8QhMEOoE1ZYbC+Rae/m
   H0YpFVm9f5vsO4oVkhYwONukeQfsQjOXAIQu3qhRfKG9u83OIG9n6WY62
   3kSWwrpmcH9QPkDmg1WSfcUQDNh79eLJEBBJ5/UU28od+kttLJtU2d5o5
   hhaLJf8lPRjWdQmULvp1xcN1SD9in2dTkzBI7NE4IjMNkUE1xjfMuc4YC
   bdJybGEZA1RoUnXJW3tDA0A+va1HDLmq0Y/lsEkTYexVuQ4nRP2uxSWlM
   w==;
X-CSE-ConnectionGUID: 0BUEV/a/SNCiFMMXSDPggg==
X-CSE-MsgGUID: a5jrMWdwSgWP5XIFXedEaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="101943947"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="101943947"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 08:43:11 -0700
X-CSE-ConnectionGUID: gCOXwC2dSiqJPglGbGxL8Q==
X-CSE-MsgGUID: zi70PglpSRuPCKr69SmGOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="303371255"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 08:43:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 08:43:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 08:43:10 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 08:43:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdIN7ggVT9wlmztYv4DlJ/YFZVezQCZQYWOOQeXzu/t8AS0/QjuoMpEZdyEOcKkNMHDxaavX+yEpJBmHxZ1IbLP0bRz4LfUv6gUhsZlODAFDUejembDcGcTiiIasUN72LpL2HvIzCXn49480OUsNraxl9zDaUHHC7kDbmPx7zE3aLu3Z/uwYQhMWfqo6Z+tsZc9jBtr/XWjZmMyF9ekWwjh6Y5w2pSxOJkD6WvIvRNTJVxqqajdDH3w2664PT6vnP6F9ITcm7T5ZrKA4TvX9h4+Pak6cGcm9NW+pEgmjW1IkkQWg2sIS0Lq/R9FRsAfnonmKrDR/Qy+XaWayUg6VBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fg8dGBcab0FOhQhLCnrvro3+mgGroA3wFgOZv75bIuE=;
 b=Lx+Z/gxYiA8IHpph2vp4urClDU/jXnCQO/ql6VR+8EX3McOfJxEhQjEE57Xw6j9Dx3neBpUEcbPk8V9su1HMkwAmeqiLLnb0VFaqJyvkQRKp/gGUO7bK1odNBufBZ9xaSI4tOEDP9Ap9ginjV8x6mRzC0QmYoyVYuoIZ4Q78wZK0XoSRm0wgc5ejd8jQVIbs5szr7XOjXbQ0+LbwWHMmJX/Lf6+dpq/XbCdR6bI/KnWgQussgLGazphQ+ooWEi60lmjXtsmVIMENzVmM2UxMMGYRQtyDMmRfKQm2O2aAo6FPPDkgVJ/iN/MEDN2XobZ/YTz0owdn7PPNuChmdsZBIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 15:41:00 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 15:40:59 +0000
Message-ID: <1d3e429d-fcae-4d60-b107-81128e611993@intel.com>
Date: Tue, 29 Sep 2026 08:40:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/9] x86/resctrl: Parse ACPI ERDT table and save CACD
 cpumask for RMDD domains
To: Chen Yu <chen.yu@linux.dev>
CC: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <babu.moger@amd.com>,
	<hongyu.ning@intel.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	Hongyu Ning <hongyu.ning@linux.intel.com>
References: <cover.1789705667.git.yu.c.chen@intel.com>
 <16e1ac77eb48c5433f16c3a7cefcd4217a19007b.1789705667.git.yu.c.chen@intel.com>
 <60ef81bc-fa71-4bce-a6c6-6e3592617800@intel.com>
 <aruTxheNOvbT8b7d@three-body>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <aruTxheNOvbT8b7d@three-body>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:303:16d::14) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d214e8c-3dea-4743-85e1-08df1e400f76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|18002099003|22082099003|6133799003|4143699003|10067099003|260925021311599003|260925021911599003|260925022911599003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: NsYglCrrDa/iSmuTQqvcOOKYNnjqQEKbPDJfCdL+3TtpHTmLF8fhQFvGJeQDXc6+Sd25t9pPtGCqgFnkw7W3zwTof6k5MBHB7ttbnS6e5t5lwObJqVQ1QGtL94xweh7Fhj1lsNm4xEbaR5wdC6PoXQ9fDRyMicoMpKIxW6qSnq6MydQ9wMNPWDvw8zWlBxMWgIcKbQs8WIdh4EZ6ysM1BYvGVr+t6GKPzcPHUtQnQ7lGh8oIAf7u7zM+a3DeHuMYNDGoQC87Efr+okJLtqrI8qx8NX85GA+HoN+aaEhX1zZfuxLtIHQhwYGyRD4xOSykMDJrgMWsPkj0N7jjpew0U6GDycFEstCJjOgCbGnRXYLExoZMaVhsX64/VAWf9/hONM8wUwuYYFMmn5npjvqRIQJAN0SheQAwHFH7W+gdKrWEWb5nG/Q+1LHG1HMgDsspWNZOsi0htx0kC/IzxUs+eTJfEQ4ahs44h4hCnVbRLrSyyWnShr1xPtG+y56eN5jnfkPSUUdE+pDL/fqWOzji9sEeOXC9+4M0kmIG2u1JKe+9/WoWkBfljGhmRbfZA91U+z8VC6Ipiok0r07v3y/jywKiCa3rFRsDpXZ0npXPaxY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(6133799003)(4143699003)(10067099003)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlJMQmVwaFFPbFBnYUs1b0RWSWZBWlFPVjdTV21Na3BZTWo2QVVLZm5PZ2JW?=
 =?utf-8?B?ekxvbFhvWWdIOEVZdWxGQzEyY2lhVWdJcjQ2RnZPZnUydndYa0c4NmcvS0hS?=
 =?utf-8?B?TlhOU1FENUNZSWJUVk85V0NPa3pBRUlsT2Rmc0owRlFCcmphRFh0NVdsY3lX?=
 =?utf-8?B?Z1gyTmN5UFlsMzEvRUdTTXZGckZ6RXJzT0RwcHBwQ0w3U0pQUTMwVFJSeVZn?=
 =?utf-8?B?Y3JXWE56WUhlYWJoODVOUDdLNlVNbktaRldVa1FKUlR0K3RFaWVzdnFHMk84?=
 =?utf-8?B?TmdNZW5KQVk3OW5PRFJDYnV2K3oxVlA1SjZKWlYwSmFxbURTKzVzbGVLaDRr?=
 =?utf-8?B?ZDdwbGprVGlTUlNJM0l1RXMyUlhhOU5zWGFLb1JIa045WHM5Nk14TFlNRDEy?=
 =?utf-8?B?aXBkcDFrRlRUVDlJbHJiWStiWThqNm0wZ3RuSDZPYmhlT0grNWV1R3BRZGto?=
 =?utf-8?B?LzRUYk1aU1RZbTllaG5oUXMzdHhOV002VXYzZjM0OE9DL0tHcWU4a2t0NldB?=
 =?utf-8?B?UHBKZnRybmcvR2JnSXZRbzdGT3lqMml1UURUOTlBVmJRQ3JvTURVczIvbXZB?=
 =?utf-8?B?RnpkT0JOWE5DQWx0VXhnU0xrVitCRlpPOHVPSkJ5VTZHUkJBRlh5NVA2Vi8w?=
 =?utf-8?B?VmtQRW9ScFdRb2ovVEoySVFVUmNlWjJENUJsc2RsditFOElSV2huMnVHVk9n?=
 =?utf-8?B?dlhBNVpzQ0pqenVITGRaSXJ2ODRITVB4ZnZHdk13cktuejhaN1JHZDZlV01r?=
 =?utf-8?B?RGl0NUtoN0hWNk1mUFVjMTJFRTZPN3JyWGJCMGo0d2trVnhEVUNUSlh3aCtZ?=
 =?utf-8?B?aTQxRmtHTG1kSnBSKytRL1dwaCszVzA5UGd0Tk50VVVOL3ZhRUcyRm9UZURI?=
 =?utf-8?B?WkJFNzB6ZU5NMFJNTkNHaUE2TzMrTWFXOHo0Y00wRmpFRTQ4MlRwSEM5dTdo?=
 =?utf-8?B?TCt2S01rWndPYm5PTzBncFBkWFBrS0cxeFV6RndKcXFESWxUcCtMK0JCQ2tY?=
 =?utf-8?B?eldpTUxLQi8raENwM2ZxZ0hiVGVoa2duTjZPZ3lCOEl4TXRsbVNpWXRPR0Ft?=
 =?utf-8?B?V1JndjNyNFdUVkpHUGxVcHAzdHV2T3RuY25mam9NS0JXSHI5TU45cFV3Wnhz?=
 =?utf-8?B?ZnFiNWtkOWliSDdDWmprSGJZNkJOd0FndTNiUVJmWmFzTmhDTnpVNjVLNGdl?=
 =?utf-8?B?RDlGSW5RNWZnSmx4Tk5uVXFXd1dyN2Rpa1ZVcFpteE5qbUpORlZQaThUdENR?=
 =?utf-8?B?T3YvMDArY1FDWm9OZEhBTzJpUTg2WHZ0bkFlRlQ2QnNBRldMNDFQbVdVQUhm?=
 =?utf-8?B?T3hON25ZWWJEOG9yZnJMUm0ydzRFMUtLWDVnbnlOYWszV08zN3JldHI3NytO?=
 =?utf-8?B?aWFqTWVnSnF3OE16ZGg3eHVlV0dnUDhUbkoxSUZsb2dFWldlOFRjSEsxaXE3?=
 =?utf-8?B?emNrN25GOElTU0dXd1RRdHNzbjYyM2xHUHpXQmRFN3h5ZG9BVlBCYis1NVc5?=
 =?utf-8?B?ZEdvV092NUV3QVpQdG44azlOVElGTHpOODVXS0d4MEcydGVsWUlMWDcxcnI0?=
 =?utf-8?B?ZnFhZWwvVFhjeVNMUnpLZU9YL0tFbmxJczkvN0daM25qbWhiNUtkeFNHTXFJ?=
 =?utf-8?B?VWNqN2lkQ3JmVmkyVklHK3o0dlI2NkZjblZjTmFZems1dWNwODhaU2svOGht?=
 =?utf-8?B?RC9TaG11dWtWOGlWQzQvN0FHWldlQTJzTklVUkZHYm5TTElaRHp2Q05LU2lK?=
 =?utf-8?B?NVc5Y1MzMitmUHlzYisyYTMxWVlINzdwSWt6YllFQzdXRHdGY2p5QWNud3pz?=
 =?utf-8?B?RStRM0N6UnZYWDVLWnlMSlBQQ201bWtKZnRHeTlQbW1kTG93cVVWYTkrOW1Y?=
 =?utf-8?B?blF2eW1qRWF1a3JpQUlnWVhqQmtRazd3REVTckd1U1gyR3hjUHpXRW5Qd2p6?=
 =?utf-8?B?VWhUdVFiTGd4aVo2VGRINW0vVXpjVjZyWHMxcWtCK2lHazVFanJEZ3o0MTFv?=
 =?utf-8?B?MWFMSkpTejJaM0hNbjl0VjVkSHo5TVM3K0ZKb0hJMEF0KzlBd1ZuL200aGhH?=
 =?utf-8?B?em5NYjBsMnVzRXFKSG9aQUM5WnAyVW5mRWN5WXlBTDdLYnZ0Q3BjMVloUjRO?=
 =?utf-8?B?bWY0NkpkblZxZ1g3ZlZtT3EzSytkYmUwRm1scFA3NGRqbnVZc2UveWp2Z2ZM?=
 =?utf-8?B?YkFiQ3hTb0pscS82SEdjVFlSdzRFR2lNRU9DZkhhbTFkZHZNMENvOE5jV1VB?=
 =?utf-8?B?SVJMQWI5SnZhdUdrK2lTVWZkb3l2RzNnaGZoTWIyUnAxRkFNU0NPWUxNN2g2?=
 =?utf-8?B?SWF4WWlYaTAwNkNNUkVjNC82MWMrVHJ1MVlldWlaRUhxdy9LS0FmVy9yeGxV?=
 =?utf-8?Q?JBxzWxk5ERPAmlrU=3D?=
X-Exchange-RoutingPolicyChecked: dqbsLkNHXvDh4m2ixJciyGGAkEfVuGi0dXO9czPYCYAwOKkCTKK9ZsmO0tzqbGeoPyaR9JI6UzJdcKptCFUuR4sWroBaOdatA7HYiWPj/jWKFJTumoMXfG4/CPfmP5ZHkRqmgVvI64XpkGma91eaoxkvAg+JKeWniGlU970396YvFU6NSHwZfjbptKuwkPxGbKGwkO++ysVj/pfWI6jEMy8vvRtXNikSg4eptx5itbK6WIHDSPvKLZwkPgoQ/8DhtK44AwP+588u515N2AN1REY9gaNBL3c9wtL6OJ9B8FFEv2pXQIom8HnEigZEfW1Pk1sOBJtjmwELMkmLrsB8TA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d214e8c-3dea-4743-85e1-08df1e400f76
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 15:40:59.8443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tDUO6ppkFMYExccy1no7EZDDxIORwgVaeXQK6udk3SXmHHNmmBKknKfgfvUNUqE1xaojgndQp2oloBGpzybbxxXP80/k8QDUalu3MRUMb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
X-OriginatorOrg: intel.com

Hi Chenyu,

On 9/29/26 3:32 AM, Chen Yu wrote:
> On Mon, Sep 28, 2026 at 02:37:45PM -0700, Reinette Chatre wrote:
>> On 9/17/26 9:49 PM, Chen Yu wrote:


>>
>>   x86/resctrl: Parse ACPI ERDT table and build per-RMD CPU masks
>>
>>   Enhanced RDT (ERDT) exposes per-domain MMIO registers that resctrl needs
>>   in order to read hardware monitoring counters on the upcoming MMIO-based
>>   path. The kernel discovers this hardware through a single per-platform
>>   ERDT ACPI table.
>>
>>   Each Resource Management Domain Description (RMDD) sub-table within the
>>   ERDT table carries the MMIO base of one resource management domain (RMD) and,
>>   when RMDD_FLAG_CPU_L3_DOMAIN is set, identifies the domain as a CPU-scoped
>>   L3 monitoring domain. The set of CPUs in the domain is listed by x2APIC ID
> 
> 
> Maybe remove "monitoring" since RMDD is for a CPU mask, not specific to whether
> the mask is a monitor or control domain.

Sure.

> 
>>   in a nested CPU Agent Collection Description (CACD) sub-table.
>>
>>   Walk the ERDT table's RMDD sub-tables in preparation for attaching each
>>   ERDT domain to a resctrl L3 monitoring domain. For each CPU-based L3 RMDD,
>>   ioremap its control-register region, walk its nested CACD entries,
>>   translate each x2APIC ID to a logical CPU, and record the result on the
>>   ERDT domain's erdt_domain_info. Record the largest RMID that is valid
> 
> I think it is the minimum of the largest RMIDs exposed by each RMD.

This sounds the same to me? Your suggestion is closer to the math and code
while "largest RMID that is valid on every RMD"(*) describes what it actually
means? Having the changelog describe the changes and goals at high level makes
it easier to understand the low level details/code found in the patch.

(*) I just noticed the incorrect use of RMDD vs RMD in my example, highligthing
    that it should not just be copy&pasted.

> 
>>   on every RMDD so a later reader cannot access an RMID that is
>>   unsupported on some domain, and require every RMDD to advertise the
>>   same set of sub-table types so downstream code can rely on a uniform
>>   shape.
>>

...

>>> +			    struct erdt_domain_info *domain_info)
>>> +{
>>> +	struct acpi_erdt_cacd *cacd = (struct acpi_erdt_cacd *)subtbl;
>>> +	unsigned int num_ids;
>>> +	int cpu;
>>> +
>>> +	if (cacd->header.length < struct_size(cacd, X2APICIDS, 1)) {
>>> +		pr_warn(FW_BUG "Invalid x2apicid CACD table\n");
>>> +		return -EIO;
>>> +	}
>>> +
>>> +	num_ids = (cacd->header.length - sizeof(*cacd)) / sizeof(cacd->X2APICIDS[0]);
>>> +
>>> +	for (unsigned int i = 0; i < num_ids; i++) {
>>> +		cpu = topo_lookup_cpuid(cacd->X2APICIDS[i]);
>>> +		if (cpu < 0) {
>>> +			pr_warn(FW_BUG "Unknown x2apicid 0x%x\n", cacd->X2APICIDS[i]);
>>> +			return -EIO;
>>
>> The Sashiko reported issue looks real to me:
>> https://sashiko.dev/#/patchset/cover.1789705667.git.yu.c.chen%40intel.com?part=3
>>
>> Were you able to try the example where system limits the number of processors
>> via maxcpus= and see if ERDT still works?
>>
> 
> Yes, this is a valid case, but maxcpus= should be replaced by nr_cpus=.
> maxcpus= limits the online CPUs during bootup, and after bootup, those
> offline CPUs can still be queried by topo_lookup_cpuid(). While for
> nr_cpus=, those offline CPUs are not in the possible CPU mask, they can
> not be online after bootup, and they can not be found by

ah - thank you for pointing this out.

> topo_lookup_cpuid() either. If there is an inconsistency between the
> possible_cpus_mask and the CPU x2APIC set exposed by CACD, all ERDTs will
> be disabled. This is too strong. Let me skip this CPU if it cannot be found
> in the possible CPU mask.
>  
Reinette

