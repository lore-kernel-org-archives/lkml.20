Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8C935AC33;
	Mon, 12 Oct 2026 14:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817129; cv=fail; b=h/q491X0pfyapBxjzGEDmGsCx4DCJYbZrdp4bDM6lTrngOBzlIKPJw/9uUU/kRpGRLxEL7LYdHzy1pdwjQE/OEh9gLNILrNf02AzWlBJuNvuT2arUHxEok/XrjVps3PqzZS6cJwWp7quu4b9e9JcQfM9gE2gs5iqaDCbUVeTwnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817129; c=relaxed/simple;
	bh=F614vedY90sIWOno+XoHhqGyhtnmpNxdhKnOubVqweY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nz71Xgt/tT1jkeRA5xZk8D3O7OzSnJRvwJXyHRe3qDA49i502w5OlAxFbL9X8s8C23thpUurDuNioo+HSSe68qT8RajJfeYRLmPSNGLYY49UtQWsWIAhWPO3pNvY9lHH90lIq6S0iNXdGZLOaIyV6e8RqgqUkQkKw4dhm0BHXxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nvpHjRQ6; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvpHjRQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791817127; x=1823353127;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=F614vedY90sIWOno+XoHhqGyhtnmpNxdhKnOubVqweY=;
  b=nvpHjRQ6gQudvHL3WNWaho2s3O110i7JJilJa88KZIsHbCpyGB2Ubztp
   xAnDCsQSM76tVNY4ywqBqu5oMc18p6CUPpvJI0leu7lB8db8YZnIZFIEM
   Htl5DHoq4R9dDFaLu+sd6bcGYJWm10NmbwqGm1i6WJwwuHp7kMp4o3e22
   9UHnRlJEpmy0cXrzlhmIG5FDWJhhTY0gMivcxFicx795df9AUs/OOP5Hr
   glsiYQOUasEkrmeTtq70sObEGhsV+mfGJZxugN25ZfavXTeokFtc0884p
   ezSx2Y5NYSfjDVe00zy++FPFjfPtuzx0FHk6ODlRNSv3kU76grdzLlvbl
   w==;
X-CSE-ConnectionGUID: BwmmwFc2S9ifitD8EJL3dw==
X-CSE-MsgGUID: q8Yb721sSjKhTXWA70j+gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="417676"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="417676"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 07:58:36 -0700
X-CSE-ConnectionGUID: Y/IHP/FgT6+hwvHQbiujVg==
X-CSE-MsgGUID: XWPQqe8vSz6aNRBwcRR+wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="830868"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 07:58:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 07:58:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 07:58:35 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 07:58:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCU76Z8nzDl9GjAOmFPu6ZuCRw6sfLnB8geUEwfXDVOIHpc3q9njXFQzTPdXTUtYxc5tH/PGG+2i4u7REmZYzhY2OmxzCkijfkfLjvSXqiFJz3e+v25zFIGi/KYx2BbvX73Z0mqNaNEotOAHvShRU2DmHG1fhyGu9nuOXakMO8Up3Cw0adbrX50WYnJqw99obrzJJKGY/Gyzj/HVldfOQj9PexSmdgVEcdTyEiWDMQnnkuz7AQYw3S73/gJvUjnUZLR/jND26h747su2URBbEWZMhhhIGgyC0gBD/lqoO3fqYtqt6yp+DKScEPZ1pL+t81YkmBcnFGKPOy7trJpwyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Js8Yg6L68KO1k1j7sljpGyC9iai0qC532dOGWvkUNAs=;
 b=Ql6D5b11aKVxmbhYJcriLMr1g9FpggF9mf7Du6VEOt73hXjawVK4PhhkiLH9u7DgxaNSUMe8EbrE3YOFaJDeXiAy6jOgZ+jgHecMR/u3bWU7mnToOclkvncu+qz0ZzRnHMhSylGHVEIB0dHEQObaDDhTH00co+Ue/Pi85mp9DvgP5n8RJZSO/XG+6h+WBqtSfqwxKb5XSN1x8q9quVk28OYhQ43NlVRFejafmO8XH+2++xMmrIkC5fUb1zb63e0fS+i+ZlotFCMEj4iTbOLHWQNe5gSQiBZ6HnetO7YeW6Xq0mvi4UmmuegdkKvX7/HoxfCrsQiCvt1/DG0jYtciaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by SA1PR11MB8352.namprd11.prod.outlook.com (2603:10b6:806:377::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Mon, 12 Oct
 2026 14:58:28 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 14:58:28 +0000
Message-ID: <c49edd0f-030c-4ac1-a0df-34d100337a53@intel.com>
Date: Mon, 12 Oct 2026 16:58:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: avs: Reset the stream unless it is already
 prepared
To: Sergey Tiraspolsky <stiraspo@gmail.com>
CC: Liam Girdwood <liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261010103753.16969-1-stiraspo@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20261010103753.16969-1-stiraspo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000525.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::679) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|SA1PR11MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 84344620-734f-474e-3646-08df28714614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|10067099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: NCAze1GIgkU5hN6ZbOcb6HWKfqY7l/CdU+dMIhJemsZz0+nX5oELmq4vDCXHIFtjreJeA/af4YH+jjkN+FpFYt12+bW4BEzsk7g86PW3hEcrrmzVzbV9XuAa8Ml4dE0u5Y8odar1BrVMp5YRgXuIl7ktJXEs8hU064qSNpnQbPYNRyoQbjZWpDwOMoD3bzNFR1a/PBavAPTbFSpPnx3DFjaAnRpqis0Kifj+HxqbpzVJzyP1VZf64w5QRhmxjp97oeQjc0z9YtQd5okYPk6WKkUcsE07jZLpuZCqt/SzSRKzprl759ibO6en793FHDS+X9auCz6cl73M8mnjp9DLTWIq5ESZht0T3xLpI3j8n2t79E8KCG5u1/JUmhWK1CJS9+6ogPSojgMJ8x7kX56Y31Q5GePhbISR66XKaI38gWnFX8xixogfem/pE4bC7n2J1JfMmEcSQzKOlU/icUQJ1SqmcUOdjdmi3/w8Horsyi6Iq7bxbzx/U6HSdrbRKlyUwAPs/bjHr2vaK269EhyqE5gfvPpZoVw8T+lTj69TpCarNrpgmLsngz97PdpXJKSlIHosH1/aHIF/5+KK68Hrdc5qTbW+8NRZDvsMlC8Z7RUSegnp77jk123xdzfAiahHkRirEJZzXFvFGV5zmH7BmkvXXtls3/AJHpxB/iGlYbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWIrbVlPUEhqaFAvNU94T0p3MTl3MXc5eFpRVC82VFNFS1Z6enRmYi9pR0lx?=
 =?utf-8?B?SGhmZCtucDViMnZuZVJIY3VlV3p5UUplZStUVEhEY0ZBK0xoYU9uby9FVzFD?=
 =?utf-8?B?U1BiRlV0SjBHSUJFNEVzbktkSWZrd1F3ekN1TWRvTUMyM05PZkQzblNKZS8x?=
 =?utf-8?B?OTMvV2F6cnIzWDhvL1M4emF4eThqK0RVcG9zU0VzSnBiNXoxTDRGSHJSR2dN?=
 =?utf-8?B?dDRiakZjWXZHd21yN0hZRTV3ckVzZTgrYWx4Qk5NdFY5YjdIWjVyWVZBUUc1?=
 =?utf-8?B?ejhBejZyY1hGTXZleEFaZlVJK2hrQ2lYcm5pV1NzdkRsT1g3cnAySHdnREZQ?=
 =?utf-8?B?SmdSNGs1OTNMS05wWklMTmR5dUhjVmRRYi9LNW5ROGRJcDlxUWgxUkZPdzJL?=
 =?utf-8?B?VDNnS0tFdmRWOFc5MGJxbEpITWZFYnZHMDE1bE1Hb3N4Wm5qSURGbVczRHVj?=
 =?utf-8?B?RG1JbjlxWDBHYzlwaTg0UjVDY0ZiQmVwZTlpU3AyaW1TTFpHWVRub3pBU0dP?=
 =?utf-8?B?MXZ0bHA0b1YrOFpuUmdsbURDR0N1bEt4YTNIM0pYQ2VPTHY3TVRDNXNPZ04w?=
 =?utf-8?B?K2pkOXNtU1JTSGxLOUpGS1VyR2V3Q1Q4c2QvSFBhcWVIUEZvMGZ1YTlCTVVp?=
 =?utf-8?B?blRZTVJjNVBBV3dJM0tzUEZTaDJIRHdMemNsUy9IeW9LU3IwQVdJSFFNY1hq?=
 =?utf-8?B?R3k1bVdWRXJRd1hxUm9WN1VjU2hEUzg1Z0UyUHhEUnRkRmV5bGFlMTNlRGZa?=
 =?utf-8?B?all5ek1QdTZtUDVEaG9UbkpXdkxHcFQ3RnpWWVViN1J5ODFnVHZ2aWpvL08z?=
 =?utf-8?B?VFF4SHpFMTM4bUl4SGdlenVhQVh5alpEOUhiVmVhNkRNMjkvMmhXMG1MNnJt?=
 =?utf-8?B?Z3g5ektzQzRQaCsyREwxS3ZmdUYydTBwQ1MxeUhOWHZBNCtzZmdXbnJaR1RY?=
 =?utf-8?B?ZjdhVE9JOHhRRmF4dW9KYmc2TmFuSkhuTGxhZUdXbi9EZ2U0b1U0TjczVWVv?=
 =?utf-8?B?bnFETTNvL0V5VEJ3ZTlSdUhBOUFTZ3MzU1pEZnlHS0hTNzZSVkpaYjlHM3Vq?=
 =?utf-8?B?bXlRU1pBYkJkMVpjLzlxc3hqVzg5aGNpS3NQUVdhL1NIR0pXYi9sOTg4cGVF?=
 =?utf-8?B?NmpkQ1VKdWVJeDUyUktQbUFMelBQMDFUY3JUTU9JMlJmUEJFY3JzRStjcTlV?=
 =?utf-8?B?QWdscUNST0NBVyt4VnFsOEFtTWQxcTBBWU9iTmhGcjBWOGJFamJMd1ZHdnVU?=
 =?utf-8?B?dWJqVlhKM3h6S2FMbDU0bURkSjk4VTJBaUpwd3M2U05JM2hxMWlQOHNNWjhj?=
 =?utf-8?B?SGJ4TTVheWNLSzJjREhoeklQZ2NQOGtQclAvUER1Q0o1OE1KRm9wbXNjMU5I?=
 =?utf-8?B?SWhBMWZVVElHamUvSjlZOHcvQ2pVV3B2V2RZandtV3YzL0dYUU80MDQrTVFB?=
 =?utf-8?B?eWhaNkZVUHZuZ3k1TURHOTRHSThnOWI1bU5NTnc5MURnOHNSTWwxTFhncytM?=
 =?utf-8?B?dXFuYWloSzAzdlhtQmRnL2czSWtvRGtUSjd4V0haek1FRXJCNTB0MFEvS0dD?=
 =?utf-8?B?Y3RyUWFOdTVuZXRkSjViK1g2NVdsaFJsS0VwTkI5UlJaSW9BZE0vckhxMW1r?=
 =?utf-8?B?d3NVUXhXcUF4VlgwaEVXV0djZm5QUWw4RTZFaUVUcmN0aUp1K0svWEo0UTRl?=
 =?utf-8?B?SlliaDl1K2tKNE53QmNrTUVoQUpUaFp6RmVWZndaQzlZL09MQm1IZW15K3hB?=
 =?utf-8?B?ZEsrNHdOdWdTaXBUVFIvSURMZHR1bTBCYUhkUUlkTXl0ZTZpOWZzK1F3RWVn?=
 =?utf-8?B?ejhXZVBBWDdpeDA3T3JhRFNXWDhRWUl3Vi8zRUZaTjVzWkpTaW9jL2Rhd3hD?=
 =?utf-8?B?U01zNll0TUtqOFQwYWp4NUEzT0gxZVNFbGlqeVVsUHNkaGVoZTV0dEduMGo4?=
 =?utf-8?B?WDVLTkdwTFF1aDlIU29zTWpwaGZaU3hVS0VZTzJXSkhha3pwZjBoN1pjMllt?=
 =?utf-8?B?blBRTXBITklYZW9Udlc3TEVzZUlCMnVoS0QyeVBLM3NWd2RLZzJiZEEyNlZz?=
 =?utf-8?B?bkZLcGsxVnRXdGRSMUQ2d1g0S0ZDZlRzRVVITWUvWlVsN01SV2hZM2FWRk1q?=
 =?utf-8?B?cUdaYWJNRG56N01aV1dqS09TS09xRWh3RkVHQk00TWsyWVE1OWxuRjgrdUFF?=
 =?utf-8?B?YzdPdlMwQ0NaTWk5Q0x6ZlhnQjlCSjhYVDhiMjM5aXlJbHk3S2NkUEhHc2Nj?=
 =?utf-8?B?WGhuajhXOVBOR0RVVEN3MjRjZElYSmdPbm9pWVVFVXMzSmNRMjlVbytmTkw3?=
 =?utf-8?B?YW1RcTZ2b2JaM2M3aDB0UEc5bGJKZ0xEM0hCRG1QZGdJOUtrRUpIdz09?=
X-Exchange-RoutingPolicyChecked: g1L5WyB+Z/A0omF3mtAxPA3QpwHTQE8JbfARlJGu+z6HWutrGby5mf00tdesJgdMKDDiFSbz3P4MkqMaW+AZYCtmGNA1BFeCcsk5R7lbcZ5/2UM/yokGT4PIysgsrfMw2O4vJJeT8Muze8JhBs81iJ51oFjYuIOWwhxk8PIxNLz6hUvm2V9ZfLdU6bDDt6H3kKWD54MFiqhVyc8IeLG5DSo4K6MwaQLKLRQL4zhFcT7DjaQWTp1+MfcayjNakX7lqad6g2n7OvX5wfzd/oERtORqQh7PvrvoMUWkh4u4YWC6dFp8Z13HCRs9F6CjQUmHmx/fVKsJNqLEBdz3LgQOOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 84344620-734f-474e-3646-08df28714614
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 14:58:28.4443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svEhslWV6v2kt/EMsLOee3oB6F8/IGMnLFo9/dojGsjJBW4Yqok7nz8Lk/mi5lfgp1nZn5M6T8bxtu63QdOLdsV28KPh6Yjm4XwWcVsljRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8352
X-OriginatorOrg: intel.com

On 10/10/2026 12:37 PM, Sergey Tiraspolsky wrote:
> Commit cfca1637bc2b ("ASoC: Intel: avs: Unprepare a stream when XRUN
> occurs") resets the HDA stream when ->prepare() is called in the XRUN
> state. User space does not always recover that way. PipeWire's ALSA
> backend recovers from an underrun with snd_pcm_drop(), snd_pcm_prepare()
> and a new start, so ->prepare() runs in the SETUP state,
> hdac_stream->prepared is still set and the reset is skipped. Every
> recovery attempt then fails the same way:
> 
>   spa.alsa: hw:avsmax98927,1p: snd_pcm_avail after recover: Broken pipe
> 
> On a Google Pixelbook (Kaby Lake, max98927 speakers) this happens after
> an occasional underrun during normal playback and silences the speakers
> for one to four minutes, until the PCM is closed. It can be provoked by
> stopping PipeWire with SIGSTOP for 0.5 s during playback: in one run
> that single underrun led to 1297 failed recoveries over two minutes,
> until the sink was suspended. A plain alsa-lib program that recovers
> with snd_pcm_drop() and snd_pcm_prepare() hits the same loop, while
> snd_pcm_prepare() straight from XRUN recovers at once.


The patch looks outstanding! Thank you not only for the fix, but for the
thorough explanation and the reproduction technique too.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

> Fixes: cfca1637bc2b ("ASoC: Intel: avs: Unprepare a stream when XRUN occurs")

While I prefer to leave Fixes: tag here so it may get populated
downstream, this is in fact a complementing fix, not a fix for a fix.

IIRC recovery on alsa-lib side is handled with either:
1) snd_pcm_prepare(state=XRUN)
2) snd_pcm_drop/drain() -> snd_pcm_prepare(state=SETUP)

Without the commit mentioned here, 1) and 2) are both unaccounted for.
With the commit, 1) gets accounted for. By adding the change of yours to
the mix, 1) and 2) should be accounted for.

I'll prepare an equivalent change for the HDAudio BackEnd side as well
as re-check whether ->prepared and ->link_prepared flags are actually
needed once the fixes are applied.

> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Sergey Tiraspolsky <stiraspo@gmail.com>

Kind regards,
Czarek
