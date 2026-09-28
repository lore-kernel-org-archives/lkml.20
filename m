Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4CC48CD50
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632020; cv=fail; b=YJSPtW4zOC3l61Vo4VL3Raidsu29kilyuGriBb71VwfR2KeMlEyWZ2/g6ylVM4W0sGWDQJTrnnk1K5D/KJop7lAh92PFbvBybHHxTJw2DJhCAezsFx4s7RnLXwcRP7Ynq+QEBGqxQDVR6Tp6LiJIx5pIXbhQUC2/nDAngcwBSJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632020; c=relaxed/simple;
	bh=vI5M6eV5wtz9w9025L2Uor8VPSKstln0W3emLrkGxIk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HwFoUripXcioP9nMeeIqWFziXPj2JtNsdR3YW4IhosNTRb+eve/I049B9pqzrmz2jvUcY6DmYfNoMM06126O5CEicJceO/wUGU/EB5b+cTwxS7Tb7mztvhjyOTTs1j4gdB6DemPRrl1MiN5kELAClxp1Zvx7Ryc40rmMbKZqveQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7apyqMX; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7apyqMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790632017; x=1822168017;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vI5M6eV5wtz9w9025L2Uor8VPSKstln0W3emLrkGxIk=;
  b=h7apyqMX8ZMt3JpT+nY/gFXZpgQWVaCVsOy/xzQHuFCIF7i+By6INqYk
   8JDELzUOScWk1DwGYtu5TBBl/fv6oD91rtj9WSuXLNjxQwNQSQFGGt+Pb
   +lZ6pZlPaJBdSiG6cuByDrXUu0L/DKLH2FufC5/BDwN2K5x4DhCzPNHN1
   xWuuTzxo/erA0GwS9/j916hVvnuzqcLSxjSGdfyxgHXmAVVrdb2h0kOQF
   68pmw/VLXUcWuyuX3CTapBKQD0p9WfsBXYonHWkIna0mLOoX/pxje4XN4
   lBoH/QQOIHgs5rG8UlaPlmLsgsl/MjlWiRhKSF+AKPZFf58XPG2wOtoI9
   w==;
X-CSE-ConnectionGUID: pKa0d0N8T4SLWh+dIluUxg==
X-CSE-MsgGUID: qJd+Py3fSU+QkNex9kjkfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90243704"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90243704"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:46:46 -0700
X-CSE-ConnectionGUID: xYgyr6xkQMONnA28cP6yyw==
X-CSE-MsgGUID: utz7kZcmSoye+fG+hHf8uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="278986338"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:46:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 14:46:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 14:46:43 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 14:46:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAfFZ9Dg4JmPwzsI1a80BhlZRs9Ij3PXdePMr2JL2V49J8ErAXyFFgTaDzYwrBgosEXZYeHkHeZVIll63jveX630vK7bCkf13hF8tmHVdtJnP5tyvyedgHgF1q1FwoxmZWbTBjAFFp0pHeqUv2TJT+tZNWreWH9bKJHkuDA4L6kaOjBX5+PAa1EIW+lJpezx++nT/5aODG9hTDsIrqZA4BYsLYrUwNRLMxi8IoABhVt1v6C2t3KOI+UoCjyCzulg6sK9YJXrKLuf2UMUif4b5w7dgOTX2gMB6WwFP0S9spyImEGulwCT7PgaVAR1aB6DgwidUCDT5jYbo9lhe2sVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaL44vtD6EYlnCiVgwy7vGdu+Y9AZDMngChemHkPJAk=;
 b=TJFLG+vq8f3NiUtE2yOCC8ETM4EW9M/c5GQtzelCbV2lZ8enJ7I55rs++cY/nUqkzsn6NlDQdMYE1+R0ueMGU/+sByk0aaf5Gi5FMZAHzx/MlPp6yi+kWkXjY8Des0GkEDPWIrkrjn3hfN6etjJSrsiq23uS5lItvVHR0hwB1FJZuL6OqhpB8lu16lTN3KoIuH0YLAjEjyI5c41pLZmdrPhZ7EO63U0nD+cyxop+Qe5ED0hBMe8g8cQzrbbbHIGktfjT0x1TEaVHW660LVLN8X2YeBMUymNjJSVaddR/nEYNHmyfnAQbofkvxd0XIsTrvtWy3LY/Xcj1XFHmxqLNRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DSWPR11MB9797.namprd11.prod.outlook.com (2603:10b6:8:3c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 21:46:34 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 21:46:34 +0000
Message-ID: <fcab8cf3-b5d6-4d67-86d6-b8d9f9092fbf@intel.com>
Date: Mon, 28 Sep 2026 14:46:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/9] x86/resctrl: Parse ACPI CMRC table
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, Hongyu Ning
	<hongyu.ning@linux.intel.com>
References: <cover.1789705667.git.yu.c.chen@intel.com>
 <51bf1ffbd3a6efe53dc457f32b0863cc6aff0e3f.1789705667.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <51bf1ffbd3a6efe53dc457f32b0863cc6aff0e3f.1789705667.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0202.namprd04.prod.outlook.com
 (2603:10b6:303:86::27) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DSWPR11MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: b9e990d9-80c1-498f-dd6b-08df1da9f725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|4143699003|56012099006|11063799006|10067099003|5023799004|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: dc/Pq71UsjYPy4TJF7tki/A4LM93h/RmTOAiB1JZAsZsKly0tGBCMcHJc7IoRfONDaS5YYOmNjWrJ8duKv/TXCnptL9TGajqWApEWIAltvWUTF1ZAi/r2Tc+HH9DvYrxvj2r8BwXOXm8jRSEyDgXHovuZP7xfznFUQJJbhquz7oCjTYbcJQuwunmc2lOaoF+O2R5RztzWPfVLJr1L8GEXugeL1RUkvw5QHKHCiOtedMG2ae0qRQtrolfQvpPmL7hlxmJIg8Px81kmy6S5b6eEI5A3lnU4N/T7gGShkWsZKVz3Z7RvyAdSSMFm4DcsKjlnOLDxmATLF2K9nTLxikx9PV5HZ8UEorHnabf3mzmt3yf0uFHwNaik+fClLY30q8Ix4UZPkpA754xd+iUmB4N+hXP1V1XmEnPmlQdB9gwEc66exPqB3TKA1sx0jvLTMY0PitDQCNzJrXSGJ2w+pILHs6UmBxrLec4/ccioxeDuIwwcjNxICEuoHhwdsO74fJw0g5gQAow8NynWjZQxWKjztbQwF/yFAkChcDEIGORrficvavGWIXOrwHSd3hSZLQM4U473qIWW3Vmj6kBgVHAKCC7YsY3nfTOUi3kp5EXwmowKEWM/MKWWyPGa82GtN6MF8XDs+ZznGGS75OkurImS6Tm2BKEBNFTBSWVLqCeWcw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(4143699003)(56012099006)(11063799006)(10067099003)(5023799004)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUx4MnNITC8wK293c1BJU21uOFlMN3ZxNGFTVmVNT29Zdlg0UGswa3FwRWEy?=
 =?utf-8?B?ZlI5SUxYYng5UENOTFlFaU00dXAwa1R1eVJkRDV6NXlMSFJETmx1YXlYZWRW?=
 =?utf-8?B?ZW9JN21DS3pNVDB0QnNCb05VTFQzTWFLQkRqeEw1Z0gwWWtDc0pwMzBYRndX?=
 =?utf-8?B?bC9tL2pPMzV0Rno3Vlg4TktHU2dsSXoxYlJmRHQzVUZSR3lyZlVWcFhhZ29D?=
 =?utf-8?B?TWtWckx1VFF0ckQyMFBkZ3ZxWkVuaUw4bFJzZGFoQ2h1MFYwcWFUNjJSOGFU?=
 =?utf-8?B?TWNQSDhweWJuN21LY3RjNVhVRm9UMlRSclljT3piWHRKZ2ZEVThndFIrZEdn?=
 =?utf-8?B?MDAvaWRsTk0wZEN5SklTbThTc2QxSFgxOE0rbXBEQTJwYXZzMzBJTVArRjBX?=
 =?utf-8?B?UFZNVmVYVVZRUUl3WG9vWTRsVTNPSWFRVy84TWVzUmV1NjNyc2YvU3F2aGtx?=
 =?utf-8?B?SzNqSHNwWnk2MFREa2NpaWRmWWFOUmZ4eWlaZm94WEh4b0thMDB5QTBrOURZ?=
 =?utf-8?B?Sk1mM2pGeG9rOUhlY0xpdkxURVVkVkd6Q08rOElBSFl3cWpIcU1FTmd4T1gw?=
 =?utf-8?B?dyt5WDJKTWdNQWNhMGMwYWFvZm5Zbll0R0FMUVIvNnUxL0dTc3k5LzMyVnZB?=
 =?utf-8?B?Z0kzYnBwQm82S2tsdVhHZ2QxSDRMcTRPTE8xZmYvendQc1A5MzNTT0xWZ0c5?=
 =?utf-8?B?WGV3VjVGTG5vMjV3Z1lFWVN0ZGRMKzByOUlRa2U4a2JkNlZxNE1UcVk5OHkr?=
 =?utf-8?B?R2VKWFFQanR6OTJ4azhiYnRndlB5NUVZeEdnYTNzYU1kcFZPVFhwM2t5ZWpS?=
 =?utf-8?B?WnczMGsxQjgyT1pqd0NNOWFwU3lES3ZOZjNHM3U0RXNyaWJBYVN0bExEblNK?=
 =?utf-8?B?M1pPY3UvZWQxWERBYXJDWVZGYkYzL250L0pkZHhmOWZ6OEJ2a2dXbmQvV0Fs?=
 =?utf-8?B?UFNVMlJqWHB3NzhMcEZpd1N0Y0pKRkN4WHUvRk1uUStDUGpFWU9wci93Z0h6?=
 =?utf-8?B?NFI0WWRqUDdsZk4zREZNeGhya3hpUy95clJadmdrbUN2Mk4wR1prSkhyRDhr?=
 =?utf-8?B?aEJDdDBtRU9OR2Y0YjRHa2JsVE9BZnFKczVxYkwvV2F4cFB3dk8vdXMzRXp6?=
 =?utf-8?B?UUthWFVOK2FEUDJLdkZUK0dHZUkrMUgwTDVTSElYRkhKY0xRNUwwYkliOTlZ?=
 =?utf-8?B?Q3RUTFBxblRjQUszczFsRGRGVlVNRFVadjFrT1N6M3BnWGh3cTgvUTFteVRJ?=
 =?utf-8?B?c2FWbWxxaWY1cDluenFyM2F4SkxtUjVXOUhxMEFPNXlkUkxDcVFJYnZxZzN6?=
 =?utf-8?B?eWhTLzdXejByd25TTWNYSmxCZEx3ZGFvNGNyTXdleCtHT1VrTDdKQkFDUEhv?=
 =?utf-8?B?SHJ5TW9PTGtSV2pobXdFUUt4SnRHZE5LV004cmNTVUVCakFFWVhNeitmSDBr?=
 =?utf-8?B?ZERJMWpaanVpcmd5OWNYRFlqUThBTWVQb2FXUnZTSVhLRWsxcTZXRzB2ZjBs?=
 =?utf-8?B?UURkby9jbXZmN0FGNkhVejZqTTQvY3ByUllFMjhXcHpPN0FEanpFTGhhWkQv?=
 =?utf-8?B?bWNuS0Z4MEo0Q09IamJFYzVxN01sck9MdkdZNVhmTTk5RmpwZ0gvRGpoaU9m?=
 =?utf-8?B?TDYwTEY4WEZteVdmbEJ5RVRZaTdzRFFZZHM5bzRRMkF0NlR1TVM2cjRyY2U2?=
 =?utf-8?B?T1R3RGlwU0Q2MEFRMlBNZGFCZlhqWXIvL0VDbklDdVZkSGppdnlvTUpuYUY1?=
 =?utf-8?B?akg4SStPdG9vKzNUbjBiR0dwTU9ENE4ra01NZGtkdmJDUXF0WFJGT1kzVXd3?=
 =?utf-8?B?ZkF6ZFR0OEZQU2lpMEZDZ0lHYUU4VVRUUTlETHhYd1gzZ2NqL1liZWY4WURC?=
 =?utf-8?B?NG1YRVczcHQ1aitzbGt4QWo2WTJGYW5aSXpsSXNISnIzMDN5dDhYQXVzTk5I?=
 =?utf-8?B?aDc0bXlldGJvYlJYZ0hlQmlFbEtObEJsRjhEQ3ZLT0JTaGF4bzYweXFGZTNy?=
 =?utf-8?B?eEkrZ1FreXR0N0lPZjArdkp0L2V3aERaV1IzRk01YzBhMy9OeFVkMmdVWTJj?=
 =?utf-8?B?SEZURDlGcks0STBIVDZydCsrcFJ5VjIxajR5WEVWSStnbUFUQUtmRlB3TW5r?=
 =?utf-8?B?VXQ0WUtHMk1wcm5vUGJKcVE3cEVlbFJYTmM4aUpvZ0JmYitXVmRKTlJ6OFha?=
 =?utf-8?B?K1Q3dnB3U1NlUTVaOS9VMWhHT3hKdGdYYktYamdjSFRsYjdYOWlJK3NlbVdT?=
 =?utf-8?B?VVByNnRxbnJjTjdJVmlzSGcveVgzamxxZVJYb0JRR1cxWmNBRU1YbzVGTk1j?=
 =?utf-8?B?R2l1cG5BWHhveWhxcGZ3R2V1WUxDMVE5R0NZRDh1bFNUMVNZUnVFam1ST2h0?=
 =?utf-8?Q?0OX3L9Pt9rv42CXE=3D?=
X-Exchange-RoutingPolicyChecked: sa0YbtB0u1LtuqmsbBjOFnV5plWBZPA204/WCXb/3Mj9JGnDyxLXUDXCEQeQ2XaFgtwwIPgg9j5lHNVUhBMFzQJpnOR3eiweLOISzOcSgwxlU9R7W+CGNTGEpLj8d3KSzEmUJ8+2NzB9lQ/BvanmaOzSZA10ZAYuCMSAu72sC9bB4r6c3bsxD+sY9xexciOJcTaEnjT7bI9kUHxIK6oZIBW+wcn63ZE0CVNwxa9sqckRZaFBXmMxppDZ4J67BunfFiljosvoxU8hyxRoCd17pYH14X+wbqoegB8d/OW43ysbv6dd2uOYCS5pjlX3+rqUzM43kJiMn0qUVv+iriQp4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e990d9-80c1-498f-dd6b-08df1da9f725
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 21:46:34.4857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJoG4V9P07VCegQYM0hjTkM5tNLv2FYPQIAX1xLaP6JSH6n+Cg1fYcyZ2olzu83wJnNZptGxZFgnDIIHFiC72oZBmhk6hJmVE/WYJnm0xmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9797
X-OriginatorOrg: intel.com

Hi Chenyu,

On 9/17/26 9:50 PM, Chen Yu wrote:
> diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
> index 8f6edcdcfd87..9a32ed418c33 100644
> --- a/arch/x86/include/asm/resctrl.h
> +++ b/arch/x86/include/asm/resctrl.h
> @@ -49,6 +49,8 @@ DECLARE_STATIC_KEY_FALSE(rdt_enable_key);
>  DECLARE_STATIC_KEY_FALSE(rdt_alloc_enable_key);
>  DECLARE_STATIC_KEY_FALSE(rdt_mon_enable_key);
>  
> +unsigned int erdt_get_scale(void);
> +

Adding this prototype to asm header file seems out of place. One needs to look
at later patches to learn this is because of upcoming use in
resctrl_arch_round_mon_val(). Beyond that, resctrl_arch_round_mon_val() also
later needs erdt_cpu_has() that even more looks like the wrong thing to do
when it comes to the asm header file.

resctrl_arch_round_mon_val() is used in two places, during system initialization
and when user space updates resctrl_rmid_realloc_threshold via a write to
"max_threshold_occupancy". Neither is a hot path requiring this to be inline
code. 

Aiming to keep resctrl_arch_round_mon_val() as an inline function is causing this
ERDT support to be unnecessarily fragmented. Could you please add a preparatory
patch that moves resctrl_arch_round_mon_val() to a c file and add its prototype
to include/linux/resctrl.h? This means that a change to MPAM driver is also needed
that I do not expect objection against. To make this easier it would help to
place the stub among the more stable resctrl_arch_* calls in MPAM driver.

>  static inline bool resctrl_arch_alloc_capable(void)
>  {
>  	return rdt_alloc_capable;
> diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> index 249ba547d7c8..a8a7417c2f82 100644
> --- a/arch/x86/kernel/cpu/resctrl/erdt.c
> +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> @@ -23,6 +23,7 @@ static LIST_HEAD(domain_info_list);
>  static bool erdt_enabled;
>  
>  #define ERDT_VALID_VERSION		1
> +#define CMRC_SUPPORTED_INDEX_FN		1
>  #define RMDD_FLAG_CPU_L3_DOMAIN		BIT(0)
>  
>  /* Bitmask of valid sub-tables found in the first RMDD, used to ensure all RMDDs match. */
> @@ -37,11 +38,26 @@ static u16 first_rmdd_domain_id;
>   */
>  static unsigned int erdt_max_rmid;
>  
> +/*
> + * Used only by the limbo handler to round resctrl_rmid_realloc_threshold.

This implies erdt_scale is used by limbo handler but limbo handler only uses
resctrl_rmid_realloc_threshold directly, no?

> + * resctrl_rmid_realloc_threshold is a single global value, and
> + * resctrl_arch_round_mon_val() takes no domain argument, so a single scale has
> + * to be derived from the per-domain cmrc->up_scale. max() is chosen because the

This does not sound right. Using the fact that a function does not take an argument as
a motivation just makes one wonder why the function cannot just be changed?

"resctrl_rmid_realloc_threshold is a single global value" is accurate and the reason
why it needs to stay that way is because it is exposed to user space as such. That
was done before RDT introduced per domain scaling. If keeping it a global is ok for
ERDT then please highlight this, otherwise resctrl needs an enhancement.

Apart from above it looks like introduction of erdt_scale and erdt_get_scale() would
benefit from a separate commit. The comment above clearly notes its complexity but
there is no mention of it in changelog. 

> + * rounding is a floor: a larger scale yields a slightly lower threshold, i.e. an
> + * RMID has to drop to a slightly lower occupancy before it is reused.
> + */
> +static unsigned int erdt_scale;
> +
>  unsigned int erdt_get_max_rmid(void)
>  {
>  	return erdt_max_rmid;
>  }
>  
> +unsigned int erdt_get_scale(void)
> +{
> +	return erdt_scale;
> +}
> +
>  static void __iomem *erdt_ioremap(resource_size_t base, u32 num_pages, const char *desc)
>  {
>  	void __iomem *addr;
> @@ -71,6 +87,7 @@ static void erdt_iounmap_domain(struct erdt_domain_info *domain)
>  static void cleanup_one_domain(struct erdt_domain_info *d)
>  {
>  	erdt_iounmap_domain(d);
> +	kfree(d->cmrc);
>  	kfree(d);
>  }
>  
> @@ -105,6 +122,49 @@ static __init int cacd_init(struct acpi_subtbl_hdr_16 *subtbl,
>  	return 0;
>  }
>  
> +static __init int cmrc_init(struct acpi_subtbl_hdr_16 *subtbl,
> +			    struct erdt_domain_info *domain_info)

Same comment as for cacd_init().

> +{
> +	struct acpi_erdt_cmrc *cmrc = (struct acpi_erdt_cmrc *)subtbl;
> +
> +	if (cmrc->header.length < sizeof(*cmrc)) {
> +		pr_warn(FW_BUG "Truncated CMRC sub-table\n");
> +		return -EIO;
> +	}
> +
> +	if (cmrc->index_fn != CMRC_SUPPORTED_INDEX_FN) {
> +		pr_info("Unsupported CMRC index function %u\n", cmrc->index_fn);
> +		return -EIO;
> +	}
> +
> +	if (!cmrc->clump_size) {
> +		pr_warn(FW_BUG "CMRC clump_size is zero\n");
> +		return -EIO;
> +	}
> +
> +	/* resctrl scales monitoring values with an unsigned int. */
> +	if (cmrc->up_scale > UINT_MAX) {
> +		pr_warn(FW_BUG "Insane CMRC up_scale value 0x%llx\n", cmrc->up_scale);
> +		return -EIO;
> +	}
> +
> +	domain_info->base[ERDT_MMIO_CMRC_BASE] =
> +		erdt_ioremap(cmrc->cmt_reg_base, cmrc->cmt_reg_size, "CMRC base");
> +	if (!domain_info->base[ERDT_MMIO_CMRC_BASE])
> +		return -EIO;
> +
> +	domain_info->cmrc = kmemdup(cmrc, cmrc->header.length, GFP_KERNEL);
> +	if (!domain_info->cmrc) {
> +		iounmap(domain_info->base[ERDT_MMIO_CMRC_BASE]);
> +		domain_info->base[ERDT_MMIO_CMRC_BASE] = NULL;
> +		return -ENOMEM;
> +	}
> +
> +	erdt_scale = max(erdt_scale, cmrc->up_scale);
> +
> +	return 0;
> +}
> +
>  static inline struct acpi_subtbl_hdr_16 *rmdd_subtbl(struct acpi_erdt_rmdd *rmdd)
>  {
>  	return (void *)rmdd + sizeof(*rmdd);
> @@ -170,6 +230,19 @@ static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
>  
>  			subtbl_mask |= BIT(ACPI_ERDT_TYPE_CACD);
>  			break;
> +		case ACPI_ERDT_TYPE_CMRC:
> +			/*
> +			 * Only one CMRC is supported per domain as there is no
> +			 * method to distinguish different CMRCs within a domain.
> +			 */

Please note how this comment style is different from comment used to describe parsing
of other RMDD sub-tables (before or after "case"). Please stick one style and use it
consistently.

> +			if (subtbl_mask & BIT(ACPI_ERDT_TYPE_CMRC))
> +				break;
> +
> +			if (cmrc_init(subtbl, domain_info))
> +				goto cleanup;
> +
> +			subtbl_mask |= BIT(ACPI_ERDT_TYPE_CMRC);
> +			break;
>  		default:
>  			break;
>  		}
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 2e8fb36ad804..26c3e0c546ad 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -24,10 +24,12 @@
>  /*
>   * Index into erdt_domain_info::base[] for each MMIO region.
>   * @ERDT_MMIO_RMDD_CREG: RMDD control register base address
> + * @ERDT_MMIO_CMRC_BASE: CMRC monitoring register base address
>   */
>  enum erdt_mmio_type {
>  	ERDT_MMIO_RMDD_CREG,
> -	ERDT_MMIO_LAST = ERDT_MMIO_RMDD_CREG
> +	ERDT_MMIO_CMRC_BASE,
> +	ERDT_MMIO_LAST = ERDT_MMIO_CMRC_BASE
>  };
>  
>  #define ERDT_MMIO_NUM_TYPES	(ERDT_MMIO_LAST + 1)
> @@ -35,12 +37,14 @@ enum erdt_mmio_type {
>  /**
>   * struct erdt_domain_info - Per-domain ERDT information
>   * @base:	Array of ioremapped MMIO region base addresses, indexed by ERDT_MMIO_*
> + * @cmrc:	Copy of the ACPI CMRC sub-table for this domain
>   * @cpu_mask:	CPUs belonging to this resource management domain
>   * @dom_id:	L3 cache ID shared by all CPUs in this domain (-1 if unset)
>   * @entry:	Links into the global domain_info_list
>   */
>  struct erdt_domain_info {
>  	void __iomem		*base[ERDT_MMIO_NUM_TYPES];
> +	struct acpi_erdt_cmrc	*cmrc;
>  	struct cpumask		cpu_mask;
>  	int			dom_id;
>  	struct list_head	entry;

Reinette
