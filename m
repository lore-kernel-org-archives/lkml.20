Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793968387;
	b=uY0DD1LkfXlCsDNfKuZgHh8Fun3ROYw/KFVVj2pEsuRqKzNFAtmUwo0d70UeRHmPd+EC
	 /Ua/HMVMeyrqVtK+T9W82oyb1nK3V7rurp7Jugmu5+GfHBhmgaI02yD8GDLYAUWmE02hI
	 S6fjwNZKg4PJp+nboL30/Qg53/KcV91TQKSiuU69jYLrfrXEV0LvkMlFari9/84VGVv6v
	 tLRaCEu0dF8P2Z1ZcC1jq220PkgAvecwHIqlLY8hesdCyhZz24tNLbZd0T7UkZNSxR/P/
	 8TrKRkS/JffGje0OXwRn9gX+bdFWjR1dkaBIHETH9lx+6AK+x0eVPzygqQJWH1czt7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968387;
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
	bh=0dD1NZX6gHfOJNRuscxcwv7XEyXCvPGbSqReadSpdWo=;
	b=zMLjAbsN3t4uLCc4FTJGJn/1oGiUQRyD9YblAhiGD0rpb1uyqRppvjgnZMjIyfF0d7dr
	 q0hUNeJQ7DqSEqwdlzZm09sIbIXFvS6qK5K8XB/n9j8G5tRm5vVWWkHlbnsHME0uCaTng
	 o0WjNGY5Iqoo3qs0xDtSa7LNOQjaw53o9kwPndk9XPy81L+H9/ieNWEY0Rb7OoaNaNYfB
	 JLuBlhLwlqRrzB1Nfwxhp8Xu1tGFA6OPW9sBM5BJtor3wqTCom4WxWJ0yKBZPkijP5g7/
	 HtEmTNY/3ETHHqJOyrwMw2Y9VYletb6vcQ+IyIOZPmRbGxu04O6cfq3wiIg4khVHRRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AR1i1zDa;
	arc=fail smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B2C606A326;
	Fri,  6 Nov 2026 12:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B2C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AR1i1zDa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793968386; x=1825504386;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gaJ3M2fRoX8MCpGkzzpRfoIYzllFL9TiWn3VbCTIQgk=;
  b=AR1i1zDapnJrQLmhGsrIaERzefzw+l33advAeMWabR4Q4JTlfLK5t2CZ
   RwEAv+wl+gsXkdk4FtbNd/vl3PZGZojaiOuxV1BPJz20MJTvErKAX0MPu
   9QkRtrTiWUpV5wj/1SYkE1uzt4H409aNqiD+1g2cAfGbTG+e6VV/dlUiw
   NYSDJiDjqFAB0DsETyz9BdEeDmmZ1EUYi5wbnWY/9H/d4/8MZFPcRgAAn
   bnaXG+miULASaNxgqCMNpXgBVhhkbFKYuGl04tG2eUlNSQO+G9R2As2F2
   3xyIjbb+sKhQWpaJwrAeOINQTKvTq3l00AaemPMRxXqOdGpwYktpsVnkg
   g==;
X-CSE-ConnectionGUID: bZLjkkxRTsebSZDmJJpaRg==
X-CSE-MsgGUID: WpgFmPK4SHe5q7caz412og==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2801799"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2801799"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 04:33:06 -0800
X-CSE-ConnectionGUID: YLGrolg6T3OoXcc2PbesvQ==
X-CSE-MsgGUID: za1gsm9hSoGCBqK59QwLaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7431870"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 04:33:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 04:33:05 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 04:33:05 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 04:33:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIaYUklwlQxMZeFgHaADo/Bw3Rhdb0RdbDfjYCpo2ReC6E7RoEVPRbgd/1YV37uFm+T6nE4ug8y4YjmMTAvC2lu17b63O91iAiTMiL2jjZYZQLMTXNvWVDyQ/5GjZmsrM371G9dvbhC9Ak89DXhm0P73pOmoFOP8igoMPcvLEwpxEc3GeplG4GxpO+EY/Nh4DNcmh0Cy9xRVUAKX3M1pEbT/eJC+WTKqffCG6dtWY54Rd98Ow3NrSsw4fQ0Qhp/3jypDolrWzxw+Qgy/+8C0s3ioBHRPk/tpt3WrB/JSVmIbhhuMbU+/vT8aBjuqPsNDNp/reCvZq3luWHnw8qWE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dD1NZX6gHfOJNRuscxcwv7XEyXCvPGbSqReadSpdWo=;
 b=a1h0xHM6A1xomCo7lBUwyit4/kSQPruidFpJGESNZW38LLSY1DNRd8/c15WMg4nCiL4cZL80rP0V+V82RxmyINorxPDfL022iJWS9DZejekcEOgt8sxz/XQ2EriQhfNyOJIZOiQhcXWGQ20UX4mBS0fIYQwSdUh2kW2909oXQ6tqMgKddRPRQlWswVy5oXG4XqOfOvea61Xv98IOj0Fm8XqzjK3mLrqDr7XaqDnwwdGpvjuUkmDs0A9yY+bwKU0kaPnIAAjVodG3gC/lrLJ49yp85rQCcMx3Uk2aCGQOXZpzfb6gboXPIbjI+5UL2YB2VwUnovQebEWFShGb541i8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by IA3PPF235E846DC.namprd11.prod.outlook.com (2603:10b6:20f:fc04::c5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Fri, 6 Nov
 2026 12:33:03 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 12:33:03 +0000
Message-ID: <6abb40ed-fb19-40c3-92aa-0769e778d4b1@intel.com>
Date: Fri, 6 Nov 2026 13:32:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] soundwire: intel: Allow for dynamic assignment of
 PDIs
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-kernel@vger.kernel.org>,
	<pierre-louis.bossart@linux.dev>, <yung-chuan.liao@linux.intel.com>,
	<vkoul@kernel.org>
References: <20261106121557.2338556-1-cezary.rojewski@intel.com>
 <20261106121557.2338556-3-cezary.rojewski@intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20261106121557.2338556-3-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000514.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::668) To SA2PR11MB4954.namprd11.prod.outlook.com
 (2603:10b6:806:11b::17)
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_|IA3PPF235E846DC:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d392f3-4b7b-4dad-7345-08df3c021932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|22082099003|18002099003|261102123227099003|56012099006|261021121427099003|261022075727099003|11063799006|4143699003|261026140227099003|261028144727099003|261022105027099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: Lj+i7aTDjqlO0z2Cx4V+9abuKNmNCo0rnK107AKH8T8v0Fyvon5/812AD08udvTh8x4CHQCfkL9h3HjVSu2ENZUami4MoDdZefXXE5OPXplMKpR/KOQdhZyqBBgNuCox36dEkDQK07s4KRJ+BjKcw/NDtzDvRwsDwceDnqrbUivXuHjIpZXQtbrC2iiQGVPlJjJHI1OVnwJo9OztVYE7PPgTbFOMZo+e0ITPbZifdUOluw2Ev7K+a9G55WjuvrRrIJ23m9Bemf4v71xewhbFpdcWvkryqyi2qnOcLrA5391kIw/Tx/3rx/tI2fhhFBoTqcdIiQT1yZ+yGtp6zRYVGCedKDOjzhenMbyY552zC9sp8XoEKT/u9jRxEy3HI166sTsQumqsIpqCOjkUQva909JTbqEXU1rCr9NmQ2OTYkmNNQXRoNHW2Y9rLLTPmoum99yelA/D1+YWE8GaxwxFrPWGpROphBzs0T6foHRzxqzZi2MpjN9NkMtR/RifrNMrp4AVMrl3r59BaQuF4B1C6dSi+rxfqQz22cApmoNpj3QZhTT9PxUZJL1jz4bUVZ5QeXxYF69ALrVst8EcS75uF102G0DOGraAidi00DporVhBA/o9NclsKSuw7Qp49DAbnHHDMuPs/6EBHxl+ffJ4HKCH5qgRp0cciIsLOA28WQg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(261102123227099003)(56012099006)(261021121427099003)(261022075727099003)(11063799006)(4143699003)(261026140227099003)(261028144727099003)(261022105027099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkl2NnNRbk1SYkNlZ3lOSThqUUM4RnFFc1NJTXprVjhyMXI0ZVNaSVh6MTZl?=
 =?utf-8?B?b0I0dm8wK3RRQVdQUDVzOGYwTldiS1dGVFFLT2pXZldMN1dhekFHb1M4MUtX?=
 =?utf-8?B?Y3FTWWRGSG5OdzcvWWVNK29vZVU0OWNBMDduYnI2a1VlYm5SS2xuWkNLcGVL?=
 =?utf-8?B?ZEg5QzI3cjI0WGo4RE1sL1NOV2pIdXVyWHV3aFc0cUNkLzFLSlMxNU9BVVhr?=
 =?utf-8?B?ZVlQK1pORnVkd2NqaHNyZEVqdXduSDJSdHlqcVIzQ0pnM21qZ2ZxMXNrRUhL?=
 =?utf-8?B?L1h0cEJBV0tjVXMzZ0VKdHpOQmpqNXZKWTZUQWcxOEZyR1FDcTlVTVhQdmhJ?=
 =?utf-8?B?YkFLWnV4aHN2c3F5d0J2c0NzY1ZCb2FONGpCL25Va2ZmYUFWUnFLcytWK1VG?=
 =?utf-8?B?SVhIbkhkSDNaSDlVN3hpTEh4cEhlVEZSbTZCK3Y0VENwL3N3eXgzVndhYk4y?=
 =?utf-8?B?RTBCMVp3Q1B5NDYrZkpURTlxQ2diM0tGejl2cHIwQTgxcmZwTkVWZFRpd3Rv?=
 =?utf-8?B?LzRWN0k0akR1bjFKVkVrTjRZWHpqcnNUNk1mZHA0U2xSeHlFdFJIdnNYcUxN?=
 =?utf-8?B?YnQ4Q01TejAwUDBiQ0trdlNWT21Dbll4WEtMWExSbWdxbm02UFpwVW9mTTBJ?=
 =?utf-8?B?OTR5c256MjlsWjJacVFCR0ZMMGk3MnFsZUlEQkdPWUIvUWd4dUpZQ0JXNVgx?=
 =?utf-8?B?alFuZE9lNk04Y2gyY21yeml0a3lJRzlyZFhDSjBRVWxWUEtGcnJ1RnJ5RTRL?=
 =?utf-8?B?ZFlVWmpYZmhMRUxBSkpNQk5YVjVYdnBLMkdzRUtGUmNWcW5jajl3WkZON1Jo?=
 =?utf-8?B?aXlnN1EvbE1nVHgwNVZRZ0Fsc3RWR01xY1ZsNk5pK0dCdURHUXU3M3YzeGhh?=
 =?utf-8?B?OWZ4TnlqTWV5UU5BeTByeW1uUnFnbTVYOFFnYktzUnJoSDBPSDJ4WmNpc21n?=
 =?utf-8?B?a2hIZTZzNFFvbkVUWjBVdG5mbWRaeFdEOVYzbTVSWSttQk5YTXF2Y3ZPcitt?=
 =?utf-8?B?OHQ3ZHgvK2lkaXVjdnJxNC83d2ZJMTcrZGhLeWx5MUJzZ0c4WlpOT2VxVmdi?=
 =?utf-8?B?U1BjSng5eHVPdWpwZGt0Wk5rQUd1WkV0TlNuL3l5bkhVamw5WmU2VzNYS2Nv?=
 =?utf-8?B?RXplRFJjSkwxQlp6SGZyVExGNzhnVk8yRWh2RWxEOG1nY0dXN2R1VllkR3l6?=
 =?utf-8?B?TitDalpseHB3a1ZkU3RoNHo2Uzk4Z0FqSFdYTll5ZnZYNnFJMUwycG1sZmxQ?=
 =?utf-8?B?OFc4VmJTZkdKd0JRNThUTmgvWlBEby9zT1Y5YmFLMzlDd0hnWGxGZXpTU1hU?=
 =?utf-8?B?N0N4OFhmZnc2ZDVibDdEcEkxUGV0UWs2VHZLbVJNMFJpL2h5elFUOHlHL0ow?=
 =?utf-8?B?L3B3Vm0wL3VUT3lKQW04b1JUOTFlaUxYRUF2S0wvOThlTm0vL1paMnIwVmli?=
 =?utf-8?B?c3cwRzZvOTF3ekVGckoyMzBHZmJIVlA4TlN6RXlwcTc1MTNhc0xhWW9TcDNm?=
 =?utf-8?B?Q1JZYnFXempPL3JjNnFrNGh5YkU3Y1VvbTE5QzRVZEpZcmdxMzAyUEFxdDRn?=
 =?utf-8?B?M3UraEQ1dHdqblF5cHc2akM0ZFNYci9jeHFpMkY5U2tMWU1wdFdScTRFZ3Zy?=
 =?utf-8?B?MFI5VUdWdFViL3FBNVJMMTFFOVJnbVJnTm1mMzYrbXlWdjBuaUlmMXhmYk9m?=
 =?utf-8?B?dU9uMWpyRTZLWTBCL09lcmtzU1VIbWoyT2lUVk9hUVZMeCtoQ0IxUVpsckha?=
 =?utf-8?B?cWFmYklWc2NVcG1UNURabHg3VHZCYVR5TlQ1LzRDNFEva09wcXBlZ2lpS1Iw?=
 =?utf-8?B?STlpKzBmWHRQWWFTeEd0VTQ2TU1tMVZoSlRZb3JleTRwSHlPYW1WQXJybGhw?=
 =?utf-8?B?RVkyV1p4YWlka3NMME1ZNkdZT3BidzJFMTlPQWhTc2U4SXRVL2Uwa2dSV2tZ?=
 =?utf-8?B?bTVZTWFzbDNOY1FsT3FaMmx3VjZJcFdPNzEwZ1pzdHo5THNOaE5JdUFwbUNm?=
 =?utf-8?B?c2RmYTdyYzFYVjN5dDd5Mk1SeGJ3ZHZkOGgzWG1VVmlKTzNaYU5nY3g1QlpZ?=
 =?utf-8?B?Wjh5UzU0WWVrWUlmL25iWFNOV2tCd3NCb0paM2JmVUtqcHk4d2FOaWRlRnRr?=
 =?utf-8?B?ZENTUXI2K29lWkJaVjZJQVdEcUZZTWhPVEc5UWgzUnhYRWtKQ2txNFI3Z2lH?=
 =?utf-8?B?TmhmMmYrREgrOTFiOUdlMFkrcjZPbnFWam4yK2NtTUxqSGVDeHl5ZFB2OGVq?=
 =?utf-8?B?MFc4dkZJdFpTbTl5cjB1RGJPSERPUFNBR0hsRDJSVTZIZUtVOGErNlMyTlFH?=
 =?utf-8?B?VHhjNTcvNXErVVQ5Skdxam15YVlQazBJRG1mWHJEdE5WdWxIamN6UHp2dnlM?=
 =?utf-8?Q?l8smExIkN0fDkLRs=3D?=
X-Exchange-RoutingPolicyChecked: U3ovHMn983NYO68HODNRHyCcCqY5txSvb4mJsFmU4kr+29/4+ZZgMhdDiEkJih+N2Kh4ZqcxLG3Hiywea3t9oQU+bv6poOdlXi9AFT+mPXatzmwOXe/WGnm6hRnfkcltwnrqK+BAH7ljmChF3+fWtA2LuaVB1gk9F6DQRI8RyoKpXPGVSK1W6HR9VBv0GN2J4OQHs0SoLzjLh3tqxxsD1tJyj2pJBaJQMuFGhRg68j2Qc6FVR4Q48BizqvcczVdL95C+R3GcOStG+hsoLejs9QZ5vA9kAsnqbSCTBnkcqWngrzXRbRwwwO3dGJ5zxw8GqxRp3CNiGYlCS5yoMV4B0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d392f3-4b7b-4dad-7345-08df3c021932
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4954.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 12:33:03.6910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/7vsMAcJcxGZgdAhs7C1AfHLxo45ddMKt6xvsbLhTwjYO/FvCS4LmNVxO7tAPp6VHo1vGWAMFuhih85NT6HTX/dmN4R5JoaaKE+ZrzLzYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPF235E846DC
X-OriginatorOrg: intel.com

On 11/6/2026 1:15 PM, Cezary Rojewski wrote:
> Currently, PDIs are assigned upfront based on the DAI IDs. Some drivers
> do not assign anything upfront and request a free PDI when streaming is
> about to start.
> 
> Provide assign/release() functions to allow them to be assigned
> dynamically. This also streamlines the process of assigning/releasing
> PDIs with what is done in HDAudio library (sound/hda) for HDAudio
> streams, see snd_hdac_stream_assign/release().
> 
> As resource availability-check is typically done during dai->startup()
> whilst hardware/firmware configuration occurs on dai->hw_params(), add
> sdw_intel_pdi_config() to maintain this logical split - assign on
> start(), configure on hw_params(). Existing code does all of that in
> intel_hw_params() so the logical split is not possible.
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Scratch that, will send v4 soon. While rebasing messed up this commit.
