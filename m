Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0C949250C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632190; cv=fail; b=faUowowOrCBjMfuS0Trdeky3NkQutOZsWWXRxOt3av69BB2V00LIn3HwQMS+u5fgYBN6gWXbV6i+kNMDs/IRPdQzKtWGf/w8nrZE/9oPE3m4qSBhg3BgMGsdGtz3/VJzZJLukwzd68ttxjRpD3ouYdsOqrcCgB5tiYB6PnWOYYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632190; c=relaxed/simple;
	bh=g8w1Jb9WqIo3k/eAjcs50wrpvXumNWle14FY9HKU+6M=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SRHAk51SU2ezY3id7odUHm1bt3lbwTV861oZHZkMbR6ZFxEWjtdjIERI4PvkiuJ9TaSWVnstisiRN1OVTeaheRQQdZlE54hrHK18o/w+aI7A4ajnkweVOAf86rmzpHLRSWdmOqPn3hKsOuAdOoW2boRJX3frDZjaQX+eqwaJBWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhNDExa1; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhNDExa1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790632188; x=1822168188;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=g8w1Jb9WqIo3k/eAjcs50wrpvXumNWle14FY9HKU+6M=;
  b=RhNDExa1qsYF7s7rTqdgedm60DdEv2fsclM4Ly6z2BDnOvpvhFUFCzJr
   wM7GofjJeBI6NjIeB2ehAeq1Qo4SsZh9q//U9G8bda3o46ZRqro44i3rI
   Uy0/xRzyCECb/Y1VVOshOydsrBVRubuXmRuDlCjV+SuLiLnDz0DuD2eI0
   GAxQ2rPR9BNG1n0Kl8Plb3l9TqAsq9cU/57syys8CR5YPYDnTwZcQb6oI
   5+Fjj1XoLXJzZcP7Qkfr3nKpXst47cxOOJwqnSpgibttD2hLTeFMh+03+
   e6MXggtijJmbpLXZjOYl4Y1RLW5Qq5QmSOn9E671qRIH7VNysbu4uGcxa
   w==;
X-CSE-ConnectionGUID: fBRTvbWKQnelJiMf9fq6Fg==
X-CSE-MsgGUID: BoXl/9CxQTyoLG80n8uO5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="113130180"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="113130180"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:49:41 -0700
X-CSE-ConnectionGUID: TIQws7iGTbWHwBCqzX/JsA==
X-CSE-MsgGUID: OWlVJgp/QvGnWyz8/fVYEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="272969760"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:49:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 14:49:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 14:49:40 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 14:49:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8KHgqF7j6G06EMUnKUdzcTgPJkLmaObRlK9JWulOZL4dVz4BbeOuMaSBoF9pq+KFI1fyEF34zeBaxNf80GVKcmW9DNfC2FFMAl48HEHNrptVEKihU8Xm8GHMgEorazeFA3ywwVlqw69bHNovgYz4v7C25xwWsEQY2mKZz9j3FXR3zoK5JX0D3nnYk8eqB7AVQl/9mktjnfCq5IJkEN08axv31iS/ht0SuopUxzUTu4ORh64R2VIgkYQAN1SCfKnb0qxxdC2hnCUHdbxjd32MQp47tw2f526nGAjGKR2YMpZJwrH6E/hY/RbgzM2r0hJXUltm/itEvKoqTYlvIpdbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9N8orr3wGnVf32IhwjIh6rMG16oqEu+4FcPdEc4T3fY=;
 b=X/lHJav1E3hCGbdT19WaJRGSXYvj5WGCvEy8nBQr7+JSvKlJUxGdHzfTjC3R+kS6QFKrUVE7dgpAD4y1QmT29dYWAaF/zFrUy1lGwPJHPBXag/5LXUlXXjwJRFJhHn74zbrrPXqlUFFIa5fZ2pbWQSx8/2EW97SLWW5aNH22CASOm7r8mNlXLRG8DlXTzB5jMaewl3OUefAAVqJSzzFd452em4Hn+nJxmTvS8yVeL/sy+OMCtTR2xvoHWirw+IWZKTjprdTMHY/kpOvPL0uSHu0Rs9+vaVSh7PJEo3d4GtB9A5ckptw0PAoBSnCnM9+boX6WgDvWIpC9tCZb4NeFaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA3PR11MB831931.namprd11.prod.outlook.com (2603:10b6:806:589::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 21:49:38 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 21:49:38 +0000
Message-ID: <de9ffda4-c837-4a0b-9468-6cc7b14e0748@intel.com>
Date: Mon, 28 Sep 2026 14:49:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/9] x86/resctrl: Introduce erdt_cpu_has() and
 erdt_support()
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, Hongyu Ning
	<hongyu.ning@linux.intel.com>
References: <cover.1789705667.git.yu.c.chen@intel.com>
 <b279eaa7bf8b3b0b09532e8b184ba4d410eb6f86.1789705667.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <b279eaa7bf8b3b0b09532e8b184ba4d410eb6f86.1789705667.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:303:b6::8) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA3PR11MB831931:EE_
X-MS-Office365-Filtering-Correlation-Id: b54d3297-3872-46b3-45f0-08df1daa64ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|366016|1800799024|376014|22082099003|18002099003|10067099003|11063799006|56012099006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info: rC2AOOeANDBmNbNZwWv/gVTk6PjH0orOc7sxIPQp7ZfSN4x7x+tJXDaS4Y6vEKWbLE2YYeDdsbZUPiTGijypCRKoS5FyjdYAolWnSGEYHtG/tqsyPYXcY+pJcQCpJ+Cky4JuekNx25F25ZakRoGdw0V3ximye20w6xOl/a+dYwwRuZYAHeTjHC34p2eSWNmFgQe5LEO45cKxRowSryZRkq9klHhtkJd4SW/oPS0A/VS85O9zKh2rVXo5jy5unMS4uriVSlkJ0nTjlvMiWZ4o4ShNia8vof1Ny5PHc4FZG0L5ppJYaN85wbsZuH1VG6y8LFoDMZQWWR5gau0k2Z4hxSfR7k7LPzjtfu3uIsImEMkfkXCDuez17u4fldohzRjv2fjBU58xZiTxxy8Yb9058DO+xV5J2awSy706XEvkVHX6dJ03g80wgO01cxUsKeKPT19L/a6bKLagpWPEYnE1dRFxqSheTJW4twdj4Q59XkNRicJH5OvKmQYIhQXBIHFjdqOOYgHYn+9nJCrQ9tKpRLY4+QOCU79gLy6XygZjfqIT0KeqPLl887WsKNVTcQ7+jl7Cxvp8OPIhK6vpzqS2O7Doj5/X2McvyPuCb4MhMqTbM3Y/oqeMwTU6/r1Z/jwaFpUY12wqMlmtIdnj34iMGyuRkG4F+/NkuDw7LjR/OSA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHlUSnZuUFJsSXBKd2YweCtXRzdDYlVhRW5ZV2FwRTB6MUhZOWVSTTYwQ005?=
 =?utf-8?B?Qk9iL2J4SHAxU09YSE9UbUJOb0MvbHZ1RVMxaCtGM3NlUExVb0J1a0FtS1VU?=
 =?utf-8?B?OENFeVRkNzJLMElWQTR1RGJRNzE2SUdRUVQ4UHJnUFplbkpjSVBMYWlaY2tw?=
 =?utf-8?B?K3R5Y3g1aXlxbzVINGc3TE1sd2ZENGN5eDE2elV1WkxFT2tnNGRrbmtVTVdq?=
 =?utf-8?B?UUZDT21tOVhETi9vV1V2ZUtiS292ZlhENnF6bmdiRDBTbS9YU3BXVVRVREow?=
 =?utf-8?B?K3g1VEdNN0VVUkMvWmp6aHVvczVqKzlTRGZadzNkYnBCVEtKVFIwcTFwRFZG?=
 =?utf-8?B?aHkvalBwYUUwUDM0M2NhVktwU3JMWU5aMzhyMXVpWjh5MSs4bG92cllscGh3?=
 =?utf-8?B?bHZ2WXpkTitMY0JNTFd6ejJ1QzBibERvY0Z2QVBwSDRiV0R4aitpaTIwc3F4?=
 =?utf-8?B?NE53UnFUZWFwTVhEMW5zWGNUMkFXNFNGWkpFMFV4UDdCUTlKU0U4aHUwNFNX?=
 =?utf-8?B?emZoSHFXSVN4cTFQdDltaEhtSjJmenViZUxYTnFGaXdyTlcyTDBnbFROU2hJ?=
 =?utf-8?B?MTFvMC9HMEFTejlJZXJBU2xhUk84T2ErNmlsbjFieWdyQU9WYTgvd0JjSjBp?=
 =?utf-8?B?M1hYQkRhd3lIc0lkWGx5ei9DQmRtUTFYSlBSdTNlQlJ6LzAzVUk5eGZTQUNQ?=
 =?utf-8?B?SnhKQStSUDdqM0FMSlhZU25NVHdlMXcrQjhZdEZuY3drRmpiMDFMYm5MM0J2?=
 =?utf-8?B?VVRzKzNpQitFNWFCV3g1eHI2TE1vK0NZV3RsZFN1dzFNeDJ3Tm5DL1pUaFdE?=
 =?utf-8?B?QVcwZlBlNUwweFZkKzFmWTloWUExM3MrWThQb1RCVC9HMlRZb2UxK1BZTElR?=
 =?utf-8?B?bXlNNVovMTkwSTBOcWwxbW5YUXpFS2huY0VIczFXaWU2Sy92dk4zWFhsb2wy?=
 =?utf-8?B?QXMvTE0rTTFnVHhRNlg3THdFenR4YzA4c040MWY3dk9KeFVjSzE4SFZ1NUV5?=
 =?utf-8?B?M0lZalA1ZEZWZm1Ubk5ZMzJ1Z3VWd2pmenZ2bFJwYVJZZTBFWU5nQ2dycjdp?=
 =?utf-8?B?YkJuNjBYWmhRM2tJOXpjdm85K1RwZ2hzYStRY3pUZGIwOVdzYWp4SkQwMi81?=
 =?utf-8?B?UVF4eXBVcmlENE1BQTcxRjJ3VWYzSTkwbElNcXFqV3F5RW1haWRQb1IrV0c5?=
 =?utf-8?B?RU5vQ2NCZEc4c2pLalhiQlRZdC9GUXlHVHozZHBCVkZtbW9wTE5XbWlaWEVT?=
 =?utf-8?B?WHJWUG1JY0JWbHpjUUppeHh5NGlIeWt4NThOMnNrcCsya0ZhQlhzNWtzM3p3?=
 =?utf-8?B?YXpneGEybEhnNFVUMnNhZGw0b1BZZ3V6Y0FibVY1S011bW8ranNZc0Yya0l1?=
 =?utf-8?B?d2FYQitTRW5TMXI0dEFOaEpPOVdCYWp6L2c0eEtVZUl6VEZ1NVdhVmdsOFZy?=
 =?utf-8?B?bEQ1VUZRRGxyRWRzTUg1ckJsR2ZWQmprcnJucXRBL0VRMmtsT210aFpwblg1?=
 =?utf-8?B?MU5NanBTZTdCVFRTcXVJQjlseFhCb3ZIeHcyYkwrTTRUZE1qMXJCbFFXUXZK?=
 =?utf-8?B?R3dwVTdPcnhDcXpzRHFRR3E0WVNzZGw0K0JualZyQ2Y1cEcyYUVvN2I2RCtx?=
 =?utf-8?B?N1FCeTJ2QUNROXZFZ3VEZTZMSUJQZDdyNldIT1l1MzBWZ2RLN3JOZmMwbVor?=
 =?utf-8?B?VWZrWGJiUVo1WHVVNnR0TzEzNmJHOXpZa2VJWkxZaE1UaXlSWkNLRVA4bmVz?=
 =?utf-8?B?S0FERG83djZ4L2JyREZWdEVNT1UwVnNpL1p6TSswRmxyL1Y3MkVUNWNXN3VQ?=
 =?utf-8?B?VlhWMjZLbjFicnJ3ckxtd1BXcjBpTUlDTkhpK2YrZ1B0M1BvMkluWW13cTlI?=
 =?utf-8?B?b3VBc3lnK3NlYSttVllGVEZwYS9BT2FVTXpXU3NOWDRZdE5zcTVMQkxKTW9O?=
 =?utf-8?B?VnZyOGtuVzhSYWw2L0dodWRLMkE3QVRvRzJXc3FLbG9OYVhkcFhzMVlFdVEy?=
 =?utf-8?B?Mk9rYWJWb1Z4QXBmSFNzTGpKb09pM1p2ajAzRUw1SEV2Z2Q4U1YvOHcvYUsz?=
 =?utf-8?B?WitKYkkwT29zM284MnhVYXdCYS90c29OUEhGbHhKWWM3N0hVeEZlZ1B1Ujgz?=
 =?utf-8?B?dkJEQ0FEM21KMVd2YnlEVVhicnk3ZDJTSXkvaFJFSmgvT2F3dHdTRFRVK2dN?=
 =?utf-8?B?Uy9sRytlelRRM0Y3bUFPWG13eTlsNzR0aTlrbzRuRFRodWdoWUV6Z0cvS0Qy?=
 =?utf-8?B?WU9YRFVRaWtJa0xGNjJHai9vbTJYMnBxRU1DbGlhYlI1R0NIZGRvUVovQkU5?=
 =?utf-8?B?b0kzekpsb1ZEZEEwV0pRb3k2VHVLbGFzUVlqbTZlSGxVcXpBSnVReHBjWXlN?=
 =?utf-8?Q?xC9qVDpw94qlHHo0=3D?=
X-Exchange-RoutingPolicyChecked: Y1kswu35jfsfws7EVtPvRrcfiu162/rfquGpgALsjDXb2jYMfp64pSXei6En5DYcCyPtJGGuVE0DknXhmtQmYDZ06OEmGNfkAM/yKVtGYAHB0Ro/vdBmRCcw/Rt5tHfsLyIv5QaKWUMuOe+yAK42sV8isPbzTfesV2Zxsi0viriwKvZX2uCf+Uy5vSBwWiMLaUj6LtXPH1xDZVohJi05r8qQWGrqgVTb/39bY51AKjaaAg9pa2nJKfQ7zqthcAJ18c7iDf4+FsfbBrs2JGFeTGzYCxcT+owuEjDsl9JMyFIGdnB8eOFiVai3lvCtxkak2tlLxnq5CVECbV/4of1Usw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b54d3297-3872-46b3-45f0-08df1daa64ac
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 21:49:38.1932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QURPwRSOz9Ju6hfOj+o7BbSvOIGwgCEaa4Se6PHtFHKWAEbR77BkM6Uh3pCM7ugNcCD4pcQa78epVWsJyQ8hoAJsc+xy0oTl0PPZgoqU4Mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB831931
X-OriginatorOrg: intel.com

Hi Chenyu,

On 9/17/26 9:51 PM, Chen Yu wrote:
> Introduce erdt_cpu_has() to verify if a specific RDT feature is backed by an
> ERDT table. erdt_cpu_has() is derived from rdt_cpu_has(), which not only

"is derived from" - needs imperative

> considers firmware (ERDT table and its sub-tables) support for a feature, but

"rdt_cpu_has(), which not only considers firmware (ERDT table ..." reads as though
rdt_cpu_has() considers ERDT, but it does not?

> also considers userspace input like "rdt=!cmt". Similar to rdt_cpu_has(),
> erdt_cpu_has() expects an x86 feature flag as parameter.
> 
> Introduce erdt_support() as a helper called by erdt_cpu_has() to check whether
> the ERDT firmware supports a given feature.
> 
> erdt_support() deliberately claims no feature yet and returns false. A feature
> may only be reported as ERDT backed once the low level accessors that access
> its data via MMIO exist, otherwise callers would take the ERDT path and find no
> implementation behind it. Features should be added to erdt_support() as their
> MMIO implementations are introduced.
> 
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> ---
>  arch/x86/include/asm/resctrl.h         |  1 +
>  arch/x86/kernel/cpu/resctrl/core.c     | 23 +++++++++++++++++++++++
>  arch/x86/kernel/cpu/resctrl/erdt.c     |  5 +++++
>  arch/x86/kernel/cpu/resctrl/internal.h |  1 +
>  4 files changed, 30 insertions(+)
> 
> diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
> index 9a32ed418c33..bcfcc8ac1fe6 100644
> --- a/arch/x86/include/asm/resctrl.h
> +++ b/arch/x86/include/asm/resctrl.h
> @@ -49,6 +49,7 @@ DECLARE_STATIC_KEY_FALSE(rdt_enable_key);
>  DECLARE_STATIC_KEY_FALSE(rdt_alloc_enable_key);
>  DECLARE_STATIC_KEY_FALSE(rdt_mon_enable_key);
>  
> +bool erdt_cpu_has(int flag);
>  unsigned int erdt_get_scale(void);

Same comment as earlier in response to the erdt_get_scale() prototype
addition.

>  
>  static inline bool resctrl_arch_alloc_capable(void)
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index 3514d73a8056..ca7e67f976d5 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -897,6 +897,29 @@ bool rdt_cpu_has(int flag)
>  	return ret;
>  }
>  
> +bool erdt_cpu_has(int flag)
> +{
> +	struct rdt_options *o;
> +	bool ret;
> +
> +	ret = erdt_support(flag);
> +
> +	if (!ret)
> +		return ret;
> +
> +	for (o = rdt_options; o < &rdt_options[NUM_RDT_OPTIONS]; o++) {
> +		if (flag == o->flag) {
> +			if (o->force_off)
> +				ret = false;
> +			if (o->force_on)
> +				ret = true;
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +

erdt_cpu_has() is practically identical to rdt_cpu_has() just above it. how about
something like:

	static bool apply_rdt_options(int flag, bool ret)
	{
		struct rdt_options *o;

		for (o = rdt_options; o < &rdt_options[NUM_RDT_OPTIONS]; o++) {
			...
	}

	bool rdt_cpu_has(int flag)
	{
		return apply_rdt_options(flag, boot_cpu_has(flag));
	}

	bool erdt_cpu_has(int flag)
	{
		return apply_rdt_options(flag, erdt_support(flag));
	}

>  bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
>  {
>  	if (!rdt_cpu_has(X86_FEATURE_BMEC))
> diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> index a8a7417c2f82..400973ebf2b8 100644
> --- a/arch/x86/kernel/cpu/resctrl/erdt.c
> +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> @@ -48,6 +48,11 @@ static unsigned int erdt_max_rmid;
>   */
>  static unsigned int erdt_scale;
>  
> +bool erdt_support(int flag)
> +{
> +	return false;
> +}
> +
>  unsigned int erdt_get_max_rmid(void)
>  {
>  	return erdt_max_rmid;
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 26c3e0c546ad..ce037e017fc3 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -287,6 +287,7 @@ static inline void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resour
>  static inline bool intel_handle_aet_option(bool force_off, char *tok) { return false; }
>  #endif
>  
> +bool erdt_support(int flag);
>  unsigned int erdt_get_max_rmid(void);
>  int erdt_init(void);
>  void erdt_exit(void);

Reinette
