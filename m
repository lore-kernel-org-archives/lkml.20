Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9208446058;
	Mon, 14 Sep 2026 14:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397510; cv=fail; b=I521JKT1uwVj27VGul0I+I5Phj3O+Fqfzs38fqAjh+VzKdx3zjhBVyZfJ8VjU+/6Hr9Y4gSUdi0hcQK8aqDLnnYgSI3GzzJIjDds6rOAWWXP6eFzJXzeIs1CvTgdChW3xqpafj4+Rgr4J153Qv8wr1sGUECtyAQJSyCXoJ3U0nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397510; c=relaxed/simple;
	bh=pyvSw/RNorzkqnakpMivDHYpRHjN9SqFM/qan5vpjP4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HidnS4cabzOMJFfILcS/+N+odO4VmDnMyWiDYpLVan6zA8O1Oeqt9W1EUxbsKR8ofCVHIGILXfB/JKz/5Sq76zzBtueZJZv/7ErLnUnfDv4BKKD5RQmx7jFSL2rSqptyEKCFICBv/17BTHE8Y0pehT55PcTfEp42QyMN6r/QZxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWUCeDy4; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWUCeDy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789397508; x=1820933508;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pyvSw/RNorzkqnakpMivDHYpRHjN9SqFM/qan5vpjP4=;
  b=IWUCeDy4PJu0PHSTF++IMIs5fA3tfQcSlOeeT0/K84PXKje7y+qTb2+8
   NHkKynxd5iSkN6lvq953dTyv3v4tYIKA0bud05eS7/rHoRYcyAyuLjGha
   /iakAKc0tMSYgL1fLqQiD2XaQ0RWlUMcF5oTe7dFO+RIFxcDBpiRnLka1
   D0Bf1GzmtxZR3/83H/EPNuLPbuTFRkqHjYuma16ajvW3SPUWnVGgnXI/A
   KQuhGHCdwINYOccIYUD+yEcj4cJn50fc7iEP+ykNYVNjbddrjnpSU6eSG
   CwbiXO5D1BDVyqGsLWECm+Ysm3ycNIQlaA3zfQIRb49iUlQxbGz+K72eQ
   g==;
X-CSE-ConnectionGUID: Reo+I27LSfCH5eLY8XLJrg==
X-CSE-MsgGUID: ESmKsBK4TCOE2J1F2WeCjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89590932"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89590932"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 07:51:48 -0700
X-CSE-ConnectionGUID: b1Nevf+cRi2cMRNk1iDQbQ==
X-CSE-MsgGUID: QtqmfAvtTneAflqmyNip6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="268981944"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 07:51:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 07:51:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 07:51:47 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 07:51:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U3sjfZQXoGtqBfrFBiDYdJMvmTvI3PXVzaBkhOgGTnQekK1nb94P7Pycu9vkMAdZ6nRRu+CQQG5m92YPR/v4i2LaO7fs3kdirX8drMNVrStEOJOQJbDTonOq6HORkhANxOQtY/dAKIIwTYpcUTRIizPcCdprPThioKt3YkF55QIqPzytp0OvCaVYxxB9+PJRbLzJzjUWjPS6HPXXO+gpimv6I+RpzVQRlgciM2fQo0kyRQDqbbdt6EGizVfoWZ5YdBNWXAbgbKoFOR/KHM+X5nfMPlvPimCIfnivWBK7Btrc9EYJa92pab6wPw2oeQQdckXM3ykDarOeWXqgSq+GvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUoBSeIpndL7ZkRQ86mmJuHPYS4MUe8OlxVV3pYjAik=;
 b=ExluTSqi5xYFNeBK7wDSIoKogy1iSHvKYQEquwdU6MZvpp/c8pot9bhIxY/CxhmXfv4dBK/77VulT4jZiZQQ4KnMrAZDlIs+04tftWYZGNSoJluHoZ2WpFViU1Xlh9GTKo478qThzKkP8P32IHC/5NVOB6K549xDwCiRirL32mx1wrYIAqkMZx2tClNHqpzVhk6p5R8BpHrqyp2JQBSyc74h384DecdqqLJhDkMQlGC0J9nq+lYVwTJjOH+a3t7jTOL/aZVQG4jDIVyzk9eWB2ryNee3gK8epO1nA74Xig0EVLJuPwlK78062f+Na2xo2IJqMuDCrjGyiocCTkZhrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CHAPR11MB9656.namprd11.prod.outlook.com (2603:10b6:610:2fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Mon, 14 Sep
 2026 14:51:43 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 14:51:43 +0000
Message-ID: <b953675d-025f-43dd-893c-32a1e65ce504@intel.com>
Date: Mon, 14 Sep 2026 07:51:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: Ben Horgan <ben.horgan@arm.com>, <bp@alien8.de>, <x86@kernel.org>
CC: <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
	<dave.martin@arm.com>
References: <20260911163613.1131447-1-ben.horgan@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260911163613.1131447-1-ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0169.namprd04.prod.outlook.com
 (2603:10b6:303:85::24) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CHAPR11MB9656:EE_
X-MS-Office365-Filtering-Correlation-Id: 82369170-5d21-4948-acbc-08df126fb0d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|56012099006|11063799006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dFbEVW+QlYJ/3mGQ0K4W36SVNCfr3qolYBTSvGXkIJ4vqxoR704mzEiZqSxCSOauezC5COUi2ruhMq1sxX7v9Ib7FXROuVts1V9vyukptTRdA3BqlOchcLh/ml4cyna66Oh+evvEoJTKGj3ka8NO/3vnOlL87Srt3ZfqaMTjnkhWEb03OiIT9tkgQyL6DMODAVlEK300mnTtVAIbE/OHWbWAbI4e3VidpOJVZGqGTTeh/dgSAiTKzY0LFCX7+auImVN4Da2VM30Z94OfEDbsKZWOne86cTXlyCbWceD4cRzcYz57VKf0m6Vk+aB+JvZWjt1LO0rR5lP8Ju+4++mhQxEvqMdTmGLewSbH8l7XoqKB9IyZlz2RDRtbRVdsoLf393UbaMMJjcDOSVPCDTVtD/oGT+2s2r1bqwrW8qTUK6wyu2L/jI9cqCnM0U6J9wTNa93jDFbUCFFNCd5q1DOOai6aQ8g3LrUk4EoWpXzUDLOCRWcNJ0RerJXy9lKJqnw+vUqKnEV1JfEl7Tw+2QRmAH9dl9m+Xol2D0NhO1jqiu0eS3hattMUMhiaTl/b+WN91FkCIgItTzk5VX7aPo45AxYI8udYtGqQFCk6GMiowTkWmvsV1fROBXw+P2lUs6g4yB1Aqy3iD0pj3o6odx8FpY0UpAoWTwqZp5yAmKcYGMs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnppVk9FU1hUVko3ZHhzUnF1WnJHeDVnb2xIWVZEaHZlMWF5ZHBOeWR5aTFM?=
 =?utf-8?B?dXpUa3MxTkFXQWloenJPWHhpa0QyYlFMVWsra29JY2pJVEt1dDhtVktMYWMw?=
 =?utf-8?B?K1lmdUtFYVFFT3VtUEFyN3NzdGlqbjgwU0xMZjEwQkNKT0JRVkZpcEgvd2ZB?=
 =?utf-8?B?R1ZFenNMRDh6UXhjbDM1R0lDUzhXQWI2cENRY2hVU0FEaG1WbEpNbFMxTC9W?=
 =?utf-8?B?REVObUczUzBOUW1vYjBPZ25KcCt5cWx2Q1FHOGhxRHNFK1gyM2lFRCsycUNZ?=
 =?utf-8?B?QVJxWFo4a3VlbHVmVktmd2VyVXdNbGRyMkxSUXU3Y2J4RmRibFNIc0hYSFpI?=
 =?utf-8?B?Z0M2NHB2Mm52Tm1PcDB1OThGc3laaEMwN2pTenlFKzIvVWtIN2xxbU1MZUZN?=
 =?utf-8?B?bE9lc2tkano4OFN3U0x5QjFKMHkvTkJLL0hPTTlqS1NkUzFPakFPUXQ1M25L?=
 =?utf-8?B?OVpLOCtDcU5VVUVJUktDbGVtVmQ1OGhjZlJUVXkvTVRNcXBiLzhCQW5xQkxV?=
 =?utf-8?B?N0E3Y2dtbkVqRm5NV1ZsNDhUMUNEdVdNdllZYjdNTndBc2VIUkZnczNCdWN5?=
 =?utf-8?B?dFN1NUpYVHVFdVVLZnpkcnhTY3lCNGRhYXl3OU53cVlzQTJTMGhrNEw0Tjhq?=
 =?utf-8?B?ZlBveW0ra01OaVNJYkFjTm9tVHdpTGIrcXg5a0Y3N2xvVzFGN0hWUllsWlVt?=
 =?utf-8?B?WTVwN24zQVlnek5KWjc0RzVoQm9xSFFSKzdLblhmNXpEMXlGajg4MCtYWVV1?=
 =?utf-8?B?R21jQm82UGlnc0NZN2ROcjVlWEZjMHR0TTdjVkxEV0ZMNXdlVlZUZCtnMWtY?=
 =?utf-8?B?MWlRNzA0NXhPUU14VFdwME9PNGxnU1dUS0dqNVJMMjZhVzh6RXdrOWRrRE9h?=
 =?utf-8?B?cUdkUC8vWmxLWTZQTHljZzVBTVM3a0VlMXBUeVR0S0prTWNqb1JLa01TNk1s?=
 =?utf-8?B?eWlZUXZGa2dEQzJleXh1YVQrVkpxN2ZvY0VIZUFLUTNpYU1kSDNuSGFRYkwz?=
 =?utf-8?B?dXg3eGg1S1g0OHFETFV3Y3BxZDhqV2FoUkRCeHkzYkYvZDR1N3RMaXV6VEc0?=
 =?utf-8?B?NEZyNVp3R1E0NUQ3L2pFQ2hUZzg3K3F2dkpROVhyd0VmMkpIMitRUG1ndzNF?=
 =?utf-8?B?N0Y2UCtJbE0rcjhGa0tBY3VZWUtMYlpNdXJxZGJ4T0JYLzZvRVBBWVEwWHZS?=
 =?utf-8?B?cTZTTlNCdGFDMWU2bWgyeUVQM1pTVlRzVkg2QWt1c1pZN2Myb05BcFd5TVgr?=
 =?utf-8?B?NTlBZ05yaVNCZytOMDY0VSt5Q0Uzd1FSc2prSzRPRWtjQ1FIblhyL0xmb2NP?=
 =?utf-8?B?WkVBNHpldURqVFdaUm1Icnk0d2ErNDR4ZysrU1crZDg0RDV6U3JrbyswMy9V?=
 =?utf-8?B?MmoraEhxY3dKV0lBaE84NU9HVXR5YnVUY3laVkVLblM2ZVlCY2tBSWhvOUtC?=
 =?utf-8?B?a1pCSTRuWTFURGJDRlNIMTdHSHdDTWZVWWR4TjJDdlZZRXRab1QyWjN6ZTZn?=
 =?utf-8?B?R21nbGhZcDRsQnNBa3ZIRkxyeWp2NVZ3VUk4RmJXRTdaY21WRm85cWcrbVNI?=
 =?utf-8?B?U3B6ZWg0M0F3b0w5TTRWbVdQQ05nOGtFTlVkdlZYZHVLaDlDU2N0c01kVW1W?=
 =?utf-8?B?QkU4TG1wQjVsVEY5MlBTbE1aREw4NG5INWF5UDFYS1p5REJKbFFHOGthN2cx?=
 =?utf-8?B?aURXYTRHYlF2SVp0c0o1aDZwZlN4MTFXMzB0ZDhQOVluZXhjRGZQRUZGOXkv?=
 =?utf-8?B?bUZSTWVQWjg5N0xwY28vVzJEcjJSMFBSQlRwRVFhRDBVZ1BpbC9PN0gvZ0Vt?=
 =?utf-8?B?dW1tU2xLdEE4TWlUejEzVFYzK3A5SHRIZmVpMEVSMFhUbzArc1RuVCtxcldM?=
 =?utf-8?B?alk1TGdGUDB2VEZyQXhhVkFlMk45OFNzdXZBOHNIb3NFYkpqVjhtNVpWUTZH?=
 =?utf-8?B?VFJYVjRKVkNQVXYxQm5veXN1dVU5emNHYlRydlJCZDlqakR1ajRTcEhhdjNm?=
 =?utf-8?B?a3lYUkFjWUNCckhRWWU5eWh6UzdTOTFPUVpWWm1mNkhmSUJDUWlITm4rOXZL?=
 =?utf-8?B?WW9qZzBCdDRoRVJzU1dhOGtZODhCRjRrV2UwYXc1YW5qQmltUjdCeE0zSW9C?=
 =?utf-8?B?d0hBVE1mTkdoU3RBb1RRNXJjcGxXM3RxMUtaK2ptZ2tzWVkrVEFlb29ITjJj?=
 =?utf-8?B?NTVISmZVVHNqZXAzSjczZDdOQ0E0SVBueThHTlpEYmN6VzhXWGlVdlpaVHFM?=
 =?utf-8?B?cnFaWS80UVdNdFZ4M3JBM1haNlcrWXlLOFd5TVhNdm1lTU1aNzVyZ2lZd0w4?=
 =?utf-8?B?WUhNQkxVQWdERldVcEo1T1ptVnBFK3Q2YVFvTy9CVHo4WkVJdk9NR1EvN2h6?=
 =?utf-8?Q?Qe/S1ETQWJgWQkWo=3D?=
X-Exchange-RoutingPolicyChecked: XrHxo+KgM0UB835ZIL5u6qKqwN6FYjOayhE4Shcx86y9WbOU0108KZnOe4dEYmz/t+DFQA2g84WrJTnyZMTgrePjmBAXUNCjPry12f6U72HZ/0UyarHazo/B3KiDsvuiE6ME73HoDTIb0zLp+UP0/q9TRZO/9VPJhe2bzCPtZ7Fm09sU4mU6kneSeSoUsboKRN9iXMRlBpIM+OsGvduO5a2xUhp/NRkeqKaX3z+dJytG6Iti2llFqoahoJLusajZ9r+dhsnN9Dd7Tp+sK+qyypnMall+N37KL3WjTnbpT6FCM8xCWez9T7/T9ZHX4Pg4MxbXHYLsBaLeN5h40tV2Sw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 82369170-5d21-4948-acbc-08df126fb0d0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:51:43.0327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5D2ys75MjJOWQqc60HWP5WcpCaA72eVt1z066nC+lLuc+B+zCnx6xbXS/Nwh46hs43iEHYbi8BtsjSRfW9pwFYfMxfdHMw3xqCGmb/LOjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR11MB9656
X-OriginatorOrg: intel.com

Dear x86 maintainers,

Could you please consider this series for inclusion?

Thank you very much.

Reinette

On 9/11/26 9:36 AM, Ben Horgan wrote:
> Just a small documentation change found by sashiko since v5.
> 
> The patches should stay together so please could this all go via tip.
> 
> Changelogs in patches.
> 
> From cover letter of v3:
> 
> This is a new version of Dave Martin's patch [1] to delegate rounding of
> bandwidth control user values to the arch code. As there is now more than one
> architecture using resctrl, I split the original patch into two, a core resctrl
> patch and an x86 patch, and added an MPAM patch. Please let me know if the patch
> break down and ordering is sensible and whether the pattern should be followed
> for any future similar changes.
> 
> This does have a user visible effect on MB schema when using MPAM hardware
> with 'bandwidth_gran' greater than 1. I'm not sure if MPAM hardware with such
> coarse controls exists in the wild but it is spec compliant and I've tested it
> on a model.
> 
> [1] https://lore.kernel.org/lkml/20251031154225.14799-1-Dave.Martin@arm.com/
> 
> v3: https://lore.kernel.org/lkml/20260515140612.1205251-1-ben.horgan@arm.com/
> v4: https://lore.kernel.org/lkml/20260706160639.2136674-1-ben.horgan@arm.com/
> v5: https://lore.kernel.org/lkml/a2a7d988-339c-45f6-b910-5d7dd893b45c@arm.com/
> 
> Based on v7.3-rc2
> 
> Ben Horgan (1):
>   arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()
> 
> Dave Martin (2):
>   x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
>   fs/resctrl: Factor MBA parse-time conversion to be per-arch
> 
>  Documentation/filesystems/resctrl.rst     | 17 +++++++++--------
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
>  drivers/resctrl/mpam_resctrl.c            |  5 +++++
>  fs/resctrl/ctrlmondata.c                  |  6 +++---
>  include/linux/resctrl.h                   | 19 +++++++++++++++++++
>  5 files changed, 42 insertions(+), 11 deletions(-)
> 

