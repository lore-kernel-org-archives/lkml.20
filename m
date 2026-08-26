Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD1447605D;
	Wed, 26 Aug 2026 18:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769628; cv=fail; b=pLo7AO9vHYN7aRQfgNSOMNxWVxiUnrRk0PMocB+yUtp2JBk+nG+Crg/Pl2fqXs5JYStksTdffPcqJUnfnunocoL2vSv7tz+15Ehcbju16fgu+kLks0F8sd7FVMeqHcimQ5PMDuVIBIx+UAs4ZO37dDTQW79x+3IRsdpsXkDmVSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769628; c=relaxed/simple;
	bh=vRj6FnEgmy1vxeJ7Utb9P+5P5sI7IizBWn4kWVryIx0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uN4cdHP1spolfgG7pH//SBgvdrJVWsBCRFYDi+j7GbGMWXjSYag0LM+vNqVJrj9OT/f8iG4ZuBX7yUbpALTRSlHFYNvjegxLaIYrOox9B8mNm82vvQmIXhwE1siLk/mY0dzyyfp0/yLzHIr/UOpCHeYOLQVK6zZozZhlAVfd7d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aS9NWQA9; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aS9NWQA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787769624; x=1819305624;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vRj6FnEgmy1vxeJ7Utb9P+5P5sI7IizBWn4kWVryIx0=;
  b=aS9NWQA9sCB9/QsI05SwbByUJxxijevAC8ea8HhDp3WmTvgcBGQ9xPpw
   2Rl1qYAKCJ5wi3yWanNIxD2tOVbQ/6Ewz2xicZud9OrTjtiWj1aoSnPRO
   /O7ugNUKRFGIe8h/W/rZSy1Kp9RP36mGTiTbJcshDfENZOh+gxpKcHKzt
   IFPND3+nfgyTmyDmsECjuZc5aPmBjL5FFsxTjbgnEH18xopn2XbYiNve7
   SclwdjUwkZ+isehEvzoSbX8akfORyowy9LZLcEmmtTTGZomu450K6CVyh
   un64JksJrFPlpJj8K53nUXCWz3SHkpBv2VZ6pg1YJ3+S58CZblIpDJ3H/
   Q==;
X-CSE-ConnectionGUID: g23Or5UCSpaXDSO+qwzWvA==
X-CSE-MsgGUID: IdJkb7+0TOKTOR6zHlwGtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88117553"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="88117553"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:40:15 -0700
X-CSE-ConnectionGUID: WTIZkwhJR0GbXC9AypAOdQ==
X-CSE-MsgGUID: i9Q5uLH4TBypMdlJOfRwnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="292498745"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:40:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 11:40:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 11:40:14 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 11:40:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SB2GPyyri1RYi8I1eV8M/C7kdkIXx1k35QtolRjPslZI+7ONDpMt7JKB0bLo9oUy1Bn8RdK0UDtvT6sUH0Dg14Fp3udYPiv/sCZwOBwVlYswQfI7mY8syOpha9TBq9h6TGp756EuBLv+8+MuA3ck91neUxFGO198i2X12NY00ST0bBC0sS4Mo6OXQYPXdyJPeCVdEQExVZ0s2orsqmWc48SCHLIeT8rExaXNlx1QcMkK3c/QzQs6Zx4S5HshosXqlwyslSTdmjHj9t4nDglImz9hAj1tpqVALQN2bo7H8cJDB+X9MhBiUnNF1D1alJcUsaEvV30JwC1RAoa/W1V3bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GQIjlhgix0y8QknQR+zxS+u01bXw/lughnZralw9mg=;
 b=GxZUcUs/eOhohpU0XTIewfvO5FCt7jgxtODo4bbPOe8WU+2shGW3lg87O0Q0vNeu7w0Em746aq8NMyDOyVxqIaNQSelbJ6kQoq8l9DzBFgSoMnQJm9AgWcvgwX8vR7FvAAutvvDuEMA+mTvzHYB85COHFokeWE7dMBv+XfyKRJM0TmEWKfjdQgc+iNBPiKuMblCjOYKsaq6gRc4OuhCncHiZAM8s0UL9HYtreNlfCSpBwyhNwsnqAh65BdfE/7FW+FIEDARuUApouobVUYrWZ8AFJl2nitcTu3bAKuhi6v9ibpl4Zqg5wJhX4zOT+qFtm+FCk/AP0umbdc876laKVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by DSVPR11MB9554.namprd11.prod.outlook.com (2603:10b6:8:38a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 18:40:11 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 18:40:11 +0000
Message-ID: <97c641e7-a871-4558-ad0d-825376371988@intel.com>
Date: Wed, 26 Aug 2026 20:40:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] ASoC: mediatek: mt8183: Fix wrong clock cleanup on
 clk_set_parent() failure
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
References: <20260821122928.41343-1-phucduc.bui@gmail.com>
 <20260821122928.41343-2-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260821122928.41343-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0022.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::34) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|DSVPR11MB9554:EE_
X-MS-Office365-Filtering-Correlation-Id: 394651c0-2ecf-439f-58c1-08df03a175d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: EB03LJmGD9xqozJRjqqlPIAsiPQfvZuxsx3IaLWsb7YBANeZoI8EPIb8qc8aCDPma/qgiUCQFnPaNdmZi0Cl5twG3P2QuZy4+pTHwVPeWPMd4iNdXXJUtuWiLaYJ52yYEFswf6ja4NP38Wyj8Z+RCa9vUPaix8UGXvA3cuEammfQZZpFgvaF1os4CZlSlg1sKaxs3HBDdsd3Bj2C2epozlUVYBGADSUW2Qemqz02tjx8AzbCNkcCyXci4chyR6G67dmrxqlE66k2yjIS0FX3DA0Y6Eq3uuJgo8A/r9TzW/emWgEj7h9uhnSEJuUS8zRUicnuASYjJuARPxQaHPksWr3urY9KQkAuhOkOegr96VmrM1dYY1yf4Z7EFb0amLtMyHG8/ID3y4ArpBydH3GozjFjs5oZUZpc0wJaq7i87B25v8bYa6DCi0fsil0WkxKDddpi6WTqCJ7FBnnFnVDTRKAamrg6n+JZ//XZ/n5HgXhtFJvKmKBzXkC8myeofWdsKYkmu/EoZDijD0vbBO11owrdMl9CziWab3mCPnQxpdASsfm2yCSp3wDXOT9tTlFvPRgQMVfRz5BPEst0tNok6720XlA/b1fKwfvUEE7SZE6OpX3vo/wdGNg3iTtzK4deQbtRJRmbX+LoK//jtBtC7PFUgHhOY7ufZ2ayevmVTUo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjVmdTE3TU9SQ1ZWTC8yaTlBSk9UNWRmdW5EYW5RTlBZc2NSNnZCSVpiOEww?=
 =?utf-8?B?MXg1Z214bHQwS1Y0d3VpWjlOQndzRTY4b0J3QmEzM0tSS2h0b0JqcDh0c2Uv?=
 =?utf-8?B?dWhFYVp3RjZzTGpIcWc5T2FmekhoRnN4Vi9pZXUyalBpWEZMNzVQUUlObFhF?=
 =?utf-8?B?cFY2UU8vRHppb0NLUm1pSHppa0lxVFhzeWlwZGRDdE1lWlFhek9ZU0FsT3RK?=
 =?utf-8?B?YnZKQ29uTlNWdnhpOTArdmpqREE1bXdrbDhtVm9FWE5NMExmdGVoeWpHNDZh?=
 =?utf-8?B?dVo1TXVzRU5ZVVZ3TmU5b0FzTFJUeS9KalVqWVoreHBGeTF0bkJ6SzJsUnFt?=
 =?utf-8?B?cjJpeFl5aWVXQWQ2RFM3RjBuaUlVbVd0dkllQzAyVVNZQUlMNGcwa0doK05k?=
 =?utf-8?B?V1lMLzNtaFAzY1I0M0Q1cXkzL1NBd3BLWk1aWWk1bU5iRkRNckhpNVJRcXVT?=
 =?utf-8?B?dFVqUFNZdVA2cUZKbmVYRDJsWDgwVzRNZmpiZmpObHhSbXFEOGVxTVM5dVRB?=
 =?utf-8?B?UEFaazhhOHZNTXptRjU1RlJsTlF3M2ZUd3R2cW1Nb0szZnZwbERBSGtzaTRU?=
 =?utf-8?B?Wm1FTHY1SFc1L05NSGNWaFZ6eHM0bEpFczcrR0g5TTd2WHlkSTVNR094TnRk?=
 =?utf-8?B?ZUZXMGVCK2srdmJVVUx4NDhpUVhta1dUS0IwTU84UFgreWxyYS9TaFpZN0lx?=
 =?utf-8?B?TWVJdnVIVlB0VDJURWVUMkFsWVI3VCtIQmIxTHQwa2QvUnVpRENCU3RsbWYv?=
 =?utf-8?B?cC81S1ZhdVBtRzRJcnI0c1dVM1NoSmx6UVFsaXQwREdaRXVpUTNSUHo3VDB2?=
 =?utf-8?B?aHJQaHNKWFBZRFRVeHcrU2pBWkIwNHBtZDhPN3Uxb3VaM3VCamdueTBUNjBS?=
 =?utf-8?B?emFPTndsKzlaelQzWnArUEdBMjBvUUZNdW02ZCtsRSs5NTBwOFlqVjdHR2l0?=
 =?utf-8?B?OFNSbmFuRDd2SXhDckV1TERmOSttbm5vaFloMXZsVUVVYWd1cExUQ3gxZ3Bx?=
 =?utf-8?B?cmhaSmNpaDFVNVRYL2F0SnMxQ0NpeElBYXFVc3ZtTTdXT09nV0pwMlVCTlRI?=
 =?utf-8?B?SUQ0d2YvU1M1eHdCN1c5Q3FRc1lSQzBUUEJaMkhwN05uWXlzZFlYMk9ubWI2?=
 =?utf-8?B?WE1sUnAxVXhST29XNjFlZTB2dVMxVm5kWE5yYVRQZzhUNExCTFV5Um1vamNC?=
 =?utf-8?B?alpWY3M1RFlrYXFWNVIvV3NGcjA1YUpSZjZVeHFOcWJzMHdtV3B4QUtBenhn?=
 =?utf-8?B?Ky9NZWRLWUU1NzBaUStxQitBMTU5YlpXUWdMV2VUdWJOWEZPL3MzWS9XYUFq?=
 =?utf-8?B?ZVZTTjBEZ21Ka2JCNjdWWTB6QXU3QUZYMzRLZG9iR01Zb1orR3NrNHZPeHlz?=
 =?utf-8?B?T215bWlqU0ZybUJLNm9Fd2VmUzNBVTZsbThtdStydXZ0dG8ybmJzZ2R0b21k?=
 =?utf-8?B?V01pQ3Q5RjdIcEZEbytlUDk2S1BNOExIK055UkRROEw1aFliYStjUFJ3eTlD?=
 =?utf-8?B?ZnhKSjVRT2JJcG9HdUc4VWFPc2hDbXkxS1dRVWkyam9va1k1SUhoUERka1dG?=
 =?utf-8?B?aU96ODlXUWQ5bjB2NmFJTnJIaEcvMGxNT3lETlExUnhPcmZxeWNYbGJyVjUx?=
 =?utf-8?B?Y3Z2Tm5TZkpaWmI3djM5OERrMGZtNExGRUlEMnBHWTl5UGR3RDROVEtDcllx?=
 =?utf-8?B?NDVydHExS2Z5MGI1Q0ZnUXpIbnVwWHM2a2pzL0Q5U3pBUzZOdlBxYXNzUmtr?=
 =?utf-8?B?MDNNWjE4VWJlS284ZmdCbnNNWk9mNU1DVS9SeGVQeEg0V1pDRWovUVZkSmRS?=
 =?utf-8?B?bUZGUDRiTnE3dU04am9IYjJFYlBJaUZ2aGpuU1BlYXBJQ29EZU1zRjBIYy8w?=
 =?utf-8?B?ekhMQnRBMmt4SmlwclZPSWhOVmp4UHRRdi8va0l3QWZNQzNiUFRsNjlnTG1M?=
 =?utf-8?B?K1lvOVdnYWtKc3VuV0t1d3dhb2o4UUFRb3RpUGlJS3ZBcklRSzBpdjNaWU9a?=
 =?utf-8?B?ZVA3amwxamc5VWtwNktzYjl1amtkWDllWHFJZEEvaXFNV0x3UjVrQUFmc3ZR?=
 =?utf-8?B?R1dYM2NkdkFrNzFNdCtGVWdWS0xnNkkxc1NEVlpGVGQwazVPekZkSjk0RmJQ?=
 =?utf-8?B?T1QvUktON1NUcER3elNXdDdjbW0yY1R5WUtLYlJRamthdklINHk1a0o2TkF4?=
 =?utf-8?B?OUE4amlRN09aVWplcFJqMTZIOFdaUmVnbWxKdWFRVHNsb1l1YXlaTE5rYlVB?=
 =?utf-8?B?YTBHVVN6S2pIZXBEb2ZUNlF5U055a3loUUNBY0hyZXd2UjZ3bUZyakIzV2Vv?=
 =?utf-8?B?NDI2ZklJQUFPeWMwWlE0eUN0QmovUVJxNkZEMTd5UkFBbjhvZnpPc20yajRX?=
 =?utf-8?Q?+GM/PIiUKslA5gcI=3D?=
X-Exchange-RoutingPolicyChecked: vXw+OksO5hE4Bti/A4ySuFZBO0QvesIn2HZmpfpkoASvEXNxZI6sA2Zl1yWpkOyaunR5zWOf+nwTh1D0RGsk7CkKWncpNGgL+W8pzVicl8zgg2X3Ss7ZS6O9F5d1S9qYPFtJ0Hx3C8YjG3pU4TB0yzaD7Gm85OGHoenx4IihEmv7dH7HSO6b1u8dmJ9QTk2UUgdb6fh7iPG7B9U+PFwZ9fdQ7Qu3I1f4/1IcQskYiBgyWT0jCXeL1qZvO/0w0XwZjxhyGjauQGRwvjhuk++ykyEmJgrnldJYGPshKw9AdkzvS3WnHk/u47An7VxE0wHd5j6DZdYAxWM1DsBJB12FAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 394651c0-2ecf-439f-58c1-08df03a175d7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 18:40:11.2777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlLxXfLx91lENfE/Ye+DP+5y77CnZ4pYAfMtULhTWnNZhkdF+uBc3+UpkLY3dgjofnK6acx4GLhBxl52EmvauvGU7QtL+OgIbikPbxAa1NY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9554
X-OriginatorOrg: intel.com

On 8/21/2026 2:29 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> In mt8183_afe_enable_clock(), when clk_set_parent() fails, the current
> error path incorrectly cleans up the previously enabled clock instead of
> the clock used by clk_set_parent().
> 
> Fix the error path to clean up the correct clock when clk_set_parent()
> fails.
> 
> Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
Very good finding!

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
