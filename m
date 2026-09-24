Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DEB318BB3;
	Thu, 24 Sep 2026 20:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281639; cv=fail; b=edBuz/qlaei1eBGnNIGHsSWLr1x8D4i2k29gTee0QCT2cHuHU0qJ9Y7xhilOmgncH0J6XIhuTEze9uOsEq2wEWQLFX7sD7GV5LlL7pyeqRwJwnROXIjAiqFeHAMdrXIrkKMCQZQHZBXL9TkZglWHfIoPG1aN+83ixXMzP6+IT+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281639; c=relaxed/simple;
	bh=MmBASSmUC63YZIyIijLPg7tpV7RgrxaIyTUYT8jStgM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QVXsRaMPRsp1xbtaxJbjP8N8KhHblFPGCtayR2o5FnHGYI1YT7gcyExmExa0pngdd3VYn3u5HIwTEvBelddNNnLBhG+Y4AWf0r0BBd7wZjcJlit6hUHKsrpvIy/vNsDqgDq3SbWFdIe/33HoOGnBz17vnk4LkoP6PTBXDx1NthE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESlWU4N4; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESlWU4N4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790281636; x=1821817636;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MmBASSmUC63YZIyIijLPg7tpV7RgrxaIyTUYT8jStgM=;
  b=ESlWU4N47R6gLx3nVqMqV3/mir0Q6qEdLIyAR8i7R34EGdWP4V76TXGt
   zxmD7iNjtzU/+RikJMjOdamZfHFxLht/K9+9V8KhiMFRBI1AtZq1be4Fj
   aPFT7Jv6+nac7s1OSO7aniu7PxNdRNF8m8avGaubKLJ7PjUG3eQ0NmqbS
   Nuyy2fWSGqv556DFdDokkfz1lW4lOcVpS8dLAMl062dHNxkORReiiP0Qc
   bMQqKcKD54fFcjw09wE9OPLCFOKVPUXReCfUzP++ZIAb0Y0ko1XwsvrG6
   bhsFH7RWDCho4+B+HeJicUVY0IgtXNCTRq8Erx3BcKUi/G8E8wKy8RtVN
   Q==;
X-CSE-ConnectionGUID: ftRGDEtMQsOzAUKYJ7aiaw==
X-CSE-MsgGUID: f39HBeZUTXe6TLlpg8WUKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93786675"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="93786675"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 13:27:14 -0700
X-CSE-ConnectionGUID: 7OSLqx6gR5ODX9o/lmfZGg==
X-CSE-MsgGUID: x2kzTl1gRq6A9CIY2tfYxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272726139"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 13:27:13 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 13:27:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 13:27:13 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 13:27:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6i9nIdKojtBTUtJr+KtJnb0R0O4X8X3MPpRl7+YN8i6BpNleXGxdaA1u+0WnwwxAIccbIn7/nnge/CHbEk5YE8b9gh2D2he1sV5fmKZgtH7AYX9Bg5tGtzEW4pR6DI30xiA/5emZWE8Nefq/Hm46vGjEi8hK0MkpyQEhCljOg7+IhMsHCvxWQtYGtph49qdfVlCx/gR3Ef4jDhk0EdzJSLIFBsA0z7xGelxc9hfMslTgZFeF2SsfbKyiB3Uofoxkjq2Sv6PKUulTluuq6NeQFY5ZZn/Q/qFleFBsPdOFkDzJKm2Gr17RBnYokYg0DitM9QG6oNHW5WXVsaGjcBN3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5okuAqe1fQ6/SxXT7WDiyR8SD1BxKHu0eEzOVPoIHCc=;
 b=vGstgqVcNuEGtW1oTFCulhpzk/UaDHaFXuUxHaAHYSnZGpIeONhLuz+1FfyepnLrQqsWUoOnQN6Hx+Ep6+9ajw5rg4x+vmuiJ+e1+SZg++9ngRZg+8aexGmZPqoMKp8xJflsofqZKiXJo1bV5PHQDUP0IM32MlCKuaod8+Aji3bcf6nOS2R3kFNNQgMz3VLRLQui9hBTLkKlXQtWwtPyrFMHdcJTzOctXkZwoqzgefD6Ckz68RCUm8fQEVbf7b/TwA28K38qcOn4+uxVoOutG4NnBZBVhKm2DbxN9yQGFdsP8Hoo2IaY+tfNWI1uzZm3ttq9OwV1YgtBhqfFxqYxoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f27) by PH3PPF681F257FD.namprd11.prod.outlook.com
 (2603:10b6:518:1::d29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 20:27:11 +0000
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::3c00:3404:321b:fb35]) by DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::3c00:3404:321b:fb35%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 20:27:11 +0000
Message-ID: <2d3a3be5-557b-4f72-8ab1-8096d2a568e1@intel.com>
Date: Thu, 24 Sep 2026 22:27:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the pagemap-headers tree
To: Mark Brown <broonie@kernel.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
References: <arVpRvAzgfZkSHDF@sirena.org.uk>
Content-Language: en-US
From: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
In-Reply-To: <arVpRvAzgfZkSHDF@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1PEPF00005B76.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::61a) To SJ5PPF44E8B88DF.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::825)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF63A6024A9:EE_|PH3PPF681F257FD:EE_
X-MS-Office365-Filtering-Correlation-Id: 117f8cba-c54c-4dc2-bd47-08df1a7a35a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: MBuomNuZXFT5EfwikQDYaSf0H8iuTSHIhV8s86kDkVWWsIw5q1dwBOuXeUZRdMJxa5FZucw6LEC9heWJjnnGuJl3QPYHhTbllBvXZ7bI1CT91xGejwtT7ESBU5sQLHKruRelUulzHnQCP8aBBdmmyUBa//u7Fp1e1wxwm1qwFZgvr0m4yzP/YArBggtyeINnyG85Blqf97DAIRugovmGNb4ToYO1z0D4bYS4VV9x5fotlS23h2ZKPPzgIYa0NwGsoq/wewbJ6e0M1NxBneTKwv97doZzuN00jgbQXdKcJ+yClRIBmlPBLsByuyoViODIvLIZaali9uB6nACHOKECEtFodQhqgk/3XJ4FVO4MB/D+rytKU2lzOXbvEFCOuyE72dc1k8BabRwX2Vwx5hM6FN5xd6Aa9Rb5kR3UitHzR59kMMRGkQA+czVR6x0NTeK4qOrXFabglTPlHqP3WtCovMmWvlEKT2d7X1TTeoztbLEqgcfQXwgQrEE69WcinNZ9KVZqBe3ZyQRZqk/iuD8wRq+c1yXsgD+yQpyH34ynlyTvD5f1o/tFcOGwQGc1RNdmx9wxyf9ENGbnVjdZhUFRsHOb9iYRdlu/UllFn2gSVLFefk2iNiJJAsW2rSj/G/H9GOfXofJkbw2kq6zL8YN65J5SRaInlaZb2TDjFL4tvHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF63A6024A9.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDkyVVo4Y1FQdXovUExyYllYd3BQTHRwcUJvRFdFVHVydUlBUGIvNkFVT2hO?=
 =?utf-8?B?dHJlWTkxT3J4Z1cxOGd5M0kydTdZZ1poWXZSdlN1YW4zeUZVN3A4N1UrbXA4?=
 =?utf-8?B?ZlJBZlJiWEdZdFJIcWd5cVJPUkZYVmZyZEpxa0tudGRKTUE1UEphZG1RTG1K?=
 =?utf-8?B?ZVM1aVNnWGcvSVVpODVoNXlVSjMyc1J6QVhySkc1N200N2orYnBGcFgyb1Yx?=
 =?utf-8?B?eVJQRDgvYUxRV3N3QllVVGhubnllSEVGMUNRLzRxNHlHTE9KaENUdjZzVDBQ?=
 =?utf-8?B?T1hTUjlCVUk1ZXFUVU4vMjl6czJLcjJ6Y1h6Ni9ucmRxaFFhMFJjUEd6VHFy?=
 =?utf-8?B?MFlRaEJKMlZseS9PY3ZsL2U3OUcweEF6T2Q2czRNRkc0NThCeloyOW5KdDBy?=
 =?utf-8?B?anlzeHFUU1pLQjkyTjcrTEZyMDE5eEw2RTNFMzNpeXNvdzZUSE8wWVBubmRI?=
 =?utf-8?B?N0ZZemc2VWVlTGRlY1VrZm8zY01yM3FqdDdMVHpjSDBGUzVRdVRwSjRoZjVG?=
 =?utf-8?B?RW5mTEJzYmhQNUpSMEZmbmp2RWJqYk9HeGlVamNwODV2cWdTb2hiR3R3dVdG?=
 =?utf-8?B?V2NWKzZOWlRrLy96WENDSzNJZ2hPeFVqSGczQ3BCc0JDenZuVCt6cmRuOUY2?=
 =?utf-8?B?WHNTK3piZ0FqWjFIK1ZTV1EwMmR1bzVuaDM1VVV5bDUyblNybWppR0hhWjNm?=
 =?utf-8?B?T1RBUFhoNk4zZmtYOHduTGozSTM0NHRvYXNIOHY5M3V1aDFoK3FZcWhRRDJQ?=
 =?utf-8?B?RFhhcWNNSXlIRFZxTSs3K1lsVUMyWlJHRWs5aDlCR1l0R1dlVjN2TU5XTHFN?=
 =?utf-8?B?WXgrV1JmNldCenlKemkybDJjU2oxN2lyRVFrUzVJZCsvcXZhTkFYNHMvRnhX?=
 =?utf-8?B?VXR4Z2M1RjZpOFhVZ2dFaUdMUkhpSVZONE1xbytWZ3lrTjVmaFo4bEtQZmZY?=
 =?utf-8?B?Q3hWaE5TRDNFN3Fld2JtcmZscFhwYjBWWVRyakdDSERuMHJnV2FuOGVobFpi?=
 =?utf-8?B?N3pVd3E3ZlJXbm5Lb21JVzBOc0dVWFFHZlMzcDNsS2pZV3NJTldaQi90S2F3?=
 =?utf-8?B?ZVBXd2JWYUx6U2VCTjJFd0M1OEhRZkE2ZXpKUWpZVEtTNDk0bjRROFNRd2Nh?=
 =?utf-8?B?RVFsNVd2YUZlVEp5TGFWVnRQSkYvQTZ1WUI2dDlDaXlNZXVPUHFVbmJnaDZt?=
 =?utf-8?B?emczMDdtT3hscTAxeDQ4TUhkbHhhMWlYUHk1Mkc1S1h2UWpZbzNFU2tZZVVF?=
 =?utf-8?B?UGV0NzRpZ3RhcXZjNVhxUi9VdDkyMkdVUXRSU0V1d3R4Qkw0SjNKSXhHSVFp?=
 =?utf-8?B?MFUzUDAzQ2ZEc29aU2pWeXhTSUZpMWovbjcxOG9CTmRUZy9ENU9QeUZ2L3lt?=
 =?utf-8?B?ZDgvU0NVTFJYRTVmVlA3THhzMHZ2WFV2WUNKaklmQlEvYkhHNFF2aHhmOVJK?=
 =?utf-8?B?Q0hNbStIOWp4RUt0V3RFNWs1WkRMVEpFNzhWekxMVHBUNFhSK2E5ZDJjMW5Z?=
 =?utf-8?B?MzZFQlJVYWtsMUJoYmZONTNZN1VLY3pUQ0V3TlVmOVFiOVl3VFczaHQyU2w2?=
 =?utf-8?B?b0JNaTZtMmJaVGdJb2JOaXp3a0tSeSsrRmxETkM1NmRwRkhjVU00MHdLcDhM?=
 =?utf-8?B?VWo4ak1ObkRiNkYrT1Q1a0tnU0MzakJYMHNtMExhMWlXYkJhWFA4VUtTRS9D?=
 =?utf-8?B?NzJNYVpIKzFCN1c3NUgxSEVCODJva1FMQ3IyaDl1QmlxNWJRRHdQdzNSUlZr?=
 =?utf-8?B?NXh6Z3VjcWI4K2ZvbDZCTG8ycE1uYUl0dE1yQlZjcDY4YTRCZlVLeXlLcXh6?=
 =?utf-8?B?NXhrRXpWdnplQTJrU2FYM2EvU0ErYUpIVjR2WnJYOVdxOXFaMklBd1JFVmY2?=
 =?utf-8?B?bFVKRUQxNG9FWkhGVW8raThTRWhrU1dTbHRkMFVTNFBhQnpGT1dVTU9SNnlu?=
 =?utf-8?B?b1dKQ1VsNHNzUzNLeG9odkFKak1rYmhUdXo5TW5RTjh6Q1ZpM21TbHB0TW1F?=
 =?utf-8?B?ZE9HaFJSa1lENEtOMnRwbkVObjV0dUwyakJldTZEWTlQa2wwRCt4N2w5UzVL?=
 =?utf-8?B?QWVoUVlOSmdsUFhRa1VEUGE4YTAzbUFmL0VmSWMvSkxUM2xlRFdxNjFSZkNW?=
 =?utf-8?B?cnNoMWdrVEhtWEtQTTJSZUkxeHh2ZVV2VzY0a0hScWViaklhMlFjNkV5NTNN?=
 =?utf-8?B?RWprNWFZSFFUc0NIVUl5c3Z3SGVQWGhEbW5tUFNuNTlpaGtVTDdERW1oUzl6?=
 =?utf-8?B?cFBGNDNEdDAvcE43SVlNQWt3ZnVIWElKT2ViUXBFcVVPdzIzVlNhY3A3UDVR?=
 =?utf-8?B?UlNLdGgzclFRNWJDWjFkTlhRbzRzRjVPL2tSMUNpR2FmV0k1bFNvVDNZNXNu?=
 =?utf-8?Q?ErXDacITayxsd4os=3D?=
X-Exchange-RoutingPolicyChecked: iyc373w+VXGTBndNfVKOFFd3eakzdLQ5mvqsFIz/qNeZXzL46OVzLAQVY6YcILq4rxAkmU9iuCHJ+YX9Boa9Mzzprsn+QEXKeaYpUUNkevO160CGDT2LWac+t3iPLtWo8ThwKiaNZ0vVa4ZYne/i8uQjrJqQz/JFHfF6EaGKXdv/MGN1utsG8B/xlTSMrBHNGtpB7RPo/u1jVz2md/zpAgD6fYMnxoYvU/+NCDBKqc7nGr0RZODF8jnZSlQuGchTcHUS1q58HJRXjKE9Ahmv0rswmGsN6/CaCcwaFdobgJiZDvvM9UjMu70HCaOrtpHJ4XWH50Ru3A4VT8aZvqbx1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 117f8cba-c54c-4dc2-bd47-08df1a7a35a0
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF44E8B88DF.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 20:27:10.9141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXLtnAIBveUzrfvB5P4rWEkq+Z8COfpya1Owf1F9ff45R8aHhrAbe2Kn6cZv60ZHQzNQsUUYqAHLqLbMCUFY5iUtbL/Vv304eptTMP3Zg7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF681F257FD
X-OriginatorOrg: intel.com

Hi Mark,

On 9/24/2026 8:17 PM, Mark Brown wrote:
> Hi all,
>
> After merging the pagemap-headers tree, today's linux-next build
> (powerpc ppc4xx_defconfig) failed like this:
>
> In file included from /tmp/next/build/include/linux/preempt.h:11,
>                   from /tmp/next/build/include/linux/alloc_tag.h:11,
>                   from /tmp/next/build/include/linux/percpu.h:5,
>                   from /tmp/next/build/arch/powerpc/include/asm/time.h:14,
>                   from /tmp/next/build/arch/powerpc/platforms/44x/sam440ep.c:21:
> /tmp/next/build/include/linux/acpi.h: In function '__free_acpi_object_free':
> /tmp/next/build/include/linux/cleanup.h:211:92: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
>    211 |         static __always_inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
>        |                                                                                            ^
> /tmp/next/build/include/linux/acpi.h:31:1: note: in expansion of macro 'DEFINE_FREE'
>     31 | DEFINE_FREE(acpi_object_free, union acpi_object *, if (_T) ACPI_FREE(_T));
>        | ^~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[6]: *** [/tmp/next/build/scripts/Makefile.build:290: arch/powerpc/platforms/44x/sam440ep.o] Error 1
> make[6]: *** Waiting for unfinished jobs....
> In file included from /tmp/next/build/include/linux/preempt.h:11,
>                   from /tmp/next/build/include/linux/sched.h:15,
>                   from /tmp/next/build/include/linux/ratelimit.h:6,
>                   from /tmp/next/build/include/linux/dev_printk.h:16,
>                   from /tmp/next/build/include/linux/device.h:15,
>                   from /tmp/next/build/include/linux/platform_device.h:13,
>                   from /tmp/next/build/arch/powerpc/platforms/44x/warp.c:11:
> /tmp/next/build/include/linux/acpi.h: In function '__free_acpi_object_free':
> /tmp/next/build/include/linux/cleanup.h:211:92: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
>    211 |         static __always_inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
>        |                                                                                            ^
> /tmp/next/build/include/linux/acpi.h:31:1: note: in expansion of macro 'DEFINE_FREE'
>     31 | DEFINE_FREE(acpi_object_free, union acpi_object *, if (_T) ACPI_FREE(_T));
>        | ^~~~~~~~~~~
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>     f54586fcd661e (ACPI: fan: Use __free() to simplify AML error handling)
>
> (it was also causing lots of warnings in other GCC configurations but
> didn't trip -Werror in allmodconfig since it doesn't seem to upset
> clang.).  I have reverted that commit for today.

Sorry for the breakage!

Apparently, I forgot to fix up the patch before applying it (even though 
I update the changelog to that effect).

Should be fixed now.

Thanks, Rafael



