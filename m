Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ADC4F55C7;
	Mon, 21 Sep 2026 18:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015310; cv=fail; b=V78o099ruS5vGRgTRFqY++jnebPLNZByLZWgwXNHR6Qj/nP4U1VCD6bvsdlkxIPkMrpkFtvuIK0D05zx4b9gwew4A5ZOg+6xU/vB2CQvwUVxHYPOlvirxwzbRpq9dU7lJPyTwVahHesbxxqJWDSCY9oyg1faKjlmp7+CEhNFbrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015310; c=relaxed/simple;
	bh=1MugojLe+9OVbOeNMfo18LtAn/j4+/8+Zk2Hx5O2XJA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NEXovYZMJUSEPXhJrOPyUf66SdlQOYOrqtsyOIJAaaqRFYJWdGQoQUFD3t5Tw4UOOa4obtmhq5J/6ootOb0G4OIstibsuZr/42hnEjRUittgiCZfG+qdCboHrJPJNjJIatlrvqLJtKFGilyxN/RHWAa9PShJQCCncQtD7JnrU1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCcXvG5P; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCcXvG5P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790015308; x=1821551308;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1MugojLe+9OVbOeNMfo18LtAn/j4+/8+Zk2Hx5O2XJA=;
  b=CCcXvG5PJ1bz87t7jbPomayeV8lpA/i+EqtK0mQu9e2lly16KDE6YmM2
   QS7HJhD2PMKnnHCHTHShL+8k/+Tf7Eg8SwFofOPGj8vdIJFhV+fD17+d3
   bjKzdDMqEXMD4tC1D5TieuhwGl6OwSkb3OprsYrcG6Vb3WoZFytag8yNf
   rtauLVXoiQ8Kds/bZ9DPc6R6td8qxWhwKDboRA8JoOevtJ1Ed0p2dxRjN
   ysoPGWdylNYaB7rdm2abWxQyV93Apmu2j5gKLLkjTcWbEJd3nptjQ2AxI
   HPLp4xlc30ahAaRu+3XGu32I0Y0CFbQ+CxQ5YKlKmwzQSYfwTMvir+QqG
   A==;
X-CSE-ConnectionGUID: aVjyUX8VTOaVA23BLq/eMA==
X-CSE-MsgGUID: 6OVi+Bm0RN+lKVEghnQKWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89483799"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="89483799"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 11:28:28 -0700
X-CSE-ConnectionGUID: ZU6YgBXYRQu7g0vvqelFLQ==
X-CSE-MsgGUID: lQNuSUlyR6Cdl+jOvzR28Q==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 11:28:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 11:28:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 11:28:26 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 11:28:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WB3XtvhRTvzcoykZF3gtvSr3Y3gDW9XqYmb/39HaRsa/z2zTvfZOzbrJeTRiwmrQRX1azj8qygTiQ4d+P3+STdFhdvkMEQ/DL/kinoN9Ch3oeVfUo7RzWvfeMG5Cq5+44gAXDISpEX2XxzWLMT8NVNphfecBjrvVV9evOCijMaa4FfGRf9FLA6jrarpNl249RXgsKenIJbdWxVyaRHWA/6ytaz+ky/3dSXBgXPOOgK345/Kr5DG9iSIlhP4L8KP7vWP/UAczIBmCoIfEF87WjqSy/1bvPrG/N95jnRocyiZZsf/gtDl7bOo39Ms+IGnzB2D5TYlXrS7k2KV/3edKNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfZXWDieHABlLbediaH8uiMqH7tL3/59aoKAXnAsTBM=;
 b=IwEHbJ2n/ESLOeedyshMDKkfcHVhnJanNvDIEAq0A56VKb27qSVi5qKU8kWidfeeAHLzb/km/qWmYCXE2eM3Kh3EzQCmn4iCxERFVLQIGCfdwIHvAC1+6YzUB7uq1EqH/XFxxzEDak71QnP5vKx1N2QwW2+SoG9jsQUKQlrsNUu4HCTLSDkEgT/hBFI/3i+rYrMwAcnQtk53RYIVaGvzalCjb1hWwlcqWY1tIsOTsDJcTUrT8TDpLZu5yzPa6VySXvfOfia0nS0yPYzEqWVcxut0YlQ5cDMKiKocn800tmcdyFW4IHo4sTCpzjvBMCXpzGh2KPJfKnG9lUBP9aniWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by DM3PPF341F90799.namprd11.prod.outlook.com (2603:10b6:f:fc00::f19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 18:28:22 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 18:28:22 +0000
Message-ID: <e0825225-9616-4c3e-82de-346da017d600@intel.com>
Date: Mon, 21 Sep 2026 20:28:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/21] ASoC: rt5640: Move mclk acquisition to the i2c
 probe
To: Chancel Liu <chancel.liu@oss.nxp.com>
CC: Support Opensource <support.opensource@diasemi.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, "Oder
 Chiou" <oder_chiou@realtek.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
 <20260921104640.1941554-10-chancel.liu@oss.nxp.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260921104640.1941554-10-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0102.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::43) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|DM3PPF341F90799:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b33694e-841a-4e06-689e-08df180e1e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|11063799006|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: iStGTxQMR3uPfn+FMPbsgqaJn2l5IEEd47XvgfXJo1QdtUDiF/aZFFRdJXxqU26IfqNKJLRKfroC6bKb1GZrtzs5hd7ratYt09ooBn/Pwb75lze4prN3FEHxt7Em1ZbbH5DOGlCCnOAcU9/DjW9bhDNzwr1pBNf3fE9zrPJGl9ioyNW0pQ0GW3e9UUPU/MQrF0aBqVbieXYgUOfQiNblQFrVKKrpBzHEL9EGZAhQEIz3pZCVsyuHDVbs4iLJmxKwTpVtMrPPU26ZiXyeRQk+k7KlG6JvqPgqYha4lH9At74GHeYyg16QnG4i4cu5LVPKqZKyBFbwcYSACJdrWFykqKYLvWZcWmaSqLImpGeIVTnhxRugvG+zahC6531mfGSxgHp9cPT88BJA1D3gNoMUc6P/UOWPRoS27+xlHgXFNh48ZaljUwKqlzh6Hg7tn8VXo/fLjFvevia/N7YyRDpwcJqq4Dogcpzy7dkhu6IMGbR9ExHUYSb00Nz0nXjTpK/npagcvjt7uoZKrxbFU+oqxelSID4iRFq2p1pvIiDhNrFGtmNIjfFHWRZVFMZsrpjwEBQatVNiFDeCrmARVG545ZaZcsJmRNf4wn++mMfA+fjL7F07fLfl9hUqEIwVsxnJhZgKzJ5Zp+GbukXDGTWkBTJtKu7Ob9Xo8oNTcC6UCEg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(11063799006)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzlGaWZobmNKNlE0M3VqNmlmb3BicjRrclZROWZzYjdvbm9NQS9wWW1zbTNO?=
 =?utf-8?B?STVXK2V5TE5PQ3BCM1M2Y0ZzYTU5SlRLM2RqTTE5MnlwSmpFbVVaVnZQN3Q2?=
 =?utf-8?B?L05ONVNqOExTZm9HY0VTdzNOQ0svWitYVTlVczBpSTN6V0NQckdBckxGSnhC?=
 =?utf-8?B?QW5BeWtvLzNiQTFEWC9aZUt1Yi8vRHJKaVE3ZXdGQXJOM0RrekZFejhVOVRE?=
 =?utf-8?B?UzVMOUUvUzhFcTBsTjRqNVFyditMVFdNU2V5OWwzUmt5RDFmQUtidlVSeno5?=
 =?utf-8?B?a1RFTTFVMHhrdzhPaVNmRkttYnF2bHFPNHQxajZBS1VNT3l0eTllMk93Mis5?=
 =?utf-8?B?MHp6eWxRaFBWR0VQMkd0ZkNEZHBvamFkVWpOY1Z4REdJRFdPTThmbitlRVVj?=
 =?utf-8?B?ZllpQ2hMcnEzdXlGQkhlSFFORlJUdUkrOXdIZ2lqZFlxejdMQi9MR0FKSTBM?=
 =?utf-8?B?U0dVNVg2UFBnK3R1dUdWa21RcWxKVWYzREM2ZUQ5Y3l3b1ZuRjF5VGVxcVpk?=
 =?utf-8?B?aTZLZ1grM2dUVTdIb2tDclQ5UksvUzFUdmsxM3B2U2NTWFpaS0t0ZGZtTVFZ?=
 =?utf-8?B?NDdwYklKY1ZKTlJCWVAxM1lqVEJxUUhicHFHVyswM2Raa2V5TWV6QU5XTXZX?=
 =?utf-8?B?TzVHK3F2b2N4OWFoS3VBV0V5UW56cm4vVHluOEhDcW5ETC9LT0czeEcvL29l?=
 =?utf-8?B?RngyT3ZWZ1QzRmZtTTdWNW1wSzY4aEpiMHNaM2kyYlZ1RU5OMXJvNzJpdEZS?=
 =?utf-8?B?TkNUYTJzMTVpRWcvbUd5VkUyV1RJN1pvRmVCUHVTb3BoVGM2azJwcm5oMzNC?=
 =?utf-8?B?REhnN2VEeTFmWVdiMnZRRHN2R05RWkpqQ2FqaWh5RUhBT2pZUS9id0p4OTBV?=
 =?utf-8?B?bS9VN2FzOXMxMzE2N3ZzNjZTODBsQ21VTmtrNlh5d0oxVCtxWlNOK1B1cmFU?=
 =?utf-8?B?R3NPYjQwV1dWU05PaWFmQWtKcWpNenRHdmYzSFU1WkVCRkRtbVlLc1N2WGMw?=
 =?utf-8?B?emdjUFc2cDZ2aCtDS2xpYmQvN2lDK2tsbSsxNGJySEdWYlRhU0hPVUlscmYx?=
 =?utf-8?B?c3FBdiszOWczRHg4RXZUVTlBbi9yeFgrYlovNndnclo0V3AwT3ZlV3dKNUZP?=
 =?utf-8?B?RGU0K2VKeGVBZjJZb1FUUks4ekxJRjJWNkZpMTArdmEvQTZOdHc0K2phRUdP?=
 =?utf-8?B?bjlEWjhueUdDQ25XWjlUZ0tMVXRZbEhOWDRxOUhSZ0hYNEdSWFptRlhXYlZa?=
 =?utf-8?B?cHlFbFdwenpodTVBOGN1U2NhbTJUN1NaZTlqNXBUWmxuZmFucDdmajdwLzRL?=
 =?utf-8?B?MUpyL0t5RmQ2MytNOVJsME1idXhEb1NDcWdBU0dkYVhpQWlVVUVJeHh4MXdQ?=
 =?utf-8?B?NnRpTTQxV1VSeWZvalZSRjZLays5OWhxeW9XZ0lJM21VdjhDay8rVjR4T3Bj?=
 =?utf-8?B?eTBXRnExMzVXYTFybEtGM0VFWE9oOEtsc0MrblM4eWViVG1yZ1c1emtUY1BK?=
 =?utf-8?B?MlI2SkJiT092VU5ndVlTR084ckZXTEN4UlJ2UTlJdWxpVmpTMC9YMm1oTS96?=
 =?utf-8?B?UEIzNEU1YklTZWd3bUJYZDFyckQ0Ylh0MnZHM3dqc08vc3FLeXRLeHFxVlgw?=
 =?utf-8?B?Mk5KQjREK2l0N3VjUEE3RzVCNyt5NEh4KzR4Mm5sQ09iRktLU0ROaWIrVDdq?=
 =?utf-8?B?NENESUJ2dTZobksxa3U1eGozZ1djOHNnRENjc3RMdCtFS1EwUHlYSFhhWnVT?=
 =?utf-8?B?OVM0a0RpbWpGa3BaTnlqSHZvbTFpR2JTN1ZLVjA5cm1vWXJNNEk1QmpxWmJr?=
 =?utf-8?B?anovMDhoVWFFZUFYZDMySW1LSVAzRDk2NlovQWM5Q2FNZFJYc1kxaTNsVzVk?=
 =?utf-8?B?RkNtWlM1VWV4bGpIdUFheENjbm5vNTNLYTA1dUpScmtWalRpNzBnMUZBZUNo?=
 =?utf-8?B?b1VSNjIvYVQvYnY3OXNWUzhNUmZkS2tRUWxxZDBxUW0wdThVZGhDOTFPOHll?=
 =?utf-8?B?enZEaTRSTm0vcUVxZVlVQTdHUk8xcGcxeWVBSHVyaDQxUEx5VnpGZzJzOUNQ?=
 =?utf-8?B?cDFvR01yRVRvVFFKVUNYeGFRVit5Z1lJUWlMOFBFTzhhK0JjQWZjaDBpWE1p?=
 =?utf-8?B?MTFSVncxSjVhRUVaaEV3aU5aRlkzTDFLYmMxY2tOdVFPTWJuKzhES0RBZlN4?=
 =?utf-8?B?SXI0aS9icCtXMU1kRW9PYStvQWpMc2d5ekUvaFBVUW5nZmZNNkpUVXFnWnMr?=
 =?utf-8?B?eTNUWEo0QnpBMkR2QU1kOXhWUTEwV0RHdG5LY0g4OVNGSE5ZQnNyc2VNUCtL?=
 =?utf-8?B?Y25rNlZ0MU91czY1MmNQbUZJMFE2dkZvRlBkKzlmSjR1dnBxeGpkTnE3dnUr?=
 =?utf-8?Q?4LRfJ5Y/HM6uIds4=3D?=
X-Exchange-RoutingPolicyChecked: ehfArKp2KsQF2FCHblbDZnl1pUJW92oyH8UIrqf1VunLCISQIATEcZ7ymaJPts3m1wGN69UkHlrzS2fBRIUf31Ie5HDoyfih8R4MxVO04mvJQzicKcDga99ZDZMgZRpi17YuzZ+54YpkhsvMWRUCXR5EDU0vrouxKS4qZmK3/Aj11t51h4rCPj79WNxmVwNCw7Md63cGLhrlz9WyHvyh81g5VnM5hB6L1uVtDMQ3kj+y8Ar13AzbGRHm/l7PGLKL8MoiLr/QA62eVnk8GJk7WuGxbbWAz1EJw3V3/UvFWs6+bWZYQQp/HyCuCt97YxvE9siwv26/7oh+bCkJK4kqNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b33694e-841a-4e06-689e-08df180e1e4e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 18:28:22.7898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QrdXAHV3rNoFLtDLVFVMCvSOvMeEEsao+HWDo6OBWFlHRYmDHgsUwUfJxl011g8lC3dnfHMR/Zp4MoPMeFjTnVlPHNP+CV8mJT8RanaV/io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF341F90799
X-OriginatorOrg: intel.com

On 9/21/2026 12:46 PM, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> component->dev is the underlying i2c device whose devres is only
> released on physical device removal, not on ASoC card unbind. Getting
> the codec clock with devm_clk_get_optional(component->dev, ...) in the
> component probe therefore leaks a clk reference on every card
> bind/unbind cycle.
> 
> Move the devm_clk_get_optional() to rt5640_i2c_probe() so the clk
> reference is tied to the physical device lifetime.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  sound/soc/codecs/rt5640.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
> index 03d0ac3359f5..1a45346cf6b9 100644
> --- a/sound/soc/codecs/rt5640.c
> +++ b/sound/soc/codecs/rt5640.c
> @@ -2667,11 +2667,6 @@ static int rt5640_probe(struct snd_soc_component *component)
>  	bool dmic_en = false;
>  	u32 val;
>  
> -	/* Check if MCLK provided */
> -	rt5640->mclk = devm_clk_get_optional(component->dev, "mclk");
> -	if (IS_ERR(rt5640->mclk))
> -		return PTR_ERR(rt5640->mclk);
> -
>  	rt5640->component = component;
>  
>  	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
> @@ -3053,6 +3048,11 @@ static int rt5640_i2c_probe(struct i2c_client *i2c)
>  	regmap_update_bits(rt5640->regmap, RT5640_GCTL1,
>  				RT5640_MCLK_DET, RT5640_MCLK_DET);
>  
> +	/* Check if MCLK provided */
> +	rt5640->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
> +	if (IS_ERR(rt5640->mclk))
> +		return PTR_ERR(rt5640->mclk);
> +
>  	rt5640->hp_mute = true;
>  	rt5640->irq = i2c->irq;
>  	INIT_DELAYED_WORK(&rt5640->bp_work, rt5640_button_press_work);


nitpick: update the title tags so it starts with:
	ASoC: codecs: rt5640:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
