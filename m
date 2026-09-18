Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F63C20010A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789771664; cv=fail; b=IziQiWvdmbdi3+yU6ZfCND2BoteHWDcpaEClBjZhe2IrpxGAG0LmEaJAjhhERlOlffR+w9WQ00LT5s/RZy/tP3NTYYb7/F/Mpd7u8o+rdhFjAISzCQf4ATeiEMmMIcQtYTnmvZJE85E9GUdJl8iyF93MYfW4VvkT+eqQb1BmSvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789771664; c=relaxed/simple;
	bh=L34JbJxWRxtzO2Tl+mvzynR7LzlStyb3UnuhMKjD1qs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O9iS3fr0X8MdYDqrx/BGZ/xMHYvrdegUZ9K2YA50GKPz3RPfpNxe8+qoYWqa9Fd880UDddHXjvy6CKCEk4ISKshjC7JT6KxBfycP0HVE9MT8rvlOOHFrbd6bVuFP+2ZnuypWC3fcCpAU7tqSQN1yF/LVq3NqrnogV/5nHFIQdTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nsiIuFPt; arc=fail smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nsiIuFPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789771663; x=1821307663;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=L34JbJxWRxtzO2Tl+mvzynR7LzlStyb3UnuhMKjD1qs=;
  b=nsiIuFPt3LntdnjcvDgT/oqSpqcVw8DeBtM1Lrx1wEAMgSyuM4E7/KZk
   LOz3IVCjw/LIuXyXzFo0teyLOaM2WOiwCvFgfkTWOMkNO23JaXzWgNMGm
   fKrVOB5xb31VIwFnEpiSjSq8EN/mp0b1X8bF7mMox2QH7W9Pfw7JMfsXu
   OTT+WmgQIe0LJJ8w9DL6uiP6N8QOaD9eJQORs+3pr3qOyxW5UADvouzWy
   mLMnIVuAIaaeetH/mz8KRChkzWjU8Gv/JXhU7RJxW09WwtHqKr8Gcts44
   E2XGG/tjZiUPrV+s0jl+PccdkEQ0eaSSaCBp1bYBY5Gjp1wMgrJvWW/43
   Q==;
X-CSE-ConnectionGUID: nBvX/D1bS6e8zivJ0NpbUQ==
X-CSE-MsgGUID: VXMJJWVrR+maOKY1QMZIyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="821145"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="821145"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 15:47:42 -0700
X-CSE-ConnectionGUID: PH3AEU3YToOu9dn1excMVw==
X-CSE-MsgGUID: /Ayy2YLfQ+KCO/H/DavawA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="271955140"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 15:47:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 15:47:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 15:47:41 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 15:47:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oas/lGsV75OIPJEU5QOdH2cmZiEVxxBcX1qAPZkFiFYBWFPh17zUkGz88pYbBtZP/wXNHRb7gax3CO7WyxWmgOQdoY6jyQ9U3fRRJzuwafCtdMNUq4hklkW1l+n007xIzKCxX3NrsT+cHfVmFjWMcEfU9DcbCJMGiNtewx8d3BYJJSXyuBvVG/sXpJD4vN9nVErejRRGA6S1wWd0t1omgNJGGmC5AMd7DMKO9HJVDoHEJul6Z5xaL02N76zB3s63tm9E9TKhnyBCB2XhsumBfo3LOhudQETdyGvkHP3OvgYUNgskfAGKWBHTyT/yWyVQFCG1Q8nrtSQByqReCBZhQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATJA3nLmdYckZjdzzKSc7rUyhnNovrumHsAKmfa8t0w=;
 b=D5/JnsNHPlEobd6Fenf+plzwHIRKB5IhctfhvNnu9ovedAyW96418e/IDhaWScybmvZKuWdBlCbPoMgX7poniP63wGWEEie3pqbg0lPnhLslUH9FcIfqgOz7HJDEU8+ZJqe+fPwL4CHCDVPZY/fnJKSh8NGc4qUcafjH0ZkXM6s0iqWGoYFw7CMnYXhzUphrRxH/eJfdzOgt0e3vgVIOtQ2l/5LQXJ4YeVxT1GT88v/bkkHETiTmGuiXbn/PYUFBTRaN14QbMYt0iHzuMQVoaFr1q62ow+qdxQSM5Lq+X6B/PNZK0rcF7zAkmkyPzbJCbIqQVf9G8+4z3oJjFtpF0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Fri, 18 Sep
 2026 22:47:38 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 22:47:38 +0000
Message-ID: <94cb1f7b-0b78-4aec-8d57-7ae7e547cf36@intel.com>
Date: Fri, 18 Sep 2026 15:47:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
To: Ben Horgan <ben.horgan@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, "Tony
 Luck" <tony.luck@intel.com>, James Morse <james.morse@arm.com>, Dave Martin
	<Dave.Martin@arm.com>, Babu Moger <babu.moger@amd.com>, Drew Fustini
	<fustini@kernel.org>, Chen Yu <yu.c.chen@intel.com>
CC: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>, Peter Newman
	<peternewman@google.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <eed6d913-c01e-46d4-b249-68d2e7f5b616@nvidia.com>
 <6cf3efa5-697f-476d-9f8b-0c97bebd706b@intel.com>
 <3f39918f-91c0-4411-88d2-1ab1db3f12d8@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <3f39918f-91c0-4411-88d2-1ab1db3f12d8@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0264.namprd04.prod.outlook.com
 (2603:10b6:303:88::29) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CO1PR11MB4945:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f9b588a-ca8c-4454-3415-08df15d6d6a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|10067099003|11063799006|5023799004|56012099006|4143699003|6133799003|3023799007|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 1hys0IE5axdjc99GxMs18ZuLK8uwDwBUh7UfrWXUVUzgUF7oWP6pVPQUEuN35NoJ2GHjXkVHqbb/sCMfmQ7P1nddTwC9lROVAp1d27S+ncnFTy7FDIfKBi9fP4a7lAlhEczF8IL5h2et/Ee/bVBUq90qeAvxmI6IILHHBXzE3cmF3G2ZBLuyJ+3/bsH7CBBHx5CacGyjCYEv8E9jb5ZUaCxXyHwY+QYK9Ij/7Q+tTcqI0jnMJqwaelRZlvo/M5V6fFNxbpoALf/hI9NUYxiKSwxGK7BrWj18lX/v8YZu0PSflt4ZGF3Q9bTWQnH6J3qaKlESxYlY3kHha/HGEAmUTQOWdLVTmGJsEkOZAXmhdsGse7Iha31QIpSuN4ej6iUIKg8Xxbr0DE1XH1bfmIXL9LfyE/4nFiWaBR524m2uSAveuK1zrofrKM/yxB8Xuetjj2aTBoGSlmpKaf/LKm1+tXnfwuB1Gve0qQzn+sGcr73ye1MAPcqz5teBmlmvLF9a6WkdxM7Bv4IHA2vmlN9+5jLJwQv8Il1ywQTCYZ84DIat4trG1/6qUwxZ308RX0B2JZOM9bWMdHgR7kinMb9DUpIf98eYDYaxSerqXyBorR3B7zaOE+JyalimniSPyMVWDIlXQwe87ViLDvNermgeEM3a506VnfIz+ksDix1fib4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(10067099003)(11063799006)(5023799004)(56012099006)(4143699003)(6133799003)(3023799007)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckZUM1BRV1lESHVyc0ZyY0tZQlF4RDUwd2Y5VmZTOCs0b2VNUzliQXJDSFBW?=
 =?utf-8?B?bEN2SXNVbnQ0Vm9RMExpQm1PN0Z3bkJKakEzMk9FT3F6dW81VndmTEE1eHds?=
 =?utf-8?B?M0VkUithSSsybmxoOGZtcDgyM25RamdBUHZhbndUTWhzeUZQeWFyeTVBWWdU?=
 =?utf-8?B?eUxGNUcwMGx2b0NhNlBJbS9KN0JTbDVwYno3OUhDUU1UV2lDWmtzd3hpK1o5?=
 =?utf-8?B?V2xlODZ2N2U4dzVkM1NsVXV2TTB4c0dEQW5nVGRMYmNFZGZxdytnMWMvNkdq?=
 =?utf-8?B?cWUxZExheW1UNCtNZEt4UzlKUGhPcjFoZGFJcUdXSGo2TkFyUE1tQkVhL0kv?=
 =?utf-8?B?TnN5bHNtWTVrTldsd083djZMMUpOR3BLSDhrbWw2WDZVTE9qaWptNGthTFBk?=
 =?utf-8?B?dWNYb3ZhREd2YllvRXV0ZTR3UlhzQVkxZWh1aVpEUDZPVUVyWC96eWNkbnhG?=
 =?utf-8?B?VW9nNFRoUXdCcXFyay9qVWRWdHRNbkNaZVBhTUhTS0JMR3NDMjdpZTVaSUk3?=
 =?utf-8?B?ZlV6ZnN3RXFva2haaUs4RFJKckNsYTV1VU01MW52c1dqMHVpSFdQcGkreXk2?=
 =?utf-8?B?QWRoWmV5Z1pzRWxXajZRYitWOWtEb2M1RXRmUjI0QW1uVmVlWXQ3NzFxNEwr?=
 =?utf-8?B?UVg0RmtPbklzVTFnaS9CZUlKY0R5R0NUSHE2MmNUSDY0UVpGV0N3R2dLR25u?=
 =?utf-8?B?Yk5WaXFER3FOYUZaeHBORUhWZksxbjE5VGxUdHcvOFYrUFVJNFk4N2Voa25I?=
 =?utf-8?B?T3NBT0hzUUd2aERIRGZUMkdURXRJRzQ4UUtBNkIxaEVWOEtldlpxazVOUlBq?=
 =?utf-8?B?UGhrV0M5YUwzYlA5Z01kSkhzdU11UEJLNVVaUzRncVhqZlAzQk5Hejk0MEUr?=
 =?utf-8?B?MWFhaHZDVS9xM2c5RUdYMzBjc1BHYjdoT3FkVG9ocnp6NXBxeUZoczZlTWNs?=
 =?utf-8?B?TWlhZDVUVUFLcjJYQ2ZKV1ZreDBnMkFMS1R0S1p0SzhSM0wrWWlNdVp6NXB2?=
 =?utf-8?B?a2VsZ2k3cUhteG5QN2E3UlI3dk1hbVM4cG5laU52c0dwOEFmTEtyeUw1TVB1?=
 =?utf-8?B?Z2Jqc3pnZEh3M1liaDY1UUNwYW9XdjVORGs1WUthT09hZVRTRGpuT2xubU96?=
 =?utf-8?B?WWJyUmxxcUR3eWtPNXdBWnpadzdpb3VlYkNyUklUelM5d0U1VS9iSXFsdFVI?=
 =?utf-8?B?TklZVTkrVWNaU2NVR0QzZU5MajJKaVEyZ2dIUkY1VE5NNUg0eVV0RnorbFFs?=
 =?utf-8?B?dW0ycEZCMTZ5OGgraHdqOGVFWjAydDU0aW11eEQ3Tm1uQVlnM0dBNFAxT0lH?=
 =?utf-8?B?bUV2T2JMSGdWZzN0Y1JBYTBqUDAzS2tpamt5Vm9seVpGZDdyS1g0Zk9tL1c5?=
 =?utf-8?B?RWNJQS9Fb0M4ejVKLy9COGdpWmVLUExveHk2MUwzaHpnYkM5QjVZV0pwUkR1?=
 =?utf-8?B?M1BtNW9tK2RUcDZ1L0RBa2lHRk84MHlWaTVSZmhHWG95VTJJVGdCWHpiQVdx?=
 =?utf-8?B?SkRwUHVvZUJHeVZyVSt0SVVsdk0rMm1mUUg3Z2FYcWNRMFE5eWNGTUU2Sm80?=
 =?utf-8?B?NTZsaVc3MmdVOGJkRG9qZGRodzQyMnlRUWw2MUpvUGp1SFQyVVFxRjZQZVJs?=
 =?utf-8?B?aDJHT04vNFF0cUxkZnpITk84TWY1WTZXemt1QWhXSTJ5ZXRSV3JOcGtleTNY?=
 =?utf-8?B?VlVudnJDRVVPYWF3TmloMkxLK0ptTFJ6TVFFbDBDaUxjM0NNQzU4Zk5jZWdz?=
 =?utf-8?B?V1hzRE55c2REZ0Y2UnRYRmpnTFRTSGtsa1gzZTF2dDRseHNCWjRtWE83bXdu?=
 =?utf-8?B?SGhqc1VuTlV4ZHhoTFNxLyt6cXdhUU1paXhsY3l4anh6cDZUeTVIc2JpOWFK?=
 =?utf-8?B?WFRsbjZoVmpZNndob3lHTGhEQ0JDUk1QRDY2UGVGdFFsUWNWWVljNjhDRkhE?=
 =?utf-8?B?MlFyemE0NCtZTENhYkliblpyUmFnbHRkRmRZcmxlRHIza0R4aW11a2pBdzE0?=
 =?utf-8?B?L0xZR0JEUFdsWWNDR3dDUlNhMXZveW1rT0ZiZTJ3K3M3ZnFqbUlDeDErTGVN?=
 =?utf-8?B?QUoxR0RNSVFLU1FDbjdkUHVacGlxdS9DMVRTZlFqWGY1NVhML2Y3amR4VkNr?=
 =?utf-8?B?Q2I2eE5NaW1hOU14YWMzVmFVMXNMRGtRbjZCQmV6akg1SUorck45bDRYWTNT?=
 =?utf-8?B?RFpmcUZEMC95QXNGeFZHOVlid0N1UHliYkRlc0VjZXp1R1hoZzJLN0ZnQnJz?=
 =?utf-8?B?MFRLa2t4U1VwYjZyZmZZMG95VDN1TEQwRlc1d1pYZUVoQWVMK3RIZ09FS3JS?=
 =?utf-8?B?RFJGWk9UQlRRNzZ6Tnp6MUpYNkZmZER5Y1F0K0ZjZ0c3azM1Q2dJbCtncjlm?=
 =?utf-8?Q?dCaENRMix08zAmQw=3D?=
X-Exchange-RoutingPolicyChecked: qmqfdXOVksrTzcLbOKtq+xhWXs7UkDqS1AWdVsM7AS7Vr+KCsxPB3Y5b9ppu7R3tvU0fkO9gpQZ1je1+Bo+TivqZn1I5jeBHdQ9aW/FEL2pbBNV3gEVT7tBz1u6yl8sEKFqGaMiXNRbESVGwTyEqlWWR3/0/lpLENrTfb+52CW8X/bFbiY8/cjayZeu2jJCvaYn6Oj3S7I2CmCp2PQHpSjUKrInscuyVcVhwtsb1qWnIpD71BmiSWeX0+/iii8IqXzt9sPzNfljiS8xMtFmbEcmS3LxqRi6PCH3IxDGhD74euKX62THBI8VkVdB7dWUG0r3z4FvIayCPG6BzupnI3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9b588a-ca8c-4454-3415-08df15d6d6a8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 22:47:38.1720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wa5hcpAIM7df/cfkXkCVy3sCeF2ePiv9ZuNET+hH/lAmMDbMVmfLahLQlIycf8PCTUB9l8+skBKHTDOnDkg8UH4XljfDcEzYRbZDgDAYE4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
X-OriginatorOrg: intel.com

Hi Ben,

On 9/11/26 3:09 AM, Ben Horgan wrote:
> Hi Reinette, Fenghua,
> 
> A couple more thoughts on emulation.
> 
> On 10/08/2026 16:53, Reinette Chatre wrote:
>> Hi Fenghua,
>>
>> On 8/9/26 7:55 PM, Fenghua Yu wrote:
>>> On 8/3/26 22:26, Reinette Chatre wrote:
>>> With minor MPAM changes, I can do simple tests on MPAM:
>>> -               INIT_LIST_HEAD(&hw_ctrl->r_ctrl.emulated_by);
>>> +               INIT_LIST_HEAD(&mpam_ctrl->r_ctrl.emulated_by);
>>>
>>> -               INIT_LIST_HEAD(&hw_ctrl->r_ctrl.emulated_by);
>>> +               INIT_LIST_HEAD(&mpam_ctrl->r_ctrl.emulated_by);
>>>
>>> There is a branch resctrl/controls_rfc_v2.1. Seems no diff from controls_rfc_v2. Is either branch OK for base code?
>>
>> hmmm ... branch resctrl/controls_rfc_v2.1 should have the change you note above
>> and would be the right branch for you to use.
>> That is the only difference with resctrl/controls_rfc_v2.
>>
>>>
>>>  * @emulated_by:List of controls that emulate this control. When set the containing
>>>  *              struct resctrl_ctrl is likely a legacy control and @emulated_by
>>>  *              are the finer grained hardware controls used to back the legacy
>>>  *              control. This emulation is hidden from user in schemata file when
>>>  *              rdt_resource::ctrl_mode is RESCTRL_CTRL_MODE_LEGACY and
>>>  *              exposed when rdt_resource::ctrl_mode is
>>>  *              RESCTRL_CTRL_MODE_NATIVE.
>>>  */
>>> struct resctrl_ctrl {
>>> ...
>>>         struct list_head        emulated_by;
>>> };
>>>
>>> Does this mean a legacy resctrl control can be emulated by a few
>>> resctrl controls (which is stored in the list)?
>>>
>>> e.g. legacy MB control can be emulated by a few controls? I thought
>>> "MB:" line is emulated by only one native control. e.g. "MB:" line
>>> is emulated by "MB_NODE:" line.
>>
>> As Chenyu highlighted this is to support region-aware. 
>>
>> While I did originally suggest MB_NODE to emulate MB I learned from Ben just
>> how troublesome this can be. I am still trying to untangle how MPAM MSC and
>> AMD GLBE can be supported in this new interface. Could you please consider the
>> most recent message on this topic:
>> https://lore.kernel.org/lkml/bccb1249-e722-451a-9c75-8aa846713045@intel.com/
> 
> For the emulation of MB. I think in the case where the MPAM driver currently uses the memory class
> to back it (single L3/single NUMA node) then it would be most correct for the MB control to become
> MB_NODE_MAX when switching from legacy to native. As previously discussed, in the other case when MB
> is backed by a cache class then I don't think it makes sense for MB_NODE to emulate MB.
> 
> I'm wondering if it would be best to make the legacy/native switch a mount option (--native). By not
> being resource specific it allows controls to move between resources where that is appropriate. A

In the current design switching between legacy and native only involves changing which controls belonging
to a resource are exposed to user space. No matter if legacy or native is active the controls remain
associated with the same resource without ever changing the relationship between control and resource, nor
changing the relationship between controls. Practically speaking: the info file hierarchy does not change.

Moving controls between resources sounds like something entirely different and a significant new change.

So far the model has been for the architecture driver to own and "build" the resources, their associated
controls, and their control and monitoring domains. After the architecture establishes these relationships
the data is shared with resctrl fs but architecture driver always owns it. Letting resctrl fs make adjustments
to any of these relationships is unexpected to me. More so when this can change from mount to mount.

Changing the "shape" of a system seems to be something that the architecture should own?

Are you instead saying that resctrl should expose a node scoped control as that of a L3 scope control?

I aimed to document how I understand the different scopes and how to communicate this to user space in: 
	https://lore.kernel.org/lkml/bccb1249-e722-451a-9c75-8aa846713045@intel.com/

Are you instead saying that MPAM plans to create a control that pretends to be for a node scoped resource
but placed under the L3 scoped resource like below?

info/
└── MB/
    └── schemata/
        └── MB/
            └── MB_NODE_MAX/

Something like above does not follow the relationships that the hierarchy aims to communicate, which
is that the resource has L3 scope.

If you are already considering scenarios where user space would need new mount options, would you
perhaps consider instead some new command line parameter, similar to the existing "rdt=" ones that
adjust how resources are exposed? With something like this MPAM driver can control which "shape"
the system should have in resctrl.


> mount option would also allow multiple user programs to interact with the schemata and size files
> without worrying that the format would change under their feet. What do you think?
Reinette


