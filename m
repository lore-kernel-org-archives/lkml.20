Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793118124;
	b=ZFmHA8HRnZR3Sr8TCpxqiiAabhaBA1uq0uHtRUYZ9iCnTh2TicsLZRKqD2Hwyxg/TtDV
	 gCYicZRY0W9DUxSkb4Qkx9qe70UZsh6W1FPMTE3D8fbvQho6M4u3Y5c8PJh3a0DUD6HQl
	 oKXuVwT+w1vc3HHcRRtvXzPiLKxho/Qfp/eiKuEYQuQW3zYS+iZc180qB978rNxfoUE0p
	 uwMH2QP0/W9+ba7cjiWX72KLx5K6ki32yeGEqLzy7WVXm2D8yWRYDQZD9ok1hMdaQ7FY4
	 sBwYTnyoigqXOcDw62HowcgzQ+Wl4Yo+wVlSj3UeMFGDSD5dGokVvQhe0TMDWPNebLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118124;
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
	bh=ra5prA9vpBmXY2lVtW7v5BvEqCj/WStY5Co5qjaKj7I=;
	b=HuyAmUZTBd9PMJLp04GtPfsX45b/KoH8zivJXiX//iipPkV3dqu5vp9sfoyZO6P2m6c6
	 NYAolHP1qBrCgnvMdvHjyc5tj57DmJN6V7ghCTUj9cjhYG4Y6tJaI/HKcJiXrcQ6gaS1d
	 sL/yeF8FBXoVo49U9ylQ8ut47KTa9OTaQmqVmoRhnhvzjjJ5c4YMYcgP+eZ+9Iy8+T7YT
	 Fijsoxvz1dNtywycxR0s2XkSu93QE1FXZeStwD0X57G+LkDeFRb2JxvulJ6xKrpmwks9E
	 Ynz2ux0wYcDU8AQOfJt7K0LITNAqTatQcNrMgVlnFXz/6IRZF+xhOR5JXAtYuGW3dJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="XOq/o4EE";
	arc=fail smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445E1606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 445E1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XOq/o4EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793118124; x=1824654124;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Fd1wVr0cubT4aXDsnMHwoRAYWTNWIDx2yK/d1z9AC40=;
  b=XOq/o4EEznubov4Y9Ho4RnJv3SwT1CaFovJgdUuACMsRwQUm/K6+uXns
   /TQDJ19CcPLS1kjPecFrivYF2zyJXG2XNAplfvUOGdvtl0XgK4kQXVijb
   5otILfDLs7IfeC1CvMJLf4pbiAAED+qjsp4uKirC+ydpWtbmQRFmB+FdZ
   sQVrpB2T3LPL0wIUGnOrS0iOzdp4BEaC5O1h/8auXnN0EVRKnCnAk+A96
   otvhKHdacyQt1yoM/n0YydjJ29OxoupalCHqESS5vbBv+ahNwTSs0vU/2
   LbZH4DBW7I9FTu4Xx1Ngguo0TOH1ZQMzb28DMmUwA9/S+EIIwpFZ9Adnf
   g==;
X-CSE-ConnectionGUID: SetnRlywQNKNk0ZmqnV8qQ==
X-CSE-MsgGUID: UskOMCteQEixCUmWv7dyig==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1713256"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1713256"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:22:03 -0700
X-CSE-ConnectionGUID: 8kIHYAe+RV2siaKA3bjRrA==
X-CSE-MsgGUID: 5Z7zOCH/Q7WyKlRsaWLhWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4596382"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:22:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 09:22:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 09:22:02 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.8) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 09:22:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O09DStiWyugdKHCQxYTpF2gBBFl0fZou7MLRw0WBd2/ivLVhVtK3AhQ3M8WoFsRRUHAwpYZmI0XqRN5NtWwOm7Kmm/uOwhplhYDyjin36eoV+k5/u/CAbNLa3nHF7wfTjN1SPqBcE+nHDUQNfVVgdaA9b+YCXBLSag5PNfnul7lB69iE4VxEOwV/7yj9dSiKdTVpA82PdTqLS6OZbll7JfzroZfGa7bAW5TQ0VGJWRn9essAYIo8jPy3bIsIVRfltqFB/7IUjgKqo3BLLwx6j/asKp6kHKPVaL7xo/bbMWZmcRpOYxrdy70sDh6WvAtG1FvROBtH40Thca0VpieSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ra5prA9vpBmXY2lVtW7v5BvEqCj/WStY5Co5qjaKj7I=;
 b=sdeIqPz/CZ9wMwUC7zY+0prQ9vSNkvIFxPQNQJnxqPBC0mR+fOqNTCTDBQ8y8cIzdCUhmUewOxqG3HeQHuWJoZwg35xr6EZju/4w8EdkPNA1rUelnJ0IG72CjQnpuifKSfmpomktE/+c6h+9h6KAaX98B4/m+kTe1b41aDh+gX7JLtN4zkPEzF3F2KJuzBhTjDmI28RxS01Wioy54pI9x+xCD741oPC9Lk0vo4CgHJco6b6b2ZvYR8fE9hGkTMBP4U8ravOGIukf5BpZzOvZKqad8MT05P33cFaop8SY3vDpaUGk61R/Ap2g/LhdoBlBha1hudllQWbEmqcnVefW2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CH3PR11MB8212.namprd11.prod.outlook.com (2603:10b6:610:164::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 16:21:59 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Tue, 27 Oct 2026
 16:21:59 +0000
Message-ID: <d59c8bae-6429-4718-8653-117133462b49@intel.com>
Date: Tue, 27 Oct 2026 09:21:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/12] x86/resctrl: Add MMIO-based LLC occupancy
 monitoring support
To: Chen Yu <yu.c.chen@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	"Hongyu Ning" <hongyu.ning@linux.intel.com>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <afa6d022d767b0debb2aa7814699ac9842825820.1791933001.git.yu.c.chen@intel.com>
 <9e4fc1c8-c40d-45f3-8735-94d218168b8c@intel.com>
 <auCJh7ZOL8CSbgvv@chenyu-dev>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <auCJh7ZOL8CSbgvv@chenyu-dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0262.namprd04.prod.outlook.com
 (2603:10b6:303:88::27) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CH3PR11MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ef5115-5b03-43d1-24cc-08df34466cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|261026140227099003|11063799006|4143699003|261021123027099003|56012099006|261022105027099003|10067099003|22082099003|18002099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: zJvnphMl9yyzI8ILvM5TIOWBdAKAVAX3qqa7QMVDi2rqekwWrwEHE7UOj4Vbww3DdMd8cqwUybpiPYC6iYoV0VjnKOrCrK6KbITVwZcNpxj9NrLC4pxe9N8wMDO0UaelAgFSF5qWT329goeguzaGzuZd3aWYctN4CZZBMymWhyIeCeh9UGo4tggMkWuSPlUwg419iLOrMcpQR3DVYrHF5Mc8LeJkq/lZJMlLqWosywqPNIXzaf1C9TMocuc/LMLmRmdb0t9OzFe+Na2q5YZEEYyp642fgX/ItPRjyWSSVevq7Edfrqo2bDYGadWxA4E5J7eFZ0Tdy3C6OxCPJ6M97cFssxMM/kFv2t2QURKYdU57Joz3kLLwT2tXUSj9+josPu2hu2gAiCjoCJCtz9XL17NefpZeS+GqrXYPkIi4ZW6QjhAMxRviQHLihh95k4/M6SPS6Cbb1AK4HthNefDpZvNVw6+WcTto+wmdngKL/W6tb5XaBJzS/D/3p7YVwj6AHt1EpCaI78jhBo6QAb9ezRzZ9yerS6hRE41y+8789o/ssc2LxGqwWEIcWhNv3QLxjMRyeiqxbKuMd7EAyZIppBtapNLObT4jgpixFp6zij/QqCfbT6hUAdabgayWwE4Q5gN3rWyS16hIUIu4rYYp6DrWNS19yOjgY75NILa+hBY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(261026140227099003)(11063799006)(4143699003)(261021123027099003)(56012099006)(261022105027099003)(10067099003)(22082099003)(18002099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkRpaTVDdHhYZlUxYU1MNmc4OHJxZ0RwUWdRMHNCdTYvUFJuTVF6TkR6OWhp?=
 =?utf-8?B?QmY5S0dVOXhNQmVpRGFNU3RCOTJlVEh2amd0dFRYL1pxVWJYVU4wL0xvMlB1?=
 =?utf-8?B?ejdUSDh1WFRzKzI4aFJFa284cjBZRU9qWDl6OFREWVpHTWNvYWl6M1ZGSUdr?=
 =?utf-8?B?MXJYeUM2U2lRWFBUeXpBdWo3MEluZmE2by9IaDV6aWU1Q3pGRTVPUktxTXZY?=
 =?utf-8?B?VTE1Z2FnbloxMW9VQnhvWC9YK2NhTEgyTytDeWpiaTdabVlRQXA0NjR0R2xI?=
 =?utf-8?B?Z2JyaTM5dU4xREJKa2N3WDZHRVIzcDAvLzNuRlRyOUhGS24vOEpweHNkYnVW?=
 =?utf-8?B?aFJ3M1grVDBwbkV4UWIrL01xTjZqOTFKcUpicjRsWHEyTUNxdmcrZlBBeFpO?=
 =?utf-8?B?NTRvRkkyc1Fnd0U2aDc3V3haQXR0RWp2Z28raGp0cVp0S0krSFZSWGFIbm81?=
 =?utf-8?B?YU52VVkvNTd5WlpCRnNjMWlXU3hVKzZBY1V6djZHNlk0UmRvRmptdXJZcUdZ?=
 =?utf-8?B?MzU0ZFhWdUlEMENjU0Ivb09uY1I4UTdhd1RKenExTVQzZTJsQzJZL1ZGZmMx?=
 =?utf-8?B?NGY4UlMzOHpuSFRsQUNsSkY2WHZOUUh4QmJ0SVZ0cm1rcXVWam53a2FkVEtT?=
 =?utf-8?B?VUJHZzJyZU83K3ZteHEyQ3dMWXFkU3dIUjlFclRFTGZ5MkxmblExbHMyUEti?=
 =?utf-8?B?c21VTG9HaERqRjVicjNxUHE3eEY3VFBSbjFkQ1hhVXNiTVN4N2V0eXRUL0I1?=
 =?utf-8?B?aVQ1bGljOHEvL0pQNGtXTTJuQ0ZHZnV1eEVDQklpS0xFN094Wms5UTJ6QVJN?=
 =?utf-8?B?eGxQZ2JGSGJwM255YVJQK3JRQUpCdGRWVmY4MitwZjdJVUpqR0tHTzNtbC9m?=
 =?utf-8?B?UWVNQzFsS3VNbW90b2NnNjZ0RmlTaWN2cHdzcmFsSTNpcm80NG40b3IrM1c2?=
 =?utf-8?B?ODN4L1lSM3hNN2JPSytrWFNlY2M3VG9mMEJIYzJIYzhveng3eCt2Z2plNTBM?=
 =?utf-8?B?L2tpcjQ0TkZrZWJCRGovS1V0ZnBieFhpREh4dzVGR3BqaXRNYzJhSGtXREtQ?=
 =?utf-8?B?WVQwV3NJckdLbVVnbTQ1WjlLa1IvWUtBUVBVQzJFY1ZqYTV1eTVuY1g0Nkgy?=
 =?utf-8?B?K0tRVHQ4WWc3M0RFVUN5c3R3TkJRdjVQRnNYeGViQllQNTlDUjRheTBVWklD?=
 =?utf-8?B?ZHRKUGlhbU9BeTdvbi9STS9SZCtNZHJqMDVJWHoyNG9obERKL1V2MFRrSDZa?=
 =?utf-8?B?aVdVMEhWdDZYV2FCMkFSUmR5UTdmTE81VTVNblV2UWxQUEFGUkZheDJBTEl1?=
 =?utf-8?B?VktqNVdHcE00NDJmYUs5Z3lZL3RXYzJKWmhKZE15ZFlSVStpYW9PRmluQ3ZB?=
 =?utf-8?B?RitBbmJ0RHFuVU9nZ0pZTHZJK1pzellUNkNUV1NBelEyUmQyZy9WTzhxenZj?=
 =?utf-8?B?NWJqdC9SbS9pRTBGN3NWVXlSL0EyUDk3VkNEeFVzb1FQU3BUeEk2cjB5VmZj?=
 =?utf-8?B?U1RFaHYxb1J4MXB1eHJ5SkJzZ01RclUrMEVpQlJmRmRlRjd3VG9nQmY4NFFL?=
 =?utf-8?B?NjVoOWI1Y2laN29jYVVnSjhhUHVLTEV1U0RZVWpFY0xmUkQ4VE1XSCtWNnZN?=
 =?utf-8?B?SmhtbnJZK2VxL2hWeTF1dFZoclFlUXJMRThOMFZqZUNZMFh5WnY4SEo5cklM?=
 =?utf-8?B?dThibFh2S29ZUVZBTWtFYU9oVFQ2WjNhOUk5L1puNzBXbUljcmlhSlFGbm9k?=
 =?utf-8?B?WmEyMHliaG9lS2x5TnFlV3ZVenpPMnZLY2dLOEEvUDIyZ3NCaWxhajBQWWRq?=
 =?utf-8?B?OTJDbTlVVzVYbVhDSTZzOFY2V2k2R1FVK2FZeEdETHhXa2RVVWNuS0h2SDFi?=
 =?utf-8?B?WXRpQm9tdnB5N0N4RVAxUTBiZUlsVXpBdVZXd1F0d2NLaHZrTWtSQ3pVc1kr?=
 =?utf-8?B?TU03VmhNaGJjRlhXcUdRUDg3bnFQSzJxMzhRanJQVWRpNkpYUlMwbW82d2lV?=
 =?utf-8?B?MkF5ZkZSN0wzVHN0WVJPME1xQkk5OEJHWStxL0d2WWFIdGUyNHhVNDdBWXk4?=
 =?utf-8?B?Tm52S1M2NDRjSWoxL1M5ZmFnS2E0S1JCYTNBSHNoajh4S1hXbW9TOUtSSUlQ?=
 =?utf-8?B?b2VzRnpwbnVBYlhWU0RudDA1SVJUNEx3ZUJURDYwYUI3d01ZcnpLRjRaQURT?=
 =?utf-8?B?WGw2cUdGZ05seFRvZzdvNWVWNDFiM1FiaE54OWJ2SXcwQnFpK1NrM0ppRE9B?=
 =?utf-8?B?M2czNytpRlJWZjViTXVyREhHRnhXV0xFK0JYOWlZbjEyVXZ4SzdNUDNJVHh6?=
 =?utf-8?B?YzIrZHhMSUl1cGk5MGVaQ2RVdXRyUWI3QVY4WENvRnhzR0JtMWxvKzk3NXRM?=
 =?utf-8?Q?7M9zSkT2reANdq44=3D?=
X-Exchange-RoutingPolicyChecked: IpidZTGReX7CLrG42D8mYu5fldY/KXFrS7pTTDh79WyE7+z8YWbk62M+K3BQtl2KPLXMCefIq0Rj5w1hJZBv/TQYCDz1RGSmogeKRPr93vvX/PY+SJBl9J1ZWUclEopVYo+/hwa3a+RrCt+jMuvj6/dhFphRerL+kGQTRHk5FCEsBGTy4s8xoXHQYiX/8m1DxaYLgO+/qNIYGu8cnjilH3/aSH9tCJ3uPWkJt7IQ3V/F66uFO75K3tZOT37njo2TvT73Z1n8JQu2Hoixz+7+/zK3LdksZjDdbfG/S/xRIpYzk7lq+07C61e+LjjBoYFkkHUMGi/AynWQ6qLZjHSuaA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ef5115-5b03-43d1-24cc-08df34466cff
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 16:21:59.2978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwdFdl6tFynWmIFlX7tNuO0Ytn5RyiGkaUUNgI3AtAFpt/rKrDYdcKAWtmm599ZecT/6zpLU1QJwnwpsX3dY8oSiD6zWds+9eWtDPt47gPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8212
X-OriginatorOrg: intel.com

Hi Chenyu,

On 10/27/26 4:22 AM, Chen Yu wrote:
> Hi Reinette,
> 
> On Fri, Oct 23, 2026 at 05:08:44PM -0700, Reinette Chatre wrote:
>> Hi Chenyu,
>>
>> On 10/13/26 8:01 PM, Chen Yu wrote:
>>> Add erdt_mon_read() to read LLC occupancy via MMIO and use it
>>> when the platform supports ERDT. Register the L3 occupancy event
>>> with ERDT enabled when available, falling back to the MSR-based
>>> path otherwise.
>>>
>>> Use the CMRC (Cache Monitoring Registers for CPU Agents Description)
>>> ACPI sub-table to read LLC occupancy counters for each RMID via MMIO
>>> when ERDT is enabled.
>>>
>>> Although the occupancy counters can now be read from any CPU via
>>> MMIO, keep the per-domain limbo handler. A global handler would
>>> still have to iterate over every domain and would save nr_domains - 1
>>
>> Please write what "nr_domains - 1" means in English since as it is written
>> it is not clear how this "does not justify maintaining two limbo handler
>> models."
>>
> 
> OK, I'll rephrase it to a simpler version, how about this:
> 
> Although the occupancy counters can now be read from any CPU via MMIO,
> keep the per domain limbo handler. A single global handler would still
> have to check the limbo RMIDs of every L3 domain, so it would do the same
> amount of work. The only saving would be running one limbo worker instead
> of one per L3 domain, which does not justify maintaining two limbo handler
> models.

ok. One nit, please let it start with "Keep the per domain limbo handler ...".

Thank you.

Reinette

