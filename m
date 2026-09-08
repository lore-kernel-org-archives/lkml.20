Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F117F318EC4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853528; cv=fail; b=J9UPg5mettjWEIw+0j7XV/3S3O6aDGtXe2gUF2TQ1ZfBkG/+tRwFQdPL66fV+V3Y5vNF0GLs+UopFJDp2/Yjs9zNvfHhS3ISK02Mnp6DBmCnumd7lbWVnz7KZEQKkcpOu3P6spKMVfk7FUUeoFczGyKrTFti/JXwrLkH6n70Bg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853528; c=relaxed/simple;
	bh=utu1dCR3Tv5UmIbiEKw3fENJ3syleMMP6ygRZwcpTvE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S2QadMLHoO3PDma6q9NXfI17PnXPRMJjeK67LrKaS514k/qW5JQF7I4goGSKyfSWN+BP5GRtePv1Uu5EN+eBgjolYZjn8KVoKAf2bvBX5APolVOv5ZicnzwN4v8rckrw5Oec0Z7EYudgH4XnKDUtJTNw6h0+0tpC/hPQibtqzGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5YN53Ud; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5YN53Ud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788853527; x=1820389527;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=utu1dCR3Tv5UmIbiEKw3fENJ3syleMMP6ygRZwcpTvE=;
  b=L5YN53Ud8BLBZQx5Y7286Hz/3GQV9PzUUKQPM6ZqphiRo8Gcsieqro3K
   Gn5ZWPLKAgYSnn3QzcNmVpOespcmjnr7ClxI7qwTpWxx7t2vZMDdv6z9i
   6B3ynckGYrW17b4XCJ1phuv75IWSDbtvZfnWqVeMne0YQthGnB4knuAX4
   UJL802du+kdNDOPSUSLkzGauWb3l5kFSSyDZVdiZDQ8VUgKrcYfiJAPCI
   7AK0OoFnmvuwfA3fqMd5nNGbZ8kJKXjU7lRmN9vm/9gxxFO86NoOL1ZTS
   onHR8tA5FovsYolYaqNHIyrRqzDIwM60fSI/tqgK7ggWNRJlA0NSmhO5M
   g==;
X-CSE-ConnectionGUID: wSktFwjBRh+mGgaiToQFGg==
X-CSE-MsgGUID: We4pjXyEQaCrevhaynxRwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88183114"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="88183114"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 00:45:26 -0700
X-CSE-ConnectionGUID: GjPhwxd1T+ytq3gTxsinsQ==
X-CSE-MsgGUID: 1CfltM+zTZyKYFMVkzb/Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="264722449"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 00:45:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 00:45:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 00:45:25 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 00:45:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=po83W1FytXKLEjh8CvoDJf+LPMI8imN9BOPg8a3czb1p1umxD4ZTdokT+ZEog13rIgJy7eXD1ZAGT0Ol8FFNVjSL3O9zqUnJNek87v8j+aiua3YKdFhcOKnDH99e9FwgM/0RI2UdPh9Dbt/bRZUaQ82tOgp9sg/Ge2e3Sa75YSe/mnIulFQIc9tugC0xLbZlsWT6vJsw6Yn0kX/xhknqv+FELL8ZlhV3MY4isUTetMpH9OtGcD4JCt5Zz8LFJ3o4vEodsQy0PMhsvVQs/viyLj0UczUi1pcU5C9Q1yZ4kJqHOVdsbNqnGN/dieC/E+siZ3wh/f/bhhreKL4TXWaP5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVymlzWQ8tsM0FSqxJuZIafGFA6NwbhHFAnh0omBRVs=;
 b=UGGwC3e6y4lobC8R3tHx41E02J7VlgnC3WUHW9PJy9O4EozJjKqzpEN8eDzsHSxQFW+fjV+DvBT2LSfdj85WzRiBqAta4xSA2L2Y6mpwLgEzyiOXvNkZ74AXFm2dnZwiye/lYl0uMTxlhF0lOJ+6bHOvDRM9JADeLKtZrd4EKQ9cPtHj2thUVqb6YVX3JyMi3AvTNXAfh9a3WdU60BTFh6KbXZf3Ylusb4Vu6qwCqqjXSNPtU8Kwsc3oBZVu1nnkHDQM7bUpJ32LFYcTtu9EFkcyMYWaxmg5paiGCw65PM0QO2xXrSdFC8cfmqZsrpDv8305fZqIuysIgCubtSTB6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA2PR11MB4844.namprd11.prod.outlook.com (2603:10b6:806:f9::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Tue, 8 Sep 2026 07:45:17 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 07:45:17 +0000
Message-ID: <d3d06a7d-1353-4007-9b05-80a2177266d6@intel.com>
Date: Tue, 8 Sep 2026 15:45:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] sched/cache: Drive cache task tick from execution
 context
To: Hui Su <sh_def@163.com>
CC: <peterz@infradead.org>, <kprateek.nayak@amd.com>, <mingo@redhat.com>,
	<tim.c.chen@linux.intel.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <jstultz@google.com>, <linux-kernel@vger.kernel.org>
References: <20260904085244.799276-1-sh_def@163.com>
 <20260904085244.799276-3-sh_def@163.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <20260904085244.799276-3-sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0038.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::11) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA2PR11MB4844:EE_
X-MS-Office365-Filtering-Correlation-Id: 508cc484-4577-464c-757e-08df0d7d2003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|4143699003|10067099003|6133799003|11063799006|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zl08C8EIIPzh3JsaTc3OC6XB5yI8wbnua3RL6pVGaxNvB2D5Xjb6gkzNdN7n1ynr1Ebf0O4sOIP3+vow0SIhOBghMXtGS+MFx32ercOjMV9AnpDthZ2rXT5OSiCB0AxZSs7UXVQrRIhTI3LHtQ3bdhU0rEkib1+G1boWa3SPApl92TZMop49clMSB8z+pF++fjuBq/aX+tEHXcNXhceMUHHvdLLSvb1YFQjbtaV0baZlo5v+mE3tL6QuXU3nQCKIsmjc5f2/kLbue12416leCbkI+BgX2QjXhTVB7WRcPKJgTC19wvqrSQRde17fzUzUp5NWf6EXfBOd2IVWQbN2O0yBnbbdVAjJEKR+0x/n18bcuqQPqWm2G/LIFLIfmiW+SZAfYTQpMZRcLvNlsbFYJUygo7Fskha32QorFdeT6xt+BHvdSj6/sclr9M+rnDsKRbue6VB9EUte7B+RuB7pfHm1Cg/9EhM68kWnUk2BQIzoAjBK0kDDQWe3dzOmALO/sKLVGqVkPyIENsRIZOk5rVDol0L1yEx7bBc1tnJsM+kn0te2mpFqxtoR76CSZ/tDJb43YTN6OdPqyIJT2Sw7j/7qAtkHRSA+xhk9sWWnRafpI1Xve6jGD51XOkOzRWYNoaqhUMrfpLfK2yCkTZ38LjIZRbRAgod4/uvoYNsL6x0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(4143699003)(10067099003)(6133799003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEh6ZE5JZktTMXNJc3ZEbmVSc3hwTWNJOHUzazIwSEhrbGh4SWd6QTRKOVVx?=
 =?utf-8?B?M0c5bDFaWEhkbEJkb3V5bWtwRE5CdVhRbE5nWWRvSG0rZHNRSStuTFMrYkVK?=
 =?utf-8?B?aGJTMSt1alBpakJlKzJHcFhXRnc1WEVOMkxOUVoyVUNYM3oyRjFNVkRmRllW?=
 =?utf-8?B?QWt4M3lTNzFJcTN5V1czM3hUdlExd1QxRUdBd2h5T3NncnNSQVpDZkdSMXJO?=
 =?utf-8?B?UUI4OGVBeUNrKys5Mm1KMjlnY1AwTitxRWhIMUswMmY0RmE3YTFjV2xKdHRm?=
 =?utf-8?B?K0ZCbmhScnVqSGg2dWxoakdxVGtxMGc5dHVnNmpRb0cvSWtpUE5RL3ZiOUdJ?=
 =?utf-8?B?eVhBQjc3V3pPL1U5ZTB1bTBVTzNRQjJMdDJGK041b0J1Z0hYdlVaVGVHL3la?=
 =?utf-8?B?NGwzdXhXT1R3WWU0TEZGaWpYTHBmU3NLajR6TGpJZk9LcjVCTXpuWlhVTGEr?=
 =?utf-8?B?OEUrRHNpK0tpYWhHNEdVU2F3Y01lVkRKVk92b2ptc201RFUyTFZVRWFQMXdl?=
 =?utf-8?B?VnVPN0gwc2N2UGpKSDNNWGt1alRsRGhadzhTN3hnUEJWUGR5SDZQZE8zY3Zw?=
 =?utf-8?B?TUVsM3pHZ3VWa24ra0lpOHpoT2RhZ2YvSkZiQ0hHazJ3YUhPSnJzWHVySmor?=
 =?utf-8?B?YVM3NlR0UzRYQ2RiNVp6c216Y2M3cTFsQ3hJbWlOSERPd2haM1F0Zmg5NHFp?=
 =?utf-8?B?bkNHWGtLaEJndHF6V0ZrbjQ1QWRocWJEMnJGY2RpTWJadWZZb0hmQXQvTUhV?=
 =?utf-8?B?anB6eFEzME1iN1F6OHpmU3FUZWFTT3hVak4rVVN5UzdTY3hZWU9kMzcrTHBP?=
 =?utf-8?B?NnpkV0lBdllQTFJBeGVoOFc3dUhRTlEzWHNsZzR2bzlYeE1yZm1GdC8vNS9h?=
 =?utf-8?B?aEpkK2psM05UUHV5aS9QTzZpSExJLzZSYW1qSEthR2FqWFl0RGxIcFBib0VM?=
 =?utf-8?B?TTBYWFVwaTJ3QzBGUzNsUFNyNkxQRktkdnJ4UkhmeW9mcmtJenprckpvaHVU?=
 =?utf-8?B?Y0lEdzN4UTFNQVBvVFhXZDNMWjNyWE1TWng1SzhXcFo0V2prRVZHTGhha0wv?=
 =?utf-8?B?YzlsUVVmYzJnT0swQ0FxZzh5MVVjS1FQSldpZ1VvYUx6eFBUYU9FaU15LzZH?=
 =?utf-8?B?YVl5SHBHMGVGQ0pzc2k1SEk4dWRsbjdQbDVHOWhaOElLQ1RhaStxQVUvbWVo?=
 =?utf-8?B?aE1mdkp1ZHh4MlJSbXl0ZG9WOFM3RVlJT1lUeHIvditrUXZXMHdsNjVaNU42?=
 =?utf-8?B?bE00QThFUTY0NDFldWh5VWhpbkRUOEN0TENUaGoyTDc3YTRvMHpqZEZVbmN4?=
 =?utf-8?B?cllJY3BrSGZhR2FtUzJWUlZ1WVllbmQ5aU41NTM2a2FvdUNLWDRFQlFMdTA3?=
 =?utf-8?B?MnBIeU12MnFwbzFWOFRVbWRDcllzQ21XbU1mMnRmYXcyaDVxQWFWU0JldGhy?=
 =?utf-8?B?bktNbnJtZU13Q1ZyT1R3d1FnMFk1cm43RUc2K0x0WHdybGFDM3JVMUFRM0Nx?=
 =?utf-8?B?eW1abjkxVjB0ZGRpTnIvMXA4aW1hQ3NmS2tucHdtbkpaSGp3U0xCMGRwcS9v?=
 =?utf-8?B?MXZNc0FDbDAxSGFRZ0lyU3JiWCtQdWJPL28yOHdseEZyK3luSURxNHJBcDJD?=
 =?utf-8?B?bTQ4cUxiaHZDZE1iTmZlK00zWERYQkZ4UmJVenp5Qm5rR3ROSEhOUkR5Vkpk?=
 =?utf-8?B?UEUyempTY3ZRNGxJSEpGai9KdjExekNISUdWNnJZRWtjdjUxaUR2RWFDcHh0?=
 =?utf-8?B?dGl3QkhLTTR6SFJJcExVUjlhZ1ROSzU4S0FTS0M0RUd6bUM0ekR0SFI1NWwv?=
 =?utf-8?B?ZTVBT3V5Y1VzaHhjdkpXVW5zNGdVclZXSFRycnlWcEd1NlFDM1k5N3V3SWNa?=
 =?utf-8?B?bmlmVmxwM3M0OGl4emFlVXl2Sjdqc3NyZFczUHRPWVpGUGdvVVRXbGgwWkli?=
 =?utf-8?B?UXVQaVgrQldIcW5JalRaOGJTR2tVeFBBRHdmMUF5dEgyQVpSNHg1dGo3S1dp?=
 =?utf-8?B?TURDK2pQTWhWRXJnVUI2K2toOHdiQkh2bktNY1RVdGFoWnJPSUZORWYzbjdE?=
 =?utf-8?B?elJpN0pud0RYYlBrdEd4Q05tT1lRN1JWZEhJVGxsWjJ4TjRMV3F1ZXl0cXhv?=
 =?utf-8?B?QjRwSzhGaXVCanJnMU11Z0plSjRFbi9JVjd4VmgyRVRqT0hrUy9NTzVYSFJY?=
 =?utf-8?B?N2xtOVV1ckducDBTRFhaL1NkMVFjSnN0aG01ZmxmcFRWdVpYU0ZnQUNxRFRz?=
 =?utf-8?B?bXlqSzRqcGVpTkhFck5CTVhsN3BSWFBHbG5NWFprODlJTDF0eWhLelVoVUdS?=
 =?utf-8?B?RXRHWWZybHE4VWhoaGR4S3pwUnBFbHpMSURIanZWaVhoVlJ5dlRlZz09?=
X-Exchange-RoutingPolicyChecked: VVyE/JJB5hCX+VykedOvf03QQN2rI0dNIrZn025ih+rN6Slgp9xvPz0FUtlDd7q7G6F3BMJAzfG0YA0KczIhyn0miqKGc2jT0Cr2ANm7BHcpQrgsH92A1hdxrSJmO7j3vTZXdeakcXKfM4/hV03+6JVNcX5dfTny2fjakxCN3F1c7uoCqn1FVI4bKwuqhJvgBKGUeWlW/9cjP53s84v6ZLKpgfo90gn14HlRF6gRzdWTN/saWplRGt7VoZzW+w8M9c5pnmKW7ht1d1u85TjMJeKIp4uPHTzfTc6fv2klmUyQ7qRI3mU7fDMfTvjh/GnmEEzLZ6V81QpO/aGMiubK0w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 508cc484-4577-464c-757e-08df0d7d2003
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 07:45:17.2490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMWJQcdXISM55KHV/8NX2jwX0/+FKNy5JWIGyUykcQioLvzmFXzs/KGjTfbCryNomSav/wXZgapc4ff7ADplqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4844
X-OriginatorOrg: intel.com

On 9/4/2026 4:52 PM, Hui Su wrote:
> Cache-aware scheduling accounts CPU runtime to the mm of the task
> actually executing. update_se() passes the execution task to
> account_mm_sched() for this purpose.
> 
> With proxy execution, however, sched_tick() invokes task_tick() for the
> scheduling context in rq->donor. task_tick_cache() is currently called
> from task_tick_fair(), so it is skipped when a fair task executes on
> behalf of an RT or deadline donor.
> 
> In that case account_mm_sched() continues to advance runtime accounting
> for rq->curr, while task_tick_cache() does not advance the corresponding
> mm scan epoch. Once the epoch becomes stale, account_mm_sched() can
> invalidate the mm's preferred LLC.
> 
> Move cache tick handling into sched_tick_exec_ctx(), alongside NUMA tick
> handling, and run it when the execution context is a fair task. Use the
> same helper from sched_tick() and sched_tick_remote() so both tick paths
> handle the execution context consistently.
> 
> Keep the remaining task_tick_fair() bookkeeping with its task argument,
> since misfit, overutilized, and core scheduling state belong to the
> scheduling context.
> 
> Fixes: df0d98475954 ("sched/cache: Introduce infrastructure for cache-aware load balancing")
> Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
> Signed-off-by: Hui Su <sh_def@163.com>

Thanks for the fix,

Reviewed-by: Chen Yu <yu.c.chen@intel.com>

thanks,
Chenyu
