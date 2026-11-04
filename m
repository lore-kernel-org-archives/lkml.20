Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793826172;
	b=wugSK3eksIMJ+YmnGgNk6ukOmR1I1NC7uY7AC0+NrUj8LNBjOe1Pk1iEy+Ui3OAk4rpO
	 sfJcLEsgMUv9a6lMjWwevy7PFQR9Wo0dOoA9m4zgQ40+g/70FJjqIgunAO96jfQYpG+vz
	 mQlGR+s+nH3pCzYUQxEkKpY9l1k/F/bX0ny6ritI+3F3EMhy8kfuB+6yHEHnDKfa7EaCB
	 xhW+xK4uO0DcQKa5UlT/B0JGeaECvBQ5ZKiEWKCvFC0EYNUYVoYnOkk+CrLaXBb9CV3+2
	 bOA66wbGhtshm+PG5vIfbvPfwsoKQAxBd3HvvtRe8nAiHwXcjp6qUX9j+RTcAu0agYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826172;
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
	bh=nAS57q6l9QsltufjrJsS43H/K9dO8GAnVM8fxcfFD9o=;
	b=IejwL0pjCHzQuZv9ifp8z1jaRcbDTkCe8QV8bm0MbqjmQya0/EOAV3lqLxAC2ONDex8+
	 PhD6sh2Ckk+vH0odOm1kyw5lG3OPuMWzk8Vp317dEaKBbWZUls+T/BkU8DNRG2DN8Sqo/
	 QE879KPfI1bVl/9k1b96bc37K63AR1cKOtOliEPChPKkzrKvmauTK9zp5PjBUpTaCxdPL
	 siAOh0/2MhMBsox1FIT78Fy5WtlW90pYi5T8OOpHG9Ykf3A4Ka4wJuDrCSd292cy5GF5k
	 l+OFwHvfx47kKt9+9nRN4wyXwAphywP1N0kzMVkQlCnNQQcJOtK58V617PhdCQ6dN4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dOcfyOt8;
	arc=fail smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CD6606D4DF;
	Wed,  4 Nov 2026 21:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6CD6606D4DF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dOcfyOt8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793826172; x=1825362172;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FkpfWXlOT1lYPkIua2SpzeLi/SKy2vzxkDze6t84vmM=;
  b=dOcfyOt8K6VgZMeSJu22iutN/xNUz2//gKsm5nEdkL9gmloSlxQVscX9
   YZzhuAFRD0AZXlIj0usktDO34MlJLdgO9Jz69nzDyJYnkGPeLv0ooZq7w
   UyZpqgVXfXE1X5pV3OgfMVWr5dcN7cVk7wEDPHgZCYkJ/qHQi9Sg6+8oO
   q4CTN1RLYgCWWqHNVyLflRBPicLqB6ronkW7Su1zB3FZtyBGRydCfpT6Q
   WgEUQd2/dDSQWy+FK3MQ9BB0Qxgg2KRszzftdOX1wPVdONp9u6qXP50eC
   HBnULgBDGzFM8FKydGayuADD+7OlDP7AKTwcarT74cHCKYogKM8KLtSGA
   Q==;
X-CSE-ConnectionGUID: K3KlXhOeQBSYaLEflZmurw==
X-CSE-MsgGUID: LCFoEWBgRZeezI3Vnp53ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2690108"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2690108"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 13:02:51 -0800
X-CSE-ConnectionGUID: xwhYMivJTcqOiqRPsxvcvA==
X-CSE-MsgGUID: qhjsfYtVR0icWKSQFCvLPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6696246"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 13:02:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 13:02:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 13:02:49 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 13:02:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8c4dV+MK/M7wyVTM/EQLC8TEMF6caJsAeU50rQgP+vMtsR2dDIw0AWJBySMs+uQ35olkVQ30UprhoWi4h3qvx/HmL5uGtwHh3uKMszkpIU+VqpnEv8tFIxQRCmBG7Ctr5Qh0WHphhe7kPRlbaqqTleabEcJqKmxJaQNsWCUzYZfgiglnyICGyoocSzxPs/OWfy2x0pxJqb3As0S9HErXBbpusUN94GMP4d1LBhig9rTtntut06kvVhFDNrrVdwkFcAjipvpqF5GEvezMHkf7aa8ip8JbYe4+31yb/k+TkMp2aJn0iu2g0+u0ZQGwWGYMInzcsnkqXd0YuCzgT3FFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAS57q6l9QsltufjrJsS43H/K9dO8GAnVM8fxcfFD9o=;
 b=wOphJVT5qGpGeJifPzFN1OGh0H4r10byI255Ht/dIrh30g0/C2Ohm/8B6ctrznNe7xxN4f71nXwefpFTPyeUUgLGGxWAQDV8Kgm+zRWsEcqGBw96fdp+0FqCp+ICtNnt+1hvRxznrdV4pcLy5sc/VvQRs2FwK2joHUXVKRBV2TVjgbN140zaDtTL/X5XnGYK4qrLwr6bCjtQa+6r+8MNNCC3BRqTtUSF5i/Qj0xJqDh2uYIHnskJWjL/697dhMsl+0iLTj3klgtuEHQs6tY+dgDwClENhQrINzOV0B4qTiWDgkVNrpjZDuAVI5LY8GWLtRHDQaKEib6A+u/5IznT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by SN4PR11MB9943.namprd11.prod.outlook.com (2603:10b6:806:4ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 21:02:48 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 21:02:48 +0000
Message-ID: <54b9b19e-7513-49cb-8367-8ef7711ac918@intel.com>
Date: Wed, 4 Nov 2026 22:02:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] ASoC: Intel: avs: Soundwire support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Vinod Koul
	<vkoul@kernel.org>
CC: <linux-sound@vger.kernel.org>, <broonie@kernel.org>, <tiwai@suse.com>,
	<perex@perex.cz>, <amade@asmblr.net>, <linux-kernel@vger.kernel.org>,
	<yung-chuan.liao@linux.intel.com>
References: <20261103134958.2089136-1-cezary.rojewski@intel.com>
 <bcfe64de-359c-4f16-9014-5d6f8bf30c40@linux.dev>
 <9da94716-4dde-4389-9574-12f90b52e05a@intel.com>
 <d9672276-5616-4609-98c1-5b9bdd06cf05@linux.dev> <aus0GT3ht1oEY2mc@parshuram>
 <746bae53-ed1d-4881-9268-968c25270bda@intel.com>
 <259d0c79-2a36-4a36-8e7c-fa24137a02bd@linux.dev>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <259d0c79-2a36-4a36-8e7c-fa24137a02bd@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0011.eurprd02.prod.outlook.com
 (2603:10a6:803:14::24) To PH0PR11MB4952.namprd11.prod.outlook.com
 (2603:10b6:510:40::15)
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_|SN4PR11MB9943:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f06d8ec-9679-4559-6b06-08df3ab6fb05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|22082099003|10067099003|18002099003|4143699003|56012099006|11063799006|261102123227099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261009223027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: JajBk3OuTKCAqj8niJGdZ9ww4ivFwuAlU21uwOw7jQqUVTuvYIdfir7/P7NPdW1Vf6S489/i2mJSBspCuJ3GcKbWQZwebip5274dRa22BqYwTTvD36WpSJDQOci0OtYLXkQt0HS6nTiXu4HfQ2FgqGGMGe3ZOPI3rOOIe94lMKY7v4xwOR3H+nWDyttqYnNjbGFLo0f/MLRP+Tk+1C0NQ7etvymJqVLEKOJ6xf1TWMxER9EB7rC+cFdqSy7tbil6ruvzg5yM0RrwlZgK7mDod2Plk9IeBHThoq58Y+2bFRAFzWCahT3XQVgIZPneQSq8HeL2CdL5jpms4SjLn1ro8duemZvM29NhGRbGwW5ADNgGZDvEzl95ZiPbogGzOtB145xzfabdovC07auc4uqEAT5iheti3PBbfVBLcQPM6kHyFoBhIy+wMU2Z9+3iQqNDY3HrpsM9lUl10iUdAG8GjIMfY6ZtvJxcPWcjbqAtEHCLP2LfKTcjvlihpthlAKy6z261klL2fE8bzmxEObCseYcnGRm59bDkOwxw+0t9txTYANSDJQlPOqHATxGck6z4/WMHESoRhZf03NTAWE/fSQ8vV9y1iFl7jvrxbx9Z/yPC/5yaCTAVWx/zDZAtBU5AgqRBepHD6uk9mUVlZiT9ktN2bOYgT01YjzG+Zj5jZQI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(22082099003)(10067099003)(18002099003)(4143699003)(56012099006)(11063799006)(261102123227099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261009223027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU1uUlZsejJkdHU3WnBqN09LcnFZME5yOSsySCs1bWlvb21LL0xqQUxGVmNo?=
 =?utf-8?B?L09BbG1iQkZuYjduRktrckdQamEyMTZzbCtRa0Vjc2ZXT2FSZVNENjNOcEF0?=
 =?utf-8?B?RklDTFVsTnluOXZLc2ZVd2FiQm9wMVZPbEROMjA4STFNN2RZVjFrdG1odC9x?=
 =?utf-8?B?SHN4MTJVbXJVWEVZNVBXSmRUQXN0ZXJYOXB1Nm9PT0U4am12L2MrVXM4WkJU?=
 =?utf-8?B?YmtBMTd3d2doZU0yTWw4QXlSN1JYdkJYdlVnS0pBQUtqK1dHQlU4UDVDVjl3?=
 =?utf-8?B?cWNEbmJORCtlMXZwTUNSK3M3bGNDUUZPNFgrRnFRcnpad3BMcWxaSFc1azVx?=
 =?utf-8?B?TzlwZWh0K0I3eEhkVm1oT3UxUlNCWkloWnNRM09PYnBuUncrSms2TjVOZzNT?=
 =?utf-8?B?SWk4cnlpS1BsQWNUT3kveGFRZFhFQXlmTEdMSnA0blR2K2xCaGt5aDlzWlNN?=
 =?utf-8?B?eDk4WE1hKzJsbnBwRlY2NXBncFhqMDd3TCs2MXNGZ2pRNS9IMTNKSFphQ05l?=
 =?utf-8?B?MWMxVzFxd3R6QVlYSHJFK0lGNjNoV0ZUYkpocUpObitxYWdHUy9lODBJODBS?=
 =?utf-8?B?UUJkdjhjNDdLZ0dOTHN3MU9KdS9ndEtQejhyUWJ6T1FPanNGV0h6MEFGTDdn?=
 =?utf-8?B?Tk9pMG1tZ0hPMU9PRTM4VDRxZEgrc3VaT0Y0WkZCVGZteHZ1aTNMOFErckZk?=
 =?utf-8?B?WlloSFBXMVBwc0c3cDBkK0hzc1A4b0FxcUd4Z0x1K1VkaVNmaWpjM3c3aVVP?=
 =?utf-8?B?bXkvRy9ORHQvQzF5OXYzMVlrcEdabUpqMFp0ZzJYTnVwTElRUWJKVTZGT0h6?=
 =?utf-8?B?OUxkL2RCUjdVOTNNRzZYK25hNDMyWWlwQm95dnAyRmxVNGtOOFkzbVQ4SkJO?=
 =?utf-8?B?Z29QZ3QrZXJMTzhYeEJsOWJXb1J1UUQzZlVVbHZiVGtEVzlmVXpoeDlWVEhG?=
 =?utf-8?B?TEs3a1FMOUdBbHVDR1FOTU0yVitsSVJ2VU5rSmg2T25mQVd0UEhjTlgvNWxD?=
 =?utf-8?B?MFp4cFdqTTZTd09aU3hNYlEvR3EwczI5NzV5bC9QZkg1L0FlSmluM1YyS2F6?=
 =?utf-8?B?a0hvNU04Q21GeHkwUmI3VHQzK1BQU2xJUVdneHQvYzJHTndpdkFkUGlzb3JQ?=
 =?utf-8?B?bU5zWEkvaitrZDRLZE9QelF1L1BycnFkVWV6eGU5SE9ybFo1ZHJyUmxZTDBS?=
 =?utf-8?B?MC9INlBWS1RHRlNlTDZ0cStYZ1NROGhvSjhscWp6VUtrMEJ4UjgxcWtPdGRn?=
 =?utf-8?B?cWhjQ213Y0YzWDhmRXZKcXhuU0MvckRxYzBCdXJjb0hXSTliU0g3UTg3RjBk?=
 =?utf-8?B?MXlpRUVYeXd2RjVndjZnS3hhWWx5Y3VxR3VaclI1UHNaQnBGVHU2S3k4bTlZ?=
 =?utf-8?B?VnF5Ujc2WjBKSnJwa1JXaW84VnB1WWFXbXBvdTgwRDgwK0UzS1J0cHlSb2hC?=
 =?utf-8?B?elZrZngxc2pZdTArYXROR0hKRjAyVWI4QUI3WncyTUx6LzY2WStGWkJGcXVo?=
 =?utf-8?B?aXV2aUVqdmxSR0U2cURZck9KUmVHRGxHa0QzWjlqODRQS2xnOGhxV3lmcGNF?=
 =?utf-8?B?clA0YmNxd2lNcHRleEpiYy9HaE4wbWdJZ1kvMnNXMHk2dFJPNzJXZFpKK3Np?=
 =?utf-8?B?NjQyWFNiMDZkbDgrbndQRlV6VkRBSHZSUmJ2L0xaZy9Gd3JFTWtNMi9OWTVU?=
 =?utf-8?B?QmtzM2Fvem9ORmJLc3lCdThYWU9seUh0UTVVMkliUFZxNTJ6SUhuSUR3UHQr?=
 =?utf-8?B?Y3ZYdWlVR081ZDVFS3QwUmhSM1RvNFF6WlFOVHpBU2ErWVRiM0J6L3NXWEU2?=
 =?utf-8?B?SXU2L1RudW5Pb2F0R3dOZXk0QUtXaHBIcjM3d0tpaTlnVTU1b25VbHpmN3p5?=
 =?utf-8?B?WUxLY3NxRkdQWml2OEpZeHY4ekN4L0tocXd4MEphOHZkSkxEOGplcHlRNExn?=
 =?utf-8?B?VmROKzlBdEo0VWJQSGdCL25Scm9mWkV5dEIyZWdwVHhJWUpNaS9xOXBkT2dw?=
 =?utf-8?B?ald4NUcwMGN3SlAwc1lVTCtBSkd0TUo3bzQ1aXB4MG5Oa29oOUkrUmdydlZM?=
 =?utf-8?B?bWpGMkEzb09JUGZCNEJNdXZpL2RaR0s3ejR3K1BGOWFiQUw1WlBLL1ZpcTVS?=
 =?utf-8?B?bml2ekZiNTNzSnpGTDVKZmJESFh3dmpwVW5yR2dtOEZSNHFockZFaHZaaVhH?=
 =?utf-8?B?ZjM5dGx2cGthVWk0Szg5Sm5kMXRtTEFWeFFpaVJ0YnFCZE01cUJ6bVVmNjk3?=
 =?utf-8?B?Rkp3dDZ0RWltdTJDSDZZbUtROHo4WTBGaHl3Wkh4YjZCUkJtR3Ryck95RW1o?=
 =?utf-8?B?bjRlRnh0cGlSbmwrMDRXbWN3TXcxQ0dFWFUyYnFIajF4T3h0ZlozQT09?=
X-Exchange-RoutingPolicyChecked: WtWOOTdxB7Tij+M207ifguPkyRPz1XdWuJvGnSZZ0OktW0kxTzjJNtynF7auJeLGJEqST8luMMdHygwwoEaqLu/xSsTnoz9YjYQYjwK9RmLgL52p4Zcoj+kD4UjOLIjrBx8L9MuI2GeP8dnR8Guff6rs5FABQaJa55vnakXWkqkLDoxKddPJpl3tdM5zfAnndAZ4RnnPiky35Kn8R7xC2GXixZbVpaJLBWYih2t/Ms2AeSk0AatgJGm7xxEeBGaP6vrgCGs+oajaG8Vq4nXfGs89g0Aw+r9KMTQUyejEItuxD4TCr1J5FC/PvJkkDyReg2+YLLQOdYzh5+Wvqq0ygw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f06d8ec-9679-4559-6b06-08df3ab6fb05
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 21:02:48.1240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VzWHdbE18zqnjI7NR8M/9wFLP9gwh6Wx9tTqgwmtRVT9shKAY1crfkAVn0qWWl2zSbDR06k64Uwk1WKu0QHzWARhBDeFfGRHOjkxHRlD6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR11MB9943
X-OriginatorOrg: intel.com

On 11/4/2026 9:20 PM, Pierre-Louis Bossart wrote:
> On 11/4/26 15:31, Cezary Rojewski wrote:
>> On 11/4/2026 2:33 PM, Vinod Koul wrote:
>>> On 04-11-26, 12:52, Pierre-Louis Bossart wrote:
>>>> On 11/4/26 10:14, Cezary Rojewski wrote:
>>>>> On 11/3/2026 6:20 PM, Pierre-Louis Bossart wrote:
>>>>>>
>>>>>>> Also, the existing code fetches the PDIs based on pre-defined "dai_id".
>>>>>>> That's not the case for the avs-driver.  It simply asks: "is any PDI
>>>>>>> free?" and assigns it for the substream if one is found.
>>>>>>> No predefining.  Again, this aligns with how HDAudio streaming is done.
>>>>>> Yeah but at the end of the day there's a 1:1 mapping between cpu_dai and
>>>>>> PDI, no?
>>>>>>
>>>>>> All PDIs are created equal, a dynamic mapping doesn't make things more
>>>>>> efficient. It just makes things more complex to debug since you don't
>>>>>> have a fixed mapping between dailinks/stream/cpu_dai/PDI.
>>>>>>
>>>>>> Put differently, couldn't the AVS driver work around that fixed mapping
>>>>>> to avoid changes to legacy platforms that have shipped many moons ago?
>>>>>
>>>>> Kind disagree on the debugging part.  Having SDW streaming follow
>>>>> closely to what is done for HDAudio from the beginning (no hardcodes)
>>>>> makes it easier for a developer to debug stuff.  OTOH if one of these
>>>>> two follows a completely different path, the developer has to have such
>>>>> hardcodes in mind when debugging the PCM code or even when looking at
>>>>> the topology.
>>>>>
>>>>> At the same time, I'm not going anywhere and I do intend to work with
>>>>> Peter and Kai to update the common code. Simply put, such a refactor
>>>>> would be routed through SOF GH first.
>>>> The machine driver selects the first available cpu_dai when creating a
>>>> dailink. It doesn't really add much value to add a second level of
>>>> freedom to select PDIs, since in practice it'll select the first as
>>>> well. PDIs have no moral equivalent in HDaudio, it's a Cadence-specific  IP.
>>>>
>>>> Also there is already a degree of freedom in the allocation of
>>>> stream_tag, which is used for DMA support. That one makes sense since
>>>> DMAs may be used for non-SoundWire things (HDMI, trace, probe, etc).
>>>>
>>>> That's 2 degrees of freedom on 3 levels, do you really need full
>>>> configurability?
>>
>> I'm not following this "level of freedom" notion. What's part of this
>> set is a basic allocation - driver (a user of the soundwire-lib) comes
>> and ask for a free resource (PDI). If there is one, it gets assigned.
>> Very standard, how many expect resources are redistributed.
> 
> You're missing a level. The platform driver exposes a set of DAIs, and
> then the machine driver will decide which dai it needs for a specific
> dailink/stream. That's the part that really matters IMHO.
> 
> The choice of the PDI is done only internally in the Intel platform
> driver, and it really doesn't matter how you map cpu_dais to PDIs. A
> fixed mapping is just as good as a dynamic approach - same results,
> maybe less elegant but the performance is identical.


While I'm still missing why the machine driver layer is mentioned here,
I guess we agree on the fact that basic allocation approach is more
elegant. Never claimed performance is better.

>>> I dont see any gain from this approach. I would reconsider and see if we
>>> can reuse things
>>>
>>
>> I'm not sure which way the last message goes.
>>
>> However, I find it easier to move from hardcodes to the basic allocation
>> approach (seen here, in this very patchset) than the other way around.
>> The change would consist of updating intel_hw_params() so the PDI
>> allocation is no longer done there.
> 
> Change is risky, especially when this touches platforms all the way to
> CNL across at least 3 generations of Intel hardware since 2018, for no
> tangible benefit.

Well, that's why I don't want to mix the 2 patchsets. However, I'm of
those who is not afraid of editing code that touches older platform - my
intention wouldn't be to level the code, obviously. From functional
perspective it should reach status quo. And both teams have their CIs.

Now, I assume most of the discussion touches on patch 2/7, the one with
sdw_cdns_assign_pdi()/release_pdi(). The main suspect:

intel_hw_params(dai)
	alloc_pdi()
	config_pdi()
	params_hook()

is a DAI operation, represents dai->hw_params(). The params hook is
there to give SOF some location to send IPC from. If intel_hw_params()
is split, there is no need for hooks. Such hooks are certainly not elegant.

I believe the way forward is to convert DAI ops present in intel.c to
library-type functions. Let platform components call these. Frankly,
except for our friend, intel_hw_params(), one could say they already are
- perhaps the whole intel_pcm_dai_ops could be dropped.


Kind regards,
Czarek
