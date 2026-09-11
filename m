Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBB626299;
	Fri, 11 Sep 2026 22:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164756; cv=fail; b=rYWWwFCHtLnDHJrwAttBNIXTjb/tJtmg+XVBAdYBuzUf0SK7hfkEClMHQUMnhRsrA79xpHFIjVgyz7M5aGi/2+54EThKSZmD0EjF6FuMOGSyl4eOJPAn0AmYCdewx5A7Tbq0CXNQQ2WivSzqR9SCUJi+P6QnXzmBchZL5RKWojo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164756; c=relaxed/simple;
	bh=F+8/L4n5S+WDgoLV2KKp2GISFPr99ixQBZmuSbIBNMg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nv5P025ct2ehLjKMIsF1wyHYFk9q30sjLJQvfeFPq31V2TYdqFIpMd95rUVd2Fa0lqRuz0Q2agBtcqp7MHOzUWPsom8BsYf36zbmUMsx2QXZ5RBDPZ0xXw9h+WzdFQwzlv/fO62lgpBR+OOCEEizRo+wDq92DmIjGERDCEnxKhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8DTmNMj; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8DTmNMj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789164751; x=1820700751;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=F+8/L4n5S+WDgoLV2KKp2GISFPr99ixQBZmuSbIBNMg=;
  b=b8DTmNMjB9CwKH/vVZzusG0mB2YTdmkpFXoa6Ty54AdS9382QPVtzszn
   fSYoBISpT46SMqDp4C1xq+bqvjZutz+6zNqcJN7UFf5bWe/Jctz53ljwd
   4qP2pkcQ1MGYqV59HveWvpLpYbmIZN7KcRsYDIW9+R7q8JOaS4o5bklNL
   z6Ou4ClPojpKxor2WrHRyFdEcIyrkpN3vquXocGoL+CQKhh34BKgO11r3
   TR5r2DbYXJp9GDYcXIpR46X9V/9DVh4tL/pQj/hDiwxpqWbOYESZzmF9a
   sTkxrcrN3JFbFBvtOEeN8k7buXMnLArul2odXR4XMmIwJan5qicTNn5jB
   A==;
X-CSE-ConnectionGUID: /lnHP/MmRmOn3EGp/VZwYQ==
X-CSE-MsgGUID: 5+n3/aThQlOPw3kbCbZqVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89472563"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="89472563"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 15:12:30 -0700
X-CSE-ConnectionGUID: XoNjChr4TrS+mCeC6oXXUw==
X-CSE-MsgGUID: iOMuQO+BQMGc2YCbsSHeYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="272010383"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 15:12:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 15:12:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 15:12:29 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 15:12:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVYd4HnRArjibX+M+l6VAOpBfrYs26/6CBu6ttOZog0uRd4eZgctzbqkyDR+VKYh936n5DqW3zUbpotwYkBGz9YJBH+2b7u47GSNS3MbprvrgeKi9jIUfEp14nbds/Po1hnZVDNYnqDeTRnuN0RbduGHOmI2AhCQgkXevsUwRORhk+ocHDPbpXrph/GioihEKn7X5bsUDp0GHVwYxEN5bqMAHe2btfKGjAe3cTVShjuIBHnLdry3KoUVvnrEUhlWxe9CXstYt+0+gBGNW6s6gwZtciJKsE80kQJhCcx0O9p5zEJ3IiJTO/cKrzMH12YU91j0VkFO3aLE7O4Cv1hz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R569HJzIW/a+XLdgs7r+ZwCoaW4MD7T5Akuo2y68HuI=;
 b=G2skhSWrYdxsiXXfgHZc8FqWG/fqHNtv15YahERYHRoCS5Jdmqru82wMK6yIIipMZC5zcXPuCnjnCjq7cldJFHjizoYcG0dlNi+HB3FmLYonJm5ah1gbyultm4YFfDOS0l+CAfn/cqf3udAJzBAoPXBF4VgwsUFLELWFBy4IqGV33NwvEVQXIGFo5kuspZRejCkJq9tR4zc+bQmoi2AE00BXeo0b2v4oR43zMvdsckgiXRt2S9q7wAQGBAY9b3KX0RXKQqHomEFXb2H6Tc141M4jFXUaJM0q25tvG3j3BF9FNstO7E50ROeWKLk0dhbA5NoQVs0CmZD8GO3TVnwJbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 22:12:16 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 22:12:16 +0000
Message-ID: <3bd4676c-5c25-474f-bdb1-039dd02b79be@intel.com>
Date: Fri, 11 Sep 2026 15:12:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] fs/resctrl: Assign counters to existing groups
 when enabling mbm_event
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>, <bp@alien8.de>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <cover.1788545152.git.babu.moger@amd.com>
 <79d6aaedbef7e3113a15c79b1f6eb7510b2a2a62.1788545152.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <79d6aaedbef7e3113a15c79b1f6eb7510b2a2a62.1788545152.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0296.namprd04.prod.outlook.com
 (2603:10b6:303:89::31) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|IA0PR11MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b1c9fb-4767-46dd-7016-08df1051bccb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|4143699003|10067099003|6133799003|56012099006|22082099003|18002099003|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: gQIOf9UYE/N2PBfeODdO+EsV7giZcZMCt96L7cg4kg9xrUbIjXpQo6q0Eb7u9+fd67HryIN9K6DgHyYFDaon4dAfQVRn1M1xFNuoZV1xOar7iiADDxs863Eq3m0hx0PNBgGThrQfherN0jiCckkl2nw+g3ufF1l4zcS+n+XEOPEffgSMMUh8QJKgweGRLm3ZvOe9JkZeOPyNkwx1CyX14Ir7Z+gr31oednPxPZAsTuCg6UjGK4Y9x+kKJE9gw7PQlN+qRXftLXmy+l2Vi/jkNscU60FZlrHLMi9vxaa7IdigwCPdo09P3gEKbOTm4oHoRoqHmYVQnLvrMZgtIIaJZxUWxUYQqLtMZhwUA5V/vOgUNHCHkqWhXWyld95E92ajLgQFMYMu8qCFaZri8OPKLW5tBcIseNPG/Eo/FeGzC+nEsYYMT+Ic9bwndcdrVq5LHROkgnbt/Cka+1wl3jrd83KAEJAYMR92yYelEq5O7e9mVtQ5RGU8P9pXDrSBWXaG1Ixib0wpYxe9aFPyOEC4uCK7pFaFDkkIiDgWkTRp5k5JKbQmVbcrXFPxuObE2Ba/aZrwgBa4p9t9NBRCVel2HwlgRYXWqcLJXloiSz0vMMk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(4143699003)(10067099003)(6133799003)(56012099006)(22082099003)(18002099003)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXhCSGdrdlQwc1ZqNGFWMi9TUEZYYUR4Y2gyN04vOWNoTk9WNW5JUGtxcW8v?=
 =?utf-8?B?NWcwdEFUMVB2dGlIZDBmRjVhUnpiZFZqMFZKRHZyUlN1SVlxRmVtSkFHeDRS?=
 =?utf-8?B?SGRyQVJVRHg1SWN0TmhSWG9RWHcwWlNNZlh4b3RQeEp2d0s1K1h5M2ZyNDJR?=
 =?utf-8?B?NmZmcVFYS0wxbklKcmNNUVZGUldUVnRnOUszK1plRlI5NDdsMldtbHJZcWFS?=
 =?utf-8?B?bmh5MnIwbEF0cEJJa3RUSlJIaVA1SEY3NENld2o5b2NqYWE4MmM1QzJqNXBt?=
 =?utf-8?B?UUp5OHRpeEZ6QXJiY0pwR0NEWTdFTlJpN05QZWZBZ1Q4WTVCVDN2UmhicE1E?=
 =?utf-8?B?OXJlSlBKb29QRitBRHBWWXZJTmVzOWx4VXh2eWJVWnE3elRLK1JoOG1nL1VX?=
 =?utf-8?B?NSswb3JxaUdINFpDUU5pNlRhU1FGZWZaZkJHZzVrLzU2anptd3pWZjBTR2ZD?=
 =?utf-8?B?WGovRU14bXdHZGdZVjdwWTZNU3kyU2k5UUxHUjlpZld3WTdDK1NFZFRTMk9E?=
 =?utf-8?B?SDF5WTRpMk9MNEdUMmtGb29kMm9Wb2NjTm5uWkpnN084bDZ0L2FFU3RQdnAx?=
 =?utf-8?B?MERuMUJVWmdWNHhia0UrR1VwZjJXbk1ycTl2ZEt4WXVDbG90elF1cm9jbk5Q?=
 =?utf-8?B?SXFNTC95SEtWK0hNa0MzUW45a3JDd2tpZmVSRUFEak1KRzEvSnREd2FqcFhN?=
 =?utf-8?B?NVlNT0swRUEwcWNhcFNrcG1jM1VRemRaZnRhNHBXbzJOMzQ4QjFVOU13dDdY?=
 =?utf-8?B?bWNxYmFlYWZ4dDI5dkllL3dIMmdCNkdZVDdHZlZpTDlyZkZrUDczaWVmL1Rr?=
 =?utf-8?B?NG9MYytrZkZWOGROSkthZ3ZBc3QwKzBacS9kRnBvajYrR0xGMlY2UFNCTEd4?=
 =?utf-8?B?YzZsUE5zeVBWMnk5YWhLWHU0R3dxeGhWU2pJemtsSytBVDAxdWhMUlpJRDlz?=
 =?utf-8?B?MGxIQll6ejBleXBvZi9lbGVxWnBLOWpSbHhTRi9SbEVMUFA2UEMxQ0YzdUYv?=
 =?utf-8?B?WGZidFljKzFRNkJtT0FjaUcxSVBCVEd3Si9sdVI0S2R5ZnZOaHVNMDhGdWRQ?=
 =?utf-8?B?dmVOSTlKb0VBQitMT0FsL2YwWDdkeUZDQVZJcjg2WW5ubWU0UlNrdFR3Y3hj?=
 =?utf-8?B?QVRkVE5oT1EvbGd4Zjh6R083TkxlQ2ZTUmZaYjZoTENzSkJMaVAwOVYzMWFp?=
 =?utf-8?B?RGdvb2tkSEV4R2U3WFltV2tidk90RWlDSXJpWFpZOTFDSG9wSThuZEdVL2sw?=
 =?utf-8?B?d1I0bUdBcS9LYTBxU0M4Vy8vM1c2UE1qUTZmdWJLUTlFWnBUZE5yd1MxemVx?=
 =?utf-8?B?cXlBbUJObmVuVzI0bU1vL0hmSmdvajExU3dudDdvU1Z4MTNMRUI0T3g4eWdt?=
 =?utf-8?B?b3NPVDhSTTFKL05MOWxNN0kxK0l6M1VNbEhoQVN1V2ZBand4QzA2L0RuUlZ4?=
 =?utf-8?B?c1hkRGk4QS9nOUYrNzFMOFJWMmd2YzZCSUlKQzI1cUxzK3lGT3JkUk5kRHAy?=
 =?utf-8?B?Q2lLQ2NyM2RCVG9oSStrdzZwa3FvR3NrcURJUlE0VWVLdWlUUStDeFk4azUx?=
 =?utf-8?B?anVDSGZnWEs1MWtNTnlhRk5vOW84eW5nLytrWUVQSHJodldwL2lWVTM2b1ht?=
 =?utf-8?B?WmFGZzVGdjFVOU1RUGQ3U09IRkM1dzFXNmh5MXdPcytRdUM3NkV0ZXdEWmt6?=
 =?utf-8?B?T0p0aXVhUzJhSTFhcWtkZDNhR1JGTU5YL1ptdW84M2hwNy9KQmxCVmxDRTFM?=
 =?utf-8?B?M21acEhtN3pHNTU5NERrdE9JcHZzTUkwZEtFVmNoUnIvVDJEaTBUb2xZOWhW?=
 =?utf-8?B?d0hkT0k3RFJUb2YzSUJualp2YXh4cWdUTTYyTXNYdTJpbG5VQ3I3eDg3SXd6?=
 =?utf-8?B?eWZNM012VWxkeTRpS2NMNmxaTFM0MmJNNlI0S3JzVHdYQUprckk0VVB4UGZY?=
 =?utf-8?B?Y3BOK0JwNW54L04vaE1ienN3SE1iZ0l2M3VBbDBWamRIRXQ5bzA1TEdTMVk4?=
 =?utf-8?B?STVwOXJldUs0M3JML3BOOFg0a2FuQ05jZ1RFam54RlhTU3lpQjRCNWdna3FW?=
 =?utf-8?B?bUZiblUzbFg1RWhHNmRlTjA2dEpZSlM3cDZ0U1R1N3g2czdvcC9HcXZWak92?=
 =?utf-8?B?UFlwSE15cDQzSXN4VXc2ZTZ6VnBuTjhCdWF3M2FZbG1FbWNFTUNXMHlFZ25q?=
 =?utf-8?B?bWxYd0FlblF0VWt3d1lDOGUvQTBPTDNpd2ladjdpQmlwSUNiQ3czbGhCMVMy?=
 =?utf-8?B?d29MazMyd1RsSGJ1UDVaN0JPRWQ2Z3V2TGFQNlJ3eWRDL1F2RnJEa3FYMy9W?=
 =?utf-8?B?SVg2TlJoZXVxTE40dWtmYWRLYm1RYkpwRzRpOVVrVHoyNEMwU1hRYyt0aDUr?=
 =?utf-8?Q?9dDJZ6yeWA8an1mQ=3D?=
X-Exchange-RoutingPolicyChecked: tDKV3SwYJNUCn2+YemIrsQEoEynaCMJi0hoMn7UjjWH8qkj/xrUAlOPRjlrpKLUygIeIjEE51+tbQeEH9kXLJr6PRRLxn0qoQfWkM61HOsRl2CWJv1D7PxfODTn99iaLojiaLms6kJTnStrwoJst4qP+Qye7/N+1fOUPfIfAg2lqgA8crZYkYn/+6eiAKfOMxQUeqEdH218f7IzsFnoxN9zhRDR7UqWlKLzaZtYDuRusvF04FSPKbYOe39JgvhttVm2iVfJ+CB44aotu7AB4magW7NgBVMzkEOK3VzK3iEyutzPupyR2gRc5KdJjRZoikNgIQxsRW48mD5YhL3N0zg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b1c9fb-4767-46dd-7016-08df1051bccb
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 22:12:15.8884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVcCX+2q1+XD5JrnZxwm8PAMOJUbMqwprYn+DigAG/zCHZFyE85ulZCx9csgwQKcvoQA8VerfAsgeX4oOrsHQvrwvrEp/IJcPr9nFrJVXW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7752
X-OriginatorOrg: intel.com

Hi Babu,

On 9/4/26 11:06 AM, Babu Moger wrote:
> resctrl_mbm_assign_mode_write() frees all counters and sets

The changelog is easier to read if it documents what the code does
instead of documenting the function names. In its current form the reader needs
to stop at the first word of this changelog, go to the source code,
figure out when resctrl_mbm_assign_mode_write() is called, and then be able
to return to changelog to further try and understand the change.

Consider an alternative like:
	When the user enables counter assignment mode by writing "mbm_event"
	to /sys/fs/resctrl/info/L3_MON/mbm_assign_mode resctrl resets all
	monitoring state and sets ...

> mbm_assign_on_mkdir for subsequent mkdir, but does not assign counters to
> groups that already exist, including the default group created at mount.
> Those events then read "Unassigned" until the user assigns counters by

"Those events"? No mention of "events" before this.

> hand.
> 
> Enable mbm_assign_on_mkdir and assign counters to existing CTRL_MON and MON
> groups with resctrl_assign_cntrs_allrdtgrp() so the switch matches mkdir

no need to mention the function name, this can be seen from the patch. Just mention
what the change achieves. Looks like "with resctrl_assign_cntrs_allrdtgrp()" can
just be dropped.

> auto-assignment. Groups left without a counter still read "Unassigned".

"Groups" -> "An event ..."?
"still read" -> "reads"?

This implies that counters are assigned to all groups but that may not be possible.
I am not sure what would be best text here. How about something like:

	Enable mbm_assign_on_mkdir and assign counters, while there are some
	available, to existing ...

> 
> Update Documentation/filesystems/resctrl.rst to describe this.
> 
> Fixes: 8004ea01cf63 ("fs/resctrl: Introduce the interface to switch between monitor modes")
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v2: New patch.
>     This patch addresses the Sashiko comment about documentation issue where
>     counters are not assigned automatically when mode is switched to mbm_event.
>     https://sashiko.dev/#/patchset/8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger%40amd.com

Sounds like this is needed:

	Reported-by: Sashiko <sashiko-bot@kernel.org>
	Closes: https://sashiko.dev/#/patchset/8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger%40amd.com

Is this a stable candidate?

>     In fact, it exposed a real issue. When switching to mbm_event mode, existing
>     monitoring groups should be assigned counters whenever counters are available.
>     This provides a smooth transition between modes and aligns the behavior with
>     the existing auto-assignment mechanism.
> ---
>  Documentation/filesystems/resctrl.rst |  7 +++++--
>  fs/resctrl/monitor.c                  | 30 ++++++++++++++++++++++++---
>  2 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index e4b66af55ffb..79feeb1dc296 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -371,8 +371,11 @@ with the following files:
>  	of counters available is described in the "num_mbm_cntrs" file. Changing the
>  	mode may cause all counters on the resource to reset.
>  
> -	Moving to mbm_event counter assignment mode requires users to assign the counters
> -	to the events. Otherwise, the MBM event counters will return 'Unassigned' when read.
> +	Moving to mbm_event counter assignment mode enables "mbm_assign_on_mkdir" and
> +	assigns counters to the events of all existing groups, including the default

"all existing groups" -> "all existing monitoring groups"

> +	group, for as long as counters remain available. Events left without a counter

"for as long as" implies duration. Perhaps "while counters remain available"?

> +	will return 'Unassigned' when read until the user assigns one using
> +	"mbm_L3_assignments".

hmmm ... guiding users to read each event and use the return value to learn whether
a counter is assigned or not seems inefficient. How about replacing last sentence with
something similar to the "mbm_assign_on_mkdir" doc:

	Consult "mbm_L3_assignments" after switching to "mbm_event" mode for
	counter assignment states of all monitoring groups.

>  
>  	The mode is beneficial for AMD platforms that support more CTRL_MON
>  	and MON groups than available hardware counters. By default, this
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 73413cb128ea..61463741b91b 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -1326,6 +1326,27 @@ void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
>  					   &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
>  }
>  
> +/*
> + * resctrl_assign_cntrs_allrdtgrp() - Assign counters to the MBM events of every
> + *				      existing group. Called when "mbm_event" mode
> + *				      is enabled.

Please do not include caller information in function comments. This does not age well
and this patch clearly demonstrates this: rdtgroup_assign_cntrs()'s comments
read "Called when a new group is created.", after this patch those comments are no
longer accurate and thus also needs to change as part of this patch.

> + *
> + * Groups created while in "default" mode have no counter assigned, including the
> + * default group created when resctrl is mounted. Assign counters to them so that
> + * enabling the mode leaves the same assignments that mkdir would have made.

Above comment belongs in caller.

> + */
> +static void resctrl_assign_cntrs_allrdtgrp(void)
> +{
> +	struct rdtgroup *prgrp, *crgrp;
> +
> +	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
> +		rdtgroup_assign_cntrs(prgrp);
> +
> +		list_for_each_entry(crgrp, &prgrp->mon.crdtgrp_list, mon.crdtgrp_list)
> +			rdtgroup_assign_cntrs(crgrp);
> +	}
> +}

I think sashiko's feedback about needing to test for pseudo-locked groups need not
be followed since there is no overlap between systems supporting assigned counters
and those that support pseudo-locking.

> +
>  /*
>   * rdtgroup_free_unassign_cntr() - Unassign and reset the counter ID configuration
>   * for the event pointed to by @mevt within the domain @d and resctrl group @rdtgrp.
> @@ -1599,9 +1620,6 @@ ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of, char *buf,
>  									   (READS_TO_LOCAL_MEM |
>  									    READS_TO_LOCAL_S_MEM |
>  									    NON_TEMP_WRITE_TO_LOCAL_MEM);
> -		/* Enable auto assignment when switching to "mbm_event" mode */
> -		if (enable)
> -			r->mon.mbm_assign_on_mkdir = true;
>  		/*
>  		 * Reset all the non-achitectural RMID state and assignable counters.
>  		 */
> @@ -1609,6 +1627,12 @@ ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of, char *buf,
>  			mbm_cntr_free_all(r, d);
>  			resctrl_reset_rmid_all(r, d);
>  		}
> +

Comment within the block can be dropped and instead a new comment can be placed here.
Something like:
	/*
	 * Counters were freed above, so both new groups (via mkdir) and the
	 * groups that already exist need assignments.
	 */

> +		if (enable) {
> +			/* Enable auto assignment when switching to "mbm_event" mode */
> +			r->mon.mbm_assign_on_mkdir = true;
> +			resctrl_assign_cntrs_allrdtgrp();
> +		}
>  	}
>  
>  out_unlock:

Reinette
