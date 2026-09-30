Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B14C31ED83
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790743503; cv=fail; b=QZcjx+3+P3hqOwAU5Z6UgSv1YAmwlVH4FgztFPvEXdwdRc82e5/WKfRYWQ3UzMJCbLIrti241K3R3PwSZKyx94IZMmH7b2NRPogFkk2DRgWHAJoblCbfgerGvDEWfiPhINih2zzWGUktuyojXLKMXOp21VQgKJ3e7ii5/MNfH1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790743503; c=relaxed/simple;
	bh=zYI5Pq83f+Jd6NJilu6Jgs++FX8EN4IcH85y61J9djw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nuUT/4izinWWsnUgwjECQshTL99VqXXnU8H0Q18u2zpyB4Mkn7KHB0Jd4l0JP7aOX/d1v1YHtIZeHBsgP//VZTcTsn4PbuBUBilpz4f1MRCmcpLRI5Y1LZym210EvuCZ1pqM737jqpC2mBIg5eIGFpNL1Rlzl7s0BSxS50zg+FI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6stgCEr; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6stgCEr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790743501; x=1822279501;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zYI5Pq83f+Jd6NJilu6Jgs++FX8EN4IcH85y61J9djw=;
  b=F6stgCErJwbMEvDSPcYj4BrrGf3c7/1K3ERPM9vMxQLmLrAROd5UgILb
   ph+DeihalLBEKev3XCcvALbj1IXjjMmjPAYlaeeOUb0SZzJtMpl6VN89T
   efF+MWXig/8zcbWwVCRDldMiiHxMFVxcXKh73FEfxbdrwmYFPlTYdJ+pL
   Rd1/+pJecz5drKsJUdfUGOXpZjpawgytl0RtK+TvsJJmvC9d1GFNUETeo
   k+RC60+sVgWCsW8x6uUorS06FXdEyKozGl+ujnNDZgeEeJe4EHsBCivnu
   IfUYz1dOxbXqTUfkIq4iBABBRseaXHPvlKDKqmgwY5I4L5e+pikdDl+Np
   g==;
X-CSE-ConnectionGUID: KjhffM9DQeyshKYUx/M1xA==
X-CSE-MsgGUID: UjQD7Qu5SoiobdHVSMpc5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90334050"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90334050"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 21:45:01 -0700
X-CSE-ConnectionGUID: a4ARqvCITEG+O3PTwUJNFQ==
X-CSE-MsgGUID: 9yr16VR8SJqbgL/iXb3WdA==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 21:45:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 21:45:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 21:45:00 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 21:45:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=diLDjP+JT1SuLkjwBi9068xbAHV6gK9BbaKiGoRt5ljlyySCgQ2zruePp3TIVByxd3H97Xr3QNZQPerSlNMIm/TlERD5RTw5ldFl5GJCpq5a9AO1cUwI59m6/kdV/1OiaQMMfW0HSjfvETQRDbKXwYLXwcDoprLXspjOI9noeX95c8Aw/7rE78cw44envmif2qzrBRw8R7qvxrIYNphqP7xzPt93fpG2DX7wUUephOEaAXi8tTnpVJ/tpKmwnu2TAzvckjQ1VS7VxMK5/eO+icHleGejsPulxqI1LmfkhZfSgTOxY3BPHd7cvwQlQjWhT3P30c3oMYMhyyXB1K66+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTPlwb5NZxEEHfqjsPA9awec7xw7J2Rxd0k0AbvHRS8=;
 b=XLK9/Vjr5yvtopkQxcvWybFYMN/TbZVuwo+jtpFTU4QGGl0i2VJedxiKn/eouNOXXGTWc7M46Znf/VMXVCOiCzfjYHEVpzQ5GrTmLmfM7LZeEeCngPWEtJ3yejmW2gWzrj8sFahXJXIXs38PRXw6tvymRA4IneD4sJT/ZR8YU3KqJiG+qwT557GrXlK/wKlhzmUOiNwc5GCl309rP+ALetZpD5TJjQkEYE9NBQA8sscYPh/qofwqSH5Q97IE6NdnFT/BQcfK7sDLlbWjs6KIzAOtjy7jJ8rV6071c0i2G547Tu3+Xpwx5ZUaiGNuo/10JdHQZkfMJ3mn+Fk4EVAIVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 SN7PR11MB6655.namprd11.prod.outlook.com (2603:10b6:806:26d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Wed, 30 Sep
 2026 04:44:58 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 04:44:57 +0000
Message-ID: <67b77f20-53f1-4b3c-8420-f125eaa0fe26@intel.com>
Date: Tue, 29 Sep 2026 21:44:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 1/8] cpu/hotplug: Allow architecture-specific
 primary CPU bringup
To: Borislav Petkov <bp@alien8.de>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <kevin.shu@intel.com>
References: <20260912000815.997720-1-chang.seok.bae@intel.com>
 <20260912000815.997720-2-chang.seok.bae@intel.com>
 <20260930002010.GDarxVul0JZDam_-bG@fat_crate.local>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <20260930002010.GDarxVul0JZDam_-bG@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:a03:331::16) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|SN7PR11MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: d894d429-bd7e-42e2-0619-08df1ead93e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: PNqFa2c7juJ42VEXIbfNq5clzdXlzrXS4s788JODsfw39RVY4Q4PBx/QUiI2kw2w3Q3yWQ+gYB10t3RxAkgn0gkMLzULVq3DnqMdq8NIQQ10Wn8nwNvtGZqYcXDkZdHDPRuaDUBhMoobz+9XM3vLb+yUwI0B+3iOOkzgTrCAWrr2cUECrAD3wDW7orb8To/J0fy7rKU3bJr3tgeQbPduAX7hto5fH2fnS7s8yv5XzZ0586evSY4iRdxGm7Yl9iPNmrlrNKPA4Q1RCg6n7ksTF7fU6kMxaoeBIlxjXjV5CE3Z00lcEY/P/biYIFMiiqJOLM4ygnqKFykzh3ACqlANSMgJmSBi7M9LAyeEX576oRkWXXLvi/yP7M4kAJgJ9uNfuEfzppd1EQhqvwq7nnapYEPVk4xjsfUBlacHNhA0uwYn/x6q4gW7csX/2dSPC7tXm4OEfdz7Txqel6B06UheSa2a+ABoTC1GOGUn1TUkBGuD6fodgYpFuE0ZaEUCnPpbj++BdA4F95rcgqGQO/R2hpnejK0cOtCwoyVOZevcCLWTORm7ZnTWbFn9iJDtRMfcP/1VkgptT7pbl4I4/we0+xq7NhUc7/evjarSGvU2PvEUAkDmzaD6ObucsHaA/bw5bcAuuU2qbjJturq/Uy+qzLPU8H+IVORJsK0Zqb1dB38=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2pGMnZDNmNzdEUrTU9ya3U5a0M2Vy9oMnk1K2ZVcVVTV0JzM0tXRHd1QThz?=
 =?utf-8?B?VEdaaEVURnAzWDd1QWRINzZxekhTV25UaVRZUXJrRDJhektZSkpsMHdVUCs0?=
 =?utf-8?B?SWdXb2lPbkRXUGdpdHA1TThJZ0ZBNVJsT0RCRzErTTMvRHYvL1l6eWZIbVp5?=
 =?utf-8?B?WEpXZUoremtXai9CaXZLY2JTZ1pqcDNDdytkbUR4OHhNTTFDVklBWEszNS8r?=
 =?utf-8?B?SUl6aFRkZmhISkFyL2REVzduZkdoTkg1ZG4wYzRUclJiOU5pckFUODBQTWNa?=
 =?utf-8?B?T0gzMncwL2w4SkJRUlNGK2tpT3JKcy9sN2hZTGxNT0JRZnVuNndnaHZta01F?=
 =?utf-8?B?Q3VielRvTzRabEVSaVZoSXcyT29vcitBMW91SFZiTmNpMUpZVE53dHJrbmpW?=
 =?utf-8?B?bFhFK1RiQ2tEblNHSHY2NFdPbGdPdDFGQWNzS3JXa0E3U2VaVEg0WjNBc1BC?=
 =?utf-8?B?UmVCME0zeTEyWjdBQWJPRUVmVmNSMFloT1l4bXJ5NmRZNHI2amlrcXpRbHN5?=
 =?utf-8?B?LzRjZ1EvMWIzUElNc21TV2t0LzArZlZ4QVhzUWcvUHRkV1JZUHkzbzJ1ajV1?=
 =?utf-8?B?d2xYeHhUR0p2TEErUndaTnhwZHVoeCswR2NwajRCd1ZLNTVIY05HY21IRTVB?=
 =?utf-8?B?V1pNeGR1Y0JGYjhPVUMzVHNOMTRGZmh2enQ5Tm8rUmZDb2U1TEZkMlZmSzBu?=
 =?utf-8?B?M3JDaCt1elQvN0lnSTloTlhqTjNpcGRoQzdvYXdOMTNvV0EwYUkxWHI3TlYr?=
 =?utf-8?B?ckw2K0xuN3N6V2dOYWNPOUU3K0s4OWduMDQyNVVZbytGVWhVZkR0Y1FBT0JX?=
 =?utf-8?B?QnhsWTBSK0ZCUDluMmhHc1BRdTlabC9hYVBTZHRKTEowVUhaSm9jMnlRWEE5?=
 =?utf-8?B?N24rd2NsWmgvK2pyZHFQc1lzek9Sazh5YURHelc1dWt2L3lXQ0JBRDBoOXdP?=
 =?utf-8?B?dVBNSmNkZDd3WWVoNm1ZZ1diNGo4VkgyY25WM09jWE5QNE9LRU9mWjBKSEI2?=
 =?utf-8?B?bi9ZNk4reUdOeHhmTjVvYUNWR09wdFZoVEFqR3hzZWt2bWZFd2lybVJ3Umxu?=
 =?utf-8?B?ZHdjcy83L0hvbCt3Vyt3S3ZNWWZtcWJnYStEc0krN1hyWDdZMlQ2M2VGV29n?=
 =?utf-8?B?MVRMV01WSWRVQzFmV3ljMlVkbXp5bVBpY0Y3ZW5YU2swZ2p4aXEzaWx1NVBk?=
 =?utf-8?B?VFlGK0RzRVVHN1BnbnJ2RWczUmRwcGUyNmVTYWVkc2VmdzBKTkNoeVlZcTdL?=
 =?utf-8?B?d3ZmRHFKc3ZyQ0dBa0NWVWFWU1dYWHU0QWJnYVY1aWw5UWhMWmRIZHRtc3lm?=
 =?utf-8?B?VTkyanp6MmdWRFpPcFJsaTArQXJkYU1lRDFpMzBhekd5cys5MVg5b1JlUGJS?=
 =?utf-8?B?bWVscWlOeTBjSUxEZGQ0S1lDeHByZEZPdDRRS0JRSzU0Rm5NRmxBa2QwQ3hL?=
 =?utf-8?B?dDJuaE1Xeml0OGMvZnJabnNNTmxuWHhnZzAzNGkwYVAzeVJ6WGRxSUl2eVN1?=
 =?utf-8?B?djRVYUFGZEdRcnlxOXIySHQ4WWVOTVlXa283M2diRjNZWjBWNjdTQ3BBK0dL?=
 =?utf-8?B?ZTIzSkgwNzJzeGJXaU9PT2psNi9HM0tYSVNsMSt2Y2pvQXNWamo3WkFVcDhh?=
 =?utf-8?B?TFBWdytkME9wSHJTRUM5RG9ReloyT0NtVGFrWHZ6TWZFdXM2UHVnWlhtN3FL?=
 =?utf-8?B?bjU0NG1ibUNDQjhWaExtaWVpWmRTcDF4aVpYRWZacEYwdlBUVDFjVTV5aFoz?=
 =?utf-8?B?QnoyaHRubHZOM1c1UkpYTk84dnBBM1dFNEgzdzEyNzJWNlB4WlhHL2JiQ09I?=
 =?utf-8?B?WkZ4VmtuUEpyOUppYjNxVHlRTlZMOHpOclEveTlhVHM0N21rL2pyaHMxMUl3?=
 =?utf-8?B?UnpxYnFSQU40YkZoMmprcVo0YXJQbHNSbnVsWnlJYTBON0dTcXM3ZExXWlI4?=
 =?utf-8?B?OHZtM0VEcVlZOGw3VWZ0RjE2RXh1ZWVpZ3N1elJNYlZlVHpiMXJITndKaTFH?=
 =?utf-8?B?bkpydDFUMlJPYWR5NTJ5SW5pSEJOdXFoejZoTEl6WEdRcXdaVndpbGNuZDhi?=
 =?utf-8?B?RFZmekJ2bGJGQnVORXNVNjlSN2RQZDQ3SG5jNDBSLzNyT1I3anNKNjdrUWFF?=
 =?utf-8?B?bkF2cThTdXhJQ21TSmo1VXdxVXpqSXhMWlFQb0RGVTJyTG8wdTlqcytFczAw?=
 =?utf-8?B?djNNaFJscldHRVpYZDUwdDRyUm9VRFZIMVA0NVNIWWJyVUVUSGZZczVYWXl0?=
 =?utf-8?B?WDkyUXZDOUt2RDE3TWROaUVjdFJrcjU4Z1hudEVndzI0OEkwd0NIVTJKZkp4?=
 =?utf-8?B?cnBSOUZ3c2UvL1J0cmhDUitWQnFueXpsKzdCSDlXb0pkRzI2UzR6UT09?=
X-Exchange-RoutingPolicyChecked: fZMIRpYWiFygGnYBOyZmtbl0aTuZeVwcZp2aHLVXeg8zfW1Snf8985KYiiqEgZHzWg+smFlD07C6QR8G6xY6ndVnSA82uPX7T/KqcI9eVF0W1UpdjAKtRH657YZ4ZZTwHa1cSBxgeIg72uan+OvgwAHZR1U0Et9T9MdzwKQZG/2c0pSW02UE27DCWzneQYijzXG2YahGahLi4nOMhhUfEQG5lQrYOMzUfMEVUZYhY6qxwjbIJxLZgqVHMJMv+azlg61FBYFPV7WOEdfuUX656BUBE0ElXi2M597HZ+F9rHZhnYrrd3geZ81T+0ksbjL+rW8OnFF5ohfOoj7i32lDlg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d894d429-bd7e-42e2-0619-08df1ead93e0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 04:44:57.8055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Euo0M11odA+2rS+vargTOscc/MjFzOTOaFef2o92LZtBwWRw7H5lUmRGXljkca+NU1tYQdOXYiolHCBMXGNsDQIK6cmFCs0CXIuif88EYU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6655
X-OriginatorOrg: intel.com

On 9/29/2026 5:20 PM, Borislav Petkov wrote:
> On Sat, Sep 12, 2026 at 12:08:07AM +0000, Chang S. Bae wrote:
>> Parallel CPU bringup currently proceeds in two phases: first for the SMT
>> primary threads and then second for the remaining secondary threads. This
>> ordering avoids race conditions, specifically for x86 microcode loading.
>>
>> Upcoming x86 changes expand the microcode loading scope beyond a single
>> core to package scope or even system-wide updates. Introduce architecture
>> hooks that allow customizing which CPUs participate in the first phase:
>>
>>   * arch_cpuhp_primary_aware() - indicates whether the architecture
>>     provides a custom primary CPU selection scheme, or not.
>>
>>   * arch_cpuhp_get_primary_cpus() - returns a CPU mask for the first
>>     bringup iteration.
> 
> Why are there two?

This pair is after the existing cpuhp_smt_aware() and 
cpuhp_get_primary_thread_mask() pair in kernel/cpu.c

I think cpu_primary_thread_mask alone isn't that obvious to indicate SMT 
on or off. So similarly arch_cpuhp_primary_aware() provides an explicit 
indication for the if statement.

> 
> Why are there even accessors at all when you can simply use
> cpu_primary_thread_mask whereever you need it and drop all that gunk here and
> in the next patch?
> 

The series directs the bringup code to select different masks depending 
on the uniform scope reported by CPUID. That's very x86-ish code thus in 
arch/x86. So I ended up with accessors connecting to that x86 part.


But in a bigger picture, this is a part of the early loading support 
along with patch2/3/7. Introducing cpu_primary_core_mask itself in 
patch3 may be seen an overkill, TBH. In fact, the latency impact on 
early loading (when without uniform support) wasn't observed that much 
in practice. But, OTOH, one may also argue the loading scope should be 
consistent on both ends. So I think it is worth settling down on which 
approach to go.

Thanks,
Chang
