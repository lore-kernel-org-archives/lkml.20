Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794279492;
	b=qQkZDwetM+6ukW09W1zd+7YFRFK0OFtNcLFOEsiN60GemLTfrQ5bXl/XAEo7fbAX50ny
	 Tamh1A+HO8zmAoF1clJCWbfFVYNzkRwa4VX1gzuVClzhqpt5RxSVSYFYYfDcFI4tPSHpz
	 3ToKM7B515GtpvtGUBARu8plmc1fZW44zXOdjtRQJUUS4azFgFc99EJO706QGL68cQSY/
	 MrcmQAfrfDESMpqBVhA7Y/0r+BTCTKbMY+XXQbtAO15V8YZLRhtkYpkesYWqardo7OPuF
	 41jA2TZyGcvruO/+IzrNNGXrfmnLwj12eHG8TD+Wud5plaLSOvkRY9FKJBiCGJJRYjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279492;
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
	bh=aE4ebaFuY3+wjCZsv0C6VAMkjeBeV+00ritDCs0T94g=;
	b=T8f+2HXrk0+6FykkGozEhpoPxwyctqb0AVKjNEAKOypzwg1D0XFWBn5vqClQ0N7dYmqv
	 +2V2QGH4RBwPoT2M/u87600pR6eygcCrUPiIyQxnXM0IiNhTmRj+XuJBFjJA2HeboZGoo
	 61jVWNMT6Hw2/5eIazUCZV4smpfD7tCTBoPueYNRlGaPhOp635GlK79sDISmRLlnFzW0Q
	 WAzp/mqOvJqIkF5BRgMKwQ39ne4g3WTdvbD4NmaDeYTi/LqV4iEnTZ2R1jqQOYvdKlzaY
	 l4SKamQvJ43mAIrtKXBjsg/YUSgdjsOi3D4PROMPc06irVGQj46/7skDWREtZwcYzCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nVSPBHVH;
	arc=fail smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBC5606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BBC5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nVSPBHVH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794279492; x=1825815492;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KnvZ7xtszyDLl3iQQB8LiWfxVgiKvND81dcb2c3DhM0=;
  b=nVSPBHVHtrt005/hogPvYiaxxDm2SVkuZ8UFTvFhzmlEPSHt82q/h9IH
   jKtarlUddJSEy7sFLvAr0OMNdUsLGp3sKnBvBfTt3lawUAzB4EEz/pmeh
   SQi+i0dueV4tY2VIOo8v1PNaVXdA/FNWGr6hGz0u9I4FNPR4qg07oeqte
   YgeZSM/jZq3lNZpOpMpZkLJlnZhCA454wt2wHzSXvCjg6Q2fhw0npsEj7
   xghUPd+tsMfjabJS9F+1yR/dfFRA6dig63dUDWna1cXbwdzWhA6eptLCt
   n7IdKhtErVRf3Uo0GId6OxtMr6M+bqN8lrQJHfN0rBKDc/avNr0hoL6+H
   A==;
X-CSE-ConnectionGUID: PaWGxEJqRv2fscuu5JJHaw==
X-CSE-MsgGUID: sBzsK0vZQMCP4LNTnjVoEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2931958"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2931958"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 18:58:11 -0800
X-CSE-ConnectionGUID: CtbHfwNNRNe4nx8iQMua3w==
X-CSE-MsgGUID: FVr7S1KqQFOADwxEKBOVnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8040328"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 18:58:10 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 18:58:09 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 18:58:09 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 18:58:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JA+BvJMUU6hhXzsjnc2ZT9wnWAQX3+ckpKIxwQ7gOjUfmjfeLD/YtayseOiDHyIkK4cniM8MNyDqpiXVm781myBYteIoQUtghQP/jAGjrP/NVJpebVrB0f4Ssr/t3ehj5t+rm6E/yYxqJvpZ9W/NGqvNsu1t2PXoTjllWHGRBHkkxyGuXcbLFGehUD8J1pB6pEQqt8ilIzquolGJdn4LLIx01wgxK0Ib3aBSpmiH/kpbdDOJAoPCqFjq0W69n846HDyQABrnaeLs6OZDTUHxKawl6Cr3j97IPBqbNIZxPhvUeU/ofhVDbQNZ5tr80bf9OirFx0Qt2uIzlh2etDVUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aE4ebaFuY3+wjCZsv0C6VAMkjeBeV+00ritDCs0T94g=;
 b=rj8ii19ORODlLj+3kOqWDH8hlyV+Gv8alw8McRW1xTEtflZNNN/ishDiC/xQodKrijEaMGreFuLjjl2MwZ2AtsAhfo0iKWvgWSn1/Gsj+C50GaMsVd1Ogg59ZF3y6uvAEV8vUnbLxkonVUp1bbOtkrjCDnf/L6pV9U6leSKGrgZk5qsZp/jKwuf9pgfUmPJAJtEMbW5U14+VmpUXI2cvQZR1yBgn0OrUVJ+TMBqY36F6iCwpc1H5M/q726Uhx9v/ZKEx9iei6ldJx00yRt23OmNNSiU9QGyEtxLGdKW3mZ/ptmLaByQKei/TysO2uB9mdlcUod9INZA0pQXi8gGlZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 CH3PR11MB8187.namprd11.prod.outlook.com (2603:10b6:610:160::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 02:58:06 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0592.009; Tue, 10 Nov 2026
 02:58:06 +0000
Message-ID: <35c49d1a-4447-48de-9741-dd6200dfe8a8@intel.com>
Date: Mon, 9 Nov 2026 18:58:03 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] stop_machine: Add NMI-based execution path
To: Borislav Petkov <bp@alien8.de>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <peterz@infradead.org>,
	<david.kaplan@amd.com>
References: <20261104182322.578066-1-chang.seok.bae@intel.com>
 <20261104182322.578066-3-chang.seok.bae@intel.com>
 <20261110024646.GGavKFllskPQiLrNOK@fat_crate.local>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <20261110024646.GGavKFllskPQiLrNOK@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|CH3PR11MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: 096561af-31b0-472f-e23e-08df3ed67185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|4143699003|56012099006|261021121427099003|261102123227099003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: ORfrCMuUxhaLEfyITUUeP0RC2pPqnXYZDLpQsDz52H2kDzTeEQA7zd06ByLMwAkFGZ5XZVVJ6scfS68q8akj0wSisbXxtyIV/L5H3mpL+iu7GCQ1c2zKqOOtPganijZXrxSYWCCEa0wl6UWYdvPtxrzSDxi3LCZbls+2g0TJaggD8a2lE6Vg+Q6slS69uNfvdqsKLPTqFpIin1VDNG7EUCCg8gdSNCSXdDRiep4wFJlfOpjsRdxsSw4YeElk0JigPmi1qoOBUL4mpHo2F8YHiO5a6UoqwXmrBkpRl7FXB+ySyRyIkG0b7z8XIVarkfYUBhXHO+9wlHm5BJxSeY800tYZuA7AWGr9Xu6G4QKQJ08mRuVO3EJCcjRaLhKIzE++9MWVhFcdpUvHvy9tfIZlT4q7uAlfUDDaNZdCgbN2Zx9TUHPSU5NDvLdqfDc+o+sZt8LWPW1JP03u1DxxC6Im9WnlQQqWz9w70sbZg2S6plReWc0CMwQx/uK/7g69SWPkhDZm6vrOdLktRruYJPMcvXKQmtjiRrIdeNB33ybDZqGbLkdiiA9ePzemkEh+Jt2TnNlfKPWRHiBfClb+YhWjRtP3HEzE0aCq/88/MiNbO1OHEWnnXZLX+S7DOPZZ5AKA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zkl2ZjdObTlJVXI3ZXRva0hvWmpseEcra1BUNjlQNWs0ZjR6UzU4VTlCZXJF?=
 =?utf-8?B?enpJZ1pTRnpIalZFWWlqSm03UDBaNkdQTXdNVzNQQW9KaU9TUjd5RnR4NlNz?=
 =?utf-8?B?eWtCVTRnTU45OFNURExCUnNrMFB0NmJsSGZ2M3V0WkRmNmVHQU85bGFLVmR6?=
 =?utf-8?B?U0prZ2duUGkyaFdpYUJpd1ZEZ0MyQ1pnbnZDNk5HazdCUmNpMzlkMWs0WWNJ?=
 =?utf-8?B?RlRUK1FqeUNPOVFScy9tWFZzYlNRS0h6eEw4RmJ2QnRJaGdNYTZvTGR3aGpW?=
 =?utf-8?B?d1poOHZ2MTlLcG5nMW9jWHZEM2JIQWN4NncwaDJjTVJabTFVSnRqOGlEUEpi?=
 =?utf-8?B?d3F3bDZlc1k3Tm5EN3V6dFRxR1RtenJnb0YwU2d5aXowckdIUndKUmhiL2Jz?=
 =?utf-8?B?YVFkN1hYc01nTzJwcE9IL3JjR2NrOU10UThpeFgvczR6aDcxbkRiWkVqUjlz?=
 =?utf-8?B?bnZQVHdaZ2lsMGlGZ1ZoTmVnTlNFQUI4MlhPaXA0aHU1Zy9NaHBwVVVBOHp6?=
 =?utf-8?B?SXpwY3d4WE9GODkxQnJuSUZyZVFEc1FqYTdETHBqUVdLNXdyMmpkc1NwQlpE?=
 =?utf-8?B?SXVhenE4emRUdk1zZUtodHlQbXpad2w0Y2tjaUd2TnpzUEExQ3ZsaEhsVEV2?=
 =?utf-8?B?azlwVStYRUJMS3ducnN3K1E1dFE2bGZnd0lscCtOMnBuQTZjRU5PdGMzcERx?=
 =?utf-8?B?U3lQZ0hJRm1odStZc2dMYkNkNUUwTWFyZFJsQk1Bd0U4U2d6R205emJOL1Zj?=
 =?utf-8?B?K29OR2hHdHZMZzM1UTFNdTc4a2dmS2tHd1M4MGxkM0RmaCtBTWRNUjNVT3pE?=
 =?utf-8?B?QWRVUDk4eE01SHc5M1YvcnZHdjdsUWJLSUpzZGVnVVovdlMwT1VoOU5xZmtn?=
 =?utf-8?B?SUZVQlRYL3U2NFl1SzRmRFBqU2RIOXZCRTZEL3luZjZ3TU5pT2hHRFN0VE9a?=
 =?utf-8?B?UDFxV2hoa3hUdW5FTU9kY2lnN2xCOUNGTEFjNzNSTmdNNHJJb3hMQzAySDZN?=
 =?utf-8?B?dEJLdlMvbmdmU3BtUDU4RmZPVUpFRHluYjZaUnZ5Z3I3Z1RaR1E4bHlob3Y1?=
 =?utf-8?B?dTlGQTJ3dW1TeUo3cmtZaHA0eHZNMkd3OUx4ektyalY4T21Pa3h0SlZqaGww?=
 =?utf-8?B?NXRLeFdBVjlJcC9pYlJtdHJhZXJqejl0NjFreXlyVnlUQzMwL3ozeGZrUWI1?=
 =?utf-8?B?RkxhWE5QSkRoaVFqd2dMUDg1YVJHV25lY3NSSUlHcjdKV1Mrd2hsRWJGaDZZ?=
 =?utf-8?B?WmtTYmNTc1hGMGM2bTRjYW9Lb2tXa2xNZk1vUnhXSUtnVzAzbS9aRmU0VzZt?=
 =?utf-8?B?TDBKc1VTYkpoZ21lTTdHYjUxb042N0hWc1ZFWS9tU3BQalFhVEtKTmxYUVFS?=
 =?utf-8?B?aU1TNktpaDIzMlJtdXJmSkNYUUk5UWRzVGJycnNkTE5NWXM5aDQrdXh6TXpW?=
 =?utf-8?B?a3h0K2szZ1ZMMUhmc0N1aEtmZ0NDVUwrSitheUdxWUljd1MwbzBBNHh2a29a?=
 =?utf-8?B?RFBMVmRtOGppa1c5RVorQzFmNHBQOUlCWG1tZU9ic1RTQlBIZlFsZTBMN2Na?=
 =?utf-8?B?dzM2dStxWXRiY2grTHFseFM2aFBoeCtRTGJDUStSWUZaQTJ5N25VSm9HR0tk?=
 =?utf-8?B?S1JMWjdEZUdxR3QvbGJoMVJINVVzYlEwWTVvTDh2bUlIY21aUFBjTWw1cjAy?=
 =?utf-8?B?emxKcTZrNHpBVlcxR3V3UnREWDJ3NWZzSWd1d0thTU0xYThTbjRGTlJ0VW1r?=
 =?utf-8?B?Um1tQkw5Z01QYXF3eTdwTkQzcm1MdnB3MjRRcUozdDZaVlo2M3BnQ2I0Q0E5?=
 =?utf-8?B?eXpuYjgrREVXK25tSSt6UzZNelVpaG1XUmRJUmYrVVFSUjJwNXoyUHkxQW5r?=
 =?utf-8?B?NDRhQmR2dXJjR1hPSUxHbkczOVpZWWxnNzZmN09SMktUMFRXa2c4OXN5dWtG?=
 =?utf-8?B?UEhUaFdHUnMrZS9BbGR1UDR5M0NhOXVsRlk3WlpjWDNKeHk5WTNKUmFuR04v?=
 =?utf-8?B?MTBSRGp2eWUzajFIbUxFeEplaWJOZUF3L0VHaEg1ekl1NXZrTEhIaEpDdnNZ?=
 =?utf-8?B?MENKTVZoeU9GRmx0SzgyODlaYnRWczhmYzBsK3I2QjdpQm9ZQlNZU1I1UTVY?=
 =?utf-8?B?K3duYXdFQUNIdFVqdnM2UW5jMzAxdk5LQi8zNkYzbzJNTUpJbHo5YVJPSFAz?=
 =?utf-8?B?Q2lqQ0Jkc1p1ZjN3YTh6QTFaOWRoYTNKcUtZZ09GdzZaMS9Tek9TYXA0N28x?=
 =?utf-8?B?aWlCQWJ0bzVNQkdtYUJGSTBUN0hWWHZkRG1sNGc4TWNieUZKSTN5MUxLQ1dZ?=
 =?utf-8?B?VVJrSkc1UVRneFkwc2dhdXFlbGtpT2M3bWFEK1pXL1p5eDQxS25hdz09?=
X-Exchange-RoutingPolicyChecked: OtBc4ffZjufS/0lEP4+bJFfKBjLnTmi1HgpCH7+KNlwGFRkiZhivfosPpBoMP/vFRydvW5NvvkOdCqIUlb8DpnHUpxVCcy3nPy+5BBTEYee5Pr3KXKokRsgBUPkUdiRgkOQq3UAWUPsllyjG91WFuFyw5LziDP+ExHZt11bdQCQtFw7SOAP5VANHuqVZbNp4+GX/ivwadFstBiGeF+TCfLuspo9UXe8uEmmqwmFbxuS6U5Ac7dqlw68A0t6TV9h4ZH8v1DxbwGcL8TjJIFg8C9huy361lsfcdY198/vSa3aBwOLWGqfHZC4leX/myu2AKuPYdQBp4ZObNyYusAwusg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 096561af-31b0-472f-e23e-08df3ed67185
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 02:58:06.2139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EwNbs4VfYkITdIdlnM9YkcNhZZX+BPw1MVVKaDz28XGJfDcADQ3peftQExNf+I4LnH4Oy4Pfni8c/clZFhCzgUJQfYsLLnkY7s7Tsha4UaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8187
X-OriginatorOrg: intel.com

On 11/9/2026 6:46 PM, Borislav Petkov wrote:
> On Wed, Nov 04, 2026 at 06:23:15PM +0000, Chang S. Bae wrote:
>> +/*
>> + * Instrumentation may trigger nested exceptions such as #INT3, #DB,
>> + * or #PF. IRET from those would re-enable NMIs, which opposes the goal
>> + * of this NMI stop-machine facility.
>> + */
>> +bool noinstr stop_machine_nmi_handler(void)
> 
> stop_machine_nmi()
> 
>> +{
>> +	struct multi_stop_data *msdata = raw_cpu_read(nmi_stop.data);
>> +	unsigned int cpu = raw_smp_processor_id();
>> +	int ret;
>> +
>> +	if (!msdata || !arch_test_and_clear_bit(cpu, cpumask_bits(msdata->nmi_cpus)))
>> +		return false;
>> +
>> +	/*
>> +	 * The indirect call to @nmisafe_fn() is indistinguishable at
>> +	 * post-compilation. Temporarily enabling instrumentation avoids
>> +	 * objtool false positives.
>> +	 */
>> +	instrumentation_begin();
>> +	ret = msdata->nmisafe_fn(msdata->data);
>> +	instrumentation_end();
> 
> This is just silly. We should fix objtool here.

Here is your previous thought:

   This one would be hard to fix because that's the

	err = msdata->fn(msdata->data);

   function pointer which objtool can't see through.

https://lore.kernel.org/lkml/20260127144947.GKaXjQi8R9cE17WYKM@fat_crate.local/
