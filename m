Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623474BEE24;
	Fri, 11 Sep 2026 22:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789165553; cv=fail; b=VPSYKYZdrEaxjwmCL4VfAXvcxuRBGQmcuqqL+R2Gg23Gv/9nKkkgiEa1Tbqn5CH6soEzxMUf5CsxH8j2GEmkZtimN6gwhxT1EDPHE3bDDlV9Y4YOawSTIkBS9OiLy7D1MtNXGkBB+Yot90TmxIRtO0DxWvICXgYLsvdJWstDw9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789165553; c=relaxed/simple;
	bh=dBAGpmfuFCBWPtod7CMvk8NW04Y+q+/uwkaD+JIqJVg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YSA2eMaraNEtbxuRSlWzPsPtUxNjuKebj4+f23yKPqoqITBlMKTxMArTRu2sZM4nwaax+sfCneP0qdQEdrtakvYlesCfsEPMQrEmlqZQ0bgFljatLBq3Ko4tidnQPaltPjuP/rGg9swg1zHgjPXL+FScTm55bN3EyiHLBoQCOkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dgu8Ujf7; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dgu8Ujf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789165544; x=1820701544;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dBAGpmfuFCBWPtod7CMvk8NW04Y+q+/uwkaD+JIqJVg=;
  b=Dgu8Ujf7xeEk3zGgByHNbKUWHAsKKewmPeg86iQTbBgSt4nmlAm8B+wX
   Gvix21CVVs+zhxQWd1vGnFu0bGCWw2ZnkQhIE8vEVwkFxoaiDkXjPqjzU
   KdkU891x7zBUFCuAVq7PEyxZzrU+JTphWOyQ/CQ8sC2U8wufaQgYa8dZm
   W0ygF09Y4GeiGidkH0jjwX6FgKSx6eUygJgKd87P2lBvGeE2wzfyhZl14
   aQ/Mstj5Y8cDLwcADbDnsDEVY6GvIEafahRCeNNmEn3X7YgWNl3qdV0oQ
   L9vbk8kJLVFvhTJxeay8GJqSmrfT0QsxgyE1DShJdlSylB7sRkGtBkNog
   w==;
X-CSE-ConnectionGUID: 0BmVQiIVRCaN+vdMP7umvg==
X-CSE-MsgGUID: sA4c34Y/SoeRYb3vQfSwpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="100294874"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="100294874"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 15:25:39 -0700
X-CSE-ConnectionGUID: jMG80FOZT1Cqv46N2XFWqw==
X-CSE-MsgGUID: NJZX/9rmRuC3+RmKWwz2HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="278710"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 15:25:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 15:25:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 15:25:38 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 15:25:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETkhF7BR0jHfKii65xyFQL2ZFNx4I8i1PNJrBgIb6zId3b77zFXD8mkbJ0N20MTLlAlbm9iQHfDv6k9lt5nvH+N3Ph+HYBCVzMG7233wicDaTng47OKSk4orLPmRSa8DPYYCtpiDhAVKVH/XlEve1LNroKrrLnL/mTnffPzQpw3JULG96eyzZNzaQ8vxai2+zzhJLdaqSBa1qnvDYvUXu059OFIXMeto932VO17ZZhpnkp0UL2icbvU1/KKqUf1URkPnuvpcKHLgnCI27C9xevUO1eg5lClv069uNwrsvAg/xn9JhlYP7B1SOjfIq+KV0td0JgNf0dQ1B9iSc1nQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlArKxFlAsxPxwkS3jOX7SVB++EqloxkPD/dwOZK158=;
 b=JOxrm2vh05UnDIIrJ/P2Ff+8Z4rjvmxXW/T72nOJu/Pn1UVNY9GcmAoIuro2Z2OO6DuLYazGiHgtRsOQBF/Qvs7vcGKJCuzQXQXcPjVL/eK0SMWLgE4AxjMNuK7C9vaVBw4z/c1gr2s1eDf3R9fe0n7IjlBPYUOiTkd+HqZrAQq0o/u0gP9OeJq83SDgkFxfiEQBgGno6rUmNJy53QhOoIiSDKgS39dvS8z58T4vzatK9+cF4pLWzcj0lVkUJqGuV8g4CpQmCUzx3h9UUM0i8ksePUMlwdRrtSIXnPZRtzZWCmgUH77/We9ZnhPXkmMmnpp/jrPfLTrW4FGnCOoKyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA1PR11MB6568.namprd11.prod.outlook.com (2603:10b6:806:253::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Fri, 11 Sep
 2026 22:25:22 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 22:25:22 +0000
Message-ID: <69044bcb-e606-4f7c-be83-2188169ddb51@intel.com>
Date: Fri, 11 Sep 2026 15:25:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/resctrl: Keep mbm_assign_mode in default mode
 at boot
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>, <bp@alien8.de>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <cover.1788545152.git.babu.moger@amd.com>
 <176d53626058ae97c4003f77ff47371628da9f1f.1788545152.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <176d53626058ae97c4003f77ff47371628da9f1f.1788545152.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0111.namprd03.prod.outlook.com
 (2603:10b6:303:b7::26) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA1PR11MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f6bb977-4eab-4732-5350-08df105391c4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|23010399003|366016|376014|18002099003|6133799003|5023799004|56012099006|11063799006|4143699003|10067099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: FPPxdoySjQgEfRxLJdgXJC7ys1rauZ09vldyZyIMCc9R33ekDrkpDVqJJoDIgvyfLyfFRm46R4271og8LTPmemdl7o4s3+VmKUSYEkVpHkPvHIpIaVEMYKtWiqWnZdR5aju8rF+RBwxHvL5T583d7IvXp2wx7RRG2RfnPeXmx1PH3DNqnnoplA2KbcP+Bl1pqoQMXRji9laOvPx+lHatGxLDs/tAg1do5U1rDV9BImbqnsuqUN3c6VMWIj2C9+fzunva4pv+hKsTThZ2r8ALpstSC083a0bhX+XFovFZwpMHIzPHukq+gtEtIsSmmK6mCugGOeCdDlptaqOkdashIwMdLiuyPdyp1/J3AiWyx4QsPIM+KE8apIb4fgGcFyBT6igJ5ifeilWl5xhIIoWskQMxIlaorPToC1P82wthwIoT6Das7rF1GIKfKDo/5h0HDH7eeCdSua59hYtY8/XvYmc8fxHh9A4NWwy+iCHk028DJD22ItJA0K57n4SNWTVCL5t0KtlmEK0RFQzyx8AZBV+TK3xHFwNT6VPOD6nucs8EM5V4srgawhfM+WvRYm473kYfwIWkxtERVB8q3DuiXfHZTthIjy+L9s9Y1hsGwkeFgfA8g10kkcrf2S++JEfMkZxOHpjzx6pRuOeZkk2iam8u3kTfKwTm4nGbEjgFqmM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(366016)(376014)(18002099003)(6133799003)(5023799004)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0R4L3ozaGliS2ZiT0VwMURJWWp6NlpsUlJ5eTBNTllsSGx3b2hQYmFOZ2pn?=
 =?utf-8?B?bGZUd1pBOUd0SkV4MHM2ZGVEU0YydjUyS0h5dHhJNURCRUs1aExjcGtmZHkw?=
 =?utf-8?B?UWx0RkNxS3JRNnNBaSt1b1ZRY1V5Vm5vQXNjV1FHOUpkcnJtRExFV1NISk8y?=
 =?utf-8?B?R3NzWDgzNSt1ekRKUW9hVTJuSGNCR1JLS1FHVlNLQUxhVnYrVks0ZmI2dkR2?=
 =?utf-8?B?ZjJGb3l6OVpOWUVNWDBzRkp0NWdnSkJFUyt1MXJJSXpDcE5aM1FXZjRWY0pG?=
 =?utf-8?B?d3g2WVBDQ2psK29DZ0tSZUxPT3RSYXAxOWxJY3hNM1QxL3h4V0FVelE0Y1Ey?=
 =?utf-8?B?dHVXSTJQQ1p3RkRMZkRYRXord29raUN2UUZVc0pPVTBUV0hUbHNhN3ZwVUhj?=
 =?utf-8?B?VCtTVVd4TXNDOHpWMTJRYzBqYmFlaENELzhZK2FadnZ4VVI5MWJoZzhGVzlY?=
 =?utf-8?B?c0NITEMwN0loSk1JdHZjTEZ4eEVsSzNXNE0zamdzMlM5U2VIb2Y2K21pN2pw?=
 =?utf-8?B?aGwwTzJoZzFZVDRNeVVOTVhUbEkrWHI3b2RSczNWWi84dVRXWWUzblovQUtt?=
 =?utf-8?B?SkNYbXlmdmEyMXhmQlJBV0xmRjdzcGVHS1dONVMyaGhUQ0dGdVd5aFlVV2hL?=
 =?utf-8?B?enhZaWdhOWpDVEFwdmVJRTlyNzhtTWtKK1VRd1RCOGZMOEVwb0hRSDJXdktj?=
 =?utf-8?B?TzdOM1JZeWc3ckI5NWpXbG8yVXYyWnY3OXRpQm1oakNMa2RmNkJGTFpuY2hM?=
 =?utf-8?B?eVhDUlFBWmdKelFhVkdCZ29VY0hIUGJjd0cvVHFDOCtHcW4wSEJiMWFNbFJ1?=
 =?utf-8?B?Zld1dzBDRjU3SEd4cEZPNjd6Q2REUFdINmdGd2UwSTlKdnF1cHNYNkZNWjFD?=
 =?utf-8?B?dHVtQWZrSWhBbXpvMmtyeUZpSGM1QnA0ZndYcDE4TTUxMHc5eml4R2pnM2NY?=
 =?utf-8?B?alU0eThzT09SY3Iya3QybTFmbHBNVEs5b0VMZGlVNkdCTkFpZDRaeStOYXlN?=
 =?utf-8?B?RlhYb2phQjFMVVV3ZXFyVTQyYkFwWmtjY0grVGVkdEFVd3RoYVF0NGZESDF4?=
 =?utf-8?B?WndNRHBTdXJmNGs4NkNFWkdwRXVsTjJieTJIcENJbnMzdGhaWXZndWR4R3NW?=
 =?utf-8?B?QjVOUm5GYzg5d3FlM0t0bHpuL0FFV2dndVBTSUV6L0lhWkhnMVlNWkNNZDlZ?=
 =?utf-8?B?S0hTQityNytKSnFjSjBxbkFSMXZnNWEyc0FmNmR6UEl6SHVScEtvWEdVRkZH?=
 =?utf-8?B?MnFhTXkwUjkxbUhNazRJclRWTHIwSnpjd1Z5bXNjVUNxektCSythaGM2U09a?=
 =?utf-8?B?UFV1ZCt6aFJmblpFV25jZFQ3UUNpUkNLcnRBWncvOENiNmdjaldSd2VrQ0Y3?=
 =?utf-8?B?L3NSdkY2dkNjRUl6RWFmdnJRWVNqcFczaU9YWCtXcSsxOXZqVVRxRzRIWUwr?=
 =?utf-8?B?a1BtcC9LNjR1Mmw3VnVYcy9aSWpIWThsSWhnOWJaSnNBeGxLQXFhUVhTbGRu?=
 =?utf-8?B?ZDlhZVFRQkx2V2Q4c0o0WDhoT0ozalJFbzVhb2ZUeHJpRjVNQkxHMkpnWll5?=
 =?utf-8?B?UDUyMmFqVU9TaHM2Vkw3QVB3MHNNQWllZCtmYUN0RUlKdU5jbStIUDJMS0d6?=
 =?utf-8?B?OEl3a0VLVDVhMjNFbk9ySTFmc2JMRldKMHpKeW1kZFFnNTRXZ0RjTCtYMlcy?=
 =?utf-8?B?TXpCMlRIakl1cUJub2wzNzJDUlZXL1ZmazU3bzRNeXY3S0l1d0dFOXdTSkpm?=
 =?utf-8?B?TGRMME5ra0hUT1MxQmhBZnZyK3JmTWxnOTErOURIeTJZbWkvZ2ttcVh4K1di?=
 =?utf-8?B?ZUNkZW9wSW9JR2Q1VDdpZDVjLzRqN3BHRlhkbWFRM2pQVWd0QlcrdGN4eDZI?=
 =?utf-8?B?cHRZR0ZJWGVxc0xtQUtyeTBTSkZPLzNJTUdENCtwMTVXS0w5SVFtcEVMaDd0?=
 =?utf-8?B?SkxjRVVOa0RWdUZVYzZvK3VCMnV2QnZ5S2VSNURXN1JZZ2tES01WUjQyN0Z6?=
 =?utf-8?B?dkJpZ1FuQ0E1WVhacVZRY1NPbi91MXZDcUNqbzl6bjR3K2F3ckZsMnhXRTRU?=
 =?utf-8?B?RzByajB1VXJkQ05UdXVkNmFVakcrKzQvK2dqeThBb2ZyMmdwQ3RWZDlRMFh5?=
 =?utf-8?B?MjVNcmt0aTdBZkdQc3pDdHFYOHpmTVUyRE5EeFVuRVFvRU1BNjBuL2lEMkN3?=
 =?utf-8?B?bEJQRGp3NENaWE1GbGo1NTN0TXBidUNYYWhsVE4vZlVLdnVUWDFaT1licnRI?=
 =?utf-8?B?dlNWcVNzOWdTREcvVE5XTVp3d2Exd0tBbmpybW1HS2xEUDJVYU50OFRGUEdx?=
 =?utf-8?B?V2cyd3IxYkpvbTdFc3lneitOdkgvN0ovRGw4dDFYdGFOU3IvWkZoU2d2cytS?=
 =?utf-8?Q?AxaOuYOoyebIaSUI=3D?=
X-Exchange-RoutingPolicyChecked: D0DJuJrzzGdhkUOH5KwhzxeV6l4Q6fVxZ3nHqFJJPGffNBGUtPnMWEMZLZxB8nrc9WOHitE2f2icEgpr7fQcZ8IdFLksowLxgWym/glvI8Wz1yiA9dhEzGPiha99na1OAMDuwtzalSrP/rpq7sv4dxw1lI51h0uxhg5O6KZShXXdAuYu1rd7KIfLrF6vvtfXNC4GIr6U9StmkjIPa5qorYcC6XcpZJhDmxPIPnUvyiD3bL6wWyTe6GH2QYO8lLRTVRmXVUIWnGm3BS+D4fb+K15boVpXKGlnx9Q/2Sn88cjj04cRRkt0js+MWxx8wDQVyUzT0GWQ3KWRAASynSJvLg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6bb977-4eab-4732-5350-08df105391c4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 22:25:22.4920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsZdyN2iJRIsFruE9Nwa8z6kR+9rX5xFJRnWU+o0Wj8PJdWtZCrBIJLPm1YuCF2NX4AKb0JnziYx2qNgY9afWqSLq4zxYTQ3DI5xfXp+kOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6568
X-OriginatorOrg: intel.com

Hi Babu,

On 9/4/26 11:06 AM, Babu Moger wrote:
> ABMC ("mbm_event" mode) allows explicit assignment of hardware MBM counters
> to RMID/event pairs. It is intended for deployments that need to manage
> counter assignment on platforms where the number of monitoring groups
> exceeds the available hardware counters. Because hardware MBM counters are
> scarce, mbm_event mode is best suited for snapshot-and-rotation workflows
> that monitor a subset of groups at a time.
> 
> Commit 0f1576e43adc ("x86/resctrl: Configure mbm_event mode if supported")
> enabled ABMC automatically during initialization. This causes problems on

Se "Fixes:" tag notes in Documentation/process/maintainer-tip.rst

> systems with limited MBM counters and breaks existing userspace that
> assumes the historical default mode, including the pqos tool from
> intel-cmt-cat [1].

There is no record of this breaking pqos. *you* created [1] *after* you
submitted v1. What a strategy! I mentioned a couple of times that this is
misleading. Since you insist on proclaiming "we cannot break pqos!" as
motivation for this change you have to also disclose the consequence of
this change on pqos followed by motivation why that is acceptable. Specifically:

	https://lore.kernel.org/lkml/77f77d02-fae7-401d-9bb5-c62b244d23cd@intel.com/

> 
> For example, pqos mounts resctrl and creates 16 or more monitoring groups,
> using two counters per group (mbm_local_bytes and mbm_total_bytes). On
> platforms that provide 32 MBM counters per domain, this consumes the entire
> counter pool. Additional groups cannot be assigned counters and pqos
> reports zero bandwidth for them.
> 
> Leave mbm_assign_mode in "default" mode during initialization. Default mode
> can support more monitoring groups (up to 64) than mbm_event mode, which is

"up to 64" - so it may be fewer than 64? What is guidance to users about
how many monitoring groups in "default" mode are "safe"?

> typically limited to 16 groups because of hardware counter availability.
> Common deployments with a modest number of monitoring groups continue to
> receive accurate bandwidth measurements.

Please be specific and do not hide the consequences in a note at the end of changelog.
For example,
	Deployments with 64 or fewer monitoring groups will receive accurate
	bandwidth measurements. The hardware supports 4096 monitoring groups.
	Deployments with 65 to 4096 monitoring groups may (without user-visible
	indication) receive misleading values or "Unavailable".

	Users that need stable measurements across 65 or more monitoring
	groups should use mbm_event mode and rotate assignments as needed.

Although, the earlier text is "up to 64" so above attempt at guidance may not
be correct and there is no knowing how many monitoring groups are guaranteed
to receive accurate counts?

> 
> Users that require ABMC functionality can enable it explicitly:
> 
>   echo mbm_event > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> 
> Note that default mode has a long-standing limitation when the number of
> monitoring groups exceeds the available counter pool. After hardware
> counter reallocation, reads may return "Unavailable" or misleading values.
> Users that need stable measurements across a large number of monitoring
> groups should use mbm_event mode and rotate assignments as needed.
> 
> Update Documentation/filesystems/resctrl.rst to reflect the default boot
> behavior, document the limitations of default mode, and adjust
> mbm_assign_mode examples accordingly.
> 

If the plan is to send this to stable then it needs a "Fixes:" tag.

> Signed-off-by: Babu Moger <babu.moger@amd.com>
> Link: https://github.com/intel/intel-cmt-cat/issues/311 # [1]

"Link:" -> "Closes:" (and then move it above SoB)?

> ---
> v2:
>   Added documentation describing the known issue with the default mode.
>   Will add cc to stable once we have all the things in order.
>   Let me know if I missed anything.
> 
> v1:
>   https://lore.kernel.org/lkml/8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com/
> ---
>  Documentation/filesystems/resctrl.rst | 79 +++++++++++++++++----------
>  arch/x86/kernel/cpu/resctrl/monitor.c |  1 -
>  2 files changed, 49 insertions(+), 31 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index 79feeb1dc296..a43ed3c89a93 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -355,8 +355,8 @@ with the following files:
>  	::
>  
>  	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> -	  [mbm_event]
> -	  default
> +	  [default]
> +	  mbm_event
>  
>  	"mbm_event":
>  
> @@ -377,20 +377,30 @@ with the following files:
>  	will return 'Unassigned' when read until the user assigns one using
>  	"mbm_L3_assignments".
>  
> -	The mode is beneficial for AMD platforms that support more CTRL_MON
> -	and MON groups than available hardware counters. By default, this
> -	feature is enabled on AMD platforms with the ABMC (Assignable Bandwidth
> -	Monitoring Counters) capability, ensuring counters remain assigned even
> -	when the corresponding RMID is not actively used by any processor.
> +	The mode is beneficial for AMD platforms that support more CTRL_MON and MON
> +	groups than available hardware counters. The mbm_event mode ensures counters
> +	remain assigned even when the corresponding RMID is not actively monitored.
>  
>  	"default":
>  
>  	In default mode, resctrl assumes there is a hardware counter for each
> -	event within every CTRL_MON and MON group. On AMD platforms, it is
> -	recommended to use the mbm_event mode, if supported, to prevent reset of MBM
> -	events between reads resulting from hardware re-allocating counters. This can
> -	result in misleading values or display "Unavailable" if no counter is assigned
> -	to the event.
> +	event within every CTRL_MON and MON group. This mode is enabled by default.
> +
> +	Default mode has a long-standing limitation on AMD platforms that support

Please be specific and drop unnecessary words. For example, "long-standing" can be dropped.

> +	more CTRL_MON and MON groups than hardware counters. Hardware dynamically
> +	shares a smaller pool of counters among RMIDs. The size of that pool is
> +	not enumerated to software (unlike "num_mbm_cntrs" in mbm_event mode), and

I do not think access to "num_mbm_cntrs" depends on mbm_event mode being enabled
so "in mbm_event mode" can just be dropped?

> +	"num_rmids" may be much larger. On current AMD platforms this pool can

"current AMD platforms" does not age well in documentation. Can "current" just be dropped?

> +	provide more counters than mbm_event mode (for example 64, versus 32 ABMC

"ABMC" -> "mbm_event mode"?

There seems to be another distinction that just "more counters": what can be counted
by such counter. Specifically, a single counter from from the "pool of 64" seems to count
*all* events associated with an RMID, while a single counter from the "pool of 32 mbm_event
mode counters" can only count a single event associated with an RMID? This documentation
uses the term "counter" interchangeably and is difficult to follow.

> +	counters), so more groups can be monitored accurately than with mbm_event.

"mbm_event" -> "mbm_event mode"?

> +	Typical usage with fewer groups keeps a counter attached and readings

Drop "Typical usage" and just be specific about the different scenarios. It will be easier
for user to determine how their usage matches to specific scenarios than to try and
determine if their usage is "typical".

Also related to above text, since resctrl documentation usually refers to counters being
assigned to event/group pairs this is not clear about what the counter is attached to.

> +	remain accurate. Creating more groups than that pool (for example 64 or

"64" -> "65"?

> +	more) can cause hardware to re-allocate counters
> +	between reads. Bandwidth values may then be misleading, or reads may return

"between reads" - what reads are referred to here?

> +	"Unavailable" if no counter is allocated to the event. There is no

hmmm ... now it is refering to counter being allocated to event, but this seems to
be referring to the counters assigned to RMID which would mean it counts all the events?

> +	user-visible indication when this begins. Users who need stable readings
> +	for many groups should switch to mbm_event mode, if supported, and assign

"many groups" -> "65 or more"?

Since this is not enumerated this may be the best guidance that can be provided ... although
since the changelog mentions "up to 64" there really seems no way for users to know how
many monitor groups are "safe"?

> +	counters to the groups of interest (rotating assignments as needed).
>  
>  	* To enable "mbm_event" counter assignment mode:
>  	  ::
> @@ -474,8 +484,8 @@ with the following files:
>  
>  	Determines if a counter will automatically be assigned to an RMID, MBM event
>  	pair when its associated monitor group is created via mkdir. Enabled by default
> -	on boot, also when switched from "default" mode to "mbm_event" counter assignment
> -	mode. Users can disable this capability by writing to the interface.
> +	when switched to "mbm_event" counter assignment mode. Users can disable this

Why is this change necessary? It seems to drop the text that mbm_assign_on_mkdir is
enabled on boot ... but it is still enabled on boot, no?

> +	capability by writing to the interface.
>  
>  	"0":
>  		Auto assignment is disabled.
> @@ -1791,32 +1801,41 @@ a. Check if MBM counter assignment mode is supported.
>  
>    # mount -t resctrl resctrl /sys/fs/resctrl/
>  
> +  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> +  [default]
> +  mbm_event
> +
> +The "mbm_event" and "default" modes are supported. The "default" mode
> +is enabled by default.
> +
> +b. Enable "mbm_event" counter assignment mode.
> +::
> +
> +  # echo "mbm_event" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>    # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>    [mbm_event]
>    default
>  
> -The "mbm_event" mode is detected and enabled.
> -
> -b. Check how many assignable counters are supported.
> +c. Check how many assignable counters are supported.

<snip>

So many hunks follow and all they do is relabel the steps. This is a lot of churn for
a fix.

What if "step a" instead just drops the 
	# mount -t resctrl resctrl /sys/fs/resctrl/
step that implies "mbm_event" is the default?

If so, all these hunks could just be replaced with, for example:

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index e4b66af55ffb..1c3c27444dd3 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -1783,11 +1783,9 @@ View the llc occupancy snapshot::
 Examples on working with mbm_assign_mode
 ========================================
 
-a. Check if MBM counter assignment mode is supported.
+a. Check if MBM counter assignment mode is supported and enabled.
 ::
 
-  # mount -t resctrl resctrl /sys/fs/resctrl/
-
   # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
   [mbm_event]
   default


> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 3838e0a13d36..8a0d6086518b 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -471,7 +471,6 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
>  		r->mon.mbm_cntr_configurable = true;
>  		cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
>  		r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
> -		hw_res->mbm_cntr_assign_enabled = true;
>  	}
>  
>  	r->mon_capable = true;

Reinette
