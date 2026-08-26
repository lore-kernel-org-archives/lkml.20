Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362643955CA;
	Wed, 26 Aug 2026 18:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769209; cv=fail; b=glW151Lurcft2qh59DUaAUKvO9frU+tUz3gItdd41PBnvi5fa9vi+NaZoordFK6hM4NvaApomG/4ZltcZg376zG7f7aqFvTWyeveCYsoRrDZjFTZsWqnsZQ79AOmCOSRlUyz44nXqtBVPuZFPLN5Z3DZVEKXvfa5PbheZ94Y/AI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769209; c=relaxed/simple;
	bh=UIi6pf/t04/rPvBC7/W/bWzpESrnYzuwQklU9zTS8dw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZkNlKpFFsXKBcNgyEYaW9O++Ln6N91YE+eQDomBQmOht3MRZpYpiMXKjqfdKTPQrW544/O7ifYgeVm7oundUEM1MWkWdLOH0Y/bKmaJpALVATFw3m743oYw+kZxUgGlf1DcLzhO6LHDOIU+cZ0T/VtAkNTeCOHBUgJoenZXJQ+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNlaRmSC; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNlaRmSC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787769199; x=1819305199;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UIi6pf/t04/rPvBC7/W/bWzpESrnYzuwQklU9zTS8dw=;
  b=NNlaRmSC6p36014mAk3vlQ6KR0sR6IfFbI3/lJnYCDKeOB5Pkv2vNhU6
   on6AtG+XbhD4YgGctrFHofTn4ZoKjMv8vBnU5vPE6Va/uQmMyj09znPUK
   ldmZxSI+B+Z52uIhqXdIL6NqG2UQWAHRvoNLftQFMdjgtwtz0USqidZ87
   99EahB3TFrMKPmYh7ue+bJlc/s8dD5cbZW0Y9HQMxVA36ah3IdlztADab
   f/ReEr3Z/GX6be7LAPo65zAkBOWy4rwSi1walHE7cHkafQDpIyDgymu9i
   GdXrliOR2GvoLd6/obgzva8N1p3KE087MHBYC/us/FmyDPtFtvxZSsWXw
   w==;
X-CSE-ConnectionGUID: 6tU6K87vSuiQ8O4QGgOsPQ==
X-CSE-MsgGUID: M8MZmasmRAWM4TTn3x5eZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="105786375"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="105786375"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:33:13 -0700
X-CSE-ConnectionGUID: S80/z7VdTu6wTi6uL7c1mA==
X-CSE-MsgGUID: 7ev6ZkJiTAae55wbnwPH3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="263888487"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:33:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 11:33:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 11:33:13 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 11:33:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+UKaooYJn4spwbk8i+WkiynyY4KBO9M8ADtL5LVnZS2O6T2NM/3qPgAb/N7Hs3z8CfGOk5cUEFUAuvIBubBpYIxEmlfTit2JF+gW55YlcMDLQZQyhAzYMhWsqhWsGKrKqahhzrH3QjJ9Sr07oFby8gdkvGfKiwmmP3xYZOSZW29M+Li8IPEqPzSVcXZzZhVBJ1UKVtOWQs+5uAOLpoawwGNsFpdxcpELsErrlOacsbex7Lf+W3/ISukX2UBvEedmBWcN7brjbAg/4IPRKmMwtSQENvB+km5kC66ZFl7roMCe0SYLZu9XWShAa/heSdxyBqqPVwq6KW+OaIIyQE2xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/IlINaE8USdoFq0V+FmYmS2Ft8D4l1VUDDi9LMa210=;
 b=bbySTMCLKqe7og84eQDDQAoIAq0AsIZCX58eh7UIYsDEM5GrgeyxapCdqJw+gsojRyGLJRZgAKeTgjwDn9XJSezfJZqTuB7lDRyuZSb7DXDWVoIcbxgWTsLNqX/kRpdE6P/4lt8jD+g+NDW/ydhZ1CcvkRYhQbQloYA05wd51+BokSjWYC1r3lAe99Y4NAOVNj9gRD13BFk2oCLGA2sfQU9RoXaF4LARwSZQJR8OkekcZcxvQnw6kVekJ8blGqoIpHZkp8WVxTp8VAFB8kVZIg0grrseTf5iGYrgiCI+bsN/Cle8xHP+si7S4SkQ5Ovmusw0mO1AnpXxicjvjIDtaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 18:33:10 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 18:33:10 +0000
Message-ID: <8e432d84-d34e-4434-a25f-4eaf6c2edf32@intel.com>
Date: Wed, 26 Aug 2026 20:33:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ASoC: mediatek: mt8183: Drop redundant probe error
 messages
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
References: <20260821122928.41343-1-phucduc.bui@gmail.com>
 <20260821122928.41343-5-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260821122928.41343-5-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0036.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::49) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|PH0PR11MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aec772a-dca3-4dec-37a1-08df03a07b0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|6133799003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Ap3kKQqlZbLu0j4k05v1TkwYIKRjKK+HvvmVZLEx07bq2gXNYqzQ908Vy2DE2xLP1JQLBugHuIjKFKiYq6Y5tohQdggx7Yc4KFwSsMhIFurCEeX4dG+g52KlBm1LVX0WNPIDCuQy1Je2Rak9dAr1+6LPDiV7cPicn6E9AP8Iffl+CucHnh6PG29GAdg1MPLTHFyHLQQKH96UPsBqnq+/FXQE2+HbjuSqQEK8/WwhGDp445rYC91n6iiC99NUKUteNZFmGhhudAYv7VgwRCuL/AJZn0HjstgbN2cH7pyhIVcTCg/wJpV2ZoZdqCIoyhYRQ0hKFd1UiYQvE9vXv1wUcAypUZcQIRGdFpEtI8f+vdkRlDChYR1n9LorkKI86larNnnJsDwUClQjCiB+q4s97KcPLqtdx7NJ2N7Mqbb7wfw560ahvtU9L4CumQvgR58wy+SFLObdVk84wxUchRTg/Fr1bhtoy47N2qdGQVYHGwSeOfqmNmNZjb1bqy8wWdWPFol/1H9ynmiPPiegKZ+t1/H2poyILV6SM1tYD9A98D+GZ705tZd3uAf1GwrYSNNfl6qxJUHEHi3g3zhw8ObLCO1ip8eNIHhwoz2gwPRD+2uGwjDpR6wY7aP9456feeWugcH3D4QKzvHSGReSSxDb2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S21GU05PNEpBZ2xsaFlOTExYWTJwdFNBVVh0NnZyUXlXZEZCZWZuL21aODl3?=
 =?utf-8?B?bmVnQzRtZkVqWWNYWkVpMXRKMDR1T2lsNG5vQ1dnMmpUY25GcFVCeVhJTGJz?=
 =?utf-8?B?L1ZtcXFxQXltRjZlNWtaeHFCUWp3S3pqKzZnMDZHeE1WRUVnbERTRVNQSmRT?=
 =?utf-8?B?a0MzT1BRUDZ2VUZMeU1tbW1mSkxTY2ZpWmFtamV1QmJPeXc4KzZETTVhVmpX?=
 =?utf-8?B?ZU9KeW0rQzFiSnhPTU1vMElIVitib3Q4KzNRZFFqZHNKQXN3b1E1b3d1MVV2?=
 =?utf-8?B?SHJEdFU4cFJoREdtR2hYR1U2QWdHRUQ0bzRhdmdCeFRuK3dveHprcVhlK0Jl?=
 =?utf-8?B?TEtxQnBaUEFzRnF1QWxyUW1rTWhHeHhrS0I2clNzN2FVZTgxamZueTdLTDNZ?=
 =?utf-8?B?aFo4T2laSWVEZVNSU2Erd0FNV1hHZXgwOU45T2Ezb1RLVDJmZTlaR0NkMks3?=
 =?utf-8?B?OXFDQnNHOWx5NU50VU01UWc5MlhrRWdxWWtkVVdoZHErNWVJemV5SVdPRHFX?=
 =?utf-8?B?eXVOOXl0R2JMVFFtdngybE9HODl1TUprVEQ2WjhOWHF1cCtkbmM4b2NaWm81?=
 =?utf-8?B?QlUzOGp4dGQrelYrQnFqQUdRVGUrbW11bG0xS0hMNStVdTM5V2RNTWFZbzZw?=
 =?utf-8?B?WVFDQzVuNHJQMGxNbzVuTEc2cndNNU9wNnQwWXp1M0pOeWVoc1E3U0VPTGw3?=
 =?utf-8?B?cHRoQnhiWC94Tjk5bmJyOGk2SElQbzdrSHNnTXo0WDN4ekxQSkhLbjJqZEd5?=
 =?utf-8?B?MDBBdE9KbHdRZXdzdlcwdFJYUHFkVDdLQzQwd3VnM3NEZjhhbWxRYm1tdnZ4?=
 =?utf-8?B?SWlQUDk3cHJINnpFWVcwTVY1QzJmUFRJT2JaOXduVDd5cU51QW0zQmM4dG05?=
 =?utf-8?B?b0tZbHZ0aGs5M21RZm42YVhUSU43bncwd0x1dlVqbzlvSnlHaDI4VC9vek5L?=
 =?utf-8?B?a3lRM3FwaklrNmVNVkE1T1lLejZzVktOYzZZSmdOOEVSYm1XY21HMTFoN1d3?=
 =?utf-8?B?Umk3Q3pOblh1enpQa2lOVEhHT3lwL1ROTmpBTURUYnd6YkJMNG04aXkyMDdZ?=
 =?utf-8?B?c0FLWFhSMDIxUGhyOHg2aGI1cWJ2c2dvTjMzTklQZHpwaTR2TGtyUUllWlpp?=
 =?utf-8?B?SFZ4Q2FxMVJYUE1rMUJIWmt4UGh6eEltT1JPMnZucUtWUGlnOG1zRWZVYjgv?=
 =?utf-8?B?a2M4UGN4S2VUQTNPM3MxT2V0Y2pCZEljd2FPTkhGZ0Q2eldIZU1ZYVlFaldO?=
 =?utf-8?B?SXJwTlBnY2RXYStHWlV5UnRlSVpwRjdPeUdGaW9ORDIxWUllVitQNEpEMlIz?=
 =?utf-8?B?anhjbmplMDhBdXRQYnFIRS92ZlVBTEN5UUV4NkdwRUR3VkV2c201U0dkZE5w?=
 =?utf-8?B?TVJ0dExPaUdxMEIzQkZFZTFZTFRCK1ZJdUMwaXlCVE9aakRMNE5VOWRBU1Jx?=
 =?utf-8?B?S0VyTC9nNUx4dmFsMkN6UDZhV0hERnVpdUhGamJ5M3FGQlFFVXFxYVJJdFAv?=
 =?utf-8?B?L0xVTHpRVVNWbkZ1Y0ZWZXY4ZFlpRnFjZSs2d210bDE1QjNWZkNpOHlPeXM4?=
 =?utf-8?B?YmtFWHpkK1doTTAzZ2FLL0lobnl0QmZ2SzNpaHNueWdLVXRzdlhEa3hyaEJO?=
 =?utf-8?B?cW96WkJlNHY0eXR3SzlNN2RhV3c3NmdIbjBEa0owSHpSMkxrV3BVa2IrZU5l?=
 =?utf-8?B?NERwT0dnUVJ0Zi9WM3FOODE1S3MrRlI3c1cwbmxYRENXQkh6eUJJUHpJNU5G?=
 =?utf-8?B?cTcxUlF2VmtvcWhiUDhScXRteVFSVXFzYVFHdUI2bjBMemFyQy95SHpIa0F6?=
 =?utf-8?B?QmJsRy85Z3lnS0FpbmMwN2RQcXBGVzlOa1JPNnJFR1dXUXVDL0dHdGE0Q05R?=
 =?utf-8?B?aTNZMzF0UUQ2RXN2UVNPdHRVamVQcDJwd21jamNYMy9jRGo4ZDYxWmFmdUtP?=
 =?utf-8?B?QnMvcWZsaTJhQkFhV1B5bGMzQ2l2VDI5dmVSdUtsSm1GWFNLc2hzcFVPbFRw?=
 =?utf-8?B?UlBucmZVcUhURFZaMW9hdFAvaThxREdtWThqSVVCUWZwN2NqaThISGhMc3NE?=
 =?utf-8?B?UTg3M1ZlYWpXbG5YbmVkejRRck02ZjlDeHdETWlYRnVOZEI2dDJlaTFadEFP?=
 =?utf-8?B?SVBKeVdSR0pwVlorVnROOTBVeVdUdFlHLy9oY29FRDV5WFJ1YjZIOElId09K?=
 =?utf-8?B?ZFhjZjhJWEcxdVM4WDFPZmpTVHE1Y1lIUUlKcXpGME9hNDZvOUZDYU9rdGR0?=
 =?utf-8?B?UjZOTXVQUTRWQXlQYlQ3MHFwOVF4d2NmY1puK0xWQzZQenFYZ0x3ZFZVNU1i?=
 =?utf-8?B?V2Nva1dvc1YwNGh0aWhhTnUxUHd6c3JsWERsNWhnQUcza3g2MExMdz09?=
X-Exchange-RoutingPolicyChecked: MbW93w1Tc9Jud261PCxGJFimdlR3BkMY3qB5+Qvea5UgPBMfLGQOqjp4T2IWsiewBpSc+Lvo+SNeTxtkFfWu13ieoYEfn821C4CuiH6iIheCl9gTwT11ax34oJY/5fjwxi5/v6L8Cn/hM5jMibCdPTgMtp40byQoFDGdUUjUAt2nTq9aM4ASA6QPljHPTL0Ru74Q1ArSo4koTdw2qs/JPuK8GCUxV++e/lBvKX3wx7GqPEL6HE9l22h6VmGOJF8koewJBQu9ROlYhRu7n3VlPBl5LOpl9B/BLIBnYbK5FXOJvgTtGc0vo6vtc3sixEeyMirl1zeZnQx5YQJF0hyNAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aec772a-dca3-4dec-37a1-08df03a07b0d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 18:33:10.4867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +If2GbO6tHWf/0OP4LZdN+oa4lp8CDnh0uB5qb9aDh7e8lElFu4mjHi5x1J+aeDcpTdMCMcVD2Es++Z7VlPs6wDr7CDC+kC8Dg65ufv6keA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
X-OriginatorOrg: intel.com

On 8/21/2026 2:29 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The errors handled here are already reported by the called functions,
> either directly or deeper in the call chain. Therefore, the additional
> dev_err() calls are redundant and can be removed.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
